Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3831BA182B2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 18:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72ACE10E1AC;
	Tue, 21 Jan 2025 17:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="C3EJ9BYI";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="C3EJ9BYI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2045.outbound.protection.outlook.com [40.107.22.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA09310E1AC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 17:18:45 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=m9pNMIBKQYd5ctrkivki8/l58jFmS3Klei/HeoYnt1vUAC+le+7KyNJL9ZT8g4gsCgG+MSxB2MNE1PLjr+JF1AmCaHcBEbvsKnTuKvqwD/ZY/qWovOAaTk0gk9a3DzBqnQNKja1qpXIkCr/BL2KD6V3+kA++pI6H0C6YFbpO28T5NOs+5gJ9kEgbiUmqE/+Lal3JR7r1JQJqZqJcsVsErq3SR/RevFpym3zWEGZvrR+Wc2AezX6Q+d+Y0Wn/dETrHcgNYakTesKv+wF3Fl8nVUrHo4JVCQh3Bk390bgRaS4q79IuwHKf/TlInuABj6VkEGNmbuw/seppM9BL5VckQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xLL2EmQBrxT6GqXW4tWEVD+e4YeZUot2UHJVn+PGpU=;
 b=SfdEMhMan5MaViZ7JxfTg47HnSfs8bjHpaYR9UCsxnxsQDP3tFCGr4DGvkAAHMVcc/O04l4kwyiagoQQ7sYukA369OuGiwD1RlYkdEOgnkIVcD5FfwkQFILQhL4OFi9WU4xvU3lfAkbYSMgwyvvSPpayTSGq0ULsAyWLLWzxVQ+Tc2NZw/VWdpez9flaMYd1VJAmU3tuuCe5GUCbX7JXJMKRRdUEKo6lJleEFWJ8n3CpiCzTsEijEqcrkWeIcnASZ8uxSBrBmymAePkDvaT0tkByqAUda0lY84X/QlXYskUcBaAlIJaZJwGxyfjCiYcYGsOWK1izdCyqXJmCAgraog==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=0
 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xLL2EmQBrxT6GqXW4tWEVD+e4YeZUot2UHJVn+PGpU=;
 b=C3EJ9BYIdNu9Gj245+Qy2R3rDjjnzS5DMcKp64+kWULmwkGIMg0P7OeXKTjEw3E5a5Drds6iCqddDwgCTfa6jpqXYoUK6+yNlLop+I4JRyFoQt8lPch1Ks1+SD6adB12blGpdbqrhOHHZ7CDspx0J1zuQyUr3WecLf+pE6QYfgY=
