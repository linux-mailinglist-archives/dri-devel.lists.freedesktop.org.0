Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D199A8639E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 18:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDF710EC31;
	Fri, 11 Apr 2025 16:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="C+4WBJEX";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="C+4WBJEX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3535810EC31
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 16:49:02 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=itnV4q2b/k/XJTjNjm772cwMQH2gfoj6wPuidtV81XGwPTHjS3KzoDAdEeEzU3EwsFCNNdjZ59hojPo5dAHeqV+Q5/IL8DIDY5l4m/oIytiLdAL4PADHfvcqcu6jqndiTD6EVzxbUPE62XTLIbdaBbcd4QlPE/QrBsIe+oF7zdKxEoSiJaxHrKtA1wDUt96P8eC3Qat7o2cqX16xQoJErUmP76S2IpBMGyn+FBLPS6npUL8AeSn6VGDl2UdKA7CVwVPqOpOdjvG8PxxGBSZs3S7dW+I7uBog5tyKmj9bFPqLf8U/CTbGh4kJQWl/zQlP/yGyCBBYPqPIa0FWbagU+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcV8pkoJ9iNxMKaSKBCZojiLmiQLjrEoUYVJZf1P8sE=;
 b=kDQVEXOxakHPlEwJnDIP6HhQTOZzyXMedzl/5SQ2hkHsaFWQaRZuu/DX40X9Kl532wbUAguQeQaVDHRBYUaLXIWIeBDxjKQyu9JCWMLK8Xze6TSMgOqpY7gY+qpEC9X1CCiqPnWjdzxbQ9xxnt4PzGZUapF04nyuGY8vI+Wj5pJ6OClbG6peeqMb1FBYrVj4LNZV7akBkEIaAdxb8faPj2tOMUwijbFWc0Wn4K53OLEVxM1X2w/2HaBdW33g6CjIzB5ADbAMq14o9hfE0Wty8awhuKQYhYZvY/CwWKlMo/jjj6cfRJK/vR04D1j2Qibyy0YEbfyTjNtdmu0OWM2Dnw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcV8pkoJ9iNxMKaSKBCZojiLmiQLjrEoUYVJZf1P8sE=;
 b=C+4WBJEXNCG2mfdvHgzY1GFsiT7Hxm6krOpUIcEmRw/HyGhHopK280AiC/qh4XKBhdmOPgoIEv7FggHUD3yfCquCRLz1HtVZbUv0VQY8VZM75HQdJmm28IyJs/RjVrVC/m5raOoFuq3nSF75INx2gMDtv3mdAqdXpEhZS/X6oTc=
