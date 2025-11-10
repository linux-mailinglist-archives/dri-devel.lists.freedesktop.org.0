Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B35C46A3C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 13:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6A910E1A0;
	Mon, 10 Nov 2025 12:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="EmRSiYOs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7518D10E1A0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 12:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1762778347; x=1763383147; i=natalie.vock@gmx.de;
 bh=6Zp0fk+5VsfwCFbMTLrFlvgabQkFxFS8ysOaHHRVWvI=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=EmRSiYOsunIwIxIfnOwCcQFcfAEaz6WMgR9JbLyykv9eE5bYsF+aASkrUX+CyVD7
 JUy7lWJ15RHxT+XdyglocMet0bwaHnBWFMM5xdtcjyAfCcLMSww16lgiDy5t8eUWL
 GMoCBNSyBAZovsdkTAJjry3MjVZWVstX3WfWubwDTrt9I1mMEO4dua4DsybCtMrqr
 raGNf2t+JJpbF8IjR7LttWIxm9XMmTrSMVJSXjTJ6vgX9jbHFezPQbgIefVDdSTtq
 otoGNb0AwrUTAi1eXVCz8kOKNFfhfOwaar/Qz0oG1+i0asaKQkjDyTuoGorkUXp+g
 zTTz19uQ/zHMTyafDw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.42.49.68]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7iCW-1wDznl1mDK-00tbZn; Mon, 10
 Nov 2025 13:39:07 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Date: Mon, 10 Nov 2025 13:37:31 +0100
Subject: [PATCH v3 2/5] cgroup/dmem: Add dmem_cgroup_common_ancestor helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251110-dmemcg-aggressive-protect-v3-2-219ffcfc54e9@gmx.de>
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
X-Provags-ID: V03:K1:ntESNCpV57eVz3kKA13MOspCsWo4PT6lwPkicSzbwbTL2QrwKqV
 X86yc8GGGegTmF6nVQlSru71x0tLN3ThNg4G9iwyicMrQbF60UIrpzdjKjTO4qI/EL1GNRS
 Df8m0ldOi8NonTaibYB9Yilg1m/TebxGAtnRJ8wcdXlReJdDFchVtokEzSjDXcVK74QhEXn
 CAPsSw5tBC/QaZqhzPfqg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gfqbA/4+dJY=;THl9gGzUKTii39fZhher73eLRYY
 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
 ZaVlSQdYCKYYsCFqebNvH1WtD8=
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
index 1a88cd0c9eb00..444b84f4c253a 100644
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
index 314c37c06f81e..fb7502d15cf8a 100644
=2D-- a/kernel/cgroup/dmem.c
+++ b/kernel/cgroup/dmem.c
@@ -703,6 +703,31 @@ bool dmem_cgroup_below_low(struct dmem_cgroup_pool_st=
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
2.51.2

