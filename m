Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F36BDEDFE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 15:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90DA10E7FC;
	Wed, 15 Oct 2025 13:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="QvzMzjo0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C62E10E7FA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 13:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1760536672; x=1761141472; i=natalie.vock@gmx.de;
 bh=jUP3qCgF//ScbF5bFjG0nFq6Kt8z8eeKDh3pZNjxC5o=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QvzMzjo0L0NvJe0ykLHLJe9vLBOAKpM9ARdcn15n3cP20sbMX0GfT7eqD6z2QfGr
 iB8C40+S4tQj5d4UjF79qrV35EAApUM1YsY4w8W1oky/nyXgNBXg57XzvgJOokiX9
 lgjLcLGRgg9e/s8nql+p36fL9dsAaXL5baNjW4zohwAbqMqDQmVW2xeF/Cao7tnUb
 miO8NvDlx7D9zyl0HOaadSvgXDu1DJrvllIatIEK1Trw3XJGWRrMeK8yQGITloA+f
 AowrwvDGwlgYEqXJ+Iy2p9Dx0CcsNexJYk+7bgupvFGZIM4A/INoiR6PkIuoU3/6H
 Pf8ahOQ5pyUKofyGiw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVvPD-1uhIVp1puH-00WaKJ; Wed, 15
 Oct 2025 15:57:52 +0200
From: Natalie Vock <natalie.vock@gmx.de>
Date: Wed, 15 Oct 2025 15:57:29 +0200
Subject: [PATCH v2 2/5] cgroup/dmem: Add dmem_cgroup_common_ancestor helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251015-dmemcg-aggressive-protect-v2-2-36644fb4e37f@gmx.de>
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
X-Provags-ID: V03:K1:DGGDhYKxLzy//RADh2iYfAGbJAGJAw0xtp647w7YBHjnAl4OyyQ
 rkL1Y6mSfLWbLyDPFF/xYUTnM+olKUiTWgvlCACIHLUr4aLi8ZsRNo39Q6UCKWVtR1FjDL8
 1QGhGMwzmFvglH7D9susAj4Kt4WdjcY0t03wj9UTm5+Nbk8UfaqGdWxO0edyhL5rCwZxFFk
 DizUimbz3IEbhcxN4euGg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FFu/mgCGo2U=;PKP3eRqPWQQ+ksrbISHnbPltYyd
 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
 v6Mkg==
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

This helps to find a common subtree of two resources, which is important
when determining whether it's helpful to evict one resource in favor of
another.

Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
=2D--
 include/linux/cgroup_dmem.h |  9 +++++++++
 kernel/cgroup/dmem.c        | 25 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/linux/cgroup_dmem.h b/include/linux/cgroup_dmem.h
index 1a88cd0c9eb00409ddd07d1f06eb63d2e55e8805..444b84f4c253aded9e4e59d051=
e3ac34a851b9d7 100644
=2D-- a/include/linux/cgroup_dmem.h
+++ b/include/linux/cgroup_dmem.h
@@ -28,6 +28,8 @@ bool dmem_cgroup_below_min(struct dmem_cgroup_pool_state=
 *root,
 			   struct dmem_cgroup_pool_state *test);
 bool dmem_cgroup_below_low(struct dmem_cgroup_pool_state *root,
 			   struct dmem_cgroup_pool_state *test);
+struct dmem_cgroup_pool_state *dmem_cgroup_common_ancestor(struct dmem_cg=
roup_pool_state *a,
+							   struct dmem_cgroup_pool_state *b);
=20
 void dmem_cgroup_pool_state_put(struct dmem_cgroup_pool_state *pool);
 #else
@@ -75,6 +77,13 @@ static inline bool dmem_cgroup_below_low(struct dmem_cg=
roup_pool_state *root,
 	return false;
 }
=20
+static inline
+struct dmem_cgroup_pool_state *dmem_cgroup_common_ancestor(struct dmem_cg=
roup_pool_state *a,
+							   struct dmem_cgroup_pool_state *b)
+{
+	return NULL;
+}
+
 static inline void dmem_cgroup_pool_state_put(struct dmem_cgroup_pool_sta=
te *pool)
 { }
=20
diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
index ece23f77f197f1b2da3ee322ff176460801907c6..0914fc8fd97f49d246da0344ab=
edaf9244e8fbad 100644
=2D-- a/kernel/cgroup/dmem.c
+++ b/kernel/cgroup/dmem.c
@@ -689,6 +689,31 @@ bool dmem_cgroup_below_low(struct dmem_cgroup_pool_st=
ate *root,
 }
 EXPORT_SYMBOL_GPL(dmem_cgroup_below_low);
=20
+/**
+ * dmem_cgroup_common_ancestor(): Find the first common ancestor of two p=
ools.
+ * @a: First pool to find the common ancestor of.
+ * @b: First pool to find the common ancestor of.
+ *
+ * Return: The first pool that is a parent of both @a and @b, or NULL if =
either @a or @b are NULL.
+ */
+struct dmem_cgroup_pool_state *dmem_cgroup_common_ancestor(struct dmem_cg=
roup_pool_state *a,
+							   struct dmem_cgroup_pool_state *b)
+{
+	struct dmem_cgroup_pool_state *parent;
+
+	while (a) {
+		parent =3D b;
+		while (parent) {
+			if (a =3D=3D parent)
+				return a;
+			parent =3D pool_parent(parent);
+		}
+		a =3D pool_parent(a);
+	}
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(dmem_cgroup_common_ancestor);
+
 static int dmem_cgroup_region_capacity_show(struct seq_file *sf, void *v)
 {
 	struct dmem_cgroup_region *region;

=2D-=20
2.51.0

