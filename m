Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D722D461E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 16:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD026EAB9;
	Wed,  9 Dec 2020 15:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B59E6EAB9
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 15:59:34 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x6so2281980wro.11
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 07:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=noIjpgFZ4TNGJR6uK4occrJLHMBwP6ZdvlY4xXXBcuw=;
 b=Gc0w7J0qu1L9+zp8QWs9bW02CA04HQ1hAyClN66zkHx/LIhZjMgR2bnFiaou7gsR1n
 uaD1CFFjUd9nK2FEIz/LprWDCmdVjiOZNp/15mDge+gPbFSAt0J7X6gmpPAbhPf/l5hf
 PN1HE2E+6ndWNoio66uR68UWDre5DaLLWrzUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=noIjpgFZ4TNGJR6uK4occrJLHMBwP6ZdvlY4xXXBcuw=;
 b=IoQE2uMdBuQ94x9EHDhgWo059s3SJBSHOP38wJZT+6JJE/13kR8fZ18AYyLqpGGl/M
 airXurgBrbs8QeEXMNai4Zar9wur6ftOHTxPqqchzpqRE8+0Ess/4IZP8+JLuHOwMGry
 ADZECdwJmwvHIIlbxKxrfDYJ1t1EgxSw5N3S62Ek6pUsQDjx0wRDN2drjUBFNrTuhYQM
 JOJBbYT2dcO88aMx5bhBSTjpLW0ckp41vnDGtF0nYJwKUsi4EkO3c2UBVFF/7TvhAn0U
 xJVJQb1fJxFBpSQ9/goX04k1EoE+OE/WW0P0ALwm2Uid8zYRRsCLxM5+vTTvKCafjOXy
 Ck0Q==
X-Gm-Message-State: AOAM532cCgeMH0S8qxG7K9/k4PpdgQ/M5BWr4P2vZlrnmzU5hG4qxDYq
 O+c846UXHySTnfS47tUE4k0cieJHGjwQDg==
X-Google-Smtp-Source: ABdhPJyMkDhURrSFbZEMr3RbCalnCc7NwKmIC3m9nixvCX18pw04/fLna0OAFghSaTDGpG46W1xXNA==
X-Received: by 2002:adf:b343:: with SMTP id k3mr3395222wrd.202.1607529573296; 
 Wed, 09 Dec 2020 07:59:33 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y2sm4025224wma.6.2020.12.09.07.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 07:59:32 -0800 (PST)
Date: Wed, 9 Dec 2020 16:59:30 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 01/19] drm/encoder: make encoder control functions
 optional
Message-ID: <20201209155930.GS401619@phenom.ffwll.local>
References: <20201208155451.8421-1-p.zabel@pengutronix.de>
 <20201208155451.8421-2-p.zabel@pengutronix.de>
 <20201208184836.GA165851@ravnborg.org>
 <86e710fc042b883292d8c433c65474afed0be940.camel@pengutronix.de>
 <20201209155805.GR401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209155805.GR401619@phenom.ffwll.local>
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

On Wed, Dec 09, 2020 at 04:58:05PM +0100, Daniel Vetter wrote:
> On Wed, Dec 09, 2020 at 11:58:44AM +0100, Philipp Zabel wrote:
> > Hi Sam,
> > 
> > On Tue, 2020-12-08 at 19:48 +0100, Sam Ravnborg wrote:
> > > Hi Philipp,
> > > On Tue, Dec 08, 2020 at 04:54:33PM +0100, Philipp Zabel wrote:
> > > > Simple managed encoders do not require the .destroy callback,
> > > > make the whole funcs structure optional.
> > > > 
> > > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > > New in v4.
> > > > ---
> > > >  drivers/gpu/drm/drm_encoder.c     | 4 ++--
> > > >  drivers/gpu/drm/drm_mode_config.c | 5 +++--
> > > >  include/drm/drm_encoder.h         | 2 +-
> > > >  3 files changed, 6 insertions(+), 5 deletions(-)
> > > > 
> > [...]
> > > > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > > > index f1affc1bb679..87e144155456 100644
> > > > --- a/drivers/gpu/drm/drm_mode_config.c
> > > > +++ b/drivers/gpu/drm/drm_mode_config.c
> > [...]
> > > > @@ -487,7 +487,8 @@ void drm_mode_config_cleanup(struct drm_device *dev)
> > > >  
> > > >  	list_for_each_entry_safe(encoder, enct, &dev->mode_config.encoder_list,
> > > >  				 head) {
> > > > -		encoder->funcs->destroy(encoder);
> > > > +		if (encoder->funcs)
> > > > +			encoder->funcs->destroy(encoder);
> > > 
> > > So late_register and early_unregister are both optional.
> > > But if encoder->funcs is set then the destroy callback is mandatory.
> > 
> > For encoders that are kept on the mode_config.encoder_list until
> > drm_mode_config_cleanup() is called, the destroy callback is still
> > mandatory.
> > 
> > Encoders allocated with drmm_encoder_alloc() on the other hand should
> > have the destroy callback set to NULL, if encoder->funcs is set.
> > These encoders are removed from the mode_config.encoder_list by the drmm
> > cleanup code, before drm_mode_config_cleanup is called.
> > 
> > > I am just wondering if this is intended.
> > > Reding the documnetation of drm_encoder_funcs thist matches the
> > > documentation but anyway..
> > >
> > > With this comment considered,
> > > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > Thank you for bringing this up, should we just leave
> > drm_mode_config_cleanup() as-is?
> 
> Yup, not having a funcs->destroy there is a bug. Maybe should even warn
> about the lack of that in the traditional non-drmm_ encoder init function.

Forgot to add: With that Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> -Daniel
> 
> > 
> > regards
> > Philipp
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
