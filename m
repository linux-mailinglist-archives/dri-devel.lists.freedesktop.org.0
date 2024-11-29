Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28A89DEAE4
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 17:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517D510E536;
	Fri, 29 Nov 2024 16:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XRuGXFkB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AE410E532
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 16:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732897390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F93S9jON3uAswTWLAbKIhbx+FXZiIHrE6PHfT6a61ts=;
 b=XRuGXFkB1ub07i+HX2OXSJBkxjLqu3KJW71ZMi5bhpfs11JIPITXw4caPbXS6pA8qCMeis
 mJF//W2Pyau41UrxgVqDRpCrBw/2+kt53FastWKXDj+EbZT0eynlxcNnpvGLfnAwoHg1yt
 ZlipvNrbAdXEwMJbL9+wgITeDE11vv4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-221-Wc26PsTrN_yIOe25ipdCYw-1; Fri,
 29 Nov 2024 11:23:07 -0500
X-MC-Unique: Wc26PsTrN_yIOe25ipdCYw-1
X-Mimecast-MFC-AGG-ID: Wc26PsTrN_yIOe25ipdCYw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D958C195608C; Fri, 29 Nov 2024 16:23:05 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.13])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A60C01955F41; Fri, 29 Nov 2024 16:23:02 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 4/5] drm/i915/gem: export i915_gem_object_map_page/pfn
Date: Fri, 29 Nov 2024 17:20:29 +0100
Message-ID: <20241129162232.7594-5-jfalempe@redhat.com>
In-Reply-To: <20241129162232.7594-1-jfalempe@redhat.com>
References: <20241129162232.7594-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

Prepare the work for drm_panic support. They are used to map the
current framebuffer, so the CPU can access it, and draws the panic
screen.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 5 +++++
 drivers/gpu/drm/i915/gem/i915_gem_pages.c  | 4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 3dc61cbd2e11f..3f99d021f9221 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -694,6 +694,11 @@ i915_gem_object_unpin_pages(struct drm_i915_gem_object *obj)
 int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj);
 int i915_gem_object_truncate(struct drm_i915_gem_object *obj);
 
+void *i915_gem_object_map_page(struct drm_i915_gem_object *obj,
+				      enum i915_map_type type);
+void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
+				     enum i915_map_type type);
+
 /**
  * i915_gem_object_pin_map - return a contiguous mapping of the entire object
  * @obj: the object to map into kernel address space
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 8780aa2431053..76c023d2fbb1f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -268,7 +268,7 @@ int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj)
 }
 
 /* The 'mapping' part of i915_gem_object_pin_map() below */
-static void *i915_gem_object_map_page(struct drm_i915_gem_object *obj,
+void *i915_gem_object_map_page(struct drm_i915_gem_object *obj,
 				      enum i915_map_type type)
 {
 	unsigned long n_pages = obj->base.size >> PAGE_SHIFT, i;
@@ -325,7 +325,7 @@ static void *i915_gem_object_map_page(struct drm_i915_gem_object *obj,
 	return vaddr ?: ERR_PTR(-ENOMEM);
 }
 
-static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
+void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
 				     enum i915_map_type type)
 {
 	resource_size_t iomap = obj->mm.region->iomap.base -
-- 
2.47.0

