Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 055604630C8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 11:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFE86E838;
	Tue, 30 Nov 2021 10:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com
 [IPv6:2a00:1450:4864:20::349])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06C16E81F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 10:14:07 +0000 (UTC)
Received: by mail-wm1-x349.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so13499766wma.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 02:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=GIp7EQn2UnohoTj+yPMh1P0FmhJDYsjIC78ghQsH60U=;
 b=PGw1FmJ+9GtdWBnIbq7f+hljBVAL0lFbftpkYi1JLWLVMNYhLv7261fjg4MqiYs3kv
 R8poFfyshuoIbY13aW6fVh2RUJjOfFJqRKmb1Qu540Xuco19JGFOfU0aRxU0/gVTqb7L
 d+miGay8ofozSEpc9+9bgYsb4ZzIqZgdc5Lyqo/qUcinDbViru5aSfKjydYBhCxM9gSI
 /ZJxKOVZHWtHUmb0Gz7Q8CoK2/VjU2W0+ZJye7JyyG7XHPK4CLdYWyKbHAOZc3NTwBmJ
 bxHO1oIuPKFcdO7fehRy7s/817CNqQ968rheE0GoOAdmojCvdHngtz1Y4yINbTR0iKeN
 QJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=GIp7EQn2UnohoTj+yPMh1P0FmhJDYsjIC78ghQsH60U=;
 b=6+MzzrpKtgaj0LeYjuc5XVnVDhuG49MgUaR88KS9SQJD040djumHDCSd4P2wwU43F8
 GYS8YjkoWhM7tSNUPOTB0QkXQD4J/9nk20pMU7nRWVsuCF09rfW/f894f/mzQpHIbvGB
 nOcF24GAIX3Ev8wmfRhcIcZjdjPlQGawvARfqdu0d3j/CK89RDrV/77kPEyVOHZUeFZP
 REHRvByvw4NfNH0J1AUxR9dlJAlT0wDzfqENWn/FBeadNA8s3tgnA4gnat9VcwpoppEv
 Ndjm8hvD32rDHXiABqIrYQOyhXkOTDp97m6PNQuGrubX1kW3kXTycLr33lkPqPeL5yT5
 p00w==
X-Gm-Message-State: AOAM531u0bT/dPERhXt8QP78MV8tQke1lhRLDNcfpQ7c4+ck8HmYMQ48
 t38S5aBBkuWBu4Q4jSxlkk1krUt4eg==
X-Google-Smtp-Source: ABdhPJxZ/cQtxZDq13eLfl7Z5mw2/skPl5gwILIaBmKsGNdiwTMcLcVdLHag+IyGI45Qp/W/X+ZIkCuzcA==
X-Received: from elver.muc.corp.google.com
 ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:adf:dd0a:: with SMTP id
 a10mr39649481wrm.60.1638267246341; 
 Tue, 30 Nov 2021 02:14:06 -0800 (PST)
Date: Tue, 30 Nov 2021 10:57:27 +0100
Message-Id: <20211130095727.2378739-1-elver@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH] lib/stackdepot: always do filter_irq_stacks() in
 stack_depot_save()
From: Marco Elver <elver@google.com>
To: elver@google.com, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Imran Khan <imran.f.khan@oracle.com>, Vijayanand Jitta <vjitta@codeaurora.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org,
 Vlastimil Babka <vbabka@suse.cz>, Andrey Konovalov <andreyknvl@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The non-interrupt portion of interrupt stack traces before interrupt
entry is usually arbitrary. Therefore, saving stack traces of interrupts
(that include entries before interrupt entry) to stack depot leads to
unbounded stackdepot growth.

As such, use of filter_irq_stacks() is a requirement to ensure
stackdepot can efficiently deduplicate interrupt stacks.

Looking through all current users of stack_depot_save(), none (except
KASAN) pass the stack trace through filter_irq_stacks() before passing
it on to stack_depot_save().

Rather than adding filter_irq_stacks() to all current users of
stack_depot_save(), it became clear that stack_depot_save() should
simply do filter_irq_stacks().

Signed-off-by: Marco Elver <elver@google.com>
---
 lib/stackdepot.c  | 13 +++++++++++++
 mm/kasan/common.c |  1 -
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index b437ae79aca1..519c7898c7f2 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -305,6 +305,9 @@ EXPORT_SYMBOL_GPL(stack_depot_fetch);
  * (allocates using GFP flags of @alloc_flags). If @can_alloc is %false, avoids
  * any allocations and will fail if no space is left to store the stack trace.
  *
+ * If the stack trace in @entries is from an interrupt, only the portion up to
+ * interrupt entry is saved.
+ *
  * Context: Any context, but setting @can_alloc to %false is required if
  *          alloc_pages() cannot be used from the current context. Currently
  *          this is the case from contexts where neither %GFP_ATOMIC nor
@@ -323,6 +326,16 @@ depot_stack_handle_t __stack_depot_save(unsigned long *entries,
 	unsigned long flags;
 	u32 hash;
 
+	/*
+	 * If this stack trace is from an interrupt, including anything before
+	 * interrupt entry usually leads to unbounded stackdepot growth.
+	 *
+	 * Because use of filter_irq_stacks() is a requirement to ensure
+	 * stackdepot can efficiently deduplicate interrupt stacks, always
+	 * filter_irq_stacks() to simplify all callers' use of stackdepot.
+	 */
+	nr_entries = filter_irq_stacks(entries, nr_entries);
+
 	if (unlikely(nr_entries == 0) || stack_depot_disable)
 		goto fast_exit;
 
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 8428da2aaf17..efaa836e5132 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -36,7 +36,6 @@ depot_stack_handle_t kasan_save_stack(gfp_t flags, bool can_alloc)
 	unsigned int nr_entries;
 
 	nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 0);
-	nr_entries = filter_irq_stacks(entries, nr_entries);
 	return __stack_depot_save(entries, nr_entries, flags, can_alloc);
 }
 
-- 
2.34.0.rc2.393.gf8c9666880-goog

