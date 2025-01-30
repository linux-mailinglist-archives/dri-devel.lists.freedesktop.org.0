Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E663A22D44
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F64910E959;
	Thu, 30 Jan 2025 13:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="hEh5SUK/";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hEh5SUK/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2045.outbound.protection.outlook.com [40.107.247.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B9C10E33D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 13:09:35 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qcrC82dmdebylNttbqYKMN6XAHXaXj22pwcIGnB6aOOh9zin7vBHppJBC7lsk+4WdHy17KDAGoAQnmJwQsfRyURcMeesukaQMhPYAgCZ17NYN+gNisx3YEWSwUwVJEdy1Wlm+eKV6G/3t2mk4c7ezqDTKcKHri/8FMEcrAbl9jjn7A1jZKzEtn96yD92HBf57QH5P3Ol+CdRqozpC/6lAYyyCHCGfG2b/t7/AjEaTdQH/nly3IroEwq2QPXav6pLVLqeOE/XuCrNUleKhU6Gn3wsBl4dMZTYy5mMx2cUD24OXWKZPnTxwLiHJVd4PCVITvLUKtlp4Ows080lCGDjrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXjSOSLsb7QXXz6LyVv3iqQW8mKVxWL8nBI4sm2ps/k=;
 b=MzHK9GWAL6BGWQE8gn/remDzfoM02AL+mPRqw2NQOKZbUr1sAVZUtTsZtdMWd6L0HwoXLfWQBuQh8fIPMqcE9zU8lNPprJcRTWxS6XbF80jn+1pEMBRH8BOoLgaeqHIweRurDy7yWqcveq70gaXi+up9T26AsEfyKNztOfCsT1n9IJX/6/vEOWlUoRhUosuHAfiQBsgzw1wylSsWr27Scg607tF397iL5amvGktifjp1IenTeLKPxGrTKEg2PfLnR2WyfMgl3j2VOLjDPDeAO8z6MReIOAPqxnd7bwhvm+IH55VkJeCXpZPlCWBl/HtXB4nENCK3Q7dQUw+ngFAB3A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=0
 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXjSOSLsb7QXXz6LyVv3iqQW8mKVxWL8nBI4sm2ps/k=;
 b=hEh5SUK/ps2zChagWta7nkTTJsSVck/fa2kVvjZpY8GIyO6pkNTTif/5uxVynkMpRyjwip7SmzVW6gpBDo9fdEtYtW3vPpyM4JyhUcg/SE9AkVQJB3sKPPmoCmyWrUEoqhPYYsywR0eg6QQ+fU/Bn1wpOZclCAmzO7K+z2jy7yg=
Received: from DUZPR01CA0191.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::20) by PA4PR08MB5917.eurprd08.prod.outlook.com
 (2603:10a6:102:f1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 13:09:29 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::d2) by DUZPR01CA0191.outlook.office365.com
 (2603:10a6:10:4b6::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Thu,
 30 Jan 2025 13:09:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14 via
 Frontend Transport; Thu, 30 Jan 2025 13:09:27 +0000
Received: ("Tessian outbound f30a9786ee22:v560");
 Thu, 30 Jan 2025 13:09:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 91e1c7a172a7e595
X-TessianGatewayMetadata: WkF+dqQQruReeSGG4qB1YousMuQFgCQ8b34WLS9XlQu45hD1Xm8qzM7/9y6wZNU2tXVPvhsW449KReIfHHfd3p+rsheA4C8aQBuwIwhD328exO0al/RbTvj2Ndzjwg7uF2JMd0C1de9LxCk62s6rEuR+H5SRNP6wsolh1S/dLI50tIxg3I7pE88F2zmDrOZEy5D2kbFSe1f5omcOp82Nrw==
X-CR-MTA-TID: 64aa7808
Received: from L35ac65cd58f1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3643363C-6AD0-4BF5-B88D-30EB6BE75727.1; 
 Thu, 30 Jan 2025 13:09:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L35ac65cd58f1.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 30 Jan 2025 13:09:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jq+h/dgtpkg9M8YFNEKEjh41GX+1Bl01T0kIM36xdQ/F/evRYa3qFzHKcm0b6kDNizlV/twZvfOiEfdr+egy3Qb80dLTwuiXgIiKoVtpGbe8y6scMaQ42ar3qqGK0z3e3xo4/71BAR7GE3229ayynYlpLm2EZEsdXGUoVI0Ty/nS21Jeruspw2xHGsnQVv/fylWCRooubfsUqJnOCCCaAzr0AOmxvrxfNM5mXU9VaxzfLpZR7h++HrmCcFoTbBYXOkjcVhrRfxgtLYGupsW5XFH93FLakNZDhKMRKam0y2iS49bgJT201/wufeWjBjdqL/8yAzErpjSgpW56pw2Gdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXjSOSLsb7QXXz6LyVv3iqQW8mKVxWL8nBI4sm2ps/k=;
 b=iAGqE0rD9qJwcOzvipNCjf4wsUHOExW+IYdcW0QHTJ2ygNREOBI2KA6QsVA2qBewUrk9/WtFcG+56dlYG0EKY63b+3qW1/r8oF1G8ttb0eMvG110N3P92iEkRWN7ukC3H5Doza39TFVOKHdR1h1l1Hpp/cXTuKcWnIra5LzH5MbUQZYFRUo2O6ZDMuxRKf+U+fqB18fdXkK2S+AyFo4OcnmZ1f6cCQ6inhorhXDfw38wSogVBVzp7c+q8xr9qnx+3CqlmLAyuoq6/nCw1fyW/nob3K25tsyqcjSnYC+6YD80T8B8hLDLRXbiAHIjxHhDaRxN3BG1M+6GP+EiQDQxzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 172.205.89.229) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXjSOSLsb7QXXz6LyVv3iqQW8mKVxWL8nBI4sm2ps/k=;
 b=hEh5SUK/ps2zChagWta7nkTTJsSVck/fa2kVvjZpY8GIyO6pkNTTif/5uxVynkMpRyjwip7SmzVW6gpBDo9fdEtYtW3vPpyM4JyhUcg/SE9AkVQJB3sKPPmoCmyWrUEoqhPYYsywR0eg6QQ+fU/Bn1wpOZclCAmzO7K+z2jy7yg=
