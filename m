Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3533F84B8BF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 16:03:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D242E10EE78;
	Tue,  6 Feb 2024 15:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Hyb7UQHf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C0610E6EB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 15:03:40 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-33b30fc475eso105621f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 07:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1707231819; x=1707836619; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RKfohJUroV976tglmTRMxraev0qNxAZBgWfmujjqUq4=;
 b=Hyb7UQHffKbyJFkiG4TM8IZsTUmxFtznzDztLLlxlofnLRJVBVVRfpusDQPQja2C/n
 plWLowBQzcTX1t5RVP80yCqYFIHAAD58LoGgXYMJvbloa+AZuTK9QDXjTF/Yd4Y+juBo
 UiieygL1tvplN2HafyHyx0uT1428R+USD2MfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707231819; x=1707836619;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RKfohJUroV976tglmTRMxraev0qNxAZBgWfmujjqUq4=;
 b=bCMeR7dLKw46uO5cyTYat/bPQjMewcJ14PqRogmdBgCi7GFhZbnCzFL0TzeBISnCIP
 p8ZSjsNn7zNuDulwn7b5a3cx5QxXdQrchaPCvjOJgRXPP8wRBT5A4+GqUBviOHqSs1U5
 gvw+AUEIaYlDfoS7mrkiGlg5ply6+AE4+db+p1+tmHdPlffUXdF+bAAA36EZEBnfD2GL
 S3G7kuNMgxrk14cL6NaQCB2gH/cldAtPj0KwcDP4DV/pj5+RK7+jxEsKYKSLJnK2gNEz
 9MDeVJWRxaddXHVNDd6+URpuyJrnoybIYQdSAsaYhfX2biE+kHp7tbPQf4Swr/wILKq4
 43VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVExNto4jLL7zj2f1DxOufJtN8UBg+QjZBNcAVedJN3Q7EAd+f9xgNYg9TclkekQ+akVN6A0cLw+CggQZiaLrPvClKUr8R02VICxeMHaVW7
X-Gm-Message-State: AOJu0YzpDE1D6S0HMuQhitnLWfZXTAg4lxyGtA4vD5u7uQdSFR15Y9lb
 4cgZ70S+d0PzdGhsv1UBXVeFux/nTDfOyENgFPMZ4hvfNPO5K6UQ2iXCorYhd3M=
X-Google-Smtp-Source: AGHT+IET7mjYFC9IH5aIFSvUtIwuTpQ4KqBl4fIzq/2q8Y3bCp52T9n2MyZNeBpz2yX0aOfURAq+VA==
X-Received: by 2002:a05:6000:12c3:b0:33b:39bd:a78b with SMTP id
 l3-20020a05600012c300b0033b39bda78bmr1961940wrx.6.1707231818921; 
 Tue, 06 Feb 2024 07:03:38 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWCm44wgTJzNGFJ6SWGW0pCEdc2rUx6nCHTz84pimuYdcQlXPfUYwsXtTv9S+iTBRUO59hmDPFshqy//WnXns0sD4WysblA2zD6gFzOImvirbSSgET/2ijRXh+XnvCNfGAqiGOgBk2TBfq3zAaLjpZ873p6v/WZ+PSivDj5nfzfuTphZ5LjW+L1wOJ84jNhzRDWgEzov4oJcNBMJUxK/UaMI/ROE4HZjpn1xgffol987k0TuU6JWzNTVC37oLpvEI21cB78xnwAqM8KXmn7vI8/lsR/X4ljBXwQ1WerTbEvj4G7ljjS/P4M/ukb1IvSWzi+wOkPNSXxIo0=
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a5d6dad000000b0033b1b01e4fcsm2336097wrs.96.2024.02.06.07.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 07:03:38 -0800 (PST)
Date: Tue, 6 Feb 2024 16:03:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "Ricardo B. Marliere" <ricardo@marliere.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] drm: display: make dp_aux_bus_type const
Message-ID: <ZcJKSCbAwm7SYx4v@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Ricardo B. Marliere" <ricardo@marliere.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240203-bus_cleanup-gpu-v1-0-1b6ecdb5f941@marliere.net>
 <20240203-bus_cleanup-gpu-v1-1-1b6ecdb5f941@marliere.net>
 <CAA8EJpqYH3CM8exv68S7KU-CK5r=jM81UPjiW09qOiqrg1ThKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqYH3CM8exv68S7KU-CK5r=jM81UPjiW09qOiqrg1ThKg@mail.gmail.com>
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

On Sun, Feb 04, 2024 at 10:24:46AM +0100, Dmitry Baryshkov wrote:
> On Sat, 3 Feb 2024 at 22:20, Ricardo B. Marliere <ricardo@marliere.net> wrote:
> >
> > Now that the driver core can properly handle constant struct bus_type,
> > move the dp_aux_bus_type variable to be a constant structure as well,
> > placing it into read-only memory which can not be modified at runtime.
> >
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Just to make sure this doesn't fall through cracks, I'm assuming you'll
push this to drm-misc-next too, right?
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
