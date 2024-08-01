Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115B8943A95
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8238B10E759;
	Thu,  1 Aug 2024 00:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qSSK+PqO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7B710E749
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 00:17:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8D86BCE182B;
 Thu,  1 Aug 2024 00:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0FBFC4AF0C;
 Thu,  1 Aug 2024 00:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471418;
 bh=ESNMqqSSifGjTIF9jtKdskNaQNhl1748NcdFTZEQUts=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qSSK+PqOEtnOr8AY0NQWITQ8s01+ReSAKOs6EbCeGhMXehLS0urb1UWt5aARzlznH
 c7cEQpHWmPWG+QbRhLEL60RFOBq21EeczIkdHvDN42h7kQ2aoq6eiGT5zU2F6UaTCm
 7JU4mlJyGa4qbLvt/6esdWAKQVlYYdO2iD3NJBtkJhB/PbDFvnC8mE/lsykjayGGQq
 GpnCC6dpuNpukhv6nF6slKEzl92BKBtJIT7HLVNlfQNjqsc+IYOGFqFF9gbxc2pfZY
 WQOUhV4gKTMNIO4iI65//TeF+18+I/s44+qQ3wcJOiL86Q6q1GcE8Mo+9OOIMm9xNq
 OnO8tMwlJzVoQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rakesh Ughreja <rughreja@habana.ai>, Ofir Bitton <obitton@habana.ai>,
 Sasha Levin <sashal@kernel.org>, ogabbay@kernel.org, ttayar@habana.ai,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 091/121] accel/habanalabs/gaudi2: unsecure edma
 max outstanding register
Date: Wed, 31 Jul 2024 20:00:29 -0400
Message-ID: <20240801000834.3930818-91-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Rakesh Ughreja <rughreja@habana.ai>

[ Upstream commit 3309887c6ff8ca2ac05a74e1ee5d1c44829f63f2 ]

Netowrk EDMAs uses more outstanding transfers so this needs to be
programmed by EDMA firmware.

Signed-off-by: Rakesh Ughreja <rughreja@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
Signed-off-by: Ofir Bitton <obitton@habana.ai>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2_security.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_security.c b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
index 34bf80c5a44bf..307ccb912ccd6 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
@@ -479,6 +479,7 @@ static const u32 gaudi2_pb_dcr0_edma0_unsecured_regs[] = {
 	mmDCORE0_EDMA0_CORE_CTX_TE_NUMROWS,
 	mmDCORE0_EDMA0_CORE_CTX_IDX,
 	mmDCORE0_EDMA0_CORE_CTX_IDX_INC,
+	mmDCORE0_EDMA0_CORE_WR_COMP_MAX_OUTSTAND,
 	mmDCORE0_EDMA0_CORE_RD_LBW_RATE_LIM_CFG,
 	mmDCORE0_EDMA0_QM_CQ_CFG0_0,
 	mmDCORE0_EDMA0_QM_CQ_CFG0_1,
-- 
2.43.0

