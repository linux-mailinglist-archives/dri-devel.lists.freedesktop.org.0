Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFUXKQUzqmm8NAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:51:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3892B21A5FD
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C2210E2E3;
	Fri,  6 Mar 2026 01:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QVCdWYZo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29CD10E2E6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 01:50:57 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-7d598f4b6fdso2768710a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 17:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772761857; x=1773366657; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4BixrpmblYk1fVfc//g7Bejl2P3I3dQW/tYhS8Iov94=;
 b=QVCdWYZoEDsn6JhZMUKHhxVD9kq3sVmw1qCwV7duDjyYNhQvX57nPeH5hLnCSzhsAH
 hZKsqSJ5JVqvHaKGGosO9Lct5rLEYOHJzdZNBe5QwGFbFYr/OzDIpgZA/Pnw7GiLkfNQ
 lVXCydHByVgeH/0yJMTmV9z7an9SxvocK/kCsSUtJoWy4xWPPpRqW3EZg+m2KLjk1mAX
 fYpO3QC45BYvHjepIeYoKGrSmW5SuB8tLkhTnk1ayMP+L5mkuBJIAid3+zHl2lVqtp71
 BlbxoJcQ1jL2ZSiYNLYPX0itCFV3SDEeKEjP/BQdcbItOj6g+IczTqd4nWcz7cGFI1WP
 iQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772761857; x=1773366657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4BixrpmblYk1fVfc//g7Bejl2P3I3dQW/tYhS8Iov94=;
 b=uaozJ8yjgtHStJ6VYczxb8Cnf1r3r8MEfRK+6noq6gWvTbYm7ejC7DsfhgBh6kFkyl
 MBoViML2nHRiweccnd5JAWOS82mgD9BvEtBU8kTpBoA8n9dunZ6z2RilK15chVEwMmhT
 qTIotMFD3hivlYSyIAqP9/K204Kmi3VWgooSJi7rl4tcIoAm8csAdrzKDbmpcAHM8VUR
 BXt9snRIA5LEdSNh4qYhuQ8CT0YuLT23nkUBrgC6z0PwTzQBokNG6DLuqEkzbWFjGKVx
 Vm4NJ6ea2nKvObOmFLHw7E4BWxV4yaIF064VOyprlFdrWENuJNcih5aBqDKRD37Iq1vA
 FSoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5TZXMchW0BjyUnVLaruK28UBq81eaEAt+N9x/jicL8jhS1GWMU0a2vEPI1CE3cpOMMeHf0choLMY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/TNe2+/1six2K0mETgSGIkniIiA8wGnhvsXLX1LIERM9xyCap
 b5MCtDw8+1fU9HocNjuiz1z2D118ADupG0B7T3PbO0Gj10vfp47uw8Z8
X-Gm-Gg: ATEYQzw3kox9OmPhgy9U+1Iysmqaa/7d52knsoZjM8QgMfJbM3xA3dW0z+SsHnis3uc
 MqMFRQnxJaYat8WaLa9sc6jgzuxl+FWGz2e6YVtmCFFa4yhL8WVCvIEZ6iWqQBzpruJXS/WWDfo
 jYPVZD4Cy8yGUQ3vpF9hzUb9eJiTTU4Y9PuhEyqAMmvexxWdCuq5HYQ9o3m1+cWyq8jllticDki
 oXDozM2e5Sds6FkZjVSSCWQr7juKSeI4b75QzWR7kgIEsDnJDQqV/CqkdxtaySPRRednqh5XmYa
 VHVTkStW074kpEvk2BWlktecsKGNffetyVXg4D75C9ZYORX1ykOy4EM998a7KThXATFO6ZWWP5o
 cU3rHpp5IbuhnZ0zw17PDYGX2EZhB6U2lmxhyIhAJb8MQ00A7Rwo+RVwwkkMmR+iyM9OuyoRA5V
 dnWj3g/THGLRi4cxaIsL+0g1zq7M++2HVa1nzFNtfddQYNLYBm
X-Received: by 2002:a05:6820:4410:b0:677:2ac6:3beb with SMTP id
 006d021491bc7-67b9bd49539mr338521eaf.55.1772761856874; 
 Thu, 05 Mar 2026 17:50:56 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-67b9cc1a627sm115245eaf.6.2026.03.05.17.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 17:50:56 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Alexandre Chartre <alexandre.chartre@oracle.com>,
 Juergen Gross <jgross@suse.com>, Andy Lutomirski <luto@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [RFC PATCH 1/7] jump_label: expose queueing API for batched static
 key updates
