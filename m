Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 856D695E563
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2024 23:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585D110E070;
	Sun, 25 Aug 2024 21:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Ank4li6u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com
 [91.218.175.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845B710E06B
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2024 21:19:47 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1724620785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sLbhQyosuMgaDHpyK8Ik2GZonV/i451ZkcNyo7o4Klg=;
 b=Ank4li6uKLashLRJebuBqMNVJAbsVilbMMwfvE1m0KuoGhu3su+xqWUwbSgotOfUgsG+9N
 VvRij9u1KKcsaidwYwdsfJPIluV0TWmT3DfY4M06PEmWmje/6D+i9TfMRUMOM9ajNe9VKE
 NCP5z37M14j9M+Ds1Y3R7n5wqNLzkUc=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH 1/2] drm/etnaviv: Implement drm_gem_object_funcs::print_info()
Date: Mon, 26 Aug 2024 05:19:28 +0800
Message-Id: <20240825211929.614631-2-sui.jingfeng@linux.dev>
In-Reply-To: <20240825211929.614631-1-sui.jingfeng@linux.dev>
References: <20240825211929.614631-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

It will be called by drm_gem_print_info() if have implemented, and this can
provide more information about the framebuffer objects.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 32 +++++++++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gem.h |  2 +-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 5c0c9d4e3be1..9a688c95f34d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -533,8 +533,40 @@ static const struct vm_operations_struct vm_ops = {
 	.close = drm_gem_vm_close,
 };
 
+static const char *etnaviv_gem_obj_caching_info(u32 flags)
+{
+	switch (flags & ETNA_BO_CACHE_MASK) {
+	case ETNA_BO_CACHED:
+		return "cached";
+	case ETNA_BO_UNCACHED:
+		return "uncached";
+	case ETNA_BO_WC:
+		return "write-combine";
+	default:
+		break;
+	}
+
+	return "unknown";
+}
+
+static void etnaviv_gem_object_info(struct drm_printer *p,
+				    unsigned int indent,
+				    const struct drm_gem_object *obj)
+{
+	const struct etnaviv_gem_object *etnaviv_obj;
+
+	etnaviv_obj = container_of(obj, struct etnaviv_gem_object, base);
+
+	drm_printf_indent(p, indent, "caching mode=%s\n",
+			  etnaviv_gem_obj_caching_info(etnaviv_obj->flags));
+	drm_printf_indent(p, indent, "active=%s\n",
+			  str_yes_no(is_active(etnaviv_obj)));
+	drm_printf_indent(p, indent, "vaddr=%p\n", etnaviv_obj->vaddr);
+}
+
 static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
 	.free = etnaviv_gem_free_object,
+	.print_info = etnaviv_gem_object_info,
 	.pin = etnaviv_gem_prime_pin,
 	.unpin = etnaviv_gem_prime_unpin,
 	.get_sg_table = etnaviv_gem_prime_get_sg_table,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
index a42d260cac2c..3f8fe19a77cc 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
@@ -68,7 +68,7 @@ struct etnaviv_gem_ops {
 	int (*mmap)(struct etnaviv_gem_object *, struct vm_area_struct *);
 };
 
-static inline bool is_active(struct etnaviv_gem_object *etnaviv_obj)
+static inline bool is_active(const struct etnaviv_gem_object *etnaviv_obj)
 {
 	return atomic_read(&etnaviv_obj->gpu_active) != 0;
 }
-- 
2.34.1

