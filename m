Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19563CB328C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 15:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1F910E73F;
	Wed, 10 Dec 2025 14:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="h95UXSRX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720AA10E73F;
 Wed, 10 Dec 2025 14:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765377382;
 bh=tTfcgRETl2t2I3dep/TgD6ohjnW/UmkiLVr15PJh4Kg=;
 h=From:To:Cc:Subject:Date:From;
 b=h95UXSRX+GFyZw/XW+bC7oUvT4uByciiW+jJVXUzbByIPlcwhtZiDKXrrailnCvUW
 idRNi5dDEbm2ji8LSSb8mZKb8pkEKM9sfpip7PHclFDYF6KK2lseeFuMCKpBHyI7u4
 XTUpeFKKxAceYouJEtGtf0pMgutng6tmlWFjup6niV02W1HAbMo6BuXaboN1ZDyJZE
 h2I/5AJ9YIzevhjSVf8+738TjKVX0l4zkUke6XRHQh8yuEFl7tyhHPQArfJRi2hh/q
 ehzT6utAJO6AOU73X1TczRtZxD0NhdlaDm5FebYY5eyXpf4EhePhgBnYXV2gHN33/o
 SmnBRyGxBfMmA==
Received: from debian-rockchip-rock5b-rk3588.. (unknown
 [IPv6:2a01:e0a:5e3:6100:826d:bc07:e98c:84a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7DB6317E13CD;
 Wed, 10 Dec 2025 15:36:22 +0100 (CET)
From: =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>,
 =?UTF-8?q?Miko=C5=82aj=20Wasiak?= <mikolaj.wasiak@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Christopher Healy <healych@amazon.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH v2] drm/i915: Fix BO alloc flags
Date: Wed, 10 Dec 2025 15:36:17 +0100
Message-ID: <20251210143617.712808-1-loic.molinari@collabora.com>
X-Mailer: git-send-email 2.47.3
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

I915_BO_ALLOC_NOTHP must be added to the I915_BO_ALLOC_FLAGS mask in
order to pass GEM_BUG_ON() valid flags checks.

v2:
- Add Tvrtko's A-b

Reported-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Closes: https://lore.kernel.org/intel-gfx/d73adfa8-d61b-46b3-9385-dde53d8db8ad@intel.com/
Fixes: a8a9a590221c ("drm/i915: Use huge tmpfs mountpoint helpers")
Suggested-by: Tvrtko Ursulin <tursulin@ursulin.net>
Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
Acked-by: Tvrtko Ursulin <tursulin@ursulin.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index f94409e8ec4c..35d4c7d0c579 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -363,6 +363,7 @@ struct drm_i915_gem_object {
 			     I915_BO_ALLOC_PM_EARLY | \
 			     I915_BO_ALLOC_GPU_ONLY | \
 			     I915_BO_ALLOC_CCS_AUX | \
+			     I915_BO_ALLOC_NOTHP | \
 			     I915_BO_PREALLOC)
 #define I915_BO_READONLY          BIT(10)
 #define I915_TILING_QUIRK_BIT     11 /* unknown swizzling; do not release! */
-- 
2.47.3

