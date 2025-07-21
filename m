Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D714FB0C230
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3727710E275;
	Mon, 21 Jul 2025 11:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="eqAfsqI/";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eqAfsqI/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1DC10E26E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:08:34 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JUNra2sUMAZQK+EWgyXkpEtL8SMDa31LOQiJN8t2haI0+RdO+eL/igFsVMAyMsyJ+gVMkoJPMjqEay6NhHt/OKc5QQsDAdcV3CgiTSmaxJDtreTpfI+OuTQXdV0z8fsn1gJvFupV/vOoCW/z64Lm5P+jCd1pO/KvD8mEWZTWLNMU8QBKv3JJtlwAbVRVyONBeZSdSoBh7iuEXBF0RjqfP6/e+Xg/LAtLvDCt6xNKuVGGQgmOuEKsAET5bXaqk8TLj5PbaZ8uEAiKKxcvFd+IHTqbviQ+ZDiVXAXL0US0BFvdgosyTOxSL+iWuAapNg79AtC712QoXRkUhttWYLli1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3mLYbmjk2MH0v3Fu0d7rlY9sW0yLOx1AO+9axDDnLg=;
 b=yVi8dq7XXCqmaiVfWZFTMVekaGkDrqJTzJmK9FzQC7p5NMGe6YFjVr5Hp2QjtXwiNziHA9fTXQezdn6oQoEHq/1dr1f/VTE830Nmbl5SOvD3PdkJ4ftt4hLqKjsvpyEN/KV65zKeaKd2m3x+jaR4qUFqR+tdQ2CnVUaoi9HAcc1EyK8HaeHWl3KyeH7JiIwomnpxo0xP47BrXSUnr4c1rJwHp96aAfLyjKfBkr6UbC0SX8p1rjtmpp327hRjHNOEn7KjIKjCqyF5RfqoTiFAFeIis1J48ZrnYhhdYEOzZDlVRCVL7EHzb+PRthsZTu0jPqmGQcgM4s8Gge1CdOnPjQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3mLYbmjk2MH0v3Fu0d7rlY9sW0yLOx1AO+9axDDnLg=;
 b=eqAfsqI/2d7Xe0RhHZ2tUH0mUMZAzfgbGf03lAmiW/dasRUYuDjwoFu+TQHHDmEepQjTqfwS31nuDGM9GtQ5bTrIR/gNE8Tv/cRqV9G4bgFnsFtqkCfnzo+GebmRNoqo46DwPAQ5709jkzLpKL8yWZCPk6kTALgWTZjRzIzjTE4=
