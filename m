Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DF5A6A4BB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE81210E5F2;
	Thu, 20 Mar 2025 11:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Q2ofoScg";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Q2ofoScg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013042.outbound.protection.outlook.com [40.107.159.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A3B10E5EF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 11:18:19 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HU51fbheF5TZ7xjKYrgSvFxijtmlrJQ4dWu5Nc8YlQZy8NkNh3/kP3IYMrNptvvP49i/ndC7jG2sL8EVlri1r0yJ0MQvn7UXXsTsxe55rsT0s73oMq2/z/R40fLQjcF55J/2A6NmugpRjnkg4c0SemsMcGQVD2yDDbX1XMuRW7KOm7MWbwCQSQtLMS0RIBNDwM8cOiguVyWxSy2pN5duvJyhqsg2R9V5w6XZvMiCkCmxIV/rEaPZmm3NuCv+wHGz7SdgNbA+jktjJf6xgxYasN9Z7aboFaDvLBpV6fDf2dCf1St/W5+3tcdJc+v5mdi28qzFoummrXQnTLKKP6xyYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5d4xgZ9tgZU2DQVZMu/08PNjeC6+iQchEjmRLDLoQo=;
 b=Bso15be2OiASqsVKON0bhDJHJOSpjFcaMaRHfvFx27Ek49A4YxTfF3ygrbtjlfbqg8FOQNpVpAKVoYOurQ0gpd11R+g8KR48wdalWzGRY7+dbvZ53cpLVu6Kr5hSd00J06/wk4R2Xv45JpLb3vmeGn3SP2h8Zdvp9Mg6ATp0SG8kjms9F1mc0v8NXexxd+eA7ozDUogqwvpL1AHx1wmuh0NQ6cRUCImL6qOHLcfw8HwvOI5GxqDcdcwyK6x67VBGnO62Z7dUdK//Kp+o1RfFQ/ZG9pQzVQEva7ZfhrYXLe5ujOqVaWFOHhhqreiNO6m+N1AWfMTnAxXIyCBFDOzcTg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5d4xgZ9tgZU2DQVZMu/08PNjeC6+iQchEjmRLDLoQo=;
 b=Q2ofoScg6QXTadgz7c+PdigV9tqSpayj93uaPmtXddioLVHs4saX7Q/7IjdAobGDRi/JbTFhVnpUlERVRbCZZ2FOhmqNMpDmtfgLYcf6T6Sq4L1RuT7WuBIXt6RpMwBWoxCI1DSgCZsjcgWObbwKjVUe/o9FKV8xzCwbT/Bn8jk=
