Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C67382102
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 22:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A9A89F19;
	Sun, 16 May 2021 20:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F381689F19
 for <dri-devel@lists.freedesktop.org>; Sun, 16 May 2021 20:35:26 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id e11so4728926ljn.13
 for <dri-devel@lists.freedesktop.org>; Sun, 16 May 2021 13:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/KqZD81vORW6kPFuLCP+RBTGLZDl2qbh6lxgkVjvvVg=;
 b=l62cjjGDQ2tIWxw1qGDmczEw15hX+m73FzTklgej1mQWEzvWK8E2Mf5ktZSlER0uV8
 wvviFAJwx9vAFAVjqZhSFsguBpH3kSriNxZk3j1mDj4Mwd8LGCFcBk2paxBqzBfNmoV1
 jMwv4RAECoMPxAC/MFPCIcVUE3bSkIfoiDnxitYI6U/NBBq2c/9W3OR7ON8VGMbt/OVz
 vx5viC5liX6ZmdnRDn6fyPxSg7mvYkYXDXWf0x/kEjyww8WEJN8iofERbYa6vaqVrxYq
 kV1e50PuBMSb9QhXt1wklhPlM1GgOr71eI2IM7WOIecnvO4R0f4CJvM4ZRLv1PNN0J2a
 iF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/KqZD81vORW6kPFuLCP+RBTGLZDl2qbh6lxgkVjvvVg=;
 b=idmsnwKlAtkTtCRz6/aXQM0IjI2SlIYlNVMTW2BDehsxtjSb9F9eZY0qiKca8ALiSt
 SKFXEXYo1kCOlDpf+c8dypa6e7KHG7pG6DDGIy8fRc2GrVc4m6qsUchVEnGM2/8YjhHj
 g74QBdUMoBmv5vxWYR93fZpMlvK40vCUp16vMi3ACjyD+AzLUB/S4s8KWWwBgVly9Xxz
 ybYVpbTimXchkRmXJdLrhR6ejk+FhMgA6u7zBy0hldoGIT/vlNymJa73x5RkSkGQ4ghP
 OHXtg0LtSnIFRjYigl1F0bkaH6hzoGplj7hOlByahvWVrl9BueXfvRBxCChz4s9al/9A
 F9eQ==
X-Gm-Message-State: AOAM530TGyiL3HopYD1PMUa0xHoKqIdTTmNgLgVOJhkAQLwymgKomX1f
 gc7D6SnqAt+f7o6ThrVnvA3FAxwRmtsM7Q==
X-Google-Smtp-Source: ABdhPJxToViXRUujvI67AUZHUzqZMtrxEy8xIn3u8svv4saSMn5iKA4cTahu8351tBAqc632LDg/Kg==
X-Received: by 2002:a05:651c:201b:: with SMTP id
 s27mr38149695ljo.190.1621197325311; 
 Sun, 16 May 2021 13:35:25 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id g2sm2633802ljn.35.2021.05.16.13.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 May 2021 13:35:24 -0700 (PDT)
Subject: Re: [PATCH v1 3/3] drm/msm/dpu: simplify interrupt managing
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20210412000954.2049141-1-dmitry.baryshkov@linaro.org>
 <20210412000954.2049141-4-dmitry.baryshkov@linaro.org>
 <20210516052407.GQ2484@yoga>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <3dda177a-cba5-373f-c7fb-c1c4b8e3be6b@linaro.org>
