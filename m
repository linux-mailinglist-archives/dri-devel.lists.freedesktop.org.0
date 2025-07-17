Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CDCB087A5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 10:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A9610E7E0;
	Thu, 17 Jul 2025 08:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LCd8B6UO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15C710E7E0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 08:10:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 08E5DA53C0A;
 Thu, 17 Jul 2025 08:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328D8C4CEE3;
 Thu, 17 Jul 2025 08:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752739837;
 bh=8pASZhtZ3qwCBE2BfGrchW2HH5fvQFVtEKNbivlGeOc=;
 h=From:Date:Subject:To:Cc:From;
 b=LCd8B6UOWhRnn9sqomulKaLC7A2aduun/R6o725gOLIY6r2Yww+39J8wFs//msTo1
 eijWfhK3VO6tiHMKL7t0bi2v0OffNr0w7W9gp1ONougjpY4JCR4qS/dxeoLep0r5Up
 +1E+OWe8ifHpexsKZ3m1Sjh2aOULqYuUaK8nc3KfoSjWyenYPWrPO2Et6SdYpf7LEB
 cEusR8DDl62Zx12qnz9MUZU3h5eVs7N7BUpi/El2cv0CzJ9xnt4epYAwsChvuTRcfM
 wmhqq57ajrr+S1L2hxL2Q8VGoRWz8RLP2QFI6BygrUgxQvnI9z73PlKGXlChUmc7og
 rigHAgjsIzTaQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 17 Jul 2025 10:10:14 +0200
Subject: [PATCH v3] Documentation: dma-buf: heaps: Add naming guidelines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-dma-buf-heap-names-doc-v3-1-d2dbb4b95ef6@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOWveGgC/4XNyw7CIBCF4VdpWDuGS2+68j2MCwpDS7TQgBJN0
 3eXdmNcGJf/SeabmUQMFiM5FjMJmGy03uUQu4KoQboewerchFNe0YpT0KOE7mFgQDmBkyNG0F6
 BYLxmUlJlsCb5eApo7HODz5fcg413H17bn8TW9S+ZGDCQnWCmKVt6QDxdMTi87X3oyWom/nFqV
 v90eHZaiaVgTal0Z76cZVnemc5LnQUBAAA=
X-Change-ID: 20250520-dma-buf-heap-names-doc-31261aa0cfe6
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bagas Sanjaya <bagasdotme@gmail.com>, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3304; i=mripard@kernel.org;
 h=from:subject:message-id; bh=8pASZhtZ3qwCBE2BfGrchW2HH5fvQFVtEKNbivlGeOc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkV6389ePzkyB+HKI9ilhcBig9Zmg7Z+vx/o3DhsIXXY
 q93Dt8fdUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJsE1jrC/bd2jy+TOuljxT
 3Tl3us39kifBf/1L/32vmklsvPczA0+p3faZ/tQgeF6SzYazf1zlpRnrdH4wn+3raJ7jx/fLaxb
 b9qpljDqRZr8bJJ46KHI93TBPueGc35fuxrBve1gdkhq753UAAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

We've discussed a number of times of how some heap names are bad, but
not really what makes a good heap name.

Let's document what we expect the heap names to look like.

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v3:
- Grammar, spelling fixes
- Remove the cacheable / uncacheable name suggestion
- Link to v2: https://lore.kernel.org/r/20250616-dma-buf-heap-names-doc-v2-1-8ae43174cdbf@kernel.org

Changes in v2:
- Added justifications for each requirement / suggestions
- Added a mention and example of buffer attributes
- Link to v1: https://lore.kernel.org/r/20250520-dma-buf-heap-names-doc-v1-1-ab31f74809ee@kernel.org
---
 Documentation/userspace-api/dma-buf-heaps.rst | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 535f49047ce6450796bf4380c989e109355efc05..3ee4e7961fe390ba356a2125d53b060546c3e4a6 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -21,5 +21,40 @@ following heaps:
    usually created either through the kernel commandline through the
    `cma` parameter, a memory region Device-Tree node with the
    `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
    `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
    might be called ``reserved``, ``linux,cma``, or ``default-pool``.
+
+Naming Convention
+=================
+
+``dma-buf`` heaps name should meet a number of constraints:
+
+- The name must be stable, and must not change from one version to the other.
+  Userspace identifies heaps by their name, so if the names ever change, we
+  would be likely to introduce regressions.
+
+- The name must describe the memory region the heap will allocate from, and
+  must uniquely identify it in a given platform. Since userspace applications
+  use the heap name as the discriminant, it must be able to tell which heap it
+  wants to use reliably if there's multiple heaps.
+
+- The name must not mention implementation details, such as the allocator. The
+  heap driver will change over time, and implementation details when it was
+  introduced might not be relevant in the future.
+
+- The name should describe properties of the buffers that would be allocated.
+  Doing so will make heap identification easier for userspace. Such properties
+  are:
+
+  - ``contiguous`` for physically contiguous buffers;
+
+  - ``protected`` for encrypted buffers not accessible the OS;
+
+- The name may describe intended usage. Doing so will make heap identification
+  easier for userspace applications and users.
+
+For example, assuming a platform with a reserved memory region located at the
+RAM address 0x42000000, intended to allocate video framebuffers, physically
+contiguous, and backed by the CMA kernel allocator, good names would be
+``memory@42000000-cacheable-contiguous`` or ``video@42000000``, but
+``cma-video`` wouldn't.

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250520-dma-buf-heap-names-doc-31261aa0cfe6

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

