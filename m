Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6921182FE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 10:05:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CBB6E876;
	Tue, 10 Dec 2019 09:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 342 seconds by postgrey-1.36 at gabe;
 Tue, 10 Dec 2019 09:05:03 UTC
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A83A6E871
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 09:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575968702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=B3uP/SCLcrRR2RNPhR22qrcwSwHoRfQCsZKJS7KksnQ=;
 b=JOzkvO3mBsBGiH94qM7oGySz2RGE0CiuEgXmzmsr03tcMD25by9IF0kgceu3FN+QDJUUjL
 1Ty08C3VpNfRDOlUxGbIHV0Xml6/81adaw5lyopbcfBIZfdtqtuvypd7tuglCKrtddiZge
 dLIe9vQCf88q79WcZckRw+z2drRUcHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-5yTMreCZOyGtterTydZw-g-1; Tue, 10 Dec 2019 03:58:05 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA41318557E6;
 Tue, 10 Dec 2019 08:58:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E04E6F12C;
 Tue, 10 Dec 2019 08:58:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 95C5E16E18; Tue, 10 Dec 2019 09:57:59 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: fix mmap page attributes
Date: Tue, 10 Dec 2019 09:57:59 +0100
Message-Id: <20191210085759.14763-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 5yTMreCZOyGtterTydZw-g-1
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
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>, gurchetansingh@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

virtio-gpu uses cached mappings.  shmem helpers use writecombine though.
So roll our own mmap function, wrapping drm_gem_shmem_mmap(), to tweak
vm_page_prot accordingly.

Reported-by: Gurchetan Singh <gurchetansingh@chromium.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 017a9e0fc3bb..158610902054 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -75,6 +75,22 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
 	drm_gem_shmem_free_object(obj);
 }
 
+static int virtio_gpu_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	pgprot_t prot;
+	int ret;
+
+	ret = drm_gem_shmem_mmap(obj, vma);
+	if (ret < 0)
+		return ret;
+
+	/* virtio-gpu needs normal caching, so clear writecombine */
+	prot = vm_get_page_prot(vma->vm_flags);
+	prot = pgprot_decrypted(prot);
+	vma->vm_page_prot = prot;
+	return 0;
+}
+
 static const struct drm_gem_object_funcs virtio_gpu_gem_funcs = {
 	.free = virtio_gpu_free_object,
 	.open = virtio_gpu_gem_object_open,
@@ -86,7 +102,7 @@ static const struct drm_gem_object_funcs virtio_gpu_gem_funcs = {
 	.get_sg_table = drm_gem_shmem_get_sg_table,
 	.vmap = drm_gem_shmem_vmap,
 	.vunmap = drm_gem_shmem_vunmap,
-	.mmap = &drm_gem_shmem_mmap,
+	.mmap = &virtio_gpu_gem_mmap,
 };
 
 struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
