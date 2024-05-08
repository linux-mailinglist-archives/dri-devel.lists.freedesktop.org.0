Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AECEF8BF896
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 10:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACFC10F426;
	Wed,  8 May 2024 08:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="NChc1rBB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE1210F426
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 08:33:33 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-51f22405c0bso702135e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 01:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715157211; x=1715762011; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6y4EwFqVETg6O9C1VDyvCbQ1UYKFlViM3dNLmDxh+rE=;
 b=NChc1rBBhO9JEJE+GRPY0vEcnJi1rn+jt6rBkAhBWuMwai1MUEZHgG6zIHMa6KeJvM
 s0XQmgKh4W8OuVqABzuqNV4bUvl0w5SpOKt5GKC0J0NPUdnklKD2JVsC3EwOBAcxJkAy
 ovKUwtQJl4x74dy0IqpMfx+z0cT5A1O8dZPZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715157211; x=1715762011;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6y4EwFqVETg6O9C1VDyvCbQ1UYKFlViM3dNLmDxh+rE=;
 b=rCNBCiMu18mhLf8EiPwK0alFN800nHKtAU2EugEtppEI9hYfLgHdTgAr0Xkl/bhIvK
 tejcFYXLae+407hceHa5vEsBcFuuXr/+Ts0nqQB+kKHctDrosF7ZGmRw19y+u/A4S76E
 Kzb8xoGoRkeQsb/E9aYd8mM1S2iSTe2ZHpWK1BZhHo7PFqloTcAm8y3iy7BooGsnVPsB
 N3pfDFkxKMrhWr69/2aRztExNaBG/09q+j7l/8FFPW97Zl+v+ulPdF+IdUuZYdpIQ8i1
 gPvIuIJ+xK4061XVCdvmh7U3Sy0bcFCDrJoUv0kpQeRg8hpEOfFQWhU2TWlIphZUhyvY
 O5Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlqu3lQLIQ1gNo7hBvgyD0S2LMV19LUSB5tVwHV0uMUk5WuVzQkAF+uoF8yiwnXU9J5qpC0g0Jq4Y5b0v3JFekmTP5/tk1N5ViXIE6tDKh
X-Gm-Message-State: AOJu0Ywz9O2IpEpia2mjfPx+j8PFC/4pZ4/VzusMjA+EFIxQXSH8IEtq
 tV1JsUeciJzIB27e0aFihNQ/YvuiWcgdH57+nmgaKPlKwNhFRQOKPOGKzHNoXoE=
X-Google-Smtp-Source: AGHT+IE8WloieXoBNrz84YwZxVbzeE/8sdLkgTaGX4kiUy5piDKudNOJ6ss5nr4szNlRJ4Cd4qE+HQ==
X-Received: by 2002:ac2:499c:0:b0:51e:ee83:bb8b with SMTP id
 2adb3069b0e04-5217d242e7bmr1063993e87.5.1715157211274; 
 Wed, 08 May 2024 01:33:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a056402248b00b005726b83071esm7424373eda.4.2024.05.08.01.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 01:33:30 -0700 (PDT)
Date: Wed, 8 May 2024 10:33:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Milan Zamazal <mzamazal@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <Zjs42PGvilLlF0Cg@phenom.ffwll.local>
Mail-Followup-To: Daniel Stone <daniel@fooishbar.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <mripard@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Milan Zamazal <mzamazal@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat>
 <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
 <cbe5a743-d8be-4b0e-99c4-e804fbadc099@redhat.com>
 <ZjoNTw-TkPnnWLTG@phenom.ffwll.local>
 <CAPj87rN3uSZoHpWLSQqz1SW9YMZNj9fkoA_EDEE_bzv-Tw8tSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rN3uSZoHpWLSQqz1SW9YMZNj9fkoA_EDEE_bzv-Tw8tSw@mail.gmail.com>
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

On Wed, May 08, 2024 at 06:46:53AM +0100, Daniel Stone wrote:
> Hi,
> 
> On Tue, 7 May 2024 at 12:15, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Mon, May 06, 2024 at 04:01:42PM +0200, Hans de Goede wrote:
> > > On 5/6/24 3:38 PM, Daniel Vetter wrote:
> > > I agree that bad applications are an issue, but not for the flathub / snaps
> > > case. Flatpacks / snaps run sandboxed and don't have access to a full /dev
> > > so those should not be able to open /dev/dma_heap/* independent of
> > > the ACLs on /dev/dma_heap/*. The plan is for cameras using the
> > > libcamera software ISP to always be accessed through pipewire and
> > > the camera portal, so in this case pipewere is taking the place of
> > > the compositor in your kms vs render node example.
> >
> > Yeah essentially if you clarify to "set the permissions such that pipewire
> > can do allocations", then I think that makes sense. And is at the same
> > level as e.g. drm kms giving compsitors (but _only_ compositors) special
> > access rights.
> 
> That would have the unfortunate side effect of making sandboxed apps
> less efficient on some platforms, since they wouldn't be able to do
> direct scanout anymore ...

I was assuming that everyone goes through pipewire, and ideally that is
the only one that can even get at these special chardev.

If pipewire is only for sandboxed apps then yeah this aint great :-/
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
