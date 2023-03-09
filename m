Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BE06B2950
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C921C10E85F;
	Thu,  9 Mar 2023 16:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE9510E038
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D326022145;
 Thu,  9 Mar 2023 16:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6AMUD/BAuZ3/uSqv29KEQ12Je2fDNnYZyOW1M3To6s0=;
 b=wE4xX58Z5CXD6dYAmm+iqWbzxjWJCqFuU7QfOJOmNubsbrDL/cQUo8fGtlMA9m0EFllqW9
 RGWOzzg2z10IEWTGY6jZF/pbhMwrUoHOqR5hCFymDREy52NrO2UqHbvribIJHMBtNBMBCf
 ldGf/ZbQxyoA94ysms+Xp1mbdn6rH9k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377724;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6AMUD/BAuZ3/uSqv29KEQ12Je2fDNnYZyOW1M3To6s0=;
 b=HsNK6R2jZqi6S+bROf5OqWJTras+HUKrV8PkphRR4gTwFJOizG4IjDvCSgEfwgTX9Hz6N8
 bmbOsYrlDrsXNFAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7111513A73;
 Thu,  9 Mar 2023 16:02:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OF3DGvwCCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 001/101] lib: Add option iterator
Date: Thu,  9 Mar 2023 17:00:21 +0100
Message-Id: <20230309160201.5163-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309160201.5163-1-tzimmermann@suse.de>
References: <20230309160201.5163-1-tzimmermann@suse.de>
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

v2:
	* improve documentation (Randy)
	* implement option_iter_next() as function
	* allow modification of the returned options

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/core-api/kernel-api.rst |   9 +++
 include/linux/cmdline.h               |  36 +++++++++
 lib/Makefile                          |   2 +-
 lib/cmdline_iter.c                    | 109 ++++++++++++++++++++++++++
 4 files changed, 155 insertions(+), 1 deletion(-)
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
index 000000000000..e9e0eb68e176
--- /dev/null
+++ b/include/linux/cmdline.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef LINUX_CMDLINE_H
+#define LINUX_CMDLINE_H
+
+#include <linux/types.h>
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
+char *option_iter_incr(struct option_iter *iter);
+
+/**
+ * option_iter_next - Loop condition to move over options
+ * @iter:	the iterator
+ * @opt:	the name of the option variable
+ *
+ * Iterates over option strings as part of a while loop and
+ * stores the current option in @opt.
+ *
+ * Return:
+ * True to continue the loop, or false if no further option has been found.
+ */
+static inline bool option_iter_next(struct option_iter *iter, char **opt)
+{
+	return ((*opt = option_iter_incr(iter)) != NULL);
+}
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
index 000000000000..3e53aa8d8a3d
--- /dev/null
+++ b/lib/cmdline_iter.c
@@ -0,0 +1,109 @@
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
+ * options. Struct &option_iter and its helpers parse the string and return
+ * the individual substrings.
+ *
+ * After obtaining the string from the kernel, initialize an instance of the
+ * option iterator and loop over its content as show below.
+ *
+ * .. code-block:: c
+ *
+ *	const char *options = ...; // kernel-provided option string
+ *
+ *	struct option_iter iter;
+ *	char *opt;
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
+ * The functions option_iter_init() and option_iter_release() enclose
+ * all code that uses struct &option_iter. The call to option_iter_init()
+ * initializes the iterator instance from the option string and sets it
+ * up to return the first contained substring. The iterator owns a copy
+ * of the option string, which is later freed by option_iter_release().
+ * The state of an instance of struct &option_iter is undefined after the
+ * release function has returned.
+ *
+ * The loop walks over the individual options while option_iter_next()
+ * succeeds. In this case, the second argument returns a pointer to the
+ * contained substring. If the option string contains an empty option
+ * (i.e., two commas next to each other), option_iter_next() skips the
+ * empty option automatically.
+ *
+ * The parsing process does not modify the original option string that
+ * was used to initialize the iterator. The memory returned by
+ * option_iter_next() is owned by the iterator instance. Callers are
+ * allowed to modify its content but may not free it. References to the
+ * returned string become stale after option_iter_release() has returned.
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
+ * Return:
+ * The current option string, or NULL if there are no more options.
+ */
+char *option_iter_incr(struct option_iter *iter)
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

