Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 909E64A9CDF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 17:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EB410E75D;
	Fri,  4 Feb 2022 16:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2074.outbound.protection.outlook.com [40.107.212.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F031210E5A1;
 Fri,  4 Feb 2022 16:23:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oq4KJZ0TTDtOCPpIs8zvDZUe7EqpU4HBCmESqk/Doq12+UmiWaxSQWuc0P73pS/yHxhgs2zxLRDVWJ7TWuioiHanWn3BNb8dLVcZNK+U8t/vad4CoNvMYCkM+WTlfLbIKW1s+9B84Ze7ye57ejG15oiGYA91MHck2Dexh58Ej5WoIaVLJfu7DtzC92u796YZJ7pi6auKiic/1JJksJa499D0m/jGhYywNkQ+V8OLd0+hNHNkXyd2ZQIQNIjw9KGwz4a+8mcNb4eByPWbR5HOt6UAGOsXz0cdJ7rA7ODS6RdSJGOpgs7AoZU8UuW43esE2ZWrtLUxDQhDKLLeEgrrGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfH15Sui/f6oVb5idu35Dj9/U6Y3T0Ve53NFnQ2g/Pc=;
 b=Gk/j/mZaCkLB64EiffWYaCXKKdQPplWnh1CzPIwvbMburo7m/oxa/vt1LeFgeBSlduBRPEjzP3X/4MXkcbhfW2ZOuv7xBt6EhkY+UKKYH9f2TA1+uWlm/QtBRFEC3Xy6IZtOKrWNPfxG7PnXObnMW5aqQZa8w0EjH88zfTVIHErvy/w8yQHPMbjKJtPPnL4c0Xa0E6fklI2yPzA8bSQlyF316XirLf+Mk/oaHgO0Rk8n0NXuilO8id/+7iJYefI2ZSrbh65rjWRLgbH0W1x8O50EsEWrH8qKAZSYSruBCVggiOvvZMJLHOQ7LwDGTrB3MNhI7/QbA82+qFB3WHJ28g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfH15Sui/f6oVb5idu35Dj9/U6Y3T0Ve53NFnQ2g/Pc=;
 b=kuKGMs+OXrFvc3QAQncOPjqcMugj2mqj+VUxf7lD7XHFyhz5pI/oaL9+AwGSJIJqryBZ5ksdo0mhChkWl1Ry5ngW1owfZTg/ILHDxUzr5nz/Q/ruhrLjb/kkVAoWObKPqXYWXZzvaUC5O7qL3DeUDmyt2z7kPAeixaEansRvQHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM6PR12MB3753.namprd12.prod.outlook.com (2603:10b6:5:1c7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Fri, 4 Feb
 2022 16:23:10 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%8]) with mapi id 15.20.4951.017; Fri, 4 Feb 2022
 16:23:09 +0000
Message-ID: <ee0add19-530f-a289-4c91-4d4b2969a084@amd.com>
Date: Fri, 4 Feb 2022 11:23:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdgpu: Fix recursive locking warning
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, amd-gfx@lists.freedesktop.org
References: <20220204031139.24717-1-rajneesh.bhardwaj@amd.com>
 <c76050e6-6bbc-bccc-01df-1825ecd29387@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <c76050e6-6bbc-bccc-01df-1825ecd29387@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::23) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12e1d477-e50b-42af-6b4c-08d9e7faa1bb
