Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9330F9199E6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 23:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370F510E2C1;
	Wed, 26 Jun 2024 21:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RoYR5j/p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F9C10E2A7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 21:46:04 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ec595d0acbso52887411fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719438363; x=1720043163; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kSG3AAcIbmONfpePJ3GBLSDEosIWhd8mjxtqUsWpmL0=;
 b=RoYR5j/pxRbj34rkSGIVaFR6HXXtiuGHrypRLU44HFin7hp6JE5BUH5x8ggmN6HvWL
 G12gQJaOiFnnSGS+c8W5ZJYnRUcePK01+qHS0zmrmIqvUoqscltyBvA15Fi/VnMny6ls
 CVRvVPZ8VyssOmrEAWC9+G67TBTgoJZyr/niwd93EwEkIscwuR/s0P+Rkug//VlqEdpW
 kx5o5s70N3GLsKIUl+XbSBW12lpS4M6fV18eMhwoXMy9F58o6dzVR4wqhfCgIOuSUMT1
 5GcyNaTfQwFmQi/R1yaHQdpCp03jxH/WXRs9533qrFudAjkpy9jXfIhB1Q/npdlXaqJa
 DLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719438363; x=1720043163;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kSG3AAcIbmONfpePJ3GBLSDEosIWhd8mjxtqUsWpmL0=;
 b=EmPHOvDc8ZuhOGWiYFt8dVKO7gv/cVms3ZmbTxMjVtcS3AUsgoU0OLbwMdlCBaD+rc
 xBO9MXt/tn2dQRRE5NZ0I8G3j3jdlEjgavHjJ6W5KHMyD+g0dxufTj7zyjGySO/3/u2d
 n9NMf1dqur8Mp343RI2uFovdO0QVglv3oXMlEU6+m0dBBD1Pq9hIYii2omNNbzBrtW4T
 cVgv+a0aWj2XFTfzmDjx2U6jg1ryPk6vA+LbLFsUjWG1RkP+kZACXzGldIBQSRmnQ86o
 m/ye8GzFD22gU09+ABQRNVCFujaiBlezSffqCRK4oYHdjn/ohW211uPnMs2K4nPY2a+O
 tVsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSkMGisW5VKNe0cGyck3JrYeIMFs+s5FTrHbKENLRbe8xOS1fnUXLZMbYyOzyl1uySybMSigltA3L9VXDm9OaRXQOjJF/MkwhT8FEpF+/g
X-Gm-Message-State: AOJu0YzPd7i/7amL9expix512LWyxTXcqLH3WAMheADwfoxkgiCd27M9
 FbboOgZ8SiTUWXINCTS2PFtyRre/JZlDBUMZqDlU+U0FBj2Re/qmynBVlFre55E=
X-Google-Smtp-Source: AGHT+IGRVUcK2vgQ7z3lRceQ7EQseMWvpFfYSJ61KqlG+Np2uVeFvoj0JA7iyvcvwWsVy3+jCCiZUg==
X-Received: by 2002:a2e:7a0a:0:b0:2ec:63f:fe91 with SMTP id
 38308e7fff4ca-2ec5b357921mr84428191fa.38.1719438362757; 
 Wed, 26 Jun 2024 14:46:02 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 14:46:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 00/12] drm/msm/dpu: support virtual wide planes
