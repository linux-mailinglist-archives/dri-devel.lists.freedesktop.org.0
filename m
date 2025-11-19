Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1DEC6D5E9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 09:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C2F10E22F;
	Wed, 19 Nov 2025 08:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DASnW1+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9010210E22F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 08:18:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C240660126;
 Wed, 19 Nov 2025 08:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA536C19421;
 Wed, 19 Nov 2025 08:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763540306;
 bh=Gz76KteOHGACxs01bVq2qwe5GOER8j8m1NfJIxZfPg4=;
 h=From:To:Cc:Subject:Date:From;
 b=DASnW1+EOi4tO0dqPI1xv8mRpi2ke18J0YHv3rIgpxBK3R6fla7ktMRmJsh1kLoiv
 KuE40QB1/rKnCGKWamWoSrmyzg5mHXVlziXjzb7F1bSfekisI2pCOioDuIaQ7dS4PX
 qjhdghdXXt3ulSOEyC0dT8dAbUixd54g4Twt+NArYq/ge9v61F6NayhhV6bjuj1QLg
 Zka0rP02BJdppHU9hLMU8KGY9f0t4JL2GlT/fkIo9t1M6aUO/Cv4ITKV4kydt3A+E8
 H/AaIxYv1wbTxurahe4jYAR+Yo5rCwLOhxI517YsYh7NmymS24MHHuCMyLFYmT69No
 CzoTU1H/nhvKA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: p.zabel@pengutronix.de
Cc: linux-kernel@vger.kernel.org, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] gpu: ipu-v3: Use dev_fwnode()
Date: Wed, 19 Nov 2025 09:18:20 +0100
Message-ID: <20251119081820.818891-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.51.1
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Link: https://lore.kernel.org/all/4bc0e1ca-a523-424a-8759-59e353317fba@kernel.org/
---
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
2.51.1

