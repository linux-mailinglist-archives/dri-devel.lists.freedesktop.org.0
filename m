Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B72B94F15F9
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 15:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15D210EF12;
	Mon,  4 Apr 2022 13:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442D710EF12;
 Mon,  4 Apr 2022 13:33:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+YFXx12ehvhF/meYEutQ0Yf4Vf5lylTkiRu5SvQKJMgPBefYsYP9v73qrKlCSYHg0zPQw8IW9u5deW0XsH+KR8i5OqoSmulCUZK+67UA27vuiCfTPmnvYKMscGMN4SNcucX+wdsLtBUA6wqRSwaj11hXX0s/SFiFtc7mFf1y2/Nufs8guSMmYJQLCDP6RuYvwife+VFJnv7iQ+LYyWqTOfJNl1qT25sYRprMi7stN+yXN9wDUgJ9OhNC1+1uHKf7Bxu/363X4KrO9SyHLpEWwezGaXTVDmypctK2sJmLycW85WqWkZJFLpXKQbMby7qo6S2W/26N2Z0+bAmzYmSmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPLqSc2a/MPGwe2uJr27KXyDbFY7sv6RU/AqaOUZWV8=;
 b=ZWG+cJ/I3wSYB9LVY+95ROIfXlpTq/g0onACO7T1zxV3s58L4xus8PVx6LdRjzV435ShyaI+RAwQuo4LsUTarIqXHBIR2XQhmEgDm2er7gMHJrJVOg/nR+ndVc2INILP6k/e1cwhnFfzJBXMkbQJg2y2V3zpE6WTm5lHYGK3qGGSRKPao7cZL2GOcOQrb8ico6c03A+DsgRFP9UaVKUoCSU7JjCj4U1NLg+AFmHFRjhb1cOxfNuvQ72iC3vJjA/45L0bEX8p8O2UaTh9tR1sN8rGzEleiYIcqYOuORi4HR5CX7irWyhLV3OSVFxCwhW8RGapLqptsTHGF7ZOBM4c6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPLqSc2a/MPGwe2uJr27KXyDbFY7sv6RU/AqaOUZWV8=;
 b=W/FKLAlsLBAmOtzZ3xVwGkFYg9qg9J+Y10X49zpFXn9ui+4VnEUguhhYIHgyuCtcv77KKgebCAUs1r+WCXS1lijUxcx8+ISSxlObHafuT8xVP/+/sUGDSL/Qr6k4l98kOk2Iuv+nh22K258JgzgVwNQYPcvCKHCWmAdlx6kj3BA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MWHPR12MB1757.namprd12.prod.outlook.com (2603:10b6:300:111::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 13:33:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 13:33:06 +0000
Message-ID: <d56cd099-4bd3-da15-f50e-f3ce835d114a@amd.com>
Date: Mon, 4 Apr 2022 15:32:59 +0200
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
 <5cd17edb-cf60-cc6e-acd3-6a5cadc038e6@amd.com>
 <efb06a31-bc1a-1136-fe75-2d4911fea190@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <efb06a31-bc1a-1136-fe75-2d4911fea190@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0125.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::21) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c23778b9-eacc-4d25-ced0-08da163fa6cd
