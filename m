Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C895D962E6F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 19:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D3010E384;
	Wed, 28 Aug 2024 17:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="nGHL5dke";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nGHL5dke";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2063.outbound.protection.outlook.com [40.107.247.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D933C10E384
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 17:27:02 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bDWqKmUUklfZkI3vwr/gcvfo1MSPIuzqCx5mwVpNmAqj3pW1vI3etdZiNlLVZYkFqhk2lT3N499OWVrepJ9S5c3FLkRF0pli6mWYH385v/LHaQ7pXgx6/qaNjLuqfRz7mFddhormsALOHER0iqplFJ3D4GYYJnEHaNCYBp1Jn2gk33FkjqvuFm+8FdUZBvNvy5URsguoeOj6ub3UoWat317pxwgIXgmQrgcuzjnDPLUfCCVkbsO0tSInSSRK2WDurSb2+T8Fijpf+0AlFAK0yrK7VCHyx4s4ipaQ3xli9f103Y9yAku6bhQ9OzNajfOqpeY27w1z/zw5s70Z3gsuYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsyr/X8MHIRhYF+PyOaSjkZn52wXKUqGIKzc+LyjLpw=;
 b=dK5XHKK7HMBHDgKJ4PzENsiXFUf8dvOMJuWziww/GAArMCYET04aZAv2bQ+WV2cBJL3znGaz7qE+y8OU97qJHYflWAZMPSsDlupZO+ChBrxy0BvuCcRU1VB4rXTUuLMIuwrxy9hkwXsqwSllTANMT9Uw1flzlxOrXmH1CzT4+Oukak5lJmdo+LnUggN1ApDnlDmQVTRQKp4ALtrv7mUNhtFO0aeJWZj0m4fdGvUmnEy0xsQEeBEEGAYXZhGgN293VXToB5Y9/X3hVaWtzPhsgEfXhtpPFxtmDG92INDRa781ORx2t5PNptuG5CyHgd13Y4hZFDKtwlU8wqkrJX/fYQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsyr/X8MHIRhYF+PyOaSjkZn52wXKUqGIKzc+LyjLpw=;
 b=nGHL5dkeJfyQlJbcCC/2iAzM6OCBeRkwc6ojam3wRoGqX9I4oZRadf0TKRWBpIKANnMWeowQ2c6CsKQaoPVlLEUtYErqr3Q6C44848yPy2RKmnw06cOnLtytUvNDbvifYjr3jHjINTAF+VYvugv175pOzbs+8NTTfgyh6JrS1C8=
Received: from DUZPR01CA0179.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::10) by GV1PR08MB8380.eurprd08.prod.outlook.com
 (2603:10a6:150:80::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Wed, 28 Aug
 2024 17:26:51 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::91) by DUZPR01CA0179.outlook.office365.com
 (2603:10a6:10:4b3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27 via Frontend
 Transport; Wed, 28 Aug 2024 17:26:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13 via
 Frontend Transport; Wed, 28 Aug 2024 17:26:50 +0000
Received: ("Tessian outbound de2677e4ad72:v403");
 Wed, 28 Aug 2024 17:26:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d05880de0e48030d
X-CR-MTA-TID: 64aa7808
Received: from Lf8210dc8d799.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CBF86C59-D217-4141-B45D-DF5592FBC08C.1; 
 Wed, 28 Aug 2024 17:26:39 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf8210dc8d799.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Aug 2024 17:26:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FA/8Nke9zGa91+MxQKVrdWGX0i9kqbZ5V0FGCdxLQXarAAHhNsDFKkux4E3sLcBwG0iEF8Mg9u7GeIrwIdfXPWAvEM/9rOfWmEO6PWluRG2eM0iGEy97rol3X28Bn5oSCk2BxPMxiLxbkBB5NILeuB8yGeZdMbe2S6tCjWbJdaWREMBYbJehFpqmWOLcpfBchoMi9FJ9IpLE2gZHRDsZaaAAWEmw/b0b6M2f6sAKZjK42vewk0N+lnnR5FXdasU/+VqP+RpnjyG1Oj8ucAHB3W92UnmsAdr1PRxzNp28eqjVIc7xM1+ZsbZ8mSNJ1UR9q7GonchMKV/irAheKG+N5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsyr/X8MHIRhYF+PyOaSjkZn52wXKUqGIKzc+LyjLpw=;
 b=GuJ6NSqaEzTJ3M6BnoL4ThD5vv8hWEdB4D7QSOH0UqntZBM7olq3BsaCElXIrHKQSWLA3J2Imy4+Pc5x6L+SBpBFOcHbDo4to7R2S4iguDMAusMx7nKWveMt2lDJb810iyxhYN6v98/3MXa13F0T9sSxSiQqbQW+BVIe7XKPQa7N/NmhQ/55bNRWFbm3Mdnh+kJ86f4qCno1lQcPsX1FStziY54O18mAvvLtXKVAr+aHRzkaBpfnLhNR6ZO4oE19/GJrT7taPekrKWDWpK0ED4zSgvdPVicm7FJOQ0hi+jgjygMiCk2f6lDhh8FKOtEumC0hqSgqME2RLYSB35Pj6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsyr/X8MHIRhYF+PyOaSjkZn52wXKUqGIKzc+LyjLpw=;
 b=nGHL5dkeJfyQlJbcCC/2iAzM6OCBeRkwc6ojam3wRoGqX9I4oZRadf0TKRWBpIKANnMWeowQ2c6CsKQaoPVlLEUtYErqr3Q6C44848yPy2RKmnw06cOnLtytUvNDbvifYjr3jHjINTAF+VYvugv175pOzbs+8NTTfgyh6JrS1C8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Wed, 28 Aug
 2024 17:26:36 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%7]) with mapi id 15.20.7918.012; Wed, 28 Aug 2024
 17:26:36 +0000
