Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2673E8B6C39
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 09:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8445110EBC2;
	Tue, 30 Apr 2024 07:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="UHXE4fQs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CCC10E144
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 07:53:18 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-345606e8ac0so460372f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 00:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1714463596; x=1715068396; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gl/FlDFmUATMwqOxYHiILprB4jdUBlG0HeOIOaA3b20=;
 b=UHXE4fQsGc4Jh02vmf20cgkiXKdGT6F6RTvtbDH2Qn7EpdZM19SUVi+OZWYnCdLRx/
 5dbTqjfCrJnjuTfHZeHMgRQaWHkYdQJF9Sk5EZZy58H9NhDtNL5EPJ/X6QsP3/71jsO/
 rA9Dr3oMNut8ZSJVn9b8W/HTL/CDVQv5Dtcz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714463596; x=1715068396;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gl/FlDFmUATMwqOxYHiILprB4jdUBlG0HeOIOaA3b20=;
 b=LKP+J+yuIPKiJEoNsOwq0ABEo/2ktJm0mMxbelE/Oaltlu9eUqCD9N5ulQuTdy5/zf
 qYpxalJI8RiPR97QwkuKCl+vGIIddp6wWu4ORQY8cFA2qzBi89ncXvPFZuZ9YHIf8R+R
 3ereXqhEptzRIFSpLoz9XVzVL/TXVwWUw0Kz18sWgZ+driMXwAiY7OCRluqTX8p6LKiH
 2rc/jxau5R8yn7Qja1G03DQRD43sOl7uu44ft12qAEecjVCNrhK3kVzid1PGYTPy5sXV
 Dk0BUjsfIi9+kjIRzOdqVyaFS1QJ4YuGu3ViS3m4TABVzYZBs+LJ16Yl/Wm+FUFeEv5x
 fB6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIOcHUaLvnmKdtLwqfiNkPaDpBqYY/X7Bj9FeQwy9oblaKahihteJgzQk6imC3Jp6PPdxPzA+JxrPHQRpqpoJXAEHn00SdPOG5FKHAv511
X-Gm-Message-State: AOJu0YyifBIXyjHNyV5sS1ByI1+QYtw/lTTyyIXd2K5XwLq/oS7J07af
 0yEAr+ywJLhYyo9LuEyVBTwtscEr81PnwiAXMCXqEFVEFXTcwTo9FhGFlSFjQj4=
X-Google-Smtp-Source: AGHT+IECCcZ/hzS+3me5WyxrdSWBWgHWMFfysSTkDDjkV6TSZIvDkUkK1bSHQdweFT16duokClgLNw==
X-Received: by 2002:a05:600c:3c82:b0:41a:bc88:b84 with SMTP id
 bg2-20020a05600c3c8200b0041abc880b84mr9568865wmb.1.1714463596454; 
 Tue, 30 Apr 2024 00:53:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a05600c34d200b0041b083e16e2sm22209242wmq.2.2024.04.30.00.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 00:53:15 -0700 (PDT)
Date: Tue, 30 Apr 2024 09:53:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Brandon Pollack <brpol@chromium.org>
Cc: marius.vlad@collabora.com, mairacanal@riseup.net, jshargo@chromium.org,
 hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 linux-doc@vger.kernel.org, hirono@chromium.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, mduggan@chromium.org, mripard@kernel.org,
 tzimmermann@suse.de
Subject: Re: [PATCH v6 2/7] drm/vkms: Support multiple DRM objects (crtcs,
 etc.) per VKMS device
Message-ID: <ZjCjaZwSjoFg7Upn@phenom.ffwll.local>
Mail-Followup-To: Brandon Pollack <brpol@chromium.org>,
 marius.vlad@collabora.com, mairacanal@riseup.net,
 jshargo@chromium.org, hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com, linux-doc@vger.kernel.org,
 hirono@chromium.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 mduggan@chromium.org, mripard@kernel.org, tzimmermann@suse.de
References: <20230829053201.423261-1-brpol@chromium.org>
 <20230829053201.423261-3-brpol@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829053201.423261-3-brpol@chromium.org>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Tue, Aug 29, 2023 at 05:30:54AM +0000, Brandon Pollack wrote:
> From: Jim Shargo <jshargo@chromium.org>
> 
> This change supports multiple CRTCs, encoders, connectors instead of one
> of each per device.
> 
> Since ConfigFS-based devices will support multiple crtcs, it's useful to
> move all of the writeback/composition data from being per-"output" to
> being per-CRTC.
> 
> Since there's still only ever one CRTC, this should be a no-op refactor.
> 
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> Signed-off-by: Brandon Pollack <brpol@chromium.org>

> +struct vkms_crtc {
> +	struct drm_crtc base;
> +
> +	struct drm_writeback_connector wb_connector;
> +	struct hrtimer vblank_hrtimer;
> +	ktime_t period_ns;
> +	struct drm_pending_vblank_event *event;
> +	/* ordered wq for composer_work */
> +	struct workqueue_struct *composer_workq;
> +	/* protects concurrent access to composer */
> +	spinlock_t lock;
> +	/* guarantees that if the composer is enabled, a job will be queued */
> +	struct mutex enabled_lock;
> +
> +	/* protected by @enabled_lock */
> +	bool composer_enabled;
> +	struct vkms_crtc_state *composer_state;
> +
> +	spinlock_t composer_lock;
> +};
> +
>  struct vkms_color_lut {
>  	struct drm_color_lut *base;
>  	size_t lut_length;
> @@ -97,25 +122,14 @@ struct vkms_crtc_state {
>  };
>  
>  struct vkms_output {

I think this structure doesn't make sense anymore. If I didn't misread
then it's really only needed as a temporary structure during the default
vkms_output_init code anymore, and for that case I think we should just
completely delete it. Since vkms is now using drmm_ there's really not
need to track all our kms objects again ourselves.

With that this patch essentially becomes "creat vkms_crtc" (which moves
all the composer releated data from vkms_output to this new structure) and
then maybe a 2nd patch which deletes the leftovers of vkms_output.

> -	struct drm_crtc crtc;
> -	struct drm_encoder encoder;
> -	struct drm_connector connector;
> -	struct drm_writeback_connector wb_connector;
> -	struct hrtimer vblank_hrtimer;
> -	ktime_t period_ns;
> -	struct drm_pending_vblank_event *event;
> -	/* ordered wq for composer_work */
> -	struct workqueue_struct *composer_workq;
> -	/* protects concurrent access to composer */
> -	spinlock_t lock;
> -	/* guarantees that if the composer is enabled, a job will be queued */
> -	struct mutex enabled_lock;
> -
> -	/* protected by @enabled_lock */
> -	bool composer_enabled;
> -	struct vkms_crtc_state *composer_state;
> -
> -	spinlock_t composer_lock;
> +	int num_crtcs;
> +	struct vkms_crtc crtcs[VKMS_MAX_OUTPUT_OBJECTS];

Uh can we please directly use the DRM limits here for these? I guess this
is because you have static arrays, but vkms really shouldn't need it's own
arrays to keep track of what drm already keeps track of.

Using DRM limits also means we can rely on the drm validation code instead
of having to duplicate that code in the vkms configfs validation
functions.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
