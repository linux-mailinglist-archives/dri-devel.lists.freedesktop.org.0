Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMtIOejmnmkCXwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:11:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988411970ED
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE4C10E74D;
	Wed, 25 Feb 2026 12:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="CjXo6kGK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6AE10E74D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 12:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772021458; x=1772626258; i=natalie.vock@gmx.de;
 bh=E1KvsjN5RXmeX1ma3guOokacvnwIlPKnVOBBZhhCG94=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=CjXo6kGKB+Ebowg9BY0WfudbsZlYHZCL+O0L3PNd9jKixFuqvw3f8bExaSMndhD8
 +S2vggJn70KfSg1Vi2SdHiqzpGLMD/dST0Js6tt+M5oe/9PDk4rKC5LDwAfe2Ql4u
 5NFs0rKYlCNMfomPJHcX92Hs7B8wJ4Cr8wkv0QDcSjKbLjB19DP3z/Es2BG+P7zry
 ukOxdbmTbwKrBqdDDJMBhOqnKUmAVx8khkr3lF5MU0obxbUO9+pFUUTXPBUh78igd
 qR2Gr4GJIy+fBNcJDF3ds4syzEEQXZ+clpIlH01fuYQKZSwtC0f95BG9iuUC4CqU3
 r/yH733lSFA0BuVULw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8XU1-1vi4bA3vbl-00sPyd; Wed, 25
 Feb 2026 13:10:58 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Date: Wed, 25 Feb 2026 13:10:46 +0100
Subject: [PATCH v4 2/6] cgroup/dmem: Add dmem_cgroup_common_ancestor helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20260225-dmemcg-aggressive-protect-v4-2-de847ab35184@gmx.de>
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
X-Provags-ID: V03:K1:khY2z8Qhpq+ND/OvGFlCNrZaD/2F7SRIQF12f8dxOf/Th406n7a
 nZ+W86tw1TsJMhrfovw7CvDcP4JOcv31lvzoGdKl1YyJdZZonHz1wkH1e0HyywBxt3BiHtn
 Z/xqD/AfXmKkveKjOmv2Ytd/X6uNzTsjMrtK8sKK/4RB3fkYznTeJXZ3m2gz1Yn1y/lENio
 Hb7ahbmFzSnO2/C4XlMiQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tUeQ7EBauBA=;7RE5JpBEIOZcaK45vxWeOeXxF1c
 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
 A/UTHPWNIvaxnSGslxVczKs6ZtW0d
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
X-Rspamd-Queue-Id: 988411970ED
X-Rspamd-Action: no action

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
index 28227405f7cfe..26e794400c5c7 100644
=2D-- a/kernel/cgroup/dmem.c
+++ b/kernel/cgroup/dmem.c
@@ -756,6 +756,31 @@ bool dmem_cgroup_below_low(struct dmem_cgroup_pool_st=
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
2.53.0

