Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14095B1A156
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 14:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D55710E503;
	Mon,  4 Aug 2025 12:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="g6RCB/aH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C756610E501;
 Mon,  4 Aug 2025 12:24:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpyPqS6+wn3x6M5yhLsBkmd/e5PiNEN2FCIR1m93ShDY++HklhLzhs7tdR2zkbIQ3ymx4kN0obZjsAdu++4DCF8sz2pA1frLQGBSOtjJXC30K1O3lffNwsApyIyJahAmTKLkqJ84YM8hlwf1+qFMGmkKPhelPYu7hdhCdfQAfLBLKkVPHK7IvF9pwc/EympV8n2eg0sMhVh+03FGxi7049V8k9vMoq9WA0NX+lbvRvurp7iLXW2aqqUprk0AvW2wwGMOBM+RgTMtg96Pr6XgFB5HUt8mlfIDrOIXr05BToyFRmdncPKRF7yNDhaHvxxmElw0QtFwG+wY7Yp1jiHKQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEtebqL1mK5bX82vaVxBOfwUXiTYcxdM/CXv3kv4pUg=;
 b=GNf64ZAVQ/RUv9X3vX7KMZ6JwZ1JZpt6q9rwWcI7nt5df1W81scyY100BuGAYK8RN3oevNoqZ8saaONfcPlDmNIlWUvFMfF3u6tgq7LIWA7BxREpWi9ly8mUCtLfpUhfurD+y5J8NE+rIDV3ZoI+f4uqDGkOkQyqDEt1u/CeqeaXpx3h3vFUPXjPfX2n1SOTI/6BS8f3v7cKBoZBtnV8B02zZM6o4+vjOgLd+uCr0RbJziOHtSA9udNlukFMJYJ5hsJFvGdMM8k9bWawFChv2/InIKhkarvoBeXyf3lCDCOa1Sf8oHRUKsOgBYGy9vZkwly30tqUTuegeigIiFrSLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEtebqL1mK5bX82vaVxBOfwUXiTYcxdM/CXv3kv4pUg=;
 b=g6RCB/aHo9TDjCIh14QA2nQReE59pPgoUgSyU8dGmdFS2r1k3pSHQML83aIBYeqSAvZaPRnEtLW3GcO8kURTzcTZJJ+7c9ARXi0ShtyX2VUomHDTX9gQsXKs5+/3eJwY/z1SkIdTt2R217c8Knf5dTEbWDXcdpdl3nihDOAXV7E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6562.namprd12.prod.outlook.com (2603:10b6:510:212::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Mon, 4 Aug
 2025 12:24:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 12:24:35 +0000
Message-ID: <5a9c2c36-d1b2-4871-b84a-7372aa547399@amd.com>
Date: Mon, 4 Aug 2025 14:24:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Switching over to GEM refcounts and a bunch of cleanups
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250716160555.20217-1-christian.koenig@amd.com>
 <c5830530bafa9806b9e1b0604d87f7907f651c82.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c5830530bafa9806b9e1b0604d87f7907f651c82.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR01CA0022.prod.exchangelabs.com (2603:10b6:208:71::35)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: d82a06d9-9a6e-4994-64da-08ddd351df2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFRMK3c0TXFxcWVpaGpRVGluVmFKcXp1dE56L3kyUStCblJaaVhaYWlRYy9x?=
 =?utf-8?B?NHJ5TEFscTFjaktrV2o5a08vSTNEVVhwUUJ3aTl1akhqY09iOFFiOWpvUFI2?=
 =?utf-8?B?NHlUSStMQWl4ZTFEdll4VGV4TWJDL0xkQlZPd2phSW5PZE9sbzgyZGlVdy9p?=
 =?utf-8?B?S1NGMzFlbFpZT1dmd3JxUmJ1anlHem82SldNbUQzUXdOOS9Ea204Z1hqbG5h?=
 =?utf-8?B?SVAydmdwRlQ5YlZTaUpvSHJEUlozRlpOZTMwNjJTMitwcWNCeE9QUUg1Mm1M?=
 =?utf-8?B?cnJveDQrOVB5NGpLcjZaWTdMR2NqRytKbzFsczdpV2hJYVlTcUdKRklaK095?=
 =?utf-8?B?T0JubzFCUG9VdE01MVZrV3dzQ2IxYkg1MFFqNkQxUE9BVytzUFB5QnhoRW9v?=
 =?utf-8?B?aDB1NEhXWTltbXNFZ0sxandTanRVenQxV2g2cTVUU2xzVENVcXZzRzF3ZWtn?=
 =?utf-8?B?UmNMMmFmTXZLM0lLY0xGQlJvbld2anFHQjJNZ2ozTC81bTV0OXJHdHJldFRx?=
 =?utf-8?B?WGpoRmJVTCtpK1ZpY1FydXNBWElJcW9rUFlHR1o5cFFIQU12WFl3UnN6Z2t5?=
 =?utf-8?B?dzF2UkxrV3grWWJsOFFjZWtDekpsdWVXT1hmTVBLcjV5dWpLZGRKZWVkYzM3?=
 =?utf-8?B?ZnJ0a3Zpb1kwRjdKR3FGeEE1WGZlczEzY053bW9xR2doZ2lqMldnZktHNmJt?=
 =?utf-8?B?WHR5VDVrdHZNMU5ETXVxblB2TEVWOHlLSGlDOHBOU2t0RGI2aHBZWHhjRUZP?=
 =?utf-8?B?R0NOVXlVcEtTOCsrSUNsQkFoUjl3eVEzV2ZaRTVJendwbnd6VjFwb0RyR2xk?=
 =?utf-8?B?SmhFeS9wYUthaURvZEgvZ2I0WnRKbGg2NUZ1MDhDK0pxUHRjblBHa0x1cVFa?=
 =?utf-8?B?VWJLVzRSaHp4MWoyR1ZJazBXL0JUVkdBOVpNR2cwVFpySGFCaWR4TEsyMUtq?=
 =?utf-8?B?VCs5RGFiMis1ZGpQYXE2S3FzckJxN3poTTlsSVhuR3JDSFZ3NGRXemduanZ0?=
 =?utf-8?B?NGVKYWhhMkRvMldWaWsraWhpVjM1dDgwMitmQTNZSXZhTWk3cWhzbVA3dDJS?=
 =?utf-8?B?SWN3enRKc0c0a05nS3V1VWJWKzRnNWFET2wzK1ZJZCtzWm5IMFpzZ2pIeS9X?=
 =?utf-8?B?QTB6b3hOei9UZk9ERmtrR05CaW40cktPQzdKaUxteUpIMzhQSzFVc2R5WmNs?=
 =?utf-8?B?OHUxemliMTBjL0U3TCs2dEtiZlNDekpFK1RkVW5mUGZmOVp0SzBHaXMrR2Nr?=
 =?utf-8?B?M1BxTGEvYnI1MTB3dkJOdldHVEVNSWxaYVFVOTRVc1BJNXhwVUljNXdUVldH?=
 =?utf-8?B?a25IMTh4QzRaQTYrL1E3UjcwaGhwQ0MyTG9IbUtvcHJiR1JVK3NxNzUyU1Zj?=
 =?utf-8?B?ZjRUM1dqbUdHYzNLV3c2TllWQ3JjdWxuVTZRYVQxQ2I4VVZkTzRySzdRcW9G?=
 =?utf-8?B?WU9ocUMybkhCV1dLWEI2bFloSFZLWWw5U2lWRDNIWnZwdkRTK2ZzbHlOZmFk?=
 =?utf-8?B?YmZCeFFkNnZuOHJwMzRWcy92YXpETHJ2cnFHUkI1cUxWZVU0VXhiZDFaVGVQ?=
 =?utf-8?B?cnpTRVRqMWM4anRMb0k3cElJRWNQUzBmYlZtOS80cXVhSkc5NTRWS3Z2V0lj?=
 =?utf-8?B?Y3VJVi83S1Q3U20rSms2Ky93ZXZFQmVQWlNDM1RrT0psdlpwUjZlYkMxN1Ba?=
 =?utf-8?B?UktFN3pLTHVhMFRLL0o4THlyaFJPMFJMbE4vemh5SlE4eE8zKzBNQURtNnFs?=
 =?utf-8?B?cHh0QkNGeTF0QWN2WWZZVU5mREJRdTMzNmdvaHA2d3U1TVlCTEdOc1RDVzMw?=
 =?utf-8?B?aTVMVVZEVGJoYlhEQUxvNDhSRmdBNHFBc0tHTHFXYTEzdlUxSFRVdXNWTUZ1?=
 =?utf-8?B?N0Z5RVpTNW51bjVLdDV6R1FvSXQ2VTNjVW1lc1p4eW43QkRhLy91RnpuNGNF?=
 =?utf-8?Q?aQfkivAIrxA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qzk1NGwvd1JiaTFNZzBoZy9iUm8xazdqY0llOVFNaWxmOXVuQyttNEVNUFJV?=
 =?utf-8?B?aDUybmhWQTQwb3dWL1A1eWg2UmVKYjZHWkViaHhGRU5IamFmOVhHbjB1MzFm?=
 =?utf-8?B?Wkc4MDUrbFBCamFIcXI4akk0QVZySVRHaXlzaXdIemFkQ3ZZZFFwVytxdTVG?=
 =?utf-8?B?Wm8vWGZaUlhZSUNNN2hjeTVWb1VXOGtpZDBtZDcwNmRoSDZBMjNLZEZVanhC?=
 =?utf-8?B?Wm8rckthWlQ2NjR2RlhQTmJVQkxxcVJRMjU3K0svdThLWUlCa3g5M0J2WWtE?=
 =?utf-8?B?bTFZWm83UUhtZkgxWU53cHRNNFZYOUMvREhPQ05KK29WazFLcnh2bllLcGhB?=
 =?utf-8?B?M0JmelNhQ01zd2FNVDYyVFZoVGtEakUvMVIxY3lQMzFyR2d1UzJSSysxdHp0?=
 =?utf-8?B?VXZNVytValRCeThQWkFIakhyOHI4RFFHTEZ2UjhENHIxbGxzRnRiSkNPTHNQ?=
 =?utf-8?B?ZXM1a0RQa3VLT2RJK1UvODc3TGsxVjlMV29OTUF1YXBMUHFxVXMrNXBSTGlV?=
 =?utf-8?B?Z3dKNVd1TDVibE92MFJpaVBKS0hGK252TlNWNWxrZ0tyYlpsVm5lTXl4V1Rk?=
 =?utf-8?B?Yk4zOE5TMWNJaDM2bjVqL1MrTmEyZlU1WjZPclFEcDJNMEpuQng1RWxucEVG?=
 =?utf-8?B?aUFTeld5SGErdDZNVnV0UUpHNm0yR0h0WnJrVURuc2VVNGtjb25zeEVPcHkx?=
 =?utf-8?B?ajQ4Mkp0R1lWVFFzbTBIRXF3aGphNDM3bkVwYWtlZU16bFYzQkdBbi9Qa2sr?=
 =?utf-8?B?R1N1UGZCTnlTTmtrbEpCOHFkbUJQUXRxTFV2VG9EVlZnb1R4WE1hS3FBN2ZJ?=
 =?utf-8?B?bEJ3ZlVGOHdkcmVvSWdjZU16dTFoRUcxMWFndklUeFpjVW5ZY2g3VmRoZytP?=
 =?utf-8?B?ajN3RU0zVU5pYTQ0b2ZjL1R6Mndydzd0Rm9qT2tTcXFGV0E2TGwybXhqaGFG?=
 =?utf-8?B?amVFRGRQWElpRXVFcnh6Z0RDNHhNT1NseXZyR1VwcEdTTUFtNDhkR1Q0QVRh?=
 =?utf-8?B?ZmNCMXdzdlY4bmpweUM5NWhLTDY1R0JxelM4dVprRXFWOXlxUWYxN2dYczJU?=
 =?utf-8?B?UTliM1BMd3JEcktLcXU0RkxJOGlVZnhUK3IyNGh2aGJ1RzQvbmFsc0huYVkz?=
 =?utf-8?B?a0paTEduaEp2cHFhRnNHcGtEUVoxQlBCb3d3aWMya2dEaG1VNUwyMUQzZ1FL?=
 =?utf-8?B?NWVhZkZsRDZsS3U0V0hNRXRsZVM4bUxlRGNmTUcxZWpLUzkra3hrZlJ0ck1i?=
 =?utf-8?B?SWZpNmVNck9yeGZvRHhoMzlkUzhZOVZnekF3emhYMWZKd25BY05ma3g4SVNx?=
 =?utf-8?B?NFhyenBFdEtDWHdvOFIxaUJQT3VQQ2x4aG1yNnpCRWNOb3oxSndPS2ZRcnc1?=
 =?utf-8?B?SDJWRGxwSXg1RFlUeEVGV1N1b2pqcU9MUFo5cDhxOFdhK1NIaUtveW5ycVJr?=
 =?utf-8?B?RkU5aUtLK3VwYWprWC91V0NrOTNseEZ2aHJCRDJuOHBlKzlGdFpobEhlMk15?=
 =?utf-8?B?MGtaZHBFSStGUzFvS0pNaC9HMlRRM0NYM2FmbHdSOWM4SFBXV0NFSk5iMkcr?=
 =?utf-8?B?ZU5wb3JpMzRqanAwbG9zRnBUSW1LWm5VSjczUFpqQ2pzc1QwdFdMRWNNcHM3?=
 =?utf-8?B?UHBPS0w5dk1pQllnd3hCeTdjcTZjd0tNbU5PV1VzUmJpbDl4RGhoUXZoSjEr?=
 =?utf-8?B?NllLYXFaTVNZcnFOUDJWWDlKaEpXNWtQYkNrd3dpNzJPSWMvS2p0OHV0eEZ3?=
 =?utf-8?B?VzBaWHAzWitqUDJlVGUxWllORXk3emZuNGJDZU11VHY5amJKN0xSM3pUZ0VN?=
 =?utf-8?B?amFPSHJDSnR1VXl5N0hiaWJMRjRSeE0yYjBLcHJIRHM3UjU4KzEwdzFaVDlv?=
 =?utf-8?B?NDBQMTFFcHVBekVxVU1QUEQwN1RzYmxMVkt6NU82dmE1aWZVU0VEemtIM0Jx?=
 =?utf-8?B?b0ZFTDlaVnhmQThmZ2ZvbSt2OTYxYk5XeFVXbHhaSkFzWmFKakNZTk9OTTlL?=
 =?utf-8?B?VjdqWWRJNjhYZldWcXFYdndNYU1yeUFVNy80eEpTQkoxTU94NmQ2b094cWVu?=
 =?utf-8?B?ZVlaZHYrYTdWZXlvYkRkTXBNQVdNUENXQURjRWtVTGZiQzNPWnRKNHNnNkx2?=
 =?utf-8?Q?deWk3hbMtN+caCxdNTcEVjja3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d82a06d9-9a6e-4994-64da-08ddd351df2b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 12:24:35.1111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6z8wpEtLCRSj2BmNvzUY/dBWR9jfkgTYU1n9ywgiDbOYA/ndlnbUm7IKD5k7aosE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6562
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

On 22.07.25 14:36, Thomas Hellström wrote:
> Hi, Christian,
> 
> On Wed, 2025-07-16 at 18:04 +0200, Christian König wrote:
>> Hi guys,
>>
>> so I hope Thomas is back from vacation while I will be on vacation
>> for
>> the next two weeks.
>>
>> Here is the patch set which cleans up TTM and XE in preperation of
>> switching to drm_exec.
>>
>> Please take a look and let me know what you think about it.
> 
> I'll take a look.
> BTW Did you see my comments on patch 6/6 on v1, essentially I think
> both i915 and xe rejecting some TTM callbacks if the object is a zombie
> (the GEM refcount has reached 0).

Sorry for the delay I'm just back from vacation.

I have seen that XE and i915 is checking the GEM refcount, but I haven't seen your comment on that.

Going to take a look ASAP.

Regards,
Christian.

> 
> Thanks,
> Thomas
> 
> 
>>
>> Regards,
>> Christian.
>>
> 

