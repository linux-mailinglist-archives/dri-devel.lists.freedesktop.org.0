Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426C7AC6BC7
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 16:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F52710E653;
	Wed, 28 May 2025 14:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tlgaHZGm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6554210E648;
 Wed, 28 May 2025 14:34:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D8EBA629DB;
 Wed, 28 May 2025 14:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8666C4CEEF;
 Wed, 28 May 2025 14:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748442896;
 bh=jHVEVy1GEirWdHs1IJVtpuQ6jElofdeZ5cfT2E8mzAk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tlgaHZGmpciD919foUtiVyDb7z4kKbKDA84tTtL4GWgN8m1Mi5XqPVI2Vl370VmEE
 yNwSqDE0RufEzCkS19v9PAm3O4wxNUk1xVuvp4I5yyY0CDIKR3T7dT1ZSNLr3geQmb
 I7uNu6U4AeuAbf79fj7ELIPijPr7HdGVhSvjZXIQXJ/frbzZ7wfpSrQQvEyXrvazgv
 wvoIDYNdssNbUJZh2jR0jEwzMiOWboXPqSHDVOLro77Wnf4vpu0sPnXEoCHrNbHOjW
 fHxiBlHR1WcpCNYlFyeL0/SRthxodKxdH4JIX1ea4MZm1CD1MPPdZbNvT2GSCH6zSr
 dkhP4NXGESAmQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 28 May 2025 10:34:36 -0400
Subject: [PATCH v11 04/10] ref_tracker: have callers pass output function
 to pr_ostream()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-reftrack-dbgfs-v11-4-94ae0b165841@kernel.org>
References: <20250528-reftrack-dbgfs-v11-0-94ae0b165841@kernel.org>
In-Reply-To: <20250528-reftrack-dbgfs-v11-0-94ae0b165841@kernel.org>
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
 h=from:subject:message-id; bh=jHVEVy1GEirWdHs1IJVtpuQ6jElofdeZ5cfT2E8mzAk=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoNx8FmZtnBL+zLjp+PEeI71Y4FFL+3F+XQH46u
 6+TgXwowQ+JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDcfBQAKCRAADmhBGVaC
 FQC1D/4g7U2suKxkXU+QlGTLqD1ATt20dDu/2nHpmNyYaxeizvdQCSTcdfxVaVH4UrT9KYpBvEn
 un0ebpHfOu0ygg2IiTsQEIhejqllwaJtpWqznAkKwA7+7XPT7H0oEthmQVyS7x3VBsY4FyhQzVU
 3FODmp6o8v2RaJmBIZCDAMlXB0crYXVJckj1Z+9Ti9ptTDU2IhqdKlKNgIeUCLyWuQB6eAjqeMP
 Eh1x/l06Gi4E5IEskp0NGJNLnnuw2bFHjbdRdEv085Mp4EEGkHwr97qSb8RVmOtIh4GPk665iGJ
 oQJf5ElEikeFHKtAhd20eizbXf9UzOhD/N+wjvF0Euy2M+qoO0Bradu/hoTUNPGqUzMpW1u2bRv
 18Zn4LdfkyOb7YLRqCZ6cCXJVphESKfgVvR5jt+nzKQ/ytqU7w/KaTobLwRRjBbcgwcdlpBNZLv
 J/zDXVJECuKqu9fW/dGsR/9volvzMAOkpvZFK32FZL46dMeFFWttmE31TqDA32TdtEZiVBP/9ta
 E6GC5kNzRV34qL8P809Eu8MpQSIKdXcoK5SUW6hfhKaQKLNyZSJ5VfQFAxzaDnxCeT8pve+t+Rf
 XbdvilZGJ9oxJgEZPapHEnX+P3faDJrwWVfahQ1CB9zBU02q7OpWEZ+rWHRMAR398EfJ+c5hmq2
 Ltf2I+3V+NuJ1Xg==
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
index 34ac37db209077d6771d5f4367e53d19ba3169c6..607718d00ffa74bd6d9abf97e913abcfd56dd1c8 100644
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

