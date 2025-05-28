Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DFDAC6989
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 14:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB8210E5C7;
	Wed, 28 May 2025 12:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="nYKmG6hr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B7A10E273;
 Wed, 28 May 2025 12:39:24 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4b6pwL1xdKz9tMS;
 Wed, 28 May 2025 14:39:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1748435954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RGlF2J+LXP6mDAjw+NjT5XOIIldRczFgSNzdB+eCv10=;
 b=nYKmG6hre7dyxRWF/cr8UrkQxoeBGWBzUiJ0wiCmXoGWFWOHcWqYxeAF+feIeCOTGktG4b
 rOLM2K/qJMwBMt9GaQcehHErtPVX49+SRAQiZWbZMQMwYin+ZdbVZSyrcWcVBcH3a3E2J7
 VsemUzKFrx2fEv8Ib1y01OQ2w+6hgAZHsXb7lFy9X+lE9IUgzKzf4Huvj99hxpON0EArWH
 iQaA4pagPJFuXYBRvQkI9G0hN3rBqpsDGJlH0zI1iNj4Be8qSMWbgPitkN9XdVet9IInwx
 S0BcWuL1HSDXnvVzujUn925at631VLH7vpuD/7lTLZqX40x0nlPXABwko6BHSg==
Message-ID: <6cd32fcf-233d-454b-be3d-aabb870b8b4a@mailbox.org>
Date: Wed, 28 May 2025 14:39:11 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] drm/amdgpu: Dirty cleared blocks on allocation
To: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>,
 Natalie Vock <natalie.vock@gmx.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org
References: <20250527194353.8023-1-natalie.vock@gmx.de>
 <20250527194353.8023-3-natalie.vock@gmx.de>
 <89652580-5763-4f1e-abf5-d340119543f3@amd.com>
 <dbbdcada-32ae-4457-af87-1f98362461f1@gmx.de>
 <da44526e-f2b6-4486-8ede-24647869576f@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <da44526e-f2b6-4486-8ede-24647869576f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: i9i1rih46o4e89puh5pgwzy6nrsf7iwp
X-MBO-RS-ID: 1d7103a300313c1ac30
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

On 2025-05-28 14:14, Paneer Selvam, Arunpravin wrote:
> On 5/28/2025 2:59 PM, Natalie Vock wrote:
>> On 5/28/25 09:07, Christian König wrote:
>>>
>>> But the problem rather seems to be that we sometimes don't clear the buffers on release for some reason, but still set it as cleared.
>>
>> Yes precisely - "some reason" being the aforementioned clear flags. We do always call amdgpu_clear_buffer on release, but that function will perform the same checks as the clear on allocation does - that means, if a block is marked clear then it will skip emitting any actual clears.
> 
> On buffer release [https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c#L1318], we call amdgpu_fill_buffer() and not amdgpu_clear_buffer() (in amdgpu_bo_release_notify() function), so the buffers are expected to be cleared without fail.
> 
> When the user space doesn't set the AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE flag and having only AMDGPU_GEM_CREATE_VRAM_CLEARED, we don't call this amdgpu_fill_buffer() and amdgpu_vram_mgr_set_cleared(), and that's kind of makes sense.
> I think the problem here is, when we don't clear the buffer during BO release, but the flag remains as cleared and that's why these blocks are skipped during clear on allocation (in amdgpu_bo_create() function).
> 
> Therefore, if the release path clear is skipped for any reasons (for example, in case of AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE not set), we should set all buffer to dirty. Somehow, that is missed.
BTW, I asked this before, but didn't get an answer:

Now that VRAM is always cleared before handing it out to user space, does AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE really need to do anything anymore? How can user space access the contents of a destroyed BO?


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
