Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56668751F9B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 13:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C495710E166;
	Thu, 13 Jul 2023 11:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B292810E166
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 11:13:35 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A5CD96607048;
 Thu, 13 Jul 2023 12:13:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689246813;
 bh=Km3zinC5aU6POQuC6Ok3uEJbGy3j4WpICpPik1AklyI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=G0zbayyLnyvN9v0jhGQjJRNbQD4LPKfLRKp1ZzhPFNamgbcftpyJaGqiqewcKwiux
 ew4ueWCbmcRQQKDvrDLsTKh8iB6EL/A/HCzHi3xo4nefACTMynB0zJbdydvp/ayL7M
 h+PwfNWJEb6qAJSdh3Ygyf2OwhPH/m+1TpYHZgr9MslNJPTLbWpBZ9IwbHmNX91jv3
 jMT8yCZvKVdKwCALuoiHpWz1sGrjIewa/oYV82FsH6h11d4AFBtpaZwGUijvFWjlOh
 FyqgG6m3fGA0/GCV2za1GTYKrdNcICz2F1p0oCMKuRDen5eadwFAQZhKdCm46CLWXU
 c2JodVlqMeuuA==
Message-ID: <0b45eae2-4081-febe-d062-6475d67a59cf@collabora.com>
Date: Thu, 13 Jul 2023 13:13:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/4] drm/mediatek: mtk_dpi: Switch to
 devm_drm_of_get_bridge()
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
 <20230412115250.164899-4-angelogioacchino.delregno@collabora.com>
 <CAC=S1nhePNeKY=q3XofzPcbwvyonz-bSuSLDNgsKx088qB3ZJA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAC=S1nhePNeKY=q3XofzPcbwvyonz-bSuSLDNgsKx088qB3ZJA@mail.gmail.com>
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

Il 13/07/23 10:24, Fei Shao ha scritto:
> Hi Angelo,
> 
> On Wed, Apr 12, 2023 at 7:53 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Function drm_of_find_panel_or_bridge() is marked as deprecated: since
>> the usage of that in this driver exactly corresponds to the new function
>> devm_drm_of_get_bridge(), switch to it.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dpi.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index 6be65ea21f8f..9025111013d3 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -1063,10 +1063,9 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>>          if (dpi->irq <= 0)
>>                  return -EINVAL;
>>
>> -       ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
>> -                                         NULL, &dpi->next_bridge);
>> -       if (ret)
>> -               return ret;
>> +       dpi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
>> +       if (IS_ERR(dpi->next_bridge))
>> +               return PTR_ERR(dpi->next_bridge);
> 
> The original code doesn't print any log so it's probably fine, but
> given you're already at it, perhaps you want to also make use of
> dev_err_probe() here?
> devm_drm_of_get_bridge() can also pass -EPROBE_DEFER from its wrapped
> drm_of_find_panel_or_bridge(). Furthermore, that will make the code
> visually align with your previous patch.
> 
> But that's just optional, and since this patch works anyway,
> 
> Reviewed-by: Fei Shao <fshao@chromium.org>
> 

Thanks. Yeah it's a good idea to add an error print... since I will have
to anyway send a v2, I'll add it.

Cheers,
Angelo

>>
>>          dev_info(dev, "Found bridge node: %pOF\n", dpi->next_bridge->of_node);
>>
>> --
>> 2.40.0
>>
>>
> 

