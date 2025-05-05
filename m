Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C26EFAA9AAB
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 19:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D90810E421;
	Mon,  5 May 2025 17:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gjo+YBTX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9CE10E41C;
 Mon,  5 May 2025 17:33:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D9A3361F1D;
 Mon,  5 May 2025 17:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A762C4CEF3;
 Mon,  5 May 2025 17:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746466419;
 bh=r/J3RdlUauCReBYN9Ih2mzIpJXEGqxCGvwWWjZoKeqk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gjo+YBTXB84vOFLAkUrBiyXaSsrHZS0QSR6oEWPPFUAUNUMamMrLqYlRlz3eCO3Ft
 0TGGIgz/Y0kzmRpf80J6psPlR03twFKJyeI+lIgmmJXONTta8jb13tQLsdXSPlw/s/
 Kw6DkV1mz43Bf37Sl+DnL3gRND63p/Yh9j6cPs4RRE4FfXSysgrYLmLne8wLEjR6kU
 PIGyz5oNaKIAOemTAFcJvFjEAf2+k5PhaN1/PzOUS1Q4wqu+R083R89RrVmfEzLU2N
 9OeBO+dPle1rsC74un4THGsy8iTH3H1ocVUNGIupmPEa12jL54dSTrRGFsCTtl9jsJ
 Uv6G50QaBSIAA==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 05 May 2025 13:33:19 -0400
Subject: [PATCH v7 05/10] ref_tracker: allow pr_ostream() to print directly
 to a seq_file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-reftrack-dbgfs-v7-5-f78c5d97bcca@kernel.org>
References: <20250505-reftrack-dbgfs-v7-0-f78c5d97bcca@kernel.org>
In-Reply-To: <20250505-reftrack-dbgfs-v7-0-f78c5d97bcca@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=r/J3RdlUauCReBYN9Ih2mzIpJXEGqxCGvwWWjZoKeqk=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBoGPZmBMxDi92UA5xN5em0PLOVIKyTrTTexMeu3
 KnpbRZmkAyJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaBj2ZgAKCRAADmhBGVaC
 FT+2EACPjfPrd0tmfH+Grv9GPGYsSDt4TWGdYbwjP5WoMFyIOfeTCmfXXotjIO9Eb/EtKECs9Fw
 Ujy7O8kQObVrafjS/bXpU4IBtclI/dXll+3Ng9tEhwfnvlpQ37E3hKvJRHzjzgHo6gKbui0TWar
 mLKiyp5AGWAA+zuhZJqz3IKumld2gJDCaVAftxaj/GAxkkIKHbNxlOkuIGCeAQgRxlt/L8/Gqne
 ooNh2AZExF5YL8I/ZdiwepglfopcQVfI4ROv20lHwAZsXmCrV3avb36Gj7us9B5ZeUcyEYgaMcR
 v6sVgZiBpUjvUs9NAYhZQMhJGd5CYKw2HWpkE7vIqlMu5RvIHnkJtJWoy9IygxJg1sd8HAVa8Kf
 9J4/Br9gmsRjyZzzktTtfYJPlQbftb+apoV6sqqc01qujFrCLt97mtwfmwaXNHCG6/royV+9CRv
 CEurW4zJ9zW/lDodaLSaStBZuFI5YcAT9ALOWCs6zwNxrlSdW2+VdxkKcM8ahmBlfxFQVAQdHrW
 DOlfMykmgRLmFj9shw0qV7R4Nra90ScVvy2KmKqQkwkSLrdgUA1dUe9hiwidLq8UME7snzARkC7
 +iAqNxq5ennpR2EUbrFSxg/8JA17D1H9QEAzH8xDuiGzmhU8ZqqidztDWDB0YeTvw7lwnJ9IS0u
 WUMtRvm1QDOp3Gw==
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
index 510d927c785576fd90292d325d20a465d5f38079..66a765cdfc471968fd6434dafc5b654962f20667 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -8,6 +8,7 @@
 #include <linux/slab.h>
 #include <linux/stacktrace.h>
 #include <linux/stackdepot.h>
+#include <linux/seq_file.h>
 
 #define REF_TRACKER_STACK_ENTRIES 16
 #define STACK_BUF_SIZE 1024
@@ -68,6 +69,7 @@ struct ostream {
 	void __ostream_printf (*func)(struct ostream *stream, char *fmt, ...);
 	char *prefix;
 	char *buf;
+	struct seq_file *seq;
 	int size, used;
 };
 
@@ -91,6 +93,15 @@ static void __ostream_printf pr_ostream_buf(struct ostream *stream, char *fmt, .
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
@@ -300,6 +311,21 @@ EXPORT_SYMBOL_GPL(ref_tracker_free);
 #ifdef CONFIG_DEBUG_FS
 #include <linux/debugfs.h>
 
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

