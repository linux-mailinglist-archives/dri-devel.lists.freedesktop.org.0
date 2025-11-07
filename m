Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F13C4051E
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 15:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB58710EADF;
	Fri,  7 Nov 2025 14:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="PjloqWH+";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PjloqWH+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011023.outbound.protection.outlook.com
 [40.107.130.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AC010EAE1
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 14:25:54 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Zf6GlpqxeP22PjffjdsPRl/eabdwjSMujkZUC0OS8dfWBNC975v2+BBC0EmLUL0K6WZTt3uYhAikxhEsOFl8GewPmArTnTvTsA4SOnMj/DWh52OFi2PQEDHTUl6/reXgx1K1R87a3mMqS+DASFF7NySKv8bdFVwi+FChQ2wicamED+rbLKVeaCA4AxltdXs+QnLDWhusCxN7Ep4+55eB45aE+H4DCJHw+1otwW8Mgg2UMukHZaFaFpAtqxmD0pObE9GqcCCK35Zdxl6vZYu2JXPgnc2wLuZmmoG/KxvqR5vUNgSXZa2IG+27U+AUb4Z7kkl3pDoBIDdxK8aTG3Pl0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mqjx8O9jkX7GrfuiVX89IU7EGctr/x1ATxavXnxJqgo=;
 b=UmUDS9nL//lGfxuYsop8r1Z4/Jsqh648euxP2FzLlJiq6AeXllQ5zd5KZFflQyCiLIPmKilbWm5NJdy3TsrbXCVZywJijzMrpABSeZD+VuPTJe94a22z2UpKp8BZKgSnwcmPsQgR/9AsYE+Y+tGxOL+oGrEKzO475FA0a3FBWSqaciL+zQrbOD1fcybYTpAwSSP+TCcUQSEVcL2gfxR27b/gJh0R6NMViI+NovZ+gzte5zC351Mm1/vO0l8ci7VkvXYuq+GzsLmgXc1wVAt0Oo5lsLXLkOkyMiDrLTpBM34BLuvWBijCytcgNNQlkNYKx9DuGf9d+PUS6h4a+fhkKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mqjx8O9jkX7GrfuiVX89IU7EGctr/x1ATxavXnxJqgo=;
 b=PjloqWH+Yw8oEQR2qAal7BbFyogcVnahYR+OTYNcVMivX/bhteiVsDJzfWj7YOcdu9L+oCg8RiX+Vkv+TtJl/pgQYGHPxuDaXgI+1+2nFo6gWZYuPtaYr4citB2CVOKjBrQ1POjHCJMoUTUano24PlK6qHBxTrJAAyOkXru0taA=
Received: from AS4PR09CA0017.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::11)
 by AS8PR08MB8801.eurprd08.prod.outlook.com (2603:10a6:20b:5bd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Fri, 7 Nov
 2025 14:25:48 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::95) by AS4PR09CA0017.outlook.office365.com
 (2603:10a6:20b:5d4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 14:25:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Fri, 7 Nov 2025 14:25:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pEoIzOfnP4Kl+XKFOlvDTSCU6rc54PUjKjPFylPJuXG+fH2hRBFCV8KEQ7g5j/GCYgFaZY/Bh4Tnu6H8C9aEyv8nObzSSILNLp8J7IZAtnS2O2394CEk8Zrny6VomLqqhJn9hKszs9gcXb9ubpLnITlSOjsBDoDohVvh01XEHpX8nHKwNzEfrmvAHzngQxK/TpO+zDcSV9iO94I1lYSm1mlS1HEuxzeeE5MPTG1sBWEHGdKklz4cT7BL/KIzzCbnGHkVuwAa6t4Jnf0nI6JdDdNQvfmHZihciIF2urbLdQkpjP48h+ZMHL/X4pBPzrEx8ODFJmE6TjQOBIWcy15ABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mqjx8O9jkX7GrfuiVX89IU7EGctr/x1ATxavXnxJqgo=;
 b=v/tWzC8hSZ1yrVkLMtVpVseRgBf9vh6VkkHzHxATqFrKzQaHIyGgwoA1jle7W8jgunNjFoghEEc8ukcnb1ZxmLQvsRkOTbXXPeUvmyJRW3skWs51GwavcxVFQ8LHZbq7whr7psSeSVK+iDHtKpM0rLl1FkaRSF9+2/FLxRUD0L0XDIV6FxrI77caJS2d0KxAnIHlrAYa9ZdTgX3GaRpNCCcbF+97cCdEkuZhiJqdaFCo7fYNZNouGMOjS3+jDFvMX501nrTjgEU8u9aFfsXdgXJ7UsieVx2diFPZe8utO2cdYACjaIPJXAtFYc2s/lupOhnriDUblxPIa3EtKBJQwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mqjx8O9jkX7GrfuiVX89IU7EGctr/x1ATxavXnxJqgo=;
 b=PjloqWH+Yw8oEQR2qAal7BbFyogcVnahYR+OTYNcVMivX/bhteiVsDJzfWj7YOcdu9L+oCg8RiX+Vkv+TtJl/pgQYGHPxuDaXgI+1+2nFo6gWZYuPtaYr4citB2CVOKjBrQ1POjHCJMoUTUano24PlK6qHBxTrJAAyOkXru0taA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS4PR08MB7505.eurprd08.prod.outlook.com
 (2603:10a6:20b:4f7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 14:25:15 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9298.007; Fri, 7 Nov 2025
 14:25:15 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/8] drm/panthor: Implement L2 power on/off via PWR_CONTROL
Date: Fri,  7 Nov 2025 14:24:36 +0000
Message-ID: <20251107142440.1134528-5-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251107142440.1134528-1-karunika.choo@arm.com>
References: <20251107142440.1134528-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0445.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::18) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS4PR08MB7505:EE_|AMS0EPF000001A5:EE_|AS8PR08MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: dc754d91-0443-4a45-b7e4-08de1e098b7c
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?h9v+8gcRZuPZaWNXRy58D+ysdqyJqGxahk8JwlRWZGck/hZhY57FlfpoN6QY?=
 =?us-ascii?Q?xHzwQEASuK9izL0hegDS+TrBrdf7PjXuYKlelkhK89Cs3LrFWbuFQp5crdcu?=
 =?us-ascii?Q?E1ojja1Y88jVRIf8dh3wlbL1LuC4xxAo2ZnwWY22/wOp8PD9ynCdM0VB20i1?=
 =?us-ascii?Q?VrGREgKy2hp+3GbkISWaTaAEcIXnYCoLdQIjJwDxk4gl0wcO3quWXOTP98Xs?=
 =?us-ascii?Q?/tTuysN2Ahm13KJawSGlNXZL35YxQo+HyMXHpcBazE6EDG81V63Kkj8K62gI?=
 =?us-ascii?Q?NrfVQS3Rvw45sr4Ei1f3xuoBn1F6aI3NQmhhZtflcSfUtgciNajy06PRkC57?=
 =?us-ascii?Q?FKg2mcG5O6B3cFpvQE8xv9tgODBxOvhp3fLLABir/fCVSlXzWTpmL3m8/epC?=
 =?us-ascii?Q?j7sL4dqq79WOQKZCwzCB9ws9IH2tTZ4u7Upj0+JqC1toZ98TW6MOq+xGURji?=
 =?us-ascii?Q?mvcsdDlghH3LYihXL5mTFHTvTDS8ZoytETCPYRXt1CVPUc9YTe4xiX1nBK6N?=
 =?us-ascii?Q?PMCSIWnzJWT2BU/XE/jgWwso3KdI6+dniNgMMzlBLAn4VY2O0s83o23Kaaxq?=
 =?us-ascii?Q?gJqaJiXViclWm+2Cbs3VR+Fuj7k4gELenygbsAQiOO3WJ5e4OJtSZWdZwfBH?=
 =?us-ascii?Q?+kKU2DnMk6ZkMURGoQyXQkdA9XcQOg41swuFCGW7PRXMMK9pRPrQnz1q2Jup?=
 =?us-ascii?Q?g3qa9HBoVbMDmQW4K8OMe6u6b+yV9lVlIC2ILpTIuw8FhHhUPuiaimzXIJL6?=
 =?us-ascii?Q?PeajzFZNacS3bd17Xtzvbe6bkULqUFUfnfWZBy2LObArAnOqCAcJK7s7ZNUH?=
 =?us-ascii?Q?7SEfRXSOLzPRekEgwjIRTxv0t0yX3CdatvZez7cNipLeFFG52Y7sZQi5k0Tc?=
 =?us-ascii?Q?vgqLVhzbNbk+ipqOiKWtAjIc8klMJDm85w7/VO8ekjE+EKk2TSGcuEchGjwY?=
 =?us-ascii?Q?gZkUOiqmwuClytWMbsOMLjpkt6H8wmPLwMlOoj2eJE853/iRI26SPLP8iOai?=
 =?us-ascii?Q?rrj7JSukskhe/JEmkiG3YyKByooN1VZQ4e7UeMk1QCrEfiUNErPD5IJLlNDE?=
 =?us-ascii?Q?RNvYrpcWydtI9oS1cm+0xqAYQ/+A5oYoF0cdOtId1fLJ63uX02gX99Jd8fP5?=
 =?us-ascii?Q?Lre9pNxedQ+Cag8Uih2FLEC0vLAOFNPvEVY9GsNe1qtEZ4i8iFz3u2VzmwEz?=
 =?us-ascii?Q?ioNm2GGm1mTAPF3qMdVRdfCcxIu/3Wt+v+LczUPuVPrXUAfmF7/dzFWWpAAm?=
 =?us-ascii?Q?QYUCQMEAqhb9xkhecZCHN0mP297YbQI1hVZxomwG1bBWjrC3F9nZsfcJZjIW?=
 =?us-ascii?Q?IKu8m6UYmWqg2niC03jKylgw1IOqVpvsNQJucQz95dg6Ni2c1G9wsro1bzk/?=
 =?us-ascii?Q?4+ucEQpkNVAdXQITxFzSN0wwErLboODxOlQ43qFSNDSSQ+ztulWmG1I6OnSh?=
 =?us-ascii?Q?f9jQrjcp1ldfcNwH9VNSn6Z71inBdPHQ?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7505
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d2528884-361a-4b41-03d8-08de1e0977df
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|14060799003|35042699022|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3mVLHam8GGn8+KS9aNBrdWX8a0SLEF+bCHS1w2PhOKQm4+RR8hI+g+pdpCKp?=
 =?us-ascii?Q?U5t3Npe8Uc1JCu5P/Sh3chwW1CsYXx9cxPV6hkWYfXOdr/Mra6bl/MqyjldS?=
 =?us-ascii?Q?yaeDaZrjjHwUz2f85EC6sZ7lQvXBXWCsB7wWxkb2gb0xBujtjNp09PdVn41Z?=
 =?us-ascii?Q?41b7BSF1bDVzca6taDxRm7Z98mJgsMaGShXK3fdEwBY4xwrLHydi0xlcOhMi?=
 =?us-ascii?Q?3cgAwc+iGWK+eWSwYyM9uTohMLeQw5QK/HiiX79uW7GItVVrm/DcBTz0tY1A?=
 =?us-ascii?Q?fVe0d5pFNJJCGlbautESXHOz4LmXptoNx+4po8aKQ2Psspn6FDX9NO4frmfj?=
 =?us-ascii?Q?m5r3+dYegP3I3YoLVBCto18r/W4SrPxStXNIgyQ79cmBRfIqUqvoWVEqnglw?=
 =?us-ascii?Q?aLBWNa5FvveMIknJxsy2l+Cdl8mOWQtyO3FUUD5Qt/Di5kbwupa60e0Iznwt?=
 =?us-ascii?Q?xsDdPfL/nOk7X4Od5MH7OpOO9NDLLel9naW4mDgiAMVEr0aKaXM8bo5+xl97?=
 =?us-ascii?Q?PrZFt2AsT57l2W2bK63dV/BAWLKTB+juo63BiApTMEEHCpQSuLB7v937H3kD?=
 =?us-ascii?Q?ksEovGbBOxpuRqoiIOzWo72E0Bw+E4TOYLIyAQjahryWUfkNJWa8aRKG+GV2?=
 =?us-ascii?Q?xri4dBa7mqNVcjOFBDGKpiKMX5tCFbbNGA0gXVp+2IQ/SDph5JNNKAVQ0pTN?=
 =?us-ascii?Q?ISGz3hCtdY8Upl/1csM/sFAXZC/0efnTJMz6HbcEiBZ70ZVgt+Vc3SckuPDt?=
 =?us-ascii?Q?Ybb1QC1T4sr85EwRaOOfa4o154IcesRKhKd9gtcork7+jNaLg+0NaazEcXKb?=
 =?us-ascii?Q?CXitAixPuXmlVvY+TvSdKJ1YSbz/UYDMwbNc5U9MkSfdk3nk7KtD7gf0VF/+?=
 =?us-ascii?Q?h7f+/iCNxVfGq+Ki3Fb4rBAamk7BFwQVFwgez//P0ABsf9MiOQ4CbuSt5UAH?=
 =?us-ascii?Q?y6R79HkwsZ8Vg9rkzPIOQlTfRSxPkFpUfVJDtPeBjnX25cG2McgD4J7Da039?=
 =?us-ascii?Q?+YCq6d22R3MTt97rBZSktPGwMJzH5sw1eyBHADdk04TaYRV8aWfFa8BDkSro?=
 =?us-ascii?Q?LCz7hJRyeW40fdGtofbAM7WS6NxdOQnqYHT3cOrbaamPstns58YlBfuR0pLS?=
 =?us-ascii?Q?M92D2F9zqdGMBV+BSeQeTMCoSAz0I5FM+gBQsEsdBB7SxynjCgXwVMOdlI2A?=
 =?us-ascii?Q?DSLTzxEM6BHJ2L6mS52bElUebfyjtJ/7xjeOJFkp8TTOBUSGK6DHk1ryeNOT?=
 =?us-ascii?Q?+ssvtMOj6iUL466n/sdFRHM6JKQjL336WWENC/CMNWVfzN73lv0kiaI2FuV4?=
 =?us-ascii?Q?Utcgu4RYoowqjOOoA/nA006bdBNaCSEZ6NPNTGq0rVZg4Hio7wt7C9M4p0Ek?=
 =?us-ascii?Q?OjGOEgRigv1LpkgGzl9oX3HXuPV1D8J9T4I4k+nXsySnR9ScdMme3Tn8fVia?=
 =?us-ascii?Q?4TbdL7tAqjCL94IPB2tYpd0wAnr0LI7J6seEA4i8qEOpJlhdIVkQmuRohZAF?=
 =?us-ascii?Q?g9HZMPaYqhw2v818Yjj9Y/9BIP2IEaE/N3Oaq5YOGMv3C6oHt6PIab0i5Ur4?=
 =?us-ascii?Q?BQ8qwFooZPWY9Z9EAmQ=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(14060799003)(35042699022)(376014)(82310400026)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 14:25:47.5888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc754d91-0443-4a45-b7e4-08de1e098b7c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8801
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

