Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0626CBDA52
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 12:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204B610E460;
	Mon, 15 Dec 2025 11:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="JeTTds47";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JeTTds47";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012066.outbound.protection.outlook.com [52.101.66.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB68410E460
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 11:56:26 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=n8VwC6IFt13VrrAaijXl9u8aH7WNUyCvrJ4B3BaZ/nnkZtgz7/HMNiT215wkwMP7B2nEdetrMz1coEIJVwKy5B+9oFM9Yo7pPYNObX3mfUCU416GAUghRhmG/ghRF9/N/hffd0BGteGT6rG9xc0YuCP/C0x+mnmFl8uXMYb3XeF7ATfZcXUNu8RN0QrugJM3K3S5cla5rlWMc36uWUVx3+4c3ppjnrMIsI7IYoVANdvqI0GPMohYCJn5sVX4wkYXNuvnoALTazDfFSsl84cZAYedPHOfI+xgMDkiooC4G+xJUZVcPv5skuTGlUm0KZzSR1FXXcyfSyQI65Dm/wgWdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpqFq9juyPhK+FbHziWCcl81Bfq5e+5gFwa9KwzzXp4=;
 b=ab5niTKltdwHg7eHGaaNti0mTJMnjKGcHYhzjVc2bVz3oq+pGiPSPEiXh3sjD54Ac3lQAkNRpGSalUSgrOs1UNkfQT7D8+naTQApQxSpzgWBecYnYDMf5/I5nuaqoo2A1S2i0FBDKjQl14xAVaclhOQeljmHkRzsrWuTZ6lWBuXey+l8w62U722jB9wj+uJxa2YBYmXyrcVMEQTBgFREvWkLvB2CP8D6J4lDvhH/HkKGhaHtW9Z+xEPJVpqbFbDdQj8oVSNgiZB0X5REH9Tvetdp6//oQXffgq1h3ONBT+znOKax98NhVomp8LqR69g/kQ8irZVlUIsOF3cEoo75lg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpqFq9juyPhK+FbHziWCcl81Bfq5e+5gFwa9KwzzXp4=;
 b=JeTTds471MQtvQSbnWsLn3z+9J6FBvi61QSp2fLtsQT7xGPWoLvvzYTBdOkM60SsTQIoOnMaAS+VA0n9OOfdX4XY0gsZUFNKGIVs/hCBsYiezHQox7Jrt2GYBCdEJesqgZ+VOm+bk0KiFTCf+1Y51UXOHEkQ10qGYWhSxvXjcCA=
