Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A19A18F330
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 11:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2003889E33;
	Mon, 23 Mar 2020 10:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B672789E33
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 10:54:52 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a81so8477115wmf.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 03:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lQnXuwzFgDpwdG/OSvFj/JmBHTfkMNIzAwS/vs31M88=;
 b=RxjwjrOItwvn6CGuOzbTLXC/iJ55jG1HG0Ur6+f6wMFHW+oy0Pedh/alnAQnpyAWYv
 ITOWxif2eQVg42qeG0E7QKqfL5IYrloawSvC/opqED0mRyrzO+2/9ObS1IOz3vyK5M8g
 brhtrlQbYUMmCJqhe5dQ/RxnuyfYl8xn5E+Hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lQnXuwzFgDpwdG/OSvFj/JmBHTfkMNIzAwS/vs31M88=;
 b=XGTjQ083QPQS/irTWxwUADaEqDUwG9xHSkcn8MV6uOjFw5duQ+l5lkFshcrCloOiIa
 EIU+3MBoF/ubxKUW45ZMcJb1hk41wmeCXcbiRPWXJ8bJils8bMVQ0xljniS5OcF4bfXf
 xR2XL2Ifo5k5/dS2d+JLZZaPaqAeUZjglmDSm5FKG4AtpOut4OjJUIXj3j3LrQGol9X9
 lalHpR6dA7ttLEV5FEjJ1041pbMEALOHQERXR4H5CcglRTUCeRK1FNouPzQ9w5+VCgEH
 x0k8Kibsb5lYBa32VkN3bfl2FdM55m582jm4KT9f16zW/Ope6JLf6j89adRBbJ7n51dl
 qzng==
X-Gm-Message-State: ANhLgQ1P226L4nxslvjzAtCdbqWVc9b7f+pjI/YWlFO6k5jdBEPfgQf2
 uXw+PDJQhsB23PiF/rdtb8paCw==
X-Google-Smtp-Source: ADFU+vvIRn5e+6+LSlP+tVEDm3pG10lcyfAUo+ZOZdCLcLxNjNN7gyXpG/AxMnw9lBq4WEJmjfIHzw==
X-Received: by 2002:a1c:790e:: with SMTP id l14mr11842070wme.146.1584960891291; 
 Mon, 23 Mar 2020 03:54:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f9sm23214968wrc.71.2020.03.23.03.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 03:54:50 -0700 (PDT)
Date: Mon, 23 Mar 2020 11:54:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 20/51] drm: Handle dev->unique with drmm_
Message-ID: <20200323105448.GH2363188@phenom.ffwll.local>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-21-daniel.vetter@ffwll.ch>
 <20200306203710.GG14757@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200306203710.GG14757@ravnborg.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 06, 2020 at 09:37:10PM +0100, Sam Ravnborg wrote:
> On Mon, Mar 02, 2020 at 11:26:00PM +0100, Daniel Vetter wrote:
> > We need to add a drmm_kstrdup for this, but let's start somewhere.
> > 
> > This is not exactly perfect onion unwinding, but it's jsut a kfree so
> > doesn't really matter at all.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Reluctanlyt... But anyway
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> See below for a few comments.
> 
> 
> > ---
> >  drivers/gpu/drm/drm_drv.c     |  5 ++---
> >  drivers/gpu/drm/drm_managed.c | 16 ++++++++++++++++
> >  include/drm/drm_managed.h     |  1 +
> >  3 files changed, 19 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 1a048325f30e..ef79c03e311c 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -777,7 +777,6 @@ void drm_dev_fini(struct drm_device *dev)
> >  	mutex_destroy(&dev->filelist_mutex);
> >  	mutex_destroy(&dev->struct_mutex);
> >  	drm_legacy_destroy_members(dev);
> > -	kfree(dev->unique);
> >  }
> >  EXPORT_SYMBOL(drm_dev_fini);
> >  
> > @@ -1068,8 +1067,8 @@ EXPORT_SYMBOL(drm_dev_unregister);
> >   */
> >  int drm_dev_set_unique(struct drm_device *dev, const char *name)
> >  {
> > -	kfree(dev->unique);
> > -	dev->unique = kstrdup(name, GFP_KERNEL);
> > +	drmm_kfree(dev, dev->unique);
> > +	dev->unique = drmm_kstrdup(dev, name, GFP_KERNEL);
> >  
> >  	return dev->unique ? 0 : -ENOMEM;
> >  }
> > diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> > index 57dc79fa90af..514d5bd42446 100644
> > --- a/drivers/gpu/drm/drm_managed.c
> > +++ b/drivers/gpu/drm/drm_managed.c
> > @@ -160,6 +160,22 @@ void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
> >  }
> >  EXPORT_SYMBOL(drmm_kmalloc);
> >  
> > +char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp)
> 
> So we need this gfp for all users - just because i915 is special and
> uses "GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN" in to places -
> sigh.

Nope, that's not the reason. That NOWARN is not in a driver load path, so
won't ever get converted to drmm_.

Sole reason for adding gfp_flags is consisteny with everything else -
devm_ also has them (and I'd question anyone who does stuff like
GFP_ATOMIC in their driver load path). I guess you can make a case that
some memory allocation functions shouldn't have a gfp_flags parameter
because the only thing you can use that for is create bugs (everyone
should set GFP_KERNEL, maybe with the GFP_ZERO flag set on top). But not
really what I'm aiming for in this series :-)

Hope that explains why I'm sticking with this here.
-Daniel

> 
> 
> 
> > +{
> > +	size_t size;
> > +	char *buf;
> > +
> > +	if (!s)
> > +		return NULL;
> > +
> > +	size = strlen(s) + 1;
> > +	buf = drmm_kmalloc(dev, size, gfp);
> > +	if (buf)
> > +		memcpy(buf, s, size);
> > +	return buf;
> > +}
> > +EXPORT_SYMBOL_GPL(drmm_kstrdup);
> > +
> >  void drmm_kfree(struct drm_device *dev, void *data)
> >  {
> >  	struct drmres *dr_match = NULL, *dr;
> > diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> > index 7b5df7d09b19..89e6fce9f689 100644
> > --- a/include/drm/drm_managed.h
> > +++ b/include/drm/drm_managed.h
> > @@ -24,6 +24,7 @@ static inline void *drmm_kzalloc(struct drm_device *dev, size_t size, gfp_t gfp)
> >  {
> >  	return drmm_kmalloc(dev, size, gfp | __GFP_ZERO);
> >  }
> > +char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
> Missing empty line above. But it is fixed later IIRC
> 
> >  
> >  void drmm_kfree(struct drm_device *dev, void *data);
> >  
> > -- 
> > 2.24.1
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
