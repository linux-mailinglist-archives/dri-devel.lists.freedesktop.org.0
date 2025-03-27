Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAB9A72BD1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 09:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F06010E88D;
	Thu, 27 Mar 2025 08:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="lqbYXzlI";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lqbYXzlI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013067.outbound.protection.outlook.com
 [40.107.162.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAEC10E888
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 08:53:43 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YG0pQyW43azghsuzkPoLRqzWe5qbMFisAsE8ibUIAZWS/7RWaoYtfmZFnx8XXbk7/DBXYZ4FTav5YhdiPJuR/1KE9CSxyMKmKcD3dwh5g5jelE1eXch+eADUD24F4tj6JuFBSC/rQVQJ6cC15aYslgaPw0ug7DP8FiP8jlxBXdw5sGHh7NJZFB5RFFvX8qfJ2PzwmY0kq4raYU51YZruGbmfo+6oYT1LKjORLVFkhSQRc/veUqJixPw0Q8ZDDqdQnRTYTp93ARSQckYoUk9xPINTPwKOJA56eKYKvewvIXITioCAbrUSKIYZe9f8hb0qG8RFikVa1hpL46LSrufcdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlH2GVBrgTn8BobsXrer5fcA/PGE2HZzpNd2uHXQZHM=;
 b=gsGTI9sLYoEzlTvmuEKjFUh07GYDzsTjHzqXS1SAGOHP7ydfk8n8MP2h69nVBAU3BxRFMAyn7yJC6fP4CFcLiHoM6hQnA88vntykO/5c/Al0tRm9a6O6j9MVhQyV+M6FhvW5Fm4gWBQyvquRtbUSO+zxdOjpnUfx3ODSgC3OmTF3xgYt3GyNBFAnrNPcB/UJjbmoX0mtXgS4BFCHC9Iyk9uAn8verN1tM+GAymLKlwaHk209HGpXO+bx0hNamWg9Z4lraTcvpwnxnAfNfpGc5gCfHIxiQ1zHhQpEDybQgkEJOtLBp+GvCVrIOHQz77Tq+NPNSKMctDhrKIyR3QicqQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlH2GVBrgTn8BobsXrer5fcA/PGE2HZzpNd2uHXQZHM=;
 b=lqbYXzlI3j4jnIdEBFviiAADQCKeAS9nWonKZ4LMVctr8ENra+x/bsolV38qPLCLqXGWzeV+TOezQ9dq9wmKIXlWMvoUNr6zVB8ekHFY9mCYz5GGfkABwetY6c5Jxh8jmUCVNwia5G8gz5t9LS6yxPfJZzJPc4srOGDJMXPbHIw=
Received: from DU2PR04CA0304.eurprd04.prod.outlook.com (2603:10a6:10:2b5::9)
 by AM9PR08MB5939.eurprd08.prod.outlook.com (2603:10a6:20b:2d9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Thu, 27 Mar
 2025 08:53:40 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::84) by DU2PR04CA0304.outlook.office365.com
 (2603:10a6:10:2b5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Thu,
 27 Mar 2025 08:53:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 27 Mar 2025 08:53:39 +0000
Received: ("Tessian outbound 93207444acda:v604");
 Thu, 27 Mar 2025 08:53:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 28110edf247a72fa
X-TessianGatewayMetadata: I7MfKs9aBHDk4ksZ89uUXxfgX/hFiBZz5yoOcD1z+eSrDQhAewDpS1yQrwN7rPO78hxfMkTWFvXngtBTVlAXL4vwadXrkMpxwu7Mstw9UNPfOPjL8rkBKi/YZjkcGKXihkYNQDsAO/W+AwMJ4ZsK3B6fIXlhVoIvJK7Wne1IseY=
X-CR-MTA-TID: 64aa7808
Received: from L4b5002fd6ab1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 40600D80-F565-4C43-8685-B8D563B1E31D.1; 
 Thu, 27 Mar 2025 08:53:28 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L4b5002fd6ab1.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Mar 2025 08:53:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NeQKMLiAnNpzypmLM/stpY2+dT2fs0e8WL2VFQFqwg+1IiwgYH/bwHVgVHkTKeE1E3gbvC4W+CHrDsV9Rkie8jS6Ww48kVfpqYyeToyiOgyD5FQNrDPmuE6pIJcmNJJ9vdGvFHNvWMKICFn9PY6nzTLMV79vmDVTCBLYndLf3GVbcXBo8yyGAcPT5sd5R5EPkFZMTWZBFNMlumE8YeF52DVSVAjQyDq19rjBM0pv1OzVChb5oWUqJV19foyP9cfrp6Biu0Gexj3DYCbwUVJepSKRYEcURdE9bILkjJI3ey6r3np8wmdh1JqJvypautDrzPHexbapUlCaNTNV/tQXDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlH2GVBrgTn8BobsXrer5fcA/PGE2HZzpNd2uHXQZHM=;
 b=X1oOOHEMhMpjI7fLR4GPPYsAw9yXgQodg5whTXbsV5N0D3xehqRgeUtMj2leTT/jhaK1jU4Qp1t/9L6eXw85E9bOLj1q1Revznoep7Qq/pv975ukSHUIOpwEF5QfMVa8pd6em0maoUgZl4149ZHkPIrJaB/etP0JRfz+LnD0wipGSOFYpDwiTRot/SEjE0yYbjSWsYisF1gycWOExElcyS3/d46mFA4jRMomCnATb5P056QNLBU8IXcV9i1joXT6OAUnA76N0bvP+GOxmSVyujEugpHqfgLIPxeTaCPIBS7C+o+S63TR/X12jItQnV3VJlM9TgbgX4T6T3bxF3DsGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlH2GVBrgTn8BobsXrer5fcA/PGE2HZzpNd2uHXQZHM=;
 b=lqbYXzlI3j4jnIdEBFviiAADQCKeAS9nWonKZ4LMVctr8ENra+x/bsolV38qPLCLqXGWzeV+TOezQ9dq9wmKIXlWMvoUNr6zVB8ekHFY9mCYz5GGfkABwetY6c5Jxh8jmUCVNwia5G8gz5t9LS6yxPfJZzJPc4srOGDJMXPbHIw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by AS8PR08MB9908.eurprd08.prod.outlook.com (2603:10a6:20b:562::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 08:53:25 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%6]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 08:53:25 +0000
Message-ID: <2dc870e1-ca73-4560-aead-7c7124c55ff4@arm.com>
Date: Thu, 27 Mar 2025 08:53:24 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 6/8] drm/panthor: Implement the counter sampler and
 sample handling
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
 <20241211165024.490748-7-lukas.zapolskas@arm.com>
 <7yefnimq3o6zaouxcfyabxicllcn4egbl2rb42ooqiodfa2l7b@ov2nm7kamrp6>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <7yefnimq3o6zaouxcfyabxicllcn4egbl2rb42ooqiodfa2l7b@ov2nm7kamrp6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0124.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::14) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|AS8PR08MB9908:EE_|DB5PEPF00014B94:EE_|AM9PR08MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: c6a3ad89-dec6-4580-72fd-08dd6d0cde95
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?VFR1WXZqMnpGb1BINmZOdDdQY3VoL2djOFBUakhtM3oybXVON2F1YmNnQzJm?=
 =?utf-8?B?WFdqN1VBNE5uMTlYSDBWOFBRVVd1eUJSMWZkcnVhYUNLdXpRTTNiMFhVVFJC?=
 =?utf-8?B?K0RIVFdmdlJRZXNzVldXdmgxb3A1NWRqelE3dXdtdm1OMFR6dVY2d2hRSytT?=
 =?utf-8?B?N2NQTVRma0poTEh3KzNLd3NNMDU5dUhrT0hQUnBtOUdVZDZwV3d1dmhkMGpB?=
 =?utf-8?B?SElsOHJNWVkzeGNOYnJMRUZPWUV1VmVBUkVPQUVEYzRIUGRNUnZ2UEUxay81?=
 =?utf-8?B?aVJmMVhEQVVtY1BYMjFYTy9UWGRvZjZydm12MllIdEI2dTdKTUUydnh2ZXZP?=
 =?utf-8?B?SHlEd0ZxRnpHRHlnd24zai9pMktBZGVFeHZJRVRrZnZlRWY2L3B4K3dxV2Fy?=
 =?utf-8?B?RW5zdEZwcXdrTi8wUnZ2ZkF5VUZnTHNQMHB5NjVmeEY5blRrZ0Rtc3k3TWVY?=
 =?utf-8?B?aGRhb2xVWGF4cTAvbWJGUjJjSUZ6NmxCbldMSXpGbi9yUkNqbllDY09QcUVi?=
 =?utf-8?B?THdUNDcxRTBVeEhocHRqRlVjbmRXWXJnUHhuc2FNaWtpcFdJMlpNMmlpQUc5?=
 =?utf-8?B?TVlTUFVnMEZlL09ocWtac3lNQkJRTGRFdXQydTUwWTY0VEQzbVh5MDhRakpt?=
 =?utf-8?B?WXZUVUExZythdTdSTkNsc25vVldtTTF2cndkVEtyR1pqZWRkcStNcnF0VThx?=
 =?utf-8?B?bmE1L3hDcytBcllpd1ljcTdBR0g1ZEhJTXJnSnFhYjkvTSs4MGxrSmRUUUtx?=
 =?utf-8?B?MDNVVldvZUw5SUdidVlCY3craFpIZWxOQTRUeDZFckRORitVeEZXdHJrcnZl?=
 =?utf-8?B?YnV6bW55emVuRE9IdG1uK0RTS3B2c0FBQVk0SnVWOWZsWUtOK2RVcStiWHdP?=
 =?utf-8?B?YnY0Tjh0SFhTYStOWTNCUFhzUTllWG5wMGNlRVVFMXJTajNDVWNCNlpmWDVV?=
 =?utf-8?B?Qi9IMTh3MnRaTHlXWmJtTWluSnVSQWZacksyKzhOd0ZSZUovK2tKa3dFbldL?=
 =?utf-8?B?cmhaQkpPR0JSckVZMk9LRzJ5eWU1ZnNVOFJvWVpBbHZKS1h5WkE4Y1JQby9N?=
 =?utf-8?B?TS9vSmFjbEZCL20rS3VqZTY0R0JRQlFyLy9tMitrZGVqNGdQSzdqUnB3TnVt?=
 =?utf-8?B?QWJjQk85VW5zYnNzUVk4Z3dSMGYwSDBuUHNlWlQ1bmJuN2lyVGRCVmhKMkZG?=
 =?utf-8?B?Z3VBUHI3NmViSFF3cjV4b1ZxRkFXeHJxdEtpbmdROE03UFBWeEN5akpsU29h?=
 =?utf-8?B?QURtYzdNb3ZhaFJpRSsyZVU2WVdndVNNZlJSYVBmZkY1K0NvdHk5MzdDMGVn?=
 =?utf-8?B?TGx0NVIvTnZIZG5hUW1xTEhacFRHSXZ2bTd0ZHNMTTBEcDN5aDAxa2RWU2hM?=
 =?utf-8?B?R3lOWHlGL1Uvbm56dzg3MWN2ejVyTXp4OVhwTVE0VERjRCtGTTV2dnE4ZnJV?=
 =?utf-8?B?QW1DRXBlaU1xODBOWVFlNXpNTkpCWFJRS2EyMXg2YVNKZS8rcUI4cks3VUsw?=
 =?utf-8?B?Nm4rcGlnL3FnTzdSZkdnOXpvblFBaWZkR1Y0aEdzalVQaEJEMkpxUWZUYitM?=
 =?utf-8?B?ZVFZV3FpRUdJdGRESGpkUHRKSXIrZjdaS0NmM1FocTdObE5USGpJemMwTW1Y?=
 =?utf-8?B?d3BERGhReXBzWTF6ZE5WZHhEdS9wZnpwVjRpRTdoZWZmQ3JFc2NFYjdGd2FK?=
 =?utf-8?B?SjVPZTRkU2VycEw2czFKdlVxeTVMSXpUZ1hnRWJ4TXN4ZVJkUlZOaitISE5w?=
 =?utf-8?B?dEdMeCsrMHRIbUcrVm81Q3MyQzRYVkVHVmc5Y2NRQml1WFl1enJyaDNsTXg5?=
 =?utf-8?B?aCtpeXdEM0NEY3RBWTFIaURTTUU1WmJ3bkt5LzA3VW83cG1tcUYzenVBS0gw?=
 =?utf-8?Q?5YCG4qbcb6n8t?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9908
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:208:5c::16];
 domain=AM0PR08MB3315.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: df3ca32f-d9a6-46af-ba1c-08dd6d0cd5a3
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|82310400026|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VU5SNjFOY3ZEVTZXQk9GK1o4YTdOMVdJaTIzYWJMRnZNV3h4bzI3YTBGcUMv?=
 =?utf-8?B?M0dLaUVSeGoyd3cxbUdwK3dxWE95ai9aendZd3dqZWYyOW41cmZ6YXJUM29t?=
 =?utf-8?B?aUUycWhVVU1Ibk80TzI3UjJIWHZ2VmhVN3crcmxZM1R3NktCclBaSHlpSHUw?=
 =?utf-8?B?WUdTY2FJRmxJYkZGOWFIRU9uZkVYbEFsN0I4dURTb2MrWTlaSnVWai83VmI0?=
 =?utf-8?B?VnVYUFZ2OUFOeTJ6eUJiSmloRjJsM1VDUUxBaHlGM0Zkd3BCVURxU0hGWEpk?=
 =?utf-8?B?bVZkblpyaWl2ZGZPOXFobmRVZUVtZThMN2RHRjhMcDNCenhQMndhN3NLaDNh?=
 =?utf-8?B?SVdFVmJhZWdJZDMvc1c5TWZnOEkxVlBva25TTmVMU0EzTTJJWTZvUnRqb3NY?=
 =?utf-8?B?YVBiWXVqNnltUVNxTURLODBrYTJFOGQ0b0dDU0IzVFYxNk5LOFFZcFJkSG1Y?=
 =?utf-8?B?ZGVRcjM3UFdCUGh3NmhxaGRKWGx3UmE1cHhXenpycVZIUTdsY25YblBIMU5D?=
 =?utf-8?B?OFdaUEtYRHIrTVlMb3pmUkFYNFAvczZpOFd0MlpMOHhVaDJPeEwvQWlwek1M?=
 =?utf-8?B?WERrSjBiK2pZTTF3U0JBVVkyK2kvcC8zUGZMYWdMRlFEem5YQUM5VHNxK2Y2?=
 =?utf-8?B?dTFweFVVZmovbkpSRXRtZkNsTU5ZN0kxTmVFamZNcDd5dXl0b3NLUUY1aGhv?=
 =?utf-8?B?UnVaemdCcFR0WjJ2bis5R3A1WlBzNDVNS0JjSHVEa2VoVFN4TmRFaFU3Q1dV?=
 =?utf-8?B?VVMwOUoyaW53VEFyUThmbWd2Y09zWnRUMkNybFZWQXJiYUtFS3AyMHRvN0ZK?=
 =?utf-8?B?eFhXMGRpdkIvNXl3Z0lKcXpTNzV2YkpIRVZrRjNIM0lnalNMSnYwY2pDMHpB?=
 =?utf-8?B?WDBsajBYZSt0K1N3azMvNjByZ3FtbEF1MXFJd3RxdzZqa0E0NUZKcksxRkdV?=
 =?utf-8?B?OWt0WW1pRjRyTzNka3RlRFRzbUNsNnE1VHV0ZzV5L2I3Q1pFRlRsQllQMjR0?=
 =?utf-8?B?U01lcEtvQjFVa1ZVZE0yTDdBdm5LMEdKNkxBV2ZMZmg1cmVhaWp2RWx0R29X?=
 =?utf-8?B?OHp4MWV6QWFtMnlJZ1RNdzFEYTBuZGJhYXVlYStxQ2dkblQ5U0dEays4elky?=
 =?utf-8?B?eVdiQmZWNDZYdWFrSkV3ZnVaREV1bWtHbU52SG9ubGJCWVNQaUFORkM5OHNQ?=
 =?utf-8?B?TXdtVkEzdGh1cENjbWEwVVFrSEo3bzgvQVBkTDRDc0ZUeVRvRXlWaGJ3RXYv?=
 =?utf-8?B?WnlxSTJ6TFVndmFkSTZSRGdBSXBhVDh0UjBlWG13YWtRRzMyTEFNclNsZjYy?=
 =?utf-8?B?UDk5cUZhc3p3ZkdzaWNLblZPeXdJdDlhaVo3REpxYjBvMnBIZ3VlOGxEakZw?=
 =?utf-8?B?eHBVL0N4enZ2SWk3UW5FZm5mNXY0ZkxwOHVlSExudlExQ0VlbWlzc3hySUo2?=
 =?utf-8?B?c3dKN2xZVlVrOVJCdHU2eWExMnREbHpOV3lFN2hrZzZ1ZGp2QzBtcCtvaDFm?=
 =?utf-8?B?MlVWTVBtUHBwemhJc21MV3pjSjRvRGQvSHkvcWhYUG9jQzdjbitPRFVVWHEx?=
 =?utf-8?B?RHJXVWhSd0Yva3lvUHJLSGQ2VzQ0T2JDdzhocGZ1bUZhSHFvM1NUeHQ4NUJQ?=
 =?utf-8?B?bll2RTFqczJVZmFybzhBbjN6R3lZbDhhUldCaVgxb2hxNHAzMGlvQTRtSzZM?=
 =?utf-8?B?Zml2YmRWdTFPdnhhVTZOSzJON29CL2ZEZEIxdHhoT0ZOTHowZmxrbzE3K25Z?=
 =?utf-8?B?Rm45UXNET3pPVGkxcklMYzRCYmRxdWE1MSt2SVBzMFFkbWY1bis1T3lCVFRv?=
 =?utf-8?B?ZmM4ZnlaTUd3dE9IT0hBenUxZGhoN1lubW9vcXV2ekV0QTErL2s2enRpQ21V?=
 =?utf-8?B?bXFYd1ZMUlpBWENCWHhEMTF3cXZXQUJ2WlpkTGpqcSsxOXJJRThTTFZ4RHpa?=
 =?utf-8?B?MkFjQ0xqdklxTnlVVURZNVA2Vnp2Z2hrYmJpdVJOQWkyRmdyRVJqdG1sVkl2?=
 =?utf-8?Q?ZuhOeK0CMm5HaoDP+bWTdNfF4oIacc=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(82310400026)(14060799003)(1800799024)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 08:53:39.7381 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a3ad89-dec6-4580-72fd-08dd6d0cde95
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5939
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



