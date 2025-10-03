Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E079BB5B02
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 02:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E81410E025;
	Fri,  3 Oct 2025 00:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f6ameiC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CF510E025
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 00:53:46 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-77f94aa7d42so4337377b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 17:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759452825; x=1760057625; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TIjyu4CrKVxFW8+yt9bV88mlzHIu8EXyBfp0u4n9wkI=;
 b=f6ameiC3ohts39U3V0STa1AfUq6avNBebXWqrWfCafFzgxJ8y+bY+mozGIX8WQUKfq
 YCp7k25irTkTYwaAfxwZcbm8ZvDsMlwRDz+CW0EM385MMUDsQyN2DcaoEcvqqODXdzvk
 wFd6oDbxWnxSAln8cGm++CsX9m2K+y0kreFsmP8OC3IqFP2nW+SuLYBYJjnLsIp1EhFe
 kZlj4GmknKK5ncp0zmaJlNpNDg7j6rmrRUK1NSmWfS8pl1ynlEy6iEUtBA6A+UB9y0NR
 ICcWgSzaeHJxg4B+6E0K/m04aEVCnQpfV6GO4AsZAOsMSSD+YVOHgZXrzs8WGjOhOqaq
 5j0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759452825; x=1760057625;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TIjyu4CrKVxFW8+yt9bV88mlzHIu8EXyBfp0u4n9wkI=;
 b=QnmrRayKkx3g6+u/sS7RAkogM3FOSnnDbU3/tS0dsH8V7YO+ovDHcfo6cLgUcNnyXw
 nM2QRbAZryyYunYgBc7Q1l80RLw6zx7024i6vx0dKZwHOiyv59OmbOoBWZSatl7cXS5Q
 sn1/cjSwzE22NkHIJseWS1PUapaNYyBOgselihdo4aP9E9E6alEd0VlPDagBelpNWozt
 moU+Q6/qECeRHjsWbO3D05q+xugJfmA2iFw1R1Bi0vtweZgHvrbYSW2TDVB46UmI+rF+
 GNUDIz7MnHJN1GXtUW/6Mg9F6RlNbkwBCiAgD3XpIwWaV3Zy3yRo5atDqvzwEfCi8v0T
 J3qQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI0QJgph16sHm59drQBfR1RvPSuwKMOgxX+LKwaaWoIzWPR3TWKp+czpne2t/VDEkzP8HVxfC0W/0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgYpMWbgrZ5n0y7DZ+mZFm0P/ier9/Fnnlkuu5d+MsTfT2+dQE
 z9di/y/3X5WyLdAHhZTQXrraMeFIJYPFLGXqeLjZ1RL3XM+H4c+zucyDFd0x4sXhkbhu/p0NOFk
 4ds6n2qSovDBJEhcxdTL3ZMlGdFHxwvm8f2mc
X-Gm-Gg: ASbGnctJ7mNnVhrTSPW1bCVLKpIKqd+AIwz3tSrsE8WOIuJWFJjMa586j95cxJ5TDLA
 uep1KvSK4N9mDZOjRaYV82vNPnmYqRBFQt5mB0568QBA/Kyf4GfPflK/ZY0ui4/UdIegpILbwfj
 GP/e+T0Ia/6BAuKHS5Oqaa4Aa64z7tm9gMxZqj/SqrmOrXTxs5ekgQheYzDZEN0K4YWhBOlin31
 Ewrb4kYHX+QxhrEeKA54A4Vu86lXI+ukxYeHxQxXQS41w1YQZPfnR8PmxKpQcrTXpVmnRA8aUxV
 uPWYgl1pX4R72rlFHCPL
X-Google-Smtp-Source: AGHT+IHdqvyiXZIG2OFdfIS5se4cN2dqc9rVIfSmO3bgaMv9f7oUgu2QkiOcy9N9WlxLlxEKZMv7ZFtncLqKJpUd6es=
X-Received: by 2002:a53:d151:0:b0:636:d3c3:67e2 with SMTP id
 956f58d0204a3-63b9a07cb33mr1112628d50.21.1759452825478; Thu, 02 Oct 2025
 17:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250916200751.3999354-1-olvaffe@gmail.com>
 <cf530254-b5f2-44b6-b49e-9144898d75a7@arm.com>
In-Reply-To: <cf530254-b5f2-44b6-b49e-9144898d75a7@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 2 Oct 2025 17:53:34 -0700
X-Gm-Features: AS18NWAMUQsGVX85ALNwXjhcZfVyXxJqw58XEv-fAwlcGZnD9yFUHyWgXLbTPQA
Message-ID: <CAPaKu7RK2dW4LYbCj7ksbNJVst+Yn5aetKhJG0N=EyTY8BhYfw@mail.gmail.com>
Subject: Re: [PATCH] drm/panthor: add query for calibrated timstamp info
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 marcin.slusarz@arm.com
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

On Fri, Sep 26, 2025 at 3:41=E2=80=AFAM Lukas Zapolskas <lukas.zapolskas@ar=
m.com> wrote:
>
> Hello Chia-I,
>
[...]
> > +     switch (out->cpu_clockid) {
> > +     case CLOCK_MONOTONIC:
> > +             cpu_timestamp =3D ktime_get_ns;
> > +             break;
> > +     case CLOCK_MONOTONIC_RAW:
> > +             cpu_timestamp =3D ktime_get_raw_ns;
> > +             break;
> > +     case CLOCK_REALTIME:
> > +             cpu_timestamp =3D ktime_get_real_ns;
> > +             break;
> > +     case CLOCK_BOOTTIME:
> > +             cpu_timestamp =3D ktime_get_boottime_ns;
> > +             break;
> > +     case CLOCK_TAI:
> > +             cpu_timestamp =3D ktime_get_clocktai_ns;
> > +             break;
>
> Out of interest, what is the use-case for the REALTIME, BOOTTIME and TAI =
clocks? Looking at
> VK_KHR_calibrated_timestamps, it seems that only MONOTONIC and MONOTONIC_=
RAW are exposed directly.
> I worry that providing the other clocks may make it easier for accidental=
ly querying timestamps that
> can't be correlated with driver state. A recent Mesa change aligned PanVK=
 Perfetto instrumentation on
> MONOTONIC_RAW [1], and the performance counter patches I've proposed also=
 use MONOTONIC_RAW
> as the only clock source.
I followed drm_xe_query_engine_cycles without giving much thought. As
long as we leave room for future extension, we can certainly only
allow those required by vulkan.
