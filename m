Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF52A474A8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 05:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2095E10EA39;
	Thu, 27 Feb 2025 04:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QcqT53qt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDB710EA34
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 04:38:06 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-54527a7270eso473079e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 20:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631085; x=1741235885; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8Qfog7C+RF4zPzBr1L919bNbTJtyOk3Zvza1VKHBAM=;
 b=QcqT53qtzxST6egUVt20mwIMNqOQmhtK/JmLjA6o+1rGnpsyTIRcd5F7slBe51Zcwa
 JAzor2JnLo0MOiTl4TnIxGo6b+vMO+G7q1byzcnoiLzchKLgn1sIm80OC8Yjjdyb++5t
 eDl+NRvCiaNGZXRci51XmH3xDhTPRaxgp4X/5a7XxCCTHuUbPu1CH8XPKeQxMXsdkclD
 lYA17UBG/qt7yMlVk5dtWs/xOue/zSOVfSPopedMSuxiCmv4dc+AeGfxtzB3EE54o+/7
 diGhUXHitBZOaQfandhiOp6GKpdrC7FHwIqmn3law4fM4w2azrK+aLXp1g69biQwsBzP
 Qo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631085; x=1741235885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8Qfog7C+RF4zPzBr1L919bNbTJtyOk3Zvza1VKHBAM=;
 b=CaZcE2MsjajQne6eC4BBjszIZCAQiQP/PpiPj/Ow5Gq3vEh/WpNK6d9QdcoVOhAOwz
 xvRWIkOJ4N0rrHIJ6dW3t3CsLvJvS115ZlCDzy3JICuz2VTA34+XUjSf6CA+z+nbndgh
 mX1PVY843bOSFRTt5RBixNzXW1BS3TizTxrZ7OVObUZcgdOj4DtbwZNcEB3A5pNBkoPu
 eNAneHcpyD8TbRzbbtNSCjuUK6eTWEHdxNQbyheXzAtLAn5iUY30B92ykhdO/SJwWMbj
 z0LofQ63/Z5CYrIejVRGIW56+Y80J0UvFdWrzQTJ6Fu8LfbnSzb7j9nq7KkphTYa+/7T
 LLmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVF3UuVDGniRNnJQTbgC87E0v3QBAXce79eRIcWRg/KFUKa5gqctAZpza+HHdXv85Wr8kraHjhb00=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj53ISJReSNjlLMgiKhLOLv9LkKddGn1vZYhtN4OmP9gtHzLJV
 sHL7Ql/4xHYnfGn5bfSlxl/xDsv4hcveW3e5+pU3SOCxHLtiucjnnnOXaLBrNps=
X-Gm-Gg: ASbGncs6+JKmFaGWXc5e1+Fp7AlUxaJ7xf5MH7qSXOGTB7Sj3FFhMutdOtP9MSvvPvC
 CUpWo4ZQtYIz5Slt0nXCpyJtJw2dVu3J/oyNbR6sJsHDeZ44b/Bz83QTv6P6H7ZusIbtWP3JhmK
 e/6d0h+bkWpdmH2mgI7Bb/TXi/NBK4m3ba+jTfV6sb77/6f+9XalWjuc2oQTJEyd+dDuz/AXa0L
 ADc5czVRue9oV3MPlL65Rkk0Ya0QoEJjFl0YXYIm8rpmjFChsrNA4nlPSTzeQA82V/NG3LMeRXc
 r61FoRowGDxOEgM3c84Rw5KCubfZmZyyfaqdnfNilw==
X-Google-Smtp-Source: AGHT+IH6ScpF7u8mldxrlNnCmDDwIVQKTOZg6njtMYsTmsyEuGMk70Dk1+pUhOrMej8BfEuwJN/Jqw==
X-Received: by 2002:a05:6512:3ca5:b0:545:f90:2753 with SMTP id
 2adb3069b0e04-54839147f34mr10569238e87.30.1740631084978; 
 Wed, 26 Feb 2025 20:38:04 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:38:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/4] dt-bindings: display: qcom,
 sm8[56]50-mdss: properly document the interconnect paths
Date: Thu, 27 Feb 2025 06:37:33 +0200
Message-Id: <174063096232.3733075.9096699710834268349.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
References: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Thu, 13 Feb 2025 17:27:55 +0100, Neil Armstrong wrote:
> The mdp1-mem is not supported on the SM8550 & SM8650 SoCs, so properly document
> the mdp0-mem and cpu-cfg interconnect entries.
> 
> This fixes the following errors:
> display-subsystem@ae00000: interconnects: [[200, 3, 7, 32, 1, 7]] is too short
>         from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
> display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
>         from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: display: qcom,sm8550-mdss: explicitly document mdp0-mem and cpu-cfg interconnect paths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e05b233ae13b
[2/4] dt-bindings: display: qcom,sm8650-mdss: explicitly document mdp0-mem and cpu-cfg interconnect paths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/162c57b8e7a1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
