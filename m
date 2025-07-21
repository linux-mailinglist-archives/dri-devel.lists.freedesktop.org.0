Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6631DB0CCAC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 23:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D1710E5AF;
	Mon, 21 Jul 2025 21:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="sFVp9k4n";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="sFVp9k4n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010018.outbound.protection.outlook.com [52.101.69.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8395310E3C9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 21:36:16 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wyPtrm1g/8/WkA7ttf7bRorcObRPYIRJ1uuPeNispgzx17ZYYaZBEcbezWw8mRoK+EqP//9lu5wZBwq1XojzAdNRybD106M//oc8IuhcAN1B09+Oxkv7FjGdVC0Ucjjuyy7YDpyhdXOU/qzsyBvjm1yaw9+wDeIwQhuNByElck8kWJV/Fjy328Xj/ZQbs2dGp0ijS8WAvxbpjbNEMzryouBixSGwbx8asrB1KRFylDZuADiZan9uYFH+zXo48IXYikHnu8tMtXAAU0kdqgy4tL4yqWVyAIQouupWRMev5kngLD+IGYSMabiSxp/gYgzIH5EUjlTY4wF6vDGyUfduyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVYcJayIJsL8vW+NQzAblZ6nHZpWEowmtF6ezHrEOkk=;
 b=c46RKUmASYkX1OAgcFEzQ8YfG0LS9eGlTlIZ5jbEKhvvH8+x5Ps9su2bHlZPALXriqJ3+tBCsKMCLbdayEGkQfWlyO4LjwTu44HMbpcGxugdnyJnevScZ2UNMj2RL54z2eXwhtVI/8+3X5Ie0/SVHxsruTHP/o6I8GaD5AorXad7J+lpui7f69kWJ+OxX9/cNu1rySQPGcl66HMQ2L1zBK/MaoW5EqkYR0cxni9wfmuliukbO6YAmqz7aRORwjekVyRkHqP/10TaTx/OiR6KtXdLcdYuzH7240SWEzkXgjGn/K9EsPwHlHgw2MgFWCFWuqpQ+PltDjEixgUUWsHSYQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVYcJayIJsL8vW+NQzAblZ6nHZpWEowmtF6ezHrEOkk=;
 b=sFVp9k4nQk1IUxvNTs2heB2CBAtoRaGlWO15xFEdqD+jK8QfpoZ6Ls4925TQLrB4Ey0TN5D+wPdedgqP48WKaQPoC8I3CBSlpvIIJwnrsw+Iwz4+od67qCpXdxXSuCEosuH/WGVb4U3QSf9XNC0cVyOF6VCGF54mlaYVnpdledM=
