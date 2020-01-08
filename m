Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC64134AFE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 19:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D403B6E2F8;
	Wed,  8 Jan 2020 18:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B646E2F8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 18:56:03 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d16so4522075wre.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2020 10:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=qikF1UWtZ6eJF4mubyOKm+5IHWTeRRmYGvFpDMF351E=;
 b=ceZzOk/osJcQAtkpzR91QtixWOdjRNYR+OCYMtv3WA8NOtb+JiZoZQVsdoVa4dxtGX
 gN4EgS67E15UsEhjjgSBgDzEszlBRC0EDdXMO7ZrtN4jxssKHyE6qtDYveoHXMa0ipno
 P7vxIJQxucBSpTrdEoYGqoS2EXkHqYg6458GE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=qikF1UWtZ6eJF4mubyOKm+5IHWTeRRmYGvFpDMF351E=;
 b=ifPQaq9tC+HPygByky8wvFvTOnJ7asfbk+YLO3cnrQB+EzfEhSIbq3GAdma1Z9wJ9A
 H37TwQOfC2+lF9OZrBtLzSDdZFgv/cyjuZa7pR/EsAqU0L4TvQaYTDIdd0CAlVrllLdA
 4/XwiYKtqZ0vEsmXsZhwYqEO0sAtdXkbK6b4JvsHqKQmlTxfe+gs35bDdCp9HrW70d/x
 O3n0ePDXHr1MvL6w5hpypmrdcAWTITvdelja8vrwMyjI7v1mT3gORUWxDIaRKxxDjDO4
 lpkj5XWih1RGimr+Vc0/nX2XHC2iQ8l8J043JSydnjujQts6IRbFXk8cCWXHeuBmiY+G
 SAuw==
X-Gm-Message-State: APjAAAXbOsm6rybtSJt498uiSaLqvfkA4gzCHpNewzayjK+w8jIxeMo5
 u3XV5X6Ptklexj22yUxLOCKjVw==
X-Google-Smtp-Source: APXvYqysOS8XXtQ6tjSokAq63/nT5KtQo5+V5djlv6ehXIu6gzFuO1bkC6VJiqoB1c6TjhqOqXvlJg==
X-Received: by 2002:adf:edd0:: with SMTP id v16mr6201385wro.310.1578509762068; 
 Wed, 08 Jan 2020 10:56:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id s3sm22691wmh.25.2020.01.08.10.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 10:56:01 -0800 (PST)
Date: Wed, 8 Jan 2020 19:55:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] i915: fix backlight configuration issue
Message-ID: <20200108185559.GK43062@phenom.ffwll.local>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Dave Airlie <airlied@redhat.com>,
 Alexander Shiyan <shc_work@mail.ru>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200108140227.3976563-1-arnd@arndb.de> <87o8veotf9.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o8veotf9.fsf@intel.com>
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
Cc: Alexander Shiyan <shc_work@mail.ru>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 08, 2020 at 05:32:26PM +0200, Jani Nikula wrote:
> On Wed, 08 Jan 2020, Arnd Bergmann <arnd@arndb.de> wrote:
> > The i915 driver can use the backlight subsystem as an option, and usually
> > selects it when CONFIG_ACPI is set. However it is possible to configure
> > a kernel with modular backlight classdev support and a built-in i915
> > driver, which leads to a linker error:
> >
> > drivers/gpu/drm/i915/display/intel_panel.o: In function `intel_backlight_device_register':
> > intel_panel.c:(.text+0x2f58): undefined reference to `backlight_device_register'
> > drivers/gpu/drm/i915/display/intel_panel.o: In function `intel_backlight_device_unregister':
> > intel_panel.c:(.text+0x2fe4): undefined reference to `backlight_device_unregister'
> >
> > Add another Kconfig option to ensure the driver only tries to use
> > the backlight support when it can in fact be linked that way. The
> > new option is on by default to keep the existing behavior.
> >
> > This is roughly what other drivers like nouveau do as well.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> > I've had this one lying around for a long time, it is still needed
> > but I am not sure which solution is best here. This version is
> > probably the least invasive, but it does not solve the bigger
> > problem around too many 'select' statements in drm
> 
> This is just another hack that's only required because backlight is
> selected instead of depended on throughout the kernel. (*)
> 
> i915 (and most drm drivers, with some variations) could easily handle
> this with:
> 
> 	depends on (ACPI && ACPI_VIDEO) || ACPI=n
> 	depends on BACKLIGHT_CLASS_DEVICE || BACKLIGHT_CLASS_DEVICE=n
> 
> Those two lines express the allowed configurations. It's just that we
> can't do that in i915 *alone*. The combinations of depends and selects
> lead to impossible configurations. It's all or nothing.
> 
> I am not amused by adding more hacks, and I am really *not* interested
> in adding another useless i915 config option to "solve" this issue.
> 
> So thanks, but no thanks. I'm not taking this patch.

Yeah I'm also leaning towards that the real fix here is to convert
backlight over to be a depends on symbol, not a select symbol. It's
clearly not a simple stand-alone helper. Or someone makes select recursive
and adds a SAT solver to Kconfig :-)
-Daniel

