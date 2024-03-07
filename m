Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A86B8758B6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 21:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC3510F559;
	Thu,  7 Mar 2024 20:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HxjEVbOd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7DE10F559;
 Thu,  7 Mar 2024 20:42:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDCQ8RqZDziTbQ5bvOlq3mVLyNl70FXZmSFUlod0iuXDH6fquuvD9AwyIGYsM8D6Nf+qWGprMqMEjy61pZV5+iEGWvIdWm/6DEyAJAmgpRE0XTLYJTvzjDa4UeSyDO34mQ38f09MLYC6Oua/2WBwQhUjb+ob7Vr3ZX6UtL1v+sUO5q5AbmSXOJHes0IkK53HDg/ldLMHpkHlBN6IPfH3MO+5mEkLGqcoDgd2Ef6Q7m0MsHPVX/b6qW5kz5nkHG0VzlYXL7/1Bdj/QCsH4O4BLPZ04a4plhZHC7KVkpeDxQRCBt+nR8tTpRVMdJhzdKH8ZI6TWw95uRECpbrAnolFEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EafFfAJCUkpm9n3MlKP6SwM9uuDDa1vDkH3vT6S2czQ=;
 b=BamKVYtXEX04qsWcj7DSqbBa1Tt2Iu+cUP1ptiGEjd2AgNQRZkcD/HBGF27t+57X28JSWbbYHuLClksFuSKbrLZRnrRfmfFoK7HcXjX4HwgJeiq8Cfg8zt5n+TT9k4YEaJbSZpHP2zegZlKX+elMV1czctlXb8Kf5A2Xl6AEVjFYkQHQGZilJkKPPe8H7dy9KpX+VZUSL8K4j5WQQfmKFua/DTQFwb1BprJgi7uMTRg2aMCIgndFY60d/orVCpyZMgmmc/8anXWdHoQtQtc1m0SU6WTOxoW5Z4tFszkpCYl90nAtcZBwzLuItAzzEBeuqQ0hkHyyAISYyMMopIzgpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EafFfAJCUkpm9n3MlKP6SwM9uuDDa1vDkH3vT6S2czQ=;
 b=HxjEVbOdAHuZOj9ulV0QIFqg3yluuAbk3fCtrk0toDDvej+p4e2PVth7TpvVG9K0sSRwUlcSM9cqYFQTu5h+FdYPGEEawo/dJ1+nvwCUqSmGeC+Z7Xu2Y0XLiAX+ZbUmBStmifr5Xkwrn8eTpSaDjAzBMXP17ucI6o/faW0eldY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by SN7PR12MB7785.namprd12.prod.outlook.com (2603:10b6:806:346::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Thu, 7 Mar
 2024 20:42:11 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd%4]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 20:42:11 +0000
