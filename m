Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31948B22E3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 15:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F40112022;
	Thu, 25 Apr 2024 13:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vqP5lVQI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECDD112022;
 Thu, 25 Apr 2024 13:33:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWWArfKyFEgBpUnA0W7JUVZs0aKfWkHDM4mcKu0+aHV8i7EltDjeouVZxuVHreqZGAYV0Rxw572O6f65U2hZrQAfRBmCuuSrwv6F4cWsWCVChdM7t0E7fNlXx8EFmdxkL3I3pEBYYsv6/Mc9von/HW+Pp0keyId07UwAohSwjSQ+yYG3FbgeUmkHlhr1zkoWIAUCCDEfGUFQIsT/8MesSfTTOmG3o1LWzvQOhvA4CLqPRpcz2naeHqCgTZzUp7jv6fltsAsfTrnt8zwzSa1/UIcVAm/nsYWPkGUgT3QLoaGXUkhG5tE2ZQA/Jj6baqvUYf6Mjpew2xjetVwplrWlag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUgsUK3a6CIrfSrmthLtvXW55oSk0gSbVbT7/pq394Y=;
 b=kGRpt97uUHY7buBucVSE1ZiO55Jkw7i+MTqDORZR4V5l/lrhAvDQD3tq5OBh72O9irgwNnW6h8m0VNqkIDNqccswIEnTtHj+WRXosf3qqLNt5kDVrQejkc+uDw23ngklX/5Jdwv2HZFZ12+EYF2Tg+hvi+HERxBudGXVhnnA5/LztvOm3rV8uochROWzVObV0h45EmxUMe3Pt8e1i48NSVnpteM36N/r2TR9dcOB8JlMWWo7z8X7XrAJskAAGwzbWJ9VRmAKCvMCLLulmDNRSEpKYghGKJpYgRw6qDBi/Ge/iM+5HtI5LUUCyNNV1MAMPezM4ZcdojafsG3i4/Zb5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUgsUK3a6CIrfSrmthLtvXW55oSk0gSbVbT7/pq394Y=;
 b=vqP5lVQIzxfttWsQ79ugorFg43CLoMmewgRWvBPGlWpDhG808gmPSM3ClM7X/bn/F/cPUEVKBS0//RrRNNFolGnMAPODjpQyEM7HRgsAQ1ES1H7iT816OUuTNT40p0NMiQwcz66C9SNgdIvGkwi8BGgr7VHokuEAlpdGT5wMu4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 13:33:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 13:33:35 +0000
