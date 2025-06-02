Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC57CACB0B2
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0F910E52F;
	Mon,  2 Jun 2025 14:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="rpj6H1g0";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rpj6H1g0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013061.outbound.protection.outlook.com
 [40.107.162.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FC710E52F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:09:16 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JPjiDf1VEleEO+6Sb2zSz28HWRwyQmpkGwC3o1ZWN524g+ETs4F/dHBdjqZ2YVbNhqDQxyLweEOEQ4cyPg1OsCPesETkC0rGQBtFw0I0J1L+aSCQCsU+jMg01tbEEqJe0DAeHM2Pl1IWqTqQkuiO2q97YeWww25bD0q1h3I4CKdXks8ZP6sO91jJ1RAti6E/eTefiYnDfPE9CuK3yu7HLNn3X29gncfCVXHIQs8CV6uDh5WGI4wSU3lXAx0OdbMZsBp7N1KthGOwmGMiszx1DlXzbCWl+2I+9Al+9JOAsQyHU0Hjwh3tB0Suba22Eq51yY6MjrthXLuVz2UoFrWbTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPyN0IB1fwWZBDAjZTiK5ynQ4xSdQsNhwyrSUci/32M=;
 b=sCzm58o22AQnOhMOh9gIQ7xJjYr13YlDQgG9b3h9RO8Kwk07tRblP+zWQTAatVY2IVo2IncNtMvblG6OzTJmcb7idRnmatiuf5xvYv/F48lyrIsHwcjttQ5EC5Zt3BmCXCqqGGEoiFwrdY5f+U8jhaCIg42HuUdeEt/CseGGt6CKQa+rpPXhq4vXp6npEfu6PfUQjUOiBO71y4ZiM93Y1Yx+L7I2gEBwsVQzKT5ZsMSrKwJtRnkrGXIsnECc1RvQWJp4Y4jrDV/Lbg9rw2pqQdCGhNKxj46uIEgFFrM+JYLhQy2TDrzbk8R14pLMZQf8lZJrLpR2c46i180YRW88xw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPyN0IB1fwWZBDAjZTiK5ynQ4xSdQsNhwyrSUci/32M=;
 b=rpj6H1g0PWKpYqwUsrTzOoCRAt33+H92oKoTinmHricYzDeKQTW+i83Y7flcZ3FGKUQVkMt3ScAF5/pnTLylkyx97jXhNAh/knV/1Y5Pwo/u0/JJ8FdnxJYd9MglnTGW2HuTWUUx+Mud87hre0aLtZZ7u9g7Yof6zVZgLfWIvS8=
Received: from FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:b5::17)
 by DB9PR08MB7628.eurprd08.prod.outlook.com (2603:10a6:10:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 2 Jun
 2025 14:09:10 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:d10:b5:cafe::7f) by FR0P281CA0260.outlook.office365.com
 (2603:10a6:d10:b5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.32 via Frontend Transport; Mon,
 2 Jun 2025 14:09:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 14:09:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTiLNupIsHY49XFXhwHQXtXcEaAnJUmqTYl03MFe2k0LC1thP5nPz/n4VrZdurWDOHYmymLhvw7pK28WDxQIm3dTBF1hfTREqyP8n16WSLO2b97l18F3HHF2iCHBKnd3Newo16FpAdjUw5OYTI8aX8YNxrwKYuhJdJ13R+zqmGZBv4HXzGks3RCyjGZn3zNNxbPFn9N6IlD4c18AorjfciJbmvfmjsQMrq7G2NtPNkNxGUA9J/72z22AxfY55ZyPYsH8ZNBmeYm1yzOAa79Y1GOOQBD8W+4iK9b1kk3RIF8gY+7bHeBF/8wXPnvbK1vboGcHWFw8NYtvP2ACeIMk3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPyN0IB1fwWZBDAjZTiK5ynQ4xSdQsNhwyrSUci/32M=;
 b=XinPbY8y5RqQAp2WhSB17KnciDpgNMSNM7RNp7gcAF9E3mraLQ/4RyBfuLJRKj2CQjFQy0BY9b9Fi2pZki4vwN4S7oPgGaEeDD9wObZu8g+1UTfvTDPQuPKxxebZLz/fXsVh4XPLXFmvpl7DitPiH4sRNR7oa0F/zxssIcgX9wvEb3Oec692HjPchRndFi0SSjC42BwYrvxwFFdINhEEfoqDTMHgUSTR5iixVGLqx/rXg5ISWZe7dEBjcsdrqPrDX5ihhJ+ajlzVSmmEqvaPRLtkfT7yS+h6+9N1TfqeFZriEA4x4T9udTSTd0Gz6fgSoMQ82i62JJIl3sMq4CbccA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPyN0IB1fwWZBDAjZTiK5ynQ4xSdQsNhwyrSUci/32M=;
 b=rpj6H1g0PWKpYqwUsrTzOoCRAt33+H92oKoTinmHricYzDeKQTW+i83Y7flcZ3FGKUQVkMt3ScAF5/pnTLylkyx97jXhNAh/knV/1Y5Pwo/u0/JJ8FdnxJYd9MglnTGW2HuTWUUx+Mud87hre0aLtZZ7u9g7Yof6zVZgLfWIvS8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB9018.eurprd08.prod.outlook.com
 (2603:10a6:20b:5b0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 14:08:23 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 14:08:23 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/7] drm/panthor: Add GPU specific initialization framework
Date: Mon,  2 Jun 2025 15:08:05 +0100
Message-ID: <20250602140814.2559538-2-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602140814.2559538-1-karunika.choo@arm.com>
References: <20250602140814.2559538-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0178.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::9) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB9018:EE_|AM4PEPF00027A65:EE_|DB9PR08MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: d7d0a578-1eb6-4a9d-e279-08dda1df0ac7
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?zzBCyizOhSUx2CLRSuWa3UuMCbjhcg3HnEkXDKu9o03Xdp39clyAHfMO8xo2?=
 =?us-ascii?Q?PieMn6e2DXfqV0/VYcUkv3YVLyvV+Zy4EJej6dQQYeWWkbMmmhbdZoE7Zh6A?=
 =?us-ascii?Q?JXeonuplIgXRC00VQ/HFMot0XAwoYZwJeSoLXkVQFONMSAthFlbFxPU7phF4?=
 =?us-ascii?Q?g/eDcIs6vZivhtJwlj/16cbJ7JThf7eQ0oRnKoeuOYnzEqdDjs+vw8cNfWb7?=
 =?us-ascii?Q?QdLcm9lZyZG31NV48yVaeRIWI1/LgLdBW6dXevGsGPnBwdtqz1v1OwBW8rLy?=
 =?us-ascii?Q?r84C0jAQ24REIPjtVlOUF9/egS0MZGOB+OAAtIPX+D9BNhyI2c2P6PTraEYY?=
 =?us-ascii?Q?Z7AgfV6p7TqTSVma4zCJwrEAeY4Ah+wfWJ/vSjVQ29SmqDNpRdlZByWvkyKI?=
 =?us-ascii?Q?NnsgYrlki0d2uJTyV9Dq3qX+72A5plq7Pd53zipAXbDn1lb6iUfm3SD8w1Ng?=
 =?us-ascii?Q?4Y3lemzVEUu0BOPDme7lzh9qI2LiM7LbLVB7iSjcKOrUBbWtdBPUBcy8Z8iM?=
 =?us-ascii?Q?tMBTVf6dnXX4waNZs4XK1l2qt9oYU7Zj9UUkMKQWpG+ZNWTnDk11M980xOs7?=
 =?us-ascii?Q?XjrU4jYXdqIHJdn4ETgxYNCkuYt0T3xgZnF/PGOM56YSJfnH72J18k9XcUie?=
 =?us-ascii?Q?GaZlq2ODOM2wYEWRU+O3uvKlqM2L/aQVQey2jfhYymOteDU1bc4Z+EaasMU9?=
 =?us-ascii?Q?E1y7/uX9muROvXtSTF730MEmOyCta8ylO5Ra163g0YHj+4dPJRZMdbBA/X00?=
 =?us-ascii?Q?ERAO9vndlUrL/NBrQZyIwRkUEVSszsD0ZcmqShBbzVGH0hFMiHrSn07Fz+XV?=
 =?us-ascii?Q?7D1438BA7xzZ++vDFA2dOmTAn4RpRvS926z+DznkrWQosK3sRCx+lxiZtHyK?=
 =?us-ascii?Q?v4uwg5W874tqr7MRs8caz32uW1pX6e6obvesQoKUAaHhmpo7kTXVmc94nT42?=
 =?us-ascii?Q?quZOrLOl1e3vclzJFMlLZi73Y3PVjCvzGkptrDLNqHk4InTcKhzvr3YPEEJ3?=
 =?us-ascii?Q?B/lSr3WMMPS0ZuEPwzyHF2FuiSLCvoRTcrcas13KAu/xIRbLwzQdnrNZU51M?=
 =?us-ascii?Q?X2lV01BaKjnhCIAqcpGNT60a26Psm4PuoFzrXHi4bDAFXpoxOGLcYLm872Xf?=
 =?us-ascii?Q?TfLWy9u5ROYMJr4g7NJnVoqSbHNvK4Sw9lUjWCaOMUWgr1xkyq2kIlMeYzkK?=
 =?us-ascii?Q?ZZZdmwmC37H2+J1os/2+B/qw3Ac8xqseImu8TIzhrOWiymh7oT24ZZvU38rX?=
 =?us-ascii?Q?KDVWMzOJgVFnQQX8P05skylV1z0R5A4qxFWUG66/gw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9018
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4e23e0e4-2850-40ab-5418-08dda1deefc6
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|14060799003|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JWZi1QbEmIZNKiP3bzx/0TNEaku1nmvy2XacSQMyIE9QWbryAsWxKxJglM31?=
 =?us-ascii?Q?y2HhYyphwQqo7AjA24tRe0FSdzE/RnA/c06VI47jVTXLCrTQHWg3MwZgPxwJ?=
 =?us-ascii?Q?Qy2j/5+FE1p4eJ9X19cnsG+Um9U4Wh4kAT736GY9JTQhX9qCiRDu3eBFGms1?=
 =?us-ascii?Q?l1WZwq3hS5Z3PIg7ZMMVDOh5WHyliuz7Mt06WsNx5kBeTVEoKGromYsSYXpp?=
 =?us-ascii?Q?DS4GPJXcSi+Vb2aMKAxkY4Vr8AO8LakOtuvER9H9jl6iBmYuS3YwrLTa9JVn?=
 =?us-ascii?Q?Fbia9yH1X8xaH5cZuElISlP7OfyA4ZTTL63hmE7DEi5IjQ7YOyWUO2J2zqmy?=
 =?us-ascii?Q?ILy1efq8TAtuf6fREi57XY5PVcKj/a6yYVSK0vA4IZkF6zOjnOL0WB5hTiQX?=
 =?us-ascii?Q?6WYtXitGfHUgCnpPIv5S1AcXppyuyvX+zN1CmO1w72CajjLwLFeF+XX1YHFt?=
 =?us-ascii?Q?vPGR06Jla/UpgElGS7tqaC5OlgamJbpyyeVCk16n8EVEN7l5gGJziNBAj0IZ?=
 =?us-ascii?Q?HLvBSsBRUvV9nBZ+VlvNthqBKB5zeBnSpC7Q4VoD1HUarECXBHSMDxvAid9J?=
 =?us-ascii?Q?RscysEmVqkTnq+nN4siZOqS8YHfSn8ZpPCKtSHf1QaCt0/4YusvBK3EUMQVC?=
 =?us-ascii?Q?/q8P+IjDc/rkUGtNMJsmpCvLV348ypXtBB6llktYCmt9VznIwJaEJQl6VPqv?=
 =?us-ascii?Q?V8m3UUnHHoOdu1VvZrT2oymqsqgGW0dz/ZbL+P4O87ZuNLJWy65p+GOuBh7S?=
 =?us-ascii?Q?O3lk0CfAkF/yYerbuuYdH0T8nvvkvMLQAPT60w224rk76nxGVT7Fn1b/PSJw?=
 =?us-ascii?Q?QCBliwvkjx87Pj7/3iJAap7lz85mvuxxtBmG0KqcehE+mdDHdBwd1vSc7MU8?=
 =?us-ascii?Q?Sd/5UfFhdgEJ4maE1BlYf7ZzG+tjq+86r57nCEYjAIYKbSyq7OBb6wGczbHk?=
 =?us-ascii?Q?0zw8a1o2R7+nMrWC9OV+gK0BWbLtwwRpr5l2Sth+zPqxRPULKXjcDswDZS5K?=
 =?us-ascii?Q?6AQi+FXOzVvzJjARpgj08mb1Is9Y5+mndb5K0v7MDrmtoPTdlwYioBhY3U8d?=
 =?us-ascii?Q?G9HCILB547F++dQBByi8+P67mCYvyRT+BO6Wtuhnu0wsrUrp2cS1sPZ+vr6l?=
 =?us-ascii?Q?q2SIP0GzZ3TUPVTuQU45sU2/xdq1UdmmDOfbf9wN/s7d7bfXc6W5tfQYqcy4?=
 =?us-ascii?Q?iKviJrcWcsEWf1Q1nOfSI/E2yl+7klNhMdNqasNBuL5zLjoJaKUgxotgBa7R?=
 =?us-ascii?Q?6D/9TrQCV3Ob2wqr/wMs3LJdP28PgNcgJSre6J9nmLM4e0l7K1MC3Gnx2gi/?=
 =?us-ascii?Q?v1SLyvnk5leJHqdPf9LtqONepa19jaJWvzninbX7vzg5heTJO34RUsunAgNI?=
 =?us-ascii?Q?Cqrne/RgyqEVvHLXmQX4gn1tP4JQ598eG92MVHcwKt07kfCuqMsVNg5KKtYb?=
 =?us-ascii?Q?6Ncvsom5XaSyVxSqC8CUWxndytqksZIIr0jL0mlE1/gZejcuTdw+SD482s34?=
 =?us-ascii?Q?udxvKZw/gXKMEoDnqiUHYhGcx3t1qYSI38au?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(14060799003)(82310400026)(1800799024)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:09:08.6202 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d0a578-1eb6-4a9d-e279-08dda1df0ac7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7628
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