X-MS-TrafficTypeDiagnostic: DM6PR12MB3753:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3753EDE2CD8262B62011CB8892299@DM6PR12MB3753.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 47AxXM5GeHJuSBn6SDxUjBRPKGcSYIk2bW3a+VFYEAbO8aaU0rskR8kybP5CLO9BQT9ZDgKJsKkhUGpRN3MZ9BH/UKLOpCNy7yUuFsb2EyuJCwJU1qO+2gv6u/KsQjlpM8asFBQOdqnpbf8eoklCA8vhqt382NwywnHPG1A+iM4JM2Q3GTorZANJCrQxdT1nZRePDDT2O8neFKYtHxg8hMas2fdFFGS1MlcWkpwY69t7GKgsAVlJWqntCm3E8CdGMfmtSbtrKMEsFzaL3t8ircqlnb0pz+gj9OdylYNww59XBCz5HsOnHLehPDzksa4Raw96Jkcu4aELqk6zi4tIOTq4laJSIwMCmKBc9OrgxMgu/Yvsdh3oCQ3qvizBQHRb6MsVq8UOTtwn5yqIjI4evMQGBHpwQukNmQ1L0/kWQc/CDEK+1oTdSF9t4eRiDRO/lFpc4R3BjVnkKyjsWdbBv9ynPP0bkJJw5i0h5Uh690Wu3+Q0LEcLEOlf02fTfOGe/zYmtFHW2HjzZOfqaMUEi+alJxN19goxbBXxGeQORex4P4Up6Ch8TnASKrooVCswxNTW+cNZiSkFEhaiMgIdDNoxsx/n5x+T1iGIuAM8DUF0pVq6kVQRgRXrS6vJ75xoUpHyaq/YhQSvkxjLOgKjHEH7UzBZpP8vDIMApQMHkXpCQLLIBKO48zpfLnMXS3nrSeA2DNM6nZ26T29IduDaKC/qPhradR5f+1F2Kd+UKFhEEgdw2Yu6VHlzidbmFeJr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66574015)(31686004)(316002)(2906002)(450100002)(508600001)(110136005)(186003)(36756003)(6506007)(6512007)(86362001)(66476007)(6486002)(66946007)(26005)(8936002)(4326008)(8676002)(38100700002)(2616005)(5660300002)(31696002)(44832011)(66556008)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUZMOUhsK05aTThPWDR5MStlUlVhQkcxNnRYenkyamN2NDhtNTJYMlpsbkJ6?=
 =?utf-8?B?d090aTJHZE1JRnRBQm80MFlvalUreTNMUnkyejJFdlZEbWFIRExIamFMTHp3?=
 =?utf-8?B?aGNXYy9rNk1paCtoUjR6cTY5cldENUtoT1psb3dJclB2RmJVSklJNXZZSHdI?=
 =?utf-8?B?MmwzVFRYSEYyRVZTRkFwMmFnUE5zem5hNlAzdVpLcm92SjRIMEJYWUlscUJu?=
 =?utf-8?B?UFhPTXZCOXdzY1hMeE1rZS9ERlBIbEVWenlXaTlwbFFkUUZCKzlKVUNxYith?=
 =?utf-8?B?dDJuVHBhYTVEaUsvL2ltQk4vMWRzTTZaSmRUdHJBWjY2RGpFOHNibVNSS2Nn?=
 =?utf-8?B?aUhJT1hmNTE2RHFURktBUTluaERsRXN0NTU3UUticDVNelExWWZ1MUJuVlNi?=
 =?utf-8?B?RCs4TWNqcG55bUUxaDlFU3M3d2V3a0NDSVlZUk4wc3IzQitrZGxvT09lenZh?=
 =?utf-8?B?aXZZV0taNGN1Wld5dFRmaHFBNlJ3NnQraVQyV3FOVVRvaHlOR3BoTXNxU2JY?=
 =?utf-8?B?dEVOQXdudjc4TmE3Z0FXM3p2SHFGS0dFdi91U2djaGp6VWRCVHlXQ1luK0kw?=
 =?utf-8?B?UjYwdmJ1WlBvSk1vN3hVTlBkN3ZKUk5iNkpnZzRQaHk4WFJXRnZ2bEVNZEFx?=
 =?utf-8?B?SkZ2alVnc0ZHdFdlWjdSSEM3dWJ1Sm1NOTNPVW13Q04yM1hjMzB5WWJjZlpL?=
 =?utf-8?B?MnpGTXRUT21pK3BVNEFOQWM4NGNpQi8xL240emJnL0tDVjdGaHE0SHhlL2I1?=
 =?utf-8?B?TkpMZHd0alN6V0tOTEM5SGtlLzZic3JCY1pSaThvUGgyaEhqVWtWdGpnd2pm?=
 =?utf-8?B?RkgzYnVHN0ZvY2NmVWluZXYxTm5aVDV6dEw4aGkwM3RxdjdJQUJiU1VPbm5Q?=
 =?utf-8?B?L1d3WkozUk52VEhaQTB4U2JqOWRjbnd0SVZFelhTSFptTUVlRU5mYll2SkFM?=
 =?utf-8?B?T2FIYkZnMGFCZHdZeitkVkJodWtEWVN3dXhTQ0JCbmluRmZ3bkZMYmhqR3ls?=
 =?utf-8?B?NjVTR3BmSmFCWHRpdE9VK3l6OXpoa0NwOFRiUTNOcCs3aDFjSmVFcHFQUDdu?=
 =?utf-8?B?L1kvdlYvYUdWalVqT3BqZnRGMEZtZ041S2FZcEloYlhSNVMyL1RxRTlWMjlw?=
 =?utf-8?B?UVl3SHlPbU0xMG4vdlJBSEVUeE1GdVpWZnZiRWUzT3VGRmJ3bmtvL0M2SnVj?=
 =?utf-8?B?QW0vVnZzWnhEWEZUTFE2dURGdkY3dXVxL1RoUENNRDhEVjNZdjJJS2d0eHdZ?=
 =?utf-8?B?QW1EcUpZNlBDL3F0MWVDRUZMUnN2dG9WTWg0R1h2aUVWQ3NEbmdTOUZSU1RR?=
 =?utf-8?B?U1VhaG1FTjVCTkttSmV1ZkNpQklFZTRzN3lMMWVnMnpsY3VKa0FCV25JMkh4?=
 =?utf-8?B?cC90NFo0cmhYa0hmT2hzQVE1ZGJ4WHc1Z3MzSlc4UGYyN1d0T0tIRHgyWTlV?=
 =?utf-8?B?MTFJR2l3ZjRNSnNnOHNRdlA2cWpTUFlwK1FWZFhlSG84QlUrdXlsZHF3bFVO?=
 =?utf-8?B?bWJ0dHdVbHJvV0hBKzBjVm1iR1ZCTThTeGZHbmU1VUY0YW04QndoMlp4VEE5?=
 =?utf-8?B?d3FKWHdRUUYzeVVkc0lhZXljYWQ3YU1TWVJmbm5RYS9EeEkwK2d5SUtYM1Vm?=
 =?utf-8?B?cmZVclVzdUtLQ3Z3TXhIZEFSQlN3bXF1eXRDYitiMDZoQ1lNTEl4SHBJU01y?=
 =?utf-8?B?Ryt3STJXSkh1bU1WZlE4VmthT3M0TXVvUUFMNS9zMmUralBTNko0eGdWUjAy?=
 =?utf-8?B?SDNlZmczM1krc1RJNXpZdElrSzg4a2lBMzlRYjFkR1VwdmZZSmkzdG1JNlJx?=
 =?utf-8?B?L003YkttbXc3bHY1d0NkWE05V24yT25VdkVKcm4zRmhPdUlVazdGbXJWQ3F0?=
 =?utf-8?B?dVk2MW5qMzIrODd6TC9veVIwZVV3WkZDYUxnZUhad3NoaThoOWJFRXVVTjFB?=
 =?utf-8?B?UDArbHhKK253aDgzckZJY25mTlRsZTdzVnRWUjZpRUFRcFVVRzgxeVlxY1N6?=
 =?utf-8?B?VlBEYmQwNWY1ekNzYlRRNkQ3ZnprNHJ4ZElENjNPd1g0ejRVMkNVSkhpZjRx?=
 =?utf-8?B?SnRaeHUzTmNET3h0Wm1OckhRTFVLZllTT1RRdEJBcVZTMEMxUm1rNmtLTUF6?=
 =?utf-8?B?cHJnRkRhRVVRWFFEWWZENzllUWl0c0VpTUVHYmt6T0J1U2lZVXdSVVd2d0JP?=
 =?utf-8?Q?ZATMZAi4ICXnudL98c97A+Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e1d477-e50b-42af-6b4c-08d9e7faa1bb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 16:23:09.3233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eg1KndJrYDxFneVKzd4qkZMooUfV/Byalb9Svl8A07URFHr4Q8JJJP//tk9O9/HjhGQBiAeX4e2hPV52I8LJIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3753
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-02-04 um 02:13 schrieb Christian König:
> Am 04.02.22 um 04:11 schrieb Rajneesh Bhardwaj:
>> Noticed the below warning while running a pytorch workload on vega10
>> GPUs. Change to trylock to avoid conflicts with already held reservation
>> locks.
>>
>> [  +0.000003] WARNING: possible recursive locking detected
>> [  +0.000003] 5.13.0-kfd-rajneesh #1030 Not tainted
>> [  +0.000004] --------------------------------------------
>> [  +0.000002] python/4822 is trying to acquire lock:
>> [  +0.000004] ffff932cd9a259f8 (reservation_ww_class_mutex){+.+.}-{3:3},
>> at: amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
>> [  +0.000203]
>>                but task is already holding lock:
>> [  +0.000003] ffff932cbb7181f8 (reservation_ww_class_mutex){+.+.}-{3:3},
>> at: ttm_eu_reserve_buffers+0x270/0x470 [ttm]
>> [  +0.000017]
>>                other info that might help us debug this:
>> [  +0.000002]  Possible unsafe locking scenario:
>>
>> [  +0.000003]        CPU0
>> [  +0.000002]        ----
>> [  +0.000002]   lock(reservation_ww_class_mutex);
>> [  +0.000004]   lock(reservation_ww_class_mutex);
>> [  +0.000003]
>>                 *** DEADLOCK ***
>>
>> [  +0.000002]  May be due to missing lock nesting notation
>>
>> [  +0.000003] 7 locks held by python/4822:
>> [  +0.000003]  #0: ffff932c4ac028d0 (&process->mutex){+.+.}-{3:3}, at:
>> kfd_ioctl_map_memory_to_gpu+0x10b/0x320 [amdgpu]
>> [  +0.000232]  #1: ffff932c55e830a8 (&info->lock#2){+.+.}-{3:3}, at:
>> amdgpu_amdkfd_gpuvm_map_memory_to_gpu+0x64/0xf60 [amdgpu]
>> [  +0.000241]  #2: ffff932cc45b5e68 (&(*mem)->lock){+.+.}-{3:3}, at:
>> amdgpu_amdkfd_gpuvm_map_memory_to_gpu+0xdf/0xf60 [amdgpu]
>> [  +0.000236]  #3: ffffb2b35606fd28
>> (reservation_ww_class_acquire){+.+.}-{0:0}, at:
>> amdgpu_amdkfd_gpuvm_map_memory_to_gpu+0x232/0xf60 [amdgpu]
>> [  +0.000235]  #4: ffff932cbb7181f8
>> (reservation_ww_class_mutex){+.+.}-{3:3}, at:
>> ttm_eu_reserve_buffers+0x270/0x470 [ttm]
>> [  +0.000015]  #5: ffffffffc045f700 (*(sspp++)){....}-{0:0}, at:
>> drm_dev_enter+0x5/0xa0 [drm]
>> [  +0.000038]  #6: ffff932c52da7078 (&vm->eviction_lock){+.+.}-{3:3},
>> at: amdgpu_vm_bo_update_mapping+0xd5/0x4f0 [amdgpu]
>> [  +0.000195]
>>                stack backtrace:
>> [  +0.000003] CPU: 11 PID: 4822 Comm: python Not tainted
>> 5.13.0-kfd-rajneesh #1030
>> [  +0.000005] Hardware name: GIGABYTE MZ01-CE0-00/MZ01-CE0-00, BIOS F02
>> 08/29/2018
>> [  +0.000003] Call Trace:
>> [  +0.000003]  dump_stack+0x6d/0x89
>> [  +0.000010]  __lock_acquire+0xb93/0x1a90
>> [  +0.000009]  lock_acquire+0x25d/0x2d0
>> [  +0.000005]  ? amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
>> [  +0.000184]  ? lock_is_held_type+0xa2/0x110
>> [  +0.000006]  ? amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
>> [  +0.000184]  __ww_mutex_lock.constprop.17+0xca/0x1060
>> [  +0.000007]  ? amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
>> [  +0.000183]  ? lock_release+0x13f/0x270
>> [  +0.000005]  ? lock_is_held_type+0xa2/0x110
>> [  +0.000006]  ? amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
>> [  +0.000183]  amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
>> [  +0.000185]  ttm_bo_release+0x4c6/0x580 [ttm]
>> [  +0.000010]  amdgpu_bo_unref+0x1a/0x30 [amdgpu]
>> [  +0.000183]  amdgpu_vm_free_table+0x76/0xa0 [amdgpu]
>> [  +0.000189]  amdgpu_vm_free_pts+0xb8/0xf0 [amdgpu]
>> [  +0.000189]  amdgpu_vm_update_ptes+0x411/0x770 [amdgpu]
>> [  +0.000191]  amdgpu_vm_bo_update_mapping+0x324/0x4f0 [amdgpu]
>> [  +0.000191]  amdgpu_vm_bo_update+0x251/0x610 [amdgpu]
>> [  +0.000191]  update_gpuvm_pte+0xcc/0x290 [amdgpu]
>> [  +0.000229]  ? amdgpu_vm_bo_map+0xd7/0x130 [amdgpu]
>> [  +0.000190]  amdgpu_amdkfd_gpuvm_map_memory_to_gpu+0x912/0xf60
>> [amdgpu]
>> [  +0.000234]  kfd_ioctl_map_memory_to_gpu+0x182/0x320 [amdgpu]
>> [  +0.000218]  kfd_ioctl+0x2b9/0x600 [amdgpu]
>> [  +0.000216]  ? kfd_ioctl_unmap_memory_from_gpu+0x270/0x270 [amdgpu]
>> [  +0.000216]  ? lock_release+0x13f/0x270
>> [  +0.000006]  ? __fget_files+0x107/0x1e0
>> [  +0.000007]  __x64_sys_ioctl+0x8b/0xd0
>> [  +0.000007]  do_syscall_64+0x36/0x70
>> [  +0.000004]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>> [  +0.000007] RIP: 0033:0x7fbff90a7317
>> [  +0.000004] Code: b3 66 90 48 8b 05 71 4b 2d 00 64 c7 00 26 00 00 00
>> 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f
>> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 41 4b 2d 00 f7 d8 64 89 01 48
>> [  +0.000005] RSP: 002b:00007fbe301fe648 EFLAGS: 00000246 ORIG_RAX:
>> 0000000000000010
>> [  +0.000006] RAX: ffffffffffffffda RBX: 00007fbcc402d820 RCX:
>> 00007fbff90a7317
>> [  +0.000003] RDX: 00007fbe301fe690 RSI: 00000000c0184b18 RDI:
>> 0000000000000004
>> [  +0.000003] RBP: 00007fbe301fe690 R08: 0000000000000000 R09:
>> 00007fbcc402d880
>> [  +0.000003] R10: 0000000002001000 R11: 0000000000000246 R12:
>> 00000000c0184b18
>> [  +0.000003] R13: 0000000000000004 R14: 00007fbf689593a0 R15:
>> 00007fbcc402d820
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>> Cc: Alex Deucher <Alexander.Deucher@amd.com>
>>
>> Fixes: 627b92ef9d7c ("drm/amdgpu: Wipe all VRAM on free when RAS is
>> enabled")
>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>
> The fixes tag is not necessarily correct, I would remove that.
>
> But apart from that the patch is Reviewed-by: Christian König 
> <christian.koenig@amd.com>.

I suggested the Fixes tag since it was my patch that introduced the 
problem. Without my patch, page table BOs wouldn't be cleared here, and 
it wouldn't get that recursive lock warning.

Either way, the patch is also

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


>
> Thanks,
> Christian.
>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index 36bb41b027ec..6ccd2be685f5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -1306,7 +1306,8 @@ void amdgpu_bo_release_notify(struct 
>> ttm_buffer_object *bo)
>>           !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE))
>>           return;
>>   -    dma_resv_lock(bo->base.resv, NULL);
>> +    if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
>> +        return;
>>         r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, 
>> &fence);
>>       if (!WARN_ON(r)) {
>
