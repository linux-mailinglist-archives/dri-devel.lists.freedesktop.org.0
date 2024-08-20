Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652839585C4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 13:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6F710E107;
	Tue, 20 Aug 2024 11:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IDtb8Ig5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75D010E106;
 Tue, 20 Aug 2024 11:26:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3A2EBCE0B61;
 Tue, 20 Aug 2024 11:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C6BC4AF0F;
 Tue, 20 Aug 2024 11:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724153158;
 bh=GIZXc/5y+AL+26n0oIBGlAp3mH1MplpwRwBGavdxHQE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IDtb8Ig5XNtIXemPUKdpOrUkMh1O1LOWj4GSqsWHAFX61EzP/vPqyEuw8F1GGWwxD
 5kpLMdDSgXvI5ONJki7p4rgL+Dx/UR8ZUEnnabAo309e1lMon5a+5Z9b/ciB/hFXE1
 uMuTFWd9iQLy8nU9tZ1vUtHyA0DVQA827EpXLodiPyY4xm1JZ72z72ODGUwBVN2Mga
 yonwxhFjkHgkahkVQyfJGIEJIJHI4vtkpilqDZGMP2NnayA5G98wshGP8okpDV3Aux
 LYXEgeRCp+AU3H+8RpRmyN8mEhETLPkb2FLrHyI4vpyHWsGYfox2ZKygBi4JNycoME
 V7Ua2Bhx1JECA==
Message-ID: <f6258263-cea0-45ea-bee4-613b761fbff3@kernel.org>
Date: Tue, 20 Aug 2024 13:25:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/msm: Fix bv_fence being used as bv_rptr
To: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-1-7bda26c34037@gmail.com>
 <e8d1534b-d592-43c4-8a34-4c7c4a04181a@kernel.org>
 <CACu1E7H6g=8thZfoRh8-svjqhdTOPg5diKoj+ENa4F5==d5RxA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <CACu1E7H6g=8thZfoRh8-svjqhdTOPg5diKoj+ENa4F5==d5RxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 20.08.2024 12:45 PM, Connor Abbott wrote:
> On Tue, Aug 20, 2024 at 11:15 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> On 15.08.2024 8:26 PM, Antonino Maniscalco wrote:
>>> The bv_fence field of rbmemptrs was being used incorrectly as the BV
>>> rptr shadow pointer in some places.
>>>
>>> Add a bv_rptr field and change the code to use that instead.
>>>
>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>>>  drivers/gpu/drm/msm/msm_ringbuffer.h  | 1 +
>>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index bcaec86ac67a..32a4faa93d7f 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -1132,7 +1132,7 @@ static int hw_init(struct msm_gpu *gpu)
>>>       /* ..which means "always" on A7xx, also for BV shadow */
>>>       if (adreno_is_a7xx(adreno_gpu)) {
>>>               gpu_write64(gpu, REG_A7XX_CP_BV_RB_RPTR_ADDR,
>>> -                         rbmemptr(gpu->rb[0], bv_fence));
>>> +                         rbmemptr(gpu->rb[0], bv_rptr));
>>>       }
>>>
>>>       /* Always come up on rb 0 */
>>> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
>>> index 0d6beb8cd39a..40791b2ade46 100644
>>> --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
>>> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
>>> @@ -31,6 +31,7 @@ struct msm_rbmemptrs {
>>>       volatile uint32_t rptr;
>>>       volatile uint32_t fence;
>>>       /* Introduced on A7xx */
>>> +     volatile uint32_t bv_rptr;
>>
>> This is never initialized or assigned any value, no?
>>
>> Konrad
> 
> Neither is the original (retroactively BR) shadow RPTR, except
> apparently on suspend (no idea why). It's written by the GPU as it
> reads the ringbuffer, because CP_BV_RPTR_ADDR is set to its address.
> For the BV shadow RPTR, we aren't really using it for anything (and
> neither is kgsl) so we just need to point the register to a valid
> "dummy" address that isn't used by anything else.

Alright, thanks

Konrad
