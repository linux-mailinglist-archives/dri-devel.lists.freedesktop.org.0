Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C184EB64F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 01:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C4F10F0DA;
	Tue, 29 Mar 2022 23:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4B110E636;
 Tue, 29 Mar 2022 23:00:27 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id e5so18947828pls.4;
 Tue, 29 Mar 2022 16:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kb2enBvHT2itfmPZn/LyeXIRT2mssdSW2pMTncu7VUg=;
 b=puHfI8biwa9WeDGDrjQTbUiPA0SNqIaybiwLPKQqjZZkKwwRmy4jt/NMqiZscmymav
 t75DPdR74eU/Qpytn4n6ein7gIlj5ztuk0SRgjAg9pYohxEMR+Yri+QXHaPPJ8gyEinP
 NimUuCnOoF8UK3V7XwBbjjJyt+cKBinW2o1f3FLKMVANdOzBUbX4L/jlpMxVyRQ3wTPx
 tnmC1qLa9BQE/1pl/uegCKHv1EF0vHMHhtgBBspbVGxIlpnhC3Y8lKqwyBdCv8md1VhJ
 tMUHJQFHplmz/VMUslFcj5RcnMwgS15kqm0G0sAGIvFb3OdL26WYo+1xxVxZWc6+GVNE
 yV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kb2enBvHT2itfmPZn/LyeXIRT2mssdSW2pMTncu7VUg=;
 b=bANCD8Dp4RPmyaFQu2KFvrNfnVud4lCh/N7x3lFmFQeHItMJfeTAi+1s/my2N4wjvY
 fnVT4pVOyxmwGKwpiTAyac/T9zygOi6FgZTA8FuYEEVu7q4J8OnXyvld5bntq9Jrif0H
 kNpHjOmnCwdOeiTFprNV4FSWg/I3Zs8vfugOkv//sqYSJUyniDsFykBYAP0OcyLIayD8
 fBd1PWyzn0RFOU1nOfJmH5ZF4Ef9R9Fts1/gX4ITstsN5y0GEyXF3LIde9da4kY0F+8D
 tXMcOxDDACDOz4gD7Nwqd9hkSMYETwG/UVFwPzIFznqug5ErB495KvilAjH5Jxux//l6
 72cw==
X-Gm-Message-State: AOAM533bfSQkziIFFnQn9TsQ1oky/NqrfNb5pIEIs9SfWsJZaMBl915Z
 zS82oTKAMwReeSAqZpE1egiCwB/ofe0=
X-Google-Smtp-Source: ABdhPJwNzrhzInpoi/FDNRztER1UyrSoyAS1DCtrEuns0Tb22euBv3TgxGGycQ2mD8lstHIsJz2qXg==
X-Received: by 2002:a17:902:f605:b0:14f:5d75:4fb0 with SMTP id
 n5-20020a170902f60500b0014f5d754fb0mr32208533plg.101.1648594826326; 
 Tue, 29 Mar 2022 16:00:26 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a17090a3d4500b001c97528521asm4141087pjf.6.2022.03.29.16.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 16:00:25 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] drm/msm/gem: Split out inuse helper
Date: Tue, 29 Mar 2022 16:00:51 -0700
Message-Id: <20220329230105.601666-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329230105.601666-1-robdclark@gmail.com>
References: <20220329230105.601666-1-robdclark@gmail.com>
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Prep for a following patch.  While we are at it, convert a few remaining
WARN_ON()s to GEM_WARN_ON().

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     |  2 +-
 drivers/gpu/drm/msm/msm_gem.h     |  1 +
 drivers/gpu/drm/msm/msm_gem_vma.c | 15 ++++++++++-----
 3 files changed, 12 insertions(+), 6 deletions(-)

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
index f914ddbaea89..dc2ae097805e 100644
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
-	if (WARN_ON(vma->inuse > 0))
+	if (GEM_WARN_ON(msm_gem_vma_inuse(vma)))
 		return;
 
 	/* Don't do anything if the memory isn't mapped */
@@ -61,7 +66,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma)
 {
-	if (!WARN_ON(!vma->iova))
+	if (!GEM_WARN_ON(!vma->iova))
 		vma->inuse--;
 }
 
@@ -73,7 +78,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
 	unsigned size = npages << PAGE_SHIFT;
 	int ret = 0;
 
-	if (WARN_ON(!vma->iova))
+	if (GEM_WARN_ON(!vma->iova))
 		return -EINVAL;
 
 	/* Increase the usage counter */
@@ -100,7 +105,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
 void msm_gem_close_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma)
 {
-	if (WARN_ON(vma->inuse > 0 || vma->mapped))
+	if (GEM_WARN_ON(msm_gem_vma_inuse(vma) || vma->mapped))
 		return;
 
 	spin_lock(&aspace->lock);
@@ -120,7 +125,7 @@ int msm_gem_init_vma(struct msm_gem_address_space *aspace,
 {
 	int ret;
 
-	if (WARN_ON(vma->iova))
+	if (GEM_WARN_ON(vma->iova))
 		return -EBUSY;
 
 	spin_lock(&aspace->lock);
-- 
2.35.1

