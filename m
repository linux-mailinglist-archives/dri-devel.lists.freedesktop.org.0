Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C922D1633B8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 22:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD6D6EA88;
	Tue, 18 Feb 2020 21:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1354A6EA86;
 Tue, 18 Feb 2020 21:02:47 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id d9so8564700plo.11;
 Tue, 18 Feb 2020 13:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DX0d2fwy150Oxn2ueh8crPmbORULTUPrpK6kQzqonD4=;
 b=IqW2leGHHi3LHUpLpxvIlPeA+jlREzFt6Lxa/7yLlAeviAl+ufoEQmcpu6LDBSE70A
 TaVP5DNUawV0W7v8nUuGPMiBfQ/pOoHzOrsG1fzPAQ89YGINUO9069cKpuOM6wljAMfl
 CGknWlktXpy+R3AqaUQuvcOLVaB9dxfWIsdBCqltxhQDggFLotDpA9jYDTOhK09cL1TN
 ldqho9+4XLsPa0xbFHt0+Wsw3VCtRzfW0v+5G08sfB2Hl4v4RvxX2SZc5edQ3HYSDakO
 5byJgwku+2riUAzcXKo12lL9ED/DWStdv+S7p6pMNAgtFZSmTXYYJ0nYCqDZOZcvNRsw
 Kl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DX0d2fwy150Oxn2ueh8crPmbORULTUPrpK6kQzqonD4=;
 b=hlASVHc+SoUQDw14ZGMZeNpYMswJKrSSdgNLPUn+y5gmYLUQxAZYrDNgLquU26tYr+
 KEeTizPSFmOb9wYMBWdVCP55uiCzKAng22cfOAYj5no64RU3Dd+bBuVumgQffbJU77s1
 ftNatKVW4BBZz83HHvxMp3GOf2QDqXqyO7fhiVVMSP9a2rXPQf29kMqik24a1ru8zhnd
 T+mEQNQfElejQvRz856PfailivTvQA0mdKFlyKSOZKSiAY7n2bJsA2w1xcncUG7/fYhp
 wlGGDPejE+KKkvnn0do4EH+aOSAFacE1ZlDUhVgAGbi1lR2uj3dhR1KviwkhmHrfLeeH
 FCyw==
X-Gm-Message-State: APjAAAX0tb63Y3FFTIEC5aBWsElLbNrsyouvxnW4TEp9ATHH1UaXJuY5
 NsvGMcqADumXTVH4jPqRtRv2Cpv8
X-Google-Smtp-Source: APXvYqwue7exCr+5C0zzAWXFn99tXZVUV+OlMvWLfTE4f5M3BY4CD19tzbkBbBy8OO5MYaKzHi8F3A==
X-Received: by 2002:a17:90a:c705:: with SMTP id
 o5mr4833444pjt.67.1582059766099; 
 Tue, 18 Feb 2020 13:02:46 -0800 (PST)
Received: from localhost ([100.118.89.211])
 by smtp.gmail.com with ESMTPSA id u12sm5431970pgr.3.2020.02.18.13.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 13:02:45 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers
Date: Tue, 18 Feb 2020 13:00:21 -0800
Message-Id: <20200218210021.1066100-1-robdclark@gmail.com>
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.c | 28 +++++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_rd.c  |  8 +-------
 3 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 9e0953c2b7ce..22b4ccd7bb28 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -160,4 +160,14 @@ struct msm_gem_submit {
 	} bos[0];
 };
 
+/* helper to determine of a buffer in submit should be dumped, used for both
+ * devcoredump and debugfs cmdstream dumping:
+ */
+static bool
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
