Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B026896321
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 05:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789B510F004;
	Wed,  3 Apr 2024 03:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t2e+MD32";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F8210F004
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 03:43:59 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-515ac73c516so471948e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 20:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712115837; x=1712720637; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XS0Lxu+/FVxjACw8JTLACxUWz4uzZ8rlXWaKKTuNDJE=;
 b=t2e+MD325915JOq4mkPvtbj6qXzuvvgsJ4ioGRmYYHEe38Pw/Tu8TfhclxAMmkyA9d
 lh9b7jP+EQzR4+NXzMp6D7hNL+7uuJlgPDXw20W8a7TEA4CMvf2HobFyMp4xP/wYd6Tn
 Fbb8HLvE/qzKWTQO8Mp9w4ufHX2kk7xVdTGD7Z/Us9hhJ1t4UoHpwx7F9gat+29M9pW/
 MuJN44dAkXMXK+XtYCFdCsdi/DUsybp5vHyGB7HW7Pm6jONfXQ5Qzwdo0rIZmIn1OjQ+
 LF2insKIwaf8qlPtKEraSu1YtdgonNPFqElMJ8VDbQNG8X+Fh7m+uBEgT9oDSoNyFFzP
 SfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712115837; x=1712720637;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XS0Lxu+/FVxjACw8JTLACxUWz4uzZ8rlXWaKKTuNDJE=;
 b=Q1jQIHSm5qKv/lVszJqxgqg5SsLo27isicrwuLnt2Kt+b+QjYR067eE1zmHh/3VCRB
 B5WvVz1DAp7kKOXGFxOggd/xTbVMwDsy8TdH01s4UQWrJpExA4jDj300xw+tA9GE1suQ
 iNzXjgQdl+EKz6a49k5NX5rv1OBHuLQMPuzmsDbUBeMIhtAWkMGQmKL8QivMyx/sr/u0
 9WuDoloVK4dHQLf62S+Z3Kdy21L+YbwgUz9r3zEEVGuM5sHRUC8kssiO/smC5DEKZlTx
 fdxXnCqlHngMmpMuFKG/xPKnX2Skh3IAthsORQQZKWqamOLA3fi0xWorW6XUqxScQcWP
 2WZA==
X-Gm-Message-State: AOJu0Yy4H0jmIpIYsOAIY+miFacmCprGojeWR8senjV/PYb51+yTfyaa
 fDeVKklBRuNAD3k4ICxEVkwIEA/3moeXZFdAkbw6KxsQFBAuBnfdYhfOWy8iI9hlQKK9jmklBQq
 s
X-Google-Smtp-Source: AGHT+IF9aIbDAcgO+2JkWLWVyE3Aa+9e7603ybY0IFrdKHtsB5NLBU4SZqZufrVWel33AjNRcwKlYw==
X-Received: by 2002:a05:6512:3d92:b0:515:c0cb:3ca2 with SMTP id
 k18-20020a0565123d9200b00515c0cb3ca2mr306804lfv.16.1712115837026; 
 Tue, 02 Apr 2024 20:43:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 br31-20020a056512401f00b00516a69b1dcbsm940985lfb.78.2024.04.02.20.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 20:43:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/4] drm/panel: add support for LG SW43408 panel
Date: Wed, 03 Apr 2024 06:43:54 +0300
Message-Id: <20240403-lg-sw43408-panel-v4-0-a386d5d3b0c6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHrQDGYC/4XNQQ7CIBCF4as0rMUwDFjqynsYF7SFlqShDRjUN
 L27tBtjNLr8XzLfzCSa4Ewkx2ImwSQX3ehziF1Bml77zlDX5iacccEQGR06Gm8CBVN00t4MtJa
 SWwHQSDQkn03BWHffyPMld+/idQyP7UOCdf2BJaCMWikVs01leatPg/M6jPsxdGTVEv8n8CzwC
 rVUJZQ1qg8BX4Jg/IuAWQAhLJQaQMvDm7AsyxMCbYOBNQEAAA==
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2546;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rSrTFe62I9QM/1EhNPjLmXRF/kaFAIciPwvaSniEBGQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmDNB7zhW4VN0Mt3Ykhe6mHxo5gmToVRRcty6L/
 96qwd8KEIOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgzQewAKCRCLPIo+Aiko
 1dVYCAClZrnyDMoReMxsjxTCAr/g/ubBgEsq1nJgZqpasnETIH5l5OYfw0UyhSXvud3I3ZcTSJh
 DbErxRU911vMObQNS6sOz+RFRKMlHsRlrqRC7N4qgsz1I66c9qYWy3Ptqzl0iuZtbw1zoDmkPG7
 cKivUpmPkgC/VEpCnwZ7/3kJB7zPSV85vrpdlksU/uoXvf2V43wpW2RSq9rDZA0v30hHzZpnRsU
 eYTJJk7ZNoHPyJIjXeJJIp+mKGhsWwSdT1s7M9HI8m+u8uqVRkN3v2ABOB3MIkqyeOXi1VlbKN7
 V+qSIsXcZSIzug52vGfCWnQR+VeXJLLKz+n0zQo67XWCrRcx
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

The LG SW43408 panel is used on Google Pixel3 devices. For a long time
we could not submit the driver, as the panel was not coming up from the
reset. The panel seems to be picky about some of the delays during init
and it also uses non-standard payload for MIPI_DSI_COMPRESSION_MODE.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Fix order of mipi_dsi_compression_mode_ext() args (Marijn)
- Expanded kerneldoc coments for this function (Marijn)
- And added arguments validation (Marijn)
- In the panel driver send the COMPRESSION_MODE in LPM mode like it was
  done originally
- Expanded the .clock maths to show the reason behind the value (Marijn)
- Moved the mode out of the match data (Marijn)
- Link to v3: https://lore.kernel.org/r/20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org

Changes in v3:
- Fixed return type of MIPI DSC functions
- Replaced mipi_dsi_compression_mode_raw() with
  mipi_dsi_compression_mode_ext() (Marijn)
- Link to v2: https://lore.kernel.org/r/20240330-lg-sw43408-panel-v2-0-293a58717b38@linaro.org

Changes in v2:
- Removed formatting char from schema (Krzysztof)
- Moved additionalProperties after required (Krzysztof)
- Added example to the schema (Krzysztof)
- Removed obsolete comment in the commit message (Marijn)
- Moved DSC params to the panel struct (Marijn)
- Changed dsc_en to be an array (Marijn)
- Added comment regiarding slice_width and slice_count (Marijn)
- Link to v1: https://lore.kernel.org/r/20240330-lg-sw43408-panel-v1-0-f5580fc9f2da@linaro.org

---
Dmitry Baryshkov (2):
      drm/mipi-dsi: use correct return type for the DSC functions
      drm/mipi-dsi: add mipi_dsi_compression_mode_ext()

Sumit Semwal (2):
      dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
      drm: panel: Add LG sw43408 panel driver

 .../bindings/display/panel/lg,sw43408.yaml         |  62 ++++
 MAINTAINERS                                        |   8 +
 drivers/gpu/drm/drm_mipi_dsi.c                     |  45 ++-
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-lg-sw43408.c           | 323 +++++++++++++++++++++
 include/drm/drm_mipi_dsi.h                         |  15 +-
 7 files changed, 453 insertions(+), 12 deletions(-)
---
base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
change-id: 20240330-lg-sw43408-panel-b552f411c53e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