Received: from DUZPR01CA0334.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::25) by DB9PR08MB9681.eurprd08.prod.outlook.com
 (2603:10a6:10:45c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.20; Fri, 11 Apr
 2025 16:48:52 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::b) by DUZPR01CA0334.outlook.office365.com
 (2603:10a6:10:4b8::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 16:48:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Fri, 11 Apr 2025 16:48:51 +0000
Received: ("Tessian outbound e6e18cf4ef9f:v605");
 Fri, 11 Apr 2025 16:48:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 49e9503d9ef6ccb6
X-TessianGatewayMetadata: TY4zYXB07mxjikj6L1XyA6voK8d8OobMfUQgr2C4rjWSVWjpNmS4bH12SHrnmVJTVJVrZPj0nwvO0OGKjtEWpdFn7TmsURMAkbHdn8l9RHu/AvVKvA4zCAQMH38cnSSb+WI34cKjQcAOCemVHZk1BT3FXjop9V80LOmJopQp8F4=
X-CR-MTA-TID: 64aa7808
Received: from L39a2560b21af.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A10D089B-7EBF-4E7F-9816-AAC2D7FDD812.1; 
 Fri, 11 Apr 2025 16:48:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L39a2560b21af.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Apr 2025 16:48:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWgJzblhmRlvtQ6uE/W5pHEQACThCGOFYt/VHPbpzHs+BADSi+PIseRidKh8oYo+ihuOcw7pPsBBfyeB42sExAmXf/hdqId3QEhvJyQ5tlOzIZSz3h3Hk/lwXfHgAUp27BAmBr2yyodPKih4uwX2LHkgAKAcBaktbZdAQhn7gpj+3ZxOWrPqKlzGBtlxKu9tBGUpTyLBDCqTQQrQZTVzNh+olEy35pwmKvWCrjQRKS2w6XhGFAvrUAm+dtsIb266oH5jknDWJ3XYlacPWsEZQHYiyA3QBA0mvJfQQCRPPy8KsDkHihvrBE7aqpt1QeXPUMs8NDX0WqOb/eTb45asqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcV8pkoJ9iNxMKaSKBCZojiLmiQLjrEoUYVJZf1P8sE=;
 b=QB4KcaxUwxuj8QjTh3LCiC0NqKNQkpCYy1H4QiswUR/2bPaWXzTuY+s288Wim4h9xSo/x0Wa7+Ocpu8D2/XED5DtnIXiuKjIt1qDKpXXsKfhgQsTLbM2EMjJ+t5TdgVGG5RaLcAMOeGIEOFowRtUAQqUPDiydCZiJrxk38mUHMwz8YigvNnJBAUxUdMJtkURR0v0zQCeJaNAxmLglDQ5knc9tV/J21sp/va8Mgj9BAdQlkzjZdKh6XOeXNRLCSGtnNCF/V9wggV5GCTDlAAUHj8Uv0i+1QxBm8Zl5Q0lgPc1daErFFePt6hFqC/KG1CixUwVhjkevoC/cRgpAKB1Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcV8pkoJ9iNxMKaSKBCZojiLmiQLjrEoUYVJZf1P8sE=;
 b=C+4WBJEXNCG2mfdvHgzY1GFsiT7Hxm6krOpUIcEmRw/HyGhHopK280AiC/qh4XKBhdmOPgoIEv7FggHUD3yfCquCRLz1HtVZbUv0VQY8VZM75HQdJmm28IyJs/RjVrVC/m5raOoFuq3nSF75INx2gMDtv3mdAqdXpEhZS/X6oTc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB7605.eurprd08.prod.outlook.com
 (2603:10a6:10:308::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 16:48:42 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 16:48:42 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] drm/panthor: Clean up 64-bit register definitions
Date: Fri, 11 Apr 2025 17:48:05 +0100
Message-ID: <20250411164805.2015088-3-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250411164805.2015088-1-karunika.choo@arm.com>
References: <20250411164805.2015088-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0134.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::26) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB7605:EE_|DU2PEPF00028D0D:EE_|DB9PR08MB9681:EE_
X-MS-Office365-Filtering-Correlation-Id: 23927171-951d-4112-28fd-08dd7918bd10
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?AQxmRH/OpaqpXo8f5Q9ndR0HJF5PalBXc764+G47V0FQGsA7kiXortCTY4e4?=
 =?us-ascii?Q?thI9uCAAM/2ZNIpp/i+V7PLA9VZV9Q+rU5e6ZOX3XIA8otFMm7RdTZjxXMXM?=
 =?us-ascii?Q?rAwM2qVDU84l6Tb1x/PwdE6Qp+o57fSNKDEX7UX/iJ0vxcaU+ggUWMv1Su2Y?=
 =?us-ascii?Q?eo5cbw6dnME7dFvdMnmGNGJfhZC4Z7tqSBo/bVx+bAIJ7IQzqU6qbZm2i0ko?=
 =?us-ascii?Q?IcTrVehOg8Wqh6XRJiNDwNHqzCed70ODTsS2aa5MEk7SDZyeAyt16BBafUYC?=
 =?us-ascii?Q?+j0KYbEVq4Q3CoKUVmL9QjML12Y5mP5LgDAjfu/E/lBoyTqyKrGRXOkiecoK?=
 =?us-ascii?Q?/0NP2EwiCteOStDQwivOtIgmtRe9ZHCEBSw38D9vG2yE8GyldKnHNbJCM30x?=
 =?us-ascii?Q?qhBAk/UaABODs9ZN2qSw5UhDJusvej+Nf4hVfJHKp3pkiWHcFPJEpGMVT/y8?=
 =?us-ascii?Q?O0zFQrsljGPnSqxxCzXHcQaTu/xQa8OOMm/83cxZ+IPje62GB2EP9CkImQLY?=
 =?us-ascii?Q?uQqErsbokJI5VgKfCXZHd4MNIPfESBLW06Gk4MXMqanx9XHAZY8+aQsusBBj?=
 =?us-ascii?Q?j0hCNRIpdbQbzAYG5Z+QCdocYr2bL31s4uFj+/ibLQxRral4uwyZe8n3/b/I?=
 =?us-ascii?Q?W2baG6OPG7ALVuF8p7j8/C9TmXgkOc6pOv11ZdzBLoUh/MR09dzOjjHVOMlL?=
 =?us-ascii?Q?QWGWN5GdMxt4qTh6AKL2vkiGWzeeVbHtqgnuFxe59Tgy7jbet1ed4JNKoqL1?=
 =?us-ascii?Q?PWPxjkEsg+moHbArKqPAjSk5G5B0F4nmp0kbagLiOjejp8IhzjyErzNOOcIL?=
 =?us-ascii?Q?DgEe8RGAHXX2HNKH5cmiLZd8oqYyD3/lBFD7orR8T11hBYhQFJh1J910K7OJ?=
 =?us-ascii?Q?pN2bSeGGbbz6El+Qukkp8tahKpWoSsEtd7f3aHe5NJeVjLCe7ggi9b8bwfTK?=
 =?us-ascii?Q?fTc4VN5Tv7WqeSB1WJzgPCp8cLwnDCpL+sjzc6cpqMPbb5biv2qbo3Yjqllu?=
 =?us-ascii?Q?5ZLeVVRTbS7P0pIIeZD0V3FJithO7lrfMhoz+++VfxEqqP0GGXqp8m18B5QA?=
 =?us-ascii?Q?zmTGnWZFG/VuXojGHSYBkZwJWHYRZRgTUdMMGmjv44SmULACh4cTVd4LKAE6?=
 =?us-ascii?Q?eynRxwehsxDlFbzMfMijpLYSc0TRtgnRM26Mk2iLSZ4Dr6p08KXeQp2btAq2?=
 =?us-ascii?Q?A9RwPvDRxCBSntv6Ue198bW8y6ue1kqbM5pp2r6i9+vsgduPXdkwNw/geoDw?=
 =?us-ascii?Q?mth8tCrfCN0MTW0fdtHTLiHsFsCl46KAmMR4l95BYwsKhqvzBIpx3RAnUJcg?=
 =?us-ascii?Q?DME8F8M1ZovnPKG5VVqpOpSTpK53/bNHTWQd0EHV+Aqvb+PBZ4FI8TN5HJ9q?=
 =?us-ascii?Q?jKetQgnHoBRmoCaSOfOyxfsGMVEi5Hv2TM6OhPPbqgZLPcYemA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7605
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6472a6d6-fcbe-49a0-5fcc-08dd7918b78a
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|376014|1800799024|14060799003|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PP/pKmjwyfirWPAFWUXekS4WiYJ0A4rsTi/b+NxeYgZSWX1zNpPxBDG8wOfx?=
 =?us-ascii?Q?dPn0NdL+1EEl5H2+R5H5AZcOYWLksXobJrM+MgUtALmcOYV/DpsxPPnirLwm?=
 =?us-ascii?Q?6TPpJc4wp/vAkCtMoZfKeIW87UScQYB7GSDQkVQnxd1tvHbQNhIrKZm3kEtG?=
 =?us-ascii?Q?ovT6wHWlhGRgvyLMMOFBEoYG+se7gRJ6ndnILfD6Vrw+A/Cajo7yf9s92mgI?=
 =?us-ascii?Q?Kr0cQThgfA2uiu8a7jGWHM9osYdLbeVXcrAugps8blOKpNqV7h8abL7VAOci?=
 =?us-ascii?Q?jZ1jCpjO0/Amo+6gAmzkYwAOMP2u7kR3aXQh8HqWKPVX85WUKUurr/n5iuF1?=
 =?us-ascii?Q?GEbYMtc9/COXxZ/81npl7JaoQVHeEI0MThTr2xjkxzRK5HldsbV7/GsG6G0T?=
 =?us-ascii?Q?F5JaeZtHlHjjOd4jeh1t9ar/S2E3QSd9topEuRyrLSLsw8QcRALeBk4q0zzz?=
 =?us-ascii?Q?qrs3MxjDJAvWReI7eXONUo4rnXYDqkbszwnzx6K4XtMdMFiGfdpxZbtuiban?=
 =?us-ascii?Q?0g5Q7/Q69oVMWEu3/qixDwKXTLUXmSMugIB23rFGgOb1oq5qB1vEthSY70Yp?=
 =?us-ascii?Q?eyxLR6gXSWnMnBTAacs79Z17UDyuE1w2QqXsURHblCJXOyhYhdcX3zpUh/W6?=
 =?us-ascii?Q?sPDn0RKYvO+VC0Bst3SglTXYbzddMPETUKt6GeMjLzLbctqkS7PKCK06UM3e?=
 =?us-ascii?Q?icwVVqBfOIdCXMwBAKex+7PAq1NieI6Bb5i3VqoK5ZsUurfhXhzNTJSPEc2Q?=
 =?us-ascii?Q?P3LJ/Axp+ynSdIyz9ZzJC9REyPWpbMPn7FpqVD+x7EmS0FQmNC5wnOrXqe3X?=
 =?us-ascii?Q?vhw78NYNu+2/meyMqqCwDJXl6vuKacV9neQT4Q6T/EEboL0UfQslc1WcnryX?=
 =?us-ascii?Q?itY6nlxSqeqjJZ72P18rOAOPlWCzYGXKZvER4blsmnN46tLTTrlzj7kNMMn1?=
 =?us-ascii?Q?0ivqd9Ap5AZbGm4qF5g92NmDbf57QROFC/HNXOMe3AoLSDu6xuVT63zaUnci?=
 =?us-ascii?Q?vU+MsBYwJGgYw1Zds6htXkAsBBhFumamSCL3cRZBu9sJpuPlw9PXuZrUk+Na?=
 =?us-ascii?Q?Q0+BZ6q2ERUX2lc5R3Yj7WEnylsRQz418eJflAKAdj9m8SJlLz84+W952hf/?=
 =?us-ascii?Q?+oWZJScTtc4sqUyR06dlNWgXSr7174zKiQ7SMxR4noNAhFu57cTXxftciFdN?=
 =?us-ascii?Q?2VeDPdUzz3yKH3C20w+da5I48pF8cRSjNG+9Pwdv3mFrpUzdIrroZfNLDA/l?=
 =?us-ascii?Q?FijF473jnTWvhG295ystb12Rww6mb+1/GjdnSYr7FoGfLYAIsYPxKsAkZ+7+?=
 =?us-ascii?Q?hYJZf5kHItrjFwcjrm3E4Toh5eaw/sBq9kYmDIoitaOneu/ErD868kBMxgZR?=
 =?us-ascii?Q?8sG88tuW7tuu0CNAN6F1zZyZDDFVDipzWHWb+NiqBJBouJeHw+9whaiYC6kY?=
 =?us-ascii?Q?F2sbdxlcmCxNProtXmZkNXuj1GCUsME7QLARYTtJd0ePUhvVTMG8pzKGlJc4?=
 =?us-ascii?Q?WEQDsQGW6wi5/65UjMJiXRwSjvDh21G6kLQT?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(35042699022)(376014)(1800799024)(14060799003)(36860700013)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 16:48:51.4294 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23927171-951d-4112-28fd-08dd7918bd10
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9681
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

