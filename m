Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDDF3F6744
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 19:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280B68976D;
	Tue, 24 Aug 2021 17:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296EE8976D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 17:31:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPv6:2600:8800:8c06:1000::c8f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 109241F41A29;
 Tue, 24 Aug 2021 18:31:21 +0100 (BST)
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] drm/panfrost: Handle non-aligned lock addresses
Date: Tue, 24 Aug 2021 13:30:28 -0400
Message-Id: <20210824173028.7528-5-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210824173028.7528-1-alyssa.rosenzweig@collabora.com>
References: <20210824173028.7528-1-alyssa.rosenzweig@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

When locking memory, the base address is rounded down to the nearest
page. The current code does not adjust the size in this case,
truncating the lock region:

	Input:      [----size----]
	Round: [----size----]

To fix the truncation, extend the lock region by the amount rounded off.

	Input:      [----size----]
	Round: [-------size------]

This bug is difficult to hit under current assumptions: since the size
of the lock region is stored as a ceil(log2), the truncation must cause
us to cross a power-of-two boundary. This is possible, for example if
the caller tries to lock 65535 bytes starting at iova 0xCAFE0010. The
existing code rounds down the iova to 0xCAFE0000 and rounds up the lock
region to 65536 bytes, locking until 0xCAFF0000. This fails to lock the
last 15 bytes.

In practice, the current callers pass PAGE_SIZE aligned inputs, avoiding
the bug. Therefore this doesn't need to be backported. Still, that's a
happy accident and not a precondition of lock_region, so we let's do the
right thing to future proof.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Reported-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index dfe5f1d29763..14be32497ec3 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -63,6 +63,9 @@ static void lock_region(struct panfrost_device *pfdev, u32 as_nr,
 	u8 region_width;
 	u64 region = iova & PAGE_MASK;
 
+	/* After rounding the address down, extend the size to lock the end. */
+	size += (region - iova);
+
 	/* The size is encoded as ceil(log2) minus(1), which may be calculated
 	 * with fls. The size must be clamped to hardware bounds.
 	 */
-- 
2.30.2

