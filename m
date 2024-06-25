Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 586AD916828
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 14:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEF210E2EA;
	Tue, 25 Jun 2024 12:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="b3Wlainb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0614910E2EA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 12:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719319231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=7EWz1vItROBUOYp6sdJspiDZ8uU1laai0jDHb5Vv+x0=;
 b=b3Wlainbp6+Kp6pWoUvF4NiZp4uP3bwxnGQpDl0sbo3cjQNfYKKV8ldsn9CAZdGbHcXCck
 BRIxo3uT4Zf2VtTyd80mFpAgoQ8p8aoJUG+3OReeKBJ9LvhloCHPzNstOXxQXwqaoi1kje
 +GQ8kE8gNlU2KS2kqVa7R8NvgIs0duo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-RCkWgWX_Nm-SSEzUrXPwMA-1; Tue,
 25 Jun 2024 08:40:23 -0400
X-MC-Unique: RCkWgWX_Nm-SSEzUrXPwMA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9D4051956096; Tue, 25 Jun 2024 12:40:17 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.194])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DCA1319560B2; Tue, 25 Jun 2024 12:40:06 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Uros Bizjak <ubizjak@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: [PATCH] printk: Add a short description string to kmsg_dump()
Date: Tue, 25 Jun 2024 14:39:29 +0200
Message-ID: <20240625123954.211184-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
callback.
This patch adds a new parameter "const char *desc" to the kmsg_dumper
dump() callback, and update all drivers that are using it.

To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
function and a macro for backward compatibility.

I've written this for drm_panic, but it can be useful for other
kmsg_dumper.
It allows to see the panic reason, like "sysrq triggered crash"
or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 arch/powerpc/kernel/nvram_64.c             |  3 ++-
 arch/powerpc/platforms/powernv/opal-kmsg.c |  3 ++-
 drivers/gpu/drm/drm_panic.c                |  3 ++-
 drivers/hv/hv_common.c                     |  3 ++-
 drivers/mtd/mtdoops.c                      |  3 ++-
 fs/pstore/platform.c                       |  3 ++-
 include/linux/kmsg_dump.h                  | 13 ++++++++++---
 kernel/panic.c                             |  2 +-
 kernel/printk/printk.c                     |  8 +++++---
 9 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
