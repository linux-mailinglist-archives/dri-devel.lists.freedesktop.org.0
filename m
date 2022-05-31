Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B54D5389A8
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 03:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3AB10E05C;
	Tue, 31 May 2022 01:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.meizu.com (edge05.meizu.com [157.122.146.251])
 by gabe.freedesktop.org (Postfix) with ESMTP id 26C8410E05C
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 01:37:20 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail12.meizu.com
 (172.16.1.108) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 31 May
 2022 09:37:15 +0800
Received: from [172.16.137.70] (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 31 May
 2022 09:37:13 +0800
Message-ID: <bd81a9a2-f14f-9564-3f68-be853134ecba@meizu.com>
Date: Tue, 31 May 2022 09:37:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/msm/dpu: Fix pointer dereferenced before checking
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Sean
 Paul" <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>
References: <1653896005-25168-1-git-send-email-baihaowen@meizu.com>
 <68443e94-32fc-a35e-3383-0dcd8ca967c0@quicinc.com>
From: baihaowen <baihaowen@meizu.com>
In-Reply-To: <68443e94-32fc-a35e-3383-0dcd8ca967c0@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

在 2022/5/31 上午8:36, Abhinav Kumar 写道:
>
>
> On 5/30/2022 12:33 AM, Haowen Bai wrote:
>> The ctx->hw is dereferencing before null checking, so move
>> it after checking.
>>
>> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
>
> Agree with Dmitry's comment. Adjust the patch subject to a different one otherwise PW thinks they are same patches.
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>> index bcccce292937..e59680cdd0ce 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>> @@ -155,11 +155,13 @@ static void dpu_hw_wb_roi(struct dpu_hw_wb *ctx, struct dpu_hw_wb_cfg *wb)
>>   static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
>>           struct dpu_hw_wb_qos_cfg *cfg)
>>   {
>> -    struct dpu_hw_blk_reg_map *c = &ctx->hw;
>> +    struct dpu_hw_blk_reg_map *c;
>>       u32 qos_ctrl = 0;
>>         if (!ctx || !cfg)
>>           return;
>> +   
>> +    c = &ctx->hw;
>>         DPU_REG_WRITE(c, WB_DANGER_LUT, cfg->danger_lut);
>>       DPU_REG_WRITE(c, WB_SAFE_LUT, cfg->safe_lut);
Sorry, plz ignore this patch.

ctx->hw is dereferenced, &ctx->hw is just a pointer math for pointer address offset, so it would not cause a bug(dereferencing null pointer).

 

-- 
Haowen Bai

