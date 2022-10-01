Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE715F1EEF
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 21:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BED10E08D;
	Sat,  1 Oct 2022 19:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F01A10E2A3;
 Sat,  1 Oct 2022 19:08:26 +0000 (UTC)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id CEFA320374;
 Sat,  1 Oct 2022 21:08:23 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 3/5] drm/msm/dsi: Account for DSC's bits_per_pixel having 4
 fractional bits
Date: Sat,  1 Oct 2022 21:08:05 +0200
Message-Id: <20221001190807.358691-4-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001190807.358691-1-marijn.suijten@somainline.org>
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
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
 Douglas Anderson <dianders@chromium.org>,
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

drm_dsc_config's bits_per_pixel field holds a fractional value with 4
bits, which all panel drivers should adhere to for
drm_dsc_pps_payload_pack() to generate a valid payload.  All code in the
DSI driver here seems to assume that this field doesn't contain any
fractional bits, hence resulting in the wrong values being computed.
Since none of the calculations leave any room for fractional bits or
seem to indicate any possible area of support, disallow such values
altogether.

Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 34 +++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index cb6f2fa11f58..42a5c9776f52 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -847,6 +847,11 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	u32 pkt_per_line;
 	u32 bytes_in_slice;
 	u32 eol_byte_num;
+	int bpp = dsc->bits_per_pixel >> 4;
+
+	if (dsc->bits_per_pixel & 0xf)
+		/* dsi_populate_dsc_params() already caught this case */
+		pr_err("DSI does not support fractional bits_per_pixel\n");
 
 	/* first calculate dsc parameters and then program
 	 * compress mode registers
@@ -860,7 +865,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	if (slice_per_intf > dsc->slice_count)
 		dsc->slice_count = 1;
 
-	bytes_in_slice = DIV_ROUND_UP(dsc->slice_width * dsc->bits_per_pixel, 8);
+	bytes_in_slice = DIV_ROUND_UP(dsc->slice_width * bpp, 8);
 
 	dsc->slice_chunk_size = bytes_in_slice;
 
@@ -913,6 +918,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 	u32 va_end = va_start + mode->vdisplay;
 	u32 hdisplay = mode->hdisplay;
 	u32 wc;
+	int ret;
 
 	DBG("");
 
@@ -948,7 +954,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		/* we do the calculations for dsc parameters here so that
 		 * panel can use these parameters
 		 */
-		dsi_populate_dsc_params(dsc);
+		ret = dsi_populate_dsc_params(dsc);
+		if (ret)
+			return;
 
 		/* Divide the display by 3 but keep back/font porch and
 		 * pulse width same
@@ -1229,6 +1237,10 @@ static int dsi_cmd_dma_add(struct msm_dsi_host *msm_host,
 	if (packet.size < len)
 		memset(data + packet.size, 0xff, len - packet.size);
 
+	if (msg->type == MIPI_DSI_PICTURE_PARAMETER_SET)
+		print_hex_dump(KERN_DEBUG, "ALL:", DUMP_PREFIX_NONE,
+				16, 1, data, len, false);
+
 	if (cfg_hnd->ops->tx_buf_put)
 		cfg_hnd->ops->tx_buf_put(msm_host);
 
@@ -1786,6 +1798,12 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
 	int data;
 	int final_value, final_scale;
 	int i;
+	int bpp = dsc->bits_per_pixel >> 4;
+
+	if (dsc->bits_per_pixel & 0xf) {
+		pr_err("DSI does not support fractional bits_per_pixel\n");
+		return -EINVAL;
+	}
 
 	dsc->rc_model_size = 8192;
 	dsc->first_line_bpg_offset = 12;
@@ -1807,7 +1825,7 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
 	}
 
 	dsc->initial_offset = 6144; /* Not bpp 12 */
-	if (dsc->bits_per_pixel != 8)
+	if (bpp != 8)
 		dsc->initial_offset = 2048;	/* bpp = 12 */
 
 	mux_words_size = 48;		/* bpc == 8/10 */
@@ -1830,16 +1848,16 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
 	 * params are calculated
 	 */
 	groups_per_line = DIV_ROUND_UP(dsc->slice_width, 3);
-	dsc->slice_chunk_size = dsc->slice_width * dsc->bits_per_pixel / 8;
-	if ((dsc->slice_width * dsc->bits_per_pixel) % 8)
+	dsc->slice_chunk_size = dsc->slice_width * bpp / 8;
+	if ((dsc->slice_width * bpp) % 8)
 		dsc->slice_chunk_size++;
 
 	/* rbs-min */
 	min_rate_buffer_size =  dsc->rc_model_size - dsc->initial_offset +
-				dsc->initial_xmit_delay * dsc->bits_per_pixel +
+				dsc->initial_xmit_delay * bpp +
 				groups_per_line * dsc->first_line_bpg_offset;
 
-	hrd_delay = DIV_ROUND_UP(min_rate_buffer_size, dsc->bits_per_pixel);
+	hrd_delay = DIV_ROUND_UP(min_rate_buffer_size, bpp);
 
 	dsc->initial_dec_delay = hrd_delay - dsc->initial_xmit_delay;
 
@@ -1862,7 +1880,7 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
 	data = 2048 * (dsc->rc_model_size - dsc->initial_offset + num_extra_mux_bits);
 	dsc->slice_bpg_offset = DIV_ROUND_UP(data, groups_total);
 
-	target_bpp_x16 = dsc->bits_per_pixel * 16;
+	target_bpp_x16 = bpp * 16;
 
 	data = (dsc->initial_xmit_delay * target_bpp_x16) / 16;
 	final_value =  dsc->rc_model_size - data + num_extra_mux_bits;
-- 
2.37.3

