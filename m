Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5958465939
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 23:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB306E951;
	Wed,  1 Dec 2021 22:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD0A6E8DA
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 22:26:42 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id e11so50990190ljo.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 14:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TJdNyjaCPbt0SX5JXfaq3vc4wNX+Lqbrq4BbSv0o6ck=;
 b=gRsXariZ+vA4q+zfrI7GwlR5hsOVobuQjJde3sOr+LExlL97lCDlsMjqtPDLpQr4V1
 IZpV7cO55ckE5qQKTfZd7I+t9zZEKxHx8P11+L8w3vu+UvYCF/i6oNgO4ghlr9KupX4d
 CnjG1ZAd0YNqHI6pW8M17W8Jqv2F7wqZ7b557/5tkNasuQf8mE/6AtrQzWQpD77GzZHV
 aqFWrB/W8APB4DEDUp2VY6PWmadSFuT4x2skWtVkF4kjCuxN8sw3LJiYGxjnxGpyMtxw
 rP828lszpIPbT/mYGxbCYK/cBOU90LFbxbSkA66lJ1ZrxzOD+Y8/LDuMw+ZzTBD7Dl48
 6uNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TJdNyjaCPbt0SX5JXfaq3vc4wNX+Lqbrq4BbSv0o6ck=;
 b=P8N7Z1AHS4NbUA5R/Fpqv03zKb2GfCU+lzHyjDG0uYZ/MpwXG2/wE05Y9gk5yryBL8
 uUfuzVm5pjZJ9MX/Cys+/yYtcuV48iIkx+sP/wAsCWrpCP+kNarQ/5Ytz6+qM9GIFXqC
 caWUJ0RgDclKunKau2QZVpWaT4YhIVLQ0Z+ZVGPSiHQnuAEue7ScM63aqIoEt0wbhDy5
 TwUj1jUccsZAr+YRUW6pvYcI+KdOcSYUwX0C66wdqUsYWhZW8JHEO0SCXMOBh9RTvfLx
 I/IMVl49P+yRwMzcG3uR1uvyWKstXEoWvfaono1Uvv7ALGfCt76vt3Z0hYrr82xlmdUu
 Dmtg==
X-Gm-Message-State: AOAM531e8kMdLorjGPu8NVQAEHJuMJAmSChYeiKqUaOAKptb0GbwIP+f
 I69cGTr6ijberqmJ4DzcqL4HfQ==
X-Google-Smtp-Source: ABdhPJys5yzDwH0LJnm7duSIbsZsGK4mv5NuOVsCs78pmcT4r7e6K8kelf5WuhyuHVoGPHW+hHMgJw==
X-Received: by 2002:a05:651c:11cf:: with SMTP id
 z15mr7974458ljo.30.1638397600784; 
 Wed, 01 Dec 2021 14:26:40 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u7sm117004lfs.144.2021.12.01.14.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:26:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v1 6/8] drm/msm/dpu: stop manually removing debugfs files for
 the DPU CRTC
Date: Thu,  2 Dec 2021 01:26:31 +0300
Message-Id: <20211201222633.2476780-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM code handles removing all debugfs recursively. Drop CRTC-specific
code to perform that.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 ++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h |  3 ---
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d290809d59bd..9899f7424131 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1424,15 +1424,16 @@ DEFINE_SHOW_ATTRIBUTE(dpu_crtc_debugfs_state);
 static int _dpu_crtc_init_debugfs(struct drm_crtc *crtc)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
+	struct dentry *debugfs_root;
 
-	dpu_crtc->debugfs_root = debugfs_create_dir(dpu_crtc->name,
+	debugfs_root = debugfs_create_dir(dpu_crtc->name,
 			crtc->dev->primary->debugfs_root);
 
 	debugfs_create_file("status", 0400,
-			dpu_crtc->debugfs_root,
+			debugfs_root,
 			dpu_crtc, &_dpu_debugfs_status_fops);
 	debugfs_create_file("state", 0600,
-			dpu_crtc->debugfs_root,
+			debugfs_root,
 			&dpu_crtc->base,
 			&dpu_crtc_debugfs_state_fops);
 
@@ -1450,13 +1451,6 @@ static int dpu_crtc_late_register(struct drm_crtc *crtc)
 	return _dpu_crtc_init_debugfs(crtc);
 }
 
-static void dpu_crtc_early_unregister(struct drm_crtc *crtc)
-{
-	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
-
-	debugfs_remove_recursive(dpu_crtc->debugfs_root);
-}
-
 static const struct drm_crtc_funcs dpu_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
 	.destroy = dpu_crtc_destroy,
@@ -1465,7 +1459,6 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
 	.atomic_duplicate_state = dpu_crtc_duplicate_state,
 	.atomic_destroy_state = dpu_crtc_destroy_state,
 	.late_register = dpu_crtc_late_register,
-	.early_unregister = dpu_crtc_early_unregister,
 	.verify_crc_source = dpu_crtc_verify_crc_source,
 	.set_crc_source = dpu_crtc_set_crc_source,
 	.enable_vblank  = msm_crtc_enable_vblank,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 4328e133d71c..b8785c394fcc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -129,7 +129,6 @@ struct dpu_crtc_frame_event {
  * @drm_requested_vblank : Whether vblanks have been enabled in the encoder
  * @property_info : Opaque structure for generic property support
  * @property_defaults : Array of default values for generic property support
- * @debugfs_root  : Parent of debugfs node
  * @vblank_cb_count : count of vblank callback since last reset
  * @play_count    : frame count between crtc enable and disable
  * @vblank_cb_time  : ktime at vblank count reset
@@ -160,8 +159,6 @@ struct dpu_crtc {
 	struct drm_pending_vblank_event *event;
 	u32 vsync_count;
 
-	struct dentry *debugfs_root;
-
 	u32 vblank_cb_count;
 	u64 play_count;
 	ktime_t vblank_cb_time;
-- 
2.33.0

