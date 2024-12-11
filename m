Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AEC9ED2B6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 17:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F057110EBB9;
	Wed, 11 Dec 2024 16:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="c544+nLq";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="c544+nLq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19E810EBB8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 16:51:22 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GpCNGVILzDAJF3SfKAfXAI8dxE6wOHIPtHPUNVjSSARH2q8uM/sbYlzD2xo2i0oSxbHtdx8oWyIQAntwBhNAHKL5SR0vIoJX/oyc1GbYLGOLDMcLJ32fd2kzSg0ishj5pWqIqjtHIZLC1TayUZSTRUBEezCMg4r0p5vGX3O4zfOcm1KmDA7RPnOyirachluWGdWkst4kND+codS71RfJURZss5hI3F1ogXQ9hRXQmGKhOIvih/Ta/QFD6Ma0tYEVBg3eWdPTJTyokVkf5T9uS4kL/ggqbKQzynUoIfsR2t1/eotzJdj4JfzGyQgAmK6AyIT1Cz7R+fvFm7LEx1wy0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ah54vksIAL1XBn9oTvm0ntr07MfGjKJQMzj3zX/uYF8=;
 b=epLDHZoABz3E+Hx9vB0NBKQ2Q8Qnt4lGE5LgUJBiFk77fDvsORO8jCsq0Fn2mrcJTVvfgVhjq3VC83taQtVvXcim2aAVibiABRNcSgP6mlamTvmGakXTO0rWcmiguQMHjMmHY/22YZi5N2igU7iX/JFiAIKaaTPlPaDjsJkIvz9Zvntftm1+s4eBkDEqhtKkQLwYQBwgoqC9AA0vvFIxYpyi6HyvJexkd4VZa7EYlRpcHlHkJH37V+TiczixVpjtBGlMmkjP99qPT1NSe+MhDxufHORkFIqJDSHm4P0wq0dG6Yn5PBZXeMMhi+MTCUXE0GZF9vaOFY1Dlws+kYEwiw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah54vksIAL1XBn9oTvm0ntr07MfGjKJQMzj3zX/uYF8=;
 b=c544+nLqQdNQRuBgKSvafcV/FzYJa/mPg6CJAKhOrBTQLVYg4S7ELKX4aADWQ5QW1EnUti1gU34pf3dgyAImpFY73pvgPilAJXQWsdcDuzVPI9M5e2ue0d2PFgNmWjown+/wrT5SzfIAyM2qq4S0MFxRfqylOFTDguzZmIQRTHo=
