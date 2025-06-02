Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC99ACB0AF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566CE10E2D6;
	Mon,  2 Jun 2025 14:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Jw53n7nv";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Jw53n7nv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010010.outbound.protection.outlook.com [52.101.84.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3166310E2D6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:09:13 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=emzeY2oRhL7eQfL8iY28tq9BNwK9CJQpn4urxoVDmlhFIY1N8SZkaeLmSRSK+x9eYkymDJ13gO7ucmPRbWzmm/Sbue0xs1S70tRygmo/sVfqu/W/qhfjFJF0b100+AgH2WMkEVkf/sR5uEi5DozhJJpjSbEsCHzcGpvmBwwDxAZnEpaH5T90KZZGGnLKjF3iO38if0aMvoctT1dGqW1bROF5+e391ENJHY5sgN6Vt6L+wOTXSIHzPDwXKtUi/jlLYrNOB1I5g0utvpgHQnQB3Y0Li53wWU0V/hsXfMsHR20YpZWry9qNjKHjJyH/qs5kXZtKVJxgiR774Z97yw8eSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYSRkCNnaGAKA+FBxg2i44JxbDRqCedCP8l/aG2+2KU=;
 b=LpswvvaQVZJUMMSG6OlxtRI8ZZEA66hvq6A1sHi8r8Uov2L2v2zDQUKc9wIuroxV8hJliQ0mK0Js3mjY1Bi2sEkIixldaSn+hkjVOuhm98sLP2fVhDZwl03EinuUU+lUhxmsg9t0agDAZwBkffH8lmXtHEWhYv91fbAcfJkwb4KI6ODyjykZMTv7u/DrLlsnQQlM2Yi81tp/w/Plb2tW8VIB9JPIBbcow283UncvFGqfwvHzjaFWC54khmR/yByACXpTvmLO0U6z4oGKwyJMsrA427m+JQ+MwLOVKZAY61ZdPJ9LIrfMDotHQivDcA1IfccuHvxaeCrlnQqA1rt5tg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYSRkCNnaGAKA+FBxg2i44JxbDRqCedCP8l/aG2+2KU=;
 b=Jw53n7nvJq9/1mXY5f9blMWm3i2BqYx8c2q2FNKd2xpRtHOeJ5PLyWjWLm9ykzhMolmp76vIIVf3Lk3B0UazCKnvHSUABjFmKVZlQ3E0xE2cYUlTqkS5q/PVd0YmC9id0WQJJi5yM+SYIoFKfQlyuwzLs69VA5CcU0v3ZqxKDyU=
