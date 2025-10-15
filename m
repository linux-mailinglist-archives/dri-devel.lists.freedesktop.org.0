Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC937BDEE5C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 16:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5A410E804;
	Wed, 15 Oct 2025 14:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="etPkvPo0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 319 seconds by postgrey-1.36 at gabe;
 Wed, 15 Oct 2025 14:03:27 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1B510E804
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 14:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1760537005; x=1761141805; i=natalie.vock@gmx.de;
 bh=8ee9aeFGO7Ecar5112J8Y7NqevKLfXwHmxfmTmH+umE=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=etPkvPo0Qg+SM+iPvUd7qhaf9ILaxd10kV3YyFXlIt8M6XB1OpeMtZUFOJafi9rF
 IKzfskMj3seH0roymmApF/SPRl3qp1x2dL7JKVJ+95c3jPxCKyCtOo2r2il7Db5Sf
 JiNZ+oreyWIcqB6HSxzi/GBjwP3qunP6uyi8h10NXGg5PDOYHWhP6HiCqV+vi5iPX
 WNamJE2nycKE8BxYMw3W3UfjnmlHeUmL0HXhHbFLbuwkry/XKXevdwgRsuaXjKwPe
 /UgjtvDf8GFVY+3/uyz77+9ydz9rTlwDckSS5lnp9t8Fhrhm4RlRGkIr8AG8pEUFH
 rih3Cnoqg2g9oCz5Og==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmlT2-1uPDg122Vi-00nqMS; Wed, 15
 Oct 2025 15:57:51 +0200
From: Natalie Vock <natalie.vock@gmx.de>
Date: Wed, 15 Oct 2025 15:57:28 +0200
Subject: [PATCH v2 1/5] cgroup/dmem: Add queries for protection values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251015-dmemcg-aggressive-protect-v2-1-36644fb4e37f@gmx.de>
References: <20251015-dmemcg-aggressive-protect-v2-0-36644fb4e37f@gmx.de>
In-Reply-To: <20251015-dmemcg-aggressive-protect-v2-0-36644fb4e37f@gmx.de>
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
X-Mailer: b4 0.14.2
X-Provags-ID: V03:K1:aHKk0CaAbbQIwBRXw+cNuUaWCKK7YJ1AJ9ekJlEvdsXFxu5wotI
 HHnPou6A6D2OC5WRm79Z2/jVUm4TlIZvQ8SQoOAkEUGARsfHpuC1hMqnqlwghpLfMUXhitY
 /7cUles02jmfIqwIs+Rrb3F5zsW3bfzSpAk5Ndo1iRu1y+lJpNGLyMDPaSCmeNwcnm9neaw
 QY1CF8W68/V9fNFDLzmGw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Q8/jj92xL7o=;WZeWEohQ6h3TIWzMeFiGMBnkB0K
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
 include/linux/cgroup_dmem.h | 16 +++++++++++++++
 kernel/cgroup/dmem.c        | 48 ++++++++++++++++++++++++++++++++++++++++=
+++++
 2 files changed, 64 insertions(+)

diff --git a/include/linux/cgroup_dmem.h b/include/linux/cgroup_dmem.h
index dd4869f1d736e26847578e81377e40504bbba90f..1a88cd0c9eb00409ddd07d1f06=
eb63d2e55e8805 100644
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
index 10b63433f05737cc43a87029f2306147283a77ff..ece23f77f197f1b2da3ee322ff=
176460801907c6 100644
=2D-- a/kernel/cgroup/dmem.c
+++ b/kernel/cgroup/dmem.c
@@ -641,6 +641,54 @@ int dmem_cgroup_try_charge(struct dmem_cgroup_region =
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
+	dmem_cgroup_calculate_protection(root, test);
+	return page_counter_read(&test->cnt) <=3D READ_ONCE(test->cnt.elow);
+}
+EXPORT_SYMBOL_GPL(dmem_cgroup_below_low);
+
 static int dmem_cgroup_region_capacity_show(struct seq_file *sf, void *v)
 {
 	struct dmem_cgroup_region *region;

=2D-=20
2.51.0

