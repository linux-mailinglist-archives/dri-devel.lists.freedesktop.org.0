Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 728BC58FDF6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 16:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D779A80A;
	Thu, 11 Aug 2022 14:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332FC2B0BF
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 10:23:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [83.149.199.65])
 by mail.ispras.ru (Postfix) with ESMTPS id 855AE40D403E;
 Thu, 11 Aug 2022 10:23:19 +0000 (UTC)
From: Andrey Strachuk <strochuk@ispras.ru>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH] drm/fb-helper: add virtual screen size check to
 drm_fb_helper_check_var()
Date: Thu, 11 Aug 2022 13:23:04 +0300
Message-Id: <20220811102304.70769-1-strochuk@ispras.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 11 Aug 2022 14:00:04 +0000
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
Cc: ldv-project@linuxtesting.org, Andrey Strachuk <strochuk@ispras.ru>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add virtual screen size check to drm_fb_helper_check_var() in
order to validate userspace input.

Found by Linux Verification Center (linuxtesting.org) with syzkaller.

Signed-off-by: Andrey Strachuk <strochuk@ispras.ru>
Fixes: 6c11df58fd1a ("fbmem: Check virtual screen sizes in fb_set_var()")
---
 drivers/gpu/drm/drm_fb_helper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 2d4cee6a10ff..d21fe89358af 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1355,6 +1355,16 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
 	    (drm_format_info_block_height(fb->format, 0) > 1))
 		return -EINVAL;
 
+	/* verify that virtual resolution >= physical resolution */
+	if (var->xres_virtual < var->xres ||
+	    var->yres_virtual < var->yres) {
+		drm_dbg_kms(dev, "requested virtual screen size that is "
+				"below the physical size(%ux%u vs. %ux%u)\n",
+			var->xres_virtual, var->yres_virtual,
+			var->xres, var->yres);
+		return -EINVAL;
+	}
+
 	/*
 	 * Changes struct fb_var_screeninfo are currently not pushed back
 	 * to KMS, hence fail if different settings are requested.
-- 
2.25.1

