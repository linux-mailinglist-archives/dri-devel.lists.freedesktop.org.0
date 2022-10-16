Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703E4600338
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 22:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F276F10E05A;
	Sun, 16 Oct 2022 20:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 637 seconds by postgrey-1.36 at gabe;
 Sun, 16 Oct 2022 20:14:51 UTC
Received: from h7.fbrelay.privateemail.com (h7.fbrelay.privateemail.com
 [162.0.218.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F11A10E05A
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Oct 2022 20:14:51 +0000 (UTC)
Received: from MTA-13-3.privateemail.com (mta-13-1.privateemail.com
 [198.54.122.107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by h7.fbrelay.privateemail.com (Postfix) with ESMTPS id C5BF961285
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Oct 2022 20:04:12 +0000 (UTC)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 33F5018000AB;
 Sun, 16 Oct 2022 16:04:10 -0400 (EDT)
Received: from hal-station..
 (bras-base-toroon4321w-grc-73-76-67-77-249.dsl.bell.ca [76.67.77.249])
 by mta-13.privateemail.com (Postfix) with ESMTPA id 3754918000A7;
 Sun, 16 Oct 2022 16:04:02 -0400 (EDT)
From: Hamza Mahfooz <someguy@effective-light.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/framebuffer: break out of loop,
 if the requested element is found
Date: Sun, 16 Oct 2022 16:03:23 -0400
Message-Id: <20221016200324.17930-1-someguy@effective-light.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Hamza Mahfooz <someguy@effective-light.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can stop searching through the linked-list after we have found the
element we are looking for. So, break out of list_for_each_entry()
after we have found the element we are looking for in drm_mode_rmfb().

Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
---
 drivers/gpu/drm/drm_framebuffer.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 2dd97473ca10..557177a4c5be 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -441,8 +441,11 @@ int drm_mode_rmfb(struct drm_device *dev, u32 fb_id,
 
 	mutex_lock(&file_priv->fbs_lock);
 	list_for_each_entry(fbl, &file_priv->fbs, filp_head)
-		if (fb == fbl)
+		if (fb == fbl) {
 			found = 1;
+			break;
+		}
+
 	if (!found) {
 		mutex_unlock(&file_priv->fbs_lock);
 		goto fail_unref;
-- 
2.37.3

