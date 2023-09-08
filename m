Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2605F798472
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 10:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B36C10E056;
	Fri,  8 Sep 2023 08:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAC210E02E;
 Fri,  8 Sep 2023 08:52:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjbfVdQOIIPBbahQmwnqd4Nk65/uP9XkvBYbmxVTXjxMudFb+i8eqw71/Y0DwjGhz91mrE4ZdMjbVnYX4wNumh7O/+yXjUhYUyCIm7C6gAbmg0FwiPI4p1HYfiA//eFeXuYxQ9jGlhad65U6P7CXwHvjfFPUSBkteKzMmTZbd8HEpngRUDy5mbHK/0+JxbDRtQBXujaKsRxGahGbsJsfVzy+R9SeaLJ7Hezm0j6gI/o0HG9RxhkLQ26fF0kT2cqmPKqZNVghj26Pv3Bx5rIF/K5hOrFiw1MhhjYVKNe3t9Ca+tRPXWNZuL+RcwJcRx21o3Cl2pcm/RgmOWgMz5EwNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhVTRHK4cq3xdv55YAkIBx5YGtxOG0ti5I4gIILvXIQ=;
 b=ZmQTcfBw+O9QB/QPFtB/x9Ac/vRbPuJHwGZllXcQLMF1LIBs+sIMjraOlrcbIaNqe+3YtVorCcMe0poxUZLbDZNexCEuznF7ZLya+SQG8A/4sLnHoqfmFevEp6B+0wKWMutYEdiCBTI2G1PKqbJN631PPcHqKlwjRdKhWTrJZnOHwFJi80zwDusSMn5UQt1S7Iz7pxh8Si3Sa+2Vw2E5/zSH+wZQX+b7XG0cZD3JtJ9gmWMTW8D0hn21adDxyzwbKPAgemFh4ZVJWluMADuyTOlwi7n7m3HfkzDvmBrLQpUv2sA+sgWHS8EZb84lLVZfw3IQ2V0Bn6w2GUXzjR/DNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhVTRHK4cq3xdv55YAkIBx5YGtxOG0ti5I4gIILvXIQ=;
 b=CSWMZNd0jCv3+yCoYovXOijk2dIMpgFl3g49ZhPM1ZfQdwZOnTeprDPqSSaWBESZA6JNyon01JPFw9SihvVFeh1l/BnVayo1ZJrokLSmOjmdCM5EjImKKGkIzCP7ojKhBdnqUbg8NetbdKjutR86nevq/idusmVZcemBsLdYCq0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB7013.namprd12.prod.outlook.com (2603:10b6:303:218::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Fri, 8 Sep
 2023 08:52:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 08:52:24 +0000
Message-ID: <ab9f3c50-8098-bbbf-50e2-a1ba63595a47@amd.com>
Date: Fri, 8 Sep 2023 10:52:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 0/2] drm/tests: Fix for UAF and a test for drm_exec
 lock alloc tracking warning
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230907135339.7971-1-thomas.hellstrom@linux.intel.com>
 <b3ab850d-9da2-0b19-2aa1-fa5a2c3dc079@amd.com>
 <2a9310b5-cf08-d4fe-c08e-c3fc9d25653c@linux.intel.com>
 <95610a20-4364-7ba8-88be-3e303018ea79@amd.com>
 <84b2736f-c225-1421-f245-2de042345dea@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <84b2736f-c225-1421-f245-2de042345dea@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eaeafbb-310c-4375-2d1d-08dbb048ebc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1lHKLAnF5JxtqskmsJVN8xEdoEmMWNFvKDdCidYbxkxogs2VaTzq+Bpd6y2+ybNGmeSlOqsKQxZ8LXYWPyj2QxWRNBEx5U6DS8rgQpNAvBLrZvDaXDQmlf3H8t3rVTktNAeYcYtDo4bbcXvB9nMXDiaU7nBrIBL4BsNsiIPxBBTmcN6iLZC3niT+Oei52G0+iOkFWdSj6rGjESIPNZfkSau8BskXs8BvZ0RyomQJOXx/Jo4AELfmwefd4YPCYRoWo6Z9IdlOH4emcXeJvLqSe9H5M0XGajFuKLiE5Pg0mLcL71neR4QrT/ujvhX5SJTcV0CeLKayAuZVFN41gTQmWsHmuujYcc+d1vb3ajapW7iMGFQYqzzDfeT0Bozp3kYqbxxFnv+eC+qdxiO25Jf3V+PmoaCVdn0ePYnsyL0NuKW66sidRqLm1bXcDjyPxbCSeigb/57tvEdzL2WI5bz/UOVao1UIJOp3HOqTUMZPBp86JSQbYMZajSCJzuJBnMBiFaPxzUvItCipp/Si0v7yc5ltH1cPoNTQDLsPxZUHm9z1xFvnDghW/Ip3Pfj4T0+lo8wh5jbmePi0zpMiMhHzb6O7TbV9/2nNw/WajtOiZnKdLscdIFMktb/FaTXJlZerBMNCeKknDPuLZKiYpGdgnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(186009)(1800799009)(451199024)(5660300002)(8676002)(2616005)(41300700001)(26005)(66556008)(2906002)(66574015)(83380400001)(8936002)(6666004)(478600001)(316002)(31686004)(6512007)(6506007)(6486002)(53546011)(66476007)(66899024)(36756003)(86362001)(31696002)(4326008)(66946007)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2llaVhmWERYTjNBdDJFMmlzM2UzNHZlM3dkc1MrT2x1a2tjeUVpMnVzRGpo?=
 =?utf-8?B?TnBBMDM0bXZRVDRKM1pMRTdMMDh6Ry9aVlpkS1NOaWVIbHdkWWZncksvVFhE?=
 =?utf-8?B?V0xDMDFwVTRsRkdSaEdnb1YwelEyYVp5R1UrdjNjcU9IQml1ZW8xV1hPYlY5?=
 =?utf-8?B?ZVhVakdtbUZXRUx6dWQ5SEhFS3BsU3RhdlNwUXdlSE1ORXdoUVJEZm5JTEJU?=
 =?utf-8?B?SWsvZ3I5ZExmZ00xUWhhU1k2NHJnOG9RcC81Rjhvc1h5ZjN2a08xbVdYNll4?=
 =?utf-8?B?MWhrVzJjNVBJdkJCWXZIY2JIc1BUbkV0L3FEczA4anRmTjVjZWQ0Z2lncXZM?=
 =?utf-8?B?ODA1TDZlYjk2aXYvU0hFVGc2U0lHeUltKzJSQkMyUVlCUnJoeDN6VWxaQW9J?=
 =?utf-8?B?L09SamlWb1MxaVBUNEkrb3lWblZnRExQN1hZc0JEc3pRMFBEYzVSSHFOSHJG?=
 =?utf-8?B?ampNTlVIV2E5aEk4di9XYVJqaE5HRUxwOHBsWWRBV1UyNVBSTEVuM2VwdVVu?=
 =?utf-8?B?V1ZDdzMwTkhlZEJiazkwbEM1c24yYnY2bnU5QVoyQ3IvckNMS082aVdoU09R?=
 =?utf-8?B?S05RWjdCR0NwcGhDVjF2Z200ZWFnMVNiS2tuY1dudGw2UTdZQUxqdFlrQUZI?=
 =?utf-8?B?R1Q0ajFISkFNUG4rNGFJNTlXL1YwTlJYMDlKQml0UTliSmNneWtucVBkeTVz?=
 =?utf-8?B?VVZOMk1lUFg4Rk9RcmZ4aDZmWEp5Mm9GeTR6eE5QRTRMRmhobmRQVVJhYzNM?=
 =?utf-8?B?dHQrZVNtMlNLajc2bHFWMEVSOGh3cks0SjQ0eWkxeU9obTJJRDNidHpIZTRm?=
 =?utf-8?B?czJabHBMZ3N5OVBISTBuSFl1R2xncEdJaDhnZ005aExieStBV0JPQ0Z0Zkhw?=
 =?utf-8?B?UGtENDBiOG05UDVXN0ZiTExRUXVpZ1dWZGRoUmF4dFhvWkFQOWxIc2x5elFj?=
 =?utf-8?B?WkNjVTZic1V5anFqSlVvVm1XTGs0Rm01ODIxOVV5MTdyRW1LU1F1UCtEcU9I?=
 =?utf-8?B?dlFSazFPdVFMOS9rU3pMaWVJYktjTXpoNG4yMS9IMFp0dStjSDVwZU9zK2pj?=
 =?utf-8?B?UFpuVG5haUI0bWxZOVFCLzZTbTUrT1FlMjAvWU1oN3d6RlJCNFl4S0tJYzB1?=
 =?utf-8?B?eUtraHFLVm1ZWmpHSHR6OWtUVzNiaFI3UFJwWEhCbWhGSG5BUzFNNGJQZ1FI?=
 =?utf-8?B?T3dTeWo5TWZSU2dHK1VxT1kyVjAxTThNTXA3OS81bTV6UVR6Z2RXRGRHczlu?=
 =?utf-8?B?YXlmSU1LVi9JVU9zVnQxUHRvMVdXN0gvODlTNlFmZE1odm9FWFBTY3NmZzNw?=
 =?utf-8?B?SnpRbTU1R2xvckNkcDN4YWRRZ0NvV0VVVGV6YVZWb1hMSm9vOWxFSUNIR3ZW?=
 =?utf-8?B?cXpiNEROTnhtZ3RGTkVDSjVNczN3bUlqK2t5REFhenB4YThUUjM2KzNYcTFE?=
 =?utf-8?B?TFNtRkxKM2tMN2wzYkM2bzh3NDdCQW1uN0p6L25BSElIenFLNlhEdDJSKzVL?=
 =?utf-8?B?MS9hbWpqeXRGc1lJU1I0a2cxUFJST3dGWlpMS2YrdkpwU0NGR21CQUE0RmN2?=
 =?utf-8?B?NUhNSzhwVUpSLzI5eG10WE5kd2FpYUdNRFVKRFhKVWpFcFovWFZFdEhQcnpr?=
 =?utf-8?B?aUdpZ3A0cytjVlk2ZlVkbTM0bEFKMmtnRXRubFZuT0dBU0JrY1R3NlNTMVBC?=
 =?utf-8?B?YmN0enFoNU50eU9BMzR4QTNwR2JtWTZjUTl4dExPeE9UQ0M1MWxBYVR2cUdk?=
 =?utf-8?B?blltMkpsNEdnbXBRSVVYK1RQOGk3RjMrMTdaTmtrN2oxM0QwMzFPazU3TVY0?=
 =?utf-8?B?Wk5VY0Y1Z2JxdVVLcnNkcWIxOWEzWjNOT0NrRG00UG9qNWtIT1RJa1lHNnZJ?=
 =?utf-8?B?NTdRcTd6eWc4cmdRMlhFUTZJNEQxZi91RTBrbDZnTFQwWlZ4bEE1M3BVUE0x?=
 =?utf-8?B?MGZTbVBYaFJ4KzdlSEZQTy9HV2ptWlNXSzU3amRJKzU1cksrWXNHYTF1NW40?=
 =?utf-8?B?eitzWFJJS3FZK1hSSTZ0dHQwcFdhRU5ldGhoRjJ4c3JkdFJJVSswUEh4Nm1w?=
 =?utf-8?B?NTZDRkJ3dFd6N1NISkZhOHk5TXZyWTNmRFVOalhFVFRaTE5uaWdnVEhzY2hJ?=
 =?utf-8?Q?wSlm4mMgRWspYhCPCFMURaz3B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eaeafbb-310c-4375-2d1d-08dbb048ebc1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 08:52:24.5141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNhvjlzRujK8s4NhIH7qm8/Xxljaf2eJ+apmaqHPv0Bi/Txr5xB6XlPbnMzSLyU4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7013
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
Cc: Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.09.23 um 09:37 schrieb Thomas Hellström:
> Hi,
>
> On 9/7/23 16:49, Christian König wrote:
>> Am 07.09.23 um 16:47 schrieb Thomas Hellström:
>>> Hi,
>>>
>>> On 9/7/23 16:37, Christian König wrote:
>>>> Am 07.09.23 um 15:53 schrieb Thomas Hellström:
>>>>> While trying to replicate a weird drm_exec lock alloc tracking 
>>>>> warning
>>>>> using the drm_exec kunit test, the warning was shadowed by a UAF 
>>>>> warning
>>>>> from KASAN due to a bug in the drm kunit helpers.
>>>>>
>>>>> Patch 1 fixes that drm kunit UAF.
>>>>> Patch 2 introduces a drm_exec kunit subtest that fails if the 
>>>>> conditions
>>>>>        for the weird warning are met.
>>>>>
>>>>> The series previously also had a patch with a drm_exec workaround 
>>>>> for the
>>>>> warning but that patch has already been commited to 
>>>>> drm_misc_next_fixes.
>>>>
>>>> Thinking more about this what happens when somebody calls 
>>>> drm_exec_unlock_obj() on the first locked object?
>>>>
>>> Essentially the same thing. I've been thinking of the best way to 
>>> handle that, but not sure what's the best one.
>>
>> Well what does lockdep store in that object in the first place? Could 
>> we fix that somehow?
>
> Lockdep maintains an array of held locks (lock classes) for each task. 
> Upon freeing, that list is traversed to see if the address matches the 
> stored memory address. This also has the interesting side effect that 
> IICR dma_resv_assert_held() checks if *any* dma_resv is held....
>
> Ideally each object would have its own class instance, but I think 
> some applications would then exhaust the array size.

