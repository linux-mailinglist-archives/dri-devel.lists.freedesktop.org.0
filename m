Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3435790993E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 19:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC4410E21E;
	Sat, 15 Jun 2024 17:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="pKmTAto2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D97410E250
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 17:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1718471748; bh=Z5bcZuna/6T6AIQbROeIpQ8rnzmEdCJTM7frZTMAnTU=;
 b=pKmTAto2AkCgkaY/ZDTnZy0UBjFPIWsfmyZMI9xN7/aQRCHt0OkN7j7lQOIHCfYZSbdtOSao8
 2pit7PJIlQbfBPBBCP7Y7HZx97r3Ny1A2MinRivU9b0M4iCzYhCYhMFDh6d2BAI78dBvlYyT6BM
 3E6ZIbcPjvLWLhB04AfZ4YV9e/EeeUQS3DHmyGrBMmrBG2hcqUlu3em9xWlVgPBplo62uji8T70
 tYzJAqgo77w0mQFpjhJpdrG9ze2CCo8RQZOtvUHDKI6q3rL5d6pE9f1wK0sjA2GeS7sQ/tm+LgO
 H7jdSOOl1S2lpdJLYDDZsXc97+rh4XcsM8krOwldLRtA==
From: Jonas Karlman <jonas@kwiboo.se>
To: dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 "=?UTF-8?q?Heiko=20St=C3=BCbner?=" <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Jonas
 Karlman <jonas@kwiboo.se>, Douglas Anderson <dianders@chromium.org>, Yakir
 Yang <ykk@rock-chips.com>
Subject: [PATCH 11/13] drm/rockchip: dw_hdmi: Use auto-generated tables
Date: Sat, 15 Jun 2024 17:04:02 +0000
Message-ID: <20240615170417.3134517-12-jonas@kwiboo.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240615170417.3134517-1-jonas@kwiboo.se>
References: <20240615170417.3134517-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 666dc9ca24e0254b39804099
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

From: Douglas Anderson <dianders@chromium.org>

The previous tables for mpll_cfg and curr_ctrl were created using the
20-pages of example settings provided by the PHY vendor.  Those
example settings weren't particularly dense, so there were places
where we were guessing what the settings would be for 10-bit and
12-bit (not that we use those anyway).  It was also always a lot of
extra work every time we wanted to add a new clock rate since we had
to cross-reference several tables.

In <https://crrev.com/c/285855> I've gone through the work to figure
out how to generate this table automatically.  Let's now use the
automatically generated table and then we'll never need to look at it
again.

We only support 8-bit mode right now and only support a small number
of clock rates and I've verified that the only 8-bit rate that was
affected was 148.5.  That mode appears to have been wrong in the old
table.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Yakir Yang <ykk@rock-chips.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 104 ++++++++++----------
 1 file changed, 53 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index e532c6d294dc..d9886b1c299c 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -94,74 +94,70 @@ static struct rockchip_hdmi *to_rockchip_hdmi(struct drm_encoder *encoder)
 
 static const struct dw_hdmi_mpll_config rockchip_mpll_cfg[] = {
 	{
-		27000000, {
-			{ 0x00b3, 0x0000},
-			{ 0x2153, 0x0000},
-			{ 0x40f3, 0x0000}
+		30666000, {
+			{ 0x00b3, 0x0000 },
+			{ 0x2153, 0x0000 },
+			{ 0x40f3, 0x0000 },
 		},
 	}, {
-		36000000, {
-			{ 0x00b3, 0x0000},
-			{ 0x2153, 0x0000},
-			{ 0x40f3, 0x0000}
+		36800000, {
+			{ 0x00b3, 0x0000 },
+			{ 0x2153, 0x0000 },
+			{ 0x40a2, 0x0001 },
 		},
 	}, {
-		40000000, {
-			{ 0x00b3, 0x0000},
-			{ 0x2153, 0x0000},
-			{ 0x40f3, 0x0000}
+		46000000, {
+			{ 0x00b3, 0x0000 },
+			{ 0x2142, 0x0001 },
+			{ 0x40a2, 0x0001 },
 		},
 	}, {
-		54000000, {
-			{ 0x0072, 0x0001},
-			{ 0x2142, 0x0001},
-			{ 0x40a2, 0x0001},
+		61333000, {
+			{ 0x0072, 0x0001 },
+			{ 0x2142, 0x0001 },
+			{ 0x40a2, 0x0001 },
 		},
 	}, {
-		65000000, {
-			{ 0x0072, 0x0001},
-			{ 0x2142, 0x0001},
-			{ 0x40a2, 0x0001},
+		73600000, {
+			{ 0x0072, 0x0001 },
+			{ 0x2142, 0x0001 },
+			{ 0x4061, 0x0002 },
 		},
 	}, {
-		66000000, {
-			{ 0x013e, 0x0003},
-			{ 0x217e, 0x0002},
-			{ 0x4061, 0x0002}
+		92000000, {
+			{ 0x0072, 0x0001 },
+			{ 0x2145, 0x0002 },
+			{ 0x4061, 0x0002 },
 		},
 	}, {
-		74250000, {
-			{ 0x0072, 0x0001},
-			{ 0x2145, 0x0002},
-			{ 0x4061, 0x0002}
+		122666000, {
+			{ 0x0051, 0x0002 },
+			{ 0x2145, 0x0002 },
+			{ 0x4061, 0x0002 },
 		},
 	}, {
-		83500000, {
-			{ 0x0072, 0x0001},
+		147200000, {
+			{ 0x0051, 0x0002 },
+			{ 0x2145, 0x0002 },
+			{ 0x4064, 0x0003 },
 		},
 	}, {
-		108000000, {
-			{ 0x0051, 0x0002},
-			{ 0x2145, 0x0002},
-			{ 0x4061, 0x0002}
+		184000000, {
+			{ 0x0051, 0x0002 },
+			{ 0x214c, 0x0003 },
+			{ 0x4064, 0x0003 },
 		},
 	}, {
-		106500000, {
-			{ 0x0051, 0x0002},
-			{ 0x2145, 0x0002},
-			{ 0x4061, 0x0002}
-		},
-	}, {
-		146250000, {
-			{ 0x0051, 0x0002},
-			{ 0x2145, 0x0002},
-			{ 0x4061, 0x0002}
+		226666000, {
+			{ 0x0040, 0x0003 },
+			{ 0x214c, 0x0003 },
+			{ 0x4064, 0x0003 },
 		},
 	}, {
-		148500000, {
-			{ 0x0051, 0x0003},
-			{ 0x214c, 0x0003},
-			{ 0x4064, 0x0003}
+		272000000, {
+			{ 0x0040, 0x0003 },
+			{ 0x214c, 0x0003 },
+			{ 0x5a64, 0x0003 },
 		},
 	}, {
 		340000000, {
@@ -169,11 +165,17 @@ static const struct dw_hdmi_mpll_config rockchip_mpll_cfg[] = {
 			{ 0x3b4c, 0x0003 },
 			{ 0x5a64, 0x0003 },
 		},
+	}, {
+		600000000, {
+			{ 0x1a40, 0x0003 },
+			{ 0x3b4c, 0x0003 },
+			{ 0x5a64, 0x0003 },
+		},
 	}, {
 		~0UL, {
-			{ 0x00a0, 0x000a },
-			{ 0x2001, 0x000f },
-			{ 0x4002, 0x000f },
+			{ 0x0000, 0x0000 },
+			{ 0x0000, 0x0000 },
+			{ 0x0000, 0x0000 },
 		},
 	}
 };
-- 
2.45.2

