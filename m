Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53295ACB2A2
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D7610E547;
	Mon,  2 Jun 2025 14:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="BivCH8Ck";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BivCH8Ck";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012026.outbound.protection.outlook.com [52.101.66.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5513610E53F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:34:00 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QVR/sMPQNYqdoGFvWZJ/nRe9TvAmaCLltnPceg44S+L0YvzvU1qGesjZ2DEGXR1BF6oL3h0W9ttMOyfkgUAj2QWGhe8DNReKFlCHyy7WmBRuBWJFaaYu6HoZ6fAooXo0rK1C36PPPmnvLQfKCpOBX+keaJtKv02usyMMAoA9KuLKpPy5pJ3x9pO3L3Yx3mHcTEDYz4QKmgtpmr1d468Otvw3kD1l2Ri1aIlLUoHkcYq1clCB1j0/Dv9fJBQk6xAEd9v1hdw54LnEVokuAoJ1V87SQFp1JM86DH6bSH3QYElQ6ohau6Knvs9C1eyOjCySYf0WdWe0zFeMPZ4g9m+aBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCHfWpf5zWZOPq8o5CgMyzciYXE78/x5WUs4vbuxuyk=;
 b=dQ1W5wh1XNwF2NP92hWsjAwCFH8xX8BL/tShEhM/IrhihoRYu6mw9oP0ZlLDeAyEfrPd3BjzRZHwCjsqQI88dQZdE+y8ucqx41duz7FlYJjXJpVcnBURMO0W7NygVDnoqgsroKLlGtZnhEXkm2lF2WtGgLO+qLzvoqOlCNoVcEWkzJNDGdw7jWOdOFI/gWfMekEJXkt+TinpaqMpB11/u38M6Y2WHQM36I0G8HEksoOAET5FqjdAUPiEJcwEJBg8j8Aws4Zt3mh5U3jfc9Oky5jtERlE+yUvsAHkrvy7agvih/m4cO7cYLmcAEC7xcwLz01i2NyzluYKQZ5Q7S2pjQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCHfWpf5zWZOPq8o5CgMyzciYXE78/x5WUs4vbuxuyk=;
 b=BivCH8Ckh0AjKRM9qeBzW09d1B8hSvSC0V3QGFKThvXkOFV9WHD6zRHiRcLp42CwU8Dj82Rw0G1bJDQO5d3vHuQvm7pV7nKShJOAgKu2KfKwCXZLuUB0YcMEKGRLgPaFrAMIhJ8AC/aBs5BaA0mJ6eab2gOnWQt5J65SSR5ly00=
