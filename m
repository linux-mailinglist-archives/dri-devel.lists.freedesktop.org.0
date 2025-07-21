Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E75BB0C0B9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 11:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9B810E267;
	Mon, 21 Jul 2025 09:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="V0UK1jne";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="V0UK1jne";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013047.outbound.protection.outlook.com
 [40.107.162.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC66410E267
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 09:54:38 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SkwRKFZopM0p+opTWkviTvVXKshVWXNSq1eplWmoIc1/ErzIGyckzyT7MNw1liYZDibgFUlm1OxyrhCtWh3XvD4cy8eA1mIhc4yQ3wg43ZMkYsZSTHVhDCXKVxZObT5jiP94AUJ/aTmcwtKVjZbB9bZOLm85AxLeQiyO48sCo3DqeO4eY40SgjwNG6vx79zCDRlK/oFGhSYuJbFjUt7Z055HMK/C/SL71FnpiDymu0elxhChbTtjffm0pVdlJQtbQVaBze6FBZ7bvwPy2SJliVxI1zoph0DVVqd4rNN0BXYFcfGIYK16oj/dl8ZPf6S5I9RJdjAQC1z/iuK5k772Tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Vy3ggThOP/GMudg3CNpcK75HGptJJ+bIDOBC9PWIpI=;
 b=AbTXRZW9XGOgkKKbWBc2JTNtogEdm36sFL3tRNtpun76WgNFwWFF7frP3mMSMd5fYFwjb1kvIMqvnk3aM5lit7ldCTW9RhmmLk3jUk8+enTcoBb6uoaqGymiQplixnI4dZHuJxuvgKX8USpDSsWmGMB3IxhzcJpnYtxjLMpYESvOA/oUSGM/xDqMWto63dFeEx8J+S/ylqcN6o3cmRxYM8tXnM5ChCmrjyTNZV3MfNUbAn805GEAoCx0XPusa6pCczUX+BWLgj4SShoau5WaYB8BsZeT+j+4GZ6Ka0hbvfbFKDC+7AVFVyU2KV/awqEDBzvFLqOYXrXxnfCA8NpOpQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Vy3ggThOP/GMudg3CNpcK75HGptJJ+bIDOBC9PWIpI=;
 b=V0UK1jnea0KqHc7pfPFKgjo/AAFtOR3/GW7EivHiEkl6EyB0cB5d/Pi17NPPN+Zp5Zo8NtTaxvh7jffRjYkCSM38RRAGmUwfYW4PEFjI21bfwF5exTsRvSjmdCIR7VcEIfx+exLGkQpaedRsM19wVozmF0a+mAQGA/EVSzoTR48=
Received: from AS4P190CA0064.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::16)
 by GV1PR08MB10535.eurprd08.prod.outlook.com (2603:10a6:150:161::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 09:54:33 +0000
Received: from AM2PEPF0001C708.eurprd05.prod.outlook.com
 (2603:10a6:20b:656:cafe::38) by AS4P190CA0064.outlook.office365.com
 (2603:10a6:20b:656::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 09:54:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C708.mail.protection.outlook.com (10.167.16.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 09:54:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNCJXdyVw1M7gh1Bdg4xpJbyk7uMNNtO8lpUJDGftOgcWEgd3kwSxMqmhM4zOohxCQ6QboYlWen6pS4zgOJBEeyaZTo8Lk4o7NVFWjQyDnOk4BXt2AJBPZVBcEAVkyIQ+vP6O1tpI2m6ThzclOJWPDm+AgtfUa0WLiYL4rpU6D1HwkgSz2fN2uOqtEVodBjIwJQL6TPw6rd9Um2sx7Pp+1deVBEK2c99nz6oKI7G6G6jbpxOuIllwr0EkCyipwxPRPcRgkVA5dk+HQDhskjflbqY+tvhPLtTCNGuSHXoy02VYMoDMdYeeI0dSIBNFms902sLsjcccJG/Is2K8yweTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Vy3ggThOP/GMudg3CNpcK75HGptJJ+bIDOBC9PWIpI=;
 b=PEj6IdqSnt1CF9VQqk8h76KAho7SXCEOkDh8VhAcY/yOBhjw7Vyuz850vPz/7N7oPFkInBhN9D5BvBIQrMF1TGu+nUW8pP4RFQtBsgi/ZBBpy/6ykCCM/DyBf+448mZ4x6aaYR3U+tqX6fILnUvOQu0M+pQBGzXrG+x/3vgGcqYUnaCoUbiyLWHjsQleQjnkyJw+AyEv1rqhVVA3C5dmakuvMGduA+5gA5TfNr1ylMkhnVzKB1ztzbiWTb9E2lcjfex9fWNCb0xcmaEGOVROlIx55t2gd2TUc4jATBnAApj626gLJLv6+AUEQJnR+ii70rJ1ycF3+jrkeZi7t962BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Vy3ggThOP/GMudg3CNpcK75HGptJJ+bIDOBC9PWIpI=;
 b=V0UK1jnea0KqHc7pfPFKgjo/AAFtOR3/GW7EivHiEkl6EyB0cB5d/Pi17NPPN+Zp5Zo8NtTaxvh7jffRjYkCSM38RRAGmUwfYW4PEFjI21bfwF5exTsRvSjmdCIR7VcEIfx+exLGkQpaedRsM19wVozmF0a+mAQGA/EVSzoTR48=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by DB4PR08MB8030.eurprd08.prod.outlook.com (2603:10a6:10:38a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 09:53:56 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0%4]) with mapi id 15.20.8943.024; Mon, 21 Jul 2025
 09:53:56 +0000
Message-ID: <f3d2b9de-1b2f-43aa-bf85-025086f79601@arm.com>
Date: Mon, 21 Jul 2025 10:53:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] drm/panthor: Introduce sampling sessions to handle
 userspace clients
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <cover.1747148172.git.lukas.zapolskas@arm.com>
 <0319137f966f2dbffc54e51f7a2a3cbac837507b.1747148172.git.lukas.zapolskas@arm.com>
 <xxzoh644c5rpaxnfxjwzjclokj6c2xbccqrfrh4bkixsdiklbo@qle75rimzy2k>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <xxzoh644c5rpaxnfxjwzjclokj6c2xbccqrfrh4bkixsdiklbo@qle75rimzy2k>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0137.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::15) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|DB4PR08MB8030:EE_|AM2PEPF0001C708:EE_|GV1PR08MB10535:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b6e7705-6acf-4ccb-002a-08ddc83c9700
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Q1k3M0xsS3hMQVZLMkNjNVBuRlNuWTNKOEdPVSsrK1RzWm5CT0Q0WXZTQ0ZO?=
 =?utf-8?B?S0Q5NGo1ZXh2SDFvakV4WHpTYzl2bDV1Sk42RGRHcVIvWHhCNk5aWHEvZkJC?=
 =?utf-8?B?a01WenloQ1RHOThhWndDN1E0andROGJrSXJLT3BJSkNRdHNSa1kwelNkaG5u?=
 =?utf-8?B?aHRnOFZkT3ZtNXdvSzY2YjdMTDdKWU4vRy8xSVY2K0tQOHVCQ2tTdm1ZaUpx?=
 =?utf-8?B?Z0pMc0xOOWhXTnZZOTh2OEgrWHJNYkZXejRZS0ZiUklRL3ExL3F2M2JUZVJi?=
 =?utf-8?B?d3A1bGEvVjlGU1l2UTVrNkk1YS90WDdwUHgxRVRuREZvSjVKeW9BaGlUaGFC?=
 =?utf-8?B?TW42OEtjV2Y4S0JVRHBrbWZtOWVIdjNyMGRlcTlWYU5BMUVLd01tNWFqYVlY?=
 =?utf-8?B?bkZHL3JGSGU0SVBzVlB1RlhJQmErUUdjM3lXNHY0ZW5ubTJsZllFdlRTTWQz?=
 =?utf-8?B?SzFORkJtdHJmSjZrNitqNml1M0hZZm5IT0kxN2JXb2Y1YzB2OVpyL1lkNklM?=
 =?utf-8?B?eVJ0b3BRbVlTd0lDMmxiaXB4UjVKNUdXUm00bC9qMGhwRk1wTjdzcnJPUmgv?=
 =?utf-8?B?U2FsOENSR3RKa0szTUpSWFJiRnJJd2pNSjNSenNoc3h1QzdPU2xIU3BtejN1?=
 =?utf-8?B?cStQeUlmNldnWmNTejl4RmUvNWhhd1dwUkJKN1E0RURtYy9UaFpaOXN5OWR4?=
 =?utf-8?B?MVp0Y2pjYk8rajYrRHJZYjZjSk1oNkZtd1UvbjFYeDdQOVFjRnhKNWtiM2xv?=
 =?utf-8?B?WjZBc3lWRzc1TEN2U0drTk85YkQ2TGhDVWVXRk96TDVlRlhRd1hTbVNGeS94?=
 =?utf-8?B?c2Y2eVlzcDhvSnZyTExPVGNyYU0vQjlHOTNOQ2hpLzZTYllhT1Y4R3RjMDA1?=
 =?utf-8?B?aXJKT3hjQTU4VWF1WE12d1FJeUVsSlNJMlNSN0JoNWR3eWlIQnpkZXVvekwr?=
 =?utf-8?B?WVNyVFE2VDRiQWJRNTRyMFlYNEFvY01VMTR1TzZ4a1Rqb3hGUXVuSXhEVlli?=
 =?utf-8?B?MHFwZGU5VlpKd0dvQjRVUkxNQVhoOHRSUVlCeXFzb2RKQnR4MFFEZTZhZnZq?=
 =?utf-8?B?cWtTcHZ4MzRFS2NrMDBqVlFFWWkrNjRnMUhyaDc2bW40Y3JCMHBWQUFOeHpj?=
 =?utf-8?B?cXpGRFdqYXlVbmoyYWhqR0hjdDkxanRvWFUvWWRtWWR4OW1XQUcrWFI5VVps?=
 =?utf-8?B?TXdYWFNmdGNObTNTUmRmNUlid2V2ME1NbHNTWmVQZzBOYXV2VXRFOE1sZzdv?=
 =?utf-8?B?TlAyWGxRelpwZm5ob0VXaVhoM01wTXBLL0pJQjlFdzdyYk5zOFNLRzZhMFp2?=
 =?utf-8?B?T0lzS2VXNk1zdUhBTGF2VnFoRUFzc25udDZDeG5uWWlkRmxiUnllOEMxQjV0?=
 =?utf-8?B?eTMxMFlTRndOZndXb3JCQXFTNk1xa29DN3FDZUVacXhvUkhXZDJLK2U2d2Fa?=
 =?utf-8?B?L3dzTzdCMjQxeTdwWS9RVytUekcxaGxVeHl2MG80cWNHYm1UQVJNQ2xEUkR3?=
 =?utf-8?B?ckhhMURTMXYrYk5RbXJtazNiOVA5bUhUOE0vZms5S0syTTI3MXJUS2Ric29Z?=
 =?utf-8?B?K0dxRUg1MDhBOUc4d2V2bEJacC9rajMzSkpZbUJpdXU1cWtDaUc1Y2luMlY2?=
 =?utf-8?B?bVV0aVVJbUI3ZVV0anMwT2pydjg4eFgyNmhnaG45K3Q4TFBUUDNWQjBmOG9i?=
 =?utf-8?B?UDNISlBBdkE5NnN0cWJreEpCZjZhVC9WajlRWGNMSDcrajY3YkplMWlZT3Nm?=
 =?utf-8?B?UDRoWVhWRGNCYU02NmxiQTdWN3BJYjNQNjFHZkUrSlc2ZUNiNTJJQUhCc215?=
 =?utf-8?B?elhmazhEWHJOV2RScjFCNlRqcTQwRWJWQ1QxR0d6eTQ1b0NQWElHYkgvTUJa?=
 =?utf-8?B?bkZZVVJhMVBYbXF6MzB0TmNtdXNkbHJIRXRabUNQeEc5c1owTVdEZythOHRx?=
 =?utf-8?Q?v5O15l93h88=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8030
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a0a57241-1da5-402e-b305-08ddc83c81e2
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|35042699022|1800799024|82310400026|14060799003|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDdOUmQ5RGZROVVJeXlyL2V4azU0L29IbmJ3Zk5aWHIwZjdnOFVPb29NS3Fx?=
 =?utf-8?B?eTk5SUNtcnIxNC8vU1VSd2dreko0V00xUEVFSTIwVUJiOVZSQ1UzQTMwZ0ZE?=
 =?utf-8?B?TVV4MUdoa0NVQjlRMXkzQk1PRm1Zd2xPVlNROXpTWGRtcmVMVS9tSWg3amFs?=
 =?utf-8?B?TjRQS2xHZjA4dmQvd0Noa1BUVjlpZVd6aE5SVjRZREg2cllhVEI4YTBYT3pt?=
 =?utf-8?B?TVI1WHU1ZFNjeEdZaGI5MDNjNHJiN1pOMjFvbHdJZkdXZVdnVzJpNCs5emF4?=
 =?utf-8?B?RkNEcEl4R0Z6RmUxZFZ0dW5GbTdzYkUyS0VSaU9sL0lYV0tWYWJtVUd6OWFm?=
 =?utf-8?B?Z0NTa1VhUzUwS3EyRU81eEszRGJrTGcrVTBjMytLMjR3MGNicUxqeFdZRzU1?=
 =?utf-8?B?OXZsdXlCa3FZam1FSnJHck9VMk44NEhjQmk3TFR1UGw5aUJtOU1ITC9leUxz?=
 =?utf-8?B?K1k1amd3dVZaRExDUTh1L3dBYWFpNXNENkYvUXVoRzVsd2FVYi9DVnAvRkVq?=
 =?utf-8?B?VTBzN1luandmVlNPbTgxNmxsekVGV0hJK2w0Z0UrdGh2VHo4Z3lFcmtxcjRi?=
 =?utf-8?B?aDhZMCtYUUNwQklUSHBVZXovdFVyVVZad2hrWldRQTE5OTRuRVRIVlJzcjVj?=
 =?utf-8?B?a1BKY012WTRscFByUENoWnRNbW1tc3Z1MnBvV29rLzR0bFZXazZMNVMxcUw1?=
 =?utf-8?B?bHV3Y0FhS0VIMlA2RWJrYW4vNDZFQTNMS3RNczVJckRzS1ZUY1I3WC9oeDA3?=
 =?utf-8?B?akxuenRRRFpOZHRaVTBZemQwWEJnUll0Z2drNm9lK2Vja3dSSFdIenkxY3BW?=
 =?utf-8?B?U2JFTUlkMFhxYWJoT1VWeG0xb3ZpdmRJNUZNaU9JdythSjk5STd4K1VHSC9K?=
 =?utf-8?B?RUE1ZlJXTUJDYlduNzVMOTVrc20xdVpOWWJreTBKdUFKcTdRcVZWbk9CUEdq?=
 =?utf-8?B?R0c4ZnRYVXNYYzBDbEgwUlA5eGZIM0NiUWkwb1lsMm9ZMERjeUFDZmJWQ3FK?=
 =?utf-8?B?ckRQUFNSaGhKbThEUnd5TlBrVkszanRPblBXYnpVWE9QNFdCMUc0RCs3S1BQ?=
 =?utf-8?B?WkVkTkU2bkc5dkZ0QUJ5eER6c0x2MG01VG1UV3pPNHV4M1FOam9kUlNjNHl3?=
 =?utf-8?B?YmoxUmhsZU5jRDJDbEFYSXpmR3pEb29JRnhBSWlhai91eEZmdytFUnBGQ2xz?=
 =?utf-8?B?VlVLdE1QUnFQQzN5cXZnZE16ejJ1WERWZHdhYVJCdWZva1hNbmxXYkJXNGww?=
 =?utf-8?B?bmVjMktGRStLMTNRM0hXMWpqVlgvQ1VhejlMSHdvdmJXYWV6c1YxczMranJR?=
 =?utf-8?B?TFIrUWd1YWpYcG9KMk13UTRuRzg3Qk5Za2VnUEFYV01jZHpXTVZacUhlNGN5?=
 =?utf-8?B?YXduaTloeXJUZWN1V3Z3UVV3T2M4RVlEQUJqMVBEN0pLVDVEeGV4YmpmUlFp?=
 =?utf-8?B?RmNyOTdQMEc2WnVUMXQrWUNPNGJxOW1qaTZEcC91MTIzeWlTL25FNnM4L0tU?=
 =?utf-8?B?UVhzK3M4WXNPNkNjeWNuR0JSQ1ZFU3M0SjRiZHBaSWhZcnRIV3ZVakVjaVd0?=
 =?utf-8?B?UVFnN1FwVStKeXRSWW5xZHA5c1czbk1KV0NCaEtqU0h6TmNMU3pBRFdyN3dz?=
 =?utf-8?B?ejdEK0h6WFlpWWpCeEZBeXZBWGlheElJdXRjUXdqMEx6SU5VbGlONmQwdDhx?=
 =?utf-8?B?alBLMFZiQ0pnRVZQV3dpMVZYbjNsaVo0dFZVYjk4SmR3K3A1ZlBSUFQwQWRu?=
 =?utf-8?B?RjM1OTlsdWZIbWhqU3liaS85SnRRNHhsS3JuSlN0T1liaTNMNmd0TCtNaVVM?=
 =?utf-8?B?alZxMDZjZUZQZXVjZmlyQW92WWNTNnNoNzd1S1dOWmxWSjV1ZXdTV0JFbFZj?=
 =?utf-8?B?ZDFWVlpaQnp6eDdiSEF2TmdQakpOMzNjNWtQNVRzRHVsQThCVUtNWkNIQ3Jz?=
 =?utf-8?B?YnZwb1YwbmhkMEVOQzZRZEFxWUpBQkdzNzNacnVnZlMweE1VTzJNRVlHRVhp?=
 =?utf-8?B?TFVTSkNwdVcxTlJxVXlSTjZDWHJjVlpSM2U1N2VTVkZHemZ6R1RocWJEUUt6?=
 =?utf-8?B?OGhXVHJvcFk1TnJkVDBVMElQbmRhc1YxQk8vZz09?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(35042699022)(1800799024)(82310400026)(14060799003)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 09:54:31.2389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6e7705-6acf-4ccb-002a-08ddc83c9700
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10535
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



