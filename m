Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D7FADB528
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 17:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCAA891D1;
	Mon, 16 Jun 2025 15:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HyaUN2wQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABA7891D1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 15:21:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4EEEF6154C;
 Mon, 16 Jun 2025 15:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C703C4CEEA;
 Mon, 16 Jun 2025 15:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750087318;
 bh=F/QyudQDY/anQvkRN0MCoaO7t8IhTLucluA7Fcylo0Y=;
 h=From:Date:Subject:To:Cc:From;
 b=HyaUN2wQUnvOmZj06/ZeoyJY0N8JQOKU8TwCyxXPEu9e4mSBG+JOffhb7m1PWDD3r
 JdbTuYCAKkT9Q0jw5gaBI4yco6Xj4u5IuzpTrNrj6KhYTa61/2ZzgV5mUbKOpyTDpg
 z81uQHC3ElzB4UY8M1TDIS+9tI5fVfsrxLT3EdEhI+PWm0hkh/9l3t35WYhMfx4GnI
 7nnlQnqyGSx/pJrikNehMBNzbkd2Gh1OZyeFryN34Wyy9HTnqV6Tz3rc9Z5yME7Dmc
 jIaMvSXbCWVfQMnQZhIBPpai/P2wLfTd8Bp/+WIQCvRqtuQT1MuV479EdzbmuWKyFP
 hxOtBqthEu6Bw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 16 Jun 2025 17:21:46 +0200
Subject: [PATCH v2] Documentation: dma-buf: heaps: Add naming guidelines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-dma-buf-heap-names-doc-v2-1-8ae43174cdbf@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIk2UGgC/4WNTQ6CMBBGr0Jm7Zi2CP6svIdhMZQpbZSWtEo0p
 He3cgGX7yXf+1ZIHB0nuFQrRF5ccsEXULsKtCU/MrqhMCihGtEogcNE2L8MWqYZPU2ccAgaa6l
 aSSS04RbKeI5s3HsL37rC1qVniJ/tZ5E/+ze5SJRIfS3N8XASZ+brnaPnxz7EEbqc8xceLSYKv
 QAAAA==
X-Change-ID: 20250520-dma-buf-heap-names-doc-31261aa0cfe6
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3203; i=mripard@kernel.org;
 h=from:subject:message-id; bh=F/QyudQDY/anQvkRN0MCoaO7t8IhTLucluA7Fcylo0Y=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkBZpMuGPxdwfn04PlNCc0vnt5KLJi0N0WrOZFHdNc1v
 c+rHiws7pjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATKTjD2LB7cvExg2L+mYve
 7jDX3zlhDdvGXDlmu1s3DbqOz36kv9M4xV9IVSSuzfnX3k+zyq7trmSslVL+tuqtbqvTNm7t5Xe
 eOazxXBj46YvhTVnR1pzrixXs7wZfzv9aOrn/6JrOfx8nb/3tDAA=
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
Changes in v2:
- Added justifications for each requirement / suggestions
- Added a mention and example of buffer attributes
- Link to v1: https://lore.kernel.org/r/20250520-dma-buf-heap-names-doc-v1-1-ab31f74809ee@kernel.org
---
 Documentation/userspace-api/dma-buf-heaps.rst | 38 +++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 535f49047ce6450796bf4380c989e109355efc05..835ad1c3a65bc07b6f41d387d85c57162909e859 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -21,5 +21,43 @@ following heaps:
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
+- That name must be stable, and must not change from one version to the
+  other. Userspace identifies heaps by their name, so if the names ever
+  changes, we would be likely to introduce regressions.
+
+- That name must describe the memory region the heap will allocate from,
+  and must uniquely identify it in a given platform. Since userspace
+  applications use the heap name as the discriminant, it must be able to
+  tell which heap it wants to use reliably if there's multiple heaps.
+
+- That name must not mention implementation details, such as the
+  allocator. The heap driver will change over time, and implementation
+  details when it was introduced might not be relevant in the future.
+
+- The name should describe properties of the buffers that would be
+  allocated. Doing so will make heap identification easier for
+  userspace. Such properties are:
+
+  - ``cacheable`` / ``uncacheable`` for buffers with CPU caches enabled
+    or disabled;
+
+  - ``contiguous`` for physically contiguous buffers;
+
+  - ``protected`` for encrypted buffers not accessible the OS;
+
+- The name may describe intended usage. Doing so will make heap
+  identification easier for userspace applications and users.
+
+For example, assuming a platform with a reserved memory region located
+at the RAM address 0x42000000, intended to allocate video framebuffers,
+physically contiguous, and backed by the CMA kernel allocator. Good
+names would be ``memory@42000000-cacheable-contiguous`` or
+``video@42000000``, but ``cma-video`` wouldn't.

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250520-dma-buf-heap-names-doc-31261aa0cfe6

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

