Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLB9KXiaeGk9rQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:59:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593CE9342F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185D110E0D2;
	Tue, 27 Jan 2026 10:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ngkREVgu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9539E10E51A;
 Tue, 27 Jan 2026 10:59:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 445D5407D0;
 Tue, 27 Jan 2026 10:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E71C116C6;
 Tue, 27 Jan 2026 10:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769511540;
 bh=0i2nH7Z+Jm/vbR+qFCnPX1IGIFt8Sm49hrVD9er0bwQ=;
 h=From:Date:Subject:To:Cc:From;
 b=ngkREVguznNQxpEPFD7I0KcA64CARW4APVYOrDA020nRlXk/HW0az/2EPEQqWDEux
 d5C0cAwJIyDDDr7YJa27ybtyal57cyJ4oKbNQD0n2sW7ryYEUc81TiCN9O4eCW7ME2
 C0XkBjgQSKBcyUrjBeytEo/tMX1sIE6KyMxx6zR6E4OUnfhmSRvY73tjUo736SWZsN
 SXeGFpu6ju723AnyxQLhZfap4I1fTTo2+tSv951LiR58jBNPgjvWWjRBUGbhIKT3/9
 vlqtZW1BkZDwkzt6vUXfd6BKqi0uB2tc8w/4OfXqlpgfIxURIIBVRejho6szKir08e
 mqRziSvZOiCOw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 27 Jan 2026 11:58:49 +0100
Subject: [PATCH] drm/msm/dpu: Fix LM size on a number of platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-topic-lm_size_fix-v1-1-25f88d014dfd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MWwqAIBAAryL7naB+2OMqEVK61UJZaEQk3j3pc
 wZmEkQMhBE6liDgTZEOX0BWDOw6+gU5ucKghNJCqppfx0mWb7uJ9KKZ6eFOo1VCT41zLZTuDFj
 0/+yHnD8UlASrYwAAAA==
X-Change-ID: 20260127-topic-lm_size_fix-d6ec206b8dd9
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769511535; l=11008;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=XB73+kA+RbsS6hWgZGE1XQzO2Ccd74+TrD3sPEdK+pQ=;
 b=oJ9UZ6Twim06vzNiQ8eGdESflArxxuxfEv69tO04jYL6MZM+QAdbKPLi4JTsmhJEyqNr5erBl
 sgqgLmIiHS+ARHk1KgXmLsSAoRFwKw5hBSqsaQ7CVIJTjg5qq2Te8SB
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,linaro.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 593CE9342F
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The register space has grown with what seems to be DPU8.
Bump up the .len to match.

Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Fixes: 178575173472 ("drm/msm/dpu: add catalog entry for SAR2130P")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
compile-tested only
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 12 ++++++------
 5 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 303d33dc7783..9f2bceca1789 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -133,7 +133,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 static const struct dpu_lm_cfg sc8280xp_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
