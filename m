Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85F69AF5FF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 02:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA33B10E9BB;
	Fri, 25 Oct 2024 00:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IGlTGiRD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D3F10E9BB
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 00:20:16 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539f72c913aso1960943e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 17:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729815614; x=1730420414; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PnmCf8UPcSyAfAGwfD2QhUDxxiR4XEmMmwHKfvOXzzg=;
 b=IGlTGiRDTvgHz7r5h8iqfYFSlFr0m/kqCJB3KAYxKyUcFtcNX9j7W9lL030WBjk0Dk
 D/HDEMN9zED1I7LTuFsBmMM7KvBtE93aiP7NCqL64Et9V1aJIBlfqvVwtaVMS1k/I9iZ
 ebi9658MMcH5igg6dLWUBCmaY2I2HnfB1PPHz2qhgkUKkmqPNrWZe1NfKBYH/OB9MzUG
 Rb+BJyY3cZF5C4DWXJKhTKSmDRAq+vHKdGfdIRU78gN+5tzupt9GKYbbY6CZ0fxmLB1K
 sbsX8RoPyt1wfHRFIu2/7HZEE4cfksMK+nKVo11IuAR0phmQ3SkRbH/jFrNKDLJzNPmL
 sH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729815614; x=1730420414;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PnmCf8UPcSyAfAGwfD2QhUDxxiR4XEmMmwHKfvOXzzg=;
 b=bqzqpcB5GNqS13KOcp/SqbL0DP4uY2j79Qjj1AYwYKDke4PAnkpf6ocXTDNYDVZsE+
 DZ7CzUtc51GFlo3ZrpDPtC+62vIJUDYgVl8aSphM0LycZAWQLsGpiSdoz65Pa3nADLKc
 PHqD8fqN+PbT0XR7qVNwr+s10kM5s29/1BoHQ2uUie1Lm1BmYWRZ7fkOh+5RonJPf/W3
 hUnqFkKYj/EVwsAobxquRVIhL27TBr02OxI7l3NHuDm0I3NasWK7SV8aby/5wJmDADav
 IHmrB7E+M1nvRwN5hEGbGPaTdCvNuBih3J5HnL70VM15P+hu1UGzRyGwB7+8vozQGXr/
 74KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWBLGjmnLhBHFG7tA34cPg5rIqZSZtFAUbgMSR480bRkJsp0EiACz8vwVomocTF4KJ002BMzwe8K4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwemawfLfFu8YcUdnRjKqshGSWMUOlMJnblwm/eS/CWSeXTnBkw
 BsBfOJCjlHoWSe5lvlKQsGFIKq3k6BvZky4OFVQZDPWrT5DQNu69wYuD4V5OJr4=
X-Google-Smtp-Source: AGHT+IHLpRs6BD0MjhLwqVPzLq4Gx5AH71ZiAkGzGzmIGfEwt1PSjS+GdrikSxEbJnMQsFEW7o7wqg==
X-Received: by 2002:a05:6512:224e:b0:539:8df0:4d3f with SMTP id
 2adb3069b0e04-53b23e8eb2fmr2794295e87.40.1729815614174; 
 Thu, 24 Oct 2024 17:20:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e1b05b3sm6227e87.161.2024.10.24.17.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 17:20:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v6 0/9] drm/msm/dpu: support virtual wide planes
Date: Fri, 25 Oct 2024 03:20:07 +0300
Message-Id: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADfkGmcC/2XOQQ6CMBCF4auYrh0yVKjiynsYFq0MMlGpmUKVG
 O5uNTGauHyL9+V/qEDCFNR28VBCkQP7Pg2zXKhDZ/sjATdpK426QKMNNNcRIssw2jPcuCFwRK1
 bF8ZWiCrdrkIt39/kvk67FX+BoROyX2iVF4ioc5OtKl0WFeTQXHiQKXNWptCdfNydubfiMy/Hl
 9pxGLxM785YvuxP0vo/KZaAUKasCg/ObRz9YvU8z09Onz5F9wAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3971;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gEmPtzvaszc7tBoZ+Kp2glF1v75duuWmxH0rar9ZL2I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnGuQ5m3pKr0kVzZWcLNSXGtuP2iShZ+NFs+nUm
 cNQz2jOLu2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxrkOQAKCRCLPIo+Aiko
 1ZcIB/4/OOVahVWSiMTDscfmUCJ42RxQjj4h1oDljs2JXJjgQ1ZaFC4wToBo760ZJ0QAHvIVeJS
 yMaq1YaFiiqtCKzzQUk/0kNtT6KE79dfG9TieZAUgvTrI74aInsl3fVbmGDoEi90A00aEuyS+Uw
 0H3L9EBhVlsSFftt2av/HQtAzdEa1QE+WbmvoHQMAJACTBdpoerWd1Qhs3MD2UubJl+L//yMLw6
 /d615HK1Y9J3xVkq8bJJ0b5RaSsv0FAsTo0aTKUNAILkICfAxF2IBLtx4iDBg+Ck6n9kBU+jkq3
 h1hFD/3zmRHj0m82JdhdZw1aMHtSlsWmG7enF4twcOyVxtnZ
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

---
Changes in v6:
- Renamed dpu_plane_atomic_check_nopipe() ->
  dpu_plane_atomic_check_nosspp() and dpu_plane_atomic_check_pipes() ->
  dpu_plane_atomic_check_sspp() (Abhinav)
- In dpu_rm_reserve_sspp() replaced hweight usage with explicit type
  allocation (Abhinav)
- In dpu_plane_atomic_check() set r_pipe->sspp (Jun Nie)
- In dpu_rm_reserve_sspp() check hw_sspp->ops.setup_scaler to rule out
  SSPP blocks with unsupported scaler blocks (RGB, QSEED2)
- Link to v5: https://lore.kernel.org/r/20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org

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
Dmitry Baryshkov (9):
      drm/msm/dpu: use drm_rect_fp_to_int()
      drm/msm/dpu: move pstate->pipe initialization to dpu_plane_atomic_check
      drm/msm/dpu: drop virt_formats from SSPP subblock configuration
      drm/msm/dpu: move scaling limitations out of the hw_catalog
      drm/msm/dpu: split dpu_plane_atomic_check()
      drm/msm/dpu: move rot90 checking to dpu_plane_atomic_check_sspp()
      drm/msm/dpu: add support for virtual planes
      drm/msm/dpu: allow using two SSPP blocks for a single plane
      drm/msm/dpu: include SSPP allocation state into the dumped state

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  50 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  28 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 539 +++++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |  75 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h         |  27 ++
 10 files changed, 606 insertions(+), 155 deletions(-)
---
base-commit: 2261751d5f2233a7a5d4791d6d13a0271e838ca5
change-id: 20240626-dpu-virtual-wide-beefb746a900

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

