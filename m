Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9F4956D2B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 16:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3828710E291;
	Mon, 19 Aug 2024 14:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="KoxoQrPZ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KoxoQrPZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2080.outbound.protection.outlook.com [40.107.104.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0762710E291
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 14:26:03 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yBUOHxTD2Ha7MQX7rk1PTKA+d4eQ24xFBDKdjwz+cvszDUd+l+qm/1ErB7TkVoUNu2QZ41VOc6+syS2/Ja2fK+54LfFfpYrRwfWkXas51bAu7+4U7ueXHXa5AjymiGhoWxtWmZ70PfaD4Q2rzARcKI4LJGcirHH0CL4cQUNL/diBrkwITlDqOjruz/cuGgwi7g+yQP8GgeuIiv9LQldeIenTkFQ0gzzpsS7mPkUUQBXYSRbE5S02/8RtguX7DzjpjYCVn76mDsAGQ/0hwkqtm+FQQL4C6n0k2Z1ZYn5NC0PekoWzQl9Bssc7lVVIsDbKGfVunY8ni4Cq6clbTAqp9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVUlTBd+wk/VOfDGr3XflHiWY0YW89MDvJj0GTXJW4c=;
 b=ikcUmepx0X0ImrqJQKw1eBdCoORVbrqiu5F6ksCUhogfs2pbu8fECBxcpKq+RmYzd30/g2rI4VodWrAheZxdvhKQOBCyoFwVyduw8AhVmtj0771XCsgMymh+QMHGEcxReP/UVd8zKqwo4TpkotE8KuHoH3CZbDdW6nuOkeM+VOxCrOqnxUu3if7ezFXB9CGTHEjdyk+Y5U2qTHBO+tjkYHtyPfr8o7TU6Bbt5ua6DlAaocQgdiSkzwwcm6alAugGKpxeCEMC4ggG4KnBkadaW2PmGxYTS1WDcXyO+X1+l7lFnyxnWNtbNjwPE9OoX8RdylNsvIH3745XiUhrwsooGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVUlTBd+wk/VOfDGr3XflHiWY0YW89MDvJj0GTXJW4c=;
 b=KoxoQrPZhzS/sEts6L67Fg+cQUZesKxvGmAhJHpxpuXuMnKv5rrEF5ei7IivwKcyYjuhHcMZAI47SaTYgy+7tsWHGBDPjV6TyYWRP7Xqa6BnQELlZ9GSL+TPdtaV4ckhxjvOLEQ5FNnAQ4iLCFpHg/iQ18S0H9eOfxOdMHO+uBo=
