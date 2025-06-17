Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0046ADCB5C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 14:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FB010E444;
	Tue, 17 Jun 2025 12:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lhZ/y8oV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495C910E444
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 12:25:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 81C9EA501DF;
 Tue, 17 Jun 2025 12:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FF6C4CEE3;
 Tue, 17 Jun 2025 12:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750163149;
 bh=aoNET68UJIiLHYzCWITUHaaHkuJoHm/VQY7CwpH5NQw=;
 h=From:Subject:Date:To:Cc:From;
 b=lhZ/y8oVCPQyDybARc9LQ/ZtkG8+ESnzbX40CQqwTEW8F1VrJVAs2VNyFB+LcPwTN
 BuVDDoVAGMnXpDtVqRFVfLW/BWMNdjV6+I8MHQA26MHUkmi6f1nxLri8kGUemQogX3
 ZjBlJmS4yD0k7xwww+1ihUoJlspN9UZla6vZukSPtMIc8NEKGSPk5Z5rAP1rBWsHhY
 kbTg1ssV4t+gkxNQxDRQOrMWhzSkFoAtDm8Jri6ckVq4RFRdQkjq7i4iTworFioluh
 EHR6GNGonvywjhZAstchFCGYE5WXom0gyT5KEJZoUHHk4M7tGl/OKLOnFl+tH8dewq
 7VpmW1naLviqA==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v5 0/2] dma-buf: heaps: Support carved-out heaps
Date: Tue, 17 Jun 2025 14:25:39 +0200
Message-Id: <20250617-dma-buf-ecc-heap-v5-0-0abdc5863a4f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMNeUWgC/33N3U7DMAyG4VuZcoyR7Tgb5Yj7QDvIj7NGQDulr
 AJNvXeySQjQKg7fT/Ljs5m0Fp3M4+Zsqs5lKuPQwt1tTOz9cFAoqbVhZEFHDtKbh3DKoDFCr/4
 I/OAtUeLYiZp2dqyay8eVfN637sv0PtbP64eZLus/2EyA4CSGkFA6R/T0onXQ1/uxHsxFm/lbc
 ChIKwI3AcXmhLj15PONYH8LuxXBNqHbxZTs1rvM3Y0gP4JjXBEECEJipUwhCMc/wrIsX+uH3YR
 3AQAA
X-Change-ID: 20240515-dma-buf-ecc-heap-28a311d2c94e
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3003; i=mripard@kernel.org;
 h=from:subject:message-id; bh=aoNET68UJIiLHYzCWITUHaaHkuJoHm/VQY7CwpH5NQw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmBcSf8lUxWPr39QW9m2N5G/bJYdkHZNd805rH/d7l1+
 HTjpiuSHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi3baMteIrVhzjql6pvG9D
 Wsl0b+FPh9wOnFnMl7L8v6Ob/xLb+QdfzGFJmfq1ZEHM88lbPVOfqjM2rL47XbCaQ0Voe9S1sET
 +aAezgxtjj0760TnlScgvl6kze/y4JtxcE35qsopg+rJzao9iAA==
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

This series is the follow-up of the discussion that John and I had some
time ago here:

https://lore.kernel.org/all/CANDhNCquJn6bH3KxKf65BWiTYLVqSd9892-xtFDHHqqyrroCMQ@mail.gmail.com/

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

Thus, even though the uAPI part of it has been dropped in this second
version, we still need a driver to create heaps out of carved-out memory
regions. In addition to the original usecase, a similar driver can be
found in BSPs from most vendors, so I believe it would be a useful
addition to the kernel.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
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
      dt-bindings: reserved-memory: Introduce carved-out memory region binding
      dma-buf: heaps: Introduce a new heap for reserved memory

 .../bindings/reserved-memory/carved-out.yaml       |  49 +++
 drivers/dma-buf/heaps/Kconfig                      |   8 +
 drivers/dma-buf/heaps/Makefile                     |   1 +
 drivers/dma-buf/heaps/carveout_heap.c              | 362 +++++++++++++++++++++
 4 files changed, 420 insertions(+)
---
base-commit: d076bed8cb108ba2236d4d49c92303fda4036893
change-id: 20240515-dma-buf-ecc-heap-28a311d2c94e

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

