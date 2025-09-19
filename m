Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BBCB88512
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 10:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8F910E954;
	Fri, 19 Sep 2025 08:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A9JjPnr3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013054.outbound.protection.outlook.com
 [40.93.201.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BACE10E953;
 Fri, 19 Sep 2025 08:01:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jl7VdsfarRDwg2EwR9xC9nwMXILYyP1/BSAVswjgD5LNb6h8IWeEK/fUxEeXDIsqkcJKMV6fDn2uqHC26RQMMJWH7Enxdbwj4uKf1saLWGQrk510tse/i2mAfQCSE30vYMozmkNUPnUiR6DYRmmdsKfwdRC62p2kip4BffaVNlL3xZVQjjG5xbogZNKioSRVjVFQGQgpNXZFnWoYRElixj6+j7eGLlONUo+UbgUOG7UhrBvzVIh2UxzHM8aaDzAjIg8hWruLHbGPvg6JaY/UujQQVCren3+ltytul03o7Ml4yFQwRRgTW5USZHih8D10IH3pVgcdxEqdiZxkXBKlQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsnPky9yk6s53zoBr3TLqEot+eiKm80PU9u38VK92Ps=;
 b=tqJ2eUtQwGcvNE1i7o1aCVCYUh1hBDboA7d+9h6DFicHWsYnkhFbpq163sBu+d2wCSo6ERzg/Mwdj3dkxUfhTorgpoULl451Fk9zAGvjMtF0dsqxMSz1JFz4bvGmpFZohxGLtylrTK3BJ4xYgG380SHg7T+HVukI/TSDaJ65aHmttoEbyCGhMvDxZmqIRoU1GAPvR0LkqRL07pgRVh8BLwy+pv4S0rnfZWWht+nnkhaQv45X+0LEJC0G5oPz7K10tVb4feXjq2WumlPaA4MRDlDHClIPuHYWDm8GmhTYDSqdY7ayoO0raJCGzd0bo2QdG+VVVQd6f3aUfKbgPSiUXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsnPky9yk6s53zoBr3TLqEot+eiKm80PU9u38VK92Ps=;
 b=A9JjPnr3mm75ybHducq4EJIvrlbvreOFdry9PjsCpaLN6WgYvy+v7NWRrcACFRvGYa9Ub93T7N//oH6hFFgAgYr1EXw1mDovXB/kugpe4v36LKGk9Uy6qtemSM1lk9eLIBO/jVNSEO8y1oZdVMgpWKxaNx7fAqtZtvO4ARAxFZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7423.namprd12.prod.outlook.com (2603:10b6:510:229::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 19 Sep
 2025 08:01:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 08:01:34 +0000
Message-ID: <96c117bc-389f-42d9-952e-894768aad780@amd.com>
Date: Fri, 19 Sep 2025 10:01:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/3] drm/ttm: allow direct reclaim to be skipped
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250918-ttm_pool_no_direct_reclaim-v2-0-135294e1f8a2@igalia.com>
 <6f92ff06-04c3-440b-becb-50a7693ecc39@amd.com>
 <67c83b24-01b6-4633-8645-52dc746c32e2@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <67c83b24-01b6-4633-8645-52dc746c32e2@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P223CA0044.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:5b6::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: c56293c6-c740-4d47-4340-08ddf752c08b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDVpeUdvbElyR24wYjNNSE9GV29nbzJBZ2RGMzg2M2Y4dm15L0FYWmg1NENn?=
 =?utf-8?B?WUV1RWh5RmE1V3lMdGtmeHZ5VGhlWFY3cUErTUtGajVTUFdpdHBPd05DVWRS?=
 =?utf-8?B?dzNJTElnQkJxcGFMRC8rQmk5TDREcDIxbHd5N1JJbjZ6QktFcnpZV2FUYlUv?=
 =?utf-8?B?MTRoakRreklHU3BCUEp4YkFsc0ZlOURySmhFQXY3R0FhODBZUUJ4alhWby9S?=
 =?utf-8?B?NTEzR2QvY0psV3FTc0Vodi9TaURqTnFacnpkNzEveEdsbkZ3cU1URDdwaEhp?=
 =?utf-8?B?d2x4SXdGNkpQU3BlNCtWUFlwRlBNd1B5eWtkWEtQRWNtUnJlc09OczVhSk40?=
 =?utf-8?B?VnFESHp5c2d5cS9TSVR5SENqamh3S0hpWlpLOXFZMjZyNWlxd3o0aldyRkFq?=
 =?utf-8?B?akFHN3FrREpaQlc4Z2ZBRXhnT3poK1Y1QTVodXFWUTZZY2pKU2lNZTh2Qnc4?=
 =?utf-8?B?bVlQWDNVVGxBWHN2ZDQwWUdvR3RHcVlRYTE4aGRheTh0endPZ3ZIa0pwTi9h?=
 =?utf-8?B?SVVLMUIvUWRCYzNPbEhOMUI0aXFiSHA3NEN1MkxzMEJtTDRGdlZ6WmZrL2xa?=
 =?utf-8?B?STdSclZ1Y2VaR05jMithMzcwU293aHhOdGF4QzRkL3JGalVSK0l4THJwTmZp?=
 =?utf-8?B?QzBEOHJhSEIvTW51VGViVWpnSzhRdUJadDYrWXduejRRZ0M5bEtjSmg1cUZz?=
 =?utf-8?B?eTN1ZytJbVZ4QUFJMGtDNzQ4WDZMUDV2aHlCTURaVmcrMzhsaUVHYzJJOW9K?=
 =?utf-8?B?YXJPNUJ5ODVIRGt0SXF1RUFoeVY2Q0VxZEJCSFRSaXMrd3BJdjNXRVJ2dG9B?=
 =?utf-8?B?K3ErZ0tDdTBjK00xRlFaUmx4Rk1ib2RrdC9MVkg2T3RJTzZFZVhtZVZNaWlq?=
 =?utf-8?B?QVdBVHJXa3RlaG1sSmxueGYrR2FWQ0RpeTE3SFVVUmFheU5mY2VuL1EyNUZv?=
 =?utf-8?B?dXVDVEU3MlBGLzRKVnBjVlkzSnhsK0FmejhwckZFa2ZoT3FFNW5aeEdQOXhJ?=
 =?utf-8?B?ZFlrZWladjRDdWRCTzUwZEFBNnFTMUh0Qzh6QlJYanRsWWlBYTdHWjdCMWoy?=
 =?utf-8?B?bWc3UWoxWFJIOXpURFpLZmt5VHg2Q1lQMDQzMjNyM2l0aFdiZEdQa2taTWFT?=
 =?utf-8?B?ZVhBbmY4cFVYTk91VWNDK0hlZlBVaDYxVm5PNWx6eklrNjhNSUNpRW1PRXF5?=
 =?utf-8?B?aTIwazNqbHMwTythbmNOemNHakFRM2xXVS9XMWVCL3kzMFVkN21zYk96ZjdP?=
 =?utf-8?B?RHJJMll3VzFaRW5NUVI1Qk54MmJpV2JmNXpmdnlmbDRXUmlueXRXRkNaeFJF?=
 =?utf-8?B?R1FKeHJqOE90WHVZZlI0T0pnaHk1M1dKamhYZFdCQnFVZjl3UW1zYnA4V0ox?=
 =?utf-8?B?cHpYWlhxUVAzNUVzV1N3UTNXMFpCK3ZzeUhxYVVGWnNsaitlbjAyVnVNZkt6?=
 =?utf-8?B?Y2dwaFVMNVFoUEpqZXMzMXFsOTgrdjNMNkdwV2NYckxrM0l1bnAvby95N0Nt?=
 =?utf-8?B?dTB0QldhTWhYbWZ4Umx4K2tvdzNwU0JXSnZXYjFtOEt5MVJTZGl3SGRsdG54?=
 =?utf-8?B?RHJ6MExOTGo4UnNuTlllUkxOOHVhSzdDNkRGbDJRWlJrdWhMbEpwbC9IeEc0?=
 =?utf-8?B?TWtTczRHNHI0M1VtWnFtSHdHYkZKTStLa1RQWHB4citUNkVBVWhYalp2Q25M?=
 =?utf-8?B?Tk1DLzJuLzNXbmZHWENwTkN0WDVLSFgwbFlOUWxEMDh4REZDb2JaWlBuRDQr?=
 =?utf-8?B?M0FDd0djRktLeVBjeUIzN09VYy9SelczK1lZUExZNzR2RmVDSWlnWGVwU1lS?=
 =?utf-8?B?aTNwVG40ck9Ua3phUWp4NXc5VzkzWmpZV3dYM29yZDBKMDEvQmZqZHJtMlJ4?=
 =?utf-8?B?Q3lpYmp1UDlzaE1qUVdoUXcxdk90QVpwMXVwbUZ4VDBmQUh6RDdBNEVFOWs0?=
 =?utf-8?B?aWxYdjFsU1hVcEJnRjVhVmJCd0FUUXZiV1lxRmhwWXBiRUsvZFl3UXJqUlF6?=
 =?utf-8?B?TnhENWdBV1NRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjErSGNHTWFjckhKbTN2azB1bVcxZXk3dnA5aW1nSDR5Rlp4ckNnUmFEaTlG?=
 =?utf-8?B?Qm10NU5NZTdmaVlyazc1THdQQllIYUhlZDdpUkxDcXhMWGxOc1l3VWM4RFhx?=
 =?utf-8?B?SWhEdkpKQjVOZitCUFVkV0xXc05KYmpGTlNNK3k2Z3JVOGQrbVEycmM0cGRm?=
 =?utf-8?B?UGVGZFZWRkd2RW1BRDRPUWJQWWR0dzVlazFMdUFlYXh6Zlk4dGdMbyt3V1Fa?=
 =?utf-8?B?QzZuaFdVSVRoNGEyVGlaODlVS3BOTXFmM0RyZFpzNXR0aEVoSFF6cGEyT2k2?=
 =?utf-8?B?UVVEVURaVmVCSDhQL0xJK2sxQWlWUWdVd01JcmhGV0x6SlNyMFJKbEgvQW4z?=
 =?utf-8?B?Sm1LSDNHaWovL2ljcEd5Y1BFTmhuZUFZOXRiYVE2eEFPZjBkWCtSSHBEcTZX?=
 =?utf-8?B?Mll1WGJXTG9jUE1URXNkbUtlTS9EdHhtM2hxRWRPbHZOakdCQjkvd3FYR0FE?=
 =?utf-8?B?U2pMNndjUjF5MGMxenkxRkdFbTk0SFJBM1FhSWhmbGpnT0tmQ3o3Y0R6akVz?=
 =?utf-8?B?R3diVDlLYXU0YytZUFhJd2sxU1QxQlRiUENXazNFeUxBc2owQktjaVFUNmhp?=
 =?utf-8?B?MDVCYWt6MXYwaHZmWFhWRnRGRERUdW83VlNzVS9MWThVWUNjU0xNbFJ2ZXBx?=
 =?utf-8?B?MkRJNldNU3lselgvdkVRQlpaOXBUOVNhTm11eVlYb2QrYlR1b25GQ1phTDVj?=
 =?utf-8?B?MXY2Qzd2NWptNXRXKzNyd0h1anFONUh2QklKMmgzMjBmRnFHV3ZjZVVvdmhk?=
 =?utf-8?B?N1o1RDJuR2pBTytTcUpQR29KWXU0a2p3SEhacThUNVZZdHFvNTViUENUZ1Nn?=
 =?utf-8?B?OFBhU1BJNHZ5T1R5UHFmSDdRK2M4blJQM3NIbG1ieElEb0RIZnNFWGxiUnU0?=
 =?utf-8?B?Ri95WjZxWTFFNXFKcnQ2NnQzV0xFdmc2ZGdla0hEY1BicUdPdDlIVE84bGZx?=
 =?utf-8?B?L2YvcmJldjZtdkkxK3NCNVZGTW5leWo2NWJON241MHNySFFZTTkzV2t3NWpp?=
 =?utf-8?B?SllqRDJtMkZEVVYxaXJmQy90bFgrbTR5WWRiZnUxMzJQOTE4QnE4MWYwK1k0?=
 =?utf-8?B?aXFQUUFrNFRaSFB0NWZTQXNtbmt4YlA5Zkt2d0NXUU9KSlljWU1UMTJNeWRs?=
 =?utf-8?B?SlFYVGttTWJwT1JpU0ZYeXd3dGg4cTR6TU1mVHFqc3RLWllVa0RycHJ0NjV5?=
 =?utf-8?B?U2FrOXRzR1k3UkNlcmRPREZVcHI2c2ZCZkNGL2R4NzdHczg5R24vZHdaaTV3?=
 =?utf-8?B?d0RrMWwyc2M1QmJzYkw2Sk5pWjFBWTlYU0ZZWHVUTHdxd01jdzg5QjhGQjNK?=
 =?utf-8?B?YWJmbFJaUE5aSFNwaC9DU2hNcnorckhucGV6T2ZTK3lJdGdQa3JjYkVBcnVS?=
 =?utf-8?B?M1RwNmoxeit2NkJWMEVmMWZOU2hvWkFuM1hEM0pWd255akJLY3pWSFdGSkx2?=
 =?utf-8?B?SVVhaDF3akVwNnBoTi8rY0lJaFVNWHpUczhERUw3aFBJWU1XamtsZmdWRUEw?=
 =?utf-8?B?b0JuamlPTTZyU1gyQlpSd2VwbzBuVmlIR1FmS01IRUU4UDQwaWlxd01xZmhB?=
 =?utf-8?B?RWhvanVFSmcyekQ1V2FjWUFoZXNVY04xN1NIYXE0Qzg5Y1djYU5jVXVDbTNT?=
 =?utf-8?B?bnpwUHNhSFhWR3oxdXU5Z0NLWjhzMS9DLzZlQ2syQm8xaGhad3EwVGUrT0NB?=
 =?utf-8?B?aTRvZWdqbmE4TDlzOFZxWGs3Mm5NNTREVStZM2tWTWhvYWwrU0R6SXpJaWVW?=
 =?utf-8?B?WFZyNDJtdkFWd2xCM29UczM1ZEJlbjZvZ1REZk0ydHlORFZJRlpPcHlEc0Ny?=
 =?utf-8?B?eWVVZldnVHQ4K3kvRXdDS1RlT2VQaEJFNExycFk0RkppQU5vWE1wMFdoMXZ0?=
 =?utf-8?B?SWJDZTBYZHJaT1NPYzBGcEFIVTR3aDBOZHliMkVqMFVhY2w5SjJLZ0xjNXJM?=
 =?utf-8?B?VEhJTzQ4c21GSDZCRWtNWkZaSm83VVZZakp4NG5ya0kvVTdRc3Rab0pPNUFw?=
 =?utf-8?B?ZmxaaStzb2d4TnoxRjhZR2hqd3V5bDBMelJLK0NoamwvNW54cGRXaE9rUWtq?=
 =?utf-8?B?dmJlRW9KRFlDbmhMbUhQYWFoa3lFdGJpeCtKR3lmVDNXVGN0WHh3M3FYTmk0?=
 =?utf-8?Q?3R5K4s5Q2nTC2817gXDBWQJeh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c56293c6-c740-4d47-4340-08ddf752c08b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 08:01:34.7967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSuLEGPc/s137BlTe9anTM5OgbyaX2XL0DM1CGa84+mmGq4kJkXYtONFPLbamQAZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7423
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

