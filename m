Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2629B5382
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 21:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF5710E6F4;
	Tue, 29 Oct 2024 20:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sojJCLg/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB12D10E6F4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 20:28:31 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2fb4fa17044so59397851fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730233710; x=1730838510; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7385hpeo89X9ew/hCv15C/61laTi50vSo+Xw6/hX5JA=;
 b=sojJCLg/AEjjeQc87ZYDSJ2++sBTPSJKZ0eXORyE0psWJo3NpAf1f/HPd3NaPmlLE3
 j/i40Nyrd5DkElT9hhTsT3LeIKFD+nsKNbbko4884FiIr298iSFT/ZB+OeRdigfYg+ev
 k/RJJSvUdbvgPDF9c2uCjSsCGq4zONMxOxk355gtOst+VmKC8Q/StfCeOY9v52/M+eBx
 8gYHS5LdIraJoUEGZL4VggsY5LO0DWT1GN566UdwdsbnytWZJp+EHOM+0GizyIvhUkKR
 NWKN9xDV9T/17v7Fdl8mHKr1lyxEUwdKl49xjb4CngNfD8pyQZq8Eii+K41+Egj3hXYE
 JsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233710; x=1730838510;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7385hpeo89X9ew/hCv15C/61laTi50vSo+Xw6/hX5JA=;
 b=WZm+J89Kx2tXJVtgYOq8r0BtLJn1Cb/MSNCQp6hJVkuwbjhMsiZDokCjSTKE241LK3
 8KifC3f0Ny0nyKPjYeAe3mGh6oUxmtDYWLNlbhVhiS+S/CA3VOa7IUv3r6iRTmiOgP0w
 nMlmFXPI8ovbI61g2t3GntUCsN0dDVICpFQXY57VQ0a1xyu8SvfMyMF/cEV6GwPdnqgl
 P750Qo6qVfiT59z+DixfyUct43nJnA98aJ+NYEaBHbdXGyNQKrsT6gigakkT4XN7FNh/
 KcB85kVngRW+WEJfMwN4o3WfiWATL3j4H04SdWt2U2AHMhmyKVvYrM+hmrI6CSeTyS6n
 D3eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0gTTXRXxx4CyrOoNv4DqEHy/06jkep7oSMGP0A6wCp4WXb95gb60egL5QZGhuMAV67Y0Z0tlzSw0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPFSC2KOqz3cFfbGSZ7rprVcL31w/1l9V3s0lELx2kym7QBbSJ
 HQXOdEqR2iIWlL9Nhh+wmEzMICs3uWaKJS6jLbC1QeKXT8GlSezX79Os/IvlAwM=
X-Google-Smtp-Source: AGHT+IGxYVqLBalsIlLHL75QltlpTg+bmQq1Djk/EOYqWUlWrFeBMWnPNF7n8D+SWoCHl6QRM/cxlw==
X-Received: by 2002:a05:6512:1087:b0:539:964c:16d4 with SMTP id
 2adb3069b0e04-53b348ed318mr7294239e87.36.1730233709699; 
 Tue, 29 Oct 2024 13:28:29 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53bb81a597fsm46449e87.96.2024.10.29.13.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:28:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/3] drm/msm/dp: mass-rename symbols
Date: Tue, 29 Oct 2024 22:28:23 +0200
Message-Id: <20241029-msm-dp-rename-v2-0-13c5c03fad44@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGhFIWcC/3XMQQrCMBCF4auUWTuSxFSrK+8hXUQzbQdMUiYSl
 NK7G7t3+T943wKZhCnDpVlAqHDmFGuYXQOPycWRkH1tMMpYrUyHIQf0MwpFFwgHReQ725E5aKi
 fWWjg9+bd+toT51eSz8YX/Vv/SUWjQmfao6WzbU93dX1ydJL2SUbo13X9At3+F6urAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2068;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kvQzJElbe+ynGoXeXpUz2x/KF+CNJfCzGkI/dVHOFY4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnIUVsgO/76rY0YbT9zf5rWIbo/VYvWm5fza/Sb
 6B0BHdk/buJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyFFbAAKCRCLPIo+Aiko
 1cvRB/4iymgjmgBRxqDWAGVuvl/Pq17yID+rUfa/G7K/ki9TI+aZ3byhYzxrMk4/sYdVHpVwxXD
 bU5oPV/OnRyiw1Z6V1sOeH8XRoMpd/+kolwRYsxk8up6hbuciuxnk4SZ5AwZleYjYo6qbWAEGLh
 nC2QcPti5/hH5THeDCY3WJREoQ63ACp1mqmoDoK39reIKjE/FWu41SmgYx4KcwK7s1iUpCBIR1I
 +Hce+hynDL70Xl1Lan/CyPU9/LpHNrXHt/kUOPdBBjOGmCUn8eTOzNF67JDWLHspJIcpzhAjBsi
 SSI0QmLh53/VEcLDtQVE3fuB9SO7uFXp24BCdhk1DTo+PeZZ
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

The LKP reported [1] a symbol clash between the drm/msm/dp and the HIMBC
driver being sumbitted, because both of them use a generic dp_ prefix
for a lot of symbols. It's a hight time we made msm/dp driver use
something less generic, like msm_dp.

[1] https://lore.kernel.org/oe-kbuild-all/202410250305.UHKDhtxy-lkp@intel.com/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Switched eDP symbols from msm_dp_foo_edp to msm_edp_foo (Abhinav)
- Link to v1: https://lore.kernel.org/r/20241028-msm-dp-rename-v1-0-a2564e9457b0@linaro.org

---
Dmitry Baryshkov (3):
      drm/msm/dp: prefix all symbols with msm_dp_
      drm/msm/dp: rename edp_ bridge functions and struct
      drm/msm/dp: tidy up platform data names

 drivers/gpu/drm/msm/dp/dp_audio.c   | 294 ++++++------
 drivers/gpu/drm/msm/dp/dp_audio.h   |  38 +-
 drivers/gpu/drm/msm/dp/dp_aux.c     | 148 +++---
 drivers/gpu/drm/msm/dp/dp_aux.h     |  18 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 734 ++++++++++++++---------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 118 ++---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 482 +++++++++----------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  40 +-
 drivers/gpu/drm/msm/dp/dp_debug.c   |  68 +--
 drivers/gpu/drm/msm/dp/dp_debug.h   |  10 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 904 ++++++++++++++++++------------------
 drivers/gpu/drm/msm/dp/dp_display.h |  18 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     | 142 +++---
 drivers/gpu/drm/msm/dp/dp_drm.h     |  22 +-
 drivers/gpu/drm/msm/dp/dp_link.c    | 432 ++++++++---------
 drivers/gpu/drm/msm/dp/dp_link.h    |  44 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 254 +++++-----
 drivers/gpu/drm/msm/dp/dp_panel.h   |  42 +-
 drivers/gpu/drm/msm/dp/dp_utils.c   |  20 +-
 drivers/gpu/drm/msm/dp/dp_utils.h   |   8 +-
 20 files changed, 1918 insertions(+), 1918 deletions(-)
---
base-commit: dec9255a128e19c5fcc3bdb18175d78094cc624d
change-id: 20241028-msm-dp-rename-f0eed848e231

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

