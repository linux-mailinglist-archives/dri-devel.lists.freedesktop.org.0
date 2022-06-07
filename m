Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3363054081C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 19:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C3E10ECAB;
	Tue,  7 Jun 2022 17:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED6110ECAB;
 Tue,  7 Jun 2022 17:54:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 26E0BB8236F;
 Tue,  7 Jun 2022 17:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33DFC385A5;
 Tue,  7 Jun 2022 17:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654624496;
 bh=kvqvrS7aBXFQLen3K2YQokr1nKqkLNmgu1NIMizyz9w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RDnxXDx2zd9BM8btPrJjRtva9NzKukSu+teFYey0FcTpdttR1uoZflyCO3hiNAnhq
 5a4qyWnAYgpcHNn0W029pkW1v1kPIPhIWEP1z/raH7cXIipDbm2tDp6L9mhV2f6vP2
 eA6GUdM7rJ7TMTXibbEXbHYBVO7aOJ6Fg4AcgJS53jvK2cTX/cKzB7r4JiI7qAe1/U
 /Tbc9Fcx9sT15comxLeaj7x5q+ee5cRCkbaYUaA98UqVzqxBuCeQFLrwrHhnwlQNUM
 7qwG/4bet64d4u00kIw1fObLY7VAn4HtFwOHjgs2UEeM4f4MKmMNmesXjQd3pAUBnY
 GNEQF00LMa3zw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 44/60] drm/amd/pm: Fix missing thermal throttler
 status
Date: Tue,  7 Jun 2022 13:52:41 -0400
Message-Id: <20220607175259.478835-44-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607175259.478835-1-sashal@kernel.org>
References: <20220607175259.478835-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, kevin1.wang@amd.com, Xinhui.Pan@amd.com,
 Yang Wang <kevinyang.wang@amd.com>, airlied@linux.ie,
 Lijo Lazar <lijo.lazar@amd.com>, tao.zhou1@amd.com,
 amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com, Stanley.Yang@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 evan.quan@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lijo Lazar <lijo.lazar@amd.com>

[ Upstream commit b0f4d663fce6a4232d3c20ce820f919111b1c60b ]

On aldebaran, when thermal throttling happens due to excessive GPU
temperature, the reason for throttling event is missed in warning
message. This patch fixes it.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: Yang Wang <kevinyang.wang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
index 4885c4ae78b7..27a54145d352 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
@@ -1643,6 +1643,7 @@ static const struct throttling_logging_label {
 	uint32_t feature_mask;
 	const char *label;
 } logging_label[] = {
+	{(1U << THROTTLER_TEMP_GPU_BIT), "GPU"},
 	{(1U << THROTTLER_TEMP_MEM_BIT), "HBM"},
 	{(1U << THROTTLER_TEMP_VR_GFX_BIT), "VR of GFX rail"},
 	{(1U << THROTTLER_TEMP_VR_MEM_BIT), "VR of HBM rail"},
-- 
2.35.1

