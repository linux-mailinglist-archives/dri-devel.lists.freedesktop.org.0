Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE8B7D5969
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 19:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91ABA10E436;
	Tue, 24 Oct 2023 17:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AC910E435;
 Tue, 24 Oct 2023 17:08:13 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6ba54c3ed97so4545384b3a.2; 
 Tue, 24 Oct 2023 10:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698167293; x=1698772093; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w5+XaYJFN+NVWeY4zXTt2hZlhhgyD1PbfO78ZC5UnKI=;
 b=DIcH/la0i7GrsIFo1OENiUiI249GXL7GQWkyXe4LE4CVlE56T+Jg1VyWy63RrPcv0p
 L5YMFgdBlmQICYHCwTqbkev9yzjNVlTRaoUCkoWCgf6Bxwy/1C4OVJ6LtsJ+nl8EnfFQ
 7ixnhLb2uA64HZ28ymMlUO7sUkx6D/kG52zPLeH5AQM/WN3WkMdpmWmyt18AGudi0uIL
 u8MLjOFYzkeDXMZTtx7Vpis44Dr+oosvh57IGuvRVsS8OgnFbcD7ktxRilBfY5/950et
 M0r2WuBPBl2m4zOi71cu20OLICE0e0Ah7kuEHZdUY6PPmE/4K1J5Vx7NZKJmkdzr2//F
 jVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698167293; x=1698772093;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w5+XaYJFN+NVWeY4zXTt2hZlhhgyD1PbfO78ZC5UnKI=;
 b=P1EAS6IpUM339TKGlarrYXw4ps7mlVQhAAveqd1qIpoRR0DWkvIS2pVBuEGMt4NC3w
 BbvV0UZ9C9W6BOFVS0hfT7xmu9a5hB08gOgwkNrJpxqqHAM4n+yvZq5BGcR0Xn2PG7Y0
 oi1zLYTNztPWaUg8rPdPGaly5yyhnWnP+XbcJkyvvatjPViEhiMtq5haZkh0MaIJHHHc
 6k9vnp9KMaQW9XRwkP2E0wDIfSXr2Gk1hdj/Os8hMOQ8u/9VH9G4Nd0sT1SBlHbh68Ip
 y5n27JWPrqHQYY2EU9+PUCI7owMamkF3zBe1W4opPY9iWIV77A/YzkLnG7YG7obN++qH
 iWew==
X-Gm-Message-State: AOJu0YzdWXftpp+1S3UY3RPuvLraMJvSWZK0dS0RJi2mVCJ1DQWHaP8W
 +ZZVU2X2vmiWw+1jAAj44zNOPmwoV1I=
X-Google-Smtp-Source: AGHT+IHd3/Ozn+cdIOjsShL1jIxoFepfqKnj9txTltqWrGjBYe8Dn3VBv5QDIltIkx/ptDribRPnpg==
X-Received: by 2002:a05:6a00:21ca:b0:6be:1f19:e5f0 with SMTP id
 t10-20020a056a0021ca00b006be1f19e5f0mr15216384pfj.25.1698167292690; 
 Tue, 24 Oct 2023 10:08:12 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 d6-20020aa797a6000000b006b225011ee5sm7868310pfq.6.2023.10.24.10.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 10:08:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/gem: Demote userspace errors to DRM_UT_DRIVER
Date: Tue, 24 Oct 2023 10:08:04 -0700
Message-ID: <20231024170806.194563-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Error messages resulting from incorrect usage of the kernel uabi should
not spam dmesg by default.  But it is useful to enable them to debug
userspace.  So demote to DRM_UT_DRIVER.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c        |  6 ++---
 drivers/gpu/drm/msm/msm_gem_submit.c | 36 ++++++++++++++++------------
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index db1e748daa75..1113e6b2ec8e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -226,9 +226,9 @@ static struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj,
 
 	msm_gem_assert_locked(obj);
 
