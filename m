Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E33E185F3A8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 09:58:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8A010E8CD;
	Thu, 22 Feb 2024 08:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lDpA36SF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BEE110E8D0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 08:58:06 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-512be9194b7so4637188e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 00:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708592284; x=1709197084; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=InnA2fi+9OUiyjfIuMtov0BHHll7ueKTvAkfvELf4u4=;
 b=lDpA36SFIDjDE/rYj1zGRa7qVDczhpmXOQBuD5veqHdc0+zoT466V/bTwP8i+4bTNa
 RcnVr5dFURiiIZJ5tNq7NBT5X5tJWQBwPlBO8LmSNo3slW6Fwwdo/elZy5j2fH/Ihjv9
 uIaqXQGvTjQPK83YDzGmNHjuFD7Xq0DWQF/Da58VsBgwoI57oA9C0xHHqvpLxMSaPhVw
 6ldGiWYzkAMojgshQ1SlrtFwCl6P1PRbMUO0gGWEgaGak+zJ1E9VukuFcSBzetFPrjR/
 5xI+bGWF7VZdLywC9Eb6tZwTBsweJQXkXkPLswqz5oyM+qjDPnb7jKE856e0BmZ+F+Wl
 kklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708592284; x=1709197084;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=InnA2fi+9OUiyjfIuMtov0BHHll7ueKTvAkfvELf4u4=;
 b=T0qi8i3PnMlC30JDEfBsjA8Cex4yjQX3Dvy8U4sxNXP0n/vZeiSGvJBzM0bAndxCjJ
 zpdPlqa85ZYtlWixFZ9daGmY/VgaV+D4SsuTmkjUGVdfSCIxnkOzLQ3ncAcHPxg0izX6
 Y6vERSDAXUDWFJD7eO7r8ATHfWeCRZfcN6GdxFV8ycTo89Ye39TTet8cwJD7CiniKCyW
 k6FDIT7xpQ2v/NuQAS4mlHa3MixW4oh4kmsZnCaYEtd/Er1avuiovXSu0ffEtK4mZY9M
 PRIEsXOkC6ZqcxUX1XYLwsNFKGe82ZEgavNC39wC0MvgeHvsTrG0RrJf1acOzn+cyZOQ
 xLwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMRlmv+DISTn43sx65Mhx4r6TUyTPtYgFBE17AYZva/vqJ4pFnbESgCQxhQ7ww4LPEvEzAYzkGir7ndRB7bMbEb8Gq7QPYIYbiMaDYAZoC
X-Gm-Message-State: AOJu0YwdoZ8xpFupw1IJfocE8/uy9h1YQtbwjUR0Umrn/S4p6V4TsgvT
 xCp+++jc10uS4Q3CEtTDGlDF/pe6WlFbSgMgHI58ND+b7fzhdlZMBkKbQIww104=
X-Google-Smtp-Source: AGHT+IFYqsqFTXHNGYBEA/VbzHq9YMqt3pAFuZeURFayWiGEc6/8KE7KjhnMY7Lt6sjZKOb0joqMBQ==
X-Received: by 2002:a05:6512:2312:b0:512:cda1:9bab with SMTP id
 o18-20020a056512231200b00512cda19babmr4000278lfu.13.1708592284042; 
 Thu, 22 Feb 2024 00:58:04 -0800 (PST)
Received: from [87.246.222.6] (netpanel-87-246-222-6.pol.akademiki.lublin.pl.
 [87.246.222.6]) by smtp.gmail.com with ESMTPSA id
 b6-20020ac24106000000b0051176ff32c1sm1992022lfi.62.2024.02.22.00.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 00:58:03 -0800 (PST)
Message-ID: <12af5139-39a1-4b1a-a9d8-ac616f29e961@linaro.org>
Date: Thu, 22 Feb 2024 09:58:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: qcom: qcs6490-rb3gen2: Introduce USB
 redriver
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
 <20240221-rb3gen2-dp-connector-v1-7-dc0964ef7d96@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-7-dc0964ef7d96@quicinc.com>
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
> The RB3gen2 has a USB redriver on APPS_I2C, enable the bus and introduce
> the redriver. The plumbing with other components is kept separate for
> clarity.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

Any chance you could add an alias for this I2C bus?

Or all of them, in advance?

Konrad
