Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB8INpqEpWkeDAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:37:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AAA1D8BA2
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DDE10E4B6;
	Mon,  2 Mar 2026 12:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="On2lilLV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7545310E4B6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772455054; x=1773059854; i=natalie.vock@gmx.de;
 bh=SGJNX4Qkk79IEgQD6sd68YtMQ/20ZfHySZcdsK9WfCk=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=On2lilLV/AjO6pNSUj2LwQRB8eY5ZBJ56U9+OOWTV8dVpsrwPHLBveGLDsfQ6AiW
 sX88zn9pCU4Oy9o+mqwgihFlkyDngLMC8rPyoFdtY8TNnGI4zdLsVeJ8Gwabx0aUZ
 9yjudfy7Vt+SYfwGg1Abad1U95CP255b9PGWaefe/I3F4xc3HpA2k/5XVOiApkn6P
 eDUJXrO7EeLCrbks9/fg6UF6DSJAxYbv4tGNI/I6JeWq4HKpjnKQMbVJgHV/Efbl+
 cIZ3JBiT3bfvM2Thlf/glRJrLoWp3XpmDZ6PaCy0nh00+7F2FMOmpMrHgOFPG3Tgk
 PptDY5kyjxXsXnwoYQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNKhs-1wLswO04gU-00Wsdc; Mon, 02
 Mar 2026 13:37:34 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Date: Mon, 02 Mar 2026 13:37:03 +0100
Subject: [PATCH v5 1/6] cgroup/dmem: Add queries for protection values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20260302-dmemcg-aggressive-protect-v5-1-ffd3a2602309@gmx.de>
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
X-Provags-ID: V03:K1:0Baci49Cf754AnMGk9rEhDBi7rPhc9kQRJi4KZfyrj7N8P5dGYH
 W4ZSmQJRL5grM4SzjGWq44tynhTMwdZuIiIfldVZOFvrR9V4KCOejmDbMfAQ/Te/JhVvs9R
 tAWMltkQ5/OMkhx1yYIReXJGXywyjXINoniYIy5q9dwpnayRVIheGdZ8fAN/QrRIrUJe7/W
 ZSjylJg8cJJXvdSimaIlw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3Hc2xdrpmRk=;k2A4NXWr5kB3IQzFx6QfVbPVCif
 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
 uxyfTY/ZKSmKsae3re7J4j5rXRRA6
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
X-Rspamd-Queue-Id: 28AAA1D8BA2
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

