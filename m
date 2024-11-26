Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F050D9D9983
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 15:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E7210E8C4;
	Tue, 26 Nov 2024 14:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pRV1Pd/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE6610E8C4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 14:21:31 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53dd57589c8so4420126e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 06:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732630889; x=1733235689; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WsqG/pbjaTDjdBrbE8Gh7QedJI2HzzUU10Z4g5bMrfU=;
 b=pRV1Pd/OlnHNJEr0da7QDsX4sj3MmRmlUngYbzkoQwkMqDMNyaHv6JBDEZaDiMovrw
 w39NeIA4gScw0Jp5HSgoYdCu+cZH4uSp5nOcwTOvAcODauI+3KV4HjDVqkQb317mPYRi
 tGCWf4HI7hOZLMhMUOMJZ1UZbZdxNaUE+ofNiXIiBPhthLsXlWNU6EYVo3OdjviY0VAC
 gl8VkzDew5IviyS4k2VyqGub6D7sV+/L7YOmrzfH1LdhUwednwT6ISudNeNIC9tudGVc
 TVqXI9Zac8vRfkdkoAYn/olAkufskGumK/7oM2Hweb0ytF8ztVv6jjjAQfYSNK61HAft
 fJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732630889; x=1733235689;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WsqG/pbjaTDjdBrbE8Gh7QedJI2HzzUU10Z4g5bMrfU=;
 b=iLLxY8OlRevxXPgaJETTJwG9nh34boOCZEwbw6I6TixDQgyjkuGt3him07MgsmXDdL
 Wmd6eFB8kuLcj7pkX42jPLiz7CfKf+hBcW/jPJZ7Q1AY5BXEBiO0HwrH4CikP0JpB8EJ
 kUiR/f3kHmLjD+22OzwLYiYQxkmti0tBNkZtK546dFxVkdB0lKoQxw3HnNeRHEv3Uf9t
 kDxMiHE9WQtTZsIe7zH3Cq9/QzKp6CXf7UsAJAXg/nC8fnDd8/czdtO5aWeBnpNjsvwD
 BseOeNZN4cP7r8h6J2nW1qbPswHINirMg1LoMggAIHf7QBYa7UgGwBXd9krwwUfsE9Cm
 cBmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMl6+g4acdADbBi20d4Rx9uercmHVnRbSF87MNdGOW7EpGXNTIr5aKRFfl6ybZYGouOQEghXaeR54=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKIIUTSJJXIextM3q9b4XJMd2PdDPPoumIyIbN9ul5qbQ+Ff/4
 +lIDoyhHPHxg6Lx65WxU+6FpNaZ3i6ObJX6SyE9xnGKQvwUuQVEw0eTbLO50Tuw=
X-Gm-Gg: ASbGnctE0pgy3k+XK+vcY3qLol0VacMBEbCClu8GSEpdThxfkAR49LxfPdfj3GhumbF
 irt9z33Gxl8RJCsq5ebxPFbxv6cUNoYPmH49IM2+eNbVef42PtxukwsZbcwohlkW6Rgo5sIjoPj
 1gYV/i+XgbzpLmSKupmKGeOdozXWXA0Ge1GxCC2ZwqZpSz9yFPT06WXKLdp/t4nR+Pt+/huDplU
 PdA3+uSxAUbKsZQNoA4kRH23xQNtV8X7tlKJmevhRSIs4lxzWrFtQeR/tgieQYGLynRW9S6wMMS
 7rpLfGmarm4q4pfiZVmEpg8PjGJNpA==
X-Google-Smtp-Source: AGHT+IEJeByCvQlDqy1R+C0A81cHp1AJ1H0PojsXjN2ky6dVBr3C2B16XhZSVyi5c5B271VuJ9O4Kw==
X-Received: by 2002:a05:6512:318b:b0:53d:eda7:6981 with SMTP id
 2adb3069b0e04-53deda76a69mr556144e87.27.1732630889153; 
 Tue, 26 Nov 2024 06:21:29 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd24518d7sm2025711e87.80.2024.11.26.06.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 06:21:28 -0800 (PST)
Date: Tue, 26 Nov 2024 16:21:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU
Message-ID: <x3jgyvzkb2p5txzmqvj2qdhj7ag5css7qgbynxlohbypz53dq2@io64rzakgmkd>
References: <20241126-qcs615-gpu-dt-v1-0-a87782976dad@quicinc.com>
 <20241126-qcs615-gpu-dt-v1-3-a87782976dad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126-qcs615-gpu-dt-v1-3-a87782976dad@quicinc.com>
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

On Tue, Nov 26, 2024 at 07:36:49PM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Enable GPU for qcs615-ride platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
