Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0C52D4616
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 16:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C426EA95;
	Wed,  9 Dec 2020 15:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5867C6EA95
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 15:58:09 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id e25so2205673wme.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 07:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=z9DJrZRBsRV3ljfnD/yS+ssI2WXG9XKTwR0DUmQvZbU=;
 b=ZZSemO738AQ5p0mohbtDEEXdBmoQaOT5sFmMbhAwgS4fBI4eG1tIna4fokban++c+i
 yDudCbBd8CCmRz5N+85N5mv/gThgTakGjb6XOSPPx5VyL2CB4ezSiiU5Y6+6fJjsxhoO
 epc7QVEQlD1YO/4CMO71l7TuOmglRllRduH6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z9DJrZRBsRV3ljfnD/yS+ssI2WXG9XKTwR0DUmQvZbU=;
 b=EqFd7vI4LWj7NBOCa3QAtzfYlkAz58QOoQ1uSpx7dUchCP4UoXnOqIrifGTLiOSfo5
 iV4aTHkHpyREIKa29o+kPyykXIU80+0vBueROOk3q3WWped4c3VxQeritnYozIxbGGGF
 PCzeJu/t7JnStn43IRarcdlvPKJcn+6oKBvJ2nrX3RiT8dksXfDHSIMlk2kr/ChBghsg
 hpo5K6LvM2XCPoY6ZQiCFzU7TmEKtNBAtYk6PDvYGFlqaWfNa1p1blKWhN1IIvPdzN7S
 Kh3ppE6Ig2jco/BUUJ6UMB9Wvb3AHMpvqG62dcha1xf+4+XD7Y3qck7lvleAe+pOKXO+
 7ERg==
X-Gm-Message-State: AOAM533AjiTZjFLhnTk6HPHz8yGGFm1uJ19bn9rN0aedZipG9Tv/uL/u
 jCx1Yf2/UFEby08qDSdxpMWe+bn7PWJr2Q==
X-Google-Smtp-Source: ABdhPJxInQK2remoTFnWyFSUBahD//s670KJb0hXAfFyWf4uee8XSLhRkFZU4fX14iOG7mq+pKn/rg==
X-Received: by 2002:a7b:cf08:: with SMTP id l8mr3556411wmg.189.1607529488085; 
 Wed, 09 Dec 2020 07:58:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i9sm4722257wrs.70.2020.12.09.07.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 07:58:07 -0800 (PST)
Date: Wed, 9 Dec 2020 16:58:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 01/19] drm/encoder: make encoder control functions
 optional
Message-ID: <20201209155805.GR401619@phenom.ffwll.local>
References: <20201208155451.8421-1-p.zabel@pengutronix.de>
 <20201208155451.8421-2-p.zabel@pengutronix.de>
 <20201208184836.GA165851@ravnborg.org>
 <86e710fc042b883292d8c433c65474afed0be940.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86e710fc042b883292d8c433c65474afed0be940.camel@pengutronix.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 09, 2020 at 11:58:44AM +0100, Philipp Zabel wrote:
> Hi Sam,
> 
> On Tue, 2020-12-08 at 19:48 +0100, Sam Ravnborg wrote:
> > Hi Philipp,
> > On Tue, Dec 08, 2020 at 04:54:33PM +0100, Philipp Zabel wrote:
> > > Simple managed encoders do not require the .destroy callback,
> > > make the whole funcs structure optional.
> > > 
> > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > New in v4.
> > > ---
> > >  drivers/gpu/drm/drm_encoder.c     | 4 ++--
> > >  drivers/gpu/drm/drm_mode_config.c | 5 +++--
> > >  include/drm/drm_encoder.h         | 2 +-
> > >  3 files changed, 6 insertions(+), 5 deletions(-)
> > > 
> [...]
> > > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > > index f1affc1bb679..87e144155456 100644
> > > --- a/drivers/gpu/drm/drm_mode_config.c
> > > +++ b/drivers/gpu/drm/drm_mode_config.c
> [...]
> > > @@ -487,7 +487,8 @@ void drm_mode_config_cleanup(struct drm_device *dev)
> > >  
> > >  	list_for_each_entry_safe(encoder, enct, &dev->mode_config.encoder_list,
> > >  				 head) {
> > > -		encoder->funcs->destroy(encoder);
> > > +		if (encoder->funcs)
> > > +			encoder->funcs->destroy(encoder);
> > 
> > So late_register and early_unregister are both optional.
> > But if encoder->funcs is set then the destroy callback is mandatory.
> 
> For encoders that are kept on the mode_config.encoder_list until
> drm_mode_config_cleanup() is called, the destroy callback is still
> mandatory.
> 
> Encoders allocated with drmm_encoder_alloc() on the other hand should
> have the destroy callback set to NULL, if encoder->funcs is set.
> These encoders are removed from the mode_config.encoder_list by the drmm
> cleanup code, before drm_mode_config_cleanup is called.
> 
> > I am just wondering if this is intended.
> > Reding the documnetation of drm_encoder_funcs thist matches the
> > documentation but anyway..
> >
> > With this comment considered,
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Thank you for bringing this up, should we just leave
> drm_mode_config_cleanup() as-is?

Yup, not having a funcs->destroy there is a bug. Maybe should even warn
about the lack of that in the traditional non-drmm_ encoder init function.
-Daniel

> 
> regards
> Philipp
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
