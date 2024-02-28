Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B670886B147
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 15:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5362210E424;
	Wed, 28 Feb 2024 14:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="WdWOc+kJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEEE10E608
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 14:08:05 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-412ae6392f0so871655e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 06:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1709129283; x=1709734083; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mUVmrcuA39MF251x7X5ARx9WwO4dFVP4l9HT7NkEaNk=;
 b=WdWOc+kJRZvIpifdzGJ2gNgnLouueg6Rw4fKlxdifHIPC86ZzdmetvjmyD/+PN6P1P
 JvgT5wc1Dm3iqVNLGP2ZdG91FCDFZhWYXdtUrwGobT3UyzfEZeX5tNSecyktBbSaoacJ
 ZvOral7R2VO8a+gHY9sCOL3hczH9lFGJqtsBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709129283; x=1709734083;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mUVmrcuA39MF251x7X5ARx9WwO4dFVP4l9HT7NkEaNk=;
 b=wvtAAq5j8bQvI6nllKK/gFHF6GDAsPTbbewEK9n0+/nN3VyP40WSGD/FKRvxbwXPEg
 pcSqmLtWtD2X2Gi3/kIqLYT159wN8vunwIjWzd6GBVC3/CHguwk8XIX/NINnk+ExW468
 qWvitusoHvcMoAJaOekGlYvAspZ5Pn5MOuxsfIdRW8IwlMA31a1vbjtXLjGq6g2OQ8qj
 +n2NSHJy5TAOuhhMZGX9OAph9fyydlly6qk24N2gnBJF6peJAZnldzw6Pzi0JFF9pzca
 gw8OOvt+1oVinQZ59SISzD5BfYl3go7RPftg37LQVLTEsjB70C8rmpVxumFWs2+rqn/7
 gloA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtJ64h/mUQDSY0XvxIRka2AQ1MQB9iW9zaR2FcmQ7JYLf6UU9Oh1iVgRORAyHZku0/FrqRGYfetxMtCK8eCVTg4KoVjy0gjCtgHEcH9Cvb
X-Gm-Message-State: AOJu0Ywn/5S7/DWlKnrKaIHG8OjJwm7KhhczzBpt2K8C0ipgf86sGLbI
 fcFQj8fXeGJ0Hhcc4MKe5mNTxII/7DVKLddIrdvvUvHgJjN/szbr2YcY6EjStDo=
X-Google-Smtp-Source: AGHT+IHVgTT7SAUERgY/qC6JGjy8snO0RQGURwM7F9fgYkHp0K/shY8oyt9T3BuYcky5YRC1fQBimA==
X-Received: by 2002:a05:600c:1c05:b0:412:a1c1:2d9f with SMTP id
 j5-20020a05600c1c0500b00412a1c12d9fmr7270386wms.1.1709129283066; 
 Wed, 28 Feb 2024 06:08:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 jn5-20020a05600c6b0500b0041228b2e179sm2180822wmb.39.2024.02.28.06.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 06:08:02 -0800 (PST)
Date: Wed, 28 Feb 2024 15:08:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Shradha Gupta <shradhagupta@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.dev>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Saurabh Singh Sengar <ssengar@linux.microsoft.com>,
 Shradha Gupta <shradhagupta@microsoft.com>
Subject: Re: [PATCH v4 0/2] drm: Check polling initialized before
Message-ID: <Zd8-QBqRIfzH1jCI@phenom.ffwll.local>
Mail-Followup-To: Shradha Gupta <shradhagupta@linux.microsoft.com>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.dev>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Saurabh Singh Sengar <ssengar@linux.microsoft.com>,
 Shradha Gupta <shradhagupta@microsoft.com>
References: <1706856176-9483-1-git-send-email-shradhagupta@linux.microsoft.com>
 <ZcI9Mw-MclTtkbwe@phenom.ffwll.local>
 <20240220060217.GA14395@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220060217.GA14395@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Mon, Feb 19, 2024 at 10:02:17PM -0800, Shradha Gupta wrote:
> Gentle reminder to consume this patchset.

Apologies, I've assumed you have commit rights or know someone, but seems
like no one from microsoft can push to drm-misc :-/

Applied to drm-misc-next now, thanks for your patches!
-Sima

> 
> On Tue, Feb 06, 2024 at 03:07:47PM +0100, Daniel Vetter wrote:
> > On Thu, Feb 01, 2024 at 10:42:56PM -0800, Shradha Gupta wrote:
> > > This patchset consists of sanity checks before enabling/disabling
> > > output polling to make sure we do not call polling enable and disable
> > > functions when polling for the device is not initialized or is now
> > > uninitialized(by drm_kms_helper_poll_fini() function)
> > > 
> > > The first patch consists of these checks in
> > > drm_kms_helper_poll_disable() and drm_kms_helper_poll_enable() calls.
> > > It further flags a warning if a caller violates this. It also adds
> > > these checks in drm_mode_config_helper_resume() and
> > > drm_mode_config_helper_suspend() calls to avoid this warning.
> > > 
> > > The second patch adds a similar missing check in
> > > drm_helper_probe_single_connector_modes() function that is exposed by
> > > the new warning introduced in the first patch.
> > > 
> > > Shradha Gupta (2):
> > >   drm: Check output polling initialized before disabling
> > >   drm: Check polling initialized before enabling in
> > >     drm_helper_probe_single_connector_modes
> > 
> > On the series:
> > 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > > 
> > >  drivers/gpu/drm/drm_modeset_helper.c | 19 ++++++++++++++++---
> > >  drivers/gpu/drm/drm_probe_helper.c   | 21 +++++++++++++++++----
> > >  2 files changed, 33 insertions(+), 7 deletions(-)
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
