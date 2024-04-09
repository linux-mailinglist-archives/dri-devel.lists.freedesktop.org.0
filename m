Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD63F89DDB1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 17:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C66112CA3;
	Tue,  9 Apr 2024 15:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W7Z00y2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9D4112D10
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 15:04:20 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d8b2389e73so6010801fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 08:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712675058; x=1713279858; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3YM+s20cdEdse7t7bN3iKiAdYaiSxxuKdZKKsCgmaYw=;
 b=W7Z00y2ynq93Tl6BwUvyLKMKqKUVUCP36uo0SBqYGVwxF+1zpfwm0Aj7z1l9lJgSHc
 gLdCZLgpURarn80kH4Y7B/DO5lLb1VB+oHqdoJN8Uq3t6G6/tc9fqwx4LAKtncliUUDU
 MYctdXXE+m8iEJCifeji/DrbwOxv7gwoxEB2CHsyvJ1I92Q5olHkcjAzS9SG3cmLXXM2
 aJuOEwtblptiFx37Rgc4oGkTGSfdWtiHmmWklPqrdYrHv37Mheuijuh3K7Px8+ZMUt6N
 UMCuZpjDJkcWCTzn7smhCDD5O7G9cSbLmF3qcSYRb894/JQWfW8arcYP3NMJJ8D2wwEA
 Wqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712675058; x=1713279858;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3YM+s20cdEdse7t7bN3iKiAdYaiSxxuKdZKKsCgmaYw=;
 b=dLbNZ9kznJR7dIvZDTU2uQC1wnQd+4MEbFoW5pPlORMAsMFyaERDvV8iXwDULHXkSF
 EhXEXBEhhuSf8h4KclyVFvihFusrt270AKEdrAU9BIfFPcAe+5OfCe/cLIEQML5iv+2d
 hRlmVpx8UIJMlB9SHe116YYgICikMhrqQUDCHNmeZ6yz+elsRQxdFgvx4oYL9l2oPAy+
 mOmavD+CgaH4hCxPyHIxbLtUW+d+ulM/wtMchmff5khh3SCGWsd08Oj539bE9P13p73v
 bJgTpuUQl3oxMXUAzR4vw6V40b0iYc5FK4L+Kf6kEtr3SzA04qgz2KXicZUIQVI/fFjv
 YBbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSEVtjlsaT92O70SCXRP4OawLgXm+KGoq1TV+OuKTTkH7dlQddFNAcYo7uMWzxnjqtaiV6KCj92WrAsIfnMgRW7KiVuEu1do/pKeotskke
X-Gm-Message-State: AOJu0Yyvh75298NGtOTzKW5g37W7w8liFfLlt5UMMSfiLVB+oygFyfuR
 UAmsM+/wsrXz5RzQxthrLN/k9ndmsQLA1LFDPdb760dgqbdrP2CSFkZ9kdj/NHI=
X-Google-Smtp-Source: AGHT+IGoHv754pdfAq6TjWUEj3Tebb540y8BjG8KDvn0k1jGyKTq4jOdTq4eg0QQygBFoeLLrn8fzA==
X-Received: by 2002:a2e:7d12:0:b0:2d8:7200:38ff with SMTP id
 y18-20020a2e7d12000000b002d8720038ffmr64570ljc.24.1712675058205; 
 Tue, 09 Apr 2024 08:04:18 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 j14-20020a2e850e000000b002d88d978484sm841131lji.132.2024.04.09.08.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 08:04:17 -0700 (PDT)
Message-ID: <a8ea0f53-40c0-4fc5-94fc-a88f8e0319ac@linaro.org>
Date: Tue, 9 Apr 2024 17:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] soc: qcom: smem: Add pcode/fcode getters
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-2-ce2b864251b1@linaro.org>
 <zc5u7ixaser6ekl3sltzxccstu63tpydxybquxz5hcasj4cmfo@csjwfifugeod>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <zc5u7ixaser6ekl3sltzxccstu63tpydxybquxz5hcasj4cmfo@csjwfifugeod>
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



On 4/6/24 04:21, Dmitry Baryshkov wrote:
> On Fri, Apr 05, 2024 at 10:41:30AM +0200, Konrad Dybcio wrote:
>> Introduce getters for SoC product and feature codes and export them.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---

[...]


>> +	/* Ensure the value makes sense */
>> +	if (raw_code >= SOCINFO_FC_INT_RESERVE)
>> +		raw_code = SOCINFO_FC_UNKNOWN;
> 
> This looks like a c&p from the previous function. Should we be comparing
> the raw_code with a SOCINFO_PC_ constant?

Looks like!

Konrad
