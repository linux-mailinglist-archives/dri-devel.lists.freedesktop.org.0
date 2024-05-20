Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B348C9BFF
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 13:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BAD10E49D;
	Mon, 20 May 2024 11:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZEDyxW5T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DD410E574;
 Mon, 20 May 2024 11:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CJ3zenJyPRyF+UxJWs53C+Y2mTQnMda3jzpN66kAPZc=; b=ZEDyxW5TI9DTxZjxy5D9MWeDfo
 o61SGj9SffHN8c7EZ3RaN2Lv+pH1zjfHs4Iy65aFcLUup7ewbOfBSQEtpRkJvlnMh5sPcayms0cJC
 ZsorHoWyxNteBUfQ+cVsjjId50N7mMgJVhQfXQ6rDRQJ1RnVlu7tZb0zUwEZ8QNvFHlavGIheVpRE
 S7Tum8/z422+9uw+mz0A/8lzDbbxR9DCseoq/YY66Z/ZpE+6hYyi1Ro7UcjK0rXEejoqn0q3Ak0mN
 /Lw/DgEHrb/yy6EyednFGThVxSMn5TZ67yolamjLjlZs7E+f2KS4eJJ+wB8jxLKMZufb+wqPKJJ04
 xYnc8beA==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s90xZ-00ADSQ-3W; Mon, 20 May 2024 13:13:41 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.keonig@amd.com>,
 Rob Clark <robdclark@chromium.org>
Subject: [PATCH 1/2] Documentation/gpu: Document the situation with
 unqualified drm-memory-
Date: Mon, 20 May 2024 12:13:37 +0100
Message-ID: <20240520111338.10110-1-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Currently it is not well defined what is drm-memory- compared to other
categories.

In practice the only driver which emits these keys is amdgpu and in them
exposes the current resident buffer object memory (including shared).

To prevent any confusion, document that drm-memory- is deprecated and an
alias for drm-resident-memory-.

While at it also clarify that the reserved sub-string 'memory' refers to
the memory region component, and also clarify the intended semantics of
other memory categories.

v2:
 * Also mark drm-memory- as deprecated.
 * Add some more text describing memory categories. (Alex)

v3:
 * Semantics of the amdgpu drm-memory is actually as drm-resident.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.keonig@amd.com>
Cc: Rob Clark <robdclark@chromium.org>
---
 Documentation/gpu/drm-usage-stats.rst | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 6dc299343b48..45d9b76a5748 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -128,7 +128,9 @@ Memory
 
 Each possible memory type which can be used to store buffer objects by the
 GPU in question shall be given a stable and unique name to be returned as the
-string here.  The name "memory" is reserved to refer to normal system memory.
+string here.
+
+The region name "memory" is reserved to refer to normal system memory.
 
 Value shall reflect the amount of storage currently consumed by the buffer
 objects belong to this client, in the respective memory region.
@@ -136,6 +138,9 @@ objects belong to this client, in the respective memory region.
 Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
 indicating kibi- or mebi-bytes.
 
+This key is deprecated and is an alias for drm-resident-<region>. Only one of
+the two should be present in the output.
+
 - drm-shared-<region>: <uint> [KiB|MiB]
 
 The total size of buffers that are shared with another file (e.g., have more
@@ -143,20 +148,34 @@ than a single handle).
 
 - drm-total-<region>: <uint> [KiB|MiB]
 
-The total size of buffers that including shared and private memory.
+The total size of all created buffers including shared and private memory. The
+backing store for the buffers does not have to be currently instantiated to be
+counted under this category.
 
 - drm-resident-<region>: <uint> [KiB|MiB]
 
-The total size of buffers that are resident in the specified region.
+The total size of buffers that are resident (have their backing store present or
+instantiated) in the specified region.
+
+This is an alias for drm-memory-<region> and only one of the two should be
+present in the output.
 
 - drm-purgeable-<region>: <uint> [KiB|MiB]
 
 The total size of buffers that are purgeable.
 
+For example drivers which implement a form of 'madvise' like functionality can
+here count buffers which have instantiated backing store, but have been marked
+with an equivalent of MADV_DONTNEED.
+
 - drm-active-<region>: <uint> [KiB|MiB]
 
 The total size of buffers that are active on one or more engines.
 
+One practical example of this can be presence of unsignaled fences in an GEM
+buffer reservation object. Therefore the active category is a subset of
+resident.
+
 Implementation Details
 ======================
 
-- 
2.44.0

