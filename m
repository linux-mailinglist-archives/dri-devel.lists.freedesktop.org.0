Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B8F5859BD
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 11:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F0A10E0B1;
	Sat, 30 Jul 2022 09:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7551D10E0B1;
 Sat, 30 Jul 2022 09:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659174072; x=1690710072;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Yx6mdlgxUKcuMUJpG9RAXbgHUuz7QAS+XXKWOccu2sE=;
 b=Nv0KfgKeLw+uQw/qRdUyJXirVk3KzC4UKOOszK1pWUZSyp/e85q+pI+U
 fbRvNHVYwxrUkHsfpk8pbdi+r3tmpqfyzJWS6Y9W82bVOusJ2W8Mi1eo3
 QzelPZ87J7fjWkefphrhiMb2VvUHNzwnG7rYpe7vRxNZua2jaaFAV0JFx c=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 30 Jul 2022 02:41:11 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2022 02:41:10 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sat, 30 Jul 2022 02:41:10 -0700
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sat, 30 Jul 2022 02:41:03 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>, Rob Clark
 <robdclark@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 0/8] Improve GPU Recovery
Date: Sat, 30 Jul 2022 15:10:43 +0530
Message-ID: <1659174051-27816-1-git-send-email-quic_akhilpo@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Wang Qing <wangqing@vivo.com>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Nathan Chancellor <nathan@kernel.org>, David Airlie <airlied@linux.ie>,
 Matthias
 Kaehlcke <mka@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Recently, I debugged a few device crashes which occured during recovery
after a hangcheck timeout. It looks like there are a few things we can
do to improve our chance at a successful gpu recovery.

First one is to ensure that CX GDSC collapses which clears the internal
states in gpu's CX domain. First 5 patches tries to handle this.

Rest of the patches are to ensure that few internal blocks like CP, GMU
and GBIF are halted properly before proceeding for a snapshot followed by
recovery. Also, handle 'prepare slumber' hfi failure correctly. These
are A6x specific improvements.

This series is rebased on top of [1] which based on linus's master
branch.

[1] https://patchwork.freedesktop.org/series/106860/

Changes in v3:
- Use reset interface from gpucc driver to poll for cx gdsc collapse
  https://patchwork.freedesktop.org/series/106860/
- Use single pm refcount for all active submits

Changes in v2:
- Rebased on msm-next tip

Akhil P Oommen (8):
  drm/msm: Remove unnecessary pm_runtime_get/put
  drm/msm: Take single rpm refcount on behalf of all submits
  drm/msm: Correct pm_runtime votes in recover worker
  drm/msm: Fix cx collapse issue during recovery
  drm/msm/a6xx: Ensure CX collapse during gpu recovery
  drm/msm/adreno: Remove a WARN() during runtime_suspend
  drm/msm/a6xx: Improve gpu recovery sequence
  drm/msm/a6xx: Handle GMU prepare-slumber hfi failure

 drivers/gpu/drm/msm/adreno/a6xx.xml.h      |  4 ++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 83 +++++++++++++++++++-----------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 35 +++++++++++--
 drivers/gpu/drm/msm/adreno/adreno_device.c |  7 ---
 drivers/gpu/drm/msm/msm_gpu.c              | 21 +++++---
 drivers/gpu/drm/msm/msm_gpu.h              |  4 ++
 drivers/gpu/drm/msm/msm_ringbuffer.c       |  4 --
 7 files changed, 106 insertions(+), 52 deletions(-)

-- 
2.7.4

