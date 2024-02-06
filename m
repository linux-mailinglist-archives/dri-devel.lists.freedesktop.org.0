Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA00684B366
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 12:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FCC10E601;
	Tue,  6 Feb 2024 11:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="e5f64p7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F9F10E601
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 11:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707218691;
 bh=W9eVxM9U4SL9Oval+gIwwmjbVA2ob2C9cUlB+OFaVvA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e5f64p7gND16GTg1YhhbvoMrXWlljuooWsiJ1nAVQstieLhpfDpYss7vxXOCcukp9
 bqU3DHZiB5K9jtpWwUdjLDLQGvncm2gGYIW7qoWVJ3kczytkd/NusXDThTFNngZp2C
 6gu6gCU1OTL1tRKVsuaEprn48G5HRMYgzKz4+Mp3pdAwRXXz7SSSAi0gA88P1SjDGT
 f8MNgqJ4ZcxRnET/5TnaWwoGVWOBD9Dfk4Leilb9+nL314aoIJg1rqOraAU3+qX6a+
 pJ4/SDii/b/xKagaKT1GzoTzdvUAM08ExKWQKtN6dKtQIzROnYqJGBROW5tfzIj5Kr
 aKdW8EzqnJTtw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E37003781F8E;
 Tue,  6 Feb 2024 11:24:50 +0000 (UTC)
Message-ID: <1d6b4a7d-4107-4880-858a-ecd565eee124@collabora.com>
Date: Tue, 6 Feb 2024 12:24:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/mediatek: dsi: Cleanup functions
 mtk_dsi_ps_control{_vact}()
Content-Language: en-US
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20240131113434.241929-1-angelogioacchino.delregno@collabora.com>
 <20240131113434.241929-3-angelogioacchino.delregno@collabora.com>
 <14e124f02d82ff151974f99d042c4197e4dd5dd7.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <14e124f02d82ff151974f99d042c4197e4dd5dd7.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Il 06/02/24 10:50, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Wed, 2024-01-31 at 12:34 +0100, AngeloGioacchino Del Regno wrote:
