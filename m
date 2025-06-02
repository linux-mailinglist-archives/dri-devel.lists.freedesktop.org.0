Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15A7ACB0AA
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410E410E2C7;
	Mon,  2 Jun 2025 14:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Qo57NxZm";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Qo57NxZm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010058.outbound.protection.outlook.com [52.101.84.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002E610E2CB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:09:12 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Deaj0/LgFFQwwSmz73l6jAhHsrTv4Q8k3z8mpH0FKyN13pl6iILk/Fh/oC6Mxzv0srewgYUf49IQ3q3Z/jq1E3EfJdU/7A67x7mHHYyiIH2cieOwit0Chj0Oz9mmz+oXyWK2KIyMjOkw90IjOVhN2d66GkNShg/dsWXp1lMVQlvpTnmGoBHbFdMC//VesLWih62RLZXVvyHHjI/2O802SAsAmIaFYdFCoTRgYgsNCk0FrUT+724PtSwfZ6NBvl7oGn9Lr2gtlk0OwHEd3dMvpUcPlN+gX5412PSWzehCzz4Rf2GVw5gnHgdrT0OGMoIyu3Tpn7/jCNLaxOX2H9Z74Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCHfWpf5zWZOPq8o5CgMyzciYXE78/x5WUs4vbuxuyk=;
 b=CwW26e9k1sOeVzf6NsatPYY9/mo3vEVIDqZmilWVQ8uUMyMfdtjQhCKtrjPrdxdwUvXGhZhp1g8jub0uboJR6+38WddaBl28D5XABlOmHlyrMx2FrZukzSiQRszTQyfD+BOyqGBcT1BrWDS1mkSR92mXQV3EdL3cCt2vzDbSJxbgT+9HOdmmmazbGAaV1V0giz3GcbMqe7IUAqUezLF8YR08lciNMTpimFpXwQkPCPrml9gv1U/arAdwmdyb91pylx3npvLxkb6+kdjuAjPB6SnmxmasMZSgVCa/xb7F6ttqsYNM3bmQClCoc7nEKI59+LVI4VeBjQOFT5rpViJoIw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCHfWpf5zWZOPq8o5CgMyzciYXE78/x5WUs4vbuxuyk=;
 b=Qo57NxZmNfaHe+1jYLu+WUL1znvgvtc+AXb91YSwGhmww9fItMs93DD53lFszFsXP60VUpoS0AmdEwqjARwvVe+xI6sPB3+puZZeiPMnyTrccvZX+Pza+R8ciExnVE2soFoPu1DwzGWiqGp/u03BXN+8q2a9WqmQD4PB7hAzk40=
