Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMYWC52EpWkeDAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:37:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CFA1D8BA9
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD2810E4BF;
	Mon,  2 Mar 2026 12:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="rVTU82Pv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDB510E4BF
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772455055; x=1773059855; i=natalie.vock@gmx.de;
 bh=x+hJH5h1bnUkEDDaj5s+u7pUQQPQWyy5qjrP759b5FU=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=rVTU82PvRsxXOyVRF5f7aPF6zb9BT1eliEgZQKd15BhywD0YXPKvlxzfOgTDdIPK
 7Ph9qZCeoRmIoA1RFGs6Ol8TcAHrvxoMG9xSrkOYdPPRNUS17o8CA6X38ZQ82cAHQ
 yFzuoPr0tx3omugugz94JMioakzCxGQ+q/QVs3sh7W7pJlJvy9uX9HOCIwZ0aOj64
 /QQCGPx/MT/kgV6m7wyf1aGFyHnEe95uZ6gr2iJCr1ezJSrdu9XAA9/5e6FbfJzMG
 +Ei1Ko5fJwlWbZ929hfV7/6z+3JUr0geNvm54eN5y/+1zdRm2fFlr2TF/5+fIofpi
 Q4FKIY2OWSWErwYYOA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzQg6-1vjmyE45SK-017b6Q; Mon, 02
 Mar 2026 13:37:35 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Date: Mon, 02 Mar 2026 13:37:04 +0100
Subject: [PATCH v5 2/6] cgroup,cgroup/dmem: Add
 (dmem_)cgroup_common_ancestor helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20260302-dmemcg-aggressive-protect-v5-2-ffd3a2602309@gmx.de>
References: <20260302-dmemcg-aggressive-protect-v5-0-ffd3a2602309@gmx.de>
In-Reply-To: <20260302-dmemcg-aggressive-protect-v5-0-ffd3a2602309@gmx.de>
To: Maarten Lankhorst <dev@lankhorst.se>, 
 Maxime Ripard <mripard@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Natalie Vock <natalie.vock@gmx.de>
X-Mailer: b4 0.14.3
X-Provags-ID: V03:K1:baswGlfBYcCbrcA3l9Xv0Xe5jEPM5zFl2t5yhd5b7ODv0UWsDxk
 ZoUtAxZ+GErixk8jRNQSZvmZOQvQJN3ebEnIdqWIe/eNUf4sXcOcExrCydHDavXxNMwIR7a
 Ld5Tx9jtm7rZ9kV36bK1SLZmUzTfa7W7G94HG9XP+gB+bZVI2PC+KdAIXIs5r0cjbj6ye4b
 oNbSSlHcU1FInsKlIyR7g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YTXYMqjsLLk=;eMmPnS4OC3HhCXuaEuiZD6mlQl5
 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
 QQF9zR94=
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dev@lankhorst.se,m:mripard@kernel.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:tursulin@ursulin.net,m:cgroups@vger.kernel.org,m:natalie.vock@gmx.de,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	FREEMAIL_TO(0.00)[lankhorst.se,kernel.org,cmpxchg.org,suse.com,amd.com,intel.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,ursulin.net];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmx.de];
	DKIM_TRACE(0.00)[gmx.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gmx.de:mid,gmx.de:dkim,gmx.de:email]
X-Rspamd-Queue-Id: C4CFA1D8BA9
X-Rspamd-Action: no action

This helps to find a common subtree of two resources, which is important
when determining whether it's helpful to evict one resource in favor of
another.

To facilitate this, add a common helper to find the ancestor of two
cgroups using each cgroup's ancestor array.

Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
=2D--
 include/linux/cgroup.h      | 21 +++++++++++++++++++++
 include/linux/cgroup_dmem.h |  9 +++++++++
 kernel/cgroup/dmem.c        | 43 ++++++++++++++++++++++++++++++++++++++++=
=2D--
 3 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/include/linux/cgroup.h b/include/linux/cgroup.h
index bc892e3b37eea..560ae995e3a54 100644
=2D-- a/include/linux/cgroup.h
+++ b/include/linux/cgroup.h
@@ -561,6 +561,27 @@ static inline struct cgroup *cgroup_ancestor(struct c=
group *cgrp,
 	return cgrp->ancestors[ancestor_level];
 }
