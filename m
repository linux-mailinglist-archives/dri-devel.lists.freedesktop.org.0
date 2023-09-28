Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC73D7B1E28
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 15:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039BE10E65C;
	Thu, 28 Sep 2023 13:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EA110E65C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 13:25:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 93DE661B86
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 13:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6257AC433C7;
 Thu, 28 Sep 2023 13:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695907532;
 bh=kpXvGHsuIpubDwPWsxG1yKQwQdGOQjiLynpABCN6ypU=;
 h=From:To:Subject:Date:From;
 b=fXBHJkpg6i2vDlJs6D+QionODnpVKu+usgloZeLW0L2Txuv9YlLZd7yOog7ppUx4L
 xzb/A9KwCQij8xikHNRhKT6EKGzwYSreE51opSG0oE9oG9cfqbywzWcY3dOHpDAySI
 bw/G3S7WX8+MrVDEAM7qCVqyZWJaYTSgHCnXfUChGdXuQyci0/9Lv7Tuxf2xt3ZUFm
 tYlfPNQDNS/Lego09QsnN5mSjOf40GDRraRcpLGjDIXVPwPK2grdu6N64SIRjXGoGi
 7F5fWcRtwAvNf839zh9IygyCjU4uH0SZGlRoAiHSP9KnSPlghFIT/Si05s58d1o3F9
 ig8oNsL2/B4ig==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] accel/habanalabs/gaudi2: fix spmu mask creation
Date: Thu, 28 Sep 2023 16:25:27 +0300
Message-Id: <20230928132527.89451-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
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

event_types_num received from the user can be 0. In that case, the
event_mask should be 0.

In addition, to create a correct mask we need to match the number
of event types to the bit location such that bit 0 represents a single
event type, bit 1 represents 2 types and so on.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c b/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
index 14a855cdc96b..2423620ff358 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
@@ -2500,7 +2500,8 @@ static int gaudi2_config_spmu(struct hl_device *hdev, struct hl_debug_params *pa
 		 * set enabled events mask based on input->event_types_num
 		 */
 		event_mask = 0x80000000;
-		event_mask |= GENMASK(input->event_types_num, 0);
+		if (input->event_types_num)
+			event_mask |= GENMASK(input->event_types_num - 1, 0);
 
 		WREG32(base_reg + mmSPMU_PMCNTENSET_EL0_OFFSET, event_mask);
 	} else {
-- 
2.34.1

