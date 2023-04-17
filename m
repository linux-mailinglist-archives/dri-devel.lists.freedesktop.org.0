Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE5D6E5506
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 01:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A09D10E632;
	Mon, 17 Apr 2023 23:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7E510E632
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 23:14:21 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E6DF73F8AE;
 Tue, 18 Apr 2023 01:14:16 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 0/3] drm/msm/dpu: Drop useless for-loop HW block lookup
Date: Tue, 18 Apr 2023 01:14:15 +0200
Message-Id: <20230418-dpu-drop-useless-for-lookup-v1-0-b9897ceb6f3e@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMfSPWQC/x2NQQrDIBAAvxL23AWTSmP7lZKD0U2zVFR2sRRC/
 l7pceYwc4CSMCk8hgOEPqxccofxMkDYfX4RcuwMk5muxo4OY20YpVRsSolUcSuCqZR3q2idm40
 Js7e3O/TC6pVwFZ/D3hu5pdRlFdr4+18+l/P8AQRLlfiCAAAA
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
Marijn Suijten (3):
      drm/msm/dpu: Drop unused members from HW structs
      drm/msm/dpu: Assign missing writeback log_mask
      drm/msm/dpu: Pass catalog pointers directly from RM instead of IDs

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c        | 30 +++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h        | 10 +++---
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c       | 34 +++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h       | 10 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c       | 33 +++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h       | 11 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c         | 33 ++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h         | 16 +++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           | 17 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c            | 18 +++++-----
 23 files changed, 127 insertions(+), 376 deletions(-)
---
base-commit: 4aa1da8d99724f6c0b762b58a71cee7c5e2e109b
change-id: 20230418-dpu-drop-useless-for-lookup-488700c7a469

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>

