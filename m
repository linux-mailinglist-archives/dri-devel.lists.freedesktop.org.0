Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031199A5AA7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 08:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD5610E406;
	Mon, 21 Oct 2024 06:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MBcY1HW1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2073.outbound.protection.outlook.com [40.107.241.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E0C10E406
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:45:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQSFgp2qvOlXULNZ5zn3BCTiofwysJ2G1gzCD9juRw+jAv8w/OC2CX+sR5Ngo8w2Jf90933G2as7osA4DiZZsRCrmmP/oPPgb/vCq1EJI+Xog9DVsPDX9uQxWhmSyd3nfiBzfYllNCfM3gbnBuc0U2jaCwxHHuaaVeyREx+a0u6oKBITQk18Ir5HuVLja5coe260X9JKC1zdi8wFLnzyujXv1o5KNrcKonH6KX+f9B0oFTMCTWPO9STiWLMvz6f4iUktAC3pkYwqfRvCtyzltnojUU2qoITJBDu1yQ7JtwcejsJJ6E+Vet/Msxu8YkaRN4/KrCYA++VL2nfUjuG+VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nt9M2lSJpBGXu4CmRzgoq8sdaw1tL7EcgJLhMx0kBXY=;
 b=IxUadANDkiyUoorkJVaDCnXtEN4laH+a8a1VxZBUGeaIaMwGQ2MQJDqxQ3gS0jPgsY3K4O3TdHaj7w5V4rXqYiqnuBBDNLFO31VdxrjQhorgyvbFEFkYM3fqiRW29+NOq6nIEcbUvwO774VArAvBH0OD9DJFq2I/KCG93XYyS0uwDsi3mluUedlK6EPaB/AAOblxN1ifL9JVpZ8HFPVsC/TTAdKgdW3okN4bSipLAQtjoADw9QgfM34hV0ajAa4jh//Vitely0Cp1aK95Q6URKvTuNCs22D8Utr9H2WwjipQgPNI8thgBT7IYbI1I4dm1DPXrSDuQtHeVAFr/QN+iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nt9M2lSJpBGXu4CmRzgoq8sdaw1tL7EcgJLhMx0kBXY=;
 b=MBcY1HW1sKLA6c03rA8Rmh93LGzgnD8KA8Q5K88os4Mdna98KwaOphi6ndqYIg3i6+KEhI9NbrtWqW8EuzY8OnUEnyUliwder8FycRPZsBft0d1owHdLP/v0jNNgPWxtwrxY4WyCyU75tntWWy+ma8NxDF7OyjtrJPV6nLjwSaNYWuDklg9xprhrFBcepeYjKnfKVAjmdVl9pPabN0usMFvm5/eEd50ZDvjLrhw5dREdSWJiUjv680fpbYcDcgMHfV8RaKVbcsCAqYYR8BivP4HphkrGSiLBe/GDSt5eAx4Hf72XAZq4U4hozMFtPlqMEUjkHnqf8m/uS0khILORdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Mon, 21 Oct
 2024 06:45:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 06:45:50 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v3 03/15] drm/bridge: fsl-ldb: Use clk_round_rate() to
 validate "ldb" clock rate