Received: from DUZP191CA0032.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::10)
 by GV1PR08MB8474.eurprd08.prod.outlook.com (2603:10a6:150:82::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 17:18:21 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::fc) by DUZP191CA0032.outlook.office365.com
 (2603:10a6:10:4f8::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Tue,
 21 Jan 2025 17:18:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.8
 via Frontend Transport; Tue, 21 Jan 2025 17:18:20 +0000
Received: ("Tessian outbound ce9952b4db27:v543");
 Tue, 21 Jan 2025 17:18:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 20e2b8d3f66012f6
X-TessianGatewayMetadata: GhnwqV6mF6VtvmkI4pTLrtNcSO9Y7gbHB8P6jaQtMM1MaXlH2Eyrd2f4ZYHCUCA4W6mOciz9OZwty26lEVIdZ+ZtSp+1pN5EaRJ+9oMb/k+SBdi/Xoag9hzkx0fQlqOZTvn5UZRLoIR1j1vQ4gVktBqKtg5V6yjsSxmvkCGfJ58=
X-CR-MTA-TID: 64aa7808
Received: from L460432f2f101.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A3EA9E80-580E-4C26-AF20-9EA3A7808F7A.1; 
 Tue, 21 Jan 2025 17:18:04 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L460432f2f101.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 21 Jan 2025 17:18:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJ34DHDAls06NKY32TFa9h6gYamLikUDJrzuqlRQvj/2pmWmY3cnz8kfaidFe5oqmTw50Uw5eoJ2F/DIUUUT9Zj5NhNJ6P8oZsSLp0H8v/L6/h3wHmGEPlCj+KUZ0Az3/kMabL9nuE3KayJv+iFlf90be6OehPTpHHunqVKhr4AU/IpPzFhycGkdakwptgWVODIimOHcTgGF4cePRX3sa1F5S0nu3iTGMfdIklpJ3RY/aQaDhvCIaRsM1CSyPOYZtd/ezEDVra5Wr5BNCcyCR3pSwewys+bF5vs64god4drIwubleHcZhOHWR6AGbNb+pD9OBVIf23kpiLeke7NKZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xLL2EmQBrxT6GqXW4tWEVD+e4YeZUot2UHJVn+PGpU=;
 b=Um9WU6IhJiVKzQZXxDwz1ypC/2RYcrI0XZER4yjVDdGjJQiR1pwxB9fd+lnAsjgEJH+u9Q+HKSQ+WFWIZQU0UiuTDZyIlITnid5dW6LBefjSkPGxZy5dnUnKsrHGe8oCOzglwH0iHIzcv0xUq+3qKFScujk5YGPtCN1aDEKrryKQM9K4dfrAeMry44sFWoqlMd6xaYM766/RTArl16DXieRAGCFCEx98IcnEbes6WT+4cl1/ahjmp7Lj4kfLNfGLQj4msJCuhI1W33KpS2jHs/WyobwFSiaAD3lWt8MyM3BzjyOkjn0RVQf7x9X8F34O3dCw39BAqCF5GcBXerXHAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 172.205.89.229) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=arm.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=arm.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xLL2EmQBrxT6GqXW4tWEVD+e4YeZUot2UHJVn+PGpU=;
 b=C3EJ9BYIdNu9Gj245+Qy2R3rDjjnzS5DMcKp64+kWULmwkGIMg0P7OeXKTjEw3E5a5Drds6iCqddDwgCTfa6jpqXYoUK6+yNlLop+I4JRyFoQt8lPch1Ks1+SD6adB12blGpdbqrhOHHZ7CDspx0J1zuQyUr3WecLf+pE6QYfgY=
Received: from DB8PR09CA0019.eurprd09.prod.outlook.com (2603:10a6:10:a0::32)
 by AS2PR08MB9812.eurprd08.prod.outlook.com (2603:10a6:20b:603::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 17:17:59 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:a0:cafe::5d) by DB8PR09CA0019.outlook.office365.com
 (2603:10a6:10:a0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Tue,
 21 Jan 2025 17:17:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 172.205.89.229 as permitted sender)
 receiver=protection.outlook.com; client-ip=172.205.89.229;
 helo=nebula.arm.com;