X-MS-TrafficTypeDiagnostic: MWHPR12MB1757:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB175751ADC0663C582964477983E59@MWHPR12MB1757.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N2GV/72G8xUOS2ldKV0aWMOwT9TXPXfRP5XjXoxQBM2zFxuugGz1YGS11Vdh7WnSwghwFVlZLoUZx9EOe3ltR6YnhqltkYKYUva4/laiftOLO1TF9tLALsYdESpBmK/lNagNNWv5debS3IzcnaQk3t336dMPO+HnlnY0GNXAwAu5/ixJJsDZ4De5UuvE6AK0aGNkR9kcxbiqrY9FuVc++L6DO+fSFh/Ye2hSmDFAPEPJ+J7ADyi54mtShTQq9nIUqukqiIP7qKEO3dFKEuh1lO/ufEudnXF6qJ8rNRlkW9ZVdgJF9teE6rIT1iG6rBkpx+K2CsN/KYTmIE2MetWBc9Xwsl4m0Eiz8UEy9MbJaiSOLJRyMvrlrT6BFXoLS3lvHM3nLR8VP9kwmFUDyZuUDSNX1KTZmF3OGQVJibzmiYxrwQMLxD+hjKIM+1S5ph8MxWnhicLlknkhE/xmJwB09no3V/pCvRiNlIgTRH1KGWm6+Lr7hgwShsv54dYAISt5AwBX9DU4HdKcwDS1BdYwiQCV//i3iVNeU3/IttugVAyw7+Bs0X6w4JCODWGMrMZaNSLTbw4Bj5rOxV/TyIu21inyjeIWS2MOw4cK/dRxqX9tzMdEnGY2dPbGMWsYbxX4I8bwxX8yQtSr8UibulaPUDHpk/4NK8GkW/15kpOepjyHiphYcjil2xNvHni0Jwg+F627GYifVQlrlry0TEt1L1jym8XqmSDv/MWASBEr9g8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(2616005)(5660300002)(8936002)(31696002)(6512007)(66574015)(26005)(186003)(2906002)(30864003)(53546011)(38100700002)(6506007)(86362001)(66556008)(66476007)(31686004)(316002)(66946007)(83380400001)(4326008)(8676002)(36756003)(6486002)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVFEcHExL1BrT0JXMmx6K2NPTXNmS05kTzU0NForb3EreWdGWThSTU9TbVJy?=
 =?utf-8?B?b0VqWURHRzZmb2p3V3E3QjQwZi8rem9QS1RMTDgzQnJHMy91bEFaWTlNNTRs?=
 =?utf-8?B?SFNRT3VRK1lXUytHZ2pYb3FXNTd1NldiejF3NStEMFRRVDliOElYUGpwR0NQ?=
 =?utf-8?B?L1RndnZGK2J5dXdNSERjSU9ZTHVrZFREejFhcWRMQXcydTQvUTh6NVlxRkd6?=
 =?utf-8?B?MEZlZGVjbUNVcEZiVU5LeFZJKy9tNExrQW1NTGNMekVzQnVGc3d3VTYrWDdw?=
 =?utf-8?B?cUtSd3RPcVAvQnN5M0NoSW1iaGVmMUdQMWFEdGpFekg0ZjZxTVd0N25KazZu?=
 =?utf-8?B?blFLLzBMVG5JMTdoU0xlQmI5bjZjOWR2Sy9IcXpCYzJzM2FoUUN1YVBOdytC?=
 =?utf-8?B?K0pHeVplTysyS0U0YjFob1NXMGNUWW16Zlp6bzloVklJYXVOUmFTN3VzTnB6?=
 =?utf-8?B?NUVHUlc4akN4bHVVek85ckM0MjNjZVFPcjBDa2d1T2dRcnpHOFBLMm1TVEFN?=
 =?utf-8?B?WldTcVNjc296Qjk0RWVHU0Y1ZzJXN0IrZWkwTWxhYTRJOEgvankrVGtIUVpV?=
 =?utf-8?B?MzU5N0ZZSnk1cmdoTzFzZ0dMalEwaUVvZUJjV2pkZnFIL3NrQkV1eVBGSElG?=
 =?utf-8?B?Tm5IKzdNUnBDYm9yZnZvcEVZNTVRd2taR2pUb0hyNzlZaHRibG43ZUE0M3k0?=
 =?utf-8?B?TFJ4SXZVMWUxR1loOGowemVSQVoyWkJYbUFRdEZBM3ZDN1JjY0lFVG4vRThy?=
 =?utf-8?B?V0NjcU9kbEpIZFBLdUdDWGtvOWJXM1N6Q3NCZGdyZW52SU9PSmdJRzNCN1dV?=
 =?utf-8?B?VTcrMGdlbzQ5VmhxeS9mU0FqelVPdzBwYlpxTlJ3cHFISGp1azk0OG5qVVho?=
 =?utf-8?B?SG9pR1plS1FySjhiNzBLZEQ4emZUQStsSlhscW5sTDBpWWV5Qm5CcHkramRy?=
 =?utf-8?B?ekJnYkxJT2xQZTBkOUpIdksxczhnUDg5aGJ4a3BVN3kzT2tCRHJrdjNtT2Y4?=
 =?utf-8?B?RkY3cTNZSTlQbGFGQUFmK2Fud0JDWm1HemNaNWc5NkJsSFpWcm4wMWxVZ3g4?=
 =?utf-8?B?YXNsanZuOHlWNUw3RjlMRXFDbDNkY2FjUVNLRDZNUXRMdnhqSHhJZU1hSnVQ?=
 =?utf-8?B?RUJBSnBGemRVd3RzRFhkTkhBcTZhd25SS0NxejhhaGJ0SmYzVmxRVU9oYkZO?=
 =?utf-8?B?eVZsdFlWbDZQZGl0NzVGUy9WSG5JVlNJazNhT2Nia2t0MEVtS09BWnA4UzlT?=
 =?utf-8?B?TGM0ditVby9pQlc2RkVIVW55c1dIWnhnK1hIMitDeUtRYnFzUDNncUg4MGZG?=
 =?utf-8?B?dTlCdjFtTlgyZGN1RERyc01EajhraGx0THdaRVNzTWZDcjJRcDIzUC85aHJ5?=
 =?utf-8?B?UkNzZ1Y4aUFNZytIMXJpbC81MllpVzljRWxXSFAyUXY4SHg0bUhNRHphNVVa?=
 =?utf-8?B?VGlpY2lWcHBIMXdpaDR5VFFsSncvMmtSa0JPQllqRDk2eHZTYUNrekxyeEU2?=
 =?utf-8?B?V1NqWHFBVDJiaUZqVWFROWhPcmpsall5emFXRGZDU04vRzdXYmdGenJIZXlL?=
 =?utf-8?B?czVxazNBaWpsUTE5MWxVdEkxT0k2cnYxSW9iRW9PUnRkZldDWnBiWHRSUnVR?=
 =?utf-8?B?a0JqRmc0dy9OU3VFUnZmWjRpNEVYTEtPVWJ1Y0dJY20xeXNiTjhRcGtEbWZB?=
 =?utf-8?B?bmVhdUlwNkR6Q0lCUVM4Z1NibWNWS3lJZHZ6Wlg2N2pGcTBqYTVEc29lMXJL?=
 =?utf-8?B?VVhxcEFXMFVnR0ZyMzBiRVlxTXZqMHRaTWh4eS9PMElpL2laSmYraVBLN0pi?=
 =?utf-8?B?VnAyYzNHYWp0NUR4TjR6Zk9NZEhHazNtOVhramluSVQ3U2pwOEoxUEw0OHpW?=
 =?utf-8?B?R1R5aGlmOThYaWFsditaRjlCSU5BM1ZRRUMyQU81cVZFc2lhWnA0Y2c4SFUw?=
 =?utf-8?B?eG13bWMrQTdvUllHK01JZUhOV0cza3dWVHV2Umx2bWxaZjVPdW14d25JZ1hx?=
 =?utf-8?B?aTRFVG9uc25RNUpOZEg3SnUyL1ptQkd0UXRkSHRNQmtaWldHM3cyN1diYVMw?=
 =?utf-8?B?a0hJNkFxeVEzNXFZZGtTQ2pENkJhUWx2RVhKTC9LeTlpWmhWd0VlY2lmL1dx?=
 =?utf-8?B?eCt6Y1F3YzFjeGxiWm8vSVAzZ1d2TXNNa3ZlWlhnVXdTaDNDTXBic0RiSEt0?=
 =?utf-8?B?VlZiWXd4VWczM0h4dFdJbjRUTy9laGo5ZWNjZ1dwMC80SXRFYUdETmdGYUtI?=
 =?utf-8?B?MXo3bmF2Z1NHdWUrMmtIUldZMWRjSFdLclRVZ2Z1QVpQdGRpeXBHeWovZ2dG?=
 =?utf-8?B?Q0xsV3FNOWthQy8xSFpSUzc2MTlvd1Z1ZHVZZUNyTUoxSVlwVjFpdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c23778b9-eacc-4d25-ced0-08da163fa6cd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 13:33:06.5790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWx9TS+t4yRkSqulfHb56P4uKulOwtqp11Qd71qF+p9ZNsO11NQ2v1jevBVfk/2B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1757
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

