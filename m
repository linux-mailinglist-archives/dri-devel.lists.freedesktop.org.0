Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A058760B7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 10:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78A810F14D;
	Fri,  8 Mar 2024 09:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fY9bTfV+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5199D10F14D;
 Fri,  8 Mar 2024 09:16:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8GJyLfJW3DmhqlCxy3vvQ8T0RVWG1hGGTXjEgNAEImWndi8Qaz6z5OJk+7Yaa/sUUCrLJkl9pogRk3OcRdl6dviEchbRDuN7VJAzAtdmplMo6mP80peTRr7NE8+ZHWBocCcF8R0HtrzlKmSzHB7GwGU34DngNmLL2Ml9o9derqTeevQPs6vu08ZYlCx/ehI1lpo8rDi1GY4EvdubtW8G1D07JBe0H020xtKunWVPqbC5C8pbW4cBmUcoUqLtjsv2jkMwt40Fwl/NCKEB+JlCJhZ8ziJU/2A+hfTBHJbfd/IcRWiqOsu2FYWoi33IVULeKb9kkwYKi6RkjgaoIIQXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7od7hNH/LWOT7S86wWzepCW3T7vMRzkgIYYKEq2Xa3k=;
 b=cQlbbw34kcarpSthrO45wP42VUVcQX7H7mCNjUgimMrgFMmDPfdQn2ff4YHOo0v9HUesksIuamDhOP2ZWuJVaqpWkjkbeH1QkjWDehz9E5MKs5cxcrf9TwUgIe0MOK8I+upmv2vnfYFeRGTOKZyQa2Eljs1DAlbkGa7y9TR7srY26aFV7CYxdQ2BcpFlFff6isTtfBA1h0MJZjkfvzjXD2pwxn0mS0t2g8l3EK9DZU+2LZ0StRlsNvRRZoe4kTkbLXPKPr2HwnP2OW64C8RN/pjMwOG0pJnl26yXLL5GeuNuSVo6dJcJ+KyjLH6UJuTrJpCu8RfsnKocAQX1jMxnmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7od7hNH/LWOT7S86wWzepCW3T7vMRzkgIYYKEq2Xa3k=;
 b=fY9bTfV++eTl/GZbIqEDl7Nkvb/DWrqbp7Yklbf75H4NjGPgu4ANusPxwJ41fkvxtLE28LX9uASXSn3pqcCZcUTsrqOMbLPkoO0x7lYEBcpEd9rJPSGwSk6Dn17J28sz2YiPCzb+cGX6NH1mwVAW2LNehdKJm/7CpEfnMVihlE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by LV3PR12MB9401.namprd12.prod.outlook.com (2603:10b6:408:21c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Fri, 8 Mar
 2024 09:16:47 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd%4]) with mapi id 15.20.7362.019; Fri, 8 Mar 2024
 09:16:47 +0000
