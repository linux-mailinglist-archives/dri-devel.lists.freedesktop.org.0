Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A7F31664E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 13:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBAE6EC6D;
	Wed, 10 Feb 2021 12:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C5C6EC6D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 12:14:26 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q8so2184276wru.13
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 04:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q7A22HFZX3jXEwzvGwTrJ0RrA/5bp6I5QM9PjiZQMj4=;
 b=SAlTCIaIviBiCo2jEAZBiVM0Cp17SOksISbD4NXPukDEjuVLs9A9WwdkwgwV6bvthm
 yChi5QW8PkkYwhUL7oSryhzpm0GLR6PHEYdNbILvLkDPVm32E7e14L5iASnl9joFhbN2
 5bZvdRHe3A++fmRnEkJeoeKRFmH8dA/asMB752eaUHQ5kuuHR2JdrMm5jckYmbx44PAy
 p0XSRPrw7aUEzcE0N4fAgl+lJy0CTetcjjtp1nGfAGApxClhKE83g9cSkKHkQBiLGIVr
 cYTdL0YciQqMCczFOpWjNEnzBt/xZlf6Iuk7VoJuJCWdy29W/CeeOUX6jjBmPd/ufDw/
 XwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q7A22HFZX3jXEwzvGwTrJ0RrA/5bp6I5QM9PjiZQMj4=;
 b=VA8j25sJd78ANZq5SuGSuts7lK5B+c2cGkiJMtyRjiLnw6h+2eBEM57TPDURlsuD1n
 6IZBeItuRKSO46aVEgvB5FnGOHIpNLR0ykymh5edCxX67InSThfToOj59dBdMNgo/PJp
 XfatcMKjZzFCTApNPJbI79FdqGQFYLJPau4pf4H96h9NeDM6i0W7NtY1pfFHx9OVyINq
 tzD2esQbC2PkawI/D5HsyriTe+LZXASXIhxX0rtgje3Co3/YumNW1689Zo/qBbyxtWWb
 Srkp0ODSF8PDBGe3JNGL0PkRZ3NK6FMaJi1vs+6nV9pCluG6LBV9JSePbQ7cgUcJfMb2
 QVaA==
X-Gm-Message-State: AOAM53133JLiCe2aLnwp0zTGzfMMLp9IJOSRyDxbi0YbxdYgH3IqTd3L
 n9LioLLSo8r3cO4Tvo2zHqU=
X-Google-Smtp-Source: ABdhPJzbry3k1Rn85GUa+cGDkF68krhRjNxoxo/54kDRHvYAoECLQu0zXCMF35R3HHXY1n3SKoYwTw==
X-Received: by 2002:a5d:5910:: with SMTP id v16mr3475979wrd.29.1612959265591; 
 Wed, 10 Feb 2021 04:14:25 -0800 (PST)
Received: from ziggy.stardust (static-188-169-27-46.ipcom.comunitel.net.
 [46.27.169.188])
 by smtp.gmail.com with ESMTPSA id u10sm2093058wmj.40.2021.02.10.04.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 04:14:25 -0800 (PST)
Subject: Re: [PATCH v13 7/8] soc: mediatek: add mtk mutex support for MT8183
To: Enric Balletbo Serra <eballetbo@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20210129092209.2584718-1-hsinyi@chromium.org>
 <20210129092209.2584718-8-hsinyi@chromium.org>
 <CAFqH_53pqgxV0UotaaXNTN=3gfDyHfAzZv6QH9JOdKyg2TEKvw@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <879e6699-75c1-476b-8114-83b97fd4e00a@gmail.com>
Date: Wed, 10 Feb 2021 13:14:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAFqH_53pqgxV0UotaaXNTN=3gfDyHfAzZv6QH9JOdKyg2TEKvw@mail.gmail.com>
Content-Language: en-US
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09/02/2021 15:48, Enric Balletbo Serra wrote:
> Hi Hsin-Yi,
> 
> Thank you for your patch.
> 
> Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dv., 29 de gen.
> 2021 a les 10:23:
>>
>> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
>>
>> Add mtk mutex support for MT8183 SoC.
>>
>> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> 
> FWIW this patch is required to have the display working on the
> Chromebook IdeaPad Duet, so
> 
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> 
> Matthias, If I am not wrong, this patch is the only one that is not
> applied for this series. I know that is too late for 5.12, but If
> you're fine with it, could you pick this patch directly or do you
> prefer a resend of this patch alone once you will start to accept
> patches for the next release?

This patch is based on top of a patch that's in CK's branch.
Let's wait for v5.12-rc1 then I'll take it. If I forget just ping me here/IRC

Regards,
Matthias