On 18/07/2025 04:34, Adrián Larumbe wrote:
> On 16.05.2025 16:49, Lukas Zapolskas wrote:
>> To allow for combining the requests from multiple userspace clients, an
>> intermediary layer between the HW/FW interfaces and userspace is
>> created, containing the information for the counter requests and
>> tracking of insert and extract indices. Each session starts inactive and
>> must be explicitly activated via PERF_CONTROL.START, and explicitly
>> stopped via PERF_CONTROL.STOP. Userspace identifies a single client with
>> its session ID and the panthor file it is associated with.
>>
>> The SAMPLE and STOP commands both produce a single sample when called,
>> and these samples can be disambiguated via the opaque user data field
>> passed in the PERF_CONTROL uAPI. If this functionality is not desired,
>> these fields can be kept as zero, as the kernel copies this value into
>> the corresponding sample without attempting to interpret it.
>>
>> Currently, only manual sampling sessions are supported, providing
>> samples when userspace calls PERF_CONTROL.SAMPLE, and only a single
>> session is allowed at a time. Multiple sessions and periodic sampling
>> will be enabled in following patches.
>>
>> No protection is provided against the 32-bit hardware counter overflows,
>> so for the moment it is up to userspace to ensure that the counters are
>> sampled at a reasonable frequency.
>>
>> The counter set enum is added to the uapi to clarify the restrictions on
>> calling the interface.
>>
>> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_device.h |   3 +
>>  drivers/gpu/drm/panthor/panthor_drv.c    |   1 +
>>  drivers/gpu/drm/panthor/panthor_perf.c   | 694 ++++++++++++++++++++++-
>>  drivers/gpu/drm/panthor/panthor_perf.h   |  16 +
>>  4 files changed, 713 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
>> index 818c4d96d448..3fa0882fe81b 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.h
>> +++ b/drivers/gpu/drm/panthor/panthor_device.h
>> @@ -225,6 +225,9 @@ struct panthor_file {
>>  	/** @ptdev: Device attached to this file. */
>>  	struct panthor_device *ptdev;
>>
>> +	/** @drm_file: Corresponding drm_file */
> 
>> +	struct drm_file *drm_file;
> 
> I'm sceptical about adding this here, and suspect we don't need it. I mentioned why in the
> review for the next patch.
> 

I see what you mean. Will try that out, thanks. 

>> +
>>  	/** @vms: VM pool attached to this file. */
>>  	struct panthor_vm_pool *vms;
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>> index 9d2b716cca45..4c1381320859 100644
>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>> @@ -1356,6 +1356,7 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
>>  	}
>>
>>  	pfile->ptdev = ptdev;
>> +	pfile->drm_file = file;
>>
>>  	ret = panthor_vm_pool_create(pfile);
>>  	if (ret)
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
>> index 9365ce9fed04..15fa533731f3 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.c
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
>> @@ -2,13 +2,177 @@
>>  /* Copyright 2023 Collabora Ltd */
>>  /* Copyright 2025 Arm ltd. */
>>
>> -#include <linux/bitops.h>
>> +#include <drm/drm_gem.h>
>>  #include <drm/panthor_drm.h>
>> +#include <linux/bitops.h>
>> +#include <linux/circ_buf.h>
>>
>>  #include "panthor_device.h"
>>  #include "panthor_fw.h"
>>  #include "panthor_perf.h"
>>
>> +/**
>> + * PANTHOR_PERF_EM_BITS - Number of bits in a user-facing enable mask. This must correspond
>> + *                        to the maximum number of counters available for selection on the newest
>> + *                        Mali GPUs (128 as of the Mali-Gx15).
>> + */
>> +#define PANTHOR_PERF_EM_BITS (BITS_PER_TYPE(u64) * 2)
>> +
>> +enum panthor_perf_session_state {
>> +	/** @PANTHOR_PERF_SESSION_ACTIVE: The session is active and can be used for sampling. */
>> +	PANTHOR_PERF_SESSION_ACTIVE = 0,
>> +
>> +	/**
>> +	 * @PANTHOR_PERF_SESSION_OVERFLOW: The session encountered an overflow in one of the
>> +	 *                                 counters during the last sampling period. This flag
>> +	 *                                 gets propagated as part of samples emitted for this
>> +	 *                                 session, to ensure the userspace client can gracefully
>> +	 *                                 handle this data corruption.
>> +	 */
>> +	PANTHOR_PERF_SESSION_OVERFLOW,
>> +
>> +	/* Must be last */
>> +	PANTHOR_PERF_SESSION_MAX,
>> +};
>> +
>> +struct panthor_perf_enable_masks {
>> +	/**
>> +	 * @mask: Array of bitmasks indicating the counters userspace requested, where
>> +	 *        one bit represents a single counter. Used to build the firmware configuration
>> +	 *        and ensure that userspace clients obtain only the counters they requested.
>> +	 */
>> +	unsigned long mask[DRM_PANTHOR_PERF_BLOCK_MAX][BITS_TO_LONGS(PANTHOR_PERF_EM_BITS)];
>> +};
>> +
>> +struct panthor_perf_counter_block {
>> +	struct drm_panthor_perf_block_header header;
>> +	u64 counters[];
>> +};
> 
> This is a redefinition.
> 
>> +/**
>> + * enum session_sample_type - Enum of the types of samples a session can request.
>> + */
>> +enum session_sample_type {
>> +	/** @SAMPLE_TYPE_NONE: A sample has not been requested by this session. */
>> +	SAMPLE_TYPE_NONE,
>> +
>> +	/** @SAMPLE_TYPE_INITIAL: An initial sample has been requested by this session. */
>> +	SAMPLE_TYPE_INITIAL,
>> +
>> +	/** @SAMPLE_TYPE_REGULAR: A regular sample has been requested by this session. */
>> +	SAMPLE_TYPE_REGULAR,
>> +};
>> +
>> +struct panthor_perf_session {
>> +	DECLARE_BITMAP(state, PANTHOR_PERF_SESSION_MAX);
>> +
>> +	/**
>> +	 * @pending_sample_request: The type of sample request that is currently pending:
>> +	 *                          - when a sample is not requested, the data should be accumulated
>> +	 *                            into the next slot of its ring buffer, but the extract index
>> +	 *                            should not be updated, and the user-space session must
>> +	 *                            not be signaled.
>> +	 *                          - when an initial sample is requested, the data must not be
>> +	 *                            emitted into the target ring buffer and the userspace client
>> +	 *                            must not be notified.
>> +	 *                          - when a regular sample is requested, the data must be emitted
>> +	 *                            into the target ring buffer, and the userspace client must
>> +	 *                            be signalled.
>> +	 */
>> +	enum session_sample_type pending_sample_request;
>> +
>> +	/**
>> +	 * @user_sample_size: The size of a single sample as exposed to userspace. For the sake of
>> +	 *                    simplicity, the current implementation exposes the same structure
>> +	 *                    as provided by firmware, after annotating the sample and the blocks,
>> +	 *                    and zero-extending the counters themselves (to account for in-kernel
>> +	 *                    accumulation).
>> +	 *
>> +	 *                    This may also allow further memory-optimizations of compressing the
>> +	 *                    sample to provide only requested blocks, if deemed to be worth the
>> +	 *                    additional complexity.
>> +	 */
>> +	size_t user_sample_size;
>> +
>> +	/**
>> +	 * @accum_idx: The last insert index indicates whether the current sample
>> +	 *                   needs zeroing before accumulation. This is used to disambiguate
>> +	 *                   between accumulating into an intermediate slot in the user ring buffer
>> +	 *                   and zero-ing the buffer before copying data over.
>> +	 */
>> +	u32 accum_idx;
>> +
>> +	/**
>> +	 * @sample_freq_ns: Period between subsequent sample requests. Zero indicates that
>> +	 *                  userspace will be responsible for requesting samples.
>> +	 */
>> +	u64 sample_freq_ns;
>> +
>> +	/** @sample_start_ns: Sample request time, obtained from a monotonic raw clock. */
>> +	u64 sample_start_ns;
>> +
>> +	/**
>> +	 * @user_data: Opaque handle passed in when starting a session, requesting a sample (for
>> +	 *             manual sampling sessions only) and when stopping a session. This handle
>> +	 *             allows the disambiguation of a sample in the ringbuffer.
>> +	 */
>> +	u64 user_data;
>> +
>> +	/**
>> +	 * @eventfd: Event file descriptor context used to signal userspace of a new sample
>> +	 *           being emitted.
>> +	 */
>> +	struct eventfd_ctx *eventfd;
>> +
>> +	/**
>> +	 * @enabled_counters: This session's requested counters. Note that these cannot change
>> +	 *                    for the lifetime of the session.
>> +	 */
>> +	struct panthor_perf_enable_masks *enabled_counters;
>> +
>> +	/** @ringbuf_slots: Slots in the user-facing ringbuffer. */
>> +	size_t ringbuf_slots;
>> +
>> +	/** @ring_buf: BO for the userspace ringbuffer. */
>> +	struct drm_gem_object *ring_buf;
>> +
>> +	/**
>> +	 * @control_buf: BO for the insert and extract indices.
>> +	 */
>> +	struct drm_gem_object *control_buf;
>> +
>> +	/** @control: The mapped insert and extract indices. */
>> +	struct drm_panthor_perf_ringbuf_control *control;
>> +
>> +	/** @samples: The mapping of the @ring_buf into the kernel's VA space. */
>> +	u8 *samples;
>> +
>> +	/**
>> +	 * @pending: The list node used by the sampler to track the sessions that have not yet
>> +	 *           received a sample.
>> +	 */
>> +	struct list_head pending;
>> +
>> +	/**
>> +	 * @sessions: The list node used by the sampler to track the sessions waiting for a sample.
>> +	 */
>> +	struct list_head sessions;
>> +
>> +	/**
>> +	 * @pfile: The panthor file which was used to create a session, used for the postclose
>> +	 *         handling and to prevent a misconfigured userspace from closing unrelated
>> +	 *         sessions.
>> +	 */
>> +	struct panthor_file *pfile;
>> +
>> +	/**
>> +	 * @ref: Session reference count. The sample delivery to userspace is asynchronous, meaning
>> +	 *       the lifetime of the session must extend at least until the sample is exposed to
>> +	 *       userspace.
>> +	 */
>> +	struct kref ref;
>> +};
>> +
>>  struct panthor_perf {
>>  	/** @next_session: The ID of the next session. */
>>  	u32 next_session;
>> @@ -72,6 +236,122 @@ static void panthor_perf_info_init(struct panthor_device *ptdev)
>>  	perf_info->sample_size = session_get_user_sample_size(perf_info);
>>  }
>>
>> +static struct panthor_perf_enable_masks *panthor_perf_create_em(struct drm_panthor_perf_cmd_setup
>> +		*setup_args)
>> +{
>> +	struct panthor_perf_enable_masks *em = kmalloc(sizeof(*em), GFP_KERNEL);
>> +	if (IS_ERR_OR_NULL(em))
>> +		return em;
>> +
>> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_FW],
>> +			setup_args->fw_enable_mask, PANTHOR_PERF_EM_BITS);
>> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_CSHW],
>> +			setup_args->cshw_enable_mask, PANTHOR_PERF_EM_BITS);
>> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_TILER],
>> +			setup_args->tiler_enable_mask, PANTHOR_PERF_EM_BITS);
>> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_MEMSYS],
>> +			setup_args->memsys_enable_mask, PANTHOR_PERF_EM_BITS);
>> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_SHADER],
>> +			setup_args->shader_enable_mask, PANTHOR_PERF_EM_BITS);
>> +
>> +	return em;
>> +}
>> +
>> +static u64 session_read_extract_idx(struct panthor_perf_session *session)
>> +{
>> +	const u64 slots = session->ringbuf_slots;
>> +
>> +	/* Userspace will update their own extract index to indicate that a sample is consumed
>> +	 * from the ringbuffer, and we must ensure we read the latest value.
>> +	 */
>> +	return smp_load_acquire(&session->control->extract_idx) % slots;
>> +}
>> +
>> +static u64 session_read_insert_idx(struct panthor_perf_session *session)
>> +{
>> +	const u64 slots = session->ringbuf_slots;
>> +
>> +	/*
>> +	 * Userspace is able to write to the insert index, since it is mapped
>> +	 * on the same page as the extract index. This should not happen
>> +	 * in regular operation.
> 
> Why would userspace be able to write into the insert index? I guess in a
> ringbuffer setup, UM updates the extract index when it consumes a
> sample, and the kernel increases the insert index when it writes a new
> sample into the user-facing ringbuffer.
> 
Currently, the insert index is mapped at a fixed offset from the extract index on the same 
user visible page. Since they're both mapped as read/write, the user could write to it 
and we need to handle that case to ensure there's no overflow.

>> +	 */
>> +	return smp_load_acquire(&session->control->insert_idx) % slots;
>> +}
>> +
>> +static void session_get(struct panthor_perf_session *session)
>> +{
>> +	kref_get(&session->ref);
>> +}
>> +
>> +static void session_free(struct kref *ref)
>> +{
>> +	struct panthor_perf_session *session = container_of(ref, typeof(*session), ref);
>> +
>> +	if (session->samples && session->ring_buf) {
>> +		struct iosys_map map = IOSYS_MAP_INIT_VADDR(session->samples);
>> +
>> +		drm_gem_vunmap_unlocked(session->ring_buf, &map);
> 
> drm_gem_vunmap_unlocked() isn't declared in drm_gem.h  when I rebase the patch series onto drm-misc. I guess it means either you're basing this patch series on a previous WIP branch or else it's misspelt?
> 

Looks like I was based on an old commit, the unlocked variants were renamed to drop the `_unlocked` postfix
in [0]. Will fix these up. 

>> +		drm_gem_object_put(session->ring_buf);
>> +	}
>> +
>> +	if (session->control && session->control_buf) {
>> +		struct iosys_map map = IOSYS_MAP_INIT_VADDR(session->control);
>> +
>> +		drm_gem_vunmap_unlocked(session->control_buf, &map);
>> +		drm_gem_object_put(session->control_buf);
>> +	}
>> +
>> +	eventfd_ctx_put(session->eventfd);
>> +
>> +	kfree(session);
>> +}
>> +
>> +static void session_put(struct panthor_perf_session *session)
>> +{
>> +	kref_put(&session->ref, session_free);
>> +}
>> +
>> +/**
>> + * session_find - Find a session associated with the given session ID and
>> + *                panthor_file.
>> + * @pfile: Panthor file.
>> + * @perf: Panthor perf.
>> + * @sid: Session ID.
>> + *
>> + * The reference count of a valid session is increased to ensure it does not disappear
>> + * in the window between the XA lock being dropped and the internal session functions
>> + * being called.
>> + *
>> + * Return: valid session pointer or an ERR_PTR.
>> + */
>> +static struct panthor_perf_session *session_find(struct panthor_file *pfile,
>> +		struct panthor_perf *perf, u32 sid)
>> +{
>> +	struct panthor_perf_session *session;
>> +
>> +	if (!perf)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	xa_lock(&perf->sessions);
>> +	session = xa_load(&perf->sessions, sid);
>> +
>> +	if (!session || xa_is_err(session)) {
>> +		xa_unlock(&perf->sessions);
>> +		return ERR_PTR(-EBADF);
>> +	}
>> +
>> +	if (session->pfile != pfile) {
>> +		xa_unlock(&perf->sessions);
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	session_get(session);
>> +	xa_unlock(&perf->sessions);
>> +
>> +	return session;
>> +}
>> +
>>  /**
>>   * panthor_perf_init - Initialize the performance counter subsystem.
>>   * @ptdev: Panthor device
>> @@ -109,6 +389,412 @@ int panthor_perf_init(struct panthor_device *ptdev)
>>  	return ret;
>>  }
>>
>> +static int session_validate_set(u8 set)
>> +{
>> +	if (set > DRM_PANTHOR_PERF_SET_TERTIARY)
>> +		return -EINVAL;
>> +
>> +	if (set == DRM_PANTHOR_PERF_SET_PRIMARY)
>> +		return 0;
>> +
>> +	if (set > DRM_PANTHOR_PERF_SET_PRIMARY)
>> +		return capable(CAP_PERFMON) ? 0 : -EACCES;
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +/**
>> + * panthor_perf_session_setup - Create a user-visible session.
>> + *
>> + * @ptdev: Handle to the panthor device.
>> + * @perf: Handle to the perf control structure.
>> + * @setup_args: Setup arguments passed in via ioctl.
>> + * @pfile: Panthor file associated with the request.
>> + *
>> + * Creates a new session associated with the session ID returned. When initialized, the
>> + * session must explicitly request sampling to start with a successive call to PERF_CONTROL.START.
>> + *
>> + * Return: non-negative session identifier on success or negative error code on failure.
>> + */
>> +int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
>> +		struct drm_panthor_perf_cmd_setup *setup_args,
>> +		struct panthor_file *pfile)
>> +{
>> +	struct panthor_perf_session *session;
>> +	struct drm_gem_object *ringbuffer;
>> +	struct drm_gem_object *control;
>> +	const size_t slots = setup_args->sample_slots;
>> +	struct panthor_perf_enable_masks *em;
>> +	struct iosys_map rb_map, ctrl_map;
>> +	size_t user_sample_size;
>> +	int session_id;
>> +	int ret;
>> +
>> +	ret = session_validate_set(setup_args->block_set);
>> +	if (ret) {
>> +		drm_err(&ptdev->base, "Did not meet requirements for set %d\n",
>> +				setup_args->block_set);
>> +		return ret;
>> +	}
>> +
>> +	session = kzalloc(sizeof(*session), GFP_KERNEL);
>> +	if (ZERO_OR_NULL_PTR(session))
>> +		return -ENOMEM;
>> +
>> +	ringbuffer = drm_gem_object_lookup(pfile->drm_file, setup_args->ringbuf_handle);
>> +	if (!ringbuffer) {
>> +		drm_err(&ptdev->base, "Could not find handle %d!\n", setup_args->ringbuf_handle);
>> +		ret = -EINVAL;
>> +		goto cleanup_session;
>> +	}
>> +
>> +	control = drm_gem_object_lookup(pfile->drm_file, setup_args->control_handle);
>> +	if (!control) {
>> +		drm_err(&ptdev->base, "Could not find handle %d!\n", setup_args->control_handle);
>> +		ret = -EINVAL;
>> +		goto cleanup_ringbuf;
>> +	}
>> +
>> +	user_sample_size = session_get_user_sample_size(&ptdev->perf_info) * slots;
>> +
>> +	if (ringbuffer->size != PFN_ALIGN(user_sample_size)) {
>> +		drm_err(&ptdev->base, "Incorrect ringbuffer size from userspace: user %zu vs kernel %lu\n",
>> +				ringbuffer->size, PFN_ALIGN(user_sample_size));
>> +		ret = -ENOMEM;
>> +		goto cleanup_control;
>> +	}
>> +
>> +	ret = drm_gem_vmap_unlocked(ringbuffer, &rb_map);
> 
> Same here, drm_gem_vmap_unlocked() isn't declared in any header files.
> 

Will get this one too, thanks.

>> +	if (ret)
>> +		goto cleanup_control;
>> +
>> +	ret = drm_gem_vmap_unlocked(control, &ctrl_map);
>> +	if (ret)
>> +		goto cleanup_ring_map;
>> +
>> +	session->eventfd = eventfd_ctx_fdget(setup_args->fd);
>> +	if (IS_ERR(session->eventfd)) {
>> +		drm_err(&ptdev->base, "Invalid eventfd %d!\n", setup_args->fd);
>> +		ret = PTR_ERR_OR_ZERO(session->eventfd) ?: -EINVAL;
>> +		goto cleanup_control_map;
>> +	}
>> +
>> +	em = panthor_perf_create_em(setup_args);
>> +	if (IS_ERR_OR_NULL(em)) {
>> +		ret = -ENOMEM;
>> +		goto cleanup_eventfd;
>> +	}
>> +
>> +	INIT_LIST_HEAD(&session->sessions);
>> +	INIT_LIST_HEAD(&session->pending);
>> +
>> +	session->control = ctrl_map.vaddr;
>> +	*session->control = (struct drm_panthor_perf_ringbuf_control) { 0 };
>> +
>> +	session->samples = rb_map.vaddr;
>> +
>> +	/* TODO This will need validation when we support periodic sampling sessions */
>> +	if (setup_args->sample_freq_ns) {
>> +		ret = -EOPNOTSUPP;
>> +		goto cleanup_em;
>> +	}
>> +
>> +	ret = xa_alloc_cyclic(&perf->sessions, &session_id, session, perf->session_range,
>> +			&perf->next_session, GFP_KERNEL);
>> +	if (ret < 0) {
>> +		drm_err(&ptdev->base, "System session limit exceeded.\n");
>> +		ret = -EBUSY;
>> +		goto cleanup_em;
>> +	}
>> +
>> +	kref_init(&session->ref);
>> +	session->enabled_counters = em;
>> +
>> +	session->sample_freq_ns = setup_args->sample_freq_ns;
>> +	session->user_sample_size = user_sample_size;
>> +	session->ring_buf = ringbuffer;
>> +	session->ringbuf_slots = slots;
>> +	session->control_buf = control;
>> +	session->pfile = pfile;
>> +	session->accum_idx = U32_MAX;
>> +
>> +	return session_id;
>> +
>> +cleanup_em:
>> +	kfree(em);
>> +
>> +cleanup_eventfd:
>> +	eventfd_ctx_put(session->eventfd);
>> +
>> +cleanup_control_map:
>> +	drm_gem_vunmap_unlocked(control, &ctrl_map);
>> +
>> +cleanup_ring_map:
>> +	drm_gem_vunmap_unlocked(ringbuffer, &rb_map);
>> +
>> +cleanup_control:
>> +	drm_gem_object_put(control);
>> +
>> +cleanup_ringbuf:
>> +	drm_gem_object_put(ringbuffer);
>> +
>> +cleanup_session:
>> +	kfree(session);
>> +
>> +	return ret;
>> +}
>> +
>> +static int session_stop(struct panthor_perf *perf, struct panthor_perf_session *session,
>> +		u64 user_data)
>> +{
>> +	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
>> +		return 0;
>> +
>> +	const u64 extract_idx = session_read_extract_idx(session);
>> +	const u64 insert_idx = session_read_insert_idx(session);
>> +
>> +	/* Must have at least one slot remaining in the ringbuffer to sample. */
>> +	if (WARN_ON_ONCE(!CIRC_SPACE_TO_END(insert_idx, extract_idx, session->ringbuf_slots)))
>> +		return -EBUSY;
>> +
>> +	session->user_data = user_data;
>> +
>> +	clear_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state);
>> +
>> +	/* TODO Calls to the FW interface will go here in later patches. */
>> +	return 0;
>> +}
>> +
>> +static int session_start(struct panthor_perf *perf, struct panthor_perf_session *session,
>> +		u64 user_data)
>> +{
>> +	if (test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
>> +		return 0;
>> +
>> +	set_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state);
>> +
>> +	/*
>> +	 * For manual sampling sessions, a start command does not correspond to a sample,
>> +	 * and so the user data gets discarded.
>> +	 */
>> +	if (session->sample_freq_ns)
>> +		session->user_data = user_data;
>> +
>> +	/* TODO Calls to the FW interface will go here in later patches. */
>> +	return 0;
>> +}
>> +
>> +static int session_sample(struct panthor_perf *perf, struct panthor_perf_session *session,
>> +		u64 user_data)
>> +{
>> +	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
>> +		return 0;
>> +
>> +	const u64 extract_idx = session_read_extract_idx(session);
>> +	const u64 insert_idx = session_read_insert_idx(session);
>> +
>> +	/* Manual sampling for periodic sessions is forbidden. */
>> +	if (session->sample_freq_ns)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * Must have at least two slots remaining in the ringbuffer to sample: one for
>> +	 * the current sample, and one for a stop sample, since a stop command should
>> +	 * always be acknowledged by taking a final sample and stopping the session.
>> +	 */
>> +	if (CIRC_SPACE_TO_END(insert_idx, extract_idx, session->ringbuf_slots) < 2)
>> +		return -EBUSY;
>> +
>> +	session->sample_start_ns = ktime_get_raw_ns();
>> +	session->user_data = user_data;
>> +
>> +	return 0;
>> +}
>> +
>> +static int session_destroy(struct panthor_perf *perf, struct panthor_perf_session *session)
>> +{
>> +	session_put(session);
>> +
>> +	return 0;
>> +}
>> +
>> +static int session_teardown(struct panthor_perf *perf, struct panthor_perf_session *session)
>> +{
>> +	if (test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
>> +		return -EINVAL;
>> +
>> +	if (READ_ONCE(session->pending_sample_request) == SAMPLE_TYPE_NONE)
>> +		return -EBUSY;
>> +
>> +	return session_destroy(perf, session);
>> +}
>> +
>> +/**
>> + * panthor_perf_session_teardown - Teardown the session associated with the @sid.
>> + * @pfile: Open panthor file.
>> + * @perf: Handle to the perf control structure.
>> + * @sid: Session identifier.
>> + *
>> + * Destroys a stopped session where the last sample has been explicitly consumed
>> + * or discarded. Active sessions will be ignored.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf, u32 sid)
>> +{
>> +	int err;
>> +	struct panthor_perf_session *session;
>> +
>> +	xa_lock(&perf->sessions);
>> +	session = __xa_store(&perf->sessions, sid, NULL, GFP_KERNEL);
>> +
>> +	if (xa_is_err(session)) {
>> +		err = xa_err(session);
>> +		goto restore;
>> +	}
>> +
>> +	if (session->pfile != pfile) {
>> +		err = -EINVAL;
>> +		goto restore;
>> +	}
>> +
>> +	session_get(session);
>> +	xa_unlock(&perf->sessions);
>> +
>> +	err = session_teardown(perf, session);
>> +
>> +	session_put(session);
>> +
>> +	return err;
>> +
>> +restore:
>> +	__xa_store(&perf->sessions, sid, session, GFP_KERNEL);
>> +	xa_unlock(&perf->sessions);
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * panthor_perf_session_start - Start sampling on a stopped session.
>> + * @pfile: Open panthor file.
>> + * @perf: Handle to the panthor perf control structure.
>> + * @sid: Session identifier for the desired session.
>> + * @user_data: An opaque value passed in from userspace.
>> + *
>> + * A session counts as stopped when it is created or when it is explicitly stopped after being
>> + * started. Starting an active session is treated as a no-op.
>> + *
>> + * The @user_data parameter will be associated with all subsequent samples for a periodic
>> + * sampling session and will be ignored for manual sampling ones in favor of the user data
>> + * passed in the PERF_CONTROL.SAMPLE ioctl call.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
>> +		u32 sid, u64 user_data)
>> +{
>> +	struct panthor_perf_session *session = session_find(pfile, perf, sid);
>> +	int err;
>> +
>> +	if (IS_ERR_OR_NULL(session))
>> +		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
>> +
>> +	err = session_start(perf, session, user_data);
>> +
>> +	session_put(session);
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * panthor_perf_session_stop - Stop sampling on an active session.
>> + * @pfile: Open panthor file.
>> + * @perf: Handle to the panthor perf control structure.
>> + * @sid: Session identifier for the desired session.
>> + * @user_data: An opaque value passed in from userspace.
>> + *
>> + * A session counts as active when it has been explicitly started via the PERF_CONTROL.START
>> + * ioctl. Stopping a stopped session is treated as a no-op.
>> + *
>> + * To ensure data is not lost when sampling is stopping, there must always be at least one slot
>> + * available for the final automatic sample, and the stop command will be rejected if there is not.
>> + *
>> + * The @user_data will always be associated with the final sample.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
>> +		u32 sid, u64 user_data)
>> +{
>> +	struct panthor_perf_session *session = session_find(pfile, perf, sid);
>> +	int err;
>> +
>> +	if (IS_ERR_OR_NULL(session))
>> +		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
>> +
>> +	err = session_stop(perf, session, user_data);
>> +
>> +	session_put(session);
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * panthor_perf_session_sample - Request a sample on a manual sampling session.
>> + * @pfile: Open panthor file.
>> + * @perf: Handle to the panthor perf control structure.
>> + * @sid: Session identifier for the desired session.
>> + * @user_data: An opaque value passed in from userspace.
>> + *
>> + * Only an active manual sampler is permitted to request samples directly. Failing to meet either
>> + * of these conditions will cause the sampling request to be rejected. Requesting a manual sample
>> + * with a full ringbuffer will see the request being rejected.
>> + *
>> + * The @user_data will always be unambiguously associated one-to-one with the resultant sample.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
>> +		u32 sid, u64 user_data)
>> +{
>> +	struct panthor_perf_session *session = session_find(pfile, perf, sid);
>> +	int err;
>> +
>> +	if (IS_ERR_OR_NULL(session))
>> +		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
>> +
>> +	err = session_sample(perf, session, user_data);
>> +
>> +	session_put(session);
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * panthor_perf_session_destroy - Destroy a sampling session associated with the @pfile.
>> + * @perf: Handle to the panthor perf control structure.
>> + * @pfile: The file being closed.
>> + *
>> + * Must be called when the corresponding userspace process is destroyed and cannot close its
>> + * own sessions. As such, we offer no guarantees about data delivery.
>> + */
>> +void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf)
>> +{
>> +	unsigned long sid;
>> +	struct panthor_perf_session *session;
>> +
>> +	if (!pfile || !perf)
>> +		return;
>> +
>> +	xa_for_each(&perf->sessions, sid, session)
>> +	{
>> +		if (session->pfile == pfile) {
>> +			session_destroy(perf, session);
>> +			xa_erase(&perf->sessions, sid);
>> +		}
>> +	}
>> +}
>> +
>>  /**
>>   * panthor_perf_unplug - Terminate the performance counter subsystem.
>>   * @ptdev: Panthor device.
>> @@ -124,8 +810,14 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
>>  		return;
>>
>>  	if (!xa_empty(&perf->sessions)) {
>> +		unsigned long sid;
>> +		struct panthor_perf_session *session;
>> +
>>  		drm_err(&ptdev->base,
>>  			"Performance counter sessions active when unplugging the driver!");
>> +
>> +		xa_for_each(&perf->sessions, sid, session)
>> +			session_destroy(perf, session);
>>  	}
>>
>>  	xa_destroy(&perf->sessions);
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
>> index e4805727b9e7..89d61cd1f017 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.h
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
>> @@ -7,10 +7,26 @@
>>
>>  #include <linux/types.h>
>>
>> +struct drm_panthor_perf_cmd_setup;
>>  struct panthor_device;
>> +struct panthor_file;
>> +struct panthor_perf;
>>
>>  int panthor_perf_init(struct panthor_device *ptdev);
>>  void panthor_perf_unplug(struct panthor_device *ptdev);
>>
>> +int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
>> +		struct drm_panthor_perf_cmd_setup *setup_args,
>> +		struct panthor_file *pfile);
>> +int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf,
>> +		u32 sid);
>> +int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
>> +		u32 sid, u64 user_data);
>> +int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
>> +		u32 sid, u64 user_data);
>> +int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
>> +		u32 sid, u64 user_data);
>> +void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf);
>> +
>>  #endif /* __PANTHOR_PERF_H__ */
>>
>> --
>> 2.33.0.dirty
> 
> 
> Adrian Larumbe

[0]: https://lore.kernel.org/dri-devel/20250322212608.40511-2-dmitry.osipenko@collabora.com/

