Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E42AC8016
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 17:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1723710E747;
	Thu, 29 May 2025 15:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i4N5Acgi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5BF10E747;
 Thu, 29 May 2025 15:21:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4CEA25C683B;
 Thu, 29 May 2025 15:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FA4C4CEF4;
 Thu, 29 May 2025 15:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748532081;
 bh=9KzjBeijJbwQSkvtYkmlylVwurawjIJhRyN9jmLegKI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=i4N5AcgiTgEyDcwGcPjOHjUScjymcYm4cycqpe02RHsBEUI1K5wqC+vhdBuUWfjeU
 VbTIBSvVwR88E0jkDZUFLR0VVv2xmkDzLlnrxOF1KbAHY3ZeN2ICM5vcgzvbtam7lo
 AafWDYGZiYiH6zw9l7BusWPklAx25435mCzQi3RGcH26LqXqqtclkTrcvSpWAs5j7u
 llWo6DWf+35M19a6RXLfYfVoTrAZ1ZuEaiTdrfev4engMnhgRQtw32kir//o68xMOG
 UY9YcZB790EY1bQ1gQriQ0CsTIniaRjFaUHXVCYYaSdbElIADVHzFGAx1i837MwRP9
 +Smrxno26DWXg==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 29 May 2025 11:20:40 -0400
Subject: [PATCH v12 04/10] ref_tracker: have callers pass output function
 to pr_ostream()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-reftrack-dbgfs-v12-4-11b93c0c0b6e@kernel.org>
References: <20250529-reftrack-dbgfs-v12-0-11b93c0c0b6e@kernel.org>
In-Reply-To: <20250529-reftrack-dbgfs-v12-0-11b93c0c0b6e@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4242; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=9KzjBeijJbwQSkvtYkmlylVwurawjIJhRyN9jmLegKI=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoOHtmR1XufS9ecqZGFnGmxkvcH1MwQt9Ac+oyh
 +q74Q5/OCGJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDh7ZgAKCRAADmhBGVaC
 FUnVD/4z3Qi84OdMnuOf5443OuPUvmBC6C4oAF7j4rpNDD1PTu1r0Sam9NfCEwdVIUsludfONZV
 Xj09vkyAiTT1uxNTifSaNBslXM0Wrpo3xLLN1ygw8DMlRmRR01oaPqK0m1bu633nr8yi5UW5nCr
 zrdo2f7ovU4lQqxAxdVHaFvA9I8nCa44xpz9QWjbxJ/nuwigEVquhFcm1+7YU0bHlB9jTXsua7f
 6gPZOfEKrVl5dy2ue0bEGtxJ1GkNWtMac0Nj9GCT9MR5NxbmZrCpfx8G3f8kApYumF4oNcZpk2B
 lgdVQy9n7Bi0c17xhREqtHBJy+2enyTg4fxtkB7FLUeudx9cs22ARFOSQ+m6NhPJWUe+ZxCSXYp
 VahU4ROkT5lSs5QtlmYJJevB8JIzdqgp8VYtzbvXrTiM2ty8zP+ZVlBJ9pBmUydZDzKPpfFGS1e
 hWsV0BidIj1CpGESSmeeAVgztNU7Mr//rkM5CZPYUNhk7FAI804O6kijITNgjXfwSfyXawuAkZN
 8KHJbmTLSc5uXFR+uJMm3neMIlGaR14xnHHEuOyT3+4UErb1ObX3kXNBzDR/ibmDIKvHQt9W+oi
 fm5muTqn+xeRvr6vAe0da/f/dize5qDghSahl9fPL544fCSeeLjKvu1tjPnEPtJu28RCyClcBzT
 eVlUK3EUVBTUcGA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
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

In a later patch, we'll be adding a 3rd mechanism for outputting
ref_tracker info via seq_file. Instead of a conditional, have the caller
set a pointer to an output function in struct ostream. As part of this,
the log prefix must be explicitly passed in, as it's too late for the
pr_fmt macro.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 include/linux/ref_tracker.h |  2 ++
 lib/ref_tracker.c           | 51 ++++++++++++++++++++++++++++++++-------------
 2 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index 8eac4f3d52547ccbaf9dcd09962ce80d26fbdff8..a0a1ee43724ffa00e60c116be18e481bfe1d1455 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -6,6 +6,8 @@
 #include <linux/spinlock.h>
 #include <linux/stackdepot.h>
 
