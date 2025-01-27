Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E3BA1D97A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 16:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBFF10E235;
	Mon, 27 Jan 2025 15:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="VARvKiDY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566E910E235
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1737991700; x=1738596500; i=friedrich.vock@gmx.de;
 bh=TzPH4ovaxc9qTpfB8UM+66tNcMc/P/lnSHL60qKVJ20=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=VARvKiDYoCBXLoa0dGF8c2KiU+Z0Rh+oZyD3dAzX8C1CHkcWeBBIoLOyDS5iNmOj
 ORawefcyRWabOsh/8O6iSqmxUAbzse4tBVqwF3OoCrQU9GTapFozNyf89hKQDdqNf
 dEARxxVu1NFyWEvHZas2c8OULpUDn63thUUZJ53vwsTmp0llH8n1nsancdCRfsJP2
 xOrBpRxOPeRGv7nYCkWRaWLddne6RhhF54ct34GsKmc7bucFW86xiI/WrllngMcLR
 vXi02HML8Ldv9XwxMROi5nDdT7risjPvju/LhxVO37/lZeTeNVcBB+d7YuMbgmfYd
 GC7A8krqGKP215wFzw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from sus.localdomain ([77.189.124.63]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mi2Jn-1syRZy3irZ-00iqJh; Mon, 27
 Jan 2025 16:28:20 +0100
From: Friedrich Vock <friedrich.vock@gmx.de>
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, cgroups@vger.kernel.org,
 Friedrich Vock <friedrich.vock@gmx.de>
Subject: [PATCH v2] cgroup/dmem: Don't open-code css_for_each_descendant_pre
Date: Mon, 27 Jan 2025 16:27:52 +0100
Message-ID: <20250127152754.21325-1-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250114153912.278909-1-friedrich.vock@gmx.de>
References: <20250114153912.278909-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RFTGqWPVc9LoOnIayNDsIZ6ZlDppbE/XemhrfxA3yZtQZEK/2by
 8jQOROFf6K+qrNpPewNcigDP1ikqbE5x3Kk6ElqmZxxERft02rbgTDHqWMjGR44u5ECvmvN
 ioNu5l8LmNrqu1WK8qJMhVFdUHHl+Cp0HKu3U3AP552o+24Qe0fXaZ8E8vG5mMAMmEpVAuT
 7NRG68Ns4WsDmTtoYx3Jg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FcoEPnHkvPQ=;bYs2v/oRTkx94GNO1UIdS1GzeUb
 lkzm+ocnRfxLdY/vlX0o4Y9ZY3EajViVCYqgfMFUQHwfRMMj2/KyQfXRzUVJJpsdSa4I52dQm
 S88Ii0HZ8EsFryliqPugQN/Yx+9ksPmBAYoOWT6+r+6EzBeeOtdMruE8rOQTYmXwo6fF5xTtb
 UTLwpr4qYQH5k0gmq+lQKeCEZv/hlm0qyGifXcQ7o/gZiY71VBef7lX26uAE4WmMeH6knNcNA
 Pe8TjJVWdPm2kCUiqUxrzkVWhQrtaZ8f132R5LpRPj2N/QJkKoWHgFHyHm+wQEtr0bYtIs+uO
 DvvpNYHwodR11Gj77rr6tL6zn30wteI57n3yMOn6pbhooVKLDtt1p0EwTTEKvIgMF8VrFr/cV
 Lpkan62ghbgLYLZBNXlrI8uzEYX4DwPFTE0IrSREh3u5J6SVTcg/j0ru2rxdjceV6P+AVGXWE
 0tOK/2VE1PZ+zjVFT0q4TLXDISIqorp8xQNNAwWaI6MfmPYdwsFLGKoWH709njMwdp3xMHHIE
 K/DC8yknEXQdSpYCLsrV6V+iKhYsd6GswuVaWg9/oR1PEV/9Sj4bacb1PzBExos6DwsOQmMi1
 50E4kajL9YIXw8qGueCDGVyOB9wCLUeh+pUMuHXqqTGdO7SBwPjby7AZB0H3saA/9lrVMAAsx
 JiwXkXda7sw3tf3nLlwqnb8B9ZNHHXAdXOdLT0LuLUgI16nNIKa9W0pF5Pvz7XAGfAzU/6GI0
 SBb+1qgdwJSP781WEfXpOB1GexK1pmFFv0YxQaUUvkU0qJQbb6E4tksmfMn/nVJuH7R0Xsb2K
 a1iVzkf5eUXsCr1arJRfvxqS8uPyX1bwA4H/zcJFb212bf9CPoKwyA5jdi7Qby6gBwh9qaoXW
 xpDDC/neHI7uffXr72rqI5PjBzrVLbouQ9hGsBpffw1SlSj/nlU5U/B+229YM+NSyNEdbW7Xb
 egF049qyy/98vjNbecgmCCDQ8+i9PkgT94GVHDiSJACzJeV5atqkDeBRhzKWr3Xjn0A2D1Nhv
 iHkNng0YbizpJXIWxN96lC+uEmWSF6tviyRZVr2O0TcOi1upHGSH2jSR4ukqWlBImvsDjJe9j
 549VfyQGilxkI4kEOVa2iQ4jq5Jofppe81+aAC0c+kJhc2Elmky0ZIZ3BMXiYbsSgaXn3WyPT
 nm+gY3ga6H/ytZsXV2zhFVVt1pfPrFYv4xo4w3FtL7g==
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

The current implementation has a bug: If the current css doesn't
contain any pool that is a descendant of the "pool" (i.e. when
found_descendant =3D=3D false), then "pool" will point to some unrelated
pool. If the current css has a child, we'll overwrite parent_pool with
this unrelated pool on the next iteration.

Since we can just check whether a pool refers to the same region to
determine whether or not it's related, all the additional pool tracking
is unnecessary, so just switch to using css_for_each_descendant_pre for
traversal.

Fixes: b168ed458 ("kernel/cgroup: Add "dmem" memory accounting cgroup")
Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--

v2 (Michal): Switch to the more idiomatic css_for_each_descendant_pre
instead of fixing the open-coded version

=2D--
 kernel/cgroup/dmem.c | 50 ++++++++++----------------------------------
 1 file changed, 11 insertions(+), 39 deletions(-)

diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
index 52736ef0ccf2..77d9bb1c147f 100644
=2D-- a/kernel/cgroup/dmem.c
+++ b/kernel/cgroup/dmem.c
@@ -220,60 +220,32 @@ dmem_cgroup_calculate_protection(struct dmem_cgroup_=
pool_state *limit_pool,
 				 struct dmem_cgroup_pool_state *test_pool)
 {
 	struct page_counter *climit;
-	struct cgroup_subsys_state *css, *next_css;
+	struct cgroup_subsys_state *css;
 	struct dmemcg_state *dmemcg_iter;
-	struct dmem_cgroup_pool_state *pool, *parent_pool;
-	bool found_descendant;
+	struct dmem_cgroup_pool_state *pool, *found_pool;

 	climit =3D &limit_pool->cnt;

 	rcu_read_lock();
-	parent_pool =3D pool =3D limit_pool;
-	css =3D &limit_pool->cs->css;

-	/*
-	 * This logic is roughly equivalent to css_foreach_descendant_pre,
-	 * except we also track the parent pool to find out which pool we need
-	 * to calculate protection values for.
-	 *
-	 * We can stop the traversal once we find test_pool among the
-	 * descendants since we don't really care about any others.
-	 */
-	while (pool !=3D test_pool) {
-		next_css =3D css_next_child(NULL, css);
-		if (next_css) {
-			parent_pool =3D pool;
-		} else {
-			while (css !=3D &limit_pool->cs->css) {
-				next_css =3D css_next_child(css, css->parent);
-				if (next_css)
-					break;
-				css =3D css->parent;
-				parent_pool =3D pool_parent(parent_pool);
-			}
-			/*
-			 * We can only hit this when test_pool is not a
-			 * descendant of limit_pool.
-			 */
-			if (WARN_ON_ONCE(css =3D=3D &limit_pool->cs->css))
-				break;
-		}
-		css =3D next_css;
-
-		found_descendant =3D false;
+	css_for_each_descendant_pre(css, &limit_pool->cs->css) {
 		dmemcg_iter =3D container_of(css, struct dmemcg_state, css);
+		found_pool =3D NULL;

 		list_for_each_entry_rcu(pool, &dmemcg_iter->pools, css_node) {
-			if (pool_parent(pool) =3D=3D parent_pool) {
-				found_descendant =3D true;
+			if (pool->region =3D=3D limit_pool->region) {
+				found_pool =3D pool;
 				break;
 			}
 		}
-		if (!found_descendant)
+		if (!found_pool)
 			continue;

 		page_counter_calculate_protection(
-			climit, &pool->cnt, true);
+			climit, &found_pool->cnt, true);
+
+		if (found_pool =3D=3D test_pool)
+			break;
 	}
 	rcu_read_unlock();
 }
=2D-
2.48.0