Received: from DUZPR01CA0041.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::19) by DB9PR08MB8740.eurprd08.prod.outlook.com
 (2603:10a6:10:3d0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 14:33:50 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::9a) by DUZPR01CA0041.outlook.office365.com
 (2603:10a6:10:468::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.32 via Frontend Transport; Mon,
 2 Jun 2025 14:33:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 14:33:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edllTwYM0j/H8a74Ihl63i4wMFsof7qdj72z5HT6JhcHm5S41+y5ikuYxCAM+93pL4fudES9M7UaFTyqI+GDwcNrGN4Z++LfVhvIBXUrzFFcNBqqQ6y/hiOCYzb59hIVnVY39PZZcWIcjdX+bErSZ4knaqVSkb65+G/QRoV56GCo6DDz68AwT8FayP7vA9fhxxy3HuLLnMPmVsx6CGSB5SLnGS0wcP//7u6Ps1aC3b7WRgJCjUFI3MjYu8mWb9MlGigemvUmUY3p3xZUYLRRWthTLdipgLVpe90PmKdWV0YBl3rdszbJZs436eLMsHT3sL6/fpCHlv9/y/lukqTfiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCHfWpf5zWZOPq8o5CgMyzciYXE78/x5WUs4vbuxuyk=;
 b=QeNexqiq7XKZtSv8e7EJjEMU0V44ikBmA/ZwPH/Hf+2ebshytEKK4qs6QxBodMPIOWjt4YiGa76JmZUzJ+3SVLQNbYxYFRgjR511gYUNhhrSaDl/DRKuVzmHRE2BG5seOHhGpy2zIirzZ+/KyZizCYqgUTL4nnshpb2ULbdlCn6HK5dVRtglQaciHhp3BQ6EpK10+XHcZaseORSXOrImgT1pfcKD1WkPfoJ18Aw2G+7WomomhA56g9igX8ohF9G2S0pOng2OJd8bMt3aVVV1zQcUtI07anq34OK80S7AIW6x4Ri1j5HQrwWhADDR3gxUfhwOIQ3HJwc2zQnHVeJq6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCHfWpf5zWZOPq8o5CgMyzciYXE78/x5WUs4vbuxuyk=;
 b=BivCH8Ckh0AjKRM9qeBzW09d1B8hSvSC0V3QGFKThvXkOFV9WHD6zRHiRcLp42CwU8Dj82Rw0G1bJDQO5d3vHuQvm7pV7nKShJOAgKu2KfKwCXZLuUB0YcMEKGRLgPaFrAMIhJ8AC/aBs5BaA0mJ6eab2gOnWQt5J65SSR5ly00=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by PAWPR08MB9640.eurprd08.prod.outlook.com
 (2603:10a6:102:2ec::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Mon, 2 Jun
 2025 14:33:16 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 14:33:16 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/7] drm/panthor: Add support for Mali-Gx15 family of GPUs
Date: Mon,  2 Jun 2025 15:32:13 +0100
Message-ID: <20250602143216.2621881-6-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602143216.2621881-1-karunika.choo@arm.com>
References: <20250602143216.2621881-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2P251CA0003.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::13) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|PAWPR08MB9640:EE_|DU2PEPF00028CFE:EE_|DB9PR08MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: f038c9ff-bbdc-47f3-a4f3-08dda1e27d99
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?9lDFkkp/T3NaYBqB1PNPXHH8RDkLneS9H7wIiC+Jnb46lTV5AiX31xIU/hqs?=
 =?us-ascii?Q?XvbmrEfyR++j/A9tJlpK+Z7BBeiZ/s/9LyiViAeFG3IA3uUlXqWfDUycbwXg?=
 =?us-ascii?Q?sSxQ/tV0Niyf3C7SARicPDS95DtbZwfPoYmh5xuh7Go2zVPXKLaVvUUbu5JJ?=
 =?us-ascii?Q?Ias5EqFWG28P9NRgjM3ycdXRSRL60lfyB+udQ8adEjoZRo019BFjyCtQQojB?=
 =?us-ascii?Q?AomlKRHrjl/Nk0NWQy0Uuju5M88K2zLNJidQJC2vyJbbRZuO/zAv8IKomNm/?=
 =?us-ascii?Q?7xPNj3r92TYCOs+M0d8tvlkNFsqw3WAwEoN2uEnftCYH3orwojSW2LZUR+ZS?=
 =?us-ascii?Q?kjU7NYJ8rS4glgSc9NL37rRjL+2Iy8vnP2RMmNY99jKOuNK4HzjAz+l1H3SI?=
 =?us-ascii?Q?tDR70DX3aka5hQQIGLOE6qhYWrl/qxl9FxUdeGeWSG1SlGfopCAlbn1wgwjG?=
 =?us-ascii?Q?eh5guROlEoXNZ5pDBVnJWb0Y48e1MOWqVSbelTfCaLOEdBOoX+ilzNHVDw1Z?=
 =?us-ascii?Q?2nLwYKjGw0DJE+oawd2aBHArK16zSgcHbIpad+8A4ji3Wdbx4TGVB0DLHUzp?=
 =?us-ascii?Q?FP6SADJ1ZWjyuZTl3jeMbnFhZld5bmXsobckOj2SZ/GdG3zmt/hV66zxL99q?=
 =?us-ascii?Q?yuf+mqJGlTsik28f5cLM7uuEr1fnGmKsdW+dczNaeo/TOxcZDPozMnGQoQM9?=
 =?us-ascii?Q?hZc1BMkt21Jmd6yELTFwxDDbrJbn0T8oAdg1GBDq3ibOZ81hu42OsTFb+mSX?=
 =?us-ascii?Q?EmAb5pEYokiuPLpmy3EX0O84fU9uHs/6GyBEg2C1NwkduxKuz2YkPg9/FeIh?=
 =?us-ascii?Q?iECH4uRvEGVP3wu3ZI4SM/PZoep+TjQu/NGjTKyK/rgquzZBWaYdnXayf2Te?=
 =?us-ascii?Q?pGiKxcHnaqxdZQC3Crq9xgNv1qS9NyugOs7Mv5xDq4zqWLxHo81hDaPL5Plf?=
 =?us-ascii?Q?cAS4rnUHjWy6XAp4z3twKbD18yf76ujdNZ8/uxrdb6dLdTEpr98mHLRAwR9k?=
 =?us-ascii?Q?kP5LyH2vehPRGzxxw07ixvJbhE+7TRvVYArFmdy216LTPB6Q6ICF6blmVqIM?=
 =?us-ascii?Q?uu3vBhQRTRySk5lsj8+RfK/G4wxakb/5ayVXbQr2BZQ76+mjxcveIYrrNQVy?=
 =?us-ascii?Q?4OR5+XCV9pE9Q3l+mLEgJN964kkmTtaVeBmd/zXNPGYKuZIK6pMoVmg+NTB3?=
 =?us-ascii?Q?2PSD2Wnl7jpc69s+7UBwZjZ4OkJ9HNpIp1VEjs7zfG1Hos2Ll7lfMWOp+SQL?=
 =?us-ascii?Q?7QeA+gaiKLKh9yDc5bo4vi+XuXBMeEuLiTr1LZGrGF84MZoNO4JaS3gWqVe1?=
 =?us-ascii?Q?R1ZXFSjdBRvdeiol7xdBTJTQllzhe5JZwg6x1LpyGG47NPwPpG5tC8Iaybk9?=
 =?us-ascii?Q?XatWEOQXeDraTKGUo2/+/KwNcDq0QFpWyOSSvgZxnPx9l7lDrg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9640
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 14fb45ff-fc57-4528-cc83-08dda1e26957
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rv9g6EJ/iZTM8NxAbPKAEdxi18Se7mAb9nCOq4nFVzaXM5tUjQeSW/vuaeuT?=
 =?us-ascii?Q?20Gj40jhhbevVxHhhveC5RRrLUbInpIUoZqMKcE0wcgKy1YJ8oe4kPQHUxYF?=
 =?us-ascii?Q?V2D9b4qyHJao4s442ZuT6jM3z4dZUWOTO9hOA1tUyNMCd7xlk/Cx62/AivCK?=
 =?us-ascii?Q?HdDxqSkr41dL9NvuzCiaFf1a3BUPvppTTDTwGVW1mTS+6KQhljtjbvk3nfYT?=
 =?us-ascii?Q?8MGsJ36Pifku1Bn3wRyzxbs9Or/Sg7PXl4gbgPAx8MwZFy+djrf/r2irx089?=
 =?us-ascii?Q?gKoQcwqugwnI+N/Tk84jbkkJbUsSqLiF4D/CmyzSe5+lkPFDEaQ7nYx2To5t?=
 =?us-ascii?Q?EcNbX46LZLi9F0B3IA4MmYidmFlFMXgNk2M9Fk8LpJ3OzunO4S5vt/dISLJu?=
 =?us-ascii?Q?SsL+T91NvA/bOe8reMNkYZsSHnfWuDBmhQGcDXYKoq4dAbZnBXuU3T6Ljd29?=
 =?us-ascii?Q?G/C4atvViGI8qA8EGJyKcawNvnu1ospH4bcOeC11c+VcShiJTHjhjOmbbqg3?=
 =?us-ascii?Q?WhpGKOfy4mtVgAzwNWmlISYmbEh9uzHFycxVKjHGRAPYU/wjwa0jfu13/7lr?=
 =?us-ascii?Q?8oqYwKbSrO/Ojw1O357s44RMiZGOZuavkje+60cTEE6fPIJMy+vr3EIsk99l?=
 =?us-ascii?Q?iLL2tqS2Fv3S/uqoY0QWu3yabroPh1BTO/VBBTBSbaY0LrJPdfadnAOZHwwo?=
 =?us-ascii?Q?5oP9evuwGdAQM42mA8YbzBNIz4KVjQOnMvjJl7hVO/tW3zO/f1uBuIZ5XQ6d?=
 =?us-ascii?Q?5z18MrOFwlQrua9oxciC5K+tnN+PVLAekt1icCXgDWVN0USk1pSQoh4aqJCa?=
 =?us-ascii?Q?6YeGE47h8D4GUDUCmcmdU7tuYglhFLphi0BU/3aeOTD/JtlkbzKENq5EaIY0?=
 =?us-ascii?Q?koW8RPsJu/HvyHiD18Z23fuqO4HlIsFj4cyjv090cqP9/9gnHu5Vbr3rpJAF?=
 =?us-ascii?Q?/ciWITg20M7unK6KN5frfwn/kPiMtyi72U0sQ/1qNG4Sbj3fho8KU9Gjgj7f?=
 =?us-ascii?Q?TtEvOzETTRJGhQf4VpUF5H7apnxJn4OU9LQBohg5WFNNghXvMy+vw44mwREb?=
 =?us-ascii?Q?5xQ8RIXjF3AzhNFrsYmx4Iuz17mp1gkcXgS8vPfYtPlSsNCJ40Rl/yXih6nk?=
 =?us-ascii?Q?5Tzu4GccseIFKXfKk7HYxIX9aC+4hu0Q0q26R3FJ2tBdRJOx+/Npqn1jLmEC?=
 =?us-ascii?Q?FaRY9tE0QSJ2rwUwu2Z5Cw4LWFwLn0rMwTZLDlsD2+MHPG98ywfTI36AbGTL?=
 =?us-ascii?Q?aKNIJcQhRCL2ML6nUrOacay2bRMrwJRUo9OvDf6oED8xbewyNPD5iNKsyfok?=
 =?us-ascii?Q?Xrdqqr94dBF316aE6k4BkW9Zmq163NLY6G0CwCBwjJ385LcloIGrvczYvssG?=
 =?us-ascii?Q?Aw4bTXmJdRIg8qvP9pra3fRxPVoatcIrGkmSS9vpTeTU77+ZpplXUQEstU8B?=
 =?us-ascii?Q?NmfLOzQM0STgLwEr4oZdONF2uU2/v6+7n0WBMjX3LCslAjcqyGUafiFrPeyP?=
 =?us-ascii?Q?3FwYjT5hwIcZbW4e+Op4TdkmIoeS7tYvAYae?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(14060799003)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:33:49.7297 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f038c9ff-bbdc-47f3-a4f3-08dda1e27d99
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8740
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

