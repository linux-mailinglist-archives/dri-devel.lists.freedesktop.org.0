Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F05CF9724
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 17:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4728D10E51C;
	Tue,  6 Jan 2026 16:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BDCEmsoT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D64F10E51C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 16:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767718183;
 bh=LnO06ZmGejv8YZcopbGi/EMWYJSf0vXnCgMVlk5FR60=;
 h=From:To:Cc:Subject:Date:From;
 b=BDCEmsoTLMCoU/cTlu3Hp/Q78w4ajZXdZ8sppNcf8Dc5x8eSh4xWhReiinrN3fLWE
 QI13t2TCenhkV7IoKCJcKg5CaWUjDAZQdD9S1YD5iDZzvx+l1loNJm1xoT1xV2I+5b
 1huzKylkgUmTSU5NLR232fBmAbiLi+LpTRf6RF5Mh4l/TwZ8M+RfjfVcFBV5TInZMY
 PijSjZ55tJuN9MWJ9J7nkujwh1RfAWW1oUrhmG49T5dO/13o8hhR0UigYUvzweCaWX
 ED8q05fxwLGJ+1Y0bMg6ii5EJ9H/JQpio6bc2qkLaSk7StdTQQxr6qqVggL+cjTGWB
 9Y2B5xmNYHEqg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0A4A317E1214;
 Tue,  6 Jan 2026 17:49:43 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>
Subject: [PATCH] drm/gem: Fix a GEM leak in drm_gem_get_unmapped_area()
Date: Tue,  6 Jan 2026 17:49:35 +0100
Message-ID: <20260106164935.409765-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.52.0
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

drm_gem_object_lookup_at_offset() can return a valid object with
filp or filp->f_op->get_unmapped_area set to NULL. Make sure we still
release the ref we acquired on such objects.

Cc: Loïc Molinari <loic.molinari@collabora.com>
Fixes: 99bda20d6d4c ("drm/gem: Introduce drm_gem_get_unmapped_area() fop")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_gem.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 36c8af123877..f7cbf6e8d1e0 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1298,11 +1298,13 @@ unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
 	unsigned long ret;
 
 	obj = drm_gem_object_lookup_at_offset(filp, pgoff, len >> PAGE_SHIFT);
-	if (IS_ERR(obj) || !obj->filp || !obj->filp->f_op->get_unmapped_area)
-		return mm_get_unmapped_area(filp, uaddr, len, 0, flags);
+	if (IS_ERR(obj))
+		obj = NULL;
 
-	ret = obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0,
-						 flags);
+	if (!obj || !obj->filp || !obj->filp->f_op->get_unmapped_area)
+		ret = mm_get_unmapped_area(filp, uaddr, len, 0, flags);
+	else
+		ret = obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0, flags);
 
 	drm_gem_object_put(obj);
 
-- 
2.52.0