>> Function mtk_dsi_ps_control() is a subset of
>> mtk_dsi_ps_control_vact():
>> merge the two in one mtk_dsi_ps_control() function by adding one
>> function parameter `config_vact` which, when true, writes the VACT
>> related registers.
>>
>> Reviewed-by: Fei Shao <fshao@chromium.org>
>> Signed-off-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 76 +++++++++-------------------
>> --
>>   1 file changed, 23 insertions(+), 53 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index 3b7392c03b4d..8414ce73ce9f 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -351,40 +351,6 @@ static void mtk_dsi_set_vm_cmd(struct mtk_dsi
>> *dsi)
>>   	mtk_dsi_mask(dsi, DSI_VM_CMD_CON, TS_VFP_EN, TS_VFP_EN);
>>   }
>>   
>> -static void mtk_dsi_ps_control_vact(struct mtk_dsi *dsi)
>> -{
>> -	struct videomode *vm = &dsi->vm;
>> -	u32 dsi_buf_bpp, ps_wc;
>> -	u32 ps_bpp_mode;
>> -
>> -	if (dsi->format == MIPI_DSI_FMT_RGB565)
>> -		dsi_buf_bpp = 2;
>> -	else
>> -		dsi_buf_bpp = 3;
>> -
>> -	ps_wc = vm->hactive * dsi_buf_bpp;
>> -	ps_bpp_mode = ps_wc;
>> -
>> -	switch (dsi->format) {
>> -	case MIPI_DSI_FMT_RGB888:
>> -		ps_bpp_mode |= PACKED_PS_24BIT_RGB888;
>> -		break;
>> -	case MIPI_DSI_FMT_RGB666:
>> -		ps_bpp_mode |= PACKED_PS_18BIT_RGB666;
>> -		break;
>> -	case MIPI_DSI_FMT_RGB666_PACKED:
>> -		ps_bpp_mode |= LOOSELY_PS_18BIT_RGB666;
>> -		break;
>> -	case MIPI_DSI_FMT_RGB565:
>> -		ps_bpp_mode |= PACKED_PS_16BIT_RGB565;
>> -		break;
>> -	}
>> -
>> -	writel(vm->vactive, dsi->regs + DSI_VACT_NL);
>> -	writel(ps_bpp_mode, dsi->regs + DSI_PSCTRL);
>> -	writel(ps_wc, dsi->regs + DSI_HSTX_CKL_WC);
>> -}
>> -
>>   static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
>>   {
>>   	u32 tmp_reg;
>> @@ -416,36 +382,40 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi
>> *dsi)
>>   	writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
>>   }
>>   
>> -static void mtk_dsi_ps_control(struct mtk_dsi *dsi)
>> +static void mtk_dsi_ps_control(struct mtk_dsi *dsi, bool
>> config_vact)
>>   {
>> -	u32 dsi_tmp_buf_bpp;
>> -	u32 tmp_reg;
>> +	struct videomode *vm = &dsi->vm;
>> +	u32 dsi_buf_bpp, ps_wc;
>> +	u32 ps_bpp_mode;
>> +
>> +	if (dsi->format == MIPI_DSI_FMT_RGB565)
>> +		dsi_buf_bpp = 2;
>> +	else
>> +		dsi_buf_bpp = 3;
>> +
>> +	ps_wc = vm->hactive * dsi_buf_bpp;
>> +	ps_bpp_mode = ps_wc;
>>   
>>   	switch (dsi->format) {
>>   	case MIPI_DSI_FMT_RGB888:
>> -		tmp_reg = PACKED_PS_24BIT_RGB888;
>> -		dsi_tmp_buf_bpp = 3;
>> +		ps_bpp_mode |= PACKED_PS_24BIT_RGB888;
>>   		break;
>>   	case MIPI_DSI_FMT_RGB666:
>> -		tmp_reg = LOOSELY_PS_18BIT_RGB666;
>> -		dsi_tmp_buf_bpp = 3;
>> +		ps_bpp_mode |= PACKED_PS_18BIT_RGB666;
>>   		break;
>>   	case MIPI_DSI_FMT_RGB666_PACKED:
>> -		tmp_reg = PACKED_PS_18BIT_RGB666;
>> -		dsi_tmp_buf_bpp = 3;
>> +		ps_bpp_mode |= LOOSELY_PS_18BIT_RGB666;
> 
> You change the original logic here. If it is a fixup, separate to a
> independent patch not hiding in a clean up patch. So we could backport
> the fixup patch.
> 

Thank you CK! Thanks to you noticing that, I've discovered that actually
besides the two functions not agreeing on the bit to set, the definitions
of those bits are actually wrong (as you can verify on datasheets for
multiple SoCs, including MT8195, MT8188, MT8186, MT8183).

v4 will fix that by adding a fixup commit to rectify the whole thing.

Cheers,
Angelo

> Regards,
> CK
> 
>>   		break;
>>   	case MIPI_DSI_FMT_RGB565:
>> -		tmp_reg = PACKED_PS_16BIT_RGB565;
>> -		dsi_tmp_buf_bpp = 2;
>> -		break;
>> -	default:
>> -		tmp_reg = PACKED_PS_24BIT_RGB888;
>> -		dsi_tmp_buf_bpp = 3;
>> +		ps_bpp_mode |= PACKED_PS_16BIT_RGB565;
>>   		break;
>>   	}
>>   
>> -	tmp_reg += dsi->vm.hactive * dsi_tmp_buf_bpp & DSI_PS_WC;
>> -	writel(tmp_reg, dsi->regs + DSI_PSCTRL);
>> +	if (config_vact) {
>> +		writel(vm->vactive, dsi->regs + DSI_VACT_NL);
>> +		writel(ps_wc, dsi->regs + DSI_HSTX_CKL_WC);
>> +	}
>> +	writel(ps_bpp_mode, dsi->regs + DSI_PSCTRL);
>>   }
>>   
>>   static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
>> @@ -521,7 +491,7 @@ static void mtk_dsi_config_vdo_timing(struct
>> mtk_dsi *dsi)
>>   	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
>>   	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
>>   
>> -	mtk_dsi_ps_control(dsi);
>> +	mtk_dsi_ps_control(dsi, false);
>>   }
>>   
>>   static void mtk_dsi_start(struct mtk_dsi *dsi)
>> @@ -666,7 +636,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>>   	mtk_dsi_reset_engine(dsi);
>>   	mtk_dsi_phy_timconfig(dsi);
>>   
>> -	mtk_dsi_ps_control_vact(dsi);
>> +	mtk_dsi_ps_control(dsi, true);
>>   	mtk_dsi_set_vm_cmd(dsi);
>>   	mtk_dsi_config_vdo_timing(dsi);
>>   	mtk_dsi_set_interrupt_enable(dsi);


