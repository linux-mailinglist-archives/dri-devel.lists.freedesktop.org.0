Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4392BAFFA90
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 09:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937F410E88A;
	Thu, 10 Jul 2025 07:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MC1rQ6OK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B59410E88A;
 Thu, 10 Jul 2025 07:14:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hg18pe8Z8/6FeYaCPODZUwz6kyLHgaIYf2TDNTgpXCFByD3NhxQH7AKBKEGnfQHWbwdAI6edxaNXb05d3qeQyEDA62LoLhVvvHFyrhW+buR35vyuw28O8dVSqhB7aI7Y7AKWOMNpB7vM/0AwlWa7LNqAcuyvtMSdv2orB1dhnLot+c4SXZJ7BZrEG461dwhLLvmwFjAAsppy+GB9NXcYXIcgV2RDZBFtALl5Qb7ncBYT5vs4SI78nlN1bm2P2a2gNOCNUwNKPp904go1qAcE4irVQz4YJsfDsdx2m1s2NBHFHKjOrDMrtYpedYawmuaFtTiTtDUkdlb4OR396rY9BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzUZg/XJ1uHLz+1rjNoMlpwxERENy4vemfx54/UyYY0=;
 b=jar5DuNkymBQcRScmi3/E9KGpWtVHmRneSvtpql9fmESJGvaq0QA3hQv65g6p858nHmuzCSaKAWRsOyMeMsA+ZeGWDjsGPSZWWORzxdYtJkf8Vrch4kIUBLuFQs/4mLYs5JOaH0wk3wLOfd7v5159UUJ2zxcQ6yWEXztrpEEsulBtjn/v2oaTbZIsMLNBltxucatrwWR1Oy8Za7Uy10SOXjM+3x6yXPsA2VFvCVQDEoQZ6vjjM5qbYRYABL2eK0Vp5ejEOfvB7g8mbAyhQiN94Ksj5m/StkRPwzGB23TGxIkhVI++gYZSQkEdXqNpuhKG/IkBNboeg1SQ9PZ2OkDyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzUZg/XJ1uHLz+1rjNoMlpwxERENy4vemfx54/UyYY0=;
 b=MC1rQ6OKXNxE+KmP7KSS00hChHuYbhbHFGqvwAfFELGnDOEFz1VjjMvvyAnF+qcL9VnCw1tJClttR6WiVIBHuz3+FutAz78cF8yFdqJ54IOEK6vklXbh2brPK3IGnA4k4kWXUI01+4K8PsMh79CZK5c4+nUr0Qew2jEW3cdSCUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by DS5PPF4ACC15C0E.namprd12.prod.outlook.com (2603:10b6:f:fc00::64c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 10 Jul
 2025 07:14:23 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%4]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 07:14:22 +0000
Message-ID: <16d56381-fec5-4cd8-a84c-4ce969786d9d@amd.com>
Date: Thu, 10 Jul 2025 12:44:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/amdgpu: Reset the clear flag in buddy during
 resume
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 matthew.brost@intel.com
Cc: alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250708065404.4185-1-Arunpravin.PaneerSelvam@amd.com>
 <20250708065404.4185-2-Arunpravin.PaneerSelvam@amd.com>
 <f5386d20-326f-40ba-834f-953a0d7d18e1@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <f5386d20-326f-40ba-834f-953a0d7d18e1@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::7) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|DS5PPF4ACC15C0E:EE_