Received: from nebula.arm.com (172.205.89.229) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Tue, 21 Jan 2025 17:17:59 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX05.Arm.com
 (10.240.25.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Jan
 2025 17:17:58 +0000
Received: from AZ-NEU-EX05.Arm.com (10.240.25.133) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Jan
 2025 17:17:57 +0000
Received: from e122338.kfn.arm.com (10.50.2.57) by mail.arm.com
 (10.240.25.133) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 21 Jan 2025 17:17:56 +0000
From: Yulia Garbovich <yulia.garbovich@arm.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>
CC: <liviu.dudau@arm.com>, <yulia.garbovich@arm.com>, <nir.ekhauz@arm.com>,
 <rosen.zhelev@arm.com>
Subject: [PATCH v2] drm: drm_fourcc: adding 10/12/14 bit formats
Date: Tue, 21 Jan 2025 19:17:53 +0200
Message-ID: <20250121171753.1544206-1-yulia.garbovich@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DD:EE_|AS2PR08MB9812:EE_|DU2PEPF00028D01:EE_|GV1PR08MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: 83b014c3-2b37-4872-46d9-08dd3a3f9a83
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?XUdAjlYRz1VhNNzFPyhMrRxP0ePbkqcqxzoh/8JxKSPZkQZ1CsyFyUlwyJc7?=
 =?us-ascii?Q?vW5N1aX4Ha3UAflFOQCIAAI8zPSRaarR9XDrvz7Dbw+c+2N1EzAHZctaJWct?=
 =?us-ascii?Q?Z9bY7L7wxjvHHQ8YJ8FHYJ1j5vP8Q4j5hOG+230Zf1VswcFAx6xq3LSXeUep?=
 =?us-ascii?Q?xMH38pEh7nq68V1TRSjH2Htnf+r3tpVJ7Fy8I/0iQRLE6O0fWI3n8Q2T5G82?=
 =?us-ascii?Q?iBuv3uI1+pF9bvKe5f6gIn6NdYd7yDlp3QAvlI9w1P2EHlMEmzKFIJpFIjgp?=
 =?us-ascii?Q?WOMqrdaXTPLifwv5KwbyJU1mHxNhYRDvuE0jeKO2VoBZqCZo5GQ+43NOtP7j?=
 =?us-ascii?Q?IwxtLaj8hIbSNkbnNZe6OTOKA9N0LkGL3c3QJNuoroYlvAEj37JUaiVZyWxY?=
 =?us-ascii?Q?oMgBTkndsVQM74jMN4t2XcdY7D5vyWFCBV39Bsmd2qaMg5me1Zu78NpxJCrj?=
 =?us-ascii?Q?eSPsXaCxhIEB/3ir01rQfZZx0O68/64PXsuh2nCN/f43XA0lpOSk1DjJ6ht8?=
 =?us-ascii?Q?EO8JLL5xEjVoyX2Oqi7Hp8CRAIsf2wR0eGIUvtuQtZ02b3PD9J6EaNdyU7zv?=
 =?us-ascii?Q?Spg4k/Jwap9DAOljF3G42QWa7NdzJu2aw/Idhh8ZPDoxUKQVdBN2oHF33Eq2?=
 =?us-ascii?Q?qib3iH1T6ex8cYo3Pub+kg+Qt+0/viXoa7gS9dcf3Scwz28oc0zGuyI37Q2l?=
 =?us-ascii?Q?pP4SxvuNyNbb00BLkFcwHwF40AQGD8O1cnxKEGAM2zLsNylVqaho8H+XpEw+?=
 =?us-ascii?Q?ufJZr8sHp4zUEQbbs9T9Q/MrnRNzuY/625ppMhRn2XWVfZxxrv6hKAOcwKWJ?=
 =?us-ascii?Q?j7mWQua/RGzdpmGVLOXDQajCuJV7B/2LD2Om4JGgZFYDZzwRDOB4w4n5qFrx?=
 =?us-ascii?Q?QLMUkxt1uXFl7djb8j7T2H3VL837HaqXTiaSHg65FBQv2689wa9y+l3CBXNU?=
 =?us-ascii?Q?WEY2xIXGaX5cZnsZ7h4X1rhKaK7LF/Kc4WdBmLU1qcrT1cTtLZ3WiJXBXH7/?=
 =?us-ascii?Q?YmbzYqYD1WX7MQ5l2MUg82iMgLEXwJoxD0PAqWnB1wwyo9cUG1j886VCGJdG?=
 =?us-ascii?Q?Xiu4VdlMazfQEuBsNIJUQsWAs5he8nzSk7HRAuOjhGHUfMnOzIMWX/xPbEqv?=
 =?us-ascii?Q?H39f98DuGfDVzUAAkFwT0uNz8N7wVRrsQclsLJyDLJePUclpBd6fzFelXYDU?=
 =?us-ascii?Q?PlQbCb/mim60vqGWN0XA2KCztZIWU1J3FmikrmTiZ/ak69y2v9BXjCnoqLkX?=
 =?us-ascii?Q?gLk2tnqIw4M7bY3U3FGNTCuT2Ieu9Mo3Pl3argAI3/6qTLylPFyxXwsdMyVK?=
 =?us-ascii?Q?G/JAs50Xe4U+gXpVUCFEKU8vBDabC2f4lZyAP+yn6YV7B/oDIq81F7MR4tkl?=
 =?us-ascii?Q?LomQwJvuU+L49KHoH+S6DIPCVAteoKZWBDNT2Nvha8BZxwV28hEqi5RLYG9f?=
 =?us-ascii?Q?xzPbRy84iUWQKzIzF679sbta6IEkR+c+QkbSg7Eeb/yVFE+OkWmFoIaMPVBq?=
 =?us-ascii?Q?GpffWTMhUWiBYhM=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:172.205.89.229; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE; SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9812
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:a0::32];
 domain=DB8PR09CA0019.eurprd09.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 006bd8fe-5b95-4c45-f4f8-08dd3a3f8da8
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|1800799024|36860700013|376014|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TqwUH+g9AK14pSJ1QdmO/lEt0gXwre64VQkRVmD1thNZfLNQSYi6vNujVyyc?=
 =?us-ascii?Q?iKzDf27OxNEElwP5rMPYJsYy46P3F6FI44czerShtz+wHgwZ+DilO7HPL9vA?=
 =?us-ascii?Q?GvjDYuvOGVXjeouoZC8gX8BKaR7TBcssB25OMxVp8OFONLLbb/4SA1xm3y6+?=
 =?us-ascii?Q?Q0SGzokSbJP/aPAE9AcN5rsmSIz8vrooejmyiZX/AMvndZ2/NLcZxCfSfh/P?=
 =?us-ascii?Q?U095864ULCZk94gEhHhuRgDy6zO4JlGynxmp3Bs35VkmKSOBqg/cDyAGCrz6?=
 =?us-ascii?Q?AHsgmYNArffrif6euIiqJdj2WKdrinBKs9dITdqTRMwG7UIuNizUmTKQ1S5Z?=
 =?us-ascii?Q?ae9k2dQ1cqweOnBjCZYhvoCyQ2ggDv2lCI6TeziaI+CoApB7mksK6TcEbQmR?=
 =?us-ascii?Q?Se1KM1npDeOnfc7jQ3M85WIMD5SfdWriUZw8sppx5q4Fzid5P/rU/bLohwHm?=
 =?us-ascii?Q?vzgskRRgF5dbW+UZ2tf2H0GATOGWUAWSpQWJwOywVK1WJzVwewtBPGV6Vhxb?=
 =?us-ascii?Q?Fwz7NpA9dRJVReqH4fiei4G62D9w89D8x7Oy+5+Gg46OEDsTx9VkmQT1RjRJ?=
 =?us-ascii?Q?3dbofB2og50kUv49tAEmth4h+2i+sAxGY04OWpJnVs45EwiEYXYID34DWLOp?=
 =?us-ascii?Q?Jl0dAIGMEfYpjMs2EZNLXwPG1G/vJdqOI4e5axGYelovxe+E0sFJq8EB502S?=
 =?us-ascii?Q?pAocX4ehxzx7mqRkqCRwaBPARW53THeUEbaXX3uwMLG0nvucCKYxulLxp5vg?=
 =?us-ascii?Q?FgUNuJBA9r2UIhqHbY9ck+XFO9eLta3F+1CmY5YYeIfWCp1QItE5BBxzuJIe?=
 =?us-ascii?Q?iUn4HezAZJdaA/+hedtgfYJ+cZkJVM6Sb2xCKZHFB+8csC5XmEk1aO5cAvYn?=
 =?us-ascii?Q?nD23eTkzj4LhN2vRhn5A47bBZxVZhZOXZOx4KP777a7/HS7DgkQ2y4pnGh+W?=
 =?us-ascii?Q?wkz/5ynq7N+OFk9N49KA/1T+1xx1PxEdgI/2PITOjPZSa/98Moc6gvc6SFUl?=
 =?us-ascii?Q?XQY25Ejw2Zi58IbQYv+cVsKo9+Jp40wMeiRvR6T8nnI1d/4RI6l/m5X5LTQf?=
 =?us-ascii?Q?K0Lm46A9Ar3ikIXLtEkcj87nXE7+TMCPLawT1R5mRsp7KAqaKwDSKFG5GwD/?=
 =?us-ascii?Q?fIG00cZelLaLYG9Sml4//+eVrYegn3drVAZiJqde9SZUz71dAr8QJnqVRxAb?=
 =?us-ascii?Q?VpaIxAN4LVvWQ12yJeb5HruGNtvmt9j5/qPFGeCxSDEs/4gvv1bpKrQFAeTR?=
 =?us-ascii?Q?MscpKAA20Apq3Xe9hYCY1rbFET1kendQzdY3sF9eaqG59Qi/rXGcNuvFPyB/?=
 =?us-ascii?Q?OfxUEdyEwyULvFCHVRnm5FuTaTX13Az/+SPrpbTxpkzUbNJaJbRKQhg1Ly+N?=
 =?us-ascii?Q?LcPKvsCRWTDGiHhSZ+1pRzBDCHZvtWDQNGc5vx9lIoDy+qMX24nV7luIbufj?=
 =?us-ascii?Q?q+k4FyJCndkTsxFy/FMSmX9sW4LmNgvhX/3T82RIE/TgyEpEdBZEsKzcDf+2?=
 =?us-ascii?Q?4x+W0kV+xJEJgIw=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(35042699022)(1800799024)(36860700013)(376014)(14060799003)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 17:18:20.5654 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b014c3-2b37-4872-46d9-08dd3a3f9a83
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8474
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

