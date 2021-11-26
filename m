Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EC945F62B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 22:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9AC6E02B;
	Fri, 26 Nov 2021 21:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7E36E02B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 21:12:41 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id b40so27038647lfv.10
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 13:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=glFbJYk/OCRB+Myc+eRLL5T3IffkyOcS0fXVl203dm8=;
 b=N7Qzeum3GzIzB+2gQBBBYm8GjTuEmBHS86g6z2VQDOsK24uRFwnn26Fbu0srLERVjr
 kRR+qlTs90e0bB/lDsSGPfFYvi7tQT/Gl4yF2oSpiM2P1UlLPTuCbLNby6TkkZt0qHdM
 qmPX6wMGUgba7eQ2J9XuwL0+AB6KYaOAs4z+Fb4d9U2xvdi//7ezJ8q7myBe2y8Sp/lo
 ApZgHb5OPgjmGVdV784vFAQFBU3O7C5GsLDRwURMrvB0XdAJy/J49TmdEbp/5QaASum3
 b/6Ay9i3tbYfQtQ3mthBVPWH8kkVUGZ6SV3PthQEJohRk/e7Pd9hsgQAFqtBANsLwKuD
 kuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=glFbJYk/OCRB+Myc+eRLL5T3IffkyOcS0fXVl203dm8=;
 b=ERvI5q/roLjRig4DjTTCnssxgCOLSVg1iMJg5isyI4WajzeVYW2QuNsjdiqNNETjHm
 OgSR44dF+8HjXFvWVz5+AdTh8ACCGV2RGeNdsVRRQg8ahhReU+0XXqwhTCvk0oQqRn6n
 sp565zW55xHw6MO7PGqmoz+T1oVAzxicfC4l/KTiDseYoiWdahiV+27EwUMNtgbktPbe
 tVtfb2xE3IvVN2CAvNHVDVxqHkwkiQfdl4VuXVAwDAuLQ4mX/pudWt9tvMoxFVjJoAZY
 GpMd4sfDlNZP11eBN07jaQjN0lTsAx+H/CrxabZokWh+rXmXS5Lo7reywnYSX99iUJoU
 NCag==
X-Gm-Message-State: AOAM533QvNVPOaidWbImoacEkwEWdqjDtda5qPiUFDkPgGe7QJ0c9g9r
 fgztWFLhIWZQkwlkTKKPBSxD9w==
X-Google-Smtp-Source: ABdhPJw3D1SD/ptuYpCjS2LX7StqIYZZl5g1Pk5sJdNW2SKParlto1oi5itKdQdBmwPOtIhpGYCM9w==
X-Received: by 2002:a05:6512:10c4:: with SMTP id
 k4mr32023546lfg.373.1637961160062; 
 Fri, 26 Nov 2021 13:12:40 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id br24sm586210lfb.104.2021.11.26.13.12.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 13:12:39 -0800 (PST)
Subject: Re: [PATCH] drm/msm: Initialize MDSS irq domain at probe time
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robdclark@gmail.com
References: <20211125150947.354076-1-angelogioacchino.delregno@collabora.com>
 <32cdade5-1487-9182-e939-4d93f8a27ad6@linaro.org>
 <2b37dfd3-c3be-2640-56d0-25c9971c4f50@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <04bec750-33e2-c747-dc54-d304296831fa@linaro.org>
Date: Sat, 27 Nov 2021 00:12:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2b37dfd3-c3be-2640-56d0-25c9971c4f50@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jami.kettunen@somainline.org, maxime@cerno.tech, marijn.suijten@somainline.org,
 kernel@collabora.com, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/11/2021 12:26, AngeloGioacchino Del Regno wrote:
> Il 26/11/21 01:06, Dmitry Baryshkov ha scritto:
>> On 25/11/2021 18:09, AngeloGioacchino Del Regno wrote:
>>> Since commit 8f59ee9a570c ("drm/msm/dsi: Adjust probe order"), the
>>> DSI host gets initialized earlier, but this caused unability to probe
>>> the entire stack of components because they all depend on interrupts
>>> coming from the main `mdss` node (mdp5, or dpu1).
>>>
>>> To fix this issue, also anticipate probing mdp5 or dpu1 by initializing
>>> them at msm_pdev_probe() time: this will make sure that we add the
>>> required interrupt controller mapping before dsi and/or other components
>>> try to initialize, finally satisfying the dependency.
>>>
>>> While at it, also change the allocation of msm_drm_private to use the
>>> devm variant of kzalloc().
>>>
>>> Fixes: 8f59ee9a570c ("drm/msm/dsi: Adjust probe order")
>>> Signed-off-by: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@collabora.com>
>>
>> Another issue (or a pack of issues):
>> Now the msm_drm_init() is unbalanced with msm_drm_uninit(). Bits of 
>> code (putting the drm dev, removing the IRQ domain, etc) have to be 
>> called now from the msm_pdev_remove() function rather than from the 
>> unbind path.
>>
>> The following changes fix the observed issues here, however additional 
>> care should be taken.
>>
> 
> 
> Hello Dmitry,
> 
> thanks for the thorough review (and solutions!).
> Are you going to push your changes on top, or should I send a V2?

Please send a v2. As you see, my suggestions have to be validated too 
(and they were based on crashes/issues observed locally).


-- 
With best wishes
Dmitry
