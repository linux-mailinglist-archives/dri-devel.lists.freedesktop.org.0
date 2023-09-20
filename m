Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A8E7A729F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 08:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFB710E42D;
	Wed, 20 Sep 2023 06:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1388E10E42D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 06:12:10 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Rr7V14hLXzDqXw;
 Wed, 20 Sep 2023 06:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1695190329; bh=fUAP3DnfFB5U+52Bq5MafLAeg1adG6y6vZPwxErgpnE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mxVnSagskHPKGda5g+dzvx0XWWSTwd6KsrXa98MqQTX9LOanbiyDIwORS147uhHbz
 G8Za8Fjqkier2oLBbKmouRLrH0p4mhPucBGWjrd9bV0hQJCqsc3458NAwrNfNspT+u
 5abRqFObzentGQudSo2PeuLDUx5M5cz0n4jATrd4=
X-Riseup-User-ID: 9CDC494F409216343264C4271203D1F47C7D971762D24FC87C32E712B32E6123
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Rr7Tx5vTyzJq7x;
 Wed, 20 Sep 2023 06:12:05 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Wed, 20 Sep 2023 03:11:37 -0300
Subject: [PATCH 2/3] kunit: Add kunit_move_action_to_top_or_reset() to
 reorder actions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230920-kunit-kasan-fixes-v1-2-1a0fc261832d@riseup.net>
References: <20230920-kunit-kasan-fixes-v1-0-1a0fc261832d@riseup.net>
In-Reply-To: <20230920-kunit-kasan-fixes-v1-0-1a0fc261832d@riseup.net>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>
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
Cc: tales.aparecida@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mairacanal@riseup.net, andrealmeid@riseup.net,
 Arthur Grillo <arthurgrillo@riseup.net>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Kunit, if we allocate a resource A and B on this order, with its
deferred actions to free them. The resource stack would be something
like this:

	 +---------+
	 | free(B) |
	 +---------+
	 |   ...   |
	 +---------+
	 | free(A) |
	 +---------+

If the deferred action of A accesses B, this would cause a
use-after-free bug. To solve that, we need a way to change the order
of actions.

Create a function to move an action to the top of the resource stack,
as shown in the diagram below.

	 +---------+    +---------+
	 | free(B) |	| free(A) |
	 +---------+    +---------+
	 |   ...   | -> | free(B) |
	 +---------+ 	+---------+
	 | free(A) |	|   ...   |
	 +---------+	+---------+

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 include/kunit/resource.h | 17 +++++++++++++++++
 lib/kunit/resource.c     | 19 +++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/kunit/resource.h b/include/kunit/resource.h
index c7383e90f5c9..c598b23680e3 100644
--- a/include/kunit/resource.h
+++ b/include/kunit/resource.h
@@ -479,4 +479,21 @@ void kunit_remove_action(struct kunit *test,
 void kunit_release_action(struct kunit *test,
 			  kunit_action_t *action,
 			  void *ctx);
+
+/**
+ * kunit_move_action_to_top_or_reset - Move a previously added action to the top
+ *				       of the order of actions calls.
+ * @test: Test case to associate the action with.
+ * @action: The function to run on test exit
+ * @ctx: Data passed into @func
+ *
+ * Reorder the action stack, by moving the desired action to the top.
+ *
+ * Returns:
+ *   0 on success, an error if the action could not be inserted on the top.
+ */
+int kunit_move_action_to_top_or_reset(struct kunit *test,
+				      kunit_action_t *action,
+				      void *ctx);
+
 #endif /* _KUNIT_RESOURCE_H */
diff --git a/lib/kunit/resource.c b/lib/kunit/resource.c
index f0209252b179..fe40a34b62a6 100644
--- a/lib/kunit/resource.c
+++ b/lib/kunit/resource.c
@@ -176,3 +176,22 @@ void kunit_release_action(struct kunit *test,
 	}
 }
 EXPORT_SYMBOL_GPL(kunit_release_action);
+
+int kunit_move_action_to_top_or_reset(struct kunit *test,
+				      kunit_action_t *action,
+				      void *ctx)
+{
+	struct kunit_action_ctx match_ctx;
+	struct kunit_resource *res;
+
+	match_ctx.func = action;
+	match_ctx.ctx = ctx;
+	res = kunit_find_resource(test, __kunit_action_match, &match_ctx);
+	if (res) {
+		kunit_remove_action(test, action, ctx);
+		return kunit_add_action_or_reset(test, action, ctx);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kunit_move_action_to_top_or_reset);

-- 
2.41.0

