Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A5FADB1E7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 15:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D9510E39B;
	Mon, 16 Jun 2025 13:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LgUZo73m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A0810E39B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 13:30:22 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e81ec95d944so4710801276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750080621; x=1750685421; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8dIM4ggq6nkqhLbVMKcT1ezBsK840f8IM9RKNGuYHjk=;
 b=LgUZo73mZGjkQRuUrw40j08/V6kwmeIJp7KcRPG4kv3Cb28Vn/Wz1ycexvhtnPQQ8B
 OfrZZdoWdTWB+9D5V1+WZUU51fkUNXGZtfUr1vY3Q/HVibik7t5Mu10sOs7HF0MEvF19
 YTOeMU45r4iBW/4/qdhjF1Z1ZmDimyqynbinWzV6mHTArB2tNoGO/T7HWbcQFYm4ZNBk
 2LZMEPD54z9N87xNTTBNfk3jljoG/Lk1yLvg0MLiOAqsCbKesml8hCf9LQGc3k1K+LQ/
 Uesf4Pd7i/zv672j2lwjZCKaxrMCj01WVAgOsbnUro64OfSAQWl9NDd9MqSrsuO2oNQg
 Cryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750080621; x=1750685421;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8dIM4ggq6nkqhLbVMKcT1ezBsK840f8IM9RKNGuYHjk=;
 b=C6v6lXXYEFAqAg/2Xwyp/CHdqa0l7Vc5bumlCzGNACuDsEa0ccQPiaMuvjgRpMynuL
 HoLLo6xTWrBMg2EELdBKON+mKPwLEy28jqNdYHHppdD1zLy7NSaelvEICIS3q59Nv8h+
 AWMJqVcFuWM9UhlFF8jPAuqIa5B04v0dm118byd7anMX4Z+zIKT8VP6Bz97qvTkUplWG
 pYaFrkQVBp6WfrP0HqFffa08GlLXi1/g8GfNcRhYUwDSL8bzMqVZuq4BU3zOSWJ8p9Yi
 ahVkEIOAHeIgZDoW5YEcAqe9X/Ie7NU/8pTfUZPN18ehn9eiI5y8AW6+I+zGxrFhIqu5
 h9QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbepyKoU+R3uqvP8a9EsSG7uSie1wBvmCohMJW5YA5auawfI2FR4nSAFQdZYjdSofuLPNAVNwoyGg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziOY6RMIGECZdOKeQSFyNoaDJvB8gUCLcEZrx3oWfhhD0qHv2Y
 HLhKp4CKZ/CuGFSH7XJ1n7ts2myQy8ejR2v2sRCippSVU0u1fD6ksNODJKxuF5fEqMtn4G4h2pY
 IRsgbw8s5Cmy7JkgNYUBHtQvETqO0/Co73UUsO+lkAQ==
X-Gm-Gg: ASbGncsQ9dFLACWePlTQM/YY1XHVprD9j3mVX262V1Mji1D6NSfHZPVObzcz2tlmc9S
 lRVBJUL3V8S71c0i6drXj8fLD+s0GRUrdMJIwaCqNv5GgGrerfzPh8fP4cd66uS9oL7116bu7Dm
 +L8sQupscfMWYUWWDJ4kQRxbQo4p6Iz5LS/VuzXIof83Jl
X-Google-Smtp-Source: AGHT+IHvwFdTtrctzoiWIaPE71W/8FTAI+xhZY2HkhDJbIaDsGip4BNw9qrbXT3Tk9Kd8tGyhyS35T/gDOg+zFs+nYI=
X-Received: by 2002:a05:6902:703:b0:e81:566c:3085 with SMTP id
 3f1490d57ef6-e8227f0e61bmr12875927276.1.1750080620760; Mon, 16 Jun 2025
 06:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-2-f4afb8f6313f@collabora.com>
In-Reply-To: <20250612-byeword-update-v1-2-f4afb8f6313f@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Jun 2025 15:29:44 +0200
X-Gm-Features: AX0GCFucmmVjhuxKNu1-kopwQ1Ifcn7b36ykDZEf_SV72XMHIWGaSa8Aqxa6A60
Message-ID: <CAPDyKFr_-aQ+YoRqYVUFhRR=94NWOredaSYQsVb-xvot83HJ3w@mail.gmail.com>
Subject: Re: [PATCH 02/20] mmc: dw_mmc-rockchip: switch to HWORD_UPDATE macro
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Jaehoon Chung <jh80.chung@samsung.com>, Heiko Stuebner <heiko@sntech.de>, 
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-phy@lists.infradead.org, linux-sound@vger.kernel.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-clk@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 12 Jun 2025 at 20:57, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> The era of hand-rolled HIWORD_UPDATE macros is over, at least for those
> drivers that use constant masks.
>
> Switch to the new HWORD_UPDATE macro in bitfield.h, which has error
> checking. Instead of redefining the driver's HIWORD_UPDATE macro in this
> case, replace the two only instances of it with the new macro, as I
> could test that they result in an equivalent value.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/mmc/host/dw_mmc-rockchip.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/dw_mmc-rockchip.c b/drivers/mmc/host/dw_mmc-rockchip.c
> index baa23b51773127b4137f472581259b61649273a5..9e3d17becf65ffb60fe3d32d2cdec341fbd30b1e 100644
> --- a/drivers/mmc/host/dw_mmc-rockchip.c
> +++ b/drivers/mmc/host/dw_mmc-rockchip.c
> @@ -5,6 +5,7 @@
>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/mmc/host.h>
>  #include <linux/of_address.h>
> @@ -24,8 +25,6 @@
>  #define ROCKCHIP_MMC_DELAYNUM_OFFSET   2
>  #define ROCKCHIP_MMC_DELAYNUM_MASK     (0xff << ROCKCHIP_MMC_DELAYNUM_OFFSET)
>  #define ROCKCHIP_MMC_DELAY_ELEMENT_PSEC        60
> -#define HIWORD_UPDATE(val, mask, shift) \
> -               ((val) << (shift) | (mask) << ((shift) + 16))
>
>  static const unsigned int freqs[] = { 100000, 200000, 300000, 400000 };
>
> @@ -148,9 +147,9 @@ static int rockchip_mmc_set_internal_phase(struct dw_mci *host, bool sample, int
>         raw_value |= nineties;
>
>         if (sample)
> -               mci_writel(host, TIMING_CON1, HIWORD_UPDATE(raw_value, 0x07ff, 1));
> +               mci_writel(host, TIMING_CON1, HWORD_UPDATE(GENMASK(11, 1), raw_value));
>         else
> -               mci_writel(host, TIMING_CON0, HIWORD_UPDATE(raw_value, 0x07ff, 1));
> +               mci_writel(host, TIMING_CON0, HWORD_UPDATE(GENMASK(11, 1), raw_value));
>
>         dev_dbg(host->dev, "set %s_phase(%d) delay_nums=%u actual_degrees=%d\n",
>                 sample ? "sample" : "drv", degrees, delay_num,
>
> --
> 2.49.0
>
