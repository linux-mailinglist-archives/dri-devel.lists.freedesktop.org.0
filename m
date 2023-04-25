Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA296EEA83
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 01:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8921A10E30E;
	Tue, 25 Apr 2023 23:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3B210E82A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 23:06:04 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 733321F9B4;
 Wed, 26 Apr 2023 01:06:01 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 00/21] drm/msm/dpu: Implement tearcheck support on INTF
 block
Date: Wed, 26 Apr 2023 01:05:51 +0200
Message-Id: <20230411-dpu-intf-te-v3-0-693b17fe6500@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANBcSGQC/2XOQQ6CMBCF4auYrh3SabGgK+9hXCAMMERa0kKjI
 dxdIHHF8n/JfJlZBPJMQdxOs/AUObCza+jzSZRtYRsCrtYWSiotU0SohgnYjjWMBFSYPK1Rk8y
 1WC8GTzV/du3xXLvlMDr/3fGI27o5CpVGhRcpTaIQcyMBoS88dzYJE3cj2XtwfcH2zZYS5xuxY
 VH9geMjUYEEqjNT5llGr2t2AJZl+QGdXnRT7AAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Adam Skladowski <a39.skl@gmail.com>, Loic Poulain <loic.poulain@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since DPU 5.0.0 the TEARCHECK registers and interrupts moved out of the
PINGPONG block and into the INTF.  Implement the necessary callbacks in
the INTF block, and use these callbacks together with the INTF_TEAR
interrupts.  Additionally, disable previous register writes and remove
unused interrupts in the PINGPONG and MDP_TOP blocks for these newer
platforms.

With these patches the devices on DPU >= 5.0.0 listed below now update
their panels at 60fps without tearing (nor sluggishness), and without
repeated timeouts in dmesg.

Tested on the following devices with command-mode panels and TE pins:

- Sony Xperia XZ3 (sdm845, DPU 4.0.0, cmdmode panel): no regressions on
  PINGPONG TE;
- Sony Xperia 5 (sm8150, DPU 5.0.0);
- Sony Xperia 10 II (sm6125, DPU 5.0.4).

---
Changes in v3:
- Use new commit hashes in Fixes: tags after drm-msm's msm-next was
  force-pushed;
- Rename dpu_hw_setup_vsync_source to
  dpu_hw_setup_vsync_source_and_vsync_sel and drop _v1 suffix from
  dpu_hw_setup_vsync_source_v1;
- Refactor dpu_hw_interrupts register offsets to take the block offset
  as argument and compute the actual register with a base offset and
  stride, rather than hardcoding the many per-INTF and per-AD4 register
  offsets with fixed stride manually;
- Split INTF_TEAR interrupt additions into a core (dpu_hw_interrupts.c)
  and catalog patch;
- Add new patch to make DITHER sub-block of SM8[34]50 and SC8280XP V2
  instead of V1.

v2: https://lore.kernel.org/r/20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org

Changes in v2:
- Rebase on -next with all the new SC8280XP and SM8[345]50 support;
  - Remove duplicate PP_BLK_TE macro now that .features is an argument;
  - Fix PP_BLK_DIPHER -> DITHER typo that was added recently;
  - Add INTF_TEAR interrupt blocks for DPU 7.0.0 (moved to different
    register range);
  - Describe INTF_TEAR support for the newly added SM8350, SM8450,
    SM8550 and SC8280XP SoCs;
  - Remove TE2 subblocks from 8[34]50 and sc8280xp (new patch);
- Rebase on -next with DPU catalog rework;
  - Remove dpu_hw_intf_v1_get_status which was inlined in the original
    dpu_hw_intf_get_status function in e3969eadc8ee ("drm/msm/disp/dpu:
    get timing engine status from intf status register");
  - Many changes to move all catalog edits to separate files;
- Add documentation for DPU_MDP_VSYNC_SEL;
- Fix sdm8150_mdp typo, should be sm8150_mdp;
- Move unrelated INTF_INTR offsets out of hwio header (new patch);
- Remove _reg argument from INTF_BLK, since we now have a third
  interrupt with a different base register.  To prevent confusion all
  three interrupts should provide the final value from DPU_IRQ_IDX
  directly.
- Only request the new tear_rd_ptr in a new INTF_BLK_DSI_TE macro;
- Drop stray INTF_MISR_SIGNATURE register definition;
- Clean up registers in dpu_hw_intf.c (many new patches);
- merged setup_tearcheck() and enable_tearcheck() callbacks;
- replaced enable_tearcheck(false) with new disable_tearcheck()
  callback;
- Moved dpu_encoder_phys_cmd_enable_te intestines (just autorefresh
  disablement) to INTF and PP block, replacing 3 callbacks in both
  blocks with just a single disable_autorefresh() callback.

v1: https://lore.kernel.org/r/20221231215006.211860-1-marijn.suijten@somainline.org

---
Konrad Dybcio (1):
      drm/msm/dpu: Move dpu_hw_{tear_check,pp_vsync_info} to dpu_hw_mdss.h

Marijn Suijten (20):
      drm/msm/dpu: Remove unused INTF0 interrupt mask from SM6115/QCM2290
      drm/msm/dpu: Remove TE2 block and feature from DPU >= 7.0.0 hardware
      drm/msm/dpu: Move non-MDP_TOP INTF_INTR offsets out of hwio header
      drm/msm/dpu: Reindent REV_7xxx interrupt masks with tabs
      drm/msm/dpu: Fix PP_BLK_DIPHER -> DITHER typo
      drm/msm/dpu: Use V2 DITHER PINGPONG sub-block in SM8[34]50/SC8280XP
      drm/msm/dpu: Remove duplicate register defines from INTF
      drm/msm/dpu: Remove extraneous register define indentation
      drm/msm/dpu: Sort INTF registers numerically
      drm/msm/dpu: Take INTF index as parameter in interrupt register defines
      drm/msm/dpu: Drop unused poll_timeout_wr_ptr PINGPONG callback
      drm/msm/dpu: Move autorefresh disable from CMD encoder to pingpong
      drm/msm/dpu: Disable pingpong TE on DPU 5.0.0 and above
      drm/msm/dpu: Disable MDP vsync source selection on DPU 5.0.0 and above
      drm/msm/dpu: Factor out shared interrupt register in INTF_BLK macro
      drm/msm/dpu: Describe TEAR interrupt registers for DSI interfaces
      drm/msm/dpu: Add TEAR-READ-pointer interrupt to INTF block
      drm/msm/dpu: Merge setup_- and enable_tearcheck pingpong callbacks
      drm/msm/dpu: Implement tearcheck support on INTF block
      drm/msm/dpu: Remove intr_rdptr from DPU >= 5.0.0 pingpong config

 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  26 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  26 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  40 +--
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  48 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  40 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  16 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  15 +-
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  15 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  40 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  22 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  64 +++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  46 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  36 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  11 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  10 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 210 ++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  48 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 183 +++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 268 ++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  25 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  48 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |  83 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |  64 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  50 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h           |   3 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  14 ++
 29 files changed, 978 insertions(+), 490 deletions(-)
---
base-commit: f600e0bbde8562a06bee31b3eb1b69d49acac4c5
change-id: 20230411-dpu-intf-te-ea684f13e083

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>

