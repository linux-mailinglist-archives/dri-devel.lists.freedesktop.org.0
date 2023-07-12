Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B28E6750635
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 13:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF1F10E4E7;
	Wed, 12 Jul 2023 11:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9814610E4E4;
 Wed, 12 Jul 2023 11:36:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dByBoybg5Pi7MhSs8Z/5pIx1RrWiaZ3ejNJqFWj9uWtmda3huVhkgvrIXD+vZHTSRgL96SBw7wHboZf7KfW1aAhJ2tJ4lEMcOH8USNfBpbcDhpgIyYTVna3T8Cwt8folf1TQCofUG8hqgF9+nn5G4HlIty6zACsKt/jXSa48+Z9aR6jwYeeh6kAuOUPt71TXZjl52iJ5BTcXtPzIymqd+3VzDBK9s/XMgxaK5+XuuHbxFNAk92YtsBjPthzml0UHWedT4TknkXUfRFssoV2Rd4torgwDWQ4lhN9RQRkyLKxK9IG2bK4Dk/cO6wSBoq4wkrq5rHl0F0NVsKUVzWt5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSul17yj/Gu1HsvZrPv4MHk7FBT0QuZ9jcg0G144Mt4=;
 b=EA4n1x4efairLmEbGO6sTs/U4XjagyvbhaCI7O51zu2qH0iWQTfDpBIRTaC79TtbHqcGt2/CZjDRpA6cPC2qVz1xLxYWwNOSZ5bs1z8euVomLkueJ3JSkWkuzOFUQMxahAZt26iDLEHqnBLZv63KGefatoHOPIVE5bugsCVmHFUTX7nBN3woJw63SM9kcxMi4hWAITft4kWMV1CEpEbxWeElQHiK7KzzcxIK6W0mJ7bf/ZPxT/DmCGr6TBJNpw8Qk4EuxoXbbQ7rTu2yXJCPJf1mcGXSfr8hO6acv7Rrdf4TN+JiXE5vh8mDmj0cvRzl2ALIEM4UjSKYG2XOB/wwwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSul17yj/Gu1HsvZrPv4MHk7FBT0QuZ9jcg0G144Mt4=;
 b=QJX0DqsvJxkYqhTwUvTLRL8G4/0bbKfoaZFqBK/p/Qe7VyUKpv0wFV79feLvwY/JahwORJvMFG1GUyuBQ4CAH81UADrPKK2OiKv7keLYk48qX+LK5g7orJM5IcuQ2Ei9JNa9fgP4eHz0YxhMAzl6vFbtZT+oRZHmJYCfa8Rt8rQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB6898.namprd12.prod.outlook.com (2603:10b6:303:207::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 11:36:44 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 11:36:43 +0000
Message-ID: <a1b94bd7-dc1b-d3a9-3f88-11ddd7a9c76f@amd.com>
Date: Wed, 12 Jul 2023 13:36:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/6] drm/amdgpu: Rework coredump to use memory dynamically
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230711213501.526237-1-andrealmeid@igalia.com>
 <20230711213501.526237-4-andrealmeid@igalia.com>
 <e488da74-af52-62eb-d601-0e8a13cf0e87@amd.com>
 <0e7f2b0cc29ac77d4a55d0de6a66c477d867fbf7.camel@pengutronix.de>
 <3764d627-d632-5754-0bcc-a150c157d9f9@amd.com>
 <a5a56eb095d124290b21cfb48fa1a9d002ba0c18.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <a5a56eb095d124290b21cfb48fa1a9d002ba0c18.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB6898:EE_
