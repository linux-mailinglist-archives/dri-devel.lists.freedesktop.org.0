Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8EDA38630
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 15:25:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A86E10E0AA;
	Mon, 17 Feb 2025 14:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mJOE/RVj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060FE10E0AA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 14:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739802350;
 bh=GUAxZImZWtamppr8zlI/A9rVG2tyYKU95DwC2jGXbBg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mJOE/RVj3wNsVYObyE/oZbGXxop1evH9WUwdJoZUmA8+53sjNIBAVNW6klqDyio4L
 OxQv+iqv5Lq/tD7aiwNo5rmA7a9FChrl45oo143dGcKIVxMJIufdV2b8IzE6eG2TWH
 IOuxuElpbrjwjmuRzMIebMsDLB0+nPNVYi8E2wV18dZ/io13aQjFEGoD2I1bjiEzAw
 A+oSCGd6CjFfz2+UbqZG7FY5oSdyn5PEp4sDFcEdQ4hJ4h0jh65WUMQGaFMjQ2lysj
 t2Wz3yY13uQUyKxGnvd0YichLhTjV3Y98R/FBkIFgdlRQTk/ONx9VRx4SFGd+lHCG4
 9UY81byDPryCQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D4D4117E0F86;
 Mon, 17 Feb 2025 15:25:49 +0100 (CET)
Message-ID: <041ffe38-ca24-4e05-90c1-e37f9323c7cf@collabora.com>
Date: Mon, 17 Feb 2025 15:25:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/mediatek: Change main display path to support PQ
 for MT8196
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?UTF-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>
Cc: =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "treapking@chromium.org" <treapking@chromium.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
 <20250211025317.399534-6-sunny.shen@mediatek.com>
 <b3a6afa2e818d31dc60632615215a88449fb78bf.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <b3a6afa2e818d31dc60632615215a88449fb78bf.camel@mediatek.com>
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

Il 17/02/25 07:06, CK Hu (胡俊光) ha scritto:
> On Tue, 2025-02-11 at 10:52 +0800, Sunny Shen wrote:
>> Due to the path mux design of the MT8196, the following components
>> need to be added to support Picture Quality (PQ) in the main display
>> path: CCORR0, CCORR1, DITHER0, GAMMA0, MDP_RSZ0, POSTMASK0, TDSHP0.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
>>
>> Signed-off-by: Sunny Shen <sunny.shen@mediatek.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> index b810a197f58b..1c97dc46ae70 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> @@ -242,6 +242,13 @@ static const unsigned int mt8196_mtk_ddp_ovl0_main[] = {
>>   
>>   static const unsigned int mt8196_mtk_ddp_disp0_main[] = {

If you build the display controller path with an OF graph, you don't need to
introduce any mt8196_mtk_ddp_disp0_main, at all.

Since all this work was done and upstreamed, and was done because hardcoding
the display pipeline for each board is only bloating the driver (and wrong),
just express the pipeline with a graph in the devicetree.

The driver doesn't need that array, not anymore.

Regards,
Angelo

>>   	DDP_COMPONENT_DLI_ASYNC0,
>> +	DDP_COMPONENT_MDP_RSZ0,
>> +	DDP_COMPONENT_TDSHP0,
>> +	DDP_COMPONENT_CCORR0,
>> +	DDP_COMPONENT_CCORR1,
>> +	DDP_COMPONENT_GAMMA0,
>> +	DDP_COMPONENT_POSTMASK0,
>> +	DDP_COMPONENT_DITHER0,
>>   	DDP_COMPONENT_DLO_ASYNC1,
>>   };
>>   
> 



