Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23D26AC621
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:01:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE0D10E370;
	Mon,  6 Mar 2023 16:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE38810E2CB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:00:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D8AA72236F;
 Mon,  6 Mar 2023 16:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678118424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RzHUCgyDVd1/vFJIVF/yHXdWWow6tO5+rSrZEBgBa/c=;
 b=VyetxvZ3ORexkxsuy9ptjw4e5iKIRS6AtzM3owyFLAQtiKrEKVQ9OG/cR6tK3PRgu1sNRe
 2i3fZa2NJQBfLehZT3TKF3vcS32wpe219jE6y7l2fYNtJL+CviITlg2rD8ml+KodbdSuUd
 J1rNF4avXuY8yMuQ5WLGlmqgrbGFNjg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678118424;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RzHUCgyDVd1/vFJIVF/yHXdWWow6tO5+rSrZEBgBa/c=;
 b=GVWq0zHJQbDPUNtYod/JQRKJmUcCoDbJRr7rn6i6IULWpMZKZlGML5Vr/quQhC851qTigA
 zZ/vYCslR9zsLOCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8332F13A6A;
 Mon,  6 Mar 2023 16:00:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EA9EHxgOBmQ/PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Mar 2023 16:00:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net
Subject: [PATCH 01/99] lib: Add option iterator
Date: Mon,  6 Mar 2023 16:58:38 +0100
Message-Id: <20230306160016.4459-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306160016.4459-1-tzimmermann@suse.de>
References: <20230306160016.4459-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add struct option_iter and helpers that walk over individual options
of an option string. Add documentation.

Kernel parameters often have the format of

  param=opt1,opt2:val,opt3

where the option string contains a number of comma-separated options.
Drivers usually use strsep() in a loop to extract individual options
from the string. Each call to strsep() modifies the given string, so
callers have to duplicate kernel parameters that are to be parsed
multiple times.

The new struct option_iter and its helpers wrap this code behind a
clean interface. Drivers can iterate over the options without having
to know the details of the option-string format. The iterator handles
string memory internally without modifying the original options.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/core-api/kernel-api.rst |  9 +++
 include/linux/cmdline.h               | 29 ++++++++
 lib/Makefile                          |  2 +-
 lib/cmdline_iter.c                    | 97 +++++++++++++++++++++++++++
 4 files changed, 136 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/cmdline.h
 create mode 100644 lib/cmdline_iter.c

diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
index 62f961610773..cdc7ba8decf9 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -93,9 +93,18 @@ Bitmap Operations
 Command-line Parsing
 --------------------
 
+.. kernel-doc:: lib/cmdline_iter.c
+   :doc: overview
+
 .. kernel-doc:: lib/cmdline.c
    :export:
 
+.. kernel-doc:: lib/cmdline_iter.c
+   :export:
+
+.. kernel-doc:: include/linux/cmdline.h
+   :internal:
+
 Sorting
 -------
 
diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
new file mode 100644
index 000000000000..5d7e648e98a5
--- /dev/null
+++ b/include/linux/cmdline.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef LINUX_CMDLINE_H
+#define LINUX_CMDLINE_H
+
+/**
+ * struct option_iter - Iterates over string of kernel or module options
+ */
+struct option_iter {
+	char *optbuf;
+	char *next_opt;
+};
+
+void option_iter_init(struct option_iter *iter, const char *options);
+void option_iter_release(struct option_iter *iter);
+const char *option_iter_incr(struct option_iter *iter);
+
+/**
+ * option_iter_next - Loop condition to move over options
+ * @iter_:	the iterator
+ * @opt_:	the name of the option variable
+ *
+ * Iterates over option strings as part of a while loop and
+ * stores the current option in opt_.
+ */
+#define option_iter_next(iter_, opt_) \
+	(((opt_) = option_iter_incr(iter_)) != NULL)
+
+#endif
diff --git a/lib/Makefile b/lib/Makefile
index 4d9461bfea42..829ea6647d7a 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -27,7 +27,7 @@ KASAN_SANITIZE_string.o := n
 CFLAGS_string.o += -fno-stack-protector
 endif
 
-lib-y := ctype.o string.o vsprintf.o cmdline.o \
+lib-y := ctype.o string.o vsprintf.o cmdline.o cmdline_iter.o \
 	 rbtree.o radix-tree.o timerqueue.o xarray.o \
 	 maple_tree.o idr.o extable.o irq_regs.o argv_split.o \
 	 flex_proportions.o ratelimit.o show_mem.o \
diff --git a/lib/cmdline_iter.c b/lib/cmdline_iter.c
new file mode 100644
index 000000000000..d9371dfea08b
--- /dev/null
+++ b/lib/cmdline_iter.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/cmdline.h>
+#include <linux/export.h>
+#include <linux/slab.h>
+
+/**
+ * DOC: overview
+ *
+ * A kernel parameter's option string can contain multiple comma-separated
+ * options. Modules can parse an option string with struct &option_iter and
+ * its helpers. After obtaining the string, initialize and instance of the
+ * option iterator and loop iver its content as show below.
+ *
+ * .. code-block:: c
+ *
+ *	const char *options = ...; // provided option string
+ *
+ *	struct option_iter iter;
+ *	const char *opt;
+ *
+ *	option_iter_init(&iter, options);
+ *
+ *	while (option_iter_next(&iter, &opt)) {
+ *		if (!strcmp(opt, "foo"))
+ *			...
+ *		else (strcmp(opt, "bar"))
+ *			...
+ *		else
+ *			pr_warn("unknown option %s\n", opt);
+ *	}
+ *
+ *	option_iter_release(&iter);
+ *
+ * The call to option_iter_init() initializes the iterator instance
+ * from the option string. The while loop walks over the individual
+ * options in the sting and returns each in the second argument. The
+ * returned memory is owned by the iterator instance and callers may
+ * not modify or free it. The call to option_iter_release() frees all
+ * resources of the iterator. This process does not modify the original
+ * option string. If the option string contains an empty option (i.e.,
+ * two commas next to each other), option_iter_next() skips the empty
+ * option automatically.
+ */
+
+/**
+ * option_iter_init - Initializes an option iterator
+ * @iter:	the iterator to initialize
+ * @options:	the options string
+ */
+void option_iter_init(struct option_iter *iter, const char *options)
+{
+	if (options && *options)
+		iter->optbuf = kstrdup(options, GFP_KERNEL); // can be NULL
+	else
+		iter->optbuf = NULL;
+	iter->next_opt = iter->optbuf;
+}
+EXPORT_SYMBOL(option_iter_init);
+
+/**
+ * option_iter_release - Releases an option iterator's resources
+ * @iter:	the iterator
+ */
+void option_iter_release(struct option_iter *iter)
+{
+	kfree(iter->optbuf);
+	iter->next_opt = NULL;
+}
+EXPORT_SYMBOL(option_iter_release);
+
+/**
+ * option_iter_incr - Return current option and advance to the next
+ * @iter:	the iterator
+ *
+ * Returns:
+ * The current option string, or NULL if there are no more options.
+ */
+const char *option_iter_incr(struct option_iter *iter)
+{
+	char *opt;
+
+	if (!iter->next_opt) { // can be OK if kstrdup failed
+		if (iter->optbuf) // iter has already been released; logic error
+			pr_err("Incrementing option iterator without string\n");
+		return NULL;
+	}
+
+	do {
+		opt = strsep(&iter->next_opt, ",");
+		if (!opt)
+			return NULL;
+	} while (!*opt); // found empty option string, try next
+
+	return opt;
+}
+EXPORT_SYMBOL(option_iter_incr);
-- 
2.39.2