Date: Mon, 21 Oct 2024 14:44:34 +0800
Message-Id: <20241021064446.263619-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021064446.263619-1-victor.liu@nxp.com>
References: <20241021064446.263619-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:4:91::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 6231fb2e-eba8-441a-686b-08dcf19c0042
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/7e2Z+6qN7v0RO24a90mg7wzDHbbV96SD7PxVnhrIp1qR5mZr66EcYnFOLip?=
 =?us-ascii?Q?0BjqhQBlbtLaJqnLux4UDYXzGn8PMeOdhZOyYYFcRozh/C/e8sQbL12fk8nM?=
 =?us-ascii?Q?zW9ZgtAnkZxaXvMlefzZeJ3wTdoJzcWsr6ddgq30xEMVPEVVJAP59SESPic7?=
 =?us-ascii?Q?DzAoEphkDtuGH0TZEgdeBrMQylu5Uz6mDvp2+foTPrl2XHN8lN1rnMT5ma/I?=
 =?us-ascii?Q?7S+CRVlNZEIWyR41V+L9bK6Ok4ncc7UgWpQsg4Pq+LWF/u6cRJSBFn9JyQW1?=
 =?us-ascii?Q?r722I8nUY75y2eanrbbze0azf98FU/EmYTrB2Lmcpyn2V/Q5JxUTWX89wkNL?=
 =?us-ascii?Q?koRf9wlzUZ7lBwf516lJVdTIFlXFR/5Y1asSNWXuuyJKebF/QohSfiW759aG?=
 =?us-ascii?Q?kAO3gZDTUxQuz8A+d2FY9ZU2kttbshHFGRHajXc6vZXZ9Vacw25eSDDhWt9J?=
 =?us-ascii?Q?EQG3oXklyDWbFTkDTHODZ4Taht1qv3l8B31zSZYMSeg2KyKycV3uGllzxUDe?=
 =?us-ascii?Q?Zmu+K8ggAmx3eofE9DNy8iaRWY83+3bjQXUnYZxYWd0UpBQ1Mb/JNCEEPh4C?=
 =?us-ascii?Q?yQG8IqHGIDiUz+LWQjs18k+AKVO7+THiELgl+tG/F+gzV+OLQYOrHpYKntsh?=
 =?us-ascii?Q?kX17PBqUUPDSHzxIzSR81lLJh/6Bw0TlINB6FZXZF0jxRA5U0rPBU+nfnLSv?=
 =?us-ascii?Q?jqbWhHBA31Wc59t7AaeISDewMmA/vkvK6EpcCzbYgeljVfrlR6HKDJxcpud9?=
 =?us-ascii?Q?vI5fhhW8aSHhbAkJEs5hsHUrDoBtH1m0Hgh9el26fa3WzjU94KvFTwiP2VRQ?=
 =?us-ascii?Q?LIxS8OQmUeR+TKHbFpiEMZVaXp5gYk9NnBbBfpvkwsm0IVjeVMfCxPkUIFON?=
 =?us-ascii?Q?1TIXktlxOHtfRZOBlZGuq+CQr5w+cxOoUCdKtnFLDmX4L71pEeOXkxyqsi+M?=
 =?us-ascii?Q?SK/5AlR7zk9955LFqrA9KhPlRk1m/b8iUBH2ctQ01uKgiKt8sOLnJ1YEClUn?=
 =?us-ascii?Q?A9YDvcQxAbzNKOXxFU0WS+l47n6o2Cz+BACQO9plUsYp/Ge2b6RupQoCqFXb?=
 =?us-ascii?Q?P/2Eht7mZemnjcogv8htHp506jxsxEfS1iFgezXweCNP9KqTrO4Yn7BZP81b?=
 =?us-ascii?Q?YkwQlxwxCjBUg+WfiUCyUyMplQt++hK3G17Zuq6/XN/ge7tRFwgNIPzmXZWj?=
 =?us-ascii?Q?ZZFjQGerUtr+n5H4Rp4FQivz8haDm2t3LeKJJeBRImmX6Y2m0yxuWzeUU+/1?=
 =?us-ascii?Q?T7KY1bqC1x8ZiNFmF+JkbaisNO3DBFRTSfeTlfaQZIe6V9w1nah9nptlRUM+?=
 =?us-ascii?Q?kaakEnsRNS7pqRxQBRmRApYQv2AeIj5GnOKkh2mfqOo3Klbpf5aDvgX8YjJg?=
 =?us-ascii?Q?LJiPg/iU6Jya/9w/BO34IjCXJJTa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o/oeRq33tupiiYU8ek79w0xFufYdHvcV0MTi6f1n2Nsbp/SyOUGsk8u6Oels?=
 =?us-ascii?Q?59AKIAIcw+QSdtEuxHrRKLOvV8updZo7cqc85i+eQgqevZgr/BYlOBUL3Rty?=
 =?us-ascii?Q?IstpfJggWMoavcgCgG7vZQ5BEdsgeZ0Xay7QVb/jzrZU+Je31OK0ejreIahk?=
 =?us-ascii?Q?uG7QhnN6qFhg7jUFqF3k0qYHEUAZaoWb+gCEFq1nD8hdHKFQe57Z7ZoYG0N6?=
 =?us-ascii?Q?AfqcJ6ntsEJYe4x64GxZkSYNJevZczIbwx/1GPRrOv3GGvi2Tmn7YXzP00V7?=
 =?us-ascii?Q?yW/zeb3DEiL7jny+Vc30z7FXufOeVIoKBr77A1Nm1DRBKNfQCwgo7ViFDR5b?=
 =?us-ascii?Q?X8hqflp7Hz+z7zyiIdZNCn/bGTEtl+zkPLK0Up+tuJvMPr0aQO4swn58LMVX?=
 =?us-ascii?Q?1ugpm63U3CLf6IYRG/40DEG3kI4IFWPl1sbVikQEgGngp6Qf/RZ/G7Nh28/3?=
 =?us-ascii?Q?ciwj2FXPHUbSHPJJSCkDDXOZu7uU7syzOTVnq/yZuQ4IQ94sNGRJN4/XENUm?=
 =?us-ascii?Q?DNfoGK0stXv6herD89VNAjDO/txpr7JYWzi7OgCUdCjv7MPDHiIv+ep0B/az?=
 =?us-ascii?Q?ZXfmJ4k6NkYhfbvq8CuVntaPUM5zB4B1KvtTKWLGONtXRSGGV/UU1CGYnPLO?=
 =?us-ascii?Q?ai/z3EIdISLCCzrQBJvqrId/x66FFo23FkD9hMCDBlzEtc9XGu1h3+13i+TX?=
 =?us-ascii?Q?Y8W9W2U4cKZChPHRVDCg9xaLHj6/yMmz64tbKD+wOucol67mpFb1i0zgfwtG?=
 =?us-ascii?Q?SfkjbMqXb5OReNv9tEmtLqAgM39zpHqQDihI/lqet6vKLBFh1UkGgc6yNfb1?=
 =?us-ascii?Q?9vKp6z9IGhsCM68ColvhZBxc2zpM5eaiBHjbUqPhFsycxECjl1QseH/qzXSI?=
 =?us-ascii?Q?aMiihY7Vj0Q2npTQdA2YKhtYce5ZJJxAAaKkrS2DOWk4T8z5EgM7wxJJMcCA?=
 =?us-ascii?Q?Ay8yiYmOX1AXPeNg6H31ZFl+fFKStpcyXyKYBX0I9BTW4+ilRYVQWz0rhiIX?=
 =?us-ascii?Q?8FDTsCIefQYytssXOq4qdLB/zhoMzFnH8shfxnBxC9urd0ESuvw+ve1K9hwg?=
 =?us-ascii?Q?qGLFkezyYebaVqzOgQXHejeVCxXxhBLjG5Gvn54+v7hyuADzKi3k2fLE3KgR?=
 =?us-ascii?Q?qg75QfhPjFrdXa6HYbvqW8uQSGUolavRoGOo2VSAkw+mR1sHg17RJuqWBzDt?=
 =?us-ascii?Q?TxXRBi4eVi8SgfsSVn9YeiD/kBsEEbDBvWjaVV2t/TXBLTVk4xbZB1s2fBa0?=
 =?us-ascii?Q?/QLIaaEXkFXJEnZsp5gAwtLwp9o07Ei13XswIrBYRHqGSk2SOfnA8dtVTIVS?=
 =?us-ascii?Q?NRuI7EJRZlQgTmuvQbgpmh4a3P07Yz2xNh7KUOcVMmiPRDO3Ujiya8SoSNP3?=
 =?us-ascii?Q?TpirS0z65tpW98TlGM+gUDS/F49DOpjHzGEQegDmwnPi60vzj7JFDVBX7UxK?=
 =?us-ascii?Q?LGCto21lJ40IhoztLZ5k5cwp5Tcepj3szKWpLSlHilutHTBJjxYW6RyhU1l0?=
 =?us-ascii?Q?K5vdIZyr4/ewXS3KWlpLQc0UaaJ8EAijpRkHg9WTb6ZjUmqlo7QpPfyVbJcu?=
 =?us-ascii?Q?bprNcVAOagoyR8r5d3xb4PnG5GR3HfiGofh3PMQ3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6231fb2e-eba8-441a-686b-08dcf19c0042
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 06:45:50.3981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OGJSNBLcMXMU7O8xmzNQL9U0sQbmL/fpb0hTtuz94Jpbd/VPvohH4Ly6zMaa85cTiYGpemnnhrQpCpjjMHLvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
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

