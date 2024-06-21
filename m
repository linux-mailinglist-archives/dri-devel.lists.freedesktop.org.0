Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EEA912B7B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 18:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E5410E082;
	Fri, 21 Jun 2024 16:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="b7as3llJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608C610E082
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 16:37:27 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42111cf1ca1so3243765e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 09:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718987845; x=1719592645; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cjchbneGrDWxr8AFTRkd9v6VKSwRAoQm1Q6qE+BStWQ=;
 b=b7as3llJk8yVBgoboirRbGQYAJmkOTgaXGuxRXSgC6RiN3QIGjOMOlIaSPpLyhAfe6
 jp4glIQvxrxe35mSgjER5Go5Fk5oPS+8pQaJTHSzL/5s6xOUn7fg8IisKSAlJN5RiYwj
 9L9mmoHMrslrzNJABizcKBGhY9DW/pOVKh7BE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718987845; x=1719592645;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cjchbneGrDWxr8AFTRkd9v6VKSwRAoQm1Q6qE+BStWQ=;
 b=OHspZilE4DB2lxTk9a1XG65tOtC7nIEhSbQlWGZ2PLtWvZ7P5QrDlUzDy18Pz4y+79
 sJVC2TtWcy6ecU24lhba1I7N3hjj5mpq7IWj87g7UTBCUVdgiZU+/Lsf69tZpuYWaMAF
 xkTN+w1AURKDxSiZbzEX1jxRmgOAYiLAjjcnEGMUiMeqQR8H6liASSWnNGalHOAybqhc
 JJl8evWj/VoVLXtTP+FWi/xntMJVYSyDtNGZjU4TXciianofGYZjJb5fNNiGW0GZu9Nv
 i/W2fPmD/nqBAXj0VoXoQNqdycj3s40RDhQOhUdYyeHk5DLLEL68qCf780g8zp/TxP72
 0eVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAnOo0lbvAkTwufK+VLCFM8zNdfkVT4XlAG0KpHKJkcVRZv0lzTBMpRdg9uR0GIJ5PovK36/VGKTMyXU16yvS44A9j1mZAvGgmPpgnE373
X-Gm-Message-State: AOJu0YzaUP0KLZtSB9FOYTlzNZaWqrwxvaZh1BgpH5BJRDK7A39O3w8i
 /HyI0MMVAH0XlyI4hLuKWuTHgltnDWqTGetBSpIqUSLlGdZ65niSWHtXojJxId8=
X-Google-Smtp-Source: AGHT+IFpJZuWD6jGk2oIvCOrR61oKPuBS6Ak+YtPL+k8dN+5A9g3/L5D+hKs9iTSHX0BfMiQTWVl6w==
X-Received: by 2002:a05:600c:3b12:b0:423:573:ab2a with SMTP id
 5b1f17b1804b1-424750168f1mr63047115e9.0.1718987845506; 
 Fri, 21 Jun 2024 09:37:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d208b0esm70718525e9.38.2024.06.21.09.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 09:37:25 -0700 (PDT)
Date: Fri, 21 Jun 2024 18:37:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ssd130x: Add drm_panic support
Message-ID: <ZnWsQ36q44l4CmOJ@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20240620222222.155933-1-javierm@redhat.com>
 <24205cdf-a3c6-475e-ba8a-a52d039a402d@redhat.com>
 <87h6dmjry6.fsf@minerva.mail-host-address-is-not-set>
 <87ed8qjo8y.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ed8qjo8y.fsf@minerva.mail-host-address-is-not-set>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Fri, Jun 21, 2024 at 05:42:53PM +0200, Javier Martinez Canillas wrote:
> Javier Martinez Canillas <javierm@redhat.com> writes:
> 
> > Jocelyn Falempe <jfalempe@redhat.com> writes:
> >
> > Hello Jocelyn, thanks for your feedback!
> >
> >> On 21/06/2024 00:22, Javier Martinez Canillas wrote:
> >>> Add support for the drm_panic infrastructure, which allows to display
> >>> a user friendly message on the screen when a Linux kernel panic occurs.
> >>> 
> >>> The display controller doesn't scanout the framebuffer, but instead the
> >>> pixels are sent to the device using a transport bus. For this reason, a
> >>> .panic_flush handler is needed to flush the panic image to the display.
> >>
> >> Thanks for this patch, that's really cool that drm_panic can work on 
> >> this device too.
> >>
> >
> > Indeed, that's why I did it. Just to see if it could work :)
> >
> > [...]
> >
> >>> +static void ssd130x_primary_plane_helper_panic_flush(struct drm_plane *plane)
> >>> +{
> >>> +	struct drm_plane_state *plane_state = plane->state;
> >>> +	struct ssd130x_plane_state *ssd130x_plane_state = to_ssd130x_plane_state(plane_state);
> >>> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
> >>> +	struct drm_crtc *crtc = plane_state->crtc;
> >>> +	struct ssd130x_crtc_state *ssd130x_crtc_state = to_ssd130x_crtc_state(crtc->state);
> >>> +
> >>> +	ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &plane_state->dst,
> >>> +			     ssd130x_plane_state->buffer, ssd130x_crtc_state->data_array,
> >>> +			     &shadow_plane_state->fmtcnv_state);
> >>
> >> ssd130x_fb_blit_rect() will call regmap->write(), which involve mutex 
> >> and might sleep. And if the mutex is taken when the panic occurs, it 
> >> might deadlock the panic handling.
> >
> > That's a good point and I something haven't considered...
> >
> >> One solution would be to configure the regmap with config->fast_io and 
> >> config->use_raw_spinlock, and check that the lock is available with 
> >> try_lock(map->raw_spin_lock)
> >> But that means it will waste cpu cycle with busy waiting for normal 
> >> operation, which is not good.
> >>
> >
> > Yeah, I would prefer to not change the driver for normal operation.
> >
> 
> Another option, that I believe makes more sense, is to just disable the
> regmap locking (using struct regmap_config.disable_locking field [0]).
> 
> Since this regmap is not shared with other drivers and so any concurrent
> access should already be prevented by the DRM core locking scheme.
> 
> Is my understanding correct?

Quick irc discussion summary: Since these are panels that sit on i2c/spi
buses, you need to put the raw spinlock panic locking into these
subsystems. Which is going to be extreme amounts of fun, becuase:

- You need to protect innermost register access with a raw spinlock, but
  enough so that every access is still consistent.

- You need separate panic paths which avoid all the existing subsystem
  locking (i2c/spi have userspace apis, so they need mutexes) and only
  rely on the caller having done the raw spinlock trylocking.

- Bonus points: Who even owns that raw spinlock ...

I'm afraid, this is going to be a tough nut to crack :-/

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
