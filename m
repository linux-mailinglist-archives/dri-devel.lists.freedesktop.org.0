Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E65848696
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 14:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1703B10F46C;
	Sat,  3 Feb 2024 13:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x4ZfH1Bx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7298310F469
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 13:47:29 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5113a97a565so1645273e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Feb 2024 05:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706968048; x=1707572848; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pw5pFN7i641hIu8JSJl2aLirgM2QU5HnN7Q1+QEDosg=;
 b=x4ZfH1BxtsYkx8VfN57MY6S+WHi02afArhhkZjZKi63r932s/BKmsoBH5pvS0Lvo73
 ohVcZwlDClkgUm+dsjCBefpNDkjC0P+2SKPkaVWuLzj6opLzPgqSx2aGHS4VaDA5pm/k
 gBhzKkmIJVXuyd7fJ5vP1qgcFo7AG6K9WtDfe+Jz5TU3/43ojZFeFVv0fUwvmQlshmOb
 sebllXEZZmAffk4oI6uH6ZIexZMktfrxJ2Y6v00o5csVp3OnMEHM7ztP0r3wClSPL8TW
 PUTgeaClAeBxXCZfF760zDxmghcLdGeiiRkbBwFMBjRi6CJ6z8VdWHWWeHGo8MGxo5BX
 G+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706968048; x=1707572848;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pw5pFN7i641hIu8JSJl2aLirgM2QU5HnN7Q1+QEDosg=;
 b=G+oW2W8D7I5VRKwYSW+B2J/ySCASoScSLw3L+Sa6/6jlQoKhDFrbgrvaIR1vjlE8jF
 rvXkkaJynlwQgi9fAf6nANAt6f3iu2Po/fbkzRC6y82Ju0ER2Codq+RY6X3NeldWpvB4
 9Rrsz+SaYnfYPD9NtSQIC8s3toM/RUTKT05Jm/cfyogfZVi0nqPVynbgpH6Zl2XWAJwW
 4DUDbSFm/MhiLto78xpPDbhqpxPwHQ1G+LwX8D3yzZkSODiRPNyw/ab202G21JfFUQCh
 nDMbleMiiFy7DsnMv5Fuzzd/fzNXW1e0h4z13vrhwi1Oa7FTR1iUqPs2eJhCpfLeMSnx
 mEiw==
X-Gm-Message-State: AOJu0YwTrTqVSlrM6g/c95V3lZCS9FH5hkRpzFkqVuzt2Z93rxs11TDp
 dOkF6Aq1qK6T78zFzDV8wvjP/uSOduuxp2vutC52fLlcaPymc8iTisNNfs2s0Mc=
