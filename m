Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5AC672175
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 16:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1096110E772;
	Wed, 18 Jan 2023 15:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2041.outbound.protection.outlook.com [40.107.212.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA9010E1F2;
 Wed, 18 Jan 2023 15:37:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fwtduany1X14DjS8s3zhGQzAZKUySMLiZskX0pclxV2jrEBazixAm6p2W2lw8U9s3oh6rFKUEGBtEdKa4PCT3W2IJ9oSEw4jnI38VjrJDIT4oEBJ6c1nAP1WYY7esl3tE3IlvgXpqFxwUx/6VtCA63T+H8qyh5oVr8Mx8nfiBrRw8pz2qs7F9oTMgV9nBT+wQDjdA1pc2ZK9j7jXokQEs+NfIOf+9spQR0T9jB+f16mFABFOOXcIo8DOOP4+yeVO2XtqzSPKIjl0vBjtl8BYyRA0t+Lm2kQOaszyStshImx1U85MXGTAzLvEvK1po5Znti6Sw/VjQNBC/CwFff5oiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1P3Vl5wmnf2c/6Bf27lD7pWpgRyd1OPCE6v/ghCfBg=;
 b=W8EVhNA2fcntN3AqDphWvA8m5vCO1ciXKf9ngwGIH8p7psbdlvVELrCuI+81Fcm4QVFLOD0tJMvtodBWBEQQOgr2VuzIdUq1kdfAPHBiYCQYdY7xYfvTJryXGnlvJQSrpPczyH5ln8kxOYWb98HTubnhi2PLgpHZ09n6q3bjGB4vrbA/LnhAhBp2zfE3NTIMDLhyr6u46jhE818YPSxgH4aW1qk4InCPS7s4TcJrlhSm9vVzKstn9QczzQYzuskS6RLwYE0EZoXEDRGerHmwZ/ZA5Szs3uySheQlnuRfFCB/3G5tmDfPTUkoGd12XeAU6AhQEdk8h5VDnuFh8wjZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1P3Vl5wmnf2c/6Bf27lD7pWpgRyd1OPCE6v/ghCfBg=;
 b=TvUmX+xjauqnfPtg2XFkGd0jYsy+9Wv+QOwrDrX4umH66/5xxoju/Az2+fnrWQwX++jaF3gtLc3HDDKPG/bdbwu3AnoVlwFvYkP0sRwPvAXU5pKgOSUhucbB2dgYy0g1cowdSKIYhMY74iEsVDLVE36xlBxrdlxtnl6I3bESSk0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ1PR12MB6219.namprd12.prod.outlook.com (2603:10b6:a03:456::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 15:37:08 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 15:37:08 +0000
Message-ID: <3602500f-05f5-10b8-5ec6-0a6246e2bb6b@amd.com>
Date: Wed, 18 Jan 2023 16:37:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH drm-next 00/14] [RFC] DRM GPUVA Manager & Nouveau VM_BIND
 UAPI
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, daniel@ffwll.ch, airlied@redhat.com,
 bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net
References: <20230118061256.2689-1-dakr@redhat.com>
 <db4fa0fc-c9a6-9a48-c45f-1d655b30aff9@amd.com>
 <02b0bcb8-f69f-93cf-1f56-ec883cb33965@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <02b0bcb8-f69f-93cf-1f56-ec883cb33965@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ1PR12MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 9511a3a5-8ad2-467f-5497-08daf969dbce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hjWJvrDPAwbbb3sFa2SslcvFkSe1iU4rgAJYS5ShINxQVlf7wOFuHwu9vfSqAT48z4Qha4nhnzDDwUe1jjMwemFbLz7vmkuh4avDKxLLGS5P76TudTNN9zxXS0BhN79ISZWO3yuw8o5SJFwTxBOeghARczdmo6sPdSE4vyJIpqcsaDe6Ip0795jzizKxxJshe22B4d8FCZ4rcO/xKg0/yq0Dpfph6hGqPOZGTh7w91RDJJr6uai4K0NzlVpGwmy7Y+BjGBc1iVD9UO8HckRjVyznWxP2G9xa+CokUV7C2p1jG9ixqHL4Mo797F7/s0d7As+m7yPcW1VnfoSQCz4qI7FOQGlSpY0yhUxUIv+mbdtLshwVxtuviUXNFS3xJCkXSpTBhOHeL4aYnC8unmEnWF4WkvFzUUfZc8w+AT5YGUZqSbkzczZfnYZCBCxuF6QvF0AkOdsHZGh68rC3eXMOOj+DH6eoTt7dBhT5JYRL5zOnbKyzyTdOZnyz827jQueyT6HHgmpm+W20JA9wQ/5iv78rTHtGcQKm0hpxtd06vhxdW+8+r+BhG1N4Yz8F/yEJX7rkZ1GUIpxKODj1BGBu220sLzb/5jdimXDRJBk1fXnqC6b0saZkYBPlaSs3JSzRHsU8mBuoiPjOJOhdVd5OW0AaQlupvjwMW9ZjktsN3CcSHuw7yN/VTG0Xdkv4FnJ1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199015)(53546011)(6506007)(966005)(186003)(6486002)(6512007)(478600001)(2616005)(31686004)(6666004)(66556008)(66476007)(8676002)(66946007)(4326008)(66574015)(83380400001)(41300700001)(316002)(5660300002)(7416002)(8936002)(2906002)(31696002)(38100700002)(86362001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ymo5Nld1OE5VOEpWdWhNMHdDUDdCcnp6cy9rTTZHcDJDTEc0NVFWejcrS3VB?=
 =?utf-8?B?bmxYOVc4QTBXcVU0bnBxY043WERSa1VIWHRtMXNlZVdKSXUwTWQzdnRkVzdr?=
 =?utf-8?B?enB6eXVzeWNZQVNRYlNTNUNYdWNqQWNRMmlZRUw5cjNkMEdyQTk1d210NEd2?=
 =?utf-8?B?MDZ2OTl3TzdQQUwwUXk0M0ZTVmdnamdpUkFBWEdudnR4a1pUSnlmOStKZUxS?=
 =?utf-8?B?QTJyanBhN1g0TTkzbnRSaHBXR3ZZRGtLTnlkSC9vWnNVM28yVjNsYUlydEl1?=
 =?utf-8?B?cnZyYm45WmtNT0tNYzFST0hlclloNjJGdnhycjNBa3laRVhCclgwdER6bDBq?=
 =?utf-8?B?QVNMN2FyQUdQZzJhbnplamVYQVZiNEtXbW5JMmpVMit6alBXRnBpT1I4UGJz?=
 =?utf-8?B?WUtybEt4clN0cEUzb3Z4TW50VW80M3RpZHd2VVVEajc2SFFCbFJRVlgvcm1C?=
 =?utf-8?B?UFRCdFZaRU5XWHAvMldqOTY4Q0Z2RDQyTHcyNkZDMFRnRlF4Yjg2Ung0cTFQ?=
 =?utf-8?B?Q3dXL2RIRldKZ3JueVR5cnVXVEdqTjNtS242TnF2b2QxamlDSVdlMnAwWGQy?=
 =?utf-8?B?WjlkSy8ya29DMHZ2emsxb2EyMTZVSysxczZ6eGFLWW5zeHhRR2hhUnRpeDdi?=
 =?utf-8?B?d0tmREwzOG1YZnRKQVZTZnFZc2JOUmZxZE42ekR4UE1MbFFkTHZsUlRSMlY3?=
 =?utf-8?B?R3U5VG1WQ3RydFZwS1Y5ZCt3a3ZoZ205WjdqSHpvVUQ0NnM2WFVmZVVCZkJx?=
 =?utf-8?B?NFBDR0VheG51M2lyZXVtanBnYzlUaHE1S1B2d1VTZVJvZGNOYUxaTldRTnJI?=
 =?utf-8?B?TkNvbnlmaXIwRnEzYVIyUERlc052VWI2VXpiWmFJK0dGa0tKRFJIVjRic25V?=
 =?utf-8?B?WURNQmFXbXVDWmZOemJNUmFTSHRtUSt5d1EyenczN1B4Ym9wYWt3YXdPY2F3?=
 =?utf-8?B?aSszSUFmYkZYdlEwY3BTV25wUm1zOGw2SHdZV1BXMW0wd25CbWFXTjRGWE03?=
 =?utf-8?B?L1hJT29LeGhSWVFLRlhlUHh6SDY2anhpbkpHcGdLUGRjbXJCcWJCdnh1U29Z?=
 =?utf-8?B?Z3duTkliajFpSkZ4S0RRc29uRHFSbjBzbEFPM1h6Y1k5NjVvRk5HOWVKSUFW?=
 =?utf-8?B?TXhJZ041ZHMyT1RJYmV0YlJDMjVNb20xclZQNng4aC9TRzdGaklUbzBKemNm?=
 =?utf-8?B?YmdncVNsdGxYYTJoWUJtV1JSYS9mbWx2aEJWdGRsOGFWVk5ld1p5b3RpRnBS?=
 =?utf-8?B?bE0rbU4xZVhEQzA3NjkyeWFHRVRZVlg1N0htYWhnSGh1b1R4UktWMHlCQkJ1?=
 =?utf-8?B?ZjBBTVd4RDEyZzlaVTFzT1N0bjZ6d3ZFc3hzVXlVcTR2YjJPcVAwWVV0ZFpN?=
 =?utf-8?B?dFVlTTg5b0ZCR2dydXc0OEt3d05valh2QU55czQ4WklvcFZMZ3MxMlFObTI5?=
 =?utf-8?B?ZkVyNmt5bUd6NmtwcUZ2TkphSHpzY0hpUDNiTzlBeUc3N1h4cnQzVDl5bnJG?=
 =?utf-8?B?emFrVTV6bzNSZmd4aWtubW4rTmk3OXQvQ3JKTmkzNis4Y2NWS1pQUFl6NzlH?=
 =?utf-8?B?dWxVdVN3NjRXY3o3R2RqUEl4OUMyWTArNG1VVitjV2dpSkNXSnJld3licmhw?=
 =?utf-8?B?d3RkL251dzk2WFNSOGRkaTRNVVFuaWJ1WWcrTG1XSEVBaGhpYlY0c2t5and2?=
 =?utf-8?B?b1F5SFpVM09kMDJDanVRbjIxUm1KRGxqVGdHdDBvaCthbXZ5NStsMVhVRDZR?=
 =?utf-8?B?RkwrOUZ4UXFvdXpjeWdYbXo0QVZyckhIUDlXaUkwL3MwajNkNk1wQ2Z0T1kx?=
 =?utf-8?B?cEt3dXo0TEkyWWtkeHJCeDJndHEvM1ZWUFh1WWNqS0htY1llcDArelNNT1ow?=
 =?utf-8?B?Unk0MVZrbzdhNFZoN2pzM2NmZGt5aFlzOWg4WWRsdkZuSU9SVUs1SFBFSG05?=
 =?utf-8?B?NVErMktOWCtvNVRncHN6WnM5VUgweFJzQnZIQTJGb2t1djEvSEhseHY4N0ti?=
 =?utf-8?B?dDZNZGgwaVZSU2xha0hKd0xvWjQwbHgxY0xSZXFpWVk5L21scWN4eTIyRzFI?=
 =?utf-8?B?UWJFVmhYWTFCTlc5SkxFTjJ4aU5UVG9oT2trQnhsVXZrR0xVSS8vMUJNbUdm?=
 =?utf-8?B?aE9YeW41aThnSVdGNm1OTDVqZmVham14UE5kL2Iva2FNS2h5MTdZSzdpTm5N?=
 =?utf-8?Q?PFk8bpP3sZBWPOgrtw5/aYeVM8eCqhpTPhvRv41Np5m1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9511a3a5-8ad2-467f-5497-08daf969dbce
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 15:37:08.2367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7VP9fGigrkx1qnMZxL9XzFCshbvL2XDW1TLHXUVyU47q9oPiza97RmPwPZ2teBN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6219
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.01.23 um 16:34 schrieb Danilo Krummrich:
> Hi Christian,
>
> On 1/18/23 09:53, Christian König wrote:
>> Am 18.01.23 um 07:12 schrieb Danilo Krummrich:
>>> This patch series provides a new UAPI for the Nouveau driver in 
>>> order to
>>> support Vulkan features, such as sparse bindings and sparse residency.
>>>
>>> Furthermore, with the DRM GPUVA manager it provides a new DRM core 
>>> feature to
>>> keep track of GPU virtual address (VA) mappings in a more generic way.
>>>
>>> The DRM GPUVA manager is indented to help drivers implement 
>>> userspace-manageable
>>> GPU VA spaces in reference to the Vulkan API. In order to achieve 
>>> this goal it
>>> serves the following purposes in this context.
>>>
>>>      1) Provide a dedicated range allocator to track GPU VA 
>>> allocations and
>>>         mappings, making use of the drm_mm range allocator.
>>
>> This means that the ranges are allocated by the kernel? If yes that's 
>> a really really bad idea.
>
> No, it's just for keeping track of the ranges userspace has allocated.

