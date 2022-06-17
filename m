Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D00354FD32
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 21:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB0710F4B0;
	Fri, 17 Jun 2022 19:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A4D10F409;
 Fri, 17 Jun 2022 19:05:47 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D653D660188F;
 Fri, 17 Jun 2022 20:05:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655492746;
 bh=xMYv7v3aHxlEQIE2QtkE00E2gW9W0dS8yiKhilZWusw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dAVY77wpcO6Bp+jrFpjoE6HElhGM5esj4asmzkFh4NMDCpZ3A74k/c0iCzIOYMZS6
 AQZfO/+hVVQ8RGW8RkNqztDa2/GE6tMo4pp/OQ6f4Nwx7uqOsh8PAe1DN+wiIeGwJf
 B2GSDYNmv82fggknXiLimmfaeIpHvicT9DlWhSsC6MKWRTggqfxPW/ZzP/bNgypdQj
 e2J8X8WlP80Xj5iTMeJ3nPeZbccdqWQfBawZpUhA7IUiq46q7j1qi5NfD4VWz75jsO
 IdrzFXcTHwkZ1WpOogrGpNNeATkqxOPal+8i0vgsMf7+J+uaQhu6G0rGxaDX2roFVh
 BsuTV32LbSpPQ==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v6 08/10] drm/i915: allow memory region creators to alloc and
 free the region
Date: Fri, 17 Jun 2022 19:05:14 +0000
Message-Id: <20220617190516.2805572-9-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220617190516.2805572-1-bob.beckett@collabora.com>
References: <20220617190516.2805572-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 kernel@collabora.com, Matthew Auld <matthew.auld@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add callbacks for alloc and free.
this allows region creators to allocate any extra storage they may
require.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/intel_memory_region.c | 16 +++++++++++++---
 drivers/gpu/drm/i915/intel_memory_region.h |  2 ++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index e38d2db1c3e3..3da07a712f90 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -231,7 +231,10 @@ intel_memory_region_create(struct drm_i915_private *i915,
 	struct intel_memory_region *mem;
 	int err;
 
-	mem = kzalloc(sizeof(*mem), GFP_KERNEL);
+	if (ops->alloc)
+		mem = ops->alloc();
+	else
+		mem = kzalloc(sizeof(*mem), GFP_KERNEL);
 	if (!mem)
 		return ERR_PTR(-ENOMEM);
 
@@ -265,7 +268,10 @@ intel_memory_region_create(struct drm_i915_private *i915,
 	if (mem->ops->release)
 		mem->ops->release(mem);
 err_free:
-	kfree(mem);
+	if (mem->ops->free)
+		mem->ops->free(mem);
+	else
+		kfree(mem);
 	return ERR_PTR(err);
 }
 
@@ -288,7 +294,11 @@ void intel_memory_region_destroy(struct intel_memory_region *mem)
 
 	GEM_WARN_ON(!list_empty_careful(&mem->objects.list));
 	mutex_destroy(&mem->objects.lock);
-	if (!ret)
+	if (ret)
+		return;
+	if (mem->ops->free)
+		mem->ops->free(mem);
+	else
 		kfree(mem);
 }
 
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 3d8378c1b447..048955b5429f 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -61,6 +61,8 @@ struct intel_memory_region_ops {
 			   resource_size_t size,
 			   resource_size_t page_size,
 			   unsigned int flags);
+	struct intel_memory_region *(*alloc)(void);
+	void (*free)(struct intel_memory_region *mem);
 };
 
 struct intel_memory_region {
-- 
2.25.1

