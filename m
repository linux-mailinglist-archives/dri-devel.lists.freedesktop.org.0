Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123C8958BE2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 18:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD8B10E42A;
	Tue, 20 Aug 2024 16:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z8hZWgrc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12DB10E448
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 16:03:49 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53346132365so537299e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724169827; x=1724774627; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EelLEAshHFEbe/ENFdi4xWbWs41G/vbuSzZK/f4xSrE=;
 b=Z8hZWgrc8WHcv2MW40eNDm8rjXLy8KswlCo25lydYRPZRdzfrH0RMl09jfaIDPUIiU
 9/arfkTvsdRMYp9HRav/wMoOFw9tA1icIASFOZr3OzDSjtrYgCyryUkolgYlsuVuHYSf
 hcQQ6rZhAV8RBG7f/raLi3eLuiHDJ9ckC5FPPgcagaCC+5DH4mcuF2n5OY30fTQDaPIi
 5tPwFM+BrjfUPKm4flw+VmdyD9b5p6cLQs9pJRfr4GdMr0CW/0ftyxk7nsvw7xopPoua
 cplasSGswOjfGQjYkml6m0hq7PztGWOB8zOhIaJHh+r6LKnEHSlzIU7Jh+QoaUAxfhud
 bcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724169827; x=1724774627;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EelLEAshHFEbe/ENFdi4xWbWs41G/vbuSzZK/f4xSrE=;
 b=PZnH0rhiCQ9lUuNpWT1tUOvKjxOrDaspho8Oa+zm9Jey9uNqQ+j1npL3uNbOahInMS
 BEituXXyVHYXUkiqFlkAt3FIRvSb4boeB9cyGw+tA3q7qztDgeACwpafwrE1Sf12k/HY
 1ryVzgPTOsgIkWOsM0Be4BO+JhkiwO3TsTcI6QfF/MdjjHYVSokzK5duiDst2bEF5s69
 CoJgQIxqlq//q/nu3bYH4+CMM2eon+X3VIna7/fBlECndtX4WPf8J1amiVWrKUvKF52/
 SWjnbSnbOQZUP+ZScfGr6xBTuzOrZLNR+Tc6xvuoXzSr8S0yBkDv6ZtnsSf0zcdHRhXI
 AvRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu1ln78984SYiW4uS2JsQCQJHsJ4EvYEh4Dzmw0TwaorQQnAJRz6CpGgGcBn/TFfaJtRhgmRT+meU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAYWry7ltv34453fjjzaP8vBaqFcP0GPo+5vu4CVpH70gHSOXu
 Z8ZHQIVNNMxIY1R/KuuudjXczHNcgNu+KofyogjinGiHWeFnmDTh
X-Google-Smtp-Source: AGHT+IH0VkhNqgO4I1oP7RJepzs4REpjlCOgLICe9cxVNyNkQp9rp0USBqmqhAbCuyYTI8ztrYEigQ==
X-Received: by 2002:a05:6512:e84:b0:530:b7ef:9f6a with SMTP id
 2adb3069b0e04-5331c6b450fmr8529783e87.36.1724169826818; 
 Tue, 20 Aug 2024 09:03:46 -0700 (PDT)
Received: from fedora ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded720eesm200311985e9.33.2024.08.20.09.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 09:03:45 -0700 (PDT)
Date: Tue, 20 Aug 2024 18:03:43 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 louis.chauvet@bootlin.com
Subject: Re: [RFC PATCH 00/17] VKMS: Add configfs support
Message-ID: <ZsS-X_ANCKfqHtAY@fedora>
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
 <CAPj87rP0HZzdVoH18O6gVe1n8cHjhNn2LFSAAVvqj5m6tN2y_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPj87rP0HZzdVoH18O6gVe1n8cHjhNn2LFSAAVvqj5m6tN2y_w@mail.gmail.com>
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

Hi Daniel,

Thanks a lot for looking into this.
On Wed, Aug 14, 2024 at 10:10:39AM +0100, Daniel Stone wrote:
> Hi José,
> 
> On Tue, 13 Aug 2024 at 11:51, José Expósito <jose.exposito89@gmail.com> wrote:
> >  - When a CRTC is added and removed before device creation, there
> >    is a vblank warning.
> >    The issue is caused because vblanks are referenced using the
> >    CRTC index but, because one of the CRTCs is removed, the
> >    indices are not consecutives and drm_crtc_vblank_crtc() tries to
> >    access and invalid index
> >    I'm not sure if CRTC's indices *must* start at 0 and be
> >    consecutives or if this is a bug in the drm_crtc_vblank_crtc()
> >    implementation.
> 
> CRTCs and planes are not hotpluggable. I recommend you just create a
> lot of each of them statically at startup, and hotplug only
> connectors.

Yes, it is an issue creating them before the device is active. Once the VKMS
device is active, it is not possible to delete them.

Because of how the CRTC index is handled, it is possible create 3 CRTCs
(indices 0, 1 and 2), delete the second one and end up with 2 CRTCs: The
first one with index 0 and the second one with index 2.

This is handled nicelly in the possible_crtcs bitmask, but drm_crtc_vblank_crtc()
tries to access index 2 of an array of size 2.

This case is not possible with actual HW, so I need to fix it on the VKMS
side and make indices start at 0 and be consecutive.
A check on the drm_crtc_vblank_crtc() side won't hurt us though.

For extra context, see Louis message on the topic. It looks like
we are having similar issues:
https://lore.kernel.org/dri-devel/ZsS7x2y_HKgqGUFR@fedora/T/#mccf9a9748ae67a07a7e6ad694c42afc2ccd3c7f1

Best wishes,
Jose
 
> Cheers,
> Daniel
