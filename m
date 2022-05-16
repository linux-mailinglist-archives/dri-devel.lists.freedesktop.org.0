Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B14BA529446
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B2210F0F5;
	Mon, 16 May 2022 22:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5435910EDF3;
 Mon, 16 May 2022 22:57:21 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id e3so17604991ios.6;
 Mon, 16 May 2022 15:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Ml9ZEIbtQPoX0Jy/kpSXgxpIe2fb966gSifTzlGH6A=;
 b=gwjsPi3nUk5PPFCQG1WeJNe3HCM0x8Xeos1NDV0VnD3pOqAer1DhgXG5pTHIn4C5HG
 uu0ghOYaS79ct94ac8I4ILxLnqlkvQ2TJlrat/b0xb1u4rczFC1xwRs5Sg+6xKdna/+w
 1abDELtFgKpuYt/QCDa4bZyPizCDIdsmt9N3RRVs69/d3N40C45K1J+5H2ZmRtJ4bRW1
 0/DMNOn/BkxVECRNvTgcjKvskhtTr36T5aDcCh5pdzdV41+SKEorHFNagIBm+zQ4IIk+
 m2hmL82F2/hv3sx70r3SidT+bgq/YCaK8VUM3WGonMSuPeT1z6tCN+JPdvmAf+rUTVyT
 VThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Ml9ZEIbtQPoX0Jy/kpSXgxpIe2fb966gSifTzlGH6A=;
 b=JwXC+icwL1ZlskXW059N14dC0QrC33hHm5+iaUJo/1ijuqTff9lO/2V2s3ebtUy9ng
 stPLBrgOrgNbG/6OUzHQQ3I/qinCXUC9C9ti44YqmWXBWHd0GMvA4Sm82fSRcscyQipQ
 6h5+HtUemY+GziYZd+vzhqpcV1ZGKBM1o087M9Yv9XQ8ShliGzshgVjAKiT3K0+bZi5F
 Oi04ViwlhjodmC6TnlGXhM8JE20H8kgURAUd4W1ui5qxeOFCbxN1nRp6BaPelcOH3yf/
 OmMTu96dOzQtdCDyCtu0Y/3p5O0UClXgYF4+fMMNFUk7NorcpewtV0EBzN89QeaePsD5
 Yjsw==
X-Gm-Message-State: AOAM5321tKUo3BnDGAPitN7VV+2CZQjzFuTITIZp11lPL6XxpB9u3rZ7
 Sbj7NsOCrmXmTIUnJ/tkhXM=
X-Google-Smtp-Source: ABdhPJwz3KCUfWqZef8egGVgZt6hg7h2HOTzoEtyl/qB0kRRtq3StfmQYRNHBpeqczzMlwu5Z9r89Q==
X-Received: by 2002:a5d:9342:0:b0:654:9336:81d7 with SMTP id
 i2-20020a5d9342000000b00654933681d7mr8874996ioo.136.1652741840593; 
 Mon, 16 May 2022 15:57:20 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:20 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 16/27] drm/print: POC drm on dyndbg - use bitmap
Date: Mon, 16 May 2022 16:56:29 -0600
Message-Id: <20220516225640.3102269-17-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516225640.3102269-1-jim.cromie@gmail.com>
References: <20220516225640.3102269-1-jim.cromie@gmail.com>
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
Cc: maz@kernel.org, quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 rostedt@goodmis.org, mingo@redhat.com, mathieu.desnoyers@efficios.com,
 quic_psodagud@quicinc.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

POC: adapt drm_print to use/test the bitmap callback support.

with dynamic_debug.verbose=1:

bash-5.1# echo 1 > /sys/module/drm/parameters/debug
[   33.697039] dyndbg: set_dyndbg_classes: new 0x1 current 0x0
[   33.697571] dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
[   33.698072] dyndbg: no matches for query
[   33.698498] dyndbg: total matches: 0
bash-5.1# echo 2 > /sys/module/drm/parameters/debug
[   46.687012] dyndbg: set_dyndbg_classes: new 0x2 current 0x1
[   46.687655] dyndbg: query 0: "class DRM_UT_CORE -p" mod:*
[   46.688280] dyndbg: no matches for query
[   46.688632] dyndbg: query 0: "class DRM_UT_DRIVER +p" mod:*
[   46.689122] dyndbg: no matches for query
[   46.689441] dyndbg: total matches: 0

This changes typeof __drm_debug to unsigned long from unsigned int,
which dyndbg requires so it can use BIT().

It is currently dependent on CONFIG_DYNAMIC_DEBUG_CORE, which is only
aproximately correct, it will need proper DRM dependence too.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 14 ++++++++++++--
 include/drm/drm_print.h     |  3 ++-
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index f783d4963d4b..e49ffda0a47e 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -40,7 +40,7 @@
  * __drm_debug: Enable debug output.
  * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
  */
-unsigned int __drm_debug;
+unsigned long __drm_debug;
 EXPORT_SYMBOL(__drm_debug);
 
 MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug category.\n"
@@ -52,7 +52,17 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 "\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
 "\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
 "\t\tBit 8 (0x100) will enable DP messages (displayport code)");
-module_param_named(debug, __drm_debug, int, 0600);
+
+#if !defined(CONFIG_DYNAMIC_DEBUG_CORE)
+module_param_named(debug, __drm_debug, ulong, 0600);
+#else
+static struct ddebug_classes_bitmap_param drm_debug_bitmap = {
+	.bits = &__drm_debug,
+	.flags = "p",
+	.map = &drm_debug_classes,
+};
+module_param_cb(debug, &param_ops_dyndbg_classes, &drm_debug_bitmap, 0600);
+#endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
 {
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 5b7eedb0f477..0597137bac75 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -31,11 +31,12 @@
 #include <linux/seq_file.h>
 #include <linux/device.h>
 #include <linux/debugfs.h>
+#include <linux/dynamic_debug.h>
 
 #include <drm/drm.h>
 
 /* Do *not* use outside of drm_print.[ch]! */
-extern unsigned int __drm_debug;
+extern unsigned long __drm_debug;
 
 /**
  * DOC: print
-- 
2.35.3