This patch adds common helpers to issue power commands, poll
transitions, and validate domain state, then wires them into the L2
on/off paths.

The L2 power-on sequence now delegates control of the SHADER and TILER
domains to the MCU when allowed, while the L2 itself is never delegated.
On power-off, dependent domains beneath the L2 are checked, and if
necessary, retracted and powered down to maintain proper domain
ordering.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v4:
 * removed extra brackets.
 * Picked up R-b from Steve.
v2:
 * Updated GENMASK to GENMASK_U64 to address kernel test robot warnings
   for 32-bit systems.
 * Removed panthor_pwr_read_status() in favour of a simple gpu_read64()
   operation on the PWR_STATUS register.
 * Renamed panthor_pwr_info_show() to panthor_pwr_debug_info_show() for
   more clarity.
 * Added additional WARN_ON for an invalid domain when requesting power
   domain transition.
 * Made panthor_pwr_domain_transition()'s expected val logic more
   readable and clearer.
 * Wait on domain power transition instead of failing the operation.
 * Fixed inconsistent error return value vs kerneldoc.
 * Removed confusing drm_dbg in delegate_domain() in favor of a comment.
 * Add unwind to panthor_pwr_delegate_domains().
 * Moved child domain handling logic from panthor_pwr_l2_power_off()
   into panthor_pwr_domain_force_off().
 * Added additional clarification regarding delegation and retraction of
   power domains.
 * Minor formatting and readability changes and remove unnecessary
   checks.