-	if (GEM_WARN_ON(msm_obj->madv > madv)) {
-		DRM_DEV_ERROR(obj->dev->dev, "Invalid madv state: %u vs %u\n",
-			msm_obj->madv, madv);
+	if (msm_obj->madv > madv) {
+		DRM_DEV_DEBUG_DRIVER(obj->dev->dev, "Invalid madv state: %u vs %u\n",
+				     msm_obj->madv, madv);
 		return ERR_PTR(-EBUSY);
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index a105ca1f2102..9f16af761bf0 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -17,6 +17,12 @@
 #include "msm_gem.h"
 #include "msm_gpu_trace.h"
 
+/* For userspace errors, use DRM_UT_DRIVER.. so that userspace can enable
+ * error msgs for debugging, but we don't spam dmesg by default
+ */
+#define SUBMIT_ERROR(submit, fmt, ...) \
+	DRM_DEV_DEBUG_DRIVER((submit)->dev->dev, fmt, ##__VA_ARGS__)
+
 /*
  * Cmdstream submission:
  */
@@ -136,7 +142,7 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 
 		if ((submit_bo.flags & ~MSM_SUBMIT_BO_FLAGS) ||
 			!(submit_bo.flags & MANDATORY_FLAGS)) {
-			DRM_ERROR("invalid flags: %x\n", submit_bo.flags);
+			SUBMIT_ERROR(submit, "invalid flags: %x\n", submit_bo.flags);
 			ret = -EINVAL;
 			i = 0;
 			goto out;
@@ -158,7 +164,7 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 		 */
 		obj = idr_find(&file->object_idr, submit->bos[i].handle);
 		if (!obj) {
-			DRM_ERROR("invalid handle %u at index %u\n", submit->bos[i].handle, i);
+			SUBMIT_ERROR(submit, "invalid handle %u at index %u\n", submit->bos[i].handle, i);
 			ret = -EINVAL;
 			goto out_unlock;
 		}
@@ -202,13 +208,13 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
 			break;
 		default:
-			DRM_ERROR("invalid type: %08x\n", submit_cmd.type);
+			SUBMIT_ERROR(submit, "invalid type: %08x\n", submit_cmd.type);
 			return -EINVAL;
 		}
 
 		if (submit_cmd.size % 4) {
-			DRM_ERROR("non-aligned cmdstream buffer size: %u\n",
-					submit_cmd.size);
+			SUBMIT_ERROR(submit, "non-aligned cmdstream buffer size: %u\n",
+				     submit_cmd.size);
 			ret = -EINVAL;
 			goto out;
 		}
@@ -306,8 +312,8 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 
 fail:
 	if (ret == -EALREADY) {
-		DRM_ERROR("handle %u at index %u already on submit list\n",
-				submit->bos[i].handle, i);
+		SUBMIT_ERROR(submit, "handle %u at index %u already on submit list\n",
+			     submit->bos[i].handle, i);
 		ret = -EINVAL;
 	}
 
@@ -448,8 +454,8 @@ static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
 		struct drm_gem_object **obj, uint64_t *iova, bool *valid)
 {
 	if (idx >= submit->nr_bos) {
-		DRM_ERROR("invalid buffer index: %u (out of %u)\n",
-				idx, submit->nr_bos);
+		SUBMIT_ERROR(submit, "invalid buffer index: %u (out of %u)\n",
+			     idx, submit->nr_bos);
 		return -EINVAL;
 	}
 
@@ -475,7 +481,7 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
 		return 0;
 
 	if (offset % 4) {
-		DRM_ERROR("non-aligned cmdstream buffer: %u\n", offset);
+		SUBMIT_ERROR(submit, "non-aligned cmdstream buffer: %u\n", offset);
 		return -EINVAL;
 	}
 
@@ -497,8 +503,8 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
 		bool valid;
 
 		if (submit_reloc.submit_offset % 4) {
-			DRM_ERROR("non-aligned reloc offset: %u\n",
-					submit_reloc.submit_offset);
+			SUBMIT_ERROR(submit, "non-aligned reloc offset: %u\n",
+				     submit_reloc.submit_offset);
 			ret = -EINVAL;
 			goto out;
 		}
@@ -508,7 +514,7 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
 
 		if ((off >= (obj->size / 4)) ||
 				(off < last_offset)) {
-			DRM_ERROR("invalid offset %u at reloc %u\n", off, i);
+			SUBMIT_ERROR(submit, "invalid offset %u at reloc %u\n", off, i);
 			ret = -EINVAL;
 			goto out;
 		}
@@ -881,7 +887,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		if (!submit->cmd[i].size ||
 			((submit->cmd[i].size + submit->cmd[i].offset) >
 				obj->size / 4)) {
-			DRM_ERROR("invalid cmdstream size: %u\n", submit->cmd[i].size * 4);
+			SUBMIT_ERROR(submit, "invalid cmdstream size: %u\n", submit->cmd[i].size * 4);
 			ret = -EINVAL;
 			goto out;
 		}
@@ -893,7 +899,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 		if (!gpu->allow_relocs) {
 			if (submit->cmd[i].nr_relocs) {
-				DRM_ERROR("relocs not allowed\n");
+				SUBMIT_ERROR(submit, "relocs not allowed\n");
 				ret = -EINVAL;
 				goto out;
 			}
-- 
2.41.0