On 27/01/2025 16:53, Adrián Larumbe wrote:
> On 11.12.2024 16:50, Lukas Zapolskas wrote:
>> From: Adrián Larumbe <adrian.larumbe@collabora.com>
>>
>> The sampler aggregates counter and set requests coming from userspace
>> and mediates interactions with the FW interface, to ensure that user
>> sessions cannot override the global configuration.
>>
>>  From the top-level interface, the sampler supports two different types
>> of samples: clearing samples and regular samples. Clearing samples are
>> a special sample type that allow for the creation of a sampling
>> baseline, to ensure that a session does not obtain counter data from
>> before its creation.
>>
>> Upon receipt of a relevant interrupt, corresponding to one of the three
>> relevant bits of the GLB_ACK register, the sampler takes any samples
>> that occurred, and, based on the insert and extract indices, accumulates
>> them to an internal storage buffer after zero-extending the counters
>> from the 32-bit counters emitted by the hardware to 64-bit counters
>> for internal accumulation.
>>
>> When the performance counters are enabled, the FW ensures no counter
>> data is lost when entering and leaving non-counting regions by producing
>> automatic samples that do not correspond to a GLB_REQ.PRFCNT_SAMPLE
>> request. Such regions may be per hardware unit, such as when a shader
>> core powers down, or global. Most of these events do not directly
>> correspond to session sample requests, so any intermediary counter data
>> must be stored into a temporary accumulation buffer.
>>
>> If there are sessions waiting for a sample, this accumulated buffer will
>> be taken, and emitted for each waiting client. During this phase,
>> information like the timestamps of sample request and sample emission,
>> type of the counter block and block index annotations are added to the
>> sample header and block headers. If no sessions are waiting for
>> a sample, this accumulation buffer is kept until the next time a sample
>> is requested.
>>
>> Special handling is needed for the PRFCNT_OVERFLOW interrupt, which is
>> an indication that the internal sample handling rate was insufficient.
>>
>> The sampler also maintains a buffer descriptor indicating the structure
>> of a firmware sample, since neither the firmware nor the hardware give
>> any indication of the sample structure, only that it is composed out of
>> three parts:
>>   - the metadata is an optional initial counter block on supporting
>>     firmware versions that contains a single counter, indicating the
>>     reason a sample was taken when entering global non-counting regions.
>>     This is used to provide coarse-grained information about why a sample
>>     was taken to userspace, to help userspace interpret variations in
>>     counter magnitude.
>>   - the firmware component of the sample is composed out of a global
>>     firmware counter block on supporting firmware versions.
>>   - the hardware component is the most sizeable of the three and contains
>>     a block of counters for each of the underlying hardware resources. It
>>     has a fixed structure that is described in the architecture
>>     specification, and contains the command stream hardware block(s), the
>>     tiler block(s), the MMU and L2 blocks (collectively named the memsys
>>     blocks) and the shader core blocks, in that order.
>> The structure of this buffer changes based on the firmware and hardware
>> combination, but is constant on a single system.
> 
> I already brought this up in a previous patch review. This approach of
> describing the layout of counters in the FW ringbuffer inside the kernel
> deviates from what was being done for Panfrost already, where the kernel does
> the minimal job of providing raw samples to user mode, and the UM programs need
> to rely on layout files that lend a meaning to the raw data block. In the case
> of Panfrost, because many generations of HW are supported, it seems keeping this
> deal of information in the kernel isn't very scalable, and also in my view goes
> against the practice of having the driver do as little as possible, other than
> streaming raw data to UM and letting programs handle it in more sophisticated
> ways.