=20
+/**
+ * cgroup_common_ancestor - find common ancestor of two cgroups
+ * @a: first cgroup to find common ancestor of
+ * @b: second cgroup to find common ancestor of
+ *
+ * Find the first cgroup that is an ancestor of both @a and @b, if it exi=
sts
+ * and return a pointer to it. If such a cgroup doesn't exist, return NUL=
L.
+ *
+ * This function is safe to call as long as both @a and @b are accessible=
.
+ */
+static inline struct cgroup *cgroup_common_ancestor(struct cgroup *a,
+						    struct cgroup *b)
+{
+	int level;
+
+	for (level =3D min(a->level, b->level); level >=3D 0; level--)
+		if (a->ancestors[level] =3D=3D b->ancestors[level])
+			return a->ancestors[level];
+	return NULL;
+}
+
 /**
  * task_under_cgroup_hierarchy - test task's membership of cgroup ancestr=
y
  * @task: the task to be tested
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
index 28227405f7cfe..a3ba865f4c68f 100644
=2D-- a/kernel/cgroup/dmem.c
+++ b/kernel/cgroup/dmem.c
@@ -569,11 +569,10 @@ void dmem_cgroup_pool_state_put(struct dmem_cgroup_p=
ool_state *pool)
 EXPORT_SYMBOL_GPL(dmem_cgroup_pool_state_put);
=20
 static struct dmem_cgroup_pool_state *
-get_cg_pool_unlocked(struct dmemcg_state *cg, struct dmem_cgroup_region *=
region)
+find_cg_pool_unlocked(struct dmemcg_state *cg, struct dmem_cgroup_region =
*region)
 {
-	struct dmem_cgroup_pool_state *pool, *allocpool =3D NULL;
+	struct dmem_cgroup_pool_state *pool;
=20
-	/* fastpath lookup? */
 	rcu_read_lock();
 	pool =3D find_cg_pool_locked(cg, region);
 	if (pool && !READ_ONCE(pool->inited))
@@ -582,6 +581,17 @@ get_cg_pool_unlocked(struct dmemcg_state *cg, struct =
dmem_cgroup_region *region)
 		pool =3D NULL;
 	rcu_read_unlock();
=20
+	return pool;
+}
+
+static struct dmem_cgroup_pool_state *
+get_cg_pool_unlocked(struct dmemcg_state *cg, struct dmem_cgroup_region *=
region)
+{
+	struct dmem_cgroup_pool_state *pool, *allocpool =3D NULL;
+
+	/* fastpath lookup? */
+	pool =3D find_cg_pool_unlocked(cg, region);
+
 	while (!pool) {
 		spin_lock(&dmemcg_lock);
 		if (!region->unregistered)
@@ -756,6 +766,33 @@ bool dmem_cgroup_below_low(struct dmem_cgroup_pool_st=
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
either @a or @b are NULL,
+ * or if such a pool does not exist.
+ */
+struct dmem_cgroup_pool_state *dmem_cgroup_common_ancestor(struct dmem_cg=
roup_pool_state *a,
+							   struct dmem_cgroup_pool_state *b)
+{
+	struct cgroup *ancestor_cgroup;
+	struct cgroup_subsys_state *ancestor_css;
+
+	if (!a || !b)
+		return NULL;
+
+	ancestor_cgroup =3D cgroup_common_ancestor(a->cs->css.cgroup, b->cs->css=
.cgroup);
+	if (!ancestor_cgroup)
+		return NULL;
+
+	ancestor_css =3D cgroup_e_css(ancestor_cgroup, &dmem_cgrp_subsys);
+
+	return find_cg_pool_unlocked(css_to_dmemcs(ancestor_css), a->region);
+}
+EXPORT_SYMBOL_GPL(dmem_cgroup_common_ancestor);
+
 static int dmem_cgroup_region_capacity_show(struct seq_file *sf, void *v)
 {
 	struct dmem_cgroup_region *region;

=2D-=20
2.53.0

