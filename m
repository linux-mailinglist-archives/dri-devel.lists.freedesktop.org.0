Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEB3AE0293
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 12:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC8210E081;
	Thu, 19 Jun 2025 10:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pbHsg+Uo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A906710E081
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 10:25:24 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e81749142b3so588762276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 03:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750328723; x=1750933523; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ua4ESBOBusXcEPYVXoT+f1Oc5QbUn+Vjv+tNr5h2kMY=;
 b=pbHsg+UoIGZtchq/0hdQtgRUvD/I9A9S4Y2sWN5fCZ/DYFjT1yGxn2boTJWFw4rB+N
 KWEYSGnYgs5rJhROcnfe2f8vLPS21mKPDTXRb2dbwhaHuophwFiJInvL7RFHNgPZ1NRN
 k6XqUgaxCNrPbza3RsD8VQ1+YKbvmhhcfsgh8mfYVSXM1IP8VLROXFx0MR/he8cOBwIT
 euFjOuj1PM/fPsG8iOCAzc6OSmFvz3ca2MdpxkM83MikGtTBDnZZus8yaoMQ2AKDeFw8
 3S5iAVWhUZAe7RDx905cIl5SZ3nn2FbIJvaYeYhqqruA7fRkO0f2EZopQ3pMylHh2ECm
 xv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750328723; x=1750933523;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ua4ESBOBusXcEPYVXoT+f1Oc5QbUn+Vjv+tNr5h2kMY=;
 b=FSAB9e4y/oGgREU2LJzBKgYhBxodmSJjIP6mPA4V8HkPFgz6OcpOjlG7uZYiEs2OHe
 K6fQWSEKe2ZGNBkUTM/61MBVOMnp6ncWQwSzVuDNRx6VsLNkvt0/tgSxtVe58NZnRxjx
 pje+CILkMEzqsMR1Xl7tziV6NwND7qMaesiE7JD+2WG+aJoJMBVg/NR7dCJerP/5l5VO
 m9+X+EnBLiVkzxHyA+wuLQSeHAvjvnYCtj1EPDCWAahpitBbQTQX2oI2SBSSfvQZOzZ3
 u2FFLjZEIiJLJd2NbDVrBZTm9pRQfW+qBwyn1G0jNFOxLR+wGEzL3ZGy8hXs+kTCqrh+
 IMwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUhqBgQNkawbp/cpSNnEiNmsPF+GGqocOPbQI1H+g4/M3/Llpdx4P6Intod2V8ZK35EY5aFL9LQ8A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzkVFvvMcziFmnq7HJC6N1ryzIWk/ZSCgHnebVBxOtKwrKwmYd
 i6WNGwxe43smM9yByNlXbGuN1vDc17v8+6fL7uImNm3CtabTK51JmThxNnF3btFrClzbN/K2RAW
 2PmDgKoUq4dyDxkE40sHZHcaXoF7bf/xFXgbAd3sUdA==
X-Gm-Gg: ASbGnctr2Cvk6IwkkA/kxXJDFS8MIJVd2IXc+PfXrGrc8CY6XKMXILxd0fQERAh3zW5
 KidawL9cDKf9rOHbaMLVrgnJkFQeCQqkyBLMgsY7YgwcHygxa3k+baLw5Ang3j/mI564M36HU7i
 /dtFNFGa5Lihj6Z0MnL2TazpIRmAMYhfcYrYA11B9IJThF
X-Google-Smtp-Source: AGHT+IEd1Y2dYwu5kQzmOiqV3OZ5X0v2pCQJYBuRmzgW1uRqeViVETMJf6n3heh0RuoVtnPHqbuzFhL0HpKezAowQ9Y=
X-Received: by 2002:a05:6902:1207:b0:e7d:13f2:943c with SMTP id
 3f1490d57ef6-e822ad92dedmr26314262276.41.1750328723568; Thu, 19 Jun 2025
 03:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102228eucas1p1906803f73cc004e68f281b2bdf871da3@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <20250618-apr_14_for_sending-v5-3-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-3-27ed33ea5c6f@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Jun 2025 12:24:47 +0200