X-Google-Smtp-Source: AGHT+IEszdnDIn/Y5wPJVYvshohWKpTy3aZ8P4gLhxlbyuJBsxd7yMonStPFPg6uvroOanJh5C/Dow==
X-Received: by 2002:ac2:43c8:0:b0:511:4860:425f with SMTP id
 u8-20020ac243c8000000b005114860425fmr609160lfl.17.1706968047668; 
 Sat, 03 Feb 2024 05:47:27 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXTzGT4XGIU5jd7krQi2gTAInO1eTDD20AYIXqfFy5sHfnr6wXKfYdHPN2DPwLX8xEXUzhmHZNIYZ+Vg62dEa14fxmr9sEJl1LTznOnCiBJCHXEJsdsNdES3Lb6HHTPgY27viWNJAeZ9SXs8yma1ut+TOccUiXWmUKM76iEVWXpFIcFbj/M3SXt9J20Xgvjw8VZrsPh6l0tAZ4QWGbt4PJRY1GaEZueieb3+ktbgSW4Rs+SApKjrW81U92cfzhScJMcK4XAl46J2chKvNecuU/io6tlW2suMWxGwGwKv7vt3Hl5aBNu/UJM1g6aTXm4ONMG+lgDLTcW4q9OTTYQSvS68YD+FT6U2tQmVKKEh9kDbfYIjVZ4tgKL7LvUMUjWROiaaGSiPMU1Y3sP4CgRnM2RLOkJLKRfqf4G41NbMIc1c26j9yVAvu8=
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c29-20020a19655d000000b00511480138f6sm130173lfj.8.2024.02.03.05.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 05:47:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 03 Feb 2024 15:47:25 +0200
Subject: [PATCH] drm/msm/dp: allow voltage swing / pre emphasis of 3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240203-dp-swing-3-v1-1-6545e1706196@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOxDvmUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDIwNj3ZQC3eLyzLx0XWPdJDOTtLTkVBND0xRLJaCGgqLUtMwKsGHRsbW
 1AIEJIy5cAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Stephen Boyd <swboyd@chromium.org>, Doug Anderson <dianders@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4768;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=uYr58wgFc5nItKc5X4u2aBvF0R7wzlYmYT4bOMAqMYs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlvkPuKfIwae5yOn0QbddgFmxk+UYA5FqHO4DUU
 Diw2DiIa9mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZb5D7gAKCRCLPIo+Aiko
 1eEzCACD7jF8Vz2stVzLH7NleE0wqUGkLFPAg5AdLNQHQKk1CxAE/eWIZ3Hz3D00IrDNcesJNI1
 Rk+//3ghboGBEKE/fu67fo/Shj+HoV6uvmMCjq3/Gd0iBr/SLQF1/ux8QDWJv0V0DxBgCY69OuC
 4ufMn80d/zsBP0td/ZQKgs18nKO7E28Rm2Qzag5NZCP52YmfNXdy8tBlFxL/VZLxpATnG8v1P6q
 tLk14UcCVkPXyXqVUQF2Gc1qQwz0qHhksAqOCF1xg4r/BvyYu1VAjMYsYh+nGnpsXO9dJwjhm9e
 7juD87ThD/cZ4VAlyC1FKXlsljqBkzDLFBlvkeEEJZj33v2s
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Both dp_link_adjust_levels() and dp_ctrl_update_vx_px() limit swing and
pre-emphasis to 2, while the real maximum value for the sum of the
voltage swing and pre-emphasis is 3. Fix the DP code to remove this
limitation.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c |  6 +++---
 drivers/gpu/drm/msm/dp/dp_link.c | 22 +++++++++++-----------
 drivers/gpu/drm/msm/dp/dp_link.h | 14 +-------------
 3 files changed, 15 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 77a8d9366ed7..26241970019f 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1024,14 +1024,14 @@ static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
 	if (ret)
 		return ret;
 