> 
> 
> BR,
> Jani.
> 
> 
> (*) The deeper issue is that people as well as the kconfig tools ignore
> the warnings in Documentation/kbuild/kconfig-language.rst:
> 
> 	select should be used with care. select will force
> 	a symbol to a value without visiting the dependencies.
> 	By abusing select you are able to select a symbol FOO even
> 	if FOO depends on BAR that is not set.
> 	In general use select only for non-visible symbols
> 	(no prompts anywhere) and for symbols with no dependencies.
> 	That will limit the usefulness but on the other hand avoid
> 	the illegal configurations all over.
> 
> I don't think we can, uh, fix the people, but it might be possible to
> warn about selecting visible symbols or symbols with dependencies.
> 
> > ---
> >  drivers/gpu/drm/i915/Kconfig               | 11 ++++++++++-
> >  drivers/gpu/drm/i915/display/intel_panel.c |  4 ++--
> >  drivers/gpu/drm/i915/display/intel_panel.h |  6 +++---
> >  3 files changed, 15 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> > index ba9595960bbe..81d956040d18 100644
> > --- a/drivers/gpu/drm/i915/Kconfig
> > +++ b/drivers/gpu/drm/i915/Kconfig
> > @@ -16,7 +16,7 @@ config DRM_I915
> >  	select IRQ_WORK
> >  	# i915 depends on ACPI_VIDEO when ACPI is enabled
> >  	# but for select to work, need to select ACPI_VIDEO's dependencies, ick
> > -	select BACKLIGHT_CLASS_DEVICE if ACPI
> > +	select DRM_I915_BACKLIGHT if ACPI
> >  	select INPUT if ACPI
> >  	select ACPI_VIDEO if ACPI
> >  	select ACPI_BUTTON if ACPI
> > @@ -68,6 +68,15 @@ config DRM_I915_FORCE_PROBE
> >  
> >  	  Use "*" to force probe the driver for all known devices.
> >  
> > +config DRM_I915_BACKLIGHT
> > +	tristate "Control backlight support"
> > +	depends on DRM_I915
> > +	default DRM_I915
> > +	select BACKLIGHT_CLASS_DEVICE
> > +	help
> > +          Say Y here if you want to control the backlight of your display
> > +          (e.g. a laptop panel).
> > +
> >  config DRM_I915_CAPTURE_ERROR
> >  	bool "Enable capturing GPU state following a hang"
> >  	depends on DRM_I915
> > diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
> > index 7b3ec6eb3382..e2fe7a50dcbf 100644
> > --- a/drivers/gpu/drm/i915/display/intel_panel.c
> > +++ b/drivers/gpu/drm/i915/display/intel_panel.c
> > @@ -1203,7 +1203,7 @@ void intel_panel_enable_backlight(const struct intel_crtc_state *crtc_state,
> >  	mutex_unlock(&dev_priv->backlight_lock);
> >  }
> >  
> > -#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
> > +#if IS_ENABLED(CONFIG_DRM_I915_BACKLIGHT)
> >  static u32 intel_panel_get_backlight(struct intel_connector *connector)
> >  {
> >  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
> > @@ -1370,7 +1370,7 @@ void intel_backlight_device_unregister(struct intel_connector *connector)
> >  		panel->backlight.device = NULL;
> >  	}
> >  }
> > -#endif /* CONFIG_BACKLIGHT_CLASS_DEVICE */
> > +#endif /* CONFIG_DRM_I915_BACKLIGHT */
> >  
> >  /*
> >   * CNP: PWM clock frequency is 19.2 MHz or 24 MHz.
> > diff --git a/drivers/gpu/drm/i915/display/intel_panel.h b/drivers/gpu/drm/i915/display/intel_panel.h
> > index cedeea443336..e6e81268b7ed 100644
> > --- a/drivers/gpu/drm/i915/display/intel_panel.h
> > +++ b/drivers/gpu/drm/i915/display/intel_panel.h
> > @@ -49,10 +49,10 @@ intel_panel_edid_fixed_mode(struct intel_connector *connector);
> >  struct drm_display_mode *
> >  intel_panel_vbt_fixed_mode(struct intel_connector *connector);
> >  
> > -#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
> > +#if IS_ENABLED(CONFIG_DRM_I915_BACKLIGHT)
> >  int intel_backlight_device_register(struct intel_connector *connector);
> >  void intel_backlight_device_unregister(struct intel_connector *connector);
> > -#else /* CONFIG_BACKLIGHT_CLASS_DEVICE */
> > +#else /* CONFIG_DRM_I915_BACKLIGHT */
> >  static inline int intel_backlight_device_register(struct intel_connector *connector)
> >  {
> >  	return 0;
> > @@ -60,6 +60,6 @@ static inline int intel_backlight_device_register(struct intel_connector *connec
> >  static inline void intel_backlight_device_unregister(struct intel_connector *connector)
> >  {
> >  }
> > -#endif /* CONFIG_BACKLIGHT_CLASS_DEVICE */
> > +#endif /* CONFIG_DRM_I915_BACKLIGHT */
> >  
> >  #endif /* __INTEL_PANEL_H__ */
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
