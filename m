Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE5BBC967F
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 16:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931D510EA61;
	Thu,  9 Oct 2025 14:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dgwpcWys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012013.outbound.protection.outlook.com [52.101.66.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F72710EA61
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 14:01:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bydkwP+feyn0fq9hTq1N2eJuPVxTixKFlgkZGd2JNsTGqiJD78HZyzr1OXWG4/cLUpCi7wW9658+oeLL02qljEX998lWRlvq5+rQ5r6FLB0WNKg8/de/lK6NGWZBdvwuKlhe0mLDGeLDnea9klU+A7OSVCwjlWgi7hlCimWTU0s9Dwi5/VJRpofhJyIUSRyPIBBCnbSGA3X2Fe80FS0y7pR7sNPLaz/Q6J7v251mKerNOYdMq9KMplsqEfh05idqgCmIHLg7y9gRBxH5V95t8FKbuSnSkP+Dp2Q4ugERNcuJbXgEEnPBeHseWl26u4wrWJmk6fxifcQchnrfqkmx0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOl/OINWVC0ueC6zgTVcPv4RkNj9b9tbYcsjjVDJk3E=;
 b=QrNLC0Pj+wi9Vc9sm85odiStkI0BJRccgkD3fi6k7/pcVifYu0TK20DxiFXnZXkpnWRKYIoC/riYhMOLqPvXwlpanSNvxgug2rZNrjDUHZ9to1aPuq6iJ2PzMlmcUZ0VcgOLmizNdwLut/L6+yK1VfJgHzkCAhlmZUhjM0WapKAA8vkwMlNWf3yzRV5fgOQTdvbSkQoQAUisTTJ6hgblzF76SV69Q1y3F0oxG0QHjD5L9wzBfBL98qfh0RXUkm+vUgRddnKvZvTvHjor5VAcOzG3mUjj+N2q2qABP99UzZnJdCtvnUlCX4UYIBXog3dm/Z1vhieOJBi8OsAdxv6sXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOl/OINWVC0ueC6zgTVcPv4RkNj9b9tbYcsjjVDJk3E=;
 b=dgwpcWys/5z+wgilVvn4uXULJ9jDIbKMy21Jv0txdv3uR7L6Hzm6MtrSqDAxLtTcZlOi7GoB2cdEA1aiKKNEB0KxMidL3anytFvy/ZWhwBgDmPX2WjVt2aRMsEg4GGgq3QTW+3nrj9DJyNTt4Tmn0Jbt+68qdZkZowM2r7b3W13+CyyNMKqoZweRP76U5YdQnwqYwz5+Hg0Z9+FQlIwGKIC7a+rq/W0MJUpbCgC4NMGaU9d/WsVcsl8PySZitzM0lL8ihSwRnlvRFnZZFRnJSf/ZXJC0qd7/HkcCUEo+NCsah8dN/E3n9bEcfBJJcCj8t3kiqqLGFxzFfigEDukMNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB9627.eurprd04.prod.outlook.com (2603:10a6:10:30a::13)
 by DB9PR04MB9774.eurprd04.prod.outlook.com (2603:10a6:10:4c5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Thu, 9 Oct
 2025 14:01:19 +0000
Received: from DB9PR04MB9627.eurprd04.prod.outlook.com
 ([fe80::c5f7:3093:4ebd:1a2]) by DB9PR04MB9627.eurprd04.prod.outlook.com
 ([fe80::c5f7:3093:4ebd:1a2%6]) with mapi id 15.20.9182.017; Thu, 9 Oct 2025
 14:01:18 +0000
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, steven.price@arm.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, Rain Yang <jiyu.yang@nxp.com>,
 Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
Subject: [PATCH] drm/panthor: attach the driver's multiple power domains
Date: Thu,  9 Oct 2025 22:00:39 +0800
Message-Id: <20251009140039.101189-1-jiyu.yang@oss.nxp.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::21) To DB9PR04MB9627.eurprd04.prod.outlook.com
 (2603:10a6:10:30a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9627:EE_|DB9PR04MB9774:EE_
X-MS-Office365-Filtering-Correlation-Id: 48279450-3051-4eaf-e042-08de073c518d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QkGs9Kw3I48grJUCN7KEJIR1QqDMpBFAVAGkqAjFPIuMeeX1Dd7PkqHllUSL?=
 =?us-ascii?Q?pe5yVUoUIuMHEOA4j5/XEpnWNIPSswUV3Me9MLzMnYi7RP+pRBqUVLpHL+iD?=
 =?us-ascii?Q?6o45abJ0zJtDkGexXI7kB+//PNF7cVjkfe1OT7j5P8dzHH/kmU4R+UZ2nCJU?=
 =?us-ascii?Q?D1lHF7daF28NIW3n7dEgBib10dAlv3ku4SyDB8gaBDVJdB7mnxXmrzy47sRB?=
 =?us-ascii?Q?HUe0cYnx3G8CXGUEe1EKj8DuhV6hTsw5fdyjemqK09Ud8yPBGwLv7m0IUu7i?=
 =?us-ascii?Q?w8qAE+pLCoAAOV4Zj4EQcsxei0ktCLf9RGODlOe+V95eEc55QICOznEgFjuG?=
 =?us-ascii?Q?0UufcnJKo2H6qg2uMh2jWmPRcfcFhA9ne/d/HZ/qCa4cMjcs2OkFkNjeoOhE?=
 =?us-ascii?Q?8EE+N5tqfb2W0bksrnZvHJiUuIb6UtNwA/6HMYAhWafvSGm5vfQp2OuDC9t/?=
 =?us-ascii?Q?8384T5kHJ0zQuoE1IcgK+wnS92GRGriQQR6vJUI/E8I/mZ6Ai28bXM7eG8y3?=
 =?us-ascii?Q?UBiFIAMBdSYzxDbNMkhRTzjIihIGYRs9qE5C5qBz2sEARe3HOAxdu6ak60j3?=
 =?us-ascii?Q?H9MGa9edFF15SiQJuwpDr6xxE1YGFQBsXSViUKnLFnGQ7e4UYn0QOCg4K1zy?=
 =?us-ascii?Q?MfmjMyRm+OVaPkcReVEddgwCKcxEWEi7TIeym64dXpkeLX9aA8WbFsHgBiqy?=
 =?us-ascii?Q?b4q+jNZchpiWwDwmCX4mL2OD8tujqvih/NADqEpajq4JtceLjbMnhTjTvqm6?=
 =?us-ascii?Q?jq8lVLs/7GQxWRsQH61dXXDhiXtuycysuY0/WpFIGVHP36zQaYz15bdvKxh0?=
 =?us-ascii?Q?ak/OH4aYGngdfVhYjoUTEQHf056T1QvK1ve2r67MKAa6hWK3Uv9x3Kfc6PAN?=
 =?us-ascii?Q?NcwWTw0yQbzotIhBI7DHhrQKS1RuSCj2/wMMkECIfn8GTrHqnXEQYEnHRB3r?=
 =?us-ascii?Q?19aWAMHI4wGv82t0Am/46KVsfcjJxSQOrGOTp4kJeZzMuUgPjSTwFsBnQ5I5?=
 =?us-ascii?Q?udhqoIG8VwltVpzqEwzqz8GokJOI75EVMdNHuP7QNR4T6SMUgO3aGOeXvqQu?=
 =?us-ascii?Q?kD8voyrl/NAnes0dsT9s58eYlJDGnN6CmLtXAOraRu8QpHc4ho7NHV9n40KV?=
 =?us-ascii?Q?LcNnbRYNk3jL83poLmO+2YcFLzcfR3UGA7rwAMQ2NDtH45gW5wCEmgNwNPBn?=
 =?us-ascii?Q?AC908Bo6lWqUIaXsyO560SWajg+XgNVEDNPRx6wydVNu+BqRBua+jF7898nz?=
 =?us-ascii?Q?u/5U/1ffVTNc7OAcrPx3KJX8g3ossgwpUYA+G/wYs4daEXjAtY3w8nK9/aYZ?=
 =?us-ascii?Q?HCUvK0v5PxU+BTCVV6oGShlo0fMm364O8fjWlzwZK79a8Nbut96wYMwSFZJ3?=
 =?us-ascii?Q?cd2DvXlCQ6mKf/Zese7LPRBSoj+E5zMi6RC+epWX0W/oPoQVJ4anBUyqrL1f?=
 =?us-ascii?Q?mL3OXXspnsSN25PeXf1Cfs0sW5miRQx/fMROhDEcHUqm5+adKoNUpf1rkKqr?=
 =?us-ascii?Q?btgVK2JYUWB+cBDExm7u23CCF3hWS+AXiLXX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9627.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WOHyaUuWN6IoYyWg+SjDXTbrNj5BJ/WrsMOl+oLlBsOH2ioi6pihw179LzjF?=
 =?us-ascii?Q?xF312on26SB9cENbiX2C0sMZnr6mjJMzrNik2GMXtkPTW+msGHtkxywPqsVg?=
 =?us-ascii?Q?f8qAtVxYvdqLjMDnRs8tIZCTI1OJcDSfdI3LMtA17R4Cx7xLzSi56V77x0su?=
 =?us-ascii?Q?iuK3jnrzBAcQLeppP1YbKhC8Kb951vKePpKk3x1lKz+GCNFjhTBojdzxKMJl?=
 =?us-ascii?Q?+/KbT/CFYxSCtwbLcV44oqq4WXtOJW33uvDYeRTrpi9c5YuD0C1jlLtODjNm?=
 =?us-ascii?Q?ciA9gHZT0tY/JR8oYdoUgbvcIDTdEzvc/5IO7QL/MmaPj4MhbGhi6BbYB6+u?=
 =?us-ascii?Q?sVsw5hl/n1RwIWrwziPllOT+DQKairGHtDafWBmgUAo9agPPM/xJa0BAtR26?=
 =?us-ascii?Q?wdpq4SxXgxg28LUeoB0L6kqF2lIkfB8sLlWSaAVIB4Canx0rCVFjdLzUoFvF?=
 =?us-ascii?Q?D1/rwi4KxicjIJya2ti9xz0s482bnb2HR1G4NASu9XCi1SmvriXdUcX/QnKH?=
 =?us-ascii?Q?DPxtrIaxo9ECY7pLHXivJsluYVwK5rk/Me1ak25kadE6pRDbE166R1m8BocJ?=
 =?us-ascii?Q?jqejh/mOVCGDLICqXTY7NIBv7M3UJ4vNjrP8vQKKVwtj0Dp6PuAbldsUflWY?=
 =?us-ascii?Q?XThaHmcavGSDbpZMP/IdSqWQLtLGOR6mM1YPyBg0pme3cmuQgrPLph5AHB5t?=
 =?us-ascii?Q?NjPxxk9mominANAUGOMS+hJssV4Liji57RUXgkqn7F4lyjllCBBN0lFz33Ky?=
 =?us-ascii?Q?jEDitNEgrr1ugZNFpxyAIiKugVSI7rXxf++A/Ypr0ngpHv8B2TeGWboINX11?=
 =?us-ascii?Q?PphkVhRcqvz5tIZ9wz71dPvIH2GADLur24XB6ieAbcj6BlrFscXkwJeCW33r?=
 =?us-ascii?Q?K9kGpv9RIA1fXowBXXF/pPnjFJ1ffIAmya35UGyoUXFrleUP+8+93xep3fP/?=
 =?us-ascii?Q?KsXz5zJevuKaxwuMpcWcdg5NueZ2beu9tjRd38z+NjQFxtQ5N7YIHOrSoZIR?=
 =?us-ascii?Q?oPFdLTK5W/TyXBKswJsBDgGyzemROt5/o+O3fCtZWUltmsdrk4IqTA6hcQjg?=
 =?us-ascii?Q?5CrUt6xuin9fBpTK16x/Bkf5xkXvi/tASXiILrtPnIADSJD2ByHWJgv9fHHq?=
 =?us-ascii?Q?Rsw8TV4l1raE4dvdqd2zU3+VnyJnXf0B/FiErr256sXdiX5jRh5poGlQrUYA?=
 =?us-ascii?Q?EXt1miv1ERfWIzR36nnO+gihPQTrpcQ9xSa5HSG+kbgBNC+QjQHQmQ8bew72?=
 =?us-ascii?Q?YpJW5L8U/1/GWoqIfmk4i6cVkigkOk1kK1n21VB8iDVAR2O6bgf/Xwjvr5Af?=
 =?us-ascii?Q?0lF6Pt+uj5w/MvS0xj1AMpIeI9sSgkfFipR8KobNHUlWyEyFMgeNXXfP4kbP?=
 =?us-ascii?Q?m091tDeBC9Nx8XzKWhENekKQ+zFGPeS+tJ04KFB3jzdVk4AVPrDAd/5G1o9R?=
 =?us-ascii?Q?VNuDe1oW1ptZt60DSS7W8AqKOZavR760HH2OeyuUzuMliPDtoFgtlR/j/b98?=
 =?us-ascii?Q?iGQLMiPkaLqBh99toLGKv2Y7k6/Lh36TsggOBU2O8Ffwo6hBLnrAmoGGdp0U?=
 =?us-ascii?Q?qpQC+V4joFDSPF5ncE7jqlrpJqcbcfoPgW2r8d0p?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48279450-3051-4eaf-e042-08de073c518d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9627.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:01:18.5094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUi6Zdhds/+xvplTuC2qUhMnp7PccjfdcDoYebUkLAw1vT04zxwvWkD15SxQK3DBlvLCIavMBh7slqZUktSWzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9774
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

From: Rain Yang <jiyu.yang@nxp.com>

Some platforms, such as i.MX95, utilize multiple power domains that need
to be attached explicitly. This patch ensures that the driver properly
attaches all available power domains using devm_pm_domain_attach_list().

Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 6 ++++++
 drivers/gpu/drm/panthor/panthor_device.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index f0b2da5b2b96..6f40d053b16c 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -218,6 +218,12 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		return ret;
 
+	ret = devm_pm_domain_attach_list(ptdev->base.dev, NULL, &ptdev->pd_list);
+	if (ret < 0) {
+		drm_err(&ptdev->base, "attach power domains failed, ret=%d", ret);
+		return ret;
+	}
+
 	ret = panthor_devfreq_init(ptdev);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 4fc7cf2aeed5..5ecb541ec67b 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -196,6 +196,8 @@ struct panthor_device {
 		/** @recovery_needed: True when a resume attempt failed. */
 		atomic_t recovery_needed;
 	} pm;
+	/** @pm: Power management related data. */
+	struct dev_pm_domain_list  *pd_list;
 
 	/** @profile_mask: User-set profiling flags for job accounting. */
 	u32 profile_mask;
-- 
2.39.5

