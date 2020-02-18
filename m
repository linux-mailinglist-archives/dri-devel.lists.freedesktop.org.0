Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CBD1634C1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 22:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB306E400;
	Tue, 18 Feb 2020 21:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FD96E400;
 Tue, 18 Feb 2020 21:22:26 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id i6so11312464pfc.1;
 Tue, 18 Feb 2020 13:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1yORocRN6bN/DWLSCc3LMaJhbwacp2HLNmosyK8PhXY=;
 b=RDJ1RD/xDrXbznWXW43BryMq6Jz3QBb4fUTMsoLkBcTVJ6bh10hb5sTHYyI+zplASW
 82HKX1xkUVNQrjo72x4Bzq5+KEcwcxIWOzUZ9GFTFp/xG4LkBT4lns9Vl5sE+bz9syny
 9hCkQHsF8CaXVktqS7qz56ZDsZ0U5wpGq/jAFoTeBpZQIq0bNn3JXEIydvuOrNKWOtXe
 nTs7JMSJGU22cVYQcFvUDFeQwPOGT304v37TSyyzKKx4tX8nCDY+Pg6+571zBZlof9M2
 muX7Uz4vvVbovnYY6oDkycCZ92CCDxqCXf9Ekv+pGG2qfdtr7jqjpoGrGqwU/EosZHCX
 ju1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1yORocRN6bN/DWLSCc3LMaJhbwacp2HLNmosyK8PhXY=;
 b=LGqvVy+PYt8Cg1xLz7aGMcS0hUKZ0zgT4dJs/6Y9DSNVLPpRYTs2F4QoW8JhhiUqTj
 tBhf+tDBwGLeiqjGj+XDh65WeX3lhpBCCwwxqnNQB8lpzzLuUs5LojMp/rO72EBWDdrN
 7NZuybiY7ADJtMELEJRj56S2go3vRgzcenTZVzZVuOV58gzin2GKOt7dc0s6f74s5kJk
 u3wW6JwMih7Q96LOtcTH0rIuhAvPJDuYnuLCbhUtvr1jFCyQf+rS8KUH336IieGMCKDI
 Tv0uqlD0EVSWpWSE7J+N6TCPx5vE3j/I2Y6m+fDVIdALACgEAU/DgnOkm2Q52lHGYG3l
 3KVg==
X-Gm-Message-State: APjAAAX+lvzgGBJXYp0ml5ayE9+oP1rl8zLJBn6eyhVinF3AqM8Ef4De
 2xW4lGe5nAalHKdQgCbl1szhCOJA
X-Google-Smtp-Source: APXvYqwMxph8WfZwy4jJ8Hm+oyFMnedPlyeKBoA1heO5RDIjj7W+U0YW42+WmDKbc9ER8CnrdZtVtg==
X-Received: by 2002:a63:e509:: with SMTP id r9mr26127011pgh.274.1582060945518; 
 Tue, 18 Feb 2020 13:22:25 -0800 (PST)
Received: from localhost ([100.118.89.211])
 by smtp.gmail.com with ESMTPSA id c19sm5356081pfc.144.2020.02.18.13.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 13:22:24 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers
Date: Tue, 18 Feb 2020 13:20:12 -0800
Message-Id: <20200218212012.1067236-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Also log buffers with the DUMP flag set, to ensure we capture all useful
cmdstream in crashdump state with modern mesa.

Otherwise we miss out on the contents of "state object" cmdstream
buffers.

v2: add missing 'inline'

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.c | 28 +++++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_rd.c  |  8 +-------
 3 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 9e0953c2b7ce..dcee0e223ed8 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -160,4 +160,14 @@ struct msm_gem_submit {
 	} bos[0];
 };
 
+/* helper to determine of a buffer in submit should be dumped, used for both
+ * devcoredump and debugfs cmdstream dumping:
+ */
+static inline bool
+should_dump(struct msm_gem_submit *submit, int idx)
+{
+	extern bool rd_full;
+	return rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
+}
+
 #endif /* __MSM_GEM_H__ */
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 18f3a5c53ffb..615c5cda5389 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -355,16 +355,34 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	state->cmd = kstrdup(cmd, GFP_KERNEL);
 
 	if (submit) {
-		int i;
-
-		state->bos = kcalloc(submit->nr_cmds,
+		int i, nr = 0;
+
+		/* count # of buffers to dump: */
+		for (i = 0; i < submit->nr_bos; i++)
+			if (should_dump(submit, i))
+				nr++;
+		/* always dump cmd bo's, but don't double count them: */
+		for (i = 0; i < submit->nr_cmds; i++)
+			if (!should_dump(submit, submit->cmd[i].idx))
+				nr++;
+
+		state->bos = kcalloc(nr,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
+		for (i = 0; i < submit->nr_bos; i++) {
+			if (should_dump(submit, i)) {
+				msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
+					submit->bos[i].iova, submit->bos[i].flags);
+			}
+		}
+
 		for (i = 0; state->bos && i < submit->nr_cmds; i++) {
 			int idx = submit->cmd[i].idx;
 
-			msm_gpu_crashstate_get_bo(state, submit->bos[idx].obj,
-				submit->bos[idx].iova, submit->bos[idx].flags);
+			if (!should_dump(submit, submit->cmd[i].idx)) {
+				msm_gpu_crashstate_get_bo(state, submit->bos[idx].obj,
+					submit->bos[idx].iova, submit->bos[idx].flags);
+			}
 		}
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index af7ceb246c7c..732f65df5c4f 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -43,7 +43,7 @@
 #include "msm_gpu.h"
 #include "msm_gem.h"
 
-static bool rd_full = false;
+bool rd_full = false;
 MODULE_PARM_DESC(rd_full, "If true, $debugfs/.../rd will snapshot all buffer contents");
 module_param_named(rd_full, rd_full, bool, 0600);
 
@@ -336,12 +336,6 @@ static void snapshot_buf(struct msm_rd_state *rd,
 	msm_gem_put_vaddr(&obj->base);
 }
 
-static bool
-should_dump(struct msm_gem_submit *submit, int idx)
-{
-	return rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
-}
-
 /* called under struct_mutex */
 void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 		const char *fmt, ...)
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