Received: from AS4P251CA0025.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::12)
 by AM8PR08MB5650.eurprd08.prod.outlook.com (2603:10a6:20b:1d3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:09:08 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::e7) by AS4P251CA0025.outlook.office365.com
 (2603:10a6:20b:5d3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29 via Frontend Transport; Mon,
 2 Jun 2025 14:09:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 14:09:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTEeo/mZZvlbSeA66BHPflzFvCp6DurI0Y3XrFCwDvF2d15z6zPBdAlEVYCo7zGNNQTA0qcrmAcnBFLsSQzaYjt6kslNkdI5zBy9tj/H6nHfgXtyor1IM+EPp5pulGY4IZDZTFSxxI+juxNdXbE5+W3HmU18Q/B6qYpxLrPV0QeE+/nKRXI3MUtuncswXF2jVjPqHd9UEaoewFnkRGG5FKnwRwj3Pfc+lOHHTFszDG4t2aOWI4157FPuSPEXeiwYFv7tyVDfUcPPJYys/Fv7wu1WwNMmJulYtlzbafU/FpbACe9NkRpx2xZ/J5KdpckTdpmqwlafSKsm0GMBYKXePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYSRkCNnaGAKA+FBxg2i44JxbDRqCedCP8l/aG2+2KU=;
 b=bIni6JqpEPotr5Fy9rJEyjNDZAOa7stGAnc4Jp+0tKGNJgNbK6QUce50gb19ubXJAk6kLG9bGwtSLvX+ZKUfI5EuAqeEl3y1PatRjyDHBILM7zJWN4LhNAEpBPaaMy0KonIfsCmBfTqO81X9CobqwzupoIArI9H2Q9ygDUYOJKn2vXxDlCi6dH9VfekVQN0WkFuyhUnyqov2MdAwEvzF78+/m/K0mlOUhZm8o4/gw9/LfFn2brTAygzCPiHGczm7//i8xk8vFaOHRBz+NSgLf8EPhs0n2NWTI52JF0c71S0orNmMiGXvRFJ+RsmcW43Y/gO2dKGfSm+WwWrFxAEJTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYSRkCNnaGAKA+FBxg2i44JxbDRqCedCP8l/aG2+2KU=;
 b=Jw53n7nvJq9/1mXY5f9blMWm3i2BqYx8c2q2FNKd2xpRtHOeJ5PLyWjWLm9ykzhMolmp76vIIVf3Lk3B0UazCKnvHSUABjFmKVZlQ3E0xE2cYUlTqkS5q/PVd0YmC9id0WQJJi5yM+SYIoFKfQlyuwzLs69VA5CcU0v3ZqxKDyU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB9018.eurprd08.prod.outlook.com
 (2603:10a6:20b:5b0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 14:08:29 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 14:08:29 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/7] drm/panthor: Simplify getting the GPU model name
Date: Mon,  2 Jun 2025 15:08:08 +0100
Message-ID: <20250602140814.2559538-5-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602140814.2559538-1-karunika.choo@arm.com>
References: <20250602140814.2559538-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00007A8C.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::61c) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB9018:EE_|AM3PEPF0000A78D:EE_|AM8PR08MB5650:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e1a201-3e36-44ec-aba0-08dda1df0a73
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?32nY1K8Ivvw8ldGR0+leaAk8TBbf0XrqWWU5R1JGwJ9VIthFYc681AIhheC4?=
 =?us-ascii?Q?sB1MGUXoPXtZ/a1uAdvqZNBPXJB6dbtfR6gOQjR9NHDolXpliy5/I8dfqNSe?=
 =?us-ascii?Q?jwWrcufB0/l+TUVfbDVw5e+tdSMV5wGuoNE0Ol6o42Gyln56Hz2YLkYPrs0c?=
 =?us-ascii?Q?oLPzigJk3yjgDNuLxg6TnotIv7aupDpig+o4Dl+UdEeNn0j+gHgoiIy4I4aD?=
 =?us-ascii?Q?L3yszEZ8y4x9qJKpcWitH11mNrqVdZ08EpXI6HT7ZGfXOohZgqsbQDWTp6rL?=
 =?us-ascii?Q?Ek19yamZeT3xHNTamug+NEPhw42jXLNLVx/b9B7d+mfftfnAOqUTk6KdrgHt?=
 =?us-ascii?Q?OcctfWUzak+2DPTp+Fd6m2ndMAdxaQTE+0RTkLSQzaLs7y/bLBc03FtwC/kV?=
 =?us-ascii?Q?vooSX8yBxjtfuJpVHTFKNYQUUgDtFNPW/ZpJoJzXp2md4WxmjwGrv3InAb1H?=
 =?us-ascii?Q?xBCMIjlW28BeHUDywODR+okUSDSJWA4iOUAayRd/YBL9ixB2foWR4dqisjty?=
 =?us-ascii?Q?iFVJ2yuMuQYvsQKqRJWFms+LmhvCh64PLvw4Boftixu2xV6BAXzXTvG6LOQX?=
 =?us-ascii?Q?sJwJ1ga6k+s2fnkshZin0fR+F58VCc6mKxsWSfOHgSJI1MDQnGvaVpAvY+Sj?=
 =?us-ascii?Q?md8h1xy+uUIrRv9A3hI68dYOvfsyOQmFUUmto4LY31K3aSXkd6u+wetKzlQ2?=
 =?us-ascii?Q?sShWi1XZ4TICq6a7vu6FyXIfvU6IkfAo8h6HvJraVNj9iOSs9i5oXPx3fquW?=
 =?us-ascii?Q?5b7WIdS6h8taqSh6gEi99pghC678rhaL2syjoIu3a5tERP/oYNbSnJB2bQ4v?=
 =?us-ascii?Q?YtcKg0zcreqXUNB+Ad9AKPgmf+uvrE7j2fQoec2GWqrAoMLI57J2od/cd7IZ?=
 =?us-ascii?Q?QjJJxmCd273buSXdkHhMb0w8VX4N//EI4BstPGPxhNE+Uev4H1d4ZR/oq0Dx?=
 =?us-ascii?Q?FTgQADsb9wMRZD2E37oTn/KlUHnmlHpPNOjgL83/UG19j/CFL8QX6jEgUvh0?=
 =?us-ascii?Q?V1BAbosxAmadrFVomoAybOhVNeU4VJzYvixsLxTcGjS/txj5Rvl5XcHZnlvq?=
 =?us-ascii?Q?KfTSKDGosqgjQaIFgKRCfke3gmCSIe0MgcMroOrIKQwos2mAq/Yn0HLGoAws?=
 =?us-ascii?Q?hD+g2+KYI+NFZUU2Zi07EQe5ZGgrsamw3SCLtyvibNGiakvaCinwZdo4yq2x?=
 =?us-ascii?Q?+BrtIg9wzlAO+SpHwKEyDV48+GNrYqhg6eRtdqGXjFf6DBz3i5aAowhSexqt?=
 =?us-ascii?Q?nLeLgh06KoTP2MLqKcIhrpeyodrlxka1Q5cMKj1JmQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9018
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7e85999f-a40e-449e-619d-08dda1def28b
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|35042699022|14060799003|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BI08NcrAFpaGtk0vthmsDWhB2ZaGI0yxESXqsrSwJQhszYpCd32Drufno/By?=
 =?us-ascii?Q?LUYnCpPkK/9zqgybmRGS+jR79vqfO2wEBaSBP/CDXQc2PxYMdqng8cNlRvX2?=
 =?us-ascii?Q?O5nNTKO2IOoAhdxP/1YTBiBxrSXbDsE7zG9CsI9K4MHt165Dd+8C3sWH8ucd?=
 =?us-ascii?Q?wOoi892PfGbw0A9EENL69DaTFqxeUJ/yVyCSkxwakCAUEKPWV4ReU5okeWUa?=
 =?us-ascii?Q?V1xQjrBiyankhO7cUm6ipF9tmQsIqGu935LvXEw43q2REsEhgLH9i5PP2cTr?=
 =?us-ascii?Q?dVSirIoSAETP6liUL/bU9RdT3W9+GJqK06bOpU3uVHkr0Rz/Pmm1Gjhs+MJa?=
 =?us-ascii?Q?oLQxxa2boS2oomBuSFqcW3i0lcRmoVy033FSQt7EJySnoO2x5pFRwc0AUA/X?=
 =?us-ascii?Q?74Ho0AicvIx0yBAKuQfLIRVFrhOurCL4u7DlCVm4kjKnraXAyNWxEerAwCWg?=
 =?us-ascii?Q?R/hisu4TAEaYo9nkx5BGajw142UBEAXggPPBG/ACddXh6VVMg4jcVpNn0rIV?=
 =?us-ascii?Q?gUtU4ubiTBzlm62VoHN6UAQf857YLaXVn/TbjZQn9fKFBcKJm0Y/Rt1kVhiJ?=
 =?us-ascii?Q?Qjzup8JpHB1XPxcu6GH1xrnTDoByh+2Rn0kOaBovCXAj4Vgb+W7HKRkDUX+i?=
 =?us-ascii?Q?iq17R+Q1xah364zMfLLH4SBS3jkOIcpLY72Ta8TV/oU8Cmc3yY6J2LV2b8d1?=
 =?us-ascii?Q?FMlB3sN08sU1Jh8CuAORDZ9caFK29J801eKtseapj05W6oUmE7lRuqPm+46z?=
 =?us-ascii?Q?KlIfywVX9k/F1HrClLjyMVDGzRO8agqDuaVwlqJ3mtFdyhV/ekTlMEEGxrvR?=
 =?us-ascii?Q?muxRFZwRxzim589vKNoE4mn6ADZtowq1vhCTGwwGPuagSQMzVHMFquItYBZL?=
 =?us-ascii?Q?c4s5vqiSnXGSGaV/1VM7iltigGDVBzeYlL2UoYaUbQNYMDpnaP3vv7hGuUn9?=
 =?us-ascii?Q?/Y/GnQEPd+XAx4xr7mcn96dAQsGcfgoGdgjSx+JQgsUv3gyhIq62m884uyH8?=
 =?us-ascii?Q?ZlNCaBHerKq89W1fa8WkNLHZEM5Reky5PDIqTL6i/1RBMcpoB0VWUqi611w6?=
 =?us-ascii?Q?tqIzJP6gW5v2iCi1EbQ2pG4K563a7DQKWB6ok2ZKCA9wQskzvG1jDDwUtzAO?=
 =?us-ascii?Q?sNCmbgbtXs/3mvmuLasLup3Ryvz2abyoM2dVnfdXAuA2AfTdruy2lzz6btDE?=
 =?us-ascii?Q?MkDI9mkaLS/UBzAehUikk/dtmh9x8By/xFtpa2MbpIP2G1r4QBa43K4vuTv7?=
 =?us-ascii?Q?xy9XxO7YL+lJ6NYQFejmowCOJbaSB1AoY1wP1xqKZcn93ijTatwWpPI9vlXN?=
 =?us-ascii?Q?wgRZfOR8XUvyH2rXh/mCDmlWhK1lDYrBMKfJTXV615puXpKC5eVCBl6+Xb8T?=
 =?us-ascii?Q?+cktC4J5ZQWCaU6DEsRNKthDoHr2nY3C8/RHholNQj+7iFuNzDJmAn8FnvHc?=
 =?us-ascii?Q?oVCVaJIKqv8OgvNxdgpnXiO52zobiVPaB3ohb1wiqZNzPbNG9KDZ9ZQlMnD2?=
 =?us-ascii?Q?dWMAnnPCIk3btJ/UY9evkQ6EPkqgZdi5xDh1?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(35042699022)(14060799003)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:09:08.0668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e1a201-3e36-44ec-aba0-08dda1df0a73
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5650
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

