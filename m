Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E06C8F8C7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 17:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CBD910E17A;
	Thu, 27 Nov 2025 16:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="RgR/m0Il";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RgR/m0Il";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013044.outbound.protection.outlook.com
 [52.101.83.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B005210E17A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 16:50:04 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=G6bLydtjnGjOlZyX2Y+jHmiiVWTNhm2gNSD0bjPL5xOAjPqZ5TGDq8tAM971zBkw4j0fnB0WOgMrHC6IhbJsP+SRJZ8Wxvre/7qkxZIVE4CaP+3mZIe8hzOuGYhbhNgIVTPHJV6+6Xvz5j3+fUnA8eFBlDwbIedK2RM536HNMftgY06CNJoYBYV1MhZBuFuwQJu9FgJrIbgvOA1QsvZiE2Qv6T2ASK7cx4Oyd59lEFMEENGC4O+imvm+BR4i0nCY4mM1Lyla0SBr/Thuqc7W+M9yp4tHxyblAWbUhStawrmEKqr9xr9Mgub/LLzqhAZb+19UVGDLVyT2+apRORPayg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2BTJROlGshJ0xPfEUKYQcrwq8iySLfGetJ3LnJPasY=;
 b=OjWkW93Vd4jOJJoH9AIfVaICLnMsjTloCKkAzRkfZGHtj1obtPALpCj0I42HLd/x42+PD2OGY2yZ+NdUkC0hSXlgi4ikDMP+LzP7P09EonM1ITvEbWY9hxmzKKyw8mxwrpAi/1GzG2qfZ1We9wsHEVY3n+ZLqxeDUolDBdsjAAfs8lMNaIFIx+BCFG0nJ58H61eDz2JCDiImw9bd3PCBpeLD7MlWaPcdQ7tXSb/DiniuG9BMXNjC77DsNMo8v0C/EUZWpv9EvtR2w39XuRPtNzoZ3o1LBZGdJmARKS4qjomTXwvWghtpA0cJxHxd8Wg6f4IeLVq/k3RyTitUCwxBQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2BTJROlGshJ0xPfEUKYQcrwq8iySLfGetJ3LnJPasY=;
 b=RgR/m0IlAtWRhUFcDFwQvZ3MkX5AYdAIZiVQ0nC0tstXgpcB3Z7E+HYSv7gPXBW6JL8CJlB1c7khW38WCJDCz45iSTqEfUbM1DUArccps6FvQiyh3IziYsNx2RvEiNfas2ysMTAB6ImJS68Ai81ihT+5OtOFgpz0fiMRzul0yaM=
Received: from DB9PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:10:1da::18)
 by AS8PR08MB7338.eurprd08.prod.outlook.com (2603:10a6:20b:445::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 16:49:56 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::af) by DB9PR05CA0013.outlook.office365.com
 (2603:10a6:10:1da::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Thu,
 27 Nov 2025 16:49:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Thu, 27 Nov 2025 16:49:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tz6FgKLSUBjgF42UNTgSjJmlCNjLRZKoWxugTx9Imqt8pSRP76t7JBDPQmtiJqv6nJCnv0CpgdxXkySRdVDSTObM3Ju31vcb/RWSzU9Mfp9PcsiAnnZtgT00U0thERSwZyDIqWqMDIodg2VD5IGGs+xqy9yyRvb1wY3/oxwiazslLztmQ++5N2nBSDEIqUpzUlmJPlJkQ7nj0FNSNUTGVZ5h+IZJrp4qk1yD/KFOPt55nNrjqFw6QV0I5vpe92QxOV2PUvU9oUBgElVzT16LyjlU97Zwe80yxS3TssaRM5L7BIRTH9vI4zfEqOJymQiWehI5Ltkq9z9En9Tjxnez1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2BTJROlGshJ0xPfEUKYQcrwq8iySLfGetJ3LnJPasY=;
 b=W1/FgFcx9jwVkRjVo0CwuzJhoXKWGYtqzi4jIQNgJ5Jq8dI0+8jfutaf9WX2TrnR7tbGn6DnqIm8QoSficUeEpAvgHEss7nGEm/qMzVUt+SXka9nsg2/TYEnT5wxut48U10OHtqdWkHD1aMRnNo2+2m1pqCctng2/7an5DlNn86AhJ53B95/OzB5iGw9Y2Hd5TcClPCY5hmRVZuRBvVzd71+k6mSsBsnn7j3exWu6v4yLJNVFhRGARlQJg8QyQmcbIrlozqQUd0LOd74eefkI2cwTjHh2DE4A7rskMZ+65hPjH5FliTZXZVOWiuCaew10zJl09Z2I4/sZ5fWnaGTYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2BTJROlGshJ0xPfEUKYQcrwq8iySLfGetJ3LnJPasY=;
 b=RgR/m0IlAtWRhUFcDFwQvZ3MkX5AYdAIZiVQ0nC0tstXgpcB3Z7E+HYSv7gPXBW6JL8CJlB1c7khW38WCJDCz45iSTqEfUbM1DUArccps6FvQiyh3IziYsNx2RvEiNfas2ysMTAB6ImJS68Ai81ihT+5OtOFgpz0fiMRzul0yaM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by AS2PR08MB8502.eurprd08.prod.outlook.com (2603:10a6:20b:55d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 16:49:19 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499%4]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 16:49:19 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH v2] drm/panthor: Prevent potential UAF in group creation
