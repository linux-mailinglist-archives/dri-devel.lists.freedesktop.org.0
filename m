Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD4365A728
	for <lists+dri-devel@lfdr.de>; Sat, 31 Dec 2022 22:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4FA10E14E;
	Sat, 31 Dec 2022 21:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4007710E144
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Dec 2022 21:50:26 +0000 (UTC)
Received: from localhost.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4E05D3ED63;
 Sat, 31 Dec 2022 22:50:18 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [RFC PATCH 0/7] drm/msm/dpu: Implement tearcheck support on INTF block
Date: Sat, 31 Dec 2022 22:49:59 +0100
Message-Id: <20221231215006.211860-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.39.0
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
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

Konrad Dybcio (1):
  drm/msm/dpu: Move dpu_hw_{tear_check,pp_vsync_info} to dpu_hw_mdss.h

Marijn Suijten (6):
  drm/msm/dpu: Remove unused INTF0 interrupt mask from sm6115/qcm2290
  drm/msm/dpu: Disable pingpong TE on DPU 5.0.0 and above
  drm/msm/dpu: Disable MDP vsync source selection on DPU 5.0.0 and above
  drm/msm/dpu: Document and enable TEAR interrupts on DSI interfaces
  drm/msm/dpu: Implement tearcheck support on INTF block
  drm/msm/dpu: Remove intr_rdptr from DPU >= 5.0.0 pingpong config

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  11 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  10 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 108 +++++++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 181 +++++++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   7 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  12 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 206 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  29 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  48 ++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  18 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  22 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  52 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h      |   3 +
 14 files changed, 570 insertions(+), 139 deletions(-)

--
2.39.0

