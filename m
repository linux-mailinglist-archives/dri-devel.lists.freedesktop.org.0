Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BAF6EB311
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 22:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0D310E05C;
	Fri, 21 Apr 2023 20:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72EE10EF12
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 20:54:03 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C8C083F5AC;
 Fri, 21 Apr 2023 22:53:59 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 0/3] drm/msm/dpu: Drop useless for-loop HW block lookup
Date: Fri, 21 Apr 2023 22:53:50 +0200
Message-Id: <20230418-dpu-drop-useless-for-lookup-v2-0-acb08e82ef19@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN73QmQC/42OTQ6CMBBGr0K6dkz5CRRX3sOwKGWAxto2M5ZoC
 He3egKX7y2+9+2CkSyyuBS7INws2+AzVKdCmFX7BcFOmUUlq1o2pYIpJpgoREiMDplhDgQuhHu
 K0CjVSWk63bS9yAujZoSRtDdr3vDJuSwj4Wxfv+RtyLxafgZ6/x5s5df+F9tKkDD2qu8Mju1c4
 5XDQ1vvrMdzoEUMx3F8AIjXsnLgAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
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
Cc: Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Doing a for loop in every DPU HW block driver init to find a catalog
entry matching the given ID is rather useless if the init function
called by RM already has that catalog entry pointer, and uses exactly
its ID to drive this init and for loop.  Remove all that machinery to
drop quite some lines of unnecessarily-complicated code, and the
fallibility that comes with it, by simply giving _init() the catalog
entry pointers straight away.

Also clean up some unused struct members, and assign a log_mask for WB.

---
Changes in v2:
- Replace "sysfs" with "debugfs" in patch 2/3 description;
- Reorder WB log_mask fix as patch 1;
- Drop Fixes: tags from "unused struct members removal";
- Replace dpu_mdss_cfg parameter in dpu_hw_sspp_init() with immediate
  dpu_ubwc_cfg pointer;
- Replace dpu_mdss_cfg parameter in dpu_hw_ctl_init() with immediate
  dpu_lm_cfg array pointer.

v1: https://lore.kernel.org/r/20230418-dpu-drop-useless-for-lookup-v1-0-b9897ceb6f3e@somainline.org

---
Marijn Suijten (3):
      drm/msm/dpu: Assign missing writeback log_mask
      drm/msm/dpu: Drop unused members from HW structs
      drm/msm/dpu: Pass catalog pointers directly from RM instead of IDs

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c        | 37 +++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h        | 14 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c        | 32 +++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h        | 11 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c       | 38 ++++-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h       | 12 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c       | 41 ++++++-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h       | 13 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c         | 38 ++++-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h         | 10 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 33 +++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    | 14 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 33 +++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c       | 40 ++++------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h       | 14 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c       | 33 +++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h       | 11 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c         | 33 ++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h         | 16 +++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           | 17 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c            | 18 +++++-----
 23 files changed, 139 insertions(+), 385 deletions(-)
---
base-commit: 44bf136283e567b2b62653be7630e7511da41da2
change-id: 20230418-dpu-drop-useless-for-lookup-488700c7a469

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>

