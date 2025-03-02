Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BA5A4B555
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 23:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DF810E1D6;
	Sun,  2 Mar 2025 22:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mgPaERoM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B454F10E0E7
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 22:44:18 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so2086474f8f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Mar 2025 14:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740955452; x=1741560252; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B3nSz0Tm/9ALfIco44Ttp6VO9zHRPvQciCEJvIO+PRY=;
 b=mgPaERoMq23O8eIOaAy4xqHI4IBCzL1zAQsR6WVZkTssVe7S54TSs3YM8tfJIpelLz
 hMdezzVdDnxgFEoEN53ElciNZcfXZGFSFBJ+3Srprq/NlRv7GAtQvpHfYeGticUo0PhI
 wYZ/hox9lbHCmjHtq0Vy54jQGIBlvRPlKzuXyih76BTF4srL4WMGaXdcyzXBYAA0bUft
 Owb4/9XDu6g+BtRJIiF7ETKltuFVAdoZAEcTF1UAfyky5ZTzyG4DxaPQkeQFOVmt1Slb
 qQOQsxmklN4huJDa9LaBA84gscrbKltfSUcUoBVdXd3eFn4B5+lbsEeYX25/5vdaDZTK
 9qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740955452; x=1741560252;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B3nSz0Tm/9ALfIco44Ttp6VO9zHRPvQciCEJvIO+PRY=;
 b=UPqTvTmXH8Lll49w6Wb3JZiS3kUArlj8ucM/rZEzmjayezY9DLHvZFiGo0B84fpXzb
 QSUBvR4RkavtrnRqhS9vlLErd1Pv+VGOF2126Rge4/7eqWZaXpdQHFCYzmAp51oysFmI
 RdOz+fwhUmgypArEhif4nT9mtzcvpddY9Fol07qx81mblMKasV7dz8Q0cztpBijwZ1lh
 Se6ybTK8U7bzfVbQfr/6WMc59gourXZ5w6qqbpfODMeP4GpZpknhZNltERs0Uq4meLYL
 wjVG/dyzFUqnCqja+wfi/6c/zp9Flqf3cVSmSnIx9l4zFf2iL+sVY8LN9U6lQ/9/q+kw
 WYxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUylno2SLiiAGRjQRjxfbAbxabkoPLjYAaOzbnIsRpV5rt+OIzPPZw4M01+QJgy8JIvBc7Z1jlVhUE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyf9Ag2nikUUhuzlnGqlcQckdPAy/li/f1lOhXXcUjqiNkncNxh
 XUI9DRAUqp8QXsDMVty31YXSvE9YzOiCMlVoKfeICP4oAkPjf6em
X-Gm-Gg: ASbGnctnbYtD8yoys7oGiK+tnqoO+lB/aeUR94nVRKaubqhoKVXIfFfbb7yw4pPUPVd
 jmDKlzWzLmwDPnsA7rzmNbQOBsfv7qHPmaftkh/tkG8Zrc6IueSyhldKLksNUH7DUh2xgR+65mE
 qkXWt+fxkllnl/jNzozg5tji7tIfXmxPsAKkLUKrd5PLhEDX1JKxM37HrSkevEu8pRcH3SYyLpl
 jL0ehAjKdIOWQkZSo+8ar+yzfMJZIVzQC8SONC7CdO/ltg8gS4KjODtbNCMxT2uyDwkkOhmMlXD
 JO2CWPzJzs4wc8NnCuKnrUGSxydh5uamNaRMzEMkxNinUaGL4HIwNhFsdWewSqkywTHuSHYd0dL
 xiYdjQ1Z9OVn+qYvYuAQ=
X-Google-Smtp-Source: AGHT+IFSwDgCyqBHbrq2Yl2rg5agQteOsniIG4r4DpFhXYFaxZR5xy7+52k8VXpQGVa6zUoKmIRgVw==
X-Received: by 2002:a05:6000:1789:b0:391:ba6:c066 with SMTP id
 ffacd0b85a97d-3910ba6c216mr967773f8f.35.1740955451848; 
 Sun, 02 Mar 2025 14:44:11 -0800 (PST)
Received: from [10.13.13.3] (146.10-240-81.adsl-dyn.isp.belgacom.be.
 [81.240.10.146]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4844ac6sm12407954f8f.71.2025.03.02.14.44.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Mar 2025 14:44:11 -0800 (PST)
Message-ID: <01775d74-d72e-4a93-8a02-c13f7365d385@gmail.com>
Date: Sun, 2 Mar 2025 23:44:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] arm64: sunxi: h616: Enable Mali GPU
To: Andre Przywara <andre.przywara@arm.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org
References: <20250221005802.11001-1-andre.przywara@arm.com>
Content-Language: en-US
From: Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <20250221005802.11001-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Tested this on a RG35XX-H (H700),

