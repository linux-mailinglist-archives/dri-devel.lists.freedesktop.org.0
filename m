Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4BFADFAF9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 03:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C45D10E831;
	Thu, 19 Jun 2025 01:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="nyGDlD6e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0A410E831
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 01:43:37 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-748f5a4a423so144597b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 18:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1750297417; x=1750902217;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9RBzLiRa5kP007xKu/khAw6xLYgVFKSnX02dITEELMQ=;
 b=nyGDlD6eBM0klFL2rGMaJigxHhBAm8OOhVZ/IExOs5ce8at/BM2GFgvX8WxhcQuO02
 zgq8MvCptfVib/vtY0JtJ7trkk5z88gZTWK3Kbo4bawS2FWsyKoM/VnmFshBRd4lWRSs
 5/wzCCmYwZplEMVS7oBmouQV6dK/280SbhtUVlU/XananmQew3qQKwMTY8c/94h5CND0
 kHoPJJtuNwLHtkY0y4cgY/RiuMeSac+egqqRL7Q0gNVfBKCG8AGSF//16GnSBZFXwT/P
 /5LLxkwZUwJLSIn2bXE76ylFkXCOI27TDSL5cvDh7+laIUzaJu/0ng5YnKaWrJy7VtyE
 pPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750297417; x=1750902217;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9RBzLiRa5kP007xKu/khAw6xLYgVFKSnX02dITEELMQ=;
 b=pkWKwEYjiLyIavjWqIujJNg7vYKz1Nv4n7t+FLhcV/PA909RpgEJ6AYvFdAjxdu4ID
 IhPZDfJL/qjD58KW67OJR+6UVcgukc0dSCr4bT0zIBj6hl7h/8KpSC4bFZXrrvmWHPxK
 GUfN/yv06X0z0pxx4iFiuzMU6zxt61Dd/aKib4liS3KOK5hnS/TRBH8PIUXW7/G54k4L
 WTLeXO1k7rH8TBUUuZf7Pbjv/NoQToBYqa543IuAcuZAW12SmrElkafZQOxYj+lAaWyi
 TFbZpe9UmOEP6t+3p6Sxcjc22eXb34ClH6TW8GQ+IbGEkDcIrGvIE3681lW0YgDkB86N
 8bDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzslOGTlphjjvtsVT8zPMEmlruINC0k8Pn3Y0ed3eOkfOtcz14aSNbBuGaS6ARhfLqsgpleduKq8c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjaJgflzr3/2kQFH27cNvrVJQqEgZe2BoKWvjjGW72YKr7UexK
 gDXTaQyjtH6qfdAh5POTxYMVULitt1gFQJh1BRowaZG0+7gOl4TbjwQrjg+YenZD/vE=
X-Gm-Gg: ASbGncuWLxNzNtOPOrhk8CyEOt2lzfsL6DHC5ON7gTqf6dE5drrwNWOgv3Qs/j3rs5c
 mUh1wC4XNaZIvqit6BbuCVprLBHEeCyC6QlSW2IbiIDv3JgwHy4WvE3n9sHxZ7QDN2ahhz7ueHs
 Lw9+hM9MS75NAPREXE9n11LuTW2Hzubze8fXF4LfFNVIBP8YAR2nuR+p+M7bVYpn4WLKYCnUL6Y
 bZSBsgl6EAojNtDqPmIdis0WVWpF64hcyNGsX4QfTPLlDNlesL/RAwUbMUnGRQNpixpbnuYKFTR
 1SJAIkzH48X0s2Ciws3QHWtrWtOzb1lqjLAUhV5tdzn0bAOaCdusOPk9nuyODtfR8nlvyps=
X-Google-Smtp-Source: AGHT+IER1GlKqenGCJq3qD2Xqlv8+ahed3DymdmXx7TwJgKJZxq18ZlqN5MmHKY9e5pztJs0I4bquQ==
X-Received: by 2002:a05:6a00:178e:b0:742:ae7e:7da8 with SMTP id
 d2e1a72fcca58-7489ce45893mr32194637b3a.8.1750297417247; 
 Wed, 18 Jun 2025 18:43:37 -0700 (PDT)
Received: from x1 (97-120-250-80.ptld.qwest.net. [97.120.250.80])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748fbce0f13sm291934b3a.37.2025.06.18.18.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 18:43:36 -0700 (PDT)
Date: Wed, 18 Jun 2025 18:43:34 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 0/8] Add TH1520 GPU support with power sequencing
Message-ID: <aFNrRtbWzeRa7GmQ@x1>
References: <CGME20250618102225eucas1p129b1172bf54521c1eb0f718cb31af468@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
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

On Wed, Jun 18, 2025 at 12:22:06PM +0200, Michal Wilczynski wrote:
> This patch series introduces support for the Imagination IMG BXM-4-64
> GPU found on the T-HEAD TH1520 SoC. A key aspect of this support is
> managing the GPU's complex power-up and power-down sequence, which
> involves multiple clocks and resets.
> 
> The TH1520 GPU requires a specific sequence to be followed for its
> clocks and resets to ensure correct operation. Initial discussions and
> an earlier version of this series explored managing this via the generic
> power domain (genpd) framework. However, following further discussions
> with kernel maintainers [1], the approach has been reworked to utilize
> the dedicated power sequencing (pwrseq) framework.
> 
> This revised series now employs a new pwrseq provider driver
> (pwrseq-thead-gpu.c) specifically for the TH1520 GPU. This driver
> encapsulates the SoC specific power sequence details. The Imagination
> GPU driver (pvr_device.c) is updated to act as a consumer of this power
> sequencer, requesting the "gpu-power" target. The sequencer driver,
> during its match phase with the GPU device, acquires the necessary clock
> and reset handles from the GPU device node to perform the full sequence.
> 
> This approach aligns with the goal of abstracting SoC specific power
> management details away from generic device drivers and leverages the
> pwrseq framework as recommended.
> 
> The series is structured as follows:
> 
> Patch 1: Introduces the pwrseq-thead-gpu auxiliary driver to manage the
>          GPU's power-on/off sequence.
> Patch 2: Adds device tree bindings for the gpu-clkgen reset to the
>          existing thead,th1520-aon binding.
> Patch 3: Extends the pm-domains driver to detect the gpu-clkgen reset
>          and spawn the pwrseq-thead-gpu auxiliary driver.
> Patch 4: Updates the Imagination DRM driver to utilize the pwrseq
>          framework for TH1520 GPU power management.
> Patch 5: Adds the thead,th1520-gpu compatible string to the PowerVR GPU
>          device tree bindings.
> Patch 6: Adds the gpu-clkgen reset property to the aon node in the
>          TH1520 device tree source.
> Patch 7: Adds the device tree node for the IMG BXM-4-64 GPU and its
>          required fixed-clock.
> Patch 8: Enables compilation of the Imagination PowerVR driver on the
>          RISC-V architecture.
> 
> This patchset finishes the work started in bigger series [2] by adding
> all remaining GPU power sequencing piece. After this patchset the GPU
> probes correctly.

The powevr probe complains:

[    1.060383] powervr ffef400000.gpu: Direct firmware load for powervr/rogue_36.52.104.182_v1.fw failed with error -2

Where is the correct place to get the firmware?

Thanks,
Drew
