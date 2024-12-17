Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F889F470A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 10:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969E810E88A;
	Tue, 17 Dec 2024 09:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Z6Gnml0N";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Z6Gnml0N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2614::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E8710E212;
 Tue, 17 Dec 2024 09:14:54 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Z2ik+IkNxUJpKfV0Q//OZs6NEOwZzRxrU7UEMLH+jpwz2ERSw+5kQd1TdZbPGi+xFdYBYprPRVX9g8zgemDZ9gRNPbeAAlbEDrSr5X9pcBrV1oSKMtbWBHBTYMcGUOX5cBGetiRkwW2uH9ACsvn0PX3dzYgcTgm+WoBGjxCGIPvNkG6p0/Qwffj1Kl01raRFouQv6YudX+KdF04ImdHAbL2jZj7+TxoI+vbkZB0pk9lMiE8GUuCLt/XxwxUbzTNNLFB1JIzSsiM76W8Hes6BsLdcqBvia2x0/QWnrK/yIqLLB76DT2C8j16M6dV5OCzLOM4zYRGbYM/2lU0U75kvbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqMo8vthjX3/BuzK9K7QeA8Ca6xalOYHiwNRe04Ol28=;
 b=HpkVWLs2psl4RxC0A4Vy4RD6G4PJeMgdab/CkopLdAyIIk8jN3kK2p/KMKXz5Pmx1J+YQhi+5POhvTdFYzu5SQv1cd0sLNZwvl2bFD/NQa8avlDLTrv7VW+PuacmVOVBhG2ZtMU1pOIrubhJgtEt/Miy1k7t74QmW3FTW/NcdtIWEo0bewqfrvtP/8NFgobyZhEJtuCIfCryGl6DCThqceN6QyX49PUN6yLw0xin2AmqhKddHPcFO5gtZlcfO/23qylMhgrabrUibym06zLdFnzDNSnNqLJv1kes+XkZSIrkPqJp2wIKSDGJGIRx/aueJsy7vz9ZliKVGFav+gHCrQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqMo8vthjX3/BuzK9K7QeA8Ca6xalOYHiwNRe04Ol28=;
 b=Z6Gnml0NsKMblBmNu2lq0ZEWltUFhhGWU0KBgAtN1G8HhGmC9n6NR/07ScVex1JLcrRTBker7ubTm+84Rq837lh3M79zKd96aJo1zApdDVHc8/wkYoom8JBfFcQxxKvCNW7feRevdXeP+lvmTt5gru4o5bi6m6Er8MEA0woLFjg=
