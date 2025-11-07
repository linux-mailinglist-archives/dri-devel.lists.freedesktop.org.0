Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33D6C40524
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 15:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD7510EAE5;
	Fri,  7 Nov 2025 14:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="OAIEStU+";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OAIEStU+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010032.outbound.protection.outlook.com [52.101.84.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D98110EAE3
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 14:25:59 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=larxTAA85U/oJ1MEnxstRBCzbwaCBniF7MsGJvJzGUGEBRq5ewM1aAlA+lMuyhZ8tqN3EHUsjB36MmUHLHOz1HLrfDSfH7+BFIBpBJrEeX8IfK1p9EOD+uLLa1Q7W4tdEZhyeFB0IP69cLT1X/6ZpER2iINpzFfJ8Tq/QXt103TvjWcRIunEpW/zrkmNjCAhic/lxdJwmMDCxdwUbRNhbw4zTTLk6S3s0IYfJ/c6MqhwSNTOYYhmzp3oeGjYA4Fhqa9CfxKbfwjOl6NIV7gYsuL4qUECupAGze+K44h0jMoPyCpfYGf0oVIXJQVhopE4gIoNg+6/n8nYhi1UnCLblA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJJnioYh015k1OUfawW9USWrx1lWTBPRtn1PHF187eQ=;
 b=ch5jwSq3Ct3HyJMoaKaACCfDJozl1x5CNYIVBxKU5aQqcLm9rEaH9qfFrYPQ0E7ibXqht7YSrVzpJgPEDyb5dDh1s4DnAaiIlNBMWuKEw2ZPhDlVJIgWSgH+up8R+CpOgTvW/dWeZ8LRPwvgwnzsb5WSVsY9cA9EfR7bTGG9Q8UYHXDPaRN5FvdoGgkXJtlOpJqkijZhKl7D/nSbFzJKq8YCusFRXhhG3WdQWmY67p7wwfqFfLIhG4xhxkccmkL8oMQ5jWaVfv/fqtuvtLiVbPOnZfS5AkDp24vXqvE4F64jebHhsc/ROFf8a2qgVrlrGSbDk76m5k8CMjL6UbE0Nw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJJnioYh015k1OUfawW9USWrx1lWTBPRtn1PHF187eQ=;
 b=OAIEStU+6vZTuLS4f4rXwThLHbWvhCwqpwJS3tLFyBtR8HGlrNbWHovdQfBP4GCPhDQ0p/enFHdgI50d2r5mHWSh+OVA3Rj0HDTN5fPTFpmaZ6Z3ADbyRlS7d3AJuDwxdnf+Hk9sPvFJIkzzu/LwEiZnkNs8/WsI1txT26OZKJc=
Received: from AM9P195CA0002.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::7)
 by GV1PR08MB10669.eurprd08.prod.outlook.com (2603:10a6:150:167::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Fri, 7 Nov
 2025 14:25:54 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::b0) by AM9P195CA0002.outlook.office365.com
 (2603:10a6:20b:21f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 14:25:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Fri, 7 Nov 2025 14:25:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jme+r/eNhZKagjuwe8aAVbZ+auyeTW+3IZ+K0GlbbawbM91wStQmYrj7NEF+WbE6tfs6e9pQ7p+BA/AZK15qwYNosrXCp3q8sczUAY1fC02i+C27EF9GopEtqSUF8eUUvrXJLpx6XSDdE6+7B0WKosNQ7XNRAEv99VuQO7PI4NzsDO6ie7tdhyZqqlUEg4yPj2D3J+smFuVk6DpzwN3jU5qTgAwJe1nDnpbI1z8sfdQ9eSoRsAOipGkBsxA5eCugqMg+DSAAQguzRsZruS3UY7R29vsuijGtuY6ic7yk06HsMhw2UB3pxqwXEmEuBFq8unjmbbc1IR5fUwxXhZOriQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJJnioYh015k1OUfawW9USWrx1lWTBPRtn1PHF187eQ=;
 b=teXp8/5DPURk88XazaIdWe0+xIYXO99h0h6hzsyPBapBVXN0SqugBenmZXF77e3MHD4989JpSjtbk0t3x01sDR44TG8x9Csm0uOC4Dt+AS9eknulljNOWQwBhqRK5biCFsDZYOqpAKnATI6M5hp0iuiIcEnjvaiKVDrDeypakkjA5ujA1XL3aIYINez2L6fWNOZvNZxYljq9fTiwLEH5/w+2wgE2QrFZ0tEpbtUQqrHZ4zX6zsUon0938RIuI20/+WdaVzYBmgzdQ+yzygTPLvdiDrFQe8nyVuj0ph7nPAOyfQ+P+ThwSFGf6vyBswTN1YiCDqPs4Psyg51mBIRCAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJJnioYh015k1OUfawW9USWrx1lWTBPRtn1PHF187eQ=;
 b=OAIEStU+6vZTuLS4f4rXwThLHbWvhCwqpwJS3tLFyBtR8HGlrNbWHovdQfBP4GCPhDQ0p/enFHdgI50d2r5mHWSh+OVA3Rj0HDTN5fPTFpmaZ6Z3ADbyRlS7d3AJuDwxdnf+Hk9sPvFJIkzzu/LwEiZnkNs8/WsI1txT26OZKJc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS4PR08MB7505.eurprd08.prod.outlook.com
 (2603:10a6:20b:4f7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 14:25:21 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9298.007; Fri, 7 Nov 2025
 14:25:21 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/8] drm/panthor: Support GLB_REQ.STATE field for Mali-G1
 GPUs
Date: Fri,  7 Nov 2025 14:24:38 +0000
Message-ID: <20251107142440.1134528-7-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251107142440.1134528-1-karunika.choo@arm.com>
References: <20251107142440.1134528-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0044.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::32) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS4PR08MB7505:EE_|AMS1EPF0000004B:EE_|GV1PR08MB10669:EE_
X-MS-Office365-Filtering-Correlation-Id: b57dad7a-9c3a-4733-3afe-08de1e098f26
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?I4VsM6MBJh5eXYs5bk9FwSLdBEC9HQaqdCuihtP2w/Gs7ZoN6xLYa0xDwLhH?=
 =?us-ascii?Q?2uv0YtlL+U+tj6Ns4gzCF2rSaOCpQVkRoZdW0RjJnDpphQ43xNwMQ8ROozKT?=
 =?us-ascii?Q?BIYghtSsUdfX6Lz2cD1KcKaNj8N1jkE9IVEAIMSwuhlMh1l7KXBXC1+YxdUz?=
 =?us-ascii?Q?e+xJTlNuosuvnlJ2GM+DSFpXbnICRNhjRRpSoJ+KjKwV3cJqVSF+tw2ON59I?=
 =?us-ascii?Q?URdAadsfAOp1Cn+8/+E6+891KM/Y+LbkAg/Y4ElcwpMf1nhW0eNM+VDepLo6?=
 =?us-ascii?Q?zqmWneT1d8VLjs9PtJTJ7X+xLaYdjzhyuvAbjF08XhEua4WE/ocVPPkl/m1S?=
 =?us-ascii?Q?aIgTJOhBjS7v25mWCa/aHb3QF/NBc4hLGlVTfZw0rr1PztS7cxDmBTDPaleL?=
 =?us-ascii?Q?8I5tHbmiNvIQGsvgS2gt/pCrMp8nJ9HGNnFX09GKcSFmaR+MMChb6VG00AIq?=
 =?us-ascii?Q?owyVxCHmsHn5/XZGbNc+LSjCo52AUNSKJV7fkskw/yM9yIQ61FlKT5pF7/Dx?=
 =?us-ascii?Q?ES4h83P9XyinvkFP50H+RRb81c4xBJNn5RpwBs5kBbe8v3yDLHwaLw5gFfqH?=
 =?us-ascii?Q?hrmsKw1mqu4fbrnG/vXGr1Un0u0IQvY9+N0pyVllesIr+9MY/VFUfOGGA4R2?=
 =?us-ascii?Q?UyvqTLXYC1uvUEvTEnHdEAvaGxR6ZmJVRDDrI7B4NvGChREmWtzRWNpXNSS7?=
 =?us-ascii?Q?djiK4c7RkoGyapYNjE79B2Deos24HpIhrGgPIA879R5NMfuPIW0O7fpi4xb3?=
 =?us-ascii?Q?vqmYHPH0y0TqNvJw15ZOFz2wsRSeLBSS7bB/s7ObFlyx+q7Xm8xtbFAOI6AV?=
 =?us-ascii?Q?Ks6mCF4XptejSMfZCIK+1PDHXaqzogV9O3mWgBk53y9fEVmIJv+isNiILnHq?=
 =?us-ascii?Q?Z8YSYgKxvjEHOFPCNfO6yQy0ecgVWU/Zf4+RyuLsAhniyKYZXUilzPYTCrgE?=
 =?us-ascii?Q?ZnkrqZoEz4j+6WAvQ/3c84M0wkCickg52bgLP/q/obJdIXXGL3VddFOIQPGD?=
 =?us-ascii?Q?QcpGaTgru6YWB1315PMcchCt1x8YlMiHcBD1OOoHqiwXYPLHYx+KdCPWZzyo?=
 =?us-ascii?Q?d9M1hGLK18lDyjKteroPYzyBPydTtTn0275s6M+uR/y1Ig+eiscueM7h6Ekt?=
 =?us-ascii?Q?NezxCDpPKZDGoXmVzF772PpPyPPNmFaeDP4pZ+31TElHyaRyVxHvND7uvHjA?=
 =?us-ascii?Q?KzmBmFyelFRWVnpvbcBzvVvEDbe71C/OQYs1q9KqMn6NVlA34KPWugMxn5EY?=
 =?us-ascii?Q?x/ZbAGuRV9fVkimEpINhX/FXHeefRU98f3jpj9r8XEMqA2nEl/CZyO8VyojQ?=
 =?us-ascii?Q?PYJzkKshelvIoKN3mLXuZNqFANx52jTabWXu5+E92sfdkZzK7c8WGnE6Js29?=
 =?us-ascii?Q?iIFLZpUsZXbljFQfMp9I914YsB/ReAVjD90t9EtobWb1mbDF2HWuWaTuxPrn?=
 =?us-ascii?Q?sbrWHe+1Rf9asg/rIMGaqL4Ilg05vTNM?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7505
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 43b14c11-3d08-4cd3-e8db-08de1e097b70
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|14060799003|35042699022|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zY0tc++rqq6DtiianT5eYOn0lCYtErA0g65zZpEtBLtTE7zLk4qMcwzdNgpb?=
 =?us-ascii?Q?pdGPzMMfhg0+wz10s+TVp44RYjyqWFI9DVjH6oQPh7u45taiMWbi4whm8omA?=
 =?us-ascii?Q?Xqok8SW8x//Iv5/zLWNvaFRysyBHbAFRMYrN5Rra8HQ6bjiubcokdGMNfxHo?=
 =?us-ascii?Q?3LgC/ygwdtcfmbV0ti+UXcH+vL+LQ0jCnlOuZHLLOm889AeCOdwEMy0/gfxf?=
 =?us-ascii?Q?2B8efWOOajdpvwhKujBeAwJIjc7Rm5e/31vFs6ndxYY29dIVxhEGLJEfPBLJ?=
 =?us-ascii?Q?FnMK85RAnTBcONu8hIf4Z4CNVes3cnRIcWa6566XRbo5MWJdESXV2nKNv3N0?=
 =?us-ascii?Q?vgw4/xXoVN2b6V6FtbD8SUatp28wkXkAipWbtrnIx//Pjv8fXaCBW7tQQDcJ?=
 =?us-ascii?Q?OwsE6tt6qG7aNUAYhhk5L/6tclE+UpRFI0VoSs7SQD6M/co3gbZ0HCUDh54V?=
 =?us-ascii?Q?u6hJVt+C9vuOqrhLhnnp8ld1vBx3y2gh5M/qsxSIXH3qxWiyKmYogWDpz1BE?=
 =?us-ascii?Q?zOYphRKmVrWFcTENwst0YlZF4pqslhE35u4UWI8rEKdkmz/YQ6Ci7lu7ppDc?=
 =?us-ascii?Q?Mhz+mnTt+5ggXVaYX4PY9vtTyGyMtvBiGlv9Zhv4be8pmmfsgS3BBS6MrXSb?=
 =?us-ascii?Q?v+camSfG7kn1q9OpFl7Wuu3iB78UQNDulYPEosI3zDbE7cDUv19xSDnXJwmx?=
 =?us-ascii?Q?9XzPjynBixFt2w6Z9OmLEhXuP8w5n/QySKYGFPqJT5Wspok3+DwxbovnNxNq?=
 =?us-ascii?Q?anttV2v3Zze8RjDBCoYZAxcwnD9kv59JpMFMrG8MDQgAkeXvVj5PmD0c3cN5?=
 =?us-ascii?Q?ftu3tBkNAKjFK1CWgfCHBy3VthGM6P8WGBngfrzToBYj6V3D+u0qQBmYy2wy?=
 =?us-ascii?Q?0mhasUb31ZXP6P0aEiaRlTzyt2xm8aTbgOoqdrfpcIecCxsAejnGm1LRpKf0?=
 =?us-ascii?Q?QcKgYQpusKV5EHP4QaJQ2/E2tMerespvdLI53IEUuqaiaHZLxwELSXmrZtG2?=
 =?us-ascii?Q?B+7/v2sD0wL7OKYDZHJg6nj2Cgdo6YYcLahixurehxG2jL6+j6KS/qyv4vnu?=
 =?us-ascii?Q?EIofiVPYyfbXOrRls7pKdchdIaphOShHigqNhVhfPVA381zB6pf86zjwPJaI?=
 =?us-ascii?Q?vXl6pgLomIEUYU56lGg7rQoVOKt9EsZbkHR0JqZpO7dIXcYDpFaHWFhD0kWl?=
 =?us-ascii?Q?/oNSewD0YRJWh68TLmqkzDV0mtCB2VL/Op4MSsgX8FgOJAnYj3qYlq6gPxl4?=
 =?us-ascii?Q?QgwFRuXZOFkXYGODMzLTdh902RNZ8J41DF42YPTgHqT/Ot3/1S2tr9QFpC0w?=
 =?us-ascii?Q?Zb472rV8ddpOCrpUiws+ruZH4N0eCX2vfOQAJ9zA9v17gnI+zIcevyCeQXC0?=
 =?us-ascii?Q?aNTYQuGYp4xjdLJut0IzjtYrBg+iz7DEZ9wFDMlV/8rwC4k4jNxylzR4VCy1?=
 =?us-ascii?Q?CGQoS2/gf+3UIUe4RSFYnryuUMi2KC9fz2HVWJwMqr54so12Id93MLwZcg0p?=
 =?us-ascii?Q?sTditTacY57goGV3gL1VOeW4+dI2B6IrAaefmiv9ivzme/tTuKQj3yXq4YYW?=
 =?us-ascii?Q?URSfGVOkAoSvn+tHbpc=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(14060799003)(35042699022)(376014)(1800799024)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 14:25:53.7239 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b57dad7a-9c3a-4733-3afe-08de1e098f26
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10669
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