Received: from AS8PR04CA0146.eurprd04.prod.outlook.com (2603:10a6:20b:127::31)
 by AS2PR08MB9987.eurprd08.prod.outlook.com (2603:10a6:20b:645::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.12; Mon, 19 Aug
 2024 14:26:00 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:20b:127:cafe::f9) by AS8PR04CA0146.outlook.office365.com
 (2603:10a6:20b:127::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 14:26:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.0 via
 Frontend Transport; Mon, 19 Aug 2024 14:26:00 +0000
Received: ("Tessian outbound 49bfb235ebbe:v403");
 Mon, 19 Aug 2024 14:25:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ac9670085f575ea2
X-CR-MTA-TID: 64aa7808
Received: from Ldcb6ff5ad7b7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F176D039-6FF2-4E64-8545-B27A985D1B88.1; 
 Mon, 19 Aug 2024 14:25:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ldcb6ff5ad7b7.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 19 Aug 2024 14:25:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjWwzSN7Zb/wR2mkmCKAXZqGYpUoZW5bjYdCCn4Uytn5CKYUgEj1TsLO5O3NV4q3ufRqK2STsDxHEJSEVa0JJflPsnRR+2RUJk+y701ah2FKgeFxknTh/rHYEVDt+Vmyp0qmOi7q0yd6Ul9nBFUBuiyfH4PhYLjZq63AK6EmZajjMA3gRHAMiyCMeZN+/xZHMf5EhgIAEGXW/obZBfhkzHTDm360YjG6TeEMOYiI+HLnYorYPZha1y/KRO7H1lm94fMUx2wBe28zWiy60PWpZFLuNydjRmP1lTQjqrkvFsAU2l+ZxAWJs/07orSLqrznNAv8USJuOJ5sbKFFBELCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVUlTBd+wk/VOfDGr3XflHiWY0YW89MDvJj0GTXJW4c=;
 b=x8UemSgsIhDCkUHI04sz//uIFPFlsLHCVFsLEBcWLArDPx58lueOAxxE5P/tGUtIzkKvlMnK68Qn4jxIauX9yercYSYfIa0FWFSxsJody7WVBWaVwm2bryGO7iQYxC0b3IEO3GC0JVxWIBgP/xSowdn/HaOq5gPYEQz+0lEzdXMkSLId8EhDn3nk7XKYx0VmL333Qes7/STa8zY+z5vFgapgoFjEPW0eLt3XaaD8IpEW213N8kuKQhe/RabsTrQ6dGX6myGlYXZrYVs+k+AlHkNE/mCqgKViS1ppioeENpWBxuH1XQqTJ373P0N1PsW3DYdMdJ1CfBpk6wBFTevg6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVUlTBd+wk/VOfDGr3XflHiWY0YW89MDvJj0GTXJW4c=;
 b=KoxoQrPZhzS/sEts6L67Fg+cQUZesKxvGmAhJHpxpuXuMnKv5rrEF5ei7IivwKcyYjuhHcMZAI47SaTYgy+7tsWHGBDPjV6TyYWRP7Xqa6BnQELlZ9GSL+TPdtaV4ckhxjvOLEQ5FNnAQ4iLCFpHg/iQ18S0H9eOfxOdMHO+uBo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by PAVPR08MB9699.eurprd08.prod.outlook.com (2603:10a6:102:31e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Mon, 19 Aug
 2024 14:25:49 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%7]) with mapi id 15.20.7897.010; Mon, 19 Aug 2024
 14:25:49 +0000
