Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595A1ACB29C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F8A10E53C;
	Mon,  2 Jun 2025 14:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="OnzR0Af3";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OnzR0Af3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011013.outbound.protection.outlook.com
 [40.107.130.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8975A10E53C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:33:46 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TgJxZkugMlzyYIYEnpl/bZpW+tw53j7r5TifXI3J5b6o8wDan8BHzH2fVZP/OZ2yN7eUPTBrvL/pXFEG+jNMMdmLgi7tEVn6HUMh7pWQ41svbIcwSiNs5nhlafyddYOZG+Hh33EXeatPGURIcyBRf2Ss7beslLtYaarlcKXzKfKVUyufnH3F36uwge/FfZK+K/0v4RswoRoUOsb7HG0VnOfd5D3wVRARAHg0ndT6co/23ZCdItrVOjjnIgHUvUOa3sTeLnK3NmvG7RefSrYq69LGg9cnpZyiWrQ0mivF1sfPl2g0zu0tPpwpgr2DS2JY18DtvGON0dWdJEgo4tEkgg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vIGbOGItWUiXa3Uwa+xXIRncq3FHXacSwS/Q10Vbao=;
 b=dN6tkqBEOpFYhKF2xFVT/F8HJx2LBwyjiLeNevPUNbhlm8AbbSBTSm8L1uXfj6aBoWyZDvcUdbIKwDe52Qs6f4V5srtAITQOm0sY21ITNklchSSqGfPUecPy8Cboyt2x40p9uNCnoTv0N2xVF99XS47oDbhMMtRSWgIQv895WTt1RU6XJrPY8tmR2LqQaXZnc4pz5nMhAjHhQd5lYHB8FnPkPau78sCrl6JsdOBv46bZbs96zloLN7m9aarH1pYrHUBb0TDzTJIMSTQYqSk1kohu1OyMhAmbJdvVIniFXOiQy3Jrcfk0PyGN3fqqlgCT6E0L5MjYS+S+T84Tz0wI6g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vIGbOGItWUiXa3Uwa+xXIRncq3FHXacSwS/Q10Vbao=;
 b=OnzR0Af3FYkVWy2I+c9rOoTtgr3RP4QMyMFZTQijESF4bYkcumyNZ270TUvnvcD4ndl/hcxzT5OE4s7LGcGdKe4eJ7K5uoHGdjfhL/Q2lShDnyxCGQYBu796xUEjlVkDHzxy7yvi24RiVqw+fKNr6AxLiucx9hJTccuHZZgw7lM=
Received: from DUZPR01CA0077.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::15) by GV1PR08MB8668.eurprd08.prod.outlook.com
 (2603:10a6:150:86::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:33:35 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::f7) by DUZPR01CA0077.outlook.office365.com
 (2603:10a6:10:46a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.32 via Frontend Transport; Mon,
 2 Jun 2025 14:33:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 14:33:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TbDSKEPx4EKjqPJI+YtssobXyoobNoFD3oZrzfRXx5FHwFe4ip5gz0EfSXv8CQDsRmH6YuU93y6PwTu9E2/Dyr8yAKK2eiSbpvxpm6mMtDxpwHt18PAP2jyJ3GC+S5fXmTbbUP3qK0Pwgoezxfz/s874MIiHy2sqrBDIlL+vZx66+C03IYR2rwFMcKgy/ncUYPrCw4Nm5ue8FMTxfMsENsVKH97JS6LEGB87x6P1CvZlmS43Z3kBsvikY15sm+swIFBXvupK5DW5ZSjRdA7/iS8DrDCvU+GkVle1G1UmeYRZWYaBoVMjXmoW/WQP+OpETvYUtMyXlpvvdcYVPwNJTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vIGbOGItWUiXa3Uwa+xXIRncq3FHXacSwS/Q10Vbao=;
 b=nSZzxMW5i9c0Mvjf1lfcmiRaNlJl9qI6yLGbBIrXWhGS/H/nSAZms6zQr+MlVw5eq7Lk5dtEx9i0cj6fl+5A6dPP/exchX9WyWFTIn6ov/ya0G/zJr6RfH6Pq17NECIuMXV0mV9piFKKEeQmDhTF038vjM/+1EjC0TQFeZqsyo9Cpyebk31AZm1KEz+B7OHtz6IGFkTdOKP7C+VhKr5AgSU+mnZZk155t4ZF6KdxuvnL7E8M0hH367Wrm5FSU20uu0CrPO1lnCjZx7xhI1qkGUSpnwIzv/+Nssw4J6wvfK3sPM6Y7ZO5w+jPNJhp/W1jp5muC2LfWAUgf1ZAt9NeTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vIGbOGItWUiXa3Uwa+xXIRncq3FHXacSwS/Q10Vbao=;
 b=OnzR0Af3FYkVWy2I+c9rOoTtgr3RP4QMyMFZTQijESF4bYkcumyNZ270TUvnvcD4ndl/hcxzT5OE4s7LGcGdKe4eJ7K5uoHGdjfhL/Q2lShDnyxCGQYBu796xUEjlVkDHzxy7yvi24RiVqw+fKNr6AxLiucx9hJTccuHZZgw7lM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GVXPR08MB10809.eurprd08.prod.outlook.com
 (2603:10a6:150:158::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:32:40 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 14:32:40 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] Add GPU specific initialization framework to support
 new Mali GPUs
Date: Mon,  2 Jun 2025 15:32:08 +0100
Message-ID: <20250602143216.2621881-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0155.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:cd::13)
 To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GVXPR08MB10809:EE_|DB1PEPF000509FE:EE_|GV1PR08MB8668:EE_
