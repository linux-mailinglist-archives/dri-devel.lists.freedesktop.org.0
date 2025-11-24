Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E055C802DD
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 12:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A6410E033;
	Mon, 24 Nov 2025 11:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 109CE10E033
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 11:20:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DE12497;
 Mon, 24 Nov 2025 03:20:42 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.74.238])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B0473F73B;
 Mon, 24 Nov 2025 03:20:47 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH] drm/gem: Correct error condition in drm_gem_objects_lookup
Date: Mon, 24 Nov 2025 11:20:38 +0000
Message-ID: <20251124112039.117748-1-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
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

When vmemdup_array_user() fails, 'handles' is set to a negative error
code and no memory is allocated. So the call to kvfree() should not
happen. Instead just return early with the error code.

Fixes: cb77b79abf5f ("drm/gem: Use vmemdup_array_user in drm_gem_objects_lookup")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/drm_gem.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 68168d58a7c8..efc79bbf3c73 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -798,13 +798,10 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 	*objs_out = objs;
 
 	handles = vmemdup_array_user(bo_handles, count, sizeof(u32));
-	if (IS_ERR(handles)) {
-		ret = PTR_ERR(handles);
-		goto out;
-	}
+	if (IS_ERR(handles))
+		return PTR_ERR(handles);
 
 	ret = objects_lookup(filp, handles, count, objs);
-out:
 	kvfree(handles);
 	return ret;
 
-- 
2.43.0

