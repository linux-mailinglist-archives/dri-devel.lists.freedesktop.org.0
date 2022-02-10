Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DE04B09F4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 10:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773B110E7BE;
	Thu, 10 Feb 2022 09:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4D910E7BE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 09:50:48 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i34so9385984lfv.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 01:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=CngJ+UjWUmvAVy4/bM0ovf96zSL5J/lSGtKSp/n9h34=;
 b=p4yIHqvWk/xa+/iIlrU8AOZ70keGFx7j5JwojMxu3Wa36AvnkXN67CXtupYmtsWXs4
 K7nl7/vys7rpej7STElkxdKfXpQ3mD7/jOPfmPVitL+vl1duvIxMz+pRA05wqf0VMfra
 UoQgKi8uG2yoHqr2Vk5EyzvG2vPZZhZxr+rS33sgrYJ6uuqoIO7t1arYN92VesztTqs6
 Us8UMgG2UiWu/+ZtOOiIgQknnHA88cKQ2FDC2A+paIH2kqN9mdnjWjpg6Cq/pm1aZ7xu
 w1DtrSzPatZy83kNavuf0z3q0viqxClqqEShjWgb6NRF3xwKmRcnAmmXWRZndyYSe8pU
 3ITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=CngJ+UjWUmvAVy4/bM0ovf96zSL5J/lSGtKSp/n9h34=;
 b=KX9QpuJNzr4mpQGjKUiBL/vpKikPLbSFeRphj5UxzIkqSw/KJKcUjwyl8ov+IpYWai
 fgQhyFNMOWzfadILWk5lz0PnljmX1g2kdQdys/QNAmexhtX0qWWP0FOCn5hriKZAewmR
 hbIWwW07V4ratgJiu2DpUwQhrxZTX4NPwxRIFOX6FT1qBqGUPGL+QhI/m9W9cRWnZqDi
 HUyRR3P1/wMLoOpAjoN55VFX7/ozrGwXfB9gHTFHW7H5Y2hr6QZaf34PBoBvPALcvKL+
 H1nB4asUBD5k3P/RTDTqf953Co8k+X/6JsSZeBkU0n9e91ilqTCz0UdtVpwi9dU76+Mc
 +BcA==
X-Gm-Message-State: AOAM533XWc9l2q0/zhCI16FloGYxD7rclBVOxAGlU/Z24yFtjqqbigSr
 cPLxh5w61RGD7Uwm86BZ3OFdMQ==
X-Google-Smtp-Source: ABdhPJx+tAi+K4eZQFhjdsO2Hex06V7hu3VnQLUWmC3cKKFbwTFj5NodmbpX5qhlENw6cedikrnPjw==
X-Received: by 2002:a05:6512:c22:: with SMTP id
 z34mr4864472lfu.259.1644486646997; 
 Thu, 10 Feb 2022 01:50:46 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b31sm2729441lfv.163.2022.02.10.01.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 01:50:46 -0800 (PST)
Message-ID: <e9941f8d-5796-b524-793b-148f12fea51e@linaro.org>
Date: Thu, 10 Feb 2022 12:50:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: gpu: drm: msm: use div64_u64() instead of do_div()
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Qing Wang <wangqing@vivo.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <1644395837-3845-1-git-send-email-wangqing@vivo.com>
 <6ea0e85e-1ade-f102-86c2-4b71dbc24285@linaro.org>
In-Reply-To: <6ea0e85e-1ade-f102-86c2-4b71dbc24285@linaro.org>
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

On 10/02/2022 01:17, Dmitry Baryshkov wrote:
> On 09/02/2022 11:37, Qing Wang wrote:
>> From: Wang Qing <wangqing@vivo.com>
>>
>> do_div() does a 64-by-32 division.
>> When the divisor is u64, do_div() truncates it to 32 bits, this means it
>> can test non-zero and be truncated to zero for division.
>>
>> fix do_div.cocci warning:
>> do_div() does a 64-by-32 division, please consider using div64_u64 
>> instead.
>>
>> Signed-off-by: Wang Qing <wangqing@vivo.com>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

After rechecking, I'd like to withdraw my R-B tag (Minecrell, thanks for 
pointing this out!)

The div64_u64 is not equivalent to do_div. It returns the quotient 
rather than modifying the first arg. Moreover it is unoptimal on 32-bit 
arches.

I'd suggest changing the math to remove multiplications by 1000 and 
10000 before division. Or just ignoring this at all, judging from the 
fact that these values are used only for tracing rather than actual 
calculations.

> 
>> ---
>>   drivers/gpu/drm/msm/msm_gpu.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c 
>> b/drivers/gpu/drm/msm/msm_gpu.c
>> index 2c1049c..aa4617b
>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>> @@ -648,7 +648,7 @@ static void retire_submit(struct msm_gpu *gpu, 
>> struct msm_ringbuffer *ring,
>>       /* Calculate the clock frequency from the number of CP cycles */
>>       if (elapsed) {
>>           clock = (stats->cpcycles_end - stats->cpcycles_start) * 1000;
>> -        do_div(clock, elapsed);
>> +        div64_u64(clock, elapsed);
>>       }
>>       trace_msm_gpu_submit_retired(submit, elapsed, clock,
> 
> 


-- 
With best wishes
Dmitry
