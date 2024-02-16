Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFBD8586B0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 21:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048AC10E1FC;
	Fri, 16 Feb 2024 20:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o4pyvA3u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADCA10E1FC
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 20:24:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AEFA86201E;
 Fri, 16 Feb 2024 20:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918C0C433F1;
 Fri, 16 Feb 2024 20:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708115088;
 bh=O3Vq/9iekbJvfivB8fPNqfc/VdUr6NW92uCL9/WplH8=;
 h=From:To:Cc:Subject:Date:From;
 b=o4pyvA3urDBZ5absWA/kHxTMsUxqDiraqvUHzCvCZsa7S0GmRjiXDAtU2otgYDGdq
 rFd7s2UI/6YOfwxfkRxyCzlxvmo9OxpsJT94IKgMtTq2yv3aMJlJUp7xbmbUym6AAx
 R2AVyJN9VY+gL9kRUqn9IeL+UdYV+I99jKHPtrKm2GnBCmSvhTaxKMD6/rminmP/9s
 Yg53Bk7R26epRSUPyl6s/TZWVFmjKU80plf8NXxpnBjeteQXHD05VIxUBo7/ZqgGAW
 j7t48iqo3h3QX6HuTT6gyPHYao49ciSc9jw0I/VRd8BbE121S1BGrTbjAt5zxKO4Fv
 w39jyPvupSZaQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Gow <davidgow@google.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tests/drm_buddy: avoid 64-bit calculation
Date: Fri, 16 Feb 2024 21:24:30 +0100
Message-Id: <20240216202442.2493031-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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

From: Arnd Bergmann <arnd@arndb.de>

The newly added drm_test_buddy_alloc_contiguous() test fails to link on
32-bit targets because of inadvertent 64-bit calculations:

ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/tests/drm_buddy_test.ko] undefined!
ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/tests/drm_buddy_test.ko] undefined!

From what I can tell, the numbers cannot possibly overflow a 32-bit size,
so use different types for these.

I noticed that the function has another possible flaw in that is mixes
what it calls pages with 4KB units. This is a big confusing at best,
or possibly broken when built on machines with larger pages.

Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index fee6bec757d1..50a5f98cd5bd 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -21,7 +21,8 @@ static inline u64 get_size(int order, u64 chunk_size)
 
 static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 {
-	u64 mm_size, ps = SZ_4K, i, n_pages, total;
+	u64 mm_size, total;
+	u32 i, ps = SZ_4K, n_pages;
 	struct drm_buddy_block *block;
 	struct drm_buddy mm;
 	LIST_HEAD(left);
@@ -29,7 +30,8 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 	LIST_HEAD(right);
 	LIST_HEAD(allocated);
 
-	mm_size = 16 * 3 * SZ_4K;
+	n_pages = 16 * 3;
+	mm_size = n_pages * SZ_4K;
 
 	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
 
@@ -42,7 +44,6 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 	 */
 
 	i = 0;
-	n_pages = mm_size / ps;
 	do {
 		struct list_head *list;
 		int slot = i % 3;
-- 
2.39.2

