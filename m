Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E79959D274B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 14:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8DE10E645;
	Tue, 19 Nov 2024 13:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="h9jh3nnV";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="h9jh3nnV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2047.outbound.protection.outlook.com [40.107.20.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2517B10E645
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 13:51:12 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZjNm6F6Iqw7GKL3uOeGej4VlvJTz01HZOtmB7VVlPf9DEScZ8XgpJ3ksmg4mSwQ5OFdaODurMQqdnBLkz/RQ6DGDftqYZF9CMOCqDEa+uNzcbySDYfRu54QuM2OZ+ef7vn8RoRBXGT61cfK22mH81uIL0+RysXXtKsMChCFYmIn95S/IVZ9vqamOienDV4j3t4VPQegSiVy86mTN8rq7DMOxQGVP4kvjr4RPWPMTIJIFK1PTlTURvRXP5IC4W4IElWs+ObqoOrTVf+RoIN+N9yejsyammWf57Th+nvAwDk3nklBpQUYG+TPiPTWKWzm9X+m8GjfFyhT6ORMOueqpig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tn5KAgwtKcmOlztbSoqTLPPKMHkZ3ybIsTAHVKRHq/w=;
 b=g8fzw0am61mldVPXwLkJAEOC5XKqIaQ6IXsZovptUYH5YmNVPSUDbbxctFBrbu9F3Z86oTIIcN/jg/yegAdOIQt85cuTG0vnjartR3h68AGrBDXWuyDTbBv5YqjnjodD9VEjGESUflkX+dgSyhN1ja/V6g6l9i+ogI49qUnUc81SMRjguvTSYBNaFnWclh2E1Ekc8mPowLjbcWZ3SqitwIQpWj1v/XXYGddb4/eITSCka/dLbnbaUys0SpzcvAc/+TvTvCYXJNZ6x5lpuykinNgXH/4UwSmoveHjZpUMojUmYXDH8cLStfxq2LKCYDEzCDF9/5odWKJiruVtfnruug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tn5KAgwtKcmOlztbSoqTLPPKMHkZ3ybIsTAHVKRHq/w=;
 b=h9jh3nnV6uQw5mdZgIbgnncSFXJrIdsfqLbmhXig3e30wLTWrJLop6qqhIgSVm42cTCI2edgn16pvK9NV16dERUXVQHVybakOaj1daFalThQOgjlbxjffVlAnqvAL+jiPxuJbaWQp7T+R1qvm97dTAm2311jtGd4dNYA01TXYhk=