Received: from DU2PR04CA0236.eurprd04.prod.outlook.com (2603:10a6:10:2b1::31)
 by PAWPR08MB11559.eurprd08.prod.outlook.com (2603:10a6:102:50c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:56:20 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:10:2b1:cafe::de) by DU2PR04CA0236.outlook.office365.com
 (2603:10a6:10:2b1::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 11:56:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4 via
 Frontend Transport; Mon, 15 Dec 2025 11:56:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffY26trOLTSG94PUko4Eqpf/uk0ZaSa9mc/O5CJkmD2bjPhB62VKK1X/b8u9hdeHq+3uhq0KTmQHIVROJ7VpL50qMvqvRcg56s86suIYCAd7wSj4wY9BIEU7sGWzfQac9EKPTBpu7P87XGxMu09rPC7KfJEukE2yfFK9Hjr40q2CsewociA0uYZfaDCHobgNWxk1zyiqvMy/hJx1L6wQfVol7lSSLrZQrrFflZfvPJ1RCUZSQmO29U8tIOs4Prnugzspm/ydI7Q0g9K+ssi31W6F8iqPU7UTmojF7tgfK3CY9acQXM/91Apk2JW5QDpYPn0eBBQCJsXhn9KuDkLbKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpqFq9juyPhK+FbHziWCcl81Bfq5e+5gFwa9KwzzXp4=;
 b=ISlM/r1bmCiyR+5daaICxwpQWqFJbWccokK7Y3Kfnwgs9bW9h+LKy4/1uZyLsRi97zNCi1PALBONpNBDPBnZ0PQtiQmOaKsqIojnlXQAWsxBsuV//jwLQYRApyK2b/5OGxnVoRKI9HtIyB+62EIsd5BnEfjhOQD21ALqw0BdM6MTgWOIoJN41olxXDKFAB9AuXVL0rfoViUNM7L0g9SozjPwiL5WGyKA8DbnIfGllN2oq7vZu1I9KiSCaT15/vj+DL3I2ckw4Dq5BZjU6xnj2ZQjzWYzTWvDxDCjWAu6nXmyI+aHZ4a4wY5M1cY9ZAcAePLjUlV1Yxu5v+ceulhMqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpqFq9juyPhK+FbHziWCcl81Bfq5e+5gFwa9KwzzXp4=;
 b=JeTTds471MQtvQSbnWsLn3z+9J6FBvi61QSp2fLtsQT7xGPWoLvvzYTBdOkM60SsTQIoOnMaAS+VA0n9OOfdX4XY0gsZUFNKGIVs/hCBsYiezHQox7Jrt2GYBCdEJesqgZ+VOm+bk0KiFTCf+1Y51UXOHEkQ10qGYWhSxvXjcCA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by DB5PR08MB10191.eurprd08.prod.outlook.com (2603:10a6:10:4a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:55:17 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 11:55:17 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: nd@arm.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lukas Zapolskas <lukas.zapolskas@arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>
Subject: [PATCH v1 5/5] drm/panthor: Use GROUP_GET_STATE to provide group and
 queue errors
Date: Mon, 15 Dec 2025 11:54:57 +0000
Message-Id: <20251215115457.2137485-6-lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <20251215115457.2137485-1-lukas.zapolskas@arm.com>
References: <20251215115457.2137485-1-lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0323.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::11) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|DB5PR08MB10191:EE_|DU2PEPF0001E9C6:EE_|PAWPR08MB11559:EE_
X-MS-Office365-Filtering-Correlation-Id: eba852fc-7374-45e7-3c57-08de3bd0f5f9
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?2mWugcX06aXS2vlJs2cSaVQMoMIiWjS+Vv6MSS7eCoBFUa57Hl6u+Svaac07?=
 =?us-ascii?Q?joKCROvN/iVFlN9q5JMHDd+PCgaq4hZOwu4PJmU6q6V1JVzTQylQm0hD5Vo6?=
 =?us-ascii?Q?Wh/17ZDNfk53fOJ041Vw/jK0Z6mVM9Do1lSGxyrl48d91XPbCbZR88iv7YLr?=
 =?us-ascii?Q?IWfqZhTnrFxF20gFVdhB/T5+jEEUwtFejwkdQjWlmZXHnyMBZH6hsWKCakCa?=
 =?us-ascii?Q?y4PdkOtRAO4SlLsct0R7c8mmMRX2xNIDPki7VcE+7HDKxLsIZ0qwPmatkl2T?=
 =?us-ascii?Q?Lt5lBZndJ+X2610agIpcKdEwi7+OqEEfZ+Oqst1jEPbwFTiHAn+hqdVqtBd8?=
 =?us-ascii?Q?zpOuQnJur/yzYC1ksQL1bn/FJBKlcaAJpzKbDKIcOYLWjpG8jDQafW9peYHH?=
 =?us-ascii?Q?03DB+5eQNa2ncLK/cybZQhswMi61g+uoQuX4WKmRYTFuFGaRwzLOWOz5y3OH?=
 =?us-ascii?Q?ZuI9dSn5m0s+8vEDvZH4dk46N0X+8K9GOGqXS+On+NP1fS+996+Z9gMRZQdq?=
 =?us-ascii?Q?yx7RqDJyahqngEuNgmS3icc/cQuMoo1db7SH4RPBo6Zk8YlwBfLrS8K6B+su?=
 =?us-ascii?Q?pKjFKpL1ygWZyOGDSZG/K3pCJ5Z64f3HaNgrF8pGTcPUvy/q6o8w8CZ+6zBr?=
 =?us-ascii?Q?0XsWGsI9ENhX66zd3Ed73z1o++b2vju2zDTXE7puQNWX2FZ3h3jeyNHjAFz9?=
 =?us-ascii?Q?TBzxaKX9/PD+RtXD/lt0f5g5PaGm4/YjPsc35buRuYnzOkdlxOxbGP4kM6md?=
 =?us-ascii?Q?UbrAOQuZbzZizIVH/cebHdk5saa+aG6d1d08gXe+ZO0Te0A36q29r08gXqJs?=
 =?us-ascii?Q?T4K/sJ5yeFBZFMSY8sVn10TfHybF6TKASk7qYlaqGFvPvvpMs9Ft8ZKSBjCC?=
 =?us-ascii?Q?430CxZ/X6ZoRjEdet3Uqao6bh/7gLUc0F7n23X4I8n4+u4/+S+3mmTwJFhYK?=
 =?us-ascii?Q?EFLMKFNL6fMkXQgeswmzb0pKZ8TI2PzJxi4jXJttuI5AzJNx3FVGnEI5EPxe?=
 =?us-ascii?Q?SEQwOC4ytID85bMJqqKT8CKOtGSfpB/dEbcfK0vaKfnc8+GOZ/Ujpyjo37Tv?=
 =?us-ascii?Q?4ZLD0msVzW6ksSu8msYYHT4Cg7zbMrc7WW+cb8IKYCu8OZmtA1B6G+IXyPCg?=
 =?us-ascii?Q?2gytxc0nKquu3yLDqrch5E7bjtydQp6pYoWzO917rQzd3gmrN3dBYsmjaXBz?=
 =?us-ascii?Q?kT1FB5nUHzgD/BeBL1K4boTM6FmnF3wgvTyQHtLzRgqW3APeskls0pl9r94/?=
 =?us-ascii?Q?EjThq6fPLCZS/W3FEWP7HspWOz5fOavxkp7MVnF7GYE7DBUMiXAc8LRjAkq1?=
 =?us-ascii?Q?7cFuCFOaeXmZWENF89hZEdOByC6Iw36qszLj1maUus6sk8PePB42NOYD/vWr?=
 =?us-ascii?Q?gBAO2ifMgSDX1iftjXkSazbLCbVioUif9c0vMqZ3aDb31lyG/wVqjUesZ9Y0?=
 =?us-ascii?Q?et71W25jtH5ZfP2qh6mCu0bg4hJuZ7xsDf0FN+d8U5Am+xkG22mjeA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10191
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c3a27f43-41ab-41d9-331b-08de3bd0d078
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|376014|36860700013|82310400026|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fkaHThQJ43XP/W5BHcs3NWNmaGhGAMdF4Ejj+eWJRGVpX8t3Ad8DV6xC9/bL?=
 =?us-ascii?Q?HZ5hnYNH6dUr4TkEMMt4Y1zEHKnaPlua/IA8Dpd0eNKZEzoLA5Kpv1S2T+uE?=
 =?us-ascii?Q?rJEWJiBSp+A9SercR7+q40IN0xxdbEMKI+xu8N/y6HNr6F7zfnvr3JCx58Bk?=
 =?us-ascii?Q?8RHApi1oSltB3CxnFp9FH9IeYzHQGZe0m6Afl3/ag9SlaJmSWMIz3RDkr/qC?=
 =?us-ascii?Q?oAMPlQnmaCHdY7UCMLaSwjzx6XveehVwQPG8qWFWprdajcHjk/tTBKy2nx4G?=
 =?us-ascii?Q?dDRXMX7lH7XrBV6KDYeANzSdg8YX34PoJb+x+mikcQ/yvp84DBKbjFyeX8N8?=
 =?us-ascii?Q?2Y1BApUaAlMySo/KtzR42j3+RPBDTUbUFa+SY8qtYkcFt+6NowxPRuavFPu0?=
 =?us-ascii?Q?kV5hMvjaJyjd1nvMYBBQynxXkA3s8Az9/Y2EsWkpO9Q16IXAnOyn6C6CCpof?=
 =?us-ascii?Q?bQP9HJfqnBOs71u9zVaMeO2msLa8pN2Ugk1WmT4kNZJEwwh2zH1/CsNZbWn6?=
 =?us-ascii?Q?KOT1aOxXX80bglL1d/LQUDHQKHi7fSjIvIAqJZLHUmwkCuxqmvIvWGR4/8JY?=
 =?us-ascii?Q?xeHSZ39NTG8ENBhop4Olln4JWLGlbdQzIHUEjqFVobdkFTWJclZ58l67eEUz?=
 =?us-ascii?Q?ekHWH7FFOyt3pmBRVhm5ot1EYOp8pz1+ckQiGGEqkEXTCX7Ud9PK8iUVupux?=
 =?us-ascii?Q?O7dmkk44j9opAH+dzRfw30+trMo4RC4Dk60rZE3RvOcjkBhQokE6SbVvE1Un?=
 =?us-ascii?Q?awWKk0NiEUPOLkMOFhs8GJeqFmQDTBjYP22a3HLjDCES5g+sPBVhu+lDsfHk?=
 =?us-ascii?Q?bxyx9MoPt93Suj+F4sb8edamUye8l4oIZkVx4sUWYyZfMdzn29HrgqU4Ljt0?=
 =?us-ascii?Q?cj0bop0ZYvs+e5VIGRXC962PxEg4gCb5tU43WKRg28pqT+s8qf1d/DntiJHR?=
 =?us-ascii?Q?kKhDBvXgupfShbW3/5tRziMz70yyrzTrldhTC30kwvrHiDIWsGFQBKQKe6Pz?=
 =?us-ascii?Q?6ThTKjtxrOLuFSExQVOIKQIZrmZrvjZBQmJDhmOZKxOVwxooWwHcCFLk43Xv?=
 =?us-ascii?Q?r+S3YK0vX0RNTdAjiPcCQXpLalK/KmRKUSXU4hgBgbq59L6vRebnbVtWyIpO?=
 =?us-ascii?Q?fuS8B9TDfWut4cAGB4kSxiTSo0gjPrqPa2oIO9aDfJUHGXjfd+dDdqOkXuxK?=
 =?us-ascii?Q?oKYvAj8LqJuo5MBVwrofLxONMURgUtIXwlXEj3s61ZMUHapd64JQJv93czaM?=
 =?us-ascii?Q?/roQqxtBzQhMbxUf3Pg2Ahsm9UTGQQjQteXflP96zYaCyVvOfcAGZsR1+kD7?=
 =?us-ascii?Q?FHcAP7LyOv78OhWljhp/g+3mPuJZMTzklaqH8bTva1qpVF5Qpe+8A6/qCzqI?=
 =?us-ascii?Q?G4Ed+UCvxC2XP/dJl7BwRctXhLcMFQM5unWLACkj6vouwJxLFlrNhqp5D9de?=
 =?us-ascii?Q?nePYDWsOYgBWsG46USKpVd2Bd2Jdz6C59Pw4plV7BGHRZyjzVQYC+6JzAfei?=
 =?us-ascii?Q?GENB4ZLK7OJfZKHItCZGtXI5YCv+A9k0/mUx3r5ZY3tDXBJD5Uwgw0fqZInc?=
 =?us-ascii?Q?0GhPxrWGzDC9IQljboqKaDsYx/fj13oZympkK4II?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(376014)(36860700013)(82310400026)(1800799024)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 11:56:19.8102 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eba852fc-7374-45e7-3c57-08de3bd0f5f9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11559
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

GROUP_GET_STATE now can be called two times: the first time to
enumerate the faults that occurred on the associated queues, and
the second time to copy out any fault information. The
necessary infrastructure to copy out drm_panthor_obj_array's
is pulled in from
https://lore.kernel.org/dri-devel/20240828172605.19176-7-mihail.atanassov@arm.com/

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c   | 85 ++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_sched.c | 92 +++++++++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_sched.h |  4 +-
 include/uapi/drm/panthor_drm.h          | 24 +++++++
 4 files changed, 195 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 98d4e8d867ed..bdcaf85b98cd 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -75,6 +75,55 @@ panthor_set_uobj(u64 usr_ptr, u32 usr_size, u32 min_size, u32 kern_size, const v
 	return 0;
 }
 
+/**
+ * panthor_set_uobj_array() - Copy a kernel object array into a user object array.
+ * @out: The object array to copy to.
+ * @min_stride: Minimum array stride.
+ * @obj_size: Kernel object size.
+ * @in: Kernel object array to copy from.
+ *
+ * Helper automating kernel -> user object copies.
+ *
+ * Don't use this function directly, use PANTHOR_UOBJ_SET_ARRAY() instead.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+static int
+panthor_set_uobj_array(const struct drm_panthor_obj_array *out, u32 min_stride, u32 obj_size,
+		       const void *in)
+{
+	if (out->stride < min_stride)
+		return -EINVAL;
+
+	if (!out->count)
+		return 0;
+
+	if (obj_size == out->stride) {
+		if (copy_to_user(u64_to_user_ptr(out->array), in,
+				 (unsigned long)obj_size * out->count))
+			return -EFAULT;
+	} else {
+		u32 cpy_elem_size = min_t(u32, out->stride, obj_size);
+		void __user *out_ptr = u64_to_user_ptr(out->array);
+		const void *in_ptr = in;
+
+		for (u32 i = 0; i < out->count; i++) {
+			if (copy_to_user(out_ptr, in_ptr, cpy_elem_size))
+				return -EFAULT;
+
+			if (out->stride > obj_size &&
+			    clear_user(out_ptr + cpy_elem_size, out->stride - obj_size)) {
+				return -EFAULT;
+			}
+
+			out_ptr += out->stride;
+			in_ptr += obj_size;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * panthor_get_uobj_array() - Copy a user object array into a kernel accessible object array.
  * @in: The object array to copy.
@@ -178,7 +227,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
-		 PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size))
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_event, exception_data))
 
 /**
  * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
@@ -193,6 +243,20 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 			 PANTHOR_UOBJ_MIN_SIZE(_src_obj), \
 			 sizeof(_src_obj), &(_src_obj))
 
+/**
+ * PANTHOR_UOBJ_SET_ARRAY() - Copies from _src_array to @_dest_drm_panthor_obj_array.array.
+ * @_dest_drm_panthor_obj_array: The &struct drm_panthor_obj_array containing a __u64 raw
+ * pointer to the destination C array in user space and the size of each array
+ * element in user space (the 'stride').
+ * @_src_array: The source C array object in kernel space.
+ *
+ * Return: Error code. See panthor_set_uobj_array().
+ */
+#define PANTHOR_UOBJ_SET_ARRAY(_dest_drm_panthor_obj_array, _src_array) \
+	panthor_set_uobj_array(_dest_drm_panthor_obj_array, \
+			       PANTHOR_UOBJ_MIN_SIZE((_src_array)[0]), \
+			       sizeof((_src_array)[0]), _src_array)
+
 /**
  * PANTHOR_UOBJ_GET_ARRAY() - Copy a user object array to a kernel accessible
  * object array.
@@ -1128,9 +1192,23 @@ static int panthor_ioctl_group_get_state(struct drm_device *ddev, void *data,
 					 struct drm_file *file)
 {
 	struct panthor_file *pfile = file->driver_priv;
+	struct drm_panthor_queue_event *__free(kvfree) events = NULL;
 	struct drm_panthor_group_get_state *args = data;
+	int ret;
 
-	return panthor_group_get_state(pfile, args);
+	/* First call enumerates the faults. */
+	if (!args->faults.count && !args->faults.array)
+		return panthor_group_get_state(pfile, args, NULL, 0);
+
+	ret = PANTHOR_UOBJ_GET_ARRAY(events, &args->faults);
+	if (ret)
+		return ret;
+
+	ret = panthor_group_get_state(pfile, args, events, args->faults.count);
+	if (!ret)
+		ret = PANTHOR_UOBJ_SET_ARRAY(&args->faults, events);
+
+	return ret;
 }
 
 static int panthor_ioctl_tiler_heap_create(struct drm_device *ddev, void *data,
@@ -1678,6 +1756,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  *       - adds DRM_IOCTL_PANTHOR_BO_SYNC ioctl
  *       - adds DRM_IOCTL_PANTHOR_BO_QUERY_INFO ioctl
  *       - adds drm_panthor_gpu_info::selected_coherency
+ * - 1.8 - extends GROUP_GET_STATE to propagate fault and fatal event metadata
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1691,7 +1770,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 7,
+	.minor = 8,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 9ea0d2b27114..f58d9a21dec4 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3872,21 +3872,86 @@ static struct panthor_group *group_from_handle(struct panthor_group_pool *pool,
 	return group;
 }
 
+static int panthor_group_count_faults(struct panthor_scheduler *sched, struct panthor_group *group)
+{
+	int count = 0;
+	unsigned long queue_events = group->fault_queues | group->fatal_queues;
+
+	lockdep_assert(&sched->lock);
+
+	for (size_t i = 0; i < group->queue_count; i++) {
+		struct panthor_queue *queue;
+		struct panthor_queue_event *evnt;
+
+		if (!test_bit(i, &queue_events))
+			continue;
+
+		queue = group->queues[i];
+		if (!queue)
+			continue;
+
+		list_for_each_entry(evnt, &queue->events, link)
+			count++;
+	}
+
+	return count;
+}
+
+static void panthor_group_get_faults(struct panthor_scheduler *sched, struct panthor_group *group,
+				     struct drm_panthor_queue_event *events, u32 count)
+{
+	int nr_events = 0;
+	unsigned long queue_events = group->fault_queues | group->fatal_queues;
+
+	lockdep_assert(&sched->lock);
+
+	for (u32 i = 0; i < group->queue_count; i++) {
+		struct panthor_queue *queue;
+		struct panthor_queue_event *evnt, *tmp;
+
+		if (!test_bit(i, &queue_events))
+			continue;
+
+		queue = group->queues[i];
+
+		if (!queue)
+			continue;
+
+		list_for_each_entry_safe(evnt, tmp, &queue->events, link) {
+			if (nr_events >= count)
+				return;
+
+			events[nr_events++] = evnt->event;
+			list_del(&evnt->link);
+			kfree(evnt);
+		}
+
+		/* In case of additional faults being generated between invocations
+		 * of group_get state, there may not be enough space to drain
+		 * events to the user provided buffer. In those cases, the queue
+		 * should remain listed as faulted.
+		 */
+		if ((group->fault_queues & BIT(i)) && list_empty(&queue->events))
+			group->fault_queues &= ~BIT(i);
+	}
+}
+
 int panthor_group_get_state(struct panthor_file *pfile,
-			    struct drm_panthor_group_get_state *get_state)
+			    struct drm_panthor_group_get_state *get_state,
+			    struct drm_panthor_queue_event *events, u32 count)
 {
 	struct panthor_group_pool *gpool = pfile->groups;
 	struct panthor_device *ptdev = pfile->ptdev;
 	struct panthor_scheduler *sched = ptdev->scheduler;
-	struct panthor_group *group;
+	struct panthor_group *group = NULL;
+	u32 fault_count;
 
 	group = group_from_handle(gpool, get_state->group_handle);
 	if (!group)
 		return -EINVAL;
 
-	memset(get_state, 0, sizeof(*get_state));
+	guard(mutex)(&sched->lock);
 
-	mutex_lock(&sched->lock);
 	if (group->timedout)
 		get_state->state |= DRM_PANTHOR_GROUP_STATE_TIMEDOUT;
 	if (group->fatal_queues) {
@@ -3898,10 +3963,25 @@ int panthor_group_get_state(struct panthor_file *pfile,
 	if (group->fault_queues) {
 		get_state->state |= DRM_PANTHOR_GROUP_STATE_QUEUE_FAULT;
 		get_state->fault_queues = group->fault_queues;
-		group->fault_queues = 0;
 	}
-	mutex_unlock(&sched->lock);
 
+	get_state->exception_type = group->fault.exception_type;
+	get_state->access_type = group->fault.access_type;
+	get_state->source_id = group->fault.source_id;
+	get_state->valid_address = group->fault.valid_address;
+	get_state->address = group->fault.address;
+
+	fault_count = panthor_group_count_faults(sched, group);
+
+	if (!count && !events) {
+		get_state->faults.count = fault_count;
+		get_state->faults.stride = sizeof(struct drm_panthor_queue_event);
+		goto exit;
+	}
+
+	panthor_group_get_faults(sched, group, events, min(get_state->faults.count, count));
+
+exit:
 	group_put(group);
 	return 0;
 }
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index f4a475aa34c0..d75870a6d836 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -14,6 +14,7 @@ struct drm_panthor_group_create;
 struct drm_panthor_queue_create;
 struct drm_panthor_group_get_state;
 struct drm_panthor_queue_submit;
+struct drm_panthor_queue_event;
 struct panthor_device;
 struct panthor_file;
 struct panthor_group_pool;
@@ -25,7 +26,8 @@ int panthor_group_create(struct panthor_file *pfile,
 			 u64 drm_client_id);
 int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle);
 int panthor_group_get_state(struct panthor_file *pfile,
-			    struct drm_panthor_group_get_state *get_state);
+			    struct drm_panthor_group_get_state *get_state,
+			    struct drm_panthor_queue_event *events, u32 count);
 
 struct drm_sched_job *
 panthor_job_create(struct panthor_file *pfile,
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 083a02418d28..931c8371b1b6 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -1012,6 +1012,30 @@ struct drm_panthor_group_get_state {
 
 	/** @fatal_queues: Bitmask of queues that faced fatal faults. */
 	__u32 fault_queues;
+
+	/** @exception_type: The type of exception that caused the fault. */
+	__u32 exception_type;
+
+	/** @access_type: The direction of the data transfer that caused the fault., if known. */
+	__u32 access_type;
+
+	/** @source_id: ID supplying further data about the source of the fault. */
+	__u32 source_id;
+
+	/**
+	 * @valid_address: Whether the address is valid or not. Some faults may not come with
+	 * a valid GPU VA.
+	 */
+	__u8 valid_address;
+
+	/** @pad0: MBZ. */
+	__u8 pad0[3];
+
+	/** @address: GPU VA of the faulting access, if present. */
+	__u64 address;
+
+	/** @faults: Array of faults passed back to the user. */
+	struct drm_panthor_obj_array faults;
 };
 
 /**
-- 
2.33.0.dirty

