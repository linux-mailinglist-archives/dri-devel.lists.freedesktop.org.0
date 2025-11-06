Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 596B5C3B2A1
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:19:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A572C10E8B7;
	Thu,  6 Nov 2025 13:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OdA8xvr/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E504310E8BF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 13:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BIAmdrw+DAyYjAlcY6BB0sYbfwz5Bit2ovypevC9kpk=; b=OdA8xvr/2SnO5uA2UI+RpMn2T9
 4ZYODc2T+WcoIWJKqAlusxFf02z6yLGpG+tdweVEA0AxsCNfCRURpjOJ60B00OfSNlcG0nxyE8YgY
 cH0WQW5ptEjStSiUSe8jtDv5s2Yt7utUcJ8/uxIRCk/p1XYMm8KgHR9R5CTvsPiZraAwlg/3PZpEE
 cTtprz1Ic8pTldNdgSDagy/EChU87QR/MjR7HfEN0dVN0XDYas1l5EB4BfOUiZtcyYlzh4Mx1W7Nw
 MR2nbvfiMCBsSiyrqe6j0l2aYmwilPkLBZAojaaUL/kSBv8iJQ7jfOia2yl4xMZd9H4XH2jNrv4r6
 I1YjOOHw==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vGzti-0030Rm-6H; Thu, 06 Nov 2025 14:19:30 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH] drm/gem: Use vmemdup_array_user in drm_gem_objects_lookup
Date: Thu,  6 Nov 2025 13:19:26 +0000
Message-ID: <20251106131926.28096-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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
 drivers/gpu/drm/drm_gem.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index a1a9c828938b..df138375e864 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -798,15 +798,9 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 
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
2.48.0

