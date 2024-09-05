Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F313F96DF53
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 18:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C55610E16F;
	Thu,  5 Sep 2024 16:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="RTicxtnB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99AF10E16F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 16:14:19 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-374ca7a10d4so617508f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 09:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1725552858; x=1726157658;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SQCzkFNF6R0y5OgjwiBOcxXDxjjM7SPAsOwwAJex/C0=;
 b=RTicxtnBaq5MSJxNAPpNLEJ1AgL7r1SuoryZMd1FKL3EodAwQo2ZBLHgsEbBes1ZuD
 thaNtvWROKvpDcVKZDPuOH0ZIudSp4rtNbkUnfH1uUGt6eplGI0aMwPloA1H6kJfEM9F
 cpSLdHpR/Exqtn6m8LhRkYcH3NG6JbE1iYLgDjHJAa/AIRv20I4iIaGSsL4owRai5rrj
 5eX0xRhWvF+XtErdqz2BCBdKzbvv6noP6vEIep8Tnk5nI0/acjxiHgAIv2Kx2IWcJUwA
 /QTvTlpG4kaB27AxJKXOsrAqGweBIMTdwalP/Nltx7osyH2ImJ9MKz12bevJyTdiHMDJ
 SwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725552858; x=1726157658;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SQCzkFNF6R0y5OgjwiBOcxXDxjjM7SPAsOwwAJex/C0=;
 b=YqbyZV4NxzWB7+BlhTAddjfLxgV7c9asgu5bZ9eGNnQiS1qtYy69Tx+cM3yyH7SsCG
 4GzFn1f1Y8FcnKAPhvoX+XeeKSwWE5jEZ1AMBthQx2kTxHmUN7ze/MM2nyAqnwpAENds
 WrSKpt0CLbGXoZ84nu6IOplW4SwnjkrD9uGseDDmLW9SdFSRVl8qAH0v7Qh8ZcAmYQkr
 Xi/pTDC5gc0MBevCTwbgG2f9soSiGnkx2xrsJoOmBc4p/KDNRYpvHszh1DyYmszZ+Yd1
 cqAJr+XR9UrlMASt/XujD3aEzOf2S1mhs5mC0hbKJeuTFyETBhraOcdJZuU4/6JXymRx
 QXcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3RIANGYZ+wn/hERDkhjt9QZRqdhzUo0kLVRQeceZHv+ad61ujMpWv3aJlIdeRR8JVSL3cs4qLdpU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6dpxD14SaGc1Bn8KcQrX6UJKaKowsTwy3KWtNr7km85a0yl2v
 yhJjjGvFvfAEdxLVjP6OIr1FmclIFpJfADpXYy3Sq6BKQWuO41oLT9cOua8Oq3A=
X-Google-Smtp-Source: AGHT+IGTeRidPfzjWMeiTd2JcaXWh07h5yeyFVwKWBYencGxKEZw41jcBDd8CO30rx53dbUA3JWpWg==
X-Received: by 2002:a5d:6991:0:b0:374:c7d1:2ac0 with SMTP id
 ffacd0b85a97d-3787e496687mr2221867f8f.47.1725552857141; 
 Thu, 05 Sep 2024 09:14:17 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c6543ee3sm12569790f8f.12.2024.09.05.09.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 09:14:16 -0700 (PDT)
Message-ID: <747218ab-86a1-4308-b34a-98064ccdac30@freebox.fr>
Date: Thu, 5 Sep 2024 18:14:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] HDMI TX support in msm8998
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20240724-hdmi-tx-v7-0-e44a20553464@freebox.fr>
 <172550712143.3299484.1580127137460046609.b4-ty@linaro.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <172550712143.3299484.1580127137460046609.b4-ty@linaro.org>
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

On 05/09/2024 05:33, Dmitry Baryshkov wrote:

> On Wed, 24 Jul 2024 17:01:33 +0200, Marc Gonzalez wrote:
>
>> DT bits required for HDMI TX support in qcom APQ8098 (MSM8998 cousin)
> 
> Applied, thanks!
> 
> [1/6] dt-bindings: phy: add qcom,hdmi-phy-8998
>       https://gitlab.freedesktop.org/lumag/msm/-/commit/8886def25eef
> [2/6] dt-bindings: display/msm: hdmi: add qcom,hdmi-tx-8998
>       https://gitlab.freedesktop.org/lumag/msm/-/commit/656810411b1d
> [3/6] drm/msm/hdmi: add "qcom,hdmi-tx-8998" compatible
>       https://gitlab.freedesktop.org/lumag/msm/-/commit/a61eb17f40e8
> [4/6] drm/msm: add msm8998 hdmi phy/pll support
>       https://gitlab.freedesktop.org/lumag/msm/-/commit/caedbf17c48d

Hello Bjorn,

Now that the binding & driver parts have been merged,
(Thanks, Dmitry! And thanks to all reviewers)
am I right to assume that you are supposed to pick up
patches 5 & 6 for the msm8998 DTSI?
(Hopefully in time for 6.12-rc1)

Regards