index e385d3164648c..6b3a80d8cfa64 100644
--- a/arch/powerpc/kernel/nvram_64.c
+++ b/arch/powerpc/kernel/nvram_64.c
@@ -643,7 +643,8 @@ void __init nvram_init_oops_partition(int rtas_partition_exists)
  * partition.  If that's too much, go back and capture uncompressed text.
  */
 static void oops_to_nvram(struct kmsg_dumper *dumper,
-			  enum kmsg_dump_reason reason)
+			  enum kmsg_dump_reason reason,
+			  const char *desc)
 {
 	struct oops_log_info *oops_hdr = (struct oops_log_info *)oops_buf;
 	static unsigned int oops_count = 0;
diff --git a/arch/powerpc/platforms/powernv/opal-kmsg.c b/arch/powerpc/platforms/powernv/opal-kmsg.c
index 6c3bc4b4da983..49b60de6feb04 100644
--- a/arch/powerpc/platforms/powernv/opal-kmsg.c
+++ b/arch/powerpc/platforms/powernv/opal-kmsg.c
@@ -20,7 +20,8 @@
  * message, it just ensures that OPAL completely flushes the console buffer.
  */
 static void kmsg_dump_opal_console_flush(struct kmsg_dumper *dumper,
-				     enum kmsg_dump_reason reason)
+				     enum kmsg_dump_reason reason,
+				     const char *desc)
 {
 	/*
 	 * Outside of a panic context the pollers will continue to run,
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 293d4dcbc80da..88e9359fe6d78 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -604,7 +604,8 @@ static struct drm_plane *to_drm_plane(struct kmsg_dumper *kd)
 	return container_of(kd, struct drm_plane, kmsg_panic);
 }
 
-static void drm_panic(struct kmsg_dumper *dumper, enum kmsg_dump_reason reason)
+static void drm_panic(struct kmsg_dumper *dumper, enum kmsg_dump_reason reason,
+		      const char *desc)
 {
 	struct drm_plane *plane = to_drm_plane(dumper);
 
diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index 9c452bfbd5719..b0786ee9c94e3 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -207,7 +207,8 @@ static int hv_die_panic_notify_crash(struct notifier_block *self,
  * buffer and call into Hyper-V to transfer the data.
  */
 static void hv_kmsg_dump(struct kmsg_dumper *dumper,
-			 enum kmsg_dump_reason reason)
+			 enum kmsg_dump_reason reason,
+			 const char *desc)
 {
 	struct kmsg_dump_iter iter;
 	size_t bytes_written;
diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 2f11585b5613e..c618999a96832 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -298,7 +298,8 @@ static void find_next_position(struct mtdoops_context *cxt)
 }
 
 static void mtdoops_do_dump(struct kmsg_dumper *dumper,
-			    enum kmsg_dump_reason reason)
+			    enum kmsg_dump_reason reason,
+			    const char *desc)
 {
 	struct mtdoops_context *cxt = container_of(dumper,
 			struct mtdoops_context, dump);
diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index 3497ede88aa01..a6ed5d56021ef 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -275,7 +275,8 @@ void pstore_record_init(struct pstore_record *record,
  * end of the buffer.
  */
 static void pstore_dump(struct kmsg_dumper *dumper,
-			enum kmsg_dump_reason reason)
+			enum kmsg_dump_reason reason,
+			const char *desc)
 {
 	struct kmsg_dump_iter iter;
 	unsigned long	total = 0;
diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
index 906521c2329ca..a8f8a6204542d 100644
--- a/include/linux/kmsg_dump.h
+++ b/include/linux/kmsg_dump.h
@@ -49,13 +49,15 @@ struct kmsg_dump_iter {
  */
 struct kmsg_dumper {
 	struct list_head list;
-	void (*dump)(struct kmsg_dumper *dumper, enum kmsg_dump_reason reason);
+	void (*dump)(struct kmsg_dumper *dumper,
+		     enum kmsg_dump_reason reason,
+		     const char *desc);
 	enum kmsg_dump_reason max_reason;
 	bool registered;
 };
 
 #ifdef CONFIG_PRINTK
-void kmsg_dump(enum kmsg_dump_reason reason);
+void kmsg_dump_desc(enum kmsg_dump_reason reason, const char *desc);
 
 bool kmsg_dump_get_line(struct kmsg_dump_iter *iter, bool syslog,
 			char *line, size_t size, size_t *len);
@@ -71,7 +73,7 @@ int kmsg_dump_unregister(struct kmsg_dumper *dumper);
 
 const char *kmsg_dump_reason_str(enum kmsg_dump_reason reason);
 #else
-static inline void kmsg_dump(enum kmsg_dump_reason reason)
+static inline void kmsg_dump_desc(enum kmsg_dump_reason reason, const char *desc)
 {
 }
 
@@ -107,4 +109,9 @@ static inline const char *kmsg_dump_reason_str(enum kmsg_dump_reason reason)
 }
 #endif
 
+static inline void kmsg_dump(enum kmsg_dump_reason reason)
+{
+	kmsg_dump_desc(reason, NULL);
+}
+
 #endif /* _LINUX_KMSG_DUMP_H */
diff --git a/kernel/panic.c b/kernel/panic.c
index 0843a275531a7..0a8b29c44f3c1 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -378,7 +378,7 @@ void panic(const char *fmt, ...)
 
 	panic_print_sys_info(false);
 
-	kmsg_dump(KMSG_DUMP_PANIC);
+	kmsg_dump_desc(KMSG_DUMP_PANIC, buf);
 
 	/*
 	 * If you doubt kdump always works fine in any situation,
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index d0bff0b0abfdb..2e7195894e41a 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4287,14 +4287,16 @@ const char *kmsg_dump_reason_str(enum kmsg_dump_reason reason)
 EXPORT_SYMBOL_GPL(kmsg_dump_reason_str);
 
 /**
- * kmsg_dump - dump kernel log to kernel message dumpers.
+ * kmsg_dump_desc - dump kernel log to kernel message dumpers.
  * @reason: the reason (oops, panic etc) for dumping
+ * @desc: a short string to describe what caused the panic or oops. Can be NULL
+ * if no additional description is available.
  *
  * Call each of the registered dumper's dump() callback, which can
  * retrieve the kmsg records with kmsg_dump_get_line() or
  * kmsg_dump_get_buffer().
  */
-void kmsg_dump(enum kmsg_dump_reason reason)
+void kmsg_dump_desc(enum kmsg_dump_reason reason, const char *desc)
 {
 	struct kmsg_dumper *dumper;
 
@@ -4314,7 +4316,7 @@ void kmsg_dump(enum kmsg_dump_reason reason)
 			continue;
 
 		/* invoke dumper which will iterate over records */
-		dumper->dump(dumper, reason);
+		dumper->dump(dumper, reason, desc);
 	}
 	rcu_read_unlock();
 }

base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
-- 
2.45.1

