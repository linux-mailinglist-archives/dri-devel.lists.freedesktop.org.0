Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A610A64C086
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 00:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D795110E387;
	Tue, 13 Dec 2022 23:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7614010E387
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 23:22:50 +0000 (UTC)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B691E1F99C;
 Wed, 14 Dec 2022 00:22:16 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
Subject: [RFC PATCH 0/6] drm/msm: DSC Electric Boogaloo for sm8[12]50
Date: Wed, 14 Dec 2022 00:22:01 +0100
Message-Id: <20221213232207.113607-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.38.1
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Haowen Bai <baihaowen@meizu.com>,
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This preliminary Display Stream Compression support package for
(initially tested on) sm8[12]50 is based on comparing DSC behaviour
between downstream and mainline.  Some new callbacks are added (for
binding blocks on active CTLs), logic bugs are corrected, zeroed struct
members are now assigned proper values, and RM allocation and hw block
retrieval now hand out (or not) DSC blocks without causing null-pointer
dereferences.

Unfortunately it is not yet enough to get rid of completely corrupted
display output on the boards I tested here:
- Sony Xperia 1 (sm8150), 1644x3840 or 1096x2560 pixels;
- Sony Xperia 5II (sm8250), 1080x2520, at 60 or 120Hz;
- (can include more Xperia boards if desired)

Both devices use the DUALPIPE_DSCMERGE topology downstream: dual LM, PP
and DSC, but only a single INTF/encoder/DSI-link.

Hopefully this spawns some community/upstream interest to help rootcause
our corruption issues (after we open a drm/msm report on GitLab for more
appropriate tracking).

The Sony Xperia XZ3 (sdm845) was fully tested and validated with this
series to not cause any regressions (an one of the math fixes now allows
us to change slice_count in the panel driver, which would corrupt
previously).

Marijn Suijten (6):
  drm/msm/dpu1: Implement DSC binding to PP block for CTL V1
  drm/msm/dpu1: Add DSC config for sm8150 and sm8250
  drm/msm/dpu1: Wire up DSC mask for active CTL configuration
  drm/msm/dsi: Use DSC slice(s) packet size to compute word count
  drm/msm/dsi: Flip greater-than check for slice_count and
    slice_per_intf
  drm/msm/dpu: Disallow unallocated (DSC) resources to be returned

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  3 +++
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  1 +
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  1 +
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  2 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 23 +++++++++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  9 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 27 +++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |  4 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 10 +++++++
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  6 ++---
 10 files changed, 77 insertions(+), 9 deletions(-)

--
2.38.1