X-MS-Office365-Filtering-Correlation-Id: 141939aa-d334-47c1-85f9-08ddbf8164fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1R0d3MzSmRDaGRxeU94Qmh3aS9IY2RlZ0VlejQrU2g4a0hkcVhBUUdNbExV?=
 =?utf-8?B?MTFZQSt6UGpYYy8vVmdtMmRDUFZvRHc4bWgwcDhqQ3RmRXY4R2p3MmVRVkhv?=
 =?utf-8?B?MlR5T2NvSmlzV29tanZuQWtBNDB6TkxSNUxiYnNtOWlLeDRNWEhLdk9CaWlu?=
 =?utf-8?B?bys5VnlXV0hXWEdGSVFtV3JpRGtPUTdzdnEvZTBGK3Vla2Z6Mzd0akRMUDBY?=
 =?utf-8?B?bCtjRGhpUkZKS2N3dXpxbHRvSi91Zy8vZnFvei9vYUJNYWtxVzZVRnlPYWtV?=
 =?utf-8?B?R0thUGNzYVIxaUpXYzJ1RWlFNGlpOTVvTnA1VmNlOXFONmxQZCtrbnhmUDh2?=
 =?utf-8?B?K2w5QW5GK3owR3QzaUkyc0swa2VOSDMyQ25XTjJRbmZiMFpFWWcwMTBSalVR?=
 =?utf-8?B?UllmSnVOaC8zUUIwS2cyMVNiQkZ3cWMvaFg4cXZUUXJ6a0pyNTRaY3cxNmhE?=
 =?utf-8?B?YVR5YXB2aVZJUUZjd3pwK2hkR3ZMMTVnQWVpajVLZGdGMEtOUnk5WGZWcWJp?=
 =?utf-8?B?K0x2ekxxcmxyR3kzV1dRSTB3Q0dBbjBoK1VkM1lTRExlV0c1VWE1Sk1ManlW?=
 =?utf-8?B?RnV2RHNzYTc1RFl4RW1JVnZlMmF3amp5WVRYNU52NFlJMzB1MUxVR2IyRzh3?=
 =?utf-8?B?MTdHMkc4ekZGQUhSRDk5ekUrRTA2SWJsNlRFdU5vS0Zkc0JKd1d6UitKenAy?=
 =?utf-8?B?cWdIaW9VbTdVTkNXMVVmM3VYUDZnUFowd1R6OHZCOWJkbjBSMExWaEdmOXNJ?=
 =?utf-8?B?a2o1UTVXemhlYVBwYlFCWXR4b1lVbjdtcnZDemZaRGRXUWx3ZVlaYm5hdVFU?=
 =?utf-8?B?M2o1SnNmSzhrUjJCbzhOaysvVVFkcXNvY29SMFMxMUR0N01WbDRGREMreGxt?=
 =?utf-8?B?V2ZnUEN3NVNMOXUyeXIxVjVoTWpFVzZKVkRZUE0waVBaeDdLUWk0N1ZuVnQ4?=
 =?utf-8?B?aTQxd210WmZpVlZGRjBZS0g0d3p0aFFPN2RMQ3pjanhjaVJ0N1RyZmlvZUMr?=
 =?utf-8?B?SDNiQlEwekNFNTJKaVFoanZDR2RiV01UL2tkOVRpMlBqdFR6QlhOWGFkWFY2?=
 =?utf-8?B?V0pkRVpsYlF3dklDRE1EVUJqTGkwbW5NRjFNUkxOaDVJS1c5ano2Y2ZKay90?=
 =?utf-8?B?N0VKTmJ0dExrMUE4QzJHb1dJUVlxNVdKNmVpTGJXRDBTQmd6QUl1RWJPMWFo?=
 =?utf-8?B?cGppUFNla1dsM01QcTMzL3lQcWE0aVM3ZyszTHQ0NVFuV1M5YmRXOHVBRzEw?=
 =?utf-8?B?NzhnakhlUzlra3hCdDRGYmFXU0dTc1dFSy9jdzhQdjBXTFhKcUo2UHJSQ2Y0?=
 =?utf-8?B?Zm9lY0MwN0FRT1N5djUzd3d3L00yWGp6NTVjOW0xWFNOSDhBZFFkdHlLeFU5?=
 =?utf-8?B?OE0rMHpTSHRDdWdWVWpIRzIxNUdWbmRjWDEwTTFCaWVKUFNyZWI2RVlIN3hF?=
 =?utf-8?B?aTI2eXRLbEJuKzJIcVNtQ3JJdmFZalBTZytuK0lZS2dqbW5JbFhaZmZIMWZm?=
 =?utf-8?B?a1o5dlkyOXNaTXZ3SWNyN29MZVR1MStnU2pmTFk0RHJ0NEVUU2ZRSGFUOUVR?=
 =?utf-8?B?alBVY21zbkhXdHVodzU3MHpkZkdyUVd2VE1CSlFGb2hpVWJvQVJnbit4Y2ky?=
 =?utf-8?B?dUo5M3VzUnpQS1BhWXRlU0JSUGl1ZFI1TkV1UXNYbGRPTWZ1bHpRdTVSYVpQ?=
 =?utf-8?B?RGxacjJydFl4b2NJRDdOVmZYV3hXeGtaSElZcHhxYXpzRlFqTjZvdjBiYlhG?=
 =?utf-8?B?a29aTDFwazZjU1p0ZU9LQ1RibEd0a2tneEd5MlpYeWN6L3BGaDdiR2o0N1ZQ?=
 =?utf-8?Q?wGLsVhza1VSGn7ZUNLi561nj3M5vnmPW2Fvig=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTdBaWk1UzQ2V25Pa0tZN3VVMGhuZm9RZzJrMFd3SkNrTlNCUmdlWUlwQkl3?=
 =?utf-8?B?MENlclp6cUhCQm0ySkdFOEVpR1d5UnpVQXRTbGIzT1RMd3drMHNaOHVNbElD?=
 =?utf-8?B?QVV5M3dNcWUwSlp1Z0ptd0hRK1RtZlJraS9XRHU2bE10ajRqQ3BBK2EwSTFO?=
 =?utf-8?B?NEQ1VXQ1L2duV1BDckcyZ2ZIamZKUDYvTVRkWUVUMnNLeEU2RFFWV0xnejE5?=
 =?utf-8?B?TUp3N2xhRnRPZFg5RTFWaWpROEpJMXFCek9GOGVmU3BBTGlIdWE5di9ZTWpw?=
 =?utf-8?B?VDFxVXp0aGZwNVFVU2tFSStjbGdoNGhPb0Zoa2FVRnZlSmJ4YkdlZWdCbzZi?=
 =?utf-8?B?a0w2OURoYXhUcnI1QWNQRW1VNm5DaTMybnJDSnRvVjJWSGRQUXY3RTJycUls?=
 =?utf-8?B?REhMczhyV1BLa0xqVHF5TXIreUxVd00rM05WUGUxV1JYNENKa0JHdEwyaXdk?=
 =?utf-8?B?RmFqclcrNEdkcDk1K3d6L2RQK2ErZmlRN3NSQlQwLzR0MnFqbmE0czJEeDNU?=
 =?utf-8?B?aTBNc25rWFhSeWYydjhZelhLUFN4Q3A3Z1JqRStpcXhRZnZNeUlRNWcrWlJK?=
 =?utf-8?B?Rjk4YWZEckxoc1ozSk5WVjc4NXJldWVRa0NWTlk2Y1NieHRBQ3I4T0l4VVZt?=
 =?utf-8?B?RHNqQ1FyV1hvZU9aTGxLVHQ0d3FKdFVWNWZLazlxOEIranZEa1Frd0xaNmlJ?=
 =?utf-8?B?UlVPQStraGV0RmJaazJKU01zenRITnJjdHlhV0xTTXRvOFpCOVNNT0cyN0dD?=
 =?utf-8?B?cHZxK1orL1VsYXZmNTVjdVRuQmQ1RWdHSlk1ZWc1UTBaN0FYekhjbGdrQkdv?=
 =?utf-8?B?elBSZWp5bENkRHRwVllYMjdGUmkxRnVIM250Vk9zS2RNZDRDNlBKdkxoWFFp?=
 =?utf-8?B?NmQvVEhlQzJSMCtMTVFOK3RzWEhsZ1NmSmVMMTBCWmVDZnJPajVMekRlWkNm?=
 =?utf-8?B?eDBaT3NGZENvUklPbUlHTlpmcFRuWGs2UHhZa1N2THVXNHBUb0FTWFYrZisx?=
 =?utf-8?B?eHVWMjZzam5jeE41bVZ4L2JNMVFyTTgvdHF5dXhxMFJFMFc4WnVDSmU1elh1?=
 =?utf-8?B?VDBicnczSlNvUTlabFhHSXR1L3N3SWUraVdNMHl6UDN1RmpqVnVYRDhIODRu?=
 =?utf-8?B?aWV2SUNEUXhtQjNlaXVycWg0bjM4Qm5HanV2VGdxMGtmaC9YS0dYYjFnZDV3?=
 =?utf-8?B?SlhaYTBtRUVSRWNacUlHM2hLYjcxTGViUE1TSThnL2xScTdOc3dRZ3hiMmV1?=
 =?utf-8?B?cjZGbzBqTGsrMmhIb3dCc2ppam8yTlRMVXdFelZkNXkzZGpJTFI1S0NIcWdQ?=
 =?utf-8?B?RUdJNTFZVlBtRlkvcXM1MmlaSE1haTBySHBRNWdaaG9QZm01Qnd0MW54a0J6?=
 =?utf-8?B?SEh0TGJSbFEwMDY2dkhEditNVWJxWWZZMEdvUkZoNnhTdlNEckJFRG1SWHUv?=
 =?utf-8?B?MzNXZVBLNVpweVNNRWhmUjRYaEcxaUZwdStqUG9uMHFkZlM0eXU1Uk9nSEFB?=
 =?utf-8?B?Z040c1JCUFptRWFnZ1lkRi9xcWU5MWlOL291R2hhamJLclA1WldoOTlQb0ZQ?=
 =?utf-8?B?VEFPVERhRUQzZjNLOGdSRW1YWGxiMmZYY1JqaGV4NkFabXBYTXluN2VWOXFY?=
 =?utf-8?B?Z3JuVVo2djFKbzVFZDNGN2xBOFNoWHVDclFkWE9OK0JCclAvR1VnNkNsdUww?=
 =?utf-8?B?U1E3RzUzdnFqVG1CcXRRVEVJVzVuc0E3ZzFBQU9NTVVhbkdNNXRYUm1tNFVw?=
 =?utf-8?B?ZlM0K2FzS0dJbHRhMU1rSUZSSXFQVDZCVDM2VndEN3c3MUJDbmliaTBzUnhP?=
 =?utf-8?B?VTFoay9wMGRmYTRnQzNuaXRkV1hzSHpNdGlqRXFiWGZiNyt4WG83ZHdiMFlV?=
 =?utf-8?B?QXU0S2xFYkc2MS82TmJtRTVQKzI0Q3g1aGN6WXdZZFBlYmowTGRJVnpDV3dB?=
 =?utf-8?B?b1pwSGt3d014eExLbmQ3dzUzVzAzMW0xeC9FOVhzU00wd1d2N2V0QlBDUzJZ?=
 =?utf-8?B?a2ZTNDQrNkgxdFJqcTExKzdjU0lVaWFIeWpDNEZ5ZHREUWtXelBGQTFpYXVD?=
 =?utf-8?B?TkhyZHJTTllxZTE1OHhvNlZheXR5TU5tRjU2cktmTkQ4K0ZkYjkyZS9JMU4z?=
 =?utf-8?Q?JZficPov3vqZPltDsnb1Hov0m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 141939aa-d334-47c1-85f9-08ddbf8164fd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 07:14:22.6407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WxjvGYem3EAwTELNuXXToc2WH/YMV0chqwwbNy56ORjmA5ppDhlLO8HY1Tp9nZLC/PQctdL2muMQCrKyc2Sbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF4ACC15C0E
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