Please see my response on the uAPI changes, I hope I have addressed
all of your points there.

> 
>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> Co-developed-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
>> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
>> ---
>>   drivers/gpu/drm/panthor/panthor_fw.c   |   5 +
>>   drivers/gpu/drm/panthor/panthor_fw.h   |   9 +-
>>   drivers/gpu/drm/panthor/panthor_perf.c | 882 ++++++++++++++++++++++++-
>>   drivers/gpu/drm/panthor/panthor_perf.h |   2 +
>>   include/uapi/drm/panthor_drm.h         |   5 +-
>>   5 files changed, 892 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
>> index e9530d1d9781..cd68870ced18 100644
>> --- a/drivers/gpu/drm/panthor/panthor_fw.c
>> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
>> @@ -1000,9 +1000,12 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
>>   
>>   	/* Enable interrupts we care about. */
>>   	glb_iface->input->ack_irq_mask = GLB_CFG_ALLOC_EN |
>> +					 GLB_PERFCNT_SAMPLE |
>>   					 GLB_PING |
>>   					 GLB_CFG_PROGRESS_TIMER |
>>   					 GLB_CFG_POWEROFF_TIMER |
>> +					 GLB_PERFCNT_THRESHOLD |
>> +					 GLB_PERFCNT_OVERFLOW |
>>   					 GLB_IDLE_EN |
>>   					 GLB_IDLE;
>>   
>> @@ -1031,6 +1034,8 @@ static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 status)
>>   		return;
>>   
>>   	panthor_sched_report_fw_events(ptdev, status);
>> +
>> +	panthor_perf_report_irq(ptdev, status);
>>   }
>>   PANTHOR_IRQ_HANDLER(job, JOB, panthor_job_irq_handler);
>>   
>> diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
>> index db10358e24bb..7ed34d2de8b4 100644
>> --- a/drivers/gpu/drm/panthor/panthor_fw.h
>> +++ b/drivers/gpu/drm/panthor/panthor_fw.h
>> @@ -199,9 +199,10 @@ struct panthor_fw_global_control_iface {
>>   	u32 group_num;
>>   	u32 group_stridei;
>>   #define GLB_PERFCNT_FW_SIZE(x) ((((x) >> 16) << 8))
>> +#define GLB_PERFCNT_HW_SIZE(x) (((x) & GENMASK(15, 0)) << 8)
>>   	u32 perfcnt_size;
>>   	u32 instr_features;
>> -#define PERFCNT_FEATURES_MD_SIZE(x) ((x) & GENMASK(3, 0))
>> +#define PERFCNT_FEATURES_MD_SIZE(x) (((x) & GENMASK(3, 0)) << 8)
>>   	u32 perfcnt_features;
> 
> I've checked the spec and this field isn't mentioned:
> docs/g510/gpu/html/register_set/GLB_CONTROL_BLOCK.htm
> 
>>   };
>>   
>> @@ -211,7 +212,7 @@ struct panthor_fw_global_input_iface {
>>   #define GLB_CFG_ALLOC_EN			BIT(2)
>>   #define GLB_CFG_POWEROFF_TIMER			BIT(3)
>>   #define GLB_PROTM_ENTER				BIT(4)
>> -#define GLB_PERFCNT_EN				BIT(5)
>> +#define GLB_PERFCNT_ENABLE			BIT(5)
>>   #define GLB_PERFCNT_SAMPLE			BIT(6)
>>   #define GLB_COUNTER_EN				BIT(7)
>>   #define GLB_PING				BIT(8)
>> @@ -234,7 +235,6 @@ struct panthor_fw_global_input_iface {
>>   	u32 doorbell_req;
>>   	u32 reserved1;
>>   	u32 progress_timer;
>> -
>>   #define GLB_TIMER_VAL(x)			((x) & GENMASK(30, 0))
>>   #define GLB_TIMER_SOURCE_GPU_COUNTER		BIT(31)
>>   	u32 poweroff_timer;
>> @@ -244,6 +244,9 @@ struct panthor_fw_global_input_iface {
>>   	u64 perfcnt_base;
>>   	u32 perfcnt_extract;
>>   	u32 reserved3[3];
>> +#define GLB_PRFCNT_CONFIG_SIZE(x) ((x) & GENMASK(7, 0))
>> +#define GLB_PRFCNT_CONFIG_SET(x) (((x) & GENMASK(1, 0)) << 8)
>> +#define GLB_PRFCNT_METADATA_ENABLE BIT(10)
>>   	u32 perfcnt_config;
>>   	u32 perfcnt_csg_select;
>>   	u32 perfcnt_fw_enable;
> 
> In this very same file, you might want to add the following halt status bits to
> panthor_fw_global_output_iface:
> 
> struct panthor_fw_global_output_iface {
> 	u32 ack;
> 	u32 reserved1;
> 	u32 doorbell_ack;
> 	u32 reserved2;
> 	u32 halt_status;
> +#define GLB_PERFCNT_STATUS_FAILED            BIT(0)
> +#define GLB_PERFCNT_STATUS_POWERON           BIT(1)
> +#define GLB_PERFCNT_STATUS_POWEROFF          BIT(2)
> +#define GLB_PERFCNT_STATUS_PROTSESSION       BIT(3)
> 	u32 perfcnt_status;
> 	u32 perfcnt_insert;
> };

Not including them was intentional. IIRC, these are never
actually populated, so the field is always zero. The
register is removed for future GPU revisions.

>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
>> index 42d8b6f8c45d..d62d97c448da 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.c
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
>> @@ -15,7 +15,9 @@
>>   
>>   #include "panthor_device.h"
>>   #include "panthor_fw.h"
>> +#include "panthor_gem.h"
>>   #include "panthor_gpu.h"
>> +#include "panthor_mmu.h"
>>   #include "panthor_perf.h"
>>   #include "panthor_regs.h"
>>   
>> @@ -26,6 +28,41 @@
>>    */
>>   #define PANTHOR_PERF_EM_BITS (BITS_PER_TYPE(u64) * 2)
>>   
>> +/**
>> + * PANTHOR_PERF_FW_RINGBUF_SLOTS - Number of slots allocated for individual samples when configuring
>> + *                                 the performance counter ring buffer to firmware. This can be
>> + *                                 used to reduce memory consumption on low memory systems.
>> + */
>> +#define PANTHOR_PERF_FW_RINGBUF_SLOTS (32)
> 
> Perhaps this should be a module parameter with a default value of 32?
> 

Either module param or build-time option would work for me.

>> +
>> +/**
>> + * PANTHOR_CTR_TIMESTAMP_LO - The first architecturally mandated counter of every block type
>> + *                            contains the low 32-bits of the TIMESTAMP value.
>> + */
>> +#define PANTHOR_CTR_TIMESTAMP_LO (0)
>> +
>> +/**
>> + * PANTHOR_CTR_TIMESTAMP_HI - The register offset containinig the high 32-bits of the TIMESTAMP
>> + *                            value.
>> + */
>> +#define PANTHOR_CTR_TIMESTAMP_HI (1)
>> +
>> +/**
>> + * PANTHOR_CTR_PRFCNT_EN - The register offset containing the enable mask for the enabled counters
>> + *                         that were written to memory.
>> + */
>> +#define PANTHOR_CTR_PRFCNT_EN (2)
>> +
>> +/**
>> + * PANTHOR_HEADER_COUNTERS - The first four counters of every block type are architecturally
>> + *                           defined to be equivalent. The fourth counter is always reserved,
>> + *                           and should be zero and as such, does not have a separate define.
>> + *
>> + *                           These are the only four counters that are the same between different
>> + *                           blocks and are consistent between different architectures.
>> + */
>> +#define PANTHOR_HEADER_COUNTERS (4)
>> +
>>   /**
>>    * enum panthor_perf_session_state - Session state bits.
>>    */
>> @@ -158,6 +195,135 @@ struct panthor_perf_session {
>>   	struct kref ref;
>>   };
>>   
>> +struct panthor_perf_buffer_descriptor {
>> +	/**
>> +	 * @block_size: The size of a single block in the FW ring buffer, equal to
>> +	 *              sizeof(u32) * counters_per_block.
>> +	 */
>> +	size_t block_size;
>> +
>> +	/**
>> +	 * @buffer_size: The total size of the buffer, equal to (#hardware blocks +
>> +	 *               #firmware blocks) * block_size.
>> +	 */
>> +	size_t buffer_size;
>> +
>> +	/**
>> +	 * @available_blocks: Bitmask indicating the blocks supported by the hardware and firmware
>> +	 *                    combination. Note that this can also include blocks that will not
>> +	 *                    be exposed to the user.
>> +	 */
>> +	DECLARE_BITMAP(available_blocks, DRM_PANTHOR_PERF_BLOCK_MAX);
>> +	struct {
>> +		/** @offset: Starting offset of a block of type @type in the FW ringbuffer. */
>> +		size_t offset;
>> +
>> +		/** @type: Type of the blocks between @blocks[i].offset and @blocks[i+1].offset. */
>> +		enum drm_panthor_perf_block_type type;
> 
> I think perhaps you could avoid using this, because a block type number is the
> same as its index in the blocks array. See [1]
> 

That does simplify the implementation a bit, thank you.

>> +		/** @block_count: Number of blocks of the given @type, starting at @offset. */
>> +		size_t block_count;
>> +	} blocks[DRM_PANTHOR_PERF_BLOCK_MAX];
>> +};
> 
> It seems with this approach for storing the layout of counters, this would depend
> on them being arranged always in the same way. In Panfros, however, counter layout
> was being handled in UM by parsing XML files into a C file that filled in as a
> buffer descriptor. I'm afraid maybe pushing this into kernel space might make adding
> support for new devices with different counter layout not easy.
> 

 From what I understand of the Mesa implementation, Panfrost has the
exact same expectation, but in userspace: the number of hardware
blocks is hard-coded, as is their ordering, whereas the offsets
of counters are then stored in the XML.

I agree that the counters should be handled in userspace, since
they change from GPU to GPU. The layout algorithm mostly stays
consistent and has primarily backwards compatible changes
made to it.

>> +
>> +/**
>> + * STRUCT panthor_perf_sampler - Interface to de-multiplex firmware interaction and handle
>> + *                               global interactions.
>> + */
>> +struct panthor_perf_sampler {
>> +	/** @sample_requested: A sample has been requested. */
>> +	bool sample_requested;
>> +
>> +	/**
>> +	 * @last_ack: Temporarily storing the last GLB_ACK status. Without storing this data,
>> +	 *            we do not know whether a toggle bit has been handled.
>> +	 */
>> +	u32 last_ack;
>> +
>> +	/**
>> +	 * @enabled_clients: The number of clients concurrently requesting samples. To ensure that
>> +	 *                   one client cannot deny samples to another, we must ensure that clients
>> +	 *                   are effectively reference counted.
>> +	 */
>> +	atomic_t enabled_clients;
>> +
>> +	/**
>> +	 * @sample_handled: Synchronization point between the interrupt bottom half and the
>> +	 *                  main sampler interface. Must be re-armed solely on a new request
>> +	 *                  coming to the sampler.
>> +	 */
>> +	struct completion sample_handled;
>> +
>> +	/** @rb: Kernel BO in the FW AS containing the sample ringbuffer. */
>> +	struct panthor_kernel_bo *rb;
>> +
>> +	/**
>> +	 * @sample_size: The size of a single sample in the FW ringbuffer. This is computed using
>> +	 *               the hardware configuration according to the architecture specification,
>> +	 *               and cross-validated against the sample size reported by FW to ensure
>> +	 *               a consistent view of the buffer size.
>> +	 */
>> +	size_t sample_size;
>> +
>> +	/**
>> +	 * @sample_slots: Number of slots for samples in the FW ringbuffer. Could be static,
>> +	 *		  but may be useful to customize for low-memory devices.
>> +	 */
>> +	size_t sample_slots;
>> +
>> +	/**
>> +	 * @config_lock: Lock serializing changes to the global counter configuration, including
>> +	 *               requested counter set and the counters themselves.
>> +	 */
>> +	struct mutex config_lock;
>> +
>> +	/**
>> +	 * @ems: List of enable maps of the active sessions. When removing a session, the number
>> +	 *       of requested counters may decrease, and the union of enable masks from the multiple
>> +	 *       sessions does not provide sufficient information to reconstruct the previous
>> +	 *       enable mask.
>> +	 */
>> +	struct list_head ems;
> 
> Maybe ems and config lock could be in the same anonymous structure.
> 
>> +
>> +	/** @em: Combined enable mask for all of the active sessions. */
>> +	struct panthor_perf_enable_masks *em;
>> +
>> +	/**
>> +	 * @desc: Buffer descriptor for a sample in the FW ringbuffer. Note that this buffer
>> +	 *        at current time does some interesting things with the zeroth block type. On
>> +	 *        newer FW revisions, the first counter block of the sample is the METADATA block,
>> +	 *        which contains a single value indicating the reason the sample was taken (if
>> +	 *        any). This block must not be exposed to userspace, as userspace does not
>> +	 *        have sufficient context to interpret it. As such, this block type is not
>> +	 *        added to the uAPI, but we still use it in the kernel.
>> +	 */
>> +	struct panthor_perf_buffer_descriptor desc;
>> +
>> +	/**
>> +	 * @sample: Pointer to an upscaled and annotated sample that may be emitted to userspace.
>> +	 *          This is used both as an intermediate buffer to do the zero-extension of the
>> +	 *          32-bit counters to 64-bits and as a storage buffer in case the sampler
>> +	 *          requests an additional sample that was not requested by any of the top-level
>> +	 *          sessions (for instance, when changing the enable masks).
>> +	 */
>> +	u8 *sample;
>> +
>> +	/** @sampler_lock: Lock used to guard the list of sessions requesting samples. */
>> +	struct mutex sampler_lock;
>> +
>> +	/** @sampler_list: List of sessions requesting samples. */
>> +	struct list_head sampler_list;
> 
> Shouldn't this be called session list instead?
> Wouldn't it better to include both the list and its mutex into a single anonymous structure?
> 
>> +	/** @set_config: The set that will be configured onto the hardware. */
>> +	u8 set_config;
>> +
>> +	/**
>> +	 * @ptdev: Backpointer to the Panthor device, needed to ring the global doorbell and
>> +	 *         interface with FW.
>> +	 */
>> +	struct panthor_device *ptdev;
>> +};
>>   
>>   struct panthor_perf {
>>   	/**
>> @@ -175,6 +341,9 @@ struct panthor_perf {
>>   	 * @sessions: Global map of sessions, accessed by their ID.
>>   	 */
>>   	struct xarray sessions;
>> +
>> +	/** @sampler: FW control interface. */
>> +	struct panthor_perf_sampler sampler;
>>   };
>>   
>>   /**
>> @@ -247,6 +416,23 @@ static struct panthor_perf_enable_masks *panthor_perf_create_em(struct drm_panth
>>   	return em;
>>   }
>>   
>> +static void panthor_perf_em_add(struct panthor_perf_enable_masks *dst_em,
>> +		const struct panthor_perf_enable_masks *const src_em)
>> +{
>> +	size_t i = 0;
>> +
>> +	for (i = DRM_PANTHOR_PERF_BLOCK_FW; i <= DRM_PANTHOR_PERF_BLOCK_LAST; i++)
>> +		bitmap_or(dst_em->mask[i], dst_em->mask[i], src_em->mask[i], PANTHOR_PERF_EM_BITS);
>> +}
>> +
>> +static void panthor_perf_em_zero(struct panthor_perf_enable_masks *em)
>> +{
>> +	size_t i = 0;
>> +
>> +	for (i = DRM_PANTHOR_PERF_BLOCK_FW; i <= DRM_PANTHOR_PERF_BLOCK_LAST; i++)
>> +		bitmap_zero(em->mask[i], PANTHOR_PERF_EM_BITS);
>> +}
>> +
>>   static void panthor_perf_destroy_em_kref(struct kref *em_kref)
>>   {
>>   	struct panthor_perf_enable_masks *em = container_of(em_kref, typeof(*em), refs);
>> @@ -270,6 +456,12 @@ static u32 session_read_extract_idx(struct panthor_perf_session *session)
>>   	return smp_load_acquire(session->extract_idx);
>>   }
>>   
>> +static void session_write_insert_idx(struct panthor_perf_session *session, u32 idx)
>> +{
>> +	/* Userspace needs the insert index to know where to look for the sample. */
>> +	smp_store_release(session->insert_idx, idx);
>> +}
>> +
>>   static u32 session_read_insert_idx(struct panthor_perf_session *session)
>>   {
>>   	return *session->insert_idx;
>> @@ -349,6 +541,70 @@ static struct panthor_perf_session *session_find(struct panthor_file *pfile,
>>   	return session;
>>   }
>>   
>> +static u32 compress_enable_mask(unsigned long *const src)
>> +{
>> +	size_t i;
>> +	u32 result = 0;
>> +	unsigned long clump;
>> +
>> +	for_each_set_clump8(i, clump, src, PANTHOR_PERF_EM_BITS) {
>> +		const unsigned long shift = div_u64(i, 4);
>> +
>> +		result |= !!(clump & GENMASK(3, 0)) << shift;
>> +		result |= !!(clump & GENMASK(7, 4)) << (shift + 1);
>> +	}
>> +
>> +	return result;
>> +}
>> +
>> +static void expand_enable_mask(u32 em, unsigned long *const dst)
>> +{
>> +	size_t i;
>> +	DECLARE_BITMAP(emb, BITS_PER_TYPE(u32));
>> +
>> +	bitmap_from_arr32(emb, &em, BITS_PER_TYPE(u32));
>> +
>> +	for_each_set_bit(i, emb, BITS_PER_TYPE(u32))
>> +		bitmap_set(dst, i * 4, 4);
>> +}
>> +
>> +/**
>> + * panthor_perf_block_data - Identify the block index and type based on the offset.
>> + *
>> + * @desc:   FW buffer descriptor.
>> + * @offset: The current offset being examined.
>> + * @idx:    Pointer to an output index.
>> + * @type:   Pointer to an output block type.
>> + *
>> + * To disambiguate different types of blocks as well as different blocks of the same type,
>> + * the offset into the FW ringbuffer is used to uniquely identify the block being considered.
>> + *
>> + * In the future, this is a good time to identify whether a block will be empty,
>> + * allowing us to short-circuit its processing after emitting header information.
>> + */
>> +static void panthor_perf_block_data(struct panthor_perf_buffer_descriptor *const desc,
>> +		size_t offset, u32 *idx, enum drm_panthor_perf_block_type *type)
>> +{
>> +	unsigned long id;
>> +
>> +	for_each_set_bit(id, desc->available_blocks, DRM_PANTHOR_PERF_BLOCK_LAST) {
>> +		const size_t block_start = desc->blocks[id].offset;
>> +		const size_t block_count = desc->blocks[id].block_count;
>> +		const size_t block_end = desc->blocks[id].offset +
>> +			desc->block_size * block_count;
>> +
>> +		if (!block_count)
>> +			continue;
>> +
>> +		if ((offset >= block_start) && (offset < block_end)) {
>> +			*type = desc->blocks[id].type;
> 
>    [1] I think in this case, id will always be the same as desc->blocks[id].type, so maybe
>    
> 
>> +			*idx = div_u64(offset - desc->blocks[id].offset, desc->block_size);
>> +
>> +			return;
>> +		}
>> +	}
>> +}
>> +
>>   static size_t session_get_max_sample_size(const struct drm_panthor_perf_info *const info)
>>   {
>>   	const size_t block_size = get_annotated_block_size(info->counters_per_block);
>> @@ -358,6 +614,520 @@ static size_t session_get_max_sample_size(const struct drm_panthor_perf_info *co
>>   	return sizeof(struct drm_panthor_perf_sample_header) + (block_size * block_nr);
>>   }
>>   
>> +static u32 panthor_perf_handle_sample(struct panthor_device *ptdev, u32 extract_idx, u32 insert_idx)
>> +{
>> +	struct panthor_perf *perf = ptdev->perf;
>> +	struct panthor_perf_sampler *sampler = &ptdev->perf->sampler;
>> +	const size_t ann_block_size =
>> +		get_annotated_block_size(ptdev->perf_info.counters_per_block);
>> +	u32 i;
>> +
>> +	for (i = extract_idx; i != insert_idx; i = (i + 1) % sampler->sample_slots) {
>> +		u8 *fw_sample = (u8 *)sampler->rb->kmap + i * sampler->sample_size;
>> +
>> +		for (size_t fw_off = 0, ann_off = sizeof(struct drm_panthor_perf_sample_header);
>> +				fw_off < sampler->desc.buffer_size;
>> +				fw_off += sampler->desc.block_size)
>> +
>> +		{
>> +			u32 idx;
>> +			enum drm_panthor_perf_block_type type;
>> +			DECLARE_BITMAP(expanded_em, PANTHOR_PERF_EM_BITS);
>> +			struct panthor_perf_counter_block *blk =
>> +				(typeof(blk))(perf->sampler.sample + ann_off);
>> +			const u32 prfcnt_en = blk->counters[PANTHOR_CTR_PRFCNT_EN];
> 
> This implies there was something in blk->counters[PANTHOR_CTR_PRFCNT_EN], but
> where was it first written?
> Shouldn't this be fetched from fw_sample? sampler.sample is being reset to 0 after a sample
> is copied into the UM ringbuffer, so prfcnt_en will always be 0 here.
> 

It should be, I mixed the two up.

>> +
>> +			panthor_perf_block_data(&sampler->desc, fw_off, &idx, &type);
>> +
>> +			/**
>> +			 * TODO Data from the metadata block must be used to populate the
>> +			 * block state information.
>> +			 */
>> +			if (type == DRM_PANTHOR_PERF_BLOCK_METADATA)
>> +				continue;
>> +
>> +			expand_enable_mask(prfcnt_en, expanded_em);
>> +
>> +			blk->header = (struct drm_panthor_perf_block_header) {
>> +				.clock = 0,
>> +				.block_idx = idx,
>> +				.block_type = type,
>> +				.block_states = DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN
>> +			};
>> +			bitmap_to_arr64(blk->header.enable_mask, expanded_em, PANTHOR_PERF_EM_BITS);
>> +
>> +			u32 *block = (u32 *)(fw_sample + fw_off);
>> +
>> +			/*
>> +			 * The four header counters must be treated differently, because they are
>> +			 * not additive. For the fourth, the assignment does not matter, as it
>> +			 * is reserved and should be zero.
>> +			 */
>> +			blk->counters[PANTHOR_CTR_TIMESTAMP_LO] = block[PANTHOR_CTR_TIMESTAMP_LO];
>> +			blk->counters[PANTHOR_CTR_TIMESTAMP_HI] = block[PANTHOR_CTR_TIMESTAMP_HI];
>> +			blk->counters[PANTHOR_CTR_PRFCNT_EN] = block[PANTHOR_CTR_PRFCNT_EN];
>> +
>> +			for (size_t k = PANTHOR_HEADER_COUNTERS;
>> +					k < ptdev->perf_info.counters_per_block;
>> +					k++)
>> +				blk->counters[k] += block[k];
>> +
>> +			ann_off += ann_block_size;
>> +		}
>> +	}
>> +
>> +	return i;
> 
> This will always return insert_idx, so why return it the caller when it makes no difference?
> 

Can stop returning the insert index here. Depending on the sampling
rate, we may need to implement some back-pressure to ensure this
loop does not consume too much time.

>> +}
>> +
>> +static size_t panthor_perf_get_fw_reported_size(struct panthor_device *ptdev)
>> +{
>> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
>> +
>> +	size_t fw_size = GLB_PERFCNT_FW_SIZE(glb_iface->control->perfcnt_size);
>> +	size_t hw_size = GLB_PERFCNT_HW_SIZE(glb_iface->control->perfcnt_size);
>> +	size_t md_size = PERFCNT_FEATURES_MD_SIZE(glb_iface->control->perfcnt_features);
>> +
>> +	return md_size + fw_size + hw_size;
>> +}
>> +
>> +#define PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, typ, blk_count, offset) \
>> +	({ \
>> +		(desc)->blocks[(typ)].type = (typ); \
>> +		(desc)->blocks[(typ)].offset = (offset); \
>> +		(desc)->blocks[(typ)].block_count = (blk_count);  \
>> +		if ((blk_count))                                    \
>> +			set_bit((typ), (desc)->available_blocks); \
>> +		(offset) + ((desc)->block_size) * (blk_count); \
>> +	 })
>> +
>> +static int panthor_perf_setup_fw_buffer_desc(struct panthor_device *ptdev,
>> +		struct panthor_perf_sampler *sampler)
>> +{
>> +	const struct drm_panthor_perf_info *const info = &ptdev->perf_info;
>> +	const size_t block_size = info->counters_per_block * sizeof(u32);
>> +	struct panthor_perf_buffer_descriptor *desc = &sampler->desc;
>> +	const size_t fw_sample_size = panthor_perf_get_fw_reported_size(ptdev);
>> +	size_t offset = 0;
>> +
>> +	desc->block_size = block_size;
> 
> block_size is only used in this assignment, so maybe do away with the automatic
> variable altogether?

It's also used by PANTHOR_PERF_SET_BLOCK_DESC_DATA to set the region of
the FW sample that is occupied by a block of a specific type.

> 
> desc->block_size = info->counters_per_block * sizeof(u32);
> 
> Also, where is desc->available_blocks being set?
> 
It's being set in PANTHOR_PERF_SET_BLOCK_DESC_DATA, depending on the
availability of blocks.
> 
>> +	for (enum drm_panthor_perf_block_type type = 0; type < DRM_PANTHOR_PERF_BLOCK_MAX; type++) {
>> +		switch (type) {
>> +		case DRM_PANTHOR_PERF_BLOCK_METADATA:
>> +			if (info->flags & DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT)
>> +				offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc,
>> +					DRM_PANTHOR_PERF_BLOCK_METADATA, 1, offset);
>> +			break;
>> +		case DRM_PANTHOR_PERF_BLOCK_FW:
>> +			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->fw_blocks,
>> +					offset);
>> +			break;
>> +		case DRM_PANTHOR_PERF_BLOCK_CSG:
>> +			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->csg_blocks,
>> +					offset);
>> +			break;
>> +		case DRM_PANTHOR_PERF_BLOCK_CSHW:
>> +			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->cshw_blocks,
>> +					offset);
>> +			break;
>> +		case DRM_PANTHOR_PERF_BLOCK_TILER:
>> +			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->tiler_blocks,
>> +					offset);
>> +			break;
>> +		case DRM_PANTHOR_PERF_BLOCK_MEMSYS:
>> +			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->memsys_blocks,
>> +					offset);
>> +			break;
>> +		case DRM_PANTHOR_PERF_BLOCK_SHADER:
>> +			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->shader_blocks,
>> +					offset);
>> +			break;
>> +		case DRM_PANTHOR_PERF_BLOCK_MAX:
>> +			drm_WARN_ON_ONCE(&ptdev->base,
>> +					"DRM_PANTHOR_PERF_BLOCK_MAX should be unreachable!");
>> +			break;
>> +		}
>> +	}
> 
> Maybe to spare some code, because 'type' gives you the u32 pointer offset minus one from
> drm_panthor_perf_info::fw_blocks, you could do as follows:
> 
>     for (enum drm_panthor_perf_block_type type = 0; type < DRM_PANTHOR_PERF_BLOCK_MAX; type++) {
> 	switch (type) {
> 	case DRM_PANTHOR_PERF_BLOCK_METADATA:
> 		if (info->flags & DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT)
> 			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc,
> 				DRM_PANTHOR_PERF_BLOCK_METADATA, 1, offset);
> 		break;
> 	case DRM_PANTHOR_PERF_BLOCK_MAX:
> 		drm_WARN_ON_ONCE(&ptdev->base,
> 				"DRM_PANTHOR_PERF_BLOCK_MAX should be unreachable!");
> 		break;
> 	default:
> 		u32 blk_count = *((&info->fw_blocks)+(type-1));
> 		offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, blk_count, offset);
> 		break;
> 	}
> }
> 
> I already suggested a similar thing in a previous patch review, but this would depend
> on the compiler not inserting funky padding space between consecutive structure members,
> but all of them being u32 I guess that's not possible?
> 

