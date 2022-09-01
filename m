Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CB55A98F9
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 15:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A8E10E70B;
	Thu,  1 Sep 2022 13:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 902 seconds by postgrey-1.36 at gabe;
 Thu, 01 Sep 2022 13:35:05 UTC
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDC710E70B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 13:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1662038400; x=1664630400;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vp3xvjQcmglGaYzEUWwXOLvXsKqe1G37RVHCE4LfBtM=;
 b=mRJP8ejfdoTSQo0mg2hRNZdpWcgBWVN2lRaaUDLal0bzkzh6Y8FrlOaKehZDUasu
 gVxpJVNQgVbs39oZczBNCEqSbZPhDuyGjChQakknilvONHv4KZtbAY+cXsKcQVij
 IXA308PvEXBE1kTpaBH4txlfSIDu/GKSRJsnPtxWc38=;
X-AuditID: ac14000a-83bf370000003940-31-6310b1804c97
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 60.D7.14656.081B0136;
 Thu,  1 Sep 2022 15:20:00 +0200 (CEST)
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 1 Sep
 2022 15:20:00 +0200
From: Teresa Remmet <t.remmet@phytec.de>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/bridge: tc358775: Do not soft reset i2c-slave controller
Date: Thu, 1 Sep 2022 15:19:51 +0200
Message-ID: <20220901131951.1116512-1-t.remmet@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsWyRpKBR7dho0CywcZGY4v7iz+zWFz5+p7N
 4vn8dYwWJ99cZbHonLiE3eJQX7TFp1kPmR3YPd7faGX32DnrLrvH7I6ZrB6L97xk8jgx4RKT
 x51re9g87ncfZwpgj+KySUnNySxLLdK3S+DKmPlhIlNBE0fF021PmBoYr7N1MXJySAiYSFw6
 2MzaxcjFISSwhEli3c5/YAkhgceMEu2/MkFsNgENiacrTjN1MXJwiAioSsz6aQ5Szywwl0li
 z9k/7CA1wgK+Ekc2/2QHqWERUJFofCsBEuYVsJS4+PwcE8QueYmZl76zQ8QFJU7OfMICYjMD
 xZu3zmaGsCUkDr54wQxxgrzErksnGWF6p517zQxhh0oc2bSaaQKjwCwko2YhGTULyagFjMyr
 GIVyM5OzU4sys/UKMipLUpP1UlI3MYICXoSBawdj3xyPQ4xMHIyHGCU4mJVEeL+f40kW4k1J
 rKxKLcqPLyrNSS0+xCjNwaIkznu/hylRSCA9sSQ1OzW1ILUIJsvEwSnVwGgUmitcyXu8XKev
 kvFaNuOdTZe+77lad3JCUcvWKcyz9t7Kf+8wuTw1d11e13QZ9i77rClTfnXoyD3dz/Ks+1Hh
 E6mtRxdqF165sazAYduWJXZJEUJ5Gde/Flw6fpFhb+aVTIcnq/x11CoEM7U2LI/+tVopaknX
 kb9pV++2Lnz9YE/lHtE9sSeVWIozEg21mIuKEwFE/1IyZgIAAA==
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, upstream@phytec.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Soft reset during tc_bridge_enable() is triggered by setting all available
reset control bits in the SYSRST register.
But as noted in the data sheet resetting the i2c-slave controller should
be only done over DSI and is only useful for chip debugging.
So do not set RSTI2CS (bit0).

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
---
 drivers/gpu/drm/bridge/tc358775.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index f1c6e62b0e1d..a5f5eae1e80f 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -408,7 +408,7 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 		 (val >> 8) & 0xFF, val & 0xFF);
 
 	d2l_write(tc->i2c, SYSRST, SYS_RST_REG | SYS_RST_DSIRX | SYS_RST_BM |
-		  SYS_RST_LCD | SYS_RST_I2CM | SYS_RST_I2CS);
+		  SYS_RST_LCD | SYS_RST_I2CM);
 	usleep_range(30000, 40000);
 
 	d2l_write(tc->i2c, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
-- 
2.25.1

