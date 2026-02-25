Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJj/D+3mnmkCXwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:11:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E674819710C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6DE10E74F;
	Wed, 25 Feb 2026 12:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="c6Ut8IX2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD50F10E74F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 12:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772021457; x=1772626257; i=natalie.vock@gmx.de;
 bh=SGJNX4Qkk79IEgQD6sd68YtMQ/20ZfHySZcdsK9WfCk=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=c6Ut8IX2gAEaRXvgcK7RKnNe7IowmI7z7nVcH8SbWUBLbuGIEnISV6RE1MEkccKy
 vqFb0JElMIBF7MrYOdWW5iv0jNvqWyF4PF9hgPE6Lt+0GH6Nl2M4iZsGzw6VmOKFu
 MNv3gHkbYpOPR20s8dQKJh+0HPdMhVXS1wQvWCTskhNIzjQ2snK9BdcD0gwVSmAO6
 E1rJckVS4FML4L0xoEGDpxcRtWyBncsUGlCNhlO3YEEde90yzARF0mkN7NMl9JK4i
 l22o3RuKlctbBpUPA/Y/qnpdLCOjeHHj2qJXkcOuKs+MDEmiNxlE3nEM7EaB4HgtB
 9R+lMNPtQj5PNZpQLA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwQXN-1vcaPt3MEX-014UnH; Wed, 25
 Feb 2026 13:10:56 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Date: Wed, 25 Feb 2026 13:10:45 +0100
Subject: [PATCH v4 1/6] cgroup/dmem: Add queries for protection values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20260225-dmemcg-aggressive-protect-v4-1-de847ab35184@gmx.de>
References: <20260225-dmemcg-aggressive-protect-v4-0-de847ab35184@gmx.de>
In-Reply-To: <20260225-dmemcg-aggressive-protect-v4-0-de847ab35184@gmx.de>
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
X-Provags-ID: V03:K1:NEuGcZIXhhOczw+zh1SPrVB3bHq6K5EgJf6js6rM0uIscU0LGJy
 1nnTw1bzZb8Xwut+LHblCU/iVHLt3WK8PUtcfL8L7O9PoJ7ZmEchuuPknm1T2icoWUSfrR9
 RfX0wWlpxGHFGFWx8LprkJh8U65yV2qK1DYW+tLYzWvFKlx9NU7IdUWeoqxLlODABMmcF8h
 +K4wRtSE0b6fmMw3dXKJg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Uiof2w2bHpo=;+YVLpC2hzmJQx448tbDcNOHtnJW
 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
 jxItm7ogIHSSOsjGaWsMy/C1sZY59
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dev@lankhorst.se,m:mripard@kernel.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:tursulin@ursulin.net,m:cgroups@vger.kernel.org,m:natalie.vock@gmx.de,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmx.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[lankhorst.se,kernel.org,cmpxchg.org,suse.com,amd.com,intel.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,ursulin.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E674819710C
X-Rspamd-Action: no action

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
index 9d95824dc6fa0..28227405f7cfe 100644
=2D-- a/kernel/cgroup/dmem.c
+++ b/kernel/cgroup/dmem.c
@@ -694,6 +694,68 @@ int dmem_cgroup_try_charge(struct dmem_cgroup_region =
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
2.53.0