Received: from DU2PR04CA0171.eurprd04.prod.outlook.com (2603:10a6:10:2b0::26)
 by DU0PR08MB7566.eurprd08.prod.outlook.com (2603:10a6:10:31e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 14:09:09 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::6d) by DU2PR04CA0171.outlook.office365.com
 (2603:10a6:10:2b0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Mon,
 2 Jun 2025 14:09:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 14:09:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NinLLfhcqkx0Nkma76J/+9lYPlMKvpQFUTaaYMQ6PaJFaobZdFyxbtsQ16WEhf2sftz1UmGyehkgw7aZ+k8iWt8fPqgdjcI7hSIMOqzeUQxT/LosA807IZ2hpLnL1gHhI8bM9811bOwjmugw1xYrhOFGZ2gFMpPgavC/8xsHNlyqJKvS7GaLGabBLPhudwuxqG4MMIyAy6ES5Uw+ma89Ag1CKuzsXEAKtIKVKFvtRrI7gw1I3ZMoXe7LCQM0B8Jrpny9aYdMWQIgo9Gr7DYwM2O6NvVK0xsN0DzZGNkSYevUuZuB633pCU5X1FAl/BUp3XgzmBNS89Aoz7Zja0EX0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCHfWpf5zWZOPq8o5CgMyzciYXE78/x5WUs4vbuxuyk=;
 b=OV59b811m8HIMmJUnKRBiFIsoBr4c9TUX12p9yugRf7ZbiwEn+ApkzIJAydgbYhBGKEzpvIqSjpiwPNhvHJUVevmXMYvJ36CQNSr0Rt7hSLmu3bXPOcpW3YtB+VUQfOYCU2ZJbkAMA7KdUNdD8Q3GIp1a6NrnEN8AiYojALw52u5LdmAlNQvWU9YosTaUQ61FoNtKQjGugkhS65qCr7KNzpKSfjGCtM5Me5PHqvqg3iR6fu2X8uszeFBQrstZJFg7odLz4NJxJKiDIjw/RAgaCk7Mwck4Vv+0A6+kQ1m1QB6Ctt9p+t14bVeMQ3i4OQp3aga3nkwB1N2BnPgw5AChA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCHfWpf5zWZOPq8o5CgMyzciYXE78/x5WUs4vbuxuyk=;
 b=Qo57NxZmNfaHe+1jYLu+WUL1znvgvtc+AXb91YSwGhmww9fItMs93DD53lFszFsXP60VUpoS0AmdEwqjARwvVe+xI6sPB3+puZZeiPMnyTrccvZX+Pza+R8ciExnVE2soFoPu1DwzGWiqGp/u03BXN+8q2a9WqmQD4PB7hAzk40=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB9018.eurprd08.prod.outlook.com
 (2603:10a6:20b:5b0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 14:08:32 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 14:08:32 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] drm/panthor: Add support for Mali-Gx15 family of GPUs
Date: Mon,  2 Jun 2025 15:08:11 +0100
Message-ID: <20250602140814.2559538-8-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602140814.2559538-1-karunika.choo@arm.com>
References: <20250602140814.2559538-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::10) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB9018:EE_|DU2PEPF00028D0E:EE_|DU0PR08MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: ee669fa8-c4bb-46b4-ac60-08dda1df0a5d
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?OQsSEsgsSVzBv2R3H/zzexV0CHpfX826GrqBctXKawOcdF0vykj9waLs2pMj?=
 =?us-ascii?Q?GNHY5wvR2njNnEqEpfYcp6tLTQEpgUHf0KU0c1rVp/4NZVg7goR979581Qpr?=
 =?us-ascii?Q?Y8qIrixAPzYTvfTZdAhk6OVf4M3w8wQZTO0lbMCJJbpzc0e3rxv1xAx3N68v?=
 =?us-ascii?Q?uaA0MMoluM5lyPsYq57m4uJua37sGLH+nElWnhn3PEDKi2hWwd14vZACKrrL?=
 =?us-ascii?Q?LAQc2rRrnhLZZR9oQ/gTueNuw7uZKXA57onj6nmyyaCUC7gkHFO09VtOUyt2?=
 =?us-ascii?Q?9gnrIOon914VxkoObzN9kirz5+nKZiWRYqPMngO9RYg5j/AVtW1JO0g4Ywc0?=
 =?us-ascii?Q?UU5GznYRGZ4iklO5Czui9jI0o28tAH0wcmXiUHnRLnAK9JgKybaf8sKGopwP?=
 =?us-ascii?Q?YZ8mH4kZ+7VtsndWnOqFSoCdsjAdY3PYAbNC5ljAJpGbZSQ8LVm7hjNuH74Y?=
 =?us-ascii?Q?SgnGoE5XzPxyprQqDVOsGSKfwERZWXfma1Ts2C/JegjUUokaUH60CLq0YyEA?=
 =?us-ascii?Q?A+ebuli155lZSx9BHME3FkgJsS/vZ32BmkScT60EPv1BuYJgtvIwM9Mi9p6h?=
 =?us-ascii?Q?TmweQTHhTHShOw4h8EsK8kgZFIkUAKIAQMoRPGG2pv0BIbtgmes3O3nL7z3p?=
 =?us-ascii?Q?l6ewjue4GrIvj9wWqUrcQlb+mTvfa5zWzMXInbqlNJgfCCxDSpiBYeWp7Cka?=
 =?us-ascii?Q?3BtPe1FhVTtmB9lXEVmrptmFKXgpJwiWAK4EQnefiXGigbRx13M/vEfWrbPz?=
 =?us-ascii?Q?LB4I0zGb7tsYeL/bCnMzPnSZTmk1SY24bYqnJwM0nteG9BTE4RLb97gJxd38?=
 =?us-ascii?Q?609ItW2a4C7kBHBrEh9ENRj78tgJmfPhvG47MrXcUiben9GEVSaDtEavXdfZ?=
 =?us-ascii?Q?XJya+hSmEJd6n7k+f6nkQVnLdMyrXlsRIIZ/mKz4BgjilalyVerBQIJHZnbC?=
 =?us-ascii?Q?0NHcBovlMdfk+LIX/0nF7ujQy4dma5cYcRDN3QXmLDV8UTsHVDwOQ6VXk62d?=
 =?us-ascii?Q?tlC+yoXMxan4RvBs+kOlQg8mVds247mWjEZfTd6UhwLmIZig8O249s26sv9F?=
 =?us-ascii?Q?vvaBGGOc4S4UHAHBn7IwN1uH52QtjB9iQEqop734i3BH9pZ/kuXBmzveV8a7?=
 =?us-ascii?Q?84LNVfYzgyc+aUGdUhNwVkfyFcAY1W8nmudZOxvQGhJ4VZdXuvZn30qzGXva?=
 =?us-ascii?Q?FKckocCe9T/emxuRuu7++CNI7HYJ/tkuNNbEcVbAR1axasO5uihcoQJa7AJs?=
 =?us-ascii?Q?xU+mrj0Rh3DthIdYn9WtQ1IKJK7pB/z6NwIZ3CrjCQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9018
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3af03067-bb37-4651-4be2-08dda1def506
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jW9Hp06UH/oqzISXNwqEBl4YZ4XXKwFbSCfz6mKkm72+irn6I9XPFuYWhIAy?=
 =?us-ascii?Q?HDoUPZLTxtK3oLGsiJunSBFpD8jbindYRbpN+5VJCmVpMWEAgVuRORXsxtkL?=
 =?us-ascii?Q?H0YAnWTKs3hBmqMgqZll8x9aeShrwM7+fU7IMYoMPLPYp+m/kr0SrG7Oz13e?=
 =?us-ascii?Q?1F2kM50dMde00MRChALl0Ip+s59ERSGLdcpMYdZJFXbTuGrR7x91Jd3TAvvY?=
 =?us-ascii?Q?f8C4pfunOxHEeixeZeg30iFVUWPcjK8uNruoWGDTtG8tLsEDgmxBeaMJGeDG?=
 =?us-ascii?Q?hodXfM2YEdhoiRKkC0BcU1wZ9GgEH+liMJCDGCK8PT0v+usC+3TPtanBTt48?=
 =?us-ascii?Q?839J2zQaimZa1tp65lj8P/1m/PNypHUDOtPpGx+5nrr42kpNBa2WsS4XnCKN?=
 =?us-ascii?Q?34RpqVHodUt7vI/PUv8IdYUZL8+B8CASYrbPAKi+xCBkgTQTGU1zhlwezKrM?=
 =?us-ascii?Q?Hwf7F4KIuetFAVvTeOVu6zL0z6PsFKjpGbjGrx4kynH4YQo8NODK1j38O12/?=
 =?us-ascii?Q?XIt36MtmHGviOIyEW6E84L1BzQem06OL81y4Bxa0W4lCcyjidDf+gCM0CgrG?=
 =?us-ascii?Q?z10qsdeb3wQNX081Zi6PHDftvxSHOZut7LnGT+yvrdgTCCkvVjerBxvtbmBh?=
 =?us-ascii?Q?VgXuDMd+b1FXyh3Wgdw2fwcTfsuCoe0X0QeotUB60ytCkDaNGJn96erCv54D?=
 =?us-ascii?Q?R3qiwlSKKKLTvdOHsKYXdKJX/9m/4aZqfjhZtDyVf57A1/HbHcpc6P6YWL9O?=
 =?us-ascii?Q?zY5dmwtXN0kWzxYqhOLloUBbPmh3rnnNLgxxwS2JdrhJp4CnigQrKEL3GzeW?=
 =?us-ascii?Q?zuE7T018NWkclVke8TUjMl8A3aWszWlsqK1IFpV09drOsYWt/M1ha6JmtAol?=
 =?us-ascii?Q?ecIK07VY92bhHMTd0jxpXRVzu67dEV+kNCTOsUH9xlsnMJzI3k3tiYZgziVC?=
 =?us-ascii?Q?3EDkPU6hLuH3Oh1P7qK1z19lKt2KlJbDVKI8p+OSDL+R+RW4rKsPbl/Ru5Qo?=
 =?us-ascii?Q?cBHQ/miYhu9Fy4N/27ZIOc7gEg9G4wGrwtp0lleQcCB/jwsZd/Otr/rsuPmi?=
 =?us-ascii?Q?jxcPbJhP0/MGTIj4J4eLEG+zltqB83wowEGD8fwzhysN3qkW+Eo5pPQ3alEl?=
 =?us-ascii?Q?521Kpsusc7SMI58RyuxTp5Cya6p1YcDyGL+QJIFJ1EsIWZAoBwcnAIoTbmqe?=
 =?us-ascii?Q?L2If5Z1CdCGP5Gkbjw4k/RWz+KoE79JdzkqPPEt1raf8KoxYK4HMuMQ7XZRg?=
 =?us-ascii?Q?dgFcPBLDjjeMp82Hfe+dY/8LtCuc1x5nirNQpMShUH5jTpkw0cWAfxT3zPbF?=
 =?us-ascii?Q?41kLvqJYoRD3yGJECs1G2thGHEX5TKCklm8v0jCt4UL5QiWM5W8VgdNar61N?=
 =?us-ascii?Q?DgQb2hCcHQMXAKIO7gRjXYsrGXOOWozhMx1Qja3GL+7i2nBEqdPgs05ra1PA?=
 =?us-ascii?Q?VO4wEiLY/gO3hai370zPvH5f9umm93DziGzbz/xjazlmq+8REPIuq/5HlzYL?=
 =?us-ascii?Q?YIugyBVCi95tkqVnlH40pCv3WPWcGEJdE3U5?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(14060799003)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:09:07.8996 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee669fa8-c4bb-46b4-ac60-08dda1df0a5d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7566
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
be passed on to userspace via gpu_info. It also adds the following
registers that are specific to the kernel driver only:
- ASN_HASH_0~2
- DOORBELL_FEATURES
- PRFCNT_FEATURES
- SYSC_ALLOC0~7
- SYSC_PBHA_OVERRIDE0~3