Date: Thu, 27 Nov 2025 16:49:12 +0000
Message-Id: <20251127164912.3788155-1-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0406.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::15) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|AS2PR08MB8502:EE_|DB3PEPF0000885F:EE_|AS8PR08MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a058e2f-16f1-44c4-fd7d-08de2dd4fc48
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?9Go7aqvQ4xNRcSOqP+XEhoZiI1lUtf53Tf0lLcHMaFH2q7IHydaUAnZM9CLT?=
 =?us-ascii?Q?TNyGsQlsQFUmn3//tNUmY056dDji2S1kwc8i8TW6es9hf0oRwIObUpkHNOVx?=
 =?us-ascii?Q?x4yKHDLRrqlscusEgcYHimMYLRd+swae2IMKCr8SqJMU2s4LYqxwfXdXINTA?=
 =?us-ascii?Q?QahUXS7Ay6iS/NAg3D9a2pIpyzhAFrba+uV5AX5R734PBwLhI61PvXFJltvA?=
 =?us-ascii?Q?Ald9L6pNJv2W9tLKgcfmkNLQEq76Po/LVXM31AYjVmgxbcbxlpyP/PxN3T8E?=
 =?us-ascii?Q?bHnImIB16zzlIsebRtiMGMfLZ906stA9s9+0glu9fvrTRT+1JxV1cikn4Ogh?=
 =?us-ascii?Q?z2xHwhAlEi1xpOi90IFWK0/jtl/m6ZGNAx3EeRISUggIm/vDJqWzxfgBLzwO?=
 =?us-ascii?Q?e9n6juLccmaen3LX7/kWJxfdr+AdtXDrUrapvvEaohdLYcHYBsknbs+wzEHe?=
 =?us-ascii?Q?CVcqDK3QAS0q2VbnUf7jPxWd9e3suGwZWu/J4nt5BlLd4RZIZ3zu7f1xeErB?=
 =?us-ascii?Q?C+3MzteGSlblO9Ul2puLp151oEfnvXIQorgj681SjAI1P7giywtL99awOA4V?=
 =?us-ascii?Q?vl4lb+YuwvAUHCbj+WqI2k0VCwF2EN2XdonYOPhlFbkAvF3ebRqpse57qgvS?=
 =?us-ascii?Q?Kjo66XboNP89IBP1zum5J4+kcCO+/Bza9B6DeAdrsWQv7/42cVl4fv2vLX+5?=
 =?us-ascii?Q?hZUtlKN6hS3gXyI/X52MZ/ngrO8iyUGTSg7nlGrqro08FRUeNzEyVv0rShGi?=
 =?us-ascii?Q?B1AGNVbvsuXqK/VOX+V2eooYPPYVw8XS+62jJF9eD3bXy+iMFAJLRlfG85Kc?=
 =?us-ascii?Q?/iVX60JDy5AsWXrWMToXKz0NLm8tXRlChd5XvlS6fyIaSpUvKgF5ouCCSru3?=
 =?us-ascii?Q?WmuNDxHj54vFTKy/tbUQfwbQAvIfucMVL14yYHWwsd9u0X6HGYhqgKqQunyy?=
 =?us-ascii?Q?PtDMDoN/DtYZdh/7LvFz8A9kP5AXPxiphlzbJ/xG71pG8Tb8LaAb+MdIgTBl?=
 =?us-ascii?Q?aIaoKzxHOLnQGY8jb6qm91vb7yiUjGuCFwnoffdB8LiXlNoRQ75iYj0jMTwH?=
 =?us-ascii?Q?9IneqqTI78I+pYls5JAyfLTihlHY5u0gZjm/1Y79oJTVCcUclyXPGSWZKJYL?=
 =?us-ascii?Q?3M+fCapaCMaUiERWzB0f+w0OfJvek2xkqLf/bt08GvKeCEh8zYcR8K2r7PQi?=
 =?us-ascii?Q?mxB2bXGt7aY7iQdcwc4yomYUQ1AvIBCsk7c6Vf7wiZzaId6OafAG2vtRv/wP?=
 =?us-ascii?Q?hs6iFhGmnYaDxwh1cbc5EdUgapkr6TtmdkQ9csu30GiIK9Np0eYmF1+D4X1p?=
 =?us-ascii?Q?jPl81iAISz+jcqTTd2sY5k04UTKWKyzsFJz8B4oFJkRn+ewRSPux0hs/b/BT?=
 =?us-ascii?Q?sTJrXZWyTj8/0kevOSLDeikJ7NFvF+Wj46yCAT0XkdCjmu7TZICpesWikoG/?=
 =?us-ascii?Q?07OiGV2sI4PpJiNe59QF+WWeVin4yR4X?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8502
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5238a0b6-f716-4939-d6c2-08de2dd4e899
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|14060799003|376014|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LuCkyv9ESNI/V/keCKOe4Sr7uXojV5EzcV0b6EjSuNyURue7I2Uz4ztpEOeg?=
 =?us-ascii?Q?V+pIQdk56UozlO2ZR95RTAp1AZ+CrBao+mQm0IMISke94sQ7BT+AY8iPXWa8?=
 =?us-ascii?Q?KFD31J2zvARumuKFsJccymtwbNY9J322s6dlC5jQMK/SPJaBKzBnneY2IHnP?=
 =?us-ascii?Q?D61PgN7C9PMf0QrmTQjZ7RYrWcimrirfAEw4TV23vpVvNHn76esAK21W6W+q?=
 =?us-ascii?Q?nrHWg/9PSaWHROJnG6CiyzjSZnpHAm214Pian6I4RZKyT6NMYjZeAo3DX+MS?=
 =?us-ascii?Q?wEukdWF4Qyugfz8MTWJKHEa/qJMeb7AFcMiujgnhFZN0ZxX+rAO2LpAgMbyH?=
 =?us-ascii?Q?4sh8/JW/iIPeCDf8goQiTxjIfVueP5UAhS5mvlrgu8h7AP5c9pA4p5uZLtZu?=
 =?us-ascii?Q?suSE3kNdcYpyZCbahPr6P2bGTYli/omU09jxTzWbIZkKvUFINJCJo1kwWsJ5?=
 =?us-ascii?Q?ghzPzigppbz0Cy/peQ2S+IJTNQidrPkiFIyctAdmnx3Xeac4bH+E0dcDMOPI?=
 =?us-ascii?Q?MFBzu2yf3WFxjJhFQ+ugsOZ8+jpMSiNySX2sSv2Tlye+bZxt4/qmx8LNU2jv?=
 =?us-ascii?Q?juucszZFsAjwGQI54poxU/OgctQq7+wiH0T3gC3+2qjIttb2NWtx3DTpnsSc?=
 =?us-ascii?Q?WGFBi/9R60N3zYVSx7V38F1Ik8ZOKvu0VuNTmXGiHSJEVe9ynTAOoPbvk5Sd?=
 =?us-ascii?Q?KtxKNYa0RU1e+Xcd3JipzlIlnnwMnClR8of+IakHjs0HmM2dgteO0OFYJJny?=
 =?us-ascii?Q?im6/2OB3y3KiFeIqJwcsYrBiGqQs7GQtbK9YKwNcGdB+qbUo6trcm5X1zDrb?=
 =?us-ascii?Q?BlaK+srQ1rh2KRhRpA9R880dDhdtsDsH2tieE9R3VLJovclKyWfYQOxjTh5e?=
 =?us-ascii?Q?uN2IbC8d75ODRZXx0UXrV/WpmCI2TEVzCAnFpdwWeiwjKsvqZcuXaWAnR2Ey?=
 =?us-ascii?Q?jUx9ZxlBh+rfhXoDcIqRpJWDigHWgrl/E++P0PpTDuYAqqrBuqpF3HYE5Y4P?=
 =?us-ascii?Q?n5/8fLupMsGMujQJcEvkE1EGOX5poxGqfRjzH6iJPUHG1MTXYoueIsvXqGmB?=
 =?us-ascii?Q?l7uvbA3gxBhNsXNf6fVZZKIDoZtK1TbBS0zJP8mKr5ZvdRY49g3gbLuDpWkv?=
 =?us-ascii?Q?+mI1aA9pZacZiYb5XVeTh05eMm7UZmPAwreMdoVbOKtjgiSutiXUXh6ejb1G?=
 =?us-ascii?Q?26GEUOHJouiy8bdXX3t3X4jq+3cEM0TIKvnRFoqI5ihjVfm5ovAz5a1ouGER?=
 =?us-ascii?Q?+bd/PwiaRrdWo5huKnMOJ41VKdyKdmb5H/XrSRdkFowNkm4HYdMtfRIHYAcr?=
 =?us-ascii?Q?AKxVrbWFyh9kV9/OOS8PwrpOq5mUJNnS9OpG+izg0AWm+miASUfyrovgumFp?=
 =?us-ascii?Q?oQhGZ7fpLZZTibG6jkABtY2FAuRe+RtNqLV6SOx+FaOq0HqPwqUtzXvHGYzI?=
 =?us-ascii?Q?6vgJ/DpiguEa/EzKmLALKAf2wBAGQk6PWSGjiaWYm3qPueqs2T6uHRPTYVW9?=
 =?us-ascii?Q?bMynM1GoP005S/yMV/uo4rHiqyYiE4YSYKGSouIuXsn2SnBTL6GBsDEmpwZB?=
 =?us-ascii?Q?LOgp3y1iEw/WzlKmaLc=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(14060799003)(376014)(35042699022)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 16:49:52.1152 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a058e2f-16f1-44c4-fd7d-08de2dd4fc48
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7338
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

