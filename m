Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9361134E93
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 22:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6C96E8C8;
	Wed,  8 Jan 2020 21:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from o1.b.az.sendgrid.net (o1.b.az.sendgrid.net [208.117.55.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F07D6E34C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 21:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:in-reply-to:references:to:cc:content-type:
 content-transfer-encoding;
 s=001; bh=IiLQ8L4byxFjqeoXMTCaKip09HlTH/MmHbs7tvCMQgY=;
 b=QZY6MBVwCoiFczU0Yk1QbJ21nztZH9gSab5fT8k1H2iFTQzNvEBWLBY0+YoN0Q842XEv
 2hkPSem+2EyrQiihbig19wLY64BzUXeLMEFVR3aPIGNUkzHRPzJhPS9QWP6S81841ZdrQO
 j9FF1hZMldTKtfBaYXujMVXjnTXXhi3F4=
Received: by filterdrecv-p3mdw1-56c97568b5-qqd9g with SMTP id
 filterdrecv-p3mdw1-56c97568b5-qqd9g-18-5E1644A5-63
 2020-01-08 21:07:49.736716731 +0000 UTC m=+1974280.387268561
Received: from bionic.localdomain (unknown [98.128.173.80])
 by ismtpd0005p1lon1.sendgrid.net (SG) with ESMTP id hoZ7RMZDRoGVWKvqnwa5Ig
 Wed, 08 Jan 2020 21:07:49.497 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 06/14] drm/rockchip: dw-hdmi: allow high tmds bit rates
Date: Wed, 08 Jan 2020 21:07:49 +0000 (UTC)
Message-Id: <20200108210740.28769-7-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108210740.28769-1-jonas@kwiboo.se>
References: <20200108210740.28769-1-jonas@kwiboo.se>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h8Xinh+Au1Telh56G?=
 =?us-ascii?Q?QM1R2oYBoKtJxxom=2F=2Fq1tL5H6tWAbppEAfKC+cw?=
 =?us-ascii?Q?YyRuoQxeebeSuP8PHev4goIzTUYj7DHNeBRdiQi?=
 =?us-ascii?Q?4ILoafwZFPktLyH0V6IZ=2FN3FzuaolCrwnFCwoWe?=
 =?us-ascii?Q?aQK17xpC4WFiX+dNR7m+JYrsjOfFtyRHFk15a8u?=
 =?us-ascii?Q?zk0CAxy5oyJ9yL0+ctE0g=3D=3D?=
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Zheng Yang <zhengyang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare support for High TMDS Bit Rates used by HDMI2.0 display modes.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 7f56d8c3491d..fae38b323a0c 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -318,6 +318,8 @@ static int dw_hdmi_rockchip_genphy_init(struct dw_hdmi *dw_hdmi, void *data,
 {
 	struct rockchip_hdmi *hdmi = (struct rockchip_hdmi *)data;
 
+	dw_hdmi_set_high_tmds_clock_ratio(dw_hdmi);
+
 	return phy_power_on(hdmi->phy);
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