Multiple display modes could be read from a display device's EDID.
Use clk_round_rate() to validate the "ldb" clock rate for each mode
in drm_bridge_funcs::mode_valid() to filter unsupported modes out.

Also, since this driver doesn't directly reference pixel clock, use
clk_round_rate() to validate the pixel clock rate against the "ldb"
clock if the "ldb" clock and the pixel clock are sibling in clock
tree.  This is not done in display controller driver because
drm_crtc_helper_funcs::mode_valid() may not decide to do the
validation or not if multiple encoders are connected to the CRTC,
e.g., i.MX93 LCDIF may connect with MIPI DSI controller, LDB and
parallel display output simultaneously.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Note that this patch depends on an in-flight patch:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20241017031146.157996-1-marex@denx.de/

v3:
* No change.

v2:
* Add more comments in fsl-ldb.c and commit message about pixel clock
  rate validation.  (Maxime)

 drivers/gpu/drm/bridge/fsl-ldb.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index b559f3e0bef6..77afc169f0d3 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -11,6 +11,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/units.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -64,6 +65,7 @@ struct fsl_ldb_devdata {
 	u32 lvds_ctrl;
 	bool lvds_en_bit;
 	bool single_ctrl_reg;
+	bool ldb_clk_pixel_clk_sibling;
 };
 
 static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