From: Mihail Atanassov <mihail.atanassov@arm.com>
To: linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Shashank Sharma <shashank.sharma@amd.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Akash Goel <akash.goel@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Subject: [PATCH 4/8] drm/panthor: Add GROUP_KICK ioctl
Date: Wed, 28 Aug 2024 18:26:00 +0100
Message-ID: <20240828172605.19176-5-mihail.atanassov@arm.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240828172605.19176-1-mihail.atanassov@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::16) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|AS8PR08MB6551:EE_|DU6PEPF0000A7DF:EE_|GV1PR08MB8380:EE_
X-MS-Office365-Filtering-Correlation-Id: 07f20e29-5480-41d7-360e-08dcc7869a46
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?xGgHVKwEom//WAyiRqVILzEXylRXdBCZMJ3LN/Cou0l8gsvjp6rUv7+KVno3?=
 =?us-ascii?Q?h22njv/PkQszLL6q791HorrLjLjglLF7/crBbhwsV14BSNh2lZdgablFA3Pw?=
 =?us-ascii?Q?U5qy+oVh/DCDtjIygu6o/bKr87OSNzRAZy01t8OK0keVkjQC90t1rxgA/Arg?=
 =?us-ascii?Q?960BoxeDM0Romcw560CMbc84cf6+K/o2faMX00UM471+7oTeAglJxew33oaL?=
 =?us-ascii?Q?mE+c+8F6pRxD86vK7WdwOGlL4AN477TI+iBhurAIMQ5JhGSgLZH7trqND+02?=
 =?us-ascii?Q?jUUzs2EPdR76Wg1y6yM0Lk8+NCrOiplHoH0T4OZTGQkCY0jFopFxFd7LO9ho?=
 =?us-ascii?Q?Gh6W60sRIJHMxTe7eH43rW/hDrIIXGDCpIpawUJS10oAo6Lf/Z/kaKoIvxxu?=
 =?us-ascii?Q?LZ+WwqD0GWSkBh1vDd+rDxsNHt4eT6ABEXSfRF/gniogodjHsc/6BIOgiXry?=
 =?us-ascii?Q?un+oVgVeGofVLWz2JzeIeihnk8mijAEyqRTCC8TYNzRQ3WEFvQBCIFpalvkI?=
 =?us-ascii?Q?fQczK0CZZtg1Q/YpJFggiH4LLsPVA503GyhCKSGBo/rUI4bg8YqIW2uz7/mW?=
 =?us-ascii?Q?qiebPCfPNEnS4CvTxlB6f47AlkJKJCBempLkg6uk264Y34YYqdZO0cL229sq?=
 =?us-ascii?Q?qV2kx7Dz0/61XTdb4nYgolhxtfWkQ03HnA73U6gZeg9zxObwb4Hda/1DZCuy?=
 =?us-ascii?Q?+v8tAR4VSHgpKBM8inEbcyP/rlP/SrZHJ/kYTKEpgCnjbaSdnxph15faju3J?=
 =?us-ascii?Q?PAS3xF5WP6PpziJHxeZUr4hQ18O3iPh26Qt6H9mITlU5ESOamVAamf+kDlB4?=
 =?us-ascii?Q?UO2xHVmbbOB/Bsm3h+/O3BI/K1l5mdTTdrVVni/HlR4rRO/7onGhwgkEJLzh?=
 =?us-ascii?Q?6oAf69Yhx9i655FJAFSUnv/oYY2+gOWP+aQ0mkQ5QE0V01uGtZruq5RNuFZU?=
 =?us-ascii?Q?jbqv0fwltpWdgxiu6IDF7e6eKxxNQtqLMQmYohnSFvazZ/kfDpAjCYEta2qP?=
 =?us-ascii?Q?RpiE1cghStjKKJgVJxkWaOL+iKATJ6kwr9cdIiELxgBB7ngWMr83IiyubQ3z?=
 =?us-ascii?Q?j3ARxolq0Rv44Xd0v14+q15m/48F/m0lK7/+O9xYqNEF+j2FkmDwfgm75otm?=
 =?us-ascii?Q?X6dUKJLGsYpHPvCqMdUJnpfpZEcgWWgUQnKO4Cj3sf++5C/d2yWmKyxLg+EE?=
 =?us-ascii?Q?z1LV2TrqSg5HoRynoWgBqHWI4EgyFG01x/TkZQSzA1hpkyZ6MyegGHrMowRG?=
 =?us-ascii?Q?aiNnWxX+2uq2tXOO6O0elP1VLmlZPZvaYgr0ucu2JlIl5U0t+plOt9X625Bg?=
 =?us-ascii?Q?WfV/sKwp0VDJ+sPNdmdwcNnTf3H/G60kCvi51Dx3goR97Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6551
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a9bb92a3-99fe-420f-05ac-08dcc7869172
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0FeuKenVtKotK4XIHwkmd3MEnmycSVjzicW+UlN3gMR4NiO0VgKtABIk3iTY?=
 =?us-ascii?Q?F7FNbbe45P3og5yBmv0OOWstVsv3WXr3e+ZKRL+2EO0KLyjNkKxpxmpZ15ov?=
 =?us-ascii?Q?NqdVL8H2ErAlJrbZVRGCn3qfc0/9Us3x3cyooMA5XOJOZ+bn1l/lOX9mxJCR?=
 =?us-ascii?Q?EaNuq/NH+XH8zSsZx4Fs937GaVeVknE+o+UJEnGr+iBroEnNYqvkBZ3ZBllp?=
 =?us-ascii?Q?P5S8CLJwRmXH2BaZiqH17SWyrQVSURoJTTsAcGWNDE2oVij8ixr4jxkHYE69?=
 =?us-ascii?Q?NRd0tBVBusU8OnQn0K50gXstcK1Z5fSTX7KHCHTUDcFjFhDreJImTo0hezcU?=
 =?us-ascii?Q?Nk4vlRwygKoebE51ltHrVvVUGSlcRJTA+KKgZqLU7E3HVXPDvRI1Pv6hhfnc?=
 =?us-ascii?Q?pS7vJdKqnZqnTxjhiUn+HTdZq/dMMuPPumaKcrCHqzSv4zLRaOH084pqks/d?=
 =?us-ascii?Q?FagIwOekQ7nvGgUDzi9Y1kEvE0kVTKLwZK1Usaj7d84m9cGpSYdUa9RCrnpW?=
 =?us-ascii?Q?GAkas4D1Qe3UhTiIsbnStWNkbK4C4ZaDiPk6ewG/9QgT77ArsSc8RHssKZ+b?=
 =?us-ascii?Q?yXnLt18BD9pvzP5QQUgra5fClnnPb42V2v7e3iCQebTfWbRn5nr8iAOD7oCU?=
 =?us-ascii?Q?kaRl/7uZ0Bjf0LS2hmTDo0U19AyS0YLD+ekxHNY0cd31GRw0Dfd0K3kiESOv?=
 =?us-ascii?Q?i+dT4hbmNiwzVD4MIrNo3Yr9Q7HpraAtHcqTv9PjlHDN0PVEEUxIrffD1aRD?=
 =?us-ascii?Q?HOLLtYTifa5XAOR72vf07vOmLw4vTpSpFZvDiWZFQLi8OMlQ+YEJuZruSRzZ?=
 =?us-ascii?Q?xN8ezUwZkdZuWzSVXDp/rlyg4DeHbO11pW00PX15qnyXNm4Btt++EXSC/pkM?=
 =?us-ascii?Q?uF3cadRSq3tu/wREqxTATBH8PGtTLaLkKELQFKXHni/SRCCMQ+4f8MCvu8EP?=
 =?us-ascii?Q?KXTJlQLy19Y7CDert5y/YnecNxQe9mRQZF5SZh4GMdyEPcABhqQypfmTOq6y?=
 =?us-ascii?Q?wSil6NupJxhgtMU+daeGYJ9+b8/LwRK/IAC+GOQqWRDWhhQgznI2htax56OF?=
 =?us-ascii?Q?JCc+BYAPkPe3xVVJiXHqdUu897wRK/IaGOEfrZ3RmUVEiCdatWx7uO3S+Qki?=
 =?us-ascii?Q?F/p0nLBRcbQvcawdCMAY3pm6GNLVEbG2Q1jXry/pyM8cTwABsDSd8OCEOI86?=
 =?us-ascii?Q?YVmX9DzJ0XX7B7Fec2o2lB56a4UvckLxAhz2J2CMMkC1LNMONzG9FmT7mYXA?=
 =?us-ascii?Q?Bzvqfoez1ovZTji59/TgMq13ryRxVaGYucDe5kM2OFeVm9Syi83RC2DAjRB+?=
 =?us-ascii?Q?L1CAZdRKae1dbTXBSUpp5TSwx+0A9dC7o17I11oWxXogh8J2zZg5TmexZUkM?=
 =?us-ascii?Q?Wfc9y5KOOd+4FRKJqKdBWMRSQJnqN7UmvfmPwgI6doqw6GJnfopI4Y31jJyy?=
 =?us-ascii?Q?B/uXFh6sM91HJBomEtmYkgv5eQ6dtYQO?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(35042699022)(36860700013)(1800799024)(376014)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 17:26:50.7136 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f20e29-5480-41d7-360e-08dcc7869a46
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8380
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

