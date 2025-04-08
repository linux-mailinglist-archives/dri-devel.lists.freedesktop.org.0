Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B02FFA7FA31
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 11:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56ED10E1F8;
	Tue,  8 Apr 2025 09:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="QSmeYnIx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 463 seconds by postgrey-1.36 at gabe;
 Tue, 08 Apr 2025 09:47:45 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986EB10E1F8;
 Tue,  8 Apr 2025 09:47:45 +0000 (UTC)
Received: from localhost (unknown [10.10.165.6])
 by mail.ispras.ru (Postfix) with ESMTPSA id C2AB64076198;
 Tue,  8 Apr 2025 09:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru C2AB64076198
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1744105196;
 bh=9Ov35EzHv3WpWg/xb8In8OfhQ22RLgTulCR2ZE4izEQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QSmeYnIxURQx8gw0NtmJ8hubnpEVgfIcxoJbqWh7UwBGPjzJnmisCwh7dF7hdD/BM
 y9Uo0hEXbtEUeoqkfvDUTw+xBR7K2afLIkseikjLZO3CtUvsPe+/KHPsvIHwL/MkD9
 8E+8krjUSNKPDor7QFgr6c78pozR0HzO0IVQ5yB0=
Date: Tue, 8 Apr 2025 12:39:56 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Denis Arefev <arefev@swemel.ru>, 
 Alex Deucher <alexander.deucher@amd.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, lvc-project@linuxtesting.org, 
 Chunming Zhou <david1.zhou@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Subject: Re: [lvc-project] [PATCH] drm/amdgpu: check a user-provided number
 of BOs in list
Message-ID: <bmdour3gw4tuwqgvvw764p4ot3nnltqm4e7n3edlbtpfazvp5c@cqe5dwgc66uy>
References: <20250408091755.10074-1-arefev@swemel.ru>
 <e6ccef21-3ca5-4b5a-b18a-3ba45859569c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6ccef21-3ca5-4b5a-b18a-3ba45859569c@amd.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 08. Apr 11:26, Christian König wrote:
> Am 08.04.25 um 11:17 schrieb Denis Arefev:
> > The user can set any value to the variable ‘bo_number’, via the ioctl
> > command DRM_IOCTL_AMDGPU_BO_LIST. This will affect the arithmetic
> > expression ‘in->bo_number * in->bo_info_size’, which is prone to
> > overflow. Add a valid value check.
> 
> As far as I can see that is already checked by kvmalloc_array().
> 
> So adding this additional check manually is completely superfluous.

Note that in->bo_number is of type 'u32' while kvmalloc_array() checks for
an overflow in 'size_t', usually 64-bit.

So it looks possible to pass some large 32-bit number, then multiply it by
(comparatively small) in->bo_info_size and still remain in 64-bit bounds.

And later that would likely result in a WARNING in

void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
{
...
	/* Don't even allow crazy sizes */
	if (unlikely(size > INT_MAX)) {
		WARN_ON_ONCE(!(flags & __GFP_NOWARN));
		return NULL;
	}

But the commit description lacks such details, I admit.
