Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55569A86167
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 17:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1BA10EBF5;
	Fri, 11 Apr 2025 15:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Rj8QTuEU";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Rj8QTuEU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012061.outbound.protection.outlook.com [52.101.71.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5269B10EBF5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:12:18 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=D593l9jWfDG9ICw1zd/NI3mzBWOtcsDRFQh5FAV5g5m5tmlGE6HJPdW9YZCChfqsLPuJSUJwbZiLgAvgzyBVhGQXNEVyEmDrvuItFrJyCWsCawDYDvfE2rla5r2/Kj+AHRpVSVbraXp1Kk9NQkMvl+9I4wLE0pTVBMAt1ORN+M93LnoQygckcUwTf/hrgWc3QuQjPTukHh8qC5xiVce/NZ+QcbCEmr4YanJLCeU2jmsAvDatvBtRZ3bvRnts96zH+rhNirLe4BN9CqmtquujC4Lu78H0AKOlyAXN/GSHuWfqrLCF30kS+SurW6H7wWtoS7OkBQh+ilWn6VRfd/t1NA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jv1jU5omUE5OEd6mIOUv2DPBcj0+SgLRPz77Cy6iXeI=;
 b=C8zsaqUP2+ItNBkxDhAup85kBatrOKRxMPLZvplUIfh6lsKhJE4TzGfCbZC0ijhllZdq895gfJZD9QwAEmKZ1QmDkWV7CuoJqMD58PVpFlUeLggntww3mmJ99SYLiO4P8uMP9udQDxRi1Slph44spLplAJMtctIFGtnPFDiNNN19EOsEmNNMBmjnj8O7AhG2TnFOJ/BRW1bm2JBizg3LlPAmXtRFt0+sX7eP1ZanTPDy2tlXiL4dmlcawdfLqQSY6XbK9LJzsYyW16/PyQbFTxYGk1lXG08PZF4tmEnirKxC6rDZZdXyI5brHa+XBTeQ3J9V0TShdwU0sdQB+xi3Sg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv1jU5omUE5OEd6mIOUv2DPBcj0+SgLRPz77Cy6iXeI=;
 b=Rj8QTuEU7Fu8zk24TLgnqSuQ/g/7Rk2+pBLAuZPUMOwoJaST4a0QpRmCvvP0SD7wG3yGEvfiYIMreRsg9wFcKhx7X2/4SemuRgXNtBtQipdXjNjpjAMKpZsMjlHAt8OsoWtS63CT6v+0Rn3o0FmCMKtc0SBa4xTlIEx3vvTnSWo=
