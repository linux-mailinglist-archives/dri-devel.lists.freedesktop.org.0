Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3E4AF6D20
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 10:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7540610E1AA;
	Thu,  3 Jul 2025 08:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2lG0WgY3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4AA10E195;
 Thu,  3 Jul 2025 08:37:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njMnkiTPba47/2E6nkC3KPhSCkMw0jQXTy/QDRKC8c+LOiU7KV5nJm5vcrd+XWbmuLdDTiNk7Tf5y+aaYyugvqsIE50cMA0dTzRDQbUBeZSjvZErXij37gkm7abodg41Y7sHLyboeFCIXLcaAbZfz3L9cQ6vsbhfDJPATBTF5THLTEHsn8L2Y7qVPyNS8PHEdgAA+L6Sg+UPtFrcOdcGTMI+w01PzwXQ61G4/tFjg1BRwckspaYG5IJsvvyXXc0tsJeuQzSMQ6PZbniGaLGdmpILUNmyvw+rLmOs9q3rWwAn6Weu7uqaF3BSjJsFOBQ5psB6YrJTfvcWHH2iulo4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FbNdpgLruNZVfLWAGPS1FINQD+woTa4at82/AgF48yk=;
 b=IumBo+O/jybt/CBT0KvQSi0DNHW9CIE0qkWhb0tYJtVc1bBR9lHxiPM/03RA2NDF+M8yoXgOzPox9snG9HmIpG/m0WH0o3sRFabbVazAV9K1/B8RWW2l65NmtDI4JyR8nQRIiT+hDnJpvxU/k2rNlJTfUA9ezbUwWmYK+arqzNJoTTXdCga2NF1WFAFr58H6+0QZG0kabYrCGd+XFM+hkcUmOkPsUvUXXNMG1LrS/MGBiqDkxM615k7MCile5cJr2k+yahPZGSUu/dlRQ5bHXBY86mZtyzxwJK+9iwlWi4Cxn04uC//cTkm9jE7EnRXTIye1I0CSzdJtInYX5J37uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbNdpgLruNZVfLWAGPS1FINQD+woTa4at82/AgF48yk=;
 b=2lG0WgY3ndr/OmJNI7EHlIov4NOc8YdOVu++K1fgGypGpujfPAOJj1pg1N4L78svCwjh6n8ppwR4TwAcBwXXoksh8uR2NiYPn4I9LTLNBOd5PnsElQ/Z9OlGk0G4nYglTJh4ruo3Iyms2JnUfxre/oxSkBk0aAL97YEBfuFM2AA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4094.namprd12.prod.outlook.com (2603:10b6:208:15f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.38; Thu, 3 Jul
 2025 08:37:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 08:37:50 +0000
Message-ID: <c8ac36f3-06ea-40c3-a5e6-da3964ac3b22@amd.com>
Date: Thu, 3 Jul 2025 10:37:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drm/buddy: add a flag to disable trimming of non
 cleared blocks
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Auld <matthew.auld@intel.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250702161208.25188-1-pierre-eric.pelloux-prayer@amd.com>
 <20250702161208.25188-2-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250702161208.25188-2-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0177.namprd03.prod.outlook.com
 (2603:10b6:208:32f::30) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4094:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c9bd3ba-5de0-4521-42ab-08ddba0ce4f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWhkOStsMUo5aHdHYWpSaVd3UGxrNDFqUUlaR2pXUnlpWm1Ebnh1ekhGV2lZ?=
 =?utf-8?B?UlpyN1hUTVZRT28rOUpaa0xiVTFqcUlNVGVuNnNOZTArQlh6Z0dVVXdRN3dW?=
 =?utf-8?B?azQrb3RnRjA1eGMvOUo4V3BjM1MvVExST3VhVVdWUGk2TWJaZkdTL1JCUmRi?=
 =?utf-8?B?SVJOTmloVW90NlUraXc0QkkxR291dnBrQm5LZENIM0gzTkgwOTQ0WTJrWVR6?=
 =?utf-8?B?QXozOE9vTjNTa0l6dUp6YXlYRFFVNTFLaXpwYXI1NEkwR0h0N0p1ejc5T3VC?=
 =?utf-8?B?MFZqd3JWZzlIRWkwLzdhcWY1N1NqYXcyaW5nTXh2Z3pySGh3SFIzdVNhNXpl?=
 =?utf-8?B?WVNkcVAzdThnTVloc3pWZDhqZVM4UytsSVB1UlpxMEVIbGtWcUFHWHZJcDdU?=
 =?utf-8?B?ek1HZDB4d000ZHU1S2JTUHA4OHB3WjM0UlBiRzBZN2Fycm9TUTNqOFJySlJR?=
 =?utf-8?B?aEtnOGR2NklmWjM2blFxbmdMN1RPUzhGME5XejF0Um9xbEJ0VDNIZWdHZjNw?=
 =?utf-8?B?RTV4Y21JVjhFakZieEFzNWQ3TC93YzB2R2p6N2NUUEVRMjhwRElLc2tESXFy?=
 =?utf-8?B?NVArWmlYNndycmQzVklPVlNaVlJpa1RkYzJRUDZUZTZhUllvUmREUU55Z1lN?=
 =?utf-8?B?c08ySW1Ed3FWZVUwWUdoS1dTcWlUMVZPaUtUbkloKzRUempMVzcwT29IMTlm?=
 =?utf-8?B?VnpoNjhCYWpiUlU4RENtczFzbE43S014dGExMTNLU2FXRGl2TStPdXcvR243?=
 =?utf-8?B?SDBhaUJlQXZUNG9GYzlLajRNSDliWTZVUTBHRDJJR3ZRQW8rSmJMd0tlTnFN?=
 =?utf-8?B?YnVEeC9Yc2p6Z3g5TXhIWG1GeGJVN3RUUWNIYTAxL285N3F2UVBIeE1VS0pZ?=
 =?utf-8?B?RzhINGlBVjl4VGRVZWpsQUQ2WnNPQmNuVnpoRmhGSU9DaFFzLzFJMkU2S1Rl?=
 =?utf-8?B?c2VKTlNIejFDNWxIelRVOXgrMWVWSS9XcjNUOFZtMzJJMERZWGh0YkRGcHpx?=
 =?utf-8?B?Qk92c3RxV05zampERVZmTHh2Wm0xalgraGllMjBNeTIwNkhOQ21IRU1udHNL?=
 =?utf-8?B?VEV4RlBVTFhxS3RNS2pDWHBmc2VSMjIzbWF1UHRxb29pQmJKdWZYM2tXWURT?=
 =?utf-8?B?Z3VsM0hzNWM3cHI4b2lPNU53TWY0RjRKUjBtekxMajkvaVJuNW55dmdSWlV3?=
 =?utf-8?B?cTU4dmhsSVpmTVg1UkdabkZCQXdPWTQ1K0dzNXdRR3FzRWhiNklHMlJ1NE84?=
 =?utf-8?B?VUdTeWVpNWF6SnY2a3IwVkRZN3ZDR3NwZ3NtSURQMnIyRmp5MDJWTE5DWCtF?=
 =?utf-8?B?YVoyNkMvWDk5dnFhYkRNMU5TS0wwVGlaRkpxaEsvYkR6Ujc2S0o2TXpHR3hP?=
 =?utf-8?B?dTZaM1pRcFA2bVlQOU14cUZoblFHd1FUR24xQldSeW5GeURlWmtoKzBHM2RH?=
 =?utf-8?B?UGhEK1M4K0xrMXkzWWgrVFBoeEt5NUdlT3BZa0g0ekFJcEVQTytNY2ptT3lU?=
 =?utf-8?B?TGRzTlA3OW5tUnU5eHF3anpsNFNxVmZ2eldrVUpWYm9heHozVWtiL2JiWDF1?=
 =?utf-8?B?akpZd05DOHVrZEZCRURmekNyTHVuVnZSUDY0T25jMDAxcEVrcVY0Mzh2RTZT?=
 =?utf-8?B?ektWa2hhRWhhRVRZVmVpcWloY25XMDg2WXVSMWo5M3krdDdIeXJXM3dDcEJD?=
 =?utf-8?B?Q3V2OHc0OWFlcndST2hBSlpNQVRPOGYrTGZybkVuWlIyRkgwTXJ0Y3JBRlRF?=
 =?utf-8?B?L3k4anFrZHZqY3VDQlJwUGp4MGorMXdIL1RCRGg3YjFEQWZjZk1wNkUvUW9I?=
 =?utf-8?B?QmUyZzcyY01FbEV5eUxobE9DNGRaU0F4YmZ6ZS9TRjJSK1dHTTVHdVpYZTZr?=
 =?utf-8?B?WTYwcWZXZ0NkNkJ3UzdIMndjTTdEcTBwR2huMTNJc1FDekpuWmtFaS91RTEw?=
 =?utf-8?B?V01mVS9JTTY0c2o2bExJNmExWjNqOXBxZTFML3V4WWxaclVFYlh1eWxmcnpP?=
 =?utf-8?B?NnMxZFl4b3VnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0dJellxdkIyYkphS2JxUi84bXNMdUtGNEhxbWZmN3dFOUZoSmZrbjBHRHpy?=
 =?utf-8?B?VFczS3M4WXB1YVdYTDdBeUpJRkI5dFdwaGlQbjloRTdIbS9FNFNRTWMwQ0FB?=
 =?utf-8?B?a1F1UjNqZVhxSjBxMll0V1pJcE10d0RWKzFSQlhURHFuNkVVVlgzcm1mc1Qx?=
 =?utf-8?B?ODQ2NTZFYW9Od3VJeEsrczV6d2pvdGVKaGtpeUh1UHkxSHpCUlduRWl6Mmpu?=
 =?utf-8?B?bmpWR2MweHNYak9ZY2RKaGZFYThWcm1JZml2T1ZxRno4eDNpWkVleVJkZmcx?=
 =?utf-8?B?cUt6ejVXRTVBeW5FZUJILzRSKy9jRmxEVkdoR1ZZOXRSaVBadzJ5L2x1NExG?=
 =?utf-8?B?T25ncUpWSFNMQ1BIS0tucTVkdGgxeHlyOEQvOVJ6VDJGVFVtaUdIZkdVUXdi?=
 =?utf-8?B?UTZoWFFzUHpZNSt4MUpSdnk4UTVNU3ZYcHB6TTVKVUZyS1ExVnlWMGJLYjBy?=
 =?utf-8?B?OTF6YUR6bWd0VmRPVHpXMC9ObnRvVmsvdFZMYnljRFNZbHFYRGJ2d3Q0YkJ4?=
 =?utf-8?B?RXBwS3U4U3ZVV0RUUVRuN2tPUHpFSmpWdWQ4S2JtYnl2MkUwcFA2elFjL3dJ?=
 =?utf-8?B?R2tEUnZCYTJPMWFkRU5JVGJmYjNEWEYrV09KMXVrZ3YwUDcxSnVPSkhLQjlM?=
 =?utf-8?B?YlFabkd0WlVtY295cTUvTE5EVENMWVZoUjVtMWtQUGZBUCtpL2YzTy9IMk9S?=
 =?utf-8?B?VDh6T25BSklNdXgvNnV2dXAxSnNxd2xKSmNUZSs1R0ZjdnF3MEl0UXEwcEZx?=
 =?utf-8?B?aXU3bE9YZGRMalRkNWgwOTBvR1EyTXBqRnlMSGZlR0J6QXNpT0RUY2ZBNDZU?=
 =?utf-8?B?UUhvYVZrQ0kwTmhqWFhNQUYwYXRDVnFSUHgwWEpGZFhTS3dQako1U1BEUSt4?=
 =?utf-8?B?bmJJbEhadE1jc1d3dlpEeThRWmZibE40L3MxUnVtT1IvYkhyR3dGanREUlFT?=
 =?utf-8?B?dGliNUpKU01mb2N3dWcyQmo4YkxvNVM5UWJtUkdncHk3VG40Z1N5b3Q2SHJq?=
 =?utf-8?B?dk1HWmJNTnBBaVUycllNUmlFYjBIQ3I2dUJ5dU1SQXJYSXM3aUViZ256VWJQ?=
 =?utf-8?B?RDR0QzU4eFVhOTBQV0l2OUlZZEkxSWFXTy9jb3gvY3RIVWcvUFJFTnFWWHIw?=
 =?utf-8?B?VzVkUG5DOU9qU212Z0p2Vnp2MU1BZ3drcGcyeG15NnVaa1Fxaml6ZDNUeHpG?=
 =?utf-8?B?M2VHM0ZCUFZsTFFjL1hCZDN1RGMrVjBFQVpWaE84aFBPb1Rxc1BkeVo4T3Yw?=
 =?utf-8?B?dWJkb1M5cUJNZ1NiTDh6KzVGQ3YyeXFVVzlFMzZSaHo5aTlBRTIxZDBDYUpV?=
 =?utf-8?B?MCttcmJtYWlhRXIvMUM3MkZaRVY2ZzdFZy8rcXZ5cEdhV00zOXlBRXNpL2cy?=
 =?utf-8?B?dU53dE5XU2ZMWG4vejNiejVoajVXTTk3ckVZMEJUUmtJTjJHSW9RTW9IMjNz?=
 =?utf-8?B?MU0vcndLMmF2L21EUXdYR3lxcFBtdkZWNHVENDZzZkNTUUZFemhIS1R2VE5N?=
 =?utf-8?B?MVFtWUtlTm5wbzY4Z3dwbHV4OGErRGE4TXVJN2lpOHZGdThkOVk1TE1DaUpu?=
 =?utf-8?B?aWF2Lzh6Q3A4Ri9KS1U2STdRcnpZK1RGbmRQb1QycUUzWTVydzY3a2tidXF2?=
 =?utf-8?B?d2pYZXdQaTZRSFRUbWdxU1VqZXdRaVVFejVtUEFyWXQwK2JuS0dJQzRvNDVs?=
 =?utf-8?B?Y0dUNDg5a2pVRXNyNDNLWDdSOUtKeXlrQ1kvUU1JQUo1d01iTElJanN3V0ph?=
 =?utf-8?B?Z0FkdmRZcnh2eStFcGVycjRkM1NPUnFRNXUybEhBMlNHMFpMRUxTY2lPUFN0?=
 =?utf-8?B?bVpFQ2h1akoxYThJQVVidXdIV3ZiTFFuNk9FVUZ6Z3NrTjJLaTBBS0JWbXIx?=
 =?utf-8?B?SitsYXh6UVVQdFBZc1F3QU9ZbmhPWTJOUjJGN1hRdExTaUsyZmVsZXphaXU1?=
 =?utf-8?B?S2x2UlF3UXpzSnlYK1NmVmNleWtKRDlwb2EzcC9KaEJaSU10dHZuNzBmdmlV?=
 =?utf-8?B?WGFlaGRMZ3VkbnVmYUhuQ1ZlemVTSHhKd0tjVW5CVXlZUmxFQVRGem12UVk5?=
 =?utf-8?B?SlBPRGVVZWtsVWtibzFZWEtOaklmMUhucDJ2QTdld2NyMDJKbHlUcllzYWs0?=
 =?utf-8?Q?Ueqb1J+6r0UlZNOrMprOB3ckk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9bd3ba-5de0-4521-42ab-08ddba0ce4f5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 08:37:50.1558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RvheI/r3ie3Ik9XxXRp2bkKzfhmulQV/gsy1OmprDg5LKEVoAN0/JacNrGXD2AVz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4094
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

On 02.07.25 18:12, Pierre-Eric Pelloux-Prayer wrote:
> A vkcts test case is triggering a case where the drm buddy allocator
> wastes lots of memory and performs badly:
> 
>   dEQP-VK.memory.allocation.basic.size_8KiB.reverse.count_4000
> 
> For each memory pool type, the test will allocate 4000 8kB objects,
> and then will release them. The alignment request is 256kB.
> 
> For each object, the allocator will select a 256kB block (to
> match the alignment), and then trim it to 8kB, adding lots of free
> entries to the free_lists of order 5 to 1.
> On deallocation, none of these objects will be merged with their
> buddy because their "clear status" is different: only the block
> that was handed over to the driver might come back cleared.
> Also since the test don't allocate much memory, the allocator don't
> need to force the merge process so it will repeat the same logic
> for each run.
> 
> As a result, after the first run (which takes about 6sec), the
> freelists look like this:
> 
>    chunk_size: 4KiB, total: 16368MiB, free: 15354MiB, clear_free: 397MiB
>    [...]
>    order- 5 free:     1914 MiB, blocks: 15315
>    order- 4 free:      957 MiB, blocks: 15325
>    order- 3 free:      480 MiB, blocks: 15360
>    order- 2 free:      239 MiB, blocks: 15347
>    order- 1 free:      238 MiB, blocks: 30489
> 
> After the second run (19 sec):
> 
>    chunk_size: 4KiB, total: 16368MiB, free: 15374MiB, clear_free: 537MiB
>    [...]
>    order- 5 free:     3326 MiB, blocks: 26615
>    order- 4 free:     1663 MiB, blocks: 26619
>    order- 3 free:      833 MiB, blocks: 26659
>    order- 2 free:      416 MiB, blocks: 26643
>    order- 1 free:      414 MiB, blocks: 53071
> 
> list_insert_sorted is part of the problem here since it iterates
> over the free_list to figure out where to insert the new blocks.
> 
> To fix this while keeping the clear tracking information, a new
> bit is exposed to drivers, allowing them to disable trimming for
> blocks that aren't "clear". This bit is used by amdgpu because
> it always returns cleared memory to drm_buddy.

That's an extremely good catch, but I don't think this is the right solution.

If I understood it correctly we now give back 256k instead of 8k to the caller and that is a really big no-go.

Regards,
Christian.


> 
> With this bit set, the "merge buddies on deallocation logic" can
> work again, and the free_list are not growing indefinitely anymore.
> 
> So after a run we get:
> 
>    chunk_size: 4KiB, total: 16368MiB, free: 15306MiB, clear_free: 1734MiB
>    [...]
>    order- 5 free:        2 MiB, blocks: 17
>    order- 4 free:        2 MiB, blocks: 35
>    order- 3 free:        1 MiB, blocks: 41
>    order- 2 free:      656 KiB, blocks: 41
>    order- 1 free:      256 KiB, blocks: 32
> 
> The runtime is better (2 sec) and stable across multiple runs, and we
> also see that the reported "clear_free" amount is larger than without
> the patch.
> 
> Fixes: 96950929eb23 ("drm/buddy: Implement tracking clear page feature")
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 8 ++++++++
>  drivers/gpu/drm/drm_buddy.c                  | 1 +
>  include/drm/drm_buddy.h                      | 1 +
>  3 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index abdc52b0895a..dbbaa15a973e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -499,6 +499,14 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>  
>  	INIT_LIST_HEAD(&vres->blocks);
>  
> +	/* Trimming create smaller blocks that may never be given to the driver.
> +	 * Such blocks won't be cleared until being seen by the driver, which might
> +	 * never occur (for instance UMD might request large alignment) => in such
> +	 * case, upon release of the block, the drm_buddy allocator won't merge them
> +	 * back, because their clear status is different.
> +	 */
> +	vres->flags = DRM_BUDDY_TRIM_IF_CLEAR;
> +
>  	if (place->flags & TTM_PL_FLAG_TOPDOWN)
>  		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
>  
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index a1e652b7631d..555c72abce4c 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -1092,6 +1092,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>  
>  	/* Trim the allocated block to the required size */
>  	if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
> +	    (!(flags & DRM_BUDDY_TRIM_IF_CLEAR) || drm_buddy_block_is_clear(block)) &&
>  	    original_size != size) {
>  		struct list_head *trim_list;
>  		LIST_HEAD(temp);
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 9689a7c5dd36..c338d03028c3 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -28,6 +28,7 @@
>  #define DRM_BUDDY_CLEAR_ALLOCATION		BIT(3)
>  #define DRM_BUDDY_CLEARED			BIT(4)
>  #define DRM_BUDDY_TRIM_DISABLE			BIT(5)
> +#define DRM_BUDDY_TRIM_IF_CLEAR			BIT(6)
>  
>  struct drm_buddy_block {
>  #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)

