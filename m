Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70EAB31022
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 09:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E863510EA78;
	Fri, 22 Aug 2025 07:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="d/OXjSNo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AEC10EA78
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 07:20:55 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3b9e7437908so1194931f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 00:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755847254; x=1756452054;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IvJwbcOsjvAx4Cb95HKEUrId4UgDZ83tfHPDy6XNbLM=;
 b=d/OXjSNoIJqZ7cn4F1wXVrDRRSyaB1nt2kH7/iN1hAGlyUqyif+dunGoVaRj6NW7ud
 fmCC5l1jnTSNrewR/0qAvMYaLRKWsYDtZom1ZLpZTMYeYiB5WaCISbZAfqrqAar128dD
 e3yA/WbxEAg3VpUwG7iBMdb1FRZFfZsbeUm++Bru7zz/kKsNdto6KFvBcapTpZLvDnSf
 lbslKFsZNvun0vuzOwkVDkf7Dwl41xr0ZU/swnI/0YkxK8rIyeWIjP/Kq8pyuWm73GUd
 bSdGOdsA+7ePXqPcpTemZgD/hn3uhBzDQrhm3XvUfn3RII/tLKSY/viWW26RlsxL55z2
 fpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755847254; x=1756452054;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IvJwbcOsjvAx4Cb95HKEUrId4UgDZ83tfHPDy6XNbLM=;
 b=pJ2dvdJueMUE9AY22P4vwOJXc5zdVs4IJq71/flhxMoKzDwKFJMuRSbtAU0xTxiIk2
 ww6m0T2j7VsOekpi8Sy4T9ZHOnwBGf99N+/AgqDy2G1IqxE0RgReaSnFDs7WIsZLSEz2
 b4UcsQTB+rMsoXmgfx1obtdLfQAodGhdicloytvsm1pIun7xiB7xL618wqVSuy+cbg9Y
 Bk7SZJHaIm7o8TaTKl/iaPkIGE8S5AoLygvWla50+c+4kmwrMJRkvAJROCSZVm1yfCEj
 BGnjAk3WrQMDMiuldGOnRHsKlByMx3VXcGBChhi6VFJuGnoKVrPY2iKomgUrSb2MlkvZ
 dwAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlblZgu0M2OGqJAbMmF1x3Nc/Z+8YWzgrU4rBMb39cNDZHlgINtanyxK9gVVyfO7Cf9oXceZyBKrQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhQEjBOoHd3oLNuw/VqQb6YiprNBwAumbdEs25ehRlkNtrSMHj
 BVUI6TSfmGszkvXzHNl2zFEuajh0Gvjw3fgGbsVKxpwSiyqqW5LDVRUn05y3wP6xnEk=
X-Gm-Gg: ASbGncu4hz+tJC+yojGBVxbLsW/YiP5FdwZF4PDw1ZdeE+bOWkbA8B+BaY9zaSAALnz
 5SRR6joZ4JRonvZ3s5Fd6A0ZB3kDPe8ZqhrGFCZfGP2TUZPqAhDkntYOtU8DaqLVeBn926q48rj
 uGie6/0JH0Ahr6fUwxI2BehCdcBH/CXB9X7CDLR9/cTZYRnmh8dxtQ3AN8lKGmIPxbeRlz2N/YR
 +WNIX2tgcH+HNb+lUcIpYtW+ugpv2U3UE+igByDgrU0k/U8Sru6IhSEzx3bj9jp9zaD87UfmpJS
 Lyncw6kIGWMo6yhSMScpm9cv/gMW4eo6/lLOUaR/7DWzq0VSrNhTj37B7GMIa/7xIE2lwuPhP57
 YT6WiJTzZKqa3O1Sodx1C7iLYsqy56psQxvLkxUml4kKx3Si11F2xwqp4Vsnpf1fAuq+HybXOI/
 9LfcCRrw==