Received: from DU2PR04CA0295.eurprd04.prod.outlook.com (2603:10a6:10:28c::30)
 by GV1PR08MB8499.eurprd08.prod.outlook.com (2603:10a6:150:83::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 15:12:09 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::eb) by DU2PR04CA0295.outlook.office365.com
 (2603:10a6:10:28c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 15:12:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Fri, 11 Apr 2025 15:12:08 +0000
Received: ("Tessian outbound f9fef7c7dc50:v605");
 Fri, 11 Apr 2025 15:12:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4cb2fde19ddc96d1
X-TessianGatewayMetadata: /rmKb2jHgb+C24z79g7BAGx5skrcglMCA6cqzulQsu3bGDaRNdcq2DqF9NegMpmzGg98ImhQJkXOMlAB8C68hy6QEpyK4RBJfMwBjq0hZHnkbqxbjIUaL2wPnsbH5YI0LboUbrFKndy2sEcM1XteyrWdfMcysFTFOqLd77wgADM=
X-CR-MTA-TID: 64aa7808
Received: from Lc5c55f4b23ee.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1C373C9C-483A-460F-B06E-A30AF27F4EFF.1; 
 Fri, 11 Apr 2025 15:12:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lc5c55f4b23ee.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Apr 2025 15:12:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmklvEDmAFaKtDjm+3x614GEFCsAqRFhwhsxRhEM49aBka9IPg58idYDfQduoOI1ms9SSS2VFxjDkPQLIPQMlfcCx3tGVlD0Zbdbk63EGL6VU/aMACrXe4i82ozDxcoRx5qPi3tpZaUN2YK+jImxoDKuQeAyMRwy/ycJaaw1fV3RJTFTc9uV7oR5Oe6J8wolRhPaecCze8nKiNFp0zyEVpILwI5VS3kpWEmxZPS0LGsFDKlInWXa0JPfQ2R8THANyMIJ+Hje5HP2aiJdTxL6SLRmQyTq5WgSiwtcnX+WGKpVuJiI8keTo2wM2NXQ6tiT68712QHOm6zqz5Obk1h7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jv1jU5omUE5OEd6mIOUv2DPBcj0+SgLRPz77Cy6iXeI=;
 b=p21gxh5NayOk6bjUS7KqhxsMDbMmmQjc+n2Q/rhOXhnD8cCNvyvk1tM8/A5F0jKx80ArIJ8g+KADb8ZOcH7c9EFGQPh5ALXP3IoJBz7Ko6bvLnqfpC4BxgyLYpF9jL/3dcrzsYhQULGqJap/ZQHGvFegLw1rMGbT7rDiZVRw0Cr6l6fyalxZG/FX04aNNMsPMfD6nrGPL+K5Nvl8UyyCwfPMHxYkqUrRDI3YN71kY5XQp4h2ZZooT7ir53t/Wzx1YxymNwR6B9xsRZudE2P9elniAxgLX1uNJKA/aq/rPerQTGYZjIbGlFOX5FhTv4w1UbdVOEqGpR3EZo73ps6rZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv1jU5omUE5OEd6mIOUv2DPBcj0+SgLRPz77Cy6iXeI=;
 b=Rj8QTuEU7Fu8zk24TLgnqSuQ/g/7Rk2+pBLAuZPUMOwoJaST4a0QpRmCvvP0SD7wG3yGEvfiYIMreRsg9wFcKhx7X2/4SemuRgXNtBtQipdXjNjpjAMKpZsMjlHAt8OsoWtS63CT6v+0Rn3o0FmCMKtc0SBa4xTlIEx3vvTnSWo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AM8PR08MB6499.eurprd08.prod.outlook.com
 (2603:10a6:20b:317::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.25; Fri, 11 Apr
 2025 15:12:01 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 15:12:01 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/panthor: Add 64-bit and poll register accessors
Date: Fri, 11 Apr 2025 16:11:39 +0100
Message-ID: <20250411151140.1815435-2-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250411151140.1815435-1-karunika.choo@arm.com>
References: <20250411151140.1815435-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::14) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AM8PR08MB6499:EE_|DB1PEPF000509FF:EE_|GV1PR08MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b4c61c-29a8-4918-af20-08dd790b3a88
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Ty7uAoLgbU+JyaSJz6owb+XqtD03TU362YnKlEPR9hNKm2T+SM5HlMgct+Sk?=
 =?us-ascii?Q?M/lEMhZfXcVAotOIrVyGdSIqdBp3Ji3QTf3bDUgCQ9QWM1NrRyIF7Yg0DTiS?=
 =?us-ascii?Q?D/Yg8kxT0zoT55fhgnhxn1vuRoJ/5iiyf+8pA1yKzQgOwsSBag97r7KDyBXi?=
 =?us-ascii?Q?o2RGcfNdfqnQbhjl81DGPbL+OR7ZrG2dJ1KU7v37uXv0UAZsw5Zyg82tLrRu?=
 =?us-ascii?Q?mOkOrwUbUVrQV+4xGfBQpf0EEuztCj0lQ3hRoVzAurk+MOmYmzR/G9LnvTuU?=
 =?us-ascii?Q?LCms7lXp29xnyNAhc6V69mDW4f8AQHHojvPcRJvFbr6uZvv3M+FcBSAh5MT6?=
 =?us-ascii?Q?Q6PXuQe9p187J9tYVXoYNRGA84+m1q6McwfN5YwB/oZSnncF8Venz9jxQYB3?=
 =?us-ascii?Q?E5Mq3ziZliwDNcX3rveqmjmya8TH/XoR5eq6izugaM1EnFfgUsaH59ncvKNk?=
 =?us-ascii?Q?soepNM2pTM2zNJDDosANxJ6k/oyCaWXtoLxFprzVD3GRgdve1WslwmCIVRAG?=
 =?us-ascii?Q?QB+osffMUcDH7seJy36bVGHqp8VzDZgE3o8zr0SeCxtg6NrF2Soifw1P0sC5?=
 =?us-ascii?Q?hEXc/u8cXZQSzjXR9XOMyQQhevJLdk1TYz8eTzQ3ZNvbUswgNKZdWd5sg67c?=
 =?us-ascii?Q?5ZIZi86nnWTzIluqhmyuoZOsijlKgtJnlEfDNHz6obWD6GDLhC8MhwIJnySv?=
 =?us-ascii?Q?cCh/ZGulPCmX9QfXPMbBwmszeNJzc581j/DvJ9IASfAG8UXOSxyvwlz7a7UF?=
 =?us-ascii?Q?A+5HKPm2+9gbHXOHos2gaUe+586bZw4Q+MEJjt4XMvDg1qv30kWJ4p7PAV5Z?=
 =?us-ascii?Q?CkriyYvnLLcLenQlyvOcS8p/632GeR1JlzCArM74W4I2pSGxqm8mkp8KUuwk?=
 =?us-ascii?Q?86/JyFxff7JXJEwdtx17/7XBwy2S8rKFTxOu+vMoaoFWaOtXAz0m6kW/sVuq?=
 =?us-ascii?Q?bGTI85PLrDG8cx3Jw+5UiA/ia8YQ/eW7oyw6cZR1RUsgGT3BQhcbqccUqLp4?=
 =?us-ascii?Q?GbLUBqNQsT1Amm3PjjSQZD2sr4RESiTc77rSgUfR3o8fWWMp8QlwbVNQeSOu?=
 =?us-ascii?Q?UyjucOWJh4XK/x70OrOzVN0GOtrvZkOA796SSDmPFtY+J/e3DNdGp8h4uizW?=
 =?us-ascii?Q?diM7QAWySe7847JCf9cp42T4/+diCRDOwaYVJd6dcJme76vO5EAtmJWb1nfM?=
 =?us-ascii?Q?Su8XxeY/v4icWJlDoPqmnBLd1ivpMRAtxmnoRQBu+RKbQuFo7cXYyF6vdIa8?=
 =?us-ascii?Q?GJlpL+/4iuJWXMjt08Rol/6rP4iCmapDMf/oEbPQAc68wUaV/7pSdgomZdad?=
 =?us-ascii?Q?SxyiUvn35OYuiBeNsvDhIICUhsw/9dWXWX98o3KLM49J3eTFYxdDV8gY+yvJ?=
 =?us-ascii?Q?eSMzxL9z8kLANlp9JcfhbMklFUdIb4gkqMH78Y8u1LSNsa+Er+6x+rdZ7CjF?=
 =?us-ascii?Q?4ITjAlYAbF8=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6499
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 84c3fca9-e961-4159-80db-08dd790b359e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|1800799024|36860700013|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fJG8bpmeSRpwgjVbt4N5uA918gApFacKn4NYnVjRyMnSNJdOB95JmbfsZJkx?=
 =?us-ascii?Q?b4VF/cKZCPqp7A+nb4g4Vh46FMvql8X45jxHfW+G18ex8iu/Sz2JYqQl4+AA?=
 =?us-ascii?Q?TKXc7wmI4rNNfWjClGnj6RO5fAjhqes0T7hfWFaxcQ7ELfBhU5QZlJ4mrvet?=
 =?us-ascii?Q?MUReWFBFbKcXbYzypSQt3ScSmHEm/RS21my3WUX0LlFNDoFEDsGEZXgP0Yxm?=
 =?us-ascii?Q?Jkg/rDzG4gPeSH1/EwrqiuP+pyp2HXSYwkIFbKnuVFet6sTyolAiBMg8Pthc?=
 =?us-ascii?Q?Or9U1CeyyPUUzE94OiYP1faRg6Abw0ytL9gpYJTG02/gTKL2zVtIEmZUvehp?=
 =?us-ascii?Q?GZhmZ9vUVL6tEFYOXQW+AG5IwCV8v+HRt815S6Atkkq7ROX1Q2B9Akuq9yHB?=
 =?us-ascii?Q?72+BhMEKKMVwLQE/fpAqJxbbNomUi/BzzkGlbYsleXyC0CqPz93dtF+iRzc0?=
 =?us-ascii?Q?MvfuMUskLB8WX2c8kKv34Vt+FySpOYBc5TaVftqbP9R7R/CmDwSsco7YS9nk?=
 =?us-ascii?Q?1iRSFYw/QaLsEmypKbixidOFo5N0vTCrVwpb8camfxpTjGoRdDLhpIY2/W62?=
 =?us-ascii?Q?UfnVWGlF/r+0mdkBKD9qVOZB9KzMRC9rRHzHzksIKOVl6GmBOHF1BbmhiWQv?=
 =?us-ascii?Q?GOFmQFu/ErmRH+MarJTdmAoGSu8cy18dJ2VkwHRqzj/5Jt95NXadO3Ws4XdA?=
 =?us-ascii?Q?Ne2fMLWLfh3q5fwr1fSAPvAnI5w5I9wENN+EfvmPU0Gt2ifbDl/oIyTfFh0I?=
 =?us-ascii?Q?hHjM7tQizeeFqV5FB/cCstW8q+iAPjglHSiI+rs4bg9GHzLObybOMZQC6C0v?=
 =?us-ascii?Q?zVi3otagPEA3C3zLnqiFIU8o95MzSl0zptQyOtS2CkAsJJzzEYLy5tRAOJmn?=
 =?us-ascii?Q?ZBwWythGMT+xDJH7tD5/LkBEL+1szxeJ7W+7afxqj1ebmVk9ZTfcXeSsvQsI?=
 =?us-ascii?Q?b6aZdlFemdfe1HtBo3GFtJd+Q3WQbPoafPLDzMN0u09TQc2wgzxoBvbFQ04r?=
 =?us-ascii?Q?I9nVhS4asJ6vHd0qhDGIqXavSvp0m3IAV6mlkTHA/9ucpzIyrajJtE9Vo7F2?=
 =?us-ascii?Q?1wY0QE1eMM5dbvKxP80Pim+RWP4bgoQPKLgMs0JepbT7r/eWwmNPTBIGb/eD?=
 =?us-ascii?Q?b/4ZZEcF6wdLDYX/hK8WAeNvxZfMbvJn8emIQkxThr7EhgH/8Ip6CuMtATwz?=
 =?us-ascii?Q?7SsgBVQgWXD6mdR7ohR4Pa6j41MBQJ+Angbokk1oatZtjDJV8UirabdGfJZQ?=
 =?us-ascii?Q?5EinwqkfMZGUJh25YylLOjN3QhfYSyQKysiBoNhsPhvnOODRuBNxVQV0Jzur?=
 =?us-ascii?Q?0pC5RO9h7I5wLNgml4wF03RtRytWOqxlCErnGpDrkaL64kDUm+zgw6kE4Jwx?=
 =?us-ascii?Q?KU/7IbV6Al1tIAbaDvCcbADshUH/uC1AlNaFOT+CCIOhjIIMpp2FyLdTazdC?=
 =?us-ascii?Q?k4ekylh75HkolKcpW4gvtlup4n3sJjMBTIO4kSzqjYmaChff8OvllKMICLJM?=
 =?us-ascii?Q?3dxIJeJbcbMej0pwbK9ey4eED2i51q9mKDpg?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(1800799024)(36860700013)(82310400026)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 15:12:08.9959 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b4c61c-29a8-4918-af20-08dd790b3a88
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8499
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

This patch adds 64-bit register accessors to simplify register access in
Panthor. It also adds 32-bit and 64-bit variants for read_poll_timeout.

This patch also updates Panthor to use the new 64-bit accessors and poll
functions.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.h |  71 ++++++++++++
 drivers/gpu/drm/panthor/panthor_fw.c     |   9 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    | 142 ++++++-----------------
 drivers/gpu/drm/panthor/panthor_mmu.c    |  34 ++----
 drivers/gpu/drm/panthor/panthor_regs.h   |   6 -
 5 files changed, 124 insertions(+), 138 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index da6574021664..40b935fcc1f4 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -428,4 +428,75 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
 
 extern struct workqueue_struct *panthor_cleanup_wq;
 
+static inline void gpu_write(struct panthor_device *ptdev, u32 reg, u32 data)
+{
+	writel(data, ptdev->iomem + reg);
+}
+
+static inline u32 gpu_read(struct panthor_device *ptdev, u32 reg)
+{
+	return readl(ptdev->iomem + reg);
+}
+
+static inline u32 gpu_read_relaxed(struct panthor_device *ptdev, u32 reg)
+{
+	return readl_relaxed(ptdev->iomem + reg);
+}
+
+static inline void gpu_write64(struct panthor_device *ptdev, u32 reg, u64 data)
+{
+	gpu_write(ptdev, reg, lower_32_bits(data));
+	gpu_write(ptdev, reg + 4, upper_32_bits(data));
+}
+
+static inline u64 gpu_read64(struct panthor_device *ptdev, u32 reg)
+{
+	return (gpu_read(ptdev, reg) | ((u64)gpu_read(ptdev, reg + 4) << 32));
+}
+
+static inline u64 gpu_read64_relaxed(struct panthor_device *ptdev, u32 reg)
+{
+	return (gpu_read_relaxed(ptdev, reg) |
+		((u64)gpu_read_relaxed(ptdev, reg + 4) << 32));
+}
+
+static inline u64 gpu_read64_counter(struct panthor_device *ptdev, u32 reg)
+{
+	u32 lo, hi1, hi2;
+	do {
+		hi1 = gpu_read(ptdev, reg + 4);
+		lo = gpu_read(ptdev, reg);
+		hi2 = gpu_read(ptdev, reg + 4);
+	} while (hi1 != hi2);
+	return lo | ((u64)hi2 << 32);
+}
+
+#define gpu_read_poll_timeout(dev, reg, val, cond, delay_us, timeout_us)	\
+	read_poll_timeout(gpu_read, val, cond, delay_us, timeout_us, false,	\
+			  dev, reg)
+
+#define gpu_read_poll_timeout_atomic(dev, reg, val, cond, delay_us,		\
+				     timeout_us)				\
+	read_poll_timeout_atomic(gpu_read, val, cond, delay_us, timeout_us,	\
+				 false, dev, reg)
+
+#define gpu_read64_poll_timeout(dev, reg, val, cond, delay_us, timeout_us)	\
+	read_poll_timeout(gpu_read64, val, cond, delay_us, timeout_us, false,	\
+			  dev, reg)
+
+#define gpu_read64_poll_timeout_atomic(dev, reg, val, cond, delay_us,		\
+				       timeout_us)				\
+	read_poll_timeout_atomic(gpu_read64, val, cond, delay_us, timeout_us,	\
+				 false, dev, reg)
+
+#define gpu_read_relaxed_poll_timeout_atomic(dev, reg, val, cond, delay_us,	\
+					     timeout_us)			\
+	read_poll_timeout_atomic(gpu_read_relaxed, val, cond, delay_us,		\
+				 timeout_us, false, dev, reg)
+
+#define gpu_read64_relaxed_poll_timeout(dev, reg, val, cond, delay_us,		\
+					timeout_us)				\
+	read_poll_timeout(gpu_read64_relaxed, val, cond, delay_us, timeout_us,	\
+			  false, dev, reg)
+
 #endif
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 0f52766a3120..ecfbe0456f89 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1059,8 +1059,8 @@ static void panthor_fw_stop(struct panthor_device *ptdev)
 	u32 status;
 
 	gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_DISABLE);
