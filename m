Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AED355E31
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 23:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75746E8CB;
	Tue,  6 Apr 2021 21:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E2B6E8CA
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 21:47:44 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id CB5CB3F3EF;
 Tue,  6 Apr 2021 23:47:39 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org
Subject: [PATCH 1/3] drm/msm/mdp5: Configure PP_SYNC_HEIGHT to double the
 vtotal
Date: Tue,  6 Apr 2021 23:47:24 +0200
Message-Id: <20210406214726.131534-2-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406214726.131534-1-marijn.suijten@somainline.org>
References: <20210406214726.131534-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Leaving this at a close-to-maximum register value 0xFFF0 means it takes
very long for the MDSS to generate a software vsync interrupt when the
hardware TE interrupt doesn't arrive.  Configuring this to double the
vtotal (like some downstream kernels) leads to a frame to take at most
twice before the vsync signal, until hardware TE comes up.

In this case the hardware interrupt responsible for providing this
signal - "disp-te" gpio - is not hooked up to the mdp5 vsync/pp logic at
all.  This solves severe panel update issues observed on at least the
Xperia Loire and Tone series, until said gpio is properly hooked up to
an irq.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
index ff2c1d583c79..2d5ac03dbc17 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
@@ -51,7 +51,7 @@ static int pingpong_tearcheck_setup(struct drm_encoder *encoder,
 
 	mdp5_write(mdp5_kms, REG_MDP5_PP_SYNC_CONFIG_VSYNC(pp_id), cfg);
 	mdp5_write(mdp5_kms,
-		REG_MDP5_PP_SYNC_CONFIG_HEIGHT(pp_id), 0xfff0);
+		REG_MDP5_PP_SYNC_CONFIG_HEIGHT(pp_id), (2 * mode->vtotal));
 	mdp5_write(mdp5_kms,
 		REG_MDP5_PP_VSYNC_INIT_VAL(pp_id), mode->vdisplay);
 	mdp5_write(mdp5_kms, REG_MDP5_PP_RD_PTR_IRQ(pp_id), mode->vdisplay + 1);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
