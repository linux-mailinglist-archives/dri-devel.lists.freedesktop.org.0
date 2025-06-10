Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7AAAD3BF9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC85810E57C;
	Tue, 10 Jun 2025 14:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MCzZIQsO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2726910E305;
 Tue, 10 Jun 2025 14:59:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4492B5C56B4;
 Tue, 10 Jun 2025 14:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F37C4CEF1;
 Tue, 10 Jun 2025 14:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749567585;
 bh=kh/qFeLAyxVm0bBT3X1rDJqrmW5QgjHwPovsCE5exFQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=MCzZIQsOECXqcmrna81KK3quV72mw6stAln0Y2nJrgEnaj9PGw5gYlO4PYQubt4xG
 vZg/mnai10U33TVRRNMTg+FUgcaIoHld0ccXeWnSdqoeNmXn8kglDkfEYOVA3MUEsb
 x//3H+HaR64sDZtP4OukNYHuudz2+HMeDqR6WuKrgVFreS+lFdU352xxFbbDBb12VC
 r4IvTV/8x0PXL7cnCYtBJeqUTRFYGZmpFT7wN/sltEVxppSSg9sF3pibbiIWk6qfWk
 VY751tsYM0PjRWMqtXuVXmOlU2+cj2/5vInNdH9NL6X4VmlAVSZHPAWIGDxt0N0bI4
 4VMOcp9BEArjw==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 10 Jun 2025 10:59:21 -0400
Subject: [PATCH v14 1/9] ref_tracker: don't use %pK in pr_ostream() output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250610-reftrack-dbgfs-v14-1-efb532861428@kernel.org>
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
 Jeff Layton <jlayton@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1888; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=kh/qFeLAyxVm0bBT3X1rDJqrmW5QgjHwPovsCE5exFQ=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoSEhbAWNgWom2fzGCJ+t5Z/GvnJq2l2QaCsQ/P
 tnSV9QgfrSJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaEhIWwAKCRAADmhBGVaC
 Feq6D/4muyMWUff29ZCkmEl2BtTkrkuooi9rJVLs5x8uwJ233hNAgNw3ojWNub7eCfrlw8UWV4u
 9JC+dK1U88vhlVJJ7ZqtNxkm0DqilTArDYXP53Y//gbS1prCpA9wEdK7cIL6yfySWt3jbUeV1z8
 sowuJ53akcqMYe2eR5hv+PwzBxB73xgKRHsoxjW5t4Y7JE/OfijwifJag6p5oaF4lHESSL6ZMyQ
 9bBVyv4xdO48HJFSw30pv5jYFwBpNr9vOxjtA0/8cQRfYqp14auPcwy92GVNn47xBBdCWoCuSnK
 F7LymjvcSUdfHU+KMwJRwx8bSVE6RxyeDJfwxH8bIy0pd/61+1h0NYTtdcnTR5fq3zpixfHxWSu
 tgLCLfnSIay1/9ZcCDMu5hRGg5srMwbZdUNuINjG8Y9RfzllRdMR/cMKYtPXdCWojSFd1BXebNS
 2Ihg9+Mwhcd8NmI2bZ6tKEinlWFDlXlVYA8iu/tGISSRgoDUkQ2S8kgWAwfk8nw/jexfRqk1BPg
 r9YP/NREvCN8Y70Hu0Q6MrhvIG7WlpxkRcrZSUbWrvnG4JMNDPXmJE4t5PFby2yJrRCZuMpOYZf
 stHfx+A4ig+e1iGvj2p6T6Mv16ZwGpwTlTymVscmm89BzjdP/pfvMB82okRjc+DbQTZKLc08p7k
 00Y5nT6khCf66Yg==
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

As Thomas Weißschuh points out [1], it is now preferable to use %p
instead of hashed pointers with printk(), since raw pointers should no
longer be leaked into the kernel log. Change the ref_tracker
infrastructure to use %p instead of %pK in its formats.

[1]: https://lore.kernel.org/netdev/20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de/

Cc: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 lib/ref_tracker.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index cf5609b1ca79361763abe5a3a98484a3ee591ff2..de71439e12a3bab6456910986fa611dfbdd97980 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -96,7 +96,7 @@ __ref_tracker_dir_pr_ostream(struct ref_tracker_dir *dir,
 
 	stats = ref_tracker_get_stats(dir, display_limit);
 	if (IS_ERR(stats)) {
-		pr_ostream(s, "%s@%pK: couldn't get stats, error %pe\n",
+		pr_ostream(s, "%s@%p: couldn't get stats, error %pe\n",
 			   dir->name, dir, stats);
 		return;
 	}
@@ -107,13 +107,13 @@ __ref_tracker_dir_pr_ostream(struct ref_tracker_dir *dir,
 		stack = stats->stacks[i].stack_handle;
 		if (sbuf && !stack_depot_snprint(stack, sbuf, STACK_BUF_SIZE, 4))
 			sbuf[0] = 0;
-		pr_ostream(s, "%s@%pK has %d/%d users at\n%s\n", dir->name, dir,
+		pr_ostream(s, "%s@%p has %d/%d users at\n%s\n", dir->name, dir,
 			   stats->stacks[i].count, stats->total, sbuf);
 		skipped -= stats->stacks[i].count;
 	}
 
 	if (skipped)
-		pr_ostream(s, "%s@%pK skipped reports about %d/%d users.\n",
+		pr_ostream(s, "%s@%p skipped reports about %d/%d users.\n",
 			   dir->name, dir, skipped, stats->total);
 
 	kfree(sbuf);

-- 
2.49.0

