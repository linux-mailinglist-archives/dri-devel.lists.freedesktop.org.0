Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8318E60D526
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 22:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D484A10E17D;
	Tue, 25 Oct 2022 20:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A405B10E16E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 20:04:00 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id bs14so18669556ljb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 13:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YFJl/4cGNkCZP1NH99JYcngmGYwQXPAhMhIz5gxLTBA=;
 b=R6dypa8AWI2UvZSLBjThDl80b/DPa37GxSaQaTA/kSSrqQMFeE0h3QaVyaxDBFxWls
 Vb5jS92SLWmpF65G93NBsWZpbHz4p3tyN5chbRocvrKmJijCCgISVxtkEZgoo885dJJ0
 LmP0z7U5rT7zQ/m+icAyhKrNXDRXZmFxZ2aodd6VVTBw7VibgwrUUnnaUog0LPZ2a+4V
 ja2VON1lGj6OFjIInXSkOOPfnfXkVqCYakBinl7WsHHR3ofPq9DGopPE21kgECSlT6by
 OqdNTxn/OcN7hPb6phQqJQwIREEImm7lAivxDD8kRs27Fdxyi3O6GaPMYuXkH+IUTLUe
 3PFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YFJl/4cGNkCZP1NH99JYcngmGYwQXPAhMhIz5gxLTBA=;
 b=vTo6OZuLFDvf/Mt+m1IvV2XRf5EXmCbIhCtK08GYpq91pP0JYcivAH0UT9q/pyvBd/
 5YCgxSMbKOPthOSsVlPZolGj4INPf3TLhwH27tOxFtJ55mGRvnWIKV365pHm9BmUDuXk
 Mv43ea4SVPqfHKgmNyz/zgMsXZtq4mkP/ym0ZtL9xopVZL9hJifor9w6F1avocQkZ4CI
 2XxoMlKo2o8l9vy25QPqq2T78haqmcKiZ83FSVCBYGgA3al0Y3YY1lfdJkLBZIhGaBor
 W+oaW8xkR9bGO+ZrVQV16x64kdjzUT9w2L8ChjhRKbAGnkLk7pcVrlrLxp/nWimu1hhz
 hvGg==
X-Gm-Message-State: ACrzQf1ScWH+c2spjI76sUaf3dp9QNEGfeZOXtq/VWzBIrlAvLtGZSy2
 o755ZGs7TwyD9a84EvIHnc36nQ==
X-Google-Smtp-Source: AMsMyM6pV+qirkwGMYAcS1uZ0I3LCkCdOZYsFxZ9cbWrrtukSGRqaIoFxdaotaZT+sBNn2oTAx4prw==
X-Received: by 2002:a2e:9656:0:b0:277:55c:a2f6 with SMTP id
 z22-20020a2e9656000000b00277055ca2f6mr6506458ljh.475.1666728238920; 
 Tue, 25 Oct 2022 13:03:58 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a195006000000b00494a1e875a9sm550644lfb.191.2022.10.25.13.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 13:03:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 0/2] drm/msm: rework msm_iommu_new() and
 .create_address_space cb
Date: Tue, 25 Oct 2022 23:03:55 +0300
Message-Id: <20221025200357.3637161-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify the MSM IOMMU code a bit. This moves iommu_domain_alloc() and
iommu_set_pgtable_quirks() calls to msm_iommu_new() to get rid of the
disbalance, when the iommu domain is allocated by the caller of
msm_iommu_new() and then it is freed by the msm_iommu code itself.

Changes since v2:
- Reorder the patches.
- Move iommu_set_pgtable_quirks() to the msm_iommu_new() too. It will
  not work if it's called after attaching the device.

Changes since v1:
- Fixed the uninitialized variable usage in a6xx_gmu_memory_probe()
  (reported by lkp)

Dmitry Baryshkov (2):
  drm/msm: move domain allocation into msm_iommu_new()
  drm/msm: remove duplicated code from a6xx_create_address_space

 drivers/gpu/drm/msm/adreno/a3xx_gpu.c    |  2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c    |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c    |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    | 12 ++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c    | 36 +-----------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 29 ++++++++++---------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h  |  9 ++++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 19 +++++++------
 drivers/gpu/drm/msm/msm_drv.c            | 18 ++++++------
 drivers/gpu/drm/msm/msm_iommu.c          | 20 +++++++++++--
 drivers/gpu/drm/msm/msm_mmu.h            |  3 +-
 11 files changed, 67 insertions(+), 85 deletions(-)

-- 
2.35.1

