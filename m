Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 535E8A10B15
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 16:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32CD10E3AF;
	Tue, 14 Jan 2025 15:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="FA78eag5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F0F10E3AF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 15:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1736869171; x=1737473971; i=friedrich.vock@gmx.de;
 bh=1wKjG+3sQeQ4jISNLomfGkq1QxEvNFSzRfxfd3bvLwU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=FA78eag52dOOlcuQuC3JTB09KIhjB1bIhaMaKkMX+fmtV8RC5ZxLg+buKua6QyR7
 NLGuKCdWqf8p7RmGL9sVKB7HBAMvrPmwDnzMchQPkYCB7+65qsjeExYXmShffcNB4
 b8Rz08F512bpwut73cxSO3VH6x5ell2gcDpCyMvzHelBEWkLbpLaURoTGO/X7HmJP
 7ksJG8pgoG5OBt2dFlo550aIh4qecZLU7jcMpaOrAxK4NVQzV0K/1cki9hvVZZ8aV
 no1LKDYTRwtNOo80qhWPQYruUoWUR6vx/vMwXRLl0X3tdvp+3QHqguPKTaTWdZX9Y
 /ZDIIegGYAGj7NHVJw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([109.91.201.165]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mjj87-1t99tQ1r7j-00m0Lw; Tue, 14 Jan 2025 16:39:31 +0100
From: Friedrich Vock <friedrich.vock@gmx.de>
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, cgroups@vger.kernel.org
Subject: [PATCH] cgroup/dmem: Don't clobber pool in
 dmem_cgroup_calculate_protection
Date: Tue, 14 Jan 2025 16:39:12 +0100
Message-ID: <20250114153912.278909-1-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9eNm08SBRIT30oeEmduXTjEw8ODPxSpix++4CFBr3M2+LUkQCCg
 dAljsqzeS/+y2gGp2T1lzYCcqh8ZIHSSi748O5Mlsr5PM/qdXqKutrNaDK+nJ89x3LBZDwH
 JZso78K0dGLQqItjjrIWLzbES/lzXFjsx9Vj5JvwmhPGdaN9ovocwTEBPTpUqrh6gkGRnkF
 kW5A7X+xel91defoZGpxA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5q0PkIyEVDY=;bwP5siTbyqtBDN/Qt3OVsVqlagv
 2+X010RJvu7CaC82FRDNU9TfyTtJFiXaEhEmTQHId8d6AOonC4FNEmhPr5VhG/85veDfBmcdU
 AHH6HBC996qQ0xEOQozB66pJf0kTat7BSD4UgM8op5+7b6vmWliZTvBXmvU+MOJaWLUC+S3el
 yAzMzpfxbD+evCyf9bbJ4OVdhNOjeTqaKHe8Wsfxhykj/9jTO4r2cPBU9F1H05pxS/GAkI5SK
 7coQyEouHlFr4uftFcNnPpR6gxO4MqJBCWk75AwfkF/3HvkG915EtUtBFychU8lqPFItPhOQY
 IVDXAif1CtaZ9zqWRdbpeveFhT3bZX1j7MH8RG14ze4WoPOSdtEOCl9jjlzQoi6YORvDW+8GA
 s/K/WnntiPCfJ97yvFhNQqu9JnER7Rp2sdAH1sTYHR1Ezyln3U8V2XpGHHi77rackDYf+qJhf
 jvEhiU9333/PnUaHX7Ik+he+Z+VbtpQxPrajAWq0QLFYlVmPiFkyyNqElRXLhj5oJOV3OVi1f
 RgknNNMddzn4yjWJKaAwCrq++fZByhfbuhscb5Yf0UyPC50TFq5JDjJEeHq0rnzwG3/sQ7G2A
 YqjLTYVaLdJtw4nynVKKT/QB+YPPzuqEL4hou24M3v5d0UL+BHDEjniSnW9sXqYUxj0gzAiXs
 QrZV+1745JfowGvPpWR1uWzD6BHrPyVcCyeOVrd4pYjOTOFzPry9WlV5r6QzDLu/HI1rd+Z8z
 xZk7xLfn+5rwgfOjnN/OxT67xBY5b0oUiMgw6xmtDHTk8CpCqiY9hDLt6oIkWZ/OMEyz87CzM
 mZoI63GgjfyAM4dHMoOc5so5748wNGTmaEyeqpaUT4FBv1Shin6enHpvt+rSi2e7VFiFrizwq
 +fe0mJ5DjGtbFofq5L127hZP46BkhyYtZN5FG19QRguH+FS8qYSgUCScTayDZsj7gUGRkNyc/
 S2kyIJEmI540dKuK/iWT6c4mK2LJ8y0xjQP4lWfCxEL2Ei7uE65GFQlRNgSk2ODUZjP3OCh62
 /ql9dEJDMnP7OpcsyeXRiM6n04OGNgDR/eCa97FC6/VbCGYZKLnB5HPCPhFW976HylOHHKld0
 P9UKRiERuZAGOn8GJOI1JpOhZZO9OyrpafQMUCqDGZTWBn2E0QUaf32S1kjs1+4KsqC+IcWkO
 My+mFL/ZcjT3lgvryCc/GvEMY6uAJ/luWn/jvdfwTLA==
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

If the current css doesn't contain any pool that is a descendant of
the "pool" (i.e. when found_descendant =3D=3D false), then "pool" will
point to some unrelated pool. If the current css has a child, we'll
overwrite parent_pool with this unrelated pool on the next iteration.

Fix this by overwriting "pool" only if it actually is a descendant of
parent_pool, and setting it to NULL otherwise. Also, skip traversing
subtrees if pool =3D=3D NULL to avoid overwriting parent_pool (and because
it's pointless).

Fixes: b168ed458 ("kernel/cgroup: Add "dmem" memory accounting cgroup")
Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 kernel/cgroup/dmem.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
index 52736ef0ccf25..10d37df5d50f6 100644
=2D-- a/kernel/cgroup/dmem.c
+++ b/kernel/cgroup/dmem.c
@@ -222,8 +222,7 @@ dmem_cgroup_calculate_protection(struct dmem_cgroup_po=
ol_state *limit_pool,
 	struct page_counter *climit;
 	struct cgroup_subsys_state *css, *next_css;
 	struct dmemcg_state *dmemcg_iter;
-	struct dmem_cgroup_pool_state *pool, *parent_pool;
-	bool found_descendant;
+	struct dmem_cgroup_pool_state *pool, *candidate_pool, *parent_pool;

 	climit =3D &limit_pool->cnt;

@@ -241,7 +240,13 @@ dmem_cgroup_calculate_protection(struct dmem_cgroup_p=
ool_state *limit_pool,
 	 */
 	while (pool !=3D test_pool) {
 		next_css =3D css_next_child(NULL, css);
-		if (next_css) {
+		/*
+		 * pool is NULL when the current css does not contain a
+		 * pool of the type we're interested in. In that case, it's
+		 * impossible that any child css contains a relevant pool, so
+		 * skip the subtree entirely and move on to the next sibling.
+		 */
+		if (next_css && pool) {
 			parent_pool =3D pool;
 		} else {
 			while (css !=3D &limit_pool->cs->css) {
@@ -260,16 +265,16 @@ dmem_cgroup_calculate_protection(struct dmem_cgroup_=
pool_state *limit_pool,
 		}
 		css =3D next_css;

-		found_descendant =3D false;
 		dmemcg_iter =3D container_of(css, struct dmemcg_state, css);

-		list_for_each_entry_rcu(pool, &dmemcg_iter->pools, css_node) {
-			if (pool_parent(pool) =3D=3D parent_pool) {
-				found_descendant =3D true;
+		pool =3D NULL;
+		list_for_each_entry_rcu(candidate_pool, &dmemcg_iter->pools, css_node) =
{
+			if (pool_parent(candidate_pool) =3D=3D parent_pool) {
+				pool =3D candidate_pool;
 				break;
 			}
 		}
-		if (!found_descendant)
+		if (!pool)
 			continue;

 		page_counter_calculate_protection(
=2D-
2.48.0