-	if (readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
-			       status == MCU_STATUS_DISABLED, 10, 100000))
+	if (gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
+				  status == MCU_STATUS_DISABLED, 10, 100000))
 		drm_err(&ptdev->base, "Failed to stop MCU");
 }
 
@@ -1085,8 +1085,9 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
 
 		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
 		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
-		if (!readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
-					status == MCU_STATUS_HALT, 10, 100000)) {
+		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
+					   status == MCU_STATUS_HALT, 10,
+					   100000)) {
 			ptdev->reset.fast = true;
 		} else {
 			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 671049020afa..fd09f0928019 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -108,14 +108,9 @@ static void panthor_gpu_init_info(struct panthor_device *ptdev)
 
 	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
 
-	ptdev->gpu_info.shader_present = gpu_read(ptdev, GPU_SHADER_PRESENT_LO);
-	ptdev->gpu_info.shader_present |= (u64)gpu_read(ptdev, GPU_SHADER_PRESENT_HI) << 32;
-
-	ptdev->gpu_info.tiler_present = gpu_read(ptdev, GPU_TILER_PRESENT_LO);
-	ptdev->gpu_info.tiler_present |= (u64)gpu_read(ptdev, GPU_TILER_PRESENT_HI) << 32;
-
-	ptdev->gpu_info.l2_present = gpu_read(ptdev, GPU_L2_PRESENT_LO);
-	ptdev->gpu_info.l2_present |= (u64)gpu_read(ptdev, GPU_L2_PRESENT_HI) << 32;
+	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
+	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
+	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
 
 	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
 	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
@@ -152,8 +147,7 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	if (status & GPU_IRQ_FAULT) {
 		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
-		u64 address = ((u64)gpu_read(ptdev, GPU_FAULT_ADDR_HI) << 32) |
-			      gpu_read(ptdev, GPU_FAULT_ADDR_LO);
+		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR_LO);
 
 		drm_warn(&ptdev->base, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
 			 fault_status, panthor_exception_name(ptdev, fault_status & 0xFF),
@@ -244,45 +238,27 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
 				u32 pwroff_reg, u32 pwrtrans_reg,
 				u64 mask, u32 timeout_us)
 {
-	u32 val, i;
+	u32 val;
 	int ret;
 
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
-
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
-						 val, !(mask32 & val),
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
+					      100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"timeout waiting on %s:%llx power transition", blk_name,
+			mask);
+		return ret;
 	}
 