From: Ketil Johnsen <ketil.johnsen@arm.com>

In the kernel submission flow, GROUP_SUBMIT will ensure that the group
gets assigned to a CSG. Conversely for the user submission flow, work
gets added to the ring buffer without kernel supervision, so there needs
to be a mechanism to trigger rescheduling. Use a new GROUP_KICK ioctl,
to keep it distinct from the existing submit flow.

Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c   | 12 +++++++++++
 drivers/gpu/drm/panthor/panthor_sched.c | 27 +++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_sched.h |  1 +
 3 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index e391ab6aaab2..ce2fdcd3fb42 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1305,6 +1305,17 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
 	return 0;
 }
 
+static int panthor_ioctl_group_kick(struct drm_device *ddev, void *data,
+				    struct drm_file *file)
+{
+	struct drm_panthor_group_kick *args = data;
+	struct panthor_file *pfile = file->driver_priv;
+
+	panthor_sched_kick(pfile, args->handle, args->queue_mask);
+
+	return 0;
+}
+
 static int
 panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
@@ -1375,6 +1386,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
 	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(GROUP_KICK, group_kick, DRM_RENDER_ALLOW),
 };
 
 static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 471bb8f2b44c..3b56526a4b97 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2845,6 +2845,33 @@ void panthor_sched_post_reset(struct panthor_device *ptdev, bool reset_failed)
 	}
 }
 
