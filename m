Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6771CC98A98
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 19:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A914610E3B7;
	Mon,  1 Dec 2025 18:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Nw71jeAH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA8C10E3B7
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 18:10:21 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-640aa1445c3so6956603a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 10:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1764612615; x=1765217415;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fSAcsh/jLvy3jVAdeyxQi+guKPEheOPvD2BWq9t337E=;
 b=Nw71jeAHO4dsmlPqXYh9iRF20oJuo2Uz1G7AArP7aZUtehU2omikqyuyYroLHZos2B
 LKKkaYrRM3tNZyvMOeZzwcorwhfWK5eH//EwZEDVUG+2NevnB09nAY8xq2pkQqZQNwmR
 /rz3FrUnC44+AfM5a1QPyxxFqh2YHMmTJYjCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764612615; x=1765217415;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fSAcsh/jLvy3jVAdeyxQi+guKPEheOPvD2BWq9t337E=;
 b=WiCDEAfA5w9CSVI+OzOnaEhBRJ83owBVIy4Qr9DdlX/2RqfauIVp4/yHXc5ZGrGg7D
 YrKSjg+hqbQmCcIUUQMPpEXGTd5Jl8RS4zufaYmrFqp7n7VR8uZeaf8z3Q54dZKYm8hI
 Lk/36OHbGLn/kDUH8+syGNS05ByyVJw0KJUZm2X21zOC5lMcP982RCkubGO3bls+yT+h
 uu8+UY1Kf2C69cgdOo4FyI4gyEySxPeIpvZLNEiahC7Ocj3b4pZbcvV4p5Lz0tUc6mJA
 X84v36Wrq9vz13XMX5r3tSOxwku+qo/18ayjo+kTZj3AB/5oPwG4BbV1tKNrZUfSDIbg
 dIXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0zcED5hnnI1vy5HB2BZos43H7IT5TPxFVBlkyszjDZxR0SkIKgJsTO5MksYsJuulOx5ByXiEnUEI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZt8u8Sp62lRFm7CwDKs3GcQxFwHaIEo5HHE+RNHNTZAizvQ6X
 v3O8nyu/vaAdN3T/7El77F5V1Ph6Ysmh3uPhjd5ZO4QiqshBLGzBHrYdXaQLRqFxKG2NqRjUMpp
 FIS3vArea
X-Gm-Gg: ASbGncsZ2SaR9Fcb+pWdOhs8rIbuzfsLNPc6JuJcCHfs+1KNNbY6eNZGSIrq+zsTsVO
 sXNXJ8xcKkcD6z0aoJdj4FoN0uIz4Z50xpUR38HFNTf/enkKys2K4FrpW42bCpmU4GkVzf8kisu
 nsGF6b5Yq3sY8zD31DS45pM4ipdDEAgqxxyEvsuI5Az482rbA7hM6tujcc+bVNKOSE5dNrabEeI
 Dtg9MT074TBIy7Eei6jDJwqRMXeifWxl7xSCfVuviaogOVxjGvnPg2TigEM7MU5cgfKpFOLJChP
 Ea2iE/gc/pwHVWYM5p2GdkgcGm9fGe1CyuIeQsZZujGMjiDX9N2PQlV11ZI9L0mZxZ+CXFhypCX
 BqpgiCC0JshMyOWL6KdArJG19hla2VR+GBUSbeK+UWL0gDO2loptVNe0TdgouUS+pSRbdmCL2Qn
 zSeL32AZ+RqoWb4Vu9OK+95dff66NPWhwA690WjnC9LAYzYAjVhg==
X-Google-Smtp-Source: AGHT+IHDbsw9M2y7msJfJgyr1Rae1eMmMxH7StGPqBi8l6SYzIwO1xb0/2XAXzGc/K7MV/9eEKnouA==
X-Received: by 2002:a05:6402:3550:b0:63c:1073:4a69 with SMTP id
 4fb4d7f45d1cf-64555d2aebamr33193220a12.34.1764612615233; 
 Mon, 01 Dec 2025 10:10:15 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647510615c0sm13336772a12.30.2025.12.01.10.10.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 10:10:14 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so45530175e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 10:10:13 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVcy1Xhh3C5DBedWMyK0tVdkVs9+SBAHr1DybEBHVVNoWdZ4f+pBSR0NOnKYPtrNnx8Zy2fh3IM1Fs=@lists.freedesktop.org
