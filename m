Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F00429ADF4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 14:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DD96EB83;
	Tue, 27 Oct 2020 13:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FE86EB7A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603806724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8/2bpBz0hyBwDEWaq0chG+sMEQIBJVOfKIjc9RhBOFk=;
 b=YTOuYF2tUBFkjeLmXps6gaUHr23boRT9TtxdUThfdRiq7kO1fqLijSVRXremc04YmdlicK
 K9M+SnXydDiLV44YAKtsGjs4WfgndQXIJQicx1BuS4q7RDLNUCYZw3RcwXU5fs9fBURXxP
 HgwIrE84TpsfiLIAO5C99uSrYMLluz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-Z-2XA2YoOU6m0Y5o6IHJIw-1; Tue, 27 Oct 2020 09:52:00 -0400
X-MC-Unique: Z-2XA2YoOU6m0Y5o6IHJIw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FDFC809DD7;
 Tue, 27 Oct 2020 13:51:58 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-223.ams2.redhat.com [10.36.114.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D6B05D9DD;
 Tue, 27 Oct 2020 13:51:54 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH] drm/vboxvideo: Unmap iomem on probe-failure and remove
Date: Tue, 27 Oct 2020 14:51:53 +0100
Message-Id: <20201027135153.324873-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing pci_iounmap() calls to properly unmap the memory on
probe-failure and remove.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/vboxvideo/vbox_main.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
index d68d9bad7674..2eeb1d3be54a 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_main.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
@@ -71,6 +71,8 @@ static void vbox_accel_fini(struct vbox_private *vbox)
 
 	for (i = 0; i < vbox->num_crtcs; ++i)
 		vbva_disable(&vbox->vbva_info[i], vbox->guest_pool, i);
+
+	pci_iounmap(vbox->ddev.pdev, vbox->vbva_buffers);
 }
 
 /* Do we support the 4.3 plus mode hint reporting interface? */
@@ -124,19 +126,19 @@ int vbox_hw_init(struct vbox_private *vbox)
 	vbox->guest_pool = devm_gen_pool_create(vbox->ddev.dev, 4, -1,
 						"vboxvideo-accel");
 	if (!vbox->guest_pool)
-		return -ENOMEM;
+		goto out_unmap_guest_heap;
 
 	ret = gen_pool_add_virt(vbox->guest_pool,
 				(unsigned long)vbox->guest_heap,
 				GUEST_HEAP_OFFSET(vbox),
 				GUEST_HEAP_USABLE_SIZE, -1);
 	if (ret)
-		return ret;
+		goto out_unmap_guest_heap;
 
 	ret = hgsmi_test_query_conf(vbox->guest_pool);
 	if (ret) {
 		DRM_ERROR("vboxvideo: hgsmi_test_query_conf failed\n");
-		return ret;
+		goto out_unmap_guest_heap;
 	}
 
 	/* Reduce available VRAM size to reflect the guest heap. */
@@ -148,23 +150,30 @@ int vbox_hw_init(struct vbox_private *vbox)
 
 	if (!have_hgsmi_mode_hints(vbox)) {
 		ret = -ENOTSUPP;
-		return ret;
+		goto out_unmap_guest_heap;
 	}
 
 	vbox->last_mode_hints = devm_kcalloc(vbox->ddev.dev, vbox->num_crtcs,
 					     sizeof(struct vbva_modehint),
 					     GFP_KERNEL);
-	if (!vbox->last_mode_hints)
-		return -ENOMEM;
+	if (!vbox->last_mode_hints) {
+		ret = -ENOMEM;
+		goto out_unmap_guest_heap;
+	}
 
 	ret = vbox_accel_init(vbox);
 	if (ret)
-		return ret;
+		goto out_unmap_guest_heap;
 
 	return 0;
+
+out_unmap_guest_heap:
+	pci_iounmap(vbox->ddev.pdev, vbox->guest_pool);
+	return ret;
 }
 
 void vbox_hw_fini(struct vbox_private *vbox)
 {
 	vbox_accel_fini(vbox);
+	pci_iounmap(vbox->ddev.pdev, vbox->guest_pool);
 }
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