Am 04.04.22 um 15:01 schrieb Tom Rix:
> On 4/4/22 5:34 AM, Christian König wrote:
>> Am 04.04.22 um 14:32 schrieb Tom Rix:
>>> On 4/3/22 8:23 AM, Christian König wrote:
>>>> Am 02.04.22 um 18:27 schrieb Tom Rix:
>>>>> Smatch reports these issues
>>>>> si_blit_shaders.c:31:11: warning: symbol 'si_default_state'
>>>>>    was not declared. Should it be static?
>>>>> si_blit_shaders.c:253:11: warning: symbol 'si_default_size'
>>>>>    was not declared. Should it be static?
>>>>>
>>>>> Both symbols are only used in si.c.  Single file symbols
>>>>> should be static.  So move the si_default_state and
>>>>> si_default_size to si.c and change their
>>>>> storage-class-specifier to static.
>>>>>
>>>>> Remove unneeded si_blit_shaders.[c|h]
>>>>
>>>> Uff, well NAK.
>>>>
>>>> IIRC this was intentionally moved into a separate file because it 
>>>> is rather large and not related to anything in si.c.
>>>>
>>>> It's unlikely that we are ever going to update it, but I would 
>>>> still rather want to keep it separated.
>>>>
>>>> You should rather just include si_blit_shaders.h in si_blit_shaders.c.
>>>
>>> Do you mean #include "si_blit_shaders.c" in si.c or similar ?
>>
>> No, as far as I can see you are getting this warning because of a 
>> missing previous prototype for the exported array.
>>
>> This can be avoided if you add si_blit_shaders.h as an include to 
>> si_blit_shaders.c.
>
> The warning is a symptom.
>
> There are about 5-6 similar big, global tables in radeon/ with similar 
> one file uses.
>
> These global tables should become static.
>
> Moving the table to si_blit_shader.h would keep it separated, adding 
> the 'static' would remove it from the globals.
>
> *.c removed, Makefile updated.

Sound like that would work for me as well. Main concern is to keep that 
in a separate file.

But why do you want to drop it from globals in the first place?

Christian.

