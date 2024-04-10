Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAD989F145
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 13:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09051121B9;
	Wed, 10 Apr 2024 11:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=t-argos.ru header.i=@t-argos.ru header.b="bLGU83b9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.t-argos.ru (mx1.t-argos.ru [109.73.34.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5912310FCEE;
 Wed, 10 Apr 2024 11:49:50 +0000 (UTC)
Received: from mx1.t-argos.ru (localhost [127.0.0.1])
 by mx1.t-argos.ru (Postfix) with ESMTP id 1A576100002;
 Wed, 10 Apr 2024 14:49:32 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-argos.ru; s=mail;
 t=1712749772; bh=orBTxthOmkOLw2GzZM5dy/q8ncQT8wiwTCAtBDly8Wc=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 b=bLGU83b9vUGLxKi2GmvKDE6DRQDyOKuTFPnxvRnvhwInt8CuRWsslY10v4N2Z40k7
 Yg9CWMFWZN8IiXf+VteYUYx9kVh4dCfPHTY6A7ofG9rxYMH21WQUshbiB+pvM1RTj8
 wmEUX+CZti1oggowfyE8QNJIYevf0Z61p51qgAygq5eGKoI/o+lBEM1iOrOdKGThgl
 p3FrTWg9K/wj5xUHEI93Hj131J9hnbz7VYuDCekvkeXT5RokY8mwqJTwr3TM1+D5YE
 11QJqWblkPW9OTBXXeaVs/H8b2SyMciyGZSnDnQYw+XZkrCnq9S1WqswSz+INpcUUu
 rfgNcC555wGdw==
Received: from mx1.t-argos.ru.ru (mail.t-argos.ru [172.17.13.212])
 by mx1.t-argos.ru (Postfix) with ESMTP;
 Wed, 10 Apr 2024 14:48:10 +0300 (MSK)
Received: from [172.17.214.6] (172.17.214.6) by ta-mail-02 (172.17.13.212)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Apr
 2024 14:47:50 +0300
Message-ID: <6151dd67-702b-41e7-8e54-43d4d1178442@t-argos.ru>
Date: Wed, 10 Apr 2024 14:45:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Add callback function pointer check before
 its call
Content-Language: ru
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong <neil.armstrong@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
References: <20240408085523.12231-1-amishin@t-argos.ru>
 <c2c3b573-0e62-4452-e657-fbef9abb9430@quicinc.com>
From: Aleksandr Mishin <amishin@t-argos.ru>
In-Reply-To: <c2c3b573-0e62-4452-e657-fbef9abb9430@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.17.214.6]
X-ClientProxiedBy: ta-mail-02.ta.t-argos.ru (172.17.13.212) To ta-mail-02
 (172.17.13.212)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184651 [Apr 10 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: amishin@t-argos.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 16 0.3.16
 6e64c33514fcbd07e515710c86ba61de7f56194e, {Tracking_uf_ne_domains},
 {Tracking_from_domain_doesnt_match_to}, t-argos.ru:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; git.kernel.org:7.1.1;
 127.0.0.199:7.1.2; mx1.t-argos.ru.ru:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/04/10 07:25:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2024/04/10 08:25:00 #24735279
X-KSMG-AntiVirus-Status: Clean, skipped
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



On 08.04.2024 19:51, Abhinav Kumar wrote:
> 
> 
> On 4/8/2024 1:55 AM, Aleksandr Mishin wrote:
>> In dpu_core_irq_callback_handler() callback function pointer is 
>> compared to NULL,
>> but then callback function is unconditionally called by this pointer.
>> Fix this bug by adding conditional return.
>>
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>
> 
> Yes , as dmitry wrote, this should be Reported-by.
> 

It is an established practice for our project, you can find 700+ applied
patches with similar line:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?qt=grep&q=linuxtesting.org

> But rest LGTM.
> 
>> Fixes: c929ac60b3ed ("drm/msm/dpu: allow just single IRQ callback")
>> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> index 946dd0135dff..03a16fbd4c99 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> @@ -223,9 +223,11 @@ static void dpu_core_irq_callback_handler(struct 
>> dpu_kms *dpu_kms, unsigned int
>>       VERB("IRQ=[%d, %d]\n", DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>> -    if (!irq_entry->cb)
>> +    if (!irq_entry->cb) {
>>           DRM_ERROR("no registered cb, IRQ=[%d, %d]\n",
>>                 DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>> +        return;
>> +    }
>>       atomic_inc(&irq_entry->count);

-- 
Kind regards
Aleksandr
