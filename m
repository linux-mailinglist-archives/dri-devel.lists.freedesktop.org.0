Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FDC6429FB
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 14:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED70410E098;
	Mon,  5 Dec 2022 13:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F90C89023
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 13:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KsNzkwVwgR+cEA5X8iXb1kE6xx18RGkmAb0qmlWlRgg=; b=GjaCbrowCd99kPgE8d3uiGCQIr
 6lWgGfXrOvIJMSd6HmKjc3AEHsywMdG+njahJ4aK4JwBp7AoC1q1v2MAJVODBj0oAwa2KvZLEzoNi
 pQCUVZdwWcjupRhxNsTy2WZ40edBWOkF+hUebAkO81TGO9aIcwbV4JXZlxoPUnVtu1/+ERS4oWoKm
 ZkBMRuSyeoglvZ/aDZc3/Hpw9AHjZxvz+VBfCq8vviLl2pfRDXQj2F4Ic2rdpj1rGrWSwFMiho99u
 /ovJnDL6QqX9jR9CMu9gBYw3+9xKrr9TT4FtGOOAco3UCasbCk2Q4Q14HhAYNpCVyO+ErIZnF2MkL
 2WX8WtFw==;
Received: from [41.74.137.107] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1p2Bx7-00FUSn-1Q; Mon, 05 Dec 2022 14:56:13 +0100
From: Melissa Wen <mwen@igalia.com>
To: emma@anholt.net,
	mwen@igalia.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH v2 1/2] drm/v3d: cleanup BOs properly when lookup_bos fails
Date: Mon,  5 Dec 2022 12:55:37 -0100
Message-Id: <20221205135538.3545051-2-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221205135538.3545051-1-mwen@igalia.com>
References: <20221205135538.3545051-1-mwen@igalia.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maira Canal <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When v3d_lookup_bos fails to `allocate validated BO pointers`,
job->bo_count was already set to args->bo_count, but job->bo points to
NULL. In this scenario, we must verify that job->bo is not NULL before
iterating on it to proper clean up a job. Also, drm_gem_object_put
already checks that the object passed is not NULL, doing the job->bo[i]
checker redundant.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 96af1cb5202a..31a37572c11d 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -363,11 +363,11 @@ v3d_job_free(struct kref *ref)
 	struct v3d_job *job = container_of(ref, struct v3d_job, refcount);
 	int i;
 
-	for (i = 0; i < job->bo_count; i++) {
-		if (job->bo[i])
+	if (job->bo) {
+		for (i = 0; i < job->bo_count; i++)
 			drm_gem_object_put(job->bo[i]);
+		kvfree(job->bo);
 	}
-	kvfree(job->bo);
 
 	dma_fence_put(job->irq_fence);
 	dma_fence_put(job->done_fence);
-- 
2.35.1

