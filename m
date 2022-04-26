Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3839C5103C8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F6510E89C;
	Tue, 26 Apr 2022 16:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B8410E88C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 16:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650991347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W/+N+QQ461ib+TvPRqG8FBgRVnzHvofaeIKEDBoj86U=;
 b=Zz/AmE8oZeDORv4oxVwOPCzQqB/RoF+xvFzI3Bc9gYeBNjra3DH3lWR391rIbWp+8opMG2
 ceeaW9ImyWUls0fCSQsesz5p6UyL49C/CFJ0hyXdTM7JnmM1NtmIv/q61cTv40fYHWCeao
 vBmxyr1e6xJZv2lZQhpUA1gRs/w0VOY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-0fFTS3_ZOYuURlS0evKuvg-1; Tue, 26 Apr 2022 12:42:24 -0400
X-MC-Unique: 0fFTS3_ZOYuURlS0evKuvg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CDA83C01D9B;
 Tue, 26 Apr 2022 16:42:24 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 169982024CB8;
 Tue, 26 Apr 2022 16:42:19 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] mgag200: remove mgag200_probe_vram()
Date: Tue, 26 Apr 2022 18:41:08 +0200
Message-Id: <20220426164108.1051295-5-jfalempe@redhat.com>
In-Reply-To: <20220426164108.1051295-1-jfalempe@redhat.com>
References: <20220426164108.1051295-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, michel@daenzer.net,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function writes some pattern to video memory, to check for conflict.
In case of conflicts, it returns a random memory capacity (offset of the
conflict).
Using devm_arch_io_reserve_memtype_wc() should garantee that no other
driver is using this memory region.
In case of real memory conflicts, as it is video memory, the user will
notice it easily. So there is no need for this function.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_mm.c | 50 ++++------------------------
 1 file changed, 7 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mm.c b/drivers/gpu/drm/mgag200/mgag200_mm.c
index fa996d46feed..68299b560a98 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mm.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mm.c
@@ -32,48 +32,6 @@
 
 #include "mgag200_drv.h"
 
-static size_t mgag200_probe_vram(struct mga_device *mdev, void __iomem *mem,
-				 size_t size)
-{
-	int offset;
-	int orig;
-	int test1, test2;
-	int orig1, orig2;
-	size_t vram_size;
-
-	/* Probe */
-	orig = ioread16(mem);
-	iowrite16(0, mem);
-
-	vram_size = size;
-
-	if ((mdev->type == G200_EW3) && (vram_size >= 0x1000000))
-		vram_size = vram_size - 0x400000;
-
-	for (offset = 0x100000; offset < vram_size; offset += 0x4000) {
-		orig1 = ioread8(mem + offset);
-		orig2 = ioread8(mem + offset + 0x100);
-
-		iowrite16(0xaa55, mem + offset);
-		iowrite16(0xaa55, mem + offset + 0x100);
-
-		test1 = ioread16(mem + offset);
-		test2 = ioread16(mem);
-
-		iowrite16(orig1, mem + offset);
-		iowrite16(orig2, mem + offset + 0x100);
-
-		if (test1 != 0xaa55)
-			break;
-
-		if (test2)
-			break;
-	}
-
-	iowrite16(orig, mem);
-
-	return offset - 65536;
-}
 
 int mgag200_mm_init(struct mga_device *mdev)
 {
@@ -81,6 +39,7 @@ int mgag200_mm_init(struct mga_device *mdev)
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	u8 misc;
 	resource_size_t start, len;
+	size_t vram_size;
 
 	WREG_ECRT(0x04, 0x00);
 
@@ -106,7 +65,12 @@ int mgag200_mm_init(struct mga_device *mdev)
 	if (!mdev->vram)
 		return -ENOMEM;
 
-	mdev->mc.vram_size = mgag200_probe_vram(mdev, mdev->vram, len);
+	vram_size = len;
+	/* G200_EW3 has only 12MB of memory */
+	if ((mdev->type == G200_EW3) && (vram_size >= 0x1000000))
+		vram_size -= 0x400000;
+
+	mdev->mc.vram_size = vram_size;
 	mdev->mc.vram_base = start;
 	mdev->mc.vram_window = len;
 
-- 
2.35.1