Received: from AS4P192CA0014.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::14)
 by GV2PR08MB8752.eurprd08.prod.outlook.com (2603:10a6:150:b6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Mon, 21 Jul
 2025 11:08:26 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:20b:5da:cafe::c) by AS4P192CA0014.outlook.office365.com
 (2603:10a6:20b:5da::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 11:08:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 11:08:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4R+GDdfkcKliQUZy/ntcS6+sPtbfVO1rV5Cju2arb8HzAH1zsRfjTi66L9StrIVUEInN1mv6VRoHHVMGUfpv76n+CJWBWEn5fxtnBPurW7LlmDFp2/adlKHV6yRkhXjCP8AGYHs3qKPBD6hCw/1mmKqnc9kKpRGQlBSoP10o6bFefFBjqKfH3/qbjJR8r6ZOJ2/XuqvHEetKARZc7prPTOg6rYqcPn4/qtpKGXLb5xfEy1wrA+E5cArVu3ERPGk9DETDBVBOyxJPkKxw6yC85ReiEWCGxeIuRMQ1qbaCPfwFEp3kKofsF2RYgWYOTvp9NFmvDe/O8mYy8ZiicmvUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3mLYbmjk2MH0v3Fu0d7rlY9sW0yLOx1AO+9axDDnLg=;
 b=bdzcYgKAK1dHQ1HzbqytaULW5ccCEayw03qL9DuuxHgsFYwMKxXw8YEumsF3cC1NDsZx5PkF1iIpY9k5y/+GhxD35x8mL6owLLaWdKL4pQ6GSQCCT2JYGJHoetRAi5dwesDUV/THYbjKAnjIyJQzdAWKWXYx7vk4j5QF7sRRchfWv7bdQXaW/ZDCMmuySY8Zz0XJhe7DhpSOruG/PwnTNg4Rae/5+wQJzd8Q1RbzaaJTZSknNQCNghOPZGipZM+8WAQE3tSSseM3JoePwilw4OQVWell3Hxua1Pfy4Dc4fFP2y1Pp+wzbW5+bdCx7S0+N2FxfuBdnvlaTmIP/APBPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3mLYbmjk2MH0v3Fu0d7rlY9sW0yLOx1AO+9axDDnLg=;
 b=eqAfsqI/2d7Xe0RhHZ2tUH0mUMZAzfgbGf03lAmiW/dasRUYuDjwoFu+TQHHDmEepQjTqfwS31nuDGM9GtQ5bTrIR/gNE8Tv/cRqV9G4bgFnsFtqkCfnzo+GebmRNoqo46DwPAQ5709jkzLpKL8yWZCPk6kTALgWTZjRzIzjTE4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DU0PR08MB7761.eurprd08.prod.outlook.com
 (2603:10a6:10:3bb::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:07:50 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:07:49 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] drm/panthor: Add support for Mali-G710,
 Mali-G510 and Mali-G310
Date: Mon, 21 Jul 2025 12:07:22 +0100
Message-ID: <20250721110725.1595387-4-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721110725.1595387-1-karunika.choo@arm.com>
References: <20250721110725.1595387-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0267.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::20) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DU0PR08MB7761:EE_|AM1PEPF000252DF:EE_|GV2PR08MB8752:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ddf45ef-bd15-417f-2cdc-08ddc846e912
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Qn8hU+M/s5J8Up1L9TdbmDqilzfFWn2rjYGgaB90fsqQvYPFAjJrEdDDL20S?=
 =?us-ascii?Q?bUd5Ha0MhGP/BstZz9f59CFx6N5p07Yz9BUQHacT8EuNGafnrMLBl/r81kHS?=
 =?us-ascii?Q?XcD84NmxAZjlwWlU5piMe/5O6hH1klAFFm3oewUTUZWF6nRe5XiRtjbr7oo3?=
 =?us-ascii?Q?yDPiuyCUuDbE24ovydwdhWhEnn2EK4IUf/2I++qGbJweDxp9N3wF6DcfDRba?=
 =?us-ascii?Q?C9hbL6E+KzTJKTNx7Ls2bGhwLCnvYTruK6GrKWqmnRkThUtlJuRX0bqeRKmo?=
 =?us-ascii?Q?hAlMC7V1J5KpVIhg+qWzm4yZqokt0Pikl2axWa9ufMRZ/Q77zVgABPc9vM9R?=
 =?us-ascii?Q?4CoXHHI8qFrcZ6tsqaBfMXQbWvSY+FgQAvUFhQFybskAQ11Mq2tywNCDQrPz?=
 =?us-ascii?Q?ZbKQRhpknzYr02HR2YWAda5dAhTQUcMZX7dWVjxb/epmQsa6xgrXvLu6YxNk?=
 =?us-ascii?Q?3uduPcjHXcJ+pB8UFqA4Xmg77cXp7OEPfSIn3uHXRvm9gjAbW4Gg98OP61ce?=
 =?us-ascii?Q?3jT7Z/3VFoGOzn1VbYnYDR/pfVIPDnxjhUpT3ARIePokHMwoVhq6CEHAR4mR?=
 =?us-ascii?Q?VxwC9VJnVkzcps3QcBeAOEwCDdLBjScsrS+qEEW6fQE+4hOHdE9BiWWyAduY?=
 =?us-ascii?Q?C9ZjmSDnvC0T64OmCyN1tdBmqvG+zFClDbpaPYa3itJyRxpyg5LUz7uUluIX?=
 =?us-ascii?Q?4HV48GbuRYHK2wsJwkRZg0Ix+4IHWkxbQbnGJd0DO0oOeLoI4cGIWrIUqO0S?=
 =?us-ascii?Q?07dqieytfn/wAJYxRS2rHemUxOY0ULTrzM5kVWY/pkt+GUYKzI3bJJYJFtiD?=
 =?us-ascii?Q?KBMl+8Dbw1jufDbqzwM9LnjyVQCOlneOs6sfc2OWHe+WAjJO5No7tKyDyrEn?=
 =?us-ascii?Q?IQe38KYOR/kwYR2lUClYWk1OKG6DqkZbADOOg/EY1yilKmAm5Jzp80lkuX4X?=
 =?us-ascii?Q?khvCioBodL4NgkKHHfuz28Wn1uo8ONqwiC8wtRH1Q+GjEnvAMNdN0bU7MxJP?=
 =?us-ascii?Q?03a/G4B4aSUve3LAHmK2Slj2KBpYPHOENpGIf529GJ5ONz94GhkWlU8ydoso?=
 =?us-ascii?Q?6269ujJJsiZia9SsRryO2S/1BMGv5/lc4vjX/ejxec1IRtQxxO05ecabqTTz?=
 =?us-ascii?Q?QcO0r3cFrIeWRyBa1AFmT8NpBaPQG6jeufYLintdmJhM/Yn8R3/vRdL05rnB?=
 =?us-ascii?Q?iliVYPMmDWjmubxcq3g7Vc2UTjLQ+xJuZhZGGfBGRyJZ0nszUn4zMu8Bm4wo?=
 =?us-ascii?Q?qn9KPuKuZ+JKZ99UDbjuiEgIKFF7OWxidYM0uw16eMeaP+f9rG1kcj/FmIN8?=
 =?us-ascii?Q?8iydF8vAiuISvap7ikUwXv0wvmZjTgsVdgtV1M78MFim2G8RilESLE31q5sX?=
 =?us-ascii?Q?Hjj0GIiuvxYklJA4NnneiMEEwCZwQLaIMgf5wccQaBkvVZWcvb7DZY+HlsIx?=
 =?us-ascii?Q?di3Vu70xI7Q=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7761
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9d971e49-fb40-4b4b-c736-08ddc846d4a2
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|14060799003|36860700013|35042699022|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AW2auKt1t+yCfjc7iwj8PhThOasGZrTNpnGfb7SBQi50IcMXbay1yRTUBX5/?=
 =?us-ascii?Q?jLAg/KOXLbyfIvt2qen2UmbdYWlrUKT0Mmuq9zRUjYLigDNVcYTf6UtZhpkm?=
 =?us-ascii?Q?T0yj2y6qDpbX/d59JOfa6pE+adf3Uy19CCMOu2nh5CMvbApJViZIGFqBh5ps?=
 =?us-ascii?Q?FGD8jOJheIPl/SHgrDjhBeI5svicZnKf+DIrQ+o2zPZeEt052h8YVqoAWjsM?=
 =?us-ascii?Q?2uHIswiPE612j9KCBsH84yuIrKoGdAfY5wgDWqRsMDdmn1hEQJW6inHuUXL/?=
 =?us-ascii?Q?ivMX+n6St+BDc0TzQGfyNpKgykA9Fq5bPeY1JQCbj9ayKwY7JEr5YYORJZlG?=
 =?us-ascii?Q?umn6G1XQ2A3jcpxyOgYgnzl7vTxEOULVxyl4M1WYARwMY9pUeAnUT832iHGv?=
 =?us-ascii?Q?JAsNro2QmMNO/C1sY5XLeqTkncMDqPGNAOB5BUtfv//w7zGCgiGUYbOPB87t?=
 =?us-ascii?Q?taPG0P8STh4YXGWGdnntfdhG60YwF7OCBmZNK2BsDwiZUdA/pIURw1B1H92H?=
 =?us-ascii?Q?OcT+6GCj6AVaxcNby96yVWzy2qh4vn0ezsgljfdLBnIBcEXEKFJwQ+CDU/1U?=
 =?us-ascii?Q?oEXnlEHdJSmJFYgnQGNpVWHYw/BlOsp+OGk4XX7midrFvLGY6xDE+30qbLmN?=
 =?us-ascii?Q?qepkHN0gpiXTVRKPAUWEvs41tPufi/yXotGOaS6b/g/ds98t4958oVGXtxH6?=
 =?us-ascii?Q?1X0lozW5km1DBwTMAHvMNdvG4NeHKS18g5rEVk6GCczTPiszlr/L6vqbdYCA?=
 =?us-ascii?Q?a0TKZuW39w2y/szMRn5G+wlIJi8wJiFtnMiTq5HuIP5vhUSp4YPYYbE1skfY?=
 =?us-ascii?Q?Kay9kCQboUgO+5F/6sOIZNK0OPMegqHGiZtQJTmYSjrfpSHiRji0Zg9WSz5Q?=
 =?us-ascii?Q?MB7vgYv5zIogqBlvDVhfj/Ss+XMIe2e6cmL+u38utbEL+DVNdCacSwzoJ+Tb?=
 =?us-ascii?Q?RiWRYyJ5ahqrBrPYdlAQeMoS4TvPZ6xuRUJlYKskTHx3sfRrCG0RSluYQxv5?=
 =?us-ascii?Q?gmffeenDbsCtu8a+oT/QxWXI9+TPs1w0tztkqxtB5H7LX0P5ZiYmnUTqTXdN?=
 =?us-ascii?Q?dxmZMB3FNDGjVhxEHL4+jIbDFB9l7bazmbSG67615FEn1JIVJVSNBbLMX6vF?=
 =?us-ascii?Q?umiejOfr9vtdbLYkS512D37PAMaQd5D2cNrjLDoW6D6E1nGXA3DWqK+7uwFW?=
 =?us-ascii?Q?OTXFCNTmmRp+N51Ce2ohof/qjG+ZYxi17Yt8m/vM6UU63Ny3mugD+5e4lsKS?=
 =?us-ascii?Q?vANL+2L5ysrWWMCTiyVMqsTkPyBVShCVYiAvkE9e1m7i9ajb0kycVPzYzAQ9?=
 =?us-ascii?Q?40PPfu9T2ON7L/0q3HKxsjmS7QxzqyD+9cw1xlUjBApzqZY6Wa8QxwT/8woa?=
 =?us-ascii?Q?wgdlbZVOJ5Rob26LGNglYUqXL49u2UMeXnoarp5N8jdyLvIrmV9QmxiW2OfH?=
 =?us-ascii?Q?5am9K3LpT/Z4jGexr4b4C1y6xQnQnGV8VuXNkieK06X9hw3I79u78SS+UMAM?=
 =?us-ascii?Q?P4XGHqBLrBjaKadyb+XQyf2O7VMA0fGdRq9p?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(14060799003)(36860700013)(35042699022)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:08:23.9079 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ddf45ef-bd15-417f-2cdc-08ddc846e912
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8752
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

This patch adds GPU model name and FW binary support for Mali-G710,
Mali-G510, and Mali-G310.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 2 ++
 drivers/gpu/drm/panthor/panthor_hw.c | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 36f1034839c2..b7b454d16f12 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1402,3 +1402,5 @@ int panthor_fw_init(struct panthor_device *ptdev)
 }
 
 MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index f39010c0ca86..7f138974d43b 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -15,8 +15,14 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 						GPU_PROD_MAJOR(gpu_id));
 
 	switch (product_id) {
+	case GPU_PROD_ID_MAKE(10, 2):
+		return "Mali-G710";
 	case GPU_PROD_ID_MAKE(10, 7):
 		return "Mali-G610";
+	case GPU_PROD_ID_MAKE(10, 3):
+		return "Mali-G510";
+	case GPU_PROD_ID_MAKE(10, 4):
+		return "Mali-G310";
 	}
 
 	return "(Unknown Mali GPU)";
-- 
2.49.0

