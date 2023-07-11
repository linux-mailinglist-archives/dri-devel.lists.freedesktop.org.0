Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AADA74EC69
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 13:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827E410E375;
	Tue, 11 Jul 2023 11:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAC610E371
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 11:12:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 50ACD6147B;
 Tue, 11 Jul 2023 11:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02CAC433C9;
 Tue, 11 Jul 2023 11:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689073958;
 bh=WcW1OApAnq8dLkPnAdSlkE3sEmUbfEIEAAf0rJTUC08=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nMiRzPofLHdgv80BBxzqrOu/1/uUa3mhnws7PtWtnOh4PKKrWG+Xcu9aMT8crHLxy
 gtVNBlUdNcppAHhIQe2Dd1U0+JmZ2fhCAVXAP1nentmMN52HOOEAsXOE4R3XPrLQu3
 jGn9/Zryn//umSEPLiyUjhbRwZbz7FmeK2s9ijlPfn2eG6PYhsSC5Fix5Nu5OSxZaI
 JhUSIbWc7BuLrTQQk0MvmWBiqU7PzJIUtrOa9JWPXsiT+GPIDTZCEqf4iKAq3GQncy
 8Il2KskV1Frs+KBFHV57aa5FOHpT/LlP9qj9v1hDcrR14Dw9EbIUjyi1kbidzIsMNb
 2AHVj/7qkm5rg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/12] accel/habanalabs: set default device release watchdog
 T/O as 30 sec
Date: Tue, 11 Jul 2023 14:12:20 +0300
Message-Id: <20230711111226.163670-6-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711111226.163670-1-ogabbay@kernel.org>
References: <20230711111226.163670-1-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

After being notified about certain errors, user is expected to finish
his post-errors actions and to release the device within some timeout,
after which is deice is being reset.
The default timeout value is 5 sec, which in some case is not enough for
a user application to collect debug data.
Increase the default value to 30 sec.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index d7d9198b2103..28be0fc325ea 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -18,7 +18,7 @@
 
 #define HL_RESET_DELAY_USEC			10000	/* 10ms */
 
-#define HL_DEVICE_RELEASE_WATCHDOG_TIMEOUT_SEC	5
+#define HL_DEVICE_RELEASE_WATCHDOG_TIMEOUT_SEC	30
 
 enum dma_alloc_type {
 	DMA_ALLOC_COHERENT,
-- 
2.34.1