Date: Sun, 16 May 2021 23:35:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210516052407.GQ2484@yoga>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/05/2021 08:24, Bjorn Andersson wrote:
> On Sun 11 Apr 19:09 CDT 2021, Dmitry Baryshkov wrote:
> 
>> Change huge lookup table to contain just sensible entries. IRQ index is
>> now not an index in the table, but just register id (multiplied by 32,
>> the amount of IRQs in the register) plus offset in the register. This
>> allows us to remove all the "reserved" entries from dpu_irq_map. The
>> table is now only used for lookups, individual functions calculate
>> register and mask using the irq_idx.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  |   10 +-
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 1151 +++--------------
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |    4 +-
>>   3 files changed, 196 insertions(+), 969 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
>> index fd11a2aeab6c..4e2ad03df903 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
>> @@ -70,7 +70,7 @@ static int _dpu_core_irq_enable(struct dpu_kms *dpu_kms, int irq_idx)
>>   		return -EINVAL;
>>   	}
>>   
>> -	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->irq_idx_tbl_size) {
>> +	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
>>   		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
>>   		return -EINVAL;
>>   	}
>> @@ -133,7 +133,7 @@ static int _dpu_core_irq_disable(struct dpu_kms *dpu_kms, int irq_idx)
>>   		return -EINVAL;
>>   	}
>>   
>> -	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->irq_idx_tbl_size) {
>> +	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
>>   		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
>>   		return -EINVAL;
>>   	}
>> @@ -208,7 +208,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>>   		return -EINVAL;
>>   	}
>>   
>> -	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->irq_idx_tbl_size) {
>> +	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
>>   		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
>>   		return -EINVAL;
>>   	}
>> @@ -243,7 +243,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
>>   		return -EINVAL;
>>   	}
>>   
>> -	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->irq_idx_tbl_size) {
>> +	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
>>   		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
>>   		return -EINVAL;
>>   	}
>> @@ -328,7 +328,7 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
>>   	spin_lock_init(&dpu_kms->irq_obj.cb_lock);
>>   
>>   	/* Create irq callbacks for all possible irq_idx */
>> -	dpu_kms->irq_obj.total_irqs = dpu_kms->hw_intr->irq_idx_tbl_size;
>> +	dpu_kms->irq_obj.total_irqs = dpu_kms->hw_intr->total_irqs;
>>   	dpu_kms->irq_obj.irq_cb_tbl = kcalloc(dpu_kms->irq_obj.total_irqs,
>>   			sizeof(struct list_head), GFP_KERNEL);
>>   	dpu_kms->irq_obj.enable_counts = kcalloc(dpu_kms->irq_obj.total_irqs,
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> index 8bd22e060437..2cb6800047c3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> @@ -32,142 +32,142 @@
>>   /**
>>    * WB interrupt status bit definitions
>>    */
>> -#define DPU_INTR_WB_0_DONE BIT(0)
>> -#define DPU_INTR_WB_1_DONE BIT(1)
>> -#define DPU_INTR_WB_2_DONE BIT(4)
>> +#define DPU_INTR_WB_0_DONE	0
>> +#define DPU_INTR_WB_1_DONE	1
>> +#define DPU_INTR_WB_2_DONE	4
>>   
>>   /**
>>    * WDOG timer interrupt status bit definitions
>>    */
>> -#define DPU_INTR_WD_TIMER_0_DONE BIT(2)
>> -#define DPU_INTR_WD_TIMER_1_DONE BIT(3)
>> -#define DPU_INTR_WD_TIMER_2_DONE BIT(5)
>> -#define DPU_INTR_WD_TIMER_3_DONE BIT(6)
>> -#define DPU_INTR_WD_TIMER_4_DONE BIT(7)
>> +#define DPU_INTR_WD_TIMER_0_DONE	2
>> +#define DPU_INTR_WD_TIMER_1_DONE	3
>> +#define DPU_INTR_WD_TIMER_2_DONE	5
>> +#define DPU_INTR_WD_TIMER_3_DONE	6
>> +#define DPU_INTR_WD_TIMER_4_DONE	7
>>   
>>   /**
>>    * Pingpong interrupt status bit definitions
>>    */
>> -#define DPU_INTR_PING_PONG_0_DONE BIT(8)
>> -#define DPU_INTR_PING_PONG_1_DONE BIT(9)
>> -#define DPU_INTR_PING_PONG_2_DONE BIT(10)
>> -#define DPU_INTR_PING_PONG_3_DONE BIT(11)
>> -#define DPU_INTR_PING_PONG_0_RD_PTR BIT(12)
>> -#define DPU_INTR_PING_PONG_1_RD_PTR BIT(13)
>> -#define DPU_INTR_PING_PONG_2_RD_PTR BIT(14)
>> -#define DPU_INTR_PING_PONG_3_RD_PTR BIT(15)
>> -#define DPU_INTR_PING_PONG_0_WR_PTR BIT(16)
>> -#define DPU_INTR_PING_PONG_1_WR_PTR BIT(17)
>> -#define DPU_INTR_PING_PONG_2_WR_PTR BIT(18)
>> -#define DPU_INTR_PING_PONG_3_WR_PTR BIT(19)
>> -#define DPU_INTR_PING_PONG_0_AUTOREFRESH_DONE BIT(20)
>> -#define DPU_INTR_PING_PONG_1_AUTOREFRESH_DONE BIT(21)
>> -#define DPU_INTR_PING_PONG_2_AUTOREFRESH_DONE BIT(22)
>> -#define DPU_INTR_PING_PONG_3_AUTOREFRESH_DONE BIT(23)
>> +#define DPU_INTR_PING_PONG_0_DONE	8
>> +#define DPU_INTR_PING_PONG_1_DONE	9
>> +#define DPU_INTR_PING_PONG_2_DONE	10
>> +#define DPU_INTR_PING_PONG_3_DONE	11
>> +#define DPU_INTR_PING_PONG_0_RD_PTR	12
>> +#define DPU_INTR_PING_PONG_1_RD_PTR	13
>> +#define DPU_INTR_PING_PONG_2_RD_PTR	14
>> +#define DPU_INTR_PING_PONG_3_RD_PTR	15
>> +#define DPU_INTR_PING_PONG_0_WR_PTR	16
>> +#define DPU_INTR_PING_PONG_1_WR_PTR	17
>> +#define DPU_INTR_PING_PONG_2_WR_PTR	18
>> +#define DPU_INTR_PING_PONG_3_WR_PTR	19
>> +#define DPU_INTR_PING_PONG_0_AUTOREFRESH_DONE	20
>> +#define DPU_INTR_PING_PONG_1_AUTOREFRESH_DONE	21
>> +#define DPU_INTR_PING_PONG_2_AUTOREFRESH_DONE	22
>> +#define DPU_INTR_PING_PONG_3_AUTOREFRESH_DONE	23
>>   
>>   /**
>>    * Interface interrupt status bit definitions
>>    */
>> -#define DPU_INTR_INTF_0_UNDERRUN BIT(24)
>> -#define DPU_INTR_INTF_1_UNDERRUN BIT(26)
>> -#define DPU_INTR_INTF_2_UNDERRUN BIT(28)
>> -#define DPU_INTR_INTF_3_UNDERRUN BIT(30)
>> -#define DPU_INTR_INTF_5_UNDERRUN BIT(22)
>> -#define DPU_INTR_INTF_0_VSYNC BIT(25)
>> -#define DPU_INTR_INTF_1_VSYNC BIT(27)
>> -#define DPU_INTR_INTF_2_VSYNC BIT(29)
>> -#define DPU_INTR_INTF_3_VSYNC BIT(31)
>> -#define DPU_INTR_INTF_5_VSYNC BIT(23)
>> +#define DPU_INTR_INTF_0_UNDERRUN	24
>> +#define DPU_INTR_INTF_1_UNDERRUN	26
>> +#define DPU_INTR_INTF_2_UNDERRUN	28
>> +#define DPU_INTR_INTF_3_UNDERRUN	30
>> +#define DPU_INTR_INTF_5_UNDERRUN	22
>> +#define DPU_INTR_INTF_0_VSYNC	25
>> +#define DPU_INTR_INTF_1_VSYNC	27
>> +#define DPU_INTR_INTF_2_VSYNC	29
>> +#define DPU_INTR_INTF_3_VSYNC	31
>> +#define DPU_INTR_INTF_5_VSYNC	23
>>   
>>   /**
>>    * Pingpong Secondary interrupt status bit definitions
>>    */
>> -#define DPU_INTR_PING_PONG_S0_AUTOREFRESH_DONE BIT(0)
>> -#define DPU_INTR_PING_PONG_S0_WR_PTR BIT(4)
>> -#define DPU_INTR_PING_PONG_S0_RD_PTR BIT(8)
>> -#define DPU_INTR_PING_PONG_S0_TEAR_DETECTED BIT(22)
>> -#define DPU_INTR_PING_PONG_S0_TE_DETECTED BIT(28)
>> +#define DPU_INTR_PING_PONG_S0_AUTOREFRESH_DONE	0
>> +#define DPU_INTR_PING_PONG_S0_WR_PTR	4
>> +#define DPU_INTR_PING_PONG_S0_RD_PTR	8
>> +#define DPU_INTR_PING_PONG_S0_TEAR_DETECTED	22
>> +#define DPU_INTR_PING_PONG_S0_TE_DETECTED	28
>>   
>>   /**
>>    * Pingpong TEAR detection interrupt status bit definitions
>>    */
>> -#define DPU_INTR_PING_PONG_0_TEAR_DETECTED BIT(16)
>> -#define DPU_INTR_PING_PONG_1_TEAR_DETECTED BIT(17)
>> -#define DPU_INTR_PING_PONG_2_TEAR_DETECTED BIT(18)
>> -#define DPU_INTR_PING_PONG_3_TEAR_DETECTED BIT(19)
>> +#define DPU_INTR_PING_PONG_0_TEAR_DETECTED	16
>> +#define DPU_INTR_PING_PONG_1_TEAR_DETECTED	17
>> +#define DPU_INTR_PING_PONG_2_TEAR_DETECTED	18
>> +#define DPU_INTR_PING_PONG_3_TEAR_DETECTED	19
>>   
>>   /**
>>    * Pingpong TE detection interrupt status bit definitions
>>    */
>> -#define DPU_INTR_PING_PONG_0_TE_DETECTED BIT(24)
>> -#define DPU_INTR_PING_PONG_1_TE_DETECTED BIT(25)
>> -#define DPU_INTR_PING_PONG_2_TE_DETECTED BIT(26)
>> -#define DPU_INTR_PING_PONG_3_TE_DETECTED BIT(27)
>> +#define DPU_INTR_PING_PONG_0_TE_DETECTED	24
>> +#define DPU_INTR_PING_PONG_1_TE_DETECTED	25
>> +#define DPU_INTR_PING_PONG_2_TE_DETECTED	26
>> +#define DPU_INTR_PING_PONG_3_TE_DETECTED	27
>>   
>>   /**
>>    * Ctl start interrupt status bit definitions
>>    */
>> -#define DPU_INTR_CTL_0_START BIT(9)
>> -#define DPU_INTR_CTL_1_START BIT(10)
>> -#define DPU_INTR_CTL_2_START BIT(11)
>> -#define DPU_INTR_CTL_3_START BIT(12)
>> -#define DPU_INTR_CTL_4_START BIT(13)
>> +#define DPU_INTR_CTL_0_START	9
>> +#define DPU_INTR_CTL_1_START	10
>> +#define DPU_INTR_CTL_2_START	11
>> +#define DPU_INTR_CTL_3_START	12
>> +#define DPU_INTR_CTL_4_START	13
>>   
>>   /**
>>    * Concurrent WB overflow interrupt status bit definitions
>>    */
>> -#define DPU_INTR_CWB_2_OVERFLOW BIT(14)
>> -#define DPU_INTR_CWB_3_OVERFLOW BIT(15)
>> +#define DPU_INTR_CWB_2_OVERFLOW	14
>> +#define DPU_INTR_CWB_3_OVERFLOW	15
>>   
>>   /**
>>    * Histogram VIG done interrupt status bit definitions
>>    */
>> -#define DPU_INTR_HIST_VIG_0_DONE BIT(0)
>> -#define DPU_INTR_HIST_VIG_1_DONE BIT(4)
>> -#define DPU_INTR_HIST_VIG_2_DONE BIT(8)
>> -#define DPU_INTR_HIST_VIG_3_DONE BIT(10)
>> +#define DPU_INTR_HIST_VIG_0_DONE	0
>> +#define DPU_INTR_HIST_VIG_1_DONE	4
>> +#define DPU_INTR_HIST_VIG_2_DONE	8
>> +#define DPU_INTR_HIST_VIG_3_DONE	10
>>   
>>   /**
>>    * Histogram VIG reset Sequence done interrupt status bit definitions
>>    */
>> -#define DPU_INTR_HIST_VIG_0_RSTSEQ_DONE BIT(1)
>> -#define DPU_INTR_HIST_VIG_1_RSTSEQ_DONE BIT(5)
>> -#define DPU_INTR_HIST_VIG_2_RSTSEQ_DONE BIT(9)
>> -#define DPU_INTR_HIST_VIG_3_RSTSEQ_DONE BIT(11)
>> +#define DPU_INTR_HIST_VIG_0_RSTSEQ_DONE	1
>> +#define DPU_INTR_HIST_VIG_1_RSTSEQ_DONE	5
>> +#define DPU_INTR_HIST_VIG_2_RSTSEQ_DONE	9
>> +#define DPU_INTR_HIST_VIG_3_RSTSEQ_DONE	11
>>   
>>   /**
>>    * Histogram DSPP done interrupt status bit definitions
>>    */
>> -#define DPU_INTR_HIST_DSPP_0_DONE BIT(12)
>> -#define DPU_INTR_HIST_DSPP_1_DONE BIT(16)
>> -#define DPU_INTR_HIST_DSPP_2_DONE BIT(20)
>> -#define DPU_INTR_HIST_DSPP_3_DONE BIT(22)
>> +#define DPU_INTR_HIST_DSPP_0_DONE	12
>> +#define DPU_INTR_HIST_DSPP_1_DONE	16
>> +#define DPU_INTR_HIST_DSPP_2_DONE	20
>> +#define DPU_INTR_HIST_DSPP_3_DONE	22
>>   
>>   /**
>>    * Histogram DSPP reset Sequence done interrupt status bit definitions
>>    */
>> -#define DPU_INTR_HIST_DSPP_0_RSTSEQ_DONE BIT(13)
>> -#define DPU_INTR_HIST_DSPP_1_RSTSEQ_DONE BIT(17)
>> -#define DPU_INTR_HIST_DSPP_2_RSTSEQ_DONE BIT(21)
>> -#define DPU_INTR_HIST_DSPP_3_RSTSEQ_DONE BIT(23)
>> +#define DPU_INTR_HIST_DSPP_0_RSTSEQ_DONE	13
>> +#define DPU_INTR_HIST_DSPP_1_RSTSEQ_DONE	17
>> +#define DPU_INTR_HIST_DSPP_2_RSTSEQ_DONE	21
>> +#define DPU_INTR_HIST_DSPP_3_RSTSEQ_DONE	23
>>   
>>   /**
>>    * INTF interrupt status bit definitions
>>    */
>> -#define DPU_INTR_VIDEO_INTO_STATIC BIT(0)
>> -#define DPU_INTR_VIDEO_OUTOF_STATIC BIT(1)
>> -#define DPU_INTR_DSICMD_0_INTO_STATIC BIT(2)
>> -#define DPU_INTR_DSICMD_0_OUTOF_STATIC BIT(3)
>> -#define DPU_INTR_DSICMD_1_INTO_STATIC BIT(4)
>> -#define DPU_INTR_DSICMD_1_OUTOF_STATIC BIT(5)
>> -#define DPU_INTR_DSICMD_2_INTO_STATIC BIT(6)
>> -#define DPU_INTR_DSICMD_2_OUTOF_STATIC BIT(7)
>> -#define DPU_INTR_PROG_LINE BIT(8)
>> +#define DPU_INTR_VIDEO_INTO_STATIC	0
>> +#define DPU_INTR_VIDEO_OUTOF_STATIC	1
>> +#define DPU_INTR_DSICMD_0_INTO_STATIC	2
>> +#define DPU_INTR_DSICMD_0_OUTOF_STATIC	3
>> +#define DPU_INTR_DSICMD_1_INTO_STATIC	4
>> +#define DPU_INTR_DSICMD_1_OUTOF_STATIC	5
>> +#define DPU_INTR_DSICMD_2_INTO_STATIC	6
>> +#define DPU_INTR_DSICMD_2_OUTOF_STATIC	7
>> +#define DPU_INTR_PROG_LINE		8
>>   
>>   /**
>>    * AD4 interrupt status bit definitions
>>    */
>> -#define DPU_INTR_BACKLIGHT_UPDATED BIT(0)
>> +#define DPU_INTR_BACKLIGHT_UPDATED	0
>>   /**
>>    * struct dpu_intr_reg - array of DPU register sets
>>    * @clr_off:	offset to CLEAR reg
>> @@ -184,13 +184,13 @@ struct dpu_intr_reg {
>>    * struct dpu_irq_type - maps each irq with i/f
>>    * @intr_type:		type of interrupt listed in dpu_intr_type
>>    * @instance_idx:	instance index of the associated HW block in DPU
>> - * @irq_mask:		corresponding bit in the interrupt status reg
>> + * @irq_offset:		corresponding bit in the interrupt status reg
>>    * @reg_idx:		which reg set to use
>>    */
>>   struct dpu_irq_type {
>>   	u32 intr_type;
>>   	u32 instance_idx;
>> -	u32 irq_mask;
>> +	u32 irq_offset;
>>   	u32 reg_idx;
>>   };
>>   
>> @@ -265,6 +265,10 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>>   	},
>>   };
>>   
>> +#define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
>> +#define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
>> +#define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
>> +
>>   /*
>>    * struct dpu_irq_type - IRQ mapping table use for lookup an irq_idx in this
>>    *			 table that have a matching interface type and
>> @@ -328,59 +332,20 @@ static const struct dpu_irq_type dpu_irq_map[] = {
>>   	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_2, DPU_INTR_INTF_2_VSYNC, 0},
>>   	{ DPU_IRQ_TYPE_INTF_UNDER_RUN, INTF_3, DPU_INTR_INTF_3_UNDERRUN, 0},
>>   	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_3, DPU_INTR_INTF_3_VSYNC, 0},
>> -	/* irq_idx:32-33 */
>> +	/* irq_idx: 22,23, changed for sc7x80 */
> 
> Afaict there are 32 items before this in the array, so per your commit
> message this would represent BIT(0) in the MDP_SSPP_TOP0:INTR2, but
> these are BIT(22) and BIT(33) in the first INTR register.
> 
> Unfortunately index 22 and 23 are already taken and in my sc8180x code I
> thought the INTF_5 bits had moved and overwrote the PINGPONG ones.
> 
> But that is not the case and what I now realize is that we have
> duplicate entries in the list for these two bits - e.g.
> DPU_INTR_PING_PONG_2_AUTOREFRESH_DONE and DPU_INTR_INTF_5_UNDERRUN both
> define the interrupt for BIT(22) in the first INTR register.
> 
> The way that sc7180 ensures that INTF_5 is considered is to include
> DPU_IRQ_TYPE_PING_PONG_AUTO_REF in obsolete_irq of struct dpu_mdss_cfg.
> So the search code will jump over the first match and later find the
> entry for INTF_5 - and we have 34 "possible" bits in the first INTR.
> 
> 
> As such, your approach will unfortunately not work to describe the old
> and the new register layout. Further more the design would not be able
> to cope with a bit moving within a register.
> 
> 
> I think we instead should register the list of interrupts from the hw
> catalog.
> 
> We should be able to describe each register as a {clear, enable, status}
> offset and an array of 32 entries, where the index denotes the BIT() in
> the register. Then we describe a given platform as a list of references
> to such register objects. Older targets would include
> sdm845_sspp_top0_intr in their list and newer ones
> sc7180_sspp_top0_intr.

I've implemented my thoughts on this in v2 of this patchset, squashing 
it with this patch (to remove rewriting of the table destined to be 
dropped in the next patch).

> That way we will avoid this obfuscated patchwork that mdss_irqs and
> obsolete_irq gives us.
> 
> Reards,
> Bjorn
> 
>>   	{ DPU_IRQ_TYPE_INTF_UNDER_RUN, INTF_5, DPU_INTR_INTF_5_UNDERRUN, 0},
>>   	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_5, DPU_INTR_INTF_5_VSYNC, 0},
[skipped the rest of the patch]

-- 
With best wishes
Dmitry