Message-ID: <c33f5ede-19de-491b-8f97-c78db47fdf30@amd.com>
Date: Fri, 8 Mar 2024 02:12:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: add vm fault information to devcoredump
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mukul Joshi <mukul.joshi@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20240307165932.3856952-1-sunil.khatri@amd.com>
 <20240307165932.3856952-3-sunil.khatri@amd.com>
 <CADnq5_OaCRAjCZGOEpd1gTFSUHdNkVbDqDgx_LQKw_JR1Qtv3Q@mail.gmail.com>
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <CADnq5_OaCRAjCZGOEpd1gTFSUHdNkVbDqDgx_LQKw_JR1Qtv3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::9) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|SN7PR12MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: dd7beab9-869b-41a2-e16b-08dc3ee7101b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tb4eEgEqG2nWMV3NQIRzs/NNDIh01XMPqEWkiY8C99Ufh0JX9OxN1hf1DTpluBpJbopqxsdxGcKl9WFvjUIPqeT7Q0qjJl3A3zQdGqbIB3+ywCB13MD303/j1VC65KPllriJS9chJIQSM0wuTovpQJd9I4e6T2EIWx4usI8lVgf5pn2ed2CWxadUJNwbu5FC1D2W0quw/EeFDWwi6f0jL3YNDMfgfNtchM3CY71sd7B33IVVxIXJV29rBO2TgreV6HJCcPGd0kJHIqaoLQ/rLyThwRtUBkIEBe77KzxmIvvDzhI5KZPSYMu0LM+XlEP8g+BpTCxbKn1cVFL06qwvhtM773iOGv6ZF7ARdFuo73Sj84dUzkwoPt+2s3OZNukDwoIOZ9eh32GO/8xusH2a3DcJXcVRjOzu8JAXW73ezepWUNO8+zzO03H5kF+hLvCYOVas6WsuXl1B2aY3j0vkz3nk1SPJiXkWhZe10a2L8eDMv90C6lAjjjv6Wck3FMgIZffa3UPHcVLsKBlNL568mUmkx3xjAvqmAG/dewQh/hBENJXP7WRx0hnqik9wtrZSCRNRKqNkUWVllkObxAaQ7yyAee5oCvTDfz+Y2vxb+/TzUgGbJj8W/dq1iQfLH2C1jdmvd8Cq1Ma4s1CI9poFguT4toPfNP6PFZbsJeIe/9c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkhabnlVYWtJV0tHYzJlRTZVVGJUZ3lzcFRyb2x1dUZEK0x4byswR2huNmlJ?=
 =?utf-8?B?ZEFWMm9DSFpTUTZWUEw5VlRWak80SVBWYlJFbCtwK1pXQk53NjNoMkEzYU5M?=
 =?utf-8?B?SURXdlNKdDJvZW9KeHlDYXZITjVvcXdFTVpIcGpwcEpKbm9YY0dpMEozTXlN?=
 =?utf-8?B?YkF2RDBWVjU3OXg0VWx2SHdsS3U0ZTRPbm5EeWlyQ2RsRmJBR3BheWVkUzAv?=
 =?utf-8?B?WHpqNzNkcGRZWGZqVTZJOVJsSmVrdUthS3B4SStYaHFrajZqREVmUDVyRWtJ?=
 =?utf-8?B?NDdtc3B3dUJCeGhpNjhjTGVCZU5oVXRkT0FEbWtHQVRzWSszUlczMndUb3Ny?=
 =?utf-8?B?TXBZQ2ZSNGtMb1ljREFuanNIMnNoZTlGWVR1TVRHRFpLb1NXUG5kTkVZaldr?=
 =?utf-8?B?b1lESEorQm9pTE0zSU0vemNUNCsyRm1rdTRSejZxVzVVbWQ2dzRUMDJLdGsy?=
 =?utf-8?B?UlhFMFJiYXY1SFk2bXd4WHV1dkNrRkFaK21WRmwyZHFDWFVTc1RBYXp5SnE4?=
 =?utf-8?B?VVRVMGZtYXg2aVRNUzF0eGNuZ1hvb1lPaVlBVVpFSDBaUDFSTndmU3FHQ3lU?=
 =?utf-8?B?L3lSU25hZUNNOUhXU0c5U2FOZDEyb3o5RVFmd1RHZ3lOUnBSNVZhVFlBeHVx?=
 =?utf-8?B?ZE94VWFSZjRkczU1RlJIQWltWll5MWpBTXRvVU9zb3RXU1dndysxRVp3SCtO?=
 =?utf-8?B?b1RyRXFOUDN5ZkMrVTduN1BITWFxb1Y4eW4zblZZWm5mODI5SFR3cERWbDBz?=
 =?utf-8?B?SDR4bXROUUV1Tm1BazhmOEd0UkRjRHplS2lBeEdBWkhhUHZpY1ZVUEgvUVZS?=
 =?utf-8?B?U0RYbWpyNFM1blIrWEJUYnpCZUhYc0s0R1RqL0M5N1A4WS9xSFUvaWcrWGly?=
 =?utf-8?B?L3NoQkFGenpaQ2c2djIvakdCQTM4MGIrdVZoTE9FMGYyV2NvWXRpd2tiK3hZ?=
 =?utf-8?B?eCtoT1p3K09WRWg0cFF3RDF0WkloRmJxa1FReXBhN2hndGZNUTVybTZzeUF2?=
 =?utf-8?B?cVNrV0RZQUNCcm1RcWNGZURGenpUV2w5THVsNHc2NDhFY3FLTCtLMlNKTm4w?=
 =?utf-8?B?SVZoNEd4M2s2L1lkbjd3MXY0TGFVdXdNRFBGOEhCT3kyWVpNNmorMEQ3ZUZa?=
 =?utf-8?B?Uk5GZlhiVHVUcytsT0JnWWg5NWM1czhDU0YzWW82ZXlYemZVTjV4OE5GbU1H?=
 =?utf-8?B?b0ZNOWg4QUxnMFByNkc0S1ppYVV3ci9NS1hQRXhWRXQzcHhoSHU5eXp1SC9v?=
 =?utf-8?B?SjdIZklONWNGYWNteFRMbjI3SG02K204MlVpbWZzVWtwQnNudWlmNWFlZHB3?=
 =?utf-8?B?YnA1RitTNHlUWTlqZTJrTG9jbFVVOFZIakZJS1JYQTIwTXVBdWJ6K3ZNQ1BQ?=
 =?utf-8?B?cGluU2hJZ3FhZjFhcjZEUW9MRkIwU2FMVWdIUEYwMkxYZHA1QTdzVnJWWndX?=
 =?utf-8?B?MnhjcDVSWUhTVWtCRytOVWthREpFMFlmOGN1K1VoYlE3ZVRZR0FkdE1sWkg2?=
 =?utf-8?B?aHdDdTlQZnNDdS9WNHp0azhoemZKOUpkSlRRWFVCS3JyWnJjd2xnRzBjbDdU?=
 =?utf-8?B?Y2Z6VC9janFRWmhYTDBLZCtrOVBVSThUM3E0elAvTTNzZHEyekNkSWhrYUUr?=
 =?utf-8?B?eDhIYmVMWHFFSk9zekJES1lLejROQlRJcEx3T0ZVRWF1eXBMaStxUGN5RTlt?=
 =?utf-8?B?cGd5M3BJUmx0NGpERFJINTBZT3BOUWNoeTBZMi93STExVVpMRnQzRTVZaEVZ?=
 =?utf-8?B?d0dBcnlpMWVlRlJJeW8xMEkwTUh0TmJRQWdzSnBnV3NqVllkYm1QOTF0d1hG?=
 =?utf-8?B?Y2RqOVdERlZ6bFNNMFJJbC9sc3lFMVRMeCtUd2VRMVJKMktRZUYrTXJlbkt0?=
 =?utf-8?B?SllQNW1haHdVbFRVMFlKWFZncFFBS1ZCQlVXQzdXNWdZSnZZSlZGbDJuZFlT?=
 =?utf-8?B?disxcmVHcG5UK1F4OW54T1pRc0FsUnlscGsyaWJqYzdkb0E5Y3Ewa3dkNStq?=
 =?utf-8?B?TEp3TXN3c0ZxYTJuRFV6Ymp0MGh3MHNGVFRuWXNjWkc0WWhYUElvN1IyeE1x?=
 =?utf-8?B?VllLQzFkNk9SdVA4RVpkdWM1UUVqd0dBSFBHRnQwcWpHejdyMGFJKzFlWk5q?=
 =?utf-8?Q?uJKPxGIvHtlF79giLd0V/8mac?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7beab9-869b-41a2-e16b-08dc3ee7101b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 20:42:11.1942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5SbrjLq4fbIIqOs4DHmntT4XNs36hF8rWAYOgYR28EZk7YM5EUJYX3ukgwy08l2eeURe3rzEwcDJR08WSijaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7785
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