-	if (mask & GENMASK(31, 0))
-		gpu_write(ptdev, pwroff_reg, mask);
-
-	if (mask >> 32)
-		gpu_write(ptdev, pwroff_reg + 4, mask >> 32);
-
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
+	gpu_write64(ptdev, pwroff_reg, mask);
 
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
-						 val, !(mask32 & val),
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
+					      100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"timeout waiting on %s:%llx power transition", blk_name,
+			mask);
+		return ret;
 	}
 
 	return 0;
@@ -305,45 +281,26 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
 			       u32 pwron_reg, u32 pwrtrans_reg,
 			       u32 rdy_reg, u64 mask, u32 timeout_us)
 {
-	u32 val, i;
+	u32 val;
 	int ret;
 
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
-
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
-						 val, !(mask32 & val),
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
+					      100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"timeout waiting on %s:%llx power transition", blk_name,
+			mask);
+		return ret;
 	}
 
-	if (mask & GENMASK(31, 0))
-		gpu_write(ptdev, pwron_reg, mask);
-
-	if (mask >> 32)
-		gpu_write(ptdev, pwron_reg + 4, mask >> 32);
-
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
+	gpu_write64(ptdev, pwron_reg, mask);
 
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + rdy_reg + (i * 4),
-						 val, (mask32 & val) == mask32,
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
+					      100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
+			blk_name, mask);
+		return ret;
 	}
 
 	return 0;