X-Google-Smtp-Source: AGHT+IFLbHL5Jfp1HiEMgBzb/cWVZllJl0fqqVCyRz90kU9u6d+rKWlXzqxgMmKXZyGMMiOGZn0oyA==
X-Received: by 2002:a5d:5f4e:0:b0:3c0:7e02:67b9 with SMTP id
 ffacd0b85a97d-3c5dcefeda4mr1234311f8f.61.1755847253747; 
 Fri, 22 Aug 2025 00:20:53 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c077c576b7sm14060427f8f.63.2025.08.22.00.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 00:20:53 -0700 (PDT)
Date: Fri, 22 Aug 2025 08:20:50 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 MaudSpieringsmaudspierings@gocontroll.com
Subject: Re: [PATCH v2 2/4] backlight: add max25014atg backlight
Message-ID: <aKgaUtcNoOsga6l7@aspen.lan>
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
 <20250819-max25014-v2-2-5fd7aeb141ea@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-max25014-v2-2-5fd7aeb141ea@gocontroll.com>
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

On Tue, Aug 19, 2025 at 12:59:00PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.
>
> Signed-off-by: Maud Spierings maudspierings@gocontroll.com

Looking good but still a few small comments (below).


> diff --git a/drivers/video/backlight/max25014.c b/drivers/video/backlight/max25014.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..fe5e0615cf6d151868b56ebb9544b175b09dfcee
> --- /dev/null
> +++ b/drivers/video/backlight/max25014.c
> @@ -0,0 +1,395 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Backlight driver for Maxim MAX25014
> + *
> + * Copyright (C) 2025 GOcontroll B.V.
> + * Author: Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#define MAX25014_ISET_DEFAULT_100 11
> +#define MAX_BRIGHTNESS (100)
> +#define MIN_BRIGHTNESS (0)
> +#define TON_MAX (130720) /* @153Hz */
> +#define TON_STEP (1307) /* @153Hz */
> +#define TON_MIN (0)
> +
> +#define MAX25014_DEV_ID         (0x00)
> +#define MAX25014_REV_ID         (0x01)
> +#define MAX25014_ISET           (0x02)
> +#define MAX25014_IMODE          (0x03)
> +#define MAX25014_TON1H          (0x04)
> +#define MAX25014_TON1L          (0x05)
> +#define MAX25014_TON2H          (0x06)
> +#define MAX25014_TON2L          (0x07)
> +#define MAX25014_TON3H          (0x08)
> +#define MAX25014_TON3L          (0x09)
> +#define MAX25014_TON4H          (0x0A)
> +#define MAX25014_TON4L          (0x0B)
> +#define MAX25014_TON_1_4_LSB    (0x0C)
> +#define MAX25014_SETTING        (0x12)
> +#define MAX25014_DISABLE        (0x13)
> +#define MAX25014_BSTMON         (0x14)
> +#define MAX25014_IOUT1          (0x15)
> +#define MAX25014_IOUT2          (0x16)
> +#define MAX25014_IOUT3          (0x17)
> +#define MAX25014_IOUT4          (0x18)
> +#define MAX25014_OPEN           (0x1B)
> +#define MAX25014_SHORT_GND      (0x1C)
> +#define MAX25014_SHORT_LED      (0x1D)
> +#define MAX25014_MASK           (0x1E)
> +#define MAX25014_DIAG           (0x1F)

There is no need to put raw numbers in brackets.


> +
> +#define MAX25014_IMODE_HDIM     BIT(2)
> +#define MAX25014_ISET_ENABLE    BIT(5)
> +#define MAX25014_ISET_PSEN      BIT(4)
> +#define MAX25014_DIAG_HW_RST    BIT(2)
> +#define MAX25014_SETTING_FPWM   GENMASK(6, 4)
> +
> +struct max25014 {
> +	struct i2c_client *client;
> +	struct backlight_device *bl;
> +	struct regmap *regmap;
> +	struct max25014_platform_data *pdata;

This appears to be unused.


> +	struct gpio_desc *enable;
> +	struct regulator *vin; /* regulator for boost converter Vin rail */
> +	uint32_t initial_brightness;

It is important to keep the initial_brightness for the lifetime of the
driver?

> +	uint32_t iset;
> +	uint8_t strings_mask;
> +};
> +


Daniel.