Message-ID: <399f07da-317a-44ec-b91c-ca78d9d94165@amd.com>
Date: Thu, 25 Apr 2024 15:33:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/18] TTM interface for managing VRAM oversubscription
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Friedrich Vock <friedrich.vock@gmx.de>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Joshua Ashton
 <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
 <CAAxE2A6u1sf=dzhLcp3W6Pb=pve9RP3UpEsAYfqMuyk0Mc053A@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAAxE2A6u1sf=dzhLcp3W6Pb=pve9RP3UpEsAYfqMuyk0Mc053A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL1PR12MB5849:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cec8bea-f64d-4db2-bfba-08dc652c4ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTZ1YUtWL3ZxamZqc1hyUFY5NXAxZDM3TVluMzUwNkhRbUNIZXgzZTBTOU5E?=
 =?utf-8?B?cUp2QU8xTEdBdzhOWmJJOHd0MWgxVnV0WitTd010aUxrSTZCL29MOEdTMDBE?=
 =?utf-8?B?UVJ5Q0hGLzRQSS9ZdWpJRVFkZjMwZG5lT3FaN1QvcGpMcG1QSFZSdzhySCtp?=
 =?utf-8?B?V3VHVHBrOGNOSENjdDdHWVRHdVJ4Q25ENlhHUWVzQlRlUFg1eDljbStUZWN4?=
 =?utf-8?B?eUwwc0tXeVEyK2dTbWRJWlBSNHZnT09YYWpYRjlRNWVtR1dERXQrTjI0SFRE?=
 =?utf-8?B?Ym03S3dkNWJYT0FFY2xBbWlXdWJHVmIwdEN5TTltanNjRUlxL1NPSk5aYldQ?=
 =?utf-8?B?RUJHQ2QzY3c4TTJCUWwwQ252c3FIWXRNVjRBZDZxSzRFK0FIcEtFcUIvL2tZ?=
 =?utf-8?B?aDF4MkU4RUlPN1hKNUdISFcvVklJd2x6Yk85RGVCNjJGVHFNb1puYVN3cnBN?=
 =?utf-8?B?V29rV0ZtWUpIMUlra1dyZkJ5SGFJMnhmZzI0aGVFYTRwem8rbjdQYjhEcXYz?=
 =?utf-8?B?NmJHR1VvMXdBS0hydFp4czNyL0pUTlhpR0puVGVBYmpFQk82cTVGditGeWtI?=
 =?utf-8?B?TkJ1b2grMFJwWXIwbmVGd1dsSGV0SklzKzc0TFhkWjhrSFRsRXQrclAzRFR3?=
 =?utf-8?B?UVRRWjdkdEdwR2pBdndxT3ZLM296S1ZlVGZzVUY4Mko1NURZTWgwS0VzdzdF?=
 =?utf-8?B?Mmdtcmtndk1STWRuM0trSGJNSEpWNEI4QjA5L1dDODZvU2ZIcTE5S0FPT3Ur?=
 =?utf-8?B?SXgwQjhwUjZ1WVBXckU2aExFVHB5Q2ltNkc3VUxEcllQSTMzTkREWWhNc01k?=
 =?utf-8?B?blZZY2lFdFpackE3T3hZTVhtenBMS0taeTduemd3MjJMTWtaSTZSdjNMMnRJ?=
 =?utf-8?B?Qm91ZHVObHVPN1JKR0ZrK3dXanNRTjFuSXRlK2ZBV2Z5RVZmQnJEMHl5ai9U?=
 =?utf-8?B?cklYaVRLdnpzTnAyNjA1clF6d1h5L1J2clpqZ3J0Z3o5aW8zdkZlaFdaSkpn?=
 =?utf-8?B?dlVuaXZaRzBVZG80T3gvZ1Mrc2hhU2lMUERiVG1aaVcwMWhoek85d0cydTF3?=
 =?utf-8?B?cWpwNnR5bnR1Q0tRM2I5MG53a05NV09KOVl5YXBXNmxLa0xFSHNzSnFUT2dk?=
 =?utf-8?B?UVhwTlhoVzdMMDB6WGE3V080UytCWGg0anNrOENURFQ4cTVncXJuUHBBdisw?=
 =?utf-8?B?MUVRdDNkTXp3WWMvTExWOWozZzNxN0lSUTl6QVVhcEdYWE43NkR1TEZteHY4?=
 =?utf-8?B?MUIrQjdSTXFtOXdqT0pOTHp4YlYxQ1dmVG5nZ2JRUVlldHZVdFQ2SkhqU1ly?=
 =?utf-8?B?ZTUyZWh6NnFUcTJGbDAwV0F1QTBiWXVEY3pMTWkwVzN5cXA3MGJ0RlNXTEk3?=
 =?utf-8?B?eUgrNXZONVNXMmNoRDU5ck43bjRZMHovVTRmQTJVVC8yOEFOdDlyYXlzakNH?=
 =?utf-8?B?ajMyMGtIVmh4dXVVTlhZY3FyV0lDUlBkSVc5cGtlVWl0S0pZRHdERG5hUE5W?=
 =?utf-8?B?YzhoUWE2R0RDZFdXM1ZvYWdHV2hOeGtOanhhR25OYTh1QWFHVjZST1BwaWta?=
 =?utf-8?B?TGhmcHZCdTFJOVJOelJMampSNEVhSWZaZStvdjZIU2VUelIzVkYweCtqUDZy?=
 =?utf-8?Q?p+aS0ldQZij7gY6itOzRfELMY1Njg2dytv/yrkem/mrI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0VlWE5YUEJrVGsxSk1BaTJhNWhtaWNTWURKbzBjT2lsaURxUGJlM1FpeGx4?=
 =?utf-8?B?SFRtQmJnays2L1pWL2k5Yy96eUxOWnVkMG8wZmczN1hSa2RaN1RKZzFNL3Fh?=
 =?utf-8?B?YnIrZlk1dWlNR0JNazA1djhabUpGZnZ0NmZBdjdLdzZka3ZJYVA2dUU3K09G?=
 =?utf-8?B?clVDT1p4blZuRFZvbUpvWXBnMy9zMGt3NkEyTkdGR0I4Y1ZINFVRUEQwdG41?=
 =?utf-8?B?N1BqK3UvZENBTngwM05BVVREYXlIZ1BsU3poR21vWlkzTXNBc3YrbDB2WmlK?=
 =?utf-8?B?VWttWVZDSC9CUmFNWjJPQm01eFRsYU9IRFRucmgvYXk4a096ZWt3RlRkandn?=
 =?utf-8?B?UWNBZnY5WDFDR2pmM2tNVGwrODNFZzJCTDZqajRGM0ZKZ2ZQRndXRldaVFZr?=
 =?utf-8?B?aTBXbTNySGpmOXRXblBrUnVVZFpmR0VZZGhiWFArWEh6NGtMOHpINVpFbkdH?=
 =?utf-8?B?SU4zMERGMUoyZUtJam41TUwzYXVEV0VJVnRVcjkzREZHSmZhb2ZrUGsxMi9G?=
 =?utf-8?B?NUxzbUxBM0hmU1RDcDZDOUo5Y21WbjRuSW1hZWgyaExabG8zNUtYQ3NTNmpW?=
 =?utf-8?B?eHEvUmFKNlM3NUFXdnhYRlpUaGI4OGFRT0pFcUlGaWp4MHZNSlp5K0N0VDBY?=
 =?utf-8?B?M0RLSjEvdUJWdjZIOXJTQUFYNWNYZGpDWHZ2azEyRTVhanpmZFhkRk1rSnBz?=
 =?utf-8?B?bTlaOElEOXdLWmxsdHVxdWhGalZmZVFaUDNURTY5bnFTeFB0WTh0YUFmV0V0?=
 =?utf-8?B?UHlZaUZlRzlUZ2ZSbzFUSHZNSHpkdmFRYzlpSkJ4TGFuR2lxRWVMNnRKdUdK?=
 =?utf-8?B?RmV4M1d3dTh2RXRNNTR2ZUxiY0F1dXpZd2xkelNZOWQ2d0hPbERQcCs4K2Q0?=
 =?utf-8?B?K0dKZlpPZE1FQW1SZjhrT1MxTldrT09hbS9oMkZWazVEblF6L2MrZjBjSVM5?=
 =?utf-8?B?d3pucytER1RPU29lc3E5WDFsaEF0a1d4b1JwS0NOMGtnZ2FoUmdocG9VSGEr?=
 =?utf-8?B?cWtWbDdiaTEvTTgxUTlnMUF3Y1RGK3RrbjR2NnRhbDcrTUtQZ3NpTHJmNkJz?=
 =?utf-8?B?b2FiNHpGbUZzdzRxc1JTS0N2ZDVmODRGUlZ3L1J3ZGdDekRQRWhHbWNUTng4?=
 =?utf-8?B?WjRrd0xKQmhxWG5HbHM2Z1YrTTJRTkliV21ieTRtRXd1SVVxaDBWWVVSekpa?=
 =?utf-8?B?RThtRTNFTG9RMTI4WEplcjBqQ1R2d2NnL0NuTTJSbkNzNmh1MGs2QWZyUmNz?=
 =?utf-8?B?UUIwS2I4ZjZlTElWNFRvWjA1eTZLSWYxamxqbzUvaTZvV0xDdlVwOEYrSTVi?=
 =?utf-8?B?bTJ5b0dIMTlyR2hManlLUUExS3hMbjcxaVU5VHZuSm0zdzFlQXlNVDEvOEJH?=
 =?utf-8?B?SUY2K3VEendoS0w1eXRHQWZZamQrQjhsQzNsOXpyd2tkZHByTlFQdXFFeW02?=
 =?utf-8?B?bkpoMEtMOFVPdE5NbHRrNHF1bU1CWXlkd0FLci8wMFkxVkw5RTh2TG80Nmpr?=
 =?utf-8?B?U3lZOFFHbWJIY2I4MTN4K2EzYkl2ZGZWWldUdk80dm5sOXhqZVFJcytIcXVP?=
 =?utf-8?B?WjRyajhzUEFjVTUyNVpuY0JrOGF0VFZHbmN0UGRaVnV4b2RWZkxjTnFWblBX?=
 =?utf-8?B?cm5WL1YvWXliTDRaZldIV1RqdzB6N2FyeC9qdFYxWVkwNTNPU1B6T1lvYXpD?=
 =?utf-8?B?NzBCcVdzTkZlZ1FzSjNha28xM2NjUGhiMUlYZld3SXhFYk5KOUM1bWdNUExC?=
 =?utf-8?B?ZUMvSnI2a2oyQ1FWRTZHeUt1b2doUlV6allQTkZ4TGJjSFBONVdvbXVvdnZN?=
 =?utf-8?B?QW9ZU2dvVll0bEVPanFSTTYyKzkzZDVBYUQ3bG1wclltNzJOQWxvZ05zUmI4?=
 =?utf-8?B?dWU1czR4Q295clRBZVhMU2NBMjUzVjd0YkcwTXJsUi8wdXZSdkYwY2orL0Ry?=
 =?utf-8?B?WFp5ZkdpYStydENSS3AvRFNLdGZ6d1QyTVFhazJKM2s4SlJvdlBxcUVYYnIx?=
 =?utf-8?B?VjFvSkduaGFQWVF5bDAwSVIwV0pVVEtuL3laVDIzWnBwb1I0ekgzSEZTSzhP?=
 =?utf-8?B?M1NuVjV2TWdWK1Zsa2k0cDBWMDdwUThFM2lIUUx6U1BwL2RwTWJXNVdYR3Fn?=
 =?utf-8?Q?dgt5OFcizC5zy85b3yQ2+jb6G?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cec8bea-f64d-4db2-bfba-08dc652c4ee2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 13:33:35.7448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJyNAJFXzPQLoqRU0WgjQNPGS6g633nGYY/Yd2K0mR8fDkBbF5BYCvWKjTUNkxOG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5849
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

