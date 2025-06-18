Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1038ADEF25
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEC510E860;
	Wed, 18 Jun 2025 14:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SeYHhd8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EB510E012;
 Wed, 18 Jun 2025 14:24:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 758E66113B;
 Wed, 18 Jun 2025 14:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2C1C4CEEE;
 Wed, 18 Jun 2025 14:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750256670;
 bh=kh/qFeLAyxVm0bBT3X1rDJqrmW5QgjHwPovsCE5exFQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SeYHhd8K/hFco9+lYRcTpt66O9BjObgzowNlvoj3KmtmFvujg3XruhKOmfVPihmgP
 jctolrK2B14PRoyYqqfOhNIblA7iCyKNSzHY1CmtNsb3sXfYw14FUw4GVitkmwulgx
 YX0h0DWAL9t1t3JRxc6Any2guq1okolisdG+4dKJZpy1Flm1culXK6LhdHpkw7yvpR
 K5oS9NV9IFg2vs5vrtrk3itWYyDkiWDrdcFT9Tw1HuniGjcA6l2xLn/Fq4QLqazlYL
 IQ+W5WcUfdxhSJUodTAqDrlKfSeSd3G7QMjgBp+WB2WEy0ywARW84jXOz8q/gAJ9BL
 15M2uUOycS9xw==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 18 Jun 2025 10:24:14 -0400
Subject: [PATCH v15 1/9] ref_tracker: don't use %pK in pr_ostream() output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250618-reftrack-dbgfs-v15-1-24fc37ead144@kernel.org>
References: <20250618-reftrack-dbgfs-v15-0-24fc37ead144@kernel.org>
In-Reply-To: <20250618-reftrack-dbgfs-v15-0-24fc37ead144@kernel.org>
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
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoUswYN2rs6NDHd9438ugrW4Z7qYomJgPSuFUi1
 3zE//5ATvWJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaFLMGAAKCRAADmhBGVaC
 Fd4+D/9d5Vtsrf3RTCVGKQEKvSsjosEMkf3NkCqT/wXPr5ws2ZGBx5dj1E5YIDRWLc72sVxMJz7
 NmCCZusRTkT3ZmqUsEvNZ5asQPAku5xsTY5cAzpfof5upiz04SiCoFs8Xms9RNBMbHJXCE3vivy
 3IeDmLIcgLTXbzF+fQ2eF4iIz+wWd7NfOIHjpEgnpFDUm3u0a6C1Uh3PpjRbYf75hWn4joCerzV
 7SfhZbYL4fz9BMjy5RNxeqdb62f5nkCRQv8myG2FtO2DtARwby4LXVfV6bLPztE2PR6bfPPOBO7
 cyGwtI1plMKnulaKyPkg5bdXIkMZ+tQ3dfT4bnTDq+z4D6cFwbFjeRbGOKDe3EktgpiLjnA3Rso
 Pzn8wtGCBUXBbTN/yRvGOyZ1/e+QZ241mzBjCRuwIjcqyyywRB1pB/roczuEMSO4EwOQ1fa/alK
 NawKSJrqZqJgTH7ReYZYCyv24Z/ijM56/PX5hxlpEuxSFSW0j1wWwWUAfzK+pWAgHmYRdwCC0c1
 Qnc5IoFPIK4GHGXd2X/7b8Q3TfYS3UXUmWroKwHgAmsmrUSAUNLOXhJLU2YRz8hQwmq1imlHWnL
 SaAgskaZdW+dsvfA9lqzHfZNnoeVWxmNS+d4obEabATkKvu2rKY3QNXY+WnebI9o1N7vMLwaGY8
 v6YzS+9/u1VRHrQ==
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

