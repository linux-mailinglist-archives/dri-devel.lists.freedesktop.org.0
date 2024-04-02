Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796E0895631
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 16:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F2910F4C5;
	Tue,  2 Apr 2024 14:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="4u6LGHPH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052F910F4C5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 14:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712066878;
 bh=clvatVC4/TlVSmnM1RIPgUBKPNx7gzX2rZ5g34TmzXk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=4u6LGHPHU6MuDos54RyHxoodwwv0p5/4IkyYjqVPA00EQ1vdqW4vzNthFn4phZaQk
 ofo6nkYLymnPIvCTmh6ZJtfiL5BZwXWFMtJyhJpoohXHQ1SiklyE1dW/PBD296wqOX
 8QeUS7gNA3h82uh4hs9Ys4QGX5A6T0Ym6WcKjBdv0rlqLlD+zZ4MGE+0uyVWil5jsh
 POz7Poax5+uiX1Y8G3HRSrDdaTd6E9bgCLVFp/fdG8CM4LD++wOpPZH7PvBv+QgaBB
 HrJ3t8x1Kidz5hsryL27aTsoGFSRkQ35jj81GaTjubDFjxM2kfK2V4gcuTJFrKEtzJ
 LLi2XasYImLlg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id B60F43780624;
 Tue,  2 Apr 2024 14:07:57 +0000 (UTC)
Date: Tue, 2 Apr 2024 16:07:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Heiko Stuebner
 <heiko@sntech.de>, Grant Likely <grant.likely@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com
Subject: Re: [PATCH v2] drm/panthor: Fix couple of NULL vs IS_ERR() bugs
Message-ID: <20240402160756.1f767805@collabora.com>
In-Reply-To: <b35d0de5-be46-42a1-b7e7-b24a72d945c7@oracle.com>
References: <20240402134709.1706323-1-harshit.m.mogalapalli@oracle.com>
 <20240402160226.4a1ac2d1@collabora.com>
 <b35d0de5-be46-42a1-b7e7-b24a72d945c7@oracle.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 2 Apr 2024 19:35:41 +0530
Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com> wrote:

> Hi Boris,
> On 02/04/24 19:32, Boris Brezillon wrote:
> > On Tue,  2 Apr 2024 06:47:08 -0700
> > Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com> wrote:
> >   
> >> 1. The devm_drm_dev_alloc() function returns error pointers.
> >>     Update the error handling to check for error pointers instead of NULL.
> >> 2. Currently panthor_vm_get_heap_pool() returns both ERR_PTR() and
> >>     NULL(when create is false and if there is no poool attached to the
> >>     VM)
> >> 	- Change the function to return error pointers, when pool is
> >> 	  NULL return -ENOENT
> >> 	- Also handle the callers to check for IS_ERR() on failure.
> >>
> >> Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
> >> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> >> ---
> >> This is spotted by smatch and the patch is only compile tested
> >>
> >> v1->v2: Fix the function panthor_vm_get_heap_pool() to only return error
> >> pointers and handle the caller sites [Suggested by Boris Brezillon]
> >> 	- Also merge these IS_ERR() vs NULL bugs into same patch
> >> ---
> >>   drivers/gpu/drm/panthor/panthor_drv.c   | 6 +++---
> >>   drivers/gpu/drm/panthor/panthor_mmu.c   | 2 ++
> >>   drivers/gpu/drm/panthor/panthor_sched.c | 2 +-
> >>   3 files changed, 6 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> >> index 11b3ccd58f85..c8374cd4a30d 100644
> >> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> >> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> >> @@ -1090,8 +1090,8 @@ static int panthor_ioctl_tiler_heap_destroy(struct drm_device *ddev, void *data,
> >>   		return -EINVAL;
> >>   
> >>   	pool = panthor_vm_get_heap_pool(vm, false);
> >> -	if (!pool) {
> >> -		ret = -EINVAL;
> >> +	if (IS_ERR(pool)) {
> >> +		ret = PTR_ERR(pool);
> >>   		goto out_put_vm;
> >>   	}
> >>   
> >> @@ -1385,7 +1385,7 @@ static int panthor_probe(struct platform_device *pdev)
> >>   
> >>   	ptdev = devm_drm_dev_alloc(&pdev->dev, &panthor_drm_driver,
> >>   				   struct panthor_device, base);
> >> -	if (!ptdev)
> >> +	if (IS_ERR(ptdev))
> >>   		return -ENOMEM;
> >>     
> > 
> > Sorry, that one deserves a separate patch.
> >   
> 
> Ah okay, I was confused about the same.
> So I will send a V3 removing that part and could you please use the 
> independent patch that I sent before ?
> 
> https://lore.kernel.org/all/20240402104041.1689951-1-harshit.m.mogalapalli@oracle.com/

Yes, I already added my R-b on that one.
