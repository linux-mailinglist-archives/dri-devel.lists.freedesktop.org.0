Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP+uAuzOemnU+gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 04:07:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F51AB538
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 04:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB50C10E302;
	Thu, 29 Jan 2026 03:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36D710E302
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 03:07:19 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-70-b5Gv61l4Pee-I6h3AC03Kg-1; Wed,
 28 Jan 2026 22:07:16 -0500
X-MC-Unique: b5Gv61l4Pee-I6h3AC03Kg-1
X-Mimecast-MFC-AGG-ID: b5Gv61l4Pee-I6h3AC03Kg_1769656036
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CC3AE1944F12; Thu, 29 Jan 2026 03:07:15 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.75])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C682A1800665; Thu, 29 Jan 2026 03:07:13 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH] nouveau/vmm: start tracking if the LPT PTE is valid. (v3)
Date: Thu, 29 Jan 2026 13:07:10 +1000
Message-ID: <20260129030710.1574879-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yp2h7JdDHy8FW21gx2FNVh0AIV8Nxwl0RbB1fG1Lz4c_1769656036
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
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
X-Spamd-Result: default: False [0.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 62F51AB538
X-Rspamd-Action: no action

From: Dave Airlie <airlied@redhat.com>

When NVK enabled large pages userspace tests were seeing fault
reports at a valid address.

There was a case where an address moving from 64k page to 4k pages
could expose a race between unmapping the 4k page, mapping the 64k
page and unref the 4k pages.

Unref 4k pages would cause the dual-page table handling to always
set the LPTE entry to SPARSE or INVALID, but if we'd mapped a valid
LPTE in the meantime, it would get trashed. Keep track of when
a valid LPTE has been referenced, and don't reset in that case.

This increase the tracking to 32-bit, because it turns out if
unref can get delayed, you can get a lot of these outstanding
and this can cause strange behaviours.

Cc: stable@vger.kernel.org
Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/14610
Signed-off-by: Dave Airlie <airlied@redhat.com>

--
v2: move to 32-bit from 8-bit tracker
fix some more flag changes.
v3: missed one BIG_PTE unset
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 44 ++++++++++++++-----
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |  9 ++--
 2 files changed, 37 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.c
index f95c58b67633..970e5f94a6e3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -53,7 +53,7 @@ nvkm_vmm_pt_new(const struct nvkm_vmm_desc *desc, bool sp=
arse,
 =09=09}
 =09}
=20
-=09if (!(pgt =3D kzalloc(sizeof(*pgt) + lpte, GFP_KERNEL)))
+=09if (!(pgt =3D kzalloc(sizeof(*pgt) + (sizeof(pgt->pte[0]) * lpte), GFP_=
KERNEL)))
 =09=09return NULL;
 =09pgt->page =3D page ? page->shift : 0;
 =09pgt->sparse =3D sparse;
@@ -242,14 +242,17 @@ nvkm_vmm_unref_sptes(struct nvkm_vmm_iter *it, struct=
 nvkm_vmm_pt *pgt,
 =09=09if (pgt->pte[pteb] & NVKM_VMM_PTE_SPARSE) {
 =09=09=09TRA(it, "LPTE %05x: U -> S %d PTEs", pteb, ptes);
 =09=09=09pair->func->sparse(vmm, pgt->pt[0], pteb, ptes);
-=09=09} else
-=09=09if (pair->func->invalid) {
-=09=09=09/* If the MMU supports it, restore the LPTE to the
-=09=09=09 * INVALID state to tell the MMU there is no point
-=09=09=09 * trying to fetch the corresponding SPTEs.
-=09=09=09 */
-=09=09=09TRA(it, "LPTE %05x: U -> I %d PTEs", pteb, ptes);
-=09=09=09pair->func->invalid(vmm, pgt->pt[0], pteb, ptes);
+=09=09} else if (!(pgt->pte[pteb] & NVKM_VMM_PTE_BIG_VALID)) {
+=09=09=09if (pair->func->invalid) {
+=09=09=09=09/* If the MMU supports it, restore the LPTE to the
+=09=09=09=09 * INVALID state to tell the MMU there is no point
+=09=09=09=09 * trying to fetch the corresponding SPTEs.
+=09=09=09=09 */
+=09=09=09=09TRA(it, "LPTE %05x: U -> I %d PTEs", pteb, ptes);
+=09=09=09=09pair->func->invalid(vmm, pgt->pt[0], pteb, ptes);
+=09=09=09}
+=09=09} else {
+=09=09=09TRA(it, "LPTE %05x: V %d PTEs", pteb, ptes);
 =09=09}
 =09}
 }
@@ -280,6 +283,13 @@ nvkm_vmm_unref_ptes(struct nvkm_vmm_iter *it, bool pfn=
, u32 ptei, u32 ptes)
 =09if (desc->type =3D=3D SPT && (pgt->refs[0] || pgt->refs[1]))
 =09=09nvkm_vmm_unref_sptes(it, pgt, desc, ptei, ptes);
