Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022BEC0808D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 22:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AF410EB38;
	Fri, 24 Oct 2025 20:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Qhdf9Qet";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Qhdf9Qet";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013024.outbound.protection.outlook.com
 [40.107.162.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446AC10EB37
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 20:22:14 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EfMXI++B9IYxi3I5qtdkqPdYXREH5KMZ/n364Rn5CkeEu/XBUoP7n2GGo9sT5VeW6VVncohKYEt5AmoXEOKWjKDmeOtMP5BP3gtZbsv7+0CvOkN6y7iOR7NLOW8N9n4Ble+ouI9RQzY0AEuBvMXXUcA9qNic8pKXDqtgfWh0LhQPnyElPyQXYr4b0lCfF+3CesnQCim+Fff0RAME1TDo8kWJH70C2/IZaf6YHgSa8mQ/ByWOgsGU8+Hlpq6lrgo6hPiVYhoK+YlCe/P1lBT2bYvpZbfDLuJ7Q7NkY8o1HVYX3V6a/8yEsXH7Gj1VgLQxATGkIpNEI0Oml9kDY5llGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuAWy1IcIPEshsV8czPgvuRqxPi0HJBkk2JmOdC2ByY=;
 b=eztntLUeBCwuUl5YUFNQpp+jr7Z9OBfSQjIhr35NXJwiLV7lCGuQc1TugjCnJTHwq8hsFt6OTsBjsRdqTpGSntsuzv2GZiJ9X74800DkQk6SiYm1Uk6NUCuVMNCL8SeDED2epvJ4Ex/n8lAPOZxW6f+tfn/58mbJ6gO7Vsj2mxb1wNtQbQBI742Af67Hj8vTOeO/HVIfR/gbVvt4XmT5ghx8GxDM9RkpiJ/mr1e6jxwdTN2nn6Wd6DWKwGv4RIghM3Ii+jlfHGEKv0vfviBSog+l66E1IzAZhS+uB0TbAT/9johBSSJsJU9uT2u82IEYWypexZAdPxusxVZQHgnxsQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuAWy1IcIPEshsV8czPgvuRqxPi0HJBkk2JmOdC2ByY=;
 b=Qhdf9QetJJBL2NCuig77IyX1niUsioTVLw4+5oTSzIvG+uzhMtzaxP+Dso3uR52Y+uwOVKf0cF9Nt2o5odYMCSKkT4iw7FUCjkk5ZkdxcE8iP2Hbuo5bc+TokYNHAgsHCdXrkmnIa3IJzXIlCiXaWeMSu5U/V+k3RH1X6Kmu5eQ=
Received: from DUZPR01CA0084.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::11) by AS2PR08MB9788.eurprd08.prod.outlook.com
 (2603:10a6:20b:603::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Fri, 24 Oct
 2025 20:22:07 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::78) by DUZPR01CA0084.outlook.office365.com
 (2603:10a6:10:46a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.15 via Frontend Transport; Fri,
 24 Oct 2025 20:22:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Fri, 24 Oct 2025 20:22:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjpZUYMhSqWPo4JToxn9KaM/1QdxN2G3/idJPtDzbAqFFWSTWuav1p5vtn2yaxa6s7xXGyQr7CbHPmZiHY9EEkp7okQ8hlp5FuXhd4cAMAw6hYp4QuS0dBsdBXUiX2pBFC/JoHBO61pEzXrMjy480/dXSk2o2/s4q82MAx8jjL0RXjMngVRDp2k5HGY2sg79gOn8HC5XZVk5h6NL2+PUZXs0xK1ZMB9jAkodhOh3dNFMcnqdSNoYT/JXR3/5pEwI2oPxGVNWWp/EBqryshcAWnyo090fk8glngXc9Hy84CLiOpClwSqptPvpLpBHdZ13nqHYzZgy4OLSEMWElbiOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuAWy1IcIPEshsV8czPgvuRqxPi0HJBkk2JmOdC2ByY=;
 b=VBujM0WjbCYZGw+F7+MYUH0CjdQZV1rESVxxb20UZUFqLsSaR7sNRafHxUAHfPjyO+Q894YY49G8m1wtc64Whrij01nRH4ZvhuESIGghY2GylH2EOMiYmnAt658P4b9jKPBerQyPqg44uD9UEnIAL+TvjV07uo3ojfYLM+fnvXxY8NRUYa+7v6v9TeKUNzkWueZs5hcOjvJIVDrXZj/0476lt/TLWp3N4zQt/ra9livmxLnXtFo3qJ8ywplz3gr+UW07jDQYJI6TmZ52CanFxVCCJjVQSuDcU9v5Rhqa85IKGRUvI/f1aAM2bbinGYoLYqWDrv/4Vj99R6f4B6FKIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuAWy1IcIPEshsV8czPgvuRqxPi0HJBkk2JmOdC2ByY=;
 b=Qhdf9QetJJBL2NCuig77IyX1niUsioTVLw4+5oTSzIvG+uzhMtzaxP+Dso3uR52Y+uwOVKf0cF9Nt2o5odYMCSKkT4iw7FUCjkk5ZkdxcE8iP2Hbuo5bc+TokYNHAgsHCdXrkmnIa3IJzXIlCiXaWeMSu5U/V+k3RH1X6Kmu5eQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DU0PR08MB8929.eurprd08.prod.outlook.com
 (2603:10a6:10:464::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 20:21:33 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 20:21:33 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] drm/panthor: Support GLB_REQ.STATE field for Mali-G1
 GPUs
Date: Fri, 24 Oct 2025 21:21:15 +0100
Message-ID: <20251024202117.3241292-7-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251024202117.3241292-1-karunika.choo@arm.com>
References: <20251024202117.3241292-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0026.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::9) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DU0PR08MB8929:EE_|DB5PEPF00014B9E:EE_|AS2PR08MB9788:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa8b2eb-6227-4b34-8cb5-08de133affcb
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?i8kC9iPGhQa1etMtLL7ZDpJ39sC+/eDuYHCJrPiFRQARw56vuuErBNOXTuf8?=
 =?us-ascii?Q?bqeL6EVsofuVn6oNfagAWoEcanJM4V4uD6r9RjsxMezgGrJNzUqKxt2zlUiM?=
 =?us-ascii?Q?s3EH44+eIdw8hq2qrJd84GzwWHye3ePbbhN3dupUb0J6XmjfQHI2gFAwhZ6H?=
 =?us-ascii?Q?MlAXpGcisqwDFVsKh0RFBpoT0YSMtSNftuQm/qeLkiAdMpJ65LIVAynZyE9t?=
 =?us-ascii?Q?xR6ywJuTtWx/A19koQLz0EXap6Hx9+nQDugJI2SbkPjVDAWH8zrvb7n/E0Jj?=
 =?us-ascii?Q?TfFeKb9/RFqqpIqdGy/Eb1D7ZLe1Ed4SRNZ6FZW9lXkdDLoxvAAwdp6puOuJ?=
 =?us-ascii?Q?HOCS6KLiKNhVsOS4P8fiRH6j2c2vInKjX69tm+5PloDu4ZGIntSiuSzNurip?=
 =?us-ascii?Q?S6lh7pTvHATwebV2SVPkMIBbfVMaEpMJCkMProntmS4/AUiikH4ygt5c/oEg?=
 =?us-ascii?Q?mcchicbxUAU0E3xY22B5noU6g2K0zISFSTioBN76PEpEKTbmtwbHtGyvOOEw?=
 =?us-ascii?Q?+ZRueuNVnR3tmvypTFq1Dzz28MFRbaQlnOZBKQxHV40Qb298pt6O8NAdeF7N?=
 =?us-ascii?Q?b6FThoWtlx5VgBXhsNqN0A5WvozCOASIhp6bp+Wi2WxOo5XnmSKnBm7sV6/7?=
 =?us-ascii?Q?TAnI1sh1RcCP490UNvMpeENoFb+uxE3Jpzis24UQVDqD9UuWhdtzqXTmK4HD?=
 =?us-ascii?Q?nt43OPaeMZCMaSZxEjEUIjWcOyv4FLpQH01Y6bI0js8Kb9fqqstIxVaHdc0x?=
 =?us-ascii?Q?feUirzwv4gLra8xpVBF89Wd2IZBumC0sakROkk8CmB6FEc80Jp62LhZ4wV0A?=
 =?us-ascii?Q?zx+/nhNzMLK868qx4PofZB1rGMM/Utoc/NaHSa5nDUKkeAfqeR3yWuk2Dije?=
 =?us-ascii?Q?VtyCrbMW9BXT6F9HwcEwWbT2EIdDv6SryVF17JC57QIP1CIwkHx8KRW0DURX?=
 =?us-ascii?Q?gUyO6ongHriwg2JcjZjEw+XsisQRGPhgMfRUA/QogqfKCViwx+rHGaB7u8vV?=
 =?us-ascii?Q?UuIrIAuHe0H5J2ptCYK2kFZPtoLVOflU2RGSXp2UVaJIC6U3ENTmyDplmlnC?=
 =?us-ascii?Q?iksXU7t3ySt5rUFXKICohZ2o92aNBCBciRABvm+2u7BAoXRmUI5+ANz9oCNP?=
 =?us-ascii?Q?zo2+0wTAXaacF6xr9G2aNZJtJ9VYpVzW6Bzkr638RG+TZKWiwwVFZFDWHcQw?=
 =?us-ascii?Q?crS4Xr0q1k9TxPDfk2R/ie84y4Rd7OSM+na6K5VRDmbR9TGMbcQxWDI/hW2/?=
 =?us-ascii?Q?ANtg9Uih7Wgg8xV8ex8SxykTnmdbormEoCPC57QfV+7eOlyQJ7ocvNlCU3cW?=
 =?us-ascii?Q?1KnI+oYPgpSqpQ6CAMteMj1fJPJSXXiz0QEUcN8u4SHF990D7ef1vrZB90Fa?=
 =?us-ascii?Q?7Ji1kwiCdvIBobjW+/xR8mks1tVHUinNJHD4lLOcnlmwnwVzsgIFvT2zZ6Dv?=
 =?us-ascii?Q?YeWPP1Xak0KmEjL5hWSlUiAsHCQ2aLOK?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8929
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 63281ab6-5202-4a8c-59f1-08de133aec78
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|1800799024|14060799003|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w+Eq6E710UQJ/dynnMi8ezqjYf+tQOixMfQgxzvP/AMeF0JBCHtk6FIhjJrn?=
 =?us-ascii?Q?BV3Bvg/3ELUVqEfFLSq65lFr3cvmrPcJ/iLiak/hzQZooHHS1lWx7TK2w5xp?=
 =?us-ascii?Q?kyKa/dCf0y2bybeo4GX4yXq2rnNG3gUgq41lepBfMwcdky1iTeDonOAgtvLl?=
 =?us-ascii?Q?ydniae1ER2aKpvNoTQt+hRmZnufKIluZvr+0FYTf65O8NP5Lw21kGC7mgdCe?=
 =?us-ascii?Q?YQWSsdBZyvVGs8rB3DzcB5RJePaHGZk9R23NReElr53Dy54oUsvyqk2f8Kf0?=
 =?us-ascii?Q?1O6HWw1np605WAXEIlGb1H7AczXtAoKGK5LMHmDvyd/szOZPvHrFmEzeB2VA?=
 =?us-ascii?Q?PidbfHoh/e1PLBbKIlga45kwxLz9j3l9AdNbNeRPBpQ5WwBbHaMzOIOoG5DU?=
 =?us-ascii?Q?j9DB0PTyVx4LUTO9dBs8P3JjojJy0tv0wRlMQP8LqIRifb3dDbsQsZpuXH9L?=
 =?us-ascii?Q?g2lH+L4Kxo4fvZ/7no8BEAVeOs6JEwi71sUN1a1Zaz2yc3ONEyi5UbzQBbyt?=
 =?us-ascii?Q?X0SdF8ZCiQXoZdliF16W7l7hZ9wgmNsq4ZhFLne3NFjil061jwJJBCIPeoAl?=
 =?us-ascii?Q?jc6k2pm5EowodhDO2n93V70YryzBPnTxQKasAxaRuXO+X4BXOYO6J4pjbrDd?=
 =?us-ascii?Q?mNCsIchm+UeoWUMFRWQxwNKwJpKKgmoNwkmZX0aKz8XQuCyIAVfuYAOjXEQm?=
 =?us-ascii?Q?H0vccSyQjnPOWZMSlFd4pe2BnzdxMUT9gNWzcm2Xa+jBorvsr5bOkkEfRkYf?=
 =?us-ascii?Q?lubZLnCZHTIJZ+0lTX5e/WFFFu5rgMPYWpzLfP0vODeYHaJeiMSvgacnyeyW?=
 =?us-ascii?Q?KpdD6hXL+YWgNd12gVaogkANs7GO2JsVHhlIHNrnCvgfUXLHullbUIw5Dixx?=
 =?us-ascii?Q?AaMaM4jgHCmlZnzBA1zW/R1JASI+mfnHvj5nWgbzSze3Z1rw6BtIJoUz40y3?=
 =?us-ascii?Q?wHDezb8J3qHq2Kc8SLm2Tiz8KRzaaFi2VIS3R3rnUYmcn0n4QgXaIHTmdkL1?=
 =?us-ascii?Q?HuD3e/zOeY5nV/7eS48CV39SvtW5BCnVaV13GQMGDLXmry1+YCBAsghEVmaj?=
 =?us-ascii?Q?93g0j52An88XQ4wFEGiKosDJOTHAcdmpkD4wpA+U140ubL7Kp3M1Z763KSTB?=
 =?us-ascii?Q?sDHqIm4mZCd4zTs6SxZYGNhYt5dmixmsU7a1raBnDml3BoKZF7S1BpXL9HGL?=
 =?us-ascii?Q?ErFC12lTzLHPOSWVyd4iXFQKx5IcBeUKvIttoWMppZJjJl9hfhuRyG3GH0vm?=
 =?us-ascii?Q?rP4AW19KUG1F6XjWGB/VmCfcAGlwGXqy/E0bj4InYZ2/j3NdK5JpfrY/qvmu?=
 =?us-ascii?Q?hHUxNXYzE7v3bkh6rQDpTjMXwk89M977N0PzZyE7gGLA0TDVHR7wjP7wBy+K?=
 =?us-ascii?Q?0IaBRiVRIl23NU+ACpzpMSinGqBqCJIqMsl+crA7R9+FgrF0L6vwoAc9hOkZ?=
 =?us-ascii?Q?K6m7axom2+KZkB6qcjqnMckal5aohuZGWE9Ez4b83dLgI8WAAZIpUo84WzGh?=
 =?us-ascii?Q?n3dRIgpiR8vHXFM7aPoxAsuDt2KNq7N4RyCBylUa09N1Ewg24sj++bhSTcVF?=
 =?us-ascii?Q?dBcGOIRtuRer/24vLW8=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(1800799024)(14060799003)(82310400026)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 20:22:05.2627 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa8b2eb-6227-4b34-8cb5-08de133affcb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9788
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

