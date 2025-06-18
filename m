Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E33DADF99F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 00:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AABB10E969;
	Wed, 18 Jun 2025 22:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="sGwocpVv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED8D10E969
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 22:55:00 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-234bfe37cccso3454535ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 15:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1750287300; x=1750892100;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/5NwaPDyOETWv2pDddwa/aKZNaAck4pdMU751257ncI=;
 b=sGwocpVv3nJlfK0r5+Uiqd2c1Dx1icjpUVx/YFRg2dLGX/h+OBjhCPm4iEg/+VhoN4
 LNT5SogIHprSCNWiiDmkmXS8G3TIku8WWfVC6X+oyNUARWAwOkYbGDU7WOdKHN2+coF0
 WyEN8M/1SgXylqAclqI7lS1PFr0Hwsb6dEPEehi1fAMbu1/z2p9sRRUep1UOQOcbPj16
 wZvs6cURcRztwk/BHIfJb4Pu2lVFxtVuqZDWp+sELIqblyCW3pZJwmgA5/i1wu+RqZI0
 ZlNdH6CvW8kpcWng02XgajSReTdixAQqShUAvfP54FC9d3/3rejLA+486oHOA9KEdvxU
 8olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750287300; x=1750892100;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/5NwaPDyOETWv2pDddwa/aKZNaAck4pdMU751257ncI=;
 b=I3EK2ow5AUJxUE4yUcHAKPTrpOA9PqswG140NcQSLvjStoKhrsv8VOQz/yTkhTeuck
 qy6yXYTI0qz6naHnLSaXpBMkydFTy5tnY1ep8uF9EcaAfL+hERU+jv5EOp7fsfSjhpc9
 nbyZiRF/iHY80qKNLxSZJ1WzyfR1clL1wOlU6I7m2wbKc/xGUQLGU6Z8wU+zvFhLOpU8
 wTt+A6aIwzM4sOVW6pktKciwO8wE/RXMNms1pEXMSa/mLuGLuxNkQS0WS0YXdFSjT7JJ
 cHHKxdEO+KWFbz7fMM3HY4PUR5UW5SFnKcIiECAlXrHJ7XQdxA+Z2JAEBpkJE9zI4AwZ
 W0xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0E5nzVLi1OvMbGIyk9NX9SWWQESWoj89I5IZEkiLF/KBY5UsfCEXdxtRng4AH6aiBE3kPyq4XBWk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKDxltTbIDjHo8NcoNxcSj0hK0siB/ZxoX3MAR/0ltPHWpr1iU
 2+e97TlbUwi8JmLE7dfRZRZywxRDiEmM3blfeHo+i47Sa/EkSanSM4DOnvgd0WuziuhCJvwVb7h
 dvJpS674=
X-Gm-Gg: ASbGncuLS5qGF2POWjzwIP/I+yB7ESADyWwa07SyPp8idtgG0UqIglVomjJcN0+uWy4
 Js1kI1YMhHRVcRLUim6RBrRDzFew9VdgrVi4vn5tzBKX1FfBerF+VvPRcfaLR8ieg8koBs0lFOD
 QY6757cXuApkDZwD4gYCN8jVAi9upK3zuzex6Oy72gw6LGP3GsvkUHP+JZlPvP9jfIoYAv+N1Mw
 iZ1fCO2fgJKQ1aX2fp+z5h0A22gB2xYb1qJJGv2QVMbvsZVhmt+/Mok9bmpdQqQDPHCS79Yol7H
 uwT7JoEtzuv+QXNd0iE6KQ2u8TBWYc/8D/ezqOmZuECXyfFlZbc/iCd2j+i7Ai1aPh9cx5e5g8O
 j5QbtWw==
X-Google-Smtp-Source: AGHT+IHgVrtzzhpW+oJLMdXuYbVuOtesVP9Nvp/NylotZPQenDpgvWchZUgnqqSWky9m7BlwSjYVnw==
X-Received: by 2002:a17:90a:dfcb:b0:313:d346:f347 with SMTP id
 98e67ed59e1d1-313f1e27e38mr28887847a91.35.1750287300056; 
 Wed, 18 Jun 2025 15:55:00 -0700 (PDT)
