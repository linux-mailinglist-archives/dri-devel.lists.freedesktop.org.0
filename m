Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D98F3758F3A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B4910E406;
	Wed, 19 Jul 2023 07:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E3B10E3F5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 07:39:51 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 762EB660704A;
 Wed, 19 Jul 2023 08:39:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689752389;
 bh=rNVjWyGyb4/QZCXHyXWf5MRLedoD5uQC2pGcS2nQLJM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KXAnIw+qjtq/TVA5eamsTuqS52g5ZYSbnDDs6DVc9VL/h9OMKBeFUUOoaNERSSpeV
 u1iFRJZg59z7AUj8yplJ80OnLpIUBGZ0EdYaO29XIB+ZMEf3f1yHGV3VfzkWA0mTFA
 IWnJwDSjAdrErnMtvJkaKkiTnBil+eBYIsnBgvU17ETesA9N1A76livi2XS6bwsneT
 krC2W+oSTYwET1WjqEeJRAp7nDKZ+ngg193F2j24GMpCm/WfJvSlGmo0z+l6XQVpIU
 ntX7vGSmW6rVD3taA6mIJowkm7Ppt588Jlw/74A+v3YLXlxCwZwORhaLSC+bNkWvND
 WM6Oz3TI9R6pg==
Message-ID: <07c93d61-c5fd-f074-abb2-73fdaa81fd65@collabora.com>
Date: Wed, 19 Jul 2023 09:39:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET
 settings/handling
Content-Language: en-US
To: chunkuang.hu@kernel.org
References: <20230523104234.7849-1-angelogioacchino.delregno@collabora.com>
 <735623c5-3eeb-bda3-db87-2b33d9ad3446@collabora.com>
 <2f1d4e6b-bf03-25d1-dac2-83e0dbd5734f@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <2f1d4e6b-bf03-25d1-dac2-83e0dbd5734f@baylibre.com>
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
Cc: jitao.shi@mediatek.com, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 shaoming.chen@mediatek.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/06/23 13:29, Alexandre Mergnat ha scritto:
> 
> 
> On 23/06/2023 11:47, AngeloGioacchino Del Regno wrote:
>> Il 23/05/23 12:42, AngeloGioacchino Del Regno ha scritto:
>>> Due to the initial confusion about MIPI_DSI_MODE_EOT_PACKET, properly
>>> renamed to MIPI_DSI_MODE_NO_EOT_PACKET, reflecting its actual meaning,
>>> both the DSI_TXRX_CON register setting for bit (HSTX_)DIS_EOT and the
>>> later calculation for horizontal sync-active (HSA), back (HBP) and
>>> front (HFP) porches got incorrect due to the logic being inverted.
>>>
>>> This means that a number of settings were wrong because....:
>>>   - DSI_TXRX_CON register setting: bit (HSTX_)DIS_EOT should be
>>>     set in order to disable the End of Transmission packet;
>>>   - Horizontal Sync and Back/Front porches: The delta used to
>>>     calculate all of HSA, HBP and HFP should account for the
>>>     additional EOT packet.
>>>
>>> Before this change...
>>>   - Bit (HSTX_)DIS_EOT was being set when EOT packet was enabled;
>>>   - For HSA/HBP/HFP delta... all three were wrong, as words were
>>>     added when EOT disabled, instead of when EOT packet enabled!
>>>
>>> Invert the logic around flag MIPI_DSI_MODE_NO_EOT_PACKET in the
>>> MediaTek DSI driver to fix the aforementioned issues.
>>>
>>> Fixes: 8b2b99fd7931 ("drm/mediatek: dsi: Fine tune the line time caused by EOTp")
>>> Fixes: 2d52bfba09d1 ("drm/mediatek: add non-continuous clock mode and EOT packet 
>>> control")
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> Gentle ping for an important fix.
>>
>> Regards,
>> Angelo
>>
>>> ---
>>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c 
>>> b/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> index 7d5250351193..b0ab38e59db9 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> @@ -407,7 +407,7 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
>>>       if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
>>>           tmp_reg |= HSTX_CKLP_EN;
>>> -    if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
>>> +    if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>>>           tmp_reg |= DIS_EOT;
>>>       writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
>>> @@ -484,7 +484,7 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
>>>                 timing->da_hs_zero + timing->da_hs_exit + 3;
>>>       delta = dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ? 18 : 12;
>>> -    delta += dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 2 : 0;
>>> +    delta += dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 0 : 2;
>>>       horizontal_frontporch_byte = vm->hfront_porch * dsi_tmp_buf_bpp;
>>>       horizontal_front_back_byte = horizontal_frontporch_byte + 
>>> horizontal_backporch_byte;
>>
>>
> 
> Sounds logic
> 
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> 

Ping again.

Regards,
Angelo
