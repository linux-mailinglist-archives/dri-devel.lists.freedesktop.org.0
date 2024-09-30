Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 650AC989A17
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 07:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B174B10E386;
	Mon, 30 Sep 2024 05:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Bsdj+JrP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9454B10E386
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 05:30:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riIETv8+dE8a7un6iin2pUIpsVvUWQaAYSUzmS3wVkMz6FLJ94BZi05cs5668NQaxEdShUj+kyp2/zBG7IIUUsF2P/VUfjyT2O7s2ZXXLJTpE98WVo2xKWu30XvoLN7NKl8BAasTSJJ4Ts17tyD9vLokC9e+qs2+FsFYcHTk5kUkk0clGc77PSrvhir5W53a0IUAn6baD/6netnt+iNLbe0fOz8RuvjDkZJQjv7xgDZg5ENQf98zgQxTguJ7QlxShXgX7AcaLBWUVEUOEB5lNXSdwTsrz2GsoEkv10xwNeZpLjRX9PTpZzxhemDnKSuam7/PUHrHLLKg3Lt+WxwmjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RUqrTNZbKimeOVTPjdQkQNCF4ikDMS01e5WkWjIIzE=;
 b=fVh+kxUy5GgiLBHENCTp2EIoz9nyKNjsFFR85cN9RSEm1eneCG64pfKrslQbVXNQAi0h8pHvczhSh3ZLIQ3sHsL1HAvDl/sKwIewEMNdybJM9mkD5fMS3P89ugFLNt9l2sqiwgKQf1YXquDTmtwXvdQFTxqJn1cP/f/D10wnp7YSCnu7tPVxsT37OLesBNX55EKBLbtiQbNprOoSh7D3gSDkQ35IXd7uMpkJisUPzM7+JnyK0yEWUztI8o1adiW8hTHHduFCZdKAKh9dHIPYZmEUNcnAjTOtHu3+zdfMeE72JhfvSAu9uSre9Zco8bmGRw9z92f/f9qVADuWGaIdJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RUqrTNZbKimeOVTPjdQkQNCF4ikDMS01e5WkWjIIzE=;
 b=Bsdj+JrP3dKKhogFIcXrb/EkT57qSnybNmqq7CJ1QGmgfFFVm0UgWN/7eOgq/RELuE0VVzi6apf3bS9txXxe5JH1OmWBKt0QvM4eiOLS7xE9NY9RrNDX80pkNAW/bgir20LzLVC45LpbULoeaJlKtRl9vvEpmkxPBupxUSuFEUrzKaYkdEa1UFXGFHKGhvnMPMeXbiIPxonw3EPC3U5xjDisEUkR21lsSwS49tWa1h+pQ6HqeOhNISse4rrHDUojo9gfE0HTj+0bG0TJvkNI99W3Fnow4Z/T0/JJqlTSs5OrC/KGGtUhWA4qn06i0jV/ASPZRFuX34M3/nFYQ2hH7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9141.eurprd04.prod.outlook.com (2603:10a6:20b:448::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Mon, 30 Sep
 2024 05:30:01 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 05:30:01 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 o.rempel@pengutronix.de, y.moog@phytec.de
Subject: [PATCH 8/8] arm64: defconfig: Enable ITE IT6263 driver
Date: Mon, 30 Sep 2024 13:29:03 +0800
Message-Id: <20240930052903.168881-9-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930052903.168881-1-victor.liu@nxp.com>
References: <20240930052903.168881-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB9141:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb61ac6-a946-462e-9fc6-08dce110ee1e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EJLG1dsHzCcTjaiWLrauQM8cKQGW1YMSxEAo9mVR0wD7hmAJKBrKittagn7O?=
 =?us-ascii?Q?xCILRPeZfiRvpRDTPSJ/EJJmOHOENCpdupuTLEpcfb7OsxipbsxB06SoiOXj?=
 =?us-ascii?Q?Rkartq2DClEzGesWbW6rzCd2J/tsWs62Zlxbh46Pzc+7+XEIQ/Pv+2SVJm/e?=
 =?us-ascii?Q?0wpjtv/qr3hphWpjUW/aeNcZIkvHMpTHMwyqw/m8ygW9SrN/+olXwU5pYTYg?=
 =?us-ascii?Q?C0cYmV+JlVq2bNiGgId7EALsa6Ai/LRISAFHRQQUw/AlLeZIQ2Xj1UEMmWT+?=
 =?us-ascii?Q?+mI3E0WeDLBhIhspXYhopN4qtdlovqj2KMP83QsxPWepq4K/2YSrC5/kjF35?=
 =?us-ascii?Q?LfV4JBBz4a/RO9hRH3Egxu8qL0H8pXGZncjMTrhM7Qd5XdtC2XL6/D4I03Md?=
 =?us-ascii?Q?K0Jf9uY90owksLd5DnPAodGP/rDTMdG5x/Pf4kbuVUcz4QqjSUvc6y5r2fn5?=
 =?us-ascii?Q?PIJDtllCAIp3tmrZG1fmGwRtPOUgOS0m9auRZfZn/c/EDsEezADCdGoF1/DE?=
 =?us-ascii?Q?COMGrWGI0qVnwxmYKflJGvEjYtjlNCgDeTqbEX/m2fK85AeLjPOPlp/KIB3M?=
 =?us-ascii?Q?20/RiqEuwk06LvksDcSPSeqiUZA9zN75gWFiY59EkaX0lgi0uUhUQoACjcLu?=
 =?us-ascii?Q?pqtZYk+PBQR2RKw3ZNFIkPeVARGp/ti4QZ6EY/z/Y/Xbtb6tnPH7GXWiaAle?=
 =?us-ascii?Q?nmVGZ0gMiSxjCXgNbJdjUOHcyp/9pHeLwqNGkU+Wb4BjxvNZkRT6E52/pWBP?=
 =?us-ascii?Q?ZydyNIq/OXt3PjKaCGSiQej+vl/qRoRViP1uu5wdTZ8hKBhVLfDeMueMkimY?=
 =?us-ascii?Q?6jaim5tn5hkujGYrAzepW/swkEiRswgahxvdVQtrheBPSyZi7STz77jvXyYf?=
 =?us-ascii?Q?Y0jRdceUp9pAlx9jBQcf5d0TDg2o+dtDJ42iJQtre3W4Or+mtPc40+WyuLbl?=
 =?us-ascii?Q?ING5K5iNB4+JTJDhXLaBr40zNtEzW9UpXB2FXY7rWVksVJpAzrSmOYDIfhbB?=
 =?us-ascii?Q?OSIQNxu1yl64UCIfRsBmjOz8WfOh4FCALNVTvIBtsBEDucPxzJ8BZ3u8VhlF?=
 =?us-ascii?Q?U0r3j8HmD0lMHF0/jcSIPTObLRNVIzIKskDtz0HiVKkGfhS8EwwbezbbG88j?=
 =?us-ascii?Q?M8lDQEUobyA7SveDkx7mz5+TVNiXkt1YpUFrQG9ynQDOfkoAQhsTJXN6dv3l?=
 =?us-ascii?Q?k3EyKjp1XtMC2mvWVB4EvImfAlF87FKBBD8+YkufDzjbdRS3hicftz/7964e?=
 =?us-ascii?Q?Fj4dk4xsYR16VGZ/K6I+ikLZFzjCrUGpHq6qv7rc1bZCbG+GSJDKow4FDxGD?=
 =?us-ascii?Q?N8Is/Iv4loTJxsfISUq3lO5Qhtd+XXG2sH3bfyQngJebiNE3ZPtGOm/E1IgC?=
 =?us-ascii?Q?MRAe8AgTmvCGo79LFke7b9SZK9gwf6El8QzVp59ZuPiQn8GuuA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LFTzD88T2Ve0/wdvT+mrDSoeA7YEO/L0SjB4o+ZriRjXD+7bmBQZbNibIPls?=
 =?us-ascii?Q?pJH1VBptYO+aUOGk8Pa3K2bKCOYZPhiL5apRJwVHgmsHV/MkWJvtLf26t5FJ?=
 =?us-ascii?Q?zjjroTCUW0prgBSAKygrZgurhbgHn6wIR821DcIIDDQZU55DsHvBUZYbW6oM?=
 =?us-ascii?Q?RLwfkfWcJZ3sj0uBnmqx1W4FLbvd1lywXhUscSy5bUqoM8KCbRbI3VMFr6VN?=
 =?us-ascii?Q?ZgExr5Zyc5jrbRtF6dAoFoNKI2KOl8M6QpZHdnqOAQ9IahoQSxw8fW2fBGmB?=
 =?us-ascii?Q?I74vWhb9z1tSsRAHCAudm1n24XtKhGE+DNaGD6L/UwQX6jmQTE+n62kMOOs0?=
 =?us-ascii?Q?paXFOVQSQIBj57Qjpns4eSZ+IbYv7V7jiPUV0ByJmo+/3HJxRrHP+JdAa9v2?=
 =?us-ascii?Q?ga0j6dv6O05BV5A/zg6yan9seEvIn7fjnNmGkK5AKD+t8pPtl/+xtm82Ebk6?=
 =?us-ascii?Q?TfBF/D70okbSpm8ZD+0W6k5SyS5H6Eq/wQuN8QDEqoEBqI2kRFG4GrX4eaSz?=
 =?us-ascii?Q?J7GRvABRWXZ9RziUzyLIf+on+ZK1nG5qh19CyWYm4ma+pNtbK9wTxIQMcys1?=
 =?us-ascii?Q?aLCGuMidzx6rXEy/VAlspJFmWSRJFgAvyNMGZddM/BJvJkfz+b9iecRrA9nL?=
 =?us-ascii?Q?5/YhBkdITz2C6X99Nt02iaMjQj2Hs3UsIUmYQNawn4QYzDa+aHDfcESCh4Y4?=
 =?us-ascii?Q?C+WguSy8OyKNJ9jvA6Wqhz+cfcThq7t9ZHG2L2UG5xlqGSCC+zeuYiK+vMgm?=
 =?us-ascii?Q?WxVSqyD6sOk6+iviW65cTbknWGOZJZUkDuUvVRuY2EOZ3X145Yd+8qrMsrvZ?=
 =?us-ascii?Q?pVsalBlAmejnJRJsQvcyMrdvZwxHDpEaKQNrNQdfLmKLDYrBnUpZO+4NXaxm?=
 =?us-ascii?Q?byha+vncCayD1I+ggiRk41QEgVcomqcHyjTSA+RWP5gprkA1+mnfgiVVLpGf?=
 =?us-ascii?Q?RMV7F3qcbDXXJ8gGS/pdVrv3gocEsHR+66x0ktklyfdQgWE9xR8c4f5kGns/?=
 =?us-ascii?Q?uvdS+1XO7NIB+ISQika2AkDMZsaG1ole1jeagvKRVa33aA/7HoWa5Mbp8IAJ?=
 =?us-ascii?Q?PLSBE8gfjzjGjL6EKucN9Qe3iLJsGKRRlCZqGxEKb1gi+DfH34GUJLIAikM4?=
 =?us-ascii?Q?5F2skaPrMFME7DF5xuwMa2ZMaCeAbD5c4vygK7c63KJb07AR0+GhPzHyYJgc?=
 =?us-ascii?Q?cFl9rHzLd5Q+0YJfSfzg304QhsRYbzZF93lAdRHCqyX91MQcvyNxtiquDS01?=
 =?us-ascii?Q?lR5IgEze9+49SXHzUiA6Jc2JN8nUpXrXCeDF4FmvHb/qyaBdMszw9CyBRKtW?=
 =?us-ascii?Q?UA00xPjAByIurWQ4BkrCqpKzO8wWFDhJc+VARXGl2IcPbLd2E0Wv8+zd01//?=
 =?us-ascii?Q?d/B5sdtC2U7eueD4bpjDnGlvjYA5V8KWSLjhkXnoLXkNQAiq/ey4s7MAmpS1?=
 =?us-ascii?Q?bbuLoS8p9cNoFmAXb4w0YFhcWQdnUOnOzOroGbnaahmAzEFaRlZjOtkwN1p0?=
 =?us-ascii?Q?w5RyX+Tk7FlImKOvz6VM2C5Uo63YP+DmjfdmIoq4NCGh/gYcHSRjsZgnYTa2?=
 =?us-ascii?Q?yLwtavfzJqSYARU6EVK3nICwaUH9ibrO8zBGFv1c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb61ac6-a946-462e-9fc6-08dce110ee1e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 05:30:01.3684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJRNkwDKc/7zloWKwmgInf3XnzmhwVfuYcO6N5u/jWS7UGLPRMJlu5hlfOWYMxIuwOTw7ACFNxenulcecrnZGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9141
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

ITE IT6263 LVDS to HDMI converter is populated on NXP IMX-LVDS-HDMI
and IMX-DLVDS-HDMI adapter cards.  The adapter cards can connect to
i.MX8MP EVK base board to support video output through HDMI connectors.
Build the ITE IT6263 driver as a module.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5fdbfea7a5b2..d8a232e285d4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -899,6 +899,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
-- 
2.34.1

