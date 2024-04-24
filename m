Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AF38B1663
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 00:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1345A10E539;
	Wed, 24 Apr 2024 22:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="CE8SHv9X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5919310E539
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 22:45:14 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4196c62bb4eso2693765e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 15:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1713998712;
 x=1714603512; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EjxPm44LNMAJWpuJW83TDZMcoceLZ9YtXan5F0Els34=;
 b=CE8SHv9Xj8YzHXDE+uFY8oZnE2ClSCPrVfsNUaZ3Wqn+PZpEhkuWB1CXrwBRd/0Ddr
 rjgCNHw7QxXiWumfRQY8fGBIRLVleLtbXGN2bGB+m1NPZLdl65ko7J+Kuw58c126JnRK
 YSlfDI/dU7x36F9XHuCU24cDsbCMOLGHIZhwJzj4GP1MTzdGitE7i2rLozb3pQxS3pVn
 f9b3hdtmoi9Dyf0EvtIxwIPAxc5815zFcwSvh03Mao1RWHYeSfSu1oWWm1gA1pc4Niuc
 J0YR59jagSNPv0TkIV5//yl+w0hrptGDARcqyJiVVSJrlwT/8lp/NRp1y95RSVf6tmoO
 bXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713998712; x=1714603512;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EjxPm44LNMAJWpuJW83TDZMcoceLZ9YtXan5F0Els34=;
 b=at2sBTc29NJOW8qJ1Apy1ggFxuqSXFjv+IzjjU1dxLQFMQ5MVMUqExBMZJ54rdW9bd
 XT75rVHpQZCbuOIAVtHTjLL6wGCpiyehpAXWr63YYjVCjI3NZS4/dw9yAgPWTpmUP882
 tMV8soiIwt/rlKEAg/e8eoZxyBn9W9eKuDcbJODA3zaOwKg4Cm9YO0NtltCE7TfHRqSo
 Kp1+e4eRwJEWGLcBlL3kRD41ZDxuVuOU4cVHJMNVntKXrpgOLl/sVQN8aR+ynumtaSwH
 ki4ckTmdonOPonOx7VEbau4qRZMRRmDgyWQhcWH6NBKHa4XKgPgxgNbhuh0eDUk3S/0s
 T8Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+iO0i1uSUUxs4Di4x0gm0HDndfsvMJxXHRYAk1oMEzcmUclVsOiTlWa8DGnRo5TzW4p9gt2/HjEAI6IvIZ+zaIOMGUJkXN1GSLayopW1g
X-Gm-Message-State: AOJu0YxPF1anJEKGU+Tm6AfU0C5UJ+YSJwkmZmpjEhMOxIRC958nnUhM
 fI/zN3vDGPFQ1vn6Pcfq5wvStrMtuquxVP2x+80Uqv0TuBfd5VVaZW7+SK/0Zzg=
X-Google-Smtp-Source: AGHT+IHo7LKxsrmDSKMk8aOpeGv8Hi5vQ2ujCjvtcHptgMG2NI8nzCY+2dEzhDD7b6VRLZ5xZvE/2g==
X-Received: by 2002:a05:600c:a43:b0:41a:7bbe:c3bf with SMTP id
 c3-20020a05600c0a4300b0041a7bbec3bfmr2733342wmq.22.1713998712082; 
 Wed, 24 Apr 2024 15:45:12 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
 by smtp.gmail.com with ESMTPSA id
 k29-20020a05600c1c9d00b00418948a5eb0sm29127833wms.32.2024.04.24.15.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 15:45:11 -0700 (PDT)
Message-ID: <99f51564-df99-4f06-9419-1eaa9501f27d@nexus-software.ie>
Date: Wed, 24 Apr 2024 23:45:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] arm64: dts: qcom: sm8550: Update EAS properties
To: wuxilin123@gmail.com, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Junhao Xie <bigfoot@classfun.cn>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Molly Sophia <mollysophia379@gmail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
 <20240424-ayn-odin2-initial-v1-7-e0aa05c991fd@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20240424-ayn-odin2-initial-v1-7-e0aa05c991fd@gmail.com>
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

On 24/04/2024 16:29, Xilin Wu via B4 Relay wrote:
> From: Xilin Wu <wuxilin123@gmail.com>
> 
> The original values provided by Qualcomm appear to be quite
> inaccurate. Specifically, some heavy gaming tasks could be
> improperly assigned to the A510 cores by the scheduler, resulting
> in a CPU bottleneck. This update to the EAS properties aims to
> enhance the user experience across various scenarios.
> 
> The power numbers were obtained using a Type-C power meter, which
> was directly connected to the battery connector on the AYN Odin 2
> motherboard, acting as a fake battery.
> 
> It should be noted that the A715 cores seem less efficient than the
> A710 cores. Therefore, an average value has been assigned to them,
> considering that the A715 and A710 cores share a single cpufreq
> domain.
> 
> Cortex-A510 cores:
> 441 kHz, 564 mV, 43 mW, 350 Cx
> 556 kHz, 580 mV, 59 mW, 346 Cx
> 672 kHz, 592 mV, 71 mW, 312 Cx
> 787 kHz, 604 mV, 83 mW, 290 Cx
> 902 kHz, 608 mV, 96 mW, 288 Cx
> 1017 kHz, 624 mV, 107 mW, 264 Cx
> 1113 kHz, 636 mV, 117 mW, 252 Cx
> 1228 kHz, 652 mV, 130 mW, 240 Cx
> 1344 kHz, 668 mV, 146 mW, 235 Cx
> 1459 kHz, 688 mV, 155 mW, 214 Cx
> 1555 kHz, 704 mV, 166 mW, 205 Cx
> 1670 kHz, 724 mV, 178 mW, 192 Cx
> 1785 kHz, 744 mV, 197 mW, 189 Cx
> 1900 kHz, 764 mV, 221 mW, 190 Cx
> 2016 kHz, 784 mV, 243 mW, 188 Cx
> Your dynamic-power-coefficient for cpu 1: 251

This looks pretty convincing and like good work.

A few questions and suggestions for your commit log.

I'd really love to know more about how you ran this test. What values 
exactly does your power meter give you?

How did you lock the core to a specific CPU frequency ?

Maybe also give the equation to calculate Pdyn in the commit log.

https://patchwork.kernel.org/project/linux-arm-kernel/patch/1500974575-2244-1-git-send-email-wxt@rock-chips.com/#20763985

---
bod
