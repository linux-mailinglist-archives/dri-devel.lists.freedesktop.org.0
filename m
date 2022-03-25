Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2918B4E71D5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 12:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD7D10E995;
	Fri, 25 Mar 2022 11:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D8310E942;
 Fri, 25 Mar 2022 11:06:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A4EF1CE28D8;
 Fri, 25 Mar 2022 11:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB729C340E9;
 Fri, 25 Mar 2022 11:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648206370;
 bh=S/8wTA0auLZSlVzKWYspR8dMbr2gyFwMvqRwtK/PO8I=;
 h=From:To:Cc:Subject:Date:From;
 b=Gcv5yH8RWe9Kj1U7wJDshHa0zGo/eFxXsJOMPDJT40CxxBi8+aFnXf24UOi37NTof
 OwdWWnFmn8Led1DtMn9SN3wPeIcJ0UrJ39SBlUTC31BuPyzNpYuLpTm4hbnAu7N/Ox
 SSgDl3cZOBznlPFSljIZ5aps2CKzlNtw1Ay5OtmxufPEHOzVgJ2M0BqkHOftfGntWi
 tu0AHbqKpL8RO2oD9UE6A6T0dmOYZctNWmP6T1k3odK+3qhzvlJ/327+/15d78miAl
 ETU1LcRda5a6PUuilg4Uu/dljUEDTGdejxzBqBpLhJ4MsKR37mGGhHodpoQOkDs+mQ
 DYNrxRnOlqc5g==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH v5 00/13] drm/msm: Add Display Stream Compression Support
Date: Fri, 25 Mar 2022 16:35:43 +0530
Message-Id: <20220325110556.275490-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display Stream Compression (DSC) compresses the display stream in host which
is later decoded by panel. This series enables this for Qualcomm msm driver.
This was tested on Google Pixel3 phone which use LGE SW43408 panel.
 
The changes include DSC data and hardware block enabling for DPU1 then
support in encoder. We also add support in DSI and introduce required
topology changes.
 
In order for panel to set the DSC parameters we add dsc in drm_panel and
pass the dsc configuration from the panel driver

We still have dsc as a globabl entity. I think while doing DP + DSC we
should be able to update it, right now comprehending the requirements are
bit difficult.
 
Complete changes which enable this for Pixel3 along with panel driver (not
part of this series) and DT changes can be found at:
git.linaro.org/people/vinod.koul/kernel.git pixel/dsc_v5
 
Comments welcome!

Changes since v4:
 - Use new apprach based on Abhinav suggestion for dsc with 3d-merge
 - Make common function for dsc timing caln and call that from video and cmd
   mode
 - update description for patch "Pass DSC params to drm_panel"
 - update couple of typos as pointed by Marijn
 - drop dpu_encoder_dsc_pclk_param_calc() as that was duplicating the caln
   done in dsi timing
 - Update copyright to 2022 to new files
 - Update Abhinav's email to new quic one

Changes since v3:
 - Merge changes from Dmitry to have dsc per encoder instance
 - add warning for dsc and mode3d enabled together
 - set dsc in dpu_encoder_phys_vid as well
 - remove dsc hardcoded mask
 - use devm_kzalloc for memory allocation for dsc

Changes since v2:
 - Fix comments by Dimitry except the dsc being global.
 - Move RM patch later for dependency on topology now
 - Add patch for mode valid callback for dsi_mgr
 - Add missing structure documentation patch
 - Fix errors in mode_3d changes
 - Rebase on v5.16-rc1 and test

Changes since v1:
 - Fix various issues spotted by kbuildbot
 - Rebase to v5.15-rc3
 - Remove unused fields and duplicate defines
 - Enable DSC blocks only when DSC is enabled
 - remove sdm845 feature mask, use 0
 - Check for DSC in hw_ctl

Changes since RFC:
 - Drop the DT binding patch as we derive the configuration from panel
 - Drop the drm api patch as we no longer need it (use pps drm api)
 - Fix comments raised by Dimitry
 - Add dsc parameters calculation from downstream

Dmitry Baryshkov (1):
  drm/msm/dpu: don't use merge_3d if DSC merge topology is used

Vinod Koul (12):
  drm/msm/dsi: add support for dsc data
  drm/msm/dsi: Pass DSC params to drm_panel
  drm/msm/disp/dpu1: Add support for DSC
  drm/msm/disp/dpu1: Add support for DSC in pingpong block
  drm/msm/disp/dpu1: Add DSC for SDM845 to hw_catalog
  drm/msm/disp/dpu1: Add DSC support in hw_ctl
  drm/msm/disp/dpu1: Add support for DSC in encoder
  drm/msm: Add missing num_dspp field documentation
  drm/msm/disp/dpu1: Add support for DSC in topology
  drm/msm/disp/dpu1: Add DSC support in RM
  drm/msm/dsi: add mode valid callback for dsi_mgr
  drm/msm/dsi: Add support for DSC configuration

 drivers/gpu/drm/msm/Makefile                  |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 155 +++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |   6 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  12 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  20 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  13 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 210 ++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |  77 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  13 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  32 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  14 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  56 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   1 +
 drivers/gpu/drm/msm/dsi/dsi.c                 |   5 +
 drivers/gpu/drm/msm/dsi/dsi.h                 |   3 +
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |  10 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 274 +++++++++++++++++-
 drivers/gpu/drm/msm/dsi/dsi_manager.c         |  12 +
 drivers/gpu/drm/msm/msm_drv.h                 |  26 ++
 include/drm/drm_panel.h                       |   7 +
 24 files changed, 959 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h

-- 
2.34.1