Adding the following formats
     - DRM_FORMAT_RX106
     - DRM_FORMAT_GXRX106106
     - DRM_FORMAT_RX124
     - DRM_FORMAT_GXRX124124
     - DRM_FORMAT_AXBXGXRX124124124124
     - DRM_FORMAT_RX142
     - DRM_FORMAT_GXRX142142
     - DRM_FORMAT_AXBXGXRX142142142142

They are useful for communicating Bayer data between ISPs and GPU by emulating GL_R16UI and GL_RG16UI formats

Signed-off-by: Yulia Garbovich <yulia.garbovich@arm.com>
---
 drivers/gpu/drm/drm_fourcc.c  |  8 +++++
 include/uapi/drm/drm_fourcc.h | 61 +++++++++++++++++++++++++++++++++--
 2 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 193cf8ed7912..cd5f467edfeb 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -170,6 +170,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_R8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_R10,		.depth = 10, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_R12,		.depth = 12, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_RX106,	.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_RX124,	.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_RX142,	.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_RGB332,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_BGR233,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_XRGB4444,	.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
@@ -200,6 +203,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_XBGR8888,	.depth = 24, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_RGBX8888,	.depth = 24, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_BGRX8888,	.depth = 24, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_GXRX106106,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_GXRX124124,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_GXRX142142,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_RGB565_A8,	.depth = 24, .num_planes = 2, .cpp = { 2, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_BGR565_A8,	.depth = 24, .num_planes = 2, .cpp = { 2, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_XRGB2101010,	.depth = 30, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
@@ -219,6 +225,8 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_ARGB16161616F,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_ABGR16161616F,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_AXBXGXRX106106106106, .depth = 0, .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
+		{ .format = DRM_FORMAT_AXBXGXRX124124124124, .depth = 0, .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
+		{ .format = DRM_FORMAT_AXBXGXRX142142142142, .depth = 0, .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_XRGB16161616,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_XBGR16161616,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_ARGB16161616,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 84d502e42961..7248b96ecf7e 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -146,6 +146,24 @@ extern "C" {
 /* 12 bpp Red (direct relationship between channel value and brightness) */
 #define DRM_FORMAT_R12		fourcc_code('R', '1', '2', ' ') /* [15:0] x:R 4:12 little endian */
 
+/*
+ * 1-component 16 bpp format that has a 10-bit R component in the top 10 bits of the word
+ * in bytes 0..1 with the bottom 6 bits of the word unused
+ */
+#define DRM_FORMAT_RX106	fourcc_code('R', '0', '1', '0') /* [15:0] R:x 10:6 little endian */
+
+/*
+ * 1-component 16 bpp format that has a 12-bit R component in the top 12 bits of the word
+ * in bytes 0..1 with the bottom 4 bits of the word unused
+ */
+#define DRM_FORMAT_RX124	fourcc_code('R', '0', '1', '2') /* [15:0] R:x 12:4 little endian */
+
+/*
+ * 1-component 16 bpp format that has a 14-bit R component in the top 14 bits of the word
+ * in bytes 0..1 with the bottom 2 bits of the word unused
+ */
+#define DRM_FORMAT_RX142	fourcc_code('R', '0', '1', '4') /* [15:0] R:x 14:2 little endian */
+
 /* 16 bpp Red (direct relationship between channel value and brightness) */
 #define DRM_FORMAT_R16		fourcc_code('R', '1', '6', ' ') /* [15:0] R little endian */
 
@@ -157,6 +175,27 @@ extern "C" {
 #define DRM_FORMAT_RG1616	fourcc_code('R', 'G', '3', '2') /* [31:0] R:G 16:16 little endian */
 #define DRM_FORMAT_GR1616	fourcc_code('G', 'R', '3', '2') /* [31:0] G:R 16:16 little endian */
 
+ /*
+ * 2-component  32bpp  format that has a 10-bit R component in the top 10 bits of the word
+ * in bytes 0..1, and a 10-bit G component in the top 10 bits of the word in bytes 2..3,
+ * with the bottom 6 bits of each word unused.
+ */
+#define DRM_FORMAT_GXRX106106	fourcc_code('G', 'R', '1', '0') /* [31:0] G:x:R:x 10:6:10:6 little endian */
+
+/*
+ * 2-component  32bpp  format that has a 12-bit R component in the top 12 bits of the word
+ * in bytes 0..1, and a 12-bit G component in the top 12 bits of the word in bytes 2..3,
+ * with the bottom 4 bits of each word unused.
+ */
+#define DRM_FORMAT_GXRX124124	fourcc_code('G', 'R', '1', '2') /* [31:0] G:x:R:x 12:4:12:4 little endian */
+
+/*
+ * 2-component  32bpp  format that has a 14-bit R component in the top 14 bits of the word
+ * in bytes 0..1, and a 14-bit G component in the top 14 bits of the word in bytes 2..3,
+ * with the bottom 2 bits of each word unused.
+ */
+#define DRM_FORMAT_GXRX142142	fourcc_code('G', 'R', '1', '4') /* [31:0] G:x:R:x 14:2:14:2 little endian */
+
 /* 8 bpp RGB */
 #define DRM_FORMAT_RGB332	fourcc_code('R', 'G', 'B', '8') /* [7:0] R:G:B 3:3:2 */
 #define DRM_FORMAT_BGR233	fourcc_code('B', 'G', 'R', '8') /* [7:0] B:G:R 2:3:3 */
@@ -229,11 +268,29 @@ extern "C" {
 #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
 /*
- * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
- * of unused padding per component:
+ * 4-component, 64bpp format that has a 10-bit R component in the top 10 bits of the word in bytes 0..1,
+ * a 10-bit G component in the top 10 bits of the word in bytes 2..3, a 10-bit B component in the top 10 bits of the word
+ * in bytes 4..5, and a 10-bit A component in the top 10 bits of the word in bytes 6..7,
+ * with the bottom 6 bits of each word unused.
  */
 #define DRM_FORMAT_AXBXGXRX106106106106 fourcc_code('A', 'B', '1', '0') /* [63:0] A:x:B:x:G:x:R:x 10:6:10:6:10:6:10:6 little endian */
 
+/*
+ * 4-component, 64bpp format that has a 12-bit R component in the top 12bits of the word in bytes 0..1,
+ * a 12-bit G component in the top 12 bits of the word in bytes 2..3, a 12-bit B component in the top 12 bits of the word
+ * in bytes 4..5, and a 12-bit A component in the top 12 bits of the word in bytes 6..7,
+ * with the bottom 4 bits of each word unused.
+ */
+#define DRM_FORMAT_AXBXGXRX124124124124	fourcc_code('A', 'B', '1', '2') /* [63:0] A:x:B:x:G:x:R:x 12:4:12:4:12:4:12:4 little endian */
+
+/*
+ * 4-component, 64bpp format that has a 14-bit R component in the top 14 bits of the word in bytes 0..1,
+ * a 14-bit G component in the top 14 bits of the word in bytes 2..3, a 14-bit B component in the top 14 bits of the word
+ * in bytes 4..5, and a 14-bit A component in the top 14 bits of the word in bytes 6..7,
+ * with the bottom 2 bits of each word unused.
+ */
+#define DRM_FORMAT_AXBXGXRX142142142142	fourcc_code('A', 'B', '1', '4') /* [63:0] A:x:B:x:G:x:R:x 14:2:14:2:14:2:14:2 little endian */
+
 /* packed YCbCr */
 #define DRM_FORMAT_YUYV		fourcc_code('Y', 'U', 'Y', 'V') /* [31:0] Cr0:Y1:Cb0:Y0 8:8:8:8 little endian */
 #define DRM_FORMAT_YVYU		fourcc_code('Y', 'V', 'Y', 'U') /* [31:0] Cb0:Y1:Cr0:Y0 8:8:8:8 little endian */
-- 
2.34.1

