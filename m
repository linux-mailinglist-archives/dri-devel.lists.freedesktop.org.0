Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E74825D24
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 00:34:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6613D10E6AC;
	Fri,  5 Jan 2024 23:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33A710E6AB
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 23:34:18 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50e72e3d435so62861e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 15:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704497657; x=1705102457; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hw1I7zlexZk5iP3niM8oRxjLKv+HZe/PhMWNQUKYIfU=;
 b=fl2cVWa0HGPi25F7GG4xhExijQSY5cGKs8QrPsqIlgB/AMv3C72ctbdgeiu8Xlvek/
 nZ+Wl/GhRqbV6ogmVvvR9qJawCMl7pYlQqhJiL4vUL8qIgUs7XG4IwcTLxrowyC1UDyd
 GsUlUaq9LIRjf7K7An8VOCJQh00TcbshNEer1PHlav1QXmLPcpVT8XEGAp9lMaX9w4qC
 sTcLBwGIQ94izw/z3wjKxN/xr9A58auR2A9PLni54ofHt/OP3WXN98J+1wOA+ddeWYph
 V0f69EFtzZp0yPyoPR2cC6Mo05KU7MW4dJnZv9/bPbG+AjXWFma414VJHJEmPc3yCBQK
 so8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704497657; x=1705102457;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hw1I7zlexZk5iP3niM8oRxjLKv+HZe/PhMWNQUKYIfU=;
 b=E8eftuICE8IOHlRnNY2AmtPc9ugQczvN1cA9sL5Zs0pvXE6akLSrAiNZdXpjPK4UiO
 XabIBZXdwocNVUAfEI1sgX64nQen4PBB4TGsA0Ks/yngYB093CAOwfxtmtrr6PwcVVEN
 xDdUi8SYJ7GyCZbM7/NwiXR1iptBuA0b1IHHbItpt0Vjw53Z8dXLUZD6eeCuPd/1Ww3F
 m3ACfM/9MAUDEkGuLd5vjIbjQ/7phG/lgdGpAVRUv7qg6vDqJy5xcQtS6LqxQaEnSTuY
 dAAq74yZwaSuk3KLTIx3d+mYohrFSEsczfs3tDdKFsqhVLj/EZ678mD7s8NTvuNKdk1j
 qAVg==
X-Gm-Message-State: AOJu0YzWcRcg/HuQL/+yOdUkNhFpZOfayOkma95kvp+0lYQMfwz79ipq
 H8Zu1CLvj3IsPnHVbB7qI0RQeyrtCxeM/A==
X-Google-Smtp-Source: AGHT+IE4aCRn3wpU5GBLKoPj8usYV6U1B5P46v5fiYF7vz9hdG+s494PcqSl8gwkFp7NHd+h5I6diw==
X-Received: by 2002:a05:6512:29a:b0:50e:7723:8f9a with SMTP id
 j26-20020a056512029a00b0050e77238f9amr48362lfp.30.1704497656929; 
 Fri, 05 Jan 2024 15:34:16 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 k4-20020ac24f04000000b0050e74d04c8asm362211lfr.132.2024.01.05.15.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 15:34:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/4] drm/msm: provide migration path from MDP5 to DPU driver
