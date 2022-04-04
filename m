Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB5E4F14F3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 14:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4926610EF5A;
	Mon,  4 Apr 2022 12:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2064.outbound.protection.outlook.com [40.107.101.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8604210EEEC;
 Mon,  4 Apr 2022 12:34:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fjsmazqni51XNCfUzqNQ8vvbtuJY8J3IeMU2llSCtOfH9PAwmHYQGvwLPLuLXOMXYEp2fgGjkOYgTw7n/HXBAfqBEMPHCGGuvy9jJbxWxwlot4Q+Ou4frePfiemNvwyhLHLJu7OZX5RKcmlASvdo/1PjO+dk5LDKOiKlXsnjSJqCQh/aYMW5JRz3wtRMQeZ4GymIsfWq3TMnqdz+3/B3s204FpO48O4pFSyU+bd3VkZgh96Eoesj5Mv0dBBddjho44sFLiUlWZQIyMRBBsTdd4OQJ0/Hlh2cpQBkTatEuW7o76G7lvs9Yk9EiQ6rE3M4vvXbBMb+IJps11zmqgTdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLI5y0UnfwjRiXKvYB4uONMF7j5zjm9gVD+IsFDmnGo=;
 b=D6pdZC/wrnBEds54ttUEgSaZnI2LfvCp2UeW2jBnUWl0Ud46ii9Abw0cRAE1TrCZDp0NQUNhsZX45Y+rUhL3KLbD3FpmU3jVuG4VyZUAXkHfNV1CpeoUFHZ43R6E9r4PSOWl2obUC/Xvd8/QqmCXzOEV1xEv5Px8QM11SEkn4CyHpHZnP+6jv3spTTGJ+fYepRLDBIkJ098nqbqLvRoABCnGZ7R9rdXQP73bS85JsmP/tRi4f+6hUxxOtnHA5dUrsujhwlTGxMi+XTPDmSZ+O3p4b3EcfPOBDsLy6sGVY9g4zl/9mECq3RdeBZzDSog3xRdJSXpsi6vfnoE3hV5+DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLI5y0UnfwjRiXKvYB4uONMF7j5zjm9gVD+IsFDmnGo=;
 b=uoem7QpASWDSEaLWqy96siONCsRq9IHuFoShHw07EylvY300uS7uI80J8nIuNXiHsYdjvilYsTaAcYpyeAfugBGqO4BWjJ0FNZpxgXoJDQ6Z5NAo9Rdb8iPf9D24cTQaz/RJcSo9rGKtBC8o8jwikXloEo1utMi4mBsM2KTwWWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW2PR12MB2380.namprd12.prod.outlook.com (2603:10b6:907:4::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Mon, 4 Apr
 2022 12:34:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 12:34:34 +0000
Message-ID: <5cd17edb-cf60-cc6e-acd3-6a5cadc038e6@amd.com>
Date: Mon, 4 Apr 2022 14:34:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/radeon: change si_default_state table from global to
 static
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, alexander.deucher@amd.com, Xinhui.Pan@amd.com, 
 airlied@linux.ie, daniel@ffwll.ch
References: <20220402162750.2805433-1-trix@redhat.com>
 <9e407616-47b5-ad16-bd16-cde23684fc69@amd.com>
 <12b2fd82-174a-6f05-0de6-02b6f0d2a1d6@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <12b2fd82-174a-6f05-0de6-02b6f0d2a1d6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26fe9ada-0328-4639-9ce4-08da1637791d
X-MS-TrafficTypeDiagnostic: MW2PR12MB2380:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2380135237C77F5B4B80EA4583E59@MW2PR12MB2380.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qqL20jlz3zwtB6gYi/V+1k5ajZcv3LRUuQZJOghL94zKlxRVo9lF92qExL/8fMac+pHsuGpkZ9ubZmOGXSlqXkEafohPWnm0ib2T3FvSuFseeC8TIO4Qm0m6fiyX8KVxxpUyk5+rg10X85gN9TR1Rpv6tpEeFBV3qpzi82oRAGyE+eAANXR7M0Hnedxb7tGA5ZI/A4HdwyVRlPBHEW1p3Y0yszMeSR29YPeL46NHW1SD7yRgtPHEaCWzlEw7GmLAF3CD5iGgjfigZlNLlH2JD9r01I/SFuSZSi8/wEo4rVWK2RMP3rKvx4OkHPlYfQ63zYH+FKDuTGQPrTT5Mkeahi9+tg6icRIAYDOOAWp8apBPC+m1CWHbr3h2KQMT23FfdMSumnjVtnN5ZLv0N/UtapvmwwjcOD36Z23aMsM1/7+mJ6WZ1cqOxJ8LaLt6hazNoTw+dCjn5mgv3l5L9vq6xTrB6VQcXF44l5P+kmWVcqN/ZD45XbLQkeO+NRdHY6FlsubSyY/CDeCrfyqoU4zeczfHafZu98lp+yLoUAaSVKvCPtgnNl6JoVNxI17XOq82xKDKRE3oa7zHv/0ZDxv8r/56VgtEZ7HfDIOVZaia+tlDpkp98JXd5T24v0M5n/Nbb8zNwdvyf50Im+67BZ+5AMyyVe6/kD5Mk3LyCucNEaaU6viayc6LPWa+BR/rdBlhEUsXpNWm4lqzYtdGGtdNWcjUEuaMmKzMCpUTZ/rDelU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(186003)(316002)(86362001)(66574015)(2616005)(31696002)(83380400001)(5660300002)(508600001)(36756003)(30864003)(6506007)(6666004)(53546011)(31686004)(8936002)(2906002)(26005)(6486002)(66476007)(8676002)(66556008)(38100700002)(4326008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTZBTk1TMGRQVjN3MGUxT2dwblJ1ZzFXNmtSQWpXa2RrT0hPU09GMTI1eDV0?=
 =?utf-8?B?QjNxS0RKaThleXlpQnQ4VTRkU1NDZDBkM3VHY2JvL3FnRDNvWEdMMmJ2QlZx?=
 =?utf-8?B?U3gyK214MFNKcTRDc0pSc01zQi8rTTFpK0s5OTA3c0c1bytSa3Y1UGFXZlg0?=
 =?utf-8?B?ZGFSbW1HZG9HbXFXT1NwbnVOVUdOYmRpV2JocEhUUExsMzlGcWtRRlAxMmdm?=
 =?utf-8?B?V2NyaXh2aDNXL0lQLzFvOVFwK2tmRWpoRDJBdkdKUDZyb2RUSjBHYXNzb1pY?=
 =?utf-8?B?cTRJNGJNSmp3YTlGSk01Q0RSQjUwc3cyNmV0Z0lVTkNrQVR2WUhpcGJQOG9U?=
 =?utf-8?B?UGxNYThGUG8xVVpjTGM2MUttRHMzOGpVZVZlS3Q0cTZYQmJJcWNxM2NXeUpP?=
 =?utf-8?B?YndkUkFUMVJ3Wk1JNFhoYUpuSlhDNDRQRk9wNjFiWmpFeDhoRnNoNHEwa3Ix?=
 =?utf-8?B?NUdpbDByMmNTWnNmUEZ3UlNGN0srRm92d2xsaFdrd1kyS2t6WWRleWVMbnZQ?=
 =?utf-8?B?V084S2hrNk5USEhRQ3dhRFBvRFhsaWhwbEZYdkVBNmpXK0hJbzN3TXR1MEMr?=
 =?utf-8?B?dzZndjlBSWxPVW1zaGZmUzBFSis0aVJ4WVBCSGdybkdmemlBcVFsbXZSVTdu?=
 =?utf-8?B?SnRpS21EWkpTdVliK012amNMZkFuL3cyMGtrOVAzRFdWWjlrK1k0U3RPZHhh?=
 =?utf-8?B?dkZOMFZpNS8reUFkT3pveTZOUDNFdGQ2MDdDUldQcGNSWGJkRDEwc0ticlFq?=
 =?utf-8?B?YWhnRkFXblNkUUZxcTBzd1BXV1JqNG9xN3FXWHNMOE1VVkxkYkVieE5iS0I3?=
 =?utf-8?B?SUlyVkQzdEV1VVFvWHZtRnNWbWZ3OEV5c1JBcjdjTEErbFhoNEFMNHA5T1pB?=
 =?utf-8?B?YS9OTEpudUQ0QVFSR0V1NnQwTFk0QlIrMm5BejJBTTMrT3g3LzlseWsyaCtN?=
 =?utf-8?B?cTRZTzBRWjI5MFI5R1cwQVZ4OElWS0NQUHhCb1dUU0YyL2MxZC9QZW1oS1R5?=
 =?utf-8?B?ZHNpQUk0d2dXMVBBYnBEQXlrNXlZSmZuY1pnYVJWL05iVDk0RGhsSEttSk9B?=
 =?utf-8?B?WUwzd2FTT0g3emIwWVVuazlZb2lnSHpyWGg0MFc1UHNoSityczMwRW5IWlBq?=
 =?utf-8?B?VEVHc1FqQW9Ob3ZUQ0VmaUhlZ2RBOVhrN21zWHJ6WXhFVnl2NmhWcHBpbmZ0?=
 =?utf-8?B?U0pwRGY3VWRrNlJneXRjOFVYMGlvK2NTbE5YaVcwQXMvVzZVM3NwL21Jdmsy?=
 =?utf-8?B?a29zZEdRVVNJdXZjakdVL3AxaU45QUp6MVRBeXk0OUdobmwzRENlTk5mVEp3?=
 =?utf-8?B?R21WcWc0N2J4S0Fycmh5VzEwYVVNaGk4UVBhUmFRbE5XODBZOU1QREVnV2pK?=
 =?utf-8?B?Z3JFZnFJRTVXRFJMd3hUbldUQld5WHpJMXBQZmNVRXFxYXRzcDNBZUlFeDFO?=
 =?utf-8?B?bUVFRVlPcEc2bGkzWVNMT0FFelN4c1ZCQnY3NzRaRGhPQmpkL3hUL210UXdH?=
 =?utf-8?B?QjdmTVJTVCs5V1E1RHBxc0RPSlFLV1JlekNxSTlpQjhZTzR2T2dHYXQvRW1y?=
 =?utf-8?B?OUNYaTZqUG41Ukk4dS9UODlUTUFVWHdQWjVWMkp1SkNQRUJUNDFjbDZ0YWNY?=
 =?utf-8?B?MlFxaFVaOSs0L0xlcEcrRDkzVDV6OXBFNnN0aDVUR3FoNlNjbnU5c2E2RDBu?=
 =?utf-8?B?WDhyeWR3Z1hFaGhQejMxSjRjNHY4V2FpM1F5WGY4czBlbEx0b2srUmZyVWtN?=
 =?utf-8?B?dE5rRlR0QjJIU1JBL0lxNldMVitoMk9WSG15Z2k1Z0M0Vm5zWGMzSXJGaXho?=
 =?utf-8?B?NDNXcGYwb2hmSDdBdzczYmZBTDhUOGVWQWdPVmVPZU5wMjRveHRpSGxCdktz?=
 =?utf-8?B?cEVjQ01XVkQrQktBeEhOTEJqUjA2Ky8vZVIwQUhWRldmN2p2ZG5qK1hhVGNv?=
 =?utf-8?B?UlYwdGFuRVVoQm1rYlZTMzE4UzV1Uy9OQXdEcHZGMFVRWGh1M3o3YUNIWXRr?=
 =?utf-8?B?d3RzYkxRTUM1OWYzUUZ6dkdBb01qMXd1RG0yc3JIdzdXV25HbVhFTWZtWXpq?=
 =?utf-8?B?M1VzdFRtbEZ6c2pmZ2JpZWZzdk5MZ21vSVVabXNJY2F1eUcrSVowblprTnB6?=
 =?utf-8?B?L3ZWQWs2c05QUm9Rd0xKUkNFRi9WZXVJblBUQnhqQmZPN2lVT254eVpSMTJP?=
 =?utf-8?B?Nk8vREVhZ0pHc2gzUHlUVXhOdHlvVW55dWZLUnNKTXRCRm45a0pCci9oWmI0?=
 =?utf-8?B?RmgyWE1TS2R4U1JCRFlVcXJ0UG1aVlhRaTNobVpOOTZNVHkzNkhQYjAzbVpH?=
 =?utf-8?B?b0lWeHZwbkR5SUtuMTdNSXcwZGQxTkdLNHhuOGhNYTQrbWpXeWF3dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26fe9ada-0328-4639-9ce4-08da1637791d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 12:34:34.0779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWYy43Vn9TsM6zGvAxwrBaHbqbV/BO+gV1dRe8kn/Tp2qdqt6L3T8dw+tknkNjqn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2380
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.04.22 um 14:32 schrieb Tom Rix:
>
> On 4/3/22 8:23 AM, Christian König wrote:
>> Am 02.04.22 um 18:27 schrieb Tom Rix:
>>> Smatch reports these issues
>>> si_blit_shaders.c:31:11: warning: symbol 'si_default_state'
>>>    was not declared. Should it be static?
>>> si_blit_shaders.c:253:11: warning: symbol 'si_default_size'
>>>    was not declared. Should it be static?
>>>
>>> Both symbols are only used in si.c.  Single file symbols
>>> should be static.  So move the si_default_state and
>>> si_default_size to si.c and change their
>>> storage-class-specifier to static.
>>>
>>> Remove unneeded si_blit_shaders.[c|h]
>>
>> Uff, well NAK.
>>
>> IIRC this was intentionally moved into a separate file because it is 
>> rather large and not related to anything in si.c.
>>
>> It's unlikely that we are ever going to update it, but I would still 
>> rather want to keep it separated.
>>
>> You should rather just include si_blit_shaders.h in si_blit_shaders.c.
>
> Do you mean #include "si_blit_shaders.c" in si.c or similar ?

No, as far as I can see you are getting this warning because of a 
missing previous prototype for the exported array.

This can be avoided if you add si_blit_shaders.h as an include to 
si_blit_shaders.c.

Regards,
Christian.

>
> This could have the same effect of while keeping these separate failes
>
> Tom
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Tom Rix <trix@redhat.com>
>>> ---
>>>   drivers/gpu/drm/radeon/Makefile          |   2 +-
>>>   drivers/gpu/drm/radeon/si.c              | 224 +++++++++++++++++++-
>>>   drivers/gpu/drm/radeon/si_blit_shaders.c | 253 
>>> -----------------------
>>>   drivers/gpu/drm/radeon/si_blit_shaders.h |  32 ---
>>>   4 files changed, 224 insertions(+), 287 deletions(-)
>>>   delete mode 100644 drivers/gpu/drm/radeon/si_blit_shaders.c
>>>   delete mode 100644 drivers/gpu/drm/radeon/si_blit_shaders.h
>>>
>>> diff --git a/drivers/gpu/drm/radeon/Makefile 
>>> b/drivers/gpu/drm/radeon/Makefile
>>> index 11c97edde54d..664381f4eb07 100644
>>> --- a/drivers/gpu/drm/radeon/Makefile
>>> +++ b/drivers/gpu/drm/radeon/Makefile
>>> @@ -44,7 +44,7 @@ radeon-y += radeon_device.o radeon_asic.o 
>>> radeon_kms.o \
>>>       evergreen.o evergreen_cs.o evergreen_blit_shaders.o \
>>>       evergreen_hdmi.o radeon_trace_points.o ni.o 
>>> cayman_blit_shaders.o \
>>>       atombios_encoders.o radeon_semaphore.o radeon_sa.o 
>>> atombios_i2c.o si.o \
>>> -    si_blit_shaders.o radeon_prime.o cik.o cik_blit_shaders.o \
>>> +    radeon_prime.o cik.o cik_blit_shaders.o \
>>>       r600_dpm.o rs780_dpm.o rv6xx_dpm.o rv770_dpm.o rv730_dpm.o 
>>> rv740_dpm.o \
>>>       rv770_smc.o cypress_dpm.o btc_dpm.o sumo_dpm.o sumo_smc.o 
>>> trinity_dpm.o \
>>>       trinity_smc.o ni_dpm.o si_smc.o si_dpm.o kv_smc.o kv_dpm.o 
>>> ci_smc.o \
>>> diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
>>> index 8d5e4b25609d..a4032702e302 100644
>>> --- a/drivers/gpu/drm/radeon/si.c
>>> +++ b/drivers/gpu/drm/radeon/si.c
>>> @@ -38,7 +38,6 @@
>>>   #include "radeon_asic.h"
>>>   #include "radeon_audio.h"
>>>   #include "radeon_ucode.h"
>>> -#include "si_blit_shaders.h"
>>>   #include "si.h"
>>>   #include "sid.h"
>>>   @@ -3553,6 +3552,229 @@ static int si_cp_load_microcode(struct 
>>> radeon_device *rdev)
>>>       return 0;
>>>   }
>>>   +static const u32 si_default_state[] = {
>>> +    0xc0066900,
>>> +    0x00000000,
>>> +    0x00000060, /* DB_RENDER_CONTROL */
>>> +    0x00000000, /* DB_COUNT_CONTROL */
>>> +    0x00000000, /* DB_DEPTH_VIEW */
>>> +    0x0000002a, /* DB_RENDER_OVERRIDE */
>>> +    0x00000000, /* DB_RENDER_OVERRIDE2 */
>>> +    0x00000000, /* DB_HTILE_DATA_BASE */
>>> +
>>> +    0xc0046900,
>>> +    0x00000008,
>>> +    0x00000000, /* DB_DEPTH_BOUNDS_MIN */
>>> +    0x00000000, /* DB_DEPTH_BOUNDS_MAX */
>>> +    0x00000000, /* DB_STENCIL_CLEAR */
>>> +    0x00000000, /* DB_DEPTH_CLEAR */
>>> +
>>> +    0xc0036900,
>>> +    0x0000000f,
>>> +    0x00000000, /* DB_DEPTH_INFO */
>>> +    0x00000000, /* DB_Z_INFO */
>>> +    0x00000000, /* DB_STENCIL_INFO */
>>> +
>>> +    0xc0016900,
>>> +    0x00000080,
>>> +    0x00000000, /* PA_SC_WINDOW_OFFSET */
>>> +
>>> +    0xc00d6900,
>>> +    0x00000083,
>>> +    0x0000ffff, /* PA_SC_CLIPRECT_RULE */
>>> +    0x00000000, /* PA_SC_CLIPRECT_0_TL */
>>> +    0x20002000, /* PA_SC_CLIPRECT_0_BR */
>>> +    0x00000000,
>>> +    0x20002000,
>>> +    0x00000000,
>>> +    0x20002000,
>>> +    0x00000000,
>>> +    0x20002000,
>>> +    0xaaaaaaaa, /* PA_SC_EDGERULE */
>>> +    0x00000000, /* PA_SU_HARDWARE_SCREEN_OFFSET */
>>> +    0x0000000f, /* CB_TARGET_MASK */
>>> +    0x0000000f, /* CB_SHADER_MASK */
>>> +
>>> +    0xc0226900,
>>> +    0x00000094,
>>> +    0x80000000, /* PA_SC_VPORT_SCISSOR_0_TL */
>>> +    0x20002000, /* PA_SC_VPORT_SCISSOR_0_BR */
>>> +    0x80000000,
>>> +    0x20002000,
>>> +    0x80000000,
>>> +    0x20002000,
>>> +    0x80000000,
>>> +    0x20002000,
>>> +    0x80000000,
>>> +    0x20002000,
>>> +    0x80000000,
>>> +    0x20002000,
>>> +    0x80000000,
>>> +    0x20002000,
>>> +    0x80000000,
>>> +    0x20002000,
>>> +    0x80000000,
>>> +    0x20002000,
>>> +    0x80000000,
>>> +    0x20002000,
>>> +    0x80000000,
>>> +    0x20002000,
>>> +    0x80000000,
>>> +    0x20002000,
>>> +    0x80000000,
>>> +    0x20002000,
>>> +    0x80000000,
>>> +    0x20002000,
>>> +    0x80000000,
>>> +    0x20002000,
>>> +    0x80000000,
>>> +    0x20002000,
>>> +    0x00000000, /* PA_SC_VPORT_ZMIN_0 */
>>> +    0x3f800000, /* PA_SC_VPORT_ZMAX_0 */
>>> +
>>> +    0xc0026900,
>>> +    0x000000d9,
>>> +    0x00000000, /* CP_RINGID */
>>> +    0x00000000, /* CP_VMID */
>>> +
>>> +    0xc0046900,
>>> +    0x00000100,
>>> +    0xffffffff, /* VGT_MAX_VTX_INDX */
>>> +    0x00000000, /* VGT_MIN_VTX_INDX */
>>> +    0x00000000, /* VGT_INDX_OFFSET */
>>> +    0x00000000, /* VGT_MULTI_PRIM_IB_RESET_INDX */
>>> +
>>> +    0xc0046900,
>>> +    0x00000105,
>>> +    0x00000000, /* CB_BLEND_RED */
>>> +    0x00000000, /* CB_BLEND_GREEN */
>>> +    0x00000000, /* CB_BLEND_BLUE */
>>> +    0x00000000, /* CB_BLEND_ALPHA */
>>> +
>>> +    0xc0016900,
>>> +    0x000001e0,
>>> +    0x00000000, /* CB_BLEND0_CONTROL */
>>> +
>>> +    0xc00e6900,
>>> +    0x00000200,
>>> +    0x00000000, /* DB_DEPTH_CONTROL */
>>> +    0x00000000, /* DB_EQAA */
>>> +    0x00cc0010, /* CB_COLOR_CONTROL */
>>> +    0x00000210, /* DB_SHADER_CONTROL */
>>> +    0x00010000, /* PA_CL_CLIP_CNTL */
>>> +    0x00000004, /* PA_SU_SC_MODE_CNTL */
>>> +    0x00000100, /* PA_CL_VTE_CNTL */
>>> +    0x00000000, /* PA_CL_VS_OUT_CNTL */
>>> +    0x00000000, /* PA_CL_NANINF_CNTL */
>>> +    0x00000000, /* PA_SU_LINE_STIPPLE_CNTL */
>>> +    0x00000000, /* PA_SU_LINE_STIPPLE_SCALE */
>>> +    0x00000000, /* PA_SU_PRIM_FILTER_CNTL */
>>> +    0x00000000, /*  */
>>> +    0x00000000, /*  */
>>> +
>>> +    0xc0116900,
>>> +    0x00000280,
>>> +    0x00000000, /* PA_SU_POINT_SIZE */
>>> +    0x00000000, /* PA_SU_POINT_MINMAX */
>>> +    0x00000008, /* PA_SU_LINE_CNTL */
>>> +    0x00000000, /* PA_SC_LINE_STIPPLE */
>>> +    0x00000000, /* VGT_OUTPUT_PATH_CNTL */
>>> +    0x00000000, /* VGT_HOS_CNTL */
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000, /* VGT_GS_MODE */
>>> +
>>> +    0xc0026900,
>>> +    0x00000292,
>>> +    0x00000000, /* PA_SC_MODE_CNTL_0 */
>>> +    0x00000000, /* PA_SC_MODE_CNTL_1 */
>>> +
>>> +    0xc0016900,
>>> +    0x000002a1,
>>> +    0x00000000, /* VGT_PRIMITIVEID_EN */
>>> +
>>> +    0xc0016900,
>>> +    0x000002a5,
>>> +    0x00000000, /* VGT_MULTI_PRIM_IB_RESET_EN */
>>> +
>>> +    0xc0026900,
>>> +    0x000002a8,
>>> +    0x00000000, /* VGT_INSTANCE_STEP_RATE_0 */
>>> +    0x00000000,
>>> +
>>> +    0xc0026900,
>>> +    0x000002ad,
>>> +    0x00000000, /* VGT_REUSE_OFF */
>>> +    0x00000000,
>>> +
>>> +    0xc0016900,
>>> +    0x000002d5,
>>> +    0x00000000, /* VGT_SHADER_STAGES_EN */
>>> +
>>> +    0xc0016900,
>>> +    0x000002dc,
>>> +    0x0000aa00, /* DB_ALPHA_TO_MASK */
>>> +
>>> +    0xc0066900,
>>> +    0x000002de,
>>> +    0x00000000, /* PA_SU_POLY_OFFSET_DB_FMT_CNTL */
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +
>>> +    0xc0026900,
>>> +    0x000002e5,
>>> +    0x00000000, /* VGT_STRMOUT_CONFIG */
>>> +    0x00000000,
>>> +
>>> +    0xc01b6900,
>>> +    0x000002f5,
>>> +    0x76543210, /* PA_SC_CENTROID_PRIORITY_0 */
>>> +    0xfedcba98, /* PA_SC_CENTROID_PRIORITY_1 */
>>> +    0x00000000, /* PA_SC_LINE_CNTL */
>>> +    0x00000000, /* PA_SC_AA_CONFIG */
>>> +    0x00000005, /* PA_SU_VTX_CNTL */
>>> +    0x3f800000, /* PA_CL_GB_VERT_CLIP_ADJ */
>>> +    0x3f800000, /* PA_CL_GB_VERT_DISC_ADJ */
>>> +    0x3f800000, /* PA_CL_GB_HORZ_CLIP_ADJ */
>>> +    0x3f800000, /* PA_CL_GB_HORZ_DISC_ADJ */
>>> +    0x00000000, /* PA_SC_AA_SAMPLE_LOCS_PIXEL_X0Y0_0 */
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0x00000000,
>>> +    0xffffffff, /* PA_SC_AA_MASK_X0Y0_X1Y0 */
>>> +    0xffffffff,
>>> +
>>> +    0xc0026900,
>>> +    0x00000316,
>>> +    0x0000000e, /* VGT_VERTEX_REUSE_BLOCK_CNTL */
>>> +    0x00000010, /*  */
>>> +};
>>> +
>>> +static const u32 si_default_size = ARRAY_SIZE(si_default_state);
>>> +
>>>   static int si_cp_start(struct radeon_device *rdev)
>>>   {
>>>       struct radeon_ring *ring = 
>>> &rdev->ring[RADEON_RING_TYPE_GFX_INDEX];
>>> diff --git a/drivers/gpu/drm/radeon/si_blit_shaders.c 
>>> b/drivers/gpu/drm/radeon/si_blit_shaders.c
>>> deleted file mode 100644
>>> index ec415e7dfa4b..000000000000
>>> --- a/drivers/gpu/drm/radeon/si_blit_shaders.c
>>> +++ /dev/null
>>> @@ -1,253 +0,0 @@
>>> -/*
>>> - * Copyright 2011 Advanced Micro Devices, Inc.
>>> - *
>>> - * Permission is hereby granted, free of charge, to any person 
>>> obtaining a
>>> - * copy of this software and associated documentation files (the 
>>> "Software"),
>>> - * to deal in the Software without restriction, including without 
>>> limitation
>>> - * the rights to use, copy, modify, merge, publish, distribute, 
>>> sublicense,
>>> - * and/or sell copies of the Software, and to permit persons to 
>>> whom the
>>> - * Software is furnished to do so, subject to the following 
>>> conditions:
>>> - *
>>> - * The above copyright notice and this permission notice (including 
>>> the next
>>> - * paragraph) shall be included in all copies or substantial 
>>> portions of the
>>> - * Software.
>>> - *
>>> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>>> EXPRESS OR
>>> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>>> MERCHANTABILITY,
>>> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO 
>>> EVENT SHALL
>>> - * THE COPYRIGHT HOLDER(S) AND/OR ITS SUPPLIERS BE LIABLE FOR ANY 
>>> CLAIM, DAMAGES OR
>>> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
>>> OTHERWISE,
>>> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE 
>>> USE OR OTHER
>>> - * DEALINGS IN THE SOFTWARE.
>>> - *
>>> - * Authors:
>>> - *     Alex Deucher <alexander.deucher@amd.com>
>>> - */
>>> -
>>> -#include <linux/types.h>
>>> -#include <linux/bug.h>
>>> -#include <linux/kernel.h>
>>> -
>>> -const u32 si_default_state[] =
>>> -{
>>> -    0xc0066900,
>>> -    0x00000000,
>>> -    0x00000060, /* DB_RENDER_CONTROL */
>>> -    0x00000000, /* DB_COUNT_CONTROL */
>>> -    0x00000000, /* DB_DEPTH_VIEW */
>>> -    0x0000002a, /* DB_RENDER_OVERRIDE */
>>> -    0x00000000, /* DB_RENDER_OVERRIDE2 */
>>> -    0x00000000, /* DB_HTILE_DATA_BASE */
>>> -
>>> -    0xc0046900,
>>> -    0x00000008,
>>> -    0x00000000, /* DB_DEPTH_BOUNDS_MIN */
>>> -    0x00000000, /* DB_DEPTH_BOUNDS_MAX */
>>> -    0x00000000, /* DB_STENCIL_CLEAR */
>>> -    0x00000000, /* DB_DEPTH_CLEAR */
>>> -
>>> -    0xc0036900,
>>> -    0x0000000f,
>>> -    0x00000000, /* DB_DEPTH_INFO */
>>> -    0x00000000, /* DB_Z_INFO */
>>> -    0x00000000, /* DB_STENCIL_INFO */
>>> -
>>> -    0xc0016900,
>>> -    0x00000080,
>>> -    0x00000000, /* PA_SC_WINDOW_OFFSET */
>>> -
>>> -    0xc00d6900,
>>> -    0x00000083,
>>> -    0x0000ffff, /* PA_SC_CLIPRECT_RULE */
>>> -    0x00000000, /* PA_SC_CLIPRECT_0_TL */
>>> -    0x20002000, /* PA_SC_CLIPRECT_0_BR */
>>> -    0x00000000,
>>> -    0x20002000,
>>> -    0x00000000,
>>> -    0x20002000,
>>> -    0x00000000,
>>> -    0x20002000,
>>> -    0xaaaaaaaa, /* PA_SC_EDGERULE */
>>> -    0x00000000, /* PA_SU_HARDWARE_SCREEN_OFFSET */
>>> -    0x0000000f, /* CB_TARGET_MASK */
>>> -    0x0000000f, /* CB_SHADER_MASK */
>>> -
>>> -    0xc0226900,
>>> -    0x00000094,
>>> -    0x80000000, /* PA_SC_VPORT_SCISSOR_0_TL */
>>> -    0x20002000, /* PA_SC_VPORT_SCISSOR_0_BR */
>>> -    0x80000000,
>>> -    0x20002000,
>>> -    0x80000000,
>>> -    0x20002000,
>>> -    0x80000000,
>>> -    0x20002000,
>>> -    0x80000000,
>>> -    0x20002000,
>>> -    0x80000000,
>>> -    0x20002000,
>>> -    0x80000000,
>>> -    0x20002000,
>>> -    0x80000000,
>>> -    0x20002000,
>>> -    0x80000000,
>>> -    0x20002000,
>>> -    0x80000000,
>>> -    0x20002000,
>>> -    0x80000000,
>>> -    0x20002000,
>>> -    0x80000000,
>>> -    0x20002000,
>>> -    0x80000000,
>>> -    0x20002000,
>>> -    0x80000000,
>>> -    0x20002000,
>>> -    0x80000000,
>>> -    0x20002000,
>>> -    0x80000000,
>>> -    0x20002000,
>>> -    0x00000000, /* PA_SC_VPORT_ZMIN_0 */
>>> -    0x3f800000, /* PA_SC_VPORT_ZMAX_0 */
>>> -
>>> -    0xc0026900,
>>> -    0x000000d9,
>>> -    0x00000000, /* CP_RINGID */
>>> -    0x00000000, /* CP_VMID */
>>> -
>>> -    0xc0046900,
>>> -    0x00000100,
>>> -    0xffffffff, /* VGT_MAX_VTX_INDX */
>>> -    0x00000000, /* VGT_MIN_VTX_INDX */
>>> -    0x00000000, /* VGT_INDX_OFFSET */
>>> -    0x00000000, /* VGT_MULTI_PRIM_IB_RESET_INDX */
>>> -
>>> -    0xc0046900,
>>> -    0x00000105,
>>> -    0x00000000, /* CB_BLEND_RED */
>>> -    0x00000000, /* CB_BLEND_GREEN */
>>> -    0x00000000, /* CB_BLEND_BLUE */
>>> -    0x00000000, /* CB_BLEND_ALPHA */
>>> -
>>> -    0xc0016900,
>>> -    0x000001e0,
>>> -    0x00000000, /* CB_BLEND0_CONTROL */
>>> -
>>> -    0xc00e6900,
>>> -    0x00000200,
>>> -    0x00000000, /* DB_DEPTH_CONTROL */
>>> -    0x00000000, /* DB_EQAA */
>>> -    0x00cc0010, /* CB_COLOR_CONTROL */
>>> -    0x00000210, /* DB_SHADER_CONTROL */
>>> -    0x00010000, /* PA_CL_CLIP_CNTL */
>>> -    0x00000004, /* PA_SU_SC_MODE_CNTL */
>>> -    0x00000100, /* PA_CL_VTE_CNTL */
>>> -    0x00000000, /* PA_CL_VS_OUT_CNTL */
>>> -    0x00000000, /* PA_CL_NANINF_CNTL */
>>> -    0x00000000, /* PA_SU_LINE_STIPPLE_CNTL */
>>> -    0x00000000, /* PA_SU_LINE_STIPPLE_SCALE */
>>> -    0x00000000, /* PA_SU_PRIM_FILTER_CNTL */
>>> -    0x00000000, /*  */
>>> -    0x00000000, /*  */
>>> -
>>> -    0xc0116900,
>>> -    0x00000280,
>>> -    0x00000000, /* PA_SU_POINT_SIZE */
>>> -    0x00000000, /* PA_SU_POINT_MINMAX */
>>> -    0x00000008, /* PA_SU_LINE_CNTL */
>>> -    0x00000000, /* PA_SC_LINE_STIPPLE */
>>> -    0x00000000, /* VGT_OUTPUT_PATH_CNTL */
>>> -    0x00000000, /* VGT_HOS_CNTL */
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000, /* VGT_GS_MODE */
>>> -
>>> -    0xc0026900,
>>> -    0x00000292,
>>> -    0x00000000, /* PA_SC_MODE_CNTL_0 */
>>> -    0x00000000, /* PA_SC_MODE_CNTL_1 */
>>> -
>>> -    0xc0016900,
>>> -    0x000002a1,
>>> -    0x00000000, /* VGT_PRIMITIVEID_EN */
>>> -
>>> -    0xc0016900,
>>> -    0x000002a5,
>>> -    0x00000000, /* VGT_MULTI_PRIM_IB_RESET_EN */
>>> -
>>> -    0xc0026900,
>>> -    0x000002a8,
>>> -    0x00000000, /* VGT_INSTANCE_STEP_RATE_0 */
>>> -    0x00000000,
>>> -
>>> -    0xc0026900,
>>> -    0x000002ad,
>>> -    0x00000000, /* VGT_REUSE_OFF */
>>> -    0x00000000,
>>> -
>>> -    0xc0016900,
>>> -    0x000002d5,
>>> -    0x00000000, /* VGT_SHADER_STAGES_EN */
>>> -
>>> -    0xc0016900,
>>> -    0x000002dc,
>>> -    0x0000aa00, /* DB_ALPHA_TO_MASK */
>>> -
>>> -    0xc0066900,
>>> -    0x000002de,
>>> -    0x00000000, /* PA_SU_POLY_OFFSET_DB_FMT_CNTL */
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -
>>> -    0xc0026900,
>>> -    0x000002e5,
>>> -    0x00000000, /* VGT_STRMOUT_CONFIG */
>>> -    0x00000000,
>>> -
>>> -    0xc01b6900,
>>> -    0x000002f5,
>>> -    0x76543210, /* PA_SC_CENTROID_PRIORITY_0 */
>>> -    0xfedcba98, /* PA_SC_CENTROID_PRIORITY_1 */
>>> -    0x00000000, /* PA_SC_LINE_CNTL */
>>> -    0x00000000, /* PA_SC_AA_CONFIG */
>>> -    0x00000005, /* PA_SU_VTX_CNTL */
>>> -    0x3f800000, /* PA_CL_GB_VERT_CLIP_ADJ */
>>> -    0x3f800000, /* PA_CL_GB_VERT_DISC_ADJ */
>>> -    0x3f800000, /* PA_CL_GB_HORZ_CLIP_ADJ */
>>> -    0x3f800000, /* PA_CL_GB_HORZ_DISC_ADJ */
>>> -    0x00000000, /* PA_SC_AA_SAMPLE_LOCS_PIXEL_X0Y0_0 */
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0x00000000,
>>> -    0xffffffff, /* PA_SC_AA_MASK_X0Y0_X1Y0 */
>>> -    0xffffffff,
>>> -
>>> -    0xc0026900,
>>> -    0x00000316,
>>> -    0x0000000e, /* VGT_VERTEX_REUSE_BLOCK_CNTL */
>>> -    0x00000010, /*  */
>>> -};
>>> -
>>> -const u32 si_default_size = ARRAY_SIZE(si_default_state);
>>> diff --git a/drivers/gpu/drm/radeon/si_blit_shaders.h 
>>> b/drivers/gpu/drm/radeon/si_blit_shaders.h
>>> deleted file mode 100644
>>> index c739e51e3961..000000000000
>>> --- a/drivers/gpu/drm/radeon/si_blit_shaders.h
>>> +++ /dev/null
>>> @@ -1,32 +0,0 @@
>>> -/*
>>> - * Copyright 2011 Advanced Micro Devices, Inc.
>>> - *
>>> - * Permission is hereby granted, free of charge, to any person 
>>> obtaining a
>>> - * copy of this software and associated documentation files (the 
>>> "Software"),
>>> - * to deal in the Software without restriction, including without 
>>> limitation
>>> - * the rights to use, copy, modify, merge, publish, distribute, 
>>> sublicense,
>>> - * and/or sell copies of the Software, and to permit persons to 
>>> whom the
>>> - * Software is furnished to do so, subject to the following 
>>> conditions:
>>> - *
>>> - * The above copyright notice and this permission notice (including 
>>> the next
>>> - * paragraph) shall be included in all copies or substantial 
>>> portions of the
>>> - * Software.
>>> - *
>>> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>>> EXPRESS OR
>>> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>>> MERCHANTABILITY,
>>> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO 
>>> EVENT SHALL
>>> - * THE COPYRIGHT HOLDER(S) AND/OR ITS SUPPLIERS BE LIABLE FOR ANY 
>>> CLAIM, DAMAGES OR
>>> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
>>> OTHERWISE,
>>> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE 
>>> USE OR OTHER
>>> - * DEALINGS IN THE SOFTWARE.
>>> - *
>>> - */
>>> -
>>> -#ifndef SI_BLIT_SHADERS_H
>>> -#define SI_BLIT_SHADERS_H
>>> -
>>> -extern const u32 si_default_state[];
>>> -
>>> -extern const u32 si_default_size;
>>> -
>>> -#endif
>>
>

