Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A88AFE93D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 14:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A1B10E08F;
	Wed,  9 Jul 2025 12:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SU8qJ591";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F355E10E08F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 12:45:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 806045C6417;
 Wed,  9 Jul 2025 12:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE565C4CEEF;
 Wed,  9 Jul 2025 12:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752065104;
 bh=5ig93j1gHmVqigZVEEovbc0sfYjFNVqIz+vVSrVJ/jo=;
 h=From:Subject:Date:To:Cc:From;
 b=SU8qJ591v3ZuHKWkIDNsGPC/TsUVy5S48YTk8I+wA/R98cRRp92a8dBLwXVe4UUQX
 h62V/N4GwCQnBqvMRN/dhOkcZT7Ssfa5mggfF34/0QPOqfEmWo15hH3XTHDCU3wiCv
 Y6nFOpZXhmwRDr5eeybDpTrDAlJ1IaiOkbNfKDKzdx+VyQnto48W5ciawaeUsIhJpU
 yDA6aEdBir32pT6DCYAmKoojkdWjZ811ES/KwYqd6iRccGhxFvUMJsmphaTBKEF8KY
 lEtAOdiJRJQu++19on2WBnLmlaE8lMvX0qRuyl7dlwb3WeSSmgMKEoXeNZiQeAFgpn
 y6+6c80EJRdVg==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v6 0/2] dma-buf: heaps: Create a CMA heap for each CMA
 reserved region
Date: Wed, 09 Jul 2025 14:44:50 +0200
Message-Id: <20250709-dma-buf-ecc-heap-v6-0-dac9bf80f35d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEJkbmgC/33RyU7DMBAG4FeJfMaRx1uaCqG+B+LgZdKYkqbYa
 QSq+u44KaigRBzHkr9Z/gtJGAMmsi0uJOIYUuiPudAPBXGtOe6RBp9rwhmXTIGivjPUnhuKztE
 WzYnyjREAnrtaIsnfThGb8DGTzy+5bkMa+vg5dxhhev0HG4EyqqSz1jNZK4DdAeMR38o+7smkj
 fxHUEwyWBF4FpgUjWdMGzDNQhC/hWpFEFmoK+e90EY1vF4I8i4ozlYESYFazxEasFZytxDUXdC
 wNoOatjDWO7XRwsi/W1xvZ474fs6BDbdbkw5TMnNg2+Lxm2YggAsooeJS8yqP9XrIqZq0i+hbM
 5Su756m1KxJSHPRhWFbjLoETaNTudX1C/BYCfAjAgAA
X-Change-ID: 20240515-dma-buf-ecc-heap-28a311d2c94e
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4178; i=mripard@kernel.org;
 h=from:subject:message-id; bh=5ig93j1gHmVqigZVEEovbc0sfYjFNVqIz+vVSrVJ/jo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBl5KT5Hp6VN1J1s9/a/8haBzfaebxOsuz9PEsiwblQvt
 vuxue5vx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhIrCtjfeD3N8X7VM9EHM05
 Jl/BWOmovOeVced54b2zy+tUznS/jS9Jq17zR7H35r4cp4uS0/9mMzYsKAxinxtWNtO6+rW+/f/
 mhETDhTI+Eidjj/zu2bnbeRrH02e/PVaunM4VG3bQ2s5odSwA
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

Hi,

Here's another attempt at supporting user-space allocations from a
specific carved-out reserved memory region.

The initial problem we were discussing was that I'm currently working on
a platform which has a memory layout with ECC enabled. However, enabling
the ECC has a number of drawbacks on that platform: lower performance,
increased memory usage, etc. So for things like framebuffers, the
trade-off isn't great and thus there's a memory region with ECC disabled
to allocate from for such use cases.

After a suggestion from John, I chose to first start using heap
allocations flags to allow for userspace to ask for a particular ECC
setup. This is then backed by a new heap type that runs from reserved
memory chunks flagged as such, and the existing DT properties to specify
the ECC properties.

After further discussion, it was considered that flags were not the
right solution, and relying on the names of the heaps would be enough to
let userspace know the kind of buffer it deals with.

Thus, even though the uAPI part of it had been dropped in this second
version, we still needed a driver to create heaps out of carved-out memory
regions. In addition to the original usecase, a similar driver can be
found in BSPs from most vendors, so I believe it would be a useful
addition to the kernel.

Some extra discussion with Rob Herring [1] came to the conclusion that
some specific compatible for this is not great either, and as such an
new driver probably isn't called for either.

Some other discussions we had with John [2] also dropped some hints that
multiple CMA heaps might be a good idea, and some vendors seem to do
that too.

So here's another attempt that doesn't affect the device tree at all and
will just create a heap for every CMA reserved memory region.

It also falls nicely into the current plan we have to support cgroups in
DRM/KMS and v4l2, which is an additional benefit.

Let me know what you think,
Maxime

1: https://lore.kernel.org/all/20250707-cobalt-dingo-of-serenity-dbf92c@houat/
2: https://lore.kernel.org/all/CANDhNCroe6ZBtN_o=c71kzFFaWK-fF5rCdnr9P5h1sgPOWSGSw@mail.gmail.com/

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v6:
- Drop the new driver and allocate a CMA heap for each region now
- Dropped the binding
- Rebased on 6.16-rc5
- Link to v5: https://lore.kernel.org/r/20250617-dma-buf-ecc-heap-v5-0-0abdc5863a4f@kernel.org

Changes in v5:
- Rebased on 6.16-rc2
- Switch from property to dedicated binding
- Link to v4: https://lore.kernel.org/r/20250520-dma-buf-ecc-heap-v4-1-bd2e1f1bb42c@kernel.org

Changes in v4:
- Rebased on 6.15-rc7
- Map buffers only when map is actually called, not at allocation time
- Deal with restricted-dma-pool and shared-dma-pool
- Reword Kconfig options
- Properly report dma_map_sgtable failures
- Link to v3: https://lore.kernel.org/r/20250407-dma-buf-ecc-heap-v3-0-97cdd36a5f29@kernel.org

Changes in v3:
- Reworked global variable patch
- Link to v2: https://lore.kernel.org/r/20250401-dma-buf-ecc-heap-v2-0-043fd006a1af@kernel.org

Changes in v2:
- Add vmap/vunmap operations
- Drop ECC flags uapi
- Rebase on top of 6.14
- Link to v1: https://lore.kernel.org/r/20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org

---
Maxime Ripard (2):
      dma/contiguous: Add helper to test reserved memory type
      dma-buf: heaps: cma: Create CMA heap for each CMA reserved region

 drivers/dma-buf/heaps/cma_heap.c | 52 +++++++++++++++++++++++++++++++++++++++-
 include/linux/dma-map-ops.h      | 13 ++++++++++
 kernel/dma/contiguous.c          |  7 ++++++
 3 files changed, 71 insertions(+), 1 deletion(-)
---
base-commit: 47633099a672fc7bfe604ef454e4f116e2c954b1
change-id: 20240515-dma-buf-ecc-heap-28a311d2c94e
prerequisite-message-id: <20250610131231.1724627-1-jkangas@redhat.com>
prerequisite-patch-id: bc44be5968feb187f2bc1b8074af7209462b18e7
prerequisite-patch-id: f02a91b723e5ec01fbfedf3c3905218b43d432da
prerequisite-patch-id: e944d0a3e22f2cdf4d3b3906e5603af934696deb

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

