Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A47914F33
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 15:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E4A10E448;
	Mon, 24 Jun 2024 13:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ceXZrCqp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C376A10E083
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 13:53:55 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2eabd22d3f4so53837551fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 06:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719237234; x=1719842034; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5S10zLLSMGCffMYd/h+/RimKZkqJmO/jBCyUz/wexOY=;
 b=ceXZrCqpJrpBiFsKZD9K0wgjM80h4J7iAn13Uvp4UHRJjAZsRYmDjUI5sv7tqPmvdJ
 rLcdusrqA7Rpg31Grcj4Tn3/lYC9EnIREqvr7No46qBQ5Ie+9QFkmH55l55u3lZ4SJww
 m1OJYk0yoLd5dN+5fIWhzNnxvYC3aehlnhpwMFXQW34+yrSpKRDRKiZlG677tWNCKk8V
 dUfrQ8kxwKfKGHYijpuqpGiHLeyoWCGZmyQ1HOD8ctd6JEDp0zfg/si3MFhIoLXNwCyh
 9YeBZ0A8rbce2p6FBy/nv2BLNmASgCd7ToDccVIZvgzushtF9yOjBy2chrHA03jjkR+N
 hjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719237234; x=1719842034;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5S10zLLSMGCffMYd/h+/RimKZkqJmO/jBCyUz/wexOY=;
 b=c4gNtRf8kUfHjBllxuZk1mCGiwzn5QgSJlA8nW4zyuUdzAiHlEKG0twoga9LIHvhP8
 OXv5ASyjqcDBBH03CBm85FwDZxV95c9LwizasEhLJ16C0aNKk9hiImzEZwKr9gofUx22
 lP2x3vETYpNXUeWfLtSq08fpPzW90qi06z1qiZpr2Yp9VyUz8wZetlvmUPkBlaEZhsbv
 4EwxrxbufVnaCPphs/IwikXZgliNe9Wxt3SsQ0arv/6j4xGSKs8pFn/iHgdNc9wGIjMg
 Z0Ko61K9MHkrQjMm5BK8pbosPJ+kPbO9KHJWKvzoSptl/mcrV3gzhQE0N3ebv0VPwU3V
 SXVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/iVGWWZzQEMFP01SBVJOZWBuzzoGB15M06ZMgqEvZuUwArCbOFg+Lw8fhBHK1K/jVx5CQRoVlH+ALFa+tNqudkXZi/cMdNPEkLmLcFcld
X-Gm-Message-State: AOJu0Yyu2Sr0bpvVKFhbRgrljb0pdMOU9KlOvtD/Qs5rIABlq/jGBAoF
 XCqYImi1t1BkmxjtslXqmQrLickZyQleTt5TfUenG7vID/cK49SkFre5Ark9KmY=
X-Google-Smtp-Source: AGHT+IF7G8yRO1cSo8vqHH5UaeNqcbHw+S8TNtA0Ju96Wb3SODipWZSK3i2ngTmztbBS/byXZ+YJCA==
X-Received: by 2002:a2e:9b55:0:b0:2ec:50dc:af8d with SMTP id
 38308e7fff4ca-2ec5b29fc03mr26068691fa.12.1719237233248; 
 Mon, 24 Jun 2024 06:53:53 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c03:9198:7df:6a16:3e8e:ed7b?
 ([2a00:f41:c03:9198:7df:6a16:3e8e:ed7b])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d30534e35sm4701537a12.62.2024.06.24.06.53.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 06:53:52 -0700 (PDT)
Message-ID: <5947559d-30dd-4da1-93cc-a15dc65cb77d@linaro.org>
Date: Mon, 24 Jun 2024 15:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] drm/msm/adreno: Add support for X185 GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-3-quic_akhilpo@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240623110753.141400-3-quic_akhilpo@quicinc.com>
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



On 6/23/24 13:06, Akhil P Oommen wrote:
> Add support in drm/msm driver for the Adreno X185 gpu found in
> Snapdragon X1 Elite chipset.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> 
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 19 +++++++++++++++----
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 ++----
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
>   4 files changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 0e3dfd4c2bc8..168a4bddfaf2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -830,8 +830,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>   	 */
>   	gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
>   
> +	if (adreno_is_x185(adreno_gpu)) {
> +		chipid = 0x7050001;

What's wrong with using the logic below?

>   	/* NOTE: A730 may also fall in this if-condition with a future GMU fw update. */
> -	if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gpu)) {
> +	} else if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gpu)) {
>   		/* A7xx GPUs have obfuscated chip IDs. Use constant maj = 7 */
>   		chipid = FIELD_PREP(GENMASK(31, 24), 0x7);
>   
> @@ -1329,9 +1331,18 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
>   	if (!pri_count)
>   		return -EINVAL;
>   
> -	sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
> -	if (IS_ERR(sec))
> -		return PTR_ERR(sec);
> +	/*
> +	 * Some targets have a separate gfx mxc rail. So try to read that first and then fall back
> +	 * to regular mx rail if it is missing
> +	 */
> +	sec = cmd_db_read_aux_data("gmxc.lvl", &sec_count);
> +	if (PTR_ERR_OR_ZERO(sec) == -EPROBE_DEFER) {
> +		return -EPROBE_DEFER;
> +	} else if (IS_ERR(sec)) {
> +		sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
> +		if (IS_ERR(sec))
> +			return PTR_ERR(sec);
> +	}

I assume GMXC would always be used if present, although please use the
approach Dmitry suggested


The rest looks good!

Konrad
