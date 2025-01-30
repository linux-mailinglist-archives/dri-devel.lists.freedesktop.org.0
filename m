Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF1BA22D4F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972D210E347;
	Thu, 30 Jan 2025 13:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="dmC+bpbq";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dmC+bpbq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B10D10E347
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 13:09:48 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hVHVZsy4UinrALHKv5867+dH8kn8/EwBaULsKApxXxC3AkuLlSAXrOM3o4Ee44A6cdKlZIi4/5Cz6ngmwgGZG8ehlUmcHghUBgE1ML/kiAbKthOh1FJgXctNaii2irwpdlUzKAerfART+vSbiqOUhcCRuN2VHAwHenzhIoFtg3WRi3OxiAqi/s7/E4LutlAvdxAEXVqp8EwIVo3c4WTf5JF9UtPR1E0FyrSCE05Wk31HYdfXxasd8uq35VOC6+FGxGfrwaL7u3nxLNjoOZYyztD57qpL9oGgzZYYJRXHn/dnvULanvE2WFlELA/L1pHfyPSgJW9SHJL4xsN7DvHD2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgaCamHnxvPMXaZFSAc1/BOzJH3l89NFFvdMd2pfmO8=;
 b=n/zJXn+yX0zRV7t5hKSJbeLgDSoRJzGSSzc45UELjvw4t9mVv+5T+itpMJTGG1fGKmOMwf1d9U31nK7as5DFiLwvPqK7H8r8M6pe67rVLiq2eFK0m0KrtJEwYg7Tg+DSL4/c2oK1NfiUW52P5170Lba1SWuCrzCJQYqjpKzh3kkdplRkydTpGsEzdFP+A2T+osLfNCL9P0nkL+Y9xnKLZWHH3EtW+0xcWbwbNIhe9YA5ZCA0Oh3Q4R0SU2gaeT3QdyRM2vYcgOwLwSwUYfIDecq21vXR3t6r9R6hEmBua31saTQdG/h2KmYKdbQW1X2JA1okwyv4O5Jvia5tHFsrww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=0
 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgaCamHnxvPMXaZFSAc1/BOzJH3l89NFFvdMd2pfmO8=;
 b=dmC+bpbqsqNQNwGSG8FQ0oaJwBR6z8iZ6lnDuLWWxDwOequSaClXVdbfZXxqBNJNMbXXaSr4R+Te8pFJ8HeXIrQjQBeLnwXybISI5+3hG3mmisqfJ24OOm3YmKQIMPy1HA/95d9nxKuq6jwpQ/GuyV9/VLObdcpxNl3lPrbIl5g=
Received: from AM0PR04CA0131.eurprd04.prod.outlook.com (2603:10a6:208:55::36)
 by GV1PR08MB8691.eurprd08.prod.outlook.com (2603:10a6:150:85::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Thu, 30 Jan
 2025 13:09:33 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:208:55:cafe::43) by AM0PR04CA0131.outlook.office365.com
 (2603:10a6:208:55::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Thu,
 30 Jan 2025 13:09:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Thu, 30 Jan 2025 13:09:32 +0000
Received: ("Tessian outbound 671aa0ad34c4:v560");
 Thu, 30 Jan 2025 13:09:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3b96bd91acacdd57
X-TessianGatewayMetadata: qoVaNJHo09g7Nr7WiHlnEBFdWsRJB86Jj/NwpEIIV1Qq88fWkjIEUWHk+pCw1TL7pUy+TLEebcJOBSpZN7EgS0ol5XZzuTyDaNnuFpQ6xF40pIoQcfXKCTIdNoBADG1ONgGHHMq20bCs8l4tVPN+DvhO2Hy6iQETymIfAALxHbX4frIPiHLUbNYM2hvY+X5J7eSYGku2M8AuZnlReqTqeA==
X-CR-MTA-TID: 64aa7808
Received: from Le713702a97a6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 53CAB092-6D8F-46A4-93F9-AB52E14BE0B5.1; 
 Thu, 30 Jan 2025 13:09:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Le713702a97a6.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 30 Jan 2025 13:09:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NcYGZlKtG/CiW2quSQm53ORx3ZwKWmz5l/J/qsZAdT96OM/1Cly36e1DrVpOrHtRpTcYGc31DLUsuzkpONfyiNpH1ovmGek3BntuXp9NO0VCHvsZRhlUsc4fFnWVdocmEfgHrZFPiUVlzuSUPK+kHQ56Q07ep5u3MLhh/gFBsr0OYm5e8CTYQzeGF7iGGR/z6qZ8e2Uwlco6JGtYOs4pUosIWk1q5vC+7H+iK/C5X61rXyWMJ6km5pFa302DMUgp/3Z5POXykrXWd1efcAC97BKjLNORXuYUJy8VW6kC1+LZGe3Pb+wnZe/k5Nby3KBMO2yF34SxzGuNHn7bOInd1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgaCamHnxvPMXaZFSAc1/BOzJH3l89NFFvdMd2pfmO8=;
 b=D0WhO/Q/XdUsh8ikXb/MvammaXbC/hohJqZdJ60/yhGBjTGaD++zetwSHqRXRDiGA0VQctwhvbGWtI48aLGOLsAPryXS882x83K1X1gBhg6fTZkc9TJV5Weg2bfbGsHHeX3YW4CQXjHxLJjxHkuhw+Uv8ciKEWtCS8ywMewO7jDIhYaR0unFnEW8i3wXzwd61TaxbcKe533CHAsWxRZ86EFefDw2y/8QvSP9JgHYs3THlAPAevqmwfVvw0CkmsHq5FmUEnKIyEs7CR1vqILbiUSz0dcDCwJZpJ5BUrRfqZXfxcdxzY/m9uVg6ToUvb7sM4poFbFX5pBZT8DoSjjROg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 172.205.89.229) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgaCamHnxvPMXaZFSAc1/BOzJH3l89NFFvdMd2pfmO8=;
 b=dmC+bpbqsqNQNwGSG8FQ0oaJwBR6z8iZ6lnDuLWWxDwOequSaClXVdbfZXxqBNJNMbXXaSr4R+Te8pFJ8HeXIrQjQBeLnwXybISI5+3hG3mmisqfJ24OOm3YmKQIMPy1HA/95d9nxKuq6jwpQ/GuyV9/VLObdcpxNl3lPrbIl5g=
