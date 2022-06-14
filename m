Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E4B54A447
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 04:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7CF10FFAA;
	Tue, 14 Jun 2022 02:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9847810FFA6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 02:07:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 10F5960DB6;
 Tue, 14 Jun 2022 02:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CFCC34114;
 Tue, 14 Jun 2022 02:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172434;
 bh=fYqEYfMpMmnw3A/eQFnbEnCAsansYVE/WSANxNzwF+8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ko9ecJ290gW3lFhfYyTomV6QhO9EyghwE4Ri8/TED/MSuwdl6YCA/wuDgoh1e3plh
 xx3GCQ98cK646Be4HxusmlZXlLT3qgi+TNKQQeKkd/iu4NiY2HgyU+HuNTY7v1cuZF
 SENVhc6nO9kwpLF79eGs8qTzH2mWuP2PW3zSbrQwZ/mKNFGcN6frGUNsQOmx4OP5tK
 SnMh/mm1Aab346uMIScP7o0Ckq5Nlg4B9wvhCzBJGSeqW/LmnWYpODkQ576fZxRuUC
 j/Qc/tK4mO4yw1KZZgUuqZZZNEgcX5KTQsmg8L+MNk1kRWemoQFUMYtME2eBYzz34K
 rirwjv9SauZUA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 03/41] drm/amd/display: Read Golden Settings
 Table from VBIOS
Date: Mon, 13 Jun 2022 22:06:28 -0400
Message-Id: <20220614020707.1099487-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020707.1099487-1-sashal@kernel.org>
References: <20220614020707.1099487-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, Sherry Wang <YAO.WANG1@amd.com>,
 Jasdeep Dhillon <jdhillon@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sherry Wang <YAO.WANG1@amd.com>

[ Upstream commit 4b81dd2cc6f4f4e8cea0ed6ee8d5193a8ae14a72 ]

[Why]
Dmub read AUX_DPHY_RX_CONTROL0 from Golden Setting Table,
but driver will set it to default value 0x103d1110, which
causes issue in some case

[How]
Remove the driver code, use the value set by dmub in
dp_aux_init

Reviewed-by: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Acked-by: Jasdeep Dhillon <jdhillon@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Sherry Wang <YAO.WANG1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
index b0892443fbd5..c7c27a605f15 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
@@ -168,9 +168,7 @@ void enc31_hw_init(struct link_encoder *enc)
 	AUX_RX_PHASE_DETECT_LEN,  [21,20] = 0x3 default is 3
 	AUX_RX_DETECTION_THRESHOLD [30:28] = 1
 */
-	AUX_REG_WRITE(AUX_DPHY_RX_CONTROL0, 0x103d1110);
-
-	AUX_REG_WRITE(AUX_DPHY_TX_CONTROL, 0x21c7a);
+	// dmub will read AUX_DPHY_RX_CONTROL0/AUX_DPHY_TX_CONTROL from vbios table in dp_aux_init
 
 	//AUX_DPHY_TX_REF_CONTROL'AUX_TX_REF_DIV HW default is 0x32;
 	// Set AUX_TX_REF_DIV Divider to generate 2 MHz reference from refclk
-- 
2.35.1

