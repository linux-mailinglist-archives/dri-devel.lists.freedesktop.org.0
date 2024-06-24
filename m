Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD19791588B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 23:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C325B10E4E1;
	Mon, 24 Jun 2024 21:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jwyuao9K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BAF10E0C3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 21:13:48 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52ce0140416so2399750e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719263626; x=1719868426; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=urZQV+y3QNxwreYOcv1wFUORMtdQQg7g7j8r664owVY=;
 b=jwyuao9KlSumpy2BjWRSB+/0rtBhmQzw8wa5ombie6NdVRHZeGQM4LTcN1VJkLOPH1
 7rFovuFnh2KwMSYyNSNSXZ2mXQz20D3oZg3zgKdSrldupHC0Cdhdo8/RTzTKF+w9vfUJ
 B1VRV5/XJ5wphsj8EsWJSZHvhvYycs/7L/LA3afHQP+h66IUiqoDO8AlXAHIPosTOOZ0
 M2lcyxPliwjoFrWtHS70MQkvDAVGnpl5C8ZJlTYxqiD4pIIiFKp+yCwh9CA5qbP5L1bz
 dnHPZ3u9sl+UbxtXAZfWnf3iFVWnYt6/gyyoyhRiM60Owgj13g+v21+0p/yMgVGNka7A
 qnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719263626; x=1719868426;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=urZQV+y3QNxwreYOcv1wFUORMtdQQg7g7j8r664owVY=;
 b=fRaovhcIUh5OWh22p4Olz5hTMtvLRDEXpfUStmi08HjEmlPCOSm7wBoU7lII75NbgN
 YAZnphnR17oPqxyxfPx7DQMseHSAKoWI75T/tb3CtEmrixzvlV3RALMjylFFGQpbAGgl
 xkca7nEvk1l3b04KF/f0ndUV1uZDwW+IEnBU5q1pDmz4hQWEUdCPV+exMQVlSibeM8R5
 in9jsInVb6FU7+Rw2Tqq9frxCxoxo7V3LGJprflh03c9nSItJ0UgCjPJMuVFhueBHGLW
 HdwnF8XXAowZ12Z+1CiOq25mmZNAopt4PonHPHpJ1Ey+LKnDIysoS8uI3Iq8aAPZlkti
 8YSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPRgQ+ifKBhDWNcEjl3XQq9QS0bii62fgQecZ+SuYkMIUUQ9jZzyCY8r0jbLGW+akQO+NkEK3YrEWBoUmRyqnNIBypLv9fXqyNMNK6p1uT
X-Gm-Message-State: AOJu0YzYR6+ffWKih6dxU+ozuibDPejAdJJ61nzDlK6oO0hBKk4kQnI2
 tTG3ve2zp8h+K8EyuTWlEWQJsjxmqPE55gD35eWWdcWbIMHE0M95K+A+1HaZcEw=
X-Google-Smtp-Source: AGHT+IHEDQNwz07UQQxJde+XyM3nCFYemupYzmdTTNO3MLuVFsO+9LInnRA1VbjWSUeWS6C4YYunpQ==
X-Received: by 2002:a05:6512:3e1c:b0:52c:e084:bb1e with SMTP id
 2adb3069b0e04-52ce084bc12mr5970691e87.13.1719263626404; 
 Mon, 24 Jun 2024 14:13:46 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 14:13:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 00/16] drm/msm/dpu: be more friendly to X.org
Date: Tue, 25 Jun 2024 00:13:40 +0300
Message-Id: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAITheWYC/3XOTQrCMBAF4KtI1kaSSRMbV95DXKT5aQe0kVSrU
 np304KoSJdvmPfNDKTzCX1HdquBJN9jh7HNQa5XxDamrT1FlzMBBgUTvKTucqPn6Dy1sQ1Y0zu
 6a0MVKCfs1jgJhuTuJfmAj9k9HHNusLvG9JzP9HyavkW9IPacMupY8KoKJa8C35+wNSluYqrJR
 PbwYRQTSwxkhisTJDC5lUb9MeKL4cUSIzID2tu8pK3W1R9TfDGwyBTTN0yUlgtnhJE/zDiOLw1
 YQB6QAQAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3580;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=UZZ7KSs7CWwTZIZFzb5yNp2b/so4xjaqpHcSLMMe4Mk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGGwgmYMknmUybrPk3kTGNITMSptLTS/oH3R
 y6LQ76WZESJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhhgAKCRCLPIo+Aiko
 1anUB/47qdUTX+IoDyXInMRwcX5RkVGqrniKcYZra1SYJUayxAtb6CkwnO6JTo2PKi91i0Cd8Kh
 iwWOoV3EwIcNvrYm1ahhB1Ss9NJy6R+PqlwFoRf3Stuj8sw31Iwm7jvzzQLkr1hz9DHaCDUv9ES
 3a5+W2uSeiwbn2xoUstoDB2x5PuVn9v+VdDgEZVvGwSm1GGakDLTY17R1LFtTKYAGq4o2XahHPx
 NXjDuHQfXhWYt4D0JpQYq/BkhzJ7X/KrM0wlWsmmvMr2KrUlLUz8N02jShK/Z8NSlcFO/2HOGJZ
 YABLYnQeNnFtUlmSMAaQRJ/UXa+N8t6d0DYwNmtZEivYc50V
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
Changes in v5:
- Fix crash in the writeback code.
- Link to v4: https://lore.kernel.org/r/20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org

Changes in v4:
- Fix handling of the not visible planes with the FB being set, as
  detected via the kms_cursor_edge_walk test.
- Link to v3: https://lore.kernel.org/r/20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org

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
Dmitry Baryshkov (16):
      drm/msm/dpu: cleanup FB if dpu_format_populate_layout fails
      drm/msm/dpu: fix error condition in dpu_encoder_virt_atomic_mode_set
      drm/msm/dpu: move CRTC resource assignment to dpu_encoder_virt_atomic_mode_set
      drm/msm/dpu: check for overflow in _dpu_crtc_setup_lm_bounds()
      drm/msm/dpu: drop dpu_format_check_modified_format
      drm/msm/dpu: drop dpu_format_populate_layout from dpu_plane_sspp_atomic_update
      drm/msm/dpu: drop extra aspace checks in dpu_formats
      drm/msm/dpu: drop msm_format from struct dpu_hw_fmt_layout
      drm/msm/dpu: pass drm_framebuffer to _dpu_format_get_plane_sizes()
      drm/msm/dpu: move pitch check to _dpu_format_get_plane_sizes_linear()
      drm/msm/dpu: split dpu_format_populate_layout
      drm/msm/dpu: make dpu_format_populate_addrs return void
      drm/msm/dpu: move layout setup population out of dpu_plane_prepare_fb()
      drm/msm/dpu: check for the plane pitch overflow
      drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with DPU_MAX_IMG_WIDTH/HEIGHT
      drm/msm/dpu: sync mode_config limits to the FB limits in dpu_plane.c

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  35 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  62 ++++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  37 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 243 +++++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |  30 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  47 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |   3 +
 drivers/gpu/drm/msm/msm_kms.h                      |   6 -
 14 files changed, 200 insertions(+), 288 deletions(-)
---
base-commit: 5c522ecead93987bcb0459f0160d8625e46d78d2
change-id: 20240318-dpu-mode-config-width-626d3c7ad52a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