IIRC Daniel once explained to me that he designed lockdep for ww_mutexes 
like this for some reason, but I don't remember the details any more.

Maybe lockdep wouldn't otherwise be able to deal with the fact that you 
could lock them in any order or something like that.

>
>
> I'll dig a bit deeper into this.
>
>
> Meanwhile for the unlock problem, looking at how the unlocks are used 
> in i915 it's typically locks that are grabbed during eviction and 
> released again once validation of a single object succeeded. The risk 
> of them ending up at the first lock is small, unless they are 
> prelocked as the contended lock. But for these "temporary" objects, 
> the prelocked lock is immediately dropped after locking and are only 
> used to find something suitable to wait for to relax the ww transaction.

Yeah, I don't see this as an use case in reality. It's more of a "what 
if?" thing.

>
> If we were to implement something similar in drm_exec, we'd need an 
> interface to mark an object as "temporary" when locking, and make sure 
> we drop those objects if they end up as "prelocked". Personally I 
> think this solution works well and would be my preferred choice.
>
> Yet another alternative would be to keep a reference even of the 
> unlocked objects...
>
> But these workarounds ofc only push the problem out of drm_exec. Users 
> of raw dma-resv or ww mutexes would still wonder what's going on.

Agree, completely. This is really a bug in lockdep or rather how we 
designed to implement ww_mutexes in lockdep and should therefore be 
fixed there I think.

Christian.

>
> /Thomas
>
>
>
>>
>> Christian.
>>
>>>
>>> /Thomas
>>>
>>>
>>>> Christian.
>>>>
>>>>>
>>>>> v2:
>>>>> - Rewording of commit messages
>>>>> - Add some commit message tags
>>>>> v3:
>>>>> - Remove an already committed patch
>>>>> - Rework the test to not require dmesg inspection (Maxime Ripard)
>>>>> - Condition the test on CONFIG_LOCK_ALLOC
>>>>> - Update code comments and commit messages (Maxime Ripard)
>>>>>
>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>
>>>>> Thomas Hellström (2):
>>>>>    drm/tests: helpers: Avoid a driver uaf
>>>>>    drm/tests/drm_exec: Add a test for object freeing within
>>>>>      drm_exec_fini()
>>>>>
>>>>>   drivers/gpu/drm/tests/drm_exec_test.c | 82 
>>>>> +++++++++++++++++++++++++++
>>>>>   include/drm/drm_kunit_helpers.h       |  4 +-
>>>>>   2 files changed, 85 insertions(+), 1 deletion(-)
>>>>>
>>>>
>>

