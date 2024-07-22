Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034C8938E42
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 13:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D508C10E4EC;
	Mon, 22 Jul 2024 11:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GcYxTg11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3394210E4EC
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 11:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721648892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mON0Gx7FVFtPkP0kLOreGdHs3og1l5iGH3FHLInhhao=;
 b=GcYxTg11WbKZt6sUymdpyRBJSVVD3DNh4RvynzV7MKSMPfNX1NT4yuPDTez/9dgde+GaQh
 64if2BkmzuK5k+D7YvyFiv17sna7pKJ40eQCpXGfua2Ng3mFukSNoBU/5ahoZPsDYCbo03
 A+byGZSI2ncxO2SsnV6QFJPM/K/WSDU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-411-V5fsc56OOI-XBxKw3Dy7Ww-1; Mon,
 22 Jul 2024 07:48:10 -0400
X-MC-Unique: V5fsc56OOI-XBxKw3Dy7Ww-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 96DFE19560AA; Mon, 22 Jul 2024 11:48:07 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.104])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 50B453000188; Mon, 22 Jul 2024 11:48:03 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: lkp@intel.com
Cc: Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev,
 Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH] fbcon: Use oops_in_progress instead of panic_cpu
Date: Mon, 22 Jul 2024 13:47:51 +0200
Message-ID: <20240722114800.174558-1-jfalempe@redhat.com>
In-Reply-To: <202407210203.2ISiIC9m-lkp@intel.com>
References: <202407210203.2ISiIC9m-lkp@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panic_cpu is not exported, so it can't be used if fbcon is used as
a module. Use oops_in_progress in this case, but non-fatal oops won't
be printed.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407210203.2ISiIC9m-lkp@intel.com/
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/video/fbdev/core/fbcon.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 498d9c07df80..2e093535884b 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -64,6 +64,8 @@
 #include <linux/console.h>
 #include <linux/string.h>
 #include <linux/kd.h>
+#include <linux/panic.h>
+#include <linux/printk.h>
 #include <linux/slab.h>
 #include <linux/fb.h>
 #include <linux/fbcon.h>
@@ -272,7 +274,14 @@ static int fbcon_get_rotate(struct fb_info *info)
 
 static bool fbcon_skip_panic(struct fb_info *info)
 {
+/* panic_cpu is not exported, and can't be used if built as module. Use
+ * oops_in_progress instead, but non-fatal oops won't be printed.
+ */
+#if defined(MODULE)
+	return (info->skip_panic && unlikely(oops_in_progress));
+#else
 	return (info->skip_panic && unlikely(atomic_read(&panic_cpu) != PANIC_CPU_INVALID));
+#endif
 }
 
 static inline int fbcon_is_inactive(struct vc_data *vc, struct fb_info *info)

base-commit: 7e33fc2ff6754b5ff39b11297f713cd0841d9962
-- 
2.45.2

