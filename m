Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEF6313BCB
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 18:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BCF6E215;
	Mon,  8 Feb 2021 17:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE286E215;
 Mon,  8 Feb 2021 17:58:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E981764EBE;
 Mon,  8 Feb 2021 17:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612807114;
 bh=K1aMfQFonvXHYyiQK0hl5trGHrfEt1bpMziYEyre7wE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DOE9FlirVFO7twCvwZVDaBITca+04nhua5OZUAOqvNoGalYA4lkOulwDnsovoYzoe
 KW5KBECyX+W5MxbzsW+b5uCjs0gDw09R0wZxxIjlxo/HDMBVtrTim6B5sdaDJtS7AK
 sus6oWAwRI2zes2UkYXstLXUOia9mAem7dQ0OLvFVXaUwH/Msad5A1RR+CColCFEt9
 Do4KgnaPuPxS99u7TND1KS7HAI3GHwcEc7o3DhsZ97Ba7OV0L0kbJIrAG1rQkI9xx6
 CJNGJlTKcYS6Nc0DUAMX1fpswRmmTYMppUbplvgfhJlC5EkNl5BMUtX128D7Rd7764
 lFDJ4Psnq1V8A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 20/36] drm/amd/display: Fix DPCD translation for
 LTTPR AUX_RD_INTERVAL
Date: Mon,  8 Feb 2021 12:57:50 -0500
Message-Id: <20210208175806.2091668-20-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210208175806.2091668-1-sashal@kernel.org>
References: <20210208175806.2091668-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Anson Jacob <Anson.Jacob@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>, amd-gfx@lists.freedesktop.org,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 George Shen <george.shen@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: George Shen <george.shen@amd.com>

[ Upstream commit 2b6b7ab4b1cabfbee1af5d818efcab5d51d62c7e ]

[Why]
The translation between the DPCD value and the specified AUX_RD_INTERVAL
in the DP spec do not match.

[How]
Update values to match the spec.

Signed-off-by: George Shen <george.shen@amd.com>
Reviewed-by: Wenjing Liu <Wenjing.Liu@amd.com>
Acked-by: Anson Jacob <Anson.Jacob@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 17e6fd8201395..32b73ea866737 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -877,13 +877,13 @@ static uint32_t translate_training_aux_read_interval(uint32_t dpcd_aux_read_inte
 
 	switch (dpcd_aux_read_interval) {
 	case 0x01:
-		aux_rd_interval_us = 400;
+		aux_rd_interval_us = 4000;
 		break;
 	case 0x02:
-		aux_rd_interval_us = 4000;
+		aux_rd_interval_us = 8000;
 		break;
 	case 0x03:
-		aux_rd_interval_us = 8000;
+		aux_rd_interval_us = 12000;
 		break;
 	case 0x04:
 		aux_rd_interval_us = 16000;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