On 19.09.25 09:43, Tvrtko Ursulin wrote:
> On 19/09/2025 07:46, Christian König wrote:
>> On 18.09.25 22:09, Thadeu Lima de Souza Cascardo wrote:
>>> On certain workloads, like on ChromeOS when opening multiple tabs and
>>> windows, and switching desktops, memory pressure can build up and latency
>>> is observed as high order allocations result in memory reclaim. This was
>>> observed when running on an amdgpu.
>>>
>>> This is caused by TTM pool allocations and turning off direct reclaim when
>>> doing those higher order allocations leads to lower memory pressure.
>>>
>>> Since turning direct reclaim off might also lead to lower throughput,
>>> make it tunable, both as a module parameter that can be changed in sysfs
>>> and as a flag when allocating a GEM object.
>>>
>>> A latency option will avoid direct reclaim for higher order allocations.
>>>
>>> The throughput option could be later used to more agressively compact pages
>>> or reclaim, by not using __GFP_NORETRY.
>>
>> Well I can only repeat it, at least for amdgpu that is a clear NAK from my side to this.
>>
>> The behavior to allocate huge pages is a must have for the driver.
> 
> Disclaimer that I wouldn't go system-wide but per device - so somewhere in sysfs rather than a modparam. That kind of a toggle would not sound problematic to me since it leaves the policy outside the kernel and allows people to tune to their liking.

