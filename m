Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E185C767922
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 01:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED1E10E7A5;
	Fri, 28 Jul 2023 23:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE22D10E79F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 23:46:51 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5217ad95029so3326590a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 16:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690588010; x=1691192810;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lz9kYtiZPQWUEvSrRUt8Bwnt8DSLq3LSMib0FexMztk=;
 b=gQNsMagMwNTXP/3B3tpD6enIE8S7Ne55yezjQMlh/M03QcEBct+qczveZpKnN40TGG
 MyPZo2CfisrrsjUmMIbuX+p4qGptYK3jS29Oh8Ga4P+CebI4xCh5S1olPtpJT1ZKJrc3
 WNrCuFU0Z1tP4m2frzGViw/LJuxB7PCeV58YOr6X1xO3zHKoPNljVS/62rET8qYZSo/i
 XvLr1Tr+FsDGdmKImv2kjNsB4mE0cWm8p5elJy6d7zY+sn+oWHANtSJkOvxIo95nacEN
 TRINLeO6OiIb8D5jl9uNzCLniE5Em9f66c+qvxkZex00OwSPfRov8FxKRipB3Z1qA8uI
 lifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690588010; x=1691192810;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lz9kYtiZPQWUEvSrRUt8Bwnt8DSLq3LSMib0FexMztk=;
 b=lM9FoXNgOwdsnz4H4MHD5NoG8yBjo9sZizLZWevtzUzrJNA6gYCpEB8SpWDsCrudUY
 LSK83nVC0GkEIDjutLIpcLa9HJC8ivTeIM81liDhWgcYj68RQrgLMA1dyQ/4CLNXNvrn
 IPEDRqg987/VF6vgpaoo3HtMWzXuojQR61FX/18oTSqSbmuobhAxgk/OAQqbxE3TyVD/
 I0hOMOCPyCYHu2/IfDVsE3h3dOBN4aMHQyG0pcJBHc9pFsrRge2+/FYMBQrSTAY6u2rc
 vSIngmifsrplFskrtxp8nCxt9SSyMiTxR0VEMTAUqDOaXxYLAM/kOd/b6Ma37DvVS2cw
 H9Nw==
X-Gm-Message-State: ABy/qLY46MhYQrw0VBrysql+G80/UaNg8adz5f3/Lswc+rL/6+ouEjkb
 PRhs1rA/GF3HW0T31OFlomuLfw==
X-Google-Smtp-Source: APBJJlHdWbCNHoB6EB/GbRVQSPH3ZKb+71koAxi7jZd03gfnzduMFPFV7MKHYkFwsxKOIWuyd+5y+Q==
X-Received: by 2002:aa7:c152:0:b0:522:3a37:a45f with SMTP id
 r18-20020aa7c152000000b005223a37a45fmr2669462edp.21.1690588010267; 
 Fri, 28 Jul 2023 16:46:50 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n21-20020aa7d055000000b0051e26c7a154sm2280500edo.18.2023.07.28.16.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 16:46:49 -0700 (PDT)
Message-ID: <84a16e2c-0f82-fb5f-56e3-09902487ee33@linaro.org>
Date: Sat, 29 Jul 2023 02:46:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/7] drm/msm/dpu: enable PINGPONG TE operations only when
 supported by HW
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-2-dmitry.baryshkov@linaro.org>
 <hfbtvuvsha4gwlkxz4slcj6zyshuzcrq2sa3j24ymoqwo6wmib@46idblfyif7m>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <hfbtvuvsha4gwlkxz4slcj6zyshuzcrq2sa3j24ymoqwo6wmib@46idblfyif7m>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/07/2023 23:05, Marijn Suijten wrote:
> On 2023-07-27 19:20:58, Dmitry Baryshkov wrote:
>> The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
>> Rather than checking for the flag, check for the presense of the
>> corresponding interrupt line.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> index 9298c166b213..912a3bdf8ad4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> @@ -296,7 +296,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
>>   	c->idx = cfg->id;
>>   	c->caps = cfg;
> 
> In hindsight, maybe there's one patch missing from this series.  You
> inlined _setup_intf_ops() later, but there's no patch inlining
> _setup_pingpong_ops() which looks to be required for applying this
> patch.

Yes, I missed it somehow.

> 
> - Marijn
> 
>>   
>> -	if (test_bit(DPU_PINGPONG_TE, &cfg->features)) {
>> +	if (cfg->intr_rdptr) {
>>   		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
>>   		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
>>   		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