launching glmark2-es2-drm completely hangs the board.

No kernel oops or error messages.

Philippe

On 21/02/2025 01:57, Andre Przywara wrote:
> The Allwinner H616/H618/H313/H700 SoCs contain a Mali G32 MP2 GPU. This
> IP is from the Bifrost family and is already supported by the panfrost
> driver, so enabling support for 3D graphics on this SoC is rather
> straight-forward.
> However Allwinner added some bits in the PRCM block, that control the
> power domain for the GPU - on top of its power *supply*.
>
> This series enables the Mali GPU on those SoCs, by first introducing a
> power domain driver for that SoC (patch 1/5: DT binding, patch 2/5:
> the actual driver). For the Mali GPU to work we literally need to flip a
> single bit (the BSP does this in the bootloader), and this full featured
> power domain driver is admittedly a bit over the top for that purpose.
> However it seems to be the right thing to do architecturally, and while
> at it I added the other power domains (for analogue, PLLs, and the
> management core), even though we won't use them in Linux and they would
> be always on. I have a simpler version of the driver which just covers
> this single bit controlling the GPU, please let me know if you prefer
> that.
> Please also note that this supersedes an RFC patch I sent a year ago,
> which included this power domain in the R-CCU driver:
> https://lore.kernel.org/linux-sunxi/20240225160616.15001-1-andre.przywara@arm.com/T/#u
>
> The rest of the patches enable the Mali GPU on the DT side: patch 3/5
> adds the compatible string to the Mali DT binding, while patch 4/5 adds
> the purely SoC specific DT nodes, for both the power domain and the Mali
> GPU. The final patch 5/5 then enables the GPU on all existing H616-family
> boards.
>
> There seems to be an existing problem with powering up the GPU, after it
> has been turned off by the kernel. Chances are this is a problem with the
> proper power-up (or power-down) sequence, where clock gates, reset lines
> and the power domain must be asserted in a specific order.
> A workaround used so far downstream is to keep the power domain enabled,
> by ignoring the power-off request. Observing any assumed "proper" sequence
> is a bit more tricky, since there is no Allwinner specific glue driver
> or anything, so things would need be changed in the generic panfrost
> code, where they have the potential of breaking other Mali users.
> I would be interested in hearing opinions about this.
>
> Cheers,
> Andre
>
> Andre Przywara (5):
>    dt-bindings: power: Add Allwinner H6/H616 PRCM PPU
>    pmdomain: sunxi: add H6 PRCM PPU driver
>    dt-bindings: gpu: mali-bifrost: Add Allwinner H616 compatible
>    arm64: dts: allwinner: h616: Add Mali GPU node
>    arm64: dts: allwinner: h616: enable Mali GPU for all boards
>
>   .../bindings/gpu/arm,mali-bifrost.yaml        |   1 +
>   .../power/allwinner,sun50i-h6-prcm-ppu.yaml   |  42 ++++
>   .../dts/allwinner/sun50i-h313-tanix-tx1.dts   |   5 +
>   .../sun50i-h616-bigtreetech-cb1.dtsi          |   5 +
>   .../allwinner/sun50i-h616-orangepi-zero.dtsi  |   4 +
>   .../allwinner/sun50i-h616-orangepi-zero2.dts  |   4 +
>   .../dts/allwinner/sun50i-h616-x96-mate.dts    |   5 +
>   .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  21 ++
>   .../sun50i-h618-longan-module-3h.dtsi         |   5 +
>   .../allwinner/sun50i-h618-orangepi-zero2w.dts |   5 +
>   .../allwinner/sun50i-h618-orangepi-zero3.dts  |   4 +
>   .../sun50i-h618-transpeed-8k618-t.dts         |   5 +
>   .../sun50i-h618-yuzukihd-chameleon.dts        |   5 +
>   .../sun50i-h700-anbernic-rg35xx-2024.dts      |   5 +
>   drivers/pmdomain/sunxi/Kconfig                |  10 +
>   drivers/pmdomain/sunxi/Makefile               |   1 +
>   drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c   | 191 ++++++++++++++++++
>   17 files changed, 318 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml
>   create mode 100644 drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c
>