+void panthor_sched_kick(struct panthor_file *pfile, u32 group_handle, u32 queue_mask)
+{
+	struct panthor_group_pool *gpool = pfile->groups;
+	struct panthor_scheduler *sched = pfile->ptdev->scheduler;
+	struct panthor_group *group;
+
+	group = group_get(xa_load(&gpool->xa, group_handle));
+	if (!group)
+		return;
+
+	if (!group->queue_count)
+		goto err_put_group;
+
+	mutex_lock(&sched->lock);
+
+	if (group->csg_id < 0)
+		group_schedule_locked(group, queue_mask);
+	else
+		/* All queues share same doorbell page (for now), so we just need to ding one */
+		gpu_write(pfile->ptdev, CSF_DOORBELL(group->queues[0]->doorbell_id), 1);
+
+	mutex_unlock(&sched->lock);
+
+err_put_group:
+	group_put(group);
+}
+
 static void group_sync_upd_work(struct work_struct *work)
 {
 	struct panthor_group *group =
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index 0b3a2ee2a0ad..18fb7ad0952e 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -48,5 +48,6 @@ void panthor_sched_report_mmu_fault(struct panthor_device *ptdev);
 void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events);
 
 u8 panthor_sched_doorbell_id(struct panthor_file *pfile, u32 group_handle);
+void panthor_sched_kick(struct panthor_file *pfile, u32 group_handle, u32 queue_mask);
 
 #endif
-- 
2.45.0

