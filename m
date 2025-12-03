Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD99C9E714
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 10:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B4510E733;
	Wed,  3 Dec 2025 09:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="fvsZlW3E";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fvsZlW3E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012069.outbound.protection.outlook.com [52.101.66.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EEF10E2D5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 09:20:24 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iBevVeqcPUh2xiEYf0IyBwko/xyDhhX7QxThOJOGWd9S1sshD7vsH8+mCFYFSsU/X0sPPpcXyAgeoIbvAWajrColW4FpIV1E3jQEDzkUY/XcMs3hzSr9tki8BfsWXdf8HBvoHMto1vbhvW6JbQHXVfVPmzUnQU9Tca1Foj5z6pX6cEvgmtHHcDoTFSJ+Yk6aIE6Gh1deROHquIO/F/zL6kOpB1mcoAN9t16oJGI8Bs/yuOtDmZeJBsohH0r4FzPoL1uWuN4chLD66qzcrc/IFhmokv36F5jkBs48EHd6/Bb+Bb/BE0Qtidn+5sdxtuBoreYpzP06dzhicn/VeEking==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3tgdoTP45R7mTevZ5II7xmsCPxzS5xC3rrgpgmLBFU=;
 b=DcrA6pi+VpJ8Y2ImhrjwmeW0+zQDs/UL8IDoUNC4Y1cixwM60zI1FGSTIsX/kn4466mDSnIInSFgUqrtm+kBGV6GCHfz1K6tgwQ2f3hwAYDai7FczPoq547CfddrFBM8nuYNAFyufr+rXU5pgVwi74Qs3jZQsd5KFAWaimiX8ruQxTLmfYKU4/FSL55ed0R8O/otKzDJ5MUQaWZIZY+yMzkyyeBZggB4nAqcCsr+IJLPfcoabV7lqfeHLQDBY/ZMbzXzuMlUwSvtHAmPWtbP13qELm+AuWzUFtKamftxXcBV5fCE72XwUHrbzrNLxPO2PRpp7SJtPeAQVyv4nb74Vw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3tgdoTP45R7mTevZ5II7xmsCPxzS5xC3rrgpgmLBFU=;
 b=fvsZlW3EjA8AeyLOs7iw7jjWLDLyqqVk2vZpxf8SVDdLMdyl7xoXmGulsPKr6y8t3Rz0y6cCVZsP8M4oi5NPpqsrZ5ndeJ6mQMqYBWOIbjMkudAspXxzHJn2PSfuV6Tlpq9nPZofooOs4h8Zic7dxGkVKDMatPjZI6qKHgk92TA=
Received: from AS4PR10CA0023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::15)
 by DB3PR08MB9898.eurprd08.prod.outlook.com (2603:10a6:10:434::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 09:20:21 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::96) by AS4PR10CA0023.outlook.office365.com
 (2603:10a6:20b:5d8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 09:20:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Wed, 3 Dec 2025 09:20:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEEZCJo1K+Ur0ws+LYkYyoJFqEqta7vstEtRp1ZQ78//s48z4dGCkXqa9OQ14vBm9Nw/JEFKTfR/47/BiXRNDgc1n1fO2n25x00yOZ5iPhN/fV4sgn0nb9ngy6VMLLLkQXlUMTVe5X+4p7HDiRtKP1YRVIr4e87sKsDwS1M7r1U4U5PMWStDRZclmvo54ci0bh1J1ZnXWyh/MRz1L1WM1WMIDMnbPSyzHDZXS6pvNgEsfsUMt/gBcWQXXcKA4GnXjTrgVELtFxsdBQ2qj4U9LTY8Ur9i5bG8qVB9Sj+zKlzNf7/sOWTMqc6o076kzb8VMOT2gzkBE6EY+dga4X7bzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3tgdoTP45R7mTevZ5II7xmsCPxzS5xC3rrgpgmLBFU=;
 b=Ce+qPAzJ+eKqbOebVgYiL+BDCFn3NEgDggvC3BmPN5w8eyMl/63j5ywR8rVAXHxmjzyU8eBmErXsTf97l8cV6Y/3bPJZu6LJucAEgDLPO70fHCyXrXe1HN3htT2jNbMqRSCXd8A5FNVN23hKkKG7Zj6sntxrL1LtYg5vvPh8s9VTZBICpUZYtw16Jnhn3VCzTcp+dxZQ1zVV7ezUVTSCBoJS7/lMh+++x4u6BsTCMSPTu0Ini+x1T4x/syodbHjGb4fev907o+tzmJk6xsoww4XyMQXxmqS2gPDgKGSvFEpOM2vXfzrN7rLvsqtfZyu5WwEsmdgO6sgK1v98GI6YNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3tgdoTP45R7mTevZ5II7xmsCPxzS5xC3rrgpgmLBFU=;
 b=fvsZlW3EjA8AeyLOs7iw7jjWLDLyqqVk2vZpxf8SVDdLMdyl7xoXmGulsPKr6y8t3Rz0y6cCVZsP8M4oi5NPpqsrZ5ndeJ6mQMqYBWOIbjMkudAspXxzHJn2PSfuV6Tlpq9nPZofooOs4h8Zic7dxGkVKDMatPjZI6qKHgk92TA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by GV1PR08MB8081.eurprd08.prod.outlook.com (2603:10a6:150:97::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 09:19:14 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 09:19:14 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, karunika.choo@arm.com,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, nd@arm.com, Akash Goel <akash.goel@arm.com>
Subject: [PATCH] drm/panthor: Remove redundant call to disable the MCU
Date: Wed,  3 Dec 2025 09:19:11 +0000
Message-Id: <20251203091911.145623-1-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0249.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::14) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|GV1PR08MB8081:EE_|AM3PEPF00009B9C:EE_|DB3PR08MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 53aa4ed5-c20e-4c01-a331-08de324d2ea7
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?yhp3Kmhupo2JY69TDO1OzhsxYqsG5wUKIevHAMZ3mvMoSecu87W8l+i1FZxZ?=
 =?us-ascii?Q?J0JsY3TXnUHgRXRo2bMum25PRbaH1eve+CGyuZBqj1Jw7F/Ll++Bj87ETSCQ?=
 =?us-ascii?Q?7dXWk2EenEAcsCGoQfXU3jT7Jo4DqN6jdguLqCU8R5YFHs2L1ebZ17nR4dl/?=
 =?us-ascii?Q?yGi/reUIYdAzewkJRjn/ZOrPoU4+3UU64LMbuYlzTwfUG1KPDBG+ZyUtEp+2?=
 =?us-ascii?Q?iS/G9DDPxhJlX1OC2uZqqKrppKx+zqsIBAOP/RSfK1RgjUO44zV/SEkexsUc?=
 =?us-ascii?Q?qVFYkcZ6q2s5cOE4xRd19uLOtx77KxlnpiUzqtXeDUKhZDvqGUTufMi5ypD7?=
 =?us-ascii?Q?Z8/i/AF1O+Kj4tVcaJDyiVsVhTp5hmdhIRc9pME2CUUJC8Gqx/+aGR/bNHHT?=
 =?us-ascii?Q?d+MMv+jyElWGn3mdYEk/JX5jFnRreLPN8X28dMPNCeeKDbaOzBcmDr/zEhiu?=
 =?us-ascii?Q?nU+yv0a+SHoj6aAdOikOWp8DMbg6kAPSsLcwKSx7Wk4CI7Fo52G834GbTrVd?=
 =?us-ascii?Q?6r9u2mGJwma8mJHm0X6BxKdv7d87oFnK6twPT+RDituwBcnY3/EBYGySdiMm?=
 =?us-ascii?Q?C70w5BaCxhi0+d5LCV/4zK+KeVM/QumvwbbLwX0BJFuWJZsXsvcpkMdI2Uou?=
 =?us-ascii?Q?2vU7LxKyifn5xJmM3Mt95BiToX5+MlXrgJi0KYHChlN9fsinZSoU+vpKwxSn?=
 =?us-ascii?Q?hTtLXJBbojSZT6AjucKiFqE5yUuatyzKKHbq/QNebykSWYpYuMUblcWeRWa6?=
 =?us-ascii?Q?PfXjLog539WdFKW2nYlAKEQnNBX/vfFblXosYsi9XiLhABaOZza8/qL0DxjT?=
 =?us-ascii?Q?K3xB9nmOi/drVdm5ImztmOrh6dQpvlQT16cZGj8e0wfjaTZ0E+KnlI19TelH?=
 =?us-ascii?Q?Pwz7dHvZ2tKSjzG+qoydT4VFP4mh/rSCTBM10Qq4VnAItrSNF628NcjuvhNy?=
 =?us-ascii?Q?McsmNZGUOvWZbmelw0oqRs/RNx5Cuov8itibQ3CaD2rAXkCB564+DWwUq/vd?=
 =?us-ascii?Q?hHgdi1ohxfEH8oKdSHNALMWTBp4eGz7ANlsegosrLDGLa1aRcFDdw52HBPvn?=
 =?us-ascii?Q?MLrPVVsb0qaV2d7/vJCLF4JEu2VFVVYKvy3lD/DLe8fhoCn9n6t7T5SB4PdX?=
 =?us-ascii?Q?8643Q62QNvtlOBvCgpvxMEfSIFbED+nh+FM+MWiuW+g98yRV4WkiqSJiK7XV?=
 =?us-ascii?Q?N8px/kdvn1l95NaSZcYz6MdEFqT1mLU3/toL46QqHW831HMr5Nv5toP4nyiv?=
 =?us-ascii?Q?3SIDfak6iA6txgY+2nvi6x2ABroYiSOJWkALMLkDyautcpgGPoKxmRqT7nLX?=
 =?us-ascii?Q?lFSnQ5EPCt8lTkgV8MD06GptsTUv2/ndClDg5kFcSKmskKAeQ5fYiwv0VGvt?=
 =?us-ascii?Q?sKeZemB+RHc5TxuKV1GzF0St4QpUnV4Zu87v8VQqyQZFBSU37YbAVu/dSbD4?=
 =?us-ascii?Q?M3Yi3aowOk2QUJzq82FCrfFVesLekBTa?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8081
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: cd4b91e0-1ed8-421e-7c2a-08de324d06e4
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|376014|1800799024|36860700013|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7kGQvTEdG/Cx/PdEZYsQRXeypp7Nfmq8uSw82TNgnc6pkL1n0Vl6m2h76DSh?=
 =?us-ascii?Q?3XfFa245ctRQUsH5PJZ2Ea/nKx6gOMn1BQ8Z3ilI7mirv3riwhulmXZxBHdu?=
 =?us-ascii?Q?ygJten+ebs2Csa8LcIRO4NFuS0BI1uareTUaqhnjH3m4V9EMo6cj7QK0oaF6?=
 =?us-ascii?Q?mLoimW+zGTXVFabzZAzwG9qRdcNqz+GWEvA5NnxkUUKYRDL7kMVYe/Yfx5CU?=
 =?us-ascii?Q?4NxUMoY81J5zo4riSGa+IDqtEIKVxjdTEa7fPsbZi26H8+Wuga/O/ro9ZhmW?=
 =?us-ascii?Q?VK/Lrgg//7ZGkkzvzDObzf9NsMeG0jDGVJwkHpacPQ2CgFrBMLbhQ1q0KDVy?=
 =?us-ascii?Q?lsXniYZTY85FIMkFgsnop0Eq6XUFHf3qkuEJ1UjHOV1NyudwmYAQbsslnXkD?=
 =?us-ascii?Q?q+dTPwMZ7jCds/YAW78Aze9LBOPu640akh6VCyiK+7Dc3TgPFqXhHd9PPwXH?=
 =?us-ascii?Q?tg5RE0vKFKj8a7KOnV/V4nNtJI7xUj9mkhKyH8xMqbENVU6nuPVsHFoy53In?=
 =?us-ascii?Q?Mko812XX5ESE76SGsmQl3TXzu7BC8f8DGUrZBsTJZI9X9xHRm2Qnf1GXJi5x?=
 =?us-ascii?Q?718zJxlMEmhKGhwlMnXlKACoWRwIEqJZle5Afa+9ejPeuMjlO/L/HXRX8viL?=
 =?us-ascii?Q?2AgjDbIoJL0mW4rpHnsvKm98V6R0HVwPZ2QyNd/RVzvVRe9gsBHFg40vsFlA?=
 =?us-ascii?Q?YDetD4UsqC8sPJ9AUfzrBO6TX6+sNFBpAkSMdHidUEhEBMM1IvrDsfV+sqwk?=
 =?us-ascii?Q?4rI+ALRdA8UkgGP4DhpQ7FRy6jQZnljvjNez1iFGOQ5yqJ5aS/SKlHFi+yex?=
 =?us-ascii?Q?+J6FSKG0XlWTrqHdMuliSZKBAfav6d04FspR8d1k2gCGjGsvQDZ/lZ2MnC8V?=
 =?us-ascii?Q?yUcWC1gnL8m5I3BH9ozfP6IGf5iCoc+iPf/fUeuJAOkYoBeIqnsP7UV4K9kG?=
 =?us-ascii?Q?dOxFXPoX3y70PAFHJgXbcZfQE6eCVmSOa/0G6N5aXS/X1YQOw7KF0fnmS6Ki?=
 =?us-ascii?Q?dQ8BgLjYtt97+BSVtUYebPKYCrh4J/2JkU5uu7A6uaX+oxHL9CS8qCOEXFOd?=
 =?us-ascii?Q?Rm6Ig1SlpJDxzRW0ZZrhPpfQgNf++lJqfYsYeWmuELkH0lfbKbWMcmw1BjWL?=
 =?us-ascii?Q?XFXgMrx5qqYPecSwJNnZwPz8TTM+JfSh66i42MKPUgmo5qC2oi5Lq3uTcV9+?=
 =?us-ascii?Q?jTHvncsOq5RGZFm4ejRGKr1kv8NbgO88hJkCu0pE++UhOilLvNLdHvga4ReX?=
 =?us-ascii?Q?Na6fFi+ZqeMIFFRTr6hOGb6LTw4Gu7gexm1JmguhMqShmtTEqvQPrXfw/OVJ?=
 =?us-ascii?Q?s2YVbSwYwhxBUq/cM3x+OL2eBQsDcs4wJbIoERv8eK8swSACnRyB/S2Xzu50?=
 =?us-ascii?Q?NznSml6REzBSHmLKOewisT+S/OaHIRydTAtO43JgSMaUQ2/K8/yr8bs/exLj?=
 =?us-ascii?Q?/a+hWwZj1eTeFbYX5k2Mm6vSPfbi6WmtlW41ceG2uBTDOvcNGhboN7FD3iQD?=
 =?us-ascii?Q?Jzq4QRp0yS+ulBqLIOch8gKiXBL2pL76YySRgI2y/fHD8dy6VtR3oywAn6QE?=
 =?us-ascii?Q?+OAQ2bDdBztqqsxickM=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(376014)(1800799024)(36860700013)(14060799003)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 09:20:20.8959 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53aa4ed5-c20e-4c01-a331-08de324d2ea7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9898
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

This commit removes the redundant call to disable the MCU firmware
in the suspend path.

Fixes: 514072549865 ("drm/panthor: Support GLB_REQ.STATE field for Mali-G1 GPUs")
Signed-off-by: Akash Goel <akash.goel@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 1a5e3c1a27fb..94a3cd6dfa6d 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1187,7 +1187,6 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
 		else
 			ptdev->reset.fast = true;
 	}
-	panthor_fw_stop(ptdev);
 
 	panthor_job_irq_suspend(&ptdev->fw->irq);
 	panthor_fw_stop(ptdev);
-- 
2.25.1