-		.base = 0x44000, .len = 0x320,
+		.base = 0x44000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
@@ -141,7 +141,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 		.dspp = DSPP_0,
 	}, {
 		.name = "lm_1", .id = LM_1,
-		.base = 0x45000, .len = 0x320,
+		.base = 0x45000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
@@ -149,7 +149,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 		.dspp = DSPP_1,
 	}, {
 		.name = "lm_2", .id = LM_2,
-		.base = 0x46000, .len = 0x320,
+		.base = 0x46000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
@@ -157,7 +157,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
-		.base = 0x47000, .len = 0x320,
+		.base = 0x47000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
@@ -165,14 +165,14 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
-		.base = 0x48000, .len = 0x320,
+		.base = 0x48000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
-		.base = 0x49000, .len = 0x320,
+		.base = 0x49000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index b09a6af4c474..04b22167f93d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -134,7 +134,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 static const struct dpu_lm_cfg sm8450_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
-		.base = 0x44000, .len = 0x320,
+		.base = 0x44000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
@@ -142,7 +142,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 		.dspp = DSPP_0,
 	}, {
 		.name = "lm_1", .id = LM_1,
-		.base = 0x45000, .len = 0x320,
+		.base = 0x45000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
@@ -150,7 +150,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 		.dspp = DSPP_1,
 	}, {
 		.name = "lm_2", .id = LM_2,
-		.base = 0x46000, .len = 0x320,
+		.base = 0x46000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
@@ -158,7 +158,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
-		.base = 0x47000, .len = 0x320,
+		.base = 0x47000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
@@ -166,14 +166,14 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
-		.base = 0x48000, .len = 0x320,
+		.base = 0x48000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
-		.base = 0x49000, .len = 0x320,
+		.base = 0x49000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 465b6460f875..4c7eb55d474c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 static const struct dpu_lm_cfg sm8550_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
-		.base = 0x44000, .len = 0x320,
+		.base = 0x44000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
@@ -139,7 +139,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 		.dspp = DSPP_0,
 	}, {
 		.name = "lm_1", .id = LM_1,
-		.base = 0x45000, .len = 0x320,
+		.base = 0x45000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
@@ -147,7 +147,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 		.dspp = DSPP_1,
 	}, {
 		.name = "lm_2", .id = LM_2,
-		.base = 0x46000, .len = 0x320,
+		.base = 0x46000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
@@ -155,7 +155,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
-		.base = 0x47000, .len = 0x320,
+		.base = 0x47000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
@@ -163,14 +163,14 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
-		.base = 0x48000, .len = 0x320,
+		.base = 0x48000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
-		.base = 0x49000, .len = 0x320,
+		.base = 0x49000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 6caa7d40f368..dec83ea8167d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sar2130p_sspp[] = {
 static const struct dpu_lm_cfg sar2130p_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
-		.base = 0x44000, .len = 0x320,
+		.base = 0x44000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
@@ -139,7 +139,7 @@ static const struct dpu_lm_cfg sar2130p_lm[] = {
 		.dspp = DSPP_0,
 	}, {
 		.name = "lm_1", .id = LM_1,
-		.base = 0x45000, .len = 0x320,
+		.base = 0x45000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
@@ -147,7 +147,7 @@ static const struct dpu_lm_cfg sar2130p_lm[] = {
 		.dspp = DSPP_1,
 	}, {
 		.name = "lm_2", .id = LM_2,
-		.base = 0x46000, .len = 0x320,
+		.base = 0x46000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
@@ -155,7 +155,7 @@ static const struct dpu_lm_cfg sar2130p_lm[] = {
 		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
-		.base = 0x47000, .len = 0x320,
+		.base = 0x47000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
@@ -163,14 +163,14 @@ static const struct dpu_lm_cfg sar2130p_lm[] = {
 		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
-		.base = 0x48000, .len = 0x320,
+		.base = 0x48000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
-		.base = 0x49000, .len = 0x320,
+		.base = 0x49000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 7243eebb85f3..52ff4baa668a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg x1e80100_sspp[] = {
 static const struct dpu_lm_cfg x1e80100_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
-		.base = 0x44000, .len = 0x320,
+		.base = 0x44000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
@@ -138,7 +138,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 		.dspp = DSPP_0,
 	}, {
 		.name = "lm_1", .id = LM_1,
-		.base = 0x45000, .len = 0x320,
+		.base = 0x45000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
@@ -146,7 +146,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 		.dspp = DSPP_1,
 	}, {
 		.name = "lm_2", .id = LM_2,
-		.base = 0x46000, .len = 0x320,
+		.base = 0x46000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
@@ -154,7 +154,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
-		.base = 0x47000, .len = 0x320,
+		.base = 0x47000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
@@ -162,14 +162,14 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
-		.base = 0x48000, .len = 0x320,
+		.base = 0x48000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
-		.base = 0x49000, .len = 0x320,
+		.base = 0x49000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,

---
base-commit: 615aad0f61e0c7a898184a394dc895c610100d4f
change-id: 20260127-topic-lm_size_fix-d6ec206b8dd9

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