Received: from x1 (97-120-250-80.ptld.qwest.net. [97.120.250.80])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3158a24be89sm591076a91.23.2025.06.18.15.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 15:54:59 -0700 (PDT)
Date: Wed, 18 Jun 2025 15:54:57 -0700
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
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 1/8] power: sequencing: Add T-HEAD TH1520 GPU power
 sequencer driver
Message-ID: <aFNDwcK5+ZuHBdrw@x1>
References: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <CGME20250618102226eucas1p112dacf9670f68b4a8581aa1a8b5ced9d@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-1-27ed33ea5c6f@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-apr_14_for_sending-v5-1-27ed33ea5c6f@samsung.com>
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

On Wed, Jun 18, 2025 at 12:22:07PM +0200, Michal Wilczynski wrote:
> Introduce the pwrseq-thead-gpu driver, a power sequencer provider for
> the Imagination BXM-4-64 GPU on the T-HEAD TH1520 SoC. This driver
> controls an auxiliary device instantiated by the AON power domain.
> 
> The TH1520 GPU requires a specific sequence to correctly initialize and
> power down its resources:
>  - Enable GPU clocks (core and sys).
>  - De-assert the GPU clock generator reset (clkgen_reset).
>  - Introduce a short hardware-required delay.
>  - De-assert the GPU core reset. The power-down sequence performs these
>    steps in reverse.
> 
> Implement this sequence via the pwrseq_power_on and pwrseq_power_off
> callbacks.
> 
> Crucially, the driver's match function is called when a consumer (the
> Imagination GPU driver) requests the "gpu-power" target. During this
> match, the sequencer uses clk_bulk_get() and
> reset_control_get_exclusive() on the consumer's device to obtain handles
> to the GPU's "core" and "sys" clocks, and the GPU core reset.  These,
> along with clkgen_reset obtained from parent aon node, allow it to
> perform the complete sequence.
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  MAINTAINERS                                 |   1 +
>  drivers/power/sequencing/Kconfig            |   8 +
>  drivers/power/sequencing/Makefile           |   1 +
>  drivers/power/sequencing/pwrseq-thead-gpu.c | 231 ++++++++++++++++++++++++++++
>  4 files changed, 241 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0183c028fa18c397d30ec82fd419894f1f50a448..3283ff592215249bcf702dbb4ab710477243477e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21395,6 +21395,7 @@ F:	drivers/mailbox/mailbox-th1520.c
>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
>  F:	drivers/pinctrl/pinctrl-th1520.c
>  F:	drivers/pmdomain/thead/
> +F:	drivers/power/sequencing/pwrseq-thead-gpu.c
>  F:	drivers/reset/reset-th1520.c
>  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
>  F:	include/dt-bindings/power/thead,th1520-power.h
> diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
> index ddcc42a984921c55667c46ac586d259625e1f1a7..7fa912c9af2479cdce909467c29fe335788f0bd7 100644
> --- a/drivers/power/sequencing/Kconfig
> +++ b/drivers/power/sequencing/Kconfig
> @@ -27,4 +27,12 @@ config POWER_SEQUENCING_QCOM_WCN
>  	  this driver is needed for correct power control or else we'd risk not
>  	  respecting the required delays between enabling Bluetooth and WLAN.
>  
> +config POWER_SEQUENCING_THEAD_GPU
> +	tristate "T-HEAD TH1520 GPU power sequencing driver"
> +	depends on ARCH_THEAD && AUXILIARY_BUS
> +	help
> +	  Say Y here to enable the power sequencing driver for the TH1520 SoC
> +	  GPU. This driver handles the complex clock and reset sequence
> +	  required to power on the Imagination BXM GPU on this platform.

This is a minor nit but maybe this should be POWER_SEQUENCING_TH1520_GPU?

I often grep for TH1520 to make sure I have all the options enabled and
it took me a second to realize it was 'THEAD' instead of 'TH1520'.

In retrospect, I probably should have have used CONFIG_DWMAC_TH1520 for
the ethernet driver instead of CONFIG_DWMAC_THEAD.

Thanks,
Drew
