Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA39157221
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 10:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22026EBBB;
	Mon, 10 Feb 2020 09:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5ECF6EBBB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 09:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581328399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=EQcH6wJLiD9g3n9Tu78nR5jw6PUi4xBcpZHwLkK0q9k=;
 b=JJ6aAI/sf1vuIK5VJRQ60FZnOvaLBsPRWu20IT18On8G2na5D+/5FMy8CHNy0toB/fuOWJ
 DjtAQtumDx1h3+5StbYqAuQKahA9WMz1UFsR1PRZF8lWnmvLGOx/SGfzy7eI/vrqOYbTF+
 DNdSsQLzAP+Q9T6HHwm5ExOrMQiJj6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-pHdaI0TTOE6q5Yo8tzMWLQ-1; Mon, 10 Feb 2020 04:53:15 -0500
X-MC-Unique: pHdaI0TTOE6q5Yo8tzMWLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B5211005510;
 Mon, 10 Feb 2020 09:53:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 734955C1D4;
 Mon, 10 Feb 2020 09:53:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 53410A1E0; Mon, 10 Feb 2020 10:53:10 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/cirrus: add drm_driver.release callback.
Date: Mon, 10 Feb 2020 10:53:10 +0100
Message-Id: <20200210095310.22082-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move final cleanups from cirrus_pci_remove() to the new callback.
Add drm_atomic_helper_shutdown() call to cirrus_pci_remove().

Set pointers to NULL after iounmap() and check them before using
them to make sure we don't touch released hardware.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/cirrus/cirrus.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/cirrus.c
index a91fb0d7282c..128db11ed4d3 100644
--- a/drivers/gpu/drm/cirrus/cirrus.c
+++ b/drivers/gpu/drm/cirrus/cirrus.c
@@ -154,6 +154,9 @@ static void cirrus_set_start_address(struct cirrus_device *cirrus, u32 offset)
 	u32 addr;
 	u8 tmp;
 
+	if (!cirrus->mmio)
+		return;
+
 	addr = offset >> 2;
 	wreg_crt(cirrus, 0x0c, (u8)((addr >> 8) & 0xff));
 	wreg_crt(cirrus, 0x0d, (u8)(addr & 0xff));
@@ -179,6 +182,9 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
 	int tmp;
 	int sr07 = 0, hdr = 0;
 
+	if (!cirrus->mmio)
+		return -1;
+
 	htotal = mode->htotal / 8;
 	hsyncend = mode->hsync_end / 8;
 	hsyncstart = mode->hsync_start / 8;
@@ -301,6 +307,9 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 	struct cirrus_device *cirrus = fb->dev->dev_private;
 	void *vmap;
 
+	if (!cirrus->vram)
+		return -ENODEV;
+
 	vmap = drm_gem_shmem_vmap(fb->obj[0]);
 	if (!vmap)
 		return -ENOMEM;
@@ -502,6 +511,14 @@ static void cirrus_mode_config_init(struct cirrus_device *cirrus)
 
 /* ------------------------------------------------------------------ */
 
+static void cirrus_release(struct drm_device *dev)
+{
+	struct cirrus_device *cirrus = dev->dev_private;
+
+	drm_mode_config_cleanup(dev);
+	kfree(cirrus);
+}
+
 DEFINE_DRM_GEM_FOPS(cirrus_fops);
 
 static struct drm_driver cirrus_driver = {
@@ -515,6 +532,7 @@ static struct drm_driver cirrus_driver = {
 
 	.fops		 = &cirrus_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
+	.release         = cirrus_release,
 };
 
 static int cirrus_pci_probe(struct pci_dev *pdev,
@@ -599,11 +617,12 @@ static void cirrus_pci_remove(struct pci_dev *pdev)
 	struct cirrus_device *cirrus = dev->dev_private;
 
 	drm_dev_unregister(dev);
-	drm_mode_config_cleanup(dev);
+	drm_atomic_helper_shutdown(dev);
 	iounmap(cirrus->mmio);
+	cirrus->mmio = NULL;
 	iounmap(cirrus->vram);
+	cirrus->vram = NULL;
 	drm_dev_put(dev);
-	kfree(cirrus);
 	pci_release_regions(pdev);
 }
 
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
