Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DEE132E3B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 19:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F90D6E120;
	Tue,  7 Jan 2020 18:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84A96E120
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 18:17:58 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 9B2EA2003E;
 Tue,  7 Jan 2020 19:17:53 +0100 (CET)
Date: Tue, 7 Jan 2020 19:17:52 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 2/2] drm/print: document DRM_ logging functions
Message-ID: <20200107181752.GA20555@ravnborg.org>
References: <20200102221519.31037-1-sam@ravnborg.org>
 <20200102221519.31037-3-sam@ravnborg.org>
 <20200107160852.GD43062@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107160852.GD43062@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=25-AhOLfAAAA:8
 a=26ezMUyW1APrUCAVH8QA:9 a=hcASC10hvF5Fv3pL:21 a=_R0WbMInmFRGjRy6:21
 a=CjuIK1q_8ugA:10 a=dnuY3_Gu-P7Vi9ynLKQe:22
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
Cc: Jani Nikula <jani.nikula@intel.com>, Joe Perches <joe@perches.com>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

> > + * Logging when a &device * is available, but no &drm_device *
> > + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > + *
> > + * DRM/Drivers can use the following functions for logging when there is a
> > + * struct device * available.
> > + * The logging functions share the same prototype:
> 
> I'd replace the entire block with a "This stuff is deprecated" warning. We
> have at least a corresponding todo.rst entry.

We have many situations where no drm_device is available.
At least when you a buried in drm_panel patches.

So it is either DRM_DEV_ERROR() or drv_err().
Which is why I have pushed for nicer drm_ variants of these...

The todo entry only covers the nice new macros that Jani added
where we have a drm_device.

	Sam



> -Daniel
> 
> > + *
> > + * .. code-block:: c
> > + *
> > + *   void DRM_xxx(struct device *, char * fmt, ...)
> > + *
> > + * .. code-block:: none
> > + *
> > + *   # Plain logging
> > + *   DRM_DEV_INFO(dev, fmt, ...)
> > + *   DRM_DEV_ERROR(dev, fmt, ...)
> > + *
> > + *   # Log only once
> > + *   DRM_DEV_INFO_ONCE(dev, fmt, ...)
> > + *
> > + *   # Ratelimited - do not flood the logs
> > + *   DRM_DEV_DEBUG_RATELIMITED(dev, fmt, ...)
> > + *   DRM_DEV_DEBUG_DRIVER_RATELIMITED(dev, fmt, ...)
> > + *   DRM_DEV_DEBUG_KMS_RATELIMITED(dev, fmt, ...)
> > + *   DRM_DEV_DEBUG_PRIME_RATELIMITED(dev, fmt, ...)
> > + *   DRM_DEV_ERROR_RATELIMITED(dev, fmt, ...)
> > + *
> > + *   # Logging with a specific category
> > + *   DRM_DEV_DEBUG(dev, fmt, ...)		# Logged as CORE
> > + *   DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)
> > + *   DRM_DEV_DEBUG_KMS(dev, fmt, ...)
> > + *   DRM_DEV_DEBUG_PRIME(dev, fmt, ...)
> > + *   DRM_DEV_DEBUG_ATOMIC(dev, fmt, ...)
> > + *   DRM_DEV_DEBUG_VBL(dev, fmt, ...)
> > + *   DRM_DEV_DEBUG_DP(dev, fmt, ...)
> > + *
> > + * Logging when no &device * nor &drm_device * is available
> > + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > + *
> > + * DRM/Drivers can use the following functions for logging when there is no
> > + * extra info associated to the logging.
> > + * The logging functions share the same prototype:
> > + *
> > + * .. code-block:: c
> > + *
> > + *   void DRM_xxx(char * fmt, ...)
> > + *
> > + * .. code-block:: none
> > + *
> > + *   # Plain logging
> > + *   DRM_INFO(fmt, ...)
> > + *   DRM_NOTE(fmt, ...)
> > + *   DRM_WARN(fmt, ...)
> > + *   DRM_ERROR(fmt, ...)
> > + *
> > + *   # Log only once
> > + *   DRM_INFO_ONCE(fmt, ...)
> > + *   DRM_NOTE_ONCE(fmt, ...)
> > + *   DRM_WARN_ONCE(fmt, ...)
> > + *
> > + *   # Ratelimited - do not flood the logs
> > + *   DRM_DEBUG_RATELIMITED(fmt, ...)
> > + *   DRM_DEBUG_DRIVER_RATELIMITED(fmt, ...)
> > + *   DRM_DEBUG_KMS_RATELIMITED(fmt, ...)
> > + *   DRM_DEBUG_PRIME_RATELIMITED(fmt, ...)
> > + *   DRM_ERROR_RATELIMITED(fmt, ...)
> > + *
> > + *   # Logging with a specific category
> > + *   DRM_DEBUG(fmt, ...)		# Logged as CORE
> > + *   DRM_DEBUG_DRIVER(fmt, ...)
> > + *   DRM_DEBUG_KMS(fmt, ...)
> > + *   DRM_DEBUG_PRIME(fmt, ...)
> > + *   DRM_DEBUG_ATOMIC(fmt, ...)
> > + *   DRM_DEBUG_VBL(fmt, ...)
> > + *   DRM_DEBUG_LEASE(fmt, ...)
> > + *   DRM_DEBUG_DP(fmt, ...)
> >   */
> >  
> >  /**
> > @@ -399,7 +475,7 @@ __printf(3, 4)
> >  void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> >  		 const char *format, ...);
> >  
> > -/**
> > +/*
> >   * Error output.
> >   *
> >   * @dev: device pointer
> > @@ -408,7 +484,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> >  #define DRM_DEV_ERROR(dev, fmt, ...)					\
> >  	drm_dev_printk(dev, KERN_ERR, "*ERROR* " fmt, ##__VA_ARGS__)
> >  
> > -/**
> > +/*
> >   * Rate limited error output.  Like DRM_ERROR() but won't flood the log.
> >   *
> >   * @dev: device pointer
> > @@ -436,7 +512,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> >  	}								\
> >  })
> >  
> > -/**
> > +/*
> >   * Debug output.
> >   *
> >   * @dev: device pointer
> > @@ -466,7 +542,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> >  		drm_dev_dbg(dev, category, fmt, ##__VA_ARGS__);		\
> >  })
> >  
> > -/**
> > +/*
> >   * Rate limited debug output. Like DRM_DEBUG() but won't flood the log.
> >   *
> >   * @dev: device pointer
> > -- 
> > 2.20.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
