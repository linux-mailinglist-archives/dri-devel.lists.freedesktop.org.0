Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6307B907EF2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 00:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5086E10EBEA;
	Thu, 13 Jun 2024 22:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oZoWTtly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1973C10EBE0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 22:36:26 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2e724bc466fso17750351fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 15:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718318184; x=1718922984; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9UIwtLBs13vfBF3EvZYQsM2dOhlesEX9MFYzkb8adGI=;
 b=oZoWTtly2oVQfQ9r6YxY35aojllkXPnjXZNUNwzeX2cNsgxqueSgzJmMZ3wz1Y7JUS
 TKwD87vgaymw0a5MEheig7p0koOKiWaylOzRH6vYXacThBdHT/wq9bvXtmnX+RPwP8I+
 yvj0J+2OTTTTacf0/39CwlyP7Poa1v2kTjFgBNZeUnsFlVW2fHO1k1Rnp/c4E5QOD4Pd
 4NSi/q7yoRJae57fMQBPSTVyATTHvbMsAo8tl/5rbLO50rA3xsbH7m1o+BtqisaGPyU1
 pX3hAMpU33ZG5Vs0snuCzgrDFzX7YYlq6NGNZV7/mgt5OgVsdZhpjDb9pSIKPAl6GUvL
 CWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718318184; x=1718922984;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9UIwtLBs13vfBF3EvZYQsM2dOhlesEX9MFYzkb8adGI=;
 b=jaPTn8H3x4jNL2qYatqZM9E0oxNl4PhjwLllbHqaSsxrmzI2J6wzoXmuy5JaIOVz29
 2jUHzodPUvc/rozZ30ED7rid+lLl7MKn1bcSEW1hPA2+/75DirZsy3kQKw6u+//dvg7q
 UBuVeVee2BwPPne4q+/czIyCo0qH8vZeftmRQLlLruoO7fikQJR9ingBKuShrgNDBrL6
 E7ez/7gevNYuBd+06yjYV64Z8nmp8RNonmiVMdShIr1q7HGs9rTngJWnkur4/ZXL2cDQ
 8vYOgguy72X+Dw0HPDR/mMvhu+H0ZB1FyP6wp+Al/Pl4peAxsAYsayPBNQeGqtjLwDgP
 2dWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk/vZUzPuG+jDQ2i3U/Jf0YVwaz0dySbgbEy8dDmV+aTLh0j8hdkWmAE7gcPTNZsDN+v3qv5h+4cCPeeNLnNcURZjOJP9oHoAG1imHAGNN
X-Gm-Message-State: AOJu0YzT77Kk40b8OEj83R1CTpq3V8iTe4SDmyT2GIzddBEi/Z0xbCeO
 iFQiLUGZwLZOk086El0kgaN2wtDo7Y/nef5jmPhl1BX0yGSD6xiZAOkUvHYHp1A=
X-Google-Smtp-Source: AGHT+IGbEE3Un1z7f0FGQa3HX31yMrNdSY9J9K8qSEK+iPNDl2FkjBxgCuNEMC/b1GBxBKK2Yq+CNQ==
X-Received: by 2002:a2e:9bc8:0:b0:2eb:d673:bf86 with SMTP id
 38308e7fff4ca-2ec0e5d1834mr7855851fa.25.1718318183880; 
 Thu, 13 Jun 2024 15:36:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c04a08sm3865191fa.29.2024.06.13.15.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 15:36:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/9] drm/msm/dpu: be more friendly to X.org
Date: Fri, 14 Jun 2024 01:36:01 +0300
Message-Id: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFF0a2YC/3XNTQ6CMBCG4auQrh3TH1vQlfcwLgptYRKlpMWqI
 dzdQmKMC5bvl8wzE4k2oI3kVEwk2IQRfZ9D7ArSdLpvLaDJTTjlBypYBWZ4wN0bC43vHbbwRDN
 2oLgyoim1kVyTfDsE6/C1updr7g7j6MN7fZPYsn7F44aYGFAw1FlVu4rVjp1v2Ovg9z60ZCET/
 zGKii2GZ4Yp7SSnspRa/THzPH8AaQKlWAIBAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2446;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pZ7oPyGWmHw6VCc6/ttt0AWUU5hsQuBfozUKcZ4IBFY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma3RlUNVR1sM459N6ky8gwjmZz7CGIh1kqkdYd
 uYvedHtUMKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmt0ZQAKCRCLPIo+Aiko
 1WspB/9G/JRw0RyUWD0jXdHNlUrSkbWeg5nxsvnZ9tQPDlxWV80K0DtwJBS2EO9E4CqEJ8bGbDY
 UjLg17MoCmJzl09gd0VetrRJbAECAcLIqtEbkXy9i033RtMj5nUq8nhwVt+WXyo8bM4LwqT5p8K
 wS+fjO9m8tgTA/dMIvpxZKhlf5+50A4LkcOtWyCOrKEKGV20qAE7wVrXPmiQVqRomJ9laNLvPZU
 RHIyOBWI9oR/GSS1k2sCnAfChjawMcjM/pq1zr9zK1jLEl2oJ9+NUaqpQO6H3wgvzvBSgcdeZH5
 rGVbf+Qm1N0nhMrWl7bOqIDTD7xzjdT7JFrQH9ZkGleIK3P4
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

Unlike other compositors X.org allocates a single framebuffer covering
the whole screen space. This is not an issue with the single screens,
but with the multi-monitor setup 5120x4096 becomes a limiting factor.
Check the hardware-bound limitations and lift the FB max size to
16383x16383.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Reoder the functions to pull up a fix to the start of the patchset
  (Abhinav)
- Rename the _dpu_crtc_setup_lm_bounds() to
  _dpu_crtc_check_and_setup_lm_bounds() (Abhinav)
- Make dpu_crtc_mode_valid() static.
- Link to v2: https://lore.kernel.org/r/20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org

Changes in v2:
- Added dpu_crtc_valid() to verify that 2*lm_width limit is enforced
  (Abhinav)
- Link to v1: https://lore.kernel.org/r/20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org

---
Dmitry Baryshkov (9):
      drm/msm/dpu: check for overflow in _dpu_crtc_setup_lm_bounds()
      drm/msm/dpu: drop dpu_format_check_modified_format
      drm/msm/dpu: drop dpu_format_populate_layout from dpu_plane_sspp_atomic_update
      drm/msm/dpu: split dpu_format_populate_layout
      drm/msm/dpu: move dpu_format_populate_plane_sizes to atomic_check
      drm/msm/dpu: check for the plane pitch overflow
      drm/msm/dpu: drop _dpu_crtc_check_and_setup_lm_bounds from atomic_begin
      drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with DPU_MAX_IMG_WIDTH/HEIGHT
      drm/msm/dpu: sync mode_config limits to the FB limits in dpu_plane.c

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 32 ++++++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 91 ++++++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        | 24 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 10 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 37 +++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |  3 +
 drivers/gpu/drm/msm/msm_kms.h                      |  6 --
 10 files changed, 91 insertions(+), 126 deletions(-)
---
base-commit: 03d44168cbd7fc57d5de56a3730427db758fc7f6
change-id: 20240318-dpu-mode-config-width-626d3c7ad52a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

