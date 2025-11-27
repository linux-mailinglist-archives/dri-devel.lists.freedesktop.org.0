Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EE7C8FE03
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 19:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3E310E85C;
	Thu, 27 Nov 2025 18:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y0EXbWQp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7B510E857
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 18:14:46 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-640a0812658so1966550a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 10:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764267285; x=1764872085; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ceY0sHn48rRAcMonu5JKJvkpaxI/kuQGGI7CQ61F3IE=;
 b=Y0EXbWQpFu3a4pSMRWqpB53JnbNrN+LCWuqmAowhE/+NlKpkFc/VnN5molDCYFddFT
 XY+DG409/3Ip/MVQY/Nv8q+xod5nEGVfX93f+9WxnBQZQOM7ZcxaoUnKD2rAAD6vrrbC
 579tdbOE0PlEqIkDGdvnFQqsZCtuOUUWD+O34jF9lPlFpLpUzRbhSwCq9RYHNYghOBTM
 1TykReBtLb/iKEpozHLtYV/MCTPJJ9nS8L5YXdrJg8loS5NJiAP8+JgHwGIOeuTMCLoj
 5k3VYTJ6FgK/LCazTEUEoDD8Vw4mTQ4/dqRLZQ+PAQoWVaU1PYQpXmJ2sNGlY1P0aIkI
 C/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764267285; x=1764872085;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ceY0sHn48rRAcMonu5JKJvkpaxI/kuQGGI7CQ61F3IE=;
 b=UPNr1QRkZFCTEm6mf2QwTUf6b/YusYLa6fcT0M5r8BWA/I1gySkuLkUMR1xbvJ7L8B
 a6qABBF/l5zdrEW+c3jrL5dSy0nW4xsaw+XL3JZjBTQFYVf78V3Uxpap9LxnRiq3UPI8
 Qor0tyk7/S7s6/AUzKWShw5BhOF6GxiZdr5R2MljajaUlc1HowjhDqF2gAKahJXX+cc1
 xj/pgxh1HlyqQPMpCnWLQ5zX8zzprBIbFvHMztJ1+83ogr8Gr/4ytIqcOa9Jdlx+bgO3
 IB0GKmJbWr9Thc4tjep5uwht7WZVdHm2Rz5aqioaOkxLWZb6F2Zf/o6QuEVgWs/tg83S
 PPmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW73+ff0Y4vyKi+KpCqsrRDsSeOdkM+IwqA7u9SsjNStGGR6SNG1H2k0aWU4mXN6vP0Jcfh1JpuqIU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytWc1H9TzJLCdLo801jDj/ND+eMTs30J1WLBZPY++Wbm731e3c
 b1Nn9TBhiJAKJglZzTA4gB34bVuUG5SEPzPaC+KPzSAueG2W+oCtmNYZF8BZ
X-Gm-Gg: ASbGncvh7/okVRJ+8jbEwNf0o4BeAVQwV1kEOlz5frw5GYd2PAITiP1M9Pi9rfWP5+6
 zjWhV0Ptu5JgSikvq1KBIlH5byfyi0n3+5SCX81xt9UfmME32Q6xNx5jMS7PutFu4EiCkj+v4WO
 KuFIH+EZDrPZ9EwsvpR0sF4p5jIYSYB6pUmJk2Tmjq/cF9Hjf4Ky4v3J6VIagAo4odW/oQxJYKH
 YvplwAX/Mpx/KCqri8DykC4yPLzsE2dT2wybZgap8gAXjF0ronAE2uvSWXM2gdS2gXvgb5ev8Yx
 5UBxCKcl+KFpLYx5z1bNOTioCMzKMQpBjVt655wrRNXCHPOYtWBEuIR+KQitEA45suD1ZqdQ8MV
 A92PkOteFOOT5Bgx8z1jRQeemJPk1q9YPxTgzvFS1pcpSucyoaSymDbtZyl8trVvS6FI0pr/PVs
 /xn6kWdY5Bhhd61USH6RXw9bMYyNQlz9URytmkBbgPB7zuCfU1qGm+u2+JjZhjLjAb8kcK5jDZy
 j0/pRiuVg==
X-Google-Smtp-Source: AGHT+IGRUoCmVJ8/5fdmTyuQWpZViuuejagy86jo7A4HW53phUVP0SJulYD9Y2kxyuKuF6EnaU2ukQ==
X-Received: by 2002:a05:6402:2688:b0:640:8bdb:65f0 with SMTP id
 4fb4d7f45d1cf-645eb23bc21mr11606430a12.11.1764267284699; 
 Thu, 27 Nov 2025 10:14:44 -0800 (PST)
Received: from [192.168.1.17] (host-79-53-175-79.retail.telecomitalia.it.
 [79.53.175.79]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64751050a63sm2219261a12.24.2025.11.27.10.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 10:14:44 -0800 (PST)
Message-ID: <951138f1-d325-4764-a689-e1c3db12bb90@gmail.com>
Date: Thu, 27 Nov 2025 19:14:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix a7xx per pipe register programming
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251127-gras_nc_mode_fix-v1-1-5c0cf616401f@gmail.com>
 <58570d98-f8f1-4e8c-8ae2-5f70a1ced67a@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <58570d98-f8f1-4e8c-8ae2-5f70a1ced67a@oss.qualcomm.com>
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

On 11/27/25 3:25 PM, Konrad Dybcio wrote:
> On 11/27/25 12:46 AM, Anna Maniscalco wrote:
>> GEN7_GRAS_NC_MODE_CNTL was only programmed for BR and not for BV pipe
>> but it needs to be programmed for both.
>>
>> Program both pipes in hw_init and introducea separate reglist for it in
>> order to add this register to the dynamic reglist which supports
>> restoring registers per pipe.
>>
>> Fixes: 91389b4e3263 ("drm/msm/a6xx: Add a pwrup_list field to a6xx_info")
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  9 ++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 91 +++++++++++++++++++++++++++++--
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 13 +++++
>>   4 files changed, 109 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 29107b362346..c8d0b1d59b68 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1376,7 +1376,6 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>>   	REG_A6XX_UCHE_MODE_CNTL,
>>   	REG_A6XX_RB_NC_MODE_CNTL,
>>   	REG_A6XX_RB_CMP_DBG_ECO_CNTL,
>> -	REG_A7XX_GRAS_NC_MODE_CNTL,
>>   	REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE,
>>   	REG_A6XX_UCHE_GBIF_GX_CONFIG,
>>   	REG_A6XX_UCHE_CLIENT_PF,
>> @@ -1448,6 +1447,12 @@ static const u32 a750_ifpc_reglist_regs[] = {
>>   
>>   DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
>>   
>> +static const struct adreno_reglist_pipe a750_reglist_pipe_regs[] = {
>> +	{ REG_A7XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> At a glance at kgsl, all gen7 GPUs that support concurrent binning (i.e.
> not gen7_3_0/a710? and gen7_14_0/whatever that translates to) need this

Right.

I wonder if gen7_14_0 could be a702?

If we do support one of those a7xx GPUs that don't have concurrent 
binning then I need to have a condition in hw_init for it when 
initializing REG_A7XX_GRAS_NC_MODE_CNTL

>
> Konrad


Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

