Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F06F85AECD9
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 16:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD80E10E69D;
	Tue,  6 Sep 2022 14:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6D010E69D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 14:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662474601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=HUhBiWXF2UcHPkZjOCTBoA5KA3pVKecQ5S66uz2sQc0=;
 b=Xky8h/00TbUMJVIRRSsL8QuhV4bPEwzqNqpg5/5WxQ3c95MdX9o8iWBmTp1qngtx3P1mof
 sQ8DRF99oOwicrgiVwyHok3CEwwTe4n9xDrKhXxth3B5amjD+tG6Q3koitzIdd6Fc9bp1H
 lk4fRAdjyo6bJbgb67KxRyn6MB7XXss=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-m-ToVTaiP5O-uRHsdH43lw-1; Tue, 06 Sep 2022 10:29:59 -0400
X-MC-Unique: m-ToVTaiP5O-uRHsdH43lw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20A42804191;
 Tue,  6 Sep 2022 14:29:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0B1D1121314;
 Tue,  6 Sep 2022 14:29:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4963E18003A1; Tue,  6 Sep 2022 16:29:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bochs: fix blanking
Date: Tue,  6 Sep 2022 16:29:57 +0200
Message-Id: <20220906142957.2763577-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGA_IS1_RC is the color mode register (VGA_IS1_RM the one for monochrome
mode, note C vs. M at the end).  So when using VGA_IS1_RC make sure the
vga device is actually in color mode and set the corresponding bit in the
misc register.

Reproducible when booting VMs in UEFI mode with some edk2 versions (edk2
fix is on the way too).  Doesn't happen in BIOS mode because in that
case the vgabios already flips the bit.

Fixes: 250e743915d4 ("drm/bochs: Add screen blanking support")
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/tiny/bochs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 08de13774862..a51262289aef 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -309,6 +309,8 @@ static void bochs_hw_fini(struct drm_device *dev)
 static void bochs_hw_blank(struct bochs_device *bochs, bool blank)
 {
 	DRM_DEBUG_DRIVER("hw_blank %d\n", blank);
+	/* enable color bit (so VGA_IS1_RC access works) */
+	bochs_vga_writeb(bochs, VGA_MIS_W, VGA_MIS_COLOR);
 	/* discard ar_flip_flop */
 	(void)bochs_vga_readb(bochs, VGA_IS1_RC);
 	/* blank or unblank; we need only update index and set 0x20 */
-- 
2.37.3

