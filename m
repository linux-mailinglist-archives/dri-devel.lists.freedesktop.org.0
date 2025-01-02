Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFA89FFF89
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 20:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A2210E79B;
	Thu,  2 Jan 2025 19:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="T0WdLL8N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39C910E797
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 19:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qkbz0Sow42rVOmG/NElmaWLsB5EnHGNy6hywVWsQFy8=; b=T0WdLL8N64S4MDqX8c54dnfFCI
 jyZWiivbBFSLL8Ur3XlFjuUPCJmlZ55aRZyjwhNRFGmpOiuafRNBpSsG8IyUKSxfU+MQ8OfiVevI+
 +yCMYTK1QKAJvxVPeAiROSWoVjebbMX8QElK9Ip4U9hiHs0KH3I1p3uGxWEckvuFLb6QbYyYW6fOQ
 SqzHO6hAwO8+O4QpIbDuGSGu56nFvRkETso9OXUqBTe0qiyRlSC7thn1Azxin9eRmRY6nBoHTkJJK
 gntTzxTVddVk3evzrmsEEF391DrceHCKyD7A9Cp2Fl+aAv8q0khFD8OBmNFJkIcGe1bH8s9i443pk
 S/6I5MYw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tTR7O-00Au7I-2Y; Thu, 02 Jan 2025 20:44:30 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 1/6] drm/syncobj: Avoid double memset in drm_syncobj_find_fence
Date: Thu,  2 Jan 2025 19:44:12 +0000
Message-ID: <20250102194418.70383-2-tursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250102194418.70383-1-tursulin@igalia.com>
References: <20250102194418.70383-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

On kernels hardened with CONFIG_INIT_STACK_ALL_ZERO we can avoid the
double memset by moving the memory clearing to the declaration block. That
way the compiler can notice and only emit it once.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/drm_syncobj.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 4f2ab8a7b50f..49cda394db5b 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -437,8 +437,8 @@ int drm_syncobj_find_fence(struct drm_file *file_private,
 			   struct dma_fence **fence)
 {
 	struct drm_syncobj *syncobj = drm_syncobj_find(file_private, handle);
-	struct syncobj_wait_entry wait;
 	u64 timeout = nsecs_to_jiffies64(DRM_SYNCOBJ_WAIT_FOR_SUBMIT_TIMEOUT);
+	struct syncobj_wait_entry wait = { };
 	int ret;
 
 	if (flags & ~DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT)
@@ -479,7 +479,6 @@ int drm_syncobj_find_fence(struct drm_file *file_private,
 	if (!(flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT))
 		goto out;
 
-	memset(&wait, 0, sizeof(wait));
 	wait.task = current;
 	wait.point = point;
 	drm_syncobj_fence_add_wait(syncobj, &wait);
-- 
2.47.1

