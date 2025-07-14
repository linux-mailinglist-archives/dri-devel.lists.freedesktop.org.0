Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC63B052ED
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD4110E535;
	Tue, 15 Jul 2025 07:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bacon7nz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6BC10E221;
 Mon, 14 Jul 2025 17:36:26 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a6d77b43c9so4069867f8f.3; 
 Mon, 14 Jul 2025 10:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752514585; x=1753119385; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=87+Ndx4tU3Bc/RBm9y43dq54vArNIkAlt17RzyhLMK4=;
 b=Bacon7nzDkjDPXbM4L05FXSsiDFvFv6e/5jOng714XD8n9smus/H7toT9zmjiRefFd
 Xov45JtmH+liBKDygyVvDWhM2jNFr7iiwuV3g5LwfSg1zhemnknw0IMw5MuQXwnNL3QG
 mKLV4/OonBvyZ5n1CqXFjsCJHWHe5Ir9/HTnpCanvh3kPc8MUvtzrRNFGqzP1g6XMVFt
 tSybsPzB9GmDMbj9ITrpEcNTizHK3IOFmqulzDDggUKhFeKMMlXosJXqO+b6/aTVEGW+
 9VTUG8fI/p5rr9sP1QG4NBFfccefrW33MFKjT6sjdzF8P+Y7nLSLZF04puF00HUKTEhl
 gxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752514585; x=1753119385;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=87+Ndx4tU3Bc/RBm9y43dq54vArNIkAlt17RzyhLMK4=;
 b=YfeW9IXz6Rl0DtAxvK6MzqjkgGxai/En6FwtX7yU4gVe2avF76gA8g2hmErUJYcCQQ
 exVOhIo7X1+wNA4u/Dti6Df37QJQSRmehkO4czrVZeQodbuhMGKWPL6thTJmpguwMflK
 NeQVEDJ9yOSa4SLccYoiZqiZiEnAqNwW1bRZ0Y/g1kE9F3z78LmLym8goYPOpU9PNyEQ
 sgbu4CbofhB3Wh73cxabsgR97xyM6K2RwzdLJU0VfAkxzxGzR0hB/DtGAfTP4o9HlVy/
 HhB+jkvTtUETTztpltXPwoimPm2ZrkULY73VvPf3JZEimSUKg0qLCu3DS0PzVbPG28S5
 2/RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBeiY/Q+RWeknqVpZtpB3U/TsR5p4ZIA1bxCp1g/4WujoQoJSyaxj4wrIgbFMacEJvhKwCvmY+7sdm@lists.freedesktop.org,
 AJvYcCVCbQ9Tf+Oavo2ZaS87Wx8OmqqOsRQkrHmPp5UBoFS0b6mCmwl8Ig4bbW9Y3QCNLZPW61QVt7+0Oak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfZNhXLFowAQW9wp6q113d0zQ0MeXOa/sHjSYNk2XlMy2hS7Q2
 1Rb3iiPnFuWB1/Ae56kRMAO019MJpEhMm7MZh6rlsxiCnnXQ7WPwt31b
X-Gm-Gg: ASbGncuWlNCTsFJ+pe7+O759BquhncRSe0tK78FVMTfuUNSpwT09gMjcaqJ2cjDDgo6
 madhm+ofiA8Xo9wuoeTEk2m0tVt7/hFBvxVZm7WJQTW5D1wEIy/5rIPwnGIXRiYXTjG2A4mli9U
 ziEDnPO9UYVG0nHaXJ4/LjSZTfsxCsTqs0opSZwTaaCUp/XVI4cuNEndPdVYINAOPghAxgQL8EZ
 3F2cUOAIGEhFuzqiG6yR8onCEZFDCB4SPhKt0PDaam3BmEyYZs20GK3usjZORWlFxVi2G1zFF7N
 YE1KsyQwIJ4m8g0NBLYMACYNCl3txK/iwX96wfzizB5YZ5Kcym7W0QrTUZ4vg4y7HvWsq922P+U
 2G4XSGImDoovjoo/lhuBwBHHc4JMsTxIoYV+yCzcxcJPPgg==
X-Google-Smtp-Source: AGHT+IHwE5k8y6WgeeHHGTBoqTHW3b9d3pXfevxQkkUzEV8uufq6SNg+JFLfpZe/W1mCrWg4+Y19GA==
X-Received: by 2002:a5d:5f49:0:b0:3a3:6e85:a529 with SMTP id
 ffacd0b85a97d-3b5f18f80c5mr11655696f8f.51.1752514584561; 
 Mon, 14 Jul 2025 10:36:24 -0700 (PDT)
Received: from alarm (92.40.201.95.threembb.co.uk. [92.40.201.95])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d872sm13152531f8f.60.2025.07.14.10.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 10:36:24 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 freedreno@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jeff Johnson <jjohnson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 0/9] Microsoft Surface Pro 11 support
Date: Mon, 14 Jul 2025 18:35:36 +0100
Message-ID: <20250714173554.14223-1-daleyo@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Jul 2025 07:24:49 +0000
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

This series brings support for the X1E80100/X1P64100-based Microsoft
Surface Pro 11.

Patches 7 to 9 are included as RFC as we are unsure of how best to
achieve the required functionality, however the implementation is
functional.

Dale Whinham (6):
  dt-bindings: display: panel: samsung,atna30dw01: document ATNA30DW01
  firmware: qcom: scm: allow QSEECOM on Surface Pro 11
  platform/surface: aggregator_registry: Add Surface Pro 11
  arm64: dts: qcom: Add support for Surface Pro 11
  wifi: ath12k: Add support for disabling rfkill via devicetree
  arm64: dts: qcom: x1e80100-denali: Disable rfkill for wifi0

Jérôme de Bretagne (3):
  dt-bindings: arm: qcom: Document Microsoft Surface Pro 11
  drm/msm/dp: Work around bogus maximum link rate
  dt-bindings: wireless: ath12k: Add disable-rfkill property

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 .../display/panel/samsung,atna33xc20.yaml     |    2 +
 .../bindings/net/wireless/qcom,ath12k.yaml    |    3 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../dts/qcom/x1e80100-microsoft-denali.dts    | 1341 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 drivers/gpu/drm/msm/dp/dp_panel.c             |   13 +
 drivers/net/wireless/ath/ath12k/core.c        |    3 +
 .../surface/surface_aggregator_registry.c     |   18 +
 9 files changed, 1383 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali.dts

-- 
2.50.1