This patch provides an initialization framework for multiple Mali GPUs
by introducing a GPU support look-up table. Each entry contains, at
minimum, the architecture major version of the GPU, and may optionally
provide feature flags and register offset overrides.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/Makefile         |  1 +
 drivers/gpu/drm/panthor/panthor_device.c |  5 ++
 drivers/gpu/drm/panthor/panthor_device.h |  4 ++
 drivers/gpu/drm/panthor/panthor_hw.c     | 65 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     | 60 ++++++++++++++++++++++
 5 files changed, 135 insertions(+)
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
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 340a5ef09477..5b617ab781a5 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -26,6 +26,7 @@ struct panthor_device;
 struct panthor_gpu;
 struct panthor_group_pool;
 struct panthor_heap_pool;
+struct panthor_hw;
 struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
@@ -122,6 +123,9 @@ struct panthor_device {
 	/** @csif_info: Command stream interface information. */
 	struct drm_panthor_csif_info csif_info;
 
+	/** @hw: GPU specific data. */
+	struct panthor_hw *hw;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;
 
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
new file mode 100644
index 000000000000..4dbe23df0c4c
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#include "panthor_device.h"
+#include "panthor_hw.h"
+#include "panthor_regs.h"
+
+static struct panthor_hw panthor_hw_devices[] = {
+	{
+		.arch_major = 10,
+	},
+};
+
+static int init_gpu_id(struct panthor_device *ptdev)
+{
+	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
+
+	if (!ptdev->gpu_info.gpu_id) {
+		drm_err(&ptdev->base, "Invalid GPU ID (0x0)");
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
+int panthor_hw_init(struct panthor_device *ptdev)
+{
+	struct panthor_hw *hdev = NULL;
+	u32 arch_major = 0;
+	int i, ret;
+
+	ret = init_gpu_id(ptdev);
+	if (ret)
+		return ret;
+
+	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
+
+	if (!arch_major) {
+		drm_err(&ptdev->base, "Invalid arch_major (0x0)");
+		return -ENXIO;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(panthor_hw_devices); i++) {
+		if (arch_major == panthor_hw_devices[i].arch_major) {
+			hdev = &panthor_hw_devices[i];
+			break;
+		}
+	}
+
+	if (!hdev) {
+		drm_err(&ptdev->base, "Unsupported GPU (arch_major 0x%x)",
+			arch_major);
+		return -ENODEV;
+	}
+
+	ptdev->hw = hdev;
+
+	return 0;
+}
+
+bool panthor_hw_supports(struct panthor_device *ptdev,
+			 enum panthor_hw_feature feature)
+{
+	return test_bit(feature, ptdev->hw->features);
+}
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
new file mode 100644
index 000000000000..1a3cbc5589fd
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#ifndef __PANTHOR_HW_H__
+#define __PANTHOR_HW_H__
+
+#include <linux/types.h>
+#include <linux/bitmap.h>
+
+struct panthor_device;
+
+/**
+ * enum panthor_hw_feature - Bit position of each HW feature
+ *
+ * Used to define GPU specific features based on the GPU architecture.
+ * New feature flags will be added with support for newer GPU architectures.
+ */
+enum panthor_hw_feature {
+	/** @PANTHOR_HW_FEATURES_END: Must be last. */
+	PANTHOR_HW_FEATURES_END
+};
+
+/**
+ * struct panthor_hw_regmap - Register offsets for specific register blocks
+ */
+struct panthor_hw_regmap {
+
+};
+
+/**
+ * struct panthor_hw_ops - HW operations that are specific to a GPU
+ */
+struct panthor_hw_ops {
+
+};
+
+/**
+ * struct panthor_hw - GPU specific register mapping and functions
+ */
+struct panthor_hw {
+	/** @arch_major: Architecture major to match against */
+	u32 arch_major;
+
+	/** @features: Bitmap containing panthor_hw_feature */
+	DECLARE_BITMAP(features, PANTHOR_HW_FEATURES_END);
+
+	/** @map: Panthor regmap */
+	struct panthor_hw_regmap map;
+
+	/** @ops: Panthor HW specific operations */
+	struct panthor_hw_ops ops;
+};
+
+int panthor_hw_init(struct panthor_device *ptdev);
+
+bool panthor_hw_supports(struct panthor_device *ptdev,
+			 enum panthor_hw_feature feature);
+
+#endif /* __PANTHOR_HW_H__ */
+
-- 
2.49.0

