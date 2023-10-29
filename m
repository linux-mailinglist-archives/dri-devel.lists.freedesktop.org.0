Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BA47DB0D8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 00:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247A010E1EF;
	Sun, 29 Oct 2023 23:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D33810E1EF
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 23:19:48 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5af6c445e9eso27387377b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 16:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698621587; x=1699226387; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xuWU9MUb030nVJsD+BEmc/ZxZiX/gNjtxDSBKfLdpaA=;
 b=a0+Vuf8AMCVANCFuFA/JiQYsWUWlrhgtHV2b9TZb3XNQosqJ9joVSEwBS3Jl9O+0FZ
 1z/pHaBaMhGqkqC2OQecQe9uQ9oBZI2zl1wYrd+f3LJUC/UsoAQOg4g5COrBMXRCY60M
 vUv1ehapxCBAwMxYv2HLM2ISmhfzz9VFKEBxWZJQLfzO7Xh7XK/WPQvqVmCyZEwOrGTF
 J7hE73fUlEIgeGOT0eNzJTIGq6hU3mUrFsvWetUwl6glV+h9uSt1FIXgos7/ZNR9UCcp
 C9U0MisjHaS/dMYcwC2IWB0GeBbDjChx9PEE7NFJEsNnlT+35kid2sU8CNsJshVwkP3E
 kzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698621587; x=1699226387;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xuWU9MUb030nVJsD+BEmc/ZxZiX/gNjtxDSBKfLdpaA=;
 b=upreaWsrgjIKjkUUTzK4yXXV/lWPXU5vALcnbrB1q7hZni3ZIFbiFBfF5frBLNFUWH
 KNcs0Z6AmgF85L3Li16et1Xtd2VqWrDOlWBg5Vd/+Ex1fj+msjTt8EYP9jxYQt8J4h9o
 7FxnND4BtW0Q7+yf9w15g4LDNHHBIG0zdjaI4GvNgj1XjCXcpd1tx+oPdZEldyi/IKf6
 Y2YSkeCSV0O6omsEN3SiMZEenROZFH3RjyUT+h4JhiDQE5h/t+zCn0tuttv5quaDMWpg
 NfkXsbkz6pqn5hlWlNYw5wdd5C3OxqppgtVgfcFdBKgEpNZ3rEfYcBrGyPyTwng9e5Z3
 vR5w==
X-Gm-Message-State: AOJu0YwVGHtJ/wb0xxCL4oKNyY6Kbc8463oSaGO9P+N8MB01qRlaA0Zs
 JrzbiISRZqR6f4C2DD8qR/mQjfRE12pS6uxNQRqjcA==
X-Google-Smtp-Source: AGHT+IEnpFKWPrIRVQHeaFdGi2QsJDkeV8m8Ju1h+8EhHXVWGlzOH3mBMAnBjd5mEcVeX2yzwvBVR7Y7vhJWP9xOkXQ=
X-Received: by 2002:a81:ad06:0:b0:5a7:b515:ae47 with SMTP id
 l6-20020a81ad06000000b005a7b515ae47mr8100852ywh.9.1698621587653; Sun, 29 Oct
 2023 16:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231029194607.379459-1-suijingfeng@loongson.cn>
 <20231029194607.379459-8-suijingfeng@loongson.cn>
In-Reply-To: <20231029194607.379459-8-suijingfeng@loongson.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 30 Oct 2023 01:19:36 +0200
Message-ID: <CAA8EJpqrWV1f_pFqZt1Evo+WrZfy1mOynaTQ85uY9o4tVPZJPw@mail.gmail.com>
Subject: Re: [PATCH 7/8] drm/loongson: Support to infer DC reversion from
 CPU's PRID value
