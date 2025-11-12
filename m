Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB63C51594
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 10:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2F110E1C4;
	Wed, 12 Nov 2025 09:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TLnO44Et";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC1510E1BD
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 09:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=17DxUWEwJf7T02THV/Szux9KE6QDUHW9XevvctC2KfY=; b=TLnO44EtPF/RmORznAxHoK0+8Z
 V8Q0ntzGWJmo7F9wz6DKpo86xyAkL3IUHmTP5xYAm/2aXLippFW4AOGyQLDHHUVDAA08AtxWvxmTE
 LGpr1XY6i05oqnbt7Lt4S2ZUgu3Bi3e0DHbj+4yYELQ6qdyopRPfuES1IoynFbUxXrJXQkdGaXvMa
 snP4UbmtoUhVmOa5NyCjSMywj8u2T/1Hc+CNXZvkLBiEuPYfJMpA/Ir3ycK7x2G5zxchUi91skF1c
 IlEMrnp4DBMcVd2DjvSyOEOeGqazzT9luu1zU2l3CBbFoaoK6gxXGXX5ZpUXhh29VqwGOmdyfrtrr
 xwcNLw+A==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vJ78a-005UOB-3j; Wed, 12 Nov 2025 10:27:36 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v2] drm/gem: Use vmemdup_array_user in drm_gem_objects_lookup
Date: Wed, 12 Nov 2025 09:27:32 +0000
Message-ID: <20251112092732.23584-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using a helper shrinks the code and separating the user and kernel slabs
is more secure.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
v2:
 * Remove now unused dev local.
---
 drivers/gpu/drm/drm_gem.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index a1a9c828938b..68168d58a7c8 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -783,7 +783,6 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
 int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 			   int count, struct drm_gem_object ***objs_out)
 {
-	struct drm_device *dev = filp->minor->dev;
 	struct drm_gem_object **objs;
 	u32 *handles;
 	int ret;
@@ -798,15 +797,9 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 
 	*objs_out = objs;
 
-	handles = kvmalloc_array(count, sizeof(u32), GFP_KERNEL);
-	if (!handles) {
-		ret = -ENOMEM;
-		goto out;
-	}
-
-	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
-		ret = -EFAULT;
-		drm_dbg_core(dev, "Failed to copy in GEM handles\n");
+	handles = vmemdup_array_user(bo_handles, count, sizeof(u32));
+	if (IS_ERR(handles)) {
+		ret = PTR_ERR(handles);
 		goto out;
 	}
 
-- 
2.51.1

