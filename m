Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9918B54ADF3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 12:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1124E10E4D0;
	Tue, 14 Jun 2022 10:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA4310F37C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 10:09:28 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id s10so9119577ljh.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 03:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=DsZFrxKEYYtj45Hwk8U2QPz1/Ldjsw5xgixABi1aBlM=;
 b=v57NKOWEyQ6rhRAigKgq4T4hANl6Vaj0YPhvuEdBv0rPiC6k01c4kb5mUXsFZgAE25
 EnzbiYVVCYH/rOH6lBajNn7/uSJARAxlh4dFZgonTPQUbZT3qRfRJURG8BiKsYemA8I9
 QZBrr+dvumqLXERgoXkUMhch9UiSTrSMZJKSHJmL+X8KPrfriGHsgd/f4R4lf+QLqUAH
 fg+i4ZQcgel/hPovoFPahzd3u6jMPGhGakmjT5tOlA7NmWe2IBwnP46vi6PHBMF+3IsT
 4qV8AL+Nzi2s0v1GZbnGiMIn/Q1wg5f3X6lklzQp58SP4T+Vcl/kmAdYzzy/6eKwoHdm
 7PPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DsZFrxKEYYtj45Hwk8U2QPz1/Ldjsw5xgixABi1aBlM=;
 b=YR32FC9pTHKt837p/igcHvTTrGZ3Kms8WcydFFYLbhpDaJTC+BeaHO8gDB855j1h0Z
 64T76K9m362QUlYf457erx5iyKcmvVkLRLGg9IxFvZz7uYQc/IGFiSAy9D9HBgDI3lot
 ko/DxLsdbeTG927GjEv71pFf7xnZ3ZxXCcamsAON69SJz7DLADC0lmL6MuK+gC54I7zH
 nYlqGwiuLPzFhy+g6/s7SAgceyU37o4oTgEqrG7YpR4XI92NT8cvydoyUSfhp0pL/XST
 kL8+JnFNxwiH42C5P8dDoOXt5sDvcaJuIgf6d3x8EuLq/0X+mKkgm59I8LpBa4RCWEVb
 oo9g==
X-Gm-Message-State: AJIora8w9Mg3jhXDknETWneFc9Hij7ombj0wsqIjmQI9xtStlfbOYS3T
 iMhzAC43J/lisEVojOeoegP2kw==
X-Google-Smtp-Source: AGRyM1vkEYj3zCeaffJC38HgJLnsTcvhsAF4UYsrQgbbwqYDsuWMGZVtTKdXbGKJ23ksJ7rypPKDxg==
X-Received: by 2002:a2e:bd86:0:b0:24f:16a6:8c0e with SMTP id
 o6-20020a2ebd86000000b0024f16a68c0emr2085612ljq.450.1655201366296; 
 Tue, 14 Jun 2022 03:09:26 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a056512359400b004791c4858e0sm1337289lfr.114.2022.06.14.03.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 03:09:25 -0700 (PDT)
Message-ID: <10ac04f9-6374-0f85-166c-223a220a8c0d@linaro.org>
Date: Tue, 14 Jun 2022 13:09:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] drm/msm/mdp4: Fix refcount leak in mdp4_modeset_init_intf
Content-Language: en-GB
To: Miaoqian Lin <linmq006@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 David Heidelberg <david@ixit.cz>, Guo Zhengkui <guozhengkui@vivo.com>,
 Xu Wang <vulab@iscas.ac.cn>, Neil Armstrong <narmstrong@baylibre.com>,
 Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220607110841.53889-1-linmq006@gmail.com>
 <059e0a81-3c0a-1c8f-90f0-a836da1204f5@quicinc.com>
 <0bdb3a64-e795-4aa0-86c9-efd7fc3d5a19@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <0bdb3a64-e795-4aa0-86c9-efd7fc3d5a19@gmail.com>
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

On 14/06/2022 13:07, Miaoqian Lin wrote:
> Hi, Abhinav
> 
> On 2022/6/11 7:20, Abhinav Kumar wrote:
>>
>>
>> On 6/7/2022 4:08 AM, Miaoqian Lin wrote:
>>> of_graph_get_remote_node() returns remote device node pointer with
>>> refcount incremented, we should use of_node_put() on it
>>> when not need anymore.
>>> Add missing of_node_put() to avoid refcount leak.
>>>
>>> Fixes: 86418f90a4c1 ("drm: convert drivers to use of_graph_get_remote_node")
>>> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
>>> ---
>>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>
>> This patch itself looks fine and will cover the cases when there was an error and we did not release the refcount.
>>
>> But, even in the normal cases I am not finding where we are releasing the refcount for the panel_node.
>>
>> I dont see a of_node_put() on mdp4_lcdc_encoder->panel_node.
>>
> Thanks for your review.
> 
> I don't see it either. It's a bit messy because the reference assigned to mdp4_lcdc_encoder->panel_node and mdp4_lvds_connector->panel_node both.

I have a plan to rework mdp4 lcdc support once I get my ifc6410 lvds 
cable. Thus I think we can land this patch now and fix the mdp4 
lcdc/lvds code leaking the reference in the due time.

> 
>> Am i missing something?
>>
>>> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>> index fb48c8c19ec3..17cb1fc78379 100644
>>> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>> @@ -216,6 +216,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
>>>            encoder = mdp4_lcdc_encoder_init(dev, panel_node);
>>>            if (IS_ERR(encoder)) {
>>>                DRM_DEV_ERROR(dev->dev, "failed to construct LCDC encoder\n");
>>> +            of_node_put(panel_node);
>>>                return PTR_ERR(encoder);
>>>            }
>>>    @@ -225,6 +226,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
>>>            connector = mdp4_lvds_connector_init(dev, panel_node, encoder);
>>>            if (IS_ERR(connector)) {
>>>                DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
>>> +            of_node_put(panel_node);
>>>                return PTR_ERR(connector);
>>>            }
>>>    


-- 
With best wishes
Dmitry
