Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAhMJomHgWmzGwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 06:28:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EC0D4B1D
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 06:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B16A10E541;
	Tue,  3 Feb 2026 05:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D032F10E541
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 05:28:36 +0000 (UTC)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-JGKrVQ1JNCuzLXkChQ3ZWg-1; Tue,
 03 Feb 2026 00:28:33 -0500
X-MC-Unique: JGKrVQ1JNCuzLXkChQ3ZWg-1
X-Mimecast-MFC-AGG-ID: JGKrVQ1JNCuzLXkChQ3ZWg_1770096512
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C12DD195608F; Tue,  3 Feb 2026 05:28:32 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.75])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C14E51956053; Tue,  3 Feb 2026 05:28:30 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH 1/3] nouveau/vmm: rewrite pte tracker using a struct and
 bitfields.
Date: Tue,  3 Feb 2026 15:25:25 +1000
Message-ID: <20260203052823.2220053-2-airlied@gmail.com>
In-Reply-To: <20260203052823.2220053-1-airlied@gmail.com>
References: <20260203052823.2220053-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6AA-5vyJmduIRGvnBHNrGcXSRBjxhcCm7zpjogbEy-w_1770096512
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
X-Rspamd-Queue-Id: 49EC0D4B1D
X-Rspamd-Action: no action

From: Dave Airlie <airlied@redhat.com>

I want to increase the counters here and start tracking LPTs as well
as there are certain situations where userspace with mixed page sizes
can cause ref/unrefs to live longer so need better reference counting.

This should be entirely non-functional.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 41 ++++++++++---------
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h | 14 +++++--
 2 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.c