Received: from DUZPR01CA0254.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::26) by DU4PR08MB10935.eurprd08.prod.outlook.com
 (2603:10a6:10:575::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 16:51:16 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::f4) by DUZPR01CA0254.outlook.office365.com
 (2603:10a6:10:4b5::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.15 via Frontend Transport; Wed,
 11 Dec 2024 16:51:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 11 Dec 2024 16:51:16 +0000
Received: ("Tessian outbound 20d64b55c711:v524");
 Wed, 11 Dec 2024 16:51:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: acce7723b911880f
X-TessianGatewayMetadata: gHELJN3cN6pU0hGP3jWmJfHP7jS32iiWXC7SQbWHErBrkbyhDQUaAxNG+ObV0k+E5VGSBtnD3dx+TRk/eJr0lbMbtoC21D2A9Aiyjyj9wQke1gDNHQi83KbNWkB+xWngwjgEmefBu5C7FkV5o7qkaph6CAygRawItYSvCjebde8=
X-CR-MTA-TID: 64aa7808
Received: from Lf4c2a157c311.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 16F5E391-AB5C-4C79-90BB-E28DF4A0E328.1; 
 Wed, 11 Dec 2024 16:51:08 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf4c2a157c311.3 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 11 Dec 2024 16:51:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Va+LKlxVo3A8doHLFCSpQHiFfpReW/9y/m8p+f0mGiADR0C1menkgqjE2eIL2o2td9gBfmLu7zLb7D4GPmDXt+UqQuB6f4/CancC9NZCxOWh/MgZrRNf+DsB10LLXkyzE7ignBhGPVjvFePymHrzApwSgKGG6ToRbeggMKIpeoj2BFz4aAKr7v3VJT9YIFt1+JCYkKMte7JGl411Sd6f7uZDq/pIipR4MeypJvNesC3JiLGiubn6opm0bmasWCb94qIehk3VZ939wmxGXYOMRpbJG1tlrsa65YiIsMWrq4j4tdqkelDbd3fIwwVZ13LGB/AOBcu/K5GLtFw287XDsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ah54vksIAL1XBn9oTvm0ntr07MfGjKJQMzj3zX/uYF8=;
 b=kv42CKYaH7yNRZBAepTwVMQqH4L3swOk1JEQwun6wNCNl4ZXy54K4F1GX7U9NoZ4KcaHbd2Njlbz2bTke7eysUmSc71/R+l/MAZZzY54/YjpXuN4MnNe38IrTqr5kpylq+QahGL3lJZ4idr3eGYTv1pQW4SyXI3zGyH+nVEQV88+wsMyc/UCorSG9Uh5vQghQ0huOL/ZkxJBkX6Ay7csqPsqX9dl1do03tlTFa0u0oqQsdSpAFNe8uKh5Z4LGZ6VZHcyP01qduleAbv3VjHugiGaq/pKOK9RuOXPSJlSRuEz1aLbNM+uCqPTigWCLtp7Kat2igTaxTvBwyS/6U54aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah54vksIAL1XBn9oTvm0ntr07MfGjKJQMzj3zX/uYF8=;
 b=c544+nLqQdNQRuBgKSvafcV/FzYJa/mPg6CJAKhOrBTQLVYg4S7ELKX4aADWQ5QW1EnUti1gU34pf3dgyAImpFY73pvgPilAJXQWsdcDuzVPI9M5e2ue0d2PFgNmWjown+/wrT5SzfIAyM2qq4S0MFxRfqylOFTDguzZmIQRTHo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3317.eurprd08.prod.outlook.com (2603:10a6:209:42::28)
 by DU0PR08MB8493.eurprd08.prod.outlook.com (2603:10a6:10:406::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.19; Wed, 11 Dec
 2024 16:51:06 +0000
Received: from AM6PR08MB3317.eurprd08.prod.outlook.com
 ([fe80::e42a:494c:6581:1897]) by AM6PR08MB3317.eurprd08.prod.outlook.com
 ([fe80::e42a:494c:6581:1897%7]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 16:51:06 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [RFC v2 8/8] drm/panthor: Expose the panthor perf ioctls
Date: Wed, 11 Dec 2024 16:50:24 +0000
Message-Id: <20241211165024.490748-9-lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211165024.490748-1-lukas.zapolskas@arm.com>
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0102.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::18) To AM6PR08MB3317.eurprd08.prod.outlook.com
 (2603:10a6:209:42::28)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3317:EE_|DU0PR08MB8493:EE_|DB1PEPF000509FC:EE_|DU4PR08MB10935:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e246fd-0f15-42c0-538d-08dd1a04075d
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?2bMmBzCdjC4e/Gtqup0QtTlUnqdJve+Y5D0hUmlfJTITQYD8DIlgN93Ik70N?=
 =?us-ascii?Q?aFAfnq/er5Tw7NVem+FXS//AeZbQpoSKbcTyI9wJE8/bZmi25FL4pQML5f+f?=
 =?us-ascii?Q?BS0LsX2770tlFVKM0xCeUNUL/syaHKqHfUVKXTtiWsUyZa/Upjawsv8KQ/Br?=
 =?us-ascii?Q?gDBObnGc6UCPJt1un4RDJAFTDmmqQRpY8mQ4EP2YDC4zVfu1pYl+RNwu3Wdn?=
 =?us-ascii?Q?6OBmW6D9vQdb6bCbZreY9VXXpWft/4xDAzNXbtHTDrlkN03aygw2v8BSqb2X?=
 =?us-ascii?Q?1S7l4tkgxxOjvRAeUSDwkewW4h/5uJLflN3L/oTydb8CluGH0QfpVgRQ9hhx?=
 =?us-ascii?Q?2665Xj/XMpfjyIcfR5D/7dkQeRECbP96IRyon/9JpdpevyL6CNXOPMAjEMDj?=
 =?us-ascii?Q?2KPemz9SiES3mNiLBXbFJvCTKdbfj8zQ8Tzw0+PsVNCdIeLvCPukfUqhHQB+?=
 =?us-ascii?Q?NBwKSNHRSGJfNzVHzjub53biRgTQBdip/86z+7/dwzXcg5XnD/av07SzjnlO?=
 =?us-ascii?Q?K2By0VGeAAOO6VCIBRH51ZxoWdWmJghSm/uwsa5OfyMH+dCv2wB2gpf1cDrj?=
 =?us-ascii?Q?BQMbBrS5152/tvufnhOf/22vQ48scXLjxDEOkcw88b9kN+OkCz72WkkRVirt?=
 =?us-ascii?Q?2Vq7o76g4oEVeyX7xSFuvgB75Km7ZBe6oMnPYkBqyjqkHXaa2dLVX5cirCAa?=
 =?us-ascii?Q?QNc2jBW7knjjrakodRALw1b1gvWpqpD/deNQK2YGsLHRMbfstuCnmB3qtHcx?=
 =?us-ascii?Q?R2t94OhJQNlveweJLpFwhk9aHEzw2XNuJBr0BsTkHfwnlLMAghfXsMFhyNnl?=
 =?us-ascii?Q?PcTcUgZ16c9TS6+gsTaPbLq71saY4OUMoJKKeDZBzb3ZEFbZn4FjXXsBF705?=
 =?us-ascii?Q?cQE+PP+6tsZq+t7V1U4OGfkrrbFZh3A7usSJdhjS+E7hyuygt47NmEfQi85G?=
 =?us-ascii?Q?835KRyA4EifMpih3pPTblbhu2Ies8k8afo/gtzLPByaCl21O8LW8TL4T8By7?=
 =?us-ascii?Q?8WAoi/LQc4cvOKnOzrNihvy9BqrqbWd7sH6BW9Soc8RlhumWFTb5Lans+A6/?=
 =?us-ascii?Q?Y30UxBQFS7Xo4YI2EvuWmpL3j7GrgSm5YlLbkwdW56w7CcRP6J2UaCPRyjLs?=
 =?us-ascii?Q?UODMy7WCJ9f0aZTSz6kI6UQ88y+LpN9cIy4p8zn/jY8bXKl8sEgscNxBSXAn?=
 =?us-ascii?Q?KbqQZWBXVbB9NHJjNVofyhoMmBHA6gON+pE4HFnLg/kTIfzuMf6qicUh58bh?=
 =?us-ascii?Q?XfGPpTg7OSfDWrtlsRar7EJO9QMJYYqKIeeVBkaGKIgadfYWHKFCzKU38dwW?=
 =?us-ascii?Q?Y9zybyOhCxW2DK0pLXkA5qFGOlaaEodHMox6UgzTRXi8kQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3317.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8493
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:209:42::28];
 domain=AM6PR08MB3317.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 24195952-0700-41d8-e43c-08dd1a040165
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|14060799003|1800799024|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yz21hd5Fa35vHHyCeB9FW2H35SApuWuiaEiiiBHgGgYMW9CAQUzoHu+3NvVS?=
 =?us-ascii?Q?R2NHz6GPVhVDVFImuho/rZnsNDdlsTOC+Jb2qbRKLeQ4LIoPAZd/PGqqrnTE?=
 =?us-ascii?Q?g7WLiz23xxWn4GAp+Pw5/2oW0DWc9o9kAjv2ifmBH8evTVnH817aDD0XHn0N?=
 =?us-ascii?Q?AYcDyCVj0sRU6KD0MvcqYWTiWscmABX8ors3z56lWlWG0OZ0IhlXDgyUmgZQ?=
 =?us-ascii?Q?+W7crQYR0hIueR/dLhLgtS+4PbhlJ+L1yA6/u/Cz4IWdrzu3ET85kob7KfSl?=
 =?us-ascii?Q?Zl3GcILCQYApa7ZzEZRiaqtBGcfynj7ijY8jacAoLCaLyZdvE/QnXmtvYUYh?=
 =?us-ascii?Q?hSBECYKLumzZ3mIeJmpwL9pUHAGVi1OPORgGB/9Se8mj2E0dsk6cVSay8ue0?=
 =?us-ascii?Q?k+Sq9a7gPT5GlJ2MgqZRCPz4TcQq6ytpJqmSC+glIyTOp5EhC+eDaBBnPvvW?=
 =?us-ascii?Q?i6+rh7t3OIf5Pg1sL1su0BXQK9hgxnhTbNiPi6AgQFxXzNfmuHVv0SzSMadn?=
 =?us-ascii?Q?aMwpJKbrv2PZz8yMgz7PcvwuQrLEsdhT3Gg3nj5AObGgs7zI1cCXDykXObqz?=
 =?us-ascii?Q?4R2zCNlbFQFPe26fkHCqDCMmNet3Dd0455u+SajNpDflL0O125ROx1OfisEp?=
 =?us-ascii?Q?2sTcKz1yTnkWoLDvQRe7BhLG2TifgNTMGf7VIVLmybThroorLrKgJ4pUg+hf?=
 =?us-ascii?Q?vKM/FsUCGoCuiVDkGDH9xn8ydigxJKR8PdGimdv91vxXyr+zTFcdjfXsJ4in?=
 =?us-ascii?Q?3pQfJmrhwBm6gZdjJajsKuQuRoDHoi80ahnViXlQLxLnngJEoBFkb7n8a9i1?=
 =?us-ascii?Q?Jw1nNO86egvqbdbUvq1BoQIYCUp2Oew2qiO9WfEUbWhyuaLryyWbGMnnLbS+?=
 =?us-ascii?Q?W7wxRBpqxWkLIzNcrIoi/S4WsTBSLYpt91C7ccKLHGmPAZrHyfQgoFQuC0zw?=
 =?us-ascii?Q?ZOXo2ZhLT0mJMMr85QV8LKbXXn6WHNDQvImhrNFsR9Lsbdjg2MY1VbxGlmYK?=
 =?us-ascii?Q?1coJYZ0Vxw30z9MsVEf9Oh+n7hxceMoT7X/XqcA54xgfppNIqb+rYQE37e7m?=
 =?us-ascii?Q?kOcc4fZzv94HlA4o9BIhwWUzBgVNuvi+Ps4wApS7HGW8/CwJuexJtA7KG/xG?=
 =?us-ascii?Q?HuhE+01RXLc7IjeTkh1GVPUvw7Vos33+r5vudsajiGk3tHzi1vDqOG8FvyBl?=
 =?us-ascii?Q?tfhnRMQ3Hh8fm/flyMVBUn7p1jxjNZGtYGG+LFiQrGrvo0T5/cXt5AxaoLDj?=
 =?us-ascii?Q?v1mdTEH7c+/MiH5DbaT6ePGXAzMUUHY/8YUbWT1K88HXm8CTd4vfDegpjVh0?=
 =?us-ascii?Q?KTFF9HdjJuye8NFgsJC2Lz6jtd+Q8/AS5xmidZ6s9kiVezGu3hbJ0ymE9JjN?=
 =?us-ascii?Q?2CvHxNC4i1ad+DSnQGdapBf3qp7E8+LoWF7k9vgdWKebspSexkfDgGQWX3GP?=
 =?us-ascii?Q?j7rUgAl2DR/72JifwWOec9DD2e2IFmZ86s5SwpREcqgr8cp50KgQ2w=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(14060799003)(1800799024)(35042699022)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 16:51:16.1914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e246fd-0f15-42c0-538d-08dd1a04075d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB10935
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

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 2848ab442d10..ef081a383fa9 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1654,6 +1654,8 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.1 - adds DEV_QUERY_TIMESTAMP_INFO query
  * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
  *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
+ * - 1.3 - adds DEV_QUERY_PERF_INFO query
+ *         adds PERF_CONTROL ioctl
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1667,7 +1669,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 2,
+	.minor = 3,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
-- 
2.25.1

