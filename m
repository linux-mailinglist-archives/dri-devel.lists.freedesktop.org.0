Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3F843B9E8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 20:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5EF6E471;
	Tue, 26 Oct 2021 18:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753BD6E471
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 18:46:12 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 04601153-368d-11ec-ac3c-0050568cd888;
 Tue, 26 Oct 2021 18:46:23 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 1697A194B70;
 Tue, 26 Oct 2021 20:46:06 +0200 (CEST)
Date: Tue, 26 Oct 2021 20:46:04 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, naresh.kamboju@linaro.org,
 dri-devel@lists.freedesktop.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: Link CMA framebuffer helpers into KMS helper library
Message-ID: <YXhM7H156xxAUV3n@ravnborg.org>
References: <20211026175700.27664-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211026175700.27664-1-tzimmermann@suse.de>
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

Hi Thomas,

On Tue, Oct 26, 2021 at 07:57:00PM +0200, Thomas Zimmermann wrote:
> Linking the CMA frambuffer helpers into a CMA helper library in
> commit 4b2b5e142ff4 ("drm: Move GEM memory managers into modules")
> results in linker errors:
> 
>   arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.o: \
> 	  in function `drm_fb_cma_get_gem_obj': \
> 	  drivers/gpu/drm/drm_fb_cma_helper.c:46: undefined reference \
> 	  to `drm_gem_fb_get_obj'
>   arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.c:46: \
> 	  undefined reference to `drm_gem_fb_get_obj'
>   arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.c:46: \
> 	  undefined reference to `drm_gem_fb_get_obj'
>   arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.o: in \
> 	  function `drm_fb_cma_sync_non_coherent': \
> 	  drivers/gpu/drm/drm_fb_cma_helper.c:133: undefined reference \
> 	  to `drm_atomic_helper_damage_iter_init'
>   arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.c:135: \
> 	  undefined reference to `drm_atomic_helper_damage_iter_next'
> 
> Link the CMA framebuffer helpers into the KMS helper library to
> fix the problem.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 4b2b5e142ff4 ("drm: Move GEM memory managers into modules")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org

Patch looks fine,
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
