Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8385760E762
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 20:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B430510E711;
	Wed, 26 Oct 2022 18:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7767310E6EE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 18:28:47 +0000 (UTC)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7E8D03F73D;
 Wed, 26 Oct 2022 20:28:45 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 07/10] drm/msm/dsi: Account for DSC's bits_per_pixel having
 4 fractional bits
Date: Wed, 26 Oct 2022 20:28:21 +0200
Message-Id: <20221026182824.876933-8-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221026182824.876933-1-marijn.suijten@somainline.org>
References: <20221026182824.876933-1-marijn.suijten@somainline.org>
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
Cc: Marek Vasut <marex@denx.de>, freedreno@lists.freedesktop.org,
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

drm_dsc_config's bits_per_pixel field holds a fractional value with 4
bits, which all panel drivers should adhere to for
drm_dsc_pps_payload_pack() to generate a valid payload.  All code in the
DSI driver here seems to assume that this field doesn't contain any
fractional bits, hence resulting in the wrong values being computed.
Since none of the calculations leave any room for fractional bits or
seem to indicate any possible area of support, disallow such values
altogether.  calculate_rc_params() in intel_vdsc.c performs an identical
bitshift to get at this integer value.

Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 0d130bded38d..8da27c740c1c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -34,7 +34,7 @@
 
 #define DSI_RESET_TOGGLE_DELAY_MS 20
 
-static int dsi_populate_dsc_params(struct drm_dsc_config *dsc);
+static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc_config *dsc);
 
 static int dsi_get_version(const void __iomem *base, u32 *major, u32 *minor)
 {
@@ -909,6 +909,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 	u32 va_end = va_start + mode->vdisplay;
 	u32 hdisplay = mode->hdisplay;
 	u32 wc;
+	int ret;
 
 	DBG("");
 
@@ -944,7 +945,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		/* we do the calculations for dsc parameters here so that
 		 * panel can use these parameters
 		 */
-		dsi_populate_dsc_params(dsc);
+		ret = dsi_populate_dsc_params(msm_host, dsc);
+		if (ret)
+			return;
 
 		/* Divide the display by 3 but keep back/font porch and
 		 * pulse width same
@@ -1770,9 +1773,15 @@ static char bpg_offset[DSC_NUM_BUF_RANGES] = {
 	2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
 };
 
-static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
+static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc_config *dsc)
 {
 	int i;
+	u16 bpp = dsc->bits_per_pixel >> 4;
+
+	if (dsc->bits_per_pixel & 0xf) {
+		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support fractional bits_per_pixel\n");
+		return -EINVAL;
+	}
 
 	dsc->rc_model_size = 8192;
 	dsc->first_line_bpg_offset = 12;
@@ -1793,8 +1802,8 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
 		dsc->rc_range_params[i].range_bpg_offset = bpg_offset[i];
 	}
 
-	dsc->initial_offset = 6144; /* Not bpp 12 */
-	if (dsc->bits_per_pixel != 8)
+	dsc->initial_offset = 6144;		/* Not bpp 12 */
+	if (bpp != 8)
 		dsc->initial_offset = 2048;	/* bpp = 12 */
 
 	if (dsc->bits_per_component <= 10)
-- 
2.38.1