Add support for the GLB_REQ.STATE field introduced in CSF v4.1+, which
replaces the HALT bit to provide finer control over the MCU state. This
change implements basic handling for transitioning the MCU between
ACTIVE and HALT states on Mali-G1 GPUs.

The update introduces new helpers to issue the state change requests,
poll for MCU halt completion, and restore the MCU to an active state
after halting.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v4:
 * Picked up R-b from Steve.
v3:
 * Fixed missed CSF_IFACE_VERSION check with pathor_fw_has_glb_state().
v2:
 * Reduced MCU_HALT_TIMEOUT_US to 1 second.
 * Wrap the CSG_IFACE_VERSION checks for v4.1.0 with
   panthor_fw_has_glb_state().
 * Removed use of undefined panthor_fw_csf_version() MACRO.
---
 drivers/gpu/drm/panthor/panthor_fw.c | 89 +++++++++++++++++++++++-----
 drivers/gpu/drm/panthor/panthor_fw.h |  7 +++
 2 files changed, 80 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index e6c39c70d348..fb1f69ef76fb 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -33,6 +33,7 @@
 #define PROGRESS_TIMEOUT_SCALE_SHIFT		10
 #define IDLE_HYSTERESIS_US			800
 #define PWROFF_HYSTERESIS_US			10000
