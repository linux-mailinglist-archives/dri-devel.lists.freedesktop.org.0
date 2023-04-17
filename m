Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D51A06E4B26
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 16:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C7810E536;
	Mon, 17 Apr 2023 14:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE4010E536
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 14:16:20 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 779F76603201;
 Mon, 17 Apr 2023 15:16:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681740978;
 bh=OPT6H/zM6C1zlDEJTDEzUtCdA2vazUZtgaBHelUF2fQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PQJuscfqVyehQve5PfbhMH+4dAJT6W6LluJn8ufYN/xmbxpYi9PZcXNq+7To2u1kn
 k07ixsHLcyatdIxgiLfqzgLivxg1PYicIlbtBdN6CJ5sZcrp4wVQrb60qJEudxd6fr
 25eO0sUKJedrr2xaSv4RyVM9PI/gmVIKigKpSAeaqkuPPtK/bQ5o4Rx7X4jdIA9C0q
 SR17YtqVoDP3qgNOfMvDMWijFVnGxRG3g/SAqSTwUtH/YKghZLeZGCwYq5l7MslR2R
 1dElELGvGlBoAUCUWpL4m7suJKC1zYKpaXz4G/BiXusrVszDYgWtTimU49DNZ5I5Ft
 QrNryw4flXdLQ==
Message-ID: <3570a98d-a7f8-7bef-0184-ad740cc44ee6@collabora.com>
Date: Mon, 17 Apr 2023 16:16:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/panel: novatek-nt35950: Improve error handling
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, neil.armstrong@linaro.org,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
References: <20230415-konrad-longbois-next-v1-1-ce695dc9df84@linaro.org>
 <ea9f27a2-ce75-01a9-3758-0fe0bfcd1e5e@linaro.org>
 <e9c2e179-eacc-151e-123b-a4e425e76333@collabora.com>
 <51d94c13-853c-519d-f206-722288b5edf4@collabora.com>
 <df752738-824c-20be-f7d9-83e470912260@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <df752738-824c-20be-f7d9-83e470912260@linaro.org>
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 17/04/23 15:38, Konrad Dybcio ha scritto:
> 
> 
> On 17.04.2023 11:44, AngeloGioacchino Del Regno wrote:
>> Il 17/04/23 11:44, AngeloGioacchino Del Regno ha scritto:
>>> Il 17/04/23 09:25, Neil Armstrong ha scritto:
>>>> On 15/04/2023 13:00, Konrad Dybcio wrote:
>>>>> In a very peculiar case when probing and registering with the secondary
>>>>> DSI host succeeds, but the OF backlight or DSI attachment fails, the
>>>>> primary DSI device is automatically cleaned up, but the secondary one
>>>>> is not, leading to -EEXIST when the driver core tries to handle
>>>>> -EPROBE_DEFER.
>>>>>
>>>>> Unregister the DSI1 device manually on failure to prevent that.
>>>>>
>>>>> Fixes: 623a3531e9cf ("drm/panel: Add driver for Novatek NT35950 DSI DriverIC panels")
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>> ---
>>>>>    drivers/gpu/drm/panel/panel-novatek-nt35950.c | 8 +++++++-
>>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
>>>>> index abf752b36a52..7498fc6258bb 100644
>>>>> --- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
>>>>> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
>>>>> @@ -585,8 +585,11 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
>>>>>                   DRM_MODE_CONNECTOR_DSI);
>>>>>        ret = drm_panel_of_backlight(&nt->panel);
>>>>> -    if (ret)
>>>>> +    if (ret) {
>>>
>>> If this is not a dual-DSI case, nt->dsi[1] will be NULL: I agree it's still
>>> fine as in the kernel won't crash in that case, but for logical correctness
>>> I would still account for that:
>>>
>>>           if (num_dsis == 2)
>>>               mipi_dsi_device_unregister(nt->dsi[1]);
>>>
>>>>> +        mipi_dsi_device_unregister(nt->dsi[1]);
>>>>> +
>>>>>            return dev_err_probe(dev, ret, "Failed to get backlight\n");
>>>>> +    }
>>>>>        drm_panel_add(&nt->panel);
>>>>> @@ -602,6 +605,9 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
>>>>>            ret = mipi_dsi_attach(nt->dsi[i]);
>>>>>            if (ret < 0) {
>>>
>>> Same here, please add a check for num_dsis.
> Right, I'll send an incremental patch to fix the fix, thanks
> for spotting this!
> 

You're welcome! Please make sure to Cc me so that I can timely give you a review!

Cheers,
Angelo


