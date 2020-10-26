Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0DD29972F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 20:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76036E05D;
	Mon, 26 Oct 2020 19:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFF76E05D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 19:41:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.30.34.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2380F20760;
 Mon, 26 Oct 2020 19:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603741276;
 bh=uy/Dd88vKPnPfb5LV8zDZKHQiy07h3pNTguOKFJpBdI=;
 h=From:To:Cc:Subject:Date:From;
 b=DIcusht26pawNI4TxAoolmq4mmWZTDn2U2FCjskbQl7Zjaeih5EGLOlghAy2ks4tV
 ZG9+SXQJ2e0AUxWpIdp9D9lBkHIPYxM64wU8XHZ1VIGIh2jcL9UfrFT1Ls+XcqlMuF
 +/oi+5rG84fIyxQ55mUkvb1d5Fo3OTIhZBuqQrDM=
From: Arnd Bergmann <arnd@kernel.org>
To: Jyri Sarha <jsarha@ti.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/4] drm/tilcdc: avoid 'make W=2' build failure
Date: Mon, 26 Oct 2020 20:41:01 +0100
Message-Id: <20201026194110.3817470-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.velikov@collabora.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The -Wmissing-field-initializer warning when building with W=2
turns into an error because tilcdc is built with -Werror:

drm/tilcdc/tilcdc_drv.c:431:33: error: missing field 'data' initializer [-Werror,-Wmissing-field-initializers] { "regs", tilcdc_regs_show, 0 },
drm/tilcdc/tilcdc_drv.c:432:33: error: missing field 'data' initializer [-Werror,-Wmissing-field-initializers] { "mm",   tilcdc_mm_show,   0 },

Add the missing field initializers to address the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 4f5fc3e87383..754a66051a21 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -428,8 +428,8 @@ static int tilcdc_mm_show(struct seq_file *m, void *arg)
 }
 
 static struct drm_info_list tilcdc_debugfs_list[] = {
-		{ "regs", tilcdc_regs_show, 0 },
-		{ "mm",   tilcdc_mm_show,   0 },
+		{ "regs", tilcdc_regs_show, 0, NULL },
+		{ "mm",   tilcdc_mm_show,   0, NULL },
 };
 
 static void tilcdc_debugfs_init(struct drm_minor *minor)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
