Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7E9AEC79A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 16:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B1A10E08C;
	Sat, 28 Jun 2025 14:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j/FEMnV8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF8F10E08C
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 14:23:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 08B75A520CA;
 Sat, 28 Jun 2025 14:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8313C4CEEA;
 Sat, 28 Jun 2025 14:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751120591;
 bh=pd0DP6kng5GcWSShQyiaIvgUBhaEPLWmfJ4sGXeKgy4=;
 h=From:To:Cc:Subject:Date:From;
 b=j/FEMnV8Mm5qqD3TwTTmuK9Hd2diNS8HWnAtBPW4sj54dV6lf9EnsxZvWt6I2hR6r
 I875Lc9jDR+DnJJqgYm1GwJEXWRe9wfLrJT9ynH1iRTmVcOLvGqEao2byS5H5fZ4bW
 xevpV3F3xT36n1tT3Uti4uXV38eDQ9dUODGDGjZx5u7uuvn7JOk1Ox5fg5sjGriXvR
 /L6uGDCeYQ1+rUIvOk0pxLFqAspbbjQP2Cz+jHj2NDUyHXDvh6YYTeF484gH8kiSA8
 f0blT+I/wz0mPB9M1l8d7BIeG5M5iiUhbhBEJi9qP3MZqFAGT3EkZzyoqKRHnwf89y
 2WqqrPvQjxBow==
From: Sasha Levin <sashal@kernel.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Subject: [PATCH] drm/tests: Initialize framebuffer's filp_head in
 drm_test_framebuffer_free()
Date: Sat, 28 Jun 2025 10:23:08 -0400
Message-Id: <20250628142308.903037-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
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

The drm_test_framebuffer_free() test creates a framebuffer on the stack
without properly initializing the filp_head list, causing the following
warning when drm_framebuffer_free() checks it:

[  144.996969] drm-kunit-mock-device drm_test_framebuffer_free.drm-kunit-mock-device: [drm] drm_WARN_ON(\!list_empty(&fb->filp_head))
[  144.997097] WARNING: CPU: 0 PID: 2546 at drivers/gpu/drm/drm_framebuffer.c:832 drm_framebuffer_free+0x13f/0x1c0

The test intentionally creates a partially initialized framebuffer
to test an edge case in drm_framebuffer_free(), but it needs to
initialize the filp_head list to avoid triggering the warning on
uninitialized list data.

Initialize the filp_head list in the test to match the behavior of
drm_framebuffer_init().

Fixes: d21942560499 ("drm/tests: Add test for drm_framebuffer_free()")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 6ea04cc8f3241..81a7f2cfb8ed6 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -677,6 +677,7 @@ static void drm_test_framebuffer_free(struct kunit *test)
 	};
 	int id, ret;
 
+	INIT_LIST_HEAD(&fb.filp_head);
 	priv->buffer_freed = false;
 
 	/*
-- 
2.39.5

