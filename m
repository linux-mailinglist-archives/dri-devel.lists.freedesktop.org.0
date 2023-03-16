Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCC36BCE5E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 12:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF2110E0A8;
	Thu, 16 Mar 2023 11:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E36110E0A8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 11:36:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED28161FE9;
 Thu, 16 Mar 2023 11:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C410C433EF;
 Thu, 16 Mar 2023 11:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678966608;
 bh=6pHbpnMw9YGDjM+m2mdoSxiaBfTRG6jNg88olV+KRfw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XgMVG3g2KN8+sL0loKcBdSGB/tcNgTG2qa1ypRzx1+31k1x/9UCYlyMD6SnpVVhHB
 VxvOc3HF+YwQBZ0rUweOCXOeNgwkVk5CuII3QywTX9rL35xkMVf4vIb8CYeWazv3HU
 qr5E1x7zOKOHsYxoqnZXqYbKSEP/B2m2A/cNl3SLAgRvfM5hMcZ9NgEwB1KpmK95uv
 PLtTXH5D9mOskdaLv94xasL7ZZNyI7J2Do0L01w6/2Tzt/N8Gw/ijKq825AemJAzL3
 XWUp6njucQbV0hQ8jdQ9xAs/AdafwozMKumDWJPbVPTTUae29C4x84NSXc2XdhlPz9
 YqwLS/1Sm7pOA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/10] accel/habanalabs: increase reset poll timeout
Date: Thu, 16 Mar 2023 13:36:33 +0200
Message-Id: <20230316113640.499267-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230316113640.499267-1-ogabbay@kernel.org>
References: <20230316113640.499267-1-ogabbay@kernel.org>
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
Cc: Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ofir Bitton <obitton@habana.ai>

Due to a firmware bug we need to increase reset poll timeout
or else we will timeout in secured environments.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index cb679365240e..652f12a058c7 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -23,7 +23,8 @@
 #define GAUDI2_DMA_POOL_BLK_SIZE		SZ_256		/* 256 bytes */
 
 #define GAUDI2_RESET_TIMEOUT_MSEC		2000		/* 2000ms */
-#define GAUDI2_RESET_POLL_TIMEOUT_USEC		50000		/* 50ms */
+
+#define GAUDI2_RESET_POLL_TIMEOUT_USEC		500000		/* 500ms */
 #define GAUDI2_PLDM_HRESET_TIMEOUT_MSEC		25000		/* 25s */
 #define GAUDI2_PLDM_SRESET_TIMEOUT_MSEC		25000		/* 25s */
 #define GAUDI2_PLDM_RESET_POLL_TIMEOUT_USEC	3000000		/* 3s */
-- 
2.40.0