Date: Sat, 06 Jan 2024 01:34:14 +0200
Message-Id: <20240106-fd-migrate-mdp5-v3-0-3d2750378063@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPaRmGUC/zXMTQqDMBBA4atI1h3Jj5rSVe9RupiYqEMbIxORi
 nj3hkKX3+K9Q+TAFLK4VYfgsFGmNBeYSyX6CecxAPlioaVupJItDB4ijYxrgOiXFjrUiK1y/dU
 4UaqFw0Cf3/HxLB44RVgnDvj/GCVlp4yxWta6scpaCQp8pJX32iHveXql7f6mGTnViUdxnl/3c
 w/hqAAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3800;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KUdXwpI/YN5rftR/xtXfz6XLsavlmPLDRjTXtZnSfxo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlmJH3FdLTlMl2ZcdUuJf9jcN0r2RzMdlHiMayh
 NPaQ162OkeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZiR9wAKCRCLPIo+Aiko
 1e3GCACuj3zmjz0eHx843g4D2oT9V+gJe5p5s4HlCialwX0IW/fEAfBU5+KG4tUYkl39aiVmePs
 K/BxoUWjM+l52ZQk9Dpfjkbcz6Dbq6Ad3w4B8J4VHn3iDQ5jl5gghs+ZOqRpeJ3d/uqzpVvc4yl
 nH/wtpQqJ/xszLU/94EY+ZoaKsrhpdU6t0yinRS2ULHpTr/Q4xB7xx8ToXjAtrC2Pw0Lm20iQx6
 KsH1vtNjkpRKFfBRRjmmnI6DGXAWfJAwvOEqJSJ92Pvq36nyBn3DQfVLQ8Z021ahveORCWRhxKW
 eIm2ur+wm2/8ZIVQ5tdZZMm+rPKjaXo2QylYvvXNF1NSCx6l
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
Cc: linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Over the last several years the DPU driver has been actively developed,
while the MDP5 is mostly in the maintenance mode. This results in some
features being available only in the DPU driver. For example, bandwidth
scaling, writeback support, properly supported bonded DSI aka dual DSI
support, DSC (display stream compression).

All the pre-SDM845 platforms were originally supported by the MDP5
driver only. However it is possible and easy to support some of the
older SoCs in the DPU driver. For example in the v5.18 it got
support for MSM8998.  This can not be considered as a proper migration,
since there msm8998.dtsi didn't describe the display hardware
beforehand. Instead new bindings were added, making MSM8998 just another
display hardware to be supported by the DPU driver.

This series provides a way to gradually migrate support for several
existing and well-supported SoCs from the MDP5 to the DPU driver without
changing the DT. From the user experience point of view this is
facilitated by the `msm.prefer_mdp5' kernel param. If the parameter is
set to `true' (current default), all `shared' platforms will be handled
by the MDP5 driver. If the switch is flipped to `false' (or if the MDP5
driver is disabled), these platforms will be handled by the DPU driver.
Handling this by the modparam (rather than solely by kernel config)
allows one to easly switch between the drivers, simplifying testing.

This series implements support for two DPU 3.n platforms, SDM660 and
SDM630. The MSM8996 support was a part of the previous iterations of
this patchset, but it was removed in v3. It requires additional
development and testing.

In theory after additional testing we can drop most of migration code
and some parts of MDP5 driver. The proposed boundary is to move all
platforms supporting cursor planes to the DPU driver, while limiting
MDP5 to support only the older platforms which implement cursor as a
part of the LM hardware block (MSM8974, APQ8084, MSM8x26, MSM8x16 and
MSM8x39).

Changes since v2:
- Rebased on top of linux-next
- After additional consideration dropped MSM8996 patch. It will be
  reiterated later, once the generic migration framework is accepted
  (and after we implement scalers support for that platform).

Changes since v1:
- Dropped accepted patches
- Rebased on top of updated [1]
- Added defines for MDSS hw revisions (Stephen)
- Changed msm_mdss_generate_mdp5_mdss_data() to return const struct
  pointer (Stephen)
- Fixed error handling in msm_ioremap_mdss() (Stephen)

[1] https://patchwork.freedesktop.org/series/119804/

---
Dmitry Baryshkov (4):
      drm/msm/mdss: generate MDSS data for MDP5 platforms
      drm/msm/dpu: support binding to the mdp5 devices
      drm/msm: add a kernel param to select between MDP5 and DPU drivers
      drm/msm/dpu: add support for SDM660 and SDM630 platforms

 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h | 291 +++++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h | 225 ++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 103 ++++++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   3 +
 drivers/gpu/drm/msm/msm_drv.c                      |  33 +++
 drivers/gpu/drm/msm/msm_drv.h                      |   4 +
 drivers/gpu/drm/msm/msm_io_utils.c                 |  13 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  51 ++++
 10 files changed, 706 insertions(+), 21 deletions(-)
---
base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
change-id: 20240105-fd-migrate-mdp5-6a2aa51bc83b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