---
 drivers/gpu/drm/panthor/panthor_pwr.c  | 378 +++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_pwr.h  |   4 +
 drivers/gpu/drm/panthor/panthor_regs.h |   1 +
 3 files changed, 383 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
index 66dc72b29116..6dff5daf77d2 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.c
+++ b/drivers/gpu/drm/panthor/panthor_pwr.c
@@ -24,6 +24,14 @@
 	 PWR_IRQ_COMMAND_NOT_ALLOWED | \
 	 PWR_IRQ_COMMAND_INVALID)

+#define PWR_ALL_CORES_MASK		GENMASK_U64(63, 0)
+
+#define PWR_DOMAIN_MAX_BITS		16
+
+#define PWR_TRANSITION_TIMEOUT_US	(2ULL * USEC_PER_SEC)
+
+#define PWR_RETRACT_TIMEOUT_US		(2ULL * USEC_PER_MSEC)
+
 /**
  * struct panthor_pwr - PWR_CONTROL block management data.
  */
@@ -60,6 +68,323 @@ static void panthor_pwr_irq_handler(struct panthor_device *ptdev, u32 status)
 }
 PANTHOR_IRQ_HANDLER(pwr, PWR, panthor_pwr_irq_handler);

+static void panthor_pwr_write_command(struct panthor_device *ptdev, u32 command, u64 args)
+{
+	if (args)
+		gpu_write64(ptdev, PWR_CMDARG, args);
+
+	gpu_write(ptdev, PWR_COMMAND, command);
+}
+
+static const char *get_domain_name(u8 domain)
+{
+	switch (domain) {
+	case PWR_COMMAND_DOMAIN_L2:
+		return "L2";
+	case PWR_COMMAND_DOMAIN_TILER:
+		return "Tiler";
+	case PWR_COMMAND_DOMAIN_SHADER:
+		return "Shader";
+	case PWR_COMMAND_DOMAIN_BASE:
+		return "Base";
+	case PWR_COMMAND_DOMAIN_STACK:
+		return "Stack";
+	}
+	return "Unknown";
+}
+
+static u32 get_domain_base(u8 domain)
+{
+	switch (domain) {
+	case PWR_COMMAND_DOMAIN_L2:
+		return PWR_L2_PRESENT;
+	case PWR_COMMAND_DOMAIN_TILER:
+		return PWR_TILER_PRESENT;
+	case PWR_COMMAND_DOMAIN_SHADER:
+		return PWR_SHADER_PRESENT;
+	case PWR_COMMAND_DOMAIN_BASE:
+		return PWR_BASE_PRESENT;
+	case PWR_COMMAND_DOMAIN_STACK:
+		return PWR_STACK_PRESENT;
+	}
+	return 0;
+}
+
+static u32 get_domain_ready_reg(u32 domain)
+{
+	return get_domain_base(domain) + (PWR_L2_READY - PWR_L2_PRESENT);
+}
+
+static u32 get_domain_pwrtrans_reg(u32 domain)
+{
+	return get_domain_base(domain) + (PWR_L2_PWRTRANS - PWR_L2_PRESENT);
+}
+
+static bool is_valid_domain(u32 domain)
+{
+	return get_domain_base(domain) != 0;
+}
+
+static bool has_rtu(struct panthor_device *ptdev)
+{
+	return ptdev->gpu_info.gpu_features & GPU_FEATURES_RAY_TRAVERSAL;
+}
+
+static u8 get_domain_subdomain(struct panthor_device *ptdev, u32 domain)
+{
+	if (domain == PWR_COMMAND_DOMAIN_SHADER && has_rtu(ptdev))
+		return PWR_COMMAND_SUBDOMAIN_RTU;
+
+	return 0;
+}
+
+static int panthor_pwr_domain_wait_transition(struct panthor_device *ptdev, u32 domain,
+					      u32 timeout_us)
+{
+	u32 pwrtrans_reg = get_domain_pwrtrans_reg(domain);
+	u64 val;
+	int ret = 0;
+
+	ret = gpu_read64_poll_timeout(ptdev, pwrtrans_reg, val, !(PWR_ALL_CORES_MASK & val), 100,
+				      timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base, "%s domain power in transition, pwrtrans(0x%llx)",
+			get_domain_name(domain), val);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void panthor_pwr_debug_info_show(struct panthor_device *ptdev)
+{
+	drm_info(&ptdev->base, "GPU_FEATURES:    0x%016llx", gpu_read64(ptdev, GPU_FEATURES));
+	drm_info(&ptdev->base, "PWR_STATUS:      0x%016llx", gpu_read64(ptdev, PWR_STATUS));
+	drm_info(&ptdev->base, "L2_PRESENT:      0x%016llx", gpu_read64(ptdev, PWR_L2_PRESENT));
+	drm_info(&ptdev->base, "L2_PWRTRANS:     0x%016llx", gpu_read64(ptdev, PWR_L2_PWRTRANS));
+	drm_info(&ptdev->base, "L2_READY:        0x%016llx", gpu_read64(ptdev, PWR_L2_READY));
+	drm_info(&ptdev->base, "TILER_PRESENT:   0x%016llx", gpu_read64(ptdev, PWR_TILER_PRESENT));
+	drm_info(&ptdev->base, "TILER_PWRTRANS:  0x%016llx", gpu_read64(ptdev, PWR_TILER_PWRTRANS));
+	drm_info(&ptdev->base, "TILER_READY:     0x%016llx", gpu_read64(ptdev, PWR_TILER_READY));
+	drm_info(&ptdev->base, "SHADER_PRESENT:  0x%016llx", gpu_read64(ptdev, PWR_SHADER_PRESENT));
+	drm_info(&ptdev->base, "SHADER_PWRTRANS: 0x%016llx", gpu_read64(ptdev, PWR_SHADER_PWRTRANS));
+	drm_info(&ptdev->base, "SHADER_READY:    0x%016llx", gpu_read64(ptdev, PWR_SHADER_READY));
+}
+
+static int panthor_pwr_domain_transition(struct panthor_device *ptdev, u32 cmd, u32 domain,
+					 u64 mask, u32 timeout_us)
+{
+	u32 ready_reg = get_domain_ready_reg(domain);
+	u32 pwr_cmd = PWR_COMMAND_DEF(cmd, domain, get_domain_subdomain(ptdev, domain));
+	u64 expected_val = 0;
+	u64 val;
+	int ret = 0;
+
+	if (drm_WARN_ON(&ptdev->base, !is_valid_domain(domain)))
+		return -EINVAL;
+
+	switch (cmd) {
+	case PWR_COMMAND_POWER_DOWN:
+		expected_val = 0;
+		break;
+	case PWR_COMMAND_POWER_UP:
+		expected_val = mask;
+		break;
+	default:
+		drm_err(&ptdev->base, "Invalid power domain transition command (0x%x)", cmd);
+		return -EINVAL;
+	}
+
+	ret = panthor_pwr_domain_wait_transition(ptdev, domain, timeout_us);
+	if (ret)
+		return ret;
+
+	/* domain already in target state, return early */
+	if ((gpu_read64(ptdev, ready_reg) & mask) == expected_val)
+		return 0;
+
+	panthor_pwr_write_command(ptdev, pwr_cmd, mask);
+
+	ret = gpu_read64_poll_timeout(ptdev, ready_reg, val, (mask & val) == expected_val, 100,
+				      timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"timeout waiting on %s power domain transition, cmd(0x%x), arg(0x%llx)",
+			get_domain_name(domain), pwr_cmd, mask);
+		panthor_pwr_debug_info_show(ptdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+#define panthor_pwr_domain_power_off(__ptdev, __domain, __mask, __timeout_us)            \
+	panthor_pwr_domain_transition(__ptdev, PWR_COMMAND_POWER_DOWN, __domain, __mask, \
+				      __timeout_us)
+
+#define panthor_pwr_domain_power_on(__ptdev, __domain, __mask, __timeout_us) \
+	panthor_pwr_domain_transition(__ptdev, PWR_COMMAND_POWER_UP, __domain, __mask, __timeout_us)
+
+/**
+ * retract_domain() - Retract control of a domain from MCU
+ * @ptdev: Device.
+ * @domain: Domain to retract the control
+ *
+ * Retracting L2 domain is not expected since it won't be delegated.
+ *
+ * Return: 0 on success or retracted already.
+ *         -EPERM if domain is L2.
+ *         A negative error code otherwise.
+ */
+static int retract_domain(struct panthor_device *ptdev, u32 domain)
+{
+	const u32 pwr_cmd = PWR_COMMAND_DEF(PWR_COMMAND_RETRACT, domain, 0);
+	const u64 pwr_status = gpu_read64(ptdev, PWR_STATUS);
+	const u64 delegated_mask = PWR_STATUS_DOMAIN_DELEGATED(domain);
+	const u64 allow_mask = PWR_STATUS_DOMAIN_ALLOWED(domain);
+	u64 val;
+	int ret;
+
+	if (drm_WARN_ON(&ptdev->base, domain == PWR_COMMAND_DOMAIN_L2))
+		return -EPERM;
+
+	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val, !(PWR_STATUS_RETRACT_PENDING & val),
+				      0, PWR_RETRACT_TIMEOUT_US);
+	if (ret) {
+		drm_err(&ptdev->base, "%s domain retract pending", get_domain_name(domain));
+		return ret;
+	}
+
+	if (!(pwr_status & delegated_mask)) {
+		drm_dbg(&ptdev->base, "%s domain already retracted", get_domain_name(domain));
+		return 0;
+	}
+
+	panthor_pwr_write_command(ptdev, pwr_cmd, 0);
+
+	/*
+	 * On successful retraction
+	 * allow-flag will be set with delegated-flag being cleared.
+	 */
+	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
+				      ((delegated_mask | allow_mask) & val) == allow_mask, 10,
+				      PWR_TRANSITION_TIMEOUT_US);
+	if (ret) {
+		drm_err(&ptdev->base, "Retracting %s domain timeout, cmd(0x%x)",
+			get_domain_name(domain), pwr_cmd);
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * delegate_domain() - Delegate control of a domain to MCU
+ * @ptdev: Device.
+ * @domain: Domain to delegate the control
+ *
+ * Delegating L2 domain is prohibited.
+ *
+ * Return:
+ * *       0 on success or delegated already.
+ * *       -EPERM if domain is L2.
+ * *       A negative error code otherwise.
+ */
+static int delegate_domain(struct panthor_device *ptdev, u32 domain)
+{
+	const u32 pwr_cmd = PWR_COMMAND_DEF(PWR_COMMAND_DELEGATE, domain, 0);
+	const u64 pwr_status = gpu_read64(ptdev, PWR_STATUS);
+	const u64 allow_mask = PWR_STATUS_DOMAIN_ALLOWED(domain);
+	const u64 delegated_mask = PWR_STATUS_DOMAIN_DELEGATED(domain);
+	u64 val;
+	int ret;
+
+	if (drm_WARN_ON(&ptdev->base, domain == PWR_COMMAND_DOMAIN_L2))
+		return -EPERM;
+
+	/* Already delegated, exit early */
+	if (pwr_status & delegated_mask)
+		return 0;
+
+	/* Check if the command is allowed before delegating. */
+	if (!(pwr_status & allow_mask)) {
+		drm_warn(&ptdev->base, "Delegating %s domain not allowed", get_domain_name(domain));
+		return -EPERM;
+	}
+
+	ret = panthor_pwr_domain_wait_transition(ptdev, domain, PWR_TRANSITION_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	panthor_pwr_write_command(ptdev, pwr_cmd, 0);
+
+	/*
+	 * On successful delegation
+	 * allow-flag will be cleared with delegated-flag being set.
+	 */
+	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
+				      ((delegated_mask | allow_mask) & val) == delegated_mask,
+				      10, PWR_TRANSITION_TIMEOUT_US);
+	if (ret) {
+		drm_err(&ptdev->base, "Delegating %s domain timeout, cmd(0x%x)",
+			get_domain_name(domain), pwr_cmd);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int panthor_pwr_delegate_domains(struct panthor_device *ptdev)
+{
+	int ret;
+
+	if (!ptdev->pwr)
+		return 0;
+
+	ret = delegate_domain(ptdev, PWR_COMMAND_DOMAIN_SHADER);
+	if (ret)
+		return ret;
+
+	ret = delegate_domain(ptdev, PWR_COMMAND_DOMAIN_TILER);
+	if (ret)
+		goto err_retract_shader;
+
+	return 0;
+
+err_retract_shader:
+	retract_domain(ptdev, PWR_COMMAND_DOMAIN_SHADER);
+
+	return ret;
+}
+
+/**
+ * panthor_pwr_domain_force_off - Forcefully power down a domain.
+ * @ptdev: Device.
+ * @domain: Domain to forcefully power down.
+ *
+ * This function will attempt to retract and power off the requested power
+ * domain. However, if retraction fails, the operation is aborted. If power off
+ * fails, the domain will remain retracted and under the host control.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+static int panthor_pwr_domain_force_off(struct panthor_device *ptdev, u32 domain)
+{
+	const u64 domain_ready = gpu_read64(ptdev, get_domain_ready_reg(domain));
+	int ret;
+
+	/* Domain already powered down, early exit. */
+	if (!domain_ready)
+		return 0;
+
+	/* Domain has to be in host control to issue power off command. */
+	ret = retract_domain(ptdev, domain);
+	if (ret)
+		return ret;
+
+	return panthor_pwr_domain_power_off(ptdev, domain, domain_ready, PWR_TRANSITION_TIMEOUT_US);
+}
+
 void panthor_pwr_unplug(struct panthor_device *ptdev)
 {
 	unsigned long flags;
@@ -104,6 +429,59 @@ int panthor_pwr_init(struct panthor_device *ptdev)
 	return 0;
 }

+void panthor_pwr_l2_power_off(struct panthor_device *ptdev)
+{
+	const u64 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
+	const u64 pwr_status = gpu_read64(ptdev, PWR_STATUS);
+
+	/* Abort if L2 power off constraints are not satisfied */
+	if (!(pwr_status & l2_allow_mask)) {
+		drm_warn(&ptdev->base, "Power off L2 domain not allowed");
+		return;
+	}
+
+	/* It is expected that when halting the MCU, it would power down its
+	 * delegated domains. However, an unresponsive or hung MCU may not do
+	 * so, which is why we need to check and retract the domains back into
+	 * host control to be powered down in the right order before powering
+	 * down the L2.
+	 */
+	if (panthor_pwr_domain_force_off(ptdev, PWR_COMMAND_DOMAIN_TILER))
+		return;
+
+	if (panthor_pwr_domain_force_off(ptdev, PWR_COMMAND_DOMAIN_SHADER))
+		return;
+
+	panthor_pwr_domain_power_off(ptdev, PWR_COMMAND_DOMAIN_L2, ptdev->gpu_info.l2_present,
+				     PWR_TRANSITION_TIMEOUT_US);
+}
+
+int panthor_pwr_l2_power_on(struct panthor_device *ptdev)
+{
+	const u32 pwr_status = gpu_read64(ptdev, PWR_STATUS);
+	const u32 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
+	int ret;
+
+	if ((pwr_status & l2_allow_mask) == 0) {
+		drm_warn(&ptdev->base, "Power on L2 domain not allowed");
+		return -EPERM;
+	}
+
+	ret = panthor_pwr_domain_power_on(ptdev, PWR_COMMAND_DOMAIN_L2, ptdev->gpu_info.l2_present,
+					  PWR_TRANSITION_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	/* Delegate control of the shader and tiler power domains to the MCU as
+	 * it can better manage which shader/tiler cores need to be powered up
+	 * or can be powered down based on currently running jobs.
+	 *
+	 * If the shader and tiler domains are already delegated to the MCU,
+	 * this call would just return early.
+	 */
+	return panthor_pwr_delegate_domains(ptdev);
+}
+
 void panthor_pwr_suspend(struct panthor_device *ptdev)
 {
 	if (!ptdev->pwr)
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.h b/drivers/gpu/drm/panthor/panthor_pwr.h
index b325e5b7eba3..3c834059a860 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.h
+++ b/drivers/gpu/drm/panthor/panthor_pwr.h
@@ -10,6 +10,10 @@ void panthor_pwr_unplug(struct panthor_device *ptdev);

 int panthor_pwr_init(struct panthor_device *ptdev);

+void panthor_pwr_l2_power_off(struct panthor_device *ptdev);
+
+int panthor_pwr_l2_power_on(struct panthor_device *ptdev);
+
 void panthor_pwr_suspend(struct panthor_device *ptdev);

 void panthor_pwr_resume(struct panthor_device *ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 5469eec02178..18702d7001e2 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -72,6 +72,7 @@

 #define GPU_FEATURES					0x60
 #define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
+#define   GPU_FEATURES_RAY_TRAVERSAL			BIT(5)

 #define GPU_TIMESTAMP_OFFSET				0x88
 #define GPU_CYCLE_COUNT					0x90
--
2.49.0

