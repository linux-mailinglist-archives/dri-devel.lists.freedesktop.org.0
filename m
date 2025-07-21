Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A914B0CCAB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 23:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0F510E3CB;
	Mon, 21 Jul 2025 21:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="nGWbgSv3";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nGWbgSv3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62F810E3CB
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 21:36:16 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QABzHuDt3SsVp8cEcTgyN6g4Btp1qBUSPyDK5VRQnW8n41yyl8WaTwhUsYzPWiPetHHogY42N6lGGxnryDU/3ZrCVCclFY5YlpMOdcS697VlkBRS/KvvO+n8zOjtrdsVryeaxW5K1Z1E6ICQ4UjDAXVGPtvcwuhUbSU7PHcSFPnDALQAyolpyNlWqcn8dScAZh58lTJaTkrGJ0Y6KjfZFYod+62yUrofUqWrV3z8bP/5M4axddfbuXcrCOdvt8V7ISd9ldaqxFKJt8aTFz4jaE5X0Y/e0Nms7xaJe3RVaLYAZsf/b7HYyKXSKN+xKi1B314KYbj9tF+0R04K6ELVxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S86IB3YD/YPwEu7Pu/+bah80MvTBxIN3oBtr/78wb3c=;
 b=O8QdXGQ6g1DKp4jCr96bu4Ztd1FiuuSv3KjC1oHx0bk5L0tej6rpR/Ld1wdWFPeQZ72gBLzUVDRuh6Qj1gJrSm5rVhe/NR17ucRLnKRSi0+Zw3uAqeu8HfmaVu1ixAEm1M7dPTqx4sbqrBLTUfb9lPJFwUKul37+yisMY12UAfQRKuCe4KfIC/vwUVN2H23ooCLtfWp6IAMPnzq8TAJ4VL/CJeGYPAOBrZf+qtCkvVFVYAICXjNctzGjppoWMaohEm9dHjlqFHnNf5c6eM37L4Gk/vMPltammhhdlk5psMyV34F0BTazWjcZGRWIJZYtYbyUGKdS8LFTLbywwBNQJg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S86IB3YD/YPwEu7Pu/+bah80MvTBxIN3oBtr/78wb3c=;
 b=nGWbgSv3/VGhmF1zzSVsdICN0fv+67yV6ixDmAlMGl7hs4Gq3AHPwejhA8KdOsWIGss2MEOKCg0QU9ctUEVokwQlWJg0Qn7kCL0m+zZgSOfoaUAcnFGlXQbByE74Q47gVAy7yeaQ4hPPuvlJfPJ9+/bgsJDtvm0Q7qkSo8MX+Ps=
