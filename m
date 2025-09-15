Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A94EAB57B3A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBA710E483;
	Mon, 15 Sep 2025 12:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="eid3vW5N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9521810E483
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1757939822; x=1758544622; i=natalie.vock@gmx.de;
 bh=jUP3qCgF//ScbF5bFjG0nFq6Kt8z8eeKDh3pZNjxC5o=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=eid3vW5Ni4xTHQ67UiOfeubgNZzRb2AMnDhdG1RkhxtFCGGC7nLOO2BYsr5FV+jj
 8o+VGY/em4nskgWRy0nhFXkQ9lA55nOORHL6k4kZw8uPVxltR/TdwlPhmvXaJ1f+F
 Kp55Lwu7wbEA+5RflyHY9UGcAUfhEFjhwcc++r2FROrCUzSCK2V8cNrCB42yam50Q
 fNZkBXsV6VmnstxhdoiCyzSvw6raPl06u8fmYyEHb4DGPCrHgFYicOCgwYiKRLS+P
 EiDughjDftvIdRrMamXRuF4v4QtQiZ1sbda5o1LLUJHUKZ9kiltwq+wsiaRFcetvH
 u/aPz1PYUNDY/yw73g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfYPi-1uRHfy0yyW-00qCU4; Mon, 15
 Sep 2025 14:37:02 +0200
From: Natalie Vock <natalie.vock@gmx.de>
Date: Mon, 15 Sep 2025 14:36:29 +0200
Subject: [PATCH 2/4] cgroup/dmem: Add dmem_cgroup_common_ancestor helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20250915-dmemcg-aggressive-protect-v1-2-2f3353bfcdac@gmx.de>
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
X-Provags-ID: V03:K1:Ips8OCnYVuvOjDqY9oSsrd7w0MeWkQEnljtBS1IMHFPSvCtzhQC
 txjlyr+W/au9D5tNSRIQOpSjbStLb7W8Lznp1f0qiITrMfK07PsPOdCsKt482wMtXDzUWHo
 t46gDNrIaS28PaftGA2+4PJgtH9hN4BFPkRZoqLOGuGwwsYxMWBC4ijNhz2aLRBZQhyo11R
 64iVYdMl6NTToDF3/nC+A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zIcGdHej02U=;MSuDlUKX2bNoEizTqu3tP+CdIEW
 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
 Ehk2QR2ehy
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

