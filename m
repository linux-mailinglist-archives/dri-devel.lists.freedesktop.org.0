Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E66C03791
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 23:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873D010E1EA;
	Thu, 23 Oct 2025 21:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="mkiud3W4";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mkiud3W4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BBE10E1EA
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 21:00:25 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cbdNi6/1906yfAWl+FTdGg1Sj4K5l7t2HjOOCYLgwVQk1jHX7yAsc9+2e2t6rS8JqIqp4oEHPkk0XAygCAjG4t6MApjIkLfG1CMZJE53/m/DK8YtM0x8gshTUYZWoF2lUbHmD/IfPEA2+t5+XotNbBq7nKlCrBZT60yOYERcITPerKkwjmGDVUivNNT045eVoJ7yqErJi+8NQleN5w7KaYaKPlB2OrAcD2i49aj2aHD+G5I6rvD2dgU7haEqCFu/WPeCPZBx+hI2/hnLGZH7ddhWFq1yvtkWvLjRk4NHbbvI54eW4fOXIFa0/ZIgfTSpYGL51Vibe1/kfvDbq6GNyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Q/ZgOhwFqyIpSM0g3yLsixmVVTjMOOnNFaD7t4YAXI=;
 b=kBApJn83hubd681PErNngJsl13otGIB0AF1Z/zHwQ7/4t2vCUgdYS14urCUkdDbby+BFRdgnNUc1qNdQ3Qvf9RbghJhJK3fOCf39y0woVRli8lt3xKTCOASzgeW8v8ytjr0Ox16nDG9z8bvPDxCfpY2RcpTN2rVd0meF7VC40n7L+9B/it8SHjzj06Z8bXIs15MUqDkvr3C9L0pMhhIz63PYzYM91ktHE/HU/BYpjS5xI7l8CCxyRQFzyXKcy5GDgMeGgYFTYDHuF/eqgMO6vQpxYoEIertI/oPdxIu/QKNx3jGBqTIhKhCIJhe7CkieNpPuqMhold7A3vkGgCOoJg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Q/ZgOhwFqyIpSM0g3yLsixmVVTjMOOnNFaD7t4YAXI=;
 b=mkiud3W4OPYS/zGWIz0YResjkyKLza9SFbOyc1Pi7Y7eIRjAKz6tBqxxMauvJA3Q1TcF4XBFsGRgmglMU7vIgexVp0mzT8Oa/YMMh9f5zad1uyPiA1HxizydgF72Z5rMVhXTDS+cZuPwpTuvem8b9Cu5F6UsElMUhr6Uj4r7A+s=
