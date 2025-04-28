Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BD2A9F876
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 20:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1540610E6A1;
	Mon, 28 Apr 2025 18:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hV1eg0Uq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1F810E6A1;
 Mon, 28 Apr 2025 18:27:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B72D8614AF;
 Mon, 28 Apr 2025 18:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3793C4CEF0;
 Mon, 28 Apr 2025 18:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745864824;
 bh=qdjjg9250uAChp/B6CMoiJw5KiM08dmL8XUQ0eA5f48=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hV1eg0Uq/DZQX8A0KlSx+gVYNKjrpskt86+XZbdmPc7E83wxD4EUaVvD2mOfRGGNN
 VMqTSA53kRBBPKbR+UqysP4R3IjqW0DqUYvzdjIZBzo7/Xd1b96uWc2iAPcwRN3AF4
 kqnJ3t8qcmESHR0ZuckaeCKN4jOrFo/T/Kba4Cibtm7s9ncBNTjfv+6eypkdFSsu95
 OdQXwygkOy6w+hzJ5M4IlNjhM/sRBHgPBcK6w6kVjSpMz9shrYaPZVSreEL+qyLsUO
 rELZ1Uz8+HHE0L4X5RQ1SeE2lPLMQ4dWKq9khflInEAL7cXT9eY0oQYs3sB/J6exUI
 B3xEQlihqY9RA==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 28 Apr 2025 11:26:24 -0700
Subject: [PATCH v5 01/10] ref_tracker: don't use %pK in pr_ostream() output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250428-reftrack-dbgfs-v5-1-1cbbdf2038bd@kernel.org>
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
 Jeff Layton <jlayton@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1830; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=qdjjg9250uAChp/B6CMoiJw5KiM08dmL8XUQ0eA5f48=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBoD8h02NwYy4QXxJrP67+BDY0VaVkg4r1pRn5qS
 ThHlMbXUlmJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaA/IdAAKCRAADmhBGVaC
 FWLKD/9kwVxWvoaZkkWJH23eYL0p1SJDJCllNlPCiwOjfKYfWGGVvcN0dCzywhl8diyAwhsgEt4
 81UPbDdDwoMKs+shn2AoycZZqRrXAFqqi2MpuX6orpIsoKXJzHe0p+ABKW7eJ9wKVPqsiMUCxCD
 /zL/x6SZTgtGokEdHsec9vkmhRmbRFtHKb0FSZXMbjVkg7xgH6SWi6KVZxl0ewhbsjKd/uHx2Eq
 r4IhWfVcHtTS4pSXLDQB/kHRo26twmEVDHw5B86+bBjF9M8fr2fiLvgxAmp4em6OoeUsxFPaqSo
 6wMUeiY7ArzcUHiLc04LYIP4BdFi7v17GdW21Wd9I/Q7/Pn3Ha5nd3DXDip4zK68lM4A6Vd6OA5
 VNOinpxLz6BcuYQsKV5n5ewHoFoiDCTspmeOLTYI5Pq8aTVZzvgF4l7JzSYedQ6TxWP0q4nephy
 56jlt9AFPFkrNS+81MODB1rjFhuZTj+QK3Lb+RbgDDq6D2e6DGEAcUdtHgMFQwQ8RLDRbRcnvcC
 NA/VtukaNKktRpEZK+iVvZEEW9JLzEMvA1X4WVZQ1D+I9Q2o40CPXb2uTa862pGx0w9VUsBvtOj
 Skk92/jT1GfDAfRZGr+9uHN2gg4mJFxSBBBgWPpLlTcTHI00YCeQfkd2TG9tSZrypSYrDQkEewy
 WSZ6/w+jw7nmTeA==
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