To: Sui Jingfeng <suijingfeng@loongson.cn>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 29 Oct 2023 at 21:46, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>
> Due to the fact that the same display IP core has been integrated into
> different platform, there is a need to differentiate them on the runtime.
> The DC in LS7A1000/LS2K1000 has the PCI vendor & device ID of 0x0014:0x7A06
> The DC in LS7A2000/LS2K2000 has the PCI vendor & device ID of 0x0014:0x7A36
>
> Because the output ports and host platform of the DC IP varies, without a
> revision information we can't achieve fine-grained controls. The canonical
> approach to do such a thing is to read reversion register from the PCIe
> device. But LS2K1000 SoC was taped out at 2017, it is rather old. Our BIOS
> engineer don't assign a different revision ID to it, probably because of
> ignorance.
>
> LS2K2000 SoC was newly taped on 2023, we strictly force the BIOS engineer
> assign a different revision ID(0x10) to it. But the problem is that it is
> too casual, there is no formal convention or public documented rule
> established. For Loongson LS2K series SoC, the display controller IP is
> taped togather with the CPU core. For Loongson LS7A series bridge chips,
> the display controller IP is taped togather with the bridge chips itself.
> Consider the fact the all Loongson CPU has a unique PRID, this patch choose
> to infer DC reversion from CPU's PRID value.
>
>  - LS3A4000/LS3A5000 has 0xC0 as its processor ID.
>  - LS2K2000 has 0xB0 as its processor ID.
>  - LS2K2000LA has 0xA0 as its processor ID.
>
> The provided approach has no dependency on DT or ACPI, thus is preferfed.
> Besides, this approach can be used to acquire more addtional HW features.
> So the provided method has the potential to bring more benifits.
>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/loongson/lsdc_drv.h   |  2 ++
>  drivers/gpu/drm/loongson/lsdc_probe.c | 35 +++++++++++++++++++++++++++
>  drivers/gpu/drm/loongson/lsdc_probe.h |  2 ++
>  3 files changed, 39 insertions(+)
>
> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.h b/drivers/gpu/drm/loongson/lsdc_drv.h
> index 46ba9b88a30d..e1f4a2db2a0a 100644
> --- a/drivers/gpu/drm/loongson/lsdc_drv.h
> +++ b/drivers/gpu/drm/loongson/lsdc_drv.h
> @@ -42,6 +42,8 @@
>  enum loongson_chip_id {
>         CHIP_LS7A1000 = 0,
>         CHIP_LS7A2000 = 1,
> +       CHIP_LS2K1000 = 2,
> +       CHIP_LS2K2000 = 3,
>         CHIP_LS_LAST,
>  };
>
> diff --git a/drivers/gpu/drm/loongson/lsdc_probe.c b/drivers/gpu/drm/loongson/lsdc_probe.c
> index 48ba69bb8a98..f49b642d8f65 100644
> --- a/drivers/gpu/drm/loongson/lsdc_probe.c
> +++ b/drivers/gpu/drm/loongson/lsdc_probe.c
> @@ -54,3 +54,38 @@ unsigned int loongson_cpu_get_prid(u8 *imp, u8 *rev)
>
>         return prid;
>  }
> +
> +enum loongson_chip_id loongson_chip_id_fixup(enum loongson_chip_id chip_id)
> +{
> +       u8 impl;
> +
> +       if (loongson_cpu_get_prid(&impl, NULL)) {
> +               /*
> +                * LS2K2000 only has the LoongArch edition.
> +                */
> +               if (chip_id == CHIP_LS7A2000) {
> +                       if (impl == LOONGARCH_CPU_IMP_LS2K2000)
> +                               return CHIP_LS2K2000;
> +               }
> +
> +               /*
> +                * LS2K1000 has the LoongArch edition(with two LA264 CPU core)
> +                * and the Mips edition(with two mips64r2 CPU core), Only the
> +                * instruction set of the CPU are changed, the peripheral
> +                * devices are basically same.
> +                */
> +               if (chip_id == CHIP_LS7A1000) {
> +#if defined(__loongarch__)
> +                       if (impl == LOONGARCH_CPU_IMP_LS2K1000)
> +                               return CHIP_LS2K1000;
> +#endif
> +
> +#if defined(__mips__)
> +                       if (impl == LOONGSON_CPU_MIPS_IMP_LS2K)
> +                               return CHIP_LS2K1000;
> +#endif

Can you drop the ifdefs here? The code blocks do not seem to conflict
with each other.

> +               }
> +       }
> +
> +       return chip_id;
> +}
> diff --git a/drivers/gpu/drm/loongson/lsdc_probe.h b/drivers/gpu/drm/loongson/lsdc_probe.h
> index 8bb6de2e3c64..8c630c5c90ce 100644
> --- a/drivers/gpu/drm/loongson/lsdc_probe.h
> +++ b/drivers/gpu/drm/loongson/lsdc_probe.h
> @@ -9,4 +9,6 @@
>  /* Helpers for chip detection */
>  unsigned int loongson_cpu_get_prid(u8 *impl, u8 *rev);
>
> +enum loongson_chip_id loongson_chip_id_fixup(enum loongson_chip_id chip_id);
> +
>  #endif
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