I think I would prefer to avoid it in this case. It does save on some
code, but it seems less clear than the current implementation.

>> +
>> +	/* Computed size is not the same as the reported size, so we should not proceed in
>> +	 * initializing the sampling session.
>> +	 */
>> +	if (offset != fw_sample_size)
>> +		return -EINVAL;
>> +
>> +	desc->buffer_size = offset;
>> +
>> +	return 0;
>> +}
>> +
>> +static int panthor_perf_fw_stop_sampling(struct panthor_device *ptdev)
>> +{
>> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
>> +	u32 acked;
>> +	int ret;
>> +
>> +	if (~READ_ONCE(glb_iface->input->req) & GLB_PERFCNT_ENABLE)
>> +		return 0;
>> +
>> +	panthor_fw_update_reqs(glb_iface, req, 0, GLB_PERFCNT_ENABLE);
>> +	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
>> +	ret = panthor_fw_glb_wait_acks(ptdev, GLB_PERFCNT_ENABLE, &acked, 100);
>> +	if (ret)
>> +		drm_warn(&ptdev->base, "Could not disable performance counters");
> 
> After this, don't we have to set the selected counters to 0 through the fw's glb interface?
> 
>        	   glb_iface->input->* = 0;

We do, I should be setting it on the enable path rather than the disable
path.

> 
>> +
>> +	return ret;
>> +}
>> +
>> +static int panthor_perf_fw_start_sampling(struct panthor_device *ptdev)
>> +{
>> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
>> +	u32 acked;
>> +	int ret;
>> +
>> +	if (READ_ONCE(glb_iface->input->req) & GLB_PERFCNT_ENABLE)
>> +		return 0;
>> +
>> +	panthor_fw_update_reqs(glb_iface, req, GLB_PERFCNT_ENABLE, GLB_PERFCNT_ENABLE);
>> +	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
>> +	ret = panthor_fw_glb_wait_acks(ptdev, GLB_PERFCNT_ENABLE, &acked, 100);
>> +	if (ret)
>> +		drm_warn(&ptdev->base, "Could not enable performance counters");
> 
> Wouldn't you have to enable counters in the FW's global input interface? As in
> calling panthor_perf_fw_write_em(sampler, sampler->em)
> 

That is the intent. The two actions are somewhat decoupled, because you
can program the interface and not immediately start sampling, or
you can start/stop sampling around events that do not clear the
FW's GLB interface programming.

>> +
>> +	return ret;
>> +}
>> +
>> +static void panthor_perf_fw_write_em(struct panthor_perf_sampler *sampler,
>> +		struct panthor_perf_enable_masks *em)
>> +{
>> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(sampler->ptdev);
>> +	u32 perfcnt_config;
>> +
>> +	glb_iface->input->perfcnt_csf_enable =
>> +		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_CSHW]);
> 
> Wouldn't it be enough to get the lowest 32 bits of every bitmap for the actual mask?
> 