X-MS-Office365-Filtering-Correlation-Id: 2deaa67f-06d4-4d00-2c53-08dda1e27439
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?yqk0T5h3sEwNyhHFc6l3o4TYNTERsDkRMqqVcPPTB+GQGYPBUs2rwOwE2p9N?=
 =?us-ascii?Q?tIfE/qdRc70Il6OSJnzPefmqbKbjoYbQCeMR+kOMls/AKiyWF2ISx2VlQAI8?=
 =?us-ascii?Q?5Iks9FImiKlSIIqZ6l1PyDnBNS33HUBAXEtlKsK3FYuYQDGSSKxy2LMgYkIA?=
 =?us-ascii?Q?1pxLQJFrMn2ybGbPdmrAKWrVEUoSu1T8cH3aWfgd+W4cKzZJJyoHyPhpvNLw?=
 =?us-ascii?Q?DTjOqcJ5qjxQZvPRLmzV7RvSF4sdj6OmwvFZcA0QMoAso2b0vMg/RVAKym9U?=
 =?us-ascii?Q?rWnKJjvinWWiE294dYdLUJtSL4clT1kTHS4aCYuzulRT9WKiCSoQltCHeED0?=
 =?us-ascii?Q?PJxQpsKZoBzRHdL083kgxpgWN9IH6ZcBNA6B/xkDDMMWrMNMAPXjXo6Luf4L?=
 =?us-ascii?Q?ZMdks1yvAHvWdndLKi5UgJHoPXg51SqYfQuZ3ZYShd2sW/w1pFkZyJny9Aqp?=
 =?us-ascii?Q?Xrx8Tz1NdIDuWorb0Tz0CNaqpIl5eSCimBnyW3Hh9fgfIqKdNBRpjNzINRDf?=
 =?us-ascii?Q?FX6J+dCXTB4DjBlWkTO6hOKw7kNbqKIjNru90M2zESSQ2BCWHZLqhK0Lhtfe?=
 =?us-ascii?Q?zqqFp2fK/jrsLHqrhhJn4KP3zf25ECdlJ3Xf+EKqSgPjNmSH6x0AWvVLlCIE?=
 =?us-ascii?Q?Y06Dxje/N+xxLKPtfIN9uC9Mne4adPQTZyAgBllwE0+VCjcthRzfB2su03+C?=
 =?us-ascii?Q?Ael/LZzlsv/AgMCHeaDHmfrad8Poc/aQKKTmcVKl6LZj1mldWwQ3F1UbNK1H?=
 =?us-ascii?Q?f6kjOz4yG/cLxVsXXIwykUaJ+wfsfPROH0C9QZ42+h4sae7lRdu3pIoMj/lO?=
 =?us-ascii?Q?LHNxLQEPqGFRQcl/at7u+a99irCkgwfErbqYtQhCOLb0aE55Hp539DyldxRk?=
 =?us-ascii?Q?uiUHBO8qpddf3kKWx2ses349rL7DY9pBasKirvYx/+o/WrVpzxbNHlD1/Agb?=
 =?us-ascii?Q?FD3b6cB1vq3TkBXc6TgnXOIJDBEXXiDzi6tbbH1o88xWbcMuJVy9H1oDgymN?=
 =?us-ascii?Q?amItcOPYhyyurWdeQPB8D+hALe7O+2qnQQh4dbRQ3FpAF2BrPxb7cjF4alFy?=
 =?us-ascii?Q?gR9OUSUHk403cVSu/Kv72S5ERFviRDw++w1dJm6nRLm5NtoFvMpPW9+CUrZr?=
 =?us-ascii?Q?jU9I5Z9nioJHXwcEVjKCldQWNJBRXBkcZrkuf5vlNtRHsVswKao3jigYHW2A?=
 =?us-ascii?Q?hB1Cok7ZbThzdRKQWmm33EjDcCI/CMly/PKA33fcx5wL1TT/sBfO1bBc6Qvc?=
 =?us-ascii?Q?1/g8HktAkrlWhKWq+Oe+RxI25Y4GvKBfsmqzKcuCdWCHNvA7TNuR/+wyGaxL?=
 =?us-ascii?Q?VjcYb+42kOpMxwwpWNlYJu9S+nyHkVKc5QypdX8w4K8A1V9TcNedwUlCE3E2?=
 =?us-ascii?Q?QjVieKb9A5dK7LNwtTkKBMUBUc3d?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10809
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7bb4f9ed-7c70-465a-f3b4-08dda1e25446
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|36860700013|14060799003|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0nzEXneJHYGZxWWGeHpcSuDm8fX14V/QQOPR0RreoP+Iqy/AeDLBTK9Hardh?=
 =?us-ascii?Q?kTbcG3c9od+tOaCqsik2tRFVfkIw6kkZvd/gnDbj7JbCtPqyOWqQ/erLjERC?=
 =?us-ascii?Q?/lFQOwpXAOircdsd7J48LobyDcuLovn6HDK8UlFOQ7RNXIFD7EiWvw5hEjtL?=
 =?us-ascii?Q?AtRjqPpBGd0uBMvY2KP2/XuzGrNBNidQigqxUfuSMXO47LnBA3ADjV7nXDIm?=
 =?us-ascii?Q?NpO72BTqhcYkNZ4Bt3BghxafMZWHlAWQLuiYLFL+x20bmaGEIKOiUlZoYzFI?=
 =?us-ascii?Q?YzkQ44FAJnQPMuJF0Y7X6jOGH6N36vtb6IvPLEhN8SoFqexHZ1RtiXrTno8t?=
 =?us-ascii?Q?pwjehEevyVTsoxPbb0bUV+JXVVRVyj4ZD6tGIYfCv0eWYvQfQPetijNQ7rq1?=
 =?us-ascii?Q?ptTA3fQXXfTBQVJXh3WqzUOQaeAIei6J+4NDxX9zIP1s/ZtD9iqAz7UHv7YA?=
 =?us-ascii?Q?a686PL5gvN9nYLWbs+Bx9PS+t1UL/pAXDnWSTtmZOqEX1P4plcmTlknsCWpJ?=
 =?us-ascii?Q?EAZSNCyc/R0kFajnyMb+i5MHKQxNm0StAlzLnSVP2ZWXPE2ozeppwIR723KM?=
 =?us-ascii?Q?x4ZOeuiSas2j1yJYiJmxocAvAsr5bMp1vCyW8ct5RVATbkA3GInt535QrXK6?=
 =?us-ascii?Q?FGeh6TPq/quj6Uszw1DJMjAPEbU8lP7LhJKJyxyNobex+6AlTCx6umV9zkHm?=
 =?us-ascii?Q?YTHrMbx/3spoGnNW6vZSPQtjApvCrL7fckANmIEgmhx3VUSdeUY/d+d5Dbbd?=
 =?us-ascii?Q?Y3sKAFUDzveUcY4AIrweb3PYd0chSKeeOSDGof38A4bZZkH3y68ocaliTfJI?=
 =?us-ascii?Q?3Tjb69U3rhOsI0dOgWWHjPjogLWZCvdzdHfL64jfD55/vuGrqq+YMdjKLYDO?=
 =?us-ascii?Q?TbSdyELdhrgJ/ObJzm8Z59jNK87hwnsXzrLc8lItY6qAgydduD8UuwFe+9V2?=
 =?us-ascii?Q?waI5s+Qdsf1VM9xBjT0ORoEod5QDY2hQFCYDGU3YVYrovf2liJLEheF92K4Y?=
 =?us-ascii?Q?EtLwVf6XluYGyMLGRLNvTQ4rFBwkZejBu54iRkCGHegbAmYp0JpUCaDvrbCT?=
 =?us-ascii?Q?hBhNtcdj8bf+pLcoXYb6JWbW0LO3WIHRb2OvUbFzzvqa/qIfgnYi2cN5T1C7?=
 =?us-ascii?Q?iORrBIatcPJ+uO0NOL9TM4n8qulO3mmfougaAWaFVKLcFnLQOVYlMU2EAypl?=
 =?us-ascii?Q?YCPGPqTZ+Q5D9JsNyHiMDL5YigxlrQAsT+MtxvqAey3R10uRdRWKkQQs0I2i?=
 =?us-ascii?Q?83dGrsDAsiorxC8whBjItMVUULBLWVhijqxh5FBKHHC7zDmxy6AH9tIo90fl?=
 =?us-ascii?Q?AE17TF54QFlnd9d46K8lZGrdGZWAcKSnH26svPFEauY6L6xNDNpz1rcH02wZ?=
 =?us-ascii?Q?xVewmCmna0jml7SBtek9xPOdTql+SWRuOWBVcEnffrqjFCOqLiDWiEqKZdW6?=
 =?us-ascii?Q?AvzJkAfVYCbErWGutVb9bqLIngiR5iJDKL5pLEp10j+Znr7rlFON4g=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(36860700013)(14060799003)(376014)(82310400026)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:33:34.0068 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2deaa67f-06d4-4d00-2c53-08dda1e27439
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8668
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