@@ -492,26 +449,6 @@ void panthor_gpu_resume(struct panthor_device *ptdev)
 	panthor_gpu_l2_power_on(ptdev);
 }
 
-/**
- * panthor_gpu_read_64bit_counter() - Read a 64-bit counter at a given offset.
- * @ptdev: Device.
- * @reg: The offset of the register to read.
- *
- * Return: The counter value.
- */
-static u64
-panthor_gpu_read_64bit_counter(struct panthor_device *ptdev, u32 reg)
-{
-	u32 hi, lo;
-
-	do {
-		hi = gpu_read(ptdev, reg + 0x4);
-		lo = gpu_read(ptdev, reg);
-	} while (hi != gpu_read(ptdev, reg + 0x4));
-
-	return ((u64)hi << 32) | lo;
-}
-
 /**
  * panthor_gpu_read_timestamp() - Read the timestamp register.
  * @ptdev: Device.
@@ -520,7 +457,7 @@ panthor_gpu_read_64bit_counter(struct panthor_device *ptdev, u32 reg)
  */
 u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
 {
-	return panthor_gpu_read_64bit_counter(ptdev, GPU_TIMESTAMP_LO);
+	return gpu_read64_counter(ptdev, GPU_TIMESTAMP_LO);
 }
 
 /**
@@ -531,10 +468,5 @@ u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
  */
 u64 panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev)
 {
-	u32 hi, lo;
-
-	hi = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_HI);
-	lo = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_LO);
-
-	return ((u64)hi << 32) | lo;
+	return gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET_LO);
 }
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 12a02e28f50f..a0a79f19bdea 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -510,9 +510,9 @@ static int wait_ready(struct panthor_device *ptdev, u32 as_nr)
 	/* Wait for the MMU status to indicate there is no active command, in
 	 * case one is pending.
 	 */