+#define MCU_HALT_TIMEOUT_US			(1ULL * USEC_PER_SEC)

 /**
  * struct panthor_fw_binary_hdr - Firmware binary header.
@@ -317,6 +318,13 @@ panthor_fw_get_cs_iface(struct panthor_device *ptdev, u32 csg_slot, u32 cs_slot)
 	return &ptdev->fw->iface.streams[csg_slot][cs_slot];
 }

+static bool panthor_fw_has_glb_state(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	return glb_iface->control->version >= CSF_IFACE_VERSION(4, 1, 0);
+}
+
 /**
  * panthor_fw_conv_timeout() - Convert a timeout into a cycle-count
  * @ptdev: Device.
@@ -996,6 +1004,9 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
 					 GLB_IDLE_EN |
 					 GLB_IDLE;

+	if (panthor_fw_has_glb_state(ptdev))
+		glb_iface->input->ack_irq_mask |= GLB_STATE_MASK;
+
 	panthor_fw_update_reqs(glb_iface, req, GLB_IDLE_EN, GLB_IDLE_EN);
 	panthor_fw_toggle_reqs(glb_iface, req, ack,
 			       GLB_CFG_ALLOC_EN |
@@ -1069,6 +1080,54 @@ static void panthor_fw_stop(struct panthor_device *ptdev)
 		drm_err(&ptdev->base, "Failed to stop MCU");
 }

+static bool panthor_fw_mcu_halted(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	bool halted;
+
+	halted = gpu_read(ptdev, MCU_STATUS) == MCU_STATUS_HALT;
+
+	if (panthor_fw_has_glb_state(ptdev))
+		halted &= (GLB_STATE_GET(glb_iface->output->ack) == GLB_STATE_HALT);
+
+	return halted;
+}
+
+static void panthor_fw_halt_mcu(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	if (panthor_fw_has_glb_state(ptdev))
+		panthor_fw_update_reqs(glb_iface, req, GLB_STATE(GLB_STATE_HALT), GLB_STATE_MASK);
+	else
+		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
+
+	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
+}
+
+static bool panthor_fw_wait_mcu_halted(struct panthor_device *ptdev)
+{
+	bool halted = false;
+
+	if (read_poll_timeout_atomic(panthor_fw_mcu_halted, halted, halted, 10,
+				     MCU_HALT_TIMEOUT_US, 0, ptdev)) {
+		drm_warn(&ptdev->base, "Timed out waiting for MCU to halt");
+		return false;
+	}
+
+	return true;
+}
+
+static void panthor_fw_mcu_set_active(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	if (panthor_fw_has_glb_state(ptdev))
+		panthor_fw_update_reqs(glb_iface, req, GLB_STATE(GLB_STATE_ACTIVE), GLB_STATE_MASK);
+	else
+		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
+}
+
 /**
  * panthor_fw_pre_reset() - Call before a reset.
  * @ptdev: Device.
@@ -1085,19 +1144,13 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
 	ptdev->reset.fast = false;

 	if (!on_hang) {
-		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
-		u32 status;
-
-		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
-		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
-		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
-					   status == MCU_STATUS_HALT, 10,
-					   100000)) {
-			ptdev->reset.fast = true;
-		} else {
+		panthor_fw_halt_mcu(ptdev);
+		if (!panthor_fw_wait_mcu_halted(ptdev))
 			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
-		}
+		else
+			ptdev->reset.fast = true;
 	}
+	panthor_fw_stop(ptdev);

 	panthor_job_irq_suspend(&ptdev->fw->irq);
 }
@@ -1125,14 +1178,14 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
 		 */
 		panthor_reload_fw_sections(ptdev, true);
 	} else {
-		/* The FW detects 0 -> 1 transitions. Make sure we reset
-		 * the HALT bit before the FW is rebooted.
+		/*
+		 * If the FW was previously successfully halted in the pre-reset
+		 * operation, we need to transition it to active again before
+		 * the FW is rebooted.
 		 * This is not needed on a slow reset because FW sections are
 		 * re-initialized.
 		 */
-		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
-
-		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
+		panthor_fw_mcu_set_active(ptdev);
 	}

 	ret = panthor_fw_start(ptdev);
