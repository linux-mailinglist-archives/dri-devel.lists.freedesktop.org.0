Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A913BA9E532
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 01:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A076410E15A;
	Sun, 27 Apr 2025 23:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gVjBze3i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (unknown [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2A710E132;
 Sun, 27 Apr 2025 23:59:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3109D44D6B;
 Sun, 27 Apr 2025 23:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2464C4CEE3;
 Sun, 27 Apr 2025 23:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745798363;
 bh=nKi5Y2SiC5tgA1MVYV4fNEhrtxgNgfPSqVe2MnMmmSo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gVjBze3irjBqAqcHoP+FTN6a5j06A3tosXjkGZSyBiN6CN2m/ZfJ98yZZXimUQKFg
 l7/f6EtFP9t2EZyVJx3o86fnmvkkSdZ1fESaG7ALfukpnS6lt9W6HLNYLbWwrvc9Xn
 uDGhybUUVbVS7k+FtnJU2rh0Qdd1XOtPz4Jx+Wj3xzR3KxhFfiFIt7+7LWbRodctSz
 m0joEaurwkqTJVel6bisQuLb+hif08oqDIeETVCtzOdjbIUv8rV2nGBapbmxmHM7Gu
 Qb5AM7wq3Y15K56jPrt3cQLxldRrteYILgeqGM1D3Ien8CGamssyZnRkFaHmapDFQC
 0juqFNYdmY6cg==
Date: Sun, 27 Apr 2025 19:59:21 -0400
From: Sasha Levin <sashal@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Felix Kuehling <felix.kuehling@amd.com>, Pak Nin Lui <pak.lui@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, simona@ffwll.ch,
 sumit.semwal@linaro.org, Yunxiang.Li@amd.com,
 tvrtko.ursulin@igalia.com, matthew.auld@intel.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [Linaro-mm-sig] [PATCH AUTOSEL 6.13 15/34] drm/amdgpu: allow
 pinning DMA-bufs into VRAM if all importers can do P2P
Message-ID: <aA7E2ZKr_5rOpmWM@lappy>
References: <20250414132729.679254-1-sashal@kernel.org>
 <20250414132729.679254-15-sashal@kernel.org>
 <CADnq5_OyrpJL3fnbyiueyddkNZ2B-uRO9pyrRVqBTeY5AnepYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_OyrpJL3fnbyiueyddkNZ2B-uRO9pyrRVqBTeY5AnepYw@mail.gmail.com>
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

On Mon, Apr 14, 2025 at 09:48:10AM -0400, Alex Deucher wrote:
>On Mon, Apr 14, 2025 at 9:28 AM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Christian König <christian.koenig@amd.com>
>>
>> [ Upstream commit f5e7fabd1f5c65b2e077efcdb118cfa67eae7311 ]
>>
>> Try pinning into VRAM to allow P2P with RDMA NICs without ODP
>> support if all attachments can do P2P. If any attachment can't do
>> P2P just pin into GTT instead.
>>
>> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Felix Kuehling <felix.kuehling@amd.com>
>> Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
>> Tested-by: Pak Nin Lui <pak.lui@amd.com>
>> Cc: Simona Vetter <simona.vetter@ffwll.ch>
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This should not go to stable.  It depends on dmem cgroups.

I'll drop it.

-- 
Thanks,
Sasha