Add support for the GLB_REQ.STATE field introduced in CSF v4.1+, which
replaces the HALT bit to provide finer control over the MCU state. This
change implements basic handling for transitioning the MCU between
ACTIVE and HALT states on Mali-G1 GPUs.

The update introduces new helpers to issue the state change requests,
poll for MCU halt completion, and restore the MCU to an active state
after halting.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v2:
 * Reduced MCU_HALT_TIMEOUT_US to 1 second.
 * Wrap the CSG_IFACE_VERSION checks for v4.1.0 with
   panthor_fw_has_glb_state().
 * Removed use of undefined panthor_fw_csf_version() MACRO.
---
 drivers/gpu/drm/panthor/panthor_fw.c | 89 +++++++++++++++++++++++-----
 drivers/gpu/drm/panthor/panthor_fw.h |  7 +++
 2 files changed, 80 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 6b91c3cb6678..78f884ccb8b0 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -32,6 +32,7 @@
 #define PROGRESS_TIMEOUT_SCALE_SHIFT		10
 #define IDLE_HYSTERESIS_US			800
 #define PWROFF_HYSTERESIS_US			10000
+#define MCU_HALT_TIMEOUT_US			(1ULL * USEC_PER_SEC)

 /**
  * struct panthor_fw_binary_hdr - Firmware binary header.
@@ -316,6 +317,13 @@ panthor_fw_get_cs_iface(struct panthor_device *ptdev, u32 csg_slot, u32 cs_slot)
 	return &ptdev->fw->iface.streams[csg_slot][cs_slot];
 }

+static bool panthor_fw_has_glb_state(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	return glb_iface->control->version >= CSF_IFACE_VERSION(4, 1, 0);
+}
+
 /**
  * panthor_fw_conv_timeout() - Convert a timeout into a cycle-count
  * @ptdev: Device.
@@ -995,6 +1003,9 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
 					 GLB_IDLE_EN |
 					 GLB_IDLE;

+	if (glb_iface->control->version >= CSF_IFACE_VERSION(4, 1, 0))
+		glb_iface->input->ack_irq_mask |= GLB_STATE_MASK;
+
 	panthor_fw_update_reqs(glb_iface, req, GLB_IDLE_EN, GLB_IDLE_EN);
 	panthor_fw_toggle_reqs(glb_iface, req, ack,
 			       GLB_CFG_ALLOC_EN |
@@ -1068,6 +1079,54 @@ static void panthor_fw_stop(struct panthor_device *ptdev)
 		drm_err(&ptdev->base, "Failed to stop MCU");
 }

+static bool panthor_fw_mcu_halted(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	bool halted;
+
+	halted = gpu_read(ptdev, MCU_STATUS) == MCU_STATUS_HALT;
+
+	if (panthor_fw_has_glb_state(ptdev))
+		halted &= (GLB_STATE_GET(glb_iface->output->ack) == GLB_STATE_HALT);
+
+	return halted;
+}
+
+static void panthor_fw_halt_mcu(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	if (panthor_fw_has_glb_state(ptdev))
+		panthor_fw_update_reqs(glb_iface, req, GLB_STATE(GLB_STATE_HALT), GLB_STATE_MASK);
+	else
+		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
+
+	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
+}
+
+static bool panthor_fw_wait_mcu_halted(struct panthor_device *ptdev)
+{
+	bool halted = false;
+
+	if (read_poll_timeout_atomic(panthor_fw_mcu_halted, halted, halted, 10,
+				     MCU_HALT_TIMEOUT_US, 0, ptdev)) {
+		drm_warn(&ptdev->base, "Timed out waiting for MCU to halt");
+		return false;
+	}
+
+	return true;
+}
+
+static void panthor_fw_mcu_set_active(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	if (panthor_fw_has_glb_state(ptdev))
+		panthor_fw_update_reqs(glb_iface, req, GLB_STATE(GLB_STATE_ACTIVE), GLB_STATE_MASK);
+	else
+		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
+}
+
 /**
  * panthor_fw_pre_reset() - Call before a reset.
  * @ptdev: Device.
@@ -1084,19 +1143,13 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
 	ptdev->reset.fast = false;

 	if (!on_hang) {
-		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
-		u32 status;
-
-		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
-		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
-		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
-					   status == MCU_STATUS_HALT, 10,
-					   100000)) {
-			ptdev->reset.fast = true;
-		} else {
+		panthor_fw_halt_mcu(ptdev);
+		if (!panthor_fw_wait_mcu_halted(ptdev))
 			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
-		}
+		else
+			ptdev->reset.fast = true;
 	}
+	panthor_fw_stop(ptdev);

 	panthor_job_irq_suspend(&ptdev->fw->irq);
 }
@@ -1124,14 +1177,14 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
 		 */
 		panthor_reload_fw_sections(ptdev, true);
 	} else {
-		/* The FW detects 0 -> 1 transitions. Make sure we reset
-		 * the HALT bit before the FW is rebooted.
+		/*
+		 * If the FW was previously successfully halted in the pre-reset
+		 * operation, we need to transition it to active again before
+		 * the FW is rebooted.
 		 * This is not needed on a slow reset because FW sections are
 		 * re-initialized.
 		 */
-		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
-
-		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
+		panthor_fw_mcu_set_active(ptdev);
 	}

 	ret = panthor_fw_start(ptdev);