Date: Thu,  5 Mar 2026 18:50:04 -0700
Message-ID: <20260306015022.1940986-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306015022.1940986-1-jim.cromie@gmail.com>
References: <20260306015022.1940986-1-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: 3892B21A5FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:intel-gvt-dev@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:jim.cromie@gmail.com,m:jbaron@akamai.com,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:tglx@kernel.org,m:aliceryhl@google.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:alexandre.chartre@oracle.com,m:jgross@suse.com,m:luto@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:kees@kernel.org,m:nathan@kernel.org,m:lukas.bulwahn@redhat.com,m:jimcromie@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,akamai.com,infradead.org,kernel.org,google.com,goodmis.org,oracle.com,suse.com,redhat.com,alien8.de,linux.intel.com,zytor.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,akamai.com:email]
X-Rspamd-Action: no action

Currently, `HAVE_JUMP_LABEL_BATCH` provides an architecture-level
mechanism to defer instruction synchronization (`text_poke_sync()`)
when patching a sequence of static keys. However, this deferred
batching capability is not exposed as a public kernel API. Subsystems
that need to toggle a large number of static keys (e.g.,
dynamic_debug) currently suffer from O(N) overhead due to repeated
machine-wide synchronizations (stop_machine).

This patch introduces a public queueing API to expose this deferred
synchronization mechanism to the rest of the kernel. This allows
multiple static keys to be enabled/disabled by queueing their
architecture-level updates, before applying a single machine-wide
synchronization barrier after all instructions are modified.

The new API consists of:
- static_key_enable_queued(key)
- static_key_disable_queued(key)
- static_key_apply_queued() (the global barrier/flush)
- static_branch_enable_queued(x) / static_branch_disable_queued(x) macros

NOTES:

The '_queued' API suffix was chosen to match the underlying
'arch_jump_label_transform_queue' and to avoid confusion with the
existing rate-limited 'static_key_deferred' API.

Also unify the names under the 'static_key_*' prefix, renaming
jump_label_apply_queued to static_key_apply_queued (with a
compatibility macro) for consistency.

A pr_debug() is added to show the poked addresses, this exposed the
semi-random ordering coming from dynamic-debug, despite its ordered
descriptors.

So x86/kernel/alternatives gets new code to do an insert-sort, by
memcpy & memmove after appending.  This sorting yields a dramatic IPI
reduction; a following patch to dynamic-debug uses the API, and
includes the numbers.

Cc: Jason Baron <jbaron@akamai.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Andy Lutomirski <luto@kernel.org>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 arch/Kconfig                  |   3 +
 arch/x86/Kconfig              |   1 +
 arch/x86/kernel/alternative.c |  50 +++++++++-----
 arch/x86/kernel/jump_label.c  |  13 +++-
 include/linux/jump_label.h    |  24 +++++++
 kernel/jump_label.c           | 125 +++++++++++++++++++++++++++++++---
 6 files changed, 186 insertions(+), 30 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 102ddbd4298e..388a73545005 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -505,6 +505,9 @@ config HAVE_ARCH_JUMP_LABEL
 config HAVE_ARCH_JUMP_LABEL_RELATIVE
 	bool
 
+config HAVE_JUMP_LABEL_BATCH
+	bool
+
 config MMU_GATHER_TABLE_FREE
 	bool
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index e2df1b147184..4d7705890558 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -249,6 +249,7 @@ config X86
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_EXIT_ON_IRQ_STACK	if X86_64
 	select HAVE_IRQ_TIME_ACCOUNTING
+	select HAVE_JUMP_LABEL_BATCH
 	select HAVE_JUMP_LABEL_HACK		if HAVE_OBJTOOL
 	select HAVE_KERNEL_BZIP2
 	select HAVE_KERNEL_GZIP
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index a888ae0f01fb..85df82c36543 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -3137,26 +3137,19 @@ static void __smp_text_poke_batch_add(void *addr, const void *opcode, size_t len
 }
 
 /*
- * We hard rely on the text_poke_array.vec being ordered; ensure this is so by flushing
- * early if needed.
+ * We hard rely on the text_poke_array.vec being ordered; ensure this
+ * by finding where to insert to preserve the order, and mem-moving
+ * into place after appending it.
  */
