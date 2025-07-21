Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBBDB0C26C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACCA10E50E;
	Mon, 21 Jul 2025 11:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="O5QejGW0";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="O5QejGW0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013001.outbound.protection.outlook.com
 [40.107.162.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5CF10E13D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:14:38 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UlJPymKmgxSsMVgueIfLcj3boZmRFq4JSSwhsEdsxhM8TX0Lup+WWUZX3oQLeJix/YFPR8nzSE0GvVUCNPJnV1czZXvd1QXfkl2iE6g5AE19PZe8CaaeIKcpb1tp4FJSOrbUw5/qDnJS/MNNgXjnwvyZktoVGMh6upE9OABsN5AevDQzx6V6xDndlydnk27Pv7whv7cW0DPsbTX6JVJQxG1tmq/ghC4p4OJsiAycB1C8ThUMrVhm4ZnyKTvSgTRFCf1Xsxq4jt/vGMYYQPakQ+Nxob56ivjA89X+j5nDxBmLlsGsU0CWvmlAfFPgCqzNjEFmWLW2M0PJW+iK4Er5Hg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgnvO+9d7K+G84VCRRBWzaaYSigvxs/CeK31nvsCRKc=;
 b=GGOHsdUOfW8snYDpxWC/kTwvBOi8UVMSodIrF49WB+QpovS0t3HQQEfxuQ0sGwyHmeKZSlSjZiJIxaeQGpZskrwZAnd7tvhPXivQaYrtxJELG/2tnrj8ZnzUS7R0+H7jV3bHv6qoc3URcwMDrLplsrNWzBigrRJdOE22wF9iEOD9E2bzEZp6DMkHesestup19tBrvMzpTGvw0jNt1THLBLQKHuYEPxcp7M5OvMy8NY7dakCtcZkTxCwAOuntrJAgMB7p70SPXAFL8BHX7IKZVb49SYvyPSgwGNxNDPt2stId79wblM79LjX0QZtdwvLWZvvfa74v2PrKOWUxou5tzA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgnvO+9d7K+G84VCRRBWzaaYSigvxs/CeK31nvsCRKc=;
 b=O5QejGW0yd73BjCsmsEQgBUTufKQ6uTQyhL03H4FWLSl9YgNr8XamgthphbmJHPCngu27G/bdyFCkDO7ikamVpTgDjvwnKh5YuxwrHQDU2iuXS0kSalRYLDCD8nqazucPOxeVieoDG8cuOwVkrJXMR+xuHKm4fipIspM2U4w/IU=
Received: from DUZPR01CA0140.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::23) by AS8PR08MB7322.eurprd08.prod.outlook.com
 (2603:10a6:20b:441::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:14:32 +0000
Received: from DU2PEPF0001E9C2.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::13) by DUZPR01CA0140.outlook.office365.com
 (2603:10a6:10:4bd::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 11:14:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C2.mail.protection.outlook.com (10.167.8.71) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20 via
 Frontend Transport; Mon, 21 Jul 2025 11:14:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtPSPxjSMpofIidvfIYhAabxkCRAtXcvyn5FRt4GnWXq1KLu6orIhpGFwPDsDKinvdjpuYpauckflmmKqiTK+EE09PKCUrT76eSybI/6xBGxWaj0Zf7EIuCyeJX+setrd9gflfZehWIJZYfaQW+Ldh2/2qhePPTqWGaxCEC6gWmyWLY2lN4R+Geu4yP0tG+oQwlpR9+QBmUFYsfj0P+XTRyroI3fr2Mk1klxnnz+QMITHAsonAQAOmPVgNmRdHSCWFV3pbmDMrJr+uWjoIIiiIW4V+coXfhB5/zONSzcCTs1wIINDbQKOOIj7RKArbVCuiqg2ZbpO0tXKv2QBoh84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgnvO+9d7K+G84VCRRBWzaaYSigvxs/CeK31nvsCRKc=;
 b=JPl05AOuf3owpk3b+NH0hkFRAVPnyEKOTwFU3h5mug+nqRkEcJAo0M9Pzop/4ygvems7pHoM7hjyiWlgdykgWggmRWTfTRlNXZipTD+alBhbFQdj/HPf7XfffA0aJgtgAVmGwmU3XiE4UU5B1qPiz13NJeMHZU+xwl0XusOHkecYAd8qvcIpi38yQE52P4R0JMaRDx7dFWRl7kFB5Stio+tFBk9cBUmhXm7k4lOK3I9gj7gz8ljIPbO4N4HgYEJpTVfHu1n81Ieth+ZJ+LMlLGFquLttoTwtJpcFxWOnDVOWnf+wTs4wSZg6iELgBDF//ec7GlHG4o9Xw6Xcrf19Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgnvO+9d7K+G84VCRRBWzaaYSigvxs/CeK31nvsCRKc=;
 b=O5QejGW0yd73BjCsmsEQgBUTufKQ6uTQyhL03H4FWLSl9YgNr8XamgthphbmJHPCngu27G/bdyFCkDO7ikamVpTgDjvwnKh5YuxwrHQDU2iuXS0kSalRYLDCD8nqazucPOxeVieoDG8cuOwVkrJXMR+xuHKm4fipIspM2U4w/IU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GVXPR08MB11012.eurprd08.prod.outlook.com
 (2603:10a6:150:1ff::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:13:58 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:13:58 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/6] drm/panthor: Make MMU cache maintenance use
 FLUSH_CACHES command
Date: Mon, 21 Jul 2025 12:13:43 +0100
Message-ID: <20250721111344.1610250-6-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721111344.1610250-1-karunika.choo@arm.com>
References: <20250721111344.1610250-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0039.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::19) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GVXPR08MB11012:EE_|DU2PEPF0001E9C2:EE_|AS8PR08MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e080d32-8444-41b0-c909-08ddc847c3ab
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?KwzjvGn4vb+QR0ty3wFToqpztw3UXjst+jQi/GlI/V8twjGAvhxwNuEkARXN?=
 =?us-ascii?Q?ClHcvuU+YOX7jT9QwHUQKtxQaPjpgN/XBHQUMFzBpHolLN0M+raY43i70OVq?=
 =?us-ascii?Q?2Fsf9KHeDCb2NZE5pbASxlQ5O7BqQiAqgGanuJLGyp7bnsqzRzrxEuQJed4z?=
 =?us-ascii?Q?Q7/Q480/UYaN7yv5Nd7HP8R9uTl8ZJ4gP14D2v+SE6iHqbHfbb58LanXVXF0?=
 =?us-ascii?Q?UKjD/CJZJKbzJNo8c+red7F8p5FUWTi9FB/BWRczhUaqTBgGGunYPYAklR2m?=
 =?us-ascii?Q?DRbl5cquc5VDWLwiGpC/F9rDaRJsf56cNezwUrqZXyxV9BjOlRkazwL1FsxZ?=
 =?us-ascii?Q?Lb7VZwTn6YOcqg3E7aOo08suA7hMQ5AiEcKjIqEObw9TW4q7xmO5+bJ6XH7A?=
 =?us-ascii?Q?u+SOAZumnMfRe72ow2cApd+Tc6tFpVAXQORudSin5Cv7GDjL9IlM60hzbydt?=
 =?us-ascii?Q?Lk9Z9fsBphWl7s/jUlBZgS18k5Te4/Y/4IKfIH+jnjA7S/rwtRABoh+K1Rw1?=
 =?us-ascii?Q?xtx5YeJYf+akhtG2snstL9TW1g+8kNN2+NkCj8YdtCafJyMQLcK9ixBwJXuR?=
 =?us-ascii?Q?w81pKaemkgAa/0obE1MxH9AxMlaYipp4vGPH8VXU7aVeh0f2jFOwZFLU6hTF?=
 =?us-ascii?Q?eclX7KWG/0Z6B9htlZhz7J363Re5ybwk12SskTUabBllHLUHvH0942m9eXyR?=
 =?us-ascii?Q?qtCSP4XgSlLzh5NzT5QrWWLU74WcZgttcVluVNu/2XgxBHk7F1mDDlNtHC8I?=
 =?us-ascii?Q?uJdbrU7H2KbNQYgzGLlhz0LvbXTYtzuRapL53/zKZFoWinPp72hyyvtGlCpp?=
 =?us-ascii?Q?yzg2RnAGu08XXA4havVUD1em9gVo3xTO+PR+4xMQU+qPg4a8+7po8+X8KN07?=
 =?us-ascii?Q?MgWOjUDoOuieB+H1CegouHb4Z55dqycCNCmsI8kjxMfSzdfABvpllFCQ8Sdq?=
 =?us-ascii?Q?wQKp/7TpqWXimL8zjqaU+1BpsxKmrc+i9QlXA9L36GNkbBJAAwwjerika2jC?=
 =?us-ascii?Q?zOmP+ia7TwLES+hULdUxFgXNy4L3TBC8Y8pOq7Lhykf4JE4bAaSuiblct8ny?=
 =?us-ascii?Q?WYC9yv5hzuWhRmheVcKJnpnMJ/e8GzGgVMn2JcsmoETLiNQHdIvkTXJyLqYP?=
 =?us-ascii?Q?2pkqwidvLSRJk+lfNofdMrsemJJRxMZFMJ6hpJniWxFcb4DcNhgQo2ihkyNB?=
 =?us-ascii?Q?a7BBayqq8D7K4lwHSwfJHzgSj75sVaZ1E2Q3TrpMnhHHu8VrmNoh+WlRPvTe?=
 =?us-ascii?Q?auFySgbDAsbGYVXV57io7ste87nr8v2aMCMxjUv7YQhYQpYVej/QbzolX1+7?=
 =?us-ascii?Q?UO59+3Hj6jrPefOgg8ajRfCZ4Mm2gx9N7PxkqVhz9oBX5WgnVqII5Tn8G1CS?=
 =?us-ascii?Q?DB9snDI49twlb7IiZPUw3D0vFl3CYGz8K0Dsd7gw3C4zqw3bGw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11012
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b4652240-4b00-4ac2-0268-08ddc847b04f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|14060799003|35042699022|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mL8D82abHMkaUM+HhZhbX1x2SqECZWUvdTAUvUwm7JE94eOPYz2IllQ99X2Y?=
 =?us-ascii?Q?5DXdCvaxoL1fuXTjes7K/Hh152UUpac4jOP/XDKImx++fz11w1Ar3r8gwLB0?=
 =?us-ascii?Q?xh5aXbiQGe5eeeavxmzjWDyTWpq/ZFm8Y0uGnf2THx2FODC6YWTJqKfOt44f?=
 =?us-ascii?Q?PEBZ44EVVlJxe/ljyxtxcBZbwNTMG5/WVTuBmscSSdQvb7/XgzkQCR3VqlTP?=
 =?us-ascii?Q?sF9CpliqgxWrtGhM+C7qqqbEFvh6C3Dn7OK25wybop+vzbr6IQurtNh/lZMp?=
 =?us-ascii?Q?v/FJXxYZ01aSUvMqSwJ/mlQAILR293mvm3lEjL3xHItd/mCAb+1a22t6iTQj?=
 =?us-ascii?Q?NL/twF+BqU2cItrUQzMO/C3/aaE70Muotk9cQjDK4xrgj0oHJ68XUf+3E7uk?=
 =?us-ascii?Q?EvzwvwcuoeWLeHoXSm8ccO39Lz2vKM9hwQ4MtUK/BxTfLkTfyfAgQ8n2u8qi?=
 =?us-ascii?Q?gnvLFbr+1xWhIojJ5xeYpWaIZG1/jHe8vHJemLEQD2kuUSgucILJQnL5juUp?=
 =?us-ascii?Q?JlWDutfYldORzYNgWHoJJAGDAk1kwho2rjQbXe2z3cT1AJ8Q4xjYN0JpbPoL?=
 =?us-ascii?Q?u4VwafHB8yGAt7r4aGnchOkjPS6YrpSO05bybP/HfvCmYaQ4SKOdzCScKHV5?=
 =?us-ascii?Q?Tv80wf4wIS8dSTiLquSgX6Ko1umsxFUAfhl1Ll6QGnYqe2DY/r6m0bN2EkoB?=
 =?us-ascii?Q?9dgOzf7BjNFXG6rEfp7zo0xI9xWiKVqsPOIwZvcqH+gtKV8P3yWhMnXqaEx7?=
 =?us-ascii?Q?CkyYd7cFrFZXhTbxtzxQBnQH09Hi4aVmZKAj5UxWwNZFR9MOw7nIxU1JINBt?=
 =?us-ascii?Q?rcM+AtasVm6qjiy/0sJi88t9EvnMVLqu1+FHIfVPqcLTuleGO1nmGFaKCaUr?=
 =?us-ascii?Q?fW1zFvjaXQtLj5xZtNCMaao+ssu//7aJ0iluMXnqJsaIk6WRUgI1Z75GhlVs?=
 =?us-ascii?Q?56LFFtpynSH3ezxBmw2s/UmNA8e3stBbsBVIvjKu4ER5+G0SaizkgEwxfmF3?=
 =?us-ascii?Q?gjCxqsIQELMwNjDcg2JW2DV5UlhsxUAVp2V45bsc75lE9cZB6hca9zRUKBk4?=
 =?us-ascii?Q?F+ZGX8XpacN9ZJSAECXJUolEOT5UHmm2PRqerMNNWUlUbq87TtYKkgPQTRgH?=
 =?us-ascii?Q?QXy/tMtdaLSjpm8zMLXgMzmu8cy3QUJk4pFJ7oLG7k64VEEO4I7vQXmVvjV/?=
 =?us-ascii?Q?CsYEM2auPB0pDfUodwj1eLp7woT9aZW983DLQxof+kD+rzG4Nth5/3y09PDN?=
 =?us-ascii?Q?wQ8j8j3ShN8O2W9nNAOz6q+lYK+GAIGlc96BWSa+UM3e9TUBPxgU6yz+isLL?=
 =?us-ascii?Q?jIIX+JFuZjB2lxKmrf20b/n2r/1XvJSRSj5Rm81NKJmuhCWtNX1xUJ0Vy0dz?=
 =?us-ascii?Q?H9YPT/pmlrwD9DaeQXAlWOB2H0Ozrz73fcecKno2VlrEzENKnCFR8GTsgT6O?=
 =?us-ascii?Q?GbL/QSUrVR/lH8DvmlQRrE4PevRSvWJAPlInbCCOlv5WiXuPCElN6uQ9WK/E?=
 =?us-ascii?Q?12z5a9p7SUCAobxvbLMAYnuI1D9S7dT0jamN?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(14060799003)(35042699022)(1800799024)(82310400026)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:14:30.6548 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e080d32-8444-41b0-c909-08ddc847c3ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7322
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

