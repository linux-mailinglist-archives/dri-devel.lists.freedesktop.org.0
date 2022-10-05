Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1145F59B9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 20:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC3810E73C;
	Wed,  5 Oct 2022 18:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3554D10E741
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 18:17:27 +0000 (UTC)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 9BF103EF3C;
 Wed,  5 Oct 2022 20:17:24 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 7/7] drm/msm/dsi: Prevent signed BPG offsets from bleeding
 into adjacent bits
Date: Wed,  5 Oct 2022 20:16:57 +0200
Message-Id: <20221005181657.784375-8-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221005181657.784375-1-marijn.suijten@somainline.org>
References: <20221005181657.784375-1-marijn.suijten@somainline.org>
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
 Javier Martinez Canillas <javierm@redhat.com>, David Airlie <airlied@linux.ie>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bpg_offset array contains negative BPG offsets which fill the full 8
bits of a char thanks to two's complement: this however results in those
bits bleeding into the next field when the value is packed into DSC PPS
by the drm_dsc_helper function, which only expects range_bpg_offset to
contain 6-bit wide values.  As a consequence random slices appear
corrupted on-screen (tested on a Sony Tama Akatsuki device with sdm845).

Use AND operators to limit these two's complement values to 6 bits,
similar to the AMD and i915 drivers.

Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 4717d49d76be..b3cff3d3aa85 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1806,7 +1806,11 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
 		dsc->rc_range_params[i].range_min_qp = min_qp[i];
 		dsc->rc_range_params[i].range_max_qp = max_qp[i];
-		dsc->rc_range_params[i].range_bpg_offset = bpg_offset[i];
+		/*
+		 * Range BPG Offset contains two's-complement signed values that fill
+		 * 8 bits, yet the registers and DCS PPS field are only 6 bits wide.
+		 */
+		dsc->rc_range_params[i].range_bpg_offset = bpg_offset[i] & DSC_RANGE_BPG_OFFSET_MASK;
 	}
 
 	dsc->initial_offset = 6144; /* Not bpp 12 */
-- 
2.38.0

