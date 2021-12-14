Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6415D47497F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 18:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A9310E244;
	Tue, 14 Dec 2021 17:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEFA10E249;
 Tue, 14 Dec 2021 17:34:04 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id k4so14088335plx.8;
 Tue, 14 Dec 2021 09:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IUVtrCNnk8frIGlEAr3SuG1vPO7+KGLAqJYvYc4iy+A=;
 b=QYLlFH9FpeWFS2PwTDPc0EDINf2Id7qpanDiTq5Q+PuxvJI8hRirI+cHVv5MGojHZl
 AvLXg49z6SmaCDpHdvTISH0ku+8iDj2W2hrEmwldCkOKIx9IFrf7MZJ9mIoYxjVA/if2
 y8Vv5uuWgShUommqoK3oR1+j6P1nRema/5bbhydrFoHkFDKMdvHuGQQ4U26hEoBwP09i
 Nc3hEeEF7rfuY680wOGZXZy1xs+GVlGd1rIOkghSvnK18EDB6eSfkXP45ODiDIbuVIHs
 M3ebhAZIfocoY/QmhcXzFxqpTw/OUwdKU+4972frpQJ0X9ALfHOgChnJ9gXESwzEN2rF
 W43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IUVtrCNnk8frIGlEAr3SuG1vPO7+KGLAqJYvYc4iy+A=;
 b=rFbtPlXbQAum1wxmWp8o7UWE6oYwdpGJ+Tw2QJ4BBtxC+294kXPppmJt1d6EzRoW35
 akQwCFh/SsQqkFVHEhgYwbSoRwm3T5aePcNjmPnPAKiJMuHDCbWEQaQpJxMAKS8RUdS4
 d++ZZZSK92aCcsyCjgtr95vjWTawfGxSCRDFALM4iPZrewEpp4y4hNlF2uieGsFeumPN
 vkj6oGuac5UmHfI58FY7GLiOZZDllcKR/AXjwP54nQyR8JdK2ujpwh1ifI3QDLC8D6+Z
 5w1uun+5mvHunQjyT1djDEDma0CvXDY6Tv/slnkDMKRIfsz9Yt1u7TVqYtgDixHaumGL
 0Dhw==
X-Gm-Message-State: AOAM53356hOWg2jL2PQJawlqAkXKBNKMqvbSSUnNYtpJLVG7uwnnLG4/
 IPjYJMuTPYfLqFWJfouB8Q7vGGberWo=
X-Google-Smtp-Source: ABdhPJxAyllQpKMu/4CPDbcm2YjXlO5GMQ+PNFz4glkbUUosre2l6gEZOKb+tkDVGNMfOGN4INeIVQ==
X-Received: by 2002:a17:903:230d:b0:141:e3ce:2738 with SMTP id
 d13-20020a170903230d00b00141e3ce2738mr6835284plh.57.1639503243290; 
 Tue, 14 Dec 2021 09:34:03 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 y18sm384629pfp.190.2021.12.14.09.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 09:34:02 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/msm/disp: Tweak display snapshot to match gpu snapshot
Date: Tue, 14 Dec 2021 09:38:59 -0800
Message-Id: <20211214173917.1496290-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211214173917.1496290-1-robdclark@gmail.com>
References: <20211214173917.1496290-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Guo Zhengkui <guozhengkui@vivo.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Doug Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, Fernando Ramos <greenfoo@u92.eu>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 Alexey Dobriyan <adobriyan@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add UTS_RELEASE and show timestamp the same way for consistency.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h      | 4 ++--
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 9 ++++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
index 4c619307612c..31ad68be3391 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
@@ -39,7 +39,7 @@
  * @dev: device pointer
  * @drm_dev: drm device pointer
  * @atomic_state: atomic state duplicated at the time of the error
- * @timestamp: timestamp at which the coredump was captured
+ * @time: timestamp at which the coredump was captured
  */
 struct msm_disp_state {
 	struct device *dev;
@@ -49,7 +49,7 @@ struct msm_disp_state {
 
 	struct drm_atomic_state *atomic_state;
 
-	ktime_t timestamp;
+	struct timespec64 time;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index 2e1acb1bc390..5d2ff6791058 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -5,6 +5,8 @@
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
 
+#include <generated/utsrelease.h>
+
 #include "msm_disp_snapshot.h"
 
 static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *base_addr)
@@ -79,10 +81,11 @@ void msm_disp_state_print(struct msm_disp_state *state, struct drm_printer *p)
 	}
 
 	drm_printf(p, "---\n");
-
+	drm_printf(p, "kernel: " UTS_RELEASE "\n");
 	drm_printf(p, "module: " KBUILD_MODNAME "\n");
 	drm_printf(p, "dpu devcoredump\n");
-	drm_printf(p, "timestamp %lld\n", ktime_to_ns(state->timestamp));
+	drm_printf(p, "time: %lld.%09ld\n",
+		state->time.tv_sec, state->time.tv_nsec);
 
 	list_for_each_entry_safe(block, tmp, &state->blocks, node) {
 		drm_printf(p, "====================%s================\n", block->name);
@@ -100,7 +103,7 @@ static void msm_disp_capture_atomic_state(struct msm_disp_state *disp_state)
 	struct drm_device *ddev;
 	struct drm_modeset_acquire_ctx ctx;
 
-	disp_state->timestamp = ktime_get();
+	ktime_get_real_ts64(&disp_state->time);
 
 	ddev = disp_state->drm_dev;
 
-- 
2.33.1