-	ret = readl_relaxed_poll_timeout_atomic(ptdev->iomem + AS_STATUS(as_nr),
-						val, !(val & AS_STATUS_AS_ACTIVE),
-						10, 100000);
+	ret = gpu_read_relaxed_poll_timeout_atomic(ptdev, AS_STATUS(as_nr), val,
+						   !(val & AS_STATUS_AS_ACTIVE),
+						   10, 100000);
 
 	if (ret) {
 		panthor_device_schedule_reset(ptdev);
@@ -564,8 +564,7 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	region = region_width | region_start;
 
 	/* Lock the region that needs to be updated */
-	gpu_write(ptdev, AS_LOCKADDR_LO(as_nr), lower_32_bits(region));
-	gpu_write(ptdev, AS_LOCKADDR_HI(as_nr), upper_32_bits(region));
+	gpu_write64(ptdev, AS_LOCKADDR_LO(as_nr), region);
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
@@ -615,14 +614,9 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 	if (ret)
 		return ret;
 
-	gpu_write(ptdev, AS_TRANSTAB_LO(as_nr), lower_32_bits(transtab));
-	gpu_write(ptdev, AS_TRANSTAB_HI(as_nr), upper_32_bits(transtab));
-
-	gpu_write(ptdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
-	gpu_write(ptdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
-
-	gpu_write(ptdev, AS_TRANSCFG_LO(as_nr), lower_32_bits(transcfg));
-	gpu_write(ptdev, AS_TRANSCFG_HI(as_nr), upper_32_bits(transcfg));
+	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), transtab);
+	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), memattr);
+	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), transcfg);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -635,14 +629,9 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 	if (ret)
 		return ret;
 
