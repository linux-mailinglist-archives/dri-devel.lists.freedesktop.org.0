Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FC79ED249
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 17:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3CE10E3EE;
	Wed, 11 Dec 2024 16:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="a+OAi4pB";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="a+OAi4pB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2075.outbound.protection.outlook.com [40.107.22.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590BB10E3EE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 16:41:11 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZF5eUKA4gR87CgfOT+EZZYV/vOkcxnJEyf1e1EHLqM+ACsicE3GISE6ygcg+cYEj2PUiWKyEJ6OGbJ3FOdkoCsVCXYKJrY6+CbfK7lME9rxPWnxlTbdqBjeFSiIkEXpas5wk9H3IMbLCaVA05da5ytzvPBMbkrebcjEuYbbGyLQq5+KEGDDGdG5bSH7VM5aYmW0r5WQdcqOEAeMDZSLVR0sI+GK+1+x8xfM5TUOySW+MXFsYyffasktakRda5TAcXxD7zZAG/i+OJat7235C8xSA7dR+QllkTHnwicaXRweE31fhzqE616lgkHfWJi/MEJ03He03hXVbAGSrKRxwXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMcPW/PW41mSF0ipfeQSiR5086zQU755QYsBd5D2Y2w=;
 b=Zcn6xammpUyxsAAKIc/OuUMydS0bQqb5B4sEQJflmBOsLty2K7pD35BN7+Q/upaxA9yoQIomPW6cqA0h6tKKHYowhivAM8F9tdNODYtp0lvmyrrQbBaKbS4mYdtxVmbwaL277sOAlbEYa52qQ8LUSRrRdTdZmRrzkZuP2eU4IxU753jyMq1YnziRGt8MxwEe+oqi9vaJvltG9izdIV//DfSIXX4BY8nC+KUn1VyibsDxGxQWtKidZkM0E8uch6QWppTwcGKpB4+5ggBNMMtZ/Omn20a29nim1a8AViywC9JkMZVXisYp0ya9MZsIDDnc+URkbKW4CIEG1ucrVTqngA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMcPW/PW41mSF0ipfeQSiR5086zQU755QYsBd5D2Y2w=;
 b=a+OAi4pBFxQFhIGDxrnT+dwwjuLL6iSEQqNWIq41nh4WVg3dBPnyb/S+7aw0t0IWesUhvTVcEYG979PQstact1qw6veyeWXuF+slEqzejizvMWu+NvU76wL5eELPzOUApAZyRPEVIHuL/zQx+D7wq7Ozcfnq0muWc76YYc1B4qk=