Received: from AM0PR10CA0103.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::20)
 by DB5PR08MB10189.eurprd08.prod.outlook.com (2603:10a6:10:4a4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 21:36:12 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:208:e6:cafe::4d) by AM0PR10CA0103.outlook.office365.com
 (2603:10a6:208:e6::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 21:36:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 21:36:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeoW33UcBqkzLhQJ6ljDhStjWyuu7RpVec4pBx/SJjv15znKbV1BBuBeKoUUyiTqHVeRyrxm/fAXZ6dzmT6bZ4oMH6QXqQUNMJuCIyv01x5nbupv1cO9V0s5UQJ+sQePHx2o9K/U4cfIeL1seXgvHuGDVcrxO2flfA2gc3KRkNoGfZrE5kmP3Fm5S78PZw6mbsFMUI6eY/EyxBh71KFDvo07yL+0b9Z4gexuRgCiW3lNN9Kfd2sW7U/jK5NycfSHNCD/jlyWsswHusSNWpvioH3yb8gc5Kek+8jVGGE+bOp/7mgopPRQq9SfSYY9WceH8lOvMgCyWYVXNYf52OqCww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S86IB3YD/YPwEu7Pu/+bah80MvTBxIN3oBtr/78wb3c=;
 b=J0QznhSZQ5qSnighOsuIBckh7MSq7bdnxXXDsDhclx5qeBTc1D/GHK5flo8S+kJPNgaSR+Dpfb+I5eHXMZCOvPrBioD5YOaabqUdLEDDgTwxcYX6cNyThONSC7ObEyOck5V6BoHyXtaS2PytRtQE9gNh6aTazPiWfwR2jRtRNBIX5r8LGG+cTHvrj3WMlgSqvIcrxvN1LWsyzoDMKzyBWP0ydp6lL3LGHl1aPLyJ04pymG9H1t4HiodSEo9uMhsI0dOdBjY0uUC8njhihwqdZLg5HOkHd/Gqc/11WoUDDI80bncG+Pv36LMUGTDIgxC9zDcMf+5i3O6ps9aa/XlHzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S86IB3YD/YPwEu7Pu/+bah80MvTBxIN3oBtr/78wb3c=;
 b=nGWbgSv3/VGhmF1zzSVsdICN0fv+67yV6ixDmAlMGl7hs4Gq3AHPwejhA8KdOsWIGss2MEOKCg0QU9ctUEVokwQlWJg0Qn7kCL0m+zZgSOfoaUAcnFGlXQbByE74Q47gVAy7yeaQ4hPPuvlJfPJ9+/bgsJDtvm0Q7qkSo8MX+Ps=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by PR3PR08MB5611.eurprd08.prod.outlook.com
 (2603:10a6:102:85::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 21:35:39 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 21:35:39 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/6] drm/panthor: Add support for Mali-Gx15 family of GPUs
Date: Mon, 21 Jul 2025 22:35:26 +0100
Message-ID: <20250721213528.2885035-5-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721213528.2885035-1-karunika.choo@arm.com>
References: <20250721213528.2885035-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0228.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::16) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|PR3PR08MB5611:EE_|AM1PEPF000252DF:EE_|DB5PR08MB10189:EE_
X-MS-Office365-Filtering-Correlation-Id: c52ba05f-26ad-4661-174d-08ddc89e9c67
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?YrrzC3Em9X5UKxrgvSfgpXqyROTbrHKpd4JlOAQYNwqC7NA9tNUI5/zksJ77?=
 =?us-ascii?Q?uuEfYAEJWAJBvCTmHcW+m1J1hBCxHy56SzWm+qT6x5mKblzwfHObeP6Nhjkd?=
 =?us-ascii?Q?kupvc7tZ/vDb6bdj4oBt716/nv2MYDeMfbmCqPuEu+Avwh5ULdTp44qOwHXD?=
 =?us-ascii?Q?rS/+RbfBfCUZS3zgN8lGaUVsgUOY3nuFS+bPrTwYKRYgTCwiHmSo0BCsbFKY?=
 =?us-ascii?Q?VNTAdZKI4KlGD/yjCAEDvntnKSbUgqYe9gdecQ9iK/Ps1914ZnGmZlJPq6Bn?=
 =?us-ascii?Q?cU7lYuuF4u5MFWs0kv5IPugUFjeinvA1lzpTDc5LWh+ijgy7sibCKKwl5qrM?=
 =?us-ascii?Q?pEb20SyW8shV2YemP5pSQbAD4eYo/KzTUs0pOFnshvQagJfSPU4zsrEfwArI?=
 =?us-ascii?Q?0LfrMb6czdlCe8s9cMEa0RvuEPiiKX6fZ2prAE+lnik2VGL9ovekMeuT8+X1?=
 =?us-ascii?Q?I/Spz/wuPfAIcqTZDUjVxVCXQiSXetTx46jN7ZTPlfbYVdjO0xWz1W4dH5ze?=
 =?us-ascii?Q?gb6f0KLXGnPUSKVsDt6rU3YtADpa7xTM09GJhZd3JZXqz/tFcZW8Lm2rXWKZ?=
 =?us-ascii?Q?dCb19XH5Fdwoo9hFI0MZDURMUbL1aWj1fgt+yk8pPHwTIuMQXcpRRjDUGnld?=
 =?us-ascii?Q?c1Egq5nwUa7PLL//o7+AHdqsRaDQodC7/8is8er46ISbaNrXYiM6l4zkrduk?=
 =?us-ascii?Q?MO+aXIy+mTmwniuHKeApDANOondQRydHYvB7PiuzQaMDqBlHdk8lTCCG/dIg?=
 =?us-ascii?Q?SH8hl/PbSiweT7dk5KoXWlUm7dlvPvsJmn7ujORpoTS6vp8lOq9JTbAQrqtG?=
 =?us-ascii?Q?CmRIQQ3eGSu/zxBX2+lfAveuOYoSUMCEwWEO/3niJHnPc7II82l3jVe4ShlR?=
 =?us-ascii?Q?V1ONHXEVQDWgewmYC9zw2TRCn041putWhzEAb0lr34/P4g+hsAsOq1IpdVeA?=
 =?us-ascii?Q?HOYM+MOOh18I4UweBcrKd8USH4QR23vnXYpBnKEe7WY6V0Cvj8+Y/diygoRc?=
 =?us-ascii?Q?5Kyp9HWcCDfTfDvPObdYwUvm0q6hx3Ou9KqL3337PZO9M7AO20X7R/8ABFRz?=
 =?us-ascii?Q?mlQGBsjLDWif5UR7QyZfBo7KE0XnaT6OYTD/hS2FBZz4AvAtlRt0rs7WSd16?=
 =?us-ascii?Q?BaZxqeNBbTiCXphgmfziQVRMyjghUMK0p2Ctw2ZWRFmfgaTZtRMuJmNz2rBQ?=
 =?us-ascii?Q?VClrJVOlMOuM6Q/EG581s/pe89BJe3nd7F/RR1i4l8Vmra9qXjrTLIcNHo/O?=
 =?us-ascii?Q?tz9ZbApdoVfKUAUBgEE7o9+k6gqTju4IwjcYsaIltIvUAqZGpCxH8+Sxd1sf?=
 =?us-ascii?Q?IzoQYkDi4ihcJ6tZRamQbtlC6SAdopK9LgWN8O8o7FSXFmHeqI85PcvoQ3b1?=
 =?us-ascii?Q?olTUeZpJ2a1reMT9QhFv4flCWj/rcQvfjUvgalSosCeSBLa6eA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5611
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c0e74632-af5f-42b8-5a8c-08ddc89e891b
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|35042699022|82310400026|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VVCyYgOS9W/yCXVmdI0c+E4KIjVP+Lamhf4xay2+pyEy3CKQV+HLBp+gYrT9?=
 =?us-ascii?Q?P6rnp4jiDd59JDme8bSHxVhTxv4WYRK1UQQJuEDm1jr5f8SHi4k7IATUi8Pk?=
 =?us-ascii?Q?NwdcEkBtNozgbPGk3fNCuVk7iimnYovCjpLzX+JcjUClAN5zLsJPgmlBDnXD?=
 =?us-ascii?Q?32PR1haCN5RFLnfUAcc7bbwH+CPHGf6T+aR0+X3oT9szI+tg9aVMWv2/JW/8?=
 =?us-ascii?Q?7JbBf6pFfYwoLgX4n+lrqXHKNid71t3Su9uT4nP3mB2xOCg2IzIjcQ5wjHjS?=
 =?us-ascii?Q?XSBzmCeLB1BoLmRgQCSNEwQJlNuVvvEhv+qUBV3kNC84xvkiGbppOBeCtw+k?=
 =?us-ascii?Q?1mEISmDtYZt7kr+kqervspKg42kd53ambX9gTJ9g5JRyyuY65kI6xsmHYyMI?=
 =?us-ascii?Q?RbCI5ixCL5Fa3a0zmofLfYKa/9bgmb6JwX2gwjNrVy9r9ATT/0sEWHe0la3i?=
 =?us-ascii?Q?+zI3h/zdcik3EsLGtXJRtlE+cbxqJwZNJvcbSxUY+enPXr4c+NY0a+sGNi5R?=
 =?us-ascii?Q?aNK6S8ZXzER2dEdzcTcoqyMr/hDj0Vp+KG7GbkDRIiKhHvnMbfH4EfjF8Ghq?=
 =?us-ascii?Q?n4xOQlrdo3549O5izlNLQJnloh9mPcqO9t1QpGMrf2guxF0zysqEmZDoOadU?=
 =?us-ascii?Q?lRDjhMhoMrG87xaSCousI+wcMozjcj6hF4vTW1OUHtZmaL8XCXy1/lDLMswp?=
 =?us-ascii?Q?5+9/uMH7jZqbgpiNyuB97jcZu7P4TJIbfma3d8YLigd4ilbfCIOQ0DIq/AWg?=
 =?us-ascii?Q?gnvdyLFxSc3mRRbgxyXtSR5Xa2Gnf6pggscxEH4SNA5n00T4Jg+n3G+B4dNB?=
 =?us-ascii?Q?BFuJ5GT6zTg/WvPIet6wMG7LLvTkE5Vk38rxPixqzFaHFGlu7jywYFTGvbY1?=
 =?us-ascii?Q?OKA/PeKHanRZdf/e4VkDn/IpJAI5fW0s3ZAIjRUkI03YlIG/kV+YDj18xvVP?=
 =?us-ascii?Q?cvH60nztcCYIVJimxi6UWZuCWWICsvLdNnw2f1KtAvkHDe36PbtctR1c9s0j?=
 =?us-ascii?Q?h3lgwkDogEaKnFpMLjVi9hnDKqxcfnsraknN4jtd7vp65EOqVFH/0tRrdPCF?=
 =?us-ascii?Q?QMZbAMgW6L65ECGEtiXzSEkTj2BCP/5mPVwOsHFyH8rUoQUL+kGhecJI5U4f?=
 =?us-ascii?Q?rCOPZgFp7o5YDj7C4+rpZwAnYNnsmCdAAim4tlNTEyUpp9j0NgndG1FStumT?=
 =?us-ascii?Q?geXctz69Q+rSx/739Way5hwo7Y4ClBhUHIFNZTOs/VIqPm/O1YzojEzm1IXl?=
 =?us-ascii?Q?uZ4TOAmjoRNRPP9XOT0DCA2BsxyqRF5brR4PpNrgFg3WA8ICXpEZWIACfsOj?=
 =?us-ascii?Q?1vpvwYCm1Hj4sjptEm+xadpEfdCwYJ3G432hNXcpUe0XsloL/z5YXaTPINPI?=
 =?us-ascii?Q?CmcpLcAMkxwseGHrlsEqpzSWRrtDClxfWLglPql1MJzZ7P26eoojZ2m63Yyp?=
 =?us-ascii?Q?nntI1Z0YlqOeim/A5qTAdcBFPSYrOq330GLqiw+nSzjuEOaBALTaW9Xo88L0?=
 =?us-ascii?Q?O5Ac9hjuyN0NZewsiui/1/rX7Xzv0EDfdmdX?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(35042699022)(82310400026)(36860700013)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 21:36:11.0019 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c52ba05f-26ad-4661-174d-08ddc89e9c67
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10189
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