index f95c58b67633..efc334f6104c 100644
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
@@ -208,7 +208,7 @@ nvkm_vmm_unref_sptes(struct nvkm_vmm_iter *it, struct n=
vkm_vmm_pt *pgt,
 =09 */
 =09for (lpti =3D ptei >> sptb; ptes; spti =3D 0, lpti++) {
 =09=09const u32 pten =3D min(sptn - spti, ptes);
-=09=09pgt->pte[lpti] -=3D pten;
+=09=09pgt->pte[lpti].s.sptes -=3D pten;
 =09=09ptes -=3D pten;
 =09}
=20
@@ -218,9 +218,9 @@ nvkm_vmm_unref_sptes(struct nvkm_vmm_iter *it, struct n=
vkm_vmm_pt *pgt,
=20
 =09for (ptei =3D pteb =3D ptei >> sptb; ptei < lpti; pteb =3D ptei) {
 =09=09/* Skip over any LPTEs that still have valid SPTEs. */
-=09=09if (pgt->pte[pteb] & NVKM_VMM_PTE_SPTES) {
+=09=09if (pgt->pte[pteb].s.sptes) {
 =09=09=09for (ptes =3D 1, ptei++; ptei < lpti; ptes++, ptei++) {
-=09=09=09=09if (!(pgt->pte[ptei] & NVKM_VMM_PTE_SPTES))
+=09=09=09=09if (!(pgt->pte[ptei].s.sptes))
 =09=09=09=09=09break;
 =09=09=09}
 =09=09=09continue;
@@ -232,14 +232,14 @@ nvkm_vmm_unref_sptes(struct nvkm_vmm_iter *it, struct=
 nvkm_vmm_pt *pgt,
 =09=09 *
 =09=09 * Determine how many LPTEs need to transition state.
 =09=09 */
-=09=09pgt->pte[ptei] &=3D ~NVKM_VMM_PTE_VALID;
+=09=09pgt->pte[ptei].s.spte_valid =3D false;
 =09=09for (ptes =3D 1, ptei++; ptei < lpti; ptes++, ptei++) {
-=09=09=09if (pgt->pte[ptei] & NVKM_VMM_PTE_SPTES)
+=09=09=09if (pgt->pte[ptei].s.sptes)
 =09=09=09=09break;
-=09=09=09pgt->pte[ptei] &=3D ~NVKM_VMM_PTE_VALID;
+=09=09=09pgt->pte[ptei].s.spte_valid =3D false;
 =09=09}
=20
-=09=09if (pgt->pte[pteb] & NVKM_VMM_PTE_SPARSE) {
+=09=09if (pgt->pte[pteb].s.sparse) {
 =09=09=09TRA(it, "LPTE %05x: U -> S %d PTEs", pteb, ptes);
 =09=09=09pair->func->sparse(vmm, pgt->pt[0], pteb, ptes);
 =09=09} else
@@ -307,7 +307,7 @@ nvkm_vmm_ref_sptes(struct nvkm_vmm_iter *it, struct nvk=
m_vmm_pt *pgt,
 =09 */
 =09for (lpti =3D ptei >> sptb; ptes; spti =3D 0, lpti++) {
 =09=09const u32 pten =3D min(sptn - spti, ptes);
-=09=09pgt->pte[lpti] +=3D pten;
+=09=09pgt->pte[lpti].s.sptes +=3D pten;
 =09=09ptes -=3D pten;
 =09}
=20
@@ -317,9 +317,9 @@ nvkm_vmm_ref_sptes(struct nvkm_vmm_iter *it, struct nvk=
m_vmm_pt *pgt,
=20
 =09for (ptei =3D pteb =3D ptei >> sptb; ptei < lpti; pteb =3D ptei) {
 =09=09/* Skip over any LPTEs that already have valid SPTEs. */
-=09=09if (pgt->pte[pteb] & NVKM_VMM_PTE_VALID) {
+=09=09if (pgt->pte[pteb].s.spte_valid) {
 =09=09=09for (ptes =3D 1, ptei++; ptei < lpti; ptes++, ptei++) {
-=09=09=09=09if (!(pgt->pte[ptei] & NVKM_VMM_PTE_VALID))
+=09=09=09=09if (!pgt->pte[ptei].s.spte_valid)
 =09=09=09=09=09break;
 =09=09=09}
 =09=09=09continue;
@@ -331,14 +331,14 @@ nvkm_vmm_ref_sptes(struct nvkm_vmm_iter *it, struct n=
vkm_vmm_pt *pgt,
 =09=09 *
 =09=09 * Determine how many LPTEs need to transition state.
 =09=09 */
-=09=09pgt->pte[ptei] |=3D NVKM_VMM_PTE_VALID;
+=09=09pgt->pte[ptei].s.spte_valid =3D true;
 =09=09for (ptes =3D 1, ptei++; ptei < lpti; ptes++, ptei++) {
-=09=09=09if (pgt->pte[ptei] & NVKM_VMM_PTE_VALID)
+=09=09=09if (pgt->pte[ptei].s.spte_valid)
 =09=09=09=09break;
-=09=09=09pgt->pte[ptei] |=3D NVKM_VMM_PTE_VALID;
+=09=09=09pgt->pte[ptei].s.spte_valid =3D true;
 =09=09}
=20
-=09=09if (pgt->pte[pteb] & NVKM_VMM_PTE_SPARSE) {
+=09=09if (pgt->pte[pteb].s.sparse) {
 =09=09=09const u32 spti =3D pteb * sptn;
 =09=09=09const u32 sptc =3D ptes * sptn;
 =09=09=09/* The entire LPTE is marked as sparse, we need
@@ -386,7 +386,8 @@ nvkm_vmm_sparse_ptes(const struct nvkm_vmm_desc *desc,
 =09=09=09pgt->pde[ptei++] =3D NVKM_VMM_PDE_SPARSE;
 =09} else
 =09if (desc->type =3D=3D LPT) {
-=09=09memset(&pgt->pte[ptei], NVKM_VMM_PTE_SPARSE, ptes);
+=09=09union nvkm_pte_tracker sparse =3D { .s.sparse =3D 1 };
+=09=09memset(&pgt->pte[ptei].u, sparse.u, ptes);
 =09}
 }
=20
@@ -398,7 +399,7 @@ nvkm_vmm_sparse_unref_ptes(struct nvkm_vmm_iter *it, bo=
ol pfn, u32 ptei, u32 pte
 =09=09memset(&pt->pde[ptei], 0x00, sizeof(pt->pde[0]) * ptes);
 =09else
 =09if (it->desc->type =3D=3D LPT)
-=09=09memset(&pt->pte[ptei], 0x00, sizeof(pt->pte[0]) * ptes);
+=09=09memset(&pt->pte[ptei].u, 0x00, sizeof(pt->pte[0]) * ptes);
 =09return nvkm_vmm_unref_ptes(it, pfn, ptei, ptes);
 }
=20
@@ -445,9 +446,9 @@ nvkm_vmm_ref_hwpt(struct nvkm_vmm_iter *it, struct nvkm=
_vmm_pt *pgd, u32 pdei)
 =09=09 * the SPTEs on some GPUs.
 =09=09 */
 =09=09for (ptei =3D pteb =3D 0; ptei < pten; pteb =3D ptei) {
-=09=09=09bool spte =3D pgt->pte[ptei] & NVKM_VMM_PTE_SPTES;
+=09=09=09bool spte =3D !!pgt->pte[ptei].s.sptes;
 =09=09=09for (ptes =3D 1, ptei++; ptei < pten; ptes++, ptei++) {
-=09=09=09=09bool next =3D pgt->pte[ptei] & NVKM_VMM_PTE_SPTES;
+=09=09=09=09bool next =3D !!pgt->pte[ptei].s.sptes;
 =09=09=09=09if (spte !=3D next)
 =09=09=09=09=09break;
 =09=09=09}
@@ -461,7 +462,7 @@ nvkm_vmm_ref_hwpt(struct nvkm_vmm_iter *it, struct nvkm=
_vmm_pt *pgd, u32 pdei)
 =09=09=09} else {
 =09=09=09=09desc->func->unmap(vmm, pt, pteb, ptes);
 =09=09=09=09while (ptes--)
-=09=09=09=09=09pgt->pte[pteb++] |=3D NVKM_VMM_PTE_VALID;
+=09=09=09=09=09pgt->pte[pteb++].s.spte_valid =3D true;
 =09=09=09}
 =09=09}
 =09} else {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.h
index 4586a425dbe4..a6312a0e6b84 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -4,6 +4,15 @@
 #include <core/memory.h>
 enum nvkm_memory_target;
=20
+union nvkm_pte_tracker {
+=09u8 u;
+=09struct {
+=09=09u8 sparse:1;
+=09=09u8 spte_valid:1;
+=09=09u8 sptes:6;
+=09} s;
+};
+
 struct nvkm_vmm_pt {
 =09/* Some GPUs have a mapping level with a dual page tables to
 =09 * support large and small pages in the same address-range.
@@ -44,10 +53,7 @@ struct nvkm_vmm_pt {
 =09 *
 =09 * This information is used to manage LPTE state transitions.
 =09 */
-#define NVKM_VMM_PTE_SPARSE 0x80
-#define NVKM_VMM_PTE_VALID  0x40
-#define NVKM_VMM_PTE_SPTES  0x3f
-=09u8 pte[];
+=09union nvkm_pte_tracker pte[];
 };
=20
 typedef void (*nvkm_vmm_pxe_func)(struct nvkm_vmm *,
--=20
2.52.0