-static bool text_poke_addr_ordered(void *addr)
+static int text_poke_get_insert_idx(void *addr)
 {
-	WARN_ON_ONCE(!addr);
+	int i;
 
-	if (!text_poke_array.nr_entries)
-		return true;
-
-	/*
-	 * If the last current entry's address is higher than the
-	 * new entry's address we'd like to add, then ordering
-	 * is violated and we must first flush all pending patching
-	 * requests:
-	 */
-	if (text_poke_addr(text_poke_array.vec + text_poke_array.nr_entries-1) > addr)
-		return false;
-
-	return true;
+	for (i = 0; i < text_poke_array.nr_entries; i++) {
+		if (text_poke_addr(&text_poke_array.vec[i]) > addr)
+			return i;
+	}
+	return text_poke_array.nr_entries;
 }
 
 /**
@@ -3174,9 +3167,30 @@ static bool text_poke_addr_ordered(void *addr)
  */
 void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-	if (text_poke_array.nr_entries == TEXT_POKE_ARRAY_MAX || !text_poke_addr_ordered(addr))
+	int insert_idx;
+
+	pr_debug("incoming addr=%px, current_qlen=%d\n",
+		 addr, text_poke_array.nr_entries);
+
+	if (text_poke_array.nr_entries == TEXT_POKE_ARRAY_MAX)
 		smp_text_poke_batch_finish();
+
+	insert_idx = text_poke_get_insert_idx(addr);
 	__smp_text_poke_batch_add(addr, opcode, len, emulate);
