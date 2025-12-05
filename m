Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CD2CA95E1
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 22:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435EF10EBB5;
	Fri,  5 Dec 2025 21:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="abg6s6cN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F03010EBB5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 21:16:57 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-787e7aa1631so44008167b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 13:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764969416; x=1765574216; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ipQKFbdk2/YvFD6ldsdc70zo2TgK7rzf/SOR0UIrZk=;
 b=abg6s6cNaO3JLMeTn/y7JqgoBGcixqGej5jdTmTMkEjKK4aEwOE3kwKaSaJPlJd1Nf
 hjeTgsL6csy3+bSau1Z1Cojb/t0OCI4fF9is83jmNPIwR07ovacORoxG+TtMAjoKmtKN
 wiszZKf/ChSObvC883lIJ9znLyC3wSA8Iz+zxZQgjNcRpxG3vpWDMvRwAOPza80DMEFe
 /mEH0kQDSaqKmy8NcDHwc7t3dVbIY1nm4RtbDhHKf2HE/X7HJnkXQQi4vqSefra1CCos
 7L7E7iSsKk5U3IN9YBhowga+onbRh+OvWGqqU5Kwsyy19a3hYDiE53sWW8BqLQoOL/x7
 pIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764969416; x=1765574216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9ipQKFbdk2/YvFD6ldsdc70zo2TgK7rzf/SOR0UIrZk=;
 b=MUS5o6JEGlhb1M0imfh2OFjrmyJw0MSw6o/zbFLQ7ApdT1DnmwUpCv6dfDgrmHvsqo
 sCnQZ3r8TQwV3QFMDrCO8Wlb9wXQ7u0f1kT3leVNV47jW/y2pvIdxkKEom0BUSHAm91F
 3zkeJbaIAGhQtiUMyjoJprXsZTAjzLGkqL5b/+ORstU3vCHQVrCSiR+m77TT7qegK04h
 DlzKkYNIIuLF4vN0mcqqYDJ24BmECUJtINCHnCDxDZVXzaKNUZ+INFi4PBQQal5bgSgD
 VF5bBGy31dFaV+ndA8cXu5Pz/jGBSW8SN/GvI9Q7h7ZtppugL4sAj3d6GKLZJ0RzsTHr
 Cb/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGE40XEWRJ5l+IIFkGuZL/oceXpoa8E9C0gS6MCv1Gh2ppHRz8F0DD9Khyxbpmi6+VGpMvlMap9Fk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWJ6YsteXxy97Kvz/Wagz0mmQ5l6IA0mR6IygEtfOjKpIOeLsy
 LroIHfuD2LpItRi+G7hklvg3IM0WTILQIxJNep+KfTb3lHnpS4s4PV8d7ozrZDgsEn3fU9YkLJ7
 mxfoETKRWBo6hb4AKwlIrQwxQct6nVa8=
X-Gm-Gg: ASbGncuyiSVBTEB+8Uz6pXHVY6uL4KyQnY8r4rwjVhIAYD4m+XF8IBbrEO4R2U7nBKs
 dq432cIzSB8IosO7SGqslYJo8vEm5fWAYi3JxSvp6ritpTX3ePKmZiRTu3xsPtnuBGDaYzhBajy
 +w8iWQmtmhLOcSQqxaYjW9AGtEUsoyKFrm07XYQNX12e3YlpM45bsinH/Qy08GpO+vxEvfhCqxt
 8SedRYB2VKSXSyclNP3qauUSbUugi0gcrKZX1h4+V4Ilr55MnkdROUhDw4gK7SbAScUwLS+R2oG
 I+P5gJ6MrEk1uZwJPlCoUQGXLxoI
