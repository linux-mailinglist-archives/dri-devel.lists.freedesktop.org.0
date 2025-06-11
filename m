Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E24AD5258
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 12:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3634410E614;
	Wed, 11 Jun 2025 10:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dcEwfu98";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB22910E614
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 10:44:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1614A629E6;
 Wed, 11 Jun 2025 10:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FF4C4CEFC;
 Wed, 11 Jun 2025 10:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749638647;
 bh=bHrCHOgwGjRWRvrwMBlrDMz/V9EnLCSbaj497+WUi0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dcEwfu98nkqqSB4o90Y1qUZh4uFBn2FsNk7WKVDGMNQjYKUtIx46sJdEH75+a+wjt
 1IZdXMLJmtD8V9Y6ErkWJbKuuFqcdFF5/ZpokfbIrY4WQVRyE8HcUAoMqRAFrKJAuj
 N0L9EPAXBGjCVnp0oe2ijFYQuAnZP0LYObKfzD8T+o7rfO01cuGbT2ED6XjX5qUBwp
 jEJPI48YsSRsHZf/om8yqplMfUWG5aH1BFGy/QFE2da5ZJ2cNqClCPjBe/UjLhjgG7
 DbpP6VgrVsfW2eqY3cBqIOzP9KD4naEdzkgP+lBEtbSydY6w5adZFoUvD4dudBs2WR
 iTRpojUVDiIuA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH] gpu: ipu-v3: Use dev_fwnode()
Date: Wed, 11 Jun 2025 12:43:35 +0200
Message-ID: <20250611104348.192092-7-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611104348.192092-1-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
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

irq_domain_create_simple() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of
using of_node with of_fwnode_handle().

So use the dev_fwnode() helper.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/ipu-v3/ipu-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index 333f36e0a715..521d7ec10d85 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -1169,7 +1169,7 @@ static int ipu_irq_init(struct ipu_soc *ipu)
 	};
 	int ret, i;
 
-	ipu->domain = irq_domain_create_linear(of_fwnode_handle(ipu->dev->of_node), IPU_NUM_IRQS,
+	ipu->domain = irq_domain_create_linear(dev_fwnode(ipu->dev), IPU_NUM_IRQS,
 					       &irq_generic_chip_ops, ipu);
 	if (!ipu->domain) {
 		dev_err(ipu->dev, "failed to add irq domain\n");
-- 
2.49.0