This patch replaces the panthor_model structure with a simple switch
case based on the product_id which is in the format of:
        ((arch_major << 24) | product_major)

This simplifies comparison and allows extending of the function to
accommodate naming differences based on supported GPU features.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_hw.c   | 63 +++++++-------------------
 drivers/gpu/drm/panthor/panthor_regs.h |  2 +
 2 files changed, 19 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 576cda231c1c..421f84fde7d0 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -5,40 +5,6 @@
 #include "panthor_hw.h"
 #include "panthor_regs.h"
 
-/**
- * struct panthor_model - GPU model description
- */
-struct panthor_model {
-	/** @name: Model name. */
-	const char *name;
-
-	/** @arch_major: Major version number of architecture. */
-	u8 arch_major;
-
-	/** @product_major: Major version number of product. */
-	u8 product_major;
-};
-
-/**
- * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
- * by a combination of the major architecture version and the major product
- * version.
- * @_name: Name for the GPU model.
- * @_arch_major: Architecture major.
- * @_product_major: Product major.
- */
-#define GPU_MODEL(_name, _arch_major, _product_major) \
-{\
-	.name = __stringify(_name),				\
-	.arch_major = _arch_major,				\
-	.product_major = _product_major,			\
-}
-
-static const struct panthor_model gpu_models[] = {
-	GPU_MODEL(g610, 10, 7),
-	{},
-};
-
 static void panthor_gpu_info_init(struct panthor_device *ptdev)
 {
 	unsigned int i;
@@ -65,29 +31,34 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
 }
 
