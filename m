Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA77848FCE
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 18:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D2510F911;
	Sun,  4 Feb 2024 17:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E2510F911;
 Sun,  4 Feb 2024 17:45:32 +0000 (UTC)
Received: from Marijn-Arch-Book.localdomain
 (2a02-a420-67-c93f-164f-8aff-fee4-5930.mobile6.kpn.net
 [IPv6:2a02:a420:67:c93f:164f:8aff:fee4:5930])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7360D3F092;
 Sun,  4 Feb 2024 18:45:28 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 04 Feb 2024 18:45:27 +0100
Subject: [PATCH] drm/msm/dpu: Only enable DSC_MODE_MULTIPLEX if dsc_merge
 is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240204-dpu-dsc-multiplex-v1-1-080963233c52@somainline.org>
X-B4-Tracking: v=1; b=H4sIADbNv2UC/x3MQQqAIBBA0avErBswE6KuEi1KxxowE80IorsnL
 d/i/wcSRaYEQ/VApIsTH76gqSvQ2+xXQjbFIIVUQgqFJmQ0SeOe3cnB0Y2q141auta2JKB0IZL
 l+3+O0/t+A1HiRmMAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.12.4
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the topology calls for two interfaces on the current fixed topology
of 2 DSC blocks, or uses 1 DSC block for a single interface (e.g. SC7280
with only one DSC block), there should be no merging of DSC output.

This is already represented by the return value of
dpu_encoder_use_dsc_merge(), but not yet used to correctly configure
this flag.

Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
Note that more changes are needed to properly support the proposed 2:2:2
and 1:1:1 topology (in contrast to the already-supported 2:2:1 topology),
but this could be a trivial patch to get going separately before all that
extra work is done.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 83380bc92a00..6d3ed4d870d7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1857,7 +1857,9 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	dsc_common_mode = 0;
 	pic_width = dsc->pic_width;
 
-	dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
+	dsc_common_mode = DSC_MODE_SPLIT_PANEL;
+	if (dpu_encoder_use_dsc_merge(enc_master->parent))
+		dsc_common_mode |= DSC_MODE_MULTIPLEX;
 	if (enc_master->intf_mode == INTF_MODE_VIDEO)
 		dsc_common_mode |= DSC_MODE_VIDEO;
 

---
base-commit: 01af33cc9894b4489fb68fa35c40e9fe85df63dc
change-id: 20240204-dpu-dsc-multiplex-49c14b73f3e0

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>

