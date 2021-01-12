Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 968FC2F463B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02836E140;
	Wed, 13 Jan 2021 08:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07ED789F0A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 19:26:50 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 215183E7BE;
 Tue, 12 Jan 2021 20:26:47 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/7] Qualcomm DRM DPU fixes
Date: Tue, 12 Jan 2021 20:26:25 +0100
Message-Id: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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

Changes in v2:
- Dropped patches "drm/msm/dpu: Add a function to retrieve the current CTL status"
  and "drm/msm/dpu: Fix timeout issues on command mode panels" as the
  second patch was wrong.
- Fixed patch apply issues on latest linux-next and 5.11-rcX

AngeloGioacchino Del Regno (7):
  drm/msm/dpu: Fix VBIF_XINL_QOS_LVL_REMAP_000 register offset
  drm/msm/dpu: Move DPU_SSPP_QOS_8LVL bit to SDM845 and SC7180 masks
  drm/msm/dpu: Add prog_fetch_lines_worst_case to INTF_BLK macro
  drm/msm/dpu: Allow specifying features and sblk in DSPP_BLK macro
  drm/msm/dpu: Disable autorefresh in command mode
  drm/msm/dpu: Correctly configure vsync tearcheck for command mode
  drm/msm/dpu: Remove unused call in wait_for_commit_done

 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 90 +++++++++++++++----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 49 +++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 26 ++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   |  9 +-
 5 files changed, 147 insertions(+), 41 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