Received: from DUZPR01CA0217.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::11) by AS2PR08MB9764.eurprd08.prod.outlook.com
 (2603:10a6:20b:603::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 21:36:09 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::a0) by DUZPR01CA0217.outlook.office365.com
 (2603:10a6:10:4b4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 21:36:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20 via
 Frontend Transport; Mon, 21 Jul 2025 21:36:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVQ0TQ21qPmSaqqkKF288aXhnImqYsjUiLBAhpcJxsRF6pgQxzM4yB0nnKGuH1l76B+IVRbZiJkqN82FhuyG0qocUKgIHw5yRvZpVd9PfsUDH10WEan2milvIE6LtuRZbKTBcYFKRdtF6RhqEI+YEqeHnetAhbg8oRA1HJUVqjcMu2dtx4IlDriFdCzFaVIu8VRRS91keivUCyn4blvufXxDdf+ILzs9bwxHP8Fmu3Hky3ehy4aJZvFJTkW2kIOcMVTxEe2JdogHSNUcYnh+mYlb0p2lyNkKWR/88HczKbqRY4JqOY+WVDlneD01NMfNZZpLeVxXIHxeItDCu1yqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVYcJayIJsL8vW+NQzAblZ6nHZpWEowmtF6ezHrEOkk=;
 b=lO8Kt2+veg+LqIm7jxQkCuaT5z0NOnsNEIItWknB7pQwVPEyKAQCedaDFDH86iQPX3hVAaWmvVuN75nnw++wgxU+kWbxHY6ZSeh6bgHpqfYtN8fvpqIda5phv45/C+vfDxpig9JJY9pPuLSC/fjPwlbNcUyenbZ+6XRaNYrsI/O051XcW0XLRRfYHhRlpP2D6jzznJY/h1Za+2DTAANfoK4FgeOG954p1c2QJV3oO9rWTlNPkvTPKsF0qnRkTeAjKAf6nOKLAKbbV3pK6YZnav7anW2lfZEZE5HuN89O8c77r/odCv1mhOczoBOBMNrSoCBNAh++vpaTwS4F/IUxqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVYcJayIJsL8vW+NQzAblZ6nHZpWEowmtF6ezHrEOkk=;
 b=sFVp9k4nQk1IUxvNTs2heB2CBAtoRaGlWO15xFEdqD+jK8QfpoZ6Ls4925TQLrB4Ey0TN5D+wPdedgqP48WKaQPoC8I3CBSlpvIIJwnrsw+Iwz4+od67qCpXdxXSuCEosuH/WGVb4U3QSf9XNC0cVyOF6VCGF54mlaYVnpdledM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by PR3PR08MB5611.eurprd08.prod.outlook.com
 (2603:10a6:102:85::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 21:35:35 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 21:35:34 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/6] drm/panthor: Add panthor_hw and move gpu_info
 initialization into it
Date: Mon, 21 Jul 2025 22:35:23 +0100
Message-ID: <20250721213528.2885035-2-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721213528.2885035-1-karunika.choo@arm.com>
References: <20250721213528.2885035-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0650.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::20) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|PR3PR08MB5611:EE_|DU6PEPF00009527:EE_|AS2PR08MB9764:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f0fa99c-4eb5-40c3-db6f-08ddc89e9ab7
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?NTr1DPZC5v27NgBmj4IOxTO81KgG+xvVCKu2CUruga2Rpd00Mlfu7TM6NsZd?=
 =?us-ascii?Q?TWqEjZdDM73s7GjHL3Dm6NRnfnRT3o4W/Ffry7BTSDCTJQ+FnZM8EIyyp0rC?=
 =?us-ascii?Q?wKhyukD5kQUWKgkT/RIJVj2R8nAjhE61s0Iqc38EtnBxI55YEvj4Gkl4eFVi?=
 =?us-ascii?Q?/RoGB+ZyyCqidEGV9ac5Lpn6Xf1Hn2dZtDaEuCXzBvuSpnM5IUQVjK1qs7sq?=
 =?us-ascii?Q?srYaCD+YhdjDfOi2Ruak2ZwxgPMyDjJCHOxKzo+PSD0Cqd+BcK/GrcAZBZVg?=
 =?us-ascii?Q?/OAN9qiD2s3eL4VUm1QUSu89yj/p90+uBH0uSZMkZ6hae5e2l9U+SEpEwCRE?=
 =?us-ascii?Q?zR1ulone6mGy4YfoUTa1M14G0fsBHfaDph2q6djNjjE5TR6iCVPPe8UV7ahP?=
 =?us-ascii?Q?K23lYzBRU72FweLBVjndATv653nnqXt24Fzr/IPKUn5w4A6Q14g95il0sQXb?=
 =?us-ascii?Q?Rl4dZ3iJwhOeemWFNahCjD3tP+Mm9ZSN/ZziopYQYrnoVz5KrBOdb3YhSfd0?=
 =?us-ascii?Q?MC41brS3cb2fiABFXYGRx2l+HR1hRNNPblBI6C8sgDh9Gsp+mdpXd4PtUQsR?=
 =?us-ascii?Q?0zJyb/le4oH7wchfEXDPpG1zn7mfpl+mbpai03ryqESplXqy8DMjLVn8yWsA?=
 =?us-ascii?Q?PaumSwed94u4AyndoqyJJiCboyE53aQiqpMj7kHccIQJQp1TvJEpLK5kHUXv?=
 =?us-ascii?Q?ytpZEYvamy2WD4PcU0apXBI336926JebrMrnxn7NsHel7oXxoHyjlCNu3NB4?=
 =?us-ascii?Q?Zoz1IML0gK16ajEHakShhPIy2bEBDFQDHkVgZvkXIUf4dFXItZGQOBqo0463?=
 =?us-ascii?Q?+d2XJ9GRo/1sJvmH5OllmktomGhHFBtX5jLsn9Z0JstMfILw4YS6wynKcN4d?=
 =?us-ascii?Q?sM6oqdOvk2CI2TxNP6CAw3k7TZh+K9JvpUwqs/7HwwrZaxQgGuxjilGqQnuA?=
 =?us-ascii?Q?18kWTJnC3kStNb5wxuOOe80D/J2NqUg0lXW90BrjpCYp/FkSPla0QSN5xkuk?=
 =?us-ascii?Q?YEQ07eagZr1sb9rpWu5PMfS81inKdF/qrY1rair6hajkE/Ew+tSrMuAeBca7?=
 =?us-ascii?Q?j5l2gE8ioK3YBjqgTc0XfwwGZ/ZzRY/xPei+QhVreurFKQxguvwtBOyZDOxE?=
 =?us-ascii?Q?837mqwb0jUIFPHQjpa2sMiDaXFzZnyv9xUn3BDT+khqrCJtnzXe7kjgq6JA0?=
 =?us-ascii?Q?wqTn7hxbuIVT3nxjN84ru+KzkIwnOHRHm9hkeY5mv0y3bI47MHVZ75D2a75q?=
 =?us-ascii?Q?L+ozMLhKTI8USr1ylHvpCPgyAGvFqxyPKdsDp3zknDP+ngohdqwu7lF7jWjm?=
 =?us-ascii?Q?AdAQjRxhXJps3ScwGPnOQakTak3ePi4V2jXPL1tzNCLMmd1tXjutwS+o+Y0X?=
 =?us-ascii?Q?iL5HrO6rjz+EK2d+egkCGkTd525z0NlsEBrsj4THwsyMAJZoBn/Rkj0TvnkZ?=
 =?us-ascii?Q?GMKC5PGd4xo=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5611
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 57254e80-3070-45a7-7634-08ddc89e861d
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|35042699022|376014|14060799003|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6MNkk14Dak93EPc8JGcL8PwPlgPs+d8NvL5hear6WHe5NWfuNK3+eni2Ipep?=
 =?us-ascii?Q?3SSne3oLI4v514GSktiFlWVR9VWpX0nHOqaSmXE8bON4cFHiBUMZ0O21NBUs?=
 =?us-ascii?Q?7zhm5FCW3Hr9ghikOCppgQTBoLlVE2TYVgieVS9uP2oYKxqo5+KnUF48U/CT?=
 =?us-ascii?Q?TSAuPNWtyiQ2Ejl32zSt/DE0dvwl7AIqwId2jFNReGKiZTCcvyieu0Fr6mkZ?=
 =?us-ascii?Q?k3XXsXQPwyK+49/JIKyq1V3lLJaVr1KgVWDFB3qQ+5/1enmStm8lojKkxGt/?=
 =?us-ascii?Q?jwr8YAi2bs1ddNQd02P+8l9vip2/DV7+1kfYBnXMS0Vu9+fov2iV+BlWvpvy?=
 =?us-ascii?Q?gOzpqila3LTerRjMDIxiUul0RjlTwXLG2RK4Qog9+iJRbhLKDU6wdftw6Sdo?=
 =?us-ascii?Q?XCwOaFaOG2npi4ps3BANo0tvKExreNtVfIAAskKPCP1ICCjzECZzaAI73Msr?=
 =?us-ascii?Q?exzVu5WGuo4MUU6Ksf/mU4Vxuj1K9Skk2fNV+p09MqHZLmjbPQFZD+wHiZyI?=
 =?us-ascii?Q?LlaVY5Fj931FbuZyJKINgJIxrheMhLZY/+3axPClngsg/tpmKVFlGvFSTjrg?=
 =?us-ascii?Q?wF3hIrwNgj7LG/C3m31EDacB/2bN/UbvjS5J2pzycW3pwEoVVrLLO41DHrzT?=
 =?us-ascii?Q?YiIcLqpp8ZzD04e1NfDD6BQ/CXpVu7+/2lPMnBElPGdpOkd5Dyio401P0Oba?=
 =?us-ascii?Q?RnL/AMl4fQbMFxFvu7DUwZPxXIq6TKx8/IgD5FenKlqJx8+6Nh6YHy3HKBiD?=
 =?us-ascii?Q?NQmEU/XHXDTV497bQmftFOCmilfSCWsiXvYhcfhCzV8WVFan8CSgVuLS0HsF?=
 =?us-ascii?Q?KOk90FLe77AJBH5eLEVnwdpV43tPdeXaaU3o9Uavy3NjHApaI4u8W4F3082w?=
 =?us-ascii?Q?Yhrfz5whapInSUK867eajSFX8V+6R5Gfojq/hq/o2rzrex5/y5rVkCl/+40Q?=
 =?us-ascii?Q?j0iraUNFPyQsLYlHwlJV8y7iVwrkTr9xWTt/vH+bX5Gyady64R1twBN6Zlsd?=
 =?us-ascii?Q?wT0MRjy3PAOvHv0AgpHCcD6x9YLO6kJ5GlVTYRMEPoiOw6NVJcVZslqhfy0C?=
 =?us-ascii?Q?/wY9qNBhqMJ07H8zw1VY0tDLhKhHxEcrivSf4O0/v8FRVi27h7IdwVB6CrXO?=
 =?us-ascii?Q?vTbTWTWYcKe/UziEmRqzKcMW1HJi6LhlmYDgTbrCEOpbMofe6j2z+VYe4Ne8?=
 =?us-ascii?Q?Dlw5ZcfBAKtcu+A2405jtsWK1unyW/Tfj9FGxzkGoBtVSioDbzrZJoLVzYqf?=
 =?us-ascii?Q?KRN3UnfIzsHppXVz+xv0+7FfwnKA4FpYpUB6S8c/svM1TmVG1216XIXg4NcL?=
 =?us-ascii?Q?EsQLeiCmLl9vtp5BBwpGR1gGYCeEdzZSkz9QiDFPlu2M1Q6y+g/TYk1Zq+pn?=
 =?us-ascii?Q?ENxdQ/eHo6nsQwjCLYDvU9fUHEbWCUguj2nbBEmeNM8ttMI+mfBjtN96l23X?=
 =?us-ascii?Q?0XASR5BCTnVIGIJaKVXNl0klVWEpBxZO4uTGr5vmYqRxCTJ79PCWrdRglOWn?=
 =?us-ascii?Q?sQiwA4dP/vZeGEN84Mj+PX2DG1MHMzYTMi6k?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(35042699022)(376014)(14060799003)(36860700013)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 21:36:08.1526 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0fa99c-4eb5-40c3-db6f-08ddc89e9ab7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9764
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

