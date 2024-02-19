Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4D185A13A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 11:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C4D10E2D7;
	Mon, 19 Feb 2024 10:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AoalEGL2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7C110E2D7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 10:43:53 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-512ab55fde6so1675976e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 02:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708339431; x=1708944231; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4Kggm66I2y/vi1EeOvhEU59nPGFhYTXx3hwaaB0gBno=;
 b=AoalEGL2KKx0B9ZPkIPwSKuQM84OwvD+envfpVaC0p80npic3Rp+qwzj90X2uW3KWm
 KQAWGrcYLY2pHUhkoV3zWRKb2+kHF58FhR152CC4CS+wiu9NlPrzroQWnQRHTgk+5iCA
 3IX+3xkGFcAA71DndRrX7xyuyKo8N6c149P0TCmloApO7N49pcPyJxG1IaMV2jW5SjIb
 0pZsSvCbIbwUwVYC6nEfCWyXxo5f2Gy24XiYieYD3yyQ+YXepKMWqcCXtXiBHjgdQyK9
 7q94lGQjDHpMhmJSQC76VRRY6lYjSQsQS0+HPOOaYI7EsBz0A5sRLLf9Z1+r7F7tCNl+
 Dc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708339431; x=1708944231;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4Kggm66I2y/vi1EeOvhEU59nPGFhYTXx3hwaaB0gBno=;
 b=tWhyod+whp0gQGZd1/wxK5vxTIUyt8xQNlgnaxs7XVw9cfM1mBropqQzlepciU51sk
 tawxNwERDFr0IVLrD0Xxh3yviY77BPFOqksb2+s3xBRpgbl09ij7KsCUYAfDVVGbzX99
 koQMjJWnpGXjr69yRTjMAzi5iX1SAzW/DVLwtZ2jepay1IIjpktu9vDiGiL1T+FPMW/6
 QYSnjXpqoygMqIncaNH5OeiwQ9CMMCMct9XY5KLmkE9+bzUIlBtOGVIeK+ew8h1vY0Bt
 cwla/ga5Fmt2bP1Bbm1siy7kiGLQf0EpXrPtdheBXUzZwtfx9LQnt/buX5ojEckkJAhx
 m38w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSaVDZt7bMIFArz6R7WWP2u1cUPZF6EMJOxuxssf/1SOBuwU3gq/Q4g/iK3rw4AQAGjW9EsN6j6MViyJBXELKATWLUOPo9mutObzHUXPV/
X-Gm-Message-State: AOJu0YwikGUJKBfG8+VPfUrn6wNj2WRvOPLfOufeM/LJo/NAEuOrv0eU
 xcIblRm3qhV2GMFRYsoV1a8/ngH/9jfKdiT50gxzB02HmvoAWARvUy930V6q0Uc=
X-Google-Smtp-Source: AGHT+IElz4TjU8D2lkNBcsMPEFJNte9kkFpP/echmyo2LLc0c99lFChPflTVKFN/lBqt9pVsTI42jw==
X-Received: by 2002:a19:8c5d:0:b0:511:1790:e3dd with SMTP id
 i29-20020a198c5d000000b005111790e3ddmr7555086lfj.54.1708339431427; 
 Mon, 19 Feb 2024 02:43:51 -0800 (PST)
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 e11-20020a19690b000000b00512bdc911f5sm74051lfc.271.2024.02.19.02.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 02:43:50 -0800 (PST)
Message-ID: <9c66c731-50a5-4dca-a3cf-e8042136c715@linaro.org>
Date: Mon, 19 Feb 2024 11:43:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 1/1] drm/msm/adreno: Add support for SM7150 SoC
 machine
Content-Language: en-US
To: Danila Tikhonov <danila@jiaxyga.com>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 johan+linaro@kernel.org, quic_bjorande@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240218195007.89960-1-danila@jiaxyga.com>
 <20240218195007.89960-2-danila@jiaxyga.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240218195007.89960-2-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
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

On 18.02.2024 20:50, Danila Tikhonov wrote:
> SM7150 has 5 power levels which correspond to 5 speed-bin values: 0,
> 128, 146, 167, 172. Speed-bin value is calulated as FMAX/4.8MHz round up
> to zero decimal places.
> 
> Also a618 on SM7150 uses a615 zapfw. Add a squashed version (.mbn).
> 
> Add this as machine = "qcom,sm7150", because speed-bin values are
> different from atoll (sc7180/sm7125).
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---

Sorry for the mess on the previous thread!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