Received: from DU6P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::10)
 by DBBPR08MB10673.eurprd08.prod.outlook.com (2603:10a6:10:53d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 09:14:51 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::bb) by DU6P191CA0016.outlook.office365.com
 (2603:10a6:10:540::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Tue,
 17 Dec 2024 09:14:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Tue, 17 Dec 2024 09:14:51 +0000
Received: ("Tessian outbound 6a902d9511f9:v526");
 Tue, 17 Dec 2024 09:14:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9fe237835fa7e90d
X-TessianGatewayMetadata: 5uN44VSKiPZvnuS7YGLDJQxpJnG7Ko7WIctoEpeKwLAR5IebvLVzz3Ccxe0tZkHQeU3Uhjkl9UrnPpitTSSa+PqohrKQT4IV4rZ75/TZ0EkWgtSmVn/ZwVN7+kPy6cwcshf5a8XtVT2HHh0KgtZIKAH+UJ3bDzYRfiFnXXz1XVN8+h7xWA8Yn8dvrWH6hDKe
X-CR-MTA-TID: 64aa7808
Received: from L0c68e304951b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D2EBED92-A10C-412A-88E6-15E7659E9B31.1; 
 Tue, 17 Dec 2024 09:14:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L0c68e304951b.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 17 Dec 2024 09:14:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1g/QNbNA8zGSnxqzhX1q4ItjevTYK4eWrdMnYV+kHcgOjxCYm0hKqcl9vuq3nI6sA/8pgo89mVdyqinvHwJaWSTqew5BJOt1kaK0RhKD/T113WMafcF2vJvrcng+w4piAQqTol95wY6ZURxjT2vwXYvB3luu22qfJOr0/uJNVRpE14tb06I71A5wlSyzFbLXZgKnjkIQNsk+S83FMASzGLUAw9jan138LAAWiyZ4HqUqDXGmCocV4bWgsrR//YsM47ArQv8So2cY1vM/HCIBfEF0khmbLPzRTIfX81l4psmgs0jMkUfBlZk3OSrClmYbGrM5pNxnGen8Bs5usW7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqMo8vthjX3/BuzK9K7QeA8Ca6xalOYHiwNRe04Ol28=;
 b=fOhTGOws+tkvc8H6hWeMHVHi/VZzm6ZBlZBCoSrXHMlQ9zJ7HJPr01YmrjfZSMQGk48YoVUh2wGUsaBO49TjBFuIIKnYzD6ERHieKKK+tmFziUcUtPEEmpeCJDj5p2v9UnB7gCQtfqDELm//5RrfgsVLa9azP6G4PtzcRQ/YTQ3+2uAfROjz1W/raRMYNDtQTR84Azw0PqKA+TuY+UjjpjszM7KDxl/fQYMVpLIW/EsmEH9xy/hILkyX2mHYXgOBKeqipcliAhd9oC96Em7OFXH3L3JTc0hCDkMz2kGPJtITobOareuIK57qSzRnGsc5itNs5rgCVKhlGWo5h68uWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqMo8vthjX3/BuzK9K7QeA8Ca6xalOYHiwNRe04Ol28=;
 b=Z6Gnml0NsKMblBmNu2lq0ZEWltUFhhGWU0KBgAtN1G8HhGmC9n6NR/07ScVex1JLcrRTBker7ubTm+84Rq837lh3M79zKd96aJo1zApdDVHc8/wkYoom8JBfFcQxxKvCNW7feRevdXeP+lvmTt5gru4o5bi6m6Er8MEA0woLFjg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB8563.eurprd08.prod.outlook.com (2603:10a6:10:404::17)
 by DB8PR08MB5434.eurprd08.prod.outlook.com (2603:10a6:10:116::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 09:14:42 +0000
Received: from DU0PR08MB8563.eurprd08.prod.outlook.com
 ([fe80::3f5f:95b1:c5ed:1895]) by DU0PR08MB8563.eurprd08.prod.outlook.com
 ([fe80::3f5f:95b1:c5ed:1895%2]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 09:14:42 +0000
Date: Tue, 17 Dec 2024 09:14:40 +0000
From: Brian Starkey <brian.starkey@arm.com>
To: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
Message-ID: <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
X-ClientProxiedBy: LO0P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::7) To DU0PR08MB8563.eurprd08.prod.outlook.com
 (2603:10a6:10:404::17)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU0PR08MB8563:EE_|DB8PR08MB5434:EE_|DB1PEPF000509F4:EE_|DBBPR08MB10673:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be9e1d7-4c3e-4524-3307-08dd1e7b431d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?d2kwK1pqVnAya1VXVlNVdW12WDFCV0tYeTlxa05jbVR5UXpHZEg2WWJZK1F6?=
 =?utf-8?B?a213UEx3cFc5THNiRjE1TE5zeWc2Z0k4NFYwSFNacFRsUjNLVXZDUjFROGtU?=
 =?utf-8?B?Zm9ZUFkrMzBaT212b2t1bllRbC9DdzZXcEpSaWM2R1dpbGlOUkdQSmh5eThP?=
 =?utf-8?B?a0FNUm9tK1c4eDM4alQvSE96VE9NYkxWU0hnc2FvNUR5ZEIrbzlPaFVIM3JY?=
 =?utf-8?B?NHI4YkNMOXlxaXVoNXh3VXpPdllmMGI3aDZDNzI4SFJCZ3pWWmV4dHNVT29i?=
 =?utf-8?B?UlluL1Z2WU54MW45aFZWVmFzTmJqTXZ5TndJWnlDUTFkTnRxc1paT0c2aHJV?=
 =?utf-8?B?Qlo4K3ZCNlJjVy9wMythTjVyWjRpbmpXN2lJWVhRZHhCc1FLMlFSYWJPeE5w?=
 =?utf-8?B?UW8vZEZqNENqSXJUdVBPZGx1UWpBVGZRZkVxYmY0eDYwMjhDNExGQjJmM2R4?=
 =?utf-8?B?a0JnYW5LYjIzSTNjdCtDYXJmYU53Zk8xV1hNMDNNcWh6MEVwV1BhTysrd2Vi?=
 =?utf-8?B?c0lIVm5BOUJCTFQyS2ZJRUZCeFdCaTg0VlFmV1hsb2o3RTdncitvcjhhMmto?=
 =?utf-8?B?c0NSbmltUWNzSkcwWERyVlBnbVdmU1Y5ZWc4Z2M3TEU5UFZOYVlpK3N5eEtJ?=
 =?utf-8?B?bUV6NnV3OUtuN3BWNDFuaXpnejdXYnphNGRDK2R4NHpxQy9SWStQdkU2NENh?=
 =?utf-8?B?K0U5OFlzK0g4d3VFSzMzRS9jSTNNMFVYd0JUZVhuVEFiVDZmd3VsQ3Bid1RX?=
 =?utf-8?B?RjlMdjc0NWI1Y0JsRllaWkJsQW1lMVBZaXhsMFJQNEtDVy9VR2t6bytXTjVh?=
 =?utf-8?B?R242N2RJQkNHa01vUTNYZ1pqUkhiSmIzVWYySFJJNDRMYTBISlFLQnlMdmtl?=
 =?utf-8?B?eGt5U2trYzNCVUpmMVpWVXNFdTVSaHFKUlpwWU5ON0tHVVZmbkFUVGhoaDZU?=
 =?utf-8?B?ZCtrNENyOTVVVUZWaDRpcmV6SStPWGhMMitjSjV4aVZJQkw0WTNYSlh3WEdm?=
 =?utf-8?B?TWdSSEdwc0dpcFhyVTdmV3N1YmhGODBPaWZwNVI2L2pkSEg3UEJmUmdpeEs3?=
 =?utf-8?B?ZXlUb0paRDdmU1YwdUFxSVlORzVsQ2ZwdTlqZHBJMFpIdjgxdDlsck1OUDdS?=
 =?utf-8?B?WFdaZGkxYUJTdkdVUHVnekxPNnFkRDNzUzFlZGxNSWw1WEN3QzY5cjdHY2py?=
 =?utf-8?B?NHQ4b1Rnd3hFUjF6MDZ4VklINHloYUVMV0FzZklBNWp1ZU5FdnFrZk53NmhD?=
 =?utf-8?B?TS9vZ3NaVm56cnlpWHpRaDBFRmllZW56djF6ZnBPN1RlYS8zZnFsQ0xFdWNt?=
 =?utf-8?B?MjJOTE16bDA0ZEhvamllNlFrUVNkSksrQVNJYVVvY0Y0dVdNeHFEQ3gyV3Qv?=
 =?utf-8?B?dkZDNWNuM2xDNXFvUlM0Z2RISlBqTGVmdmh4T01IajNsY2FoaUw0bFFKelJi?=
 =?utf-8?B?Vmg2b3NtNFVocW5kTjZOeit5OXV3VmNuZUZmU1k5c2E4V084ckpPTUlKRitH?=
 =?utf-8?B?ZGZBQi9Kc21VVVNyTEdIRDk3NTA5YWJKOGdpSWRiVXNYd3lJR1F2SXlUQUlt?=
 =?utf-8?B?azBJWkpsQVdNYS9tRWw0Q1A3eGRydDZPSzBNZzV6bWdzdk1QSitEeTdScFlJ?=
 =?utf-8?B?QURRZy83Rmp6VUI1TXNDQVR5ZXJ2Z0Jzai9xVGplelNpZVpqMWJVK0c3WGJI?=
 =?utf-8?B?RmRscCt2OGNGYjA0VWhrazdEcXRXdTNyNWU2UUlrdHZ1USt2WThwamxCUVZP?=
 =?utf-8?B?YnNteEFlZXRIbytvcjJvRFFqQzNSMWVyT1l4QmFDMXc1RTlmR0RzWGMrSjN6?=
 =?utf-8?B?cVR4WUdrZ2o0aGJvUTBRTkN2SkYzRE04eVFUUWd4aDdrZ3BkNGYrWVBEdktz?=
 =?utf-8?Q?n5WCKFc2u0Kxk?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DU0PR08MB8563.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5434
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:404::17];
 domain=DU0PR08MB8563.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3372a35c-b423-4325-7ed3-08dd1e7b3d7e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|376014|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0I0ZGZSQjVTK0dic1pkd1JMeW41bWtoWGZreGVjMDk0WUt3alhzOGYyVGVx?=
 =?utf-8?B?bGFGK3VKOTRmS00wUUc5SlJPSjJWTVA3OXlWYkwzNVZTL0xrQ0EwUGQ2VmpG?=
 =?utf-8?B?TXNkSmswQ0pQR2xXdlRIVXlVRXMvMGtpVU56anRtbzFRaU1BNGVqRTdyMm9T?=
 =?utf-8?B?VEVub0Y2OS8xeVI5b01tV0pZeEZ5Zm5HaTZVQ09MckVjcWtQd0d2SjM2ak1o?=
 =?utf-8?B?ZU1NT2p1VGZXRlZIaHBNR2s4Z2YvcjJtRGFWVkphUU5GV1BxZmRSNlJWYVhW?=
 =?utf-8?B?WmhYam41NE9jTlVtbVNXVWpMMGszRld6NTUrM2tHbzNwUEZEemRSdXJhWm9r?=
 =?utf-8?B?TTJ1SW9Rc0h4NUszeTR5dGc4TW5XNHNVZk9XQWRJengwanQva1NWSnBmdGZs?=
 =?utf-8?B?dGt3T1duZGF0WWs2Y283MmIwZ3RBMWx1WHdpNFhiU002QURieHlORHpyRFlo?=
 =?utf-8?B?QTVaL1dmdG4vY0FyanFnMGJpY1VMS1NiM25JWHJXazBmZTdoTk9qUzU5VG1s?=
 =?utf-8?B?U2cwalh5ODdTaGlNSTJzeWg5RG1FYnpweU9wbUpxRzdCS3lzK3JHdVJBOFBQ?=
 =?utf-8?B?ZHBWZDhmZUYrejZmUm0wRGJHRFRSSUR4YWQ5MDVVd0dEWWR2OE82Sm84WXZI?=
 =?utf-8?B?a3RnZXpFY01MSWp5WjMzVmpMTkE1Yy82K1dueFpvVGpuZHhBRmNhc3RjNUI1?=
 =?utf-8?B?QnVlczB3QlNhc3pnMko4Y2k0emdCdUFTZkkwOVJ4alE0b09RZ1dZNWV3em01?=
 =?utf-8?B?UlN2eHlQeVU3eGFqUDVVT1U1czVxZHRjcjR5TEs4QWEzM05tdGhSWUdvTitZ?=
 =?utf-8?B?ekFUN1NJOC8rY2JSTVNjQ2hLQnZvUk1CNXdmUDI0VkR2R0NmTHlld1pDV296?=
 =?utf-8?B?by9GSi8rRmFkYzlGMmFOY1RSREMyZkQzaFEvcDR3U1VoMlNFRE8vRzlyYzUz?=
 =?utf-8?B?Mncwa1dNRkxlZmtQVVJlbGxCMGUyalBHZGtRWlcvczhCWWpQL29CSzhYYmhw?=
 =?utf-8?B?bVczZFAyUHA2Y1FsOHE2SkZSa3d1aEVjUkI1Z0t0MkUyeDMzQUhoK25SSTRZ?=
 =?utf-8?B?UzlEOCtMRWhTWFgxTzVDd2JNY0JtTHFpUWZNWkIvd1hXQS8yakFDaUY4UnBO?=
 =?utf-8?B?MThPWlRqOXdrbmNlTS9xRnBHU2VTc0NHVHNwQ2ErVEk3Tm1lYmdjSWNpU1Bp?=
 =?utf-8?B?NXg4dXJIeVZyemVVNmFtNUtGbUFNMis5bHlYYWdaZTZqL205eUZrQUdBdFBI?=
 =?utf-8?B?N0xQc1MzMTF5N1VmanZTTDVWUG4zNFYwUjhGTUtRVDVOSFlhV1V0ejNyOWhk?=
 =?utf-8?B?aE00S2RsRGhSNVh5eWNiNG5SRjk3Q3ZiK055c29TL3hrSVp6UG1TdzdJRVg4?=
 =?utf-8?B?Qi9LQ1BOeW1Sb0hOWjg2KytNdnZVYk80Q3pnbGx5MzJvc1ptWGtLS2tvVTVY?=
 =?utf-8?B?L3NPNmZlMDZVNHVUTTVpbHpsUXZwQ3VDcDZkT2lEdjdhazJXRU1vQ2lqbGRR?=
 =?utf-8?B?aGZnWlB2RHFkRVFJdHRZSkZYNHNMNFVMdDMzWS80YU5pRjNtamdGSzFYb2hs?=
 =?utf-8?B?ZTZnYmprTUE4OXNVdkxpcml4TWFzOE9LbWtYZ293YnpKeUJGQjhUbnBra0kz?=
 =?utf-8?B?RE8xMmlKQXpheWliZE85bVhRczlZS1JueTVuYTNHa3Z6Mi9vUXlGQy8zb1hU?=
 =?utf-8?B?SnJHelNzVEZDTm83UE5UT2RLUWhBT2tHeXVITFlBU2tuQmdtNFVSS2MrUXBV?=
 =?utf-8?B?NTlITDk0b2FZSEVXeVRWZU9Fc2ZZWnJFaGdFWmNZTjljbjg2cFB3SUlnL2dN?=
 =?utf-8?B?ajE2NVFRV3NPT3BBaXFCRU1HdVNYeVZ0UXo2NGx2Z1V4dmk3K01jeGZDT0F5?=
 =?utf-8?B?dDZDMEhhbEoreXlTellCYkc0Y2hjcUNyUzhSSzhwOUxTODdFNGx2WjAzWk1p?=
 =?utf-8?B?dC9IbE9DcUVMSlhid09QMzdLd09FaFA3NGhOZWJYL21mOWN0am5rRVhHTVlX?=
 =?utf-8?Q?ZUXoXioYI1TgpkMf5rLCujfXgmzDos=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(376014)(14060799003)(1800799024)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 09:14:51.2276 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be9e1d7-4c3e-4524-3307-08dd1e7b431d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10673
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

Hi,

On Sun, Dec 15, 2024 at 03:53:14PM +0000, Marek Olšák wrote:
> The comment explains the problem with DRM_FORMAT_MOD_LINEAR.
> 
> Signed-off-by: Marek Olšák <marek.olsak@amd.com>
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 78abd819fd62e..8ec4163429014 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -484,9 +484,27 @@ extern "C" {
>   * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in the DRM_ADDFB2
> ioctl),
>   * which tells the driver to also take driver-internal information into
> account
>   * and so might actually result in a tiled framebuffer.
> + *
> + * WARNING:
> + * There are drivers out there that expose DRM_FORMAT_MOD_LINEAR, but only
> + * support a certain pitch alignment and can't import images with this
> modifier
> + * if the pitch alignment isn't exactly the one supported. They can however
> + * allocate images with this modifier and other drivers can import them
> only
> + * if they support the same pitch alignment. Thus, DRM_FORMAT_MOD_LINEAR is
> + * fundamentically incompatible across devices and is the only modifier
> that
> + * has a chance of not working. The PITCH_ALIGN modifiers should be used
> + * instead.
>   */
>  #define DRM_FORMAT_MOD_LINEAR  fourcc_mod_code(NONE, 0)
> 
> +/* Linear layout modifiers with an explicit pitch alignment in bytes.
> + * Exposing this modifier requires that the pitch alignment is exactly
> + * the number in the definition.
> + */
> +#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_code(NONE, 1)

Why do we want this to be a modifier? All (?) of the other modifiers
describe properties which the producer and consumer need to know in
order to correctly fill/interpret the data.

Framebuffers already have a pitch property which tells the
producer/consumer how to do that for linear buffers.

Modifiers are meant to describe framebuffers, and this pitch alignment
requirement isn't really a framebuffer property - it's a device
constraint. It feels out of place to overload modifiers with it.

I'm not saying we don't need a way to describe constraints to
allocators, but I question if modifiers the right mechanism to
communicate them?

Cheers,
-Brian
