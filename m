Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C524260467
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 20:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B96C6E520;
	Mon,  7 Sep 2020 18:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EA16E520
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 18:18:59 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w2so15123436wmi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 11:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=nmGHPNrS/6S0SVPN+UDSLWRiyfZpZ44FO0zwUXQGhPk=;
 b=hZpY+ABAxUzZiiEnMcGY2zsoByRD7Qyn3GVNt7pMeFqg40sUBrUExQ3IX3NAtZYDed
 vpuuoHVdh32ifvExwzoruB17FLiBxcLLWvh6JivS+6V7GpKxu17XBwxDmiAFVWBo3oke
 VeYhIhUZA5q3aMC5BRIP+qKUUioViLMCnNc3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=nmGHPNrS/6S0SVPN+UDSLWRiyfZpZ44FO0zwUXQGhPk=;
 b=qTrUetCI2VqFhyniprezUyOCqjR0/s00Pkip3GgJrtdVch/ZSJ37b2MflvG0LdlruP
 dHqsRhlptOOLjZfOXqXMjcii50joPKLr10pn11pwy8/9wMdUUq0pLw2olzaatbvVcZ8A
 FAwue2faWn03T5148j6idvYh3khEN6hgHpJACW4qHBmep5E/a/+fmLXWTUnFrbAfpay6
 BixeGY6daV8N2W5iPzBla+JSI4DaoRgXyKEpFKWbTZHcSZ6gYlfSdz7gLROU3LWUw9xC
 cE0b1A6htrrrj1W0t3+GWygwHNS0YJPABiwDCUVbOJapSaGfp79wsECLBejR0yVQm3on
 k/Ig==
X-Gm-Message-State: AOAM530hXTKMkbDLt6ihuz+01RpFDv2LmeOwUnCPgeOOQW2ps6T/n20x
 KlXKrO2wzdNgJAF4H6w9e5obwA==
X-Google-Smtp-Source: ABdhPJx/Jk99iRJFxTsv1nNiWHcEwaGPbYeF2e2q7j3F1PqjKZLVLTc9yfm/TiCX2Ye++izPL+H2oQ==
X-Received: by 2002:a1c:6187:: with SMTP id v129mr528032wmb.35.1599502737762; 
 Mon, 07 Sep 2020 11:18:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v6sm29503897wrt.90.2020.09.07.11.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 11:18:56 -0700 (PDT)
Date: Mon, 7 Sep 2020 20:18:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm: mxsfb: check framebuffer pitch
Message-ID: <20200907181855.GE2352366@phenom.ffwll.local>
Mail-Followup-To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stefan Agner <stefan@agner.ch>, marex@denx.de, airlied@linux.ie,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200907160343.124405-1-stefan@agner.ch>
 <20200907161712.GF6047@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907161712.GF6047@pendragon.ideasonboard.com>
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
 linux-imx@nxp.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 07, 2020 at 07:17:12PM +0300, Laurent Pinchart wrote:
> Hi Stefan,
> 
> Thank you for the patch.
> 
> On Mon, Sep 07, 2020 at 06:03:43PM +0200, Stefan Agner wrote:
> > The lcdif IP does not support a framebuffer pitch (stride) other than
> > the CRTC width. Check for equality and reject the state otherwise.
> > 
> > This prevents a distorted picture when using 640x800 and running the
> > Mesa graphics stack. Mesa tires to use a cache aligned stride, which
> 
> s/tires/tries/
> 
> > leads at that particular resolution to width != stride. Currently
> > Mesa has no fallback behavior, but rejecting this configuration allows
> > userspace to handle the issue correctly.
> 
> I'm increasingly impressed by how featureful this IP core is :-)
> 
> > Signed-off-by: Stefan Agner <stefan@agner.ch>
> > ---
> >  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 22 ++++++++++++++++++----
> >  1 file changed, 18 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > index b721b8b262ce..79aa14027f91 100644
> > --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > @@ -403,14 +403,28 @@ static int mxsfb_plane_atomic_check(struct drm_plane *plane,
> >  {
> >  	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
> >  	struct drm_crtc_state *crtc_state;
> > +	unsigned int pitch;
> > +	int ret;
> >  
> >  	crtc_state = drm_atomic_get_new_crtc_state(plane_state->state,
> >  						   &mxsfb->crtc);
> >  
> > -	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> > -						   DRM_PLANE_HELPER_NO_SCALING,
> > -						   DRM_PLANE_HELPER_NO_SCALING,
> > -						   false, true);
> > +	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> > +						  DRM_PLANE_HELPER_NO_SCALING,
> > +						  DRM_PLANE_HELPER_NO_SCALING,
> > +						  false, true);
> > +	if (ret || !plane_state->visible)
> 
> Would it be more explict to check for !plane_state->fb ? Otherwise I'll
> have to verify that !fb always implies !visible :-)
> 
> > +		return ret;
> > +
> > +	pitch = crtc_state->mode.hdisplay *
> > +		plane_state->fb->format->cpp[0];
> 
> This holds on a single line.
> 
> > +	if (plane_state->fb->pitches[0] != pitch) {
> > +		dev_err(plane->dev->dev,
> > +			"Invalid pitch: fb and crtc widths must be the same");
> 
> I'd turn this into a dev_dbg(), printing error messages to the kernel
> log in response to user-triggered conditions is a bit too verbose and
> could flood the log.
> 
> Wouldn't it be best to catch this issue when creating the framebuffer ?

Yeah this should be verified at addfb time. We try to validate as early as
possible.
-Daniel

> 
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> >  }
> >  
> >  static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