This commit prevents the possibility of a use after free issue in the
GROUP_CREATE ioctl function, which arose as pointer to the group is
accessed in that ioctl function after storing it in the Xarray.
A malicious userspace can second guess the handle of a group and try
to call GROUP_DESTROY ioctl from another thread around the same time
as GROUP_CREATE ioctl.

To prevent the use after free exploit, this commit uses a mark on an
entry of group pool Xarray which is added just before returning from
the GROUP_CREATE ioctl function. The mark is checked for all ioctls
that specify the group handle and so userspace won't be abe to delete
a group that isn't marked yet.

v2: Add R-bs and fixes tags

Fixes: de85488138247 ("drm/panthor: Add the scheduler logical block")
Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Akash Goel <akash.goel@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index b834123a6560..a6b8024e1a3c 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -779,6 +779,12 @@ struct panthor_job_profiling_data {
  */
 #define MAX_GROUPS_PER_POOL 128
 
+/*
+ * Mark added on an entry of group pool Xarray to identify if the group has
+ * been fully initialized and can be accessed elsewhere in the driver code.
+ */
+#define GROUP_REGISTERED XA_MARK_1
+
 /**
  * struct panthor_group_pool - Group pool
  *
@@ -3007,7 +3013,7 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
 		return;
 
 	xa_lock(&gpool->xa);
-	xa_for_each(&gpool->xa, i, group) {
+	xa_for_each_marked(&gpool->xa, i, group, GROUP_REGISTERED) {
 		guard(spinlock)(&group->fdinfo.lock);
 		pfile->stats.cycles += group->fdinfo.data.cycles;
 		pfile->stats.time += group->fdinfo.data.time;
@@ -3727,6 +3733,8 @@ int panthor_group_create(struct panthor_file *pfile,
 
 	group_init_task_info(group);
 
+	xa_set_mark(&gpool->xa, gid, GROUP_REGISTERED);
+
 	return gid;
 
 err_erase_gid:
@@ -3744,6 +3752,9 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
 	struct panthor_scheduler *sched = ptdev->scheduler;
 	struct panthor_group *group;
 
+	if (!xa_get_mark(&gpool->xa, group_handle, GROUP_REGISTERED))
+		return -EINVAL;
+
 	group = xa_erase(&gpool->xa, group_handle);
 	if (!group)
 		return -EINVAL;
@@ -3769,12 +3780,12 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
 }
 
 static struct panthor_group *group_from_handle(struct panthor_group_pool *pool,
-					       u32 group_handle)
+					       unsigned long group_handle)
 {
 	struct panthor_group *group;
 
 	xa_lock(&pool->xa);
-	group = group_get(xa_load(&pool->xa, group_handle));
+	group = group_get(xa_find(&pool->xa, &group_handle, group_handle, GROUP_REGISTERED));
 	xa_unlock(&pool->xa);
 
 	return group;
@@ -3861,7 +3872,7 @@ panthor_fdinfo_gather_group_mem_info(struct panthor_file *pfile,
 		return;
 
 	xa_lock(&gpool->xa);
-	xa_for_each(&gpool->xa, i, group) {
+	xa_for_each_marked(&gpool->xa, i, group, GROUP_REGISTERED) {
 		stats->resident += group->fdinfo.kbo_sizes;
 		if (group->csg_id >= 0)
 			stats->active += group->fdinfo.kbo_sizes;
-- 
2.25.1