+
+	if (insert_idx < text_poke_array.nr_entries - 1) {
+		struct smp_text_poke_loc tmp;
+		int last = text_poke_array.nr_entries - 1;
+		/* Copy the newly appended item out */
+		memcpy(&tmp, &text_poke_array.vec[last], sizeof(tmp));
+
+		/* Shift everything from insert_idx over by 1 */
+		memmove(&text_poke_array.vec[insert_idx + 1],
+			&text_poke_array.vec[insert_idx],
+			(last - insert_idx) * sizeof(struct smp_text_poke_loc));
+		/* Drop the new item into its sorted home */
+		memcpy(&text_poke_array.vec[insert_idx], &tmp, sizeof(tmp));
+	}
 }
 
 /**
diff --git a/arch/x86/kernel/jump_label.c b/arch/x86/kernel/jump_label.c
index a7949a54a0ff..6b5bab5f34e8 100644
--- a/arch/x86/kernel/jump_label.c
+++ b/arch/x86/kernel/jump_label.c
@@ -120,6 +120,8 @@ void arch_jump_label_transform(struct jump_entry *entry,
 	jump_label_transform(entry, type, 0);
 }
 
+static int jump_label_queue_len;
+
 bool arch_jump_label_transform_queue(struct jump_entry *entry,
 				     enum jump_label_type type)
 {
@@ -135,14 +137,23 @@ bool arch_jump_label_transform_queue(struct jump_entry *entry,
 
 	mutex_lock(&text_mutex);
 	jlp = __jump_label_patch(entry, type);
-	smp_text_poke_batch_add((void *)jump_entry_code(entry), jlp.code, jlp.size, NULL);
+	smp_text_poke_batch_add((void *)jump_entry_code(entry),
+				jlp.code, jlp.size, NULL);
+	jump_label_queue_len++;
 	mutex_unlock(&text_mutex);
 	return true;
 }
 
 void arch_jump_label_transform_apply(void)
 {
+	if (!jump_label_queue_len) {
+		pr_debug("no queued jump_labels to apply\n");
+		return;
+	}
+
+	pr_debug("applying %d queued jump_labels\n", jump_label_queue_len);
 	mutex_lock(&text_mutex);
 	smp_text_poke_batch_finish();
+	jump_label_queue_len = 0;
 	mutex_unlock(&text_mutex);
 }
diff --git a/include/linux/jump_label.h b/include/linux/jump_label.h
index fdb79dd1ebd8..17f572abe4bb 100644
--- a/include/linux/jump_label.h
+++ b/include/linux/jump_label.h
@@ -234,10 +234,20 @@ extern void static_key_slow_dec_cpuslocked(struct static_key *key);
 extern int static_key_count(struct static_key *key);
 extern void static_key_enable(struct static_key *key);
 extern void static_key_disable(struct static_key *key);
+extern void static_key_enable_queued(struct static_key *key);
+extern void static_key_disable_queued(struct static_key *key);
+extern void static_key_apply_queued(void);
 extern void static_key_enable_cpuslocked(struct static_key *key);
 extern void static_key_disable_cpuslocked(struct static_key *key);
 extern enum jump_label_type jump_label_init_type(struct jump_entry *entry);
 
+#define static_branch_enable(x)			static_key_enable(&(x)->key)
+#define static_branch_disable(x)		static_key_disable(&(x)->key)
+#define static_branch_enable_queued(x)		static_key_enable_queued(&(x)->key)
+#define static_branch_disable_queued(x)		static_key_disable_queued(&(x)->key)
+#define static_branch_enable_cpuslocked(x)	static_key_enable_cpuslocked(&(x)->key)
+#define static_branch_disable_cpuslocked(x)	static_key_disable_cpuslocked(&(x)->key)
+
 /*
  * We should be using ATOMIC_INIT() for initializing .enabled, but
  * the inclusion of atomic.h is problematic for inclusion of jump_label.h
@@ -340,6 +350,18 @@ static inline void static_key_disable(struct static_key *key)
 	atomic_set(&key->enabled, 0);
 }
 
+static inline void static_key_enable_queued(struct static_key *key)
+{
+	static_key_enable(key);
+}
+
+static inline void static_key_disable_queued(struct static_key *key)
+{
+	static_key_disable(key);
+}
+
+static inline void static_key_apply_queued(void) {}
+
 #define static_key_enable_cpuslocked(k)		static_key_enable((k))
 #define static_key_disable_cpuslocked(k)	static_key_disable((k))
 
@@ -535,6 +557,8 @@ extern bool ____wrong_branch_error(void);
 
 #define static_branch_enable(x)			static_key_enable(&(x)->key)
 #define static_branch_disable(x)		static_key_disable(&(x)->key)
+#define static_branch_enable_queued(x)		static_key_enable_queued(&(x)->key)
+#define static_branch_disable_queued(x)		static_key_disable_queued(&(x)->key)
 #define static_branch_enable_cpuslocked(x)	static_key_enable_cpuslocked(&(x)->key)
 #define static_branch_disable_cpuslocked(x)	static_key_disable_cpuslocked(&(x)->key)
 
diff --git a/kernel/jump_label.c b/kernel/jump_label.c
index 7cb19e601426..76a0f4e68b73 100644
--- a/kernel/jump_label.c
+++ b/kernel/jump_label.c
@@ -91,6 +91,7 @@ jump_label_sort_entries(struct jump_entry *start, struct jump_entry *stop)
 }
 
 static void jump_label_update(struct static_key *key);
+static void jump_label_update_queued(struct static_key *key);
 
 /*
  * There are similar definitions for the !CONFIG_JUMP_LABEL case in jump_label.h.
@@ -250,6 +251,41 @@ void static_key_disable(struct static_key *key)
 }
 EXPORT_SYMBOL_GPL(static_key_disable);
 
+void static_key_enable_queued(struct static_key *key)
+{
+	STATIC_KEY_CHECK_USE(key);
+
+	if (atomic_read(&key->enabled) > 0) {
+		WARN_ON_ONCE(atomic_read(&key->enabled) != 1);
+		return;
+	}
+
+	jump_label_lock();
+	if (atomic_read(&key->enabled) == 0) {
+		atomic_set(&key->enabled, -1);
+		jump_label_update_queued(key);
+		atomic_set_release(&key->enabled, 1);
+	}
+	jump_label_unlock();
+}
+EXPORT_SYMBOL_GPL(static_key_enable_queued);
+
+void static_key_disable_queued(struct static_key *key)
+{
+	STATIC_KEY_CHECK_USE(key);
+
+	if (atomic_read(&key->enabled) != 1) {
+		WARN_ON_ONCE(atomic_read(&key->enabled) != 0);
+		return;
+	}
+
+	jump_label_lock();
+	if (atomic_cmpxchg(&key->enabled, 1, 0) == 1)
+		jump_label_update_queued(key);
+	jump_label_unlock();
+}
+EXPORT_SYMBOL_GPL(static_key_disable_queued);
+
 static bool static_key_dec_not_one(struct static_key *key)
 {
 	int v;
@@ -488,39 +524,59 @@ static bool jump_label_can_update(struct jump_entry *entry, bool init)
 	return true;
 }
 
-#ifndef HAVE_JUMP_LABEL_BATCH
 static void __jump_label_update(struct static_key *key,
 				struct jump_entry *entry,
 				struct jump_entry *stop,
 				bool init)
 {
+#ifndef HAVE_JUMP_LABEL_BATCH
 	for (; (entry < stop) && (jump_entry_key(entry) == key); entry++) {
 		if (jump_label_can_update(entry, init))
 			arch_jump_label_transform(entry, jump_label_type(entry));
 	}
-}
 #else
-static void __jump_label_update(struct static_key *key,
-				struct jump_entry *entry,
-				struct jump_entry *stop,
-				bool init)
-{
 	for (; (entry < stop) && (jump_entry_key(entry) == key); entry++) {
 
 		if (!jump_label_can_update(entry, init))
 			continue;
 
 		if (!arch_jump_label_transform_queue(entry, jump_label_type(entry))) {
-			/*
-			 * Queue is full: Apply the current queue and try again.
-			 */
 			arch_jump_label_transform_apply();
