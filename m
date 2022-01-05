Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16A3485691
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 17:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D449A1121BE;
	Wed,  5 Jan 2022 16:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2074.outbound.protection.outlook.com [40.107.95.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C973F1121BE;
 Wed,  5 Jan 2022 16:16:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L33vLOW0ftzFkc+2mkvHZY4tqzm4X2/9cBZABjDYAR0CGwJwVydkLxYE33TRtN7dv8Bsaayg3j+QzGwkGCLuuyLr/fvD5NHWscP3kPKGHEZgymxnq2MhEtMwWm+wq/svZYQ+Pb2ThJvtEiA2UPQGvCxvmPD2xFM4VIScGDqK5D886RKLCu702KJEpl1GSQSwbYUxDdS6FpKDc2dSpywII4gI7AoX9TTQTE8eIFpGK8+xPcTovuM4PMJzE5BgOtKatrQV5ZzZFgCq71BkDcy69l+nKN5vNlwLT0Ff0IwTWMUukmMiu7Ypsv+jxHAxbjD9ciHDdm4UsbKG5JUjc+K5Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEwUz8t5/ZnazmqCebPa/ZMDXVl8rNRa4J7nnf46xZQ=;
 b=jHxNtefA06Tsf8B/FtM8Xb0xN5wKREESwvD2OXZOTpTzBefLRdz5dEYHo1QwlUZWfP3Z2tnXmXeArBZXBBk2jOiJSNM+a0QyO/CN1TCoaDin2rJDTSzHiq/86Es/+nvBCUlBYS++B2uT+/Gkj7RReRvSGJfIZSi7srtDsZVFQyNLeqE1X8m5OmcLBODKtOuKc+UULFyePcpYlNJ8ZMc7zuk6oCc9FOi/km7+FWU05moKEeaQxZ7sNdT//MB7doc/p/x7hqffax0x1R6iUdfJUCk6CHX7tbd2YnDgelwfcpznagi4gitzYwOiVbHYgcTcM2tPNnp9qRRUVZZuTJ+61w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEwUz8t5/ZnazmqCebPa/ZMDXVl8rNRa4J7nnf46xZQ=;
 b=uwMnl2VX8YrtUXAN23YYkn3+1Wd1TyU1VxO/GCYxfhlZqpm75fIdImXif3itz+RbM+ScBpQl985vvwXzkrMlM46uw4a1K1IF/o4VoDQ0htO5wrsKAL/0o4RyoRMKqCTiUiDrVGbQOxcv5zskNO1pIp6xxnNppI62PES/L4nlqCM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5227.namprd12.prod.outlook.com (2603:10b6:408:100::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17; Wed, 5 Jan
 2022 16:16:28 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 16:16:28 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>,
 Adrian Reber <adrian@lisas.de>
References: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
 <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
 <58d61e47-3796-3147-db6c-ea7912d16902@amd.com>
 <de272de9-3f4a-db40-699a-41394cb699dc@amd.com>
 <cb5668d4-a13d-3b0b-442a-bfe1b3a7239a@amd.com>
 <000edeaf-8a89-ea4d-5b9a-2bd7758f675c@amd.com>
 <f00f2f16-f0b3-cb54-f88e-d53353bfdb79@amd.com>
 <f4527002-ec6d-5279-3b79-1aacb6cc55cc@amd.com>
 <YcBM3PMz7J90F3LQ@phenom.ffwll.local>
 <9d1030c2-2269-cfdd-bbb0-9c3d5995841a@amd.com>
 <YcOQN/l7W66W/X0f@phenom.ffwll.local>
 <a5c769fd-7eac-2628-a36d-fedddfb7d398@amd.com>
 <279c7ffc-99e5-f052-5de1-9b957c455d85@amd.com>
 <1ab2558b-1af0-3319-dce6-b805320a49d0@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <60760210-3b3d-952c-2637-4d70fab1a857@amd.com>
Date: Wed, 5 Jan 2022 11:16:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1ab2558b-1af0-3319-dce6-b805320a49d0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0079.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::18) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ff05ee8-8879-4354-e8e3-08d9d066ba85
X-MS-TrafficTypeDiagnostic: BN9PR12MB5227:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5227C9223AE89B3E4E3D6F99924B9@BN9PR12MB5227.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EeIe87TQKIRO92gmCug3MnAVkdgVohjvHW0bDBL8jmS3Xo1TIBfqDxX5HWlcLMOAgn6wlMFFZWKe1Ss4qweqfsChpWTKK5W+Z1tK1QryBmpwzsIdq+39+15BugmJ0H0ZsvtbPfsBbQJwN/W9945FpTTw369LuFBvgHHif8m99p1p0woxVKrarccI+Ven9fxjhvWkQ6VofLUlJWSdnjEpVIRC80aEbhPd9i/iOKoR/EC3pKTrHfqA85N97+BPGwFKStyotHRfNHJOo80R+hsdKe5Lk4Yk5S1DVhNdw8naVDb6kjz6XKIv2Z7IW91Ms8MMwAvtQHRGz88X5ilar3hXP9OVFRMCAoPw+UlxV9IegI8ygrNrinKkYgBQuK5QK77nZCGDDgrXJX4elAkslwB5g6NeG2kzCIcqqt6iJWz9+gt3OwCzXHYveOTaUVEXTCAbrCdpMyLRzdP6uFgwFQeODNuB8r5GczXKERY/uEW0hfvPTdeZ5jm2njzYbxFnjCJK7Jl9xPU3TzXs7KiCaHilEfoAVF3PFOyBBHt7M2R7fJfnForS1jQCKKySbdgZtlbMlCf1H71+iJyubJAfqn/HZK/RTr0FWAfpOd12IajDQXw4PaWYNXV5A92aetzl9iNaTDjdX1lOJi7rVv2v0qcCnbCTlMVx193TIGbtnqChDAl+uMK83+GcBbpNtPu9b2CCWOYoYPPkrvgHMH1AXvrfoZHMEoVKio0T/gNwtLTzXwJFxgNHyFhv68+sEavCiSH3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(36756003)(110136005)(66476007)(4001150100001)(8676002)(4326008)(2616005)(44832011)(66946007)(38100700002)(66574015)(6486002)(5660300002)(508600001)(2906002)(6512007)(8936002)(31696002)(66556008)(26005)(316002)(83380400001)(6506007)(31686004)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkUvcnFJZ0dJRi9yOHR6Y3NnTjZETDdER0lQVW5NQ2JrbUtQcFJjVXFvYkZD?=
 =?utf-8?B?czFkb05kbEVZSmFrM0c2TDlIdks1UlQ3SGsrWDFHNUIvK0psM1NnUHRTV1Fp?=
 =?utf-8?B?SXltbWh3U2Jpa3VybmRpdEVDM2lQUjVlSkhUS2MrUlFqRGdqZ3dPVy9OQ3Rm?=
 =?utf-8?B?WFBseFh0YmZFVUJwOFlmbEFlOFVaNWg0YmhqTHIyV2pQeEdZMEV1c2JLRjU1?=
 =?utf-8?B?YkRJZTE3U0ZHaFJvVlhFTGpKM0N0azFDb2gzRi95UDNzK2RlR2tpMG5HSkdX?=
 =?utf-8?B?UzBsSzJoM3gzWnhydXZ4VDZzbnlkU2lvaENOUjJYa1krR1JEbTFqM3ZZZHhC?=
 =?utf-8?B?aTJicTkydDd0V3NoU1JBQ2E5Z3Z2SFBNSVpvQzd4UEp3eE1jQ055dkVJUTlI?=
 =?utf-8?B?NmRuMEZ5dmpiNFR3MTRRNnYvOEJIRjFIRFpPK2I0ekl1MzBiVDR2NmMyNHgz?=
 =?utf-8?B?RElqOEFwd2tybit3NHZtTkU1MkZoQ0wwWDl5NFZYMTlzbEhVU002YzFBcUY0?=
 =?utf-8?B?bVNDcFdsMU5tK0pmc20vc2tIanV0REVFYzlNM2Qwb3lXVG5GWDZra2pLcmxK?=
 =?utf-8?B?TC9tL2xGekVSQkQ0bFErVUs0YXAyRlUvb2VYUUQ0akdLR29MejA3Nml3YmQ5?=
 =?utf-8?B?VlV4L0QzdWZxVXRZU3E1WHFGcTNmTitqZWEvZFptMzYxaHVqNm9HMW96WDRl?=
 =?utf-8?B?VThsWjVCOXBzVVc4SWJzQmpGcW10Y2hQT0RlS2VZSHJSWFBMWTZ2ZHRzZDFO?=
 =?utf-8?B?T2RnQlI2Q0J3S3V3V08xcnFSV0JQQjl0ZHF2VXdXYTV6YVowbkRubU1YS0NV?=
 =?utf-8?B?bjdsTVRQcWxwa3ZoSzdwZzE0SEpmWEp5QlBBc1FWY1dSUUd0Z3BvSURXNFFw?=
 =?utf-8?B?M3gvRm50b0JVYVpzaGdXWmc0Zld6aWlHSEYzQTZtNkFaa0tJaHZSUWhOL1By?=
 =?utf-8?B?NXZBajZIbGNtUFIzQ1JMQTRWb1B2cGxlandvdTZmTUw0S3krMGVwYkpmMFMy?=
 =?utf-8?B?NFdiNWxaak5SSU81NkFGYU15S3pKek5JSmQycFJtTUF0Z0NDSXU5ZDFpUk16?=
 =?utf-8?B?RDFRbDVveHdxSnlCckZ2ZG8zNDYvM25FTmgwaFVVUFl2cTFPeVIyWHFtc1Bt?=
 =?utf-8?B?S05IUjV6OVoxaHl1cXhjajk0N2FrWjdhM0lmTTZsdldDZ2lTdldlQ2YvTUFa?=
 =?utf-8?B?bmkrN0drYS8xV3VTWG1xSTc0aWViRCtiZ1lJenVFQ2hwa2RqNHhqZlpTOWY3?=
 =?utf-8?B?czFmNWMvZURENkNvS1ZWZGJRMWZIRXFweUU2WTlUeE1zSjRUZGptU0JlUXRl?=
 =?utf-8?B?bG8xdzJHWTVmYmZuUFBaOGtUbkNGZmFjU3l1UERHY29yRzJSTGdOcStpYmJV?=
 =?utf-8?B?djdYTG9Iam54RTNoSFNBSFdtQW1HbGs2ZmZVOXJSSlhjcWF3bkpIZXlSaWpV?=
 =?utf-8?B?M2V0NTFEMkhFVDA4UTQxWWZ2bG9ETTVuSVNZZW9tYmVwemtsVEowVGdka0JC?=
 =?utf-8?B?cjZSRDc4Mm52SWpGMlAwQ2NvSitzcHhSNEdLSDExMkoyVmVqS2FFV0hsT0VF?=
 =?utf-8?B?V29LR055M0JSaHRTellXd2xzZmZEYXVJWW1XNHk0c2FaYnRxL3hnMUVTWUt4?=
 =?utf-8?B?b0dqeXU5VjBDZkRQOE4ySWp3UHQ2U3dtT3Q3ckZ5M3Zjei80bVhYYVVqUTMr?=
 =?utf-8?B?dU1xLzVzbGtzVkV0MUMyaUs2c2oxTGtpRmdGcW95enBxeWtrQzVQbDNIQm1i?=
 =?utf-8?B?T2RHVlhNeElodXhJemdjRVFpeFNMVE54YXlYMnRTWEM3Mmo4bjhpdUVXNG1D?=
 =?utf-8?B?MDVZTU9SMHhyb2ZUV2V2NVg5eVkvRm54RFF6QndRcWVOcXhaa0VqdmozRFE4?=
 =?utf-8?B?Umd0SEwrM1EyTTd3UC9MZG1udGNiWE5LVEg2UENFVXFXeUNjb256bkRrdU5L?=
 =?utf-8?B?bDhpU3RNOHE1RTlXeUFQNStuRVdsTk5rSmxWRzREVHhkS21FYjRwSVZEME8z?=
 =?utf-8?B?d0MweDVVVjJWcTlGYnFmM2d3NjhlZDNVKzlmZmpUZHJmd2NldzJzUkNpa014?=
 =?utf-8?B?bys1QktUS1dldU9zY1pJYjFTN2lmeVhIVDQrNDBOQzJJTkJzbXV0NjdOcGVk?=
 =?utf-8?B?OWhmZ0hUaTRZV01Pelc4SGM0R1I1d1NiVEcwdndCbzVHek5ZR3M1Z01Fa3VS?=
 =?utf-8?Q?+vLS+RpaNjgiFaSuj7oIiPY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff05ee8-8879-4354-e8e3-08d9d066ba85
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 16:16:28.6246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XhGjCxANbOKElq1K+9qKVgAWmEGJKIgZ7PJoq5MvO5LBuStOtWlkE+NnpUNDURS1f2gjSU1CvGihVBUNKRtF4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5227
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
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 David Yat Sin <david.yatsin@amd.com>, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-01-05 um 3:08 a.m. schrieb Christian König:
> Am 04.01.22 um 19:08 schrieb Felix Kuehling:
>> [+Adrian]
>>
>> Am 2021-12-23 um 2:05 a.m. schrieb Christian König:
>>
>>> Am 22.12.21 um 21:53 schrieb Daniel Vetter:
>>>> On Mon, Dec 20, 2021 at 01:12:51PM -0500, Bhardwaj, Rajneesh wrote:
>>>>
>>>> [SNIP]
>>>> Still sounds funky. I think minimally we should have an ack from CRIU
>>>> developers that this is officially the right way to solve this
>>>> problem. I
>>>> really don't want to have random one-off hacks that don't work across
>>>> the
>>>> board, for a problem where we (drm subsystem) really shouldn't be the
>>>> only
>>>> one with this problem. Where "this problem" means that the mmap
>>>> space is
>>>> per file description, and not per underlying inode or real device or
>>>> whatever. That part sounds like a CRIU problem, and I expect CRIU
>>>> folks
>>>> want a consistent solution across the board for this. Hence please
>>>> grab an
>>>> ack from them.
>>> Unfortunately it's a KFD design problem. AMD used a single device
>>> node, then mmaped different objects from the same offset to different
>>> processes and expected it to work the rest of the fs subsystem without
>>> churn.
>> This may be true for mmaps in the KFD device, but not for mmaps in the
>> DRM render nodes.
>
> Correct, yes.
>
>>> So yes, this is indeed because the mmap space is per file descriptor
>>> for the use case here.
>> No. This is a different problem.
>
> I was already wondering which mmaps through the KFD node we have left
> which cause problems here.

We still use the KFD FD for mapping doorbells and HDP flushing. These
are both SG BOs, so they cannot be CPU-mapped through render nodes. The
KFD FD is also used for mapping signal pages and CWSR trap handlers on
old APUs.

Those VMAs aren't causing the problem. They still map successfully on
restore.


>
>> The problem has to do with the way that DRM manages mmap permissions. In
>> order to be able to mmap an offset in the render node, there needs to be
>> a BO that was created in the same render node. If you fork a process, it
>> inherits the VMA.
>
> Yeah, so far it works like designed.
>
>> But KFD doesn't know anything about the inherited BOs
>> from the parent process.
>
> Ok, why that? When the KFD is reinitializing it's context why
> shouldn't it cleanup those VMAs?

That cleanup has to be initiated by user mode. Basically closing the old
KFD and DRM file descriptors, cleaning up all the user mode VM state,
unmapping all the VMAs, etc. Then it reopens KFD and the render nodes
and starts from scratch.

User mode will do this automatically when it tries to reinitialize ROCm.
However, in this case the child process doesn't do that (e.g. a python
application using the multi-processing package). The child process does
not use ROCm. But you're left with all the dangling VMAs in the child
process indefinitely.