+#define __ostream_printf __printf(2, 3)
+
 struct ref_tracker;
 
 struct ref_tracker_dir {
diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index d374e5273e1497cac0d70c02c282baa2c3ab63fe..4f2112b001de3049ed542ea3c4f2bc1e9cce6043 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -63,21 +63,37 @@ ref_tracker_get_stats(struct ref_tracker_dir *dir, unsigned int limit)
 }
 
 struct ostream {
+	void __ostream_printf (*func)(struct ostream *stream, char *fmt, ...);
+	char *prefix;
 	char *buf;
 	int size, used;
 };
 
+static void __ostream_printf pr_ostream_log(struct ostream *stream, char *fmt, ...)
+{
+	va_list args;
+
+	va_start(args, fmt);
+	vprintk(fmt, args);
+	va_end(args);
+}
+
+static void __ostream_printf pr_ostream_buf(struct ostream *stream, char *fmt, ...)
+{
+	int ret, len = stream->size - stream->used;
+	va_list args;
+
+	va_start(args, fmt);
+	ret = vsnprintf(stream->buf + stream->used, len, fmt, args);
+	va_end(args);
+	stream->used += min(ret, len);
+}
+
 #define pr_ostream(stream, fmt, args...) \
 ({ \
 	struct ostream *_s = (stream); \
 \
-	if (!_s->buf) { \
-		pr_err(fmt, ##args); \
-	} else { \
-		int ret, len = _s->size - _s->used; \
-		ret = snprintf(_s->buf + _s->used, len, pr_fmt(fmt), ##args); \
-		_s->used += min(ret, len); \
-	} \
+	_s->func(_s, fmt, ##args); \
 })
 
 static void
@@ -96,8 +112,8 @@ __ref_tracker_dir_pr_ostream(struct ref_tracker_dir *dir,
 
 	stats = ref_tracker_get_stats(dir, display_limit);
 	if (IS_ERR(stats)) {
-		pr_ostream(s, "%s@%p: couldn't get stats, error %pe\n",
-			   dir->name, dir, stats);
+		pr_ostream(s, "%s%s@%p: couldn't get stats, error %pe\n",
+			   s->prefix, dir->name, dir, stats);
 		return;
 	}
 
@@ -107,14 +123,15 @@ __ref_tracker_dir_pr_ostream(struct ref_tracker_dir *dir,
 		stack = stats->stacks[i].stack_handle;
 		if (sbuf && !stack_depot_snprint(stack, sbuf, STACK_BUF_SIZE, 4))
 			sbuf[0] = 0;
-		pr_ostream(s, "%s@%p has %d/%d users at\n%s\n", dir->name, dir,
-			   stats->stacks[i].count, stats->total, sbuf);
+		pr_ostream(s, "%s%s@%p has %d/%d users at\n%s\n", s->prefix,
+			   dir->name, dir, stats->stacks[i].count,
+			   stats->total, sbuf);
 		skipped -= stats->stacks[i].count;
 	}
 
 	if (skipped)
-		pr_ostream(s, "%s@%p skipped reports about %d/%d users.\n",
-			   dir->name, dir, skipped, stats->total);
+		pr_ostream(s, "%s%s@%p skipped reports about %d/%d users.\n",
+			   s->prefix, dir->name, dir, skipped, stats->total);
 
 	kfree(sbuf);
 
@@ -124,7 +141,8 @@ __ref_tracker_dir_pr_ostream(struct ref_tracker_dir *dir,
 void ref_tracker_dir_print_locked(struct ref_tracker_dir *dir,
 				  unsigned int display_limit)
 {
-	struct ostream os = {};
+	struct ostream os = { .func = pr_ostream_log,
+			      .prefix = "ref_tracker: " };
 
 	__ref_tracker_dir_pr_ostream(dir, display_limit, &os);
 }
@@ -143,7 +161,10 @@ EXPORT_SYMBOL(ref_tracker_dir_print);
 
 int ref_tracker_dir_snprint(struct ref_tracker_dir *dir, char *buf, size_t size)
 {
-	struct ostream os = { .buf = buf, .size = size };
+	struct ostream os = { .func = pr_ostream_buf,
+			      .prefix = "ref_tracker: ",
+			      .buf = buf,
+			      .size = size };
 	unsigned long flags;
 
 	spin_lock_irqsave(&dir->lock, flags);

-- 
2.49.0