-	if (voltage_swing_level >= DP_TRAIN_VOLTAGE_SWING_MAX) {
+	if (voltage_swing_level >= DP_TRAIN_LEVEL_MAX) {
 		drm_dbg_dp(ctrl->drm_dev,
 				"max. voltage swing level reached %d\n",
 				voltage_swing_level);
 		max_level_reached |= DP_TRAIN_MAX_SWING_REACHED;
 	}
 
-	if (pre_emphasis_level >= DP_TRAIN_PRE_EMPHASIS_MAX) {
+	if (pre_emphasis_level >= DP_TRAIN_LEVEL_MAX) {
 		drm_dbg_dp(ctrl->drm_dev,
 				"max. pre-emphasis level reached %d\n",
 				pre_emphasis_level);
@@ -1122,7 +1122,7 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
 		}
 
 		if (ctrl->link->phy_params.v_level >=
-			DP_TRAIN_VOLTAGE_SWING_MAX) {
+			DP_TRAIN_LEVEL_MAX) {
 			DRM_ERROR_RATELIMITED("max v_level reached\n");
 			return -EAGAIN;
 		}
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 98427d45e9a7..e7da0571ecff 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1107,6 +1107,7 @@ int dp_link_get_colorimetry_config(struct dp_link *dp_link)
 int dp_link_adjust_levels(struct dp_link *dp_link, u8 *link_status)
 {
 	int i;
+	u8 max_p_level;
 	int v_max = 0, p_max = 0;
 	struct dp_link_private *link;
 
@@ -1138,30 +1139,29 @@ int dp_link_adjust_levels(struct dp_link *dp_link, u8 *link_status)
 	 * Adjust the voltage swing and pre-emphasis level combination to within
 	 * the allowable range.
 	 */
-	if (dp_link->phy_params.v_level > DP_TRAIN_VOLTAGE_SWING_MAX) {
+	if (dp_link->phy_params.v_level > DP_TRAIN_LEVEL_MAX) {
 		drm_dbg_dp(link->drm_dev,
 			"Requested vSwingLevel=%d, change to %d\n",
 			dp_link->phy_params.v_level,
-			DP_TRAIN_VOLTAGE_SWING_MAX);
-		dp_link->phy_params.v_level = DP_TRAIN_VOLTAGE_SWING_MAX;
+			DP_TRAIN_LEVEL_MAX);
+		dp_link->phy_params.v_level = DP_TRAIN_LEVEL_MAX;
 	}
 
-	if (dp_link->phy_params.p_level > DP_TRAIN_PRE_EMPHASIS_MAX) {
+	if (dp_link->phy_params.p_level > DP_TRAIN_LEVEL_MAX) {
 		drm_dbg_dp(link->drm_dev,
 			"Requested preEmphasisLevel=%d, change to %d\n",
 			dp_link->phy_params.p_level,
-			DP_TRAIN_PRE_EMPHASIS_MAX);
-		dp_link->phy_params.p_level = DP_TRAIN_PRE_EMPHASIS_MAX;
+			DP_TRAIN_LEVEL_MAX);
+		dp_link->phy_params.p_level = DP_TRAIN_LEVEL_MAX;
 	}
 
-	if ((dp_link->phy_params.p_level > DP_TRAIN_PRE_EMPHASIS_LVL_1)
-		&& (dp_link->phy_params.v_level ==
-			DP_TRAIN_VOLTAGE_SWING_LVL_2)) {
+	max_p_level = DP_TRAIN_LEVEL_MAX - dp_link->phy_params.v_level;
+	if (dp_link->phy_params.p_level > max_p_level) {
 		drm_dbg_dp(link->drm_dev,
 			"Requested preEmphasisLevel=%d, change to %d\n",
 			dp_link->phy_params.p_level,
-			DP_TRAIN_PRE_EMPHASIS_LVL_1);
-		dp_link->phy_params.p_level = DP_TRAIN_PRE_EMPHASIS_LVL_1;
+			max_p_level);
+		dp_link->phy_params.p_level = max_p_level;
 	}
 
 	drm_dbg_dp(link->drm_dev, "adjusted: v_level=%d, p_level=%d\n",
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index 9dd4dd926530..79c3a02b8dac 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -19,19 +19,7 @@ struct dp_link_info {
 	unsigned long capabilities;
 };
 
-enum dp_link_voltage_level {
-	DP_TRAIN_VOLTAGE_SWING_LVL_0	= 0,
-	DP_TRAIN_VOLTAGE_SWING_LVL_1	= 1,
-	DP_TRAIN_VOLTAGE_SWING_LVL_2	= 2,
-	DP_TRAIN_VOLTAGE_SWING_MAX	= DP_TRAIN_VOLTAGE_SWING_LVL_2,
-};
-
-enum dp_link_preemaphasis_level {
-	DP_TRAIN_PRE_EMPHASIS_LVL_0	= 0,
-	DP_TRAIN_PRE_EMPHASIS_LVL_1	= 1,
-	DP_TRAIN_PRE_EMPHASIS_LVL_2	= 2,
-	DP_TRAIN_PRE_EMPHASIS_MAX	= DP_TRAIN_PRE_EMPHASIS_LVL_2,
-};
+#define DP_TRAIN_LEVEL_MAX	3
 
 struct dp_link_test_video {
 	u32 test_video_pattern;

---
base-commit: 41d66f96d0f15a0a2ad6fa2208f6bac1a66cbd52
change-id: 20240203-dp-swing-3-b64ffce415d9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