Message-ID: <4538ba23-ee8b-4e15-8857-d653d581bc18@arm.com>
Date: Mon, 19 Aug 2024 15:25:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
To: Mary Guillemard <mary.guillemard@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: kernel@collabora.com, Christopher Healy <healych@amazon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nd@arm.com
References: <20240819112508.67988-2-mary.guillemard@collabora.com>
Content-Language: en-US
From: Mihail Atanassov <mihail.atanassov@arm.com>
In-Reply-To: <20240819112508.67988-2-mary.guillemard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0036.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::10) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|PAVPR08MB9699:EE_|AM4PEPF00025F95:EE_|AS2PR08MB9987:EE_
X-MS-Office365-Filtering-Correlation-Id: 005d5668-ef8f-4fa3-4942-08dcc05ad925
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?MU5HTStveHJGU0hBdnFIbTFlOHVRL1I2VGxhVFNOZU1XTVo4aFFydVRZSjJu?=
 =?utf-8?B?bE1jOVhmRWF6MmNVMzhGRUs0OXYxRE5IblNUR1hCKzdpRmFGeXBXMS9DaWdQ?=
 =?utf-8?B?K2JWMzlKTVAvVTlVYXZvWk03UHhHNVgwb1ZTbk5MT2hRcGVjem54bTlBYmp5?=
 =?utf-8?B?NVRoMFRYSDREUjErQnd0cnIrWThIVllaUlhLUlBhUTl1VzdxK2xQS291UFlG?=
 =?utf-8?B?VHdlY09GOFlhaDl5UjNrK1dxTFlRNmdVUVBnaXN3K2ZTNHdZWVVjRGJaaWNB?=
 =?utf-8?B?VldwbXRsUSs2ZlNIeVVidkpBYzhaZnRPb2N5dy9sWUlMa1V5YlpzVGtRcGtM?=
 =?utf-8?B?aUw0dmdtNU5uYmFRRHg3QklZK1V3dkVWelNhTmUwWGZtRkVnZlVEa3YyODdG?=
 =?utf-8?B?d3VrOGJDUDVzSXBnZ01ldXI0ZURDZGE2bndZTzlYbDdKampad0xNV2xrc2U4?=
 =?utf-8?B?NTV0ZzJxNkhkeEV3S0c2Sk16TE53ZzlJNG1TQVpXL0syUEgwRm5jSTRPeHRT?=
 =?utf-8?B?dmo3MEYrQ2xrU3RtdDZkZEpVandNZ2h5cXJGY0lMcFVNL0sxL3VnWG83U3RR?=
 =?utf-8?B?cStvWjU0blBqNENEZUxQbXRDU3l5UWUvbllCUVNiT05jM3BaL2ZrZ1lFNnpZ?=
 =?utf-8?B?ME1WbGhPbmdqczNyVjNCS205NWp4MmZUd1lrTUROYTFRdDd3VEI3ek5wYjFa?=
 =?utf-8?B?eDVpUEU1K0RZODJ2MFVHRW11N1ZDRWlzYVJQOGxIZXhJSFU1RS83UVFNcitt?=
 =?utf-8?B?NGI3VzFPdlNxcWxnd1JzcGE4M3hzaERjbVA1L2ZLaWFSa2Y1SWxlWk1ZbXFW?=
 =?utf-8?B?UzhWNEVBNEdaeDcxU3pnQUQxZkxTeDFSa3doem0wQU5TNU9QSDZUTW94cXJ6?=
 =?utf-8?B?bkV5aXZQclMzcVF2UGR4UVFnY08waWxGMDE4S1N0aU5lSkV1NGdsbENWOTd1?=
 =?utf-8?B?eUhNU3NYQkZXeEtzcUxIUXJxaEtVelRDb2tMdlVkQXlvMnkxTFRRV2duckhI?=
 =?utf-8?B?WXZDc2s3REJGcXJFWXh6V3JkZm0ydUh1dnl2eVdWdjhyK25vUDB0L3IyZUpQ?=
 =?utf-8?B?UEMyTHorYmxNL0QyVFN0dUJhN085b3UycVFlbU9TdWRiODNRcTVZNHVWM2pk?=
 =?utf-8?B?N2V3c1JrZHNYTnBKWXNIOEhTcTBsUktQY1JGb0NxeEZmT2xXSTZPdFJRUm5o?=
 =?utf-8?B?aTVBNUh5TFdjVUZmZGRnNDl1VzBiYTFFYlFjbUxvL1NacjRLUnk3aWJqZi9h?=
 =?utf-8?B?R3pjZXJIUHVPTlZQdEZJcTNMVEhRNnFOZTd6M1YwNm1xbkUrdkJkaWc2THVp?=
 =?utf-8?B?NXVWM0U4UFR3eHQvMmcvdWF2WW85dDRvNy9raGNLR01GZ0UyZ3ZkUlVpQ00w?=
 =?utf-8?B?WTNxQmJaZm1FMzM2SGd3ald2ekVpdFgvWmpZUERXZzVWbU0xVGxqY1BYc2pO?=
 =?utf-8?B?TkdjaVJCTkdJRS9mbUtQc2NCb29HVEUxTS81RWk3Z0dLdjB4VzB3WGpndlBa?=
 =?utf-8?B?c2kwT25qR3lNdXJuL2FHdXpnem8rS2dadmdYTzhSY3E4VXRXZDR0MkdOb0VS?=
 =?utf-8?B?T2ZrL1JBc3U3TXdDeWx1SUJ1NFo2WmRoRGNicFdtanZqUFFhUlB1RjlRTTBk?=
 =?utf-8?B?MWtZS2lyeDliZHA3NjVkdjE4WW5iTHl3U2ZkNWVGR0swZk5icTZ1R1pmcTBK?=
 =?utf-8?B?eGJzV0NQeEQ3S2lva29wWEhCYXpkS0F2MGdBZFI1TnFNQ3NWSEo0S1dyNkxR?=
 =?utf-8?B?MHRoQS9uNk9NektpQzZ2MStmWnJ3OE9DQXNnVHU3SzRobXlvRHBROVdZOFY3?=
 =?utf-8?B?L3V3MlMxb2xQWmV0VS9DZz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9699
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 92b618ba-8c8f-4d66-abb4-08dcc05ad297
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RllKSzA2RFB6czBlTTBtSW40MVpIQzdoN0w5SjV1d3pvTUM1VC9VRG5hRjhG?=
 =?utf-8?B?SVdncWpMTnRnbDdGMndBRDFLTjUwOFBVYlpSNFJTTjR4RzhaOEJGdmJyaHZv?=
 =?utf-8?B?OFF0dG5neXpZcDM0Z2FEUkRYT1JlYlhxZW1XRTFiR1J5eFFmNUQwSG9ZMTVv?=
 =?utf-8?B?U3ZIZldvdTVsNXZSVEVoUWlZb250VzZUZ21nSG9yK1RkUWJxN0dWNzQ1VmE5?=
 =?utf-8?B?NVlsN21jUk5FWWdvN2lsRFNOMnRHZDdqM2ZBVGJjejdxcjRwZ1krOXNNOW5F?=
 =?utf-8?B?eXNINnB3c09YTFIzRGdhMThYMzhycUM3b0tka3JheWV0VG5uNzI0dUl0VlpM?=
 =?utf-8?B?cGhrMElGc0NLdFRjb0I2djhWekR1V1BmczhpaWFTTHdNMlQ3TWNwQ3JJZnlO?=
 =?utf-8?B?ZGs0aDFIeFFjc3ZoY3VKRFd6QkI0QkdTNXBkajBKZmhVNTMwSDhwQUphYjM3?=
 =?utf-8?B?QjF6MitaZ3VaVzlPQ2JWaTdnZysrZHBUamVENHJFVzhDaFR5S2FydmdDeHpM?=
 =?utf-8?B?WGFTbVpEWTBKbGl5WVRVRHhkNXVKaGNKSTUrUXpIKzNkQlpoVjZDU0V1Zk1F?=
 =?utf-8?B?L0gveGFiR1UrWG1mZHkrLzAzNEJMSDcra2YvZTAzN2RITTZaZnNvbytMaGN4?=
 =?utf-8?B?aGhSVHd3czlweDFKU2xpbzJNa29QVUlWQ3h3aUs3V082d1ZkcnEvdGRkS2Za?=
 =?utf-8?B?b2VNRy9uRVZlRll5N0Q0OE1ySXkwZU5uVHVWaEFnSkpha2F3MzNXM29MaWFC?=
 =?utf-8?B?T0JGbWpKV1ZFNHgyTTkxSVhYcVRoSmpRYzFEcGM5TVF5dzNDMTZNd01GYUxK?=
 =?utf-8?B?V1YzS1F5Z2FJR0UxMVY2TlZFUTZET2ZRajM3V08zWmdsdXVUYnBjYkJFWkhp?=
 =?utf-8?B?d2JFcmRJeWY5K3VwVVBtcmtBd1MzdnpQUjdKcXNHeUlFVW9nS3Y1bk5GK0Rz?=
 =?utf-8?B?M2tEbGdYQ1ZkZmhJamE4V25RSFJaWU5zM25BT25Kdkd0eVA5NHdLQWc0SlJ0?=
 =?utf-8?B?dmJqWkVmQ3VNQVVaMWl1SWNKaGtLais5cytSdXA2Y1VOYTBoYkovZFc2ZndX?=
 =?utf-8?B?cFRSakpvZVlzdGF2Y1U3Sis5UnY0YnBkV3BUSlVPK051WXZXTVcvN2ZJa29o?=
 =?utf-8?B?S0VCSUZQYUlpNWdSelFTb1p2eHR2NWtuUjYzVHl1YTFuWDk3TmpFN0Y5WGpz?=
 =?utf-8?B?WC9aU2RvVHJ0SHVUaXJCQXBQb25mbEliWXFiWUMvak9EUHpFRWk4TXNvS3hW?=
 =?utf-8?B?bEdDUzJlWllzR1hPRzZtV0VnWG4vb3pqM3RneDRoSFVrK21MTVBKWWZ0V282?=
 =?utf-8?B?OWp1YnAzaWRQNEdBcFlaMjJTaUR6b010MGNtZml2UUI2Z0kzRDFMMGRvcGpJ?=
 =?utf-8?B?dURjSG1XSjJCeDlvOHNvMUZ5dXZtYTVIQmdMSVpnL29RMEo2N2FSLzV4NDJy?=
 =?utf-8?B?QnFlckgxcG1LL3NGcHI4Y0I1TmlvaHdVb2FldmdKbmptbnI2MXFGRU5nRlJv?=
 =?utf-8?B?N3MzSDJDUUMxbE9xZnBialZLUEJ4cGxEeFpXeTNNMFYzMkZWWU1DbU1YT1dh?=
 =?utf-8?B?Ujd3WkVPYis3SHN2aENEOE5JaHpDSUJqRGR4UWZxaXNNY3ltMTdxbWNRVXNM?=
 =?utf-8?B?cWRZTithejJiMEloN21yazBQTG1rMnBxRldKdlpsb0NJemJadm1jLzZjeEFm?=
 =?utf-8?B?VnFBNC9keW94YUVsZWtDdGdOS2s1c0NTNEJwOUJKcWl2TzZZRmx3ZEJBSXUw?=
 =?utf-8?B?d3phcTkwenZWU3A4SGFOOFB2QndOcHc3bjFFM2liWTJ4N2wvQ1AyMTdsS0JK?=
 =?utf-8?B?Sy8vdDNZTHE3TUsydC9Nbmwyc2hUam90Y0Vmcnpubys5U3hsbythNEoyRlVu?=
 =?utf-8?B?UmZrNTBybTlkbW0wd2tIYkkwOVcvWkh2TUlvMEMvWDBjWjVqalZsUFIreE41?=
 =?utf-8?Q?oyrlyEpQ9KXbSvYKVqYEBIXi0oj9p4DM?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(1800799024)(36860700013)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 14:26:00.1519 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 005d5668-ef8f-4fa3-4942-08dcc05ad925
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9987
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

