Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AB3C0E465
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 15:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFB810E11C;
	Mon, 27 Oct 2025 14:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="DS29N8yc";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DS29N8yc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013055.outbound.protection.outlook.com
 [52.101.83.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D8410E11C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 14:12:48 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=azbq5CUtYpi28wMH6GUmUJW9fDsRCYJJt7iCA2fMw/070X5YSCQQF5jjbNO7oxaE5iyG9TrU0IB/36qht3NZFvSzAI1xaNXQfj4+ww2iaEKzrj+6L+WtzVEPJbM0Qb9Hazv3vARnRaN8L5Tfb4q3ZgZez+OTKlHLolJYG8hM2mxIcBJJ61TNbQeF3b92svfsspwQS8It7VW2D7BX3z0d5xuXZ/JrxtPG8xqHm4/Po1+9tl/1ERqsFPL8Bsh3ezRaUwyHlqlZtERoCKvkgtvZxyk4c36iIMilnJK78gGGdQ3fpi40G+ZDtIy5ugCNnacoBooRvFrZrP/ON+Q5Y0fjCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dI8lW5PhjrOK+C0ls87+RKGis/VV1TWKOsgo2ejRz1g=;
 b=p2OSeRTzgg7EsGfhSoG446AMxueSxd9S/jiL5mk/Z6QNiM/hg0JpQSsuViXXIdRCkNxfLswzAeJvy1SxSxeyxuO7/tLEQIjvP/2Rd9HCx+e9ROzMV7qWBf1RtWFQ0wSF80UDFD8O3D7xV8u0nNRlbRKPJ667QbFiWNV9eT8/R56Tdc3RBA1qb6Nw9DoE2EvHBI1bkuZ64mUZtOY0Tpfi+SdarE0lICQg5K2IzHfzax9brnNQmaNBvnsBZ4lIsu/1dKKMxVDST6acSi8ZUMM9gXpLlDARRv3tE3ojQcMbr7eL0Jhmw2W6r0OPqhFAiTJ5RmllVWQrnL/7VfaogyZCDA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dI8lW5PhjrOK+C0ls87+RKGis/VV1TWKOsgo2ejRz1g=;
 b=DS29N8ycvVpym6jptWJt1hSS9RBqqAxnapQ/PQywDyVH/KhFYGeX6+qhPjXgW8eUMuFlYjk0PYRIfwM2dt24ORMHPQLtib90NPBjM6Gy0X+WnPWMRPQUXd1i+lJ022eKHQxWElYa3QplIBBEVcvNiz6QSJMdgMZeXDr9JrXlMRA=
Received: from AM0PR03CA0047.eurprd03.prod.outlook.com (2603:10a6:208::24) by
 DU0PR08MB8304.eurprd08.prod.outlook.com (2603:10a6:10:40c::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.18; Mon, 27 Oct 2025 14:12:40 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:208:0:cafe::ba) by AM0PR03CA0047.outlook.office365.com
 (2603:10a6:208::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 14:12:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 14:12:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXdgcGp1Ltko/vtR6ci/Jy9vfz74V9CqWNbc67VSDgT6FjJ+8h7jlvCPwSNT7OEvg4XlNwckkSfAHgFHy8wzxs5kHvCTC6CVSB3UfTkXzfZEDuU7SYJ5n3NliqdQ+SrarjM/jbuc3Kgj2spOs6jVDqn+VIVWhd6ICjTpNICUHjoQSQ5kq5PtTplrXLOsckZe5GvwGH1OGm5IyFiz66kemcOabcTtwOPH9ult7gBL2eF4dr/L7veLyi8o+AzvmUTL1e+Cel8JCXbv59RKkfgESfgQYx8Ta2QHivFLb+5D/S15vMbpV0CVZ5grdRIUrC6yCWGUga870WlKyd73M+42Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dI8lW5PhjrOK+C0ls87+RKGis/VV1TWKOsgo2ejRz1g=;
 b=q7OUcue0UeXdUSE7lRLVdrStgejfafRGuNIRP7rogbP6MBbXiezP8YIpnssxk22rNkj8Nnb2wyvux1JGen299mv1ueZmAknU/gU2s2X9q2C/ckvWElE7fdNnOgPwPFj2CT8MfvzVYDKZ8/GAkXE6APGiG0h5ICUozhuu2K6suz/GEqvpqR/lj/f/OzO2CdUn4YGpL6dB0dw0KZcMt1M9fnHqbRqjevwDv7CkqO4TaYqumJKgK0l55d/qJLYGdDvGxlMf1s9/i0A8YTSo4xLOftxuCS+5ubENxsqlT/svCdXpCUDc1W6fxnUBEr1iRFaq+cgZ03U/11pNqkq/wBZSfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dI8lW5PhjrOK+C0ls87+RKGis/VV1TWKOsgo2ejRz1g=;
 b=DS29N8ycvVpym6jptWJt1hSS9RBqqAxnapQ/PQywDyVH/KhFYGeX6+qhPjXgW8eUMuFlYjk0PYRIfwM2dt24ORMHPQLtib90NPBjM6Gy0X+WnPWMRPQUXd1i+lJ022eKHQxWElYa3QplIBBEVcvNiz6QSJMdgMZeXDr9JrXlMRA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB9767.eurprd08.prod.outlook.com
 (2603:10a6:20b:614::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 14:12:06 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 14:12:05 +0000
Message-ID: <c0c6e250-e5fc-4511-bb5b-9812495a1e59@arm.com>
Date: Mon, 27 Oct 2025 14:12:03 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] drm/panthor: Introduce panthor_pwr API and power
 control framework
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251024202117.3241292-1-karunika.choo@arm.com>
 <20251024202117.3241292-4-karunika.choo@arm.com>
 <20251026091310.4046f061@fedora>
 <4cea5fa2-83da-4620-aa4a-97a6378f62f8@arm.com>
 <20251027123645.7f3879ba@fedora>
In-Reply-To: <20251027123645.7f3879ba@fedora>
From: Karunika Choo <karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0543.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::15) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB9767:EE_|AMS0EPF000001B2:EE_|DU0PR08MB8304:EE_
X-MS-Office365-Filtering-Correlation-Id: e18599bb-162d-41ff-4dc1-08de1562e2c4
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?b3JPVGNiQXJDdjFyWjFSM0ZpUExSdVk3a0dQbGREQ21KWXlldzgvcFRKcTlH?=
 =?utf-8?B?S040SGFnUU5ZMmgvMUZaa1FYb3NVN083N0xXNE9FVDVXU2FWTzJrMGJwbmZZ?=
 =?utf-8?B?N1htRE9PZzhnUmJmT3k2MEVqbDVaT1N5MzUrZzhyanlxMEs3Z3V0VWZDWFdT?=
 =?utf-8?B?YTFXSHdIdWljeW9zY0hud1ZlVnM3NlYveTJYRzVhQjR0S2tlL0x6QjdSMlZu?=
 =?utf-8?B?dFJOVWdlSVRZS1FQWXkzVXFLQlRGME5BNDhjTkhCMDNWTW00WFM1alF3cWYw?=
 =?utf-8?B?QUdtUkw3ak85Q0kxOW1uZXIvWWszVEdBL0JLOERYUlVBdHB5SmNTVStRalFt?=
 =?utf-8?B?K1VyaVMwd2JOQWlVcFpPcHZRZlBOOU9PMUpKVnQvMFJFZU9WY21IWk9uQm9O?=
 =?utf-8?B?TGFoVU1kZjEvY3Nlak1GN2VBSDMxSkRpdG9LOVV4ODY1M0ZjOTNHQ1RwRk9W?=
 =?utf-8?B?cDJ5T29zRnlzY3FaUUhkWVFKTC9sTjIzbWlhalBpbEVnMVRkRjkxbHFBaGln?=
 =?utf-8?B?SkRUaktXK1pyZ1BGTXdtc2M3K2dDNUFIbUhFOWNlVWs1dmxtWWZuVFRjWlho?=
 =?utf-8?B?M1lkZDk4Ym13bS8zbnByUGlkSW9kL09nWjQxRjB1TUNucUJFTkQzUFVCWith?=
 =?utf-8?B?T0ZzcUlEUzJIUmkyUkYwcUVXaFlWbWlnNE9kV3lqcTAycUg5MGJPeXRrV2Fx?=
 =?utf-8?B?T2ZEWjA1M29yVlJzR2F1ZzNjNnVJQklzRDF3aWtKYitaQS9QaEpUZXpEL2lD?=
 =?utf-8?B?SDAxaUFSV3FhSjA2bWgzZGpGN092SnNKbnN3eU5yaGhYSUdxRGtZb3N4VDI0?=
 =?utf-8?B?RmhYQ3BYdEdWamhySVNPRDFVeHFuby8rNDBHanVjNWFDKytYbUlLa0hkOHN6?=
 =?utf-8?B?ZFYrV3FwTFI1dkswc3BoWGN4Y2tDZHl4RitycGFXVVpKcVZCMmZGNUhFbk1P?=
 =?utf-8?B?YjJheHAwRU5kMXBCYmtZVXdKRlJpa0tLMnI1aXVXSjYyWWpIWWFhTWpZNXpX?=
 =?utf-8?B?SmJJWTAzYzV6dy9reFQyUGI3QWVtNG5tNzY5VmlXR0xJRGpUeDZURG16T296?=
 =?utf-8?B?UUtuZWFSRmo0SXNWaWlrOGdGVjlKazM2ekpqc1cyVjRtbnFhZUM2MzRmM0tS?=
 =?utf-8?B?RkFWOFRqNVVENUJRUTZnL0JabEUwMGpJS3l6R2ZKRVF0R3JuTUcxVk1QOXYy?=
 =?utf-8?B?VW5MRjJZc3NkVkwvODI1ampTSzQzbWdoRmYyV1NYMFdFd0llY3FXejNZdGd6?=
 =?utf-8?B?NGJTM21obzN6b2ZzZzFxUy9wbkVWUUNYNi8yOUR1c2diMmRuajVKdFZvN0hm?=
 =?utf-8?B?RHBuZ0RrRFY5K3BtcU1aa0dFZjBqb2gzUmcyS25YUDJCeXRqeHoyUW40Z0sy?=
 =?utf-8?B?RFNSYk5ZRllGaHRjM3l0VE5panlFM25Wblg5RmhGSlhxcFl5dE9wdHY2VEZs?=
 =?utf-8?B?cG5lY05wZzZBdTBPV3BZajJqR1JyN0VYVHdEZHdQaWUwVnlRcUZJbTlqWWNi?=
 =?utf-8?B?NkpKZjU0VTlrcTBWR1h1MTREVG5zR3ZRSlFSUTNTOWlZa1k3V0hrRUVNWEhC?=
 =?utf-8?B?SHFsL0JJTkxCaVpxcVh1TXByY1FYblkrSXRmVzF6UGVPYldwVE9JT2d3MmVt?=
 =?utf-8?B?MFd5dXhzaVNSVitiVnZxYmRWSUxTY2tJL0pqdjZjNW54c2lwRlBYRmU4Zzly?=
 =?utf-8?B?ZWJFUERBeXEzUE5NSWtZWDFlSkp3MHdwbWlLVXl6QUlMR3AzVUMrTmswWmdE?=
 =?utf-8?B?ZU9WYWQzdW55dzI5QzMzYmxhR3RFcXdTL3dtdlVHL3VjTmpNMFFyZkhmaGEv?=
 =?utf-8?B?OVRwUWE5dmUyM2hvaS9Dd0s4b2t3dzMxM2VUNlcvTDRVYUp2dFJqN1E3ZUJH?=
 =?utf-8?B?VXVST0VzbnJVL3FjYWdoQjUwWHc0MDk4M1lKYTZDeHhMK1NLMzUyOG5JS0gx?=
 =?utf-8?Q?9cPgUppyJMe5bUBKLfp3db8Yh1VfoEcU?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9767
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d578b4cd-ec3c-47ec-474f-08de1562ced5
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|36860700013|1800799024|376014|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzZIMU4wQXd6eWkvbmdDYmUxSWRlSU5ETFBtMU0wb1BacXhYSzl2YVV6ZndK?=
 =?utf-8?B?RElmeVd2RWF2SnFLVTVmMDFDR0JnZzFsUm9JNHB2d1p2ZXZQWXV4ek5TODFy?=
 =?utf-8?B?ZnNFY1M1RzFCN1Z1cDRub3A1M2d2bkdqS09zQ2Nob05nQUxxNUJhU1QzZVAz?=
 =?utf-8?B?cXF6RjlHMkx2Q1Jyb01KaDFsQmoxMHdmbiswUmw2UFFOVVNiWkdyZzBuRmFI?=
 =?utf-8?B?b3pBM0w3dWpGWWhVcU80NTRnSUhVckJaVkR4US82VXZRdlZQY2hjRWxzd3k0?=
 =?utf-8?B?d3Z2ZG44YW5uMVdtQlkxdEJ5S3pWendURERHaWFZSGU3TFJzN3psUysyYTFN?=
 =?utf-8?B?azEyM1JsR2pUL1JtNVZIWnh3M1ZldnpqZlpReWJMODFiaXJpNEF3Y0ZORHJE?=
 =?utf-8?B?eGcyeXZaODNpK2p3c3ZLNm8rSVdlUmE2bGpWQUp6K1p1S3RMQytYUjRWVGdE?=
 =?utf-8?B?Y2ZjWUpCV2NMUUxjWndWbW45Mkl4QzlJL1JzMDlibzhHUTN2bm5CTlpBRk1T?=
 =?utf-8?B?NVFuWllnQlZGd2ZsaDNRWkdZcnhIdy9FcUxOOVptZlUyQzRRc20ya1QrQUxh?=
 =?utf-8?B?cVBnWjFhNDVHRENYYTU5Rkh4UVZudjNCN01SeVN5bFJWZjIvbExielVHNlVm?=
 =?utf-8?B?d0tRd3VoREtVQnlMNktXczJ4eG42YlEwWWw3elBRTmNqTDc4QWJJS3hXTmZi?=
 =?utf-8?B?MExsSlZCZ3p1SGNZdWx6dVBXR1IvNC9WWU9UU0d3cWVQdE80NzVLcW5DVWZh?=
 =?utf-8?B?cmxKTVFKNFlOazJYR0RKNEIwckZvbkY4UU5BYVhIVVk4VzNNMEU0L1VaT0Nw?=
 =?utf-8?B?VXBWUU1XQ1VnVHp6SWhvOFlIaTEzMU5FbFVUQ3NjWFF0TkcvZW9PTG8zejlm?=
 =?utf-8?B?VWFscHBlSXBMQkxZd3RTajZlTnl5czNOb3ZNWjR4OUNpQXNCV29hdkJmaEt5?=
 =?utf-8?B?ck1GQ2hwSEtaQmFpdW1wTE5TMTU3cjd3Mm90ZTIrR0tWbkM2aVBJenR6eHZQ?=
 =?utf-8?B?Q21Rc1Fuc2xPekhuS1ZKcnkyRndWSVhMQnNCY0RFZkQ4YjkyTzBIdzFJSkVh?=
 =?utf-8?B?ZVR3TytkWnpLWlhjSjd2N0ppTlpSeDNGSDNHTGpRZ2p4ZkZoWmRRZmJqMGFE?=
 =?utf-8?B?TjcxUUFpVk94TWFFZnZPK2QyRDRnYnBMVXZudVV5Tlh6ZnhIUDlHS3ltUFZI?=
 =?utf-8?B?K3E4Wk1Xczgwd1ZmYnFBaG5WSkoyeTgremthNVVOdklRTlRGQ1MxanhreHR2?=
 =?utf-8?B?L0V6MHlyTnpFTFRNK3llSWtvSnVydTJIclkzTW15bnVOazZ4YzdHU0p4SWNZ?=
 =?utf-8?B?Rm9hZGlhS1ZjWWpqMitSRnArZXlKRHdwRkRNcHlJcDRSUHl6QWpFNkRORGl5?=
 =?utf-8?B?WTVtZytjRml1aXJ0QUh0UWZiRzFJWlI3ZExhMVl2VjdWd0tEMHJwdUZ1YmZU?=
 =?utf-8?B?bnlZRWNkbTRlMVVaSHBzRkxNUC96RlpVeEpHR3RmVzJlSW0rZTJYYnZQck42?=
 =?utf-8?B?MHJUS1hLdC90OVJXYWplMVVUQkZuSzhpRElGUHFXejlPdU5mM0IzSTdRSUI3?=
 =?utf-8?B?NHBrU1hVT3J6TUNuTmU5d3N6WEZldUJ6MG1ramgvcUZ5RVgwcjhscmdPSlVi?=
 =?utf-8?B?cVYxOGlpaXlMaFhTN3lBdy9IQzV5eTlGY1RsY2d2TUFNRWV4dFc3TkF5eFls?=
 =?utf-8?B?WXBGd0tiVUF5ZG9FVSsyTE95bStFblNKTjQyOFdPamRzWXpWUVprYjBkNWcv?=
 =?utf-8?B?bVRVMkFUUXpWc25yQ0hFQ1IrQlAvWVZJNjlGVmhjTCtJYVk4eFR3RVBnU2hR?=
 =?utf-8?B?WmlUOE9BNlFQRGsxNEJ5SUcwMDhPTEFRbERmWjhGWWw5SEE1WCtWbDFpSnFs?=
 =?utf-8?B?NGh0aEppL0RaYkEzbTFQSWI2NUJCaVFzYjNTZnlOM0gvMGd1Tnh3S0xVTG96?=
 =?utf-8?B?WlU1QkRmODRSSTJ2THl0SkdmaTVXYzlVdzhxTld0QTViZXZ1dlltYlhGMUxN?=
 =?utf-8?B?NnM3SHpXc2hIcU92b2U1U0dTOStoM1JDelhPT050cVhNUTJPK0p1a21QWEFi?=
 =?utf-8?B?YkxqSG9aNGd5Z01oVkxpYldJVDM4UVM1WkRwaHBsc1R4OE5CYjI3MXhzTUk1?=
 =?utf-8?Q?7lPc=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(36860700013)(1800799024)(376014)(14060799003)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 14:12:38.7788 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e18599bb-162d-41ff-4dc1-08de1562e2c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8304
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

On 27/10/2025 11:36, Boris Brezillon wrote:
> On Mon, 27 Oct 2025 10:36:13 +0000
> Karunika Choo <karunika.choo@arm.com> wrote:
> 
>> On 26/10/2025 08:13, Boris Brezillon wrote:
>>> On Fri, 24 Oct 2025 21:21:12 +0100
>>> Karunika Choo <karunika.choo@arm.com> wrote:  
>>>> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
>>>> index 092962db5ccd..09aef34a6ce7 100644
>>>> --- a/drivers/gpu/drm/panthor/panthor_hw.c
>>>> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
>>>> @@ -192,3 +192,8 @@ int panthor_hw_init(struct panthor_device *ptdev)
>>>>
>>>>  	return 0;
>>>>  }
>>>> +
>>>> +bool panthor_hw_has_pwr_ctrl(struct panthor_device *ptdev)
>>>> +{
>>>> +	return GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) >= 14;
>>>> +}
>>>> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
>>>> index 2665d6dde2e3..4c71f27d1c0b 100644
>>>> --- a/drivers/gpu/drm/panthor/panthor_hw.h
>>>> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
>>>> @@ -32,4 +32,6 @@ struct panthor_hw {
>>>>
>>>>  int panthor_hw_init(struct panthor_device *ptdev);
>>>>
>>>> +bool panthor_hw_has_pwr_ctrl(struct panthor_device *ptdev);  
>>>
>>> Let's make this a static inline function so the compiler can inline its
>>> content at compile time.
>>>   
>>
>> I wonder if making it static inline is a good idea. We will need to move
>> this function into panthor_device.h to be able to do so as we need to
>> access the panthor_device structure. Would this still be desirable?
> 
> Can't we just include panthor_device.h from panthor_hw.h instead? As
> far as I can tell, panthor_device.h doesn't include panthor_hw.h, so we
> should be fine.

v2 changed this, but let me see if I can rework these to enable both
your's and Steve's suggestions.

Kind regards,
Karunika Choo