Received: from DUZPR01CA0279.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::28) by PAWPR08MB10019.eurprd08.prod.outlook.com
 (2603:10a6:102:362::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 13:51:04 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::f3) by DUZPR01CA0279.outlook.office365.com
 (2603:10a6:10:4b9::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend
 Transport; Tue, 19 Nov 2024 13:51:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Tue, 19 Nov 2024 13:51:04 +0000
Received: ("Tessian outbound 23e15691b630:v490");
 Tue, 19 Nov 2024 13:51:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f77834ae871ff103
X-TessianGatewayMetadata: uH/16ZPFuhByq1r9y+oiiJXe256UDXSLXevqTtLJlHBHuwKC/m6mKsL6QB3qg/fxg4aRZIyMOUhbCdp3eul+/DKj1MSXOSg8WTehqVjuF/KBCeDQJzQdJhOxGGpyRC5iX061i2iohqam/GAO+jIjM/qDW+J1T046I+LybocpKOk=
X-CR-MTA-TID: 64aa7808
Received: from L075853caa71f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 02FA6DEA-E014-469B-9DF1-3F3C157F1463.1; 
 Tue, 19 Nov 2024 13:50:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L075853caa71f.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 19 Nov 2024 13:50:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4wk0OE2sq5i6o2s8CTWEcOrqbD9hWXnfY0ITPx1XjfRL9qALWVyTaBzj4/yCnows1JnaTDfMt/PGJkAwOuvy4u9p1u16tuokYhQhQNWddBOrhu+4x1c2FOe17P/nzKGKQPLLAw+6qzhTV5M03p10DJFuLDMelQNsJ44jQaDXfArrbksuOJMNf6wB7XwalkPHlMYST6Em6kWruamfRjgv0KAOI1GBNoQm3CKuvITCWYH3KbiL4agH71Yf8whsEtCdme5T/jV7vhQ/4ozIQqv80/rt2wwdHlCgTHqwrhOa6sSYF4RxQqDKvMROIGASYvPCPwtETKz4dwNjUdzMbinrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tn5KAgwtKcmOlztbSoqTLPPKMHkZ3ybIsTAHVKRHq/w=;
 b=EczfkY7Ry6M2ieUSOzBXcC8xUZ4ypmqXAeBNjJurp/sj5O8CVi3Yg4aly09BIU9JoB4WcAs/GfyjfG7TzoFG1jhj2WVNwg2r+EWGkllCJYTt4ALKgg7wft75P5G5L4YCpwn92aRRtYUp2jWHRIu8eRy9umPKHRKX/wHuGqdAgpMFAwZ/35wQUR8b0ZAE2cFkKgGStolYxZTGMSzv1VDNkyifud4OoZqapAxudcCt32kiwx9gxbocXwqIoJhG7Mgz0BdEhoyPgRAbXrYerJguu/cZg5btTS16cHX2KO+p6srlddTG4sFhJ23kpp+CSn4ToquIURBQ4vP7FPZF220I4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tn5KAgwtKcmOlztbSoqTLPPKMHkZ3ybIsTAHVKRHq/w=;
 b=h9jh3nnV6uQw5mdZgIbgnncSFXJrIdsfqLbmhXig3e30wLTWrJLop6qqhIgSVm42cTCI2edgn16pvK9NV16dERUXVQHVybakOaj1daFalThQOgjlbxjffVlAnqvAL+jiPxuJbaWQp7T+R1qvm97dTAm2311jtGd4dNYA01TXYhk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GVXPR08MB11183.eurprd08.prod.outlook.com
 (2603:10a6:150:1fc::16) by AS8PR08MB9313.eurprd08.prod.outlook.com
 (2603:10a6:20b:5a4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 13:50:49 +0000
Received: from GVXPR08MB11183.eurprd08.prod.outlook.com
 ([fe80::3bae:b721:e01e:9c90]) by GVXPR08MB11183.eurprd08.prod.outlook.com
 ([fe80::3bae:b721:e01e:9c90%7]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 13:50:48 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: boris.brezillon@collabora.com
Cc: nd@arm.com, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/panthor: Simplify FW fast reset path
Date: Tue, 19 Nov 2024 13:50:29 +0000
Message-Id: <20241119135030.3352939-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0304.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::28) To GVXPR08MB11183.eurprd08.prod.outlook.com
 (2603:10a6:150:1fc::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GVXPR08MB11183:EE_|AS8PR08MB9313:EE_|DB3PEPF0000885C:EE_|PAWPR08MB10019:EE_
X-MS-Office365-Filtering-Correlation-Id: 11c9c2db-46bc-41f5-f166-08dd08a135ec
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?zVOvw831ZHGwivLdN4HD2VZG1lWyYZkM5syPjrEq4u3XegRG2B8FDlH5EKXM?=
 =?us-ascii?Q?Yqvuh48BCtPpyq6NPOM7d8WYxB2E63dnG43dO/5aEvOImRsEALo85Cdu5KT+?=
 =?us-ascii?Q?dPvDK/GVn1fvBG4lme/Ljsj2A9j3LRwgsX2/OTYZJKhHdDvKiBOp9ca0wl9j?=
 =?us-ascii?Q?GlAjxvq4QiE70QGqT87Lnj+GLGZhMogN0pjiyM3GoJcakFuaLFiAiHJKOljO?=
 =?us-ascii?Q?pdfohs2WtHE/HQR/aUIuLhQ32TrSZ0fbe3rutwlM4SIH3LHx9I20NsgXw0oJ?=
 =?us-ascii?Q?EjclU84iwtRfIN+1ATVJCcjbG6P2mnVWiWs2OYlzsolyURvlYu9HLMoS360s?=
 =?us-ascii?Q?KHPkybQHfw70tiZmhw0IDqWXxSQZY5WrfSMSbMfhbAU/aLfxotxjUDrVvUzm?=
 =?us-ascii?Q?lRZaj/qokAk5LT16crX1kFmu0qcPPcrRhhmjmajSPqVY0U/FDcDZXEWiZ3gv?=
 =?us-ascii?Q?GFcGZeZJPhGu76KBacSFuvFH12DNNqrPEfzA9SvaWjvklbdQtia0lMhvtqfV?=
 =?us-ascii?Q?bXISd1ow2utegy5gEfNUKXZsreVvNmpmhopHtgFVYVioSM8lN6JqGVYdKOhu?=
 =?us-ascii?Q?sVe1gtWYB4KzfbgmQN56TqhfDRNVIhWM7cEuLvLzvVct1VqJJOEycdzC3dP3?=
 =?us-ascii?Q?lfOekmpihQM/AcnM9UVIB71WencmN/6g+bMZoREMO2KZAORr7kXprZU2Zrzc?=
 =?us-ascii?Q?SWaRP9xM3XNGn+DDEng7N8TXHHB5AgZGdgZAkKL3HF6RlyjOTNVamheoN3T/?=
 =?us-ascii?Q?62O7k0EyUjfBM8zfNu0A651T0GLQfgAOOM2445squB0wuMGwlyFGuA3p9q3/?=
 =?us-ascii?Q?hpetTSBo41Eg680bz10yunMLLTsOnXhTglmYvd4XljzBp+OJwuYs4WLGVfdq?=
 =?us-ascii?Q?LFNIX+BN/3Hz4OCUQhm9s5SE5OLyUEvfWSwybP5ZJBiIlxEgP5RTitBatHtl?=
 =?us-ascii?Q?3dKQSmobZHUWWWuIOFDIfDGXbobkpWbRX1TiY8di5sHMUoCTD6pVWtYsl6Nx?=
 =?us-ascii?Q?XKvjPbBVxXLMKtRtcNy4EyWe863vBOMkItrMInVWB7L/Sl3Ztg4tlL5+lvbS?=
 =?us-ascii?Q?Z4CSCyseay0WaMtHiGWkZDdw7FNn6mKuofFDnauJat6KOYp0wQBxjrlG4xuC?=
 =?us-ascii?Q?u6Ug+bJFOImLvobWuhubBqxTQ7MNb9n5r2CjpzQK6KZuWXQ9KxnNYPeFylSL?=
 =?us-ascii?Q?FN3dhRtTI/6jhfV2nGS8JGPrxuEFlH0UfLLj3Knrvwx+iCzApEWrNbJVRKDt?=
 =?us-ascii?Q?KWgrasN8Xrglup+zexbzB5JKhQE+c8N36eIY6t+/jInjkExhGlYm6V6xQxkl?=
 =?us-ascii?Q?Dd3SIGQ48+NuVc6YeTdXDZ/c?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:GVXPR08MB11183.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9313
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:1fc::16];
 domain=GVXPR08MB11183.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 79d51251-3248-4a99-4d38-08dd08a12c60
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|1800799024|376014|82310400026|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ga8pBpnCQqYHxmktkLIJ2QiauJNSgNT03yvrcmXWWO1yykbk3oZRYo0sFNiW?=
 =?us-ascii?Q?Dho8mqdQsUH5XfrqzKdYwubO74FT5rjdXOT2Tf+ZDk4KAvpIH90HWl9lE8zY?=
 =?us-ascii?Q?AgiY//jSP/pC3SpM0avIq8qtopr4RDXqI3hx/TOq6kgJBVhY9ekxXtoqnvLf?=
 =?us-ascii?Q?Tb5JREY7TxBjPno+k4sjH35gWIayZtMnDfYWCyoIvxzhpxzlFNAXt8759+lg?=
 =?us-ascii?Q?FH5Ih2sTDW+kTG9o8EbZqCVZB5lQS0jgRPBFjRCY35HiAI0khbjYmC6FyJdq?=
 =?us-ascii?Q?plZSV3NmVfzpW/wKq1qI40e5rCG8F5ThY0CSk2X2z+nO8kINrufYWI7Z3L/l?=
 =?us-ascii?Q?W3t7Dd1B3mw9rTPk1awPHFgw+KD4IhI6pkNTZKFXnTti/qj56zMxlZtPcmw1?=
 =?us-ascii?Q?baPXHwHMYIGWRjmVFDW+BRWQQ90Gnttsalj6yiPUoQcvDO/4h78p4htK32YG?=
 =?us-ascii?Q?3uzf4//xk79CWcNA7ROvPBvsVais30HdSh1fqM8lHriiRbIgKNPIhQ7S6Klc?=
 =?us-ascii?Q?8CZlb8Kh/dVI2qV7QLl40/R85pU/jkArsuMw6J9bm4FXBbjHSCVwlqPNjRq6?=
 =?us-ascii?Q?9a44S3L4xaLMllftngKx6FpEnFc3Vczv99po1QGX0msH16u7GI29Hvj3Dxzr?=
 =?us-ascii?Q?RTTg1einVR4ms8NEtzOjFWo9/GeqYmptZ29Zj36qGdnzOzgeb5k4MSyyutYY?=
 =?us-ascii?Q?ob9xEy0oitLVQUQav7/F7BAKPLlZbUMMbIZMMBCFV6RJh+wuy840oNADIwbI?=
 =?us-ascii?Q?u69/9AoRw199RKfkPT3cywRm7AoXTZwVZZApL4WKuoVOz98dxFVDnPBEWXCJ?=
 =?us-ascii?Q?LGyBPj/izzn9a4Sa5NOXCz9QoYTKHyhrMXTbiWnj7Ljntwo3xIdPD/bSNTt+?=
 =?us-ascii?Q?rBOyiEToGIr72j4TWAR6JCplOb3T4gQnJM99IL7Dzx001d3h76vaqm4mTDSz?=
 =?us-ascii?Q?lpGa5wIOPEZeIBbHHcRAcEiL+CeH+aM33+T9p+tsV8P0P511ndZgtwNA3ZYx?=
 =?us-ascii?Q?SSYWaMseYmJbZZ/7FhNOSTwqkOfXVD5e14N8DPy2J1R77zy5hWtzaitYJZa8?=
 =?us-ascii?Q?v7QRJOrybv3lqtbtdy+83cVnGtOb4RH6mPEuuSH4F7UdbETqIw9R6IxHhrY8?=
 =?us-ascii?Q?INx+7lEVJYAKZoX4GMq10cySIsJzTT8jQStie8t824sOU5zlGR0/64eaWy1A?=
 =?us-ascii?Q?rJm5qcMU3Dp8kZv0A7dAW52iYJUkoJ4RzlGLf/bRvqNXdB5/K7n5lKsNdkcp?=
 =?us-ascii?Q?qblsu8RfWv3TRcNyejnH4hWzLOBTAXDAC5aKaQmhxlGlqgEL+JE2RkKoPDxx?=
 =?us-ascii?Q?fwBsFWpck8qpIVWg+0ykfO8u4OR3JxZ5KAoL7ilgbvHDMZ1VYTLH0yXBqKib?=
 =?us-ascii?Q?xGyqnPzjSNBBD1D5tBx2loNvbvy1FpXQyDcwRKtfl9DdfCruFQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(14060799003)(1800799024)(376014)(82310400026)(35042699022)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 13:51:04.3331 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c9c2db-46bc-41f5-f166-08dd08a135ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10019
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

Stop checking the FW halt_status as MCU_STATUS should be sufficient.
This should make the check for successful FW halt and subsequently
setting fast_reset to true more robust.

We should also clear GLB_REQ.GLB_HALT bit only on post-reset prior
to starting the FW and only if we're doing a fast reset, because
the slow reset will re-initialize all FW sections, including the
global interface.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v2:
- clarify comments and commit message with regards to when to clear the
  GLB_HALT flag.

 drivers/gpu/drm/panthor/panthor_fw.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index ecca5565ce41..4bc52b1b1a28 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1098,17 +1098,11 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
 		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
 		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
 		if (!readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
-					status == MCU_STATUS_HALT, 10, 100000) &&
-		    glb_iface->output->halt_status == PANTHOR_FW_HALT_OK) {
+					status == MCU_STATUS_HALT, 10, 100000)) {
 			ptdev->fw->fast_reset = true;
 		} else {
 			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
 		}
-
-		/* The FW detects 0 -> 1 transitions. Make sure we reset
-		 * the HALT bit before the FW is rebooted.
-		 */
-		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
 	}
 
 	panthor_job_irq_suspend(&ptdev->fw->irq);
@@ -1134,6 +1128,13 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
 	 * the FW sections. If it fails, go for a full reset.
 	 */
 	if (ptdev->fw->fast_reset) {
+		/* The FW detects 0 -> 1 transitions. Make sure we reset
+		 * the HALT bit before the FW is rebooted.
+		 * This is not needed on a slow reset because FW sections are
+		 * re-initialized.
+		 */
+		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
+
 		ret = panthor_fw_start(ptdev);
 		if (!ret)
 			goto out;
-- 
2.25.1

