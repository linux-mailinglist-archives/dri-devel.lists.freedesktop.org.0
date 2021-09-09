Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8E7404B0E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 13:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A0F6E5D1;
	Thu,  9 Sep 2021 11:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAFE6E5CA;
 Thu,  9 Sep 2021 11:49:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53D2C61262;
 Thu,  9 Sep 2021 11:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188159;
 bh=JcKEbqG4ljzAwAQ/lX3iUIJsq4CBhbZUDu34o5T0zxY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fSEbK2Mmlrriw29LONfUqxk56k35hd0/4GXvcCBOI+9fqtVXCndWa4GrLPuazWCPW
 Drii76cqLMb5VIZbDlFovTdYxUKHKI3/ZKLE+1r4hCWolOtMermZVU7Sna+MOJut0F
 HW+OzPj+ghYpZG6NJ2b2ItYfw5IqvyC0i7+eZ+spJRxhKDs8mTSkaXxaKdmdhhvniC
 F+oc7xslOItl/7K0wvyIXKR8XuuDLfZPWqu+vun5kYsiHttMzSf1g1sx6zkTiyVr00
 csRloUSd7g2xcchpbLn1uksqjwsVZ3+Z+wUH1dZUE4O/h9MZ5b+Qa1JjnSh5GT5X2m
 evodR+v44Q25g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kuogee Hsieh <khsieh@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.13 126/219] drm/msm/dp: return correct edid checksum
 after corrupted edid checksum read
Date: Thu,  9 Sep 2021 07:45:02 -0400
Message-Id: <20210909114635.143983-126-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114635.143983-1-sashal@kernel.org>
References: <20210909114635.143983-1-sashal@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kuogee Hsieh <khsieh@codeaurora.org>

[ Upstream commit 7948fe12d47a946fb8025a0534c900e3dd4b5839 ]

Response with correct edid checksum saved at connector after corrupted edid
checksum read. This fixes Link Layer CTS cases 4.2.2.3, 4.2.2.6.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Link: https://lore.kernel.org/r/1628196295-7382-6-git-send-email-khsieh@codeaurora.org
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 9cc816663668..6eeb9a14b584 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -272,7 +272,7 @@ static u8 dp_panel_get_edid_checksum(struct edid *edid)
 {
 	struct edid *last_block;
 	u8 *raw_edid;
-	bool is_edid_corrupt;
+	bool is_edid_corrupt = false;
 
 	if (!edid) {
 		DRM_ERROR("invalid edid input\n");
@@ -304,7 +304,12 @@ void dp_panel_handle_sink_request(struct dp_panel *dp_panel)
 	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
 
 	if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
-		u8 checksum = dp_panel_get_edid_checksum(dp_panel->edid);
+		u8 checksum;
+
+		if (dp_panel->edid)
+			checksum = dp_panel_get_edid_checksum(dp_panel->edid);
+		else
+			checksum = dp_panel->connector->real_edid_checksum;
 
 		dp_link_send_edid_checksum(panel->link, checksum);
 		dp_link_send_test_response(panel->link);
-- 
2.30.2

