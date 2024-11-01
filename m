Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D3D9B9B52
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 00:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4BF10E207;
	Fri,  1 Nov 2024 23:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NjPXh2HL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D65D10E207
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 23:55:03 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-7ee51d9ae30so1292643a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 16:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730505302; x=1731110102; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pFYJ0AhPl1N4NP0iPMsWYrMdbq4jJzXJRf7VdTFBNJA=;
 b=NjPXh2HLV3axqmpBX6ARb3fSQ5S06ebbpv+yd5DIUDo/oOeCkJsJ+yQD9pTlq4EmYa
 lgkJun1Hoz+I4oIXfwD1Iq+N7RCeO7TS2FMs3JUVBkJv/uuwensYXQ0na3FbS1JkfwQY
 h6luFd5h3KuDqVDK2Yl2MJaxlo1O1yH+3ks0HSoIxqa+nT8iywtAz9sH516IGgZivtfU
 AhYVQLuqYzd3EXVNRKXNa9Ii4CoK7Q9xD4tcEc32u5KY8D0CJ6L9ANplOBMkZ9GkjM7n
 gyGVttU52zBxXQMtDO4C2ZOJ2Sr31TTyuQyQ1Emd2VIm264GrOmxn/+tGsOs9rVHYxtU
 mtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730505302; x=1731110102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pFYJ0AhPl1N4NP0iPMsWYrMdbq4jJzXJRf7VdTFBNJA=;
 b=izePxsMJGVEPOl7nPjZs32r+5RZi/q/eonkyPs624eFpwRc3Aoc0KoBFDn1Bu7G7Md
 wEti+W6sYS2cp6UyecnIef1WcMR1aE7BDJdtTDQE8BYit9j/4gs5WzbcZzFArSUWm/uk
 wOXop+U8xhpX76Dj3gjhYMTPHfP15Hi8ZFwNlRldkkPKHjk6cknvU7NBasYSB3WccXYg
 adzT6yAzVHNc35gOpoKtHisdggk4Exp27Sb5k7QfMjxdBSQXYSIty9IIB13nrv3+Cg9F
 PyLqvlSg6svHlVe9WstgSC2xyr9X/geDPHW7yVqFNAv13iZo4L+T7bgbe0Mu1njrDa6o
 klIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUoY4WByk8tVJW/8fdt3OlrQfROVEFv3LaQMGhYOFQsTXzRZeD2rkc1cxyXcsLD/QMVT9Dr2kP81o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0xLA4RALIAEpAyYftV69C/mn1C+qe7ZUXR9Wx6Wk1Mt9agnow
 UuIxjFwDjHciI9xYMRgLOcgFoMERo44SsQ2qMxNHJM/bviTFt3cp
X-Google-Smtp-Source: AGHT+IHq4pMWQt099G0CmCL+1dwO0P4OdiFXp6Fuhl8/RTIQyn1uVD9xh+Dk1RdVhu85RpnD+Z5asw==
X-Received: by 2002:a17:90a:e7c4:b0:2e2:d3ab:2d77 with SMTP id
 98e67ed59e1d1-2e94c52ad6emr7099575a91.39.1730505302565; 
 Fri, 01 Nov 2024 16:55:02 -0700 (PDT)
