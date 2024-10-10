Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCC2998B75
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 17:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12EB10E95D;
	Thu, 10 Oct 2024 15:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mN+aBLcq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0123A10E95D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 15:26:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14806FF807;
 Thu, 10 Oct 2024 15:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728574010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JzE9jT9P4k/XrNuOOWoFuNHxaK3It9F/Ncn4nUJHRtA=;
 b=mN+aBLcqL0fC5B2Nh/GqSp9zUw3YoO09GtFyfxct1Ky77mVi1M+Jf0Q4JE3C9nSHju8iQJ
 yQiCJiwoYVvAbusHJNh93Kz9QIhhOsXMnOZBpI/Adoe7eTLXLhH7l8Ecbuo6Wths7iPsCc
 +p97nw7y+I3U7jXe5oWcYkPox0y7nIuaUWJ95aouJ5SwTIrvjUDckluKRyHmSruPnq/F7o
 kQrKswXvWxAmc4a54zLQORhIKT+p9VQCyRk+TD/00+FVuZ8GFCBYFqY3Ai4tNPzrm3vIdY
 R/VaX75Fn8FFJIRc0ivySGkGaR4PvTnK+gK0lhaj1dIw7FePzm8IOGikrPDmBQ==
Date: Thu, 10 Oct 2024 17:26:47 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, Stefan Agner <stefan@agner.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 stable@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/vblank: Require a driver register vblank support for
 0 or all CRTCs
Message-ID: <ZwfyN3uwfODqcw4U@louis-chauvet-laptop>
Mail-Followup-To: Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, Stefan Agner <stefan@agner.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 stable@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
References: <20240927203946.695934-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240927203946.695934-2-lyude@redhat.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 27/09/24 - 16:39, Lyude Paul a écrit :
> Currently, there's nothing actually stopping a driver from only registering
> vblank support for some of it's CRTCs and not for others. As far as I can
> tell, this isn't really defined behavior on the C side of things - as the
> documentation explicitly mentions to not use drm_vblank_init() if you don't
> have vblank support - since DRM then steps in and adds its own vblank
> emulation implementation.
> 
> So, let's fix this edge case and check to make sure it's all or none.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 3ed4351a83ca ("drm: Extract drm_vblank.[hc]")
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v4.13+
> ---
>  drivers/gpu/drm/drm_vblank.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 94e45ed6869d0..4d00937e8ca2e 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -525,9 +525,19 @@ static void drm_vblank_init_release(struct drm_device *dev, void *ptr)
>   */
>  int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
>  {
> +	struct drm_crtc *crtc;
>  	int ret;
>  	unsigned int i;
>  
> +	// Confirm that the required vblank functions have been filled out for all CRTCS
> +	drm_for_each_crtc(crtc, dev) {
> +		if (!crtc->funcs->enable_vblank || !crtc->funcs->disable_vblank) {
> +			drm_err(dev, "CRTC vblank functions not initialized for %s, abort\n",
> +				crtc->name);
> +			return -EINVAL;
> +		}
> +	}
> +

Hi,

I noticed that the kernel bot reported an issue with VKMS and this patch.

I did not take the time to reproduce the issue, but it may come from the 
fact that VKMS call drm_vblank_init before calling 
drmm_crtc_init_with_planes [1]. I don't see anything in the documentation 
that requires the CRTC to be initialized before the vblank, is it a change 
of the API or an issue in VKMS since 2018 [2]?

Anyway, if this is a requirement, can you explain it in the 
drm_vblank_init documentation?

Thanks,
Louis Chauvet

[1]:https://elixir.bootlin.com/linux/v6.11.2/source/drivers/gpu/drm/vkms/vkms_drv.c#L209
[2]:https://lore.kernel.org/all/5d9ca7b3884c1995bd4a983b1d2ff1b840eb7f1a.1531402095.git.rodrigosiqueiramelo@gmail.com/

>  	spin_lock_init(&dev->vbl_lock);
>  	spin_lock_init(&dev->vblank_time_lock);
>  
> 
> base-commit: 22512c3ee0f47faab5def71c4453638923c62522
> -- 
> 2.46.1
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