Mali-Gx15 introduces a new GPU_FEATURES register that provides
information about GPU-wide supported features. The register value will
be passed on to userspace via gpu_info.

Additionally, Mali-Gx15 presents an 'Immortalis' naming variant
depending on the shader core count and presence of Ray Intersection
feature support.

This patch adds:
- support for correctly identifying the model names for Mali-Gx15 GPUs.
- arch 11.8 FW binary support

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c   |  1 +
 drivers/gpu/drm/panthor/panthor_hw.c   | 15 +++++++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h |  3 +++
 include/uapi/drm/panthor_drm.h         |  3 +++
 4 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index b7b454d16f12..fa6e0b48a0b2 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1404,3 +1404,4 @@ int panthor_fw_init(struct panthor_device *ptdev)
 MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 7f138974d43b..a7583342d797 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -13,6 +13,9 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 	const u32 gpu_id = ptdev->gpu_info.gpu_id;
 	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
 						GPU_PROD_MAJOR(gpu_id));
+	const bool ray_intersection = !!(ptdev->gpu_info.gpu_features &
+					 GPU_FEATURES_RAY_INTERSECTION);
+	const u8 shader_core_count = hweight64(ptdev->gpu_info.shader_present);
 
 	switch (product_id) {
 	case GPU_PROD_ID_MAKE(10, 2):
@@ -23,6 +26,15 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 		return "Mali-G510";
 	case GPU_PROD_ID_MAKE(10, 4):
 		return "Mali-G310";
+	case GPU_PROD_ID_MAKE(11, 2):
+		if (shader_core_count > 10 && ray_intersection)
+			return "Mali-G715-Immortalis";
+		else if (shader_core_count >= 7)
+			return "Mali-G715";
+
+		fallthrough;
+	case GPU_PROD_ID_MAKE(11, 3):
+		return "Mali-G615";
 	}
 
 	return "(Unknown Mali GPU)";
@@ -53,6 +65,9 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
 	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
 	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
+
+	/* Introduced in arch 11.x */
+	ptdev->gpu_info.gpu_features = gpu_read64(ptdev, GPU_FEATURES);
 }
 
 static void panthor_hw_info_init(struct panthor_device *ptdev)
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 48bbfd40138c..8bee76d01bf8 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -70,6 +70,9 @@
 #define GPU_PWR_OVERRIDE0				0x54
 #define GPU_PWR_OVERRIDE1				0x58
 
+#define GPU_FEATURES					0x60
+#define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
+
 #define GPU_TIMESTAMP_OFFSET				0x88
 #define GPU_CYCLE_COUNT					0x90
 #define GPU_TIMESTAMP					0x98
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index e1f43deb7eca..467d365ed7ba 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -327,6 +327,9 @@ struct drm_panthor_gpu_info {
 
 	/** @pad: MBZ. */
 	__u32 pad;
+
+	/** @gpu_features: Bitmask describing supported GPU-wide features */
+	__u64 gpu_features;
 };
 
 /**
-- 
2.49.0