This patch series introduces a GPU HW abstraction to Panthor, to enable
support for new Mali GPUs.

Key changes:
- Addition of GPU-specific initialization framework to standardize and
  streamline support new GPUs.
- Support for cache maintenance via the FLUSH_CACHES GPU command.
- Support for Mali-Gx10, Mali-Gx15, Mali-Gx20, and Mali-Gx25 GPUs.

Firmware for these GPUs can be found here:
https://gitlab.com/dliviu/linux-firmware

Patch Breakdown:
[PATCH 1]:   Implements the GPU-specific initialization framework to
             handle differences between GPU architectures by enabling
             definition of architecture-specific initialization routines
[PATCH 2-3]: Refactors gpu_info initialization in preparation for GPU
             register changes and at the same time simplifies and makes
             extensible the process of determining the GPU model name.
[PATCH 4]:   Adds support for Mali-G710, Mali-G510 and Mali-G310.
[PATCH 5]:   Adds support for Mali-Gx15 GPUs.
[PATCH 6]:   Adds cache maintenance via the FLUSH_CACHES GPU command due
             to deprecation of FLUSH_MEM and FLUSH_PT MMU_AS commands
             from Mali-Gx20 onwards.
[PATCH 7]:   Adds support for Mali-Gx20 and Mali-Gx25 GPUs.


