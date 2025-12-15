Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE970CBDA58
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 12:56:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A557B10E46C;
	Mon, 15 Dec 2025 11:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="gZCyxec9";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gZCyxec9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013012.outbound.protection.outlook.com
 [52.101.83.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B0410E460
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 11:56:24 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rFycZpwDYU6scOoa9jdy7nOQLPsZLSnMRiEfmslDf027wHYvxclmNeSNEyx0OzkgJKzXMy+CCKdbNWtgJDVXoc7NwCX07IJLtWz7pt1hFOfI/lMrcfni8Zw6ubifO3RJTx/VymU1VFHnK2KowpvE23TVvi2yZ4+HpMwmdmNs0gtvNbz4SrN4QgpS7iCw9moU046DaTRkg2u5olSUUEt4uan+5EFPOVlpTN04De1c6bHhtsrIuRHYmjPt4g9fpJG82HZ08amnLSWqw9LQep98W3q0f2va6W1rLrssyMYBnlrDC/O/sPqXa+k4joOVNfEUGeISKD+CcgqZ/ChXe/Nq8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEM1iGO/gxI/xpEwv5ln7wY0dlVv1Wk35zeKZT3reQQ=;
 b=ota4ExfsYZiczsD7J09yoqz3V+Y4Tr79bEExXbrwzxQWAhB+aSHr6EopPb+UckDhi9TdL1kXNJwuTU/7X0rzeu+qAblqsT/JdGiIfkeI/yZzfq68PLLUJvLC8CHfkTvbeMzsJXKsPs+JZGm4rwV3AY0u06IQVbJ553fmH8BPqaVfqxqjW9rjQG+BIQkhetW2v8+YIzO9sSRdSz1RQGum1ofHw3e1ny3TQSrcZac1DcG68xsejRrZs8nLCOjW/3Bx9YRAOXSFfBYijLHOZLNEDrtJonKJst8+Lx0gspZbB/d/2xxdZgJMyNEqSqMRz4zo4mv4KPyxNuEcinKnmx5Azg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEM1iGO/gxI/xpEwv5ln7wY0dlVv1Wk35zeKZT3reQQ=;
 b=gZCyxec9S/9wGoi5x1nVGcb3mvC/UVhY2zZRgQApTBkQr+TueFrq4JGSxis/NQzAeAO6CbPQlNaPNZ9cqs6esyYDE/vGQNheqr/Nk6f3LNamo41JGAjfiRm70Z1y5hkC7dhXSEqJZmoypuHW8dE4JtY69Budyboc3VVLxQ04TmI=
Received: from DB3PR08CA0012.eurprd08.prod.outlook.com (2603:10a6:8::25) by
 GV2PR08MB11468.eurprd08.prod.outlook.com (2603:10a6:150:2b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:56:16 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:8:0:cafe::ef) by DB3PR08CA0012.outlook.office365.com
 (2603:10a6:8::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 11:56:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 11:56:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XmsHnNTskyYW71ES4kybGkAPakZCWfAq3QP5TFisUD1ib2UWGEK2sv0fLbltvV6x/CbEPyp6I8eC/3kF1d5bFOi1ZEj3VmO7Wb1b/4ikZBf5KKu0JkxxzOGoirBgO/I4nO5SKCOm7WyfsZJ6+OOyhHmmWrgps8MHtZre4DlYXpm+dNts08wXDdDJ+tjWKyEa1kB7Yqal8MmtkRqOiVz+dHNgYXCOrLfeF624Hh+M773+n87BU5WBtV+Qt3oiwQK1EMvIAoCq79ru8fgAumO8Aku3ZHf1873/T1kEooDXCkTqZxE0J52Qcdz/yX4l7AWZGNee+WKHDbUbQP3I9p02ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEM1iGO/gxI/xpEwv5ln7wY0dlVv1Wk35zeKZT3reQQ=;
 b=GfGlhYumKqYIWM3fp9fiJDB/g6k7kZj9p56TjQg9U8oztb9tSIAIoWTs/GrJTPri6EsOdnCRQmAl1pf58Pc4gs6LZ4OHamfJOOsU8kmkz8fJr4almkEhLSc9lzpWshVMZHXvn9896kDX5afspM5CcK5oWWHCF1iYUGnUXx6k97fHZC3MIHff8U7msQ7K+m5AHPFJYZxQDounT7u60Bu9LGFpOmwDsQPp8/E5oJwQtPyr3AzlZyfXq+tblJ0LNJHeUaxihNHosYOCglNj0aHccwvtfl4TRVwtc5pnaPM0PjZjlfYOs7YbA/GztNziVsLYFoB0H0PNn3LOOPMbs83eyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEM1iGO/gxI/xpEwv5ln7wY0dlVv1Wk35zeKZT3reQQ=;
 b=gZCyxec9S/9wGoi5x1nVGcb3mvC/UVhY2zZRgQApTBkQr+TueFrq4JGSxis/NQzAeAO6CbPQlNaPNZ9cqs6esyYDE/vGQNheqr/Nk6f3LNamo41JGAjfiRm70Z1y5hkC7dhXSEqJZmoypuHW8dE4JtY69Budyboc3VVLxQ04TmI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by VI1PR08MB5312.eurprd08.prod.outlook.com (2603:10a6:803:139::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:55:10 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 11:55:10 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: nd@arm.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v1 2/5] drm/panthor: Store queue fault and fatal information
Date: Mon, 15 Dec 2025 11:54:54 +0000
Message-Id: <20251215115457.2137485-3-lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <20251215115457.2137485-1-lukas.zapolskas@arm.com>
References: <20251215115457.2137485-1-lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0564.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::17) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|VI1PR08MB5312:EE_|DB1PEPF000509E7:EE_|GV2PR08MB11468:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fbc6961-82dd-45f9-44a5-08de3bd0f313
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?xhZ7zIqNQ68gMJCR4WAHBZh77S3p2a7MgUltR7llFduNox+6T3j2ZlXYXlhs?=
 =?us-ascii?Q?ePvGA2S2oYv300DYUjd/A7lHU2VqXfA/luCtyiLqWgzNXXpMWGtqu24supUm?=
 =?us-ascii?Q?imU4irX6Zt5TdLZ+z+l807kgCkuu1GsM3YU2TXsMzln8cDP3DZw90sueapyd?=
 =?us-ascii?Q?EidEIsh8JXec81b0fKG9torHKJVIhHn3ShRz5pi0wMauUrLplyVU4zctdH/g?=
 =?us-ascii?Q?e6ajCUriYNKyiuuARhnlEHZEGcPbtCYXPblCV+1XX2l2gdWgPsidl3PazFid?=
 =?us-ascii?Q?etXE7acElOvWIBm5SjihlJxaWxWTct2O7tBnYLIBbErIIp6uoWlTb05zFEft?=
 =?us-ascii?Q?SPUT6kf+b9ka2O2z8xOYVkBcSczuLrGBb+7zpV+DmT/lbEM8B3PhWfrU37eh?=
 =?us-ascii?Q?IxxRwkE5lqe4AYci+b2/rG3IW/8sBw+tEEsAikMEo74vtLkoWu7viUcZR4gN?=
 =?us-ascii?Q?TU3p3vpl0nRXkkp3vDQWpbczumFRntqG/mgmPDzbW2Jkbgs60uhNWX8+XmiI?=
 =?us-ascii?Q?0w5kHi9Hl1nM/l96WxCa5az3+NmqhyjWey4am5pe2yccJCTMns34WiGcXAEK?=
 =?us-ascii?Q?lsu397LvRWUaxRiqptLu8xJif9kteSilEZilqcINqkJzhFwiOwTmTQiCw9ub?=
 =?us-ascii?Q?kDjnk7JXJc1qrjOF3FMyFzla6f+yVqU0SJHI0spCyyXauNfQURk+oeJ67qOn?=
 =?us-ascii?Q?Mn+0ViGQRbJM1AjbqnOHLJ+yqfqVZkSTRiqdG9/o3dpbLDc7V9c75WJyT752?=
 =?us-ascii?Q?xtBzGItl77/qpvW8yD5M1TBdnqTuHzD/NZqbxDkUEp1LHaAQPtssfcj1v2Ts?=
 =?us-ascii?Q?uE6k4EE/fUH803sRrQVWbpr7UKNdCPjlSxhgWNQ520IEH2fj2OO1zHB5kgzR?=
 =?us-ascii?Q?A6qgQLIFXSvJny5tw29P4V6Suvg9OJQd1V5BRIguk76fk3mhXoYlvj0NqYNc?=
 =?us-ascii?Q?osmVp6c0YcuDY7DabwCy4T6HrSL2E0FmZl2nyRHcn2XeIRyuLQuwEsj1CTzF?=
 =?us-ascii?Q?ppxlOQUofkc8rm/rUchzMU5bQuXMhQX80eJDzjT0R7+5FMLj6kes3y0EWc5C?=
 =?us-ascii?Q?/nGNIncwbuc0O/nTYjTrtvTNLxGKT2c4S2dsn0MhhL48XbAyhiF+4qEM4+w/?=
 =?us-ascii?Q?HOBcGBPQ9Fi/DpUpl9u/Z5usWHXODF9JJKUCKCfOK0Nx+3o7KyLPQyQvgM5P?=
 =?us-ascii?Q?dAsznYJT7KbHdVLF6sWO80NmxDY2F7RdLjHPp4KRyyTx01kZSr4INkJmIykd?=
 =?us-ascii?Q?/Pc9BDeoQ+XOfdG6kayDjPvrabezaBqN0/029N8qgI7TUU/5iRIMIH+rQShS?=
 =?us-ascii?Q?lxb0igoz/kuZDQIqlutXY2NOD2fFZvdU8mAjEIJNIlwD2ILYsTEd1ZyUAd0n?=
 =?us-ascii?Q?qGCu8PlwvVKnVMOF4h7i3u31lwVdVjihzZ77LuhJhKshzUjzil1Dv5rmwFTN?=
 =?us-ascii?Q?xAeu2fClqSO7zrzqb8YfUXNMXavHHQ+S?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5312
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 69fef06e-a159-4c0b-c62f-08de3bd0cc53
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|1800799024|82310400026|376014|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cXcgokVq2rn7YRqJDfpAo8yWd2QabEWF2nxsCd3vqDs8pZQaMRUFjRvJLyUd?=
 =?us-ascii?Q?gfgoZ7DgQGAJ6vcN2xZvuHhdnVfbN6YifBNOSA2aEFzP4+0n2VoqXMhzXEFf?=
 =?us-ascii?Q?dlxEZVLMM1lqPSGKLgZNBLKA4f8jv0oqa43jDS2cU3nEs3xFcJjPWEbUjxOT?=
 =?us-ascii?Q?8ymY+SNr4b0BODFWRr+TA9vNKvsMLBUCSAUrgBCaiETus+vocmduypIL9frl?=
 =?us-ascii?Q?PmP/g4YKkHVd3sNzQfKBbDzSOBtxrXemKEoTpsGtgZq86b+omkoA8G962gIx?=
 =?us-ascii?Q?Q7cu6mTfgmGjg5A3uc3x8jqbFPQ8NCR/J3Sq8DM8H3tJqcacBaG0xs+4/wuM?=
 =?us-ascii?Q?U12PGA6jAM9UwqxubTDI+mmzPRtu26VvzdiJ+SKHWsefe2OsMqj7d44cu16F?=
 =?us-ascii?Q?VwgDVM6MkWpJ2Yu5MEWTMeWgcBEb5T0REjheDqfKaApXKTbHSCXE5vOYQwpG?=
 =?us-ascii?Q?tbMr6rco82IVyfTJR09cJsWCDRC1VsTNAO4CR/cq+jpv7xJNm9/enRFuXmpN?=
 =?us-ascii?Q?rHyyp9zVGBCIMCImzL/1z8FLlyfQP7ahKBp7dzW1pTALvHU8a26nUcYKJ3XN?=
 =?us-ascii?Q?mtMPxcfEcMfPQFJkjfssBiWU6ddU3X5X3xMLrFaRtUD5GSODqEqqV9gpNjVT?=
 =?us-ascii?Q?2DDIZkYsHrNnurrZujyXjsPxuEIW8peHHUF1TBBNCuggeg9XCdf/F9Dw7rTv?=
 =?us-ascii?Q?2E3r3ehrlr417TEV4mhyWrffLxf4XzX/C9f6IiHYk86O/tkfirMg/CjrGMaG?=
 =?us-ascii?Q?2waYR5iwYXkcyvPot5+HAyKCMjMCJsTYfOap1caAYQ/9VPPGQQ0BlBvq2Ncs?=
 =?us-ascii?Q?eLCGqF/7VKJjVb/YyVzmN8leZi+maDQ1dRsZ3WltX2amXM9eagfQ7SzkTt6l?=
 =?us-ascii?Q?hQM8kYmJzpBVQhnxhC8f6arbqra9Ne1NWshFFrcy4k/J/Yg3WM5TaCtET9Vz?=
 =?us-ascii?Q?zRD87y1B1z/LrUoV8Dg2WV164mXE2XWac6+e6HKa7eHW42igd91oCGS7Ckni?=
 =?us-ascii?Q?9Ek/pnS+G/Tfx7POf6HI+2efVco1Lp9uCwRK/EUWJp7EmxA4mA1s4BSkPFUo?=
 =?us-ascii?Q?0BuK/befSzrOd9n9LlNi+Nyhk1ZjzCAEj3VfEdQXJXu9G5tQgZxnfVCnbNq6?=
 =?us-ascii?Q?+PF/YIKVTPHIxclk8ZQguiu8J62pbAvntscF8+Bf7L0dafeC1gVTRRh93diq?=
 =?us-ascii?Q?g1q9s/Z6OM8QyzYr91MfCb5QOkVmTwztLoJZub21ICMKfVmxV8QJb4l9Dw+5?=
 =?us-ascii?Q?hBbDq8fMFiUG4jZ20ezDfmhtgsXpd3OfhmeubEXXK8Q50EZX5LfGtT35KMh7?=
 =?us-ascii?Q?Iasy7txhShrEjngsSKRyFZ2N1pXyGjcJ0HGDUNGQx/p4EyrOVbESF4UR8Jtd?=
 =?us-ascii?Q?j38n82pds6mM1pDce/XmnRzqrrdcnX8L0bvHvevChl1cfgW672iL3RnHpcSZ?=
 =?us-ascii?Q?DDsfNf7iwKL/SykDvAyhncfuj8eMkthaMVuoxw3ghivWQIrVn45ovcvL8s8m?=
 =?us-ascii?Q?4P7luIgwKfjAmWdUKHUIasQ39SfkwW2nqt/pzVv/MFfePdpYuUtDlPrezYnz?=
 =?us-ascii?Q?zoznZ/eCq7ee7Qsu//s=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(1800799024)(82310400026)(376014)(36860700013)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 11:56:14.9465 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbc6961-82dd-45f9-44a5-08de3bd0f313
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11468
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

A queue may encounter either one fatal fault or any number of
recoverable faults during execution. The CSF FW provides the
FAULT/FATAL registers, indicating the fault type, and another
set of registers providing more metadata about why the fault
was generated. Storing the information allows it to be
reported to the user using the GROUP_GET_STATE ioctl.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 116 +++++++++++++++++-------
 include/uapi/drm/panthor_drm.h          |  17 ++++
 2 files changed, 100 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index eb8841beba39..a77399e95620 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -342,6 +342,14 @@ struct panthor_syncobj_64b {
 	u32 pad;
 };
 
+struct panthor_queue_event {
+	/** @link: Link to a list of Panthor event errors. */
+	struct list_head link;
+
+	/** @event: The event containing all of the fault/fatal metadata. */
+	struct drm_panthor_queue_event event;
+};
+
 /**
  * struct panthor_queue - Execution queue
  */
@@ -485,6 +493,9 @@ struct panthor_queue {
 		/** @seqno: Index of the next available profiling information slot. */
 		u32 seqno;
 	} profiling;
+
+	/** @events: List of fault or fatal events reported on this queue. */
+	struct list_head events;
 };
 
 /**
@@ -918,6 +929,8 @@ panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue
 
 static void group_free_queue(struct panthor_group *group, struct panthor_queue *queue)
 {
+	struct panthor_queue_event *evt, *tmp;
+
 	if (IS_ERR_OR_NULL(queue))
 		return;
 
@@ -934,6 +947,11 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
 
 	panthor_queue_put_syncwait_obj(queue);
 
+	list_for_each_entry_safe(evt, tmp, &queue->events, link) {
+		list_del(&evt->link);
+		kfree(evt);
+	}
+
 	panthor_kernel_bo_destroy(queue->ringbuf);
 	panthor_kernel_bo_destroy(queue->iface.mem);
 	panthor_kernel_bo_destroy(queue->profiling.slots);
@@ -1476,6 +1494,69 @@ csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
 	return 0;
 }
 
+static struct panthor_queue_event *
+panthor_queue_create_event(unsigned long event_type, u32 cs_id, u32 exception)
+{
+	struct panthor_queue_event *event;
+
+	event = kzalloc(sizeof(*event), GFP_KERNEL);
+	if (!event)
+		return ERR_PTR(-ENOMEM);
+
+	event->event = (struct drm_panthor_queue_event){
+		.queue_id = cs_id,
+		.event_type = event_type,
+		.exception_type = CS_EXCEPTION_TYPE(exception),
+		.exception_data = CS_EXCEPTION_DATA(exception),
+	};
+	INIT_LIST_HEAD(&event->link);
+
+	return event;
+}
+
+#define PANTHOR_DEFINE_EVENT_INFO(__type, __msg, __event) \
+static u32 panthor_queue_set_ ## __type ## _info(struct panthor_device *ptdev,			\
+						 struct panthor_group *group,			\
+						 u32 csg_id, u32 cs_id)				\
+{												\
+	struct panthor_scheduler *sched = ptdev->scheduler;					\
+	struct panthor_fw_cs_iface *iface = panthor_fw_get_cs_iface(ptdev, csg_id, cs_id);	\
+	struct panthor_queue *queue = group && cs_id < group->queue_count ?			\
+				      group->queues[cs_id] : NULL;				\
+	struct panthor_queue_event *event;							\
+												\
+	lockdep_assert_held(&sched->lock);							\
+												\
+	if (!iface || !queue)									\
+		return 0;									\
+												\
+	const u32 exception = iface->output->__type;						\
+	const u64 info = iface->output->__type ## _info;					\
+												\
+	event = panthor_queue_create_event((__event), cs_id, exception);			\
+												\
+	if (!IS_ERR(event))									\
+		list_add_tail(&event->link, &queue->events);					\
+	else											\
+		drm_err(&ptdev->base, "Could not store fault notification, err = %ld",		\
+			PTR_ERR(event));							\
+												\
+	drm_warn(&ptdev->base,									\
+		 "CSG slot %d CS slot: %d\n"							\
+		 "CS_" __msg  ".EXCEPTION_TYPE: 0x%x (%s)\n"					\
+		 "CS_" __msg  ".EXCEPTION_DATA: 0x%x\n"						\
+		 "CS_" __msg  "_INFO.EXCEPTION_DATA: 0x%llx\n",					\
+		 csg_id, cs_id,									\
+		 (unsigned int)CS_EXCEPTION_TYPE(exception),					\
+		 panthor_exception_name(ptdev, CS_EXCEPTION_TYPE(exception)),			\
+		 (unsigned int)CS_EXCEPTION_DATA(exception), info);				\
+												\
+	return exception;									\
+}
+
+PANTHOR_DEFINE_EVENT_INFO(fatal, "FATAL", DRM_PANTHOR_GROUP_STATE_FATAL_FAULT);
+PANTHOR_DEFINE_EVENT_INFO(fault, "FAULT", DRM_PANTHOR_GROUP_STATE_QUEUE_FAULT);
+
 static void
 cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
 				   u32 csg_id, u32 cs_id)
@@ -1483,15 +1564,11 @@ cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
 	struct panthor_scheduler *sched = ptdev->scheduler;
 	struct panthor_csg_slot *csg_slot = &sched->csg_slots[csg_id];
 	struct panthor_group *group = csg_slot->group;
-	struct panthor_fw_cs_iface *cs_iface;
 	u32 fatal;
-	u64 info;
 
 	lockdep_assert_held(&sched->lock);
 
-	cs_iface = panthor_fw_get_cs_iface(ptdev, csg_id, cs_id);
-	fatal = cs_iface->output->fatal;
-	info = cs_iface->output->fatal_info;
+	fatal = panthor_queue_set_fatal_info(ptdev, group, csg_id, cs_id);
 
 	if (group) {
 		drm_warn(&ptdev->base, "CS_FATAL: pid=%d, comm=%s\n",
@@ -1509,17 +1586,6 @@ cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
 	} else {
 		sched_queue_delayed_work(sched, tick, 0);
 	}
-
-	drm_warn(&ptdev->base,
-		 "CSG slot %d CS slot: %d\n"
-		 "CS_FATAL.EXCEPTION_TYPE: 0x%x (%s)\n"
-		 "CS_FATAL.EXCEPTION_DATA: 0x%x\n"
-		 "CS_FATAL_INFO.EXCEPTION_DATA: 0x%llx\n",
-		 csg_id, cs_id,
-		 (unsigned int)CS_EXCEPTION_TYPE(fatal),
-		 panthor_exception_name(ptdev, CS_EXCEPTION_TYPE(fatal)),
-		 (unsigned int)CS_EXCEPTION_DATA(fatal),
-		 info);
 }
 
 static void
@@ -1531,15 +1597,10 @@ cs_slot_process_fault_event_locked(struct panthor_device *ptdev,
 	struct panthor_group *group = csg_slot->group;
 	struct panthor_queue *queue = group && cs_id < group->queue_count ?
 				      group->queues[cs_id] : NULL;
-	struct panthor_fw_cs_iface *cs_iface;
-	u32 fault;
-	u64 info;
 
 	lockdep_assert_held(&sched->lock);
 
-	cs_iface = panthor_fw_get_cs_iface(ptdev, csg_id, cs_id);
-	fault = cs_iface->output->fault;
-	info = cs_iface->output->fault_info;
+	panthor_queue_set_fault_info(ptdev, group, csg_id, cs_id);
 
 	if (queue) {
 		u64 cs_extract = queue->iface.output->extract;
@@ -1564,17 +1625,6 @@ cs_slot_process_fault_event_locked(struct panthor_device *ptdev,
 
 		group->fault_queues |= BIT(cs_id);
 	}
-
-	drm_warn(&ptdev->base,
-		 "CSG slot %d CS slot: %d\n"
-		 "CS_FAULT.EXCEPTION_TYPE: 0x%x (%s)\n"
-		 "CS_FAULT.EXCEPTION_DATA: 0x%x\n"
-		 "CS_FAULT_INFO.EXCEPTION_DATA: 0x%llx\n",
-		 csg_id, cs_id,
-		 (unsigned int)CS_EXCEPTION_TYPE(fault),
-		 panthor_exception_name(ptdev, CS_EXCEPTION_TYPE(fault)),
-		 (unsigned int)CS_EXCEPTION_DATA(fault),
-		 info);
 }
 
 static int group_process_tiler_oom(struct panthor_group *group, u32 cs_id)
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 77262d2b9672..083a02418d28 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -974,6 +974,23 @@ enum drm_panthor_group_state_flags {
 	DRM_PANTHOR_GROUP_STATE_QUEUE_FAULT = 1 << 3,
 };
 
+/**
+ * struct drm_panthor_queue_event - Fault or fatal event occurring on a single queue.
+ */
+struct drm_panthor_queue_event {
+	/** @queue_id: The ID of the queue that faulted. */
+	__u32 queue_id;
+
+	/** @event_type: What kind of event is being propagated. */
+	__u32 event_type;
+
+	/** @exception_type: The type of exception that caused the fault. */
+	__u32 exception_type;
+
+	/** @exception_data: Exception-specific data. */
+	__u32 exception_data;
+};
+
 /**
  * struct drm_panthor_group_get_state - Arguments passed to DRM_IOCTL_PANTHOR_GROUP_GET_STATE
  *
-- 
2.33.0.dirty

