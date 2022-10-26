Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF97560E74F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 20:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E0510E703;
	Wed, 26 Oct 2022 18:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09A210E6E4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 18:28:37 +0000 (UTC)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3A52E3F412;
 Wed, 26 Oct 2022 20:28:35 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 01/10] drm/msm/dsi: Remove useless math in DSC calculations
Date: Wed, 26 Oct 2022 20:28:15 +0200
Message-Id: <20221026182824.876933-2-marijn.suijten@somainline.org>
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

Multiplying a value by 2 and adding 1 to it always results in a value
that is uneven, and that 1 gets truncated immediately when performing
integer division by 2 again.  There is no "rounding" possible here.

After that target_bpp_x16 is used to store a multiplication of
bits_per_pixel by 16 which is only ever read to immediately be divided
by 16 again, and is elided in much the same way.

Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e82eef031ed4..d645fcbb0683 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1784,7 +1784,6 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
 	int hrd_delay;
 	int pre_num_extra_mux_bits, num_extra_mux_bits;
 	int slice_bits;
-	int target_bpp_x16;
 	int data;
 	int final_value, final_scale;
 	int i;
@@ -1864,14 +1863,7 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
 	data = 2048 * (dsc->rc_model_size - dsc->initial_offset + num_extra_mux_bits);
 	dsc->slice_bpg_offset = DIV_ROUND_UP(data, groups_total);
 
-	/* bpp * 16 + 0.5 */
-	data = dsc->bits_per_pixel * 16;
-	data *= 2;
-	data++;
-	data /= 2;
-	target_bpp_x16 = data;
-
-	data = (dsc->initial_xmit_delay * target_bpp_x16) / 16;
+	data = dsc->initial_xmit_delay * dsc->bits_per_pixel;
 	final_value =  dsc->rc_model_size - data + num_extra_mux_bits;
 	dsc->final_offset = final_value;
 
-- 
2.38.1