Message-ID: <83c46d51-7d4c-4a2f-b34e-8b6700a5fca7@amd.com>
Date: Fri, 8 Mar 2024 14:46:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/amdgpu: add vm fault information to devcoredump
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mukul Joshi <mukul.joshi@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20240307205054.3904657-1-sunil.khatri@amd.com>
 <20240307205054.3904657-3-sunil.khatri@amd.com>
 <ab7c8dde-c914-4e07-a95a-126976917416@amd.com>
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <ab7c8dde-c914-4e07-a95a-126976917416@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::18) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|LV3PR12MB9401:EE_
X-MS-Office365-Filtering-Correlation-Id: 16fb616a-23e7-47bc-5abd-08dc3f507af6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jriUsw9JsiOXH9sPD7G/2faV15olJCu4WfntL0IyNOHDSe20Vwj42xsxm/lLEZqAe67nPUGAKlgN7AQg3zzwmNCp9qC0AK9bRgxl+EJbP7vdUSByplcii2ivBhOjqQ5kJraZT4uawpfDHo1VvOa3GvVhFFxn3rUMgY0kXRNqkz2oyagQlqe1Jy29CE10oaDJGR2FQQqhd13ZkA44DzrnNOqOMQIaph0AdT/FobHq3+ZJJgcTyiqe5ZlZg+3N7pIokP1fRj98GNDQO8hWSUCPme/AQE13UMRDmmkIPLzm6xEHMF1OEoZuc5HVz79Re+Qb7u64YycqG6tPQiG67F3OUxgo97ciRJIQleprg0YV9QxtqpYmssqpID0hrL9PLs1rq7ViPddlJELOPak9rZ+uq75MU3bkwWpKY3DG7LBfwP6KiylmYIDIU0IGFDPYikN+1WVJfFnQif74SmkJICC8aEqWj0b4UHNqdi4s/2WLkD7wOgQfPiBMV1Kgs7+fKCb0W4ULhO1rdjR79169BuzuIlmqF0tAFlbiYMCc2tDwDixE6iSHKbYrZen5SfbGrwr7Y7WfCOO8jeFz8CLT0nu72eCdGMqEVNTTaHtp+8AvMIXIKhpxj4Weye0q4UsQmbgNyTep+OuxxxYMpZCOwNioVxhkX+NQ9w7BKZgTmzllO6w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWtmSXZvUTUzUGJhUDcyK081aGdDOTdMWVJ0d1FqZitodWt0MHVUeVp5MVZu?=
 =?utf-8?B?R0pidEh6TzNjY3VJUTd3UmliZ0U0TjJ2cXc4R0Y3NXA2RTZSbHZ4VkVjbXlW?=
 =?utf-8?B?NFk1RUZqQmY2UGR4YjJ2L01MeEUvSzRwUUFmSVZDUE5sdVI3M3FlMGZrR0Ri?=
 =?utf-8?B?ckFXMnBWekhrcmRFMW9ZSDRTZFpaZ1RFbXZjQ3FQVkxIVmV2VnZXSERWRXJ0?=
 =?utf-8?B?M1pHVlZkWis1L1BSM0c5bkloM3NXSDMvQTdWS1IxZ01rcEx6TDliQ2FZRVFy?=
 =?utf-8?B?QmliZW9hZHoxUHVOQlhEeXZWcElodXBicU9XR2RpUFY0TjdRUUpFcHJ5ZWdK?=
 =?utf-8?B?R3BFT1JoYm9OUXJ1TlkzcUJGMnNyUkJHUGt3UmNpUjY3V2RUTjZHNWZBSlFX?=
 =?utf-8?B?SEw5N05oc1ZOVnhrK21LdFRaR2tZdlBKZjhjUGZFUTdwSWJxNVRGT21ZR2tt?=
 =?utf-8?B?QzRzejZZVlRpTzM0ZEc3VEV2UGVsZUVCaHB6TXA1VEVGRUF3MWdFaFF6amFB?=
 =?utf-8?B?WnQybEl5dEsvcks3c2tldzlMbi9iOGR3UXNHY1VuZG5Sd1pYT3F0eXBvQTI1?=
 =?utf-8?B?T2dNelVMaWtyZ2NVNnczald1cG9mWnRyS0ZRSzkvdXJ3UnQxSWxZdzFWQUJK?=
 =?utf-8?B?TTZkNS9DdGxYWnQ0M0JCT09aZ1dWZnFRV1M2a0dSdVh5MU03N3hZZGZqcHVB?=
 =?utf-8?B?QzNIbzFNc2FWZGY1Zk43RUJYTHdtNmp4b1ZxcmlsUGFmbGk2cEswclFWdTVn?=
 =?utf-8?B?ZlZSR005NnNwZisxZkZOR05teDJoODh3UHRpY052eGY2TStSNVpWTXFtZ1Qy?=
 =?utf-8?B?SkYyOGw1Zlp2RG1ZSkxqVUVlOU9FSmViZTgwSWcvdTBtRlFZVkQ5bFZrR3F3?=
 =?utf-8?B?YmtVZUJ6V3ByZmxMaUo5amhpWDNGdjlWd0NYV1NsaHMzQzY0akw5NDBQWWxw?=
 =?utf-8?B?eFlZVUszSi9Uci9OaFZaVFE0UVc5dk9ScDhhbUlabzN2K00rN08wOC9FUUVn?=
 =?utf-8?B?djhLMzRnSU0zaWN4ZDgxTkx3TmhYaGFKYTNIYlRtckt4TmhoemFPUG1xQ1Ay?=
 =?utf-8?B?czgxUFVEb1A1NFg3Q2tBZlpaa2xQb1J3WmZidWY1TWpLd0JmRXVCRmVtTmlB?=
 =?utf-8?B?b2xMM2Z1N24xRS9jSVNROFc4WmpJK2RJbnRlODRySVlPQ1JySFIwV0NJZ1Jv?=
 =?utf-8?B?WEp3SUYvUnFvMmMzSDJlT3JJTzRvb1VSVXl5eWJPUElhcUhqUXpmZDVOUm5J?=
 =?utf-8?B?dUFPaFlVa3Z6QzU1WE9wcXBXSzluMGtqMWMvUnBuR3lyU2wxL3N3cGpVbDJ4?=
 =?utf-8?B?NW9NZlgyOXpZMGZGWG9BMERWb3Y2Nk9zbVpvN3hpRDg1dnQyNitRaHN0R1Zi?=
 =?utf-8?B?U2lKQ0p1dGRFNGJjN0R1V0ZFd0Y0RVpQTi95REp6R2RxL0ZzSHJFYkhEWHpM?=
 =?utf-8?B?UmpCNjMzL1kvNDk4S0N1a3IvN0FCQjMxRjVLYWlpdGtHbzhJcmk4d1I4eWdo?=
 =?utf-8?B?Zmh3c1VudDJzYlA0OXRVUTFubFEyZVpiL294L2puSGlLS1VCbUcrN0dnQXVK?=
 =?utf-8?B?bVYyK1hhRGQyeGdlU2tYZi9HV3k1ZysrOVlJYk1sRThreU9qNzRJWDNQeUQ0?=
 =?utf-8?B?UzdLclRvUEdFWkpPV2lSbTZoV1ZNSTdFQzBBMUowd2tndzcrNlh1SUxvRVlN?=
 =?utf-8?B?bXJLY3cwMWlMVEt0dUdreW5yOEl4WklXUFdMK2EzWDdrdlJ2S3Z6a1dDZ1kz?=
 =?utf-8?B?R3QwT2FyYzBqRExNK2lPS291cHVJNGQzZXJOQTQxUHA1eSttK0tkQitkeS9F?=
 =?utf-8?B?bnBqcVd2NnZMRmxmNVpiKzVvQUF0K0MyWFNNdXFJZFFWYzNLcHZZR29tcXJK?=
 =?utf-8?B?UEFNbGVzR3JhNWJQMVBhMzZtN1duWFdzNFlrdUgrZ204QmlsTjkwbnllcldH?=
 =?utf-8?B?L3hCdzNHdEZ4Z3FBcGxyU1hJb2xpTkdtQXV5SVVHNERvWnZkaTRGanBiTXRF?=
 =?utf-8?B?aHoyV0lOdFEzbkFUN3FRQ1ZWdTNGUW9CMEpsSjNBdTZ1QUZIUXpMZFd6NjJK?=
 =?utf-8?B?ZWZBSEtlNXFCVHZBMkFKVStIVnA4ZUptQ2tCckVjVTVNT05NZW1waE1GbUVW?=
 =?utf-8?Q?USF0Toh3JIAhx5f3pSrjcPUxQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16fb616a-23e7-47bc-5abd-08dc3f507af6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 09:16:47.6008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f4VnuwpMCQJgr/BiLQuKpKqzFUavL+f3LuanL42kgUsThDQn1VZWtBgE/vWLP4g1REj7RuNZUlN6urfQcoTstA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9401
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