Additionally, Mali-Gx15 presents an 'Immortalis' naming variant
depending on the shader core count and presence of Ray Intersection
feature support.

This patch adds:
- support for correctly identifying the model names for Mali-Gx15 GPUs.
- arch 11.8 FW binary support

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c   |  1 +
 drivers/gpu/drm/panthor/panthor_hw.c   | 18 ++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h | 11 +++++++++++
 include/uapi/drm/panthor_drm.h         |  3 +++
 4 files changed, 33 insertions(+)

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
index 5e423122cd4e..f5127a4b02dc 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -29,6 +29,9 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
 	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
 	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
+
+	/* Introduced in arch 11.x */
+	ptdev->gpu_info.gpu_features = gpu_read64(ptdev, GPU_FEATURES);
 }
 
 static char *get_gpu_model_name(struct panthor_device *ptdev)
@@ -36,6 +39,9 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 	const u32 gpu_id = ptdev->gpu_info.gpu_id;
 	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
 						GPU_PROD_MAJOR(gpu_id));
+	const bool ray_intersection = !!(ptdev->gpu_info.gpu_features &
+					 GPU_FEATURES_RAY_INTERSECTION);
+	const u8 shader_core_count = hweight64(ptdev->gpu_info.shader_present);
 
 	switch (product_id) {
 	case GPU_PROD_ID_MAKE(10, 2):
@@ -46,6 +52,15 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
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
@@ -85,6 +100,9 @@ static struct panthor_hw panthor_hw_devices[] = {
 	{
 		.arch_major = 10,
 	},
+	{
+		.arch_major = 11,
+	},
 };
 
 static int init_gpu_id(struct panthor_device *ptdev)
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index e7a81686afdb..4eaa2b612756 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -72,6 +72,10 @@
 #define GPU_PWR_OVERRIDE0				0x54
 #define GPU_PWR_OVERRIDE1				0x58
 
+#define GPU_FEATURES					0x60
+#define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
+#define GPU_PRFCNT_FEATURES				0x68
+
 #define GPU_TIMESTAMP_OFFSET				0x88
 #define GPU_CYCLE_COUNT					0x90
 #define GPU_TIMESTAMP					0x98
@@ -83,6 +87,8 @@
 
 #define GPU_TEXTURE_FEATURES(n)				(0xB0 + ((n) * 4))
 
+#define GPU_DOORBELL_FEATURES				0xC0
+
 #define GPU_SHADER_PRESENT				0x100
 #define GPU_TILER_PRESENT				0x110
 #define GPU_L2_PRESENT					0x120
@@ -109,6 +115,8 @@
 
 #define GPU_REVID					0x280
 
+#define GPU_ASN_HASH(n)					(0x2C0 + ((n) * 4))
+
 #define GPU_COHERENCY_FEATURES				0x300
 #define GPU_COHERENCY_PROT_BIT(name)			BIT(GPU_COHERENCY_  ## name)
 
@@ -117,6 +125,9 @@
 #define   GPU_COHERENCY_ACE				1
 #define   GPU_COHERENCY_NONE				31
 
+#define GPU_SYSC_PBHA_OVERRIDE(n)			(0x320 + ((n) * 4))
+#define GPU_SYSC_ALLOC(n)				(0x340 + ((n) * 4))
+
 #define MCU_CONTROL					0x700
 #define MCU_CONTROL_ENABLE				1
 #define MCU_CONTROL_AUTO				2
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index ad9a70afea6c..888179effdee 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -310,6 +310,9 @@ struct drm_panthor_gpu_info {
 
 	/** @pad: MBZ. */
 	__u32 pad;
+
+	/** @gpu_features: Bitmask describing supported GPU-wide features */
+	__u64 gpu_features;
 };
 
 /**
-- 
2.49.0

