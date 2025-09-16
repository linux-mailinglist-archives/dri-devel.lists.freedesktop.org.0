Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AACBCB59454
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 12:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E438210E777;
	Tue, 16 Sep 2025 10:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hBpcVBcz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012046.outbound.protection.outlook.com [52.101.43.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3A710E764;
 Tue, 16 Sep 2025 10:52:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IvIaFTd+woWNC9kkv4u/2VwQJoRoyMu1C5oO7uzzG8G6Lq6jnz+vzbDxNqdp2hRgb7ltaSS2w81XCXw8NWF8rGdkPHi58AhMjVSgnODwXw+HR7b3n4ijCnwXLnR/cEpcF0msR+EK+KP5XyNuMXpgyyMTB6wrftg/d7CAzsl2kCduDLI56vNVb9hZTkDvmBgdjFCa2sXBR3BcQkHto25t874kXKda+lZ/1wn3ONMqYmsFvHHqKcCqIcNUPcrwjhsOhHz0x9R2kHBD48SgUOjKo+TZ9BdgqALLVX6RWqxAofzXvfPkoejsSPY50eAPs2VtlqSN8h+OEUG9E97hy5FZWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/JR1FeEkSSM3hpRqGzvIXiGCD+PvWaNedftEMU0yRw=;
 b=SqGjBHBeWwIqeVxFH1WqMvrt3hHn9qnzSqLBqly5EgmOUy7RIDk4anOt+Rnl8cN2xwsWA8WUWvVcyxwU/j713ag8CWfZ/8kqvOIg3cL/ETkljiLpobm10KfFlymm7cE1lxQgqIFu/lT20dUFV342yDv7QCQnkJY1VwXlywBpkRF3fDdiXzcTgM5Q1JOVq3EV7KjOk6u1CmULKONc89n/N5D9cI4EX5G7mxRgqtbv9psWtcB7X8YhAsWlqIA/W/lQwMoml/A0vC0bO0oLE9akmNisTkFhmJlUBy4zPfinHGNXpdOpAvNvkTL+FjIUYJ1nxE6PKQxbE+tx+4pPiODzoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/JR1FeEkSSM3hpRqGzvIXiGCD+PvWaNedftEMU0yRw=;
 b=hBpcVBczLnDgfVPTgK38tDrbvY/sHwdu9bSL9dlq0IS1kuTzNTuCFXCnclXimUn+DUFiaB+JrSDrz0jvQrCjupfAZd/LeobNCDdksuZCDKh6NkNPxc0woyYqFHW2bsFuOXEwUhitYR2Y0dX4xGNM+RKgHoEa7Qqykao+ULcvkzg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5937.namprd12.prod.outlook.com (2603:10b6:8:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 10:52:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 10:52:07 +0000
Message-ID: <8a5f0bc8-4d3a-4e47-902e-7527759d1494@amd.com>
Date: Tue, 16 Sep 2025 12:52:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/amdgpu: make non-NULL out fence mandatory
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250916070846.5107-1-pierre-eric.pelloux-prayer@amd.com>
 <f66cc34f-b54b-4f91-a6fe-11a146c516b2@amd.com>
 <9e1964bf-7748-4e41-9048-b1a5ad63a8c9@damsy.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <9e1964bf-7748-4e41-9048-b1a5ad63a8c9@damsy.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YTBP288CA0002.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 481c475e-f79d-40c7-60d6-08ddf50f149c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHpXRnBaNEdnamhJSDlDYnMxT045QzAybHVrbmVyVkJubWNrUjROaVdSM25N?=
 =?utf-8?B?WDNvQWhwNjRTK0lHclhvZzBxQWNqU0t2Tm9aMkc5STVxSzBlYi81S1BMYlhu?=
 =?utf-8?B?OTAraDQ5T016YlB6eTdCUlUzRDliNko2aGU5Mkk2VTJSaG5FdUp4NHNhZXE5?=
 =?utf-8?B?bVhGUGlGSVU1bVNUUUk2eDhYSmZpUUYxa0dlUlRKTFQvRksyOUMzT3Npd1Mr?=
 =?utf-8?B?d1lucWQ4bmRPYkk4ZU42b3Z3UlY2d0hrZ2x3ZUY0b1lmZzJJWDF4Qlp2WXJB?=
 =?utf-8?B?Q0FNcUFRZ3BIYmEwRGhwUGFYRzdNdCt1MHhhY0t6a2dKY3ptUWp0ZWZxRXY3?=
 =?utf-8?B?eEtGalh5L3pjVDJtT09OK2EzZFgwTlpyRUt4TlMyaGxkNFpqZkczRTZaUm0v?=
 =?utf-8?B?bG0wNXNvZkIyM0ZxdW9sK2JUeThSbjZsMzB0TjZtUld4NXVlZExhU0gyanlr?=
 =?utf-8?B?THVLNGp6RDR5VjVIcWk4WklsYlNMSWhjWFptejZKZG5taVRiYXhOZzd3bUcz?=
 =?utf-8?B?L1o3TUs5azY3b29JMVIyM211THkzRGFwLzU5Ry93VDhkeklBN3ltVHVvbEM3?=
 =?utf-8?B?aGNTUktHS09hNEpwWnlKSWlRZEpqcGl6QVl4cElVenBBUVJzZHJyUk1yc1N2?=
 =?utf-8?B?UHJERnpVL3BUUElqRzhRcTk5V1Y3bDhMZ0dkK1A0Z2wyOEpSZzRoejlwSWd4?=
 =?utf-8?B?UFdCam5vYUM4VFJ5QzE4cnNKSTlZM0FQYmxPZmZuY2FWUEpQM3VuNFM2a3R2?=
 =?utf-8?B?ZzUwSzB5UnRQT0ZjQ0ZValJyWUhSd0lweVR6cUY0NS9WN2h3aGUwcitNSnlL?=
 =?utf-8?B?S1V1QzB3aDcwTklNWk1OekhKVUZHS2Z2aytMODBuaGYwRWJnYUE0STJOVGJr?=
 =?utf-8?B?NHpJZGg2S09xY1V4QWVEeVg2TzIwdi9VazFWc2JuREtYUi8rUGt4TnJPMGh3?=
 =?utf-8?B?NHc3TGhtbVE3ZTJkWERuVGN6d09vWE93SnZQVFd6eDNla0NWZDIyRGR0WkNO?=
 =?utf-8?B?eHllVUpGOWZBN1hqeHlVeXV1OVhld0RyNE92N25vMjJMMWxldDJrQzdhbXlO?=
 =?utf-8?B?dE8xUVArS1E1ak5QcTJFQWFWZDlyTERXV0U4SW9WcUJsVTRvVGtLRWFGbFR1?=
 =?utf-8?B?Z2VsanJJUjhTMkszd1FhbkQxb043MUFtbUY5SkxwTnVqbkNPeEl4eUdqUWpr?=
 =?utf-8?B?U2dPWmVPcTZJUXBGSTlDNzJhRjQrYnExOUJ2YjVuQTQwQ3d0ZWpRenVMQzNi?=
 =?utf-8?B?cHhndTRJN1dxdHd4S3ZYU0pLckFJcXdQblZHc2crNTNPMGcxUlNMUHBjL2c5?=
 =?utf-8?B?QnBLRGx4d0lTclpqRld3YjVhN1FIT04xKzRuWXhxUGdBRnIwOUdldWVOaENx?=
 =?utf-8?B?UVoxdld0ZmJTZ3pYQ3owc0U5ZEdnZkxOSkNyR3VtWHhSWXdVTHlVQUk0ay9L?=
 =?utf-8?B?QU5aOUFWTTJFelNSVEdSRDA2UGJxaXF3dU5mN0ZFa1RkeTZ1WEc5RVZKamRY?=
 =?utf-8?B?d3FLN2cxRG05V2NiYVJvVmJyU0JNb1ZJckh3NmVrd2FOTW53NHdCNThXV09E?=
 =?utf-8?B?OU9OUWZoZ3BVRDlKanVZRE1NOVNXYzZMVEJ4ZGtGK3NBek11bGxWSlBXQXJS?=
 =?utf-8?B?a0tFbGx2YWt4TC82Qkp4UVJ1dXhYRks2MjdDbkErQ2lCemhrYi9MRi9DNXZL?=
 =?utf-8?B?QWxhMDlyY2JTY0NyNVhLdTkyTzNzNS9pV3h3RHBGbFlFRWVrMWhxWVFtckM3?=
 =?utf-8?B?M0M4WWc4UWVNY3Ivb2NkN29ySnpZVlBPRjZBallKOGZhSXR5WXY4eVJlZmFS?=
 =?utf-8?B?cWxrWVJXNW5CdkhvQVk1cGNWUmhvcEt2NkxhRkc2bkdXOTFkMUQrWTNaT0pS?=
 =?utf-8?B?WGlYN1orblNnRUxTQnRxUHNDcTM5NDNlcUlwd2dzYnhYYVV6S2FHZWJtcVV6?=
 =?utf-8?Q?VTo+5ZXpRmU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTY1Y1pXb1Foa0gxbm5tdC92N0ViNmliTWo3MUlHSVgweWdobGRBUFdyMXhu?=
 =?utf-8?B?VHlyL3k3cWFQNzZOaEF1NGF1ZVRiaVl0TGZQaFUzZGZvVkcxdmZ3OXJzR1Vm?=
 =?utf-8?B?aXI3TWFFdmRrU3QyM2FkUGFxZ3lLaE9oOHV3TndYOWFXK1VKL1ZZZ1ZDV1Rx?=
 =?utf-8?B?bE9YTVNnaUdGVVlwUW4rbXJUbVB0S0FraTYzQnpvWEo3R3hmYyt2RnpCaUhE?=
 =?utf-8?B?UlBOM1RvY09wT2pIV0dUVUp6eFROckc2M0pBdmhaaTA1bTJybUxKV29wK1FB?=
 =?utf-8?B?eFFMZ2tSaDloYndia2JOTjIvVWg0Q3hPb3V1MjVVTE9DYTRHNjlEUUF6am1N?=
 =?utf-8?B?OWsxdTRLa0g4S0diZDRrUU9vWGx2RVgwVTVJOEprYmowMDlZVjBEM3dwclRZ?=
 =?utf-8?B?OERRREtOVmM4VElZcXk5dG5Za3lZTUFQajFPNWRadG04QXBrZm1ibHJsYmV0?=
 =?utf-8?B?Q2J0Rnl5NU03MEJoZnVUNEZYM0szY1RsdUw1YnhMTXFxdHJVQXUwUE10SVRq?=
 =?utf-8?B?bFVnUGt4SzcxVFVGZXRtWTlCNlphK1B4SU5VMFBOc2VKZjk2V0lPb2dmc2U1?=
 =?utf-8?B?UE5OdFhwUzRNblNOKzlFV3VLbWttTmRuK05vVmhiRndham9QSDk4eEptTTZB?=
 =?utf-8?B?NXFhRmM3YUU4L0VFZjFZeXZzaGRWRnM1QmU0eXFURmxuRDJDRlhVMmNZYmNZ?=
 =?utf-8?B?cUR4UkxQMndzMVhvZnZnZmUxV1FEUU5mN21rTTJRK3Z0eHNPdG5mUGZZRU9j?=
 =?utf-8?B?aEVlQWNhQ00wMU5QNXJxUzJiSTQzbFVYcGpaZDVoV2tzeFpvam91eG9BMnJC?=
 =?utf-8?B?Qkt4MjNPV0s4YnFlNFhEcGZqNkx5N0dVeDNwT29maHFtVDBHSXE2WjR3MXFk?=
 =?utf-8?B?NTMxYWVuSG5jNW1UNFFoWDBOelRJdnpub01BYmNhZWNscmpRWkJFZFkwLzFW?=
 =?utf-8?B?QXFvU25EU0ZGVVFIVmNpRjBQbGxoK2VQMDJJWndHdU9YYTVqS3p4VmloV0Na?=
 =?utf-8?B?M3E4V283Y1J1T1pmajFHb0F4eWlOTjBPejVDOVRrUmJNZThNem15ZDhzL0Jl?=
 =?utf-8?B?RjR5UWdpWG84ei9mVVZDNXZuNGYrWUp3M1VVQ1JraklWMnlOLzBzYTgxeFBC?=
 =?utf-8?B?ZmZuRjdUeWpVMzJ3bnFsSnBnZWh1ZkM2a3kwaHp6UUY4Z3NScFZyYmEwL2Ni?=
 =?utf-8?B?Zy91Smk2QXh5VkJRLzdGZXQ4bVZpMjVZYU9RRHpBNVZJUnN2RWFKNTBlMUJL?=
 =?utf-8?B?UUp1YjVOSWRuM21xd3dkTG9ib1VBaDRGZEgvY3JMeFMxbkUyTi9YMVJJcEdP?=
 =?utf-8?B?eG5hd2N2dFRzYXdLcWZaTTZ6cXEvRGNGTjJVdndtUHNZdEg2K0lkZmpzNGxI?=
 =?utf-8?B?T1psaE05VWtiVmViVk1oLzFYblNuRHhhSmdnMUxjeko3b0ZreGZJbUtRbWsz?=
 =?utf-8?B?bEd6RDdjSXRWaDJCdmg0TkRhbEJzTHl3dzVKWUZ5VjFsdUJ1VkNDVzE5dW9S?=
 =?utf-8?B?QkJIclRkVjM3cDZ6b1pBdm95YWRjN0luRS9CdUJ6RDhnejFEU2xnTXZteFFX?=
 =?utf-8?B?TWdvL1dDSWtmaENVNVI0aXNyM0FhRFJhcHVwV3JUUnpFbnB5K2E0UTRPSFpq?=
 =?utf-8?B?YzhoZE40L0dQa0lLL1BiNE5aRDkybUZUeDNLVDFmZWV5WGdYVHBVNWhpLzc0?=
 =?utf-8?B?MFZnMi9ZQzJUV3VMcVFaaUFXTVE0ZjVmdFUzVEFaZzBJa0pXUjl2dnJDR0FB?=
 =?utf-8?B?VzAweWV2Mlhtang2b09PUVJ1K28xN3FUMlNMbW4vckkrbFV6cWdob2tvY2hk?=
 =?utf-8?B?TnY3ZU0rTFd2bjZHWHlrcmRENGRtRko1cytkUVlObk1EZjYzZ2dVTzc3cE8r?=
 =?utf-8?B?a214c1NEUnZCbW5wenlRekxtU0oxeU5tN3pNdEtHNWF4VVJ5Q1djais4TjV1?=
 =?utf-8?B?SHozWnc4SldsU2lGRFZxWCtzWnFNdWtEVXpnZWtRMFdWeUZUaThtd1VZc3Vp?=
 =?utf-8?B?dk5FdG8ramh1VVR1YWtUVklLdCtTZDQzdExyYWIxYVlLWlo1UGRLZUttRXlN?=
 =?utf-8?B?OFZLZGptMjYrNTJFRmcrMEFoL1h0TTl4ZHVjOXd4N0R1ZXl0c0lNYk1Ib2Rv?=
 =?utf-8?Q?Jbh9k+6sN3Vq1x/sCqnW+2mSx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 481c475e-f79d-40c7-60d6-08ddf50f149c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 10:52:07.7545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: txWdh/qenfCgUem7kPnFTktwhFLMnFeIsY9f1Dysk1wlHoHpV9QM8lwD3K4Sh95R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5937
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

On 16.09.25 11:46, Pierre-Eric Pelloux-Prayer wrote:
> 
> 
> Le 16/09/2025 à 11:25, Christian König a écrit :
>> On 16.09.25 09:08, Pierre-Eric Pelloux-Prayer wrote:
>>> amdgpu_ttm_copy_mem_to_mem has a single caller, make sure the out
>>> fence is non-NULL to simplify the code.
>>> Since none of the pointers should be NULL, we can enable
>>> __attribute__((nonnull))__.
>>>
>>> While at it make the function static since it's only used from
>>> amdgpuu_ttm.c.
>>>
>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 17 ++++++++---------
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  6 ------
>>>   2 files changed, 8 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> index 27ab4e754b2a..70b817b5578d 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -284,12 +284,13 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>>>    * move and different for a BO to BO copy.
>>>    *
>>>    */
>>> -int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>> -                   const struct amdgpu_copy_mem *src,
>>> -                   const struct amdgpu_copy_mem *dst,
>>> -                   uint64_t size, bool tmz,
>>> -                   struct dma_resv *resv,
>>> -                   struct dma_fence **f)
>>> +__attribute__((nonnull))
>>
>> That looks fishy.
>>
>>> +static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>> +                      const struct amdgpu_copy_mem *src,
>>> +                      const struct amdgpu_copy_mem *dst,
>>> +                      uint64_t size, bool tmz,
>>> +                      struct dma_resv *resv,
>>> +                      struct dma_fence **f)
>>
>> I'm not an expert for those, but looking at other examples that should be here and look something like:
>>
>> __attribute__((nonnull(7)))
> 
> Both syntax are valid. The GCC docs says:
> 
>    If no arg-index is given to the nonnull attribute, all pointer arguments are marked as non-null