Received: from DU7PR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::15) by AS8PR08MB10004.eurprd08.prod.outlook.com
 (2603:10a6:20b:63d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.19; Wed, 11 Dec
 2024 16:41:06 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::5e) by DU7PR01CA0012.outlook.office365.com
 (2603:10a6:10:50f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via Frontend Transport; Wed,
 11 Dec 2024 16:41:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 11 Dec 2024 16:41:03 +0000
Received: ("Tessian outbound b1586bb311c4:v524");
 Wed, 11 Dec 2024 16:41:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 36646008b8be89d1
X-TessianGatewayMetadata: mLSsDC93NdeDNN1l8krgpfpSNm719b+h0VM4pKv7nc63nyqpil5fT32+nFXkUbP45sr1X8ju1qVX3elirXWntaOmAqBM5L1Ge1ytce5IuG6SRlvGdHhzae4dCSCTxzpxEIP0e6AjWyeAiNzRgZdj4LFOQPVbjOvxKNLyRN4Y9RI=
X-CR-MTA-TID: 64aa7808
Received: from Lc95972ae26a8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C55067DE-A161-4BF8-B8F0-3547A4E5CE23.1; 
 Wed, 11 Dec 2024 16:40:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lc95972ae26a8.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 11 Dec 2024 16:40:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZIqMx8y61KsVKTKzhWxxKK8vWCV0YZSKxcf5aYufwIpBm02mP0WYYFthQ0BGZCH89FEeWW2BU+hdow8T8ZLxFDhBE8CGHlKr2ki2Ku5+pbAHTXbpwQJvoI8Oo1VsJge+WhkcGi4VTKBEvqloiLyF/neVALigfrwM32h0Oy3EmShyCavi6QaCjgMJ92RBht5e2AQL5u/IUXr5cE++jpc8BYKWNZOJPNM/DVdo3fzE9Ev24UpdQjuL/nXRJhHl1Jh3XK/1ikkmtZMT62p2ehvQ9uL7KdFjGsp7aLRkK7cBTaz0q8dWSenuVp/3CbUJtX5JhynNvRWA2ROiPoIySuRFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMcPW/PW41mSF0ipfeQSiR5086zQU755QYsBd5D2Y2w=;
 b=dXtIsworbnNr3OOVobsiM3i7bkVaGT4IqUDLMR/Gd1qpuUTEZYo/6Mv2f0XCT/RQRvxNoSjJSdqrlwMikDrTJfbfAkRWBbdyq8Gbc9Bw+aqeYOPYB4lLJ7iXS6U6pmyMg83yH7QRV7ygL+BKkdwZQgNc5Spk4y8KB1Hr86GVfSH7AV8QkOxIUtPmMfotFR7UCrZcbPxDH6nerRuqPfjMC01B+6OLJoCyT8UzvVTjFNb1V/5BBEe8dDT4K0rDu3nLL+rAvnzb+eWCBSBziBI8CdROZoKmW+ekGQEI8znr6a9G957Wu3kAOi4L1yydKIhcLouvowZ55wLtz7oP30lQzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMcPW/PW41mSF0ipfeQSiR5086zQU755QYsBd5D2Y2w=;
 b=a+OAi4pBFxQFhIGDxrnT+dwwjuLL6iSEQqNWIq41nh4WVg3dBPnyb/S+7aw0t0IWesUhvTVcEYG979PQstact1qw6veyeWXuF+slEqzejizvMWu+NvU76wL5eELPzOUApAZyRPEVIHuL/zQx+D7wq7Ozcfnq0muWc76YYc1B4qk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by PAVPR08MB9014.eurprd08.prod.outlook.com (2603:10a6:102:326::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 16:40:48 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%4]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 16:40:48 +0000
Message-ID: <85010ca7-0c34-4be6-9dfa-5be742ded25d@arm.com>
Date: Wed, 11 Dec 2024 16:40:47 +0000
User-Agent: Mozilla Thunderbird
Cc: nd@arm.com, kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boris Brezillon
 <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v4 2/2] Documentation/gpu: Add fdinfo meanings of
 drm-*-internal memory tags
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
References: <20241211163436.381069-1-adrian.larumbe@collabora.com>
 <20241211163436.381069-3-adrian.larumbe@collabora.com>
