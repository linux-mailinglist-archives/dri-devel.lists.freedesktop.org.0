Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D754AED1B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AB710E5B1;
	Wed,  9 Feb 2022 08:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2052.outbound.protection.outlook.com [40.107.22.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6E510E5B1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 08:51:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnqNtWmQzk+C+OFHpa+RgdLKgOhYG51LwEgVaqW8kjfmmasTmqFR28wEAiLK6ez7NpnAd+E/GpomwiWkTGx4UiX5lcTMxY2A449YpxdvPl13QrA4C5VqRU5mxZZZjfX3CIKyeHdTM0YeSL9dqGgCOryJm4p5hrt3rM2EcfzjWuYi65HBDpXE86llqSAenhYVNsubz6CSLM0NsjEw15/9qlWh3DL2CyrzOcyqd69LGlsYLJ6dUq3FPHlH/j+Hi2ahjYkM+0WjOE33A9f+qE1yU9dEhUBEYnqLWUnE0FDVWPZI8jxkMEq8wZ0DdRaxHSRuBv+tTHzzVZhwJ/7HyZ+ChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXWbAHo/uTDOoy57WLUJi+4TuYSVQl0u8t02WxWpJYo=;
 b=Cq1l+7oVTLDGqgxkq1noiKcSjv2D7BxsaNZpdnN60AMED1TTdZ49/l02Ys2h3687ZEDlgxMwmyCp0vStRD6lNmwRw0O2mIcrZNUnI3Pd5x3EN82PMB4SN312UejUr4+8zDbzR8NyevDinDd49LhBrxog3HHTL6e661XJIp1VvW0A3iX8PahybRNWLhg78jigVx/wZHCUHO7/EJrJFNA+Migq+2tXGffWxXZQApVTYD6brOnED7AhOFHTi0EnasUYjIvWUHEHJoSYXotB+Z2qauyWNlkPlF9k1eK43u3xbZlIpWFzaeLIG0xGWFHIeTugkenaWI5ZQR8h3hGSQqNCzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXWbAHo/uTDOoy57WLUJi+4TuYSVQl0u8t02WxWpJYo=;
 b=yEjsfu2ALtJJm8kK+yDuvntDNIhjMVFjyln0MW9LGk5wnN90anmry2SPpRkSTqYPIMPxLBxkNKtQ6GIW1sX3iKwbYu3tmEITi0PQqRMvryS6MJgMz8Y6fcvWxat3UM5V/iaZx6Brj+imURmw0Yr03uUSRX7z1YsE6cASprhV5Mc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com (2603:10a6:3:e1::23)
 by VI1PR08MB2927.eurprd08.prod.outlook.com (2603:10a6:802:21::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 08:51:30 +0000
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56]) by HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56%3]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 08:51:30 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH v5 3/5] arm64: dts: rockchip: add cooling map and trip points
 for gpu to rk356x