X-Received: by 2002:a05:600c:3ba1:b0:475:dd89:acb with SMTP id
 5b1f17b1804b1-477c11160cdmr415396085e9.22.1764612612856; Mon, 01 Dec 2025
 10:10:12 -0800 (PST)
MIME-Version: 1.0
References: <20251125090546.137193-1-kory.maincent@bootlin.com>
In-Reply-To: <20251125090546.137193-1-kory.maincent@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Dec 2025 10:10:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WikKrpLKvaxD22H0s3XHeG=WUiRrLJ0eQMM2pqvXJhuw@mail.gmail.com>
X-Gm-Features: AWmQ_bmsv9J5UlggLGP1aiEVtrV6kayziPzbKKyqQbq8EQwvWpJS3SIXk8v0J68
Message-ID: <CAD=FV=WikKrpLKvaxD22H0s3XHeG=WUiRrLJ0eQMM2pqvXJhuw@mail.gmail.com>
Subject: Re: [PATCH v4] drm/tilcdc: Fix removal actions in case of failed probe
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bajjuri Praneeth <praneeth@ti.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, stable@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Tue, Nov 25, 2025 at 1:06=E2=80=AFAM Kory Maincent <kory.maincent@bootli=
n.com> wrote:
>
> From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
>
> The drm_kms_helper_poll_fini() and drm_atomic_helper_shutdown() helpers
> should only be called when the device has been successfully registered.
> Currently, these functions are called unconditionally in tilcdc_fini(),
> which causes warnings during probe deferral scenarios.
>
> [    7.972317] WARNING: CPU: 0 PID: 23 at drivers/gpu/drm/drm_atomic_stat=
e_helper.c:175 drm_atomic_helper_crtc_duplicate_state+0x60/0x68
> ...
> [    8.005820]  drm_atomic_helper_crtc_duplicate_state from drm_atomic_ge=
t_crtc_state+0x68/0x108
> [    8.005858]  drm_atomic_get_crtc_state from drm_atomic_helper_disable_=
all+0x90/0x1c8
> [    8.005885]  drm_atomic_helper_disable_all from drm_atomic_helper_shut=
down+0x90/0x144
> [    8.005911]  drm_atomic_helper_shutdown from tilcdc_fini+0x68/0xf8 [ti=
lcdc]
> [    8.005957]  tilcdc_fini [tilcdc] from tilcdc_pdev_probe+0xb0/0x6d4 [t=
ilcdc]
>
> Fix this by rewriting the failed probe cleanup path using the standard
> goto error handling pattern, which ensures that cleanup functions are
> only called on successfully initialized resources. Additionally, remove
> the now-unnecessary is_registered flag.
>
> Cc: stable@vger.kernel.org
> Fixes: 3c4babae3c4a ("drm: Call drm_atomic_helper_shutdown() at shutdown/=
remove time for misc drivers")
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
>
> I'm working on removing the usage of deprecated functions as well as
> general improvements to this driver, but it will take some time so for
> now this is a simple fix to a functional bug.
>
> Change in v4:
> - Fix an unused label warning reported by the kernel test robot.
>
> Change in v3:
> - Rewrite the failed probe clean up path using goto
> - Remove the is_registered flag
>
> Change in v2:
> - Add missing cc: stable tag
> - Add Swamil reviewed-by
> ---
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c |  2 +-
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c  | 53 ++++++++++++++++++----------
>  drivers/gpu/drm/tilcdc/tilcdc_drv.h  |  2 +-
>  3 files changed, 37 insertions(+), 20 deletions(-)

Seems reasonable to me. I did a once-over and based on code inspection
it looks like things are being reversed properly. I agree this should
probably land to fix the regression while waiting for a bigger
cleanup.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

This fixup has been sitting out there for a while. Who is the right
person to apply it? If nobody else does and there are no objections, I
can apply it to "fixes" next week...

-Doug