This patch introduces panthor_hw and moves the initialization of the
gpu_info struct into panthor_hw.c in preparation of handling future GPU
register and naming changes.

Future GPU support can be added by extending panthor_gpu_info_init()
with the necessary register reads behind GPU architecture version guards
if the change is minor. For more complex changes, the function can be
forked and the appropriate function will need to be called based on the
GPU architecture version.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_gpu.c    |  95 -------------------
 drivers/gpu/drm/panthor/panthor_hw.c     | 113 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |  11 +++
 5 files changed, 130 insertions(+), 95 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 15294719b09c..02db21748c12 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -8,6 +8,7 @@ panthor-y := \
 	panthor_gem.o \
 	panthor_gpu.o \
 	panthor_heap.o \
+	panthor_hw.o \
 	panthor_mmu.o \
 	panthor_sched.o
 
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index f0b2da5b2b96..81df49880bd8 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -18,6 +18,7 @@
 #include "panthor_device.h"
 #include "panthor_fw.h"
 #include "panthor_gpu.h"
+#include "panthor_hw.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
@@ -244,6 +245,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 			return ret;
 	}
 
+	ret = panthor_hw_init(ptdev);
+	if (ret)
+		goto err_rpm_put;
+
 	ret = panthor_gpu_init(ptdev);
 	if (ret)
 		goto err_rpm_put;
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index cb7a335e07d7..5e2c3173ae27 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -37,40 +37,6 @@ struct panthor_gpu {
 	wait_queue_head_t reqs_acked;
 };
 
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
 #define GPU_INTERRUPTS_MASK	\
 	(GPU_IRQ_FAULT | \
 	 GPU_IRQ_PROTM_FAULT | \
@@ -83,66 +49,6 @@ static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
 }
 