-	gpu_write(ptdev, AS_TRANSTAB_LO(as_nr), 0);
-	gpu_write(ptdev, AS_TRANSTAB_HI(as_nr), 0);
-
-	gpu_write(ptdev, AS_MEMATTR_LO(as_nr), 0);
-	gpu_write(ptdev, AS_MEMATTR_HI(as_nr), 0);
-
-	gpu_write(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
-	gpu_write(ptdev, AS_TRANSCFG_HI(as_nr), 0);
+	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), 0);
+	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), 0);
+	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -1680,8 +1669,7 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 		u32 source_id;
 
 		fault_status = gpu_read(ptdev, AS_FAULTSTATUS(as));
-		addr = gpu_read(ptdev, AS_FAULTADDRESS_LO(as));
-		addr |= (u64)gpu_read(ptdev, AS_FAULTADDRESS_HI(as)) << 32;
+		addr = gpu_read64(ptdev, AS_FAULTADDRESS_LO(as));
 
 		/* decode the fault status */
 		exception_type = fault_status & 0xFF;
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index a3ced0177535..6fd39a52f887 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -232,10 +232,4 @@
 #define CSF_DOORBELL(i)					(0x80000 + ((i) * 0x10000))
 #define CSF_GLB_DOORBELL_ID				0
 
-#define gpu_write(dev, reg, data) \
-	writel(data, (dev)->iomem + (reg))
-
-#define gpu_read(dev, reg) \
-	readl((dev)->iomem + (reg))
-
 #endif
-- 
2.47.1

