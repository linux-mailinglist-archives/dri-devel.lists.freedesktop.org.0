Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61142AE00CD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 11:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C856210E9EC;
	Thu, 19 Jun 2025 09:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uZqCItIr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A731310E9ED
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 09:00:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 623B24A0E0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 09:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED710C4CEF6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 09:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750323605;
 bh=UzuK/CxyCGnL+YSPUVuW3jK4T0cRHWwLE+0svoU+I9s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uZqCItIrk3k1OdHIzIrazTjBWejLTxKQPYzsMO57UI7rJrtaBqrf43cOBcK1wa72w
 JsIvZHpA+V7otozjmg8DWFRLn/hvgSNdiOpTmoRK16hVgaMIKCpTQWE0dbHArd/Pt5
 xqUtXO3MW6lvEkNsLH6d2cvFYwWGq8Y5DoFwqXdEYr8T4rqE++0PFw4JA+CdyjFaRT
 LwFPTdbgd0r2wrp/Zb4qUarXaFCQgRfNMt+WG6fExOEczrCcoEC8Ysd6dTVaRXqWSl
 LypPuEpu21fbDAY/2xl5pkj/I57BSSvXvZAt3RuekEF02gANJYNEK5UEFhGejydXq2
 P6bMo6rdAp2yw==
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-e82596e88c4so521801276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 02:00:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWYvaNHAdw5rUErwuVgBaIcCxMV6JPvk55MRx+EEg/BMpjPIHnA0Pz7K/GkZD99kPy6Iyu6Pwtz/t4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDlwIVRE/mMmbFnyl8t8UwwnITAevd4DctDrwPGE+xJhUaNW7w
 HZSckAT9TD0/XdyZClDgsyFGmX5YuF0AvXdip/WqvMjU/Dn5AKV/r6DS0nmSPAmcqJflYZ7jBEa
 JFmCMxF4j4TGA2nDPr38xmQfVN2S8XHFXkSb/hxvoFQ==
X-Google-Smtp-Source: AGHT+IFTSpIXWJ8aJgks2cku0velW0M+JCR6Rbfmtd6WsoM033VVzHoiXCwOg94pnYfHO2hy+W/9swsQZRSpK6zIGwQ=
X-Received: by 2002:a05:6902:2613:b0:e82:6c9b:8287 with SMTP id
 3f1490d57ef6-e826c9b85e4mr11134815276.9.1750323604035; Thu, 19 Jun 2025
 02:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-2-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-2-dc16cfe6fe4e@tomeuvizoso.net>
From: Robert Foss <rfoss@kernel.org>
Date: Thu, 19 Jun 2025 10:59:53 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4p2wuMVVvQOJ5c6ecT=x2pr2VoZhS4wH27qaR9DptQHA@mail.gmail.com>
X-Gm-Features: AX0GCFskbG-ChYYQk7bGtKWaX4j6fsAKjpFPkM8iQ7QewPkQLLciRbSAzy_fqYo
Message-ID: <CAN6tsi4p2wuMVVvQOJ5c6ecT=x2pr2VoZhS4wH27qaR9DptQHA@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] accel/rocket: Add a new driver for Rockchip's NPU
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, 
 Robin Murphy <robin.murphy@arm.com>, Daniel Stone <daniel@fooishbar.org>,
 Da Xue <da@libre.computer>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
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

On Fri, Jun 6, 2025 at 8:29=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.net>=
 wrote:
>
> This initial version supports the NPU as shipped in the RK3588 SoC and
> described in the first part of its TRM, in Chapter 36.
>
> This NPU contains 3 independent cores that the driver can submit jobs
> to.
>
> This commit adds just hardware initialization and power management.
>
> v2:
> - Split cores and IOMMUs as independent devices (Sebastian Reichel)
> - Add some documentation (Jeffrey Hugo)
> - Be more explicit in the Kconfig documentation (Jeffrey Hugo)
> - Remove resets, as these haven't been found useful so far (Zenghui Yu)
> - Repack structs (Jeffrey Hugo)
> - Use DEFINE_DRM_ACCEL_FOPS (Jeffrey Hugo)
> - Use devm_drm_dev_alloc (Jeffrey Hugo)
> - Use probe log helper (Jeffrey Hugo)
> - Introduce UABI header in a later patch (Jeffrey Hugo)
>
> v3:
> - Adapt to a split of the register block in the DT bindings (Nicolas
>   Frattaroli)
> - Move registers header to its own commit (Thomas Zimmermann)
> - Misc. cleanups (Thomas Zimmermann and Jeff Hugo)
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> - PM improvements (Nicolas Frattaroli)
>
> v4:
> - Use bulk clk API (Krzysztof Kozlowski)
>
> v6:
> - Remove mention to NVDLA, as the hardware is only incidentally related
>   (Kever Yang)
> - Use calloc instead of GFP_ZERO (Jeff Hugo)
> - Explicitly include linux/container_of.h (Jeff Hugo)
> - pclk and npu clocks are now needed by all cores (Rob Herring)
>
> v7:
> - Assign its own IOMMU domain to each client, for isolation (Daniel
>   Stone and Robin Murphy)
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Reviewed-by: Robert Foss <rfoss@kernel.org>