As the FLUSH_MEM and FLUSH_PT MMU_AS commands are deprecated in GPUs
from Mali-Gx20 onwards, this patch adds support for performing cache
maintenance via the FLUSH_CACHES command in GPU_COMMAND in place of
FLUSH_MEM and FLUSH_PT commands.

Mali-Gx10 and Mali-Gx15 GPUs also has support for the FLUSH_CACHES
command and will also use this by default going forward.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 33 +++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 4140f697ba5a..367c89aca558 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -29,6 +29,7 @@
 
 #include "panthor_device.h"
 #include "panthor_gem.h"
+#include "panthor_gpu.h"
 #include "panthor_heap.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
@@ -568,6 +569,35 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
+static int mmu_hw_do_flush_on_gpu_ctrl(struct panthor_device *ptdev, int as_nr,
+				       u32 op)
+{
+	const u32 l2_flush_op = CACHE_CLEAN | CACHE_INV;
+	u32 lsc_flush_op = 0;
+	int ret;
+
+	if (op == AS_COMMAND_FLUSH_MEM)
+		lsc_flush_op = CACHE_CLEAN | CACHE_INV;
+
+	ret = wait_ready(ptdev, as_nr);
+	if (ret)
+		return ret;
+
+	ret = panthor_gpu_flush_caches(ptdev, l2_flush_op, lsc_flush_op, 0);
+	if (ret)
+		return ret;
+
+	/*
+	 * Explicitly unlock the region as the AS is not unlocked automatically
+	 * at the end of the GPU_CONTROL cache flush command, unlike
+	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
+	 */
+	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
+
+	/* Wait for the unlock command to complete */
+	return wait_ready(ptdev, as_nr);
+}
+
 static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 				      u64 iova, u64 size, u32 op)
 {
@@ -585,6 +615,9 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	if (op != AS_COMMAND_UNLOCK)
 		lock_region(ptdev, as_nr, iova, size);
 
+	if (op == AS_COMMAND_FLUSH_MEM || op == AS_COMMAND_FLUSH_PT)
+		return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);
+
 	/* Run the MMU operation */
 	write_cmd(ptdev, as_nr, op);
 
-- 
2.49.0