v4:
- Split 64-bit register accessor patches into another patch series.
  - link: https://lore.kernel.org/dri-devel/20250417123725.2733201-1-karunika.choo@arm.com/
- Switched to using arch_major for comparison instead of arch_id in
  panthor_hw.c.
- Removed the gpu_info_init function pointer in favour of a single
  function to handle minor register changes. The function names have
  also been adjusted accordingly.
- Moved the patch to support Mali-G710, Mali-G510 and Mali-G310 forwards
  to [PATCH 4/7].
- Extended support to perform cache maintenance via GPU_CONTROL to
  Mali-Gx10 and Mali-Gx15 GPUs.
- Link to v2: https://lore.kernel.org/all/20250320111741.1937892-1-karunika.choo@arm.com/
v3:
- Kindly ignore this patch series as there were duplicate patches being
  included.
v2:
- Removed handling for register base addresses as they are not yet
  needed.
- Merged gpu_info handling into panthor_hw.c as they depend on the same
  arch_id matching mechanism.
- Made gpu_info initialization a GPU-specific function.
- Removed unnecessary changes for cache maintenance via GPU_CONTROL.
- Removed unnecessary pre-parsing of register fields from v1. Retaining
  current implementation as much as possible.
- Added support for G710, G715, G720, and G725 series of Mali GPUs.
- Link to v1: https://lore.kernel.org/all/20241219170521.64879-1-karunika.choo@arm.com/

Thanks,
Karunika Choo

Karunika Choo (7):
  drm/panthor: Add GPU specific initialization framework
  drm/panthor: Move GPU info initialization into panthor_hw.c
  drm/panthor: Simplify getting the GPU model name
  drm/panthor: Add support for Mali-G710, Mali-G510 and Mali-G310
  drm/panthor: Add support for Mali-Gx15 family of GPUs
  drm/panthor: Support GPU_CONTROL cache flush based on feature bit
  drm/panthor: Add support for Mali-Gx20 and Mali-Gx25 GPUs

 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_device.h |   4 +
 drivers/gpu/drm/panthor/panthor_fw.c     |   5 +
 drivers/gpu/drm/panthor/panthor_gpu.c    |  95 -----------
 drivers/gpu/drm/panthor/panthor_hw.c     | 197 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |  66 ++++++++
 drivers/gpu/drm/panthor/panthor_mmu.c    |  35 ++++
 drivers/gpu/drm/panthor/panthor_regs.h   |  25 +++
 include/uapi/drm/panthor_drm.h           |   3 +
 10 files changed, 341 insertions(+), 95 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h

--
2.49.0