Hi Mary,

On 19/08/2024 12:25, Mary Guillemard wrote:
> Expose timestamp information supported by the GPU with a new device
> query.
> 
> Mali uses an external timer as GPU system time. On ARM, this is wired to
> the generic arch timer so we wire cntfrq_el0 as device frequency.
> 
> This new uAPI will be used in Mesa to implement timestamp queries and
> VK_KHR_calibrated_timestamps.
> 
> Since this extends the uAPI and because userland needs a way to advertise
> those features conditionally, this also bumps the driver minor version.
> 
> v2:
> - Rewrote to use GPU timestamp register
> - Added timestamp_offset to drm_panthor_timestamp_info
> - Add missing include for arch_timer_get_cntfrq
> - Rework commit message
> 
> v3:
> - Add panthor_gpu_read_64bit_counter
> - Change panthor_gpu_read_timestamp to use
>    panthor_gpu_read_64bit_counter
> 
> Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
> ---
>   drivers/gpu/drm/panthor/panthor_drv.c | 43 +++++++++++++++++++++++-
>   drivers/gpu/drm/panthor/panthor_gpu.c | 47 +++++++++++++++++++++++++++
>   drivers/gpu/drm/panthor/panthor_gpu.h |  2 ++
>   include/uapi/drm/panthor_drm.h        | 19 +++++++++++
>   4 files changed, 110 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index b5e7b919f241..444e3bb1cfb5 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -3,6 +3,10 @@
>   /* Copyright 2019 Linaro, Ltd., Rob Herring <robh@kernel.org> */
>   /* Copyright 2019 Collabora ltd. */
>   
> +#ifdef CONFIG_ARM_ARCH_TIMER
> +#include <asm/arch_timer.h>
> +#endif
> +
>   #include <linux/list.h>
>   #include <linux/module.h>
>   #include <linux/of_platform.h>
> @@ -164,6 +168,7 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>   	_Generic(_obj_name, \
>   		 PANTHOR_UOBJ_DECL(struct drm_panthor_gpu_info, tiler_present), \
>   		 PANTHOR_UOBJ_DECL(struct drm_panthor_csif_info, pad), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_timestamp_info, current_timestamp), \
>   		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
>   		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>   		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
> @@ -750,10 +755,33 @@ static void panthor_submit_ctx_cleanup(struct panthor_submit_ctx *ctx,
>   	kvfree(ctx->jobs);
>   }
>   
> +static int panthor_query_timestamp_info(struct panthor_device *ptdev,
> +					struct drm_panthor_timestamp_info *arg)
> +{
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(ptdev->base.dev);
> +	if (ret)
> +		return ret;
> +
> +#ifdef CONFIG_ARM_ARCH_TIMER
> +	arg->timestamp_frequency = arch_timer_get_cntfrq();
> +#else
> +	arg->timestamp_frequency = 0;
> +#endif
> +	arg->current_timestamp = panthor_gpu_read_timestamp(ptdev);
> +	arg->timestamp_offset = panthor_gpu_read_timestamp_offset(ptdev);
> +
> +	pm_runtime_put(ptdev->base.dev);
> +	return 0;
> +}
> +
>   static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct drm_file *file)
>   {
>   	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
>   	struct drm_panthor_dev_query *args = data;
> +	struct drm_panthor_timestamp_info timestamp_info;
> +	int ret;
>   
>   	if (!args->pointer) {
>   		switch (args->type) {
> @@ -765,6 +793,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>   			args->size = sizeof(ptdev->csif_info);
>   			return 0;
>   
> +		case DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO:
> +			args->size = sizeof(timestamp_info);
> +			return 0;
> +
>   		default:
>   			return -EINVAL;
>   		}
> @@ -777,6 +809,14 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>   	case DRM_PANTHOR_DEV_QUERY_CSIF_INFO:
>   		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->csif_info);
>   
> +	case DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO:
> +		ret = panthor_query_timestamp_info(ptdev, &timestamp_info);
> +
> +		if (ret)
> +			return ret;
> +
> +		return PANTHOR_UOBJ_SET(args->pointer, args->size, timestamp_info);
> +
>   	default:
>   		return -EINVAL;
>   	}
> @@ -1372,6 +1412,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>   /*
>    * PanCSF driver version:
>    * - 1.0 - initial interface
> + * - 1.1 - adds DEV_QUERY_TIMESTAMP_INFO query
>    */
>   static const struct drm_driver panthor_drm_driver = {
>   	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> @@ -1385,7 +1426,7 @@ static const struct drm_driver panthor_drm_driver = {
>   	.desc = "Panthor DRM driver",
>   	.date = "20230801",
>   	.major = 1,
> -	.minor = 0,
> +	.minor = 1,
>   
>   	.gem_create_object = panthor_gem_create_object,
>   	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 5251d8764e7d..ef66cfea6f1f 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -480,3 +480,50 @@ void panthor_gpu_resume(struct panthor_device *ptdev)
>   	panthor_gpu_irq_resume(&ptdev->gpu->irq, GPU_INTERRUPTS_MASK);
>   	panthor_gpu_l2_power_on(ptdev);
>   }
> +
> +/**
> + * panthor_gpu_read_64bit_counter() - Read a 64-bit counter at a given offset.
> + * @ptdev: Device.
> + * @reg: The offset of the register to read.
> + *
> + * Return: The counter value.
> + */
> +static unsigned long long

[nit] s/unsigned long long/u64/ ?

> +panthor_gpu_read_64bit_counter(struct panthor_device *ptdev, u32 reg)
> +{
> +	u32 hi, lo;
> +
> +	do {
> +		hi = gpu_read(ptdev, reg + 0x4);
> +		lo = gpu_read(ptdev, reg);
> +	} while (hi != gpu_read(ptdev, reg + 0x4));
> +
> +	return ((u64)hi << 32) | lo;
> +}
> +
> +/**
> + * panthor_gpu_read_timestamp() - Read the timstamp register.

[nit] Spelling, `s/timstamp/timestamp/`. Ditto below.

> + * @ptdev: Device.
> + *
> + * Return: The GPU timestamp value.
> + */
> +unsigned long long panthor_gpu_read_timestamp(struct panthor_device *ptdev)
> +{
> +	return panthor_gpu_read_64bit_counter(ptdev, GPU_TIMESTAMP_LO);
> +}
> +
> +/**
> + * panthor_gpu_read_timestamp_offset() - Read the timstamp offset register.
> + * @ptdev: Device.
> + *
> + * Return: The GPU timestamp offset value.
> + */
> +unsigned long long panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev)
> +{
> +	u32 hi, lo;
> +
> +	hi = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_HI);
> +	lo = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_LO);
> +
> +	return ((u64)hi << 32) | lo;
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
> index bba7555dd3c6..73d335859db8 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.h
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.h
> @@ -48,5 +48,7 @@ int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
>   int panthor_gpu_flush_caches(struct panthor_device *ptdev,
>   			     u32 l2, u32 lsc, u32 other);
>   int panthor_gpu_soft_reset(struct panthor_device *ptdev);
> +unsigned long long panthor_gpu_read_timestamp(struct panthor_device *ptdev);
> +unsigned long long panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev);
>   
>   #endif
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 926b1deb1116..944f5618aa05 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -260,6 +260,9 @@ enum drm_panthor_dev_query_type {
>   
>   	/** @DRM_PANTHOR_DEV_QUERY_CSIF_INFO: Query command-stream interface information. */
>   	DRM_PANTHOR_DEV_QUERY_CSIF_INFO,
> +
> +	/** @DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO: Query timestamp information. */
> +	DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO,
>   };
>   
>   /**
> @@ -377,6 +380,22 @@ struct drm_panthor_csif_info {
>   	__u32 pad;
>   };
>   
> +/**
> + * struct drm_panthor_timestamp_info - Timestamp information
> + *
> + * Structure grouping all queryable information relating to the GPU timestamp.
> + */
> +struct drm_panthor_timestamp_info {
> +	/** @timestamp_frequency: The frequency of the timestamp timer. */
> +	__u64 timestamp_frequency;
> +
> +	/** @current_timestamp: The current timestamp. */
> +	__u64 current_timestamp;
> +
> +	/** @timestamp_offset: The offset of the timestamp timer. */
> +	__u64 timestamp_offset;

Are you sure you don't want the cntvct_el0 and cntfrq_el0 values here, 
too, as separate fields? While they're not values coming from the GPU, 
they are related. Getting the lowest delta possible between querying one 
timestamp register and the other is quite useful for tooling. Requiring 
userspace to do two separate queries, one for CPU time and one for GPU 
time, doesn't feel optimal, your max deviation will necessarily be 
higher that way.

> +};
> +
>   /**
>    * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
>    */
> 
> base-commit: 3e828c670b0ac8a9564c69f5c5ecf637b22a58d6

-- 
Mihail Atanassov <mihail.atanassov@arm.com>

