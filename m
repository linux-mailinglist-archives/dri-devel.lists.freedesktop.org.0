Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 339C3C98AD4
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 19:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A94F10E455;
	Mon,  1 Dec 2025 18:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bgv0i5/U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70CB10E45A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 18:15:03 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b762de65c07so105273966b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 10:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764612902; x=1765217702; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uDFjPV2bCEcJMIJe+ovqNB08eGKarAnB/LsdrnkXVnc=;
 b=Bgv0i5/Ur0qhcBKZHSc1VUNBIflUQhTE0ZDhVZO/6bXxqG0Mh8RBmG0qVWwsV7Evzz
 ji1nqb3h+x0/8I1yRnTBgBW4RymDRkLaeLkwu11FiFr72wrp7r4ntOtiK/4s0didl3l0
 knDTcPqDTXKojKmzFAs6QZWhj0xpNUJjaZIblo0I2wOF/12sPukNWbKbcIXmlCqATxCf
 5kSOISnQ4N1qjIS0ECA5EzwAIsnRmm/PisfJOEQXS8Y94CVnjaOxtg1yqhlq8uEDhv3J
 9Y9yzRV9RUDhyhEcaGk1eVRiv9Epn6HQLP/TzDTo39+kWSbG9PxK3WfAHCCDrwUFr6fK
 /CwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764612902; x=1765217702;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uDFjPV2bCEcJMIJe+ovqNB08eGKarAnB/LsdrnkXVnc=;
 b=vy/EazFJp/KghTiLQYBDDmUV1NuGYHj/J1LPDgtciDRgyWNeE4urqeaIgcMF8Si1GT
 LxI1zHkf/1iVzTTIETrA8+OPA5M2GY9MBG6Av6onAKWZ1fr5UL4631x9c3t9Urbx7guI
 cslIGlAtFxgQkVy3aNd9qeZR9QPAm5DBFAMXuKnP80jDrQ7bD+GuCXfbKwhqah6Eu/wA
 5QXKQ7JdA8ZCOc4d5aPDEUZ1crYgasLQVhZlycBZB3y/dXvvwKyuXhV+9EeXxvZJJlBk
 o4EhXKRsOBoweerCX9wcSeHZUOL4WSIf+5xOmQzkNa8H74iuPltW48gU88Z2zUtJVCm9
 LFog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHVpI+ub+8W7PO3WROqwGfx9GZFBCNpftuZUEC9NrpA6SMNGGTC36id0sZsqa2VkJFPSefCzOceus=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkHHDxWkMv0KXk6QgHZZefgnStolqHJr3R1LgSb03Z/D1JCLQQ
 WR/7vIOY8lAh+Pn7HD8QrCqhpcZclw6NOH4FaojG/5zYAJdU0JxKs9c=
X-Gm-Gg: ASbGncvd0IRSjicRAJwsK2WZLT+fsnFB4ayUta3rKwG9IYeo2KM3ki2qOaxFs4hYL8E
 ic77HXQVe0nuabUfHTZQoTQs42qVY0lvZi316eoIv//tnv+cgJHuBOmG3zovgMAViZW0NTG8PQv
 aVBHYTN+SnxrpKsFFxY2hT4ACujxYQArs+A6SVJzXHoy7yrc6nl1psXxGR9FdJD7yIV/Jg5DXdD
 ISghEfiqdEonDtYzxEidGGHeC5mJC9Ia2FnP6vToG7QyXVFsCiCMTnhMzFFX8qmh/z32PgN/CKw
 Oza7jmOPWKyBgaqMhkAPswcTFVs4kdScR+DAHx7qqTOIZnBn27ed8E+cPZrRlN5Vb8nJ3fBJtvi
 WXfomeX8T6u0MmF7tc88cipQMBe9tkboOiJS10kRfmV2HBfmqU3BTZXZdnwr2spJJTq/r5RXJwr
 NSCnn/PeesL6gskP+tqjuZF55ez5KkmJpPRcf7Wn88DLSOSpCdK46O14T9vG+qC8WCqW57pctj+
 g==
X-Google-Smtp-Source: AGHT+IFrteTmdKpXbAPM5X2OBc2eatrHMRgNBwNQjniHBNZv/OV/UcAPIc4J1u1StehmefDeVyKnvw==
X-Received: by 2002:a17:907:6d1c:b0:b73:5936:77fc with SMTP id
 a640c23a62f3a-b76c54b85b0mr3000547266b.13.1764612902143; 
 Mon, 01 Dec 2025 10:15:02 -0800 (PST)