X-MS-Office365-Filtering-Correlation-Id: dcdc635c-7f27-4179-9f0f-08db82cc4419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: smkWSh8s1PpOxmBiMA8ZIUXXpZDscy3frINiXYSmWsD/TwySVNoKdGTCtfKyT9ZaNeGMY5FtHGRF7V+XuEY89SdYbysL0AutmqjC3tbrxoLgfsDuno3zM1emQzdTzrWeaFo6EYhXkYKC4Q4BXp/8lh2cxg7f3kb4mFLXJhMmuNzDuFUldC956bu91CSjdJK2mMb/s6yNDg9vHCtzrK1lHPidVaDQpaqQxKoD04jZICAkXCGsMDfFq0k6Y0fCycbtB9RyOlFAyLh+02ujhqV9/YvXs4UF3mJWs9QIrYMQOIKyiYOn8hTpU5Xo6aUQYcXXBtL3jxZ2YUhEw+5aBcUtjDSELX7j9SG9/eeksao3odb2blYcttNFspz7ZXlpnOVr6Iw56eRGnqjTonfpaW0Tcps1VMXZafu1djwlHhlmhSDiPEw+Ke8yZU+3PjxwnOqTdF6FonYmb/GjKpMDGtHySZ6MdSUIWMYupmGtCY+Eguap04Q9eFpizUqxslxSYA58FsFJuL3cHebwzHkzcjFutBmKTJCoXbfeX1NhdEbKKZAT3uGP2JI3l+1cB92A7dbtPfVM1B34WO1PzXpXim4/Fg0YoY+Rg0vqwTP2D8Iddsi9Z+1SJKcWJPyanbHMWxyhsZay7fcDLyp/KvHPeVZ9vQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199021)(41300700001)(4326008)(66476007)(66556008)(66946007)(2906002)(7416002)(38100700002)(5660300002)(8936002)(86362001)(8676002)(31686004)(316002)(478600001)(31696002)(6666004)(6486002)(6512007)(36756003)(83380400001)(6506007)(66574015)(186003)(110136005)(54906003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG00VHlQMGhESzJ3T3U4MWZubHQrOFFoQ25takhyS24zL0hNZUJnbzBDWi9G?=
 =?utf-8?B?YTR4RlB2UUM0dkhHcDMwREJZZ25CNkF6UEdSbXV2bmhQV29QVExCQU53eWRY?=
 =?utf-8?B?ckUwVGsvY0R2bjQ1Tm9ZWGNYNVREM25HRHdLU01kT3VoYnVRY3gwUGdUVlRq?=
 =?utf-8?B?S3dHRjZwVHJVdU5JVnBPUmNCbkFOTTdZbDVaOXBQQXF3OWpVL1RNSHpiNVpj?=
 =?utf-8?B?MDVKMFVxRDFFd1lKbEtsR0tQYzRXTG9VTFFpemZsd2pVS2ZaN0NoVTVlakI4?=
 =?utf-8?B?aFczeEZ3QmZOZmc4TGNadC9meGRhWE1lRkRRYmZGbUZIdnUxK1BicU52QU1G?=
 =?utf-8?B?dm4wKzlReXFZTGl5czNoS1kxVzlrblgrWGRaMUU1UThDSWRuS0FLRm0vU0VM?=
 =?utf-8?B?NE1lL0dIV3hLOHFTU0p1MnBEZjlTSGxaWEtwV05udWJqMkJVaWlVdGZINmpi?=
 =?utf-8?B?SnpYQ0Q2QllQaTVZUmkzalVQU1E3RG1pcFhiRWluWkhhOS81dWRqbXN0SkNN?=
 =?utf-8?B?S2puRUJhWmRZYzc5TGdvTWI5MmU4K2NucWd1NFBOV2tBcUJwV0pieDhtVlFi?=
 =?utf-8?B?RDdwdWxLRlpZUkRsR0E5RlRMa3k2OEpXZElFaEh3bmdJWmlMcnlXVGpsTGh3?=
 =?utf-8?B?end6a3JHRS9MV2JmNDVhVS9CNFd0ZktsSG4vSjYvNDN1c2t5RVVTY2VyUWFM?=
 =?utf-8?B?TytwRDVBQUh1Ty9vaXBYUDNhcDRQeUlJQ3BUdXNUb2JabitKaExXOHpiVWVm?=
 =?utf-8?B?U1BOdnorcFVwbTJTTWlpYURDV1V1bEpVQXhVbU8vL3Uxb1JzU0svcGVVZlhu?=
 =?utf-8?B?SmR2M01iTnpYMUsyWkFZRnZQWTJaTG42Y2h0UlJpTUhPZGZhVWJzYUVCOUk4?=
 =?utf-8?B?Y29oWFB5V2d2Um5VT29tOS8ycitVNFB1d1p1TGNQRTBvS0tlOWc2cENFeHJ3?=
 =?utf-8?B?enFpV1Boc0Qyakwydi8zM29nTXlIY1Fobkp3M242QkZ3ajMxcUlpYVBxS3Jw?=
 =?utf-8?B?MnBhSUhJNXV4YkJGRXF0M2dONnN2WFdIWlZJOE9JRGppcDlKUGVxQXdtQytN?=
 =?utf-8?B?R0FQTksxNjJxLzJ4ZHNFWmx2UWNuSWJ5djV0ZlJwdXJkbXE3RlZTS094MUhZ?=
 =?utf-8?B?cVJtK0pxMHdNZmNESWFiNXoyazNlU0NlUE5nRFdPcnJaV1RVMXNUQU1vemZh?=
 =?utf-8?B?dUQ2bG9GaGpMWVg0SFdjemVWRG83OHFoS1dJSlFWT1BPblRJVlF1ODJwaUZV?=
 =?utf-8?B?NWVEQ0Z6ekhrRzAwVnJNZHRmSVZWTWg1MnJTTWVzM1dtUElveWIwMm5kUTli?=
 =?utf-8?B?emlDaG96REtJSDM1bnRMV3RxOGJXL2c0dlZRaVQ5Qkp4Wm5TZWFLNzk1d0JS?=
 =?utf-8?B?cThNMTZ5dEtUWXh6VEE5RS84ZHVxL09BK3UyR0JRRTIxLzFQR1Mza2tPdWdJ?=
 =?utf-8?B?c0pNYjMwSTBUSE9DaVZ1bWpROFJFbWZoazk5UGorOU95elZOY01wNlk1NVI2?=
 =?utf-8?B?Z0xaUUhDZVpTL0xoL2w5blNsbSs4M2NIdG9wOW5rT1dmQmpRdFc5a0V1Z1Rs?=
 =?utf-8?B?TFlDOG9QeWM3QWhtOUxnd292SkRXNWh0RkZhK3p5ZnlsWEJzcGsvSDNJR2Vu?=
 =?utf-8?B?eVVzRG1Jc1p5UTNTd28xSmk0V3NWQUhVMCtoUFhvNHdxdXVGeGh6TmFJQlhW?=
 =?utf-8?B?U3JTQUVaVHpxOE9IUFJzQTd4Y21YSWtEZkcxamNlTGVRMnUwWkxib3NuMzZw?=
 =?utf-8?B?OWJxN3gySWRMeVluZUJDZE9taUpLbXlNenZqY2ZoMGVzZEt0WWVMR0pjb3Bq?=
 =?utf-8?B?Q1VDTjk2SllnWWd5OVo0RXZQNlNyMW9mQWdPcEduSi9JdE0ySERSUVVPT0Rm?=
 =?utf-8?B?V2pnSVplQXdyWDFMRGRTQzNhVUd0NmR6QVh5Y204NXVYYS8zcUhHMnNvWGhp?=
 =?utf-8?B?MHhJbmFKYTJmWXZkcnlwT3ZWQk9URkJuRXRRM0J4TUx0VnRQSmVxN21FOFFm?=
 =?utf-8?B?SGpIUWNTVGdFa0pNaG9hc0tDZGp3N1YrWlhZclpnejEzdVlTMDQxc1hJdWdT?=
 =?utf-8?B?WHRKYjdpZEEvcWRaMm8wMmoybkQ2emZ2TzlzSmVRdWVTRWoxeS96cGdyVzUz?=
 =?utf-8?B?OGd1RkNnVnIrc1BDV0lvQU5qdTBFbjI3WC9XY2hWQlZ4K2o5VDk4aWdmaDlt?=
 =?utf-8?Q?7dD5JVp3LAlvOG6u8Urp/0EYf4LWitC9hFSwP3xv3Zdw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcdc635c-7f27-4179-9f0f-08db82cc4419
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 11:36:43.3122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uG1Pps8dnftfNkX06JwgOOH3x3wDeTRpkHeJLbhTKUNGuNumXASBzObreIL9KAOf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6898
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 michel.daenzer@mailbox.org,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.07.23 um 12:56 schrieb Lucas Stach:
> Sorry, accidentally hit sent on the previous mail.
>
> Am Mittwoch, dem 12.07.2023 um 12:39 +0200 schrieb Christian König:
>> Am 12.07.23 um 10:59 schrieb Lucas Stach:
>>> Am Mittwoch, dem 12.07.2023 um 10:37 +0200 schrieb Christian König:
>>>> Am 11.07.23 um 23:34 schrieb André Almeida:
>>>>> Instead of storing coredump information inside amdgpu_device struct,
>>>>> move if to a proper separated struct and allocate it dynamically. This
>>>>> will make it easier to further expand the logged information.
>>>> Verry big NAK to this. The problem is that memory allocation isn't
>>>> allowed during a GPU reset.
>>>>
>>>> What you could do is to allocate the memory with GFP_ATOMIC or similar,
>>>> but for a large structure that might not be possible.
>>>>
>>> I'm still not fully clear on what the rules are here. In etnaviv we do
>>> devcoredump allocation in the GPU reset path with __GFP_NOWARN |
>>> __GFP_NORETRY, which means the allocation will kick memory reclaim if
>>> necessary, but will just give up if no memory could be made available
>>> easily. This satisfies the forward progress guarantee in the absence of
>>> successful memory allocation, which is the most important property in
>>> this path, I think.
>>>
>>> However, I'm not sure if the reclaim could lead to locking issues or
>>> something like that with the more complex use-cases with MMU notifiers
>>> and stuff like that. Christian, do you have any experience or
>>> information that would be good to share in this regard?
>> Yeah, very good question.
>>
>> __GFP_NORETRY isn't sufficient as far as I know. Reclaim must be
>> completely suppressed to be able to allocate in a GPU reset handler.
>>
>> Daniel added lockdep annotation to some of the dma-fence signaling paths
>> and this yielded quite a bunch of potential deadlocks.
>>
>> It's not even that reclaim itself waits for dma_fences (that can happen,
>> but is quite unlikely), but rather that reclaim needs locks and under
>> those locks we then wait for dma_fences.
>>
>> We should probably add a define somewhere which documents that
>> (GFP_ATOMIC | __NO_WARN) should be used in the GPU reset handlers when
>> allocating memory for coredumps.
>>
> Hm, if the problem is the direct reclaim path where we might recurse on
> a lock through those indirect dependencies then we should document this
> somewhere. kswapd reclaim should be fine as far as I can see, as we'll
> guarantee progress without waiting for the background reclaim.
>
> I don't think it's appropriate to dip into the atomic allocation
> reserves for a best-effort thing like writing the devcoredump,

