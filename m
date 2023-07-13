Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5B1751FA6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 13:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A815A10E676;
	Thu, 13 Jul 2023 11:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5911410E672
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 11:14:47 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 914386607037;
 Thu, 13 Jul 2023 12:14:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689246886;
 bh=F1i+SwhIPLo5pHuaYsaZeydF8C9QVQZ9zzDTvGn7X90=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kjLEPN/aPb5ZfsiDrbSiwZpvOKvHUWBkHroyv20TZEhqr06zyhmTJAwHoq6fr7nr+
 lWtrct015bxNmNF/yEAJ3/dgDks39FZzOIN7cxLMXeSGMFPWH19cWck/LbR19JrLCE
 e1yCJqMo6IbKVuuQY0060ago8UgSZty1BuIxCq5/Sht0X9T2AEEAlVCe9uo8T4Dura
 AbW1206f2qd5J/uvsbURYWKcejVhu6Eims5FuXkUeYflAkQ2RUh2jlyiwlOUeehCKB
 IV6ndMTUzNFPvrzmW1LnwyKGmuXJXGoI0dYVu9Yrjb8qmQRfQD++vXXYv+MA9m+vE4
 SihyFwwd0Cl7w==
Message-ID: <d93e0a7b-7ee8-62ad-cf96-985ee5a8d432@collabora.com>
Date: Thu, 13 Jul 2023 13:14:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/4] drm/mediatek: mtk_dpi: Simplify with
 devm_drm_bridge_add()
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
 <20230412115250.164899-2-angelogioacchino.delregno@collabora.com>
 <CAC=S1nivzyX9+3EBtAG5dPmy-c6je74zmY68AXjyFvV2Pigqgg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAC=S1nivzyX9+3EBtAG5dPmy-c6je74zmY68AXjyFvV2Pigqgg@mail.gmail.com>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 13/07/23 09:55, Fei Shao ha scritto:
> Hi Angelo,
> 
> On Wed, Apr 12, 2023 at 7:53 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Change drm_bridge_add() to its devm variant to slightly simplify the
>> probe function.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dpi.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index 948a53f1f4b3..2d5f3fc34f61 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -1090,11 +1090,12 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>>          dpi->bridge.of_node = dev->of_node;
>>          dpi->bridge.type = DRM_MODE_CONNECTOR_DPI;
>>
>> -       drm_bridge_add(&dpi->bridge);
>> +       ret = devm_drm_bridge_add(dev, &dpi->bridge);
>> +       if (ret)
>> +               return ret;
> 
> And also drop the drm_bridge_remove() call in mtk_dpi_remove()?
> 

Yes. V2 will drop that.

Cheers,
Angelo

> Regards,
> Fei
> 
>>
>>          ret = component_add(dev, &mtk_dpi_component_ops);
>>          if (ret) {
>> -               drm_bridge_remove(&dpi->bridge);
>>                  dev_err(dev, "Failed to add component: %d\n", ret);
>>                  return ret;
>>          }
>> --
>> 2.40.0
>>
>>
> 