>
> Tom
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> This could have the same effect of while keeping these separate failes
>>>
>>> Tom
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Signed-off-by: Tom Rix <trix@redhat.com>
>>>>> ---
>>>>>   drivers/gpu/drm/radeon/Makefile          |   2 +-
>>>>>   drivers/gpu/drm/radeon/si.c              | 224 +++++++++++++++++++-
>>>>>   drivers/gpu/drm/radeon/si_blit_shaders.c | 253 
>>>>> -----------------------
>>>>>   drivers/gpu/drm/radeon/si_blit_shaders.h |  32 ---
>>>>>   4 files changed, 224 insertions(+), 287 deletions(-)
>>>>>   delete mode 100644 drivers/gpu/drm/radeon/si_blit_shaders.c
>>>>>   delete mode 100644 drivers/gpu/drm/radeon/si_blit_shaders.h
>>>>>
>>>>> diff --git a/drivers/gpu/drm/radeon/Makefile 
>>>>> b/drivers/gpu/drm/radeon/Makefile
>>>>> index 11c97edde54d..664381f4eb07 100644
>>>>> --- a/drivers/gpu/drm/radeon/Makefile
>>>>> +++ b/drivers/gpu/drm/radeon/Makefile
>>>>> @@ -44,7 +44,7 @@ radeon-y += radeon_device.o radeon_asic.o 
>>>>> radeon_kms.o \
>>>>>       evergreen.o evergreen_cs.o evergreen_blit_shaders.o \
>>>>>       evergreen_hdmi.o radeon_trace_points.o ni.o 
>>>>> cayman_blit_shaders.o \
>>>>>       atombios_encoders.o radeon_semaphore.o radeon_sa.o 
>>>>> atombios_i2c.o si.o \
>>>>> -    si_blit_shaders.o radeon_prime.o cik.o cik_blit_shaders.o \
>>>>> +    radeon_prime.o cik.o cik_blit_shaders.o \
>>>>>       r600_dpm.o rs780_dpm.o rv6xx_dpm.o rv770_dpm.o rv730_dpm.o 
>>>>> rv740_dpm.o \
>>>>>       rv770_smc.o cypress_dpm.o btc_dpm.o sumo_dpm.o sumo_smc.o 
>>>>> trinity_dpm.o \
>>>>>       trinity_smc.o ni_dpm.o si_smc.o si_dpm.o kv_smc.o kv_dpm.o 
>>>>> ci_smc.o \
>>>>> diff --git a/drivers/gpu/drm/radeon/si.c 
>>>>> b/drivers/gpu/drm/radeon/si.c
>>>>> index 8d5e4b25609d..a4032702e302 100644
>>>>> --- a/drivers/gpu/drm/radeon/si.c
>>>>> +++ b/drivers/gpu/drm/radeon/si.c
>>>>> @@ -38,7 +38,6 @@
>>>>>   #include "radeon_asic.h"
>>>>>   #include "radeon_audio.h"
>>>>>   #include "radeon_ucode.h"
>>>>> -#include "si_blit_shaders.h"
>>>>>   #include "si.h"
>>>>>   #include "sid.h"
>>>>>   @@ -3553,6 +3552,229 @@ static int si_cp_load_microcode(struct 
>>>>> radeon_device *rdev)
>>>>>       return 0;
>>>>>   }
>>>>>   +static const u32 si_default_state[] = {
>>>>> +    0xc0066900,
>>>>> +    0x00000000,
>>>>> +    0x00000060, /* DB_RENDER_CONTROL */
>>>>> +    0x00000000, /* DB_COUNT_CONTROL */
>>>>> +    0x00000000, /* DB_DEPTH_VIEW */
>>>>> +    0x0000002a, /* DB_RENDER_OVERRIDE */
>>>>> +    0x00000000, /* DB_RENDER_OVERRIDE2 */
>>>>> +    0x00000000, /* DB_HTILE_DATA_BASE */
>>>>> +
>>>>> +    0xc0046900,
>>>>> +    0x00000008,
>>>>> +    0x00000000, /* DB_DEPTH_BOUNDS_MIN */
>>>>> +    0x00000000, /* DB_DEPTH_BOUNDS_MAX */
>>>>> +    0x00000000, /* DB_STENCIL_CLEAR */
>>>>> +    0x00000000, /* DB_DEPTH_CLEAR */
>>>>> +
>>>>> +    0xc0036900,
>>>>> +    0x0000000f,
>>>>> +    0x00000000, /* DB_DEPTH_INFO */
>>>>> +    0x00000000, /* DB_Z_INFO */
>>>>> +    0x00000000, /* DB_STENCIL_INFO */
>>>>> +
>>>>> +    0xc0016900,
>>>>> +    0x00000080,
>>>>> +    0x00000000, /* PA_SC_WINDOW_OFFSET */
>>>>> +
>>>>> +    0xc00d6900,
>>>>> +    0x00000083,
>>>>> +    0x0000ffff, /* PA_SC_CLIPRECT_RULE */
>>>>> +    0x00000000, /* PA_SC_CLIPRECT_0_TL */
>>>>> +    0x20002000, /* PA_SC_CLIPRECT_0_BR */
>>>>> +    0x00000000,
>>>>> +    0x20002000,
>>>>> +    0x00000000,
>>>>> +    0x20002000,
>>>>> +    0x00000000,
>>>>> +    0x20002000,
>>>>> +    0xaaaaaaaa, /* PA_SC_EDGERULE */
>>>>> +    0x00000000, /* PA_SU_HARDWARE_SCREEN_OFFSET */
>>>>> +    0x0000000f, /* CB_TARGET_MASK */
>>>>> +    0x0000000f, /* CB_SHADER_MASK */
>>>>> +
>>>>> +    0xc0226900,
>>>>> +    0x00000094,
>>>>> +    0x80000000, /* PA_SC_VPORT_SCISSOR_0_TL */
>>>>> +    0x20002000, /* PA_SC_VPORT_SCISSOR_0_BR */
>>>>> +    0x80000000,
>>>>> +    0x20002000,
>>>>> +    0x80000000,
>>>>> +    0x20002000,
>>>>> +    0x80000000,
>>>>> +    0x20002000,
>>>>> +    0x80000000,
>>>>> +    0x20002000,
>>>>> +    0x80000000,
>>>>> +    0x20002000,
>>>>> +    0x80000000,
>>>>> +    0x20002000,
>>>>> +    0x80000000,
>>>>> +    0x20002000,
>>>>> +    0x80000000,
>>>>> +    0x20002000,
>>>>> +    0x80000000,
>>>>> +    0x20002000,
>>>>> +    0x80000000,
>>>>> +    0x20002000,
>>>>> +    0x80000000,
>>>>> +    0x20002000,
>>>>> +    0x80000000,
>>>>> +    0x20002000,
>>>>> +    0x80000000,
>>>>> +    0x20002000,
>>>>> +    0x80000000,
>>>>> +    0x20002000,
>>>>> +    0x80000000,
>>>>> +    0x20002000,
>>>>> +    0x00000000, /* PA_SC_VPORT_ZMIN_0 */
>>>>> +    0x3f800000, /* PA_SC_VPORT_ZMAX_0 */
>>>>> +
>>>>> +    0xc0026900,
>>>>> +    0x000000d9,
>>>>> +    0x00000000, /* CP_RINGID */
>>>>> +    0x00000000, /* CP_VMID */
>>>>> +
>>>>> +    0xc0046900,
>>>>> +    0x00000100,
>>>>> +    0xffffffff, /* VGT_MAX_VTX_INDX */
>>>>> +    0x00000000, /* VGT_MIN_VTX_INDX */
>>>>> +    0x00000000, /* VGT_INDX_OFFSET */
>>>>> +    0x00000000, /* VGT_MULTI_PRIM_IB_RESET_INDX */
>>>>> +
>>>>> +    0xc0046900,
>>>>> +    0x00000105,
>>>>> +    0x00000000, /* CB_BLEND_RED */
>>>>> +    0x00000000, /* CB_BLEND_GREEN */
>>>>> +    0x00000000, /* CB_BLEND_BLUE */
>>>>> +    0x00000000, /* CB_BLEND_ALPHA */
>>>>> +
>>>>> +    0xc0016900,
>>>>> +    0x000001e0,
>>>>> +    0x00000000, /* CB_BLEND0_CONTROL */
>>>>> +
>>>>> +    0xc00e6900,
>>>>> +    0x00000200,
>>>>> +    0x00000000, /* DB_DEPTH_CONTROL */
>>>>> +    0x00000000, /* DB_EQAA */
>>>>> +    0x00cc0010, /* CB_COLOR_CONTROL */
>>>>> +    0x00000210, /* DB_SHADER_CONTROL */
>>>>> +    0x00010000, /* PA_CL_CLIP_CNTL */
>>>>> +    0x00000004, /* PA_SU_SC_MODE_CNTL */
>>>>> +    0x00000100, /* PA_CL_VTE_CNTL */
>>>>> +    0x00000000, /* PA_CL_VS_OUT_CNTL */
>>>>> +    0x00000000, /* PA_CL_NANINF_CNTL */
>>>>> +    0x00000000, /* PA_SU_LINE_STIPPLE_CNTL */
>>>>> +    0x00000000, /* PA_SU_LINE_STIPPLE_SCALE */
>>>>> +    0x00000000, /* PA_SU_PRIM_FILTER_CNTL */
>>>>> +    0x00000000, /*  */
>>>>> +    0x00000000, /*  */
>>>>> +
>>>>> +    0xc0116900,
>>>>> +    0x00000280,
>>>>> +    0x00000000, /* PA_SU_POINT_SIZE */
>>>>> +    0x00000000, /* PA_SU_POINT_MINMAX */
>>>>> +    0x00000008, /* PA_SU_LINE_CNTL */
>>>>> +    0x00000000, /* PA_SC_LINE_STIPPLE */
>>>>> +    0x00000000, /* VGT_OUTPUT_PATH_CNTL */
>>>>> +    0x00000000, /* VGT_HOS_CNTL */
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000, /* VGT_GS_MODE */
>>>>> +
>>>>> +    0xc0026900,
>>>>> +    0x00000292,
>>>>> +    0x00000000, /* PA_SC_MODE_CNTL_0 */
>>>>> +    0x00000000, /* PA_SC_MODE_CNTL_1 */
>>>>> +
>>>>> +    0xc0016900,
>>>>> +    0x000002a1,
>>>>> +    0x00000000, /* VGT_PRIMITIVEID_EN */
>>>>> +
>>>>> +    0xc0016900,
>>>>> +    0x000002a5,
>>>>> +    0x00000000, /* VGT_MULTI_PRIM_IB_RESET_EN */
>>>>> +
>>>>> +    0xc0026900,
>>>>> +    0x000002a8,
>>>>> +    0x00000000, /* VGT_INSTANCE_STEP_RATE_0 */
>>>>> +    0x00000000,
>>>>> +
>>>>> +    0xc0026900,
>>>>> +    0x000002ad,
>>>>> +    0x00000000, /* VGT_REUSE_OFF */
>>>>> +    0x00000000,
>>>>> +
>>>>> +    0xc0016900,
>>>>> +    0x000002d5,
>>>>> +    0x00000000, /* VGT_SHADER_STAGES_EN */
>>>>> +
>>>>> +    0xc0016900,
>>>>> +    0x000002dc,
>>>>> +    0x0000aa00, /* DB_ALPHA_TO_MASK */
>>>>> +
>>>>> +    0xc0066900,
>>>>> +    0x000002de,
>>>>> +    0x00000000, /* PA_SU_POLY_OFFSET_DB_FMT_CNTL */
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +
>>>>> +    0xc0026900,
>>>>> +    0x000002e5,
>>>>> +    0x00000000, /* VGT_STRMOUT_CONFIG */
>>>>> +    0x00000000,
>>>>> +
>>>>> +    0xc01b6900,
>>>>> +    0x000002f5,
>>>>> +    0x76543210, /* PA_SC_CENTROID_PRIORITY_0 */
>>>>> +    0xfedcba98, /* PA_SC_CENTROID_PRIORITY_1 */
>>>>> +    0x00000000, /* PA_SC_LINE_CNTL */
>>>>> +    0x00000000, /* PA_SC_AA_CONFIG */
>>>>> +    0x00000005, /* PA_SU_VTX_CNTL */
>>>>> +    0x3f800000, /* PA_CL_GB_VERT_CLIP_ADJ */
>>>>> +    0x3f800000, /* PA_CL_GB_VERT_DISC_ADJ */
>>>>> +    0x3f800000, /* PA_CL_GB_HORZ_CLIP_ADJ */
>>>>> +    0x3f800000, /* PA_CL_GB_HORZ_DISC_ADJ */
>>>>> +    0x00000000, /* PA_SC_AA_SAMPLE_LOCS_PIXEL_X0Y0_0 */
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0x00000000,
>>>>> +    0xffffffff, /* PA_SC_AA_MASK_X0Y0_X1Y0 */
>>>>> +    0xffffffff,
>>>>> +
>>>>> +    0xc0026900,
>>>>> +    0x00000316,
>>>>> +    0x0000000e, /* VGT_VERTEX_REUSE_BLOCK_CNTL */
>>>>> +    0x00000010, /*  */
>>>>> +};
>>>>> +
>>>>> +static const u32 si_default_size = ARRAY_SIZE(si_default_state);
>>>>> +
>>>>>   static int si_cp_start(struct radeon_device *rdev)
>>>>>   {
>>>>>       struct radeon_ring *ring = 
>>>>> &rdev->ring[RADEON_RING_TYPE_GFX_INDEX];
>>>>> diff --git a/drivers/gpu/drm/radeon/si_blit_shaders.c 
>>>>> b/drivers/gpu/drm/radeon/si_blit_shaders.c
>>>>> deleted file mode 100644
>>>>> index ec415e7dfa4b..000000000000
>>>>> --- a/drivers/gpu/drm/radeon/si_blit_shaders.c
>>>>> +++ /dev/null
>>>>> @@ -1,253 +0,0 @@
>>>>> -/*
>>>>> - * Copyright 2011 Advanced Micro Devices, Inc.
>>>>> - *
>>>>> - * Permission is hereby granted, free of charge, to any person 
>>>>> obtaining a
>>>>> - * copy of this software and associated documentation files (the 
>>>>> "Software"),
>>>>> - * to deal in the Software without restriction, including without 
>>>>> limitation
>>>>> - * the rights to use, copy, modify, merge, publish, distribute, 
>>>>> sublicense,
>>>>> - * and/or sell copies of the Software, and to permit persons to 
>>>>> whom the
>>>>> - * Software is furnished to do so, subject to the following 
>>>>> conditions:
>>>>> - *
>>>>> - * The above copyright notice and this permission notice 
>>>>> (including the next
>>>>> - * paragraph) shall be included in all copies or substantial 
>>>>> portions of the
>>>>> - * Software.
>>>>> - *
>>>>> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY 
>>>>> KIND, EXPRESS OR
>>>>> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>>>>> MERCHANTABILITY,
>>>>> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO 
>>>>> EVENT SHALL
>>>>> - * THE COPYRIGHT HOLDER(S) AND/OR ITS SUPPLIERS BE LIABLE FOR ANY 
>>>>> CLAIM, DAMAGES OR
>>>>> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
>>>>> OTHERWISE,
>>>>> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE 
>>>>> USE OR OTHER
>>>>> - * DEALINGS IN THE SOFTWARE.
>>>>> - *
>>>>> - * Authors:
>>>>> - *     Alex Deucher <alexander.deucher@amd.com>
>>>>> - */
>>>>> -
>>>>> -#include <linux/types.h>
>>>>> -#include <linux/bug.h>
>>>>> -#include <linux/kernel.h>
>>>>> -
>>>>> -const u32 si_default_state[] =
>>>>> -{
>>>>> -    0xc0066900,
>>>>> -    0x00000000,
>>>>> -    0x00000060, /* DB_RENDER_CONTROL */
>>>>> -    0x00000000, /* DB_COUNT_CONTROL */
>>>>> -    0x00000000, /* DB_DEPTH_VIEW */
>>>>> -    0x0000002a, /* DB_RENDER_OVERRIDE */
>>>>> -    0x00000000, /* DB_RENDER_OVERRIDE2 */
>>>>> -    0x00000000, /* DB_HTILE_DATA_BASE */
>>>>> -
>>>>> -    0xc0046900,
>>>>> -    0x00000008,
>>>>> -    0x00000000, /* DB_DEPTH_BOUNDS_MIN */
>>>>> -    0x00000000, /* DB_DEPTH_BOUNDS_MAX */
>>>>> -    0x00000000, /* DB_STENCIL_CLEAR */
>>>>> -    0x00000000, /* DB_DEPTH_CLEAR */
>>>>> -
>>>>> -    0xc0036900,
>>>>> -    0x0000000f,
>>>>> -    0x00000000, /* DB_DEPTH_INFO */
>>>>> -    0x00000000, /* DB_Z_INFO */
>>>>> -    0x00000000, /* DB_STENCIL_INFO */
>>>>> -
>>>>> -    0xc0016900,
>>>>> -    0x00000080,
>>>>> -    0x00000000, /* PA_SC_WINDOW_OFFSET */
>>>>> -
>>>>> -    0xc00d6900,
>>>>> -    0x00000083,
>>>>> -    0x0000ffff, /* PA_SC_CLIPRECT_RULE */
>>>>> -    0x00000000, /* PA_SC_CLIPRECT_0_TL */
>>>>> -    0x20002000, /* PA_SC_CLIPRECT_0_BR */
>>>>> -    0x00000000,
>>>>> -    0x20002000,
>>>>> -    0x00000000,
>>>>> -    0x20002000,
>>>>> -    0x00000000,
>>>>> -    0x20002000,
>>>>> -    0xaaaaaaaa, /* PA_SC_EDGERULE */
>>>>> -    0x00000000, /* PA_SU_HARDWARE_SCREEN_OFFSET */
>>>>> -    0x0000000f, /* CB_TARGET_MASK */
>>>>> -    0x0000000f, /* CB_SHADER_MASK */
>>>>> -
>>>>> -    0xc0226900,
>>>>> -    0x00000094,
>>>>> -    0x80000000, /* PA_SC_VPORT_SCISSOR_0_TL */
>>>>> -    0x20002000, /* PA_SC_VPORT_SCISSOR_0_BR */
>>>>> -    0x80000000,
>>>>> -    0x20002000,
>>>>> -    0x80000000,
>>>>> -    0x20002000,
>>>>> -    0x80000000,
>>>>> -    0x20002000,
>>>>> -    0x80000000,
>>>>> -    0x20002000,
>>>>> -    0x80000000,
>>>>> -    0x20002000,
>>>>> -    0x80000000,
>>>>> -    0x20002000,
>>>>> -    0x80000000,
>>>>> -    0x20002000,
>>>>> -    0x80000000,
>>>>> -    0x20002000,
>>>>> -    0x80000000,
>>>>> -    0x20002000,
>>>>> -    0x80000000,
>>>>> -    0x20002000,
>>>>> -    0x80000000,
>>>>> -    0x20002000,
>>>>> -    0x80000000,
>>>>> -    0x20002000,
>>>>> -    0x80000000,
>>>>> -    0x20002000,
>>>>> -    0x80000000,
>>>>> -    0x20002000,
>>>>> -    0x80000000,
>>>>> -    0x20002000,
>>>>> -    0x00000000, /* PA_SC_VPORT_ZMIN_0 */
>>>>> -    0x3f800000, /* PA_SC_VPORT_ZMAX_0 */
>>>>> -
>>>>> -    0xc0026900,
>>>>> -    0x000000d9,
>>>>> -    0x00000000, /* CP_RINGID */
>>>>> -    0x00000000, /* CP_VMID */
>>>>> -
>>>>> -    0xc0046900,
>>>>> -    0x00000100,
>>>>> -    0xffffffff, /* VGT_MAX_VTX_INDX */
>>>>> -    0x00000000, /* VGT_MIN_VTX_INDX */
>>>>> -    0x00000000, /* VGT_INDX_OFFSET */
>>>>> -    0x00000000, /* VGT_MULTI_PRIM_IB_RESET_INDX */
>>>>> -
>>>>> -    0xc0046900,
>>>>> -    0x00000105,
>>>>> -    0x00000000, /* CB_BLEND_RED */
>>>>> -    0x00000000, /* CB_BLEND_GREEN */
>>>>> -    0x00000000, /* CB_BLEND_BLUE */
>>>>> -    0x00000000, /* CB_BLEND_ALPHA */
>>>>> -
>>>>> -    0xc0016900,
>>>>> -    0x000001e0,
>>>>> -    0x00000000, /* CB_BLEND0_CONTROL */
>>>>> -
>>>>> -    0xc00e6900,
>>>>> -    0x00000200,
>>>>> -    0x00000000, /* DB_DEPTH_CONTROL */
>>>>> -    0x00000000, /* DB_EQAA */
>>>>> -    0x00cc0010, /* CB_COLOR_CONTROL */
>>>>> -    0x00000210, /* DB_SHADER_CONTROL */
>>>>> -    0x00010000, /* PA_CL_CLIP_CNTL */
>>>>> -    0x00000004, /* PA_SU_SC_MODE_CNTL */
>>>>> -    0x00000100, /* PA_CL_VTE_CNTL */
>>>>> -    0x00000000, /* PA_CL_VS_OUT_CNTL */
>>>>> -    0x00000000, /* PA_CL_NANINF_CNTL */
>>>>> -    0x00000000, /* PA_SU_LINE_STIPPLE_CNTL */
>>>>> -    0x00000000, /* PA_SU_LINE_STIPPLE_SCALE */
>>>>> -    0x00000000, /* PA_SU_PRIM_FILTER_CNTL */
>>>>> -    0x00000000, /*  */
>>>>> -    0x00000000, /*  */
>>>>> -
>>>>> -    0xc0116900,
>>>>> -    0x00000280,
>>>>> -    0x00000000, /* PA_SU_POINT_SIZE */
>>>>> -    0x00000000, /* PA_SU_POINT_MINMAX */
>>>>> -    0x00000008, /* PA_SU_LINE_CNTL */
>>>>> -    0x00000000, /* PA_SC_LINE_STIPPLE */
>>>>> -    0x00000000, /* VGT_OUTPUT_PATH_CNTL */
>>>>> -    0x00000000, /* VGT_HOS_CNTL */
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000, /* VGT_GS_MODE */
>>>>> -
>>>>> -    0xc0026900,
>>>>> -    0x00000292,
>>>>> -    0x00000000, /* PA_SC_MODE_CNTL_0 */
>>>>> -    0x00000000, /* PA_SC_MODE_CNTL_1 */
>>>>> -
>>>>> -    0xc0016900,
>>>>> -    0x000002a1,
>>>>> -    0x00000000, /* VGT_PRIMITIVEID_EN */
>>>>> -
>>>>> -    0xc0016900,
>>>>> -    0x000002a5,
>>>>> -    0x00000000, /* VGT_MULTI_PRIM_IB_RESET_EN */
>>>>> -
>>>>> -    0xc0026900,
>>>>> -    0x000002a8,
>>>>> -    0x00000000, /* VGT_INSTANCE_STEP_RATE_0 */
>>>>> -    0x00000000,
>>>>> -
>>>>> -    0xc0026900,
>>>>> -    0x000002ad,
>>>>> -    0x00000000, /* VGT_REUSE_OFF */
>>>>> -    0x00000000,
>>>>> -
>>>>> -    0xc0016900,
>>>>> -    0x000002d5,
>>>>> -    0x00000000, /* VGT_SHADER_STAGES_EN */
>>>>> -
>>>>> -    0xc0016900,
>>>>> -    0x000002dc,
>>>>> -    0x0000aa00, /* DB_ALPHA_TO_MASK */
>>>>> -
>>>>> -    0xc0066900,
>>>>> -    0x000002de,
>>>>> -    0x00000000, /* PA_SU_POLY_OFFSET_DB_FMT_CNTL */
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -
>>>>> -    0xc0026900,
>>>>> -    0x000002e5,
>>>>> -    0x00000000, /* VGT_STRMOUT_CONFIG */
>>>>> -    0x00000000,
>>>>> -
>>>>> -    0xc01b6900,
>>>>> -    0x000002f5,
>>>>> -    0x76543210, /* PA_SC_CENTROID_PRIORITY_0 */
>>>>> -    0xfedcba98, /* PA_SC_CENTROID_PRIORITY_1 */
>>>>> -    0x00000000, /* PA_SC_LINE_CNTL */
>>>>> -    0x00000000, /* PA_SC_AA_CONFIG */
>>>>> -    0x00000005, /* PA_SU_VTX_CNTL */
>>>>> -    0x3f800000, /* PA_CL_GB_VERT_CLIP_ADJ */
>>>>> -    0x3f800000, /* PA_CL_GB_VERT_DISC_ADJ */
>>>>> -    0x3f800000, /* PA_CL_GB_HORZ_CLIP_ADJ */
>>>>> -    0x3f800000, /* PA_CL_GB_HORZ_DISC_ADJ */
>>>>> -    0x00000000, /* PA_SC_AA_SAMPLE_LOCS_PIXEL_X0Y0_0 */
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0x00000000,
>>>>> -    0xffffffff, /* PA_SC_AA_MASK_X0Y0_X1Y0 */
>>>>> -    0xffffffff,
>>>>> -
>>>>> -    0xc0026900,
>>>>> -    0x00000316,
>>>>> -    0x0000000e, /* VGT_VERTEX_REUSE_BLOCK_CNTL */
>>>>> -    0x00000010, /*  */
>>>>> -};
>>>>> -
>>>>> -const u32 si_default_size = ARRAY_SIZE(si_default_state);
>>>>> diff --git a/drivers/gpu/drm/radeon/si_blit_shaders.h 
>>>>> b/drivers/gpu/drm/radeon/si_blit_shaders.h
>>>>> deleted file mode 100644
>>>>> index c739e51e3961..000000000000
>>>>> --- a/drivers/gpu/drm/radeon/si_blit_shaders.h
>>>>> +++ /dev/null
>>>>> @@ -1,32 +0,0 @@
>>>>> -/*
>>>>> - * Copyright 2011 Advanced Micro Devices, Inc.
>>>>> - *
>>>>> - * Permission is hereby granted, free of charge, to any person 
>>>>> obtaining a
>>>>> - * copy of this software and associated documentation files (the 
>>>>> "Software"),
>>>>> - * to deal in the Software without restriction, including without 
>>>>> limitation
>>>>> - * the rights to use, copy, modify, merge, publish, distribute, 
>>>>> sublicense,
>>>>> - * and/or sell copies of the Software, and to permit persons to 
>>>>> whom the
>>>>> - * Software is furnished to do so, subject to the following 
>>>>> conditions:
>>>>> - *
>>>>> - * The above copyright notice and this permission notice 
>>>>> (including the next
>>>>> - * paragraph) shall be included in all copies or substantial 
>>>>> portions of the
>>>>> - * Software.
>>>>> - *
>>>>> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY 
>>>>> KIND, EXPRESS OR
>>>>> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>>>>> MERCHANTABILITY,
>>>>> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO 
>>>>> EVENT SHALL
>>>>> - * THE COPYRIGHT HOLDER(S) AND/OR ITS SUPPLIERS BE LIABLE FOR ANY 
>>>>> CLAIM, DAMAGES OR
>>>>> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
>>>>> OTHERWISE,
>>>>> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE 
>>>>> USE OR OTHER
>>>>> - * DEALINGS IN THE SOFTWARE.
>>>>> - *
>>>>> - */
>>>>> -
>>>>> -#ifndef SI_BLIT_SHADERS_H
>>>>> -#define SI_BLIT_SHADERS_H
>>>>> -
>>>>> -extern const u32 si_default_state[];
>>>>> -
>>>>> -extern const u32 si_default_size;
>>>>> -
>>>>> -#endif
>>>>
>>>
>>
>