Received: from DB7PR05CA0071.eurprd05.prod.outlook.com (2603:10a6:10:2e::48)
 by GV1PR08MB10789.eurprd08.prod.outlook.com (2603:10a6:150:163::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 13:09:15 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:2e:cafe::b1) by DB7PR05CA0071.outlook.office365.com
 (2603:10a6:10:2e::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Thu,
 30 Jan 2025 13:09:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 172.205.89.229 as permitted sender)
 receiver=protection.outlook.com; client-ip=172.205.89.229;
 helo=nebula.arm.com;
Received: from nebula.arm.com (172.205.89.229) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 13:09:15 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX05.Arm.com
 (10.240.25.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 13:09:09 +0000
Received: from AZ-NEU-EX06.Arm.com (10.240.25.134) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 13:09:08 +0000
Received: from e121164.cambridge.arm.com (10.2.10.32) by mail.arm.com
 (10.240.25.134) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 30 Jan 2025 13:09:07 +0000
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
Subject: [RFC PATCH 3/5] dt-bindings: gpu: Add protected heap name to Mali
 Valhall CSF binding
Date: Thu, 30 Jan 2025 13:08:59 +0000
Message-ID: <36b57dcf20860398ba83985e1c5b6f6958d08ba7.1738228114.git.florent.tomasin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1738228114.git.florent.tomasin@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B89:EE_|GV1PR08MB10789:EE_|DU2PEPF0001E9C0:EE_|PA4PR08MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eaf8ac0-73c3-4c6d-2818-08dd412f539a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?JqMW2AHMxE6ja3EPK3WX1c429zqIyYgdP3UkhafeyaEQMrUFNfObPmHbm7gI?=
 =?us-ascii?Q?wlh5REPnLtSX6R4Z3FxHZ8DNLooMvpHwV/H0yVdj447BMrgxFERuI2e1thq4?=
 =?us-ascii?Q?ODn4zHt/wFx8Z1dZ6GD1stfBmgD5gJMnI6wJRvAEP4FORfzJcLc8sTrVNaxr?=
 =?us-ascii?Q?JZAqNiz2oIXEkYuWLCgjs5Uznpy+8aWgFnXyWJBY2QI3BCk1ucMWSN2uGn5+?=
 =?us-ascii?Q?DkRR5M8bWEAaFc2LTUh9a0+rWHz4Ag5Nc+VY7TMBM/OCKPAqU5LGYBNI2oVF?=
 =?us-ascii?Q?s30PJF/D0MiYq/wVccNWDVq4/R7ov7ObsNPJXeRc8VK7NgLcdbtMLr9pPEqN?=
 =?us-ascii?Q?mUMb5DFDEt8A0BCu8A1F+r/IFaaliRk7jtFfKQvSy+aI2jHfHYRX2EhIPkOD?=
 =?us-ascii?Q?8Yrmrm8KHAkxPC1XPlQIY7qbJoOy0XlKJYsohvyY3mmn+wQbvFpLYdFiWIF6?=
 =?us-ascii?Q?gnI2QCUKiuSSw3smhSYnZqwRLDCnnyf7oqiF+fOuxlyG5dWCfT1NJuxs+GmE?=
 =?us-ascii?Q?RQpVYrTHzIXh3uy1FDyxFaJa3tnK6CTzmuNdsbhc3tFjxdbh8RmI3vuspvjb?=
 =?us-ascii?Q?g228UQOaAVKbXVsy4BV47c3tfJuC0b6Tzw5WYAt/k+52YxYeNQHS3M0Ia3iy?=
 =?us-ascii?Q?1vlHkcmBVC0NEpShEloCMyT6zt8gkToTf/aatO9nfJ6SmJiAkzz+ZdhytInR?=
 =?us-ascii?Q?bej0lX8pPjcSjYEzjkf14vh6GdOP93JrYApyJCufIaaPXEl3+7M3M1gGPEtm?=
 =?us-ascii?Q?Kry5KUQ/UBuyf58jZNtEDnwMwH1xaYUYCHqzJf2T9CL8aWTwHZ3vwi4qS64O?=
 =?us-ascii?Q?udG7NkcQTH7eUFTpGEbi1PIACMoZ96nhtZ3DuTcRygFveBKMh+wCCSGVmjfi?=
 =?us-ascii?Q?9IQAVt9p2AzytoqChr7sEMSQ8Lf2wmIPz4UXlhLD9x9o3bnyLXcXtsnFczq8?=
 =?us-ascii?Q?UmyeQiAG7YYazDQtLCfeABS96ldo/Hnz5MM6qyR0/yLy0k/+PRCRR1bgf4Dp?=
 =?us-ascii?Q?TTJOvAukFnJEzZNN9M6h9d/P/fPoLYIuHKgZMeugdDXAeBYGHKL3JHuh1Ip/?=
 =?us-ascii?Q?E83ivxq7okmDjWhWtA0Mri8ce+0Jz3TF2xFVgJKjQlPsnl5WR9NKAq5Jzvzu?=
 =?us-ascii?Q?bc+b+CZjqeTPAtrjtS39jBsIAxnhTdxoagMK/uYRkXXg5nY2vSH1KETEX9NE?=
 =?us-ascii?Q?mPVuL7GjdiNUdLqFOWtFB/y1lL7QbEa6vGMxDbtFp8oVQ7orcmMR6xewieve?=
 =?us-ascii?Q?hGQUp1Z9UYYjnfERoSK6PENS2/VzDD8wNvFWMKpMqIcST/wOvM0Zy9zNzw9d?=
 =?us-ascii?Q?k0EUAyeavfv/Bh5EMyzTyXmr19MX1FOUvUQtRTnwP4zAiX0ix6QdRF9UppvZ?=
 =?us-ascii?Q?VAfUkf71/e/rcgeFiU9mkmrQUU5/Yn63KuswELqIkmB5MadBbpoIfCJOkQEi?=
 =?us-ascii?Q?c6K0d0zXRNguNSRxS2C8b2POYy+cwHY4rN+5Jh+ZxhZNxt3LvLqRwg/uIWjF?=
 =?us-ascii?Q?wKNppRPyMfMOPXu9h8HqxHCHDCE2xd1FNVFX?=
X-Forefront-Antispam-Report-Untrusted: CIP:172.205.89.229; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10789
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:2e::48];
 domain=DB7PR05CA0071.eurprd05.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f866a139-ca62-4d86-fb34-08dd412f4c02
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|82310400026|36860700013|1800799024|14060799003|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wPQnEXfae60eM2ZRs5fQj5aaIVxHYyopV7nhyaZKpB2NcqwEwRXtKaFMp/CX?=
 =?us-ascii?Q?NkQVEIur4LWDL1WDssYu+vbzNR+E4csTlCLNIO/eLSrTDkaTtP9VP4O72Gm2?=
 =?us-ascii?Q?VACm2ssbg3GgFs4OWnp3fqgul3bi7+2DchrzpZii+pS0q09TjS9mPOyolMc9?=
 =?us-ascii?Q?5OT7BkfLHot18TDD+v7GV8gLZxKEmp3Xk5DGf5dI7doydoLkQ4XE0u/HreYF?=
 =?us-ascii?Q?+SoBj/MSrCkzJT542yKhY4dtwZEu9YXogk0pMZmeC9CIJvV/M4+kTOwEH8Op?=
 =?us-ascii?Q?VUe42nuycCDtEcKqkuF9+6tti9lmgmktTDkkwcH2fMJm8gUv6FVxPTB+aSV/?=
 =?us-ascii?Q?WLArDzJPRUWpwC00qjm3Mxyijh9id4IDN9WAPvrq/CrDvKVknIemROk+4XLN?=
 =?us-ascii?Q?+sOjlH9SXYwd76qWPjlCMPtJ8yqt+LpjDrtGUaHVI+9dtuhoixTUPAQfJFOy?=
 =?us-ascii?Q?Ej/SmV5nuhKYXxTDK+JKi6G2z0D4T+ZNBlxYdUvBOO6yLQzSJ5nuPKEDBWhK?=
 =?us-ascii?Q?dD0oJnr3gy/JMF/nXhETwWURVHEke2cxlAoIecwHvOHbDGS+tAOcATmgvBsF?=
 =?us-ascii?Q?S4xONgAhI7kXHIzLV/xHFn1ytGBTpznptGP6dM5gFT9aKeQ7BZsb5Lb9NutL?=
 =?us-ascii?Q?kPRYTpn7Qo5zswjISS/awHRg+Eka3WkrbDK6J8Cw8DnEBmHoR9TPhY1LAenr?=
 =?us-ascii?Q?QG0ayLogkm06lTsLMS0Oxpk81QzNbQpUCDTTiofatjIrmdHvi1RsEwoqDenS?=
 =?us-ascii?Q?K/yOxOe7wf9TE87xpWC283+i9KIR+fw4jLUpWNz11VB7nyk7/TvHzViGsIkP?=
 =?us-ascii?Q?awp4t6dBh316Pei8iTTvxLpKOsIgv6+SHaVKTNxV2Nf38spZmAA2f/0Vfi8z?=
 =?us-ascii?Q?IG79Ga7wXRgnsiTsxt17jkWWFCcfW4sle9EOhZ0qayNyrxtRzUmLqueQHY09?=
 =?us-ascii?Q?jv5Gi+eQVQ9zwUQ7xvWiLdVN4Ig0RNG/DuqS4B6+wyk0rTsAqnTiKAJ6d6E4?=
 =?us-ascii?Q?7EOteeVz4tHuYiQGrQrqKS5i0Ogq1MhBKiGkan4JctjPTOZUm/7NKGkYHmMK?=
 =?us-ascii?Q?gjKNRfnU7JFsVp/HL+bB/0HZUomxK19193xWx8g6R8qsUjtUZeCMsp4TcRf8?=
 =?us-ascii?Q?+2QWkyRPavv2NYwrE838nHn7XZS7gOoUDrN9F03gOVhfwjrbkgMJkOnyIh+O?=
 =?us-ascii?Q?tfWt9n9OrEZO0v2G3hX8FPWXKMvwV3D13jdrTC7PA1ySfdNwKuQFWGWzGmJm?=
 =?us-ascii?Q?wM7Y5w4NAdeUnfmGcD/5CcN2FMfx0pI5TKqV+e8jT/RbrsHYEAOiUOksc25i?=
 =?us-ascii?Q?yKk+1Tfqtjab1ixFrpghUS8HNjE8C9sRy8HUAQiPAKfdz4M4lb0Mq6vG5H67?=
 =?us-ascii?Q?ByTFmJqXKIdlH37/M+I8mt8nE/GbY31APqTBZdZSC7pFrRA+h9gPtddED7BC?=
 =?us-ascii?Q?62eUcDChj4RlJ6hmMttfuUzV7gOSY1k9VY5gD2de/eMmdbOJk8Dh+XWr315h?=
 =?us-ascii?Q?P7q/lP6XB5JXX3I+l0hLqsNWvsoTKAiIcBi0?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(35042699022)(82310400026)(36860700013)(1800799024)(14060799003)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 13:09:27.6014 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eaf8ac0-73c3-4c6d-2818-08dd412f539a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5917
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

Allow mali-valhall-csf driver to retrieve a protected
heap at probe time by passing the name of the heap
as attribute to the device tree GPU node.

Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
---
 .../devicetree/bindings/gpu/arm,mali-valhall-csf.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index a5b4e0021758..dc633b037ede 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -85,6 +85,12 @@ properties:
 
   dma-coherent: true
 
+  protected-heap-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Specifies the name of the protected Heap from
+      which the GPU driver allocates protected memory.
+
 required:
   - compatible
   - reg
-- 
2.34.1