X-Gm-Features: Ac12FXzw77jNMgM4ecKpiOyLqo41UGjlRF2A49p8Af0bxhXr8nkUTTfXWCm5OqM
Message-ID: <CAPDyKFq_4W7bPr1NiuEGzMDoY6tQuHbw5uOXrkJagbEbtmqMWg@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] pmdomain: thead: Instantiate GPU power sequencer
 via auxiliary bus
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Wed, 18 Jun 2025 at 12:22, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> In order to support the complex power sequencing required by the TH1520
> GPU, the AON power domain driver must be responsible for initiating the
> corresponding sequencer driver. This functionality is specific to
> platforms where the GPU power sequencing hardware is controlled by the
> AON block.
>
> Extend the AON power domain driver to check for the presence of the
> "gpu-clkgen" reset in its own device tree node.
>
> If the property is found, create and register a new auxiliary device.
> This device acts as a proxy that allows the dedicated `pwrseq-thead-gpu`
> auxiliary driver to bind and take control of the sequencing logic.
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

It looks like there is another re-spin needed, but thinking of the
merge-strategy I could potentially take patch1->patch3 via my pmdomain
tree, as it seems reasonable to keep those changes together. Unless
Bartosz sees any problem with that, of course.

Kind regards
Uffe

> ---
>  drivers/pmdomain/thead/Kconfig             |  1 +
>  drivers/pmdomain/thead/th1520-pm-domains.c | 51 ++++++++++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
>
> diff --git a/drivers/pmdomain/thead/Kconfig b/drivers/pmdomain/thead/Kconfig
> index 7d52f8374b074167d508a80fd807929c53faef12..208828e0fa0dc91256bf808b905bea32bb84250d 100644
> --- a/drivers/pmdomain/thead/Kconfig
> +++ b/drivers/pmdomain/thead/Kconfig
> @@ -4,6 +4,7 @@ config TH1520_PM_DOMAINS
>         tristate "Support TH1520 Power Domains"
>         depends on TH1520_AON_PROTOCOL
>         select REGMAP_MMIO
> +       select AUXILIARY_BUS
>         help
>           This driver enables power domain management for the T-HEAD
>           TH-1520 SoC. On this SoC there are number of power domains,
> diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
> index f702e20306f469aeb0ed15e54bd4f8309f28018c..9040b698e7f7f2400163841530fecacfb0f917bc 100644
> --- a/drivers/pmdomain/thead/th1520-pm-domains.c
> +++ b/drivers/pmdomain/thead/th1520-pm-domains.c
> @@ -5,6 +5,7 @@
>   * Author: Michal Wilczynski <m.wilczynski@samsung.com>
>   */
>
> +#include <linux/auxiliary_bus.h>
>  #include <linux/firmware/thead/thead,th1520-aon.h>
>  #include <linux/slab.h>
>  #include <linux/platform_device.h>
> @@ -128,6 +129,50 @@ static void th1520_pd_init_all_off(struct generic_pm_domain **domains,
>         }
>  }
>
> +static void th1520_pd_pwrseq_unregister_adev(void *adev)
> +{
> +       auxiliary_device_delete(adev);
> +       auxiliary_device_uninit(adev);
> +}
> +
> +static int th1520_pd_pwrseq_gpu_init(struct device *dev)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       /*
> +        * Correctly check only for the property's existence in the DT node.
> +        * We don't need to get/claim the reset here; that is the job of
> +        * the auxiliary driver that we are about to spawn.
> +        */
> +       if (device_property_match_string(dev, "reset-names", "gpu-clkgen") < 0)
> +               /*
> +                * This is not an error. It simply means the optional sequencer
> +                * is not described in the device tree.
> +                */
> +               return 0;
> +
> +       adev = devm_kzalloc(dev, sizeof(*adev), GFP_KERNEL);
> +       if (!adev)
> +               return -ENOMEM;
> +
> +       adev->name = "pwrseq-gpu";
> +       adev->dev.parent = dev;
> +
> +       ret = auxiliary_device_init(adev);
> +       if (ret)
> +               return ret;
> +
> +       ret = auxiliary_device_add(adev);
> +       if (ret) {
> +               auxiliary_device_uninit(adev);
> +               return ret;
> +       }
> +
> +       return devm_add_action_or_reset(dev, th1520_pd_pwrseq_unregister_adev,
> +                                       adev);
> +}
> +
>  static int th1520_pd_probe(struct platform_device *pdev)
>  {
>         struct generic_pm_domain **domains;
> @@ -186,8 +231,14 @@ static int th1520_pd_probe(struct platform_device *pdev)
>         if (ret)
>                 goto err_clean_genpd;
>
> +       ret = th1520_pd_pwrseq_gpu_init(dev);
> +       if (ret)
> +               goto err_clean_provider;
> +
>         return 0;
>
> +err_clean_provider:
> +       of_genpd_del_provider(dev->of_node);
>  err_clean_genpd:
>         for (i--; i >= 0; i--)
>                 pm_genpd_remove(domains[i]);
>
> --
> 2.34.1
>
