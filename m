Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411B07CD90C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 12:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAD810E0BC;
	Wed, 18 Oct 2023 10:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080AE10E09B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 10:21:16 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D95E366072F7;
 Wed, 18 Oct 2023 11:21:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697624474;
 bh=kH1jXtunBlMIflxPq7hLuLyoVuwUNlJfO0y0ePDVEoY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jhZdfnzBeekyyVBkDSPRwP3lhZX9sgWCjRuT9AeuqEMyzTIun7LOmijs9oz07+gzl
 4Oj/4DMmMbEHy5CVUx8gn0tEqghbRMbZH61iqT2aS1h4EvUkadcSe9N63zBDZm1jMz
 Y4k9ifoHnRJxlxqDz/fU1MuNtOcMJdNiIo1605gcolbcX1dPRjn7Z7UzgwK9ZzM3Ic
 e0cHpgS6ENEf/KJphA4HFeL5+zPD3ghEFe9mhPoYZ0LjcabnB6C6KAyN3aFp9nQG+N
 75kARIavOnmZPfjstH9PvR+2uHBAU5TyKuOEbwKAozmUftEjsGnVZ05PnRr1mq5HTP
 ++oKz7SDHQUAg==
Message-ID: <54a04d22-7ec1-473b-ab57-f6339b2cc782@collabora.com>
Date: Wed, 18 Oct 2023 12:21:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET
 settings/handling
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>
References: <20230523104234.7849-1-angelogioacchino.delregno@collabora.com>
 <20230915101124.283232-1-mwalle@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230915101124.283232-1-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 shaoming.chen@mediatek.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/09/23 12:11, Michael Walle ha scritto:
>> Due to the initial confusion about MIPI_DSI_MODE_EOT_PACKET, properly
>> renamed to MIPI_DSI_MODE_NO_EOT_PACKET, reflecting its actual meaning,
>> both the DSI_TXRX_CON register setting for bit (HSTX_)DIS_EOT and the
>> later calculation for horizontal sync-active (HSA), back (HBP) and
>> front (HFP) porches got incorrect due to the logic being inverted.
>>
>> This means that a number of settings were wrong because....:
>>   - DSI_TXRX_CON register setting: bit (HSTX_)DIS_EOT should be
>>     set in order to disable the End of Transmission packet;
>>   - Horizontal Sync and Back/Front porches: The delta used to
>>     calculate all of HSA, HBP and HFP should account for the
>>     additional EOT packet.
>>
>> Before this change...
>>   - Bit (HSTX_)DIS_EOT was being set when EOT packet was enabled;
>>   - For HSA/HBP/HFP delta... all three were wrong, as words were
>>     added when EOT disabled, instead of when EOT packet enabled!
>>
>> Invert the logic around flag MIPI_DSI_MODE_NO_EOT_PACKET in the
>> MediaTek DSI driver to fix the aforementioned issues.
>>
>> Fixes: 8b2b99fd7931 ("drm/mediatek: dsi: Fine tune the line time caused by EOTp")
>> Fixes: 2d52bfba09d1 ("drm/mediatek: add non-continuous clock mode and EOT packet control")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

Hello CK,

can you please pick this fix?

Thanks,
Angelo