Content-Language: en-US
From: Mihail Atanassov <mihail.atanassov@arm.com>
In-Reply-To: <20241211163436.381069-3-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0386.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::14) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|PAVPR08MB9014:EE_|DB1PEPF000509F9:EE_|AS8PR08MB10004:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f28ff22-9455-4262-707d-08dd1a029a5b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?R2NnZlFBLzJwYXh5SmVJRHMxdzV3dU1iSGZRcUNEV0g3aTR3VDNKbWhYb0ht?=
 =?utf-8?B?bGdZa3UrQzNmV1dlZ2tiVEE0T0tra0lURzNiTXZGQkpRTXN4bVRKd2QwM2dE?=
 =?utf-8?B?MHpxU3pSL1RYQ3lHdFF1Vk5jU2xyQTFnS0hWZ3BYb1c4SGVBak02bVhreUNh?=
 =?utf-8?B?dU9KQnR2dERvOHI3UFlnTG9UK2RlWDN6SnVmYS85WFArRG5NWkRVeStEU1J4?=
 =?utf-8?B?K2VRSG11aWVBRTdldDA4NXhvbjE4R2RlcHNUeCtNWTdwTkxZL1NmQzFYSmJN?=
 =?utf-8?B?RldRaWh4ZnA0Z3VuNEZjM21CVnJzSFZmeTZHOUw3c2xQZjNGNmVGMlRmNEp1?=
 =?utf-8?B?WG1RakdxSVh0SU1mK3lRcTFVQWxxM2NWbHE4OEU2dGVwOHlSZTFpZnFkOFNk?=
 =?utf-8?B?RVpsbHF4TmhPZGdFRkR4bW0vaGkreW1TNTk3SHZsMXdKQzZCRFppR2c5N0o1?=
 =?utf-8?B?Uk1FcVdIQzNnNFNZaHRFRWlvMSsyZ2llWnpDMW5nTFFmOXMxdjd5WWVqUVIr?=
 =?utf-8?B?OWxjWTNGUHUzeU9NbWY0ZTlueE9RTDdtT0FBUWsyVnpqT0NpdVp4OVNjYzhz?=
 =?utf-8?B?eGlEZGlvbUROditNTDF6YzV6RlZueU16eWt1UTdPZ1hOWVlwRDJJUXlqN3Vt?=
 =?utf-8?B?bXhZMnlLVDUvWTZBakxlVGlieUlsQXdjWEppSjdJN1k1SFNZYnZ6NytOMVBp?=
 =?utf-8?B?Y3JTeFhnTm9pSnJiaTR6c0tzU0pOVnhsUG4zdW1pN3BsemhnQkVhTE9mdW1i?=
 =?utf-8?B?cTVsYTVTOStRZmJQdmVEYTRRRlcyWnV3VDhQSFEvUlBjUE52RndUY1ljNzlE?=
 =?utf-8?B?Z1JJM3NuQ0ZRaTdJTm5tcXFsMEt4cjV4bnl3ektLRFM0NVhwWkRoejJ5ZVU5?=
 =?utf-8?B?ZDN2alpHSCtZMG5oK1gxN0tDaFNOczVrNUpDR2Q2a2JsUUVQVnBsRk5XRWdM?=
 =?utf-8?B?bmNrM3FZNUZNbElRM0NoeUFWQm9YVDRVOTBiaUNCbmRWTEw2M0VJNW5ITWMv?=
 =?utf-8?B?SVRUZUlMUDJkQ0lyQnJzWDVTc0pPaHBFS3VZbWU5OHFBUnk4RXN3eXhQQVF3?=
 =?utf-8?B?c2tMMjNFZ3Z0UkxveWQzVmhjam4rUWhVMkJlQW81SkxoRm1LWnJpMjlLN3Zx?=
 =?utf-8?B?TU90MFJtRVNLTFVMaFFqaTg5cDMwdGRiL3BvRUNiMVg0d3hUSis0dFFqV0Za?=
 =?utf-8?B?YTNwc1Y3emp1SFMxNGdROVN5enRyM3M1YzFGOG43bkt6OERjRUdVVEYybDlF?=
 =?utf-8?B?Z2ErTGkwY1Z3Z05SS2lqbFNhTUV3R24wc1F0b0hXVTFLUm5TcENWb2hnTmd0?=
 =?utf-8?B?ZVArdzhLY2VSYy9JUnpKaG50bTRvRXRuc3ZlaUtuK0JLUDcxdjdoTjlTejEv?=
 =?utf-8?B?SndvckEwd2YxSkZPREE5Ynhwb0wybncvaEgwUnpUUVpBYlhTb1BSY0MvQytx?=
 =?utf-8?B?RktYNithaER6RnBCR2QwR2gwdWU3LzdDeE9MajFnTktWWk1CdnZ5M0Ezektn?=
 =?utf-8?B?OTYyTDByYXhHMlEwcjUrTFZNY3YrVjdOaG9xL2ZTZnBBWTBacWpkWXl6ZHV2?=
 =?utf-8?B?UytBTzczbUdPK0lEeVlhdFkyeVRZVG00VUlWYU51bzA1RFBsMmRkNmxLOUtl?=
 =?utf-8?B?YW92TWVlS056NGZRcGYvM0ZTQlFJc2hjR05NUm1RMDZ4SkV1b1cxbEFGeDZQ?=
 =?utf-8?B?ZGVydTl1emxhQXA0QS9Gd0pteDVqcS9sSFUrdThIZ1VWbXRseUxLWVVzVXBU?=
 =?utf-8?B?M0ZRYm50VDBBb3FqUWtzQmlrV3MyUXM0aGlkbWFVQTQ1dkIwQm9nN1IyWHho?=
 =?utf-8?B?QmZHazNDSEs0SmNQbWpUUT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9014
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 01135f8d-a026-43f0-8808-08dd1a02911f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|82310400026|376014|1800799024|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alg5aGtJVENjcmQwbGIzU3pNQzZRZ2ZoK25SK0NnQUgxVVpEclV5V29ESkZX?=
 =?utf-8?B?bk4ySE5HZEwrSDNqblRKTEZjNjVSd3pYNmxQZTJiTXZhZHJHMVlrK3ljRXVh?=
 =?utf-8?B?andpSEMzSTdZalFjcHVvSFV6WWJVYmx0ZEdqdlRXWktjc1pOM2k4WDU0ekt1?=
 =?utf-8?B?VU4wM245dmZSQXg2dW95QWNlLzd3dzhlbUtzNWl0QVdZZlR6eHk2Q1pxK2Iw?=
 =?utf-8?B?bWZldzhTUzRpUElMT2tYZUNtcWJWSGpUZU9yWDlJSm0wbEtQaytoK29lZWJG?=
 =?utf-8?B?Ty9xajIxK05MQlBlRVhVeWJvUlBOZTRFYlNOV0s3czZkRFNUY1pLYVdxNE9z?=
 =?utf-8?B?NmVkQWFPTWN4eWtkRTFRQjRVVnozNlNKaDZyY24vZlpBUlliRVlQeGYyTkJJ?=
 =?utf-8?B?NWh5NDVGOUNmaUJ5Y2cxMDhCdk04RUFPWHFwcEJXL1d6dnVYMTNKajdnZVlm?=
 =?utf-8?B?WDJrQ2c4S2hITW9vY3ZoVFlSZ2RiMU4yQWVZNTVSUkppanVOZm5qZXgrM0NK?=
 =?utf-8?B?V2Q3WXRtNW56ZXRVNjBnVTlkb2ZWYWIxSFgva282NUZJdUtKUjZUY0prdG1P?=
 =?utf-8?B?cUZHZGVtS3JXaVYxSGRpbmpwRjFWN3V2VUF4d3hwb0lXTTh1RlF2eDc1blFa?=
 =?utf-8?B?Q0hpa3ErQzVuaGM2d2paSzRtc21yakZsUC9Ec21yUFc2dURnaWtoWFBiOVdh?=
 =?utf-8?B?RWFDYWlORWxhbXNDTG1sZnVYRFpsTXFXRlNVQXBBcVk0cWNDdVVzYU1tZld4?=
 =?utf-8?B?aWhxN1V3cXJkbmRyUC9rbHNKNDUzTE9CaE84bUJ6bllMb2JGM3FPNm5nd0RK?=
 =?utf-8?B?bEh1bHp0czV6OUV1blM4ZGxzY1dYNm5nQXc0OEkwclRhdFNjcUJjcGUvbWVK?=
 =?utf-8?B?R3FLK0U1UVJLMXU4ZjJVUmZBa0prSHVSUzZSTGJYc3BRamZ2dkRHbUhIc21L?=
 =?utf-8?B?bWxTWEt2dTRVeW9pOUQ5SUlUZFE0djlib2RuZDlhNUxUZjI1ejlmZmYxUmVY?=
 =?utf-8?B?d2xUb0tmaWF3MlpkTHdoWTZaaTAyR0lNS1JyRGdOcnh6emhVWURWdk9HaHg2?=
 =?utf-8?B?dDV6alAxRlkwOHZ1Vk1jU0VBbEY3VXZpNGdqcTREckNQWUNBYkFZMUc1aWFl?=
 =?utf-8?B?UUlhRmo2NHMwMStTMUs3MjNtOVIwclZKYzJCYlR1elBzQlp1QlNQSFlQL3F0?=
 =?utf-8?B?QzFDeWhqTk1EY3pvL2NuKzZNa0hTOWtIMGFueDlLV29LKzN4bTI3S0xyRkRa?=
 =?utf-8?B?blRsVktSZVpMRG81aFZpNkl5ZEJBTjRSNm9zRG9UdHRkQUsrT1BscFFjTzBC?=
 =?utf-8?B?Smh1VzB5UkF2SXlDaW50SlhqVnBhQ0doWm93WHF3UThWQVF0UlNpVFRaZkE1?=
 =?utf-8?B?bGNlY3JDT0NES3kyM2FGcXh0SEo3cjB3WEZWQVBlbjNwSzl1WVFRS2I1Q1JF?=
 =?utf-8?B?MFlTR2RTdERYN1FaUnR6ZkhmMTFWQ0YzOFhYZGlOZU9GcEZqbncvRE16cGlX?=
 =?utf-8?B?N2hFWUJ5SlVSSElvSCsyWUd6anNPK21hdmxHOFNjTkdQSTJtV09UUmsyQzE5?=
 =?utf-8?B?UUtDNFRnd1RQalhERXdEY1ZIbm5SdFdOSGEwSnJRZGNvRVN4ZlIyejdKVVkx?=
 =?utf-8?B?YktuRGt0SURxMlArSHJpMklPTGRNa0FQN1dNMk9SemVOQlY3WldSY0xMWGFo?=
 =?utf-8?B?Y2pNY1NabXBYQjI3blJwbklXRVJXZWFIZWhqTGU0NEQwdGNvTjhCb25ITzlJ?=
 =?utf-8?B?ZFdiN0xGNmx6QlRYcjdIUm5NbjJ5YWxWOGdheFdSUVhUR0szc09pcXg4SVYx?=
 =?utf-8?B?NGtLeHNQdDZoVnk3a21NK21tWHpUTGRldHQ3Q01HT3pyVFpjWnIzUmh0Nzd2?=
 =?utf-8?B?Z3lNcGt5MlY0TXpRL3lWWE05ekUwSTdNeFhScVhnMTJ4a0VvSmVTalJ5emph?=
 =?utf-8?B?NU1DTkljSFRLLzlkVVd3WFlIbXRNbU0zbnFKa0xJeGVyWGVZbWFWa1pleVZw?=
 =?utf-8?B?Yy9HWWVaWkVRPT0=?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(35042699022)(82310400026)(376014)(1800799024)(14060799003)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 16:41:03.8106 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f28ff22-9455-4262-707d-08dd1a029a5b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10004
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

