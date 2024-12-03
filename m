Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4E19E1778
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 10:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C57110E9AE;
	Tue,  3 Dec 2024 09:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="K7hEBWWv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5BC10E9AE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 09:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733218145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LLFrnYQ41CCOjuPl6f8oeYH5LOqoEfmgCGYQJHMDPKs=;
 b=K7hEBWWvW2KCNTHcrI2wbD5UDVabtBLl23lv3BdyCukR4a6gDedROcgZqF7uU4J6Jb8N8p
 Anp4LKHW5cU/4fv+mQxL+4EvoT2cXfxrWMvMqbA5GBLLPpNJqXo5AFMqYpPfoXu8+uIpdr
 vqQvi08yLOylocINp8y+MPOdtwWkwa8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-PxBEi9Z0NFycgyb8Te_jHg-1; Tue,
 03 Dec 2024 04:29:02 -0500
X-MC-Unique: PxBEi9Z0NFycgyb8Te_jHg-1
X-Mimecast-MFC-AGG-ID: PxBEi9Z0NFycgyb8Te_jHg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AF0BA1955DD7; Tue,  3 Dec 2024 09:29:00 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.255])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 39D1819560A3; Tue,  3 Dec 2024 09:28:56 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v2 1/5] drm/i915/fbdev: Add intel_fbdev_get_vaddr()
Date: Tue,  3 Dec 2024 09:50:18 +0100
Message-ID: <20241203092836.426422-2-jfalempe@redhat.com>
In-Reply-To: <20241203092836.426422-1-jfalempe@redhat.com>
References: <20241203092836.426422-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

The vaddr of the fbdev framebuffer is private to the struct
intel_fbdev, so this function is needed to access it for drm_panic.
Also the struct i915_vma is different between i915 and xe, so it
requires a few functions to access fbdev->vma->iomap.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v2:
 * Add intel_fb_get_vaddr() and i915_vma_get_iomap() to build with Xe driver.

 drivers/gpu/drm/i915/display/intel_fb_pin.c | 5 +++++
 drivers/gpu/drm/i915/display/intel_fb_pin.h | 1 +
 drivers/gpu/drm/i915/display/intel_fbdev.c  | 5 +++++
 drivers/gpu/drm/i915/display/intel_fbdev.h  | 6 ++++++
 drivers/gpu/drm/i915/i915_vma.h             | 5 +++++
 drivers/gpu/drm/xe/display/xe_fb_pin.c      | 5 +++++
 6 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index d3a86f9c6bc86..c44019c7ab56b 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
@@ -327,3 +327,8 @@ void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
 			intel_dpt_unpin_from_ggtt(fb->dpt_vm);
 	}
 }
+
+void *intel_fb_get_vaddr(struct i915_vma *vma)
+{
+	return i915_vma_get_iomap(vma);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.h b/drivers/gpu/drm/i915/display/intel_fb_pin.h
index ac0319b53af08..0141f5f2b1c7a 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.h
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.h
@@ -25,5 +25,6 @@ void intel_fb_unpin_vma(struct i915_vma *vma, unsigned long flags);
 
 int intel_plane_pin_fb(struct intel_plane_state *plane_state);
 void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state);
+void *intel_fb_get_vaddr(struct i915_vma *vma);
 
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 00852ff5b2470..1d12d1c047d02 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -695,3 +695,8 @@ struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev)
 
 	return to_intel_framebuffer(fbdev->helper.fb);
 }
+
+void *intel_fbdev_get_vaddr(struct intel_fbdev *fbdev)
+{
+	return intel_fb_get_vaddr(fbdev->vma);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.h b/drivers/gpu/drm/i915/display/intel_fbdev.h
index 08de2d5b34338..f033d4f1efe96 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.h
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.h
@@ -17,6 +17,7 @@ struct intel_framebuffer;
 void intel_fbdev_setup(struct drm_i915_private *dev_priv);
 void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous);
 struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev);
+void *intel_fbdev_get_vaddr(struct intel_fbdev *fbdev);
 #else
 static inline void intel_fbdev_setup(struct drm_i915_private *dev_priv)
 {
@@ -30,6 +31,11 @@ static inline struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbd
 {
 	return NULL;
 }
+
+static inline void *intel_fbdev_get_vaddr(struct intel_fbdev *fbdev)
+{
+	return NULL;
+}
 #endif
 
 #endif /* __INTEL_FBDEV_H__ */
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 6a6be8048aa83..4ae610927fa77 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -353,6 +353,11 @@ static inline bool i915_node_color_differs(const struct drm_mm_node *node,
 	return drm_mm_node_allocated(node) && node->color != color;
 }
 
+static inline void __iomem *i915_vma_get_iomap(struct i915_vma *vma)
+{
+	return READ_ONCE(vma->iomap);
+}
+
 /**
  * i915_vma_pin_iomap - calls ioremap_wc to map the GGTT VMA via the aperture
  * @vma: VMA to iomap
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 761510ae06904..576b1e98f39cd 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -421,3 +421,8 @@ u64 intel_dpt_offset(struct i915_vma *dpt_vma)
 {
 	return 0;
 }
+
+void *intel_fb_get_vaddr(struct i915_vma *vma)
+{
+	return NULL;
+}
-- 
2.47.1