How so? We are trying to provide one bit per counter for the user
to individually select counters. This is also somewhat forward-looking,
because the Mali-G715 and onwards have 128 counters for every block.

>> +	glb_iface->input->perfcnt_shader_enable =
>> +		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_SHADER]);
>> +	glb_iface->input->perfcnt_mmu_l2_enable =
>> +		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_MEMSYS]);
>> +	glb_iface->input->perfcnt_tiler_enable =
>> +		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_TILER]);
>> +	glb_iface->input->perfcnt_fw_enable =
>> +		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_FW]);
>> +	glb_iface->input->perfcnt_csg_enable =
>> +		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_CSG]);
>> +
>> +	perfcnt_config = GLB_PRFCNT_CONFIG_SIZE(PANTHOR_PERF_FW_RINGBUF_SLOTS);
> 
> Maybe replace this with
> 	perfcnt_config = GLB_PRFCNT_CONFIG_SIZE(sampler->sample_slots);
> in case the number of slots is ever made a module parameter?
> 
>> +	perfcnt_config |= GLB_PRFCNT_CONFIG_SET(sampler->set_config);
>> +	glb_iface->input->perfcnt_config = perfcnt_config;
>> +
>> +	/**
>> +	 * The spec mandates that the host zero the PRFCNT_EXTRACT register before an enable
>> +	 * operation, and each (re-)enable will require an enable-disable pair to program
>> +	 * the new changes onto the FW interface.
>> +	 */
>> +	WRITE_ONCE(glb_iface->input->perfcnt_extract, 0);
> 
>   Wouldn't this better go in panthor_perf_fw_stop_sampling()?
> 

