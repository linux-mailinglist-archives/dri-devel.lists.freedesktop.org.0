Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC85A3232E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 11:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E7E10E1C1;
	Wed, 12 Feb 2025 10:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B8OzIR6P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E50D10E1C1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 10:05:56 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5450622b325so3928099e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 02:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739354754; x=1739959554; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rVn+uPBQWQ6NpvoZYnq/I1sJTX4u55kbRPPlDvjT25g=;
 b=B8OzIR6PkOoFQ7BrH2TxdFkILDQ07RVsya/txpCpYxQljqR/Vz1P+jPR6h6NYU4/Mn
 wlcA+CIP6x90Ut0vPcVlidvMzkD73/uHI40+wb++He6+pwcDWrWLIayCHBvINfNQYpz9
 XNN+F26W8w6A16CVHgL6NWigKUxHxRpSLH3fwgeg7OVkAG0VzFZMgy4HvkffR0RjJx/n
 sY+HyZflbBf10u8sefsBJ51iiBN8p4Qm+7bz10vS/yjbO3DRXo4fr6xj5tphepX1Lv5q
 JDMf7TvncT09zH2aNhaSnOBnB+5IMzWjmg63oiP7xBj59Dq3880fT+rOJyLZl7lj/VzA
 ztbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739354754; x=1739959554;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rVn+uPBQWQ6NpvoZYnq/I1sJTX4u55kbRPPlDvjT25g=;
 b=JKxy0wR6Jq3gX0s0b4uh2tX2WqTy+LDu9qQPchOTHnqrPrr0Vg2rmrSYUkdMn4d9RN
 oqjy3X8W+tBM+V9GcAZ/Uf4zXpjH+sJv7iefawPEKu4H2/9Xi5Sr5G75lQlMj1d6QOoF
 rUWXR+H36odTAf5T8kFERA+C+rIwfiA5IOoMhsMrtnqV+8FBpeRi66nPiiRBdl+po9Yv
 itot/JZ2J1dp323junp6j4YoZk5A6AwNl7/5pz214p0vDYYiHvsS5DT0SffB2842wXqY
 cNXa/6qvL4uVPaVSYDBUt/eYtP1B3gYL/DTkFwuKeNqm1q413BE/BOILqYvLsQa0KZuZ
 leVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9S5l9+0XIsg5FheO+N8vSghnwp4U5aL7ZjRQjvGB4aVsUknUnmR/JBJKJhrkS8jbt2hUAnnedUW8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdOBaXiw+wpPH21ml3m2RiPD4KRFPPdbA6GOaKj0LQMDdVQsQE
 T+j+nKGEHT0Uma/dLxyWSUdehjKR/OBfh2T7qXxjeB+eNcgCHQJN8ZOoC58KqSE=
X-Gm-Gg: ASbGnctrYSHSPVFl4YVXM3pmFDccm3b0T4Xz8XiuFFcKdZkSSfOAI1Finnre1J1lSLd
 9b/qLhr5qwM32gO88Trf1tEnb9k+Ai0Y29smhwgnCPrchLOz4NNP+U3eNDiD7QMOXidSDKoBAlY
 9syoPG7hVooasKWdntZiu0Cm6pQIRNgUwVFDTZ3On4RxEBiiqP4BC2QSe0+QkJJmtUrbEg8lFnZ
 5vgJKZgnqYNxwOTgkEKE7ngM1/wfOZNxOS7Whu0UGJjqeHLjPAZlVNce22ZQuZDG+4RXvGiRoQs
 ZURplKWk93V4FUWMvQWdTY7HXze/1d/S6RPIBeMS/YIbLMrUlQ0OpevAloYJDEaPBcbUNxA=
X-Google-Smtp-Source: AGHT+IFcCCjr2F4j57iyCku2KMNTSNmgSM7kl23BAa4v+symeaOyRKmfomba9eHHUlGd0C+dHbaR+A==
X-Received: by 2002:a05:6512:3c9c:b0:545:bda:f0d with SMTP id
 2adb3069b0e04-5451815a1ccmr746030e87.37.1739354754502; 
 Wed, 12 Feb 2025 02:05:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54410555a3csm1825349e87.78.2025.02.12.02.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 02:05:53 -0800 (PST)
Date: Wed, 12 Feb 2025 12:05:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yongxing Mou <quic_yongmou@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 3/4] dt-bindings: display/msm: Document MDSS on QCS8300
Message-ID: <emfd4gqstixawba64mywtsitbek5srrekoute3hjudi6xhfjhl@7ndrv3ua7uei>
References: <20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com>
 <20250120-mdssdt_qcs8300-v4-3-1687e7842125@quicinc.com>
 <e620e80d-afeb-4ce1-9798-2f5cdd92b3b1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e620e80d-afeb-4ce1-9798-2f5cdd92b3b1@kernel.org>
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

On Wed, Feb 12, 2025 at 09:38:07AM +0100, Krzysztof Kozlowski wrote:
> On 20/01/2025 04:49, Yongxing Mou wrote:
> > Document the MDSS hardware found on the Qualcomm QCS8300 platform.
> > QCS8300 use the same DPU hardware version as SA8775P, so we reuse it's
> > driver. But QCS8300 only have one DP controller, and offset is same with
> > sm8650, so dp controller reuse the sm8650's driver.
> > 
> > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > ---
> >  .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 244 +++++++++++++++++++++
> >  1 file changed, 244 insertions(+)
> 
> Also wrong compatibles used.

Which compatibles are wrong here?

-- 
With best wishes
Dmitry
