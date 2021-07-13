Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F64B3C73A5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 17:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16466E0EA;
	Tue, 13 Jul 2021 15:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E03F6E0EC
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 15:55:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626191701; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=QT0rCAMjsSGPZ3jKRP4o9QdSlxRce5w6tIBucvgc3v4=;
 b=oECnmMCjW28NYnHhNdihpxhhI1etPbAinpzzOSl7rwYDWHxdvHh8PpyHbC8BCy1rUw+VFL5J
 zGS18UwMoQaprshrfuthL+UEAR6dSTBQfwYaKvRTUp3XamgBrPTS0ugxvNJsYvGSyfpXvs+I
 ybgDsmOFyOLgdQYZNTaXjyK395M=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60edb74cdc4628fe7e73423c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Jul 2021 15:54:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B7C88C43143; Tue, 13 Jul 2021 15:54:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 38621C433F1;
 Tue, 13 Jul 2021 15:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 38621C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org
Subject: [PATCH v2 5/7] drm/msm/dp: return correct edid checksum after
 corrupted edid checksum read
Date: Tue, 13 Jul 2021 08:54:05 -0700
Message-Id: <1626191647-13901-6-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, Kuogee Hsieh <khsieh@codeaurora.org>,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Response with correct edid checksum saved at connector after corrupted edid
checksum read. This fixes Link Layer CTS cases 4.2.2.3, 4.2.2.6.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 88196f7..0fdb551 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -271,7 +271,7 @@ static u8 dp_panel_get_edid_checksum(struct edid *edid)
 {
 	struct edid *last_block;
 	u8 *raw_edid;
-	bool is_edid_corrupt;
+	bool is_edid_corrupt = false;
 
 	if (!edid) {
 		DRM_ERROR("invalid edid input\n");
@@ -303,7 +303,12 @@ void dp_panel_handle_sink_request(struct dp_panel *dp_panel)
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
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

