Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D79CF1AC3E8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 15:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592536E062;
	Thu, 16 Apr 2020 13:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from saul.pp3345.net (saul.pp3345.net [163.172.111.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1076E0FA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 13:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 dev@pp3345.net)
 by saul.pp3345.net (Postcow) with ESMTPSA id 90B299A4642;
 Thu, 16 Apr 2020 15:51:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pp3345.net; s=saul;
 t=1587045100; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:autocrypt;
 bh=p72sMrzpjiFBe093N4lGaIhYqi5PDODmXWZRAmXL3do=;
 b=LPvAOFTHvmx2f6lB1iTk8U8tLB6dV9w5XwqI7PJuJaYAwrda2p7+AiHFfT3/PhQQzDYjDP
 oPxW4oVvEGSuJ0qS6/XkwSD/o7Z8N+mjBfqQbkCc2YRcHuY0A5D7BxZyjynC2WdSyKBt2n
 fBpqBRrq94kWjSoEoG9Q3NqfI8iG400Dd9g2Egy2dvd36Yih+uTDewxdd4AQWXuZxA2Emo
 //TVSphDSFvYpJmaxFI/giDgAoSBjvgeUA3pq9MF4bek4K2uzIdxlnMPiLdSL+XNRrVXGR
 VR0LhnxS6k24xrcs/h68mw/rC2ZYj9P66mQfOmcPHX6CakBpfSHwpXAnT6AkEA==
Message-ID: <ac01c47a3b2c2ac73368882fb90eb6ee4e07fd04.camel@pp3345.net>
Subject: Re: [PATCH 1/5] drm/modes: Indicate CEA-861 CE modes to user-space
From: Yussuf Khalil <dev@pp3345.net>
To: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 16 Apr 2020 15:51:36 +0200
In-Reply-To: <20200414124132.GV3456981@phenom.ffwll.local>
References: <20200413214024.46500-1-dev@pp3345.net>
 <20200413214024.46500-2-dev@pp3345.net>
 <20200414124132.GV3456981@phenom.ffwll.local>
User-Agent: Evolution 3.36.1 (3.36.1-1.fc32) 
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-04-14 at 14:41 +0200, Daniel Vetter wrote:
> On Mon, Apr 13, 2020 at 11:40:22PM +0200, Yussuf Khalil wrote:
> > Add a new flag to mark modes that are considered a CE mode
> > according to the
> > CEA-861 specification. Modes without this flag are implicitly
> > considered to
> > be IT modes.
> > 
> > User-space applications may use this flag to determine possible
> > implications of using a CE mode (e.g., limited RGB range).
> > 
> > There is no use for this flag inside the kernel, so we set it only
> > when
> > communicating a mode to user-space.
> > 
> > Signed-off-by: Yussuf Khalil <dev@pp3345.net>
> 
> Do we have userspace for this?
> 
> If we go with the existing quant range property you don't need new
> userspace for the property itself. But this flag here is new uapi, so
> needs userspace per
> 
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
> 
> Also since this standardizes kms uapi, we need testcases per
> 
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#testing-requirements-for-userspace-api
> 
> Cheers, Daniel
> 
> > ---
> >  drivers/gpu/drm/drm_modes.c | 14 ++++++++++++++
> >  include/uapi/drm/drm_mode.h |  2 ++
> >  2 files changed, 16 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_modes.c
> > b/drivers/gpu/drm/drm_modes.c
> > index d4d64518e11b..0d8a032f437d 100644
> > --- a/drivers/gpu/drm/drm_modes.c
> > +++ b/drivers/gpu/drm/drm_modes.c
> > @@ -1973,6 +1973,14 @@ void drm_mode_convert_to_umode(struct
> > drm_mode_modeinfo *out,
> >  		break;
> >  	}
> >  
> > +	if (drm_match_cea_mode(in) > 1) {
> > +		/*
> > +		 * All modes in CTA-861-G Table 1 are CE modes, except
> > 640x480p
> > +		 * (VIC 1).
> > +		 */
> > +		out->flags |= DRM_MODE_FLAG_CEA_861_CE_MODE;
> > +	}
> > +
> >  	strncpy(out->name, in->name, DRM_DISPLAY_MODE_LEN);
> >  	out->name[DRM_DISPLAY_MODE_LEN-1] = 0;
> >  }
> > @@ -2045,6 +2053,12 @@ int drm_mode_convert_umode(struct drm_device
> > *dev,
> >  		return -EINVAL;
> >  	}
> >  
> > +	/*
> > +	 * The CEA-861 CE mode flag is purely informational and
> > intended for
> > +	 * userspace only.
> > +	 */
> > +	out->flags &= ~DRM_MODE_FLAG_CEA_861_CE_MODE;
> > +
> >  	out->status = drm_mode_validate_driver(dev, out);
> >  	if (out->status != MODE_OK)
> >  		return -EINVAL;
> > diff --git a/include/uapi/drm/drm_mode.h
> > b/include/uapi/drm/drm_mode.h
> > index 735c8cfdaaa1..5e78b350b2e2 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -124,6 +124,8 @@ extern "C" {
> >  #define  DRM_MODE_FLAG_PIC_AR_256_135 \
> >  			(DRM_MODE_PICTURE_ASPECT_256_135<<19)
> >  
> > +#define DRM_MODE_FLAG_CEA_861_CE_MODE (1<<23)
> > +
> >  #define  DRM_MODE_FLAG_ALL	(DRM_MODE_FLAG_PHSYNC |		\
> >  				 DRM_MODE_FLAG_NHSYNC |		\
> >  				 DRM_MODE_FLAG_PVSYNC |		\
> > -- 
> > 2.26.0
> > 

Sorry, I wasn't aware DRM had these additional requirements. I do have a user-
space implementation in mutter and gnome-control-center that makes use of the
new property and this flag on my local machine. I'll try to propose the branch
upstream before sending in the next revision of this patchset.

Do I understand it correctly that this will require test cases for both the
property itself and the new flag? I'll write a patch for IGT then.

Regards
Yussuf

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
