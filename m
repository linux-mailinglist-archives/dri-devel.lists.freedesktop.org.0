Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5C66A7D67
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 10:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA8110E3E3;
	Thu,  2 Mar 2023 09:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CB310E27A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 09:15:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 039DA61542;
 Thu,  2 Mar 2023 09:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B4DC4339B;
 Thu,  2 Mar 2023 09:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677748522;
 bh=8K3T0eGMBt3hh+2gQfXVpFukgUTWqTR1QtOD5ygv6qI=;
 h=From:To:Cc:Subject:Date:From;
 b=LZv3sL6gbO79gUyYTbSgk4kJ9Y8hfmWsypb9bVgxwiHDHF76XMJm6VNJnSDM6W6cx
 k9d7Mq37O+Lyavj6ws7ykv1dY1a5ssO9Z6cDoFJNGCydaP1A4x3ohx07FR5iYkW+jq
 Adwhth+D9ogdwSJbZH3OtpCFA9sUgA1gfR3DsGjp1Q5+qHhqwIJrSwPuBZtMw8L1LG
 FcwyBApLoFiJXx6zG1vTziMEtk9sA4lULw9K6pJ+64VGb5xFyhsTUD6JPg3F+DfPo8
 0eOmUx1tEgyaK5mxqAmjWQI9RapUTkzV0KEt6BdvPAh0fyoVjbhijHJbRiv/Ykg9yi
 l8H6REXtxCSkw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] habanalabs: unify err log of hw-fini failure in dirty
 state
Date: Thu,  2 Mar 2023 11:15:16 +0200
Message-Id: <20230302091517.14896-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dafna Hirschfeld <dhirschfeld@habana.ai>

print more informative message when failing in dirty state

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 58e3bffb8c25..99af319cd023 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -2896,7 +2896,7 @@ static int gaudi2_early_init(struct hl_device *hdev)
 		dev_dbg(hdev->dev, "H/W state is dirty, must reset before initializing\n");
 		rc = hdev->asic_funcs->hw_fini(hdev, true, false);
 		if (rc) {
-			dev_err(hdev->dev, "failed to reset HW during early init (%d)\n", rc);
+			dev_err(hdev->dev, "failed to reset HW in dirty state (%d)\n", rc);
 			goto pci_fini;
 		}
 	}
-- 
2.39.2

