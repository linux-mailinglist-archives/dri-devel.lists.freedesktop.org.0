Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E51F2F00AD
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 16:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96F56E8B3;
	Sat,  9 Jan 2021 15:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 435 seconds by postgrey-1.36 at gabe;
 Sat, 09 Jan 2021 13:44:56 UTC
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760BC89E59
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jan 2021 13:44:56 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 673623EEB9;
 Sat,  9 Jan 2021 14:37:38 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/9] Qualcomm DRM DPU fixes
Date: Sat,  9 Jan 2021 14:37:27 +0100
Message-Id: <20210109133736.143469-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 09 Jan 2021 15:13:22 +0000
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
Cc: freedreno@lists.freedesktop.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 martin.botka@somainline.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 marijn.suijten@somainline.org, phone-devel@vger.kernel.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series brings some fixes to the Qualcomm DPU driver, aim is
to get it prepared for "legacy" SoCs (like MSM8998, SDM630/660) and to
finally get command-mode displays working on this driver.

The series was tested against MSM8998 (the commit that introduces it to
the hw-catalog is not included in this series, as it needs to be cleaned
up a little more) and specifically on:
- Sony Xperia XZ Premium (MSM8998), 4K dual-dsi LCD display, command-mode
- F(x)Tec Pro1 (MSM8998), single-dsi OLED display, video-mode

... And it obviously worked just perfect!

AngeloGioacchino Del Regno (9):
  drm/msm/dpu: Fix VBIF_XINL_QOS_LVL_REMAP_000 register offset
  drm/msm/dpu1: Move DPU_SSPP_QOS_8LVL bit to SDM845 and SC7180 masks
  drm/msm/dpu1: Add prog_fetch_lines_worst_case to INTF_BLK macro
  drm/msm/dpu1: Allow specifying features and sblk in DSPP_BLK macro
  drm/msm/dpu: Disable autorefresh in command mode
  drm/msm/dpu: Correctly configure vsync tearcheck for command mode
  drm/msm/dpu: Remove unused call in wait_for_commit_done
  drm/msm/dpu: Add a function to retrieve the current CTL status
  drm/msm/dpu: Fix timeout issues on command mode panels

 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 91 ++++++++++++++++---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 39 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  6 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  7 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 26 ++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   |  9 +-
 7 files changed, 155 insertions(+), 37 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