Received: from [192.168.1.17] (host-79-32-234-137.retail.telecomitalia.it.
 [79.32.234.137]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f51c67e2sm1295011566b.27.2025.12.01.10.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 10:15:01 -0800 (PST)
Message-ID: <2f93530c-7917-4169-8e17-9842f1b0c4ea@gmail.com>
Date: Mon, 1 Dec 2025 19:15:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: Fix a7xx per pipe register programming
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251128-gras_nc_mode_fix-v2-1-634cda7b810f@gmail.com>
 <17b0f475-6c67-4cef-9277-251f45c1837c@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <17b0f475-6c67-4cef-9277-251f45c1837c@oss.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/1/25 5:14 AM, Akhil P Oommen wrote:
> On 11/28/2025 10:47 PM, Anna Maniscalco wrote:
>> GEN7_GRAS_NC_MODE_CNTL was only programmed for BR and not for BV pipe
>> but it needs to be programmed for both.
>>
>> Program both pipes in hw_init and introducea separate reglist for it in
>> order to add this register to the dynamic reglist which supports
>> restoring registers per pipe.
>>
>> Fixes: 91389b4e3263 ("drm/msm/a6xx: Add a pwrup_list field to a6xx_info")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>> ---
>> Changes in v2:
>> - Added missing Cc: stable to commit
>> - Added pipe_regs to all 7xx gens
>> - Null check pipe_regs in a7xx_patch_pwrup_reglist
>> - Added parentheses around bitwise and in a7xx_patch_pwrup_reglist
>> - Use A7XX_PIPE_{BR, BV, NONE} enum values
>> - Link to v1: https://lore.kernel.org/r/20251127-gras_nc_mode_fix-v1-1-5c0cf616401f@gmail.com
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 12 ++++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 34 +++++++++++++++++++++++++++----
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 13 ++++++++++++
>>   4 files changed, 55 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 29107b362346..10732062d681 100644
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
>> +static const struct adreno_reglist_pipe a7xx_reglist_pipe_regs[] = {
>> +	{ REG_A7XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
>> +};
>> +
>> +DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_reglist_pipe);
>> +
>>   static const struct adreno_info a7xx_gpus[] = {
>>   	{
>>   		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
>> @@ -1491,6 +1496,7 @@ static const struct adreno_info a7xx_gpus[] = {
>>   			.hwcg = a730_hwcg,
>>   			.protect = &a730_protect,
>>   			.pwrup_reglist = &a7xx_pwrup_reglist,
>> +			.pipe_reglist = &a7xx_reglist_pipe,
>>   			.gbif_cx = a640_gbif,
>>   			.gmu_cgc_mode = 0x00020000,
>>   		},
>> @@ -1513,6 +1519,7 @@ static const struct adreno_info a7xx_gpus[] = {
>>   			.hwcg = a740_hwcg,
>>   			.protect = &a730_protect,
>>   			.pwrup_reglist = &a7xx_pwrup_reglist,
>> +			.pipe_reglist = &a7xx_reglist_pipe,
>>   			.gbif_cx = a640_gbif,
>>   			.gmu_chipid = 0x7020100,
>>   			.gmu_cgc_mode = 0x00020202,
>> @@ -1548,6 +1555,7 @@ static const struct adreno_info a7xx_gpus[] = {
>>   			.protect = &a730_protect,
>>   			.pwrup_reglist = &a7xx_pwrup_reglist,
>>   			.ifpc_reglist = &a750_ifpc_reglist,
>> +			.pipe_reglist = &a7xx_reglist_pipe,
>>   			.gbif_cx = a640_gbif,
>>   			.gmu_chipid = 0x7050001,
>>   			.gmu_cgc_mode = 0x00020202,
>> @@ -1590,6 +1598,7 @@ static const struct adreno_info a7xx_gpus[] = {
>>   			.protect = &a730_protect,
>>   			.pwrup_reglist = &a7xx_pwrup_reglist,
>>   			.ifpc_reglist = &a750_ifpc_reglist,
>> +			.pipe_reglist = &a7xx_reglist_pipe,
>>   			.gbif_cx = a640_gbif,
>>   			.gmu_chipid = 0x7090100,
>>   			.gmu_cgc_mode = 0x00020202,
>> @@ -1623,6 +1632,7 @@ static const struct adreno_info a7xx_gpus[] = {
>>   			.hwcg = a740_hwcg,
>>   			.protect = &a730_protect,
>>   			.pwrup_reglist = &a7xx_pwrup_reglist,
>> +			.pipe_reglist = &a7xx_reglist_pipe,
>>   			.gbif_cx = a640_gbif,
>>   			.gmu_chipid = 0x70f0000,
>>   			.gmu_cgc_mode = 0x00020222,
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 0200a7e71cdf..422ce4c97f70 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -849,9 +849,16 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>   		  min_acc_len_64b << 3 |
>>   		  hbb_lo << 1 | ubwc_mode);
>>   
>> -	if (adreno_is_a7xx(adreno_gpu))
>> -		gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
>> -			  FIELD_PREP(GENMASK(8, 5), hbb_lo));
>> +	if (adreno_is_a7xx(adreno_gpu)) {
>> +		for (u32 pipe_id = A7XX_PIPE_BR; pipe_id <= A7XX_PIPE_BV; pipe_id++) {
>> +			gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
>> +				  A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id));
>> +			gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
>> +				  FIELD_PREP(GENMASK(8, 5), hbb_lo));
>> +		}
>> +		gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
>> +			  A7XX_CP_APERTURE_CNTL_HOST_PIPE(A7XX_PIPE_NONE));
>> +	}
>>   
>>   	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
>>   		  min_acc_len_64b << 23 | hbb_lo << 21);
>> @@ -865,9 +872,11 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
>>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>   	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>   	const struct adreno_reglist_list *reglist;
>> +	const struct adreno_reglist_pipe_list *pipe_reglist;
>>   	void *ptr = a6xx_gpu->pwrup_reglist_ptr;
>>   	struct cpu_gpu_lock *lock = ptr;
>>   	u32 *dest = (u32 *)&lock->regs[0];
>> +	u32 pipe_reglist_count = 0;
>>   	int i;
>>   
>>   	lock->gpu_req = lock->cpu_req = lock->turn = 0;
>> @@ -907,7 +916,24 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
>>   	 * (<aperture, shifted 12 bits> <address> <data>), and the length is
>>   	 * stored as number for triplets in dynamic_list_len.
>>   	 */
>> -	lock->dynamic_list_len = 0;
>> +	pipe_reglist = adreno_gpu->info->a6xx->pipe_reglist;
>> +	if (pipe_reglist) {
>> +		for (u32 pipe_id = A7XX_PIPE_BR; pipe_id <= A7XX_PIPE_BV; pipe_id++) {
> This patch is probably not rebased on msm-next. On msm-next tip, we have
> removed A7XX prefix for pipe enums.

Oh no it is rebased that was down to some confusion I made when I was 
testing with an older branch.

Fixed in v3

>
>> +			gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
>> +				  A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id));
>> +			for (i = 0; i < pipe_reglist->count; i++) {
>> +				if ((pipe_reglist->regs[i].pipe & BIT(pipe_id)) == 0)
>> +					continue;
>> +				*dest++ = A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id);
>> +				*dest++ = pipe_reglist->regs[i].offset;
>> +				*dest++ = gpu_read(gpu, pipe_reglist->regs[i].offset);
>> +				pipe_reglist_count++;
>> +			}
>> +		}
>> +		gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
>> +			  A7XX_CP_APERTURE_CNTL_HOST_PIPE(A7XX_PIPE_NONE));
>> +	}
>> +	lock->dynamic_list_len = pipe_reglist_count;
>>   }
>>   
>>   static int a7xx_preempt_start(struct msm_gpu *gpu)
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index 6820216ec5fc..0a1d6acbc638 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -46,6 +46,7 @@ struct a6xx_info {
>>   	const struct adreno_protect *protect;
>>   	const struct adreno_reglist_list *pwrup_reglist;
>>   	const struct adreno_reglist_list *ifpc_reglist;
>> +	const struct adreno_reglist_pipe_list *pipe_reglist;
> nit: Maybe dyn_pwrup_reglist is a better name.
>
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Agreed, I changed the name in v3. Thx for the review!
>
> -Akhil
>
>
>>   	const struct adreno_reglist *gbif_cx;
>>   	const struct adreno_reglist_pipe *nonctxt_reglist;
>>   	u32 max_slices;
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index 0f8d3de97636..1d0145f8b3ec 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -188,6 +188,19 @@ static const struct adreno_reglist_list name = {		\
>>   	.count = ARRAY_SIZE(name ## _regs),		\
>>   };
>>   
>> +struct adreno_reglist_pipe_list {
>> +	/** @reg: List of register **/
>> +	const struct adreno_reglist_pipe *regs;
>> +	/** @count: Number of registers in the list **/
>> +	u32 count;
>> +};
>> +
>> +#define DECLARE_ADRENO_REGLIST_PIPE_LIST(name)	\
>> +static const struct adreno_reglist_pipe_list name = {		\
>> +	.regs = name ## _regs,				\
>> +	.count = ARRAY_SIZE(name ## _regs),		\
>> +};
>> +
>>   struct adreno_gpu {
>>   	struct msm_gpu base;
>>   	const struct adreno_info *info;
>>
>> ---
>> base-commit: 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
>> change-id: 20251126-gras_nc_mode_fix-7224ee506a39
>>
>> Best regards,


Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

