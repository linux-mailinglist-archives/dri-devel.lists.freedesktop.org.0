Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072B698F223
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 17:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E698410E87E;
	Thu,  3 Oct 2024 15:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YEH2YnPw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 8943 seconds by postgrey-1.36 at gabe;
 Thu, 03 Oct 2024 15:07:44 UTC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EFE10E874;
 Thu,  3 Oct 2024 15:07:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11E6024000C;
 Thu,  3 Oct 2024 15:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1727968061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YZElLwQ5mHYReOaSmSvT7278JqqhnnyULQk+/1+1kJk=;
 b=YEH2YnPwiMskls9hd/gfzbIgYfC1qkcLesGnJNkrsmHEe3zu8VFZWm6BdgmnrnZ2Qgf6Mu
 rl3svRb/4mCMycfcmpARRBvji7+Ry/w2vzIC3T393ERmy9UbpVYnNhM87rfFxR4CxUfMDQ
 ksrKmVA99rcw5b1jA2ZNxjOLpTc24XkDfONA9tFeR45nmPl6UkQuJxTG6VYt19wt2k0OWd
 ly5GPToqHmZiL+uWVlGQozyWeIO9rxeLv5puwAjVLmo/Jys8TaMxMe0xWkBxg30yo2dr0e
 +qHYoE0Ir3I/BslTW53FebEDYX6GCccBs1oOkCfEqWwDeCFPtxDgi2SkeFavmA==
Date: Thu, 3 Oct 2024 17:07:35 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Liviu Dudau <liviu.dudau@arm.com>, Russell King <linux@armlinux.org.uk>,
 Inki Dae <inki.dae@samsung.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Sandy Huang <hjc@rock-chips.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Zack Rusin <zack.rusin@broadcom.com>, amd-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] drm: Move crtc->{x, y, mode, enabled} to legacy
 sub-structure
Message-ID: <Zv6zN7Go_XG44P2-@louis-chauvet-laptop>
Mail-Followup-To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Liviu Dudau <liviu.dudau@arm.com>,
 Russell King <linux@armlinux.org.uk>,
 Inki Dae <inki.dae@samsung.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Sandy Huang <hjc@rock-chips.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Zack Rusin <zack.rusin@broadcom.com>, amd-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
 <20241002182200.15363-3-ville.syrjala@linux.intel.com>
 <Zv6QF2EmIcogtlLA@louis-chauvet-laptop>
 <Zv6gSGMXZZARf3oV@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zv6gSGMXZZARf3oV@intel.com>
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


> > > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > index a40295c18b48..780681ea77e4 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > @@ -64,7 +64,7 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
> > >  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> > >  	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> > >  
> > > -	drm_calc_timestamping_constants(crtc, &crtc->mode);
> > > +	drm_calc_timestamping_constants(crtc, &crtc->legacy.mode);
> > 
> > 	drm_calc_timestamping_constants(crtc, &crtc->state->mode);
> 
> This one doesn't look safe. You want to call that during your atomic
> commit already.
> 

This was already not safe with the previous implementation? Or it is only 
unsafe because now I use state->mode instead of legacy.mode?

After inspecting the code, I think I don't need to call it as:

In `vkms_atomic_commit_tail` (used in 
`@vkms_mode_config_helpers.atomic_commit_tail`), we call 
`drm_atomic_helper_commit_modeset_disables`, which call 
`drm_atomic_helper_calc_timestamping_constants` which call 
`drm_calc_timestamping_constants` for every CRTC.

I tested kms_vblank, all of them are SUCCESS/SKIP, do you know other tests 
that can trigger bugs?

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