Date: Thu, 27 Jun 2024 00:45:54 +0300
Message-Id: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABKMfGYC/0XMQQ6CMBBA0auQWTuklFKDK+9hXBQ7wESkZAooI
 dzdxo3Lt/h/h0jCFOGS7SC0cuQwJlSnDB69GztC9smglTbKaot+WnBlmRc34Js9YUPUNmdjXa0
 UpGwSavnzW97uya2EF869kPuPysIopXRh87LWlamxQP/iWba8cbLF/hnW68Cjk5AH6eA4vqYjv
 7CoAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4014;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qJ1GEziPu7S8OI1OCbOkdnos7rw3FO0P0DsB9fp+pKo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1pNjzhr8J0G/nL/aHemuNOvPF4tTNWfsmLrk9NsQjuYs
 zY8bDXsZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBExMLY//vXKSRd4u9x9Y/g
 ztK7at4qcz83pff7tDlXBJ9bVb8t2+LgkRZ4nvF1KVP09jsBkQeLjI6eabd1Sjp4TEi2YKPMxfp
 9Cw41FN+PK569L0f68OeCVNdnO9WetQgz/HVM3zJ5/Z3QvOknNCwT1nHE8vJPs7gf23li9ZwsfU
 OzWuWIUotJFu6r5fKbfzwWL1/6acmJ4/cNlbYv+mKdayTlMFFDwYnhokv13TqNhzrhCXOOp/F4d
 JVfzg+uYSq99/Ci1o19u31n31MIbppU2OQkKHjxAt+JqRbLml8WnNjccZQvLMQ91O9GzvE/DicP
 /F3a3choU/fiyf2II1Y+k6K/Ku2rvr20+NjUoH+R6ay2AA==
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

As promised in the basic wide planes support ([1]) here comes a series
supporting 2*max_linewidth for all the planes.

Note: Unlike v1 and v2 this series finally includes support for
additional planes - having more planes than the number of SSPP blocks.

Note: this iteration features handling of rotation and reflection of the
wide plane. However rot90 is still not tested: it is enabled on sc7280
and it only supports UBWC (tiled) framebuffers, it was quite low on my
priority list.

[1] https://patchwork.freedesktop.org/series/99909/

To: Rob Clark <robdclark@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org

Changes in v5:
- Dropped extra dpu_kms instance from dpu_plane_atomic_check() (Abhinav)
- Use DRM_PLANE_NO_SCALING instead of (1 << 16) (Abhinav)
- Dropped excess returns documentation for dpu_rm_reserve_sspp() (Sui
  Jingfeng, Abhinav)
- best_weght -> best_weight (Abhinav)
- Moved drm_rect_width() call back to the the patch "split
  dpu_plane_atomic_check()" (Abhinav)
- Got rid of saved_fmt / saved dimensions (Abhinav)
- Expanded the commit message to describe SSPP allocation per CRTC id
  (Abhinav)
- Added comment on why the size change also causes resource reallocation
  (Abhinav)
- Dropeed several last "feature" patches, leaving only SSPP reallocation
  and using 2 SSPPs per plane for now. The rest will be submitted
  separately.

Changes since v3:
- Dropped the drm_atomic_helper_check_plane_noscale (Ville)
- Reworked the scaling factor according to global value and then check
  if SSPP has scaler_blk later on.
- Split drm_rect_fp_to_int from the rotation-related fix (Abhinav)

Changes since v2:
- Dropped the encoder-related parts, leave all resource allocation as is
  (Abhinav)
- Significantly reworked the SSPP allocation code
- Added debugging code to dump RM state in dri/N/state

Changes since v1:
- Fixed build error due to me missing one of fixups, it was left
  uncommitted.
- Implementated proper handling of wide plane rotation & reflection.

---
Dmitry Baryshkov (12):
      drm/msm/dpu: limit QCM2290 to RGB formats only
      drm/msm/dpu: relax YUV requirements
      drm/msm/dpu: take plane rotation into account for wide planes
      drm/msm/dpu: use drm_rect_fp_to_int()
      drm/msm/dpu: move pstate->pipe initialization to dpu_plane_atomic_check
      drm/msm/dpu: drop virt_formats from SSPP subblock configuration
      drm/msm/dpu: move scaling limitations out of the hw_catalog
      drm/msm/dpu: split dpu_plane_atomic_check()
      drm/msm/dpu: move rot90 checking to dpu_plane_atomic_check_pipe()
      drm/msm/dpu: add support for virtual planes
      drm/msm/dpu: allow using two SSPP blocks for a single plane
      drm/msm/dpu: include SSPP allocation state into the dumped state

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  50 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  24 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 539 ++++++++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |  84 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h         |  27 ++
 10 files changed, 621 insertions(+), 145 deletions(-)
---
base-commit: 0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
change-id: 20240626-dpu-virtual-wide-beefb746a900

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