Received: from PAZP264CA0012.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:21::17)
 by AS8PR08MB9454.eurprd08.prod.outlook.com (2603:10a6:20b:5ee::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 11:18:13 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:102:21:cafe::11) by PAZP264CA0012.outlook.office365.com
 (2603:10a6:102:21::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.36 via Frontend Transport; Thu,
 20 Mar 2025 11:18:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 20 Mar 2025 11:18:13 +0000
Received: ("Tessian outbound c7a7213353f4:v597");
 Thu, 20 Mar 2025 11:18:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6a5690335aeb3d42
X-TessianGatewayMetadata: FftYgYQ610SD7twKB3aH/5Ze2B9VPifnV3aLLfyH5anAAJLo+BkM/RY0tSZxBjSjQRuDN+h5MIKUMahayRTG+R6RZmNSxUCtFSDiR2Sc5KCVl2+TFTNhpIefA2yjwNYcx8iyEXJuM/2lJnz4OLl3OOofJmU1I0RwtfenwpLCo2k=
X-CR-MTA-TID: 64aa7808
Received: from L60ef98af60d8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 461810E7-A79D-4819-B7C3-9F90DFE28AB8.1; 
 Thu, 20 Mar 2025 11:18:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L60ef98af60d8.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Mar 2025 11:18:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8mifUGJW4f5YLke0P1TDRY46l8BrKeqb9GtY3V0utAz41QxXXaEfC9d/sTwWER1pkZWzKK+/XlSPMWH4yFYjbdW2dGGALSDKxQVN6A1BTCL0N/P7rRZ9R/zmcJOKG0dhy7yYjDsekArauy7So1sxb1LXA9BPKrG60aZqrBxi5rQxiv40CF7jWcVoKWmRydIlTNH3WTmSFsnU6WKVkl9Na9k/vAkHn+j29EjGykv9pxwMkynSTDL2AFPA2/wGKJBAe7yRHJZG27PjNprPz6WKHUrH9VV0tlbYRUkXiUisjNGmIR8oOLlkcapqFQJQZNMV9qTB1CPunRXfe5qJlQxFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5d4xgZ9tgZU2DQVZMu/08PNjeC6+iQchEjmRLDLoQo=;
 b=JiZPumzeivsV8e8HiABs13R8NrzDcl0TIfxpipMP9QCQz0dixTTL0EvfLoQI5BJmkD1sY28E+MCbw09PhlZV8WBd22CutxOGO58518FyLc9HYikYAkeEpvjm3QTjTrQVzX+rUnBGqCHaZd0iQfGQHlrUtxIqGeotTNtSizgpdfPbMktllJQZT/KspJOHiTlXMdTGS0enBTY5d+IqDk2b8uNGBJND7fevT/3bCHZmhWYEhtWLLKm+mCdMi+yEMBZVKyQakRetxeOM4KgTcYGvLmtuVXQk/hF978kOxLmXW1pKFY/00GQqYwncEX5FqjPpYozyVVq2XMm6EOYLa68BYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5d4xgZ9tgZU2DQVZMu/08PNjeC6+iQchEjmRLDLoQo=;
 b=Q2ofoScg6QXTadgz7c+PdigV9tqSpayj93uaPmtXddioLVHs4saX7Q/7IjdAobGDRi/JbTFhVnpUlERVRbCZZ2FOhmqNMpDmtfgLYcf6T6Sq4L1RuT7WuBIXt6RpMwBWoxCI1DSgCZsjcgWObbwKjVUe/o9FKV8xzCwbT/Bn8jk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB9193.eurprd08.prod.outlook.com
 (2603:10a6:20b:57d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 11:18:02 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 11:18:02 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] drm/panthor: Support GPU_CONTROL cache flush based on
 feature bit
Date: Thu, 20 Mar 2025 11:17:39 +0000
Message-ID: <20250320111741.1937892-8-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250320111741.1937892-1-karunika.choo@arm.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0475.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::31) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB9193:EE_|AMS0EPF00000194:EE_|AS8PR08MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: 1617b591-a6e0-4911-3802-08dd67a0e787
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?JoDXSJa7VtIx3lbYaDRX43hC7bQOQCgh1jVahmxUGXj62fhHCplS3YdhPphB?=
 =?us-ascii?Q?H9xKAycHxfw1JegNxg3a7x72BCTbqmhexAh8PbLODXecu0LAh1ZPvTnFQ49e?=
 =?us-ascii?Q?p6Tf+yeE0vkQmNLK2Ue0vqYAvTprn233omf7rwQBDXZjPd+wwsUhXi1IZVP7?=
 =?us-ascii?Q?BnBHY6t+lCLfH+fJUpCju93xwf9NS5+eunI9tbGVFC9BxwHMlFFgi6WAwlnB?=
 =?us-ascii?Q?YFo/6cK31PDskeYO2SP+ybOcyOzTK+SD1LlbzKV54LInEcpCBdqHm1YLIbk6?=
 =?us-ascii?Q?46RjQG2G60dhP7IVnF6lIeZV8lHedBzJEiLmcKzbalr6nAII/fsMNR3vG+Ql?=
 =?us-ascii?Q?IQKr5jto1fAz4RvJkD54gPEH2LS290T8OdM9B8HrxkjomS8Vsx1kc/OmbUc8?=
 =?us-ascii?Q?129wM+vNDeLkTvRF4WS5++9trdSkIRe82U2rwyreujslAhG0F3ulqbnEhXXY?=
 =?us-ascii?Q?gpzJydmXDEDaUAP0R0eKWcNo0vQPwafiCDmNWWYwG+BqM2dSZLihF2TAHKyR?=
 =?us-ascii?Q?57a79/M4gQvPQOR57qa5TI4Wttcm205mZCXLXiSJq2UM7YygrsdPS4eBHL6U?=
 =?us-ascii?Q?1ugUWqNgLx4xV1/ivhvm4V8+FiNmSDd4smBUPdz0vgrnLYwGzCYd97Ms0VS8?=
 =?us-ascii?Q?rZTfWO0zyzfJJqzq3m3jO6iISTMth2Q4QD3k9COU1N4kohsoDiPnaLPAsik8?=
 =?us-ascii?Q?RKVno1xuFQzqV8W42khW7C0GbTwC8uzpIYU9MwDAHzYPc2L8NVf13TwlN/z9?=
 =?us-ascii?Q?lNUmDIonHnHqOYNZHfQPQG81LMfx7qUTHEWUSQRXcIRYb725HtPqasQnnefn?=
 =?us-ascii?Q?UAQnoVmSQaeIFnRZIh9OxqM36KZz1GUfR4JlSZO8H5NDrjE0knGyrMX3MCTS?=
 =?us-ascii?Q?MilD6DcfiRuoUO0PzgwAzlUMv6OXJdJVxB9Xwf8YT6Z7Frkv9mj4xqIO09B0?=
 =?us-ascii?Q?WT8DAvs2Z4lO2IBdH1Zmir+UgyqG9AM2xS7SqNdHdIJBe0lGv2mIA52V1dI8?=
 =?us-ascii?Q?HeXXW+AivtS82/AXxk6+Rp7XuuCYnmUyS6ogdEOElyFwn+uin9p003Q+jeiT?=
 =?us-ascii?Q?ifxscW2fEbGSlbhyFGfm6EH2c+xeFU/WBgEBCokWFpu2imr4YflzyY29FSsm?=
 =?us-ascii?Q?l5yjpSr6nrYDD1W5DtT7JJidDWoi3QNi0QrXnNAs0zZJifJaasyZTNuaPrMD?=
 =?us-ascii?Q?YxENCVzv3cVjcICEjub6gU/G0Dtn5KImfsv62GFsW2UFkASTcAJYFlyX4Oz9?=
 =?us-ascii?Q?RBW5qQfMS0rkfT0lrIHw3Rics+sC1WYIA7ZCUOKzoDFZ8ltQBzmGYTDjuKez?=
 =?us-ascii?Q?j3urdvxXLiSPee8Pb2dGAqtY1xgDDV5XUQf8mFkm6ujL6gn+CMzuw5CG5afp?=
 =?us-ascii?Q?JS0fuPWVzB2JX8NqRFrZg/8LjZPE?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9193
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 20fd3207-f844-4527-a828-08dd67a0e0de
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|14060799003|36860700013|35042699022|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yuNWuzpCo4ot7MmN9SDYsv0KmevHixcU5GKxxrIAI1dkzAues6sRwl8Fdzth?=
 =?us-ascii?Q?SkwdZs8MJItc9uyLdmoZ7WO6aC2W9NP3OJrCBSJHy8JpSp5Lr5Xg3h1BABg8?=
 =?us-ascii?Q?rjL8KqAZw4drrxEh226QJJcwA4qZUDuAaYNQunAzCb+qx5yJOgV5/2+oDoXW?=
 =?us-ascii?Q?Pvy74QjFWm+v3Mg+xIKRdIqC/vi9gGk4Ru/X5/x8cpEdCeV80nD56+8tWjYE?=
 =?us-ascii?Q?r34kfWyNy/zvqUAP/6GSBfOmRSqBlevhMzfODq5NqpT0c8JkCpOeFsdoRpxB?=
 =?us-ascii?Q?HY0bziUG3bhnH760V2A6Zgdk6JrjD4al1UyLEtUk72fvUnfNmdbkGyTbggBJ?=
 =?us-ascii?Q?WAgMknm3A2ssFzJnZDdZp+CF+hpkhhg7QSVvPguCThD02fK9eB3vzqv1FEow?=
 =?us-ascii?Q?niW6Mm7N514kpmtMukC5XZ7ttnKTGF0RbgcgGJ8QpBSaMKSXra0TjBDot1w3?=
 =?us-ascii?Q?/NVGi/vSiK0uJwe0dVPmNCGA9LPBS7IBWe7sUCBKYbmQEsRoXjAZaCm/C8A6?=
 =?us-ascii?Q?/6G8l0ccoAL11k5+IQVRTGFpBxqboyhHrdyosxvbPQUrQm+JVwrFzk3Wqfak?=
 =?us-ascii?Q?5qN1hYMD8/I2dXNe9+oXz1zM6HdV3IjvKUcF0QuUpizWxRA0qCvtp98uIeA9?=
 =?us-ascii?Q?UqNPdNyMuslbL0qp6kjBkr/aRej/kaFmSJmmCH2nESetGqZ5CmgCqYUMYbnF?=
 =?us-ascii?Q?ZTc1N02qzhAEH8/UaXZ/cYrGJm+TaTB1W0HFTsfVuHkNRSWbtsy0odtqqlI0?=
 =?us-ascii?Q?lQK2fpyFRh4rHn0lEbAoSY0OzOEu4JPiWx2mioN3u7mpxWomh6hHI1soLcge?=
 =?us-ascii?Q?00f/ndQWLeQ5h7M/1rG03VFGQws30QS90SvtqBaNlmiZL4u0rqMRnru3yDfV?=
 =?us-ascii?Q?c/qlTS1gMDtaOeWhQV5Ys/Pw9jhvjzqszBZMVVZMz9keYqmtX96XibQgRBz+?=
 =?us-ascii?Q?gmy5XckWKCZnF96zKKpZ3+8Pnjkm5LfMzyjP/NX+nCgTqADUFIfYtltRvtdu?=
 =?us-ascii?Q?RkaaOjbS6lMhNSOVnuX9S6F2Ygz81m8cKnOwxYzkXz2ivTpjBIIy1h1fQQfC?=
 =?us-ascii?Q?puwO41ov+eI3OQ8Tc3+NkROg18rkvsHrCEAYyDQGYfV8d9c6sLdrkZtWbpvR?=
 =?us-ascii?Q?ZkQFHYcNUQ3sXrsFI/x7GYmY/45OH7Qt82l8qV0DGyg3+RledAerYiYIL3vD?=
 =?us-ascii?Q?uFiI9GnMjKhK6+hhMidE/wBw51HVLBiG5McclBU0qO/ACm9H05xQKP+eGz3H?=
 =?us-ascii?Q?B/5q+r9HdyqJw1D9RBaavNJ7RJnGaWgxatahp/OxhFtLKk36r+fuu0nqfLOm?=
 =?us-ascii?Q?cotbSLhijGY/OyRMvH2m/E6JTuDxgKhntU1lSNIq9zVEVLHHO3LEZDJD7WFg?=
 =?us-ascii?Q?3hz6h8tvAa03LhChhlUAVxJsZdUnZxFgyEejFdhBOQ2Ib7X7H7nJLg/7kf5O?=
 =?us-ascii?Q?VeJh/vyuR+3gx89Nxr8+EEFy/7fXkELp0SOyQyE7PoSGnBtTgae9iTjxxRC2?=
 =?us-ascii?Q?DLFKDXnPi8LhWIk=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(82310400026)(14060799003)(36860700013)(35042699022)(376014)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 11:18:13.1586 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1617b591-a6e0-4911-3802-08dd67a0e787
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9454
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