Regards,
  Felix


>
>> Therefore those BOs don't get checkpointed and
>> restored in the child process. When the CRIU checkpoint is restored, our
>> CRIU plugin never creates a BO corresponding to the VMA in the child
>> process' render node FD. We've also lost the relationship between the
>> parent and child-process' render node FDs. After "fork" the render node
>> FD points to the same struct file in parent and child. After restoring
>> the CRIU checkpoint, they are separate struct files, created by separate
>> "open" system calls. Therefore the mmap call that restores the VMA fails
>> in the child process.
>>
>> At least for KFD, there is no point inheriting BOs from a child process,
>> because the GPU has no way of accessing the BOs in the child process.
>> The child process has no GPU address space, no user mode queues, no way
>> to do anything with the GPU before it completely reinitializes its KFD
>> context.
>>
>> We can workaround this issue in user mode with madvise(...,
>> MADV_DONTFORK). In fact we've already done this for some BOs to avoid a
>> memory leak in the parent process while a child process exists. But it's
>> slightly racy because there is a short time window where VMA exists
>> without the VM_DONTCOPY flag. A fork during that time window could still
>> create a child process with an inherited VMA.
>>
>> Therefore a safer solution is to set the vm_flags in the VMA in the
>> driver when the VMA is first created.
>
> Thanks for the full explanation, it makes much more sense now.
>
> Regards,
> Christian.
>
>>
>> Regards,
>>    Felix
>>
>>
>>> And thanks for pointing this out, this indeed makes the whole change
>>> extremely questionable.
>>>
>>> Regards,
>>> Christian.
>>>
>>>> Cheers, Daniel
>>>>
>