Never seen that before. Is that gcc specifc or standardized?

> 
> 
>>
>> But I think for this case here it is also not a must have to have that.
> 
> I can remove it if you prefer, but it doesn't hurt to have the compiler validate usage of the functions.

Yeah it's clearly useful, but I'm worried that clang won't like it.

Christian.

> 
> Pierre-Eric
> 
> 
>>
>> Regards,
>> Christian.
>>
>>>   {
>>>       struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>>>       struct amdgpu_res_cursor src_mm, dst_mm;
>>> @@ -363,9 +364,7 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>>       }
>>>   error:
>>>       mutex_unlock(&adev->mman.gtt_window_lock);
>>> -    if (f)
>>> -        *f = dma_fence_get(fence);
>>> -    dma_fence_put(fence);
>>> +    *f = fence;
>>>       return r;
>>>   }
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> index bb17987f0447..07ae2853c77c 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> @@ -170,12 +170,6 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>>>                  struct dma_resv *resv,
>>>                  struct dma_fence **fence, bool direct_submit,
>>>                  bool vm_needs_flush, uint32_t copy_flags);
>>> -int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>> -                   const struct amdgpu_copy_mem *src,
>>> -                   const struct amdgpu_copy_mem *dst,
>>> -                   uint64_t size, bool tmz,
>>> -                   struct dma_resv *resv,
>>> -                   struct dma_fence **f);
>>>   int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>>                   struct dma_resv *resv,
>>>                   struct dma_fence **fence);

