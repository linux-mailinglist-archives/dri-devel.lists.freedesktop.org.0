Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD395F8D7A
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 20:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BE610E096;
	Sun,  9 Oct 2022 18:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CB410E53F
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 18:53:38 +0000 (UTC)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E7C1A1F95B;
 Sun,  9 Oct 2022 20:53:36 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org
Subject: [PATCH v3 09/10] drm/msm/dpu1: Account for DSC's bits_per_pixel
 having 4 fractional bits
Date: Sun,  9 Oct 2022 20:53:14 +0200
Message-Id: <20221009185316.462522-2-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221009184824.457416-1-marijn.suijten@somainline.org>
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
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
Cc: Vinod Koul <vkoul@kernel.org>, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to the comment this DPU register contains the bits per pixel
as a 6.4 fractional value, conveniently matching the contents of
bits_per_pixel in struct drm_dsc_config which also uses 4 fractional
bits.  However, the downstream source this implementation was
copy-pasted from has its bpp field stored _without_ fractional part.

This makes the entire convoluted math obsolete as it is impossible to
pull those 4 fractional bits out of thin air, by somehow trying to reuse
the lowest 2 bits of a non-fractional bpp (lsb = bpp % 4??).

The rest of the code merely attempts to keep the integer part a multiple
of 4, which is rendered useless thanks to data |= dsc->bits_per_pixel <<
12; already filling up those bits anyway (but not on downstream).

Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 46cc2afd2bb9..c63e6eef1ba6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -47,7 +47,7 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
 			      u32 initial_lines)
 {
 	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
-	u32 data, lsb, bpp;
+	u32 data;
 	u32 slice_last_group_size;
 	u32 det_thresh_flatness;
 	bool is_cmd_mode = !(mode & DSC_MODE_VIDEO);
@@ -61,14 +61,7 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
 	data = (initial_lines << 20);
 	data |= ((slice_last_group_size - 1) << 18);
 	/* bpp is 6.4 format, 4 LSBs bits are for fractional part */
-	data |= dsc->bits_per_pixel << 12;
-	lsb = dsc->bits_per_pixel % 4;
-	bpp = dsc->bits_per_pixel / 4;
-	bpp *= 4;
-	bpp <<= 4;
-	bpp |= lsb;
-
-	data |= bpp << 8;
+	data |= (dsc->bits_per_pixel << 8);
 	data |= (dsc->block_pred_enable << 7);
 	data |= (dsc->line_buf_depth << 3);
 	data |= (dsc->simple_422 << 2);
-- 
2.38.0