With the introduction of 64-bit register accessors, the separate *_HI
definitions are no longer necessary. This change removes them and
renames the corresponding *_LO entries for cleaner and more consistent
register definitions.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gpu.c  | 12 ++--
 drivers/gpu/drm/panthor/panthor_gpu.h  | 10 +--
 drivers/gpu/drm/panthor/panthor_mmu.c  | 16 ++---
 drivers/gpu/drm/panthor/panthor_regs.h | 94 +++++++++-----------------
 4 files changed, 52 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index fd09f0928019..5fc45284c712 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -108,9 +108,9 @@ static void panthor_gpu_init_info(struct panthor_device *ptdev)
 
 	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
 
-	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
-	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
-	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
+	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
+	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
+	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
 
 	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
 	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
@@ -147,7 +147,7 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	if (status & GPU_IRQ_FAULT) {
 		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
-		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR_LO);
+		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR);
 
 		drm_warn(&ptdev->base, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
 			 fault_status, panthor_exception_name(ptdev, fault_status & 0xFF),
@@ -457,7 +457,7 @@ void panthor_gpu_resume(struct panthor_device *ptdev)
  */
 u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
 {
-	return gpu_read64_counter(ptdev, GPU_TIMESTAMP_LO);
+	return gpu_read64_counter(ptdev, GPU_TIMESTAMP);
 }
 
 /**
@@ -468,5 +468,5 @@ u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
  */
 u64 panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev)
 {
-	return gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET_LO);
+	return gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET);
 }
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
index 7f6133a66127..89a0bdb2fbc5 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.h
+++ b/drivers/gpu/drm/panthor/panthor_gpu.h
@@ -30,9 +30,9 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
  */
 #define panthor_gpu_power_on(ptdev, type, mask, timeout_us) \
 	panthor_gpu_block_power_on(ptdev, #type, \
-				  type ## _PWRON_LO, \
-				  type ## _PWRTRANS_LO, \
-				  type ## _READY_LO, \
+				  type ## _PWRON, \
+				  type ## _PWRTRANS, \
+				  type ## _READY, \
 				  mask, timeout_us)
 
 /**
@@ -42,8 +42,8 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
  */
 #define panthor_gpu_power_off(ptdev, type, mask, timeout_us) \
 	panthor_gpu_block_power_off(ptdev, #type, \
-				   type ## _PWROFF_LO, \
-				   type ## _PWRTRANS_LO, \
+				   type ## _PWROFF, \
+				   type ## _PWRTRANS, \
 				   mask, timeout_us)
 
 int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index a0a79f19bdea..1db4a46ddf98 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -564,7 +564,7 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	region = region_width | region_start;
 
 	/* Lock the region that needs to be updated */
