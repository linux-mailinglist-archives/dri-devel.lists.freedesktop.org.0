Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8271B892921
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 04:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B69810E3C9;
	Sat, 30 Mar 2024 03:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ukAblNCy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6662810E39D
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 03:59:32 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-515b69e8f38so2616619e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 20:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711771170; x=1712375970; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V/KyYTez7Ham6RArqjYsAGdRx6I3CfaIBG2n577n7v0=;
 b=ukAblNCyTCNG+ORSqh6GSsJ45R14kJ1ZD19n3SNNSEutT4jrZ0XtxztBlqyxQ3xUL0
 prWi+YdZRjjA1h90ps1riIY9OWd/ghQZ7Qjt+Aj1zBJqnf2/7wTT2REWnFA28OKwTDHe
 iL7+TfBDq4jfzzJs6rAXCMWY2TQyTYDV90XMVDRPKzL6C2nqCoOI+T/KLlF+1t0vEGYU
 IcFNkLUB5goTC7U7LO8/vEDKQc9Um1veHQKQ8koaZ/ZIcBmOlMyIiohuvgmRH+SzhTfW
 oW4Xx0BaO1fUGxlVHIbl0jP6Dh5Sj8vcY2WWgA5f6OcXS2L7yI/ncK7GTlghXgwSjMPI
 ciGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711771170; x=1712375970;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V/KyYTez7Ham6RArqjYsAGdRx6I3CfaIBG2n577n7v0=;
 b=S+osooEK1JgoduKG8nk+zNCjJRsECJv0J3qiOUkeX15xmK6rbrUbNT5UYYyS2oGIjY
 XSlzd5IOgvsgw51+0uYZoyCFm8HYOFfoGBexLER+AeFNvzEHuIr8+k87RiibpqOO8KcX
 h/jllnth5HHxzwpyKIHcfpIrglDl8tUU9exxtB6ZrwU15YC7HT+nbqTnkkw5/4q/oK7p
 voyV8aJGIX6sL8k5GVruUPXtIlpKi1XK3vwDWJ8bnw2j+2FA3BSdR+1aA5KZSRDsrHhN
 OSEqxTKRBdEWl4NIXogamBTmPA3Rxm8ArUKsnw9W9twnlMFJUkOhe+5vrX769Vmy8Mm9
 Nmew==
X-Gm-Message-State: AOJu0Yy24Wqy3liFAobkMobO517HdcF02mMshZFxDuK3qr5YVYFKOnqz
 12jo8RHGGBqaune22gPfOeUd7Fuw+uRa+uFHnHQVNdf29oIIeJINb2oLCeyWfis=
X-Google-Smtp-Source: AGHT+IGQmXGXUknN+Wj2FG7n6iWPBgprhcqnpU4Z7Jb+uCSYuzieUgOOjoMlqaa84Q2JHfEIdl2+hw==
X-Received: by 2002:a05:6512:1307:b0:513:4f60:82c4 with SMTP id
 x7-20020a056512130700b005134f6082c4mr2915403lfu.3.1711771170376; 
 Fri, 29 Mar 2024 20:59:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 br2-20020a056512400200b00515d1393f3csm423957lfb.104.2024.03.29.20.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Mar 2024 20:59:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/3] drm/panel: add support for LG SW43408 panel
Date: Sat, 30 Mar 2024 05:59:27 +0200
Message-Id: <20240330-lg-sw43408-panel-v1-0-f5580fc9f2da@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB+OB2YC/x3MTQqAIBBA4avIrBvwF6KrRAurqQbERKEC6e5Jy
 2/xXoVCmanAICpkurjwGRtUJ2A5fNwJeW0GLbWVxkgMO5bbGit7TD5SwNk5vVmlFmcIWpYybfz
 8y3F63w9k14blYgAAAA==
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
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1250;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HVQQ/1Sqaeom6RrFBW54Crl9fEDAeeQFXdkKvNlg5mU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmB44hgrh2oy+/fGY8pSaDoMtDIh0OTOsGKIq/J
 gzwpsBOeeqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgeOIQAKCRCLPIo+Aiko
 1dxCB/4unCfNUOHubbbTywYo1qg6QGSV/hNj4aNbERch4zIqmSeAdnCJ+jhqqI8JVTf9p/K8eGy
 Imft1WGaRzBE4/Mz6X7eYHg0bAnxSKiTcJ/fWjgXUelBwcBhujJdnV/QwD1/31TJwKPTZ8ndtas
 xFvdOUxYLfRSiLCVBha6RHugPSV6jGnORHIa/75nDD0QeieoGUG1hNHNLI27t967xu+PabyHw1N
 dF0xhIyiw7lH3v+3kRnAOUfXusPAFWH6I7KiaUnVfUiI2FV1mAIBVQe3sIepOOqkLjfQUNqQIKz
 Q45lS/fx23lgfYel7BCBih5vpKbUipfx78y05cbBmelONARu
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
Dmitry Baryshkov (1):
      drm/mipi-dsi: add mipi_dsi_compression_mode_raw()

Sumit Semwal (2):
      dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
      drm: panel: Add LG sw43408 panel driver

 .../bindings/display/panel/lg,sw43408.yaml         |  37 +++
 MAINTAINERS                                        |   8 +
 drivers/gpu/drm/drm_mipi_dsi.c                     |  34 ++-
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-lg-sw43408.c           | 322 +++++++++++++++++++++
 include/drm/drm_mipi_dsi.h                         |   1 +
 7 files changed, 406 insertions(+), 8 deletions(-)
---
base-commit: 13ee4a7161b6fd938aef6688ff43b163f6d83e37
change-id: 20240330-lg-sw43408-panel-b552f411c53e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

