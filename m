Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 010A13D8158
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 23:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9BF6EAB7;
	Tue, 27 Jul 2021 21:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23A16EAA6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 21:17:00 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id a20so118587plm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 14:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vRgb1VJvkR4TxUQ9j5wT6NQOJVualZe/N5ucmrpwcpM=;
 b=Urt716jbz8XdyF5XY5KmZM6capTDsG++7NWnKWGXa8A82gOnBVfVmzBVpmjGHy1J4E
 Ae0oY6icZsuXtD/nJ3EHWKWtJRkbNQuHNTS22y5t0/gFqDYoj2X9jMSktKlfLPXE1X8w
 GZLII5xANVEeoTTYkjVLPXyHbZ6nhUyQoz/jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vRgb1VJvkR4TxUQ9j5wT6NQOJVualZe/N5ucmrpwcpM=;
 b=ruRnqFB/Ee1MuJciRRY0nnfOsnmnuIlKv96su2Z58GakJHcL/L+XIMdpcqQsvssdPp
 m6bybXgQ0RtC+xP0YhxrUoFoHFp8fP0Wwzcgj2TkjnfnjnwJZIA4EBXB8OG8v/x2RnhO
 bR+oTGzML+E451MI1WqPUStbIqleDaLWqUQq0hGIf7bjH0mKmeCKxpLTuyfNUAg2QfeO
 zXGK6ZW1QOJjVNGkYBwMdYg6dkbOb08dtOUeD0ThNTxhSTRhM2rGu3osnqcHWovEnc2W
 4nElMUKtYFCx3Hvlhnr6skHKO6TCjMSAwpjzDiPcJGmP3qUXN9Lm44GdMnd9uFPDXC7U
 Qo0A==
X-Gm-Message-State: AOAM531CgPlCM3hzu4ZzlBOqW1kbC3bRmofXCg659mfi/fq3EqFpvQA0
 WX760V6RyQKLCLPJubHN3iGfMQ==
X-Google-Smtp-Source: ABdhPJyL6XeGJmKfKYoPIwSnVfrJu9DIh6q4pNy4qcyzmKIcgSJdIeoB0sfhxYXoqkr/188RbhWTVQ==
X-Received: by 2002:a05:6a00:1913:b029:32b:cec0:77e5 with SMTP id
 y19-20020a056a001913b029032bcec077e5mr24883708pfi.76.1627420619841; 
 Tue, 27 Jul 2021 14:16:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id w15sm3794043pjc.45.2021.07.27.14.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 14:16:57 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 51/64] tracing: Use struct_group() to zero struct
 trace_iterator
Date: Tue, 27 Jul 2021 13:58:42 -0700
Message-Id: <20210727205855.411487-52-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917; h=from:subject;
 bh=x33Bs21uGrD+N+Lns8bFSqK7vUUUNaNSw4EtFfeCu58=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOLu8z/bdU1zMaKndqRyKLCCkXgpWttZKN9yc8w
 d3BxuKSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBziwAKCRCJcvTf3G3AJgHsD/
 98DZD+ecFAqbOjuzLoGxIi4OSnpxnTAcnT2/ZfVnIlEZyXBS+jkr8lU+k0GXpQG2scT/z3KyhdrOJp
 E60WG63kSFNFWzdWBZZyb0Rf9XVDGHksNfg81VOrWxyCFWrib/BFkg1uKQ3XHny7kvC0saWxsJLOvP
 PMmBG3p0AzH/bcHeY8JCSe1JqVGWLz4Wdiqq+a1FX3oATkVH4X6hjEPQSu7K5W5gsu8y3sWyfaJ/21
 OTekfh+08tGzJUz0x5qwW+mEDgtAt0LEEHLhnIpkUCLiYWmDJzWKF5CUljC6wN4V/uNZBOMTukJCz8
 F9nA0W1W0nXeWdz0Z6mMUksqNHOYIhyE52fHArE2U0l0tdWYgbUybcSQsrFUzJ1QxTx6KXNTmHAdC8
 g1F37UY/3wzrelPZKNjO7Q2mpX8Q0hoRoR0IePaxvGxraMIKoteVOWP+yTjyheOHuIRmmwFS+m4zl0
 xz0ti0B1g1MqQBahH7M3aZtJg/kgJEHRJTpe8g68atzyvYwY8rGNnEiemCygZ2liwL0XGVd/tcrTlJ
 KkliSKYsXdS6eykIau3c0P0wmRt7ydb/oQgVBcA744nu/6TZH0x0ehC/RmIZ3f0pnMMvLuX81V1dQy
 aaHLtNUQtk1I2pKRDzLqOWe+HldXvpA+eH/7VFXxng+zPZzpvdu07VGean9Q==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, netdev@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Add struct_group() to mark region of struct trace_iterator that should
be initialized to zero.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/trace_events.h | 26 ++++++++++++++------------
 kernel/trace/trace.c         |  4 +---
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/linux/trace_events.h b/include/linux/trace_events.h
index ad413b382a3c..cadad77fe524 100644
--- a/include/linux/trace_events.h
+++ b/include/linux/trace_events.h
@@ -101,18 +101,20 @@ struct trace_iterator {
 	bool			snapshot;
 
 	/* The below is zeroed out in pipe_read */
-	struct trace_seq	seq;
-	struct trace_entry	*ent;
-	unsigned long		lost_events;
-	int			leftover;
-	int			ent_size;
-	int			cpu;
-	u64			ts;
-
-	loff_t			pos;
-	long			idx;
-
-	/* All new field here will be zeroed out in pipe_read */
+	struct_group(init,
+		struct trace_seq	seq;
+		struct trace_entry	*ent;
+		unsigned long		lost_events;
+		int			leftover;
+		int			ent_size;
+		int			cpu;
+		u64			ts;
+
+		loff_t			pos;
+		long			idx;
+
+		/* All new field here will be zeroed out in pipe_read */
+	);
 };
 
 enum trace_iter_flags {
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index c59dd35a6da5..9f83864b0be6 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6691,9 +6691,7 @@ tracing_read_pipe(struct file *filp, char __user *ubuf,
 		cnt = PAGE_SIZE - 1;
 
 	/* reset all but tr, trace, and overruns */
-	memset(&iter->seq, 0,
-	       sizeof(struct trace_iterator) -
-	       offsetof(struct trace_iterator, seq));
+	memset(&iter->init, 0, sizeof(iter->init));
 	cpumask_clear(iter->started);
 	trace_seq_init(&iter->seq);
 	iter->pos = -1;
-- 
2.30.2

