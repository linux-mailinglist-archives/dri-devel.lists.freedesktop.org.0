Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CADD98595E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B2D10E98D;
	Wed, 25 Sep 2024 11:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lYKTZhpx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A4510E98C;
 Wed, 25 Sep 2024 11:52:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4E6505C0E74;
 Wed, 25 Sep 2024 11:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193D1C4CECE;
 Wed, 25 Sep 2024 11:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727265154;
 bh=nkBzYac0mtkWjR1R5qQ4U2a+voJyzBdEXgbdpDg+cEc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lYKTZhpxhmBm56ObhOz67uvUv0cdKp/u2X6cvApjT/8Ox9hn3LqVKpbzRAcpZ12pF
 gc7PcCvHq6ukqtY9R8dky10B8lSSlrQCXetPcml1aObdFOJRnb7RCfGK8T/rpJ5cjD
 kAwre2FBdK6//nGFw0fO+rmgbxVpbFQSDpm+xuofsMgOFPiVaUNPNTeHCBftVS7VxK
 6LmEij3+t0xveq7DSs/RGo8oxTKwp+2y61grCu4f4VAe8eGiCdO/Iuqdf7wKbG433W
 sfu0qbuYK3L6KEdcKJfjmIbxQj5JqDw66nHtuK6+2Nu2MCy1UbSMJrxPZqALk1nNMP
 zPoKCHBBs7eEA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Ahmed, Muhammad" <Ahmed.Ahmed@amd.com>,
	Charlene Liu <charlene.liu@amd.com>, Ahmed@freedesktop.org,
	Zaeem Mohamed <zaeem.mohamed@amd.com>,
	Daniel Wheeler <daniel.wheeler@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Sasha Levin <sashal@kernel.org>, harry.wentland@amd.com,
	sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
	christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
	daniel@ffwll.ch, daniel.miess@amd.com, wayne.lin@amd.com,
	nicholas.kazlauskas@amd.com, yi-lchen@amd.com, alex.hung@amd.com,
	ilya.bakoulin@amd.com, harikrishna.revalla@amd.com,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 220/244] drm/amd/display: guard write a 0
 post_divider value to HW
Date: Wed, 25 Sep 2024 07:27:21 -0400
Message-ID: <20240925113641.1297102-220-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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

From: "Ahmed, Muhammad" <Ahmed.Ahmed@amd.com>

[ Upstream commit 5d666496c24129edeb2bcb500498b87cc64e7f07 ]

[why]
post_divider_value should not be 0.

Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Signed-off-by: Ahmed, Muhammad <Ahmed.Ahmed@amd.com>
Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c b/drivers/gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c
index 68cd3258f4a97..a64d8f3ec93a3 100644
--- a/drivers/gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c
@@ -47,7 +47,8 @@ static void dccg35_trigger_dio_fifo_resync(struct dccg *dccg)
 	uint32_t dispclk_rdivider_value = 0;
 
 	REG_GET(DENTIST_DISPCLK_CNTL, DENTIST_DISPCLK_RDIVIDER, &dispclk_rdivider_value);
-	REG_UPDATE(DENTIST_DISPCLK_CNTL, DENTIST_DISPCLK_WDIVIDER, dispclk_rdivider_value);
+	if (dispclk_rdivider_value != 0)
+		REG_UPDATE(DENTIST_DISPCLK_CNTL, DENTIST_DISPCLK_WDIVIDER, dispclk_rdivider_value);
 }
 
 static void dcn35_set_dppclk_enable(struct dccg *dccg,
-- 
2.43.0