-static void panthor_gpu_init_info(struct panthor_device *ptdev)
-{
-	const struct panthor_model *model;
-	u32 arch_major, product_major;
-	u32 major, minor, status;
-	unsigned int i;
-
-	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
-	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
-	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
-	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
-	ptdev->gpu_info.l2_features = gpu_read(ptdev, GPU_L2_FEATURES);
-	ptdev->gpu_info.tiler_features = gpu_read(ptdev, GPU_TILER_FEATURES);
-	ptdev->gpu_info.mem_features = gpu_read(ptdev, GPU_MEM_FEATURES);
-	ptdev->gpu_info.mmu_features = gpu_read(ptdev, GPU_MMU_FEATURES);
-	ptdev->gpu_info.thread_features = gpu_read(ptdev, GPU_THREAD_FEATURES);
-	ptdev->gpu_info.max_threads = gpu_read(ptdev, GPU_THREAD_MAX_THREADS);
-	ptdev->gpu_info.thread_max_workgroup_size = gpu_read(ptdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
-	ptdev->gpu_info.thread_max_barrier_size = gpu_read(ptdev, GPU_THREAD_MAX_BARRIER_SIZE);
-	ptdev->gpu_info.coherency_features = gpu_read(ptdev, GPU_COHERENCY_FEATURES);
-	for (i = 0; i < 4; i++)
-		ptdev->gpu_info.texture_features[i] = gpu_read(ptdev, GPU_TEXTURE_FEATURES(i));
-
-	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
-
-	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
-	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
-	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
-
-	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
-	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
-	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
-	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
-	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
-
-	for (model = gpu_models; model->name; model++) {
-		if (model->arch_major == arch_major &&
-		    model->product_major == product_major)
-			break;
-	}
-
-	drm_info(&ptdev->base,
-		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
-		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
-		 major, minor, status);
-
-	drm_info(&ptdev->base,
-		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
-		 ptdev->gpu_info.l2_features,
-		 ptdev->gpu_info.tiler_features,
-		 ptdev->gpu_info.mem_features,
-		 ptdev->gpu_info.mmu_features,
-		 ptdev->gpu_info.as_present);
-
-	drm_info(&ptdev->base,
-		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
-		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
-		 ptdev->gpu_info.tiler_present);
-}
-
 static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	gpu_write(ptdev, GPU_INT_CLEAR, status);
@@ -205,7 +111,6 @@ int panthor_gpu_init(struct panthor_device *ptdev)
 	spin_lock_init(&gpu->reqs_lock);
 	init_waitqueue_head(&gpu->reqs_acked);
 	ptdev->gpu = gpu;
-	panthor_gpu_init_info(ptdev);
 
 	dma_set_max_seg_size(ptdev->base.dev, UINT_MAX);
 	pa_bits = GPU_MMU_FEATURES_PA_BITS(ptdev->gpu_info.mmu_features);
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
new file mode 100644
index 000000000000..3f7175cb0ab4
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#include "panthor_device.h"
+#include "panthor_hw.h"
+#include "panthor_regs.h"
+
+/**
+ * struct panthor_model - GPU model description
+ */
+struct panthor_model {
+	/** @name: Model name. */
+	const char *name;
+
+	/** @arch_major: Major version number of architecture. */
+	u8 arch_major;
+
+	/** @product_major: Major version number of product. */
+	u8 product_major;
+};
+
+/**
+ * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
+ * by a combination of the major architecture version and the major product
+ * version.
+ * @_name: Name for the GPU model.
+ * @_arch_major: Architecture major.
+ * @_product_major: Product major.
+ */
+#define GPU_MODEL(_name, _arch_major, _product_major) \
+{\
+	.name = __stringify(_name),				\
+	.arch_major = _arch_major,				\
+	.product_major = _product_major,			\
+}
+
+static const struct panthor_model gpu_models[] = {
+	GPU_MODEL(g610, 10, 7),
+	{},
+};
+
+static void panthor_gpu_info_init(struct panthor_device *ptdev)
+{
+	unsigned int i;
+
+	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
+	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
+	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
+	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
+	ptdev->gpu_info.l2_features = gpu_read(ptdev, GPU_L2_FEATURES);
+	ptdev->gpu_info.tiler_features = gpu_read(ptdev, GPU_TILER_FEATURES);
+	ptdev->gpu_info.mem_features = gpu_read(ptdev, GPU_MEM_FEATURES);
+	ptdev->gpu_info.mmu_features = gpu_read(ptdev, GPU_MMU_FEATURES);
+	ptdev->gpu_info.thread_features = gpu_read(ptdev, GPU_THREAD_FEATURES);
+	ptdev->gpu_info.max_threads = gpu_read(ptdev, GPU_THREAD_MAX_THREADS);
+	ptdev->gpu_info.thread_max_workgroup_size = gpu_read(ptdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
+	ptdev->gpu_info.thread_max_barrier_size = gpu_read(ptdev, GPU_THREAD_MAX_BARRIER_SIZE);
+	ptdev->gpu_info.coherency_features = gpu_read(ptdev, GPU_COHERENCY_FEATURES);
+	for (i = 0; i < 4; i++)
+		ptdev->gpu_info.texture_features[i] = gpu_read(ptdev, GPU_TEXTURE_FEATURES(i));
+
+	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
+
+	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
+	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
+	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
+}
+
+static void panthor_hw_info_init(struct panthor_device *ptdev)
+{
+	const struct panthor_model *model;
+	u32 arch_major, product_major;
+	u32 major, minor, status;
+
+	panthor_gpu_info_init(ptdev);
+
+	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
+	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
+	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
+	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
+	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
+
+	for (model = gpu_models; model->name; model++) {
+		if (model->arch_major == arch_major &&
+		    model->product_major == product_major)
+			break;
+	}
+
+	drm_info(&ptdev->base,
+		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
+		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
+		 major, minor, status);
+
+	drm_info(&ptdev->base,
+		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
+		 ptdev->gpu_info.l2_features,
+		 ptdev->gpu_info.tiler_features,
+		 ptdev->gpu_info.mem_features,
+		 ptdev->gpu_info.mmu_features,
+		 ptdev->gpu_info.as_present);
+
+	drm_info(&ptdev->base,
+		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
+		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
+		 ptdev->gpu_info.tiler_present);
+}
+
+int panthor_hw_init(struct panthor_device *ptdev)
+{
+	panthor_hw_info_init(ptdev);
+
+	return 0;
+}
\ No newline at end of file
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
new file mode 100644
index 000000000000..0af6acc6aa6a
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#ifndef __PANTHOR_HW_H__
+#define __PANTHOR_HW_H__
+
+struct panthor_device;
+
+int panthor_hw_init(struct panthor_device *ptdev);
+
+#endif /* __PANTHOR_HW_H__ */
-- 
2.49.0