=20
+=09if (desc->type =3D=3D LPT && (pgt->refs[0] || pgt->refs[1])) {
+=09=09for (u32 lpti =3D ptei; ptes; lpti++) {
+=09=09=09pgt->pte[lpti] &=3D ~NVKM_VMM_PTE_BIG_VALID;
+=09=09=09ptes--;
+=09=09}
+=09}
+
 =09/* PT no longer needed? Destroy it. */
 =09if (!pgt->refs[type]) {
 =09=09it->lvl++;
@@ -332,10 +342,12 @@ nvkm_vmm_ref_sptes(struct nvkm_vmm_iter *it, struct n=
vkm_vmm_pt *pgt,
 =09=09 * Determine how many LPTEs need to transition state.
 =09=09 */
 =09=09pgt->pte[ptei] |=3D NVKM_VMM_PTE_VALID;
+=09=09pgt->pte[ptei] &=3D ~NVKM_VMM_PTE_BIG_VALID;
 =09=09for (ptes =3D 1, ptei++; ptei < lpti; ptes++, ptei++) {
 =09=09=09if (pgt->pte[ptei] & NVKM_VMM_PTE_VALID)
 =09=09=09=09break;
 =09=09=09pgt->pte[ptei] |=3D NVKM_VMM_PTE_VALID;
+=09=09=09pgt->pte[ptei] &=3D ~NVKM_VMM_PTE_BIG_VALID;
 =09=09}
=20
 =09=09if (pgt->pte[pteb] & NVKM_VMM_PTE_SPARSE) {
@@ -374,6 +386,14 @@ nvkm_vmm_ref_ptes(struct nvkm_vmm_iter *it, bool pfn, =
u32 ptei, u32 ptes)
 =09if (desc->type =3D=3D SPT)
 =09=09nvkm_vmm_ref_sptes(it, pgt, desc, ptei, ptes);
=20
+=09if (desc->type =3D=3D LPT) {
+=09=09for (u32 lpti =3D ptei; ptes; lpti++) {
+=09=09=09pgt->pte[lpti] &=3D ~NVKM_VMM_PTE_VALID;
+=09=09=09pgt->pte[lpti] |=3D NVKM_VMM_PTE_BIG_VALID;
+=09=09=09ptes--;
+=09=09}
+=09}
+
 =09return true;
 }
=20
@@ -386,7 +406,7 @@ nvkm_vmm_sparse_ptes(const struct nvkm_vmm_desc *desc,
 =09=09=09pgt->pde[ptei++] =3D NVKM_VMM_PDE_SPARSE;
 =09} else
 =09if (desc->type =3D=3D LPT) {
-=09=09memset(&pgt->pte[ptei], NVKM_VMM_PTE_SPARSE, ptes);
+=09=09memset32(&pgt->pte[ptei], NVKM_VMM_PTE_SPARSE, ptes);
 =09}
 }
=20
@@ -398,7 +418,7 @@ nvkm_vmm_sparse_unref_ptes(struct nvkm_vmm_iter *it, bo=
ol pfn, u32 ptei, u32 pte
 =09=09memset(&pt->pde[ptei], 0x00, sizeof(pt->pde[0]) * ptes);
 =09else
 =09if (it->desc->type =3D=3D LPT)
-=09=09memset(&pt->pte[ptei], 0x00, sizeof(pt->pte[0]) * ptes);
+=09=09memset32(&pt->pte[ptei], 0x00, ptes);
 =09return nvkm_vmm_unref_ptes(it, pfn, ptei, ptes);
 }
=20
@@ -457,7 +477,7 @@ nvkm_vmm_ref_hwpt(struct nvkm_vmm_iter *it, struct nvkm=
_vmm_pt *pgd, u32 pdei)
 =09=09=09=09=09desc->func->sparse(vmm, pt, pteb, ptes);
 =09=09=09=09else
 =09=09=09=09=09desc->func->invalid(vmm, pt, pteb, ptes);
-=09=09=09=09memset(&pgt->pte[pteb], 0x00, ptes);
+=09=09=09=09memset32(&pgt->pte[pteb], 0x00, ptes);
 =09=09=09} else {
 =09=09=09=09desc->func->unmap(vmm, pt, pteb, ptes);
 =09=09=09=09while (ptes--)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.h
index 4586a425dbe4..3720579f4bf7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -44,10 +44,11 @@ struct nvkm_vmm_pt {
 =09 *
 =09 * This information is used to manage LPTE state transitions.
 =09 */
-#define NVKM_VMM_PTE_SPARSE 0x80
-#define NVKM_VMM_PTE_VALID  0x40
-#define NVKM_VMM_PTE_SPTES  0x3f
-=09u8 pte[];
+#define NVKM_VMM_PTE_SPARSE    0x80000000
+#define NVKM_VMM_PTE_VALID     0x40000000
+#define NVKM_VMM_PTE_BIG_VALID 0x20000000
+#define NVKM_VMM_PTE_SPTES     0x1fffffff
+=09u32 pte[];
 };
=20
 typedef void (*nvkm_vmm_pxe_func)(struct nvkm_vmm *,
--=20
2.52.0

