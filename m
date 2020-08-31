Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CA9257C6A
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 17:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697766E2CA;
	Mon, 31 Aug 2020 15:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CFB6E2CA;
 Mon, 31 Aug 2020 15:30:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B3A6A207EA;
 Mon, 31 Aug 2020 15:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598887823;
 bh=SjN8iminpZiXmeBHQ3gKw/eRxDZLxp1Xr4nXn7Ml+q8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z0noHzwbiA1bMrbUdSrDR0sDcKVByvEvKcLdzopp3gg72X1YnFYRn1j/JtHfO5Jan
 1RQ9ZJLmYUJOmGh9jSDUGBL8SziNlS5NCBqekoZLc9zSRm1ZZgdl2BorI7CO4XTRAW
 4H1ER9uJkIb8Mn8eSgKeyMh6fn1R6JGtGydR/gYY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 33/42] drm/amd/display: should check error using
 DC_OK
Date: Mon, 31 Aug 2020 11:29:25 -0400
Message-Id: <20200831152934.1023912-33-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831152934.1023912-1-sashal@kernel.org>
References: <20200831152934.1023912-1-sashal@kernel.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tong Zhang <ztong0001@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tong Zhang <ztong0001@gmail.com>

[ Upstream commit ed9ab229fea24cbcab17f484297dc8344afb7ea9 ]

core_link_read_dpcd returns only DC_OK(1) and DC_ERROR_UNEXPECTED(-1),
the caller should check error using DC_OK instead of checking against 0

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 91cd884d6f257..7728fd71d1f3a 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -4346,9 +4346,9 @@ bool dc_link_get_backlight_level_nits(struct dc_link *link,
 			link->connector_signal != SIGNAL_TYPE_DISPLAY_PORT))
 		return false;
 
-	if (!core_link_read_dpcd(link, DP_SOURCE_BACKLIGHT_CURRENT_PEAK,
+	if (core_link_read_dpcd(link, DP_SOURCE_BACKLIGHT_CURRENT_PEAK,
 			dpcd_backlight_get.raw,
-			sizeof(union dpcd_source_backlight_get)))
+			sizeof(union dpcd_source_backlight_get)) != DC_OK)
 		return false;
 
 	*backlight_millinits_avg =
@@ -4387,9 +4387,9 @@ bool dc_link_read_default_bl_aux(struct dc_link *link, uint32_t *backlight_milli
 		link->connector_signal != SIGNAL_TYPE_DISPLAY_PORT))
 		return false;
 
-	if (!core_link_read_dpcd(link, DP_SOURCE_BACKLIGHT_LEVEL,
+	if (core_link_read_dpcd(link, DP_SOURCE_BACKLIGHT_LEVEL,
 		(uint8_t *) backlight_millinits,
-		sizeof(uint32_t)))
+		sizeof(uint32_t)) != DC_OK)
 		return false;
 
 	return true;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