@@ -1169,6 +1222,10 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 		if (ptdev->fw->irq.irq)
 			panthor_job_irq_suspend(&ptdev->fw->irq);

+		panthor_fw_halt_mcu(ptdev);
+		if (!panthor_fw_wait_mcu_halted(ptdev))
+			drm_warn(&ptdev->base, "Failed to halt MCU on unplug");
+
 		panthor_fw_stop(ptdev);
 	}

diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index 6598d96c6d2a..a19ed48b2d0b 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -214,6 +214,13 @@ struct panthor_fw_global_input_iface {
 #define GLB_FWCFG_UPDATE			BIT(9)
 #define GLB_IDLE_EN				BIT(10)
 #define GLB_SLEEP				BIT(12)
+#define GLB_STATE_MASK				GENMASK(14, 12)
+#define   GLB_STATE_ACTIVE			0
+#define   GLB_STATE_HALT			1
+#define   GLB_STATE_SLEEP			2
+#define   GLB_STATE_SUSPEND			3
+#define   GLB_STATE(x)				(((x) << 12) & GLB_STATE_MASK)
+#define   GLB_STATE_GET(x)			(((x) & GLB_STATE_MASK) >> 12)
 #define GLB_INACTIVE_COMPUTE			BIT(20)
 #define GLB_INACTIVE_FRAGMENT			BIT(21)
 #define GLB_INACTIVE_TILER			BIT(22)
--
2.49.0