-			BUG_ON(!arch_jump_label_transform_queue(entry, jump_label_type(entry)));
+			WARN_ON_ONCE(!arch_jump_label_transform_queue(entry, jump_label_type(entry)));
 		}
 	}
 	arch_jump_label_transform_apply();
+#endif
 }
+
+static void __jump_label_update_queued(struct static_key *key,
+				      struct jump_entry *entry,
+				      struct jump_entry *stop,
+				      bool init)
+{
+#ifdef HAVE_JUMP_LABEL_BATCH
+	for (; (entry < stop) && (jump_entry_key(entry) == key); entry++) {
+
+		if (!jump_label_can_update(entry, init))
+			continue;
+
+		if (!arch_jump_label_transform_queue(entry, jump_label_type(entry))) {
+			arch_jump_label_transform_apply();
+			WARN_ON_ONCE(!arch_jump_label_transform_queue(entry, jump_label_type(entry)));
+		}
+	}
+#else
+	__jump_label_update(key, entry, stop, init);
+#endif
+}
+
+void static_key_apply_queued(void)
+{
+#ifdef HAVE_JUMP_LABEL_BATCH
+	arch_jump_label_transform_apply();
 #endif
+}
+EXPORT_SYMBOL_GPL(static_key_apply_queued);
 
 void __init jump_label_init(void)
 {
@@ -696,6 +752,27 @@ static void __jump_label_mod_update(struct static_key *key)
 	}
 }
 
+static void __jump_label_mod_update_queued(struct static_key *key)
+{
+	struct static_key_mod *mod;
+
+	for (mod = static_key_mod(key); mod; mod = mod->next) {
+		struct jump_entry *stop;
+		struct module *m;
+
+		if (!mod->entries)
+			continue;
+
+		m = mod->mod;
+		if (!m)
+			stop = __stop___jump_table;
+		else
+			stop = m->jump_entries + m->num_jump_entries;
+		__jump_label_update_queued(key, mod->entries, stop,
+					   m && m->state == MODULE_STATE_COMING);
+	}
+}
+
 static int jump_label_add_module(struct module *mod)
 {
 	struct jump_entry *iter_start = mod->jump_entries;
@@ -919,6 +996,32 @@ static void jump_label_update(struct static_key *key)
 		__jump_label_update(key, entry, stop, init);
 }
 
+static void jump_label_update_queued(struct static_key *key)
+{
+	struct jump_entry *stop = __stop___jump_table;
+	bool init = system_state < SYSTEM_RUNNING;
+	struct jump_entry *entry;
+#ifdef CONFIG_MODULES
+	struct module *mod;
+
+	if (static_key_linked(key)) {
+		__jump_label_mod_update_queued(key);
+		return;
+	}
+
+	scoped_guard(rcu) {
+		mod = __module_address((unsigned long)key);
+		if (mod) {
+			stop = mod->jump_entries + mod->num_jump_entries;
+			init = mod->state == MODULE_STATE_COMING;
+		}
+	}
+#endif
+	entry = static_key_entries(key);
+	if (entry)
+		__jump_label_update_queued(key, entry, stop, init);
+}
+
 #ifdef CONFIG_STATIC_KEYS_SELFTEST
 static DEFINE_STATIC_KEY_TRUE(sk_true);
 static DEFINE_STATIC_KEY_FALSE(sk_false);
-- 
2.53.0