The spec says that it must be cleared to zero before enabling the
performance counters, so I moved the clearing to be present
in the enabling. This way, the same helper works for both
initialization and re-initialization.

>> +}
>> +
>> +static void session_populate_sample_header(struct panthor_perf_session *session,
>> +		struct drm_panthor_perf_sample_header *hdr)
>> +{
>> +	hdr->block_set = 0;
>> +	hdr->user_data = session->user_data;
>> +	hdr->timestamp_start_ns = session->sample_start_ns;
>> +	/**
>> +	 * TODO This should be changed to use the GPU clocks and the TIMESTAMP register,
>> +	 * when support is added.
>> +	 */
> 
> Timestamp register is already available and used in the driver.
> 
>> +	hdr->timestamp_end_ns = ktime_get_raw_ns();

With timestamp start, we want to capture when the kernel requested a
timestamp. With the timestamp end, we want to instead capture when
the FW actually created the sample. This would involve using the
TIMESTAMP_LO and TIMESTAMP_HI values, along with the TIMESTAMP_OFFSET
register to ensure that the FW timestamps are aligned with those
of the host.

>> +}
>> +
>> +/**
>> + * session_patch_sample - Update the PRFCNT_EN header counter and the counters exposed to the
>> + *                        userspace client to only contain requested counters.
>> + *
>> + * @ptdev: Panthor device
>> + * @session: Perf session
>> + * @sample: Starting offset of the sample in the userspace mapping.
>> + *
>> + * The hardware supports counter selection at the granularity of 1 bit per 4 counters, and there
>> + * is a single global FW frontend to program the counter requests from multiple sessions. This may
>> + * lead to a large disparity between the requested and provided counters for an individual client.
>> + * To remove this cross-talk, we patch out the counters that have not been requested by this
>> + * session and update the PRFCNT_EN, the header counter containing a bitmask of enabled counters,
>> + * accordingly.
>> + */
>> +static void session_patch_sample(struct panthor_device *ptdev,
>> +		struct panthor_perf_session *session, u8 *sample)
>> +{
>> +	const struct drm_panthor_perf_info *const perf_info = &ptdev->perf_info;
>> +
>> +	const size_t block_size = get_annotated_block_size(perf_info->counters_per_block);
>> +	const size_t sample_size = session_get_max_sample_size(perf_info);
> 
> I think maybe you want the fw ring sample size minus the user ring header:
> const size_t blocks_size = sample_size - sizeof(struct drm_panthor_perf_sample_header);
> 

Definitely. The sequence here will be somewhat changed for the next
patch set.

>> +	for (size_t i = 0; i < sample_size; i += block_size) {
> Same as above:
> 
> 	for (size_t i = 0; i < blocks_size; i += block_size) {
> 
>> +		size_t ctr_idx;
>> +		DECLARE_BITMAP(em_diff, PANTHOR_PERF_EM_BITS);
>> +		struct panthor_perf_counter_block *blk = (typeof(blk))(sample + block_size);
> Same as above:
>                  struct panthor_perf_counter_block *blk = (typeof(blk))(sample + i);
> Otherwise the iteration index isn't used.
>> +		enum drm_panthor_perf_block_type type = blk->header.block_type;
>> +		unsigned long *blk_em = session->enabled_counters->mask[type];
>> +
>> +		bitmap_from_arr64(em_diff, blk->header.enable_mask, PANTHOR_PERF_EM_BITS);
>> +
>> +		bitmap_andnot(em_diff, em_diff, blk_em, PANTHOR_PERF_EM_BITS);
>> +
>> +		for_each_set_bit(ctr_idx, em_diff, PANTHOR_PERF_EM_BITS)
>> +			blk->counters[ctr_idx] = 0;
>> +
>> +		bitmap_to_arr64(blk->header.enable_mask, blk_em, PANTHOR_PERF_EM_BITS);
>> +	}
>> +}
>> +
>> +static int session_copy_samplei(struct panthor_device *ptdev,
>> +		struct panthor_perf_session *session)
>> +{
>> +	struct panthor_perf *perf = ptdev->perf;
>> +	const size_t sample_size = session_get_max_sample_size(&ptdev->perf_info);
>> +	const u32 insert_idx = session_read_insert_idx(session);
>> +	const u32 extract_idx = session_read_extract_idx(session);
>> +	u8 *new_sample;
>> +
>> +	if (!CIRC_SPACE_TO_END(insert_idx, extract_idx, session->ringbuf_slots))
>> +		return -ENOSPC;
>> +
>> +	new_sample = session->samples + extract_idx * sample_size;
> 
> Wouldn' this have to insert_idx?
> 

It should indeed be.

>> +
>> +	memcpy(new_sample, perf->sampler.sample, sample_size);
> 
> So effectively we're doing two copies here, one from the FW ringbuffer into the
> sampler, and another one from the sampler into the user ringbuffer. This sounds
> expensive. This is in line with what I already mentioned above, essentially that
> I thougth the FW ringbuffer would be somehow made available to UM samplers so
> as to afford zero copy.
> 

I would argue that in the case of accumulation, i.e., if we have
multiple samples in the FW ring buffer at a time, we are saving on
quite a lot of copies. In particular, if we go through power
management state transitions, and automatic samples are generated,
we will only get a single copy per n samples, rather than n copies
per n samples.

Operating on a counter by counter basis, we only really need to
copy the sample once, and then we can accumulate on the counters
that we need, which effectively makes some sessions have very
little overhead in the copying.

Exposing the FW ring buffer does not necessarily provide
enough information about how to process the sample to userspace.
Besides the discussion points on the uAPI about the layout algorithm
, we also have the firmware sampling modes, which may either
be manual or manual_no_clear, where the counters may be cleared
after a manual sample or not. Exposing enough information to
userspace to make the processing simple is also somewhat
prohibitive, and definitely breaks compatibility guarantees.

>> +	session_populate_sample_header(session,
>> +			(struct drm_panthor_perf_sample_header *)new_sample);
>> +
>> +	session_patch_sample(ptdev, session, new_sample +
>> +			sizeof(struct drm_panthor_perf_sample_header));
>> +
>> +	session_write_insert_idx(session, (insert_idx + 1) % session->ringbuf_slots);
>> +
>> +	/* Since we are about to notify userspace, we must ensure that all changes to memory
>> +	 * are visible.
>> +	 */
>> +	wmb();
>> +
>> +	eventfd_signal(session->eventfd);
>> +
>> +	return 0;
>> +}
>> +
>> +#define PERFCNT_IRQS (GLB_PERFCNT_OVERFLOW | GLB_PERFCNT_SAMPLE | GLB_PERFCNT_THRESHOLD)
>> +
>> +void panthor_perf_report_irq(struct panthor_device *ptdev, u32 status)
>> +{
>> +	struct panthor_perf *const perf = ptdev->perf;
>> +	struct panthor_perf_sampler *sampler;
>> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
>> +
>> +	if (!(status & JOB_INT_GLOBAL_IF))
>> +		return;
>> +
>> +	if (!perf)
>> +		return;
>> +
>> +	sampler = &perf->sampler;
>> +
>> +	/* TODO This needs locking. */
>> +	const u32 ack = READ_ONCE(glb_iface->output->ack);
>> +	const u32 fw_events = sampler->last_ack ^ ack;
> 
> I think I would do it like this:
> 
>   	const u32 req = READ_ONCE(glb_iface->input->req);
>   	const u32 ack = READ_ONCE(glb_iface->output->ack);
> 
>   	if (!(~(req ^ ack) & PERFCNT_IRQS))
>   		return;
> 

That did not work for me without first checking
whether the bit was set previously. I'll try to retest
and see if there was some other issue preventing
this from working.

>> +	sampler->last_ack = ack;
>> +
>> +	if (!(fw_events & PERFCNT_IRQS))
>> +		return;
>> +
>> +	/* TODO Fix up the error handling for overflow. */
>> +	if (fw_events & GLB_PERFCNT_OVERFLOW)
>> +		return;
>> +
>> +	if (fw_events & (GLB_PERFCNT_SAMPLE | GLB_PERFCNT_THRESHOLD)) {
>> +		const u32 extract_idx = READ_ONCE(glb_iface->input->perfcnt_extract);
>> +		const u32 insert_idx = READ_ONCE(glb_iface->output->perfcnt_insert);
>> +
>> +		WRITE_ONCE(glb_iface->input->perfcnt_extract,
>> +				panthor_perf_handle_sample(ptdev, extract_idx, insert_idx));
>> +	}
>> +
>> +	scoped_guard(mutex, &sampler->sampler_lock)
>> +	{
>> +		struct list_head *pos, *temp;
>> +
>> +		list_for_each_safe(pos, temp, &sampler->sampler_list) {
>> +			struct panthor_perf_session *session = list_entry(pos,
>> +					struct panthor_perf_session, waiting);
>> +
>> +			session_copy_sample(ptdev, session);
>> +			list_del_init(pos);
> 
> I guess in the case of samples being taken periodically, you would not delete
> the session from the sampler's list?
> 

Essentially.

>> +
>> +			session_put(session);
>> +		}
>> +	}
>> +
>> +	memset(sampler->sample, 0, session_get_max_sample_size(&ptdev->perf_info));
> 
> I don't think sampler->sample has the user sample header in it, so we might be
> zero'ing out more memory than really needed.
> 

Checked on this and this was one of the bugs that we found internally.
Thanks for the catch!

>> +	sampler->sample_requested = false;
>> +	complete(&sampler->sample_handled);
>> +}
>> +
>> +
>> +static int panthor_perf_sampler_init(struct panthor_perf_sampler *sampler,
>> +		struct panthor_device *ptdev)
>> +{
>> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
>> +	struct panthor_kernel_bo *bo;
>> +	u8 *sample;
>> +	int ret;
>> +
>> +	ret = panthor_perf_setup_fw_buffer_desc(ptdev, sampler);
>> +	if (ret) {
>> +		drm_err(&ptdev->base,
>> +				"Failed to setup descriptor for FW ring buffer, err = %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	bo = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
>> +			sampler->desc.buffer_size * PANTHOR_PERF_FW_RINGBUF_SLOTS,
>> +			DRM_PANTHOR_BO_NO_MMAP,
>> +			DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC | DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
>> +			PANTHOR_VM_KERNEL_AUTO_VA);
>> +
>> +	if (IS_ERR_OR_NULL(bo))
>> +		return IS_ERR(bo) ? PTR_ERR(bo) : -ENOMEM;
>> +
>> +	ret = panthor_kernel_bo_vmap(bo);
>> +	if (ret)
>> +		goto cleanup_bo;
>> +
>> +	sample = devm_kzalloc(ptdev->base.dev,
>> +			session_get_max_sample_size(&ptdev->perf_info), GFP_KERNEL);
>> +	if (ZERO_OR_NULL_PTR(sample)) {
>> +		ret = -ENOMEM;
>> +		goto cleanup_vmap;
>> +	}
>> +
>> +	glb_iface->input->perfcnt_as = panthor_vm_as(panthor_fw_vm(ptdev));
>> +	glb_iface->input->perfcnt_base = panthor_kernel_bo_gpuva(bo);
>> +	glb_iface->input->perfcnt_extract = 0;
>> +	glb_iface->input->perfcnt_csg_select = GENMASK(glb_iface->control->group_num, 0);
>> +
>> +	sampler->rb = bo;
>> +	sampler->sample = sample;
>> +	sampler->sample_slots = PANTHOR_PERF_FW_RINGBUF_SLOTS;
> 
> I already mentioned this, but I think it'd be nice to have this configurable
> through a module parameter.
> 
> Also, I suspect you might've forgotten this assignment right here:
> 
> 	sampler->sample_size = sampler->desc.buffer_size;
> 

I think I will remove it, since we already have the sample size
available via helper.

Before I forget, I thought module parameters for new
drivers were frowned upon. Are we okay with the module
parameter for this case?

>> +
>> +	sampler->em = panthor_perf_em_new();
>> +
>> +	mutex_init(&sampler->sampler_lock);
>> +	mutex_init(&sampler->config_lock);
>> +	INIT_LIST_HEAD(&sampler->sampler_list);
>> +	INIT_LIST_HEAD(&sampler->ems);
>> +	init_completion(&sampler->sample_handled);
>> +
>> +	sampler->ptdev = ptdev;
>> +
>> +	return 0;
>> +
>> +cleanup_vmap:
>> +	panthor_kernel_bo_vunmap(bo);
>> +
>> +cleanup_bo:
>> +	panthor_kernel_bo_destroy(bo);
>> +
>> +	return ret;
>> +}
>> +
>> +static void panthor_perf_sampler_term(struct panthor_perf_sampler *sampler)
>> +{
>> +	int ret;
>> +
>> +	if (sampler->sample_requested)
>> +		wait_for_completion_killable(&sampler->sample_handled);
> 
> Wouldn't it be better to wait until a certain deadline?
> 

Not entirely sure what a reasonable deadline could be. I would expect
not to hit this case in practice, since this would involve driver
teardown while a process is actively trying to sample, which
does not seem likely.

>> +	panthor_perf_fw_write_em(sampler, &(struct panthor_perf_enable_masks) {});
> 
> I would handle this through a little helper and call it panthor_perf_fw_zero_em
> because other calls of panthor_perf_fw_write_em() always feature the same arguments.
> 
>> +	ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
>> +	if (ret)
>> +		drm_warn_once(&sampler->ptdev->base, "Sampler termination failed, ret = %d", ret);
>> +
>> +	devm_kfree(sampler->ptdev->base.dev, sampler->sample);
>> +
>> +	panthor_kernel_bo_destroy(sampler->rb);
>> +}
>> +
>> +static int panthor_perf_sampler_add(struct panthor_perf_sampler *sampler,
>> +		struct panthor_perf_enable_masks *const new_em,
>> +		u8 set)
>> +{
>> +	int ret = 0;
>> +
>> +	guard(mutex)(&sampler->config_lock);
>> +
>> +	/* Early check for whether a new set can be configured. */
>> +	if (!atomic_read(&sampler->enabled_clients))
>> +		sampler->set_config = set;
>> +	else
>> +		if (sampler->set_config != set)
>> +			return -EBUSY;
>> +
>> +	kref_get(&new_em->refs);
>> +	list_add_tail(&sampler->ems, &new_em->link);
>> +
>> +	panthor_perf_em_add(sampler->em, new_em);
>> +	pm_runtime_get_sync(sampler->ptdev->base.dev);
>> +
>> +	if (atomic_read(&sampler->enabled_clients)) {
>> +		ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
>> +		if (ret)
>> +			return ret;
> 
> What happens in the case of a manual session sample? Does that mean it'll get
> interrupted? I guess if we use eventfd it's not a problem, because UM will be
> notified of when the sample it's made available?
> 

It should not get interrupted. We would lose a little bit of data in
the period of time between starting and stopping to sample, but
that is about the best we can do.

>> +	}
>> +
>> +	panthor_perf_fw_write_em(sampler, sampler->em);
> 
> Almost every single use of panthor_perf_fw_write_em is called with
> the same arguments, so I would define a helper that passes sampler->em underneath,
> maybe something like panthor_perf_fw_enable_sampler_mask
> 
>> +	ret = panthor_perf_fw_start_sampling(sampler->ptdev);
>> +	if (ret)
>> +		return ret;
> 
> iWwouldn't you do this only if if (atomic_read(&sampler->enabled_clients) > 0) ?
> Unless you want to start sampling now rather than waiting for session start.
> 
>> +	atomic_inc(&sampler->enabled_clients);
>> +
>> +	return 0;
>> +}
>> +
>> +static int panthor_perf_sampler_remove(struct panthor_perf_sampler *sampler,
>> +		struct panthor_perf_enable_masks *session_em)
> 
> I might prefer to call this sampler_remove_session.

Ack.
> 
>> +{
>> +	int ret;
>> +	struct list_head *em_node;
>> +
>> +	guard(mutex)(&sampler->config_lock);
>> +
>> +	list_del_init(&session_em->link);
>> +	kref_put(&session_em->refs, panthor_perf_destroy_em_kref);
>> +
>> +	panthor_perf_em_zero(sampler->em);
>> +	list_for_each(em_node, &sampler->ems)
>> +	{
>> +		struct panthor_perf_enable_masks *curr_em =
>> +			container_of(em_node, typeof(*curr_em), link);
>> +
>> +		panthor_perf_em_add(sampler->em, curr_em);
>> +	}
>> +
>> +	ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	atomic_dec(&sampler->enabled_clients);
>> +	pm_runtime_put_sync(sampler->ptdev->base.dev);
>> +
>> +	panthor_perf_fw_write_em(sampler, sampler->em);
>> +
>> +	if (atomic_read(&sampler->enabled_clients))
>> +		return panthor_perf_fw_start_sampling(sampler->ptdev);
>> +	return 0;
>> +}
>> +
>>   /**
>>    * panthor_perf_init - Initialize the performance counter subsystem.
>>    * @ptdev: Panthor device
>> @@ -370,6 +1140,7 @@ static size_t session_get_max_sample_size(const struct drm_panthor_perf_info *co
>>   int panthor_perf_init(struct panthor_device *ptdev)
>>   {
>>   	struct panthor_perf *perf;
>> +	int ret;
>>   
>>   	if (!ptdev)
>>   		return -EINVAL;
>> @@ -386,12 +1157,93 @@ int panthor_perf_init(struct panthor_device *ptdev)
>>   		.max = 1,
>>   	};
>>   
>> +	ret = panthor_perf_sampler_init(&perf->sampler, ptdev);
>> +	if (ret)
>> +		goto cleanup_perf;
>> +
>>   	drm_info(&ptdev->base, "Performance counter subsystem initialized");
>>   
>>   	ptdev->perf = perf;
>>   
>> -	return 0;
>> +	return ret;
>> +
>> +cleanup_perf:
>> +	devm_kfree(ptdev->base.dev, perf);
>> +
>> +	return ret;
>> +}
>> +
> 
> Nit: spurious blank line
> 
>> +static void panthor_perf_fw_request_sample(struct panthor_perf_sampler *sampler)
>> +{
>> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(sampler->ptdev);
>> +
>> +	panthor_fw_toggle_reqs(glb_iface, req, ack, GLB_PERFCNT_SAMPLE);
>> +	gpu_write(sampler->ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
>> +}
> 
> Is there a way to reset the counters to zero without requesting a clearing sample?
>

There is no other way to establish a baseline so that newly added
sessions get a consistent view of the world. Note that this
clearing sample is effectively just a regular sample that
discards counters accumulated up until this point.

>> +/**
>> + * panthor_perf_sampler_request_clearing - Request a clearing sample.
>> + * @sampler: Panthor sampler
>> + *
>> + * Perform a synchronous sample that gets immediately discarded. This sets a baseline at the point
>> + * of time a new session is started, to avoid having counters from before the session.
>> + *
>> + */
>> +static int panthor_perf_sampler_request_clearing(struct panthor_perf_sampler *sampler)
>> +{
>> +	scoped_guard(mutex, &sampler->sampler_lock) {
>> +		if (!sampler->sample_requested) {
>> +			panthor_perf_fw_request_sample(sampler);
>> +			sampler->sample_requested = true;
>> +		}
>> +	}
>> +
>> +	return wait_for_completion_timeout(&sampler->sample_handled,
>> +			msecs_to_jiffies(1000));
>> +}
>> +
>> +/**
>> + * panthor_perf_sampler_request_sample - Request a counter sample for the userspace client.
>> + * @sampler: Panthor sampler
>> + * @session: Target session
>> + *
>> + * A session that has already requested a sample cannot request another one until the previous
>> + * sample has been delivered.
>> + *
>> + * Return:
>> + * * %0       - The sample has been requested successfully.
>> + * * %-EBUSY  - The target session has already requested a sample and has not received it yet.
>> + */
>> +static int panthor_perf_sampler_request_sample(struct panthor_perf_sampler *sampler,
>> +		struct panthor_perf_session *session)
>> +{
>> +	struct list_head *head;
>> +
>> +	reinit_completion(&sampler->sample_handled);
> 
> Shouldn't you wait until checking whether a sample has already been requested?

To reinitialize the completion? I think so.

> 
>> +	guard(mutex)(&sampler->sampler_lock);
>> +
>> +	/*
>> +	 * If a previous sample has not been handled yet, the session cannot request another
>> +	 * sample. If this happens too often, the requested sample rate is too high.
>> +	 */
>> +	list_for_each(head, &sampler->sampler_list) {
>> +		struct panthor_perf_session *cur_session = list_entry(head,
>> +				typeof(*cur_session), waiting);
>> +
>> +		if (session == cur_session)
>> +			return -EBUSY;
>> +	}
>> +
>> +	if (list_empty(&sampler->sampler_list) && !sampler->sample_requested)
>> +		panthor_perf_fw_request_sample(sampler);
>>   
>> +	sampler->sample_requested = true;
>> +	list_add_tail(&session->waiting, &sampler->sampler_list);
>> +	session_get(session);
>> +
>> +	return 0;
>>   }
>>   
>>   static int session_validate_set(u8 set)
>> @@ -483,7 +1335,12 @@ int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf
>>   		goto cleanup_eventfd;
>>   	}
>>   
>> +	ret = panthor_perf_sampler_add(&perf->sampler, em, setup_args->block_set);
>> +	if (ret)
>> +		goto cleanup_em;
>> +
>>   	INIT_LIST_HEAD(&session->waiting);
>> +
>>   	session->extract_idx = ctrl_map.vaddr;
>>   	*session->extract_idx = 0;
>>   	session->insert_idx = session->extract_idx + 1;
>> @@ -507,12 +1364,15 @@ int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf
>>   	ret = xa_alloc_cyclic(&perf->sessions, &session_id, session, perf->session_range,
>>   			&perf->next_session, GFP_KERNEL);
>>   	if (ret < 0)
>> -		goto cleanup_em;
>> +		goto cleanup_sampler_add;
>>   
>>   	kref_init(&session->ref);
>>   
>>   	return session_id;
>>   
>> +cleanup_sampler_add:
>> +	panthor_perf_sampler_remove(&perf->sampler, em);
>> +
>>   cleanup_em:
>>   	kref_put(&em->refs, panthor_perf_destroy_em_kref);
>>   
>> @@ -540,6 +1400,8 @@ int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf
>>   static int session_stop(struct panthor_perf *perf, struct panthor_perf_session *session,
>>   		u64 user_data)
>>   {
>> +	int ret;
>> +
>>   	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
>>   		return 0;
>>   
>> @@ -552,6 +1414,10 @@ static int session_stop(struct panthor_perf *perf, struct panthor_perf_session *
>>   
>>   	session->user_data = user_data;
>>   
>> +	ret = panthor_perf_sampler_request_sample(&perf->sampler, session);
>> +	if (ret)
>> +		return ret;
>> +
>>   	clear_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state);
>>   
>>   	/* TODO Calls to the FW interface will go here in later patches. */
>> @@ -573,8 +1439,7 @@ static int session_start(struct panthor_perf *perf, struct panthor_perf_session
>>   	if (session->sample_freq_ns)
>>   		session->user_data = user_data;
>>   
>> -	/* TODO Calls to the FW interface will go here in later patches. */
>> -	return 0;
>> +	return panthor_perf_sampler_request_clearing(&perf->sampler);
>>   }
>>   
>>   static int session_sample(struct panthor_perf *perf, struct panthor_perf_session *session,
>> @@ -601,15 +1466,16 @@ static int session_sample(struct panthor_perf *perf, struct panthor_perf_session
>>   	session->sample_start_ns = ktime_get_raw_ns();
>>   	session->user_data = user_data;
>>   
>> -	/* TODO Calls to the FW interface will go here in later patches. */
>> -	return 0;
>> +	return panthor_perf_sampler_request_sample(&perf->sampler, session);
>>   }
>>   
>>   static int session_destroy(struct panthor_perf *perf, struct panthor_perf_session *session)
>>   {
>> +	int ret = panthor_perf_sampler_remove(&perf->sampler, session->enabled_counters);
>> +
>>   	session_put(session);
>>   
>> -	return 0;
>> +	return ret;
>>   }
>>   
>>   static int session_teardown(struct panthor_perf *perf, struct panthor_perf_session *session)
>> @@ -813,6 +1679,8 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
>>   
>>   	xa_destroy(&perf->sessions);
>>   
>> +	panthor_perf_sampler_term(&perf->sampler);
>> +
>>   	devm_kfree(ptdev->base.dev, ptdev->perf);
>>   
>>   	ptdev->perf = NULL;
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
>> index bfef8874068b..3485e4a55e15 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.h
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
>> @@ -31,4 +31,6 @@ int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf
>>   		u32 sid, u64 user_data);
>>   void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf);
>>   
>> +void panthor_perf_report_irq(struct panthor_device *ptdev, u32 status);
>> +
>>   #endif /* __PANTHOR_PERF_H__ */
>> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
>> index 576d3ad46e6d..a29b755d6556 100644
>> --- a/include/uapi/drm/panthor_drm.h
>> +++ b/include/uapi/drm/panthor_drm.h
>> @@ -441,8 +441,11 @@ enum drm_panthor_perf_feat_flags {
>>    * enum drm_panthor_perf_block_type - Performance counter supported block types.
>>    */
>>   enum drm_panthor_perf_block_type {
>> +	/** DRM_PANTHOR_PERF_BLOCK_METADATA: Internal use only. */
>> +	DRM_PANTHOR_PERF_BLOCK_METADATA = 0,
>> +
>>   	/** @DRM_PANTHOR_PERF_BLOCK_FW: The FW counter block. */
>> -	DRM_PANTHOR_PERF_BLOCK_FW = 1,
>> +	DRM_PANTHOR_PERF_BLOCK_FW,
>>   
>>   	/** @DRM_PANTHOR_PERF_BLOCK_CSG: A CSG counter block. */
>>   	DRM_PANTHOR_PERF_BLOCK_CSG,
>> -- 
>> 2.25.1
> 
> 
> Adrian Larumbe

