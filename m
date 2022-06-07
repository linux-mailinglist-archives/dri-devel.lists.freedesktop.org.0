Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C997540854
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 19:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B09510F428;
	Tue,  7 Jun 2022 17:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA2C10F385;
 Tue,  7 Jun 2022 17:57:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 632DBCE2439;
 Tue,  7 Jun 2022 17:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB74C34115;
 Tue,  7 Jun 2022 17:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654624669;
 bh=V+2fr26x6mH1tjdXZJG+wmFJjeJtUEdbGyA7Ms03VpE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NVPOaZ0tN9p7YhOulNx9Chq9rMVzhE5cgDBMD9OAuyma9XIJdHLvUOIOyd4eQmIzS
 FPOwTJ/8QYYvzsW0NSj4DaQHucWLbc5aA/3vbeyUr2/YRxkdzZZz4++77kKaA3xWpg
 g3MNuQ8Nx+0Fb7bYpl4tLSeGK1xZ+SNa5B+19J3PS51F+l2wUlh1ePrS7/Kv6CxAp7
 GNGXNOyHxBorkTqYHZnj4PdPDMWC9KzqSeC96qHGvLjILSnyqEuYmr3WzW2fwiIRMm
 L31y4UHwzFR84Yt8gcq0I3K4OrGmnnF8jo4Gog+U9n5aILn7vFyt2L5TP6BJBIfVow
 DH0Gh5sMP/Dtw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 39/51] drm/amd/pm: Fix missing thermal throttler
 status
Date: Tue,  7 Jun 2022 13:55:38 -0400
Message-Id: <20220607175552.479948-39-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607175552.479948-1-sashal@kernel.org>
References: <20220607175552.479948-1-sashal@kernel.org>
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
index c9cfeb094750..d0c6b864d00a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
@@ -1627,6 +1627,7 @@ static const struct throttling_logging_label {
 	uint32_t feature_mask;
 	const char *label;
 } logging_label[] = {
+	{(1U << THROTTLER_TEMP_GPU_BIT), "GPU"},
 	{(1U << THROTTLER_TEMP_MEM_BIT), "HBM"},
 	{(1U << THROTTLER_TEMP_VR_GFX_BIT), "VR of GFX rail"},
 	{(1U << THROTTLER_TEMP_VR_MEM_BIT), "VR of HBM rail"},
-- 
2.35.1

