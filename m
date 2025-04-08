Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B806A80D4D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 16:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EED10E23C;
	Tue,  8 Apr 2025 14:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QAKwmW14";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806FA10E6C2
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 14:08:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D7F185C59F1;
 Tue,  8 Apr 2025 14:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C26C4CEE5;
 Tue,  8 Apr 2025 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744121282;
 bh=mfW7dpnTYgE95vu+Xou15b9fLz0M0vLmdscxv0EXT3E=;
 h=From:To:Cc:Subject:Date:From;
 b=QAKwmW143Ka/Fux+NXrwVtDTG+L+onZdvyfrSPDVJGnd36pQtbQnjvD3TghyKnb1G
 W2U3oj6aKuF3nedxUlNFQtPfNiVVGhQgVK5+A3zT+20K82otpjT9oLGvL3Mio1/WTU
 fdGROeHOBtrVV8sQF3h/bgoiszMkpH/d7eiq1yZkgxLJCFoxheOaKvP2DwP+BQCnKM
 +syzbytetrw3dG1/aOSTEPirp/SrfJn9iCia1swmGqZ1tDxxh2NrPVnnkTUOGhXvQ5
 0JpAiDONoiNmqG/lUWWdln2JBMo6Wlb8CxoDNlTaavHV55eIqCVkMhPxzActifs9JU
 UmniNWzb3ajyQ==
From: Maxime Ripard <mripard@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	Philipp Stanner <phasta@mailbox.org>
Subject: [PATCH] drm/tests: shmem: Fix memleak
Date: Tue,  8 Apr 2025 16:07:58 +0200
Message-ID: <20250408140758.1831333-1-mripard@kernel.org>
X-Mailer: git-send-email 2.49.0
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

The drm_gem_shmem_test_get_pages_sgt() gets a scatter-gather table using
the drm_gem_shmem_get_sg_table() function and rightfully calls
sg_free_table() on it. However, it's also supposed to kfree() the
returned sg_table, but doesn't.

This leads to a memory leak, reported by kmemleak. Fix it by adding a
kunit action to kfree the sgt when the test ends.

Reported-by: Philipp Stanner <phasta@mailbox.org>
Closes: https://lore.kernel.org/dri-devel/a7655158a6367ac46194d57f4b7433ef0772a73e.camel@mailbox.org/
Fixes: 93032ae634d4 ("drm/test: add a test suite for GEM objects backed by shmem")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_gem_shmem_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
index fd4215e2f982..925fbc2cda70 100644
--- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
+++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
@@ -214,10 +214,13 @@ static void drm_gem_shmem_test_get_pages_sgt(struct kunit *test)
 
 	sgt = drm_gem_shmem_get_sg_table(shmem);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
 	KUNIT_EXPECT_NULL(test, shmem->sgt);
 
+	ret = kunit_add_action_or_reset(test, kfree_wrapper, sgt);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	ret = kunit_add_action_or_reset(test, sg_free_table_wrapper, sgt);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	for_each_sgtable_sg(sgt, sg, si) {
 		KUNIT_EXPECT_NOT_NULL(test, sg);
-- 
2.49.0