Yeah, that was also my concern the last time we discussed this.

> so I think this should be GFP_NOWAIT, which will also avoid the direct
> reclaim path.

Yeah, good idea. I wasn't aware that this existed.

Regards,
Christian.

>
> Regards,
> Lucas
>
>> Regards,
>> Christian.
>>
>>> Regards,
>>> Lucas
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>>> ---
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 14 +++--
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 65 ++++++++++++++--------
>>>>>     2 files changed, 51 insertions(+), 28 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>> index dbe062a087c5..e1cc83a89d46 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>> @@ -1068,11 +1068,6 @@ struct amdgpu_device {
>>>>>     	uint32_t                        *reset_dump_reg_list;
>>>>>     	uint32_t			*reset_dump_reg_value;
>>>>>     	int                             num_regs;
>>>>> -#ifdef CONFIG_DEV_COREDUMP
>>>>> -	struct amdgpu_task_info         reset_task_info;
>>>>> -	bool                            reset_vram_lost;
>>>>> -	struct timespec64               reset_time;
>>>>> -#endif
>>>>>     
>>>>>     	bool                            scpm_enabled;
>>>>>     	uint32_t                        scpm_status;
>>>>> @@ -1085,6 +1080,15 @@ struct amdgpu_device {
>>>>>     	uint32_t			aid_mask;
>>>>>     };
>>>>>     
>>>>> +#ifdef CONFIG_DEV_COREDUMP
>>>>> +struct amdgpu_coredump_info {
>>>>> +	struct amdgpu_device		*adev;
>>>>> +	struct amdgpu_task_info         reset_task_info;
>>>>> +	struct timespec64               reset_time;
>>>>> +	bool                            reset_vram_lost;
>>>>> +};
>>>>> +#endif
>>>>> +
>>>>>     static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
>>>>>     {
>>>>>     	return container_of(ddev, struct amdgpu_device, ddev);
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> index e25f085ee886..23b9784e9787 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> @@ -4963,12 +4963,17 @@ static int amdgpu_reset_reg_dumps(struct amdgpu_device *adev)
>>>>>     	return 0;
>>>>>     }
>>>>>     
>>>>> -#ifdef CONFIG_DEV_COREDUMP
>>>>> +#ifndef CONFIG_DEV_COREDUMP
>>>>> +static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
>>>>> +			    struct amdgpu_reset_context *reset_context)
>>>>> +{
>>>>> +}
>>>>> +#else
>>>>>     static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>>>>>     		size_t count, void *data, size_t datalen)
>>>>>     {
>>>>>     	struct drm_printer p;
>>>>> -	struct amdgpu_device *adev = data;
>>>>> +	struct amdgpu_coredump_info *coredump = data;
>>>>>     	struct drm_print_iterator iter;
>>>>>     	int i;
>>>>>     
>>>>> @@ -4982,21 +4987,21 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>>>>>     	drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
>>>>>     	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
>>>>>     	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
>>>>> -	drm_printf(&p, "time: %lld.%09ld\n", adev->reset_time.tv_sec, adev->reset_time.tv_nsec);
>>>>> -	if (adev->reset_task_info.pid)
>>>>> +	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec, coredump->reset_time.tv_nsec);
>>>>> +	if (coredump->reset_task_info.pid)
>>>>>     		drm_printf(&p, "process_name: %s PID: %d\n",
>>>>> -			   adev->reset_task_info.process_name,
>>>>> -			   adev->reset_task_info.pid);
>>>>> +			   coredump->reset_task_info.process_name,
>>>>> +			   coredump->reset_task_info.pid);
>>>>>     
>>>>> -	if (adev->reset_vram_lost)
>>>>> +	if (coredump->reset_vram_lost)
>>>>>     		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>>>>> -	if (adev->num_regs) {
>>>>> +	if (coredump->adev->num_regs) {
>>>>>     		drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value:\n");
>>>>>     
>>>>> -		for (i = 0; i < adev->num_regs; i++)
>>>>> +		for (i = 0; i < coredump->adev->num_regs; i++)
>>>>>     			drm_printf(&p, "0x%08x: 0x%08x\n",
>>>>> -				   adev->reset_dump_reg_list[i],
>>>>> -				   adev->reset_dump_reg_value[i]);
>>>>> +				   coredump->adev->reset_dump_reg_list[i],
>>>>> +				   coredump->adev->reset_dump_reg_value[i]);
>>>>>     	}
>>>>>     
>>>>>     	return count - iter.remain;
>>>>> @@ -5004,14 +5009,34 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>>>>>     
>>>>>     static void amdgpu_devcoredump_free(void *data)
>>>>>     {
>>>>> +	kfree(data);
>>>>>     }
>>>>>     
>>>>> -static void amdgpu_reset_capture_coredumpm(struct amdgpu_device *adev)
>>>>> +static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
>>>>> +			    struct amdgpu_reset_context *reset_context)
>>>>>     {
>>>>> +	struct amdgpu_coredump_info *coredump;
>>>>>     	struct drm_device *dev = adev_to_drm(adev);
>>>>>     
>>>>> -	ktime_get_ts64(&adev->reset_time);
>>>>> -	dev_coredumpm(dev->dev, THIS_MODULE, adev, 0, GFP_KERNEL,
>>>>> +	coredump = kmalloc(sizeof(*coredump), GFP_KERNEL);
>>>>> +
>>>>> +	if (!coredump) {
>>>>> +		DRM_ERROR("%s: failed to allocate memory for coredump\n", __func__);
>>>>> +		return;
>>>>> +	}
>>>>> +
>>>>> +	memset(coredump, 0, sizeof(*coredump));
>>>>> +
>>>>> +	coredump->reset_vram_lost = vram_lost;
>>>>> +
>>>>> +	if (reset_context->job && reset_context->job->vm)
>>>>> +		coredump->reset_task_info = reset_context->job->vm->task_info;
>>>>> +
>>>>> +	coredump->adev = adev;
>>>>> +
>>>>> +	ktime_get_ts64(&coredump->reset_time);
>>>>> +
>>>>> +	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
>>>>>     		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
>>>>>     }
>>>>>     #endif
>>>>> @@ -5119,15 +5144,9 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
>>>>>     					goto out;
>>>>>     
>>>>>     				vram_lost = amdgpu_device_check_vram_lost(tmp_adev);
>>>>> -#ifdef CONFIG_DEV_COREDUMP
>>>>> -				tmp_adev->reset_vram_lost = vram_lost;
>>>>> -				memset(&tmp_adev->reset_task_info, 0,
>>>>> -						sizeof(tmp_adev->reset_task_info));
>>>>> -				if (reset_context->job && reset_context->job->vm)
>>>>> -					tmp_adev->reset_task_info =
>>>>> -						reset_context->job->vm->task_info;
>>>>> -				amdgpu_reset_capture_coredumpm(tmp_adev);
>>>>> -#endif
>>>>> +
>>>>> +				amdgpu_coredump(tmp_adev, vram_lost, reset_context);
>>>>> +
>>>>>     				if (vram_lost) {
>>>>>     					DRM_INFO("VRAM is lost due to GPU reset!\n");
>>>>>     					amdgpu_inc_vram_lost(tmp_adev);

