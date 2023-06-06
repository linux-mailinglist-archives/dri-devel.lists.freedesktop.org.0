Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAB5723BDB
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 10:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504A610E304;
	Tue,  6 Jun 2023 08:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CE310E2F0
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 08:33:10 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30ae967ef74so4569554f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 01:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686040388; x=1688632388;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HGNvezJMXfjn7ToqqZuXUFZItGnK+ZI8rSYUZp66fL0=;
 b=ebW+dZ4PFwVmuzs+A/1mErcEfwlk42eaHMnN0FTXdU4DToHNMqjg4hps7BaomOmmnG
 ULeztuZ667nKmYkB8ryIIMId0Ya0i1cXnLd/2Jms6MjS7sKP1cyJAOU6jeF085HhLoTY
 lRn40UYUUe074EBieFDm8LmII0z3VjGADQOBO416duu0D4HLC/dxSxgOShk3e9tnQu6G
 z7cIOOTpWmTUCCKwHUfk/AY8KznVOufjFOyrDOcxDNKRzEAmuKQ+1SEEhsDwkOAvnlKK
 SOeWPzLVkwYxz5X6SCq/3oB97ZfRVn3MS5PjBh6rNiLAom3mBQQdr8q4n7gRCRwvF5dc
 wi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686040388; x=1688632388;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HGNvezJMXfjn7ToqqZuXUFZItGnK+ZI8rSYUZp66fL0=;
 b=CMRM1zmm5y9LN6+NCt6L3SVW0WfPPZhg3WWT3LHdRQ+M2v/pYT5XVcqEhqFio14eoR
 SfsIguVPTGr1whEVPom8L9vOxIDZ1f1oOgSvRjcUL5jOMLVOnoRNDqHEmtXxd98tMrr8
 OKVR8Ninvm3Okfrgd/HvKOGPRk2UuRy0U8p7Vs8WU2g07ZuhMZp3cH0U+RcLbT7Nw2LH
 FlgkjFRitg1VGXgsKoC3FCiVqkQ5hgB0uO71EXHPgvg0YvJGNiL3ZNUMHzlLkV37Gg34
 4lp4ABmlgFSwIO0iqO78V2mBWrE924KD+ZvNFZcbw/5RqiBBZvix92qbnVFKxMawKNMR
 UVdQ==
X-Gm-Message-State: AC+VfDzk/lqdDUEyOtBAvXlAHR9bFIBoG2B3GDai0VxK4uyUIaJwI9v5
 Mg+xx8O6dKjoNWm86Tn481kCmw==
X-Google-Smtp-Source: ACHHUZ69J8r5vJcWEWXn2VmWqlCRB7PTWJZj88krqf7/cGT0YE5tj+fKqFHTvwx1gzn5SpOc8uSZ5g==
X-Received: by 2002:adf:fccb:0:b0:30c:2bbf:bf75 with SMTP id
 f11-20020adffccb000000b0030c2bbfbf75mr1071217wrs.26.1686040388227; 
 Tue, 06 Jun 2023 01:33:08 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 l24-20020a1ced18000000b003f31cb7a203sm13443342wmh.14.2023.06.06.01.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 01:33:07 -0700 (PDT)
Date: Tue, 6 Jun 2023 11:33:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm/dpu: tidy up some error checking
Message-ID: <ZH7vP2Swu8CYpgUL@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "vsync_hz" variable is unsigned int so it can't be less
than zero.  The dpu_kms_get_clk_rate() function used to return a u64
but I previously changed it to return an unsigned long and zero on
error so it matches clk_get_rate().

Change the "vsync_hz" type to unsigned long as well and change the
error checking to check for zero instead of negatives.  This change
does not affect runtime at all.  It's just a clean up.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index d8ed85a238af..6aecaba14e7e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -324,7 +324,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	struct dpu_hw_tear_check tc_cfg = { 0 };
 	struct drm_display_mode *mode;
 	bool tc_enable = true;
-	u32 vsync_hz;
+	unsigned long vsync_hz;
 	struct dpu_kms *dpu_kms;
 
 	if (phys_enc->has_intf_te) {
@@ -359,8 +359,8 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	 * frequency divided by the no. of rows (lines) in the LCDpanel.
 	 */
 	vsync_hz = dpu_kms_get_clk_rate(dpu_kms, "vsync");
-	if (vsync_hz <= 0) {
-		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %u\n",
+	if (!vsync_hz) {
+		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %lu\n",
 				 vsync_hz);
 		return;
 	}
@@ -381,7 +381,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	tc_cfg.rd_ptr_irq = mode->vdisplay + 1;
 
 	DPU_DEBUG_CMDENC(cmd_enc,
-		"tc vsync_clk_speed_hz %u vtotal %u vrefresh %u\n",
+		"tc vsync_clk_speed_hz %lu vtotal %u vrefresh %u\n",
 		vsync_hz, mode->vtotal, drm_mode_vrefresh(mode));
 	DPU_DEBUG_CMDENC(cmd_enc,
 		"tc enable %u start_pos %u rd_ptr_irq %u\n",
-- 
2.39.2

