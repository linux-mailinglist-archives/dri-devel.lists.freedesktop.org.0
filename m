Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C23AD3C01
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D96C10E598;
	Tue, 10 Jun 2025 14:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M5rL0v3E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DE210E58C;
 Tue, 10 Jun 2025 14:59:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DF2F54A87A;
 Tue, 10 Jun 2025 14:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA0AC4CEF0;
 Tue, 10 Jun 2025 14:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749567593;
 bh=fIUtfKsTxdswV0+z7NV6Nx2ljCgH4pcViNimfWT3u1o=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=M5rL0v3EHgtzm1+YPuRcK2PSIOLO9mlfBdonjLj5F4sfLQypAm1+pB1TXYtMM7fpk
 6KLgCw5CkKufVZ1l0tkGw6xLxxX/1vMyCfzgLNZDdN0DPv0EyOAfhqHmBB0Xe1KO+1
 0VXLviw2MPa0tpydfSLnut1HqjP2FFqsjAGEc4/FTXyy/RH6I9ZFP6zdePgiG18yB7
 nZA7IqiEUXYtL9A2aSJbrsJRp7YASgQqfFnSb1gSFuPq4wi3h+r+yV04K2vTORqz9D
 HL8+Be9UTgYmTKddM1NeJzxOOM9X2twBrT9nli2s8bAMgU1mtfuj1CAOEjKH/cvfFr
 toNQhgU8MIaXA==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 10 Jun 2025 10:59:25 -0400
Subject: [PATCH v14 5/9] ref_tracker: allow pr_ostream() to print directly
 to a seq_file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-reftrack-dbgfs-v14-5-efb532861428@kernel.org>
References: <20250610-reftrack-dbgfs-v14-0-efb532861428@kernel.org>
In-Reply-To: <20250610-reftrack-dbgfs-v14-0-efb532861428@kernel.org>
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
Cc: Krzysztof Karas <krzysztof.karas@intel.com>, 
 Kuniyuki Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=fIUtfKsTxdswV0+z7NV6Nx2ljCgH4pcViNimfWT3u1o=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoSEhcnHtf/8juAzoak1v6poZL6p29vAqIwvQWR
 a6pOohhBWyJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaEhIXAAKCRAADmhBGVaC
 Ff+HD/9vTdoNPo+3wTbGpEMt9ydg3c6ivO2MrcOnnHyyGvkoa/t7uiHV1J93vQln5SQpAnQpjls
 RtfB3oXiuxy3z/9it2bTtHqUlES5HpHDPhycMos5uAtjlPpFYVUkGUnKKlSEzzMjfK3xzHyOmE7
 1Aq3rXvaqxSU+SnxZRRVBECoSZn8Al1Wm7WRrpwmqGi38RD9zMBgl7VrqVcrSBwYe+WBaXg7erF
 VvajFxbiIRvv4CBFvVyhv3RXPWvknXC3sPs9mt2DEqpcEG3tuLsZUn4+EUBJedDdSwJK4UyaGcE
 k5pbvKZrUzUIzb0RNDlqYC76ej9KTT4I3UlqoLr8X3aoMSdM2vwmxQ3ve6UNL5DnHz89wzkwurZ
 E/B8XiseC1+x3kMON/Gcrwvu7v4hdggbPZdksjrgCQrCISoF4ka5AHjvh2/34bFCgbPjgDfBtbM
 iRj7E/OSQ6niXden1KFkbuekkrg/tP9B9/tYQMekqzw6kULbB7idAJF8eQWNqN7caOcHLoiEfYu
 ctfKLA0JCrrxTsBlPTjsKVW6PQvtMNf74ZwPHPDoe4TR2wlKNTpv6j/Wnod5L6VCoCIz/fbkZb0
 crqSXwCGeryhbAdVz1gwGlD3m143OGGHltOGC83GRviAcRp+Vh6uwjx4EwcuLED38MCuvB88dUC
 RpjWRF4q3ehSslw==
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

Allow pr_ostream to also output directly to a seq_file without an
intermediate buffer. The first caller of +ref_tracker_dir_seq_print()
will come in a later patch, so mark that __maybe_unused for now. That
designation will be removed once it is used.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 lib/ref_tracker.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index 42872f406b2a91b5bc611405cae7ce883fd8ed22..73b606570cce9e551d13e65365a87dc4ce748b13 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -8,6 +8,7 @@
 #include <linux/slab.h>
 #include <linux/stacktrace.h>
 #include <linux/stackdepot.h>
+#include <linux/seq_file.h>
 
 #define REF_TRACKER_STACK_ENTRIES 16
 #define STACK_BUF_SIZE 1024
@@ -66,6 +67,7 @@ struct ostream {
 	void __ostream_printf (*func)(struct ostream *stream, char *fmt, ...);
 	char *prefix;
 	char *buf;
+	struct seq_file *seq;
 	int size, used;
 };
 
@@ -301,6 +303,30 @@ EXPORT_SYMBOL_GPL(ref_tracker_free);
 
 static struct dentry *ref_tracker_debug_dir = (struct dentry *)-ENOENT;
 
+static void __ostream_printf pr_ostream_seq(struct ostream *stream, char *fmt, ...)
+{
+	va_list args;
+
+	va_start(args, fmt);
+	seq_vprintf(stream->seq, fmt, args);
+	va_end(args);
+}
+
+static __maybe_unused int
+ref_tracker_dir_seq_print(struct ref_tracker_dir *dir, struct seq_file *seq)
+{
+	struct ostream os = { .func = pr_ostream_seq,
+			      .prefix = "",
+			      .seq = seq };
+	unsigned long flags;
+
+	spin_lock_irqsave(&dir->lock, flags);
+	__ref_tracker_dir_pr_ostream(dir, 16, &os);
+	spin_unlock_irqrestore(&dir->lock, flags);
+
+	return os.used;
+}
+
 static int __init ref_tracker_debugfs_init(void)
 {
 	ref_tracker_debug_dir = debugfs_create_dir("ref_tracker", NULL);

-- 
2.49.0

