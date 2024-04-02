Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDCC8949B6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 04:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB0610EA5D;
	Tue,  2 Apr 2024 02:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KO4F7hry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8E289B33
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 02:57:19 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2d82713f473so8252691fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Apr 2024 19:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712026637; x=1712631437; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CcOWlQgGqIBcz4uNt6+yhh3mpC8OO9XobRr1R/KttXE=;
 b=KO4F7hryA793s2aIQkg/rPUNI3FLZt4D0T4jHgHnTFEgC8q81V9or0VoDrviGZI4+Q
 z+CDrBl2RzfJcQC3xstraZ/G214Kr2r4Icy3Ws3rU+2qinUfU+VxoI9P2vpfwQpzWmLJ
 X0L5R07XNnBUEj29ltj8ulyCfSVmNqN8Wgdcjdd99xqvmWOASEqz0UKnncoV9diw7R9u
 yD8urJSr4+N8NvRvaviv6snKh15vt3HRWXHfdTG5OtkzYuaa2TIir2/G0XVsID8H2/ZM
 S1GhZYr+LoFJwOGsuaZnDMZRk2QPvZS/NcQfYUYSuGsQ82o7scgTexLPFY9fLWQ+yPz4
 4GNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712026637; x=1712631437;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CcOWlQgGqIBcz4uNt6+yhh3mpC8OO9XobRr1R/KttXE=;
 b=KHgJotBckfZonYHXV+h1hb2iKxENrLdKp/FM9SeO573CFhOvUHCUV/gApNyvR7U+kN
 v3CQ+7MOkviROPGYfGOz/wrWd9m0nWQpOT2gp1Ms1cVK/vC9PV3Bwg1oz9zuf7vqYl4d
 mWvnPsK6RdrgyuYUVMJfzgAARngi1+75DIIXJJ3DMrYsJKsvS+9SUlyar0liBYCXk9xY
 EzazIo/Knbasz7NoLzgJs5yt4/fzJzCaUlBQKQH9QbNY8b59yLvzQDbFEZ1xmukq+oPe
 Vx0s6WDQKpy5spu/1qYzzbe/NqRUsinKmLQ1TUbf71xqPHRjgQR73pyt8b5oI2Vi0TpL
 jfNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOA0DmxetateOScBVf6LnyT1Hl7vv9jlcSGSON29A4pjEjMSGOJLhi8RtJM2aRab35ljPFc4apl39gJacwkAerbemBKv9E5ytNVuia93+U
X-Gm-Message-State: AOJu0YwPPrvvaUczhqTeGBQBrs7dFsPYLvA3dgrG8Krl1m6PvKU+Rzqu
 RQresFwL3+ynUc5i5zqdoCAxYO3hngCOnsH8MQ49v41FClW+iEF9rwc9qKIAao0=
X-Google-Smtp-Source: AGHT+IFzre67aWg/rp35jenHFonGTGNHJMZBGMJI+1ExqAewWmJtZ2jIlumaCs6UlCm76CrVFChZOw==
X-Received: by 2002:a2e:740d:0:b0:2d6:cd05:1899 with SMTP id
 p13-20020a2e740d000000b002d6cd051899mr226762ljc.17.1712026637244; 
 Mon, 01 Apr 2024 19:57:17 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 14-20020a2eb94e000000b002d48dcd10a9sm1562356ljs.86.2024.04.01.19.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 19:57:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/4] arm64: dts: fix several display-related schema warnings
Date: Tue, 02 Apr 2024 05:57:14 +0300
Message-Id: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAp0C2YC/3WMzQrCMBAGX0X27Ep+q/Hke4iHtEnaBW0kkaCUv
 rtpL6Ige5r9mJkg+0Q+w3EzQfKFMsWxgtxuoBvs2HskVxkEE4pJ0WBwGOiJuRv8zWJreDDKGs2
 lhurck6/r2jtfKg+UHzG91nzhy/dfqXBkqNReu2Y5KU9XGm2Ku5h6WFJFfHTFxK8uqi5NGwxjm
 rvDtz7P8xsq44Op6gAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1265;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mx7vGKdoct+1XCR+gKQrL0/i2J+RoirrlHsWudiB9P4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC3QLqQPJDTO3b9cbxOZVHZF2gHNoh+neyJLyo
 2tSe/nn3TGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgt0CwAKCRCLPIo+Aiko
 1dsAB/4o6NTZpu+9kDk11QO7Miwhq1iDIWhXF9K+tE3FxXcaA/68RV8j/0aNacrI+RDdHkt0ioS
 ryVluVfGN0ZIFz9se5tQkp5wEET2kIE0W8LBnfIlbF+5XRirltVzTF52YDzjRSszJoijgSuAfeU
 PBu18se91/uFrBtclkP2pYYYWNudBL3rUfAACrgWWSmlo5+gLURe3zyjer1u5meh31UrAQcImHV
 qsAPUXcNXYRk1PdZSED+PsEnbEGAyZ/S4j44XuPxZmSvcr2+5ihlzg7Ag1ukZYb7J8JK2nCLDBG
 ZDKt71aQgicgZIpd0QK9qux3f4+MTrfZBXCwFG3qVWP1PCES
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Fix several warnings produced by the display nodes.

Please excuse me for the spam for sending v3 soon after v2.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Added tags which I forgot in v2
- Added the Fixes tag to the dp_p1 fix
- Link to v2: https://lore.kernel.org/r/20240402-fd-fix-schema-v2-0-39bf90051d83@linaro.org

Changes in v2:
- Added Fixes tag to the DP change (Abhinav)
- Switched the schema patch to use contains (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20240326-fd-fix-schema-v1-0-4475d6d6d633@linaro.org

---
Dmitry Baryshkov (4):
      dt-bindings: display/msm: sm8150-mdss: add DP node
      arm64: dts: qcom: sc8180x: drop legacy property #stream-id-cells
      arm64: dts: qcom: sc8180x: Drop flags for mdss irqs
      arm64: dts: qcom: sc8180x: add dp_p1 register blocks to DP nodes

 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml   |  9 +++++++++
 arch/arm64/boot/dts/qcom/sc8180x.dtsi                       | 13 +++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)
---
base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
change-id: 20240326-fd-fix-schema-b91f94a95135

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

