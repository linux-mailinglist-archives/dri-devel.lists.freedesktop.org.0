Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1A4AF6653
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 01:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164CA10E7B0;
	Wed,  2 Jul 2025 23:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=caterina.shablia@collabora.com header.b="kAMl6Osk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2F110E7AE
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 23:37:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1751499467; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HFqgAMXNOgWpa1hKJ0HCmKlNEdCOZdC7m7Kl9ZdFRRIWR/I1ubkMf7uig3dXawOq8A/IALa4mZ4J4AVoQrhkrVbS7vXwoMMNC7rIKneyrhNML3wugHQD0yoaqEjUEJhQCXbfo5kGFqrjxUREZTjnhs0m3is9/3E37vbn/qCeLdA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1751499467;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=FUvgtE41glFvTH2scrm4EpwUw9kg8Nm0tZHMNDvhaCc=; 
 b=j2+n+1WDfYHZdB0xNk8RBUzYmrBe4R0PJ5UTAt5/RXePIHcjERzSqrAhdi5jcPR3VhxfYmWZ74fdNoYadxRWv8qcNAxOjUAV75d7VzkKXp7O0JJKd2BU8CJmHzFeDZLqE13GLhRrFNeYOsk8RFBPELLA3dSxLFOudeKZrQX2jZc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=caterina.shablia@collabora.com;
 dmarc=pass header.from=<caterina.shablia@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751499466; 
 s=zohomail; d=collabora.com; i=caterina.shablia@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=FUvgtE41glFvTH2scrm4EpwUw9kg8Nm0tZHMNDvhaCc=;
 b=kAMl6OskCVgLij5QEPpqxyuR4rP6ygXJKQAtnJxxmGMIQDw9Kr8rN6klObovYkeN
 +8ScCFB5AjUGhI7SDrOmAvkc9kKuRhXWFQ/b8NPdZ3OKkEZt6ZPUuoYoys6b++fYDrh
 O1QbR1pQ0QfTTfeZivGLpm1bGW+hwZ6r29aujfI4=
Received: by mx.zohomail.com with SMTPS id 1751499465342857.980489350829;
 Wed, 2 Jul 2025 16:37:45 -0700 (PDT)
From: Caterina Shablia <caterina.shablia@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, Caterina Shablia <caterina.shablia@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] drm/gpuvm: Kill drm_gpuva_init()
Date: Wed,  2 Jul 2025 23:36:04 +0000
Message-ID: <20250702233621.12990-3-caterina.shablia@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250702233621.12990-1-caterina.shablia@collabora.com>
References: <20250702233621.12990-1-caterina.shablia@collabora.com>
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

From: Boris Brezillon <boris.brezillon@collabora.com>

drm_gpuva_init() only has one internal user, and given we are about to
add new optional fields, it only add maintenance burden for no real
benefit, so let's kill the thing now.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
---
 include/drm/drm_gpuvm.h | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 2a9629377633..6fdf2aff3e90 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -160,15 +160,6 @@ struct drm_gpuva *drm_gpuva_find_first(struct drm_gpuvm *gpuvm,
 struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuvm *gpuvm, u64 start);
 struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuvm *gpuvm, u64 end);
 
-static inline void drm_gpuva_init(struct drm_gpuva *va, u64 addr, u64 range,
-				  struct drm_gem_object *obj, u64 offset)
-{
-	va->va.addr = addr;
-	va->va.range = range;
-	va->gem.obj = obj;
-	va->gem.offset = offset;
-}
-
 /**
  * drm_gpuva_invalidate() - sets whether the backing GEM of this &drm_gpuva is
  * invalidated
@@ -1079,8 +1070,10 @@ void drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
 static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
 					  struct drm_gpuva_op_map *op)
 {
-	drm_gpuva_init(va, op->va.addr, op->va.range,
-		       op->gem.obj, op->gem.offset);
+	va->va.addr = op->va.addr;
+	va->va.range = op->va.range;
+	va->gem.obj = op->gem.obj;
+	va->gem.offset = op->gem.offset;
 }
 
 /**
-- 
2.47.2

