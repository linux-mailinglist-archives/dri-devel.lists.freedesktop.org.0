Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9916AC8010
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 17:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6509410E73F;
	Thu, 29 May 2025 15:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k+4kriia";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E812E10E73E;
 Thu, 29 May 2025 15:21:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 36BCDA4136F;
 Thu, 29 May 2025 15:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 042D8C4CEED;
 Thu, 29 May 2025 15:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748532077;
 bh=qdjjg9250uAChp/B6CMoiJw5KiM08dmL8XUQ0eA5f48=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=k+4kriia5cmMEJj+owHrtkuoy4E3ZU92L00VRXLDQ7OmmZI/T6SM42hIRfI/yhdC6
 a9Q3y6OW8m3YbAkDtHX5ZOdY7kyN+nwQufF7NG1cqQemF6pLGmWZBovwZ2XVwBET0q
 S4d2zMdPy4cewzvuBOZVb3XJnn9XZpaRKES7efBGGhu0kx6WaqdE1dyfl/U5aCiEMQ
 lQ1h5q3xEqSEudwWWg4p4Z0jLRuM8CksQA5Eb5j1eqmNVA9TFg1VqTxZpuh2qRHqWu
 LC/ngAZgWBliFQUfLWcxt1BFsPg+yA4e0wyHUJHz1aeiUr6MAEb3OMYU8yd6zWjYyC
 4jt6e3daYTXAg==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 29 May 2025 11:20:38 -0400
Subject: [PATCH v12 02/10] ref_tracker: don't use %pK in pr_ostream()
 output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250529-reftrack-dbgfs-v12-2-11b93c0c0b6e@kernel.org>
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
 Jeff Layton <jlayton@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1830; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=qdjjg9250uAChp/B6CMoiJw5KiM08dmL8XUQ0eA5f48=;
 b=kA0DAAoBAA5oQRlWghUByyZiAGg4e2WjZLfo3ycQT1CUdenqoxScpkfK+wIitZeFpDeJVdp7j
 4kCMwQAAQoAHRYhBEvA17JEcbKhhOr10wAOaEEZVoIVBQJoOHtlAAoJEAAOaEEZVoIVXYcP/2BT
 YzbsecTgmT6T/S6gDE3X+Ekx44VdY3OuQXC5dJlhRj5CAOfmF3Hiowmmwv0cpVwNBJ+rmTQjDj6
 bSuoFC0kwAun/EyZ13uYl09fQxhtJHIKNCoSOKKQ2u9eELb/E0NAShTGg3+KEkzfXWO9k2YSg2S
 YGA0HiOEqdKbqVqJRYJk8ROsQmH84txczppSDG1km5aJ6NAzTgTfsJIbD3etJ8CHo/DMj9Et5C1
 cMptRHiTexurW4V94FVLda4jHSCzXcnhCujs+ToME6tlDJwNWIbwuigR5XGZTz8lwWxrckWmsqK
 +qEcJZ2dN9rbeQfTOD+mIwhHPivCZ2ra/b4bcAMSfcmbifgUSpzN0VHuQiVtpteyOLp/Z4ybl/F
 682HHvSaRx3nhN1eP2lqTmUTmYlh5dW53wncqgXq/27LrBiPr2lk1E5Xz0FivdgqOJ1flMgqyTW
 0DMePgkfWcuXq5vQkQYqKGicoXJsKtBP78OGam6FOVcr1oc/mc3fnG8lwZn3gwJlxtW7akrkEb6
 bzx41Gi1381nFJ2uT8EeI6c0dtEAVpXtd+9qZ6QTDx8CGGsizfr8zSHOMC/m9LKIUi655bxModO
 23SIhbNgHuDj9t3SbCujV4Gg0ULUPsqySin9yzsswWRrsBLl+V3nxxuWSfFMyVnf8tiQbw7u5AF
 jlx5y
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

