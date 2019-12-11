Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B46E911AAA1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 13:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CB46EB29;
	Wed, 11 Dec 2019 12:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3826EB21
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 12:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576066806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aya/nycTrUQ34itusmCkgEMEDKSIN7dICC56yrlcxiA=;
 b=RX5+qDSux4bEGHeDt/pP8WfypqDIXYIad1G6OwYm2MDaSaCnkUuUD3pwNOPQWzLulICW85
 PIPxk6+Jcin/P5m1C7AzAeF2RyOe+iycFbrLGiUDGf7WV6SlZyOhxSrFT5FrtsgJBYuyaT
 8kGYqrdwnZ6CwMw+0RI/NjnYtcKYp5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-VbEHjdUdNpma6zsmh9Vx_A-1; Wed, 11 Dec 2019 07:20:02 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64BE5800D4C;
 Wed, 11 Dec 2019 12:20:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B25719756;
 Wed, 11 Dec 2019 12:19:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3DB3616E2D; Wed, 11 Dec 2019 13:19:57 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm: add pgprot callback to drm_gem_object_funcs
Date: Wed, 11 Dec 2019 13:19:53 +0100
Message-Id: <20191211121957.18637-2-kraxel@redhat.com>
In-Reply-To: <20191211121957.18637-1-kraxel@redhat.com>
References: <20191211121957.18637-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: VbEHjdUdNpma6zsmh9Vx_A-1
X-Mimecast-Spam-Score: 0
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 gurchetansingh@chromium.org, Gerd Hoffmann <kraxel@redhat.com>,
 tzimmermann@suse.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The callback allows drivers and helpers to tweak pgprot for mappings.
This is especially helpful when using shmem helpers.  It allows drivers
to switch mappings from writecombine (default) to something else (cached
for example) on a per-object base without having to supply their own
mmap() and vmap() functions.

The patch also adds two implementations for the callback, for cached and
writecombine mappings, and the drm_gem_pgprot() function to update
pgprot for a given object, using the new &drm_gem_object_funcs.pgprot
callback if available.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/drm/drm_gem.h     | 15 +++++++++++++
 drivers/gpu/drm/drm_gem.c | 46 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 0b375069cd48..5beef7226e69 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -163,6 +163,17 @@ struct drm_gem_object_funcs {
 	 */
 	int (*mmap)(struct drm_gem_object *obj, struct vm_area_struct *vma);
 
+	/**
+	 * @pgprot:
+	 *
+	 * Tweak pgprot as needed, typically used to set cache bits.
+	 *
+	 * This callback is optional.
+	 *
+	 * If unset drm_gem_pgprot_wc() will be used.
+	 */
+	pgprot_t (*pgprot)(struct drm_gem_object *obj, pgprot_t prot);
+
 	/**
 	 * @vm_ops:
 	 *
@@ -350,6 +361,10 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
 		     struct vm_area_struct *vma);
 int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
 
+pgprot_t drm_gem_pgprot_cached(struct drm_gem_object *obj, pgprot_t prot);
+pgprot_t drm_gem_pgprot_wc(struct drm_gem_object *obj, pgprot_t prot);
+pgprot_t drm_gem_pgprot(struct drm_gem_object *obj, pgprot_t prot);
+
 /**
  * drm_gem_object_get - acquire a GEM buffer object reference
  * @obj: GEM buffer object
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 56f42e0f2584..1c468fe8e342 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1119,7 +1119,8 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
 			return -EINVAL;
 
 		vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
-		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
+		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+		vma->vm_page_prot = drm_gem_pgprot(obj, vma->vm_page_prot);
 		vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 	}
 
@@ -1210,6 +1211,49 @@ int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 }
 EXPORT_SYMBOL(drm_gem_mmap);
 
+/**
+ * drm_gem_mmap - update pgprot for objects needing a cachable mapping.
+ * @obj: the GEM object.
+ * @prot: page attributes.
+ *
+ * This function can be used as &drm_gem_object_funcs.pgprot callback.
+ */
+pgprot_t drm_gem_pgprot_cached(struct drm_gem_object *obj, pgprot_t prot)
+{
+	return prot;
+}
+EXPORT_SYMBOL(drm_gem_pgprot_cached);
+
+/**
+ * drm_gem_mmap - update pgprot for objects needing a wc mapping.
+ * @obj: the GEM object.
+ * @prot: page attributes.
+ *
+ * This function can be used as &drm_gem_object_funcs.pgprot callback.
+ */
+pgprot_t drm_gem_pgprot_wc(struct drm_gem_object *obj, pgprot_t prot)
+{
+	return pgprot_writecombine(prot);
+}
+EXPORT_SYMBOL(drm_gem_pgprot_wc);
+
+/**
+ * drm_gem_mmap - update pgprot for a given gem object.
+ * @obj: the GEM object.
+ * @prot: page attributes.
+ *
+ * This function updates pgprot according to the needs of the given
+ * object.  If present &drm_gem_object_funcs.pgprot callback will be
+ * used, otherwise drm_gem_pgprot_wc() is called.
+ */
+pgprot_t drm_gem_pgprot(struct drm_gem_object *obj, pgprot_t prot)
+{
+	if (obj->funcs->pgprot)
+		return obj->funcs->pgprot(obj, prot);
+	return drm_gem_pgprot_wc(obj, prot);
+}
+EXPORT_SYMBOL(drm_gem_pgprot);
+
 void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 			const struct drm_gem_object *obj)
 {
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
