Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D71916F84
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 19:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD4610E6F6;
	Tue, 25 Jun 2024 17:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="L2KefoNZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C597710E6FD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 17:45:26 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a724b9b34b0so329240966b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 10:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719337525; x=1719942325; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=NZtQ+FPCoD6gGOl3U2rq3VHnQdVXsv7N8AK93klpC3g=;
 b=L2KefoNZ12w/gc7k/hRCEy9C2748MpUumllbEv+EhPyZwP3+OgzB1lCZ2j2T8IDivC
 vu9kU2PnipUiF7S8LTmIkht/75osL4Hl4ltmqaPYXEII4llymx+U+OQb3JOXkmF4yMf3
 Q8IUTwkPddQMWCR9fqQDYkdsHgjhtJTHBKIbltioQ/9ZAizSyOyE4+DjZYR8u8QnSfU3
 d2gA0yzVSdUnCMQU9AVvtW0yuVfAOE+c276YVvoAxtFb/hPU840+lWXB5GYDYG5Ht0Xv
 JzZKDAE1Um/a8CMHl2Imb4oKQ41+wFKhbTQViyqjvCJ3Gf0A147I1eHtUV803YH8g1g0
 SzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719337525; x=1719942325;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NZtQ+FPCoD6gGOl3U2rq3VHnQdVXsv7N8AK93klpC3g=;
 b=OZWLDRFFare3Je8b2hJhbBJnIc9XBrDGr5A0SntX91uEEqoCWUzE3iv5avI9qLdAGy
 7Z1Jg0toRDG2OHSuwAtCYPwb9gN2Rukb+IG2ybP5K3rA9dQb+lnSvcSn1an4yJBNVVTO
 wD+yL1SbHADkDxgnQ9n4CPkrgdzYY34N/hKp1PLSXMmobbT1gq6vNEIdxCB+2FUTS4fy
 x8W4CH5lmQRIwWngHPkZ+0SU7q0Ti2x3Wr3r7q7S9kkrG9LMCsEF0qSrsypgvW0LLQ9w
 lfVfNX7ePtLHxotBYzqNgvEfmbW1wtA7dLop3p0JGW+i/OPCe0EXwAguaDCRqrKLzyQq
 VVSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMmUU/17HP6ravNvu9eopmNShsCo1u/bJbqJx7hHMrM211hmT6QxNpQYBDDRqTdWCIVIJ4LzqNwZlVL8nyDFHow7IxV21mtHmqLyqh4D0E
X-Gm-Message-State: AOJu0YxUDeRpUuHMjniVS5HXHy/Xoa4KQX3rlHGUefe0P6b0ivwJ+nx2
 53JjI8MUgtum2pIRlY6pXP4iKxxN5ShTjqUGoEzzCEVy8NiPvqGalSvV5ANi/L0=
X-Google-Smtp-Source: AGHT+IHBZiHbATOJgOa5gf/nGJ6ih3pE8Xg9MD/ucyXaGPgPhvAdwT2toiUPIliZvaxOfY+mmItumA==
X-Received: by 2002:a17:906:e085:b0:a6f:d990:338c with SMTP id
 a640c23a62f3a-a7245b8f33dmr528502966b.20.1719337524703; 
 Tue, 25 Jun 2024 10:45:24 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf48b24asm535271766b.57.2024.06.25.10.45.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 10:45:24 -0700 (PDT)
Message-ID: <7461891d-afa6-48b7-985a-02fcecf227c9@linaro.org>
Date: Tue, 25 Jun 2024 19:45:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] drm/msm/adreno: Add speedbin data for SM8550 / A740
To: Rob Clark <robdclark@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
 <20240605-topic-smem_speedbin-v2-4-8989d7e3d176@linaro.org>
 <CAF6AEGsqv3c8EfBK_CxP7Xgoxj5w6n+XdHcGMC8HxrC8C=D8qg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAF6AEGsqv3c8EfBK_CxP7Xgoxj5w6n+XdHcGMC8HxrC8C=D8qg@mail.gmail.com>
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

On 25.06.2024 7:21 PM, Rob Clark wrote:
> On Wed, Jun 5, 2024 at 1:10 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> index 901ef767e491..e00eef8099ae 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -570,6 +570,10 @@ static const struct adreno_info gpulist[] = {
>>                 .zapfw = "a740_zap.mdt",
>>                 .hwcg = a740_hwcg,
>>                 .address_space_size = SZ_16G,
>> +               .speedbins = ADRENO_SPEEDBINS(
>> +                       { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>> +                       { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
> 
> Did you really mean for these both to map to the same speedbin?

Yes

There were more entries previously but the info was unclear and
different between BSPs..

For non-development SoCs it seems that "everything except FC_AC, FC_AF
should be speedbin 1", but what the values are for said "everything" are
not known, so that's an exercise left to the user..

Konrad