-	gpu_write64(ptdev, AS_LOCKADDR_LO(as_nr), region);
+	gpu_write64(ptdev, AS_LOCKADDR(as_nr), region);
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
@@ -614,9 +614,9 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 	if (ret)
 		return ret;
 
-	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), transtab);
-	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), memattr);
-	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), transcfg);
+	gpu_write64(ptdev, AS_TRANSTAB(as_nr), transtab);
+	gpu_write64(ptdev, AS_MEMATTR(as_nr), memattr);
+	gpu_write64(ptdev, AS_TRANSCFG(as_nr), transcfg);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -629,9 +629,9 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 	if (ret)
 		return ret;
 
-	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), 0);
-	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), 0);
-	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
+	gpu_write64(ptdev, AS_TRANSTAB(as_nr), 0);
+	gpu_write64(ptdev, AS_MEMATTR(as_nr), 0);
+	gpu_write64(ptdev, AS_TRANSCFG(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -1669,7 +1669,7 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 		u32 source_id;
 
 		fault_status = gpu_read(ptdev, AS_FAULTSTATUS(as));
-		addr = gpu_read64(ptdev, AS_FAULTADDRESS_LO(as));
+		addr = gpu_read64(ptdev, AS_FAULTADDRESS(as));
 
 		/* decode the fault status */
 		exception_type = fault_status & 0xFF;
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 6fd39a52f887..7e21d6a25dc4 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -65,20 +65,16 @@
 #define   GPU_STATUS_DBG_ENABLED			BIT(8)
 
 #define GPU_FAULT_STATUS				0x3C
-#define GPU_FAULT_ADDR_LO				0x40
-#define GPU_FAULT_ADDR_HI				0x44
+#define GPU_FAULT_ADDR					0x40
 
 #define GPU_PWR_KEY					0x50
 #define  GPU_PWR_KEY_UNLOCK				0x2968A819
 #define GPU_PWR_OVERRIDE0				0x54
 #define GPU_PWR_OVERRIDE1				0x58
 
-#define GPU_TIMESTAMP_OFFSET_LO				0x88
-#define GPU_TIMESTAMP_OFFSET_HI				0x8C
-#define GPU_CYCLE_COUNT_LO				0x90
-#define GPU_CYCLE_COUNT_HI				0x94
-#define GPU_TIMESTAMP_LO				0x98
-#define GPU_TIMESTAMP_HI				0x9C
+#define GPU_TIMESTAMP_OFFSET				0x88
+#define GPU_CYCLE_COUNT					0x90
+#define GPU_TIMESTAMP					0x98
 
 #define GPU_THREAD_MAX_THREADS				0xA0
 #define GPU_THREAD_MAX_WORKGROUP_SIZE			0xA4
@@ -87,47 +83,29 @@
 
 #define GPU_TEXTURE_FEATURES(n)				(0xB0 + ((n) * 4))
 
-#define GPU_SHADER_PRESENT_LO				0x100
-#define GPU_SHADER_PRESENT_HI				0x104
-#define GPU_TILER_PRESENT_LO				0x110
-#define GPU_TILER_PRESENT_HI				0x114
-#define GPU_L2_PRESENT_LO				0x120
-#define GPU_L2_PRESENT_HI				0x124
-
-#define SHADER_READY_LO					0x140
-#define SHADER_READY_HI					0x144
-#define TILER_READY_LO					0x150
-#define TILER_READY_HI					0x154
-#define L2_READY_LO					0x160
-#define L2_READY_HI					0x164
-
-#define SHADER_PWRON_LO					0x180
-#define SHADER_PWRON_HI					0x184
-#define TILER_PWRON_LO					0x190
-#define TILER_PWRON_HI					0x194
-#define L2_PWRON_LO					0x1A0
-#define L2_PWRON_HI					0x1A4
-
-#define SHADER_PWROFF_LO				0x1C0
-#define SHADER_PWROFF_HI				0x1C4
-#define TILER_PWROFF_LO					0x1D0
-#define TILER_PWROFF_HI					0x1D4
-#define L2_PWROFF_LO					0x1E0
-#define L2_PWROFF_HI					0x1E4
-
-#define SHADER_PWRTRANS_LO				0x200
-#define SHADER_PWRTRANS_HI				0x204
-#define TILER_PWRTRANS_LO				0x210
-#define TILER_PWRTRANS_HI				0x214
-#define L2_PWRTRANS_LO					0x220
-#define L2_PWRTRANS_HI					0x224
-
-#define SHADER_PWRACTIVE_LO				0x240
-#define SHADER_PWRACTIVE_HI				0x244
-#define TILER_PWRACTIVE_LO				0x250
-#define TILER_PWRACTIVE_HI				0x254
-#define L2_PWRACTIVE_LO					0x260
-#define L2_PWRACTIVE_HI					0x264
+#define GPU_SHADER_PRESENT				0x100
+#define GPU_TILER_PRESENT				0x110
+#define GPU_L2_PRESENT					0x120
+
+#define SHADER_READY					0x140
+#define TILER_READY					0x150
+#define L2_READY					0x160
+
+#define SHADER_PWRON					0x180
+#define TILER_PWRON					0x190
+#define L2_PWRON					0x1A0
+
+#define SHADER_PWROFF					0x1C0
+#define TILER_PWROFF					0x1D0
+#define L2_PWROFF					0x1E0
+
+#define SHADER_PWRTRANS					0x200
+#define TILER_PWRTRANS					0x210
+#define L2_PWRTRANS					0x220
+
+#define SHADER_PWRACTIVE				0x240
+#define TILER_PWRACTIVE					0x250
+#define L2_PWRACTIVE					0x260
 
 #define GPU_REVID					0x280
 
@@ -170,10 +148,8 @@
 #define MMU_AS_SHIFT					6
 #define MMU_AS(as)					(MMU_BASE + ((as) << MMU_AS_SHIFT))
 
-#define AS_TRANSTAB_LO(as)				(MMU_AS(as) + 0x0)
-#define AS_TRANSTAB_HI(as)				(MMU_AS(as) + 0x4)
-#define AS_MEMATTR_LO(as)				(MMU_AS(as) + 0x8)
-#define AS_MEMATTR_HI(as)				(MMU_AS(as) + 0xC)
+#define AS_TRANSTAB(as)					(MMU_AS(as) + 0x0)
+#define AS_MEMATTR(as)					(MMU_AS(as) + 0x8)
 #define   AS_MEMATTR_AARCH64_INNER_ALLOC_IMPL		(2 << 2)
 #define   AS_MEMATTR_AARCH64_INNER_ALLOC_EXPL(w, r)	((3 << 2) | \
 							 ((w) ? BIT(0) : 0) | \
@@ -185,8 +161,7 @@
 #define   AS_MEMATTR_AARCH64_INNER_OUTER_NC		(1 << 6)
 #define   AS_MEMATTR_AARCH64_INNER_OUTER_WB		(2 << 6)
 #define   AS_MEMATTR_AARCH64_FAULT			(3 << 6)
-#define AS_LOCKADDR_LO(as)				(MMU_AS(as) + 0x10)
-#define AS_LOCKADDR_HI(as)				(MMU_AS(as) + 0x14)
+#define AS_LOCKADDR(as)					(MMU_AS(as) + 0x10)
 #define AS_COMMAND(as)					(MMU_AS(as) + 0x18)
 #define   AS_COMMAND_NOP				0
 #define   AS_COMMAND_UPDATE				1
@@ -201,12 +176,10 @@
 #define  AS_FAULTSTATUS_ACCESS_TYPE_EX			(0x1 << 8)
 #define  AS_FAULTSTATUS_ACCESS_TYPE_READ		(0x2 << 8)
 #define  AS_FAULTSTATUS_ACCESS_TYPE_WRITE		(0x3 << 8)
-#define AS_FAULTADDRESS_LO(as)				(MMU_AS(as) + 0x20)
-#define AS_FAULTADDRESS_HI(as)				(MMU_AS(as) + 0x24)
+#define AS_FAULTADDRESS(as)				(MMU_AS(as) + 0x20)
 #define AS_STATUS(as)					(MMU_AS(as) + 0x28)
 #define   AS_STATUS_AS_ACTIVE				BIT(0)
-#define AS_TRANSCFG_LO(as)				(MMU_AS(as) + 0x30)
-#define AS_TRANSCFG_HI(as)				(MMU_AS(as) + 0x34)
+#define AS_TRANSCFG(as)					(MMU_AS(as) + 0x30)
 #define   AS_TRANSCFG_ADRMODE_UNMAPPED			(1 << 0)
 #define   AS_TRANSCFG_ADRMODE_IDENTITY			(2 << 0)
 #define   AS_TRANSCFG_ADRMODE_AARCH64_4K		(6 << 0)
@@ -224,8 +197,7 @@
 #define   AS_TRANSCFG_DISABLE_AF_FAULT			BIT(34)
 #define   AS_TRANSCFG_WXN				BIT(35)
 #define   AS_TRANSCFG_XREADABLE				BIT(36)
-#define AS_FAULTEXTRA_LO(as)				(MMU_AS(as) + 0x38)
-#define AS_FAULTEXTRA_HI(as)				(MMU_AS(as) + 0x3C)
+#define AS_FAULTEXTRA(as)				(MMU_AS(as) + 0x38)
 
 #define CSF_GPU_LATEST_FLUSH_ID				0x10000
 
-- 
2.47.1

