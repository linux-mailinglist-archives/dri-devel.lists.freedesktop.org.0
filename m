Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EC085F398
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 09:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096D510E8BA;
	Thu, 22 Feb 2024 08:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Dw3qz92h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095C910E8BA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 08:56:22 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-51181d8f52fso9982558e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 00:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708592180; x=1709196980; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/rbknJKtPFhf19eCJkjQJRk7bzdoJAzars+eP6UgUck=;
 b=Dw3qz92h2fLT4UTuAi6hp0ozezh05YJrl2dkUvLUGL0tmcnPBJmM5HZ5mnATXx+B7e
 y4g8pl8Hyd9lGZCjmeTDmNmdgmu4KEVrinpvP5I/yPUp+/TmNk7u4Ybi6k3crj/STw1b
 hCnwqFNaQVDU+8XA29tlPR7x12GiOuv4CDwAHIyOrv32tYvjhbMucZ5GW1tJbU5kz5ee
 9KONCh4M2y2ppCVY0KXhf+WR4CdS66yAn71Syk3zvyn2HyXu0Hk8ekXKtN2V/MGINrne
 GAY1LVoPJr6WmGXiZ76q87nwNZFWiT5BMT3UUbXCReZulvaV/bm9auMrlo5steaiEFct
 ZO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708592180; x=1709196980;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/rbknJKtPFhf19eCJkjQJRk7bzdoJAzars+eP6UgUck=;
 b=fX/RKrBRwz0L4SxavHwJfJhnhHkWgdLYSKnO3W4zrdNAjKlmjgbo/YJA1N8PRv3ovN
 YHORiHDX+sWTVfX5WK3kCuTIF0BzUrKBbOnVbAQXYO6RoEVDOFYykqDVo5jlSY+K+SSt
 GEorNY8nog9YueImTkwu9K6sT+HdfoUGZwCLCBHr3oJeYidVBIMkczFWtjX9veJtGIWW
 ESMftMtEXlHgpctdarn6bOn2wFZXHjshV36bhX+Jl6c1yYdLpP7ylw88z7PTRsawC+7s
 NQOaPwKI+Sj8ak8mzBNjgV5HzEDF/6qO4rBS0mtXLAjXu5gYhrIeGoKdyOEa7rAjXuu2
 UHTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVthVCQQuam7OAVLKkC+k2iYvJ/QWhX6qEclMPQkvrI3ViN//cMcQT3tmKAr2qCg+hbmUvukG0LAPZCZyuRVYhYN6KTJGDH/eOkHQR0Ii8l
X-Gm-Message-State: AOJu0YyfrcSk41Km5XmkTmQfarg8YQVF1zcJFJQSh/QUoFFoIyHU78cg
 uiVj7W5Yzf6BbtNDjeCk7CCkLGyxUgq+H1MS57DLT1F3MENqsFxw5QqXrowYK6w=
X-Google-Smtp-Source: AGHT+IHI8kwr2TPMWaQcsVFQfDZ5jtmRdq5MbORSZf5eQi7OWgR6bfpA0ultcao4TPa7mA7fVEj4RQ==
X-Received: by 2002:ac2:4e08:0:b0:512:b935:c542 with SMTP id
 e8-20020ac24e08000000b00512b935c542mr8260265lfr.59.1708592180008; 
 Thu, 22 Feb 2024 00:56:20 -0800 (PST)
Received: from [87.246.222.6] (netpanel-87-246-222-6.pol.akademiki.lublin.pl.
 [87.246.222.6]) by smtp.gmail.com with ESMTPSA id
 b6-20020ac24106000000b0051176ff32c1sm1992022lfi.62.2024.02.22.00.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 00:56:19 -0800 (PST)
Message-ID: <080d8b12-ef88-4f45-860c-826c1b1b5895@linaro.org>
Date: Thu, 22 Feb 2024 09:56:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Enable MDP turbo mode
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
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

	

On 2/22/24 00:19, Bjorn Andersson wrote:
> The max frequency listed in the DPU opp-table is 506MHz, this is not
> sufficient to drive a 4k@60 display, resulting in constant underrun.
> 
> Add the missing MDP_CLK turbo frequency of 608MHz to the opp-table to
> fix this.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
