Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 105DE5F59B7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 20:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691F010E736;
	Wed,  5 Oct 2022 18:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B4510E730
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 18:17:11 +0000 (UTC)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id CC8EB3F5B8;
 Wed,  5 Oct 2022 20:17:08 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 0/7] drm/msm: Fix math issues in MSM DSC implementation
Date: Wed,  5 Oct 2022 20:16:50 +0200
Message-Id: <20221005181657.784375-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.38.0
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
Cc: freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
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

Marijn Suijten (7):
  drm/msm/dsi: Remove useless math in DSC calculations
  drm/msm/dsi: Remove repeated calculation of slice_per_intf
  drm/msm/dsi: Use DIV_ROUND_UP instead of conditional increment on
    modulo
  drm/msm/dsi: Reuse earlier computed dsc->slice_chunk_size
  drm/msm/dsi: Account for DSC's bits_per_pixel having 4 fractional bits
  drm/msm/dpu1: Account for DSC's bits_per_pixel having 4 fractional
    bits
  drm/msm/dsi: Prevent signed BPG offsets from bleeding into adjacent
    bits

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 11 +----
 drivers/gpu/drm/msm/dsi/dsi_host.c         | 56 ++++++++++------------
 2 files changed, 28 insertions(+), 39 deletions(-)

--
2.38.0

