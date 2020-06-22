Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD7E203A32
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 17:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951D16E0F8;
	Mon, 22 Jun 2020 15:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F6F6E81E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 15:01:15 +0000 (UTC)
IronPort-SDR: ZfaZK0PUxc9Jsu3iF8Sm/niQIwuMI51p2KwcK3HGFTSEGfhCooyxmGc0/5gCWFixyMVbP2PeWo
 /xs+MSNSdI9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="228436000"
X-IronPort-AV: E=Sophos;i="5.75,267,1589266800"; d="scan'208";a="228436000"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 08:01:15 -0700
IronPort-SDR: KtXHTLa+BnXEMc/Zio8l0dx/vDBci7MX/CMbC9/7v4HN30nz0kaGmbAodT1uQZW7zCVv6yABlD
 7hlHpSxUWNZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,267,1589266800"; d="scan'208";a="310952208"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.3])
 by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2020 08:01:12 -0700
Date: Mon, 22 Jun 2020 23:00:50 +0800
From: Rong Chen <rong.a.chen@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/mgag200: Enable caching for SHMEM pages
Message-ID: <20200622150050.GV5535@shao2-debian>
References: <20200618133435.25425-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618133435.25425-1-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: John Donnelly <john.p.donnelly@Oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, airlied@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

I tested the patch based on commit 24b806b0a1dd3, the regression
of phoronix-test-suite.glmark2.1024x768.score still exists:

1f58fcaf27cb7 drm/mgag200: Enable caching for SHMEM pages                                            2 2 2
24b806b0a1dd3 drm-tip: 2020y-06m-22d-07h-52m-06s UTC integration manifest                            2 2 2 2 2
913ec479bb5cc drm/mgag200: Replace VRAM helpers with SHMEM helpers                                   2 2 2 2 2
88fabb75ea9ed drm/mgag200: Convert to simple KMS helper                                              165 168 167 165 164

Best Regards,
Rong Chen

On Thu, Jun 18, 2020 at 03:34:35PM +0200, Thomas Zimmermann wrote:
> We've had reports about performance regressions after switching
> mgag200 from VRAM helpers to SHMEM helpers. SHMEM pages use
> writecombine caching by default, but can also use the platform's
> default page caching. Doing so improves the performance of I/O
> on the framebuffer.
> 
> Mgag200's hardware does not access framebuffer pages directly (i.e.,
> via DMA), so enabling caching does not have an effect on consistency
> of the framebuffer memory or the displayed data.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 913ec479bb5c ("drm/mgag200: Replace VRAM helpers with SHMEM helpers")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Emil Velikov <emil.velikov@collabora.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rong Chen <rong.a.chen@intel.com>
> Cc: John Donnelly <john.p.donnelly@Oracle.com>
> Link: https://lore.kernel.org/dri-devel/20200617092252.GA5279@shao2-debian/
> ---
>  drivers/gpu/drm/mgag200/mgag200_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index e19660f4a637..7189c7745baf 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -36,6 +36,7 @@ static struct drm_driver mgag200_driver = {
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> +	.gem_create_object = drm_gem_shmem_create_object_cached,
>  	DRM_GEM_SHMEM_DRIVER_OPS,
>  };
>  
> -- 
> 2.27.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
