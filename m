Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A4A6F2D0D
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 05:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D0110E2D4;
	Mon,  1 May 2023 03:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207BC10E2D4
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 03:06:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A207B6188F;
 Mon,  1 May 2023 03:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24AAC433D2;
 Mon,  1 May 2023 03:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682910406;
 bh=BR4psieaLe5m1WiFLrB14WfFWXXRVLIaoIjw3D6ekk0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nk2hiPwv0x7FFOAopa09Q4jGRqoNa8FcTnvt9czAzUqIgJU57b9N1aqUCDrWvWW94
 iFjZN5bUTFvbyOhhjBgRDlL6V8qMTZSMPFes36ssMnhhq0d5fDgBshwkK4Wf3E/AW7
 CJB+2fodCY+UPJNgEmACKm6Wr64CyiJ2+hpmwBtHfJhayvgWbN54Pccnf+TyGL8G/X
 g5YnGQpgjSyxLuYNjNuNbHHvMnSGyAtl9f23OQ7m6M/4eiP79970aqFuIx8vRZljNQ
 bAaSs73hey8Sl6DFXfrISl+uMZ1C4c60EneMZKZ88BNWiLMoAiCZF1zSYOF72JESkH
 +7IzTIPRJ9xMw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 6/9] drm/tegra: Avoid potential 32-bit integer
 overflow
Date: Sun, 30 Apr 2023 23:06:28 -0400
Message-Id: <20230501030633.3255202-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501030633.3255202-1-sashal@kernel.org>
References: <20230501030633.3255202-1-sashal@kernel.org>
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
index 83108e2430501..adc191ec26a99 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -829,7 +829,7 @@ static int tegra_sor_compute_config(struct tegra_sor *sor,
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

