Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 219B1560B8B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 23:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F0A10E682;
	Wed, 29 Jun 2022 21:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5B310E626;
 Wed, 29 Jun 2022 21:19:10 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id d17so16218711pfq.9;
 Wed, 29 Jun 2022 14:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n2Zdhl1Vth3N791afpZ91OOSQKmJLxwVGhQJiS1zs08=;
 b=X6A1iyb7amxPMTinALXe9WnPvRw9BmErsaGGx5wSw/0hXZZaCfz/DVmu74S5girWgE
 1xZxKJDiSn5IA/bEthWfEZ+MfJAwG7eCqnKFIadsT0BQKA9fQtwX2OKx06xMcgbEXO1Y
 BqlAHohP5LmPnaAiMlcWxyipAY/YO6RVKVsL5wVhXtfZRX6o4/B1EoCTsD/knuQ2pvEC
 sXXz2UYxyEB5ADkdFUZBajYQtrCxSLCGegl+DX2pIK0UKbteu9r9zkSP/KvbGFNQVF8B
 eEzfNxfE9Qsd+YyHwAECfvUgMmDDN1hyXuK0N6R3yAirzjb6hydx+6SXKEMCUXq0NfS7
 uITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n2Zdhl1Vth3N791afpZ91OOSQKmJLxwVGhQJiS1zs08=;
 b=D5uUFT6gLZVH1TUkkdSEuW7EGcXXzfwgXwGtjSBl+KsOG4zz3s+OzwEC77uQoWowtz
 Lrom86HEXJhjwThc499kKayNx3/pO1rjFQA/y5eILzGRS60bqGzWfzuRbH50hj6bwoC1
 FDvo6sdrJ4vc1f5CKlFm0uWhQOh4bgTd47sziCWMsvLQ65QwAwBLq6cJF5L3yIAkop4f
 32PAti3N1t/qLmeloBbEzbEUrjtrRIDNJ7W+o/qH8jPJXz2JH8OmFhM0vP6Jv9LVwnvd
 W9aqm6/OaiZ1nCPYBq0fBkFVe17T4Sm3cbqo4DrnvnnNYqG6tbgDZe7IHHPRdW+bowxi
 khKw==
X-Gm-Message-State: AJIora/ojp5naRSvoLfLoudWwGZBUUI5BOnlsIqGywbVl7la5lPLOZ3F
 JJMMQ7+YewnIgmqBmyqKgq4g5rKNfFM=
X-Google-Smtp-Source: AGRyM1tncV+wdkEe9ODsLbjt1i1UurGbKs3QCkDEr9bCikJKDnjX+qkvQ+UuSVzVwb1X86OO0T0qkw==
X-Received: by 2002:a65:4848:0:b0:3fc:52c3:6ca5 with SMTP id
 i8-20020a654848000000b003fc52c36ca5mr4493416pgs.264.1656537549190; 
 Wed, 29 Jun 2022 14:19:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003fd1111d73csm11868744pgv.4.2022.06.29.14.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 14:19:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/gpu: Capture all BO addr+size in devcore
Date: Wed, 29 Jun 2022 14:19:15 -0700
Message-Id: <20220629211919.563585-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629211919.563585-1-robdclark@gmail.com>
References: <20220629211919.563585-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

It is useful to know what buffers userspace thinks are associated with
the submit, even if we don't care to capture their content.  This brings
things more inline with $debugfs/rd cmdstream dumping.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 36 ++++++++---------------------------
 1 file changed, 8 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index bdee6ea51b73..293f3380fafe 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -221,7 +221,7 @@ static void msm_gpu_devcoredump_free(void *data)
 }
 
 static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
-		struct msm_gem_object *obj, u64 iova, u32 flags)
+		struct msm_gem_object *obj, u64 iova, bool full)
 {
 	struct msm_gpu_state_bo *state_bo = &state->bos[state->nr_bos];
 
@@ -229,8 +229,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 	state_bo->size = obj->base.size;
 	state_bo->iova = iova;
 
-	/* Only store data for non imported buffer objects marked for read */
-	if ((flags & MSM_SUBMIT_BO_READ) && !obj->base.import_attach) {
+	if (full) {
 		void *ptr;
 
 		state_bo->data = kvmalloc(obj->base.size, GFP_KERNEL);
@@ -276,34 +275,15 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	state->fault_info = gpu->fault_info;
 
 	if (submit) {
-		int i, nr = 0;
-
-		/* count # of buffers to dump: */
-		for (i = 0; i < submit->nr_bos; i++)
-			if (should_dump(submit, i))
-				nr++;
-		/* always dump cmd bo's, but don't double count them: */
-		for (i = 0; i < submit->nr_cmds; i++)
-			if (!should_dump(submit, submit->cmd[i].idx))
-				nr++;
-
-		state->bos = kcalloc(nr,
+		int i;
+
+		state->bos = kcalloc(submit->nr_bos,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
 		for (i = 0; state->bos && i < submit->nr_bos; i++) {
-			if (should_dump(submit, i)) {
-				msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
-					submit->bos[i].iova, submit->bos[i].flags);
-			}
-		}
-
-		for (i = 0; state->bos && i < submit->nr_cmds; i++) {
-			int idx = submit->cmd[i].idx;
-
-			if (!should_dump(submit, submit->cmd[i].idx)) {
-				msm_gpu_crashstate_get_bo(state, submit->bos[idx].obj,
-					submit->bos[idx].iova, submit->bos[idx].flags);
-			}
+			msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
+						  submit->bos[i].iova,
+						  should_dump(submit, i));
 		}
 	}
 
-- 
2.36.1

