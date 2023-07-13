Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F71751FA2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 13:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0010910E66F;
	Thu, 13 Jul 2023 11:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE89910E66F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 11:14:05 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B357F6607037;
 Thu, 13 Jul 2023 12:14:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689246843;
 bh=Lu02uJv4pBvx54SeI6S7W2i3oUy20NvZIXgEARcd/7U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NBb/9/1ewn8GA0sfANVBB/1h/JRmJ+l3aug8SWVhz5uw8xmHUnZC+erZDrkpHCbhV
 df8wBl5TqdFwqGORrVJVsY8Iq0gBz+HOakhL2nRgWHR9KdFLBrFxjsMGJ17iKI/ItL
 gEzh2pGH6yK7/wjyg2rs4jncviUFhs8IUD1uNlJ4Jny1rtEkYK/krE8jbCcHPjFUP/
 R4OPsA1kRVd7MUT3DEOOGVEzZLVtG8z6jYHOc8JBdaXu1DHrH/78SdUJezdZT40eUp
 eRG3I9zv+xCeMC0YLJaRp0wSpaEX4w0h7D7bv5DuoAcKGszTQ3Gb9ZqGHMJHHhNmoc
 3ah5qYZnXp0yw==
Message-ID: <8c3412a0-b837-6ee4-eb9c-a958e1d74841@collabora.com>
Date: Thu, 13 Jul 2023 13:14:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/4] drm/mediatek: mtk_dpi: Use
 devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
 <20230412115250.164899-5-angelogioacchino.delregno@collabora.com>
 <CAC=S1ngkoQJKi6AozAOQY1WKvMhMrgKfA8S7MdbqmzSD5rRmdw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAC=S1ngkoQJKi6AozAOQY1WKvMhMrgKfA8S7MdbqmzSD5rRmdw@mail.gmail.com>
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

Il 13/07/23 10:34, Fei Shao ha scritto:
> Hi Angelo,
> 
> On Wed, Apr 12, 2023 at 7:53 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Instead of the open-coded platform_get_resource, devm_ioremap_resource
>> switch to devm_platform_get_and_ioremap_resource(), doing exactly the
>> same.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dpi.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index 9025111013d3..45535dc7970f 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -1038,8 +1038,7 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>>                          dev_dbg(&pdev->dev, "Cannot find pinctrl active!\n");
>>                  }
>>          }
>> -       mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -       dpi->regs = devm_ioremap_resource(dev, mem);
>> +       dpi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
> 
> "mem" appears to be unused elsewhere, so I assume
> devm_platform_ioremap_resource() would be a better fit.
> 

That's right. I'll switch to devm_platform_ioremap_resource() in v2.

Cheers,
Angelo

> Regards,
> Fei
> 
>>          if (IS_ERR(dpi->regs))
>>                  return dev_err_probe(dev, PTR_ERR(dpi->regs),
>>                                       "Failed to ioremap mem resource\n");
>> --
>> 2.40.0
>>
>>
> 

