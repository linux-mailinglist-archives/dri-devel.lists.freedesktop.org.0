Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E209FC46A4B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 13:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D44510E389;
	Mon, 10 Nov 2025 12:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="aUpLmjZq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D4B10E389
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 12:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1762778346; x=1763383146; i=natalie.vock@gmx.de;
 bh=1AnOvQwRgHHJrUce3BXsQez5GLrWtvO6FPUiX7F6kd4=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=aUpLmjZqDkW/ia/N6V1nmR09O/ppjrnaW2AMgFa572fG/bwsylDFXFycc2HaEC7p
 HzKYZhxOJ4/ECT3C3Ukdw7sFu2oBU3jolwrht5wDOlqqcR+e/tW2PBjAxwh7RWyF9
 zkLnTVteG97z1UWqZrscrKikmeF2lK+9Zyx68IbQRa0VcuQH8e/cfwmR1wR6jGcju
 t73dcSXDGs7HhuO8wyrPnl8HMfUU9oDcQHOoTcXrBSxYZTje5kZRBJVJVxzib4po+
 C9I1x4zXPklApQoKBQctbxfIs3SfuDsMR4thoiyb6mDEnhqtQguSTCT5IHAwfkzGD
 Ovvz9xH75Pl8U4bG/Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.42.49.68]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9Mta-1wEXV737rQ-00u9Gz; Mon, 10
 Nov 2025 13:39:05 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Date: Mon, 10 Nov 2025 13:37:30 +0100
Subject: [PATCH v3 1/5] cgroup/dmem: Add queries for protection values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251110-dmemcg-aggressive-protect-v3-1-219ffcfc54e9@gmx.de>
References: <20251110-dmemcg-aggressive-protect-v3-0-219ffcfc54e9@gmx.de>
In-Reply-To: <20251110-dmemcg-aggressive-protect-v3-0-219ffcfc54e9@gmx.de>
To: Maarten Lankhorst <dev@lankhorst.se>, 
 Maxime Ripard <mripard@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailer: b4 0.14.3
X-Provags-ID: V03:K1:IF2gmHHUjs3+Fd6kB8UVPmQbglyf9fFc00Y+pt732OqTMwDTAWX
 MWHfYC0cwK7EhD+TXZh9cYtDKcgfzYq5TP1Ss1ESddbIslQI9jMwUjL/ux77UE7WjpRjmv4
 0wg5O42vtKOUk3fdjFm1WFmXmBLwYeupGYtg8XGEDj22sD4gF6nlrPhVPUaeAxKJkfjZW20
 NeFxydrdo7kaNFdTUUOGw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2u2iwBNUWi8=;rBygw/j+eefU79DQ6mPVGpB2qw4
 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
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

Callers can use this feedback to be more aggressive in making space for
allocations of a cgroup if they know it is protected.

These are counterparts to memcg's mem_cgroup_below_{min,low}.

Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
=2D--
 include/linux/cgroup_dmem.h | 16 ++++++++++++
 kernel/cgroup/dmem.c        | 62 ++++++++++++++++++++++++++++++++++++++++=
+++++
 2 files changed, 78 insertions(+)

diff --git a/include/linux/cgroup_dmem.h b/include/linux/cgroup_dmem.h
index dd4869f1d736e..1a88cd0c9eb00 100644
=2D-- a/include/linux/cgroup_dmem.h
+++ b/include/linux/cgroup_dmem.h
@@ -24,6 +24,10 @@ void dmem_cgroup_uncharge(struct dmem_cgroup_pool_state=
 *pool, u64 size);
 bool dmem_cgroup_state_evict_valuable(struct dmem_cgroup_pool_state *limi=
t_pool,
 				      struct dmem_cgroup_pool_state *test_pool,
 				      bool ignore_low, bool *ret_hit_low);
+bool dmem_cgroup_below_min(struct dmem_cgroup_pool_state *root,
+			   struct dmem_cgroup_pool_state *test);
+bool dmem_cgroup_below_low(struct dmem_cgroup_pool_state *root,
+			   struct dmem_cgroup_pool_state *test);
=20
 void dmem_cgroup_pool_state_put(struct dmem_cgroup_pool_state *pool);
 #else
