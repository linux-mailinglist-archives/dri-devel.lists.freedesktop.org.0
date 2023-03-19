Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B51EF6C006B
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 10:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E3010E4FF;
	Sun, 19 Mar 2023 09:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F124D10E190
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 09:42:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 859BCCE0B3E;
 Sun, 19 Mar 2023 09:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1625C433EF;
 Sun, 19 Mar 2023 09:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679218916;
 bh=5Rc42am1FmVwfrgG3kGPf4irUK/WvGNtw8ZZ804D0uw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QHSowuxADH3LuK7uCZVqiQ5EyzoHeECEtNpVL9TKNZOs3oRLOmzr/uAy7r79lGeFS
 LtZSht71yAsKhrYhcRzYD6ZArhvOp22KEw/8iZB/rEwfZm8IQvZdqfoidjVQQdj0VV
 UHxESUl+ZVkVkFd3GPE8MM59e4oZRlBgMoA6D/YorXXc6Y8e9Z7fGoZs1muhT5FDhv
 be28RF8k6DYUFOCPnt5+16aW12mvXCKP9H21rmrqPYWFKjUp4JV8kHgdqSFEWWrYto
 aTpKTk8LraH8EWxZPNmT2v3GiP2W/Y8lMzDvIPgDXpnGiVUdY0p2X680bhg5pBYXd1
 kpIo33jVCYVQQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] accel/habanalabs: fix page fault event clear
Date: Sun, 19 Mar 2023 11:41:47 +0200
Message-Id: <20230319094148.680750-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230319094148.680750-1-ogabbay@kernel.org>
References: <20230319094148.680750-1-ogabbay@kernel.org>
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
Cc: Dani Liberman <dliberman@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dani Liberman <dliberman@habana.ai>

After getting page fault in gaudi2, we need to clear the valid bit
instead of the address.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 9f6dbc020d27..9e4ef22c5fb2 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -8846,7 +8846,7 @@ static void gaudi2_handle_page_error(struct hl_device *hdev, u64 mmu_base, bool
 				is_pmmu ? "PMMU" : "HMMU", addr, ((u64)axid_h << 32) + axid_l);
 	hl_handle_page_fault(hdev, addr, 0, is_pmmu, event_mask);
 
-	WREG32(mmu_base + MMU_OFFSET(mmDCORE0_HMMU0_MMU_PAGE_ERROR_CAPTURE), 0);
+	WREG32(mmu_base + MMU_OFFSET(mmDCORE0_HMMU0_MMU_ACCESS_PAGE_ERROR_VALID), 0);
 }
 
 static void gaudi2_handle_access_error(struct hl_device *hdev, u64 mmu_base, bool is_pmmu)
-- 
2.40.0

