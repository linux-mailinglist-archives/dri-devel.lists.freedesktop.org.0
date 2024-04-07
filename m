Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E8C89B4BB
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 01:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F024D10FDF0;
	Sun,  7 Apr 2024 23:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nStgY60Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8392310FDEE
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Apr 2024 23:53:54 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-516d2600569so3785095e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Apr 2024 16:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712534032; x=1713138832; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yMcxsAENHF5JWPN2nEOEzKEp66J7aXCfL6fneB4AUf4=;
 b=nStgY60Q4ze+fRqCn/c+FHVKPV0kLm9p2U2H1MYntKC8HzbHJbCtFyAm48ArC27XBm
 WkI26Kt4/VsP7vmmmITkQfGX1zd0RD8fsFhs+7WYUfNA5+cqxDFskoEPyPtOY0PYOXpf
 9ApRgRKi9lmv+WDVpwnVZjSz1XVTJekWKNNYukL9qbqtiZjf3H2Am4OsYy/VktCthWmZ
 q+4QjsiSibBLm4X4ORIlEw9hW2spy+3MyQ4P4dBJAJqSLePZs5jilZGdcEfLJPggWsK7
 fQel1Ga39vYbs7wGG2CU/GtvD4yuwkvI8fLpACdvkBRhkp4GyNwRgvAAGr+6XX4apeXA
 hJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712534032; x=1713138832;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yMcxsAENHF5JWPN2nEOEzKEp66J7aXCfL6fneB4AUf4=;
 b=wG5WADyVgRftPYauIoek3QJkr2HxBYv6euR7VN/NLJgZ9v7E65YRPelbh9qBWdNK48
 MLCnlXxaz9ws11tj0XQWsrTCyfegIHtvfn2BdLKT7x7BAJJz5jitoDDLoJ/+l1ry1IHI
 wbFa+qord3N4h+jX2uGkmcKD+DLVm7MgspK/pJt2HrdH0TDWHqGDogZq2LmkxJaBcvLa
 Kvmg3k5ELLoSEX7Bp2PenEGYBDSK7mJnaSdSKlj6G2PAoi7f8y6ZlWBVYQVny5m4lI0b
 dAG8/lCtYA8oxgoulR85E4yNdfwb47dMMm8c1IdPLtnzZogGNahgIaScZN+q0uaaO6gq
 FODA==
X-Gm-Message-State: AOJu0Yyan5QR2O8KWdYJc551XE2L+1A3Q3bfG4iGF/2vCiJo0HVkXr17
 5HCgEWIhLUOopzFdLmQ9qITIFSFo3czn8gEMKrHXlzLy6s/XBu3lt6MTqPxrpCQ=
X-Google-Smtp-Source: AGHT+IG8Cvzb47G39YnyMESEQFbAqyke8GNxFSe1lOa01YChD0+et85pPgvFJad6kghoFHZRAIHgNQ==
X-Received: by 2002:a19:9155:0:b0:513:ba98:36a with SMTP id
 y21-20020a199155000000b00513ba98036amr5237441lfj.10.1712534032021; 
 Sun, 07 Apr 2024 16:53:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 t27-20020ac2549b000000b00516b07fdc26sm965696lfk.109.2024.04.07.16.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 16:53:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 0/4] drm/panel: add support for LG SW43408 panel
Date: Mon, 08 Apr 2024 02:53:49 +0300
Message-Id: <20240408-lg-sw43408-panel-v5-0-4e092da22991@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA0yE2YC/4XNQQrCMBCF4atI1kYymRkbXXkPcZG2SQ2UVhKpS
 undTd2oKLr8H8w3o0guBpfEdjGK6IaQQt/l4OVCVEfbNU6GOrfQSpNCVLJtZLoQkjLyZDvXypJ
 ZewKoGJ3IZ6fofLg+yP0h9zGkcx9vjw8DzOsPbACppGc2ylcbr2u7a0NnY7/qYyNmbdD/BJ0Fv
 UHLpoCiRPMh4FMgpb8ImAUg8lBYAMvrD4FeBfwiUBYsmnXNNZaqehemaboDf3BNJ3cBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2771;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=t8MZMgY9WeARuExR2gP9qPibci5DwBYxO4q76j3A8PI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmEzIOYhLmADeE1oMW+fuimUAYr6cUUclraV6es
 Wu3wQMznJ2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhMyDgAKCRCLPIo+Aiko
 1cQoCACMrDFIOYvkEv/r09SDxlsU2yZMhfKkA7hCJwc0eqKkWPYlHxfNEhXmp4yvJg5MvZ5tEsD
 0x73gudQfFfiXQojJXapalASKBWU0p1Ukw3G0n+M8JG9hDlEF2eALighs/pKoYzKuBSTBk5duSB
 20v2rk3/2QKdoKS6Vy1lQRlQr0Y2DtuRtOpkecsNVqffmG7jgVgLz9wH4J4qSaykks1DOKUqgDS
 EAnn1/1xEUAkUzgGQs77lbwo6Dla4Yd+UQeAU5cES6MMrwkNZzT7uYHA2ClUHTzml0R/z/nb2V7
 OltGgTznYpE+bNSI2eLrqbVGqqmNGyPfeKGp1dPxUpZzderH
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
Changes in v5:
- Mention 60 Hz in the commit message (Marijn)
- Fix the comment regarding the panel being DSC-only (Marijn)
- Link to v4: https://lore.kernel.org/r/20240403-lg-sw43408-panel-v4-0-a386d5d3b0c6@linaro.org

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

