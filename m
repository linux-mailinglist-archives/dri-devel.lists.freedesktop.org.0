Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 478B1B57B36
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A111410E48F;
	Mon, 15 Sep 2025 12:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="n47/oxm/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1333D10E483
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1757939821; x=1758544621; i=natalie.vock@gmx.de;
 bh=8ee9aeFGO7Ecar5112J8Y7NqevKLfXwHmxfmTmH+umE=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=n47/oxm/wqCAbiI4tYeBMPzmMBx2sQ18tlu9lQQfpDX1u61o7JAmdkKgD12eDojW
 c9nbUkuUf42vaxldecVva+r9YG/OtQW2fjaVNgKYSbkzwT9wDlYmQlZFr3UtBbvs3
 JRO1afN0L3Ax55JZ4zJxTQD33LxL8K9mA8sGELXB5ejFmIIkc8QbgPLdg/nfpoRdQ
 CPVi3Vj/hsSdnFkS4ooJteJRWtvLnRE36ReOH2V6LKKM6cHncn0/5wz9zLFEO4aWq
 3xtwwZETEKdJJvSPSrCiqpmbfQ8XKIyus6NVMirTPZPGOKdb7tsloTL3lFxXQGdFT
 Sc1rLJBy5F4y2+PPVg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhlKs-1uTUbN14pk-00o0ci; Mon, 15
 Sep 2025 14:37:01 +0200
From: Natalie Vock <natalie.vock@gmx.de>
Date: Mon, 15 Sep 2025 14:36:28 +0200
Subject: [PATCH 1/4] cgroup/dmem: Add queries for protection values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20250915-dmemcg-aggressive-protect-v1-1-2f3353bfcdac@gmx.de>
References: <20250915-dmemcg-aggressive-protect-v1-0-2f3353bfcdac@gmx.de>
In-Reply-To: <20250915-dmemcg-aggressive-protect-v1-0-2f3353bfcdac@gmx.de>
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
X-Provags-ID: V03:K1:sXEi/hhZ3IGwSvr7XMCTQGsIU1fQ//ZrbyjEqV4gxHVEaRJXAaq
 lGQ2DE4tSBUyfON6yYt43X2oiuaFcvTH45RomkITiPRM/HO7GFWAspuWwbqoiN4zPq9gNWq
 X1b+fdSKWC/qWhaF2SEPd3d+aK7BTX3bRWC4Xf1oqBp+SnrV55IKbdbQhzDKMzewKqfLLhZ
 GTaXJ/4583/ef5M85otNA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A1JDGR/Q3p4=;yX8xcFl5+0nle8lzdvYPL9cvMTi
 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
 +Zf1JKycIT
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

