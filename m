Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD376BF9F8B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 06:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CFA10E0A0;
	Wed, 22 Oct 2025 04:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="jyTFotMw";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jyTFotMw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013017.outbound.protection.outlook.com
 [40.107.162.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE7710E0A0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 04:45:48 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VvqpDfojTIA9MfX53iK/lPchKAbyH1CFuNlxBclUf6N917G5mpXY1TJn3CsH8hrnuTGpXYAC30UejHBPAe/N47pnt7yvW8XXMW6jXGofZIU4gkoSJu3rie8LwoKXCcJJwMqKSTT4X0GoTh2H6bTekP0pYPchlVgGXKtsWOg0Irn5HDRY6FqGdpBBBcThMZVEbalSI36zzTbrGy4g4p9h/g6w8Z3fvIsiAirqUFyFUCwzWrYBgjKai2uq2B4JqtGsSlmoJVNzbO3zfS/9dvrz3lRmUmFN7rZyCcBUE7211c0mLp4JBj7aZcfJQq8H3Mxk6RjCQOEnKi5JzoZtjGzH6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeTprODjudIqcqrwBp1f9D2OlVKNpMaAOJJ4IqggE7k=;
 b=acxQzf3FxJhGIZgVXMXr2XV0x1YJFkTU9+XFwZdbxEJH+FxCEV3MuLrt/GPjt4ktzM9upBxTiHCsbtGqsSAZrlKZ/RPmfbTaKD0VdMTJSw6mD4s5zJSv/s04fAHX2XfmuJ8hIceAu5d/y1eFKEqtY1cfWbZdv2JmfdFUy+rclQxHiZHK1q//5NHtR483HaVUMA5bhylI2PaqiSLdJ93G2WMoxUAAK4P1jxI1L+MoDo9+I1HpXHfX3nl/0WBYXHIN//JSe7OuY3QLw76/9vDFbrJyQbpGgyl9sOpFzPaXebeUyJzWdIteJDxc9IXHC1egwfTN6Q/Am3gpKACkMmsRiQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeTprODjudIqcqrwBp1f9D2OlVKNpMaAOJJ4IqggE7k=;
 b=jyTFotMwD3j8hzRdk5uLX5b6kqYyWJRX7BqQjKnw+YmdMZSvaq44FBdjAGfXi7tqO7TwnjdTvsKlxCma0dsmyNtebljYM/Pajof3r5NMvHz3uZG5eFiA1YspjHZj4frHWr0GJh3mhpNlyj9LjjHhH84wWEh0KXzAbk1IfhmbpvI=
Received: from DU2P250CA0008.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::13)
 by PA6PR08MB10596.eurprd08.prod.outlook.com (2603:10a6:102:3d2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 04:45:43 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:231:cafe::9b) by DU2P250CA0008.outlook.office365.com
 (2603:10a6:10:231::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Wed,
 22 Oct 2025 04:45:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Wed, 22 Oct 2025 04:45:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBz4YRRgEyRW5Iqok0Nhi9266TxxWyWD/JSZfeXi4BZbTPq/ZFAtlbzc/XMi56G30yKXVVC0slu161+rFnrLg/H4u7F4YEG0YT+UUsY9pKcIB8LHMbduii3z+mITr7RiPPDLOKytHimiIOTAIWFjy/2IhjtOowA1Y6ytn87jcqcaPf3W2t04ZesE3fbj53AfPv8c5f63ZxRh5JYmcdY2wYNZfiu57Iz/iam1FBZeVqSJtazGV28I+ZJV6L+49hABNr90OlREx1RNxOhIpgk4uE0lIIuoIP9w89hOxchFq1DrNag4XUVXOYTbeCUbLKMSMKMDqvGxiu4TrOLd+aK9wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeTprODjudIqcqrwBp1f9D2OlVKNpMaAOJJ4IqggE7k=;
 b=mUpxUzhV6n9q9EQx98CphIF0fESOvvIMXReICVUFJcJ7unKgGWlhjgMh5QAnG3GZVLTkZ/mEt1X6DV+50DtVGpkyvOHv0ShGmoa8ewH2GwFh0tHsfeWpgiTDOcdOfV6xcBZo0eY7IRSZUxnhoQcv0iePXkGA6hj9yZInf1WJJgNkKqLNDLLSbey4Cdt3/xqKOO4xNCFiETw8Ej7WYdLO4RjeOxR1nvKAg/YSPJZnnypgm7xwbz7zgXrryhmEWq8wSYDj91xKpnSPkNpcrKyxQvqfj/FOOIpPvXuSzCd/0M9tq8gn6k3FYB6sTaCeeo0oMKcpRrMpSqjnM06/8ysN1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeTprODjudIqcqrwBp1f9D2OlVKNpMaAOJJ4IqggE7k=;
 b=jyTFotMwD3j8hzRdk5uLX5b6kqYyWJRX7BqQjKnw+YmdMZSvaq44FBdjAGfXi7tqO7TwnjdTvsKlxCma0dsmyNtebljYM/Pajof3r5NMvHz3uZG5eFiA1YspjHZj4frHWr0GJh3mhpNlyj9LjjHhH84wWEh0KXzAbk1IfhmbpvI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by DB8PR08MB5339.eurprd08.prod.outlook.com (2603:10a6:10:114::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 04:45:08 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 04:45:08 +0000
Message-ID: <ba782636-2517-4087-9b23-005ec6ca9a47@arm.com>
Date: Wed, 22 Oct 2025 05:45:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Support partial unmaps of huge pages
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251019032108.3498086-1-adrian.larumbe@collabora.com>
 <bef0484d-8e17-477a-b4a2-f90d3204ff88@arm.com>
 <owzghwojhouk2gxfvpmxli3czrao6hpoopcxududrzsoa7gkos@zkoymtlivm7j>
Content-Language: en-US
From: Akash Goel <akash.goel@arm.com>
In-Reply-To: <owzghwojhouk2gxfvpmxli3czrao6hpoopcxududrzsoa7gkos@zkoymtlivm7j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::19) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|DB8PR08MB5339:EE_|DB5PEPF00014B88:EE_|PA6PR08MB10596:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ec266f-e33b-4355-0572-08de1125daf2
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?NCtxY1ZQd0x0bkZYTHNiaExtR2IxNzhFd3VmZkpHK2pEVEZJUFRnb1RnSW8z?=
 =?utf-8?B?ZzdTa2huYVVUN2NXMjhVVUw4MGFrWTZIaTBQUkJFeXdPWHh0ZXd6ZFU3Y1Qr?=
 =?utf-8?B?Sk9JRG55cCtPeTFMUDI4OG5EOXVQblh3VXdlbUluQkZuT3lWZk5wT3dXdkJO?=
 =?utf-8?B?cFdvUFEwSWxlekNKcTFSYiszMDFQTTUzcFJEbHdFaHpHSExDb0xXNCtzMFk5?=
 =?utf-8?B?cUJ3a0MwSkxQcFlFT3BoVnRzYlpqd3hnR2VjdGNLM0V3NVR4THZIWjVDZVBs?=
 =?utf-8?B?dU84SitlaDZJR2ZsNVJRWG5MMVcyUDlIdlREc3Urd3JONDNabVVWQnpxc0I5?=
 =?utf-8?B?Sll6K1pBaFArOWhYckZHVEVMcHQxa0VFSTEzdG9CMExvdklubExZa3BBUVUy?=
 =?utf-8?B?Y1Irbkx0UDN3d3dKWUJ2Lzh6bWV3cE5SSjRmMzdvQk5xc0JVRWZ3Q1ZNeERr?=
 =?utf-8?B?VnRCUC83Z2cyUTFKRFBMYlREZ203WjRWdXlibDVyVlpncG1ObDMvWHd0SWpq?=
 =?utf-8?B?a1BOeGpyQWZFRWlJTW9ybmg0SnowLzkwVG44amdNR3F3UFUwaFNKMlpkT0tr?=
 =?utf-8?B?cW5QZUlZNXBaWEZJOXZsdHpzRHRZajcrWWowa2J5Nmg1UDl3cytKcEhsdHJD?=
 =?utf-8?B?cG92ZlpmTU5WcUVkSHFhck4zK3h5TElCN1h0akp4LzZwcnVJWFBuMkxKNlMz?=
 =?utf-8?B?djFuMDE5QVhrdEVTb1ZrRGJrcGloS0NiT1V1WWliRjdQa3ZPRXF0Z1hYQ3Ny?=
 =?utf-8?B?TWk1ajRzMWg5S0FwazFTaCtNV2FLYjU3bkhaOEdKTlJVWlFVV0NIelpRWCs0?=
 =?utf-8?B?aW5VSUxWSWE4T1ZMbmNrNjBxd3J1andvRlV0VkVZM2cxOFVtQ2RNa1UxeG1j?=
 =?utf-8?B?V1g0M0d3Z3FnT0k1T1hQUW5BVU1EMWJCL1VNVm5ZLzJuSFVacHArbEVpYnJL?=
 =?utf-8?B?eTNsWEt4NVd0bmtZT3Rhb2Z4TXY1QlV1dmVvd2VjY1ZFYVVCd2YxdHpvWlhG?=
 =?utf-8?B?K2RVL3NyU1BIMTN4bXhEYnNycHNtdVFnKzBSbXJJQ281dzBoaTJuWFlXU3ky?=
 =?utf-8?B?bnNkRXRXWnVlV2lQTEFETVJsSmdhOTZrZng0YVBpRXdkdkRzcGdRSGo1Q0R1?=
 =?utf-8?B?ZmNScUtRbEdsZ1VHVHJRYVY2RFFuUGlWbi9qNFRPcURSQzJUVUF1cm03RFZz?=
 =?utf-8?B?dEpXenJ6b3lqWjNPalViS3d6eStRTVY0cGNackdwUnRvd2QvemhTVUpEcnZX?=
 =?utf-8?B?Wm9zWVpEdktCa1dLaDY5TjBKam1WTG5iR0JHa244VDJDMkplVjViZ2NZMGox?=
 =?utf-8?B?KzB2SWZsVk1lcnVId3N5ZldpeURLTk5talBDRnVPRTVNbjBBUXA2ditKeEdj?=
 =?utf-8?B?dU5BckI1aEo0R04xUFJXVDhkVWdjUUczNzJCLzE0VDJ5cklkNldobVlSMG5a?=
 =?utf-8?B?VXBGQXlVbGd2dXhHWTRleFl4NUhsdjZqaGJ2eWJrS2lpRkxURjZJM2s2cE1M?=
 =?utf-8?B?M0dxUy85alc5Q3lxMmFLUWhVL1hFQVIvcUdUTEpwVEtNRFI1MjVpTnpxcC9n?=
 =?utf-8?B?S0lDNURsREFDaW5Ka3d0aVo4UWdnblQxdzQrS1RaL3A2UG1aajVBQk52dHVI?=
 =?utf-8?B?bFNFUGNXNHhOSDAzcGprZGQ3cGFFZHlRNitBc1NwNjN3d3BycGtMOHlKRXZB?=
 =?utf-8?B?VXFOZ1lsTkVKWnoxN2YycTZ1ZHpFRWdaL3dYUURjMVllM04rY2wydWRuUW9m?=
 =?utf-8?B?eVFjOWUwQjlKSXBoa0hqVWFzWTVVRVE1WDRZYW5ONHJ3OWJ5MzNHTmRmS3VE?=
 =?utf-8?B?REhlSHU4Mm90WE5KenloMEFBNnE1S3EzRi84RzBlcEZqQ0dEZVFJUGMyRUZH?=
 =?utf-8?B?Q1RIeE1mSm5EaCtsZklwMFFqZGZvOFJENjhGeWlSaitHbXBIV2N1NUF2ZCtF?=
 =?utf-8?Q?JUc5ewAvz+XpFHP8tro7LGbQ/aV6cWsN?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5339
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 66d3d6ab-bc54-4beb-2030-08de1125c6ea
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|14060799003|36860700013|35042699022|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1RtRUtMUDBvSk81N0RHSW51U0VtREJGdkZyaWVhZHB5aklrU25LZVZYTzZz?=
 =?utf-8?B?VGpNTFFES3ZrV09pR0c5RUdNWk5rdkNTYXhweFRKdGYwblpXOXNBUWVwU3Ew?=
 =?utf-8?B?eThqQ09TM29Ua2x1TnFTbmJQb2VvWEJEb1hBbVZLNFZPMVRZVGNBRVZjTlYy?=
 =?utf-8?B?Ri9FMlJKZkZOZThVaVZ6cUJZajVGZWRIVitsQ282WXZPdW9vamNtKzRZN0dV?=
 =?utf-8?B?dkIrU2NxSS9WUUZuTVl0K215WU5oY0NHM0xUTmhOWGQzNXozVkpQVkQwVFkw?=
 =?utf-8?B?b0xVcmpDRHJONXVnMmVURXEzMkhVNHFIWnlSczVVYVNsbWhmRm5YbkRYL1hW?=
 =?utf-8?B?bkpYcUlrM1BpcTlRZTdPaWJMdVFaNmZBMHRidmdVNWdXMDNzY1FEcVNWYUx6?=
 =?utf-8?B?ejRxck1RV3o1V0Y3YkJ0b2hEakhhSlFxTXQ0Y24xam1hV0ZZcjE5ZmxGWE5m?=
 =?utf-8?B?WU0rM2lFUGZ3QktaWTY3SHo0ZkJSTm1QeE5IdExXRG1uMzhzTDhjZmozc0E5?=
 =?utf-8?B?c3IycXZIMW5FL3VHMUlGTWp2eVRFVzJKNWhzVWJsQXlEbEVSNEZjOWtwNmt2?=
 =?utf-8?B?cmJuMWl5eEJQSi9Nd1dKTGJubW5QaFU3bzR3N2lOcW93TTVCVkJYdzI4TU1k?=
 =?utf-8?B?V1duOTdBRlR3alRJN0RFdEdIMytYQVU5eXIxY1FUclFzUmpRTnU4aTgzcElk?=
 =?utf-8?B?N1pzN3FQd0ViRGVEdjZmZnBZMWh1Q1Uxc01ocDVSRGJ4VjJScW5GSEY5bGVz?=
 =?utf-8?B?Y1JNcGgxdk82VzFjUGdDRzFvREFxajNBbGl2L01ERkJuK2plc05XQU5wdmZa?=
 =?utf-8?B?NGpjZHZpaEpzeml6MXJXT1F3MGIwblovT1J3S1BCaEhxMzAvRUdwUHNmWGRh?=
 =?utf-8?B?a1BhcmZ2b2wvbkpxQ29hTlFtK2N5RTIyMkd1eDdLeWpBMFZ4Vmdmdmk0SlE4?=
 =?utf-8?B?NHE4RTM3ZGxaa25uMy9NM0NUM3hCZUNOQ3VQekdrQjV4TDVrS2hWbGtBUXEr?=
 =?utf-8?B?K1AyVEZJcmtBOUFyRzZtTU9ZZUs4MGJTNnd5WU44c0k2R285YUxoY0t2U1Jm?=
 =?utf-8?B?WnB3amV2akhlQ0EyQ2E1bThTVVhOVGlvVXVabDFzVkdaNVZlZ1FpeEdSWVJE?=
 =?utf-8?B?a0hXQTZtSEJmbXcyQWRXMlhldGRyYzFkZ3dpbFVpK0NnVnFRUTcxcEloTW82?=
 =?utf-8?B?VHlzbkNHc1NwQ2xhL2tmaXJDYzltbnp5eUR1NkJhNVk4WUdpTS9YcmJzdVBG?=
 =?utf-8?B?L0FhMFY1NGlSYXZ1b3lzMGdSVTRza1FsVVA3TDR6VUdUSzBQSGJ6cGFYSzRV?=
 =?utf-8?B?S3B4R2F2RnVOUCtqdm9xeWRvbDdZcm12SVV5dWcxbFI0NmJrSHF5MGlTK3Zl?=
 =?utf-8?B?Y2JoRW1sek9Rd1h4V3JJRWlLRmJxeWpsOVNXMGkwZXAwVTZtQ01CRUdNVVpK?=
 =?utf-8?B?SEFJTzFqcXBlc0s5aTdHdWFuaGpvbEhkb2NNdzZoeHlKT2Q3c1UrL01ualBJ?=
 =?utf-8?B?Mkthb2ZkSGxqNlJBekJQQkk1dklYYTVXUkxtUVlSWnR6S21ubGRPTDBueU12?=
 =?utf-8?B?WXUvMjJ2Q09iakIveWYybCt4UXU4NXJFT2loY3kyY1JEQmNXNmtmVzVzYjY2?=
 =?utf-8?B?YXorbkN1TmNqd05vYXlYM3NCenJQNjFZMisrd2VWVE94aGJ5ZDdndWYwM0o5?=
 =?utf-8?B?QmpMdTNlNm5reGxxQ280Vit4bUtzQ1BUVDZLSWpaYUFncU9kWWFYT21PRXVu?=
 =?utf-8?B?NWN1NGc5SFRZcjJsTXlraW1mSkJYNllYMHJCSkVtclpVT2xOOTBwWFpuVHBQ?=
 =?utf-8?B?c1pxSnVYbmdqTkd5WFlRYVpIWUwvZzV0Z1pyVE8rS0ExdE4rb2laTjNnWUhq?=
 =?utf-8?B?WTVyVXVKSGJjNitaYVFqNTB4ZUk1dUFkWHUzUXJkQVB4YUNPN2JRL0Y5RVZC?=
 =?utf-8?B?bVM1bGp0U3JQMUUzUXpBNUk3RWtxMTFDSUhWU2RGLzVzOVVCUmZjNTlzSGw2?=
 =?utf-8?B?ZjY3SEZEMnFIMG5TY2JtZ0tWanFGOEh6SWxheWFJQkFWT2ErV0NFalBpcEti?=
 =?utf-8?B?YTRHMTJoN05saWttV09XdUJMeWdCU0VKa1NkSGc1dnZEQ0dCUzFaOXV4SEg1?=
 =?utf-8?Q?Qwp8=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(14060799003)(36860700013)(35042699022)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 04:45:41.6745 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ec266f-e33b-4355-0572-08de1125daf2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10596
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



On 10/21/25 18:39, Adrián Larumbe wrote:
> Hi Akash,
> 
> On 21.10.2025 15:32, Akash Goel wrote:
>>
>>
>> On 10/19/25 04:19, Adrián Larumbe wrote:
>>> Commit 33729a5fc0ca ("iommu/io-pgtable-arm: Remove split on unmap
>>> behavior") did away with the treatment of partial unmaps of huge IOPTEs.
>>>
>>
>> Sorry have a doubt.
>>
>> Corresponding to the commit 33729a5fc0ca, can we now remove the code to
>> pre-allocate L3 page table pages i.e. 'op_ctx->rsvd_page_tables.pages' inside
>> panthor_vm_prepare_unmap_op_ctx() ?.
>>
>>> In the case of Panthor, that means an attempt to run a VM_BIND unmap
>>> operation on a memory region whose start address and size aren't 2MiB
>>> aligned, in the event it intersects with a huge page, would lead to ARM
>>> IOMMU management code to fail and a warning being raised.
>>>
>>> Presently, and for lack of a better alternative, it's best to have
>>> Panthor handle partial unmaps at the driver level, by unmapping entire
>>> huge pages and remapping the difference between them and the requested
>>> unmap region.
>>>
>>> This could change in the future when the VM_BIND uAPI is expanded to
>>> enforce huge page alignment and map/unmap operational constraints that
>>> render this code unnecessary.
>>>
>>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>>> ---
>>>    drivers/gpu/drm/panthor/panthor_mmu.c | 129 +++++++++++++++++++++++++-
>>>    1 file changed, 126 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
>>> index 2d041a2e75e9..f9d200e57c04 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>>> @@ -2093,6 +2093,98 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
>>>    	return 0;
>>>    }
>>> +static bool
>>> +is_huge_page_partial_unmap(const struct panthor_vma *unmap_vma,
>>> +			   const struct drm_gpuva_op_map *op,
>>> +			   u64 unmap_start, u64 unmap_range,
>>> +			   u64 sz2m_prev, u64 sz2m_next)
>>> +{
>>> +	size_t pgcount, pgsize;
>>> +	const struct page *pg;
>>> +	pgoff_t bo_offset;
>>> +
>>> +	if (op->va.addr < unmap_vma->base.va.addr) {
>>
>>
>> Sorry, another doubt.
>>
>> Will this condition ever be true ?
>>
>> For 'op->remap.prev', 'op->va.addr' will always be equal to
>> 'unmap_vma->base.va.addr'.
> 
> I believe it will always be less than that. 


Thanks Adrian for having a look.

static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
{
	struct panthor_vma *unmap_vma = container_of(op->remap.unmap->va, 
struct panthor_vma, base);


IIUC, the 'unmap_vma' passed to panthor_gpuva_sm_step_remap() will 
always cover the entire VA range of 'drm_gpuva'.
That's why drm_gpuva_op_remap_to_unmap_range() is called to know the 
exact range to be unmapped.

In __drm_gpuvm_sm_unmap() and __drm_gpuvm_sm_map(), you can see this,

struct drm_gpuva_op_unmap u = { .va = va };


 > What will be equal to unmap_vma->base.va.addr is 
op->remap.prev->va.addr + op->remap.prev->va.range


I think op->remap.prev->va.addr + op->remap.prev->va.range will be equal 
to 'unmap_start' after the call to drm_gpuva_op_remap_to_unmap_range().

Sorry I may have again misunderstood the code.

Please can you check.

Best regards
Akash


>> And for 'op->remap.next', 'op->va.addr' will always be greater than
>> 'unmap_vma->base.va.addr'.
> 
> Yes, I believe so.
> 
>> Please can you clarify.
>>
>> Best regards
>> Akash
>>
>>
>>> +		bo_offset = unmap_start - unmap_vma->base.va.addr + unmap_vma->base.gem.offset;
>>> +		sz2m_prev = ALIGN_DOWN(unmap_start, SZ_2M);
>>> +		sz2m_next = ALIGN(unmap_start + 1, SZ_2M);
>>> +		pgsize = get_pgsize(unmap_start, unmap_range, &pgcount);
>>> +
>>> +	} else {
>>> +		bo_offset = ((unmap_start + unmap_range - 1) - unmap_vma->base.va.addr)
>>> +			+ unmap_vma->base.gem.offset;
>>> +		sz2m_prev = ALIGN_DOWN(unmap_start + unmap_range - 1, SZ_2M);
>>> +		sz2m_next = ALIGN(unmap_start + unmap_range, SZ_2M);
>>> +		pgsize = get_pgsize(sz2m_prev, unmap_start + unmap_range - sz2m_prev, &pgcount);
>>> +	}
>>> +
>>> +	pg = to_panthor_bo(unmap_vma->base.gem.obj)->base.pages[bo_offset >> PAGE_SHIFT];
>>> +
>>> +	if (pgsize == SZ_4K && folio_order(page_folio(pg)) == PMD_ORDER &&
>>> +	    unmap_vma->base.va.addr <= sz2m_prev && unmap_vma->base.va.addr +
>>> +	    unmap_vma->base.va.range >= sz2m_next)
>>> +		return true;
>>> +
>>> +	return false;
>>> +}
>>> +
>>> +struct remap_params {
>>> +	u64 prev_unmap_start, prev_unmap_range;
>>> +	u64 prev_remap_start, prev_remap_range;
>>> +	u64 next_unmap_start, next_unmap_range;
>>> +	u64 next_remap_start, next_remap_range;
>>> +	u64 unmap_start, unmap_range;
>>> +};
>>> +
>>> +static struct remap_params
>>> +get_map_unmap_intervals(const struct drm_gpuva_op_remap *op,
>>> +			const struct panthor_vma *unmap_vma)
>>> +{
>>> +	u64 unmap_start, unmap_range, sz2m_prev, sz2m_next;
>>> +	struct remap_params params = {0};
>>> +
>>> +	drm_gpuva_op_remap_to_unmap_range(op, &unmap_start, &unmap_range);
>>> +
>>> +	if (op->prev) {
>>> +		sz2m_prev = ALIGN_DOWN(unmap_start, SZ_2M);
>>> +		sz2m_next = ALIGN(unmap_start + 1, SZ_2M);
>>> +
>>> +		if (is_huge_page_partial_unmap(unmap_vma, op->prev, unmap_start,
>>> +					       unmap_range, sz2m_prev, sz2m_next)) {
>>> +			params.prev_unmap_start = sz2m_prev;
>>> +			params.prev_unmap_range = SZ_2M;
>>> +			params.prev_remap_start = sz2m_prev;
>>> +			params.prev_remap_range = unmap_start & (SZ_2M - 1);
>>> +
>>> +			u64 diff = min(sz2m_next - unmap_start, unmap_range);
>>> +
>>> +			unmap_range -= diff;
>>> +			unmap_start += diff;
>>> +		}
>>> +	}
>>> +
>>> +	if (op->next) {
>>> +		sz2m_prev = ALIGN_DOWN(unmap_start + unmap_range - 1, SZ_2M);
>>> +		sz2m_next = ALIGN(unmap_start + unmap_range, SZ_2M);
>>> +
>>> +		if (is_huge_page_partial_unmap(unmap_vma, op->next, unmap_start,
>>> +					       unmap_range, sz2m_prev, sz2m_next)) {
>>> +			if (unmap_range) {
>>> +				params.next_unmap_start = sz2m_prev;
>>> +				params.next_unmap_range = SZ_2M;
>>> +				unmap_range -= op->next->va.addr & (SZ_2M - 1);
>>> +			}
>>> +
>>> +			params.next_remap_start = op->next->va.addr;
>>> +			params.next_remap_range = SZ_2M - (op->next->va.addr & (SZ_2M - 1));
>>> +		}
>>> +	}
>>> +
>>> +	params.unmap_start = unmap_start;
>>> +	params.unmap_range = unmap_range;
>>> +
>>> +	return params;
>>> +}
>>> +
>>>    static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
>>>    				       void *priv)
>>>    {
>>> @@ -2100,20 +2192,51 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
>>>    	struct panthor_vm *vm = priv;
>>>    	struct panthor_vm_op_ctx *op_ctx = vm->op_ctx;
>>>    	struct panthor_vma *prev_vma = NULL, *next_vma = NULL;
>>> -	u64 unmap_start, unmap_range;
>>> +	struct remap_params params;
>>>    	int ret;
>>> -	drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
>>> -	ret = panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
>>> +	/*
>>> +	 * ARM IOMMU page table management code disallows partial unmaps of huge pages,
>>> +	 * so when a partial unmap is requested, we must first unmap the entire huge
>>> +	 * page and then remap the difference between the huge page minus the requested
>>> +	 * unmap region. Calculating the right offsets and ranges for the different unmap
>>> +	 * and map operations is the responsibility of the following function.
>>> +	 */
>>> +	params = get_map_unmap_intervals(&op->remap, unmap_vma);
>>> +
>>> +	ret = panthor_vm_unmap_pages(vm, params.unmap_start, params.unmap_range);
>>>    	if (ret)
>>>    		return ret;
>>>    	if (op->remap.prev) {
>>> +		ret = panthor_vm_unmap_pages(vm, params.prev_unmap_start,
>>> +					     params.prev_unmap_range);
>>> +		if (ret)
>>> +			return ret;
>>> +		ret = panthor_vm_map_pages(vm, params.prev_remap_start,
>>> +					   flags_to_prot(unmap_vma->flags),
>>> +					   to_drm_gem_shmem_obj(op->remap.prev->gem.obj)->sgt,
>>> +					   op->remap.prev->gem.offset, params.prev_remap_range);
>>> +		if (ret)
>>> +			return ret;
>>> +
>>>    		prev_vma = panthor_vm_op_ctx_get_vma(op_ctx);
>>>    		panthor_vma_init(prev_vma, unmap_vma->flags);
>>>    	}
>>>    	if (op->remap.next) {
>>> +		ret = panthor_vm_unmap_pages(vm, params.next_unmap_start,
>>> +					     params.next_unmap_range);
>>> +		if (ret)
>>> +			return ret;
>>> +
>>> +		ret = panthor_vm_map_pages(vm, params.next_remap_start,
>>> +					   flags_to_prot(unmap_vma->flags),
>>> +					   to_drm_gem_shmem_obj(op->remap.next->gem.obj)->sgt,
>>> +					   op->remap.next->gem.offset, params.next_remap_range);
>>> +		if (ret)
>>> +			return ret;
>>> +
>>>    		next_vma = panthor_vm_op_ctx_get_vma(op_ctx);
>>>    		panthor_vma_init(next_vma, unmap_vma->flags);
>>>    	}
>>>
>>> base-commit: 7fb19ea1ec6aa85c75905b1fd732d50801e7fb28
>>> prerequisite-patch-id: 3b0f61bfc22a616a205ff7c15d546d2049fd53de
> 
> Adrian Larumbe
