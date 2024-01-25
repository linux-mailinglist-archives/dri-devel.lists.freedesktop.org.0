Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 226EE83C7F0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 17:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A586D10E577;
	Thu, 25 Jan 2024 16:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF96910E2C3;
 Thu, 25 Jan 2024 16:28:44 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-6e0a64d94d1so4143333a34.3; 
 Thu, 25 Jan 2024 08:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706200064; x=1706804864; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dwRxZvGRs7JFUtLi1loUz7ZrrENhM3PimANGbB+eqOY=;
 b=PcVWtkL4FriCVfFJ9Rw6azMw8Nk02L9TcD3TA/Ncak37AMNj4dcMAgeC6N4B4JZi54
 c3a0jTLfAmm3JRK9Mz0yQmLbw7B7Vv0l2kLa1CsKS5Q+Ttm82DJE/R0tpyAFMBDwZjB1
 4gdHhiU7U2Z71J6iSB2mnZcAgYh4I1GSCc723rZN46P2GV/kyE7YxwEe1ZZ6DYaiIXnh
 CwGoVuMgXo5YuVcT+caQUSd2Ko8W3WvM6ybykbB4HsVsLu2SU9B8u/wjwhMXAKYAjl/4
 5tXlbQkvFJeDV97+coluzVVd93GvndG/xtfGM+RzJ0jkzL/zzF0BXJiVHi9U+KuYvav6
 ZTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706200064; x=1706804864;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dwRxZvGRs7JFUtLi1loUz7ZrrENhM3PimANGbB+eqOY=;
 b=H3aSvQJQCsl4BJ5b8OiOUzxRKj9VjDmPbthFsCCH6mJgNmK//cCqeAaVkrMKbh9MXk
 o5OFUyOSpcq+qM0Xzq1rEVgxNeXA8Fj9ffIeRehz6ekxhMs3vAGhp3FFnoAA1lnbYGSz
 loBTohi6sqWShum+/Oru+yfMMb8x1vdsVT/cqM+Ee/i6N/NkH0pv0yzktBW9y7AlP/DS
 MNHP0ijxCwJMKIkY43WbLLgkyuPIhksDDYhRQ5iVONP+VG94tfqGqsOUBGY0A3LuPG+M
 WyOQDO2BztTpc6+bxloob6en7UTGmQB/hs+izqqerjiQBw9fti5yowC2J9YyQ7ZkTwaQ
 38dg==
X-Gm-Message-State: AOJu0YxOMgOPHs+FNnNtSH5NqwqGOMZGb1H+dKSftZoIUmBbID/24qsx
 8My+eWHaSOeOiZ9hMZUY2JbVdtpRvZWSDkrEVhgkdcRDEjNZYnO8cHMcTEAyBRMp2vQ5Q5j5W/e
 6wYqxWXHdBWkvPHt2cMC66fB0vGc=
X-Google-Smtp-Source: AGHT+IG6UrA79AJnRq/WYLV9gPqguU+PFzbYQgGj0zyccFPKZNcQQKPUtvUH3R3EjSxId4Etg4j5nBMhbc7Cl4vUk9Q=
X-Received: by 2002:a05:6870:c6a2:b0:214:8388:2915 with SMTP id
 cv34-20020a056870c6a200b0021483882915mr1167898oab.1.1706200063900; Thu, 25
 Jan 2024 08:27:43 -0800 (PST)
MIME-Version: 1.0
References: <20240125-etnaviv-npu-v2-0-ba23c9a32be1@pengutronix.de>
 <20240125-etnaviv-npu-v2-2-ba23c9a32be1@pengutronix.de>
In-Reply-To: <20240125-etnaviv-npu-v2-2-ba23c9a32be1@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 25 Jan 2024 17:27:31 +0100
Message-ID: <CAH9NwWd7kuk9LFD0cXiy3wm50KHVT8uGM37hdv4=rN9+YGCZmw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/etnaviv: Turn etnaviv_is_model_rev() into a
 function
To: Philipp Zabel <p.zabel@pengutronix.de>
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Russell King <linux+etnaviv@armlinux.org.uk>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp

>
> Turn the etnaviv_is_model_rev() macro into a static inline function.
> Use the raw model number as a parameter instead of the chipModel_GCxxxx
> defines. This reduces synchronization requirements for the generated
> headers. For newer hardware, the GCxxxx names are not the correct model
> names anyway. For example, model 0x8000 NPUs are called VIPNano-QI/SI(+)
> by VeriSilicon.

To catch up with your NPU example Vivante's kernel driver has such
lines in its hw database [0]

