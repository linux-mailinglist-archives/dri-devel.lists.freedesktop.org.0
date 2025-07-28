Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE30FB1363F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 10:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACAC10E4A1;
	Mon, 28 Jul 2025 08:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OoKp2O/+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06FA10E4A1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 08:21:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8BEC243D35;
 Mon, 28 Jul 2025 08:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF8CC4CEE7;
 Mon, 28 Jul 2025 08:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753690890;
 bh=ZRY+6/nyvo8KZTIrleYpG4C+tuqfPfTS1XAX1p+YB1E=;
 h=From:Date:Subject:To:Cc:From;
 b=OoKp2O/+xlcLqP/N6dy8ZajsSmZVl3xEi/eDCf6EICLzSJIRkzdNTNMcLcabe6HYM
 Wl73qYRFxze8J0QfVc0j7G2E3mOirVOCEymjit4+XbfP6f6DUu/QOe/SQBXLHMNoX4
 JcbmVJvM/hluXeqm8WHYL5pnA+b73iUi5dVggZSmO0mDNKiD1p9sZzUbg4efIyvn2r
 GVJNaAyqeM0nzikONPvHoFq4HF2LuvHclzqfPfp91jDakF3IV0B/7a/JepYjQcE0cB
 YFZuvdOFoE0ZD2Yjan4ZKW/t2r3Mkzc+UFjx/CVBkSzyxQz3D9O535Qh/mPhyH84fH
 Z66B3s5fs1wog==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 28 Jul 2025 10:21:23 +0200
Subject: [PATCH v4] Documentation: dma-buf: heaps: Add naming guidelines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-dma-buf-heap-names-doc-v4-1-f73f71cf0dfd@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAIzh2gC/4XNTQrCMBCG4auUrB3JJGnauvIe4iJpJjZof0i0K
 NK7G92IiLh8P5hn7ixRDJTYprizSHNIYRxyqFXB2s4MB4LgcjPBRclLwcH1BuzFQ0dmgsH0lMC
 NLUgUGo3hrSfN8vEUyYfrC97tc3chncd4e/2Z8bn+JWcEBGMl+krVvCHaHikOdFqP8cCe5izej
 kb90xHZqQ0piZVqnfVfjnw7FVY/HZkdJ5y1yjYlef3hLMvyAJIqzF5NAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3494; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ZRY+6/nyvo8KZTIrleYpG4C+tuqfPfTS1XAX1p+YB1E=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBntxmzSnxRahTZl7NMv3Fwbs2rWr6tvpB9L3Ot37H3ff
 9r01IyZHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiWp6MdeaW+6Y1TNon/W3a
 nFWbIw+EBjy+sd88PW3urkWf1fy1JrAnMKw/LrWsZ/ej2+tvvlbl1GCs95m7f+qtqKVTLi/08uR
 RXrF9zZZf+sdC5fITl0bk9Mou3T4hvsZ5ZbJs2ZpH1+vV1NlTAQ==
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

Reviewed-by: Andrew Davis <afd@ti.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v4:
- Dropped *all* the cacheable mentions
- Link to v3: https://lore.kernel.org/r/20250717-dma-buf-heap-names-doc-v3-1-d2dbb4b95ef6@kernel.org

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
index 535f49047ce6450796bf4380c989e109355efc05..1ced2720f929432661182f1a3a88aa1ff80bd6af 100644
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
+For example, assuming a platform with a reserved memory region located
+at the RAM address 0x42000000, intended to allocate video framebuffers,
+physically contiguous, and backed by the CMA kernel allocator, good
+names would be ``memory@42000000-contiguous`` or ``video@42000000``, but
+``cma-video`` wouldn't.

---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250520-dma-buf-heap-names-doc-31261aa0cfe6

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

