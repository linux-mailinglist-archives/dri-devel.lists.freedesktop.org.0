Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B016E5197
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 22:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DBF10E5D1;
	Mon, 17 Apr 2023 20:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B23D10E5D0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 20:21:44 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D1C4B3F84A;
 Mon, 17 Apr 2023 22:21:41 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 00/17] drm/msm/dpu: Implement tearcheck support on INTF
 block
Date: Mon, 17 Apr 2023 22:21:39 +0200
Message-Id: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFOqPWQC/x3MQQqDMBCF4avIrBvJTKxIV71HcRHqqCM1kSRKi
 3j3Rpf/g/ftEDkIR3gUOwTeJIp3OehWwHu0bmAlXW4gTUZXiKpbViUu9SqxYls3VY+GdWMgP5b
 AvXwv7dXmHiUmH34XvuG5ng4hGSS8a12XhNjUWqGabZDJlXGVKbF7Rj9bcR9xXPowQHscxx92c
 Z5EqwAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Adam Skladowski <a39.skl@gmail.com>, Loic Poulain <loic.poulain@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
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

Marijn Suijten (16):
      drm/msm/dpu: Remove unused INTF0 interrupt mask from SM6115/QCM2290
      drm/msm/dpu: Remove TE2 block and feature from DPU >= 7.0.0 hardware
      drm/msm/dpu: Move non-MDP_TOP INTF_INTR offsets out of hwio header
      drm/msm/dpu: Fix PP_BLK_DIPHER -> DITHER typo
      drm/msm/dpu: Remove duplicate register defines from INTF
      drm/msm/dpu: Remove extraneous register define indentation
      drm/msm/dpu: Sort INTF registers numerically
      drm/msm/dpu: Drop unused poll_timeout_wr_ptr PINGPONG callback
      drm/msm/dpu: Move autorefresh disable from CMD encoder to pingpong
      drm/msm/dpu: Disable pingpong TE on DPU 5.0.0 and above
      drm/msm/dpu: Disable MDP vsync source selection on DPU 5.0.0 and above
      drm/msm/dpu: Factor out shared interrupt register in INTF_BLK macro
      drm/msm/dpu: Document and enable TEAR interrupts on DSI interfaces
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  32 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 268 ++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  25 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  48 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |  83 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |  64 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  52 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h           |   3 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  14 ++
 29 files changed, 909 insertions(+), 410 deletions(-)
---
base-commit: 4aa1da8d99724f6c0b762b58a71cee7c5e2e109b
change-id: 20230411-dpu-intf-te-ea684f13e083

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>

