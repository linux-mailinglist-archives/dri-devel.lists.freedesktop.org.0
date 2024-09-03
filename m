Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5AC9691CC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 05:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3FB10E242;
	Tue,  3 Sep 2024 03:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GuHm8ASu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB8C10E242
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 03:22:56 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2f50966c469so55016941fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 20:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725333775; x=1725938575; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k86P+NeDmsIICrQRJRBhlplxtE6L+zqQWOXWus04Fdk=;
 b=GuHm8ASuDcCSNGTwNxQWN8ZJ2lNMpw8Q3n4ZJ9ij2hZkR5nFXdoKkFdcXne7Kx5+ls
 q6/y+WjX5CCjm27Jsx+Az4jZAefzdY2qRHhVNBzpqSfD3ox34YuPc57yI1lvPso7GavB
 tqi6SPkO7IKa1HvgqDXLz4aqKW6SHGNQAPZON4MgC1VOGInsz1BybfYxz8sqc1h+ny39
 0z171f6ianQYje6MmRxrp6m52OMjYq8hL+3dlzNZd3Rafd8P3jiqUbIkBDhFR+xyrv/o
 QpoveKqJfx+LTNYOSj9WRKEtb0QgxBMiuaCkeQnD4/uzd4a0IMGj9kfXXjyLKCI1UdUW
 iZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725333775; x=1725938575;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k86P+NeDmsIICrQRJRBhlplxtE6L+zqQWOXWus04Fdk=;
 b=JCbp+jDHp5MhrItEeX5lXS9fW3pUBntsOOCyMrBaiyMk1bHFOTOlU2jBxILpHkToLl
 oOZ7aYfAnB4SqIoEKtd+6pkHcjjVsdLsMqZxvPwXXKSnkgS5G6MwMrWB/vUSboh6DMX3
 5eh7NDcEA2AIDFULaYMtLwspqPA0aSDXwJLwmbRBhKE/i87lP131V2Cc2VfoBgDpesp5
 M82WAuowDFRmcjFmjImIE+o0o1BGnPx0iObGWLwIL9TNj4Q2EnvTFYUaQ0w+EMFBXtBB
 ep7WZ322qmQ5zc7xOe1Wc2RTNgxWrBIN2aU9k0sbDURTeykVEzPdmwdTZMUYAVANRx24
 KHqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8s8oTXvPjcnbbAV1QtoI1hq30PCKU0IwaeL04jH58obUVl/oYR7OXtQh1sIDqBwQr27/0KazjRls=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwL330Aoc4g0Pj+ZHUTwJxAqFhVXnZIY55id3fc5IWUBNGqWNs/
 BZ866XQktSYvgw5Mbv1c1XwcJ7AF6d0VUEQeXhED+6CJVtTHZ3lFYvBlgLOHYA4=
X-Google-Smtp-Source: AGHT+IHup46cN3yQHFtBvP4UoyD6AAcxffm5fZhZ+b6e//DT+N4kqwIf/Nd53QViZRdsD52isOP+xg==
X-Received: by 2002:a05:651c:1545:b0:2f3:fd4a:eac6 with SMTP id
 38308e7fff4ca-2f629041d3dmr51981481fa.18.1725333773785; 
 Mon, 02 Sep 2024 20:22:53 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 20:22:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v6 00/15] drm/msm/dpu: be more friendly to X.org
Date: Tue, 03 Sep 2024 06:22:43 +0300
Message-Id: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAOB1mYC/3XOTU7EMAwF4KuMsiYof840rLgHYpHGSWsJmlE6F
 NCodycdCVFUZfksv8++sTkWijN7Ot1YiQvNlKca7MOJhdFPQ+SENTMllBFadhwvH/w9Y+QhT4k
 G/kl4HblVFnU4ewTlWe1eSkz0dXdfXmseab7m8n0/s8ht+iu6hrhILjiKFG2fOtkn+fxGky/5M
 ZeBbeSi/hgrdItRlZHWJ1ACzuDtgdE7RpoWoyujXAx1yQXn+gNjdoxqMmb7RuguSI1eezgwsGe
 gxUBlQEh0nUGrTfrHrOv6A5TtRzLXAQAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3939;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BWVEJP/ONJMOkJpUbz8o2AZX8ZM3XLIHEzcDCb2AhdY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oEH5JMLUNrrzbgK45w6apcf3EfatK6LZJ3+E
 wRkqZlhv4KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBBwAKCRCLPIo+Aiko
 1ZJvCACvXSgRM4G9ST5s8TaC31WE0fKnDcQ0H1u6rQ3/pxZUKfiW47dfvrTwZt95w12HY7xl+ON
 FL99dIjwvpPWzRTpQn+j+JyxNwl2fZvI22I0Vns1aE+vysbwV+e2etagCv/szbCYxEla65PgIBQ
 Iq5PdYToIoYR43LuQINahbZFRW9XxRJs+tqCcEaLf4nx0jaF0Fl5ZGiU9hJ0EIrUum3JYrnRs6B
 YQfhNXiHxY12T9wp/cFC4HFy5XhTrpveTfVOvJ3FHHUU7CySnQKlS99Y1xw6j8tNEdBxQuH/bk6
 78iP3jx6m+RYBdqGMhI67lz17s4U9Xk9f3huV+VKzCNEIUcy
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
Changes in v6:
- Fixed the commit subject of the resource assignment patch (Abhinav)
- Reworked resource assignment to dpu_encoder_phys in
  dpu_encoder_virt_atomic_mode_set (Abhinav)
- Fixed num_dspp check / hw_dspp assignment (Abhinav)
- Moved dpu_encoder_assign_crtc_resources under the needs_modeset()
  check (Abhinav)
- Link to v5: https://lore.kernel.org/r/20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org

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
Dmitry Baryshkov (15):
      drm/msm/dpu: make sure phys resources are properly initialized
      drm/msm/dpu: move CRTC resource assignment to dpu_encoder_virt_atomic_check
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

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  34 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  68 +++---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  37 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 243 +++++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |  30 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  50 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |   3 +
 drivers/gpu/drm/msm/msm_kms.h                      |   6 -
 14 files changed, 201 insertions(+), 295 deletions(-)
---
base-commit: ecc768a84f0b8e631986f9ade3118fa37852fef0
change-id: 20240318-dpu-mode-config-width-626d3c7ad52a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

