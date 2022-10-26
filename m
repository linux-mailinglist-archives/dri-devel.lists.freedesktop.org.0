Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCD660E743
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 20:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC62310E6E4;
	Wed, 26 Oct 2022 18:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D67D10E5CB;
 Wed, 26 Oct 2022 18:28:37 +0000 (UTC)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 882063F33A;
 Wed, 26 Oct 2022 20:28:33 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 00/10] drm/msm: Fix math issues in MSM DSC implementation
Date: Wed, 26 Oct 2022 20:28:14 +0200
Message-Id: <20221026182824.876933-1-marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Various removals of complex yet unnecessary math, fixing all uses of
drm_dsc_config::bits_per_pixel to deal with the fact that this field
includes four fractional bits, and finally making sure that
range_bpg_offset contains values 6-bits wide to prevent overflows in
drm_dsc_pps_payload_pack().

Altogether this series is responsible for solving _all_ Display Stream
Compression issues and artifacts on the Sony Tama (sdm845) Akatsuki
smartphone (2880x1440p).

Changes since v3:
- Swap patch 7 and 8 to make sure msm_host is available inside
  dsi_populate_dsc_params();
- Reword patch 6 (Migrate to drm_dsc_compute_rc_parameters()) to more
  clearly explain why the FIXME wasn't solved initially, but why it can
  (and should!) be resolved now.

v3: https://lore.kernel.org/linux-arm-msm/20221009184824.457416-1-marijn.suijten@somainline.org/T/#u

Changes since v2:
- Generalize mux_word_size setting depending on bits_per_component;
- Migrate DSI's DSC calculations to drm_dsc_compute_rc_parameters(),
  implicitly addressing existing math issues;
- Disallow any bits_per_component other than 8, until hardcoded values
  are updated and tested to support such cases.

v2: https://lore.kernel.org/linux-arm-msm/20221005181657.784375-1-marijn.suijten@somainline.org/T/#u

Changes since v1:

- Propagate r-b's, except (obviously) in patches that were (heavily)
  modified;
- Remove accidental debug code in dsi_cmd_dma_add;
- Move Range BPG Offset masking out of DCS PPS packing, back into the
  DSI driver when it is assigned to drm_dsc_config (this series is now
  strictly focusing on drm/msm again);
- Replace modulo-check resulting in conditional increment with
  DIV_ROUND_UP;
- Remove repeated calculation of slice_chunk_size;
- Use u16 instead of int when handling bits_per_pixel;
- Use DRM_DEV_ERROR instead of pr_err in DSI code;
- Also remove redundant target_bpp_x16 variable.

v1: https://lore.kernel.org/linux-arm-msm/20221001190807.358691-1-marijn.suijten@somainline.org/T/#u

Marijn Suijten (10):
  drm/msm/dsi: Remove useless math in DSC calculations
  drm/msm/dsi: Remove repeated calculation of slice_per_intf
  drm/msm/dsi: Use DIV_ROUND_UP instead of conditional increment on
    modulo
  drm/msm/dsi: Reuse earlier computed dsc->slice_chunk_size
  drm/msm/dsi: Appropriately set dsc->mux_word_size based on bpc
  drm/msm/dsi: Migrate to drm_dsc_compute_rc_parameters()
  drm/msm/dsi: Account for DSC's bits_per_pixel having 4 fractional bits
  drm/msm/dsi: Disallow 8 BPC DSC configuration for alternative BPC
    values
  drm/msm/dpu1: Account for DSC's bits_per_pixel having 4 fractional
    bits
  drm/msm/dsi: Prevent signed BPG offsets from bleeding into adjacent
    bits

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c |  11 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c         | 121 ++++++---------------
 2 files changed, 37 insertions(+), 95 deletions(-)

--
2.38.1

