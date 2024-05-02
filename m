Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4748B9DA6
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 17:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B9C11251E;
	Thu,  2 May 2024 15:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="V5D5yMvO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA7511251B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 15:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714664431;
 bh=eCYRnb8pJBSoC/g0b6LKYpg9jQxBsPqvLLOQD1lsrPg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V5D5yMvO29F63AEpYQBN0pkDT1lTx6qQE/pPJPwo0KUh//yjxbmjX1FZFVElVp63f
 uyJPavwRwJ2VgMcB2VOewu8TRa3SH5IupQCOhd1QkK8QiBTGrqaSxZV9u9cdCziiqb
 1POTxIkbEEZICVKCs4D/R+rlvmrmS2Q7s8PbMndyO5bZcmBbhzRHJ62RY5JhwdaQcD
 NtVQqanwtPqtlc6wiZLgLBMbx/USX2bMxlJ+IAaGXoRLqkoGwRgeQZv/C4EerHVNVb
 GsB2AXA3yMhQ4eDAULfUIo8E/x9Qu+fV8ypfWuTohUXavLRobKcd7JhrZR5xXOYyyf
 l3i4YBzyEUYXw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id EA0223782117;
 Thu,  2 May 2024 15:40:30 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v3 5/5] drm/panthor: Document
 drm_panthor_tiler_heap_destroy::handle validity constraints
Date: Thu,  2 May 2024 17:40:25 +0200
Message-ID: <20240502154025.1425278-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240502154025.1425278-1-boris.brezillon@collabora.com>
References: <20240502154025.1425278-1-boris.brezillon@collabora.com>
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

Make sure the user is aware that drm_panthor_tiler_heap_destroy::handle
must be a handle previously returned by
DRM_IOCTL_PANTHOR_TILER_HEAP_CREATE.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 include/uapi/drm/panthor_drm.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index b8220d2e698f..aaed8e12ad0b 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -939,7 +939,11 @@ struct drm_panthor_tiler_heap_create {
  * struct drm_panthor_tiler_heap_destroy - Arguments passed to DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY
  */
 struct drm_panthor_tiler_heap_destroy {
-	/** @handle: Handle of the tiler heap to destroy */
+	/**
+	 * @handle: Handle of the tiler heap to destroy.
+	 *
+	 * Must be a valid heap handle returned by DRM_IOCTL_PANTHOR_TILER_HEAP_CREATE.
+	 */
 	__u32 handle;
 
 	/** @pad: Padding field, MBZ. */
-- 
2.44.0

