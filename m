Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA1C93D1F1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 13:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6EF10E952;
	Fri, 26 Jul 2024 11:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TslsFKWu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA7110E952
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 11:18:40 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a7a8a4f21aeso202054466b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 04:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721992719; x=1722597519; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s1uKdlL0wSEZi8PR/aafT2ubUVc/pu4j0AuCIvADTbc=;
 b=TslsFKWuzvr+cjTl+YAK6Ssl7qDx4IwSAZP+KaJ2a51kRre9LgR7mBaC4b34q3QFZs
 8cSPZ9/KNiF4QaSDeU384hLwROTtHjN/B+MS1ysu01+8Rw+wU1xiUDRJmuxlHAd7lrds
 Z4HrXNw3nObVyy+ss//dlkeXnesCjU1A+dz6refVyvrjnmP7H3YB21J6hmZoJE2NT8Pi
 vuk2VnWvIEBTlRZ5CHy1/bigL4P1LjOgCdfsFmiObYv3sbuC6xkNI7mqg1ofEUQT3+yc
 ULAN4i0n4dHPJb99yGFSVbVWKHdOTmYDa0iTHkKtL/qpzjUkwDWaJNq6GUgFmgR+nbBy
 CDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721992719; x=1722597519;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s1uKdlL0wSEZi8PR/aafT2ubUVc/pu4j0AuCIvADTbc=;
 b=NfAJqhjHO0pV63RmJ2d4Ual4mTSPlhnvkFWPN/kywd1LWPObDBN9ALRPefH02UbFlc
 x2RTyJ5BFoYTbkW2P8E2uceKkGQM7SCgaPcLbZHs9KE2TDOYj1otvEHlAFeR3km9WXFR
 4E2n3v3CUMuzlTydEJnGsXGT9ZV9zbBapEnt10yN9KqYAP2UHr/QqRE1W2ChjrKUZVd9
 F+KawgNC6VJKkMreh5MJvU6OKN8wG6RU+W2RF0Vo6KMuJ43OciTYjkCiCnIdQyZenw4w
 6DpIH6I5tHIjfFMojs/gNaDQHwZ+/0Y1b+0V3beI+uVVeUFLmc8ECCqrAAdrChhvkoKf
 pRyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVysER/CeDaqiKiYA0bj/BDavYI5A+Icr8YV8rVIPyrqhhlHbg5ASdzkBesGb2CKV0NRtp2bF8+NpIYnG2+BpU1Wp+61ph9sfRe0LmoXyio
X-Gm-Message-State: AOJu0Yz5Ofrg+eGf6m75Rphcfg11C+ryOjmbm0RY51w5T1OQVbUV9RMf
 ltFaa6qJN1QJpVtgejeZyk7LHQFuvkz67dVAaNRx0gfaZIR8GVMy/8Ehp507ue4=
X-Google-Smtp-Source: AGHT+IGHu6xTju0RbmaTB0Dy2P+ddiDMN8D4wOU+C0PeZvuRz87E8qSyxApkJD6EGVWwoobzF5Xq6w==
X-Received: by 2002:a17:907:2d24:b0:a7a:9d1e:3b26 with SMTP id
 a640c23a62f3a-a7acb549275mr421259766b.37.1721992719060; 
 Fri, 26 Jul 2024 04:18:39 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab233aasm164703166b.8.2024.07.26.04.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 04:18:38 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
X-Google-Original-From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/3] Update Konrad Dybcio's email addresses
Date: Fri, 26 Jul 2024 13:18:22 +0200
Message-Id: <20240726-topic-konrad_email-v1-0-f94665da2919@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP6Fo2YC/x3MQQqAIBBA0avErBNMo6SrRITaVEOloRFBePek5
 Vv8/0LEQBihK14IeFMk7zKqsgC7arcgoykbBBc1b0XDLn+SZZt3QU8jHpp2priyjeTGGqkhh2f
 AmZ5/2g8pfQKYJ6pkAAAA
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721992717; l=2541;
 i=konradybcio@kernel.org; s=20230215; h=from:subject:message-id;
 bh=iPIs676Ucz0BFAPc0hUibqb4aH8rrVS00mYl6TySE0A=;
 b=y37EdpPnKb8Uuo1vP3UyO10uS4Yy5aBrR7It7aQ9tbVd9QdazQPQ5o2NGj8MGWFoSa4MRnPPc
 DnUX7Yunj3PCdZV2CImioEtUcYA9dZXN1FNJa0bSpthvfs1q3b+CGmz
X-Developer-Key: i=konradybcio@kernel.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

Patch 3 should probably go straight to Rob's dt-bindings tree

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
---
Konrad Dybcio (3):
      mailmap: Add an entry for Konrad Dybcio
      MAINTAINERS: Update Konrad Dybcio's email address
      dt-bindings: Batch-update Konrad Dybcio's email

 .mailmap                                                            | 2 ++
 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6350.yaml     | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml       | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml      | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm6125-gpucc.yaml      | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm6350-camcc.yaml      | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm6375-dispcc.yaml     | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm6375-gpucc.yaml      | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml    | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml      | 2 +-
 Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml | 2 +-
 .../devicetree/bindings/display/panel/asus,z00t-tm5p5-nt35596.yaml  | 2 +-
 .../devicetree/bindings/display/panel/sony,td4353-jdi.yaml          | 2 +-
 .../devicetree/bindings/interconnect/qcom,sc7280-rpmh.yaml          | 2 +-
 .../devicetree/bindings/interconnect/qcom,sc8280xp-rpmh.yaml        | 2 +-
 .../devicetree/bindings/interconnect/qcom,sm8450-rpmh.yaml          | 2 +-
 Documentation/devicetree/bindings/iommu/qcom,iommu.yaml             | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-tlmm.yaml    | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml     | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml     | 2 +-
 Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml     | 2 +-
 .../devicetree/bindings/soc/qcom/qcom,rpm-master-stats.yaml         | 2 +-
 MAINTAINERS                                                         | 6 +++---
 26 files changed, 29 insertions(+), 27 deletions(-)
---
base-commit: 2347b4c79f5e6cd3f4996e80c2d3c15f53006bf5
change-id: 20240726-topic-konrad_email-808c630bcb3a

Best regards,
-- 
Konrad Dybcio <konradybcio@kernel.org>

