Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CECC4192B62
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 15:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66956E875;
	Wed, 25 Mar 2020 14:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD8D6E870
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 14:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585147396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dqoV/KEwx95ZHleBlKYKHLasQWHeps4CF+K8aw8lRJc=;
 b=TiyDZ7N5Y9z059pPHWmn5425d3F+CS77PnoLIG0CeZxGP4/Z92/zbrMH+AC2KmRZtsBznb
 nkeS3LsLFKhU3l35XRh7dYPxQDVLpo4oM1bG7iKoFSQa2Z2LFwEbwa5WmW+8v3yHR+6KkD
 DJyPikB3L2DOhfe62L5mkgM3ecWVKuE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-oUA_TMZGM-m3eTOr4kV0kg-1; Wed, 25 Mar 2020 10:43:15 -0400
X-MC-Unique: oUA_TMZGM-m3eTOr4kV0kg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDDDBDB60;
 Wed, 25 Mar 2020 14:43:13 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-213.ams2.redhat.com
 [10.36.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D73010002A7;
 Wed, 25 Mar 2020 14:43:12 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH] drm/vboxvideo: Add missing
 remove_conflicting_pci_framebuffers call
Date: Wed, 25 Mar 2020 15:43:10 +0100
Message-Id: <20200325144310.36779-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Hans de Goede <hdegoede@redhat.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vboxvideo driver is missing a call to remove conflicting framebuffers.

Surprisingly, when using legacy BIOS booting this does not really cause
any issues. But when using UEFI to boot the VM then plymouth will draw
on both the efifb /dev/fb0 and /dev/drm/card0 (which has registered
/dev/fb1 as fbdev emulation).

VirtualBox will actual display the output of both devices (I guess it is
showing whatever was drawn last), this causes weird artifacts because of
pitch issues in the efifb when the VM window is not sized at 1024x768
(the window will resize to its last size once the vboxvideo driver loads,
changing the pitch).

Adding the missing drm_fb_helper_remove_conflicting_pci_framebuffers()
call fixes this.

Cc: stable@vger.kernel.org
Fixes: 2695eae1f6d3 ("drm/vboxvideo: Switch to generic fbdev emulation")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/vboxvideo/vbox_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index 8512d970a09f..261255085918 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -76,6 +76,10 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		goto err_mode_fini;
 
+	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "vboxvideodrmfb");
+	if (ret)
+		goto err_irq_fini;
+
 	ret = drm_fbdev_generic_setup(&vbox->ddev, 32);
 	if (ret)
 		goto err_irq_fini;
-- 
2.26.0.rc2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
