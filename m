Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C7D77E332
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 16:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65F710E0BB;
	Wed, 16 Aug 2023 14:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200AB10E0BB;
 Wed, 16 Aug 2023 14:05:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6duMQeTBkaioJ84RglvQ5PNKzwvX48Zzu7TRxcEXWn6pcdlPvnehBeghJN83zIejrq0vvCeHbLx7hYhnl7OgydOZ43MlML2Fv1gV/JPN5V005eu2FeO6JDTblpDWiKhHnO1LBG2bD5w6/X7fpMwdqFuR1mQPMeibRftjIDSZm2FBn3qy+lxvLrB5InvQfrBsBHifBfrp/w87j410tp4jj/6t0ryfULMNQ3ZT3cWzKv0pmSTcinzcmO6mlS2d7AETbXzItAuf0t4VmWlwOvJGYTWi2/qaBNUHbhhmAUlf/BL2SFAe76JOy/Hp4NCDJy7NIf9eUYL1YEqjsBrEwxRUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMfs5SAJtq9uJmYftNsicq6CsQCYq+08NusxafdaS6o=;
 b=KIXJTYUJ5BjcL4lbWAlvkeQmkJiFhmQeqgRXKPFPs+eTAztSTDhtADeW0SIncBp3VeLVMokxf0ntnYVGPqF/TefeXVmng3imMNmqqpbgyEnVGPSDM5j2DF5X/H+CRUJdZvmoIVwjthdi20wNaWaCdnyWGNtb9SDeTV6sgC11PM3hOiOJjqW+q5YteOjA9oKusOEu+5e2H+pwlCDpQ2S4k5oUa8CZpuC6HrUfDebQw1FKB+0oTMumGmZsEQ8D8Zzs/Q/JjbP3k0+h7SjXDAvnwGGNpMLhiZk2ayWwqYb50QhaOFJvSPO2XIPqn4uHpbsfBtWkz5tB7YDqKwDD4SR3tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMfs5SAJtq9uJmYftNsicq6CsQCYq+08NusxafdaS6o=;
 b=vL4TxOxzVUxiybX7CZAawTmvErfTdsPmBTTWH9I9tji1tZlj53vmZcOZ94NPN0/G/kMltRT5UaZvDYGsLKt5eypb7iabS2kKvF0EoXHlHr1amxvRoM2ciOSNdSrx/fqlUmomAP9h46Sz73Tzlr3q77GjASvN2W3xDuadD5UrPJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB6336.namprd12.prod.outlook.com (2603:10b6:8:93::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.26; Wed, 16 Aug 2023 14:05:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 14:05:47 +0000
Message-ID: <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
Date: Wed, 16 Aug 2023 16:05:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
To: Danilo Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: a461073c-d668-46b3-43c3-08db9e61e33b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dt1oYey0Xpj8cx/tBpsRdSvYnkcJEvzJnbU7lW311SFixK61gU2pNKUJevhQXO/wR6mn8xsdQNgJwtYDT7/s0TZRaKh4FTYRIBdB9balkcegRwLnucXaCu5IQ2wcXr9R3KlkmKlJ+cuCYFQBZdvujWp8erdEe/HEf4mQmi1SsZ/u88yWFstJUnBu46uv6L6sBx2U95LoqkJhoaNQiciWHgj2JiLrnS8JCsgHfuBiKh/nRqZrzyhRDRtfFagaSqL14mSW9wrnyqvq0ZkFcIcll/8gzzCM1yqDe356DqDqPMpo/cVSP9VDooR29+YxlMcIlOIslITLUJUcIJjCqapztxtKdMU/w0Xr5a5I16W9UzDJAtpldGsZlixVLwRluPNF4a44Q+Ns2rP9Ce0QYoUP5/SEL3lgQaH9nPqyW1iNw9VRIFBOUdR2l82QafFJMURVvaTwuoImxCvSB+2bxYHTyL3Q2Ak5PYGgC//JUDZiB4wWx/bg9qJCiUauls7OAdTvS7cJaNX3jKV/RKL8FsZAWbCXX6GU86ftqSoilr+j2x6kRbT47aWOuOnJND4hiLv4MohytCYUQU8uMNF9xIlnZMk3da/BN7QtRk4SOXjGT1MPigM23BXWgGXlMVq+j2ZDVMiqDJ1PxDq3ZCVA0mkkfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(316002)(66946007)(110136005)(66476007)(66556008)(41300700001)(5660300002)(38100700002)(31686004)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(7416002)(86362001)(31696002)(6512007)(53546011)(6506007)(36756003)(6666004)(2616005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3BVUTBYT1M0Y1NBNElBMk5DNW5DSGtvNDdvaC9HN3BnS0lReWdkMWo2ZGpa?=
 =?utf-8?B?YVFJZ1dwK3d1RnZPUmJMMXJmUUx5aFgwYnNqNEl0M2M0YnBsNFZMR1FMUXVh?=
 =?utf-8?B?TFlNaVE1dXZYYkVpeHNSdEpjUmEyNlFoUDlUWkVFZnA0VG5HUHVOUjlhaURK?=
 =?utf-8?B?V1R5am9ZNGxOYVFhMG9rWm05RFpzRnRQNkRxQlhTYjg2bXFuVE1qK3Y0QytD?=
 =?utf-8?B?dWdicjliQ01wamdvL0hHNGRzR1BlNS9QNU9iTC9qWVBFanJnUVowMFB1RWho?=
 =?utf-8?B?TjF3L0NFN3RLWUNwZ1IvQU13cnNyWmdURy8xejJkZnhMUWRuN3ZIcm9iUDVW?=
 =?utf-8?B?TXZ4d2JUUXMya2gzNlpXQmV5b3VFalNabW5JM0F3TWNCeFdXcldJMkpxaUg1?=
 =?utf-8?B?WjV1N1kyNmZ3KzZRbmFGQXpnR2wxdVVxU0Z2V2xrMWNRdzhxWGMzaE94aElo?=
 =?utf-8?B?STBnTGNhejIrVVdST1lYMG1QaTgxRU9ZOEhPQjYwMWxoVGxIcStQWnVYdlo3?=
 =?utf-8?B?V0FTL1hOTm5BTDR5V1hYWVdXd3VJOXZUMlFVbWgrbExVTzYxVnVZRnB1b085?=
 =?utf-8?B?VGR3S2I4Q0hWMjhKUllRMHFMK3MvYmE2QStwZHM2UXFQSngyai9hbzFEQkJn?=
 =?utf-8?B?OXRKeUVHNDdWOW0xWGkxTkhpMW52MDFoUDNCbFI3SkpxYm8xenE2OWVtSllj?=
 =?utf-8?B?ZXBjUXoyTjhqSlpkQ1cvUng3MUI4Zmx3L1NHTlhXekozQ1NheTQ1L1NhbUJl?=
 =?utf-8?B?RFozWjhaQVBHSmVRUC9IcnFqN3NGbkNkNnhuK2pzQWJGNGc5YSs4UFM3OWxi?=
 =?utf-8?B?R0pWUTFwazMxeFByR0VBNzhnNDYySnpXMjVRZkFualVXcCtXbTZrWHpTNk8y?=
 =?utf-8?B?Z0F0MlM2VkZYd0VnTGdrbk94OTlOcERTZ2JucW15M1FXbFdrclVkaXhvTDVK?=
 =?utf-8?B?NUZGWTRzakxTeEk5SVI0WXJYOE1JMFNiMkJWbzhYcklsM2dlSjFTNHpJUUFh?=
 =?utf-8?B?bzJwL0JvMGpBSHo5cm5DcWY1aXZ0Y0k1RkwrTUpaN3RqNytUZEJmSFpEU1d3?=
 =?utf-8?B?NmY3TWo4Y0srZWlRK1RZZVN1ZW93KzQ1OWJsbEU2eDhDMiswaUw1aEpQb0Yw?=
 =?utf-8?B?T0RKTnZYTFdkUFNHdTV6SFdTdEVzc2hMVEswQUkrdGQ0Q0JhQUN3RHBYbHMz?=
 =?utf-8?B?VGo0TXFjdXpONXZOSkxqNk9mM2M1cHcvNzJCbjZHUVltTzIxeVc0ZHVCb2t0?=
 =?utf-8?B?YXU3dDZHY2VMRjgvSzZxandtSTNxMlJxWVNJcVFPS25kdXhRaTZJbHBhN3BY?=
 =?utf-8?B?SW5hZHFCNmdnR2ZjWUl4ZkRYTkwyR1BFR0g1Rlc0UmV4RGZmWC9kME92R2Jp?=
 =?utf-8?B?UjUzTUVLYlhXY1pNNkt1UmpaT3E3OFdUYS8wdmNJaFVyWVZwb3pQNmt6djk5?=
 =?utf-8?B?c3g4Y3lxdlkyRVVpa2JTaTdGa25xMml2TmFwTDlBd2N4Qy95bVN3RzRaQVlr?=
 =?utf-8?B?QVkwcEF1SmozTng4QlU5RFg5NnJ0NDMwUlBPelRtd3BHOXhzQmk1WVFFRnNL?=
 =?utf-8?B?MVFqa1N3b2YvQlRSVjdRTW9vVGV0Ujc5VHQ1WFBEdEhoc2NCNFVoR0U2dDI2?=
 =?utf-8?B?QXY1amxoZ2JVaU93VjZKVGhOSXlxWS9tR1JiTENDQmEva3JVTjZYUUMwRmZ1?=
 =?utf-8?B?ZGp6Z3l0TnR4dTNwQkNFWjY1TEE0V2lEaTUvMFkxRGVmL01GTGxLVjhQREhD?=
 =?utf-8?B?bGtGUElITTVTTHpRaXhUSFFKSW05cC9SU2psK0JtWWRpeEh2anNGdXJxSU1j?=
 =?utf-8?B?b3BYZ2M4bWt5aVFoa21lRHNtMGVpS21HQ2tiVzhYV21VRFZ1bFRCalpNWnlk?=
 =?utf-8?B?T0x1ampZR1pEOENaM1RoNTlSTEV6Z0dOOEFCTy95TkpNQkxPVVFhMUZQN09r?=
 =?utf-8?B?Wm1OM1dOOTNBUFlZKzBxTG9VMGlKKzcvQ2tKMjRydlZWMmNoSFQ1YlNuLzNH?=
 =?utf-8?B?VWpjeWVKd2F4dU43SW5mV3RWRmE5S3BGMnBWMWIvREFudHdaNnRKbHIzVHB5?=
 =?utf-8?B?ZHJ4RSt6eEh4bG1oa3Y1bWVlWGY5eWh5RzFDbGs0R09RcTcvcS9hS3hlSmkx?=
 =?utf-8?Q?jpXYQiWK3laOJS4fPyi+W7lWS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a461073c-d668-46b3-43c3-08db9e61e33b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 14:05:46.8116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E55gk0378b+po6Pbh4H3/VmVUGzyO2OUrVHP5NOLj5KzJ3DY6uT/iV61SZpfbm16
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6336
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.08.23 um 13:30 schrieb Danilo Krummrich:
> Hi Matt,
>
> On 8/11/23 04:31, Matthew Brost wrote:
>> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
>> mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
>> seems a bit odd but let us explain the reasoning below.
>>
>> 1. In XE the submission order from multiple drm_sched_entity is not
>> guaranteed to be the same completion even if targeting the same hardware
>> engine. This is because in XE we have a firmware scheduler, the GuC,
>> which allowed to reorder, timeslice, and preempt submissions. If a using
>> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
>> apart as the TDR expects submission order == completion order. Using a
>> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
>>
>> 2. In XE submissions are done via programming a ring buffer (circular
>> buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
>> limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
>> control on the ring for free.
>
> In XE, where does the limitation of MAX_SIZE_PER_JOB come from?
>
> In Nouveau we currently do have such a limitation as well, but it is 
> derived from the RING_SIZE, hence RING_SIZE / MAX_SIZE_PER_JOB would 
> always be 1. However, I think most jobs won't actually utilize the 
> whole ring.

Well that should probably rather be RING_SIZE / MAX_SIZE_PER_JOB = 
hw_submission_limit (or even hw_submission_limit - 1 when the hw can't 
distinct full vs empty ring buffer).

Otherwise your scheduler might just overwrite the ring buffer by pushing 
things to fast.

Christian.

>
> Given that, it seems like it would be better to let the scheduler keep 
> track of empty ring "slots" instead, such that the scheduler can 
> deceide whether a subsequent job will still fit on the ring and if not 
> re-evaluate once a previous job finished. Of course each submitted job 
> would be required to carry the number of slots it requires on the ring.
>
> What to you think of implementing this as alternative flow control 
> mechanism? Implementation wise this could be a union with the existing 
> hw_submission_limit.
>
> - Danilo
>
>>
>> A problem with this design is currently a drm_gpu_scheduler uses a
>> kthread for submission / job cleanup. This doesn't scale if a large
>> number of drm_gpu_scheduler are used. To work around the scaling issue,
>> use a worker rather than kthread for submission / job cleanup.
>>
>> v2:
>>    - (Rob Clark) Fix msm build
>>    - Pass in run work queue
>> v3:
>>    - (Boris) don't have loop in worker
>> v4:
>>    - (Tvrtko) break out submit ready, stop, start helpers into own patch
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>