@@ -1170,6 +1223,10 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 		if (ptdev->fw->irq.irq)
 			panthor_job_irq_suspend(&ptdev->fw->irq);

+		panthor_fw_halt_mcu(ptdev);
+		if (!panthor_fw_wait_mcu_halted(ptdev))
+			drm_warn(&ptdev->base, "Failed to halt MCU on unplug");
+
 		panthor_fw_stop(ptdev);
 	}

diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index 6598d96c6d2a..a19ed48b2d0b 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -214,6 +214,13 @@ struct panthor_fw_global_input_iface {
 #define GLB_FWCFG_UPDATE			BIT(9)
 #define GLB_IDLE_EN				BIT(10)
 #define GLB_SLEEP				BIT(12)
+#define GLB_STATE_MASK				GENMASK(14, 12)
+#define   GLB_STATE_ACTIVE			0
+#define   GLB_STATE_HALT			1
+#define   GLB_STATE_SLEEP			2
+#define   GLB_STATE_SUSPEND			3
+#define   GLB_STATE(x)				(((x) << 12) & GLB_STATE_MASK)
+#define   GLB_STATE_GET(x)			(((x) & GLB_STATE_MASK) >> 12)
 #define GLB_INACTIVE_COMPUTE			BIT(20)
 #define GLB_INACTIVE_FRAGMENT			BIT(21)
 #define GLB_INACTIVE_TILER			BIT(22)
--
2.49.0

