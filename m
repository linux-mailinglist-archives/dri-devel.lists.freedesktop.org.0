Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9905FBD8EC1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F6310E201;
	Tue, 14 Oct 2025 11:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oEFPd/Dl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F69F10E201
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760440120; x=1791976120;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=8s75xFdd0oDqJ0dSvsuSScugHJ6Ya2YTqnDg/azAz1M=;
 b=oEFPd/DlAulqGG/l1HXcGPAG1uZwOYC+jWq4xqZubtxYAQy6cfqlf/+a
 dsUOIBagWHAJLpSoAYsGTdkaa+JTqmXLgnwvAjNxi7D3Owo+N+gvrClid
 Nv807mVa+lD5BdBRveUFI84cfvhyfeLLOxkpjrl4eOKl+dpfHYxyOyeYb
 BYFHSqV8HcvaN1XiDQF8B480R1tqN11kujK5Vljt7XQoAFyw4TE/OsiDc
 VDim9oE9GUibDYyPG9366KEqil2SCVko7/+E2/RFMQBq0xC1V/IUsS83S
 xWTOY/pyJX5SsWkk9jfxx9S/aII9gJItosl5F/QMylppRQoQduUcmC0bm g==;
X-CSE-ConnectionGUID: JxWtYU9ORsaobgJUlChLcg==
X-CSE-MsgGUID: 1EIoVucZQfOMUwDJ65zDtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66421918"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66421918"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 04:08:39 -0700
X-CSE-ConnectionGUID: HYiqkWH+QRG/1qqpt/E3Tg==
X-CSE-MsgGUID: 0dCP/25/QXq8LpvRJ8AzZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="186109913"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.172])
 ([10.245.244.172])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 04:08:36 -0700
Message-ID: <13cf7040ec69f3e5f8ed7df4230a56db93bb6b73.camel@linux.intel.com>
Subject: [PATCH v2 2/2] drm/xe: Allow mixed mappings for userptr
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Date: Tue, 14 Oct 2025 13:08:35 +0200
In-Reply-To: <20251010104149.72783-1-thomas.hellstrom@linux.intel.com>
References: <20251010104149.72783-1-thomas.hellstrom@linux.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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

+ dri-devel.

From: Matthew Brost <matthew.brost@intel.com>

Compute kernels often issue memory copies immediately after completion.
If the memory being copied is an SVM pointer that was faulted into the
device and then bound via userptr, it is undesirable to move that
memory. Worse, if userptr is mixed between system and device memory,
the
bind operation may be rejected.

Xe already has the necessary plumbing to support userptr with mixed
mappings. This update modifies GPUSVM's get_pages to correctly locate
pages in such mixed mapping scenarios.

v2:
- Rebase (Thomas Hellstr=C3=B6m)
v3:
- Remove Fixes tag.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
=C2=A0drivers/gpu/drm/drm_gpusvm.c=C2=A0=C2=A0=C2=A0 | 6 ++++--
=C2=A0drivers/gpu/drm/xe/xe_userptr.c | 4 +++-
=C2=A0include/drm/drm_gpusvm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
4 ++++
=C2=A03 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c
b/drivers/gpu/drm/drm_gpusvm.c
index cb906765897e..73e550c8ff8c 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1363,7 +1363,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
*gpusvm,
=C2=A0		order =3D drm_gpusvm_hmm_pfn_to_order(pfns[i], i,
npages);
=C2=A0		if (is_device_private_page(page) ||
=C2=A0		=C2=A0=C2=A0=C2=A0 is_device_coherent_page(page)) {
-			if (zdd !=3D page->zone_device_data && i > 0) {
+			if (!ctx->allow_mixed &&
+			=C2=A0=C2=A0=C2=A0 zdd !=3D page->zone_device_data && i > 0) {
=C2=A0				err =3D -EOPNOTSUPP;
=C2=A0				goto err_unmap;
=C2=A0			}
@@ -1399,7 +1400,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
*gpusvm,
=C2=A0		} else {
=C2=A0			dma_addr_t addr;
=C2=A0
-			if (is_zone_device_page(page) || pagemap) {
+			if (is_zone_device_page(page) ||
+			=C2=A0=C2=A0=C2=A0 (pagemap && !ctx->allow_mixed)) {
=C2=A0				err =3D -EOPNOTSUPP;
=C2=A0				goto err_unmap;
=C2=A0			}
diff --git a/drivers/gpu/drm/xe/xe_userptr.c
b/drivers/gpu/drm/xe/xe_userptr.c
index f16e92cd8090..0d9130b1958a 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -3,6 +3,7 @@
=C2=A0 * Copyright =C2=A9 2025 Intel Corporation
=C2=A0 */
=C2=A0
+#include "xe_svm.h"
=C2=A0#include "xe_userptr.h"
=C2=A0
=C2=A0#include <linux/mm.h>
@@ -54,7 +55,8 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma
*uvma)
=C2=A0	struct xe_device *xe =3D vm->xe;
=C2=A0	struct drm_gpusvm_ctx ctx =3D {
=C2=A0		.read_only =3D xe_vma_read_only(vma),
-		.device_private_page_owner =3D NULL,
+		.device_private_page_owner =3D xe_svm_devm_owner(xe),
+		.allow_mixed =3D true,
=C2=A0	};
=C2=A0
=C2=A0	lockdep_assert_held(&vm->lock);
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index b92faa9a26b2..632e100e6efb 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -235,6 +235,9 @@ struct drm_gpusvm {
=C2=A0 * @read_only: operating on read-only memory
=C2=A0 * @devmem_possible: possible to use device memory
=C2=A0 * @devmem_only: use only device memory
+ * @allow_mixed: Allow mixed mappings in get pages. Mixing between
system and
+ *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 single dpagemap is supported, mixing between multiple
dpagemap
+ *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 is unsupported.
=C2=A0 *
=C2=A0 * Context that is DRM GPUSVM is operating in (i.e. user arguments).
=C2=A0 */
@@ -246,6 +249,7 @@ struct drm_gpusvm_ctx {
=C2=A0	unsigned int read_only :1;
=C2=A0	unsigned int devmem_possible :1;
=C2=A0	unsigned int devmem_only :1;
+	unsigned int allow_mixed :1;
=C2=A0};
=C2=A0
=C2=A0int drm_gpusvm_init(struct drm_gpusvm *gpusvm,