Hi Adrián,

On 11/12/2024 16:34, Adrián Larumbe wrote:
> A previous commit enabled display of driver-internal kernel BO sizes
> through the device file's fdinfo interface.
> 
> Expand the description of the relevant driver-specific key:value pairs
> with the definitions of the new drm-*-internal ones.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>   Documentation/gpu/panthor.rst | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
> index 3f8979fa2b86..c6d8236e3665 100644
> --- a/Documentation/gpu/panthor.rst
> +++ b/Documentation/gpu/panthor.rst
> @@ -26,6 +26,10 @@ the currently possible format options:
>        drm-cycles-panthor:     94439687187
>        drm-maxfreq-panthor:    1000000000 Hz
>        drm-curfreq-panthor:    1000000000 Hz
> +     drm-total-internal:     10396 KiB
> +     drm-shared-internal:    0

You give an example of `drm-shared-internal`...

> +     drm-active-internal:    10396 KiB
> +     drm-resident-internal:  10396 KiB
>        drm-total-memory:       16480 KiB
>        drm-shared-memory:      0
>        drm-active-memory:      16200 KiB
> @@ -44,3 +48,13 @@ driver by writing into the appropriate sysfs node::
>   
>   Where `N` is a bit mask where cycle and timestamp sampling are respectively
>   enabled by the first and second bits.
> +
> +Possible `drm-*-internal` key names are: `total`, `active` and `resident`.

... but don't list it as a valid key name here.

> +These values convey the sizes of the internal driver-owned shmem BO's that
> +aren't exposed to user-space through a DRM handle, like queue ring buffers,
> +sync object arrays and heap chunks. Because they are all allocated and pinned
> +at creation time, `drm-resident-internal` and `drm-total-internal` should always
> +be equal. `drm-active-internal` shows the size of kernel BO's associated with
> +VM's and groups currently being scheduled for execution by the GPU.
> +`drm-shared-memory` is unused at present, but in the future it might stand for
> +the size of the Firmware regions, since they do not belong to an open file context.

-- 
Mihail Atanassov <mihail.atanassov@arm.com>