Received: from DU7P194CA0027.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::7) by
 GV2PR08MB9374.eurprd08.prod.outlook.com (2603:10a6:150:d0::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.20; Thu, 30 Jan 2025 13:09:13 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::e2) by DU7P194CA0027.outlook.office365.com
 (2603:10a6:10:553::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Thu,
 30 Jan 2025 13:09:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 172.205.89.229 as permitted sender)
 receiver=protection.outlook.com; client-ip=172.205.89.229;
 helo=nebula.arm.com;
Received: from nebula.arm.com (172.205.89.229) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 13:09:13 +0000
Received: from AZ-NEU-EX06.Arm.com (10.240.25.134) by AZ-NEU-EX06.Arm.com
 (10.240.25.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 13:09:06 +0000
Received: from e121164.cambridge.arm.com (10.2.10.32) by mail.arm.com
 (10.240.25.134) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 30 Jan 2025 13:09:05 +0000
From: Florent Tomasin <florent.tomasin@arm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J . Mercier"
 <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong Wu
 <yong.wu@mediatek.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <nd@arm.com>, Akash Goel <akash.goel@arm.com>, Florent Tomasin
 <florent.tomasin@arm.com>
Subject: [RFC PATCH 1/5] dt-bindings: dma: Add CMA Heap bindings
Date: Thu, 30 Jan 2025 13:08:57 +0000
Message-ID: <771534be8dfa2a3bdc3876502752f518224b9298.1738228114.git.florent.tomasin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1738228114.git.florent.tomasin@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: DU6PEPF00009525:EE_|GV2PR08MB9374:EE_|AM4PEPF00027A68:EE_|GV1PR08MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ad0537-4039-45ae-a878-08dd412f568a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?kp7y9OlcNnlxCGnxZwdQsMAB37oeT5uUdoygQ5PD3ph0+XkNzmSYUKIvo1Rw?=
 =?us-ascii?Q?vj7CuGFQF9RsvFkRJvRVhl6moydjlfwp+6lTi8xaBVFPL/fnvV7BC9Lb8HBe?=
 =?us-ascii?Q?bBabXoZ0XKkW705JdLXytHzZCA9bEUA5qAQ9PlJnc2374P8Q5Ovivfu2O5fQ?=
 =?us-ascii?Q?iUUTo3NKkaWAD0B5oT2PDbBGvlu0W1chD+9nmd5umC0fd/yh5eAZc8RacAne?=
 =?us-ascii?Q?05jvopguUjipA5u1HlJSytE0VQCkyqHk6NnUbiU+pRismDuh7Z+JNo/04G6U?=
 =?us-ascii?Q?iP1Dt11x2g9M/w6MHJKQD1+Pfq2J5Nh+ywbrrKh5ONG2TwAny1kM3vbEwcJn?=
 =?us-ascii?Q?CYdwKGte2csmQThyJlmfDF0ktDhDs6TlaZaj2i+7O87IM3HodFzf3BdfFvsR?=
 =?us-ascii?Q?gsFfzvio/OfYQdIYmqb13ZYIKzXcD0DTKF8Mt5zGZNkJA/fZTX2eXH2JxzRi?=
 =?us-ascii?Q?pdz+JmF5yN8gKnphfzNHky2jUW64ydHf9NRFc/YhnNwTA7aTjTjnAf2WCi2C?=
 =?us-ascii?Q?F+FD/8OeLVZomq9s65jFPpUrpqELjJAoQezS8y+TKKzual1ZcQwKOMr5WESC?=
 =?us-ascii?Q?vtzehZQbj4Bd1t0H2DnGP+xGke3ft6WKTSPadthR2PKcXa983DtMN6sHGiAI?=
 =?us-ascii?Q?qC/PT3E3gYnry8gJ39Y6eUzO3T+9UoLf7hJuegXMaljtSJgrBU/zcc2lN/XI?=
 =?us-ascii?Q?JDTzSOGrRrtvNflqmYHD8q+9oNG5f6QOZ9fLW2fFHGQGJ1kQPyTdUHRzn7Di?=
 =?us-ascii?Q?9rWukmDYF2iKBX4BmgZENboTuTFxRZCkmAuVHuwXWp9U32cKBMmeqQZAXd0S?=
 =?us-ascii?Q?XNVms56q5/Rv9u92OJne8U7vEb8izzeA60A1jXCNGk+wAXdeQAx7CAMf8F0T?=
 =?us-ascii?Q?/c3z7X88mzK5NzxeDQqJXKtkLXAfCjhYjLK3TyAeVmAvu5l5iw8Ldyifs8n7?=
 =?us-ascii?Q?PQRzEf/36FkM2wYq0OJsuV4w5Vv3Fkj5uvY3XjBqo+dyokTHl2q6/b+Mm45W?=
 =?us-ascii?Q?477f5qiPIau56UvBAnVPGXQpDeUsM2q/PLTc+UTVCauz9UjEibTW/9Yj62Rz?=
 =?us-ascii?Q?UmiEw6fhkhKGprpFjx0CsXrB26CO4TYkIoyN3rEn6G+Jv4UfTpcTHZGe7ZRy?=
 =?us-ascii?Q?Y2lf6RMYMFC/AvFW+go0r5ezEjsKEDRJtIhiZfjFE0KfiU7y3Ur0ixgKF2Oj?=
 =?us-ascii?Q?XULmlEhPU0i1o0EIJ6Dm0bVHjZuWRoLCayxCdf5ZvxvnH04HydeTtXbphzH1?=
 =?us-ascii?Q?LJ4ZOabhm2et0uAEkZnTFwHPLBnuLKIKtiQl8HtDs1hj0CEt6VVYjJzgGGww?=
 =?us-ascii?Q?YdhdjS645rlwhKFsE4izav4zGBX0r+FP0D2Jgmz/rYs9VXJJjsPN27pfDw5z?=
 =?us-ascii?Q?/cwf6YAVHmL7lN9qzjqB9fhp5CegXNaskjko6SHoQV2av1nJFeMbqsZ0r3R4?=
 =?us-ascii?Q?GgTu3XoYa5ktMxeN6jl3m6tJ7yu0gfP9?=
X-Forefront-Antispam-Report-Untrusted: CIP:172.205.89.229; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9374
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:553::7];
 domain=DU7P194CA0027.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 250177de-9e0c-40fa-488a-08dd412f4ac8
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|35042699022|14060799003|13003099007|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TrfzJDYWXfnRg3DeSgBMPKWDlFDbC4DGIyZvkg8Xs2xf7SsKzRg/9Z4LDIRu?=
 =?us-ascii?Q?48+EN0AgWSCTifYdj1tt8rmqieAH5+ZJMVFfsBDwaspbscE8ClL+Aqt8GxoS?=
 =?us-ascii?Q?ivzZ7+akudKGn8z7v74/7hrJkRRHZDXCa6HckHQxmcQ2ruxzlIBvPZgqs3DU?=
 =?us-ascii?Q?DqUAdnH68bLr9NLlBa60xIrvSGdfc0c07ne4DVE1/aVZdoKcp24/TeWKP+Lu?=
 =?us-ascii?Q?OER6lFTW7IfsTh0mUdGkI6482JHtQJOK/QImQn9M2U5VrsEpTC1Ix7Ye5tgI?=
 =?us-ascii?Q?wBnGnv17rYmkV242P0rKe6RYR4iLfbp5DU2p82j/KbGB5Zz2SFG70Uq3g/oH?=
 =?us-ascii?Q?H7l8YLXJzdZyMWPjqoG0Ne8Jlhs1uqqvbEbhdV1SocjosKYQEpowTj+6S+je?=
 =?us-ascii?Q?DvVE/ClnDbeSvsXuPplCUrowZIWKbLmlX6z0Xj6+x8pdLr3EoGN1/MYeGTQq?=
 =?us-ascii?Q?1AdTjbFFP3+qDtXk5mLSKubKNWtRjkXnQFfo8ZtQRpFvg9SsHUNjtN8F52vX?=
 =?us-ascii?Q?c8nMbSgvieHd7POJb3KUZMCD0mWIo8OhudwsTDJ+PgmD1KVxAKhd9oGytzVn?=
 =?us-ascii?Q?oY0gqS6wRSY77tVz1WdVI0WuLUuF0wJcVqcAAfcuMjGxgyHhbVzUhPa1V2A8?=
 =?us-ascii?Q?lOeJi/LbX50QvKqPjq9JuCMeZn5sVb98xXZID/zzHUzs57tAdmeOVO3tX1zS?=
 =?us-ascii?Q?MqJnNfEz5yUZ7EDCKFJa9bWmtnUSbsKINw/PZtVibhyYFG26CKQv0fGl8c9m?=
 =?us-ascii?Q?CU0Jf+EhTYb1jhyQl+FkE9/gXuyLjVZGXQlCZQpSLQlt0x/F8lTJIDKlT/v2?=
 =?us-ascii?Q?hEGPfTcVC3vwxqouZxBlUY30NFYVX5jgLIvQM+6EfHJLPqnVKlAqYbSffYPZ?=
 =?us-ascii?Q?Wu6wvfynAntXw4/tKIdV4qgzCft2E4yh/Hmkncl+2rq5yFwvBDvZ0XownX2m?=
 =?us-ascii?Q?AlFFotWxtqPw6QMKri+WORTi5Hf6lmIyhOLzddrZSWUOLxkrO80c8FDeKj4i?=
 =?us-ascii?Q?45ISm+P/WoPh2UCXzSfOShYB/5KeR8U+tlr/Ck5ggZAz7b9R7CTCjz0KAXLn?=
 =?us-ascii?Q?w0MFQg5MLiL5EQGPLyOH2aJVofaI49mKx2CkmreW6/aMgg8sWvyq6XpzhSRf?=
 =?us-ascii?Q?JydqC3+RaabIyYSz5neEm8XbtLc+AtwG7brlfn/Yz6sJTTRnjxts7IGDR347?=
 =?us-ascii?Q?lRRlUToStg0BCg05JyYuBHuE+R/LXZuxXuTEwke0PJta69LB0dpYILurF814?=
 =?us-ascii?Q?ys+LQUg3BcldQjeZ42Utydz0MgrWCJDU3J6ya05j14sULob2ZFekTomq+P8Y?=
 =?us-ascii?Q?H93e8Lxqg1m3guqZZ4DrW/GgQ5cE0CZJVyjSgz9rBPk/JJJhsZ5Ob4782DRU?=
 =?us-ascii?Q?xyLmpMRSKPrxUcdkF1l5RU2260CKDorV+cVvREM/dIkqagGuExdV5tn59nV3?=
 =?us-ascii?Q?Dr4ZDO2uBoEh7dKiAxNM14hxAgn9n53I?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(35042699022)(14060799003)(13003099007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 13:09:32.4862 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ad0537-4039-45ae-a878-08dd412f568a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8691
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

Introduce a CMA Heap dt-binding allowing custom
CMA heap registrations.

* Note to the reviewers:
The patch was used for the development of the protected mode
feature in Panthor CSF kernel driver and is not initially thought
to land in the Linux kernel. It is mostly relevant if someone
wants to reproduce the environment of testing. Please, raise
interest if you think the patch has value in the Linux kernel.

Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
---
 .../devicetree/bindings/dma/linux,cma.yml     | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/linux,cma.yml

diff --git a/Documentation/devicetree/bindings/dma/linux,cma.yml b/Documentation/devicetree/bindings/dma/linux,cma.yml
new file mode 100644
index 000000000000..c532e016bbe5
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/linux,cma.yml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/linux-cma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Custom Linux CMA heap
+
+description:
+  The custom Linux CMA heap device tree node allows registering
+  of multiple CMA heaps.
+
+  The CMA heap name will match the node name of the "memory-region".
+
+properties:
+  compatible:
+    enum:
+      - linux,cma
+
+  memory-region:
+    maxItems: 1
+    description: |
+      Phandle to the reserved memory node associated with the CMA Heap.
+      The reserved memory node must follow this binding convention:
+       - Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+
+examples:
+  - |
+    reserved-memory {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      custom_cma_heap: custom-cma-heap {
+        compatible = "shared-dma-pool";
+        reg = <0x0 0x90600000 0x0 0x1000000>;
+        reusable;
+      };
+    };
+
+    device_cma_heap: device-cma-heap {
+      compatible = "linux,cma";
+      memory-region = <&custom_cma_heap>;
+    };
-- 
2.34.1

