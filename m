Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C2913E5CC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 18:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E606EE27;
	Thu, 16 Jan 2020 17:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F826EE27
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 17:17:38 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 79AB92087E;
 Thu, 16 Jan 2020 17:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579195058;
 bh=GNZp0UeonDfLmB9+iQmd4E5uDQXciC8j7pjaO1xySas=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=udtg47BXvtViavBBOQy4uzZkOc/y8vK/EcCoMmP9Si3Tul8SGtBduSTxshYhMRYc+
 IbHiIhvZCPSgEOskbEXReYFJWgNMBVRxCFD/qdgP4Jpbml4ettlz8BGqNe5ud3kwbn
 E3sQgZUGia9WvsfLPbPHOx3q4/McpqYgnBAu9A8k=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 014/371] drm/sun4i: hdmi: Fix double flag
 assignation
Date: Thu, 16 Jan 2020 12:11:22 -0500
Message-Id: <20200116171719.16965-14-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116171719.16965-1-sashal@kernel.org>
References: <20200116171719.16965-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maxime Ripard <maxime.ripard@bootlin.com>

[ Upstream commit 1e0ff648940e603cab6c52cf3723017d30d78f30 ]

The is_double flag is a boolean currently assigned to the value of the d
variable, that is either 1 or 2. It means that this is_double variable is
always set to true, even though the initial intent was to have it set to
true when d is 2.

Fix this.

Fixes: 9c5681011a0c ("drm/sun4i: Add HDMI support")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Reviewed-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20181021163446.29135-2-maxime.ripard@bootlin.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
index 5cf2527bffc8..d7a8fea94557 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
@@ -50,7 +50,7 @@ static unsigned long sun4i_tmds_calc_divider(unsigned long rate,
 			    (rate - tmp_rate) < (rate - best_rate)) {
 				best_rate = tmp_rate;
 				best_m = m;
-				is_double = d;
+				is_double = (d == 2) ? true : false;
 			}
 		}
 	}
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