@@ -59,6 +63,18 @@ bool dmem_cgroup_state_evict_valuable(struct dmem_cgrou=
p_pool_state *limit_pool,
 	return true;
 }
=20
+static inline bool dmem_cgroup_below_min(struct dmem_cgroup_pool_state *r=
oot,
+					 struct dmem_cgroup_pool_state *test)
+{
+	return false;
+}
+
+static inline bool dmem_cgroup_below_low(struct dmem_cgroup_pool_state *r=
oot,
+					 struct dmem_cgroup_pool_state *test)
+{
+	return false;
+}
+
 static inline void dmem_cgroup_pool_state_put(struct dmem_cgroup_pool_sta=
te *pool)
 { }
=20
diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
index 10b63433f0573..314c37c06f81e 100644
=2D-- a/kernel/cgroup/dmem.c
+++ b/kernel/cgroup/dmem.c
@@ -641,6 +641,68 @@ int dmem_cgroup_try_charge(struct dmem_cgroup_region =
*region, u64 size,
 }
 EXPORT_SYMBOL_GPL(dmem_cgroup_try_charge);
=20
+/**
+ * dmem_cgroup_below_min() - Tests whether current usage is within min li=
mit.
+ *
+ * @root: Root of the subtree to calculate protection for, or NULL to cal=
culate global protection.
+ * @test: The pool to test the usage/min limit of.
+ *
+ * Return: true if usage is below min and the cgroup is protected, false =
otherwise.
+ */
+bool dmem_cgroup_below_min(struct dmem_cgroup_pool_state *root,
+			   struct dmem_cgroup_pool_state *test)
+{
+	if (root =3D=3D test || !pool_parent(test))
+		return false;
+
+	if (!root) {
+		for (root =3D test; pool_parent(root); root =3D pool_parent(root))
+			{}
+	}
+
+	/*
+	 * In mem_cgroup_below_min(), the memcg pendant, this call is missing.
+	 * mem_cgroup_below_min() gets called during traversal of the cgroup tre=
e, where
+	 * protection is already calculated as part of the traversal. dmem cgrou=
p eviction
+	 * does not traverse the cgroup tree, so we need to recalculate effectiv=
e protection
+	 * here.
+	 */
+	dmem_cgroup_calculate_protection(root, test);
+	return page_counter_read(&test->cnt) <=3D READ_ONCE(test->cnt.emin);
+}
+EXPORT_SYMBOL_GPL(dmem_cgroup_below_min);
+
+/**
+ * dmem_cgroup_below_low() - Tests whether current usage is within low li=
mit.
+ *
+ * @root: Root of the subtree to calculate protection for, or NULL to cal=
culate global protection.
+ * @test: The pool to test the usage/low limit of.
+ *
+ * Return: true if usage is below low and the cgroup is protected, false =
otherwise.
+ */
+bool dmem_cgroup_below_low(struct dmem_cgroup_pool_state *root,
+			   struct dmem_cgroup_pool_state *test)
+{
+	if (root =3D=3D test || !pool_parent(test))
+		return false;
+
+	if (!root) {
+		for (root =3D test; pool_parent(root); root =3D pool_parent(root))
+			{}
+	}
+
+	/*
+	 * In mem_cgroup_below_low(), the memcg pendant, this call is missing.
+	 * mem_cgroup_below_low() gets called during traversal of the cgroup tre=
e, where
+	 * protection is already calculated as part of the traversal. dmem cgrou=
p eviction
+	 * does not traverse the cgroup tree, so we need to recalculate effectiv=
e protection
+	 * here.
+	 */
+	dmem_cgroup_calculate_protection(root, test);
+	return page_counter_read(&test->cnt) <=3D READ_ONCE(test->cnt.elow);
+}
+EXPORT_SYMBOL_GPL(dmem_cgroup_below_low);
+
 static int dmem_cgroup_region_capacity_show(struct seq_file *sf, void *v)
 {
 	struct dmem_cgroup_region *region;

=2D-=20
2.51.2

