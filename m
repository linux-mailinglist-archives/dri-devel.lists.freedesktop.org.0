Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9DD1A542F
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 01:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409406E215;
	Sat, 11 Apr 2020 23:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271F46E215;
 Sat, 11 Apr 2020 23:04:46 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 022CB20CC7;
 Sat, 11 Apr 2020 23:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646286;
 bh=eSQG4zjJI2NpYKdRyk6k4YozKTs/eWEKTA1IfJRxfKE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jcbBOnttAsuezGXK/p8T3jt//rhJehNe+jLVokJIYe531xnf/Cfe6nrNTNwJu+ktU
 0YomcTCi7qI/OuqM6auHQgv16NXqW86eSdMHXkBBdVpTKVGByLmqSNIKOCAPXIJTBM
 mXZJQuOuHetHFMt0JfR4B+x+7hCCVSvzuOEeDYWo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 047/149] drm/amd/display: Fix HDMI repeater
 authentication
Date: Sat, 11 Apr 2020 19:02:04 -0400
Message-Id: <20200411230347.22371-47-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411230347.22371-1-sashal@kernel.org>
References: <20200411230347.22371-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Wenjing Liu <Wenjing.Liu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

[ Upstream commit 63a85ff6c35d8a7aaf0fb60ddbab93530d495bf3 ]

when the rxstatus split was done the index was incorrect. This
lead to HDMI repeater authentication failure for HDCP2.X So fix it

Fixes: 302169003733 ("drm/amd/display: split rxstatus for hdmi and dp")
Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Reviewed-by: Wenjing Liu <Wenjing.Liu@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Acked-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_execution.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_execution.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_execution.c
index 55246711700ba..6fd68326452ce 100644
--- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_execution.c
+++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_execution.c
@@ -34,7 +34,7 @@ static inline enum mod_hdcp_status check_receiver_id_list_ready(struct mod_hdcp
 	if (is_dp_hdcp(hdcp))
 		is_ready = HDCP_2_2_DP_RXSTATUS_READY(hdcp->auth.msg.hdcp2.rxstatus_dp) ? 1 : 0;
 	else
-		is_ready = (HDCP_2_2_HDMI_RXSTATUS_READY(hdcp->auth.msg.hdcp2.rxstatus[0]) &&
+		is_ready = (HDCP_2_2_HDMI_RXSTATUS_READY(hdcp->auth.msg.hdcp2.rxstatus[1]) &&
 				(HDCP_2_2_HDMI_RXSTATUS_MSG_SZ_HI(hdcp->auth.msg.hdcp2.rxstatus[1]) << 8 |
 						hdcp->auth.msg.hdcp2.rxstatus[0])) ? 1 : 0;
 	return is_ready ? MOD_HDCP_STATUS_SUCCESS :
@@ -67,7 +67,7 @@ static inline enum mod_hdcp_status check_reauthentication_request(
 				MOD_HDCP_STATUS_HDCP2_REAUTH_REQUEST :
 				MOD_HDCP_STATUS_SUCCESS;
 	else
-		ret = HDCP_2_2_HDMI_RXSTATUS_REAUTH_REQ(hdcp->auth.msg.hdcp2.rxstatus[0]) ?
+		ret = HDCP_2_2_HDMI_RXSTATUS_REAUTH_REQ(hdcp->auth.msg.hdcp2.rxstatus[1]) ?
 				MOD_HDCP_STATUS_HDCP2_REAUTH_REQUEST :
 				MOD_HDCP_STATUS_SUCCESS;
 	return ret;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
