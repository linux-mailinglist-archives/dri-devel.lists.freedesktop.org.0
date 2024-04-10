Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF14589F16B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 13:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F37210E35C;
	Wed, 10 Apr 2024 11:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=t-argos.ru header.i=@t-argos.ru header.b="RQliOMsu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.t-argos.ru (mx1.t-argos.ru [109.73.34.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A5910E35C;
 Wed, 10 Apr 2024 11:53:04 +0000 (UTC)
Received: from mx1.t-argos.ru (localhost [127.0.0.1])
 by mx1.t-argos.ru (Postfix) with ESMTP id EE41D100002;
 Wed, 10 Apr 2024 14:52:47 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-argos.ru; s=mail;
 t=1712749968; bh=WJUH5RzBi6ThGn7KLoC7JkfiYKeYqyZ7xZhKdtRWAfI=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 b=RQliOMsu1CsL31rk+zQjPobaWvn+7OwssPGXLDAJ+1nrXH73GfJMiDa40pyBFnRgX
 VxOKnIToEshOUVnEKsNPRAp0Mn3NshZS8btJeySsDzHwq/aB/9qbr7GnBmnxg0BE8x
 kFiKKS5PAoSbjPpqGWmO0wU1NPII/F6aIJK1glUeZXWXb/9OeBjYjD8RgcjUlk5bJA
 poHWEuPxI90WUuhK1z7Sk987Qw5HhcY84iVNmX1gpBQimVp6jV+OUlAB34cQ8mNCyV
 1KFcLby75BVoh6OUZQjHDgTMwrkLcMW+xdSf3dOTjKLpuaX5tw3C9VCtZVRUixszSN
 yjJxeVhcGyngQ==
Received: from mx1.t-argos.ru.ru (mail.t-argos.ru [172.17.13.212])
 by mx1.t-argos.ru (Postfix) with ESMTP;
 Wed, 10 Apr 2024 14:51:29 +0300 (MSK)
Received: from [172.17.214.6] (172.17.214.6) by ta-mail-02 (172.17.13.212)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Apr
 2024 14:51:09 +0300
Message-ID: <2b06e6b2-6fa0-48fa-800b-7aad6735daa6@t-argos.ru>
Date: Wed, 10 Apr 2024 14:48:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Add callback function pointer check before
 its call
Content-Language: ru
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Neil Armstrong <neil.armstrong@linaro.org>, Stephen
 Boyd <swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
References: <20240408085523.12231-1-amishin@t-argos.ru>
 <CAA8EJppTM4tpsFaZKupPe=0Oc9qDp7dBqHyHGP4E5bTHKT=hSw@mail.gmail.com>
From: Aleksandr Mishin <amishin@t-argos.ru>
In-Reply-To: <CAA8EJppTM4tpsFaZKupPe=0Oc9qDp7dBqHyHGP4E5bTHKT=hSw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 127.0.0.199:7.1.2;
 mx1.t-argos.ru.ru:7.1.1; git.kernel.org:7.1.1, FromAlignment: s
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



On 08.04.2024 12:03, Dmitry Baryshkov wrote:
> On Mon, 8 Apr 2024 at 11:57, Aleksandr Mishin <amishin@t-argos.ru> wrote:
>>
>> In dpu_core_irq_callback_handler() callback function pointer is compared to NULL,
>> but then callback function is unconditionally called by this pointer.
>> Fix this bug by adding conditional return.
>>
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> This should be converted to a proper Reported-by: trailer.
> 

It is an established practice for our project, you can find 700+ applied
patches with similar line:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?qt=grep&q=linuxtesting.org

>>
>> Fixes: c929ac60b3ed ("drm/msm/dpu: allow just single IRQ callback")
>> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> index 946dd0135dff..03a16fbd4c99 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> @@ -223,9 +223,11 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, unsigned int
>>
>>          VERB("IRQ=[%d, %d]\n", DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>>
>> -       if (!irq_entry->cb)
>> +       if (!irq_entry->cb) {
>>                  DRM_ERROR("no registered cb, IRQ=[%d, %d]\n",
>>                            DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>> +               return;
>> +       }
>>
>>          atomic_inc(&irq_entry->count);
>>
>> --
>> 2.30.2
>>
>>
> 
> 

-- 
Kind regards
Aleksandr
