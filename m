Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB73ABCAC09
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 22:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC9E10EB08;
	Thu,  9 Oct 2025 20:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="YDAMtM0x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr
 [80.12.242.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9A510EB04;
 Thu,  9 Oct 2025 20:09:39 +0000 (UTC)
Received: from fedora ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
 by smtp.orange.fr with ESMTPA
 id 6wxDv47sFn3LW6wxEv5BUC; Thu, 09 Oct 2025 22:09:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1760040578;
 bh=vdngJh840tLkhFfzkI4vmR2f7NaB/3n76TsJ3oZYjGk=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=YDAMtM0xZMWyEyZyFOpLw3BPZcgOCTeNhBmVMuEp+UkHWCM0ozvZxecpUC7n9H7kh
 yR7dQpViv8LJDXDzIufxxZtY+g5rxaiZaWHTCTSKr9PT4fbLyGYpApgrBInpW7gkCA
 GBqefHBgpVMd1hC0XLiEcbF3IuwkJqCxI5/zTjkG8YqXXBTFtlUCf8mux+DlYWZN1i
 njzyx68pxSjAg37NCU5CPYxWCkcliygO19GFqM6mezHSQ9L+qnxl3/Z9E04nAc+w9k
 stta+Wy/Fx1v3UqysT8i40J/2tfPKN8P82HFxTVVMkW5HhUi0ZOHNJWsu9sUladSkG
 gRbycFMByQEew==
X-ME-Helo: fedora
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 09 Oct 2025 22:09:38 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: Remove dead-code in
 dpu_encoder_helper_reset_mixers()
Date: Thu,  9 Oct 2025 22:09:32 +0200
Message-ID: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.51.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'mixer' is only zeroed and is not use. Remove it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 258edaa18fc0..94de83e125f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2171,15 +2171,12 @@ void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
 
 static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 {
-	struct dpu_hw_mixer_cfg mixer;
 	int i, num_lm;
 	struct dpu_global_state *global_state;
 	struct dpu_hw_blk *hw_lm[2];
 	struct dpu_hw_mixer *hw_mixer[2];
 	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
 
-	memset(&mixer, 0, sizeof(mixer));
-
 	/* reset all mixers for this encoder */
 	if (ctl->ops.clear_all_blendstages)
 		ctl->ops.clear_all_blendstages(ctl);
-- 
2.51.0

