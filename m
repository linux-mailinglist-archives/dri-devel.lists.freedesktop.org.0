Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D49142686D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 13:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7523F6E0AF;
	Fri,  8 Oct 2021 11:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC656E0AF;
 Fri,  8 Oct 2021 11:02:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="289981206"
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="289981206"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 04:02:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="489419871"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 08 Oct 2021 04:02:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 08 Oct 2021 14:02:40 +0300
Date: Fri, 8 Oct 2021 14:02:40 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, Johannes Stezenbach <js@sig21.net>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH] Revert "drm/fb-helper: improve DRM fbdev emulation
 device names"
Message-ID: <YWAlUBoMlerOGJEV@intel.com>
References: <20211008071708.1954041-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211008071708.1954041-1-javierm@redhat.com>
X-Patchwork-Hint: comment
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

On Fri, Oct 08, 2021 at 09:17:08AM +0200, Javier Martinez Canillas wrote:
> This reverts commit b3484d2b03e4c940a9598aa841a52d69729c582a.
> 
> That change attempted to improve the DRM drivers fbdev emulation device
> names to avoid having confusing names like "simpledrmdrmfb" in /proc/fb.
> 
> But unfortunately there are user-space programs, such as pm-utils that
> query that information and so broke after the mentioned commit. Since
> the names in /proc/fb are used programs that consider it an ABI, let's
> restore the old names even when this lead to silly naming like the one
> mentioned above as an example.

The usage Johannes listed was this specificially:
 using_kms() { grep -q -E '(nouveau|drm)fb' /proc/fb; }                                                        

So it actually looks like  Daniel's
commit f243dd06180a ("drm/nouveau: Use drm_fb_helper_fill_info")
also broke the abi. But for the pm-utils use case at least
just having the "drmfb" in there should cover even nouveau.

Cc: stable@vger.kernel.org
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
> Reported-by: Johannes Stezenbach <js@sig21.net>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>  drivers/gpu/drm/drm_fb_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 3ab07832104..8993b02e783 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1737,7 +1737,7 @@ void drm_fb_helper_fill_info(struct fb_info *info,
>  			       sizes->fb_width, sizes->fb_height);
>  
>  	info->par = fb_helper;
> -	snprintf(info->fix.id, sizeof(info->fix.id), "%s",
> +	snprintf(info->fix.id, sizeof(info->fix.id), "%sdrmfb",
>  		 fb_helper->dev->driver->name);
>  
>  }
> -- 
> 2.31.1

-- 
Ville Syrjälä
Intel