Date: Wed,  9 Feb 2022 09:51:08 +0100
Message-Id: <20220209085110.3588035-4-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209085110.3588035-1-michael.riesch@wolfvision.net>
References: <20220209085110.3588035-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0072.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::23) To HE1PR0802MB2426.eurprd08.prod.outlook.com
 (2603:10a6:3:e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7429efa-c291-4a09-0daa-08d9eba95c89
X-MS-TrafficTypeDiagnostic: VI1PR08MB2927:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB292705EC211E542F93900DCEF22E9@VI1PR08MB2927.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QGXaI2lT9p5utY/ZCfOyvevGWiVQwWm/R6Zzn/AKi92XP6C7RdCHI9elJQRRqIR4WbQYrHPV9epUe1WVfUL/aJ7DUoma9prsKYearu++P6Uk97xWZJRs7Xl6iGjEiO8fFGar+rb9K1WqYMBFlmhYFYiBK2I9NDzAH2xP4eVe1Cdb9IFh/mqdpk2CTNKTJxX9LSiEMkCKSeqxcaVQjhjNqSZnGyBwhnsaiRrgndDSYvUrKIDFAZcswUeoo7iL4CnbD9DxHr84BPdSDwf9bIx501slF4dgQbMvKKB+feRaICXaUFNZZuFvYwe2e0dY7PGagfV7m7Bf3LTv/RCb2pBmdtEInOVvPHLCTn/7FsqacVoQWPUkNLXtq52l73PHEueLYPka++5sCWHv73sNfJyc+6aoP8TShJPwo2Gk5aF8zGZE2YcyjhkSsIW7BSzuS++pHReRgeOp0Y09pbqLN3r7i9vzif5EN0aZcTP1H3ib1YeVtuGuwusajGNarEPYB/u7qedPZlJ5AY0XI1T5yILd0MjCVxUWWBdA5LFr58yB6vJI7uDJ1pGr0kWYtNa5xh4JhKJvsWi+ircj7QxCsA5I5TKSm/C+G+bnXcuZknRF+X+FmhOLzMVNDZ94HW0TATpWjq1kt4IVhF5mcjS2wv9W8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0802MB2426.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(66556008)(186003)(4326008)(316002)(66476007)(36756003)(6666004)(44832011)(8676002)(66946007)(7416002)(5660300002)(52116002)(6506007)(86362001)(83380400001)(2616005)(1076003)(8936002)(6486002)(508600001)(38100700002)(2906002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sz0G1n59eGOnX8SebMdRTtRKFF9hDTbVAq9H3HxlcXUbZwKqBzsskhUfF4Wg?=
 =?us-ascii?Q?+YThk2IsfsoisALnIbNObOkzPSkU9bdHfEXMZWrfQdMavQ1kfXAO7yYMtG72?=
 =?us-ascii?Q?5W055SjRRayUGHISTtBMgPOIXgTlLohLofHhEkibC2M76DHk3P949BzUQXZL?=
 =?us-ascii?Q?f8PIXbpBl6M8ACcUfAXtZEsVtfrfOAgK5P5Mmh/7ZXBVDeo32Aj8BOT/nPoI?=
 =?us-ascii?Q?6UYuHo1iJ5YEuTjj8lZ1cfuZTegNFf8Uqeou/JOyL+KZKCZArJlGPixmCGOe?=
 =?us-ascii?Q?CPEqe8BXEv44ktQ1mUO10e9xSPDlrL+AyNuC13KGAru7sIYJc4TwHCYMuvkx?=
 =?us-ascii?Q?WAXUyLaG7gWlEaFhLQbs05jCKrFW/+Z/TYcZV+UElpQMuQwVSHLlrc9j4Njx?=
 =?us-ascii?Q?i+ghW0Pm1QFYbwTXkXfw3hDDDKvtlSp/1B7OnC8WcOc4HRhPTw0TPyc1nIOS?=
 =?us-ascii?Q?8PRVmt1F/4PYY+bIHZMYiRdbNaZSScpk8TjJPkCMBFTCpv64yXUy/pNjAaW/?=
 =?us-ascii?Q?gbYS0L9FUWs1zYhHnoh636nISKLhtnXARbpPHobidOamC2oX9vHK1x2LOOPt?=
 =?us-ascii?Q?LyJung/jcpjWXG8dg0pE98HkGZDJmHFW0gOaeNjLntmHs78F05d8hV84SLmi?=
 =?us-ascii?Q?w9IZX/qBR5cy3fo6iP+ryjmoI5eQuUVMlmus8WBQw5b1DaqwGAEdR+eSEVIQ?=
 =?us-ascii?Q?xKQDALHnrKhEeMJLkzUCHy3MzuATQf437JrkoV0NFjGBesvOuGtoArypjUW8?=
 =?us-ascii?Q?U8PFa3Jx9wEgZ7YWNje/N7m91IA2H9Mal4LSMeSG4kSNN0e6aovYI6fQ8sQ+?=
 =?us-ascii?Q?f8dqnwo2epv22iUNBPSDikVBHJvycb0LXIkNjpl3Ec6nDRkigAtfDfc0o0Ah?=
 =?us-ascii?Q?Ubua/RC+59ZrZy0ehRTqf5R9FcpxWo48d3lSFRtZne0JJzb7J6H+Kl1ebHMx?=
 =?us-ascii?Q?U3vniCswd1msvrS8HRX5l9tH2psOfHAsBUSRZYUqwiJxh1Jo1TCtV1snP1IR?=
 =?us-ascii?Q?0kaBqj7QoULV3PC1ahZgp5O7uTAVQ/Xo/ip4CJsZwluoMEh9j6bClpovQCZO?=
 =?us-ascii?Q?RKxjqe1mdVEQ2q+mosKMWn8Yega5nJzkHNP30Vcc/UOD43sBi4zB2+JVln5f?=
 =?us-ascii?Q?3Gj0hLtrNpZdwVeiHTeGiM6LHQN7T5nEvRsPP9ERhI5WXEqpb+Z7lRblrtS/?=
 =?us-ascii?Q?UVaoyfAhnKKV1tOvTe5PBHDg6hrM04ssnPreoxmJWvj/Kjh+8jV1ygN4+Vtv?=
 =?us-ascii?Q?1fQleHB6OpJ5mk838gsyh1AoEfcE858EWt6XfgYGLDAHtAlrEtYJW1++EhZ6?=
 =?us-ascii?Q?zb5avZ/Lwz0zlGJ57uHn1gPkEJtlMQKn+jTQLagWnbb0xrtvyPJykVSDLkoY?=
 =?us-ascii?Q?x+K5z7pN7r7OM0UzR1fPpuF/n9lt0txXE4EuyYdUAiVJpp1tTaGATN/ngGZ5?=
 =?us-ascii?Q?KuZfbBAOjQCU9dE9aq92hPQeNcjljaaz8F5rJb8LgnnTCTiThpaCk83OAvJZ?=
 =?us-ascii?Q?8GxXWwHJ+LraLO+gkSAs2AXM04oxrlk60sLAOtFccRITIrNctGHDHou7cLJx?=
 =?us-ascii?Q?RMIOTsnc8bV948501JI89cM4V0oCA+0ELdDCn35o7B9/MYVMUfki9PMaE5td?=
 =?us-ascii?Q?nxbIgog0+HaaTnsw2b/U8vi9Svuc9PtYJU+xw9pP1d3s5eO2FVDB/q7eqFXt?=
 =?us-ascii?Q?t/kPwdWinOctVih1gHd0/qXkBSCWKPNUC+qB8ObrywVBL3EUWYlc9dCXnmoS?=
 =?us-ascii?Q?Ce4DItSaUmT2bZc5KZSnWjOLbVs+EPs=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d7429efa-c291-4a09-0daa-08d9eba95c89
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0802MB2426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 08:51:28.5840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92QPDRL2yoDdO1bnaPW5WHk3NqGB1IcjEFDV1g5xfhd+ZeYQPIsnt8R6Yms7H+jvHLpnuVnk//TwK8QMHqlT/mv0vmvZ8roWGPLB2zpXVM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2927
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alex Bee <knaerzche@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Liang Chen <cl@rock-chips.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Bee <knaerzche@gmail.com>

RK356x SoCs have a second thermal sensor for the GPU. This adds the
cooling map and trip points for it to make use of its contribution as
a cooling device.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 arch/arm64/boot/dts/rockchip/rk356x.dtsi | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index 47484305b7a4..2334fed4620f 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -1093,6 +1093,33 @@ gpu_thermal: gpu-thermal {
 			polling-delay = <1000>; /* milliseconds */
 
 			thermal-sensors = <&tsadc 1>;
+
+			trips {
+				gpu_threshold: gpu-threshold {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				gpu_target: gpu-target {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				gpu_crit: gpu-crit {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_target>;
+					cooling-device =
+						<&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 		};
 	};
 
-- 
2.30.2

