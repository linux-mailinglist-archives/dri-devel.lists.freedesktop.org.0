Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3671C6A3682
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52A710E1B5;
	Mon, 27 Feb 2023 02:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBBD10E1A2;
 Mon, 27 Feb 2023 02:02:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB1ED60CE8;
 Mon, 27 Feb 2023 02:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA057C433EF;
 Mon, 27 Feb 2023 02:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463335;
 bh=h1yZD+l4ViMaLCqSGrX0WvRwzliCwFCb/X+s+oVTcdM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WTsV67NetdEfzLyiMRwrmhIl5hu+mGHTwK6dku4l6ixQAu/WdHNQa4BKxJW7SbCWF
 jfTWkgxozn0xeugsNyKCiTigwgUk6UvRoDN4n6NWexnVGspBH1z3yxN0iHNysahji/
 8G+To1XErmONTCVyXukjL6GG+S9O/uJcngs7YIHWvn7z01V7iXYR7YSKC6gMuO6sCY
 ez2RiBdzVofMztl6IZGn14HT5ECEnz15ajtdlyVVkQzDUDnTI3wY19qDj5jP7qLCT0
 aMg3Lu+OIDrbtFbXW1x/nyvbDmnEUntmg37TqTGdm8K3stS/S84JRwKvUAf3cafAnS
 XKM75BPLmVVoA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 18/60] drm/msm/dp: Remove INIT_SETUP delay
Date: Sun, 26 Feb 2023 21:00:03 -0500
Message-Id: <20230227020045.1045105-18-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020045.1045105-1-sashal@kernel.org>
References: <20230227020045.1045105-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, freedreno@lists.freedesktop.org,
 quic_sbillaka@quicinc.com, Bjorn Andersson <quic_bjorande@quicinc.com>,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, swboyd@chromium.org,
 johan+linaro@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Andersson <quic_bjorande@quicinc.com>

[ Upstream commit e17af1c9d861dc177e5b56009bd4f71ace688d97 ]

During initalization of the DisplayPort controller an EV_HPD_INIT_SETUP
event is generated, but with a delay of 100 units. This delay existed to
circumvent bug in the QMP combo PHY driver, where if the DP part was
powered up before USB, the common properties would not be properly
initialized - and USB wouldn't work.

This issue was resolved in the recent refactoring of the QMP driver,
so it's now possible to remove this delay.

While there is still a timing dependency in the current implementation,
test indicates that it's now possible to boot with an external display
on USB Type-C and have the display power up, without disconnecting and
reconnecting the cable.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Patchwork: https://patchwork.freedesktop.org/patch/518729/
Link: https://lore.kernel.org/r/20230117172951.2748456-1-quic_bjorande@quicinc.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7ff60e5ff3258..ed4159f6d344e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1497,7 +1497,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
 	if (!dp_display->is_edp)
-		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
+		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 0);
 }
 
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
-- 
2.39.0