/* vipnano-si+ */
{
    0x8000, /* ChipID */
    0x8002, /* ChipRevision */
    0x5080009, /* ProductID */
    0x6000000, /* EcoID */
    0x9f, /* CustomerID */
    ...

I think in reality this function should be called
etnaviv_is_chip_rev(..) or etnaviv_is_id_rev(..). That would be
semantically correct and we could even stick the the current macro
(that gets renamed) and with the current
GCxxx defines.

[0]: https://github.com/nxp-imx/linux-imx/blob/lf-6.1.y/drivers/mxc/gpu-viv/hal/kernel/inc/gc_feature_database.h#L22373

>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 66 ++++++++++++++++++-----------------
>  1 file changed, 34 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 9b8445d2a128..c61d50dd3829 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -172,10 +172,12 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value)
>         return 0;
>  }
>
> +static inline bool etnaviv_is_model_rev(struct etnaviv_gpu *gpu, u32 model, u32 revision)
> +{
> +       return gpu->identity.model == model &&
> +              gpu->identity.revision == revision;
> +}
>
> -#define etnaviv_is_model_rev(gpu, mod, rev) \
> -       ((gpu)->identity.model == chipModel_##mod && \
> -        (gpu)->identity.revision == rev)
>  #define etnaviv_field(val, field) \
>         (((val) & field##__MASK) >> field##__SHIFT)
>
> @@ -281,7 +283,7 @@ static void etnaviv_hw_specs(struct etnaviv_gpu *gpu)
>
>         switch (gpu->identity.instruction_count) {
>         case 0:
> -               if (etnaviv_is_model_rev(gpu, GC2000, 0x5108) ||
> +               if (etnaviv_is_model_rev(gpu, 0x2000, 0x5108) ||
>                     gpu->identity.model == chipModel_GC880)
>                         gpu->identity.instruction_count = 512;
>                 else
> @@ -315,17 +317,17 @@ static void etnaviv_hw_specs(struct etnaviv_gpu *gpu)
>          * For some cores, two varyings are consumed for position, so the
>          * maximum varying count needs to be reduced by one.
>          */
> -       if (etnaviv_is_model_rev(gpu, GC5000, 0x5434) ||
> -           etnaviv_is_model_rev(gpu, GC4000, 0x5222) ||
> -           etnaviv_is_model_rev(gpu, GC4000, 0x5245) ||
> -           etnaviv_is_model_rev(gpu, GC4000, 0x5208) ||
> -           etnaviv_is_model_rev(gpu, GC3000, 0x5435) ||
> -           etnaviv_is_model_rev(gpu, GC2200, 0x5244) ||
> -           etnaviv_is_model_rev(gpu, GC2100, 0x5108) ||
> -           etnaviv_is_model_rev(gpu, GC2000, 0x5108) ||
> -           etnaviv_is_model_rev(gpu, GC1500, 0x5246) ||
> -           etnaviv_is_model_rev(gpu, GC880, 0x5107) ||
> -           etnaviv_is_model_rev(gpu, GC880, 0x5106))
> +       if (etnaviv_is_model_rev(gpu, 0x5000, 0x5434) ||
> +           etnaviv_is_model_rev(gpu, 0x4000, 0x5222) ||
> +           etnaviv_is_model_rev(gpu, 0x4000, 0x5245) ||
> +           etnaviv_is_model_rev(gpu, 0x4000, 0x5208) ||
> +           etnaviv_is_model_rev(gpu, 0x3000, 0x5435) ||
> +           etnaviv_is_model_rev(gpu, 0x2200, 0x5244) ||
> +           etnaviv_is_model_rev(gpu, 0x2100, 0x5108) ||
> +           etnaviv_is_model_rev(gpu, 0x2000, 0x5108) ||
> +           etnaviv_is_model_rev(gpu, 0x1500, 0x5246) ||
> +           etnaviv_is_model_rev(gpu, 0x880, 0x5107) ||
> +           etnaviv_is_model_rev(gpu, 0x880, 0x5106))
>                 gpu->identity.varyings_count -= 1;
>  }
>
> @@ -351,7 +353,7 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
>                  * Reading these two registers on GC600 rev 0x19 result in a
>                  * unhandled fault: external abort on non-linefetch
>                  */
> -               if (!etnaviv_is_model_rev(gpu, GC600, 0x19)) {
> +               if (!etnaviv_is_model_rev(gpu, 0x600, 0x19)) {
>                         gpu->identity.product_id = gpu_read(gpu, VIVS_HI_CHIP_PRODUCT_ID);
>                         gpu->identity.eco_id = gpu_read(gpu, VIVS_HI_CHIP_ECO_ID);
>                 }
> @@ -368,7 +370,7 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
>                 }
>
>                 /* Another special case */
> -               if (etnaviv_is_model_rev(gpu, GC300, 0x2201)) {
> +               if (etnaviv_is_model_rev(gpu, 0x300, 0x2201)) {
>                         u32 chipTime = gpu_read(gpu, VIVS_HI_CHIP_TIME);
>
>                         if (chipDate == 0x20080814 && chipTime == 0x12051100) {
> @@ -387,15 +389,15 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
>                  * Fix model/rev here, so all other places can refer to this
>                  * core by its real identity.
>                  */
> -               if (etnaviv_is_model_rev(gpu, GC2000, 0xffff5450)) {
> +               if (etnaviv_is_model_rev(gpu, 0x2000, 0xffff5450)) {
>                         gpu->identity.model = chipModel_GC3000;
>                         gpu->identity.revision &= 0xffff;
>                 }
>
> -               if (etnaviv_is_model_rev(gpu, GC1000, 0x5037) && (chipDate == 0x20120617))
> +               if (etnaviv_is_model_rev(gpu, 0x1000, 0x5037) && (chipDate == 0x20120617))
>                         gpu->identity.eco_id = 1;
>
> -               if (etnaviv_is_model_rev(gpu, GC320, 0x5303) && (chipDate == 0x20140511))
> +               if (etnaviv_is_model_rev(gpu, 0x320, 0x5303) && (chipDate == 0x20140511))
>                         gpu->identity.eco_id = 1;
>         }
>
> @@ -630,14 +632,14 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv_gpu *gpu)
>                 pmc |= BIT(15); /* Unknown bit */
>
>         /* Disable TX clock gating on affected core revisions. */
> -       if (etnaviv_is_model_rev(gpu, GC4000, 0x5222) ||
> -           etnaviv_is_model_rev(gpu, GC2000, 0x5108) ||
> -           etnaviv_is_model_rev(gpu, GC2000, 0x6202) ||
> -           etnaviv_is_model_rev(gpu, GC2000, 0x6203))
> +       if (etnaviv_is_model_rev(gpu, 0x4000, 0x5222) ||
> +           etnaviv_is_model_rev(gpu, 0x2000, 0x5108) ||
> +           etnaviv_is_model_rev(gpu, 0x2000, 0x6202) ||
> +           etnaviv_is_model_rev(gpu, 0x2000, 0x6203))
>                 pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_TX;
>
>         /* Disable SE and RA clock gating on affected core revisions. */
> -       if (etnaviv_is_model_rev(gpu, GC7000, 0x6202))
> +       if (etnaviv_is_model_rev(gpu, 0x7000, 0x6202))
>                 pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_SE |
>                        VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA;
>
> @@ -690,14 +692,14 @@ static void etnaviv_gpu_setup_pulse_eater(struct etnaviv_gpu *gpu)
>          */
>         u32 pulse_eater = 0x01590880;
>
> -       if (etnaviv_is_model_rev(gpu, GC4000, 0x5208) ||
> -           etnaviv_is_model_rev(gpu, GC4000, 0x5222)) {
> +       if (etnaviv_is_model_rev(gpu, 0x4000, 0x5208) ||
> +           etnaviv_is_model_rev(gpu, 0x4000, 0x5222)) {
>                 pulse_eater |= BIT(23);
>
>         }
>
> -       if (etnaviv_is_model_rev(gpu, GC1000, 0x5039) ||
> -           etnaviv_is_model_rev(gpu, GC1000, 0x5040)) {
> +       if (etnaviv_is_model_rev(gpu, 0x1000, 0x5039) ||
> +           etnaviv_is_model_rev(gpu, 0x1000, 0x5040)) {
>                 pulse_eater &= ~BIT(16);
>                 pulse_eater |= BIT(17);
>         }
> @@ -718,8 +720,8 @@ static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
>         WARN_ON(!(gpu->state == ETNA_GPU_STATE_IDENTIFIED ||
>                   gpu->state == ETNA_GPU_STATE_RESET));
>
> -       if ((etnaviv_is_model_rev(gpu, GC320, 0x5007) ||
> -            etnaviv_is_model_rev(gpu, GC320, 0x5220)) &&
> +       if ((etnaviv_is_model_rev(gpu, 0x320, 0x5007) ||
> +            etnaviv_is_model_rev(gpu, 0x320, 0x5220)) &&
>             gpu_read(gpu, VIVS_HI_CHIP_TIME) != 0x2062400) {
>                 u32 mc_memory_debug;
>
> @@ -745,7 +747,7 @@ static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
>                   VIVS_HI_AXI_CONFIG_ARCACHE(2));
>
>         /* GC2000 rev 5108 needs a special bus config */
> -       if (etnaviv_is_model_rev(gpu, GC2000, 0x5108)) {
> +       if (etnaviv_is_model_rev(gpu, 0x2000, 0x5108)) {
>                 u32 bus_config = gpu_read(gpu, VIVS_MC_BUS_CONFIG);
>                 bus_config &= ~(VIVS_MC_BUS_CONFIG_FE_BUS_CONFIG__MASK |
>                                 VIVS_MC_BUS_CONFIG_TX_BUS_CONFIG__MASK);
>
> --
> 2.39.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