Yeah I've also wrote before when that is somehow beneficial for nouveau (for example) then I don't have any problem with making the policy device dependent.

But for amdgpu we have so many so bad experiences with this approach that I absolutely can't accept that.

> One side question thought - does AMD benefit from larger than 2MiB contiguous blocks? IIUC the maximum PTE is 2MiB so maybe not? In which case it may make sense to add some TTM API letting drivers tell the pool allocator what is the maximum order to bother with. Larger than that may have diminishing benefit for the disproportionate pressure on the memory allocator and reclaim.

Using 1GiB allocations would allow for the page tables to skip another layer on AMD GPUs, but the most benefit is between 4kiB and 2MiB since that can be handled more efficiently by the L1. Having 2MiB allocations then also has an additional benefit for L2.

Apart from performance for AMD GPUs there are also some HW features which only work with huge pages, e.g. on some laptops you can get for example flickering on the display if the scanout buffer is back by to many small pages.

NVidia used to work on 1GiB allocations which as far as I know was the kickoff for the whole ongoing switch to using folios instead of pages. And from reading public available documentation I have the impression that NVidia GPUs works more or less the same as AMD GPUs regarding the TLB.

Another alternative would be that we add a WARN_ONCE() when we have to fallback to lower order pages, but that wouldn't help the end user either. It just makes it more obvious that you need more memory for a specific use case without triggering the OOM killer.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>> The alternative I can offer is to disable the fallback which in your case would trigger the OOM killer.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Other drivers can later opt to use this mechanism too.
>>>
>>> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>>> ---
>>> Changes in v2:
>>> - Make disabling direct reclaim an option.
>>> - Link to v1: https://lore.kernel.org/r/20250910-ttm_pool_no_direct_reclaim-v1-1-53b0fa7f80fa@igalia.com
>>>
>>> ---
>>> Thadeu Lima de Souza Cascardo (3):
>>>        ttm: pool: allow requests to prefer latency over throughput
>>>        ttm: pool: add a module parameter to set latency preference
>>>        drm/amdgpu: allow allocation preferences when creating GEM object
>>>
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  3 ++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  3 ++-
>>>   drivers/gpu/drm/ttm/ttm_pool.c             | 23 +++++++++++++++++------
>>>   drivers/gpu/drm/ttm/ttm_tt.c               |  2 +-
>>>   include/drm/ttm/ttm_bo.h                   |  5 +++++
>>>   include/drm/ttm/ttm_pool.h                 |  2 +-
>>>   include/drm/ttm/ttm_tt.h                   |  2 +-
>>>   include/uapi/drm/amdgpu_drm.h              |  9 +++++++++
>>>   8 files changed, 38 insertions(+), 11 deletions(-)
>>> ---
>>> base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
>>> change-id: 20250909-ttm_pool_no_direct_reclaim-ee0807a2d3fe
>>>
>>> Best regards,
>>
> 