+static char *get_gpu_model_name(struct panthor_device *ptdev)
+{
+	const u32 gpu_id = ptdev->gpu_info.gpu_id;
+	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
+						GPU_PROD_MAJOR(gpu_id));
+
+	switch (product_id) {
+	case GPU_PROD_ID_MAKE(10, 7):
+		return "Mali-G610";
+	}
+
+	return "(Unknown Mali GPU)";
+}
+
 static void panthor_hw_info_init(struct panthor_device *ptdev)
 {
-	const struct panthor_model *model;
-	u32 arch_major, product_major;
+	const char *gpu_model_name = get_gpu_model_name(ptdev);
 	u32 major, minor, status;
 
 	panthor_gpu_info_init(ptdev);
 
-	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
-	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
 	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
 	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
 	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
 
-	for (model = gpu_models; model->name; model++) {
-		if (model->arch_major == arch_major &&
-		    model->product_major == product_major)
-			break;
-	}
-
 	drm_info(&ptdev->base,
-		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
-		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
+		 "%s id 0x%x major 0x%x minor 0x%x status 0x%x",
+		 gpu_model_name, ptdev->gpu_info.gpu_id >> 16,
 		 major, minor, status);
 
 	drm_info(&ptdev->base,
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 48bbfd40138c..e7a81686afdb 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -19,6 +19,8 @@
 #define   GPU_VER_MINOR(x)				(((x) & GENMASK(11, 4)) >> 4)
 #define   GPU_VER_STATUS(x)				((x) & GENMASK(3, 0))
 
+#define GPU_PROD_ID_MAKE(arch_major, prod_major)	(((arch_major) << 24) | (prod_major))
+
 #define GPU_L2_FEATURES					0x4
 #define  GPU_L2_FEATURES_LINE_SIZE(x)			(1 << ((x) & GENMASK(7, 0)))
 
-- 
2.49.0

