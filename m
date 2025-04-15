Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF3AA8A468
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 18:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CEB10E7FB;
	Tue, 15 Apr 2025 16:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SSTRW9ox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B62B10E7FB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 16:43:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BA11C5C587E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 16:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64FB2C4CEEE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 16:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744735388;
 bh=u95dBuLRjhdfXitfe59a5c3chs1JKSGBptgj8nnq0po=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SSTRW9oxwi6t6BeOmnz5XKCkgql93kGJJvL3lgjDd3s7AgKf9v2H8X/sQVy78qbRF
 XlUR/AMhJniKi3dPiKEHsx+DBL1hXeuZrsgvmfb+1nSolGXDHnXjmG+BjElH0lWVm2
 7KlwCKos259oJJXMaimUODj95ATn1ZH2mqJt18dKTc9p9Wb0s+MKiR7kuEtPVvQWqp
 E6qvGRZWHtj4qppb2jANy0p3WACo/EV2JsN9c6EUWUvtHRPGuo8vKjgQQ8ibY84S0H
 ICBokVM6NJhYXK3dHZe5Wcf3CxdTdjphQV5VLTU1Py8nNdtXxehYGJWar/Z4kpO9rq
 Xdnj5akXzs0og==
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-2d060c62b61so3249489fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:43:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVqU6MD6+l5TkobHSyszAAl+RQDG78sZfR19HIMHz29dWoEU3rBC0uRIsWj/Qd6p4xMKo7LgIN3R4k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBiue4fXES6G4kd5QQ9QXyI+3I37OAwZ3B0cAsgyS8rJZwDiR8
 rXIlguSQMIoahRbj11il4mVmLslC+ghCDiwd5K7zixWTOkPLzi8u9jTXow7GmycU7n6GwYaNTg5
 MPNgayl/TTWwBycaWOWGkiW4vh5s=
X-Google-Smtp-Source: AGHT+IGyns0wKcIA6JT3DidO5LCfWPBQ89zz6U8ulYdw6epDaXaSmmPM+mVRcjXZP13jUV0tTep4Qgkj6OohB9PkpUw=
X-Received: by 2002:a05:6871:3743:b0:29e:27b6:bea5 with SMTP id
 586e51a60fabf-2d0d5f2462dmr9973324fac.25.1744735387716; Tue, 15 Apr 2025
 09:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250414185314eucas1p1ae57b937773a2ed4ce8d52d5598eb028@eucas1p1.samsung.com>
 <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
 <20250414-apr_14_for_sending-v2-1-70c5af2af96c@samsung.com>
In-Reply-To: <20250414-apr_14_for_sending-v2-1-70c5af2af96c@samsung.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 15 Apr 2025 18:42:56 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0irRq8_p35vf41_ZgomW0X=KZN+0HqwU2K9PvPRm8iZQA@mail.gmail.com>
X-Gm-Features: ATxdqUFwFy97e7VWF90uH5loEGafOroniuxmOCaFHFC3QunM9DSgMFJWfDaMgSM
Message-ID: <CAJZ5v0irRq8_p35vf41_ZgomW0X=KZN+0HqwU2K9PvPRm8iZQA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] PM: device: Introduce platform_resources_managed
 flag
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Pavel Machek <pavel@kernel.org>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Mon, Apr 14, 2025 at 8:53=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Introduce a new dev_pm_info flag - platform_resources_managed, to
> indicate whether platform PM resources such as clocks or resets are
> managed externally (e.g. by a generic power domain driver) instead of
> directly by the consumer device driver.

I think that this is genpd-specific and so I don't think it belongs in
struct dev_pm_info.

There is dev->power.subsys_data->domain_data, why not use it for this?

Also, it should be documented way more comprehensively IMV.

Who is supposed to set it and when?  What does it mean when it is set?

> This flag enables device drivers to cooperate with SoC-specific PM
> domains by conditionally skipping management of clocks and resets when
> the platform owns them.
>
> This idea was discussed on the mailing list [1].
>
> [1] - https://lore.kernel.org/all/CAPDyKFq=3DBF5f2i_Sr1cmVqtVAMgr=3D0Fqsk=
sL7RHZLKn++y0uwg@mail.gmail.com/
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  include/linux/device.h | 11 +++++++++++
>  include/linux/pm.h     |  1 +
>  2 files changed, 12 insertions(+)
>
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 79e49fe494b7c4c70d902886db63c4cfe5b4de4f..3e7a36dd874cfb6b98e2451c7=
a876989aa9f1913 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -881,6 +881,17 @@ static inline bool device_async_suspend_enabled(stru=
ct device *dev)
>         return !!dev->power.async_suspend;
>  }
>
> +static inline bool device_platform_resources_pm_managed(struct device *d=
ev)

Could this function name be shorter?

> +{
> +       return dev->power.platform_resources_managed;
> +}
> +
> +static inline void device_platform_resources_set_pm_managed(struct devic=
e *dev,
> +                                                           bool val)

Ditto?

> +{
> +       dev->power.platform_resources_managed =3D val;
> +}
> +
>  static inline bool device_pm_not_required(struct device *dev)
>  {
>         return dev->power.no_pm;
> diff --git a/include/linux/pm.h b/include/linux/pm.h
> index f0bd8fbae4f2c09c63d780bb2528693acf2d2da1..cd6cb59686e4a5e9eaa2701d1=
e44af2abbfd88d1 100644
> --- a/include/linux/pm.h
> +++ b/include/linux/pm.h
> @@ -670,6 +670,7 @@ struct dev_pm_info {
>         bool                    no_pm:1;
>         bool                    early_init:1;   /* Owned by the PM core *=
/
>         bool                    direct_complete:1;      /* Owned by the P=
M core */
> +       bool                    platform_resources_managed:1;
>         u32                     driver_flags;
>         spinlock_t              lock;
>  #ifdef CONFIG_PM_SLEEP
>
> --
> 2.34.1
>
>