On 3/8/2024 12:44 AM, Alex Deucher wrote:
> On Thu, Mar 7, 2024 at 12:00 PM Sunil Khatri <sunil.khatri@amd.com> wrote:
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
>> Faulty page starting at address 0x0000000000000000
> Do you want a : before the address for consistency?
sure.
>
>> Protection fault status register:0x301031
> How about a space after the : for consistency?
>
> For parsability, it may make more sense to just have a list of key value pairs:
> [GPU page fault]
> hub:
> addr:
> status:
> [Ring timeout details]
> IP:
> ring:
> name:
>
> etc.

Sure i agree but till now i was capturing information like we shared in 
dmesg which is user readable. But surely one we have enough data i could 
arrange all in key: value pairs like you suggest in a patch later if 
that works ?

>
>> VRAM is lost due to GPU reset!
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> index 147100c27c2d..dd39e614d907 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> @@ -203,8 +203,20 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>>                             coredump->ring->name);
>>          }
>>
>> +       if (coredump->adev) {
>> +               struct amdgpu_vm_fault_info *fault_info =
>> +                       &coredump->adev->vm_manager.fault_info;
>> +
>> +               drm_printf(&p, "\n[%s] Page fault observed\n",
>> +                          fault_info->vmhub ? "mmhub" : "gfxhub");
>> +               drm_printf(&p, "Faulty page starting at address 0x%016llx\n",
>> +                          fault_info->addr);
>> +               drm_printf(&p, "Protection fault status register:0x%x\n",
>> +                          fault_info->status);
>> +       }
>> +
>>          if (coredump->reset_vram_lost)
>> -               drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>> +               drm_printf(&p, "\nVRAM is lost due to GPU reset!\n");
>>          if (coredump->adev->reset_info.num_regs) {
>>                  drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value:\n");
>>
>> --
>> 2.34.1
>>