Received: from AS4P189CA0060.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::15)
 by DB9PR08MB11380.eurprd08.prod.outlook.com (2603:10a6:10:60b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 21:00:21 +0000
Received: from AM3PEPF0000A794.eurprd04.prod.outlook.com
 (2603:10a6:20b:659:cafe::c8) by AS4P189CA0060.outlook.office365.com
 (2603:10a6:20b:659::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 21:00:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A794.mail.protection.outlook.com (10.167.16.123) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Thu, 23 Oct 2025 21:00:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5OIcEPjhK27LcFkPdy0vP0RpcnW8VFOPFrjRUU+K74CnUMT16OTc5vCB7K5eH/7huvM4E5NuNTBayVTNTyTwmPHaGEZz8OElzOrwHyHHgXk/DkGIlZzoSJaDjIPNJUZnnbXJjc38C/397NjWGvuON/aK75GHS8D5VIj5o/8GPF6FgMHnpAZL4vXS4nfkH2ccUP4vIEKgbbTD8O6I7oL5rgncl6ZqCnGXVuGLXDp17gLDqTfjGelx28AFcJ+itQ9SibR36UxAqRqwP9cnc+N0VLHb69bN8UTcpoR/wRIQhqGrjBTMd89vAGeR5tUy+UzuPhP5rmLQQVh6L76Z0+2JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Q/ZgOhwFqyIpSM0g3yLsixmVVTjMOOnNFaD7t4YAXI=;
 b=P/FUQmggQd8eeR5cwP//KsY7hS57xaGnEKtYW60KRkF80/GjdB2NhgbzfM4auDXjrVTA38w5uVlzD79JQuzJLkaiPTwUqmyYvEZ4bAlZz8lQc9jTvnArU/RPKvDpVfDzza9bIV4ij1AA2LuiZcS5SFBWYVo7BpMUVtOzsvVzbmxWxSSvTDr2RsqoNy/7JoiHD30rOdRPsx//rdngBPCa/rtgqsEl5QJr8rN8/As60eFh4VMN52iLmymYq1FyQDV7S3smR3z6EmiE1oOnSTEnmtawWIxRHvBAi+9KnYgCU3hDGldSjYIe4sMKVRTy3oFOu5XL/sKHvrZduvaCyJX43A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Q/ZgOhwFqyIpSM0g3yLsixmVVTjMOOnNFaD7t4YAXI=;
 b=mkiud3W4OPYS/zGWIz0YResjkyKLza9SFbOyc1Pi7Y7eIRjAKz6tBqxxMauvJA3Q1TcF4XBFsGRgmglMU7vIgexVp0mzT8Oa/YMMh9f5zad1uyPiA1HxizydgF72Z5rMVhXTDS+cZuPwpTuvem8b9Cu5F6UsElMUhr6Uj4r7A+s=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB7765.eurprd08.prod.outlook.com
 (2603:10a6:20b:521::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 20:59:47 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 20:59:47 +0000
Message-ID: <6a469d39-0136-4f8c-a171-7b98db9eed10@arm.com>
Date: Thu, 23 Oct 2025 21:59:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/10] drm/panthor: Add architecture-specific function
 operations
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251014094337.1009601-1-karunika.choo@arm.com>
 <20251014094337.1009601-5-karunika.choo@arm.com>
 <91b406f2-7221-49f9-89fd-6f3b6bd1f4f5@arm.com>
In-Reply-To: <91b406f2-7221-49f9-89fd-6f3b6bd1f4f5@arm.com>
From: Karunika Choo <karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::19) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB7765:EE_|AM3PEPF0000A794:EE_|DB9PR08MB11380:EE_
X-MS-Office365-Filtering-Correlation-Id: 512d2a01-2229-4220-3f2a-08de12772d64
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?NVdnUmdrZUNiczRYUmhCMTJPN0YwWDdnT1ZIUVBwQjRBb25tNDF4VWZ5K2V3?=
 =?utf-8?B?ODhwUHBaUjdac3lFdEdBZWdhSXdLVUZzVytValptRHVSNU5CblZUcDVKRmhT?=
 =?utf-8?B?a21ZdWhPbGwrb2pCWEhTYkJ3RlFYK0dYZFE3N0IzVWdxVEhKdEpPRWVwbDFY?=
 =?utf-8?B?Ty9iZHpSRG1nTSsxNGRWc1NvOFFlbWpwa0N3OUJJcmhYODVXSGFYT2JrUXZQ?=
 =?utf-8?B?bFRFbU0xbVdNM2s5bExPQ3g1NWJUMGQ2VjhJMC9lUmpTclgxUnA0YzF3RmZj?=
 =?utf-8?B?cEJDa3Q3bUxPakt5RysrQ3djYVVsZ3l5dXhxYktRdUIwV3dmR2ZYU1BHK0FB?=
 =?utf-8?B?T0FqSnR3MSsxVTU5eHM5M1hUZ203M2p5REpOVTd5YS9QZkFaMXZDN3ppWXRm?=
 =?utf-8?B?a0ZoSTBXNGlYamdqWjNoYzREdTR3Nm84bFpHVFkxZzRNVzhmRnhsYzJEYko3?=
 =?utf-8?B?UVN6aGN1WkF1d3ZEbm54WGd5ak12dXVnVVhydkY4MkdUR1NSSTJPcHRXZzNY?=
 =?utf-8?B?RmlMT0gvYjZOcklTZjBpT3YxUG1sVzVSbnFDd0JNUlJ4Vk9XWjhXajNCWGx0?=
 =?utf-8?B?VEhGZHNtaGRCVVU1TTM3S01QK0hNRVYyOHBhRXdsS25GL01vWlE2Q1lGdnFu?=
 =?utf-8?B?U0U2c0Q0Y1o5dHdJRnJiWWpLdFQ1aTc5OVhtWkxMTVA2bWNWeUdMOTBlWERy?=
 =?utf-8?B?enRjbWtsUTlJS2Fqck1hdWZpK01ZRjdHTjl2aE8rYTZPT1g4UEg2Rm8wRW1X?=
 =?utf-8?B?ZTdmUG1rQ3FTZHA3YlpLNGxiVDJFWUc2TGdSczFoNCtPaDVjejdsOURBYjA4?=
 =?utf-8?B?WDJ4NEhLVkRSbWFwN3N1aDlvM3ZYS3d5SDd4RVR3ZkdWMHk0UjNFbnlLdjlL?=
 =?utf-8?B?bkFnbEhhaWR5Rk91Yk0rSCtSYkI2dUc4ZVdjaUxnYkJyNlJyNXlOVVJlTHJ3?=
 =?utf-8?B?bmZrZTNZS1NDNUlRaEg3NWRkNWRmVzM0WFNxdi9CVkVZTVYzaGxNZDJKRUVt?=
 =?utf-8?B?U2xmTGF1OGVJdGtoVWdGczZOY2RMWEg1Yk9wOThUN1gxdEJHTnV5ZWt0N1RP?=
 =?utf-8?B?NFhEdzRGd05ldU5DY0hoMHFmcUx1V3hhTi8zV09DSXlBUi9EYWlzaXY5VGVp?=
 =?utf-8?B?bDFwMGZYNFo1aFB3Zk5xMW16dWlMcFBWMzVjeW13L1BWQ1ZHUThDZmlMaE1y?=
 =?utf-8?B?VTNsN2lHenVVWktySWIxcW9zeDlmMXNxbGJGUUxUdkNlR05DL05hWXBkVkhh?=
 =?utf-8?B?UTMvS0sxUzhlTHMxU3plVGJNMkFDc1Q4clpZMHRCWHpuUWRITEVxSmtCbFZJ?=
 =?utf-8?B?U1M3eU9xb2Z4QkR6dG5IdkJacEdwQzNReVdjQUtRL2FyekJ5N2h0eVBJdjYv?=
 =?utf-8?B?TDFTQU1vWUZURGZYWlUzRENhbllOb1phWXVtNlZhamhOK2luWkVsWUE0T1dr?=
 =?utf-8?B?Rk1Vem4ra1VJL2xmbG96ZUxXbXdZaWFOVUkxZHk2NmEyc2t3eFFWdUxMZUVQ?=
 =?utf-8?B?d0hhRHRpbjlQbEcycXZUYlFwZzZjeDFKRGpKRlRBY0wwU2FyRkx1OFBQeHdG?=
 =?utf-8?B?ZDA1d0NMTkxXd3JEYW5uZzYzTkh4ZEYyTFdFMERoZG5GTy82eGUrdlFXOElh?=
 =?utf-8?B?VS9EWW5rTUxaM01xMzNHWU5vS1lWU2lVYmZuTm9UbStmdkxoOGEyZC9ua0dv?=
 =?utf-8?B?c0xWUnhvOTZWTWhDci9RY0RXb3ZyMTRFY1RpVVdpVXdlTzV4ZVRYK1ZVNERw?=
 =?utf-8?B?ZHA2NUZldnVhRlhqLytuRVMwTExTaFNrUXVZdzlmOUw1d3JrZEtlSVpMSzJW?=
 =?utf-8?B?QkJBZmJObEdOY2VGcFN4eVNlY250RnN4TnZiWHlSRmpIczdXWjJhaTRnSlhK?=
 =?utf-8?B?a2pOeGdqZFB2UXE4MVFFVk50Q21VbWlrNFFhU1M3b0NnZEd4ZytBRXVSejJw?=
 =?utf-8?Q?tGvmOyJKN6A6vrDHmI3B8o6Djwpry6r9?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7765
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A794.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d80d3cb4-1e10-47c2-2eab-08de12771946
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|376014|82310400026|1800799024|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFhwSmt1WTA2YkxTQ0NscGF5VHhtR1N6UUVDU3AyVDRoTmtRL1hlVTlvLzh2?=
 =?utf-8?B?MXRPSW5pRy9Ta3h0YjlNaTBreXVreXlkay8xK2NKdTllOXlRclh4cDFoZkI0?=
 =?utf-8?B?WFo1ZDlDcWNHL1dKMjBNWWxMSFY0a213dmVuRy81TEdndFhibWpCZFdmVlhW?=
 =?utf-8?B?cUVUNjNMRmdFNzVNdkNtV0pxc2RNZ3czVTQ1ZitYdXlCcVAzM0thUGdNMFRq?=
 =?utf-8?B?c0lyeDNybmFVR1dQY1JKbUtEZEpZck5PbVJrRmg4L1ZOcWdHaWYxM2FMeXRz?=
 =?utf-8?B?YVBFU0xNR09yQWdpNHFMVllnNGc4N2JFWGpPNjBpMVQ1VHpjUjV5dkNFd2xF?=
 =?utf-8?B?VHg0b3NvM0JXb0hrNUMzMTVySTl0N3RJQnNLZVhlRklab3BsWlUvOVNNQmtP?=
 =?utf-8?B?SElSaXZTYytXQVNOSUFHVWhWUzluTjBDMVNYMFhQWTFkU3BqNVl6WHNxallP?=
 =?utf-8?B?RTN0bUQwQkJ3aitWNkJ6TDZNQzZuSS95Wm0xYXBjMHgza3lvVGlRQlVyRWVn?=
 =?utf-8?B?RkRvWUtObHFmUWlEalZkQWVkVy9sdlRCalJEKzN3K2dpc0FZbldxazMvYVND?=
 =?utf-8?B?WU0xbkU3U0MzZ0VRMmdQWGRvN1ptQkdlVnE2Q3ZKVGZlbHIvaDRvdThINjR2?=
 =?utf-8?B?WjYvTkhUS3lNaEtNMTdPZUhnNWNaMEtXRStBU1d4dzV3TjYyTW1HRmg3Nldi?=
 =?utf-8?B?VFNsYWY1VUhVTEJjVXpBTlIrd3IwaTVXTFBSd0M3UjE5MytDaURxK1Q4L0Jp?=
 =?utf-8?B?VE45L2RlcldjWTF4b1FPM1FjZTVESlZ4aEVNbGVmQnJDK1dNNXVLbEpkaWpM?=
 =?utf-8?B?S0VpbXRlbXNiZGJZWDUzSUJiM3A2VFBxSlhSUTIrdWE4eGM5OURaY0N5UjRv?=
 =?utf-8?B?MjEvcHg4NlU0ekVVTXJjeUNHOTVUMy9qdnVuU0Nwdm9HZlJXcW1RS0NDazBo?=
 =?utf-8?B?WndhYVhIdHhDMFdPZG1LZ0RuTlYzZDkwZVpDcXhvTXNnV20vNFd1dFh3eDVS?=
 =?utf-8?B?MEVjZWdFc3BkNXo4ZDZQelB3bGloVUgrdCtuWE9IMCtoWUdXTFhBOW1paFRK?=
 =?utf-8?B?WWhoOUV4Z1NJeXdONSt0cXhRTkFrY0c0UGNUbi9GR244eUtXVUdsbHlDVE9M?=
 =?utf-8?B?dDJkU2gxVVV1YUpXdFlMSjVGTGUvbUR2c3FGTzB3OHpaamhCdG9vUjh4TXRr?=
 =?utf-8?B?ZU14VXE0ck1UY2t2SE5GQlJ1UktGTHd1U3NmU2RGdi9uM1RPT2o5bEtSUDRj?=
 =?utf-8?B?S3o4WkJXa2ZIL2I4eXJtZ1QvdGt4bEhBVS93TmtJSDBNTjBLY0FmamZkMm9s?=
 =?utf-8?B?dDk1OUdvbkpxMU5ybTVXMzZMNktqVURhWGJqTzFKY3dPUEgxTHpnRDBiTXBG?=
 =?utf-8?B?RFVBSmhyRjI3d2svQ0ZLaUZEdzhoUXhwWkowM2tOK3JRZkVwUUROSXNaSEU2?=
 =?utf-8?B?dEEzYlU4OStPRGtDS1BWZGFVQ2I0WVB1ZHo5b21MM1NVckxuTFRxT2I2QllV?=
 =?utf-8?B?bVVwSkVmdU9CeHFmYmoyaUlDLytMZkEwK2RMZVNQb0RCemcvRDNPaU41U1dC?=
 =?utf-8?B?Y1ZoU2dJbzhNOW5MYU94aHlJWkNBK1VGY3lrNFRMVXhkTWpwaUlQeVpDSW95?=
 =?utf-8?B?ekRMRXJIVktSTlYzakE2cXpNZjFNSXNORmdWZmpZcXR3RFAzTEIyQ0g4NmFa?=
 =?utf-8?B?QTdUSWJ6YTlRS0lRK1dVdlkzTlpVWFR0cWxVNUZHNko0OTJwRXFXZm03QmZm?=
 =?utf-8?B?M0F6OTVLWVVxcGUrRzNwbHhHNDY5dGVnbEJ1NWF4QlRFQ1A3WStCUDMyU25a?=
 =?utf-8?B?R2JCeUxmZFRjSzJWdmtPOVJGREFsU3BWSkZVVzVRVUZLZks2NGpySnVaWW9l?=
 =?utf-8?B?T1ZzdXZ4QW9IcTFBeHJKSjhRQmVMOS8zQ3BXWGFGaGZWMVJReXh5cWhuMXNQ?=
 =?utf-8?B?aW1NUGxITHVaMy9lVjh0YUVidFJ2dGkycEFzRUlwN05ka2NmaGozUkFGZkM0?=
 =?utf-8?B?czNuSS8rZ2NDdGpiRGlGOXNPdVZ6NGlaMCs1QWJzdVlkS1diTmhyK2xqRUhh?=
 =?utf-8?B?djlDek81aTk3eDQvQ0tPT3ZuZHk0NUhnSXhaMkZ6bkFSQmk3Nmg0Q3ZqTVNY?=
 =?utf-8?Q?BdOo=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(376014)(82310400026)(1800799024)(35042699022)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 21:00:20.4161 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 512d2a01-2229-4220-3f2a-08de12772d64
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A794.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11380
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

On 20/10/2025 10:10, Steven Price wrote:
> On 14/10/2025 10:43, Karunika Choo wrote:
>> Introduce architecture-specific function pointers to support
>> architecture-dependent behaviours. This patch adds the following
>> function pointers and updates their usage accordingly:
>>
>> - soft_reset
>> - l2_power_on
>> - l2_power_off
>>
>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_device.c |  4 ++--
>>  drivers/gpu/drm/panthor/panthor_fw.c     |  5 +++--
>>  drivers/gpu/drm/panthor/panthor_gpu.c    | 13 ++++++++++---
>>  drivers/gpu/drm/panthor/panthor_gpu.h    |  1 +
>>  drivers/gpu/drm/panthor/panthor_hw.c     |  9 ++++++++-
>>  drivers/gpu/drm/panthor/panthor_hw.h     | 23 +++++++++++++++++++++++
>>  6 files changed, 47 insertions(+), 8 deletions(-)
>>
> <snip>
>> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
>> index 7a191e76aeec..5a4e4aad9099 100644
>> --- a/drivers/gpu/drm/panthor/panthor_hw.h
>> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
>> @@ -20,12 +20,35 @@ enum panthor_hw_feature {
>>  };
>>  
>>  
>> +/**
>> + * struct panthor_hw_ops - HW operations that are specific to a GPU
>> + */
>> +struct panthor_hw_ops {
>> +	/** @soft_reset: Soft reset function pointer */
>> +	int (*soft_reset)(struct panthor_device *ptdev);
>> +#define panthor_hw_soft_reset(__ptdev) \
>> +	((__ptdev)->hw->ops.soft_reset ? (__ptdev)->hw->ops.soft_reset(__ptdev) : 0)
>> +
>> +	/** @l2_power_off: L2 power off function pointer */
>> +	int (*l2_power_off)(struct panthor_device *ptdev);
>> +#define panthor_hw_l2_power_off(__ptdev) \
>> +	((__ptdev)->hw->ops.l2_power_off ? (__ptdev)->hw->ops.l2_power_off(__ptdev) : 0)
>> +
>> +	/** @l2_power_on: L2 power on function pointer */
>> +	int (*l2_power_on)(struct panthor_device *ptdev);
>> +#define panthor_hw_l2_power_on(__ptdev) \
>> +	((__ptdev)->hw->ops.l2_power_on ? (__ptdev)->hw->ops.l2_power_on(__ptdev) : 0)
>> +};
> 
> Minor comments:
> 
>  * You are defining these to have a return value, but you haven't
> updated any of the call-sites to deal with a failure (the return value
> is ignored). This is actually an existing problem, but AFAICT the new
> _pwr_ versions have more error codes which are simply getting thrown away.
> 

Hi Steve,

While I agree that there is an existing problem, I'd argue that most of
these are called from void functions where there really isn't much
benefit in handling the return value apart from printing a "whoops"
(which the called functions themselves mostly already do) and
continuing. In fact, in the one place it isn't called from a void
function, we do handle the return value.

Still, I do think that it is an issue, biggest of which probably is the
soft reset work. Perhaps we can revisit this topic when we want to have
another go at the soft reset handling in the future?

>  * Is there a good reason why we need to support these functions being
> NULL? It seems unlikely to be useful, and TBH I'd prefer to just assign
> a dummy (empty) function in those cases.
> 
>  * A static inline function would be neater and would avoid any
> potential issues from the multiple evaluation of __ptdev.
> 
> Thanks,
> Steve
> 

Thanks for pointing this out + the suggestion, I will change this in v2.

Kind regards,
Karunika

>> +
>>  /**
>>   * struct panthor_hw - GPU specific register mapping and functions
>>   */
>>  struct panthor_hw {
>>  	/** @features: Bitmap containing panthor_hw_feature */
>>  	DECLARE_BITMAP(features, PANTHOR_HW_FEATURES_END);
>> +
>> +	/** @ops: Panthor HW specific operations */
>> +	struct panthor_hw_ops ops;
>>  };
>>  
>>  int panthor_hw_init(struct panthor_device *ptdev);
> 

