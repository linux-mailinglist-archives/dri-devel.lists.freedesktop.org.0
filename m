Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A228C5D92
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 00:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB3610E4D2;
	Tue, 14 May 2024 22:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lAP0CFKa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494EC10E4D2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 22:17:28 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2e3e18c24c1so65986911fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 15:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715725046; x=1716329846; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LtFt7wDddzxzOujkRVGAoAf/dJUoMvePNiVnCCaevzU=;
 b=lAP0CFKakI/y/GoF0Do4CgmdACLYIPh12b4ZR4I6QR72353soBygNJeWR+v3rFBP1S
 UrGmedqNEOb5lTVIZ48cn04sLwHyPsPm5m7i/SPD0C30AAKbi5S7os8VonEWLfIBavAR
 TJJizKmR6Mz0xNZGGHuLYiXBwAyBAojQdkeiD7wIH7U/SQOmAiB/V4rSyy/OpyFvyzZn
 Gxgb2CzcsSNcZo6P8wTayRHv9MxVjKdEnHIJor/vfN/ijg7TPE6C+Mpnytf7GF5cJHln
 rezB/Del9YxwYbmX1w0dNztp+7D8XBqbJkaRHtZnQlYRiLDzJpodMJuay0B2jpcdBjXU
 dgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715725046; x=1716329846;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LtFt7wDddzxzOujkRVGAoAf/dJUoMvePNiVnCCaevzU=;
 b=O38YK/xh10pSBRn13P3k05qOz3kfdUgU/ZBC3yFf3jN5uXNiJdZqt9lntPrFIahmDL
 68owDtQqKKI8J7xx+xTzmq+3IyJI5hREhNB7qhEcIepB3ac49dFC2fSsyOjwNtGRB7eU
 1tHoh9S7zV4v3B9Vc+rRnVyXpIRGpBhv4ASgnyiu7/sw9xJTcLz+LLFq2d0RVQSB7qhn
 euOfMPhzj5r8HsQPFd4NMj7DUIPLFDsFMkiZinnsW4NB8lM5dpG+tVgRed5mtsLW8KS4
 cNqW254E7d/JcVIMzrwPiHDBCaPjqXSxEnrM4u4wRwJGLDRcoLWqDEIchXth+uO6Rb62
 Mldg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9T3wH9XEPAe7vDrTnLBOXKgwBllV4M9xXbwC92lJgwm59KdBsO/RCMKgQqi6aksCjC69LjwfGxJtVo9UF4IkAbzvnGyJw85OctMjZJTTZ
X-Gm-Message-State: AOJu0YxB6kUsv2vVoeXkDqAFY0OUWtGcfnBfAVuJxVCSRqHo6fpq2QlA
 VMjSTycTSFqwK2KiF1DgcY0qxMQNElPvKG57Akz1uMWUdqF0S1qdNCfR+UN1GVI=
X-Google-Smtp-Source: AGHT+IHufBornj75MaM0CaFqK+fsJscVVdOQ/IMTS+dnU8UXQa2+ajhmTfkTpNSwPpVz1LgRs/Djzg==
X-Received: by 2002:a2e:460a:0:b0:2e6:f710:6061 with SMTP id
 38308e7fff4ca-2e6f710617fmr340141fa.17.1715725045977; 
 Tue, 14 May 2024 15:17:25 -0700 (PDT)
Received: from [10.1.2.16] ([149.14.240.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41ff063d8cesm175234525e9.46.2024.05.14.15.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 15:17:25 -0700 (PDT)
Message-ID: <0ba6af4b-1d69-454b-85cf-a83b64431496@linaro.org>
Date: Wed, 15 May 2024 00:17:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Add obj flags to gpu devcoredump
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>, Ruan Jinjie <ruanjinjie@huawei.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20240513155150.166924-1-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240513155150.166924-1-robdclark@gmail.com>
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



On 5/13/24 17:51, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> When debugging faults, it is useful to know how the BO is mapped (cached
> vs WC, gpu readonly, etc).
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