Ok, that makes more sense.

So basically you have an IOCTL which asks kernel for a free range? Or 
what exactly is the drm_mm used for here?

Regards,
Christian.

>
> - Danilo
>
>>
>> Regards,
>> Christian.
>>
>>>
>>>      2) Generically connect GPU VA mappings to their backing 
>>> buffers, in
>>>         particular DRM GEM objects.
>>>
>>>      3) Provide a common implementation to perform more complex mapping
>>>         operations on the GPU VA space. In particular splitting and 
>>> merging
>>>         of GPU VA mappings, e.g. for intersecting mapping requests 
>>> or partial
>>>         unmap requests.
>>>
>>> The new VM_BIND Nouveau UAPI build on top of the DRM GPUVA manager, 
>>> itself
>>> providing the following new interfaces.
>>>
>>>      1) Initialize a GPU VA space via the new 
>>> DRM_IOCTL_NOUVEAU_VM_INIT ioctl
>>>         for UMDs to specify the portion of VA space managed by the 
>>> kernel and
>>>         userspace, respectively.
>>>
>>>      2) Allocate and free a VA space region as well as bind and 
>>> unbind memory
>>>         to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIND 
>>> ioctl.
>>>
>>>      3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.
>>>
>>> Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, make use 
>>> of the DRM
>>> scheduler to queue jobs and support asynchronous processing with DRM 
>>> syncobjs
>>> as synchronization mechanism.
>>>
>>> By default DRM_IOCTL_NOUVEAU_VM_BIND does synchronous processing,
>>> DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.
>>>
>>> The new VM_BIND UAPI for Nouveau makes also use of drm_exec 
>>> (execution context
>>> for GEM buffers) by Christian König. Since the patch implementing 
>>> drm_exec was
>>> not yet merged into drm-next it is part of this series, as well as a 
>>> small fix
>>> for this patch, which was found while testing this series.
>>>
>>> This patch series is also available at [1].
>>>
>>> There is a Mesa NVK merge request by Dave Airlie [2] implementing the
>>> corresponding userspace parts for this series.
>>>
>>> The Vulkan CTS test suite passes the sparse binding and sparse 
>>> residency test
>>> cases for the new UAPI together with Dave's Mesa work.
>>>
>>> There are also some test cases in the igt-gpu-tools project [3] for 
>>> the new UAPI
>>> and hence the DRM GPU VA manager. However, most of them are testing 
>>> the DRM GPU
>>> VA manager's logic through Nouveau's new UAPI and should be 
>>> considered just as
>>> helper for implementation.
>>>
>>> However, I absolutely intend to change those test cases to proper 
>>> kunit test
>>> cases for the DRM GPUVA manager, once and if we agree on it's 
>>> usefulness and
>>> design.
>>>
>>> [1] 
>>> https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next 
>>> /
>>> https://gitlab.freedesktop.org/nouvelles/kernel/-/merge_requests/1
>>> [2] https://gitlab.freedesktop.org/nouveau/mesa/-/merge_requests/150/
>>> [3] 
>>> https://gitlab.freedesktop.org/dakr/igt-gpu-tools/-/tree/wip_nouveau_vm_bind
>>>
>>> I also want to give credit to Dave Airlie, who contributed a lot of 
>>> ideas to
>>> this patch series.
>>>
>>> Christian König (1):
>>>    drm: execution context for GEM buffers
>>>
>>> Danilo Krummrich (13):
>>>    drm/exec: fix memory leak in drm_exec_prepare_obj()
>>>    drm: manager to keep track of GPUs VA mappings
>>>    drm: debugfs: provide infrastructure to dump a DRM GPU VA space
>>>    drm/nouveau: new VM_BIND uapi interfaces
>>>    drm/nouveau: get vmm via nouveau_cli_vmm()
>>>    drm/nouveau: bo: initialize GEM GPU VA interface
>>>    drm/nouveau: move usercopy helpers to nouveau_drv.h
>>>    drm/nouveau: fence: fail to emit when fence context is killed
>>>    drm/nouveau: chan: provide nouveau_channel_kill()
>>>    drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
>>>    drm/nouveau: implement uvmm for user mode bindings
>>>    drm/nouveau: implement new VM_BIND UAPI
>>>    drm/nouveau: debugfs: implement DRM GPU VA debugfs
>>>
>>>   Documentation/gpu/driver-uapi.rst             |   11 +
>>>   Documentation/gpu/drm-mm.rst                  |   43 +
>>>   drivers/gpu/drm/Kconfig                       |    6 +
>>>   drivers/gpu/drm/Makefile                      |    3 +
>>>   drivers/gpu/drm/amd/amdgpu/Kconfig            |    1 +
>>>   drivers/gpu/drm/drm_debugfs.c                 |   56 +
>>>   drivers/gpu/drm/drm_exec.c                    |  294 ++++
>>>   drivers/gpu/drm/drm_gem.c                     |    3 +
>>>   drivers/gpu/drm/drm_gpuva_mgr.c               | 1323 
>>> +++++++++++++++++
>>>   drivers/gpu/drm/nouveau/Kbuild                |    3 +
>>>   drivers/gpu/drm/nouveau/Kconfig               |    2 +
>>>   drivers/gpu/drm/nouveau/include/nvif/if000c.h |   23 +-
>>>   drivers/gpu/drm/nouveau/include/nvif/vmm.h    |   17 +-
>>>   .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |   10 +
>>>   drivers/gpu/drm/nouveau/nouveau_abi16.c       |   23 +
>>>   drivers/gpu/drm/nouveau/nouveau_abi16.h       |    1 +
>>>   drivers/gpu/drm/nouveau/nouveau_bo.c          |  152 +-
>>>   drivers/gpu/drm/nouveau/nouveau_bo.h          |    2 +-
>>>   drivers/gpu/drm/nouveau/nouveau_chan.c        |   16 +-
>>>   drivers/gpu/drm/nouveau/nouveau_chan.h        |    1 +
>>>   drivers/gpu/drm/nouveau/nouveau_debugfs.c     |   24 +
>>>   drivers/gpu/drm/nouveau/nouveau_drm.c         |   25 +-
>>>   drivers/gpu/drm/nouveau/nouveau_drv.h         |   92 +-
>>>   drivers/gpu/drm/nouveau/nouveau_exec.c        |  310 ++++
>>>   drivers/gpu/drm/nouveau/nouveau_exec.h        |   55 +
>>>   drivers/gpu/drm/nouveau/nouveau_fence.c       |    7 +
>>>   drivers/gpu/drm/nouveau/nouveau_fence.h       |    2 +-
>>>   drivers/gpu/drm/nouveau/nouveau_gem.c         |   83 +-
>>>   drivers/gpu/drm/nouveau/nouveau_mem.h         |    5 +
>>>   drivers/gpu/drm/nouveau/nouveau_prime.c       |    2 +-
>>>   drivers/gpu/drm/nouveau/nouveau_sched.c       |  780 ++++++++++
>>>   drivers/gpu/drm/nouveau/nouveau_sched.h       |   98 ++
>>>   drivers/gpu/drm/nouveau/nouveau_svm.c         |    2 +-
>>>   drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  575 +++++++
>>>   drivers/gpu/drm/nouveau/nouveau_uvmm.h        |   68 +
>>>   drivers/gpu/drm/nouveau/nouveau_vmm.c         |    4 +-
>>>   drivers/gpu/drm/nouveau/nvif/vmm.c            |   73 +-
>>>   .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    |  168 ++-
>>>   .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h    |    1 +
>>>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |   32 +-
>>>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |    3 +
>>>   include/drm/drm_debugfs.h                     |   25 +
>>>   include/drm/drm_drv.h                         |    6 +
>>>   include/drm/drm_exec.h                        |  144 ++
>>>   include/drm/drm_gem.h                         |   75 +
>>>   include/drm/drm_gpuva_mgr.h                   |  527 +++++++
>>>   include/uapi/drm/nouveau_drm.h                |  216 +++
>>>   47 files changed, 5266 insertions(+), 126 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/drm_exec.c
>>>   create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
>>>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
>>>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
>>>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
>>>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h
>>>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.h
>>>   create mode 100644 include/drm/drm_exec.h
>>>   create mode 100644 include/drm/drm_gpuva_mgr.h
>>>
>>>
>>> base-commit: 0b45ac1170ea6416bc1d36798414c04870cd356d
>>
>

