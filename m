Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D968947F7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 01:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0893810F65D;
	Mon,  1 Apr 2024 23:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BXvrHNM6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECF910F65D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 23:51:16 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d68c6a4630so47856501fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Apr 2024 16:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712015474; x=1712620274; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1dcSVI3IWYNVdSPmBC0C2QNVAXSUlaGzN8zET/T3Huo=;
 b=BXvrHNM63EvbHJei+wHIZotwBp1Z49wA2dPdvV+sW0EX3yjxT23KzhrHk6GIjUhDD2
 jncvS7z1eSIfnPQLqwO/jvOpnrJZujMMvkcU3OdEquW7xw5clKsPOw4GGDMCiym2c1ru
 O1yheAgvj6YFyZ6zT3PUlWzQjG1glMRfg/6su9pzKpWp9AOut45sYXE2fhAxqVykGNhX
 uFfIf2p+BNT/DFPm1jbxYnLx+RorXeF5IigtQJyzlCQoa4fdAGYNOooF5ULz4vUAWz4R
 ppP3V9F5gMMynI/JQPUWe+vOXAa2QTHVQwgHD4m+/Wqqq0TO56qqtHqGJSNNDIOiZj+Q
 NTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712015474; x=1712620274;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1dcSVI3IWYNVdSPmBC0C2QNVAXSUlaGzN8zET/T3Huo=;
 b=NxtydMCqPfW/xrE49TYQZLAnuAzal8fQTS34vZasMtO1j0WWLJYPEk3Btbtjx/ATRt
 +rCkrM7j0/6/+M4vWadJBwjRzXYl9J9h99lJaEmKl6KB5/ZZPV6/rzznZqmYjXJw9I5l
 1imOiffrWWHK/L28t1ipJEvgbsdVEPXNdjy0bbhygwR/IW0narCX57LNURnCrXNcmQls
 Pvvq+y0OSm6Q5CnnHnwYjzELJD/oFiHhyw9cxDqGvb/kblB9ZYAsdEJFfwN/upOD3Sej
 Z5sMrEpDVMutUwp0HcDVJ6zSpgTHmFJY982VgSogb2HlYKNzDPsDOQMFpWWL8CxwTgOX
 ckJw==
X-Gm-Message-State: AOJu0YwHrrFYiTOToajcCH4tYNgt2BrLj8Mw3kCqPQ/fpQl4f+Osz+se
 EocXXSOnu4wKVoA0A+9ByS0eLAge84ASO/gL7xVy21NpEpPO4WW7xAJdY7JhoXg=
X-Google-Smtp-Source: AGHT+IFYSCeMxGqZ2MbE1waQe/9063olfwjZ1oTGYegt2N0rOdrSyiwLNPjYVdZg1fOsMFVZeGMzIA==
X-Received: by 2002:a19:8c04:0:b0:515:9aba:743a with SMTP id
 o4-20020a198c04000000b005159aba743amr7163184lfd.59.1712015474106; 
 Mon, 01 Apr 2024 16:51:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 g28-20020a0565123b9c00b00515d127a399sm1176135lfv.58.2024.04.01.16.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 16:51:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/4] drm/panel: add support for LG SW43408 panel
Date: Tue, 02 Apr 2024 02:51:11 +0300
Message-Id: <20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG9IC2YC/4XNTQ7CIBCG4as0sxbDb0pdeQ/jglJoJ2mgAYOap
 neXdudGl++XzDMrZJfQZbg0KyRXMGMMNcSpATuZMDqCQ23glEsqBCXzSPJTCkk1WUxwM+mV4l4
 yZpVwUM+W5Dy+DvJ2rz1hfsT0Pj4Utq8/sMIIJV4pTb3tPB/MdcZgUjzHNMKuFf5P4FXgnTBKt
 6zthf4Stm37AEKhG/vzAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2055;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AIE+v3isfbEbNJwblsGQEZ9BeAZNLAvQspWBKbN90cg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC0hw1zyg3pAwUtnjkm+5F8dYu9r5Jix16Jwgd
 d5XVDHdzF+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgtIcAAKCRCLPIo+Aiko
 1dG3CACR4Oyf2mAyMzZiyD5RWhCiID+SZ5tnwd5Zguqhu+bKP68AWpQ+ckh6dZmUs0A7DslNrAR
 Z3fYeMEIWHk1sWMxedMcymSYfnBb3VoXunNufkBA3HBylB7zGrSuZ7Gr68W/Z7HXftfu6PeacOx
 0ib8+dIrDFXHx7jvzGAIGLIjb7C5Y/qFe/7LsxEeIyNADMoD58iutryQyVrFnGIDLFJFg5nDuFu
 H1j7k9wxHmQnY91jultTOs/37Rx6gkPKOmZPOsSdKpUj7pQzzV1h3e6BSltztv7hEdUn47hMfUr
 3mOnDPjuIRNMF08qnVlteUfwH4NQgTG7uUBocJZvtjX6YbSr
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
 drivers/gpu/drm/drm_mipi_dsi.c                     |  37 ++-
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-lg-sw43408.c           | 326 +++++++++++++++++++++
 include/drm/drm_mipi_dsi.h                         |  15 +-
 7 files changed, 449 insertions(+), 11 deletions(-)
---
base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
change-id: 20240330-lg-sw43408-panel-b552f411c53e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