Yeah, and this patch set here is removing that functionality.

Which is major concern from my side as well.

Instead of removing it my long term plan was to move this into TTM ( the 
recent flags rework is going into that direction), so that both amdgpu 
and radeon can use the same code again *and* we can also apply it on 
VM_ALWAYS_VALID BOs.

Christian.

Am 25.04.24 um 15:22 schrieb Marek Olšák:
> The most extreme ping-ponging is mitigated by throttling buffer moves
> in the kernel, but it only works without VM_ALWAYS_VALID and you can
> set BO priorities in the BO list. A better approach that works with
> VM_ALWAYS_VALID would be nice.
>
> Marek
>
> On Wed, Apr 24, 2024 at 1:12 PM Friedrich Vock <friedrich.vock@gmx.de> wrote:
>> Hi everyone,
>>
>> recently I've been looking into remedies for apps (in particular, newer
>> games) that experience significant performance loss when they start to
>> hit VRAM limits, especially on older or lower-end cards that struggle
>> to fit both desktop apps and all the game data into VRAM at once.
>>
>> The root of the problem lies in the fact that from userspace's POV,
>> buffer eviction is very opaque: Userspace applications/drivers cannot
>> tell how oversubscribed VRAM is, nor do they have fine-grained control
>> over which buffers get evicted.  At the same time, with GPU APIs becoming
>> increasingly lower-level and GPU-driven, only the application itself
>> can know which buffers are used within a particular submission, and
>> how important each buffer is. For this, GPU APIs include interfaces
>> to query oversubscription and specify memory priorities: In Vulkan,
>> oversubscription can be queried through the VK_EXT_memory_budget
>> extension. Different buffers can also be assigned priorities via the
>> VK_EXT_pageable_device_local_memory extension. Modern games, especially
>> D3D12 games via vkd3d-proton, rely on oversubscription being reported and
>> priorities being respected in order to perform their memory management.
>>
>> However, relaying this information to the kernel via the current KMD uAPIs
>> is not possible. On AMDGPU for example, all work submissions include a
>> "bo list" that contains any buffer object that is accessed during the
>> course of the submission. If VRAM is oversubscribed and a buffer in the
>> list was evicted to system memory, that buffer is moved back to VRAM
>> (potentially evicting other unused buffers).
>>
>> Since the usermode driver doesn't know what buffers are used by the
>> application, its only choice is to submit a bo list that contains every
>> buffer the application has allocated. In case of VRAM oversubscription,
>> it is highly likely that some of the application's buffers were evicted,
>> which almost guarantees that some buffers will get moved around. Since
>> the bo list is only known at submit time, this also means the buffers
>> will get moved right before submitting application work, which is the
>> worst possible time to move buffers from a latency perspective. Another
>> consequence of the large bo list is that nearly all memory from other
>> applications will be evicted, too. When different applications (e.g. game
>> and compositor) submit work one after the other, this causes a ping-pong
>> effect where each app's submission evicts the other app's memory,
>> resulting in a large amount of unnecessary moves.
>>
>> This overly aggressive eviction behavior led to RADV adopting a change
>> that effectively allows all VRAM applications to reside in system memory
>> [1].  This worked around the ping-ponging/excessive buffer moving problem,
>> but also meant that any memory evicted to system memory would forever
>> stay there, regardless of how VRAM is used.
>>
>> My proposal aims at providing a middle ground between these extremes.
>> The goals I want to meet are:
>> - Userspace is accurately informed about VRAM oversubscription/how much
>>    VRAM has been evicted
>> - Buffer eviction respects priorities set by userspace - Wasteful
>>    ping-ponging is avoided to the extent possible
>>
>> I have been testing out some prototypes, and came up with this rough
>> sketch of an API:
>>
>> - For each ttm_resource_manager, the amount of evicted memory is tracked
>>    (similarly to how "usage" tracks the memory usage). When memory is
>>    evicted via ttm_bo_evict, the size of the evicted memory is added, when
>>    memory is un-evicted (see below), its size is subtracted. The amount of
>>    evicted memory for e.g. VRAM can be queried by userspace via an ioctl.
>>
>> - Each ttm_resource_manager maintains a list of evicted buffer objects.
>>
>> - ttm_mem_unevict walks the list of evicted bos for a given
>>    ttm_resource_manager and tries moving evicted resources back. When a
>>    buffer is freed, this function is called to immediately restore some
>>    evicted memory.
>>
>> - Each ttm_buffer_object independently tracks the mem_type it wants
>>    to reside in.
>>
>> - ttm_bo_try_unevict is added as a helper function which attempts to
>>    move the buffer to its preferred mem_type. If no space is available
>>    there, it fails with -ENOSPC/-ENOMEM.
>>
>> - Similar to how ttm_bo_evict works, each driver can implement
>>    uneviction_valuable/unevict_flags callbacks to control buffer
>>    un-eviction.
>>
>> This is what patches 1-10 accomplish (together with an amdgpu
>> implementation utilizing the new API).
>>
>> Userspace priorities could then be implemented as follows:
>>
>> - TTM already manages priorities for each buffer object. These priorities
>>    can be updated by userspace via a GEM_OP ioctl to inform the kernel
>>    which buffers should be evicted before others. If an ioctl increases
>>    the priority of a buffer, ttm_bo_try_unevict is called on that buffer to
>>    try and move it back (potentially evicting buffers with a lower
>>    priority)
>>
>> - Buffers should never be evicted by other buffers with equal/lower
>>    priority, but if there is a buffer with lower priority occupying VRAM,
>>    it should be evicted in favor of the higher-priority one. This prevents
>>    ping-ponging between buffers that try evicting each other and is
>>    trivially implementable with an early-exit in ttm_mem_evict_first.
>>
>> This is covered in patches 11-15, with the new features exposed to
>> userspace in patches 16-18.
>>
>> I also have a RADV branch utilizing this API at [2], which I use for
>> testing.
>>
>> This implementation is stil very much WIP, although the D3D12 games I
>> tested already seemed to benefit from it. Nevertheless, are still quite
>> a few TODOs and unresolved questions/problems.
>>
>> Some kernel drivers (e.g i915) already use TTM priorities for
>> kernel-internal purposes. Of course, some of the highest priorities
>> should stay reserved for these purposes (with userspace being able to
>> use the lower priorities).
>>
>> Another problem with priorities is the possibility of apps starving other
>> apps by occupying all of VRAM with high-priority allocations. A possible
>> solution could be include restricting the highest priority/priorities
>> to important apps like compositors.
>>
>> Tying into this problem, only apps that are actively cooperating
>> to reduce memory pressure can benefit from the current memory priority
>> implementation. Eventually the priority system could also be utilized
>> to benefit all applications, for example with the desktop environment
>> boosting the priority of the currently-focused app/its cgroup (to
>> provide the best QoS to the apps the user is actively using). A full
>> implementation of this is probably out-of-scope for this initial proposal,
>> but it's probably a good idea to consider this as a possible future use
>> of the priority API.
>>
>> I'm primarily looking to integrate this into amdgpu to solve the
>> issues I've seen there, but I'm also interested in feedback from
>> other drivers. Is this something you'd be interested in? Do you
>> have any objections/comments/questions about my proposed design?
>>
>> Thanks,
>> Friedrich
>>
>> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6833
>> [2] https://gitlab.freedesktop.org/pixelcluster/mesa/-/tree/spilling
>>
>> Friedrich Vock (18):
>>    drm/ttm: Add tracking for evicted memory
>>    drm/ttm: Add per-BO eviction tracking
>>    drm/ttm: Implement BO eviction tracking
>>    drm/ttm: Add driver funcs for uneviction control
>>    drm/ttm: Add option to evict no BOs in operation
>>    drm/ttm: Add public buffer eviction/uneviction functions
>>    drm/amdgpu: Add TTM uneviction control functions
>>    drm/amdgpu: Don't try moving BOs to preferred domain before submit
>>    drm/amdgpu: Don't mark VRAM as a busy placement for VRAM|GTT resources
>>    drm/amdgpu: Don't add GTT to initial domains after failing to allocate
>>      VRAM
>>    drm/ttm: Bump BO priority count
>>    drm/ttm: Do not evict BOs with higher priority
>>    drm/ttm: Implement ttm_bo_update_priority
>>    drm/ttm: Consider BOs placed in non-favorite locations evicted
>>    drm/amdgpu: Set a default priority for user/kernel BOs
>>    drm/amdgpu: Implement SET_PRIORITY GEM op
>>    drm/amdgpu: Implement EVICTED_VRAM query
>>    drm/amdgpu: Bump minor version
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   2 -
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c     | 191 +---------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h     |   4 -
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |   3 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  25 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    |   3 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  26 ++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |   4 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  50 ++++
>>   drivers/gpu/drm/ttm/ttm_bo.c               | 253 ++++++++++++++++++++-
>>   drivers/gpu/drm/ttm/ttm_bo_util.c          |   3 +
>>   drivers/gpu/drm/ttm/ttm_device.c           |   1 +
>>   drivers/gpu/drm/ttm/ttm_resource.c         |  19 +-
>>   include/drm/ttm/ttm_bo.h                   |  22 ++
>>   include/drm/ttm/ttm_device.h               |  28 +++
>>   include/drm/ttm/ttm_resource.h             |  11 +-
>>   include/uapi/drm/amdgpu_drm.h              |   3 +
>>   17 files changed, 430 insertions(+), 218 deletions(-)
>>
>> --
>> 2.44.0
>>