X-Google-Smtp-Source: AGHT+IHW8eSfZUtjZw0Xb89onCukrdZvI9LzO4Gk+juUMuJyejPEDI2qn6QXa/CqpRGMK+nxxegmLRXPHosEr0FhO/M=
X-Received: by 2002:a05:690c:d96:b0:787:fa8f:bec2 with SMTP id
 00721157ae682-78c171ab39bmr82216587b3.12.1764969416027; Fri, 05 Dec 2025
 13:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20251203-panthor-tracepoints-v1-0-871c8917e084@collabora.com>
 <20251203-panthor-tracepoints-v1-1-871c8917e084@collabora.com>
 <CAPaKu7R_PJPD3s6wvuduGHDFCy+AE+Hd+p1cS+ZSu_tTgE2txQ@mail.gmail.com>
 <15112867.uLZWGnKmhe@workhorse>
In-Reply-To: <15112867.uLZWGnKmhe@workhorse>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 5 Dec 2025 13:16:44 -0800
X-Gm-Features: AQt7F2rkTR5CRJIRd0S-uzu_rbn4pgFGU3sfR9DgUCPQbXuqeCJ3S3cmVovyjsQ
Message-ID: <CAPaKu7SQP9jYmq5UCA98_YmO50st6ChBjYNjYNON7-YAWozzaQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panthor: Add tracepoint for hardware utilisation
 changes
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Fri, Dec 5, 2025 at 2:48=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Thursday, 4 December 2025 21:21:08 Central European Standard Time Chia=
-I Wu wrote:
> > On Wed, Dec 3, 2025 at 6:04=E2=80=AFAM Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> > >
> > > Mali GPUs have three registers that indicate which parts of the hardw=
are
> > > are powered and active at any moment. These take the form of bitmaps.=
 In
> > > the case of SHADER_PWRACTIVE for example, a high bit indicates that t=
he
> > > shader core corresponding to that bit index is active. These bitmaps
> > > aren't solely contiguous bits, as it's common to have holes in the
> > > sequence of shader core indices, and the actual set of which cores ar=
e
> > > present is defined by the "shader present" register.
> > >
> > > When the GPU finishes a power state transition, it fires a
> > > GPU_IRQ_POWER_CHANGED_ALL interrupt. After such an interrupt is
> > > received, the PWRACTIVE registers will likely contain interesting new
> > > information.
> > I am seeing
> >
> >    irq/342-panthor-412     [000] .....   934.526754: gpu_power_active:
> > shader_bitmap=3D0x0 tiler_bitmap=3D0x0 l2_bitmap=3D0x0
> >    irq/342-panthor-412     [000] .....   936.640356: gpu_power_active:
> > shader_bitmap=3D0x0 tiler_bitmap=3D0x0 l2_bitmap=3D0x0
> >
> > on a gpu-bound test. It does not look like collecting samples on
> > GPU_IRQ_POWER_CHANGED_ALL gives too much info.
>
> On what GPU and SoC is that? If it's MT8196 then I wouldn't be
> surprised if it just broke that hardware register, considering
> what it did to the SHADER_PRESENT register.
Indeed I was on mt8196.
>
> On RK3588 (v10), GPU_IRQ_POWER_CHANGED_ALL reliably fires when
> there is new information available in those registers. I haven't
> tried on MT8196 (v13) yet because that still doesn't boot with
> mainline so testing anything is a pain.
>
> I don't have any v12 or v11 hardware to test with. From what I
> understand, there's no open enough platform to do v11 testing on,
> just the Pixel 8 and Pixel 9. I could look into the Cix SoC for v12
> though some day, but I don't own one at the moment.
>
> >
> > I think they are more useful to be collected periodically, such that
> > we know that in the past X seconds, Y out of a total of Z samples
> > indicates activities. That's best done in userspace, and panthor's
> > role should be to provide an uapi such as
> > https://lore.kernel.org/all/cover.1743517880.git.lukas.zapolskas@arm.co=
m/.
>
> This wouldn't give you information on the time a power transition has
> completed, which is one of the motivations. A periodically collected
> PWRACTIVE would just be roughly correlated to how busy the GPU is,
> which isn't very useful additional information as the performance
> counters themselves are likely a better source of that kind of info.
{SHADER,TILER,L2}_READY might be more appropriate if you want to trace
power transitions?

>
> What I need to do is restrict this to <=3D v13 in the next revision
> however, because v14 reworks this stuff.
>
> Kind regards,
> Nicolas Frattaroli
>
>