On 3/8/2024 2:39 PM, Christian König wrote:
> Am 07.03.24 um 21:50 schrieb Sunil Khatri:
>> Add page fault information to the devcoredump.
>>
>> Output of devcoredump:
>> **** AMDGPU Device Coredump ****
>> version: 1
>> kernel: 6.7.0-amd-staging-drm-next
>> module: amdgpu
>> time: 29.725011811
>> process_name: soft_recovery_p PID: 1720
>>
>> Ring timed out details
>> IP Type: 0 Ring Name: gfx_0.0.0
>>
>> [gfxhub] Page fault observed
>> Faulty page starting at address: 0x0000000000000000
>> Protection fault status register: 0x301031
>>
>> VRAM is lost due to GPU reset!
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> index 147100c27c2d..8794a3c21176 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> @@ -203,8 +203,20 @@ amdgpu_devcoredump_read(char *buffer, loff_t 
>> offset, size_t count,
>>                  coredump->ring->name);
>>       }
>>   +    if (coredump->adev) {
>> +        struct amdgpu_vm_fault_info *fault_info =
>> +            &coredump->adev->vm_manager.fault_info;
>> +
>> +        drm_printf(&p, "\n[%s] Page fault observed\n",
>> +               fault_info->vmhub ? "mmhub" : "gfxhub");
>> +        drm_printf(&p, "Faulty page starting at address: 0x%016llx\n",
>> +               fault_info->addr);
>> +        drm_printf(&p, "Protection fault status register: 0x%x\n",
>> +               fault_info->status);
>> +    }
>> +
>>       if (coredump->reset_vram_lost)
>> -        drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>> +        drm_printf(&p, "\nVRAM is lost due to GPU reset!\n");
>
> Why this additional new line?
The intent is the devcoredump have different sections clearly demarcated 
with an new line else "VRAM is lost due to GPU reset!" seems part of the 
page fault information.
[gfxhub] Page fault observed
Faulty page starting at address: 0x0000000000000000
Protection fault status register: 0x301031

VRAM is lost due to GPU reset!

Regards
Sunil

>
> Apart from that looks really good to me.
>
> Regards,
> Christian.
>
>>       if (coredump->adev->reset_info.num_regs) {
>>           drm_printf(&p, "AMDGPU register dumps:\nOffset:     
>> Value:\n");
>