@@ -74,11 +76,13 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 	[IMX8MP_LDB] = {
 		.ldb_ctrl = 0x5c,
 		.lvds_ctrl = 0x128,
+		.ldb_clk_pixel_clk_sibling = true,
 	},
 	[IMX93_LDB] = {
 		.ldb_ctrl = 0x20,
 		.lvds_ctrl = 0x24,
 		.lvds_en_bit = true,
+		.ldb_clk_pixel_clk_sibling = true,
 	},
 };
 
@@ -269,11 +273,31 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 		   const struct drm_display_info *info,
 		   const struct drm_display_mode *mode)
 {
+	unsigned long link_freq, pclk_rate, rounded_pclk_rate;
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
 	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
 		return MODE_CLOCK_HIGH;
 
+	/* Validate "ldb" clock rate. */
+	link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
+	if (link_freq != clk_round_rate(fsl_ldb->clk, link_freq))
+		return MODE_NOCLOCK;
+
+	/*
+	 * Since this driver doesn't directly reference pixel clock and
+	 * display controller driver cannot validate pixel clock due to
+	 * multiple types of encoders connected, use "ldb" clock to
+	 * validate pixel clock rate, if the two clocks are sibling.
+	 */
+	if (fsl_ldb->devdata->ldb_clk_pixel_clk_sibling) {
+		pclk_rate = mode->clock * HZ_PER_KHZ;
+
+		rounded_pclk_rate = clk_round_rate(fsl_ldb->clk, pclk_rate);
+		if (rounded_pclk_rate != pclk_rate)
+			return MODE_NOCLOCK;
+	}
+
 	return MODE_OK;
 }
 
-- 
2.34.1

