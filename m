Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D77D758FE89
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 16:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1184FB307A;
	Thu, 11 Aug 2022 14:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB217B30AB
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 14:49:13 +0000 (UTC)
Received: from localhost.localdomain (unknown [83.149.199.65])
 by mail.ispras.ru (Postfix) with ESMTPS id BD73640D403E;
 Thu, 11 Aug 2022 14:49:10 +0000 (UTC)
From: Andrey Strachuk <strochuk@ispras.ru>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2] drm/fb-helper: add virtual screen size check to
 drm_fb_helper_check_var()
Date: Thu, 11 Aug 2022 17:48:50 +0300
Message-Id: <20220811144850.215377-1-strochuk@ispras.ru>
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

Add virtual screen size check to drm_fb_helper_check_var() in
order to validate userspace input.

Found by Linux Verification Center (linuxtesting.org) with syzkaller.

Signed-off-by: Andrey Strachuk <strochuk@ispras.ru>
Fixes: 785b93ef8c30 ("drm/kms: move driver specific fb common code to helper functions (v2)")
---
 drivers/gpu/drm/drm_fb_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 2d4cee6a10ff..5c8b211769eb 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1355,6 +1355,12 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
 	    (drm_format_info_block_height(fb->format, 0) > 1))
 		return -EINVAL;
 
+	/* verify that virtual resolution >= physical resolution */
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