On 7/8/2025 2:30 PM, Matthew Auld wrote:
> On 08/07/2025 07:54, Arunpravin Paneer Selvam wrote:
>> - Added a handler in DRM buddy manager to reset the cleared
>>    flag for the blocks in the freelist.
>>
>> - This is necessary because, upon resuming, the VRAM becomes
>>    cluttered with BIOS data, yet the VRAM backend manager
>>    believes that everything has been cleared.
>>
>> v2:
>>    - Add lock before accessing drm_buddy_clear_reset_blocks()(Matthew 
>> Auld)
>>    - Force merge the two dirty blocks.(Matthew Auld)
>>    - Add a new unit test case for this issue.(Matthew Auld)
>>    - Having this function being able to flip the state either way 
>> would be
>>      good. (Matthew Brost)
>>
>> v3(Matthew Auld):
>>    - Do merge step first to avoid the use of extra reset flag.
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Cc: stable@vger.kernel.org
>> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3812
>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Is this RB also for the unit test case (patch 3).

Thanks,

Arun.

>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  2 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 ++++++++
>>   drivers/gpu/drm/drm_buddy.c                  | 43 ++++++++++++++++++++
>>   include/drm/drm_buddy.h                      |  2 +
>>   5 files changed, 65 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index a59f194e3360..b89e46f29b51 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -5193,6 +5193,8 @@ int amdgpu_device_resume(struct drm_device 
>> *dev, bool notify_clients)
>>           dev->dev->power.disable_depth--;
>>   #endif
>>       }
>> +
>> +    amdgpu_vram_mgr_clear_reset_blocks(adev);
>>       adev->in_suspend = false;
>>         if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D0))
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> index 208b7d1d8a27..450e4bf093b7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> @@ -154,6 +154,7 @@ int amdgpu_vram_mgr_reserve_range(struct 
>> amdgpu_vram_mgr *mgr,
>>                     uint64_t start, uint64_t size);
>>   int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>>                         uint64_t start);
>> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev);
>>     bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
>>                   struct ttm_resource *res);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> index abdc52b0895a..07c936e90d8e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> @@ -782,6 +782,23 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct 
>> amdgpu_vram_mgr *mgr)
>>       return atomic64_read(&mgr->vis_usage);
>>   }
>>   +/**
>> + * amdgpu_vram_mgr_clear_reset_blocks - reset clear blocks
>> + *
>> + * @adev: amdgpu device pointer
>> + *
>> + * Reset the cleared drm buddy blocks.
>> + */
>> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev)
>> +{
>> +    struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>> +    struct drm_buddy *mm = &mgr->mm;
>> +
>> +    mutex_lock(&mgr->lock);
>> +    drm_buddy_reset_clear(mm, false);
>> +    mutex_unlock(&mgr->lock);
>> +}
>> +
>>   /**
>>    * amdgpu_vram_mgr_intersects - test each drm buddy block for 
>> intersection
>>    *
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index a1e652b7631d..a94061f373de 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -405,6 +405,49 @@ drm_get_buddy(struct drm_buddy_block *block)
>>   }
>>   EXPORT_SYMBOL(drm_get_buddy);
>>   +/**
>> + * drm_buddy_reset_clear - reset blocks clear state
>> + *
>> + * @mm: DRM buddy manager
>> + * @is_clear: blocks clear state
>> + *
>> + * Reset the clear state based on @is_clear value for each block
>> + * in the freelist.
>> + */
>> +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
>> +{
>> +    u64 root_size, size, start;
>> +    unsigned int order;
>> +    int i;
>> +
>> +    size = mm->size;
>> +    for (i = 0; i < mm->n_roots; ++i) {
>> +        order = ilog2(size) - ilog2(mm->chunk_size);
>> +        start = drm_buddy_block_offset(mm->roots[i]);
>> +        __force_merge(mm, start, start + size, order);
>> +
>> +        root_size = mm->chunk_size << order;
>> +        size -= root_size;
>> +    }
>> +
>> +    for (i = 0; i <= mm->max_order; ++i) {
>> +        struct drm_buddy_block *block;
>> +
>> +        list_for_each_entry_reverse(block, &mm->free_list[i], link) {
>> +            if (is_clear != drm_buddy_block_is_clear(block)) {
>> +                if (is_clear) {
>> +                    mark_cleared(block);
>> +                    mm->clear_avail += drm_buddy_block_size(mm, block);
>> +                } else {
>> +                    clear_reset(block);
>> +                    mm->clear_avail -= drm_buddy_block_size(mm, block);
>> +                }
>> +            }
>> +        }
>> +    }
>> +}
>> +EXPORT_SYMBOL(drm_buddy_reset_clear);
>> +
>>   /**
>>    * drm_buddy_free_block - free a block
>>    *
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index 9689a7c5dd36..513837632b7d 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -160,6 +160,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>                u64 new_size,
>>                struct list_head *blocks);
>>   +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear);
>> +
>>   void drm_buddy_free_block(struct drm_buddy *mm, struct 
>> drm_buddy_block *block);
>>     void drm_buddy_free_list(struct drm_buddy *mm,
>
