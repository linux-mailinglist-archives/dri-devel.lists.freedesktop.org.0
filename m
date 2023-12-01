Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D4C8006BC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 10:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0690410E09B;
	Fri,  1 Dec 2023 09:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74DA10E09B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 09:22:59 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 03C28660739D;
 Fri,  1 Dec 2023 09:22:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701422578;
 bh=QgTeaIFG5TKHQs9edtTeIIGI6iDgYZhlD3cjaCISnnI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LMct2acAVotYmUk4lB0+USCWpBs96wpATpyINXpvYuk+8xFxydBNdA651Kp4FNd3i
 RIPMz4/heGSBMa0I3t/LjN4j1Q8B7Eo5LZSfZ615sdFRwRrhzDHMv4JUMokQTe5PTt
 UGvLkbOLW+NCU0AMZLPHISGSVC/52VRWl/YMZ+jA2DXrwHXXGVwWOzsggzba2MwNRk
 6Akt3oQGJoVIfam61b/7fW2cRfylS0fuaSRNhyQKB2+mU7ODo31OgAA+VPCk7IUtBw
 DfTTfEZ67fCkYMQvOHq/qj2EkvIPoeJpdTgpWxpcBWG9Gx14kcOgGZbIIks7LN+NOc
 RWamvAwk80NuA==
Message-ID: <8250291c-13ef-4072-92d6-f3d7953d6521@collabora.com>
Date: Fri, 1 Dec 2023 10:22:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/mediatek: support the DSI0 output on the MT8195
 VDOSYS0
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi
 <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
References: <20231123133749.2030661-1-mwalle@kernel.org>
 <20231123133749.2030661-5-mwalle@kernel.org>
 <2d1bae2239626cb51977bf0803cec602@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <2d1bae2239626cb51977bf0803cec602@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 30/11/23 13:47, Michael Walle ha scritto:
>> With the latest dynamic selection of the output component, we can now
>> support different outputs. Move current output component into the
>> dynamic routes array and add the new DSI0 output.
>>
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>> ---
>>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c 
>> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> index 2b0c35cacbc6..6fa88976376e 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> @@ -222,7 +222,11 @@ static const unsigned int mt8195_mtk_ddp_main[] = {
>>      DDP_COMPONENT_DITHER0,
>>      DDP_COMPONENT_DSC0,
>>      DDP_COMPONENT_MERGE0,
>> -    DDP_COMPONENT_DP_INTF0,
> 
> Please disregard this patch (the others are ok). There must gone something
> wrong during my testing. DDP_COMPONENT_MERGE0 won't work with
> DDP_COMPONENT_DSI0. If anyone has more insights, I'm all ears.
> 

I was *convinced* that the MERGE0 SOUT was connected to DSI0!!!

...but you're right, here, and thanks for catching that: there's no way to
get MERGE0 connected to DSI0; if you check in the datasheet for VDO_SEL_IN,
you can get data from MERGE0 only for DSI*1*, not 0.

The only way is to connect DSC_WRAP0 (DDP_COMPONENT_DSC0 in mtk_drm_drv btw)
directly to DSI0 (or dither to dsi0)... unless there is a way to change the
pinmux to invert the pins for DSI0/1?

You could assign the DSI1 controller to the one that is currently DSI0 for you.

That would solve the issue here.

Cheers!
Angelo

> -michael
> 
>> +};
>> +
>> +static const struct mtk_drm_route mt8195_mtk_ddp_main_routes[] = {
>> +    { 0, DDP_COMPONENT_DP_INTF0 },
>> +    { 0, DDP_COMPONENT_DSI0 },
>>  };
>>
>>  static const unsigned int mt8195_mtk_ddp_ext[] = {
>> @@ -308,6 +312,8 @@ static const struct mtk_mmsys_driver_data 
>> mt8192_mmsys_driver_data = {
>>  static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
>>      .main_path = mt8195_mtk_ddp_main,
>>      .main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
>> +    .conn_routes = mt8195_mtk_ddp_main_routes,
>> +    .num_conn_routes = ARRAY_SIZE(mt8195_mtk_ddp_main_routes),
>>      .mmsys_dev_num = 2,
>>  };


