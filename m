Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349BE6F2CD8
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 05:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E13810E2BB;
	Mon,  1 May 2023 03:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610AC10E2BB
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 03:05:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DEC336175D;
 Mon,  1 May 2023 03:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320EFC4339C;
 Mon,  1 May 2023 03:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682910357;
 bh=z4Kl8L7wxX4xJ2N4SX2g9Q0DC4BQTCOs5TJtelKsGDg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gtq4TguKX9v2MkpF1aukzQfE5l0S7rB8mhwCZD0rZkHsOp/t7Q79w5WnygHl/vYpr
 6Zs7dEDSfcCajaS3H4okiggjXpCgWtSjhsWBumrWFLR56OsSXMlkXZKTfdw+aWB7wx
 P7P4Sg0g/FhZJKpc2iQUQCVxy0ZfEgeqo+cxtcOf00uhbd8vIupw8kr2NIaU0Pz/9n
 9glV5GLqFmgqd8hnPRFhW5u24sWlrnVy3tieGwwkD8HUrhuVXdo6qAJTos+BSv1Yk8
 RmaMpbHTA1kteu5uJEnpgXVDTpkYzOsIBZdQ/oZJZowfxVEstxCUMiAWQTNy4BTonx
 CVaaBI0nVBIyA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 08/12] drm/tegra: Avoid potential 32-bit integer
 overflow
Date: Sun, 30 Apr 2023 23:05:34 -0400
Message-Id: <20230501030540.3254928-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501030540.3254928-1-sashal@kernel.org>
References: <20230501030540.3254928-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Nur Hussein <hussein@unixcat.org>,
 jonathanh@nvidia.com, dri-devel@lists.freedesktop.org, mperttunen@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nur Hussein <hussein@unixcat.org>

[ Upstream commit 2429b3c529da29d4277d519bd66d034842dcd70c ]

In tegra_sor_compute_config(), the 32-bit value mode->clock is
multiplied by 1000, and assigned to the u64 variable pclk. We can avoid
a potential 32-bit integer overflow by casting mode->clock to u64 before
we do the arithmetic and assignment.

Signed-off-by: Nur Hussein <hussein@unixcat.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tegra/sor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 32c83f2e386ca..9d60d1c4cfcea 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1153,7 +1153,7 @@ static int tegra_sor_compute_config(struct tegra_sor *sor,
 				    struct drm_dp_link *link)
 {
 	const u64 f = 100000, link_rate = link->rate * 1000;
-	const u64 pclk = mode->clock * 1000;
+	const u64 pclk = (u64)mode->clock * 1000;
 	u64 input, output, watermark, num;
 	struct tegra_sor_params params;
 	u32 num_syms_per_line;
-- 
2.39.2

