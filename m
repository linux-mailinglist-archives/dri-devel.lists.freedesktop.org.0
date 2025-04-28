Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC32A9F878
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 20:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A7710E693;
	Mon, 28 Apr 2025 18:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ItJW/ApR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2E610E6AD;
 Mon, 28 Apr 2025 18:27:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B38CFA4B67C;
 Mon, 28 Apr 2025 18:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF877C4CEF2;
 Mon, 28 Apr 2025 18:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745864828;
 bh=fZKlpIcOJEF616o9qzMIcvZOI/oG1RfsOsr5fOV2mTY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ItJW/ApRtFZNn8Pqn0PWf5YpYdYsk5BXh98Hnctw2dako7/BsLN+yRGp/nVrJTLTp
 HuX1P37y9/HQ42hbKrbuaxWa+k4P3An6hpBe8Y6RHkLEmOY74FT/RqBZ/K/ItdfFyI
 X6W+uQU1U8HYIPZlCT0EYDIC0PVVrq/7ch/PhgmBi+YSbmm41nGGZlsCmTqA7XnoKT
 bRYgVxrukMqkH9+U+2jqoa+3wzV84NVZPaQS5Rf/qI7g47qnMe4yyXIMgeHmOMQ8Ss
 8CK1s4V+R825UJiRISB6HUUygAxOh2EE8F4NDicauTgSnrt3RMV3pzRRedB9bQMr6G
 80HEcEERy9gJA==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 28 Apr 2025 11:26:27 -0700
Subject: [PATCH v5 04/10] ref_tracker: allow pr_ostream() to print directly
 to a seq_file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-reftrack-dbgfs-v5-4-1cbbdf2038bd@kernel.org>
References: <20250428-reftrack-dbgfs-v5-0-1cbbdf2038bd@kernel.org>
In-Reply-To: <20250428-reftrack-dbgfs-v5-0-1cbbdf2038bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1942; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=fZKlpIcOJEF616o9qzMIcvZOI/oG1RfsOsr5fOV2mTY=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBoD8h19lmvXGTuNFcSN5fIMVwJMgTnbS9ux8eeC
 9Smvy1t8q2JAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaA/IdQAKCRAADmhBGVaC
 FdZpD/9wFVujdvH6ipX25y57L5uQZU/l/dal5kV1364+dlMrFDwCExdLvbXQJclwLlzOnkGKXQw
 lSedyy9xO5/QjCKxbveMsqGstv0uqyENt0uqsFhzmtyAU4Z2UFcFRxGE2qQJ6ccdxFXb12WsULh
 3RWPDrgdZBQCrjeublN6njJdjEgg0CDo4OEotR+TDI38x71uYXRG/TB5SNRsY2T5FlOfMrgoF98
 1ANLNmsaLi6sr1IfIIAVp7Zf2kmXBZBwpisqWZ5jizuea7ZmDfSWHbL0dFpBO1SdhZCmeY4Es+/
 I+k3mY2IrJEFxwSUHHDL0X2/NloauEVq8qmBFkj/JuVCN9LaZ2FJ9wsMqXi+SRRBzyvSCiaIn7P
 JFTkQSeLJt7KrcC/4f/fRvhCtBUTJ4OztkOfv2YGDSBzZVyLZqzvbQ6tib3Z58TZGJ2+ThUdHci
 oyP96WTKknq3CTTrACZv5doziX1v0mZUs+Xe3jybtSrOEocmJVCRkm77u3mbxp+LpLH77hZPnIf
 h4GRUmfPh+t6wnMO7AiM3L1a5k4QzT0Ci7SJk5JfzaWnv0g2vvL+a/1zaeDfAaep1vY9zYayY9Z
 Z0HVST/xtbwoWkIzyNReQHC44rAA2zY1aB/4FJxAUt8G11WBDN7kemAMh75M/FM/BF2Jwx4rPgf
 fcVwGbNnM79rzLg==
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
intermediate buffer.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 lib/ref_tracker.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index b6e0a87dd75eddef4d504419c0cf398ea65c19d8..4857bcb6d4bf557a0089f51328e75e8209e959e6 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -8,6 +8,7 @@
 #include <linux/slab.h>
 #include <linux/stacktrace.h>
 #include <linux/stackdepot.h>
+#include <linux/seq_file.h>
 
 #define REF_TRACKER_STACK_ENTRIES 16
 #define STACK_BUF_SIZE 1024
@@ -70,6 +71,7 @@ struct ostream {
 	void __ostream_printf (*func)(struct ostream *stream, char *fmt, ...);
 	char *prefix;
 	char *buf;
+	struct seq_file *seq;
 	int size, used;
 };
 
@@ -93,6 +95,15 @@ static void __ostream_printf pr_ostream_buf(struct ostream *stream, char *fmt, .
 	stream->used += min(ret, len);
 }
 
+static void __ostream_printf pr_ostream_seq(struct ostream *stream, char *fmt, ...)
+{
+	va_list args;
+
+	va_start(args, fmt);
+	seq_vprintf(stream->seq, fmt, args);
+	va_end(args);
+}
+
 #define pr_ostream(stream, fmt, args...) \
 ({ \
 	struct ostream *_s = (stream); \
@@ -302,6 +313,20 @@ EXPORT_SYMBOL_GPL(ref_tracker_free);
 #ifdef CONFIG_DEBUG_FS
 #include <linux/debugfs.h>
 
+static int ref_tracker_dir_seq_print(struct ref_tracker_dir *dir, struct seq_file *seq)
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