As the FLUSH_MEM and FLUSH_PT commands are deprecated in GPUs from
Mali-G720 onwards, this patch adds support for performing cache
maintenance via the FLUSH_CACHES command in GPU_CONTROL, in place of
FLUSH_MEM and FLUSH_PT based on PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH
feature bit.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_hw.h  |  6 +++++
 drivers/gpu/drm/panthor/panthor_mmu.c | 35 +++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index dfe0f86c5d76..4d67fdfe86f9 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -16,6 +16,12 @@ struct panthor_device;
  * New feature flags will be added with support for newer GPU architectures.
  */
 enum panthor_hw_feature {
+	/**
+	 * @PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH: Perform cache maintenance
+	 * via GPU_CONTROL.
+	 */
+	PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH,
+
 	/** @PANTHOR_HW_FEATURES_END: Must be last. */
 	PANTHOR_HW_FEATURES_END
 };
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index a0a79f19bdea..4ac8bf36177e 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -29,7 +29,9 @@
 
 #include "panthor_device.h"
 #include "panthor_gem.h"
+#include "panthor_gpu.h"
 #include "panthor_heap.h"
+#include "panthor_hw.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
@@ -568,6 +570,35 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
+static int mmu_hw_do_flush_on_gpu_ctrl(struct panthor_device *ptdev, int as_nr,
+				       u32 op)
+{
+	const u32 l2_flush_op = CACHE_CLEAN | CACHE_INV;
+	u32 lsc_flush_op = 0;
+	int ret;
+
+	if (op == AS_COMMAND_FLUSH_MEM)
+		lsc_flush_op = CACHE_CLEAN | CACHE_INV;
+
+	ret = wait_ready(ptdev, as_nr);
+	if (ret)
+		return ret;
+
+	ret = panthor_gpu_flush_caches(ptdev, l2_flush_op, lsc_flush_op, 0);
+	if (ret)
+		return ret;
+
+	/*
+	 * Explicitly unlock the region as the AS is not unlocked automatically
+	 * at the end of the GPU_CONTROL cache flush command, unlike
+	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
+	 */
+	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
+
+	/* Wait for the unlock command to complete */
+	return wait_ready(ptdev, as_nr);
+}
+
 static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 				      u64 iova, u64 size, u32 op)
 {
@@ -585,6 +616,10 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	if (op != AS_COMMAND_UNLOCK)
 		lock_region(ptdev, as_nr, iova, size);
 
+	if (panthor_hw_supports(ptdev,PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH))
+		if (op == AS_COMMAND_FLUSH_MEM || op == AS_COMMAND_FLUSH_PT)
+			return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);
+
 	/* Run the MMU operation */
 	write_cmd(ptdev, as_nr, op);
 
-- 
2.47.1

