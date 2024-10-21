Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779B69A5AA1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 08:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF91110E2D5;
	Mon, 21 Oct 2024 06:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ccYMRUaQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2046.outbound.protection.outlook.com [40.107.241.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E3F10E2D5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:45:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/ScHWseTNkP4hUzje9QGjDw+ubnsmCHRJd3mPWiDfYaO3WqU6XxFe6HY8hqhwon3S+kuOwatlDTOEJFi71DtWoh0te35WfJBa7SdPWmK++jO0InabPG9xfOyd2Kp0dpETYpr4q4QhIwhd5LigZ6oBsSRW+l6cn35qLoFFVqeiZoWbvoZDdWUhswD/tXNilIyDpRaxu/xvwLxXVORDQkhV1opK54tLHvA37oVDnneVpMbS3MmN56klN6hi4nVUiS9+0RqwOotr5akr9Vy2ptQ9yXdwqkvgDG9y0TMRg7n/2I5CH9amXss6Nl3P+WH3KkiszHfbuyvJIfIZtCgwb0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qviRWjgRu+MTtK9FPhR1DN66q13nYR+CR1/uX4EguI=;
 b=OGGXA17ZdSQFZjPExXw+m6UStL6w4k3tB5kE7JlOpydQAJuY8c4Q8kG4Bsbx2C2dH64a896tHaSxuWPGuRDkDadz5SuzJeAGVRTtXktM3DuCRKRMwLHeRLwePlLicuWGHUas24ctxFFMQYSc20KwrzjrwdpbYtx8FL4/hw3ENXqtjgSJbsOWYbHJAlPMwLOIrnhHmOEAJ/tjGYcQ0AGTh3lru2nUJ+etU/2wUI9Nqgp+UF5aSZqz+IZWEKQ2zYJnUlY/d0LlU99Ns76YRr+FPTwcwcTvdabkpIJ+18SQQWuucQZnIJ/jqSaJ1JtL4elDwK0ZA2eN2oTCXo4heKRygQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qviRWjgRu+MTtK9FPhR1DN66q13nYR+CR1/uX4EguI=;
 b=ccYMRUaQA0bN6vowguGhft+kSQ7tg9yojXzDzuqr+lx/zYNjZMrosuiyjM5A9HqH29ikS5Zq2NxdD1WctqnGOrGZU5XpEXWBIeTHBoZKGbAFD+hJ9CPHII+SPHgNA3TZclvKjtBqH9opVT0HMu4gk/9OV72O4ACX0d8yfLCKS8S5eHhvRbm66Mx1zU6iLU38q03nV4OVianIu7aImrC3T6eYvXNehjz3zp/mKmvn/bysQkY090nDK65DqV18J4dFsUxbLv0koNTB9RtN71wyMjG29kSI1Q3DPJFLRRR7iGCUwaRyk0poqhxCeGMlJGPBheV1diz0kCQOTzDz1zdFsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Mon, 21 Oct
 2024 06:45:29 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 06:45:29 +0000
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
Subject: [PATCH v3 01/15] arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Set
 "media_disp2_pix" clock rate to 70MHz
Date: Mon, 21 Oct 2024 14:44:32 +0800
Message-Id: <20241021064446.263619-2-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f4ed54df-e8fc-4424-e10b-08dcf19bf388
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0rITHi/CWD3/6zD9QCyLfOwC1ZqOJBh9tgVgm56dICowBYAj1vd/pisuZ99h?=
 =?us-ascii?Q?bBiLTcWL2SZlG92GyThs3KoQOY7MfDYoRnRCr0EXU1oFFC8Kxq1dk/EvNRYH?=
 =?us-ascii?Q?HSg+cgTXZuFyxstl3K6QmJJw3FcwycBQih//eZRPb2TC3InIy+NoK2kcCp1b?=
 =?us-ascii?Q?ZLN3rULbBU6PakOTYPzcr8ynnD1/vEcoTyakRyjuAy8bssMl681CLuMeVn5m?=
 =?us-ascii?Q?ThcFcLbhK03JcbW+qXRmh5ChvnugbjxcxHuabFC1bjczbvUwwwu95euIr3Ex?=
 =?us-ascii?Q?77lrtAq90P3AhCmW0Yk9oM6LSyeifaxc0vN4pld7L+vHidR0OX3WNXA2CWCH?=
 =?us-ascii?Q?FQ9yWYY5uSgMZ4fE2Rt5SyleC0j1qo9rYtjQ3TwYoMI7n+P4z+tNKP9yVqIc?=
 =?us-ascii?Q?cN355Qxu+lMa6zEd1tU9SKdQmtX2dL+qDxs921nzw3cVbufu/6JBRFU31s8O?=
 =?us-ascii?Q?agAZPi7tyWESwqXjOYPgvYayEEo11vPN16Uw+YBMeWyM1RRRGxaYJeTa0qx9?=
 =?us-ascii?Q?RZXX1YPTkdcESRsbmP3F+kKEQG3rRFfnC/lzPRi30TkIopxRMmX035Q6sMlV?=
 =?us-ascii?Q?uFz0BWu/Mql7LXTWBYTv388GhC2CocLWsAmJc7jxXUdOvcDKIRSavwbSeU2D?=
 =?us-ascii?Q?ddm17YUoKA+l0jSO8P+3ohrpmRFdxUvQsYVl6nLoQ7uXYXBYDtc5WNYbp6Ns?=
 =?us-ascii?Q?mGXdVClx0ftoXNfOoECkWCoYQ5DAdGlWjEnBYfKBHbJ53wzFmrNAhi4iRHle?=
 =?us-ascii?Q?1vnqY3yT6RrWA2JacBo4kU3Y2HTbVs1P0CSQ093bfK9BpeLrbD41kmVRMLSj?=
 =?us-ascii?Q?2SSlfRhk+c2qhTjZqCcF4dtQlDxYfFmFtL+UV8nECOEmJ5518dEf9uE21yNA?=
 =?us-ascii?Q?7FdY+WQ8EKhQ0jAaIbiji2mPtBwqxh+FyGlykIy7PdaMMQu99gkO5rfJtW1Y?=
 =?us-ascii?Q?UKWwBw3y/9BMusFaY4MjIPYAhg08+pQr06GGvtWO6ceyhnc7vc39KKlug9RA?=
 =?us-ascii?Q?E097j+p4YpI+4kaaufXRa1EMtBAvwJQaCMEB2jJHBhV1Xbz7L0Q07eC1E4dL?=
 =?us-ascii?Q?kI2DqefGd3qbZ84KMh0T3+FTwnpmtg2t/xwfPNBqbYUFXUc8FEJxVndmL9Jh?=
 =?us-ascii?Q?eFnSAFi4w5KTyY7WwoJtFTPvGzZQlC8bqu1G9a4VrBnD333riq6c4URqnBQJ?=
 =?us-ascii?Q?r8GgC1xh5LcEOAmYwza9KBfSEWra6aPfjmgLXB7nvdlpwUGBVPZ9KA3NUk8x?=
 =?us-ascii?Q?tWh+H8BOtiydwz1y2azmzYAYnu3Yhs4fxS9ShlCZ4k8GzlN5s+mYZY/uTXRf?=
 =?us-ascii?Q?8Hg93aMQKe2Sub6ZxKccQ8/p0UZlxqmHkFNwuDmpEUI/huHU9+avxS2F9Pvg?=
 =?us-ascii?Q?a7FGeEE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RjN1OIxTxxg5s/7X8Hh9MayzQiHoh+94EnAjix6WTBMFkhq/GCxeigY1KKP6?=
 =?us-ascii?Q?0PU7KD596NQPQoP3/Yh04wVPM/Gsr1zHip0ICjEjnjcdcS4Z+5MeD98uJnEN?=
 =?us-ascii?Q?bhCJBtFVOq2gSOc3QWAxwlLq3kwXMcS8l35QmwkrrldAndIy5VVTu59fnRfh?=
 =?us-ascii?Q?gXPQJiQpZHek+Pnw2tmnGyt7AGsPEkEzkzhhO0buFUDtPCBN1mIx6xrkL9qv?=
 =?us-ascii?Q?keRM6yfsMX1kpEl5QyZ4qUiVT4fwgP946X9I8fZf4Q7Qw7uO1QSDQJg9qzYH?=
 =?us-ascii?Q?z11RTcDie6csUcyJOMVInc6ENdS6+yu2lKQL0redy71zOCaFyGxxTYfMqYUh?=
 =?us-ascii?Q?ebftlXhP+jBhwSZPWW4k7sxvzYGVQJ5FGwaYkFBvC+0R3PloAKrB7BKctvAG?=
 =?us-ascii?Q?qg2S7UJAi1lQgtA56Pk0WyfduUyA4ON3xk+P7COJWaMk1/TEXm+NpGsdqVdJ?=
 =?us-ascii?Q?9pKlw17GnWrVsRx4ql7tXQFpl72G22uFX/q1Y8ud95mYT31A3vSOeGViww0/?=
 =?us-ascii?Q?/dyqG4p5e3nrl3BS9pgj4QmxknUmC6L0wYMu1OX1fplVQfkrTNrwdLju4OCq?=
 =?us-ascii?Q?thCotPRcvWdBUCsBc7++y0vHAsapZXeHhmcH/KjH7mn5rprLvLdg2n/PDdDN?=
 =?us-ascii?Q?L7cLqTk/aLgKb0bZ0HmgHQo9wCOx3oP0dpEYtoU9RXLoXAEg39EwuzNYtz9W?=
 =?us-ascii?Q?XvDqsl/3tfstiqliCyliSOZKXsUkYFYZNkQ1TgaQNC02Q65smcqjhJGcMj2m?=
 =?us-ascii?Q?GxN+SLUXJZ8g12T5M7hv5KKf5d+JG9kg48T9khAWYg54Xi666Xju33n3dH3u?=
 =?us-ascii?Q?7nm+PJJB1W5JazF49B/xcYwa1kE8bs8qfzSD4wtk+yVoPd4huK7YAqF+GE7g?=
 =?us-ascii?Q?ARBcZb8SWa1SycBWmUEtOcx1Jq+XEVYTvv379vZbp9yfTidyr976CokyMDxP?=
 =?us-ascii?Q?O6fsn7DlGBqnosLHMSeL27jNAjRvGFm7kwvVrZxfwDhgzRZzE5gXpMUPmGju?=
 =?us-ascii?Q?rTW1SQ5pVjzg8jk/Cfz/7PLZsiC1ZNjx5VY+wtufy6vLqoW9RCJLqTEjp4pr?=
 =?us-ascii?Q?SJm0HB5LJUCy1UmJKc+M+BCPg3vXHgkQKhKiiwlNFjftVaBov8b/AJjfNhXz?=
 =?us-ascii?Q?QZvDfI5vEHqkEiFzSPr7YMsL/ABaKRERHO826DCF0T8vCAo5ZVlDiGdMohu6?=
 =?us-ascii?Q?WOVNxhr5fcReYYkc+hbkeeD0T+aXPPNL6auoK3t4kuYgqpVVNw/abbkXeByO?=
 =?us-ascii?Q?VrEt4i/wR7uevFd/steoEqVcfgTcamSecwIYZdBdrZe+iNzcKnF5epT34hbb?=
 =?us-ascii?Q?PHp3R3gTExcIeRFdCP2UJ1/79ONOuyrlpKYXJPOWLyDSWwigMQ+st4L0T88k?=
 =?us-ascii?Q?uV0MRQOrnU2ZlwbPznY1ZBcE9+M5TnjS4+6kKJLwb+Y8tTLYiUQOiODkvD0j?=
 =?us-ascii?Q?DNV2LAr3awhZjybYyRPFeklrMJmr/vekkPXwMCA3U6AgA46lOrDNrCzKd2Fg?=
 =?us-ascii?Q?bfwpMgTaLZL9nvjQZsDMUYO9yHXTzExvuQznHixO6/R+cj1jlMPpt/oGC0RZ?=
 =?us-ascii?Q?fLtZVPf90dQ6yZlf8kIbFsgETuwzz8o8Dqz0Odm8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ed54df-e8fc-4424-e10b-08dcf19bf388
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 06:45:29.0158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUsgs8JoW7WLF4dCnOrFPvBZkftxWYsg1QzRQs/XLv+AFofafdQsHOWDoQ14bzGDY+OPJzLG6PNmqyyjTVdB5g==
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

The LVDS panel "multi-inno,mi1010ait-1cp" used on this platform has
a typical pixel clock rate of 70MHz.  Set "media_disp2_pix" clock rate
to that rate, instead of the original 68.9MHz.  The LVDS serial clock
is controlled by "media_ldb" clock.  It should run at 490MHz(7-fold the
pixel clock rate due to single LVDS link).  Set "video_pll1" clock rate
and "media_ldb" to 490MHz to achieve that.

This should be able to suppress this LDB driver warning:
[   17.206644] fsl-ldb 32ec0000.blk-ctrl:bridge@5c: Configured LDB clock (70000000 Hz) does not match requested LVDS clock: 490000000 Hz

This also makes the display mode used by the panel pass mode validation
against pixel clock rate and "media_ldb" clock rate in a certain display
driver.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
* New patch.

 .../dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
index 30962922b361..2c75da5f064f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
@@ -52,7 +52,7 @@ &lcdif2 {
 
 &lvds_bridge {
 	/* IMX8MP_CLK_MEDIA_LDB = IMX8MP_CLK_MEDIA_DISP2_PIX * 7 */
-	assigned-clock-rates = <482300000>;
+	assigned-clock-rates = <490000000>;
 	status = "okay";
 
 	ports {
@@ -70,10 +70,10 @@ &media_blk_ctrl {
 	 */
 	assigned-clock-rates = <500000000>, <200000000>, <0>,
 		/* IMX8MP_CLK_MEDIA_DISP2_PIX = pixelclk of lvds panel */
-		<68900000>,
+		<70000000>,
 		<500000000>,
-		/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_LDB * 2 */
-		<964600000>;
+		/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_LDB */
+		<490000000>;
 };
 
 &pwm4 {
-- 
2.34.1

