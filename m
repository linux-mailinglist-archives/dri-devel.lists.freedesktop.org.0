Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0884B256658
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077076EC11;
	Sat, 29 Aug 2020 09:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838406E497
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 11:13:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nV4W5XATDNDk5Bvz8GwTa6L1EBtXx4Vj1JXvLb2nIvWXeSeTBwqGXq2EFn4VPREIpZmQmn97u5sFzI+GvRWwGvh6yilSJ2gk6sNM9tg2N3icLUKdSdnOWG+sfibhq+iy4yNZQTrrgKoo20OxReHtmixJ2QHW7cmETPxuePfV+VZIhnxTcK3r+5T0BPRjC4CG9rxcD6vQ3Mk1ILzNeunSlYmeE0lI1r94DW5B5CHfR6WdxN+tNHl5hr3NAxINGeKCQFkYPcJw1qQlGb8tLe/fVL5a3DPh9XmEK1/zIObmq78HP+JvHJJ9ylsShoQgQ0QY/qQPIVcUXUS1dN6nLAyzGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzRpfAQbCtY1zBNGauz8qzxZAR5y4dJlyx2ip4qmhBY=;
 b=oLrk5gY7hqsYOJxUC1SesunWadQE6krAOeqv47inppUK0om7g0HAE/w8udN220CHeNr6gaxsAqns0W6ktxUcbTNFQ2vBuWepll31E1Pt3lJY2YCtW9SJ3/O59akXXE3gIlbOn+fWJDVjvCdKOqlTnknH4PTbcdIvapIb+6p38N6a6N9eA8jTcgXwSASJVRicTBOFds3GvfoICYcIJWoAR1+T3RnN5uFOtZGYC+Aa4S+Yx9d7b7IPeIAh9N2zzpfaB/sUzr5qc55+9OJBE+d8QO9rmefg40cRq+b2Zjjp2UO5c2qIOE+l/TTZjp2Z2LbSpI0/c582oe+EU0II02WNBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzRpfAQbCtY1zBNGauz8qzxZAR5y4dJlyx2ip4qmhBY=;
 b=g0Hlcxj5DC/ew45it+W+31ruMRHg1nBf5JiEUjoqglSiq2TLGUh09KrR9ZRKU3TYiezP7mACu3BXt9AoMJyC3aTmB+Kb/9VrVzh8Xj8SKTQlsclLKkKeGdoJUt68YYI3Csu75ozokR8lKrbSPjk4kV7gSugOc/Odwr00NajDJNU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0401MB2598.eurprd04.prod.outlook.com (2603:10a6:4:39::7)
 by DBAPR04MB7413.eurprd04.prod.outlook.com (2603:10a6:10:1a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Fri, 28 Aug
 2020 11:13:43 +0000
Received: from DB6PR0401MB2598.eurprd04.prod.outlook.com
 ([fe80::19ed:520c:8c98:e334]) by DB6PR0401MB2598.eurprd04.prod.outlook.com
 ([fe80::19ed:520c:8c98:e334%4]) with mapi id 15.20.3326.023; Fri, 28 Aug 2020
 11:13:43 +0000
From: "Robert Chiras (OSS)" <robert.chiras@oss.nxp.com>
To: Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Fabio Estevam <festevam@gmail.com>, Ondrej Jirman <megous@megous.com>
Subject: [PATCH 1/5] drm/bridge: nwl-dsi: Add support for video_pll
Date: Fri, 28 Aug 2020 14:13:28 +0300
Message-Id: <1598613212-1113-2-git-send-email-robert.chiras@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598613212-1113-1-git-send-email-robert.chiras@oss.nxp.com>
References: <1598613212-1113-1-git-send-email-robert.chiras@oss.nxp.com>
X-ClientProxiedBy: AM3PR07CA0114.eurprd07.prod.outlook.com
 (2603:10a6:207:7::24) To DB6PR0401MB2598.eurprd04.prod.outlook.com
 (2603:10a6:4:39::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-120.ea.freescale.net (83.217.231.2) by
 AM3PR07CA0114.eurprd07.prod.outlook.com (2603:10a6:207:7::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3348.7 via Frontend Transport; Fri, 28 Aug 2020 11:13:41 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e1c56df3-fc6d-49c1-2982-08d84b436c66
X-MS-TrafficTypeDiagnostic: DBAPR04MB7413:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB74139EA006690F26237B5264A2520@DBAPR04MB7413.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uoRz0oyk3KkTgCVhSGMsfMPDl50b5HEFgpdtCInHdpw0gUHrytAywuWdYtVlzapYZoFQJ2vSaHjuufoWX8GgM16F6kw3u+a1mRYfFs79r5d89S/rhCT8eLG8CcszxvjpMIxetd4ym13l1H946VUqj3o/ahBUfzD0dZKl6KgPcaNj/OeLioghxkdu5JE9e2wlCjOEUcZU9GFZ7IddyAC7ZaAi59eBp4hVw/qzfk2qCQnkHTmQbYnF2B8WGwEXJ0ZgWUpghbWyePCeb2SyfE/RwKfS+JwkOlfTTttU1XukevtLGRNzE0tXOcSmesOFG6OLQTPiGg1FqeZpGflur0RNMTqGf8J9W+q0PoxhfXadWqXQYnXFG59JxU9EKlIbhC23
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0401MB2598.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(16526019)(52116002)(86362001)(26005)(316002)(8676002)(6486002)(66556008)(30864003)(8936002)(2616005)(54906003)(66946007)(6512007)(6506007)(186003)(478600001)(66476007)(7416002)(110136005)(2906002)(83380400001)(6666004)(5660300002)(956004)(4326008)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: qJZEydrk4CcE1LOWHBwPOYwUmiy5eAW7u/928ceBPCkklpzfRn4XNP3NSuQWHwUZiFq2Z7LT4X5NCPQkeaVYKfihskiON97795ZfBLLwGXs1LnpTCv+/C3mzQYIZBmk9qn30fbM9D/UT/W6ic1oYLBrYg1+RCzxrUVWUvBlcn9TIfGi2ItZYsnYW5off9mo7OdGJVPa6N80vJ+yrLc1i/7B2/pX9Z8Q9ygdcqTqTe/XyIwpqm/jLY8g1NJL3WxXZQby6adLt2RLFyeZ1zXTjbxkaPJR/4TOyzOC4YpnCHbaK43jWl4EDGvXBiPvpjq60l/xw4+YMEDo695WreldmTVr8dvl2/JPS0k0+llTHxSe8jt0YnRe3b9EYol9eRSHjOtv7HA0KnBfCdny56SKbDkcLc1X+deUMWEcUqPlWZQBTld9DmNJbd/JUcvMfVXfHxEzZhCHvto375iY8JXorYLOODq+UjDhYnFN+VDhT58/ejk+L9D/GJ6Nu0lQY8SghQJDNfJX0jN2tBahVh8bxPfWykD80gnJeLRwVoI72RfHp26+22mWWy+pw8Ka1pg8qed/LcKyk8n4zRCUVux7/ih6yTx9tb3AhHuKeWVAmz4LRQf/VKOe+9G6bdOy3N3wmab+LFCSdNWFKf97VjDbIlA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c56df3-fc6d-49c1-2982-08d84b436c66
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0401MB2598.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 11:13:42.9610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbTLSbP/ytJZGTdgCchFpNyzNj//zssV77t9CYd5piBjgf+Tt/hMHXjoQDFxwCVcaZK8n0qAsi7z+xj6yryBhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7413
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Chiras <robert.chiras@nxp.com>

This patch adds support for a new clock 'video_pll' in order to better
set the video_pll clock to a clock-rate that satisfies a mode's clock.
The video PLL, on i.MX8MQ, can drive both DC pixel-clock and DSI phy_ref
clock. When used with a bridge that can drive multiple modes, like a DSI
to HDMI bridge, the DSI can't be statically configured for a specific
mode in the DTS file.
So, this patch adds access to the video PLL inside the DSI driver, so
that modes can be filtered-out if the required combination of phy_ref
and pixel-clock can't be achieved using the video PLL.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 318 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 313 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index ce94f79..1228466 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -39,6 +39,20 @@
 
 #define NWL_DSI_MIPI_FIFO_TIMEOUT msecs_to_jiffies(500)
 
+/* Maximum Video PLL frequency: 1.2GHz */
+#define MAX_PLL_FREQ 1200000000
+
+#define MBPS(x) ((x) * 1000000)
+#define MIN_PHY_RATE MBPS(24)
+#define MAX_PHY_RATE MBPS(30)
+
+/* Possible valid PHY reference clock rates*/
+static u32 phyref_rates[] = {
+	27000000,
+	25000000,
+	24000000,
+};
+
 enum transfer_direction {
 	DSI_PACKET_SEND,
 	DSI_PACKET_RECEIVE,
@@ -67,6 +81,17 @@ struct nwl_dsi_transfer {
 	size_t rx_len; /* in bytes */
 };
 
+struct mode_config {
+	int				clock;
+	int				crtc_clock;
+	unsigned int			lanes;
+	unsigned long			bitclock;
+	unsigned long			phy_rates[3];
+	unsigned long			pll_rates[3];
+	int				phy_rate_idx;
+	struct list_head		list;
+};
+
 struct nwl_dsi {
 	struct drm_bridge bridge;
 	struct mipi_dsi_host dsi_host;
@@ -101,6 +126,7 @@ struct nwl_dsi {
 	struct clk *rx_esc_clk;
 	struct clk *tx_esc_clk;
 	struct clk *core_clk;
+	struct clk *pll_clk;
 	/*
 	 * hardware bug: the i.MX8MQ needs this clock on during reset
 	 * even when not using LCDIF.
@@ -115,6 +141,7 @@ struct nwl_dsi {
 	int error;
 
 	struct nwl_dsi_transfer *xfer;
+	struct list_head valid_modes;
 };
 
 static const struct regmap_config nwl_dsi_regmap_config = {
@@ -778,6 +805,207 @@ static void nwl_dsi_bridge_disable(struct drm_bridge *bridge)
 	pm_runtime_put(dsi->dev);
 }
 
+static unsigned long nwl_dsi_get_bit_clock(struct nwl_dsi *dsi,
+		unsigned long pixclock, u32 lanes)
+{
+	int bpp;
+
+	if (lanes < 1 || lanes > 4)
+		return 0;
+
+	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+
+	return (pixclock * bpp) / lanes;
+}
+
+/*
+ * Utility function to calculate least commom multiple, using an improved
+ * version of the Euclidean algorithm for greatest common factor.
+ */
+static unsigned long nwl_dsi_get_lcm(unsigned long a, unsigned long b)
+{
+	u32 gcf = 0; /* greatest common factor */
+	unsigned long tmp_a = a;
+	unsigned long tmp_b = b;
+
+	if (!a || !b)
+		return 0;
+
+	while (tmp_a % tmp_b) {
+		gcf = tmp_a % tmp_b;
+		tmp_a = tmp_b;
+		tmp_b = gcf;
+	}
+
+	if (!gcf)
+		return a;
+
+	return ((unsigned long long)a * b) / gcf;
+}
+
+/*
+ * This function tries to adjust the crtc_clock for a DSI device in such a way
+ * that the video pll will be able to satisfy both Display Controller pixel
+ * clock (feeding out DPI interface) and our input phy_ref clock.
+ */
+static void nwl_dsi_setup_pll_config(struct mode_config *config)
+{
+	unsigned long pll_rate;
+	int div;
+	size_t i, num_rates = ARRAY_SIZE(config->phy_rates);
+
+	config->crtc_clock = 0;
+
+	for (i = 0; i < num_rates; i++) {
+		int crtc_clock;
+
+		if (!config->phy_rates[i])
+			break;
+		/*
+		 * First, we need to check if phy_ref can actually be obtained
+		 * from pixel clock. To do this, we check their lowest common
+		 * multiple, which has to be in PLL range.
+		 */
+		pll_rate = nwl_dsi_get_lcm(config->clock, config->phy_rates[i]);
+		if (pll_rate > MAX_PLL_FREQ) {
+			/* Drop pll_rate to a realistic value */
+			while (pll_rate > MAX_PLL_FREQ)
+				pll_rate >>= 1;
+			/* Make sure pll_rate can provide phy_ref rate */
+			div = DIV_ROUND_UP(pll_rate, config->phy_rates[i]);
+			pll_rate = config->phy_rates[i] * div;
+		} else {
+			/*
+			 * Increase the pll rate to highest possible rate for
+			 * better accuracy.
+			 */
+			while (pll_rate <= MAX_PLL_FREQ)
+				pll_rate <<= 1;
+			pll_rate >>= 1;
+		}
+
+		/*
+		 * Next, we need to tweak the pll_rate to a value that can also
+		 * satisfy the crtc_clock.
+		 */
+		div = DIV_ROUND_CLOSEST(pll_rate, config->clock);
+		if (lvl)
+			pll_rate -= config->phy_rates[i] * lvl;
+		crtc_clock = pll_rate / div;
+		config->pll_rates[i] = pll_rate;
+
+		/*
+		 * Pick a crtc_clock which is closest to pixel clock.
+		 * Also, make sure that the pixel clock is a multiply of
+		 * 50Hz.
+		 */
+		if (!(crtc_clock % 50) &&
+		    abs(config->clock - crtc_clock) <
+		    abs(config->clock - config->crtc_clock)) {
+			config->crtc_clock = crtc_clock;
+			config->phy_rate_idx = i;
+		}
+	}
+}
+
+
+/*
+ * This function will try the required phy speed for current mode
+ * If the phy speed can be achieved, the phy will save the speed
+ * configuration
+ */
+static struct mode_config *nwl_dsi_mode_probe(struct nwl_dsi *dsi,
+			    const struct drm_display_mode *mode)
+{
+	struct device *dev = dsi->dev;
+	struct mode_config *config;
+	union phy_configure_opts phy_opts;
+	unsigned long clock = mode->clock * 1000;
+	unsigned long bit_clk = 0;
+	unsigned long phy_rates[3] = {0};
+	int match_rates = 0;
+	u32 lanes = dsi->lanes;
+	size_t i = 0, num_rates = ARRAY_SIZE(phyref_rates);
+
+	list_for_each_entry(config, &dsi->valid_modes, list)
+		if (config->clock == clock)
+			return config;
+
+	phy_mipi_dphy_get_default_config(clock,
+			mipi_dsi_pixel_format_to_bpp(dsi->format),
+			lanes, &phy_opts.mipi_dphy);
+	phy_opts.mipi_dphy.lp_clk_rate = clk_get_rate(dsi->tx_esc_clk);
+
+	while (i < num_rates) {
+		int ret;
+
+		bit_clk = nwl_dsi_get_bit_clock(dsi, clock, lanes);
+
+		clk_set_rate(dsi->pll_clk, phyref_rates[i] * 32);
+		clk_set_rate(dsi->phy_ref_clk, phyref_rates[i]);
+		ret = phy_validate(dsi->phy, PHY_MODE_MIPI_DPHY, 0, &phy_opts);
+
+		/* Pick the non-failing rate, and search for more */
+		if (!ret) {
+			phy_rates[match_rates++] = phyref_rates[i++];
+			continue;
+		}
+
+		if (match_rates)
+			break;
+
+		/* Reached the end of phyref_rates, try another lane config */
+		if ((i++ == num_rates - 1) && (--lanes > 2)) {
+			i = 0;
+			continue;
+		}
+	}
+
+	/*
+	 * Try swinging between min and max pll rates and see what rate (in terms
+	 * of kHz) we can custom use to get the required bit-clock.
+	 */
+	if (!match_rates) {
+		int min_div, max_div;
+		int bit_clk_khz;
+
+		lanes = dsi->lanes;
+		bit_clk = nwl_dsi_get_bit_clock(dsi, clock, lanes);
+
+		min_div = DIV_ROUND_UP(bit_clk, MAX_PHY_RATE);
+		max_div = DIV_ROUND_DOWN_ULL(bit_clk, MIN_PHY_RATE);
+		bit_clk_khz = bit_clk / 1000;
+
+		for (i = max_div; i > min_div; i--) {
+			if (!(bit_clk_khz % i)) {
+				phy_rates[0] = bit_clk / i;
+				match_rates = 1;
+				break;
+			}
+		}
+	}
+
+	if (!match_rates) {
+		DRM_DEV_DEBUG_DRIVER(dev,
+			"Cannot setup PHY for mode: %ux%u @%d kHz\n",
+			mode->hdisplay,
+			mode->vdisplay,
+			mode->clock);
+
+		return NULL;
+	}
+
+	config = devm_kzalloc(dsi->dev, sizeof(struct mode_config), GFP_KERNEL);
+	config->clock = clock;
+	config->lanes = lanes;
+	config->bitclock = bit_clk;
+	memcpy(&config->phy_rates, &phy_rates, sizeof(phy_rates));
+	list_add(&config->list, &dsi->valid_modes);
+
+	return config;
+}
+
+
 static int nwl_dsi_get_dphy_params(struct nwl_dsi *dsi,
 				   const struct drm_display_mode *mode,
 				   union phy_configure_opts *phy_opts)
@@ -809,6 +1037,38 @@ static bool nwl_dsi_bridge_mode_fixup(struct drm_bridge *bridge,
 				      const struct drm_display_mode *mode,
 				      struct drm_display_mode *adjusted_mode)
 {
+	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
+	struct mode_config *config;
+	unsigned long pll_rate;
+
+	DRM_DEV_DEBUG_DRIVER(dsi->dev, "Fixup mode:\n");
+	drm_mode_debug_printmodeline(adjusted_mode);
+
+	config = nwl_dsi_mode_probe(dsi, adjusted_mode);
+	if (!config)
+		return false;
+
+	DRM_DEV_DEBUG_DRIVER(dsi->dev, "lanes=%u, data_rate=%lu\n",
+			     config->lanes, config->bitclock);
+	if (config->lanes < 2 || config->lanes > 4)
+		return false;
+
+	/* Max data rate for this controller is 1.5Gbps */
+	if (config->bitclock > 1500000000)
+		return false;
+
+	pll_rate = config->pll_rates[config->phy_rate_idx];
+	if (dsi->pll_clk && pll_rate) {
+		clk_set_rate(dsi->pll_clk, pll_rate);
+		DRM_DEV_DEBUG_DRIVER(dsi->dev,
+				     "Video pll rate: %lu (actual: %lu)",
+				     pll_rate, clk_get_rate(dsi->pll_clk));
+	}
+	/* Update the crtc_clock to be used by display controller */
+	if (config->crtc_clock)
+		adjusted_mode->crtc_clock = config->crtc_clock / 1000;
+
+
 	/* At least LCDIF + NWL needs active high sync */
 	adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
 	adjusted_mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
@@ -822,14 +1082,29 @@ nwl_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 			  const struct drm_display_mode *mode)
 {
 	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
-	int bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+	struct mode_config *config;
+	unsigned long pll_rate;
+	int bit_rate;
 
-	if (mode->clock * bpp > 15000000 * dsi->lanes)
+	bit_rate = nwl_dsi_get_bit_clock(dsi, mode->clock * 1000, dsi->lanes);
+
+	DRM_DEV_DEBUG_DRIVER(dsi->dev, "Validating mode:");
+	drm_mode_debug_printmodeline(mode);
+
+	if (bit_rate > MBPS(1500))
 		return MODE_CLOCK_HIGH;
 
-	if (mode->clock * bpp < 80000 * dsi->lanes)
+	if (bit_rate < MBPS(80))
 		return MODE_CLOCK_LOW;
 
+	config = nwl_dsi_mode_probe(dsi, mode);
+	if (!config)
+		return MODE_NOCLOCK;
+
+	pll_rate = config->pll_rates[config->phy_rate_idx];
+	if (dsi->pll_clk && !pll_rate)
+		nwl_dsi_setup_pll_config(config);
+
 	return MODE_OK;
 }
 
@@ -842,8 +1117,22 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
 	struct device *dev = dsi->dev;
 	union phy_configure_opts new_cfg;
 	unsigned long phy_ref_rate;
+	struct mode_config *config;
 	int ret;
 
+	DRM_DEV_DEBUG_DRIVER(dsi->dev, "Setting mode:\n");
+	drm_mode_debug_printmodeline(adjusted_mode);
+
+	config = nwl_dsi_mode_probe(dsi, adjusted_mode);
+	/* New mode? This should NOT happen */
+	if (!config) {
+		DRM_DEV_ERROR(dsi->dev, "Unsupported mode provided:\n");
+		drm_mode_debug_printmodeline(adjusted_mode);
+		return;
+	}
+
+	phy_ref_rate = config->phy_rates[config->phy_rate_idx];
+	clk_set_rate(dsi->phy_ref_clk, phy_ref_rate);
 	ret = nwl_dsi_get_dphy_params(dsi, adjusted_mode, &new_cfg);
 	if (ret < 0)
 		return;
@@ -855,8 +1144,10 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
 	if (new_cfg.mipi_dphy.hs_clk_rate == dsi->phy_cfg.mipi_dphy.hs_clk_rate)
 		return;
 
-	phy_ref_rate = clk_get_rate(dsi->phy_ref_clk);
-	DRM_DEV_DEBUG_DRIVER(dev, "PHY at ref rate: %lu\n", phy_ref_rate);
+	DRM_DEV_DEBUG_DRIVER(dev,
+			     "PHY at ref rate: %lu (actual: %lu)\n",
+			     phy_ref_rate, clk_get_rate(dsi->phy_ref_clk));
+
 	/* Save the new desired phy config */
 	memcpy(&dsi->phy_cfg, &new_cfg, sizeof(new_cfg));
 
@@ -1014,6 +1305,12 @@ static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)
 	}
 	dsi->tx_esc_clk = clk;
 
+	/* The video_pll clock is optional */
+	clk = devm_clk_get(dsi->dev, "video_pll");
+	if (!IS_ERR(clk))
+		dsi->pll_clk = clk;
+
+
 	dsi->mux = devm_mux_control_get(dsi->dev, NULL);
 	if (IS_ERR(dsi->mux)) {
 		ret = PTR_ERR(dsi->mux);
@@ -1066,6 +1363,9 @@ static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)
 			      PTR_ERR(dsi->rst_dpi));
 		return PTR_ERR(dsi->rst_dpi);
 	}
+
+	INIT_LIST_HEAD(&dsi->valid_modes);
+
 	return 0;
 }
 
@@ -1184,6 +1484,14 @@ static int nwl_dsi_probe(struct platform_device *pdev)
 static int nwl_dsi_remove(struct platform_device *pdev)
 {
 	struct nwl_dsi *dsi = platform_get_drvdata(pdev);
+	struct mode_config *config;
+	struct list_head *pos, *tmp;
+
+	list_for_each_safe(pos, tmp, &dsi->valid_modes) {
+		config = list_entry(pos, struct mode_config, list);
+		list_del(pos);
+		devm_kfree(dsi->dev, config);
+	}
 
 	nwl_dsi_deselect_input(dsi);
 	mipi_dsi_host_unregister(&dsi->dsi_host);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
