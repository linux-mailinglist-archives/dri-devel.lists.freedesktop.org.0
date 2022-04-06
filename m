Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D104F6D38
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 23:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3020A10E635;
	Wed,  6 Apr 2022 21:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6848210E626;
 Wed,  6 Apr 2022 21:46:37 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id b15so3696740pfm.5;
 Wed, 06 Apr 2022 14:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tAkFR+6vhq0o/UUKOqeWc9uPJoN5WXdSoZFQuuhB/hI=;
 b=bzbT6J2rgm/qYgWCGsRl0Bjoi13VafBGsuibq7P7WOH3DJ+fTwNs36UvugO7KgAhRW
 O6iQyRJ69joIyW7F2lw0tITOk1kQOur9BSAH2y8teHCZFnVhe4Ndd+AaL+S/r4m+bGs+
 rn4iXs7Hm/QXDJAytjB02xXIakTR6CW5XyLEm6evbcAh8diR85qgUBxpDGrPuO2+LqvD
 t31EVd7PTSQuTciEkYEtWnWeeyWKGbaNBq4Rz+g++Mx00fuqweGosuWD/d7SvI82Ed6N
 RSREDA3ygOEXaF+OK66exIm4bHX+2swqNiQO0L+LE+J5imWC3XJB5pZDr1UlQQOFaq8K
 wchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tAkFR+6vhq0o/UUKOqeWc9uPJoN5WXdSoZFQuuhB/hI=;
 b=LHBCRy5W6oqzw9HNXk2aUwjdywonEBN4/unAujlkKCaofqPe2uWNN1mcXHjwlwyr6i
 09UN88zrG7oXT9JjNutuwt7GKdv68YN0eZ8xMXRUKneIqI4gDFQ4VFbFmyVwkoEBQhE+
 EpXV4w4Rgk7YS7MyPhuNvOc7zvXEr/KrQ/KtkCh3cVNSka9bUF5cf5qqLN+J/6SEN/em
 0UpQd2Wwv175KTcwN1F8Aa9ahjpOdwX9+EmA9SxDwkteVELoUg30Jvh9EPSaVb86U+M2
 2kjgumMSi/kiecSGn0ifTttGWnc+K29QcNEgRh/BDRIqMrT6qe7Y61vAfbwspMerEtQt
 MUJQ==
X-Gm-Message-State: AOAM531gRmFcmghaybqokzGjCGJd53kLgsoQb3s8qIBoUDUVOomdPC8j
 YIeFQ+p7PBVZz6K6wUY4FfK/TVWZJuo=
X-Google-Smtp-Source: ABdhPJz/PjnrL7EshfGJWR8+rAUeniiBE61/tDJkSnK+WydzixgBjZDKWQAzo2+3/4l3ggQUrTfajw==
X-Received: by 2002:a63:f005:0:b0:381:f11:730c with SMTP id
 k5-20020a63f005000000b003810f11730cmr8448018pgh.156.1649281596386; 
 Wed, 06 Apr 2022 14:46:36 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a63b510000000b00398d8b19bbfsm17217112pge.23.2022.04.06.14.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 14:46:35 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 04/10] drm/msm/gem: Split out inuse helper
Date: Wed,  6 Apr 2022 14:46:20 -0700
Message-Id: <20220406214636.1156978-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406214636.1156978-1-robdclark@gmail.com>
References: <20220406214636.1156978-1-robdclark@gmail.com>
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
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Prep for a following patch, where it gets a bit more complicated.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 2 +-
 drivers/gpu/drm/msm/msm_gem.h     | 1 +
 drivers/gpu/drm/msm/msm_gem_vma.c | 9 +++++++--
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index a4f61972667b..f96d1dc72021 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -938,7 +938,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 				name, comm ? ":" : "", comm ? comm : "",
 				vma->aspace, vma->iova,
 				vma->mapped ? "mapped" : "unmapped",
-				vma->inuse);
+				msm_gem_vma_inuse(vma));
 			kfree(comm);
 		}
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 947ff7d9b471..1b7f0f0b88bf 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -61,6 +61,7 @@ struct msm_gem_vma {
 int msm_gem_init_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma, int npages,
 		u64 range_start, u64 range_end);
+bool msm_gem_vma_inuse(struct msm_gem_vma *vma);
 void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma);
 void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 64906594fc65..dc2ae097805e 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -37,6 +37,11 @@ msm_gem_address_space_get(struct msm_gem_address_space *aspace)
 	return aspace;
 }
 
+bool msm_gem_vma_inuse(struct msm_gem_vma *vma)
+{
+	return !!vma->inuse;
+}
+
 /* Actually unmap memory for the vma */
 void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma)
@@ -44,7 +49,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 	unsigned size = vma->node.size << PAGE_SHIFT;
 
 	/* Print a message if we try to purge a vma in use */
-	if (GEM_WARN_ON(vma->inuse > 0))
+	if (GEM_WARN_ON(msm_gem_vma_inuse(vma)))
 		return;
 
 	/* Don't do anything if the memory isn't mapped */
@@ -100,7 +105,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
 void msm_gem_close_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma)
 {
-	if (GEM_WARN_ON(vma->inuse > 0 || vma->mapped))
+	if (GEM_WARN_ON(msm_gem_vma_inuse(vma) || vma->mapped))
 		return;
 
 	spin_lock(&aspace->lock);
-- 
2.35.1

