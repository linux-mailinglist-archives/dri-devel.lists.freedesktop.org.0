Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6410559100F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 13:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A3B11BCA8;
	Fri, 12 Aug 2022 11:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6089E10F1C7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 11:31:48 +0000 (UTC)
Received: from andrey-lpc.intra.ispras.ru (unknown [93.175.1.152])
 by mail.ispras.ru (Postfix) with ESMTPSA id 1767F40737BA;
 Fri, 12 Aug 2022 11:31:43 +0000 (UTC)
From: Andrey Strachuk <strochuk@ispras.ru>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3] drm/fb-helper: add virtual screen size check to
 drm_fb_helper_check_var()
Date: Fri, 12 Aug 2022 14:30:07 +0300
Message-Id: <20220812113007.224880-1-strochuk@ispras.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Make sure that virtual screen size is not less than physical screen one.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Andrey Strachuk <strochuk@ispras.ru>
---
 drivers/gpu/drm/drm_fb_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 2d4cee6a10ff..ea07c97bc5a9 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1355,6 +1355,12 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
 	    (drm_format_info_block_height(fb->format, 0) > 1))
 		return -EINVAL;
 
+	/* make sure that virtual resolution >= physical resolution */
+	if (var->xres_virtual < var->xres)
+		var->xres_virtual = var->xres;
+	if (var->yres_virtual < var->yres)
+		var->yres_virtual = var->yres;
+
 	/*
 	 * Changes struct fb_var_screeninfo are currently not pushed back
 	 * to KMS, hence fail if different settings are requested.
-- 
2.25.1