> 
> Thanks,
>   Enric
> 
>> ---
>>  drivers/soc/mediatek/mtk-mutex.c | 50 ++++++++++++++++++++++++++++++++
>>  1 file changed, 50 insertions(+)
>>
>> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
>> index f531b119da7a9..718a41beb6afb 100644
>> --- a/drivers/soc/mediatek/mtk-mutex.c
>> +++ b/drivers/soc/mediatek/mtk-mutex.c
>> @@ -14,6 +14,8 @@
>>
>>  #define MT2701_MUTEX0_MOD0                     0x2c
>>  #define MT2701_MUTEX0_SOF0                     0x30
>> +#define MT8183_MUTEX0_MOD0                     0x30
>> +#define MT8183_MUTEX0_SOF0                     0x2c
>>
>>  #define DISP_REG_MUTEX_EN(n)                   (0x20 + 0x20 * (n))
>>  #define DISP_REG_MUTEX(n)                      (0x24 + 0x20 * (n))
>> @@ -37,6 +39,18 @@
>>  #define MT8167_MUTEX_MOD_DISP_DITHER           15
>>  #define MT8167_MUTEX_MOD_DISP_UFOE             16
>>
>> +#define MT8183_MUTEX_MOD_DISP_RDMA0            0
>> +#define MT8183_MUTEX_MOD_DISP_RDMA1            1
>> +#define MT8183_MUTEX_MOD_DISP_OVL0             9
>> +#define MT8183_MUTEX_MOD_DISP_OVL0_2L          10
>> +#define MT8183_MUTEX_MOD_DISP_OVL1_2L          11
>> +#define MT8183_MUTEX_MOD_DISP_WDMA0            12
>> +#define MT8183_MUTEX_MOD_DISP_COLOR0           13
>> +#define MT8183_MUTEX_MOD_DISP_CCORR0           14
>> +#define MT8183_MUTEX_MOD_DISP_AAL0             15
>> +#define MT8183_MUTEX_MOD_DISP_GAMMA0           16
>> +#define MT8183_MUTEX_MOD_DISP_DITHER0          17
>> +
>>  #define MT8173_MUTEX_MOD_DISP_OVL0             11
>>  #define MT8173_MUTEX_MOD_DISP_OVL1             12
>>  #define MT8173_MUTEX_MOD_DISP_RDMA0            13
>> @@ -87,6 +101,11 @@
>>  #define MT2712_MUTEX_SOF_DSI3                  6
>>  #define MT8167_MUTEX_SOF_DPI0                  2
>>  #define MT8167_MUTEX_SOF_DPI1                  3
>> +#define MT8183_MUTEX_SOF_DSI0                  1
>> +#define MT8183_MUTEX_SOF_DPI0                  2
>> +
>> +#define MT8183_MUTEX_EOF_DSI0                  (MT8183_MUTEX_SOF_DSI0 << 6)
>> +#define MT8183_MUTEX_EOF_DPI0                  (MT8183_MUTEX_SOF_DPI0 << 6)
>>
>>  struct mtk_mutex {
>>         int id;
>> @@ -181,6 +200,20 @@ static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>>         [DDP_COMPONENT_WDMA1] = MT8173_MUTEX_MOD_DISP_WDMA1,
>>  };
>>
>> +static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>> +       [DDP_COMPONENT_AAL0] = MT8183_MUTEX_MOD_DISP_AAL0,
>> +       [DDP_COMPONENT_CCORR] = MT8183_MUTEX_MOD_DISP_CCORR0,
>> +       [DDP_COMPONENT_COLOR0] = MT8183_MUTEX_MOD_DISP_COLOR0,
>> +       [DDP_COMPONENT_DITHER] = MT8183_MUTEX_MOD_DISP_DITHER0,
>> +       [DDP_COMPONENT_GAMMA] = MT8183_MUTEX_MOD_DISP_GAMMA0,
>> +       [DDP_COMPONENT_OVL0] = MT8183_MUTEX_MOD_DISP_OVL0,
>> +       [DDP_COMPONENT_OVL_2L0] = MT8183_MUTEX_MOD_DISP_OVL0_2L,
>> +       [DDP_COMPONENT_OVL_2L1] = MT8183_MUTEX_MOD_DISP_OVL1_2L,
>> +       [DDP_COMPONENT_RDMA0] = MT8183_MUTEX_MOD_DISP_RDMA0,
>> +       [DDP_COMPONENT_RDMA1] = MT8183_MUTEX_MOD_DISP_RDMA1,
>> +       [DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
>> +};
>> +
>>  static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>>         [MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>>         [MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
>> @@ -198,6 +231,13 @@ static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>>         [MUTEX_SOF_DPI1] = MT8167_MUTEX_SOF_DPI1,
>>  };
>>
>> +/* Add EOF setting so overlay hardware can receive frame done irq */
>> +static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>> +       [MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>> +       [MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
>> +       [MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
>> +};
>> +
>>  static const struct mtk_mutex_data mt2701_mutex_driver_data = {
>>         .mutex_mod = mt2701_mutex_mod,
>>         .mutex_sof = mt2712_mutex_sof,
>> @@ -227,6 +267,14 @@ static const struct mtk_mutex_data mt8173_mutex_driver_data = {
>>         .mutex_sof_reg = MT2701_MUTEX0_SOF0,
>>  };
>>
>> +static const struct mtk_mutex_data mt8183_mutex_driver_data = {
>> +       .mutex_mod = mt8183_mutex_mod,
>> +       .mutex_sof = mt8183_mutex_sof,
>> +       .mutex_mod_reg = MT8183_MUTEX0_MOD0,
>> +       .mutex_sof_reg = MT8183_MUTEX0_SOF0,
>> +       .no_clk = true,
>> +};
>> +
>>  struct mtk_mutex *mtk_mutex_get(struct device *dev)
>>  {
>>         struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
>> @@ -457,6 +505,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
>>           .data = &mt8167_mutex_driver_data},
>>         { .compatible = "mediatek,mt8173-disp-mutex",
>>           .data = &mt8173_mutex_driver_data},
>> +       { .compatible = "mediatek,mt8183-disp-mutex",
>> +         .data = &mt8183_mutex_driver_data},
>>         {},
>>  };
>>  MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
>> --
>> 2.30.0.365.g02bc693789-goog
>>
>>
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
