Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 852A7AC4D80
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 13:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F5310E496;
	Tue, 27 May 2025 11:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sJGp7pNH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2298410E493;
 Tue, 27 May 2025 11:33:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 01543A4F5DA;
 Tue, 27 May 2025 11:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC73C4CEEF;
 Tue, 27 May 2025 11:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748345627;
 bh=qdjjg9250uAChp/B6CMoiJw5KiM08dmL8XUQ0eA5f48=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=sJGp7pNHltxVZJrIrLSWMKqjmls9N/01A6ZLQ4xG3VOvHwNwnkP9846G3joZviuE+
 dXeBoCLs5HFHmiLk0IwmnYQUsf8EFNjUp5LnFWCuInCJiYiwPFFnlUHy5ntB2S8s7R
 oH6fezvpiA0SYZi2PutYbDuDaDktNnP25qiFtb96xmfFcIlKyuWlamGgaDWDdcVsPw
 XeYFK7XuR5iLiJr8mkRzFnDgJBowYxjfmTvlIObeUjLf+03GK8eu9wAYbJ8sU8PQjP
 Geypkkp63ipaR1f9erryZ8820Kc8Mgxtbn78+i4jixs5HSiTXmnBb/HKG0KjZa673O
 bnkzV/ZIxSmHA==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 27 May 2025 07:33:32 -0400
Subject: [PATCH v10 1/9] ref_tracker: don't use %pK in pr_ostream() output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250527-reftrack-dbgfs-v10-1-dc55f7705691@kernel.org>
References: <20250527-reftrack-dbgfs-v10-0-dc55f7705691@kernel.org>
In-Reply-To: <20250527-reftrack-dbgfs-v10-0-dc55f7705691@kernel.org>
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
 Jeff Layton <jlayton@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1830; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=qdjjg9250uAChp/B6CMoiJw5KiM08dmL8XUQ0eA5f48=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoNaMVLLmOw5jYchzscMUBCMn0FsTgbe1z058el
 H3LknpBXP6JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDWjFQAKCRAADmhBGVaC
 FcOPD/9GCxhSpKUuKWaezGXmTA8DD9sEdh3YsDqfnuRcy9ox5eoy1bGWuCnTtSPuZsCeZ0rNB0E
 +7h/WTCiWi+aAhFWVJ/DLeirpyiD8IMbHL0d+JMmN8on4jZW2ASjgnDv/bPg5wjqAgw+mKx1yVw
 kZFuuebO+ndXxIfRVR1+V+dkxYxJOUy57Pn7OjLJUCwBrdrUTKi+Q8MEqnhv0z9Roosj7PYEpKD
 XCi0hxLnO/8MzqeOE4omgr/xKtcy3QcpEmYdy6pewuk4g613+vt7GmdjF52ZpxO7WTvWr2K5mLA
 0om3Rp9PcuiCY7Ll4Vttw9tQrW5ImLwXyqm/+QmjFBJwupg5TdvJm3amHuq5Ba0GfMnvFojaSjE
 CXw/icDSUYHRv/GpfAYMrcoeAptEx+RtXYlnNpvlD891XlSfAVN6lJvXMqMj2SVXdRvGYsAsGYD
 N39FSGlAiCOIkqGW7gF5WaVSwyVwjyv1ZxQTaSxSmG+IJxANBI85VsfuDmEDY07pwna2KxT5OTo
 7pmdbQLi9qksrmUovLVLoTv6MyVS1nkfEetjUKf5US5iZp4IfMw01QxCjFyTgq/Owi5Jr3BArtp
 pA8HnxZxZeVyAsJHdUt7eWo2PEl0Cpcmm4WnRggEu6sLtrHCGiDDaqnBaC7fWGvA5aScehbRViv
 z5CRMeYr3WeEBqw==
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

