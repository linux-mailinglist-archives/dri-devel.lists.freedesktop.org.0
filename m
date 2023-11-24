Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9487F6A20
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 02:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CDC10E787;
	Fri, 24 Nov 2023 01:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D202C10E787
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 01:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XW3GVntFJp+4nq4S2X8SKoFqiTjsd/qGSPs/RyQwHUQ=; b=sGTREmHWYp6WVTxJ7kBgHS/WTX
 Lh8aIUtLeG+RJJX2HKrpZiN+ygxOHOyV3wsWBs0yyWVXpLa3LbNjM1VpBA92LBtmtsBNsXlvL7OWb
 tDEkg89uJpCCa93CT4s2mMTpCAdgOPVeewAWv1qQahUEI5kmkWSHEWI7+yJXWjl8obWJI0LKHVGaG
 GHlnWXiqWvEy1hlB6Yhd4AIz2ZZO/0YhV5nmisF6fkIwmuP/3aUU84+kHbqAEffQH0TRmYLTlQWYo
 sKANm41R+rKoUAg9QpD0UjD/h66H4ikWowxTRQYCV9IrDtb3bLzR/NmFFZdZ71nqvqUnwTQXipnzr
 jTYDef8A==;
Received: from [177.34.168.16] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r6KyG-006Zga-TR; Fri, 24 Nov 2023 02:27:05 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 06/17] drm/v3d: Decouple job allocation from job initiation
Date: Thu, 23 Nov 2023 21:47:02 -0300
Message-ID: <20231124012548.772095-7-mcanal@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124012548.772095-1-mcanal@igalia.com>
References: <20231124012548.772095-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to allow the IOCTLs to allocate the job without initiating it.
This will be useful for the CPU job submission IOCTL, as the CPU job has
the need to use information from the user extensions. Currently, the
user extensions are parsed before the job allocation, making it
impossible to fill the CPU job when parsing the user extensions.
Therefore, decouple the job allocation from the job initiation.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_submit.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index fe46dd316ca0..ed1a310bbd2f 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -135,6 +135,21 @@ void v3d_job_put(struct v3d_job *job)
 	kref_put(&job->refcount, job->free);
 }
 
+static int
+v3d_job_allocate(void **container, size_t size)
+{
+	if (*container)
+		return 0;
+
+	*container = kcalloc(1, size, GFP_KERNEL);
+	if (!*container) {
+		DRM_ERROR("Cannot allocate memory for V3D job.\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
 static int
 v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	     void **container, size_t size, void (*free)(struct kref *ref),
@@ -145,11 +160,9 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	bool has_multisync = se && (se->flags & DRM_V3D_EXT_ID_MULTI_SYNC);
 	int ret, i;
 
-	*container = kcalloc(1, size, GFP_KERNEL);
-	if (!*container) {
-		DRM_ERROR("Cannot allocate memory for v3d job.");
-		return -ENOMEM;
-	}
+	ret = v3d_job_allocate(container, size);
+	if (ret)
+		return ret;
 
 	job = *container;
 	job->v3d = v3d;
-- 
2.41.0

