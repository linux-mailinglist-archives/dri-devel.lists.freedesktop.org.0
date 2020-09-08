Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6E3260DF7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 10:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689266E5BF;
	Tue,  8 Sep 2020 08:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B92C6E5BF
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 08:48:59 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j2so18197241wrx.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 01:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=vTwZpb2SRbHS6TVjDRxWxiFRdUx1UorL5y3KysCor9o=;
 b=hvxn9skrMRRr0q95ExVeGBXDKL50YXqPxTkDw/op5wnsECwbMgTPjRembThpSe3EYK
 HAdhN+caBKBO/UMSUpqVSK6hrPlnx0e9fN4VMOPkmrB5/nj3AI8Gdf5cdpkPoAgCJhGX
 wLDN/wIwneGsAHwiuvEdIk/6G5aE0Y4MBD780=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=vTwZpb2SRbHS6TVjDRxWxiFRdUx1UorL5y3KysCor9o=;
 b=avbjOM9yYb1jTZdLxkRFqOSENqXOFyhZQhsIeGMFb+lAXYj2ZF2/vSdATc2kcdcFY1
 oGfarpT8n6mjxOXsVwLAYBst53cOfycaprMynZafM+gLvUlObWZXCkneYBk2kYzdKSy+
 2dxRpNv85oIt/7uZyXfScMPcOky98jFS3EcmgkIWig8QV8xkBBsTEvUwbAPxM4pqM16d
 ROXutuvRryvnczcaQurk76maIOh/LwBTz9bIrn/AiVeKGq+nlQbVLr8HBo9DHjbfH7d4
 lXsozSsBXGFRbzXazuxOpu5Yxj30tTz6GOKxtZupB7BUTEumLjSHVWu4k/RRBjQ5Rvj3
 GlOw==
X-Gm-Message-State: AOAM532VEcsjLZS5HEf/2sjGxF/EJSoVubhQcZ0Aic135R/8BAM92QEe
 SEDE/NfanQyWI+hrgb77AqoBJw==
X-Google-Smtp-Source: ABdhPJyChK39vZ43On41Fya27UnXYFaJZY862924QCXz3b7+wz4vQQztCQcIMrRa95whcLZtQ6e+NQ==
X-Received: by 2002:adf:9125:: with SMTP id j34mr28207058wrj.157.1599554937849; 
 Tue, 08 Sep 2020 01:48:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r14sm33235979wrn.56.2020.09.08.01.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 01:48:57 -0700 (PDT)
Date: Tue, 8 Sep 2020 10:48:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm: mxsfb: check framebuffer pitch
Message-ID: <20200908084855.GH2352366@phenom.ffwll.local>
Mail-Followup-To: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Stefan Agner <stefan@agner.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, jsarha@ti.com,
 marex@denx.de, airlied@linux.ie, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200907160343.124405-1-stefan@agner.ch>
 <20200907161712.GF6047@pendragon.ideasonboard.com>
 <20200907181855.GE2352366@phenom.ffwll.local>
 <86615b4b1551d4a6f1cfcc13b38e616c@agner.ch>
 <dc5a16d0-4d2a-366a-7716-29dd8db1a12a@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc5a16d0-4d2a-366a-7716-29dd8db1a12a@ti.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: marex@denx.de, kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 jsarha@ti.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 08, 2020 at 11:18:25AM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 08/09/2020 10:55, Stefan Agner wrote:
> > On 2020-09-07 20:18, Daniel Vetter wrote:
> >> On Mon, Sep 07, 2020 at 07:17:12PM +0300, Laurent Pinchart wrote:
> >>> Hi Stefan,
> >>>
> >>> Thank you for the patch.
> >>>
> >>> On Mon, Sep 07, 2020 at 06:03:43PM +0200, Stefan Agner wrote:
> >>>> The lcdif IP does not support a framebuffer pitch (stride) other than
> >>>> the CRTC width. Check for equality and reject the state otherwise.
> >>>>
> >>>> This prevents a distorted picture when using 640x800 and running the
> >>>> Mesa graphics stack. Mesa tires to use a cache aligned stride, which
> >>>
> >>> s/tires/tries/
> >>>
> >>>> leads at that particular resolution to width != stride. Currently
> >>>> Mesa has no fallback behavior, but rejecting this configuration allows
> >>>> userspace to handle the issue correctly.
> >>>
> >>> I'm increasingly impressed by how featureful this IP core is :-)
> >>>
> >>>> Signed-off-by: Stefan Agner <stefan@agner.ch>
> >>>> ---
> >>>>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 22 ++++++++++++++++++----
> >>>>  1 file changed, 18 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> >>>> index b721b8b262ce..79aa14027f91 100644
> >>>> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> >>>> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> >>>> @@ -403,14 +403,28 @@ static int mxsfb_plane_atomic_check(struct drm_plane *plane,
> >>>>  {
> >>>>  	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
> >>>>  	struct drm_crtc_state *crtc_state;
> >>>> +	unsigned int pitch;
> >>>> +	int ret;
> >>>>
> >>>>  	crtc_state = drm_atomic_get_new_crtc_state(plane_state->state,
> >>>>  						   &mxsfb->crtc);
> >>>>
> >>>> -	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> >>>> -						   DRM_PLANE_HELPER_NO_SCALING,
> >>>> -						   DRM_PLANE_HELPER_NO_SCALING,
> >>>> -						   false, true);
> >>>> +	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> >>>> +						  DRM_PLANE_HELPER_NO_SCALING,
> >>>> +						  DRM_PLANE_HELPER_NO_SCALING,
> >>>> +						  false, true);
> >>>> +	if (ret || !plane_state->visible)
> >>>
> >>> Would it be more explict to check for !plane_state->fb ? Otherwise I'll
> >>> have to verify that !fb always implies !visible :-)
> >>>
> >>>> +		return ret;
> >>>> +
> >>>> +	pitch = crtc_state->mode.hdisplay *
> >>>> +		plane_state->fb->format->cpp[0];
> >>>
> >>> This holds on a single line.
> >>>
> >>>> +	if (plane_state->fb->pitches[0] != pitch) {
> >>>> +		dev_err(plane->dev->dev,
> >>>> +			"Invalid pitch: fb and crtc widths must be the same");
> >>>
> >>> I'd turn this into a dev_dbg(), printing error messages to the kernel
> >>> log in response to user-triggered conditions is a bit too verbose and
> >>> could flood the log.
> >>>
> >>> Wouldn't it be best to catch this issue when creating the framebuffer ?
> >>
> >> Yeah this should be verified at addfb time. We try to validate as early as
> >> possible.
> >> -Daniel
> >>
> > 
> > Sounds sensible. From what I can tell fb_create is the proper callback
> > to implement this at addfb time. Will give this a try.
> > 
> > FWIW, I got the idea from drivers/gpu/drm/tilcdc/tilcdc_plane.c. Maybe
> > should be moved to addfb there too?
> 
> But you don't know the crtc width when creating the framebuffer.

Hm right this is a different check. What we could check in fb_create for
both is that the logical fb size matches exactly the pitch. That's not
sufficient criteria, but it will at least catch some of them already.

But yeah we'd need both here.
-Daniel

> 
>  Tomi
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