Received: from tungpham-mbp.DHCP.thefacebook.com ([2620:10d:c090:400::5:7de5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e93daad721sm3341706a91.13.2024.11.01.16.55.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 01 Nov 2024 16:55:02 -0700 (PDT)
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: bpf@vger.kernel.org
Cc: daniel@iogearbox.net, andrii@kernel.org, memxor@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 kernel-team@fb.com
Subject: [PATCH bpf-next 1/2] drm,
 bpf: Move drm_mm.c to lib to be used by bpf arena
Date: Fri,  1 Nov 2024 16:54:52 -0700
Message-Id: <20241101235453.63380-2-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241101235453.63380-1-alexei.starovoitov@gmail.com>
References: <20241101235453.63380-1-alexei.starovoitov@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexei Starovoitov <ast@kernel.org>

Move drm_mm.c to lib. The next commit will use drm_mm to manage
memory regions in bpf arena. Move drm_mm_print to
drivers/gpu/drm/drm_print.c, since it's not a core functionality
of drm_mm and it depeneds on drm_printer while drm_mm is
generic and usuable as-is by other subsystems.
Also add __maybe_unused to suppress compiler warnings.
Update MAINTAINERS file as well.

Signed-off-by: Alexei Starovoitov <ast@kernel.org>
---
 MAINTAINERS                       |  1 +
 drivers/gpu/drm/Makefile          |  1 -
 drivers/gpu/drm/drm_print.c       | 39 ++++++++++++++++++++++++++++++
 lib/Makefile                      |  1 +
 {drivers/gpu/drm => lib}/drm_mm.c | 40 +------------------------------
 5 files changed, 42 insertions(+), 40 deletions(-)
 rename {drivers/gpu/drm => lib}/drm_mm.c (96%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6880a8fac74c..1bfaa335fae7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7504,6 +7504,7 @@ F:	drivers/gpu/vga/
 F:	include/drm/drm
 F:	include/linux/vga*
 F:	include/uapi/drm/
+F:	lib/drm_mm.c
 X:	drivers/gpu/drm/amd/
 X:	drivers/gpu/drm/armada/
 X:	drivers/gpu/drm/etnaviv/
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 784229d4504d..e35d5de2b9f0 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -59,7 +59,6 @@ drm-y := \
 	drm_ioctl.o \
 	drm_lease.o \
 	drm_managed.o \
-	drm_mm.o \
 	drm_mode_config.o \
 	drm_mode_object.o \
 	drm_modes.o \
diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 0081190201a7..2a8a5e0d691e 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -34,6 +34,7 @@
 #include <drm/drm.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_print.h>
+#include <drm/drm_mm.h>
 
 /*
  * __drm_debug: Enable debug output.
@@ -267,6 +268,44 @@ void drm_printf(struct drm_printer *p, const char *f, ...)
 }
 EXPORT_SYMBOL(drm_printf);
 
+static u64 drm_mm_dump_hole(struct drm_printer *p, const struct drm_mm_node *entry)
+{
+	u64 start, size;
+
+	size = entry->hole_size;
+	if (size) {
+		start = drm_mm_hole_node_start(entry);
+		drm_printf(p, "%#018llx-%#018llx: %llu: free\n",
+			   start, start + size, size);
+	}
+
+	return size;
+}
+/**
+ * drm_mm_print - print allocator state
+ * @mm: drm_mm allocator to print
+ * @p: DRM printer to use
+ */
+void drm_mm_print(const struct drm_mm *mm, struct drm_printer *p)
+{
+	const struct drm_mm_node *entry;
+	u64 total_used = 0, total_free = 0, total = 0;
+
+	total_free += drm_mm_dump_hole(p, &mm->head_node);
+
+	drm_mm_for_each_node(entry, mm) {
+		drm_printf(p, "%#018llx-%#018llx: %llu: used\n", entry->start,
+			   entry->start + entry->size, entry->size);
+		total_used += entry->size;
+		total_free += drm_mm_dump_hole(p, entry);
+	}
+	total = total_free + total_used;
+
+	drm_printf(p, "total: %llu, used %llu free %llu\n", total,
+		   total_used, total_free);
+}
+EXPORT_SYMBOL(drm_mm_print);
+
 /**
  * drm_print_bits - print bits to a &drm_printer stream
  *
diff --git a/lib/Makefile b/lib/Makefile
index 773adf88af41..605aa25b71ab 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
 obj-y += kstrtox.o
 obj-$(CONFIG_FIND_BIT_BENCHMARK) += find_bit_benchmark.o
 obj-$(CONFIG_TEST_BPF) += test_bpf.o
+obj-$(CONFIG_DRM) += drm_mm.o
 test_dhry-objs := dhry_1.o dhry_2.o dhry_run.o
 obj-$(CONFIG_TEST_DHRY) += test_dhry.o
 obj-$(CONFIG_TEST_FIRMWARE) += test_firmware.o
diff --git a/drivers/gpu/drm/drm_mm.c b/lib/drm_mm.c
similarity index 96%
rename from drivers/gpu/drm/drm_mm.c
rename to lib/drm_mm.c
index 5ace481c1901..45ea9864ed2e 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/lib/drm_mm.c
@@ -151,7 +151,7 @@ static void show_leaks(struct drm_mm *mm) { }
 
 INTERVAL_TREE_DEFINE(struct drm_mm_node, rb,
 		     u64, __subtree_last,
-		     START, LAST, static inline, drm_mm_interval_tree)
+		     START, LAST, static inline __maybe_unused, drm_mm_interval_tree)
 
 struct drm_mm_node *
 __drm_mm_interval_first(const struct drm_mm *mm, u64 start, u64 last)
@@ -966,41 +966,3 @@ void drm_mm_takedown(struct drm_mm *mm)
 		show_leaks(mm);
 }
 EXPORT_SYMBOL(drm_mm_takedown);
-
-static u64 drm_mm_dump_hole(struct drm_printer *p, const struct drm_mm_node *entry)
-{
-	u64 start, size;
-
-	size = entry->hole_size;
-	if (size) {
-		start = drm_mm_hole_node_start(entry);
-		drm_printf(p, "%#018llx-%#018llx: %llu: free\n",
-			   start, start + size, size);
-	}
-
-	return size;
-}
-/**
- * drm_mm_print - print allocator state
- * @mm: drm_mm allocator to print
- * @p: DRM printer to use
- */
-void drm_mm_print(const struct drm_mm *mm, struct drm_printer *p)
-{
-	const struct drm_mm_node *entry;
-	u64 total_used = 0, total_free = 0, total = 0;
-
-	total_free += drm_mm_dump_hole(p, &mm->head_node);
-
-	drm_mm_for_each_node(entry, mm) {
-		drm_printf(p, "%#018llx-%#018llx: %llu: used\n", entry->start,
-			   entry->start + entry->size, entry->size);
-		total_used += entry->size;
-		total_free += drm_mm_dump_hole(p, entry);
-	}
-	total = total_free + total_used;
-
-	drm_printf(p, "total: %llu, used %llu free %llu\n", total,
-		   total_used, total_free);
-}
-EXPORT_SYMBOL(drm_mm_print);
-- 
2.43.5

