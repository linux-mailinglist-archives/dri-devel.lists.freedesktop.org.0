Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD7186DBC7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 08:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4192F10EB87;
	Fri,  1 Mar 2024 07:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lOOH67e/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D7E10EB87;
 Fri,  1 Mar 2024 07:01:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2jIxs4StJhDmNIcr/uYKpz+WchapSd6U4RTTvEl0rDvL1ZG3+wFDGHjM7fcYxQVRI5rCVNN+ynle5ylnBmudB8MYFUyFpQpFcFaFJeRhOyC3FhnOLO2ao6+IqwTv7aqtCh3oGE1hMmzTRZQacDgdnpCUz4Tuj6fOWjIk+EMKdV7Kj3hmxvrwVYOdA8Pr7jCxHgVuwN3F7enrjfMOmWrCHfWcyl/PKoQSD800m6GBlhyii3eTNM0IXCmoI54hhUhonc65lH5OfGENlAcI0xNYryL+wxUKnePUM+AS1eZgsEtxQWBvGUrNQ8tVrQLbdXAHYkCtDdUFJ4YjOdnGYcaxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5tUGYntaUd53xaqzIZYrZvK4BIYOF11ajrkgKUsExk=;
 b=cU/SZh70BW4p0DVKXRFQbs/sYKf8OY8+VXWa5jYUthKZUgz8aKPYu4LY732gcGZbSBmrqaZU+sH0aJHjZPekGhIE/wV3xvB0fDmwhLowDJP585JDVMRM22MgYER5sX6dq2ENKlPkjyUfsydN9NzYoqghvSMirwFE8YUP8qu87L2fEEHrghYohztkEqN0ZPyZe89AInkj56Ozbe6Et0nWnE16OM9rh8cj6FFlgyWG5z9vuTIGLY7qXkxjltk43LEMHHwI1JhfKUOFk9GsTZntnOXzexk+tl63XQR1wtxWVnWNZdLuNjS0sPMwOUzvJhoUnzwysvh9DZZ72yi4hUxLHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5tUGYntaUd53xaqzIZYrZvK4BIYOF11ajrkgKUsExk=;
 b=lOOH67e/DDUiVxhm2kWR52rmVGeNX7Wpj3Fl4y6yW8la+0bLdYs5YejoXlxOf7UxAaLUqoE3MEi1BYCc4u1oBYqRRL48CGMcYy5K8CgRzITI9BBZ1RV/0+Y546dm6+be1Gvd7kwqho08qUlR5XRuvU9qVcGuU0GXVmrqMk3n4DM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB4382.namprd12.prod.outlook.com (2603:10b6:806:9a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Fri, 1 Mar
 2024 07:01:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7339.031; Fri, 1 Mar 2024
 07:01:24 +0000
Message-ID: <ef555237-4745-4765-b7e3-093460d7a8e5@amd.com>
Date: Fri, 1 Mar 2024 08:01:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Zeng, Oak" <oak.zeng@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Felix Kuehling <felix.kuehling@amd.com>,
 "jglisse@redhat.com" <jglisse@redhat.com>
Cc: "Welty, Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Gupta, saurabhg" <saurabhg.gupta@intel.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <SA1PR11MB6991FDAFF07E3654538F5BBF92552@SA1PR11MB6991.namprd11.prod.outlook.com>
 <df2df998-af26-4ae9-a0a4-5aac1b9e3c73@amd.com>
 <SA1PR11MB6991786DA69422A1A6095A1E92592@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991B3DA606280EBC6952D1092582@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ada8e6cc-a7d2-4b6f-8f70-f0448cc2e420@amd.com>
 <7eb835594110980f2e9f061512fd488bbd63fd11.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <7eb835594110980f2e9f061512fd488bbd63fd11.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB4382:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c19e9e8-7a3b-4c1d-904a-08dc39bd6862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZZ5PyzFDDIX29oWKLcdKZh6UYoOsR3+WR+rwfHRWFpA/2bxOETBIiJ4znN/hqA08r4pBU7R7TDRmF53q2LBd4K0WYFK/x2DuhzCsmQQSZT1R2uX9ZdoSEbwUiLbXAeYb7opOgFDXi19SzhdjeQJXxEPmhudPXtfTpS2KkW7qIU6ADZr5Al17VM7xc5KTMXZ1Vj53tgGhFkDtmRnAc8MD6ECFEVX3ucLrAOYmG/KyHi7GX1Z1EQ16dJrytIgHVnrvIttYvAQMueIZwWOlzPuT8MLVb1isZ7xC98T++Bj2h6RsFJoAaKqVo8drKZfY7HhFb550SmdSRvjjnDKbShdgXgiZLbT974sFSXEZ9DQv+FNIHqicU0TRYJQybRprZ6FZzbeiHKq1FRUxVZFVWyyuotO0/JZn99mZjf68n6Myal4eOA4A46MlbeL3YtisGqNpMGhZzUTIOgLmDDaCJxipy9mMfKXxoHXvpuEo707NDvhi2vq0EV3hKbjF3Q+n+nO+6Xt9baMj4SCghu1efQl8bDpHXMUGefD2tRNKxXCOBA3vECtPYVYkjZSOm4t1IX0g4BOpz2A/XKZDkr6LXeSJ+uo02mMKGDvVTRgkn+cyLNneWLyypRcfaSvxPEmFMocZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTVwb000WkUvR3gvOCtDSEYvdWVqa0tHYU1Cd1B5cmkxRzc5UUozRFdEb1NO?=
 =?utf-8?B?d0ZFQnkrai9DdU5KeTdpZVdseVExbE1OVWExc1NMRWtTZTgzT1ZYSHZmZGUw?=
 =?utf-8?B?c0lVdHQ5M2FucWdQRW0waXIxdWVXT1dER00yckJHWERUZlRXUGc3blVmRHFz?=
 =?utf-8?B?RTI0WHNjUVlBSlNrQXNuUTFlMGw2OTZOeGE5TGxVQlRzekI1ZE1BRGczT2ZW?=
 =?utf-8?B?OS9TOUJiWVJxYmkrWGdaRzlicm5McUF2TU9tZVRQd2tNWTNJamd0QlpBTmJr?=
 =?utf-8?B?dlVHa2t4NmVOMFNkdVVFZmlPK0R0SXRNTHhhVXRmdEh6MVdab3VFR2N3cjZl?=
 =?utf-8?B?RW1LMCtGZUl2OGxpWFhSRDVnRGRTdWplSkZ2WU5GUkVJV3BETFBiUkRYK1J5?=
 =?utf-8?B?bjJpbXBWRnk1LzlQdTdvcGpqem5VTmlSTVFSalAzM0pOZk5JS2FOR0N4V0pP?=
 =?utf-8?B?K0l4cFVDVCs3ZS95UlZYZVB5Ym42U3gxQzc5WVNpQVRkMVZzWUlLNzhWSjZh?=
 =?utf-8?B?cU43cDdRUVpaQkc1WUh4N2creHRJZTF4enRCb1huTlY2RjU0dHBtVGo2Smty?=
 =?utf-8?B?b2VVQ3VNUTZWZDVCMHZUQ1BBY0o1RzN1SmFBRTFVVTJ3WDB2YjBqc2dTTnpH?=
 =?utf-8?B?ZHFRaFAvUlREU0MxYjVqcHRnMUIvcUo2bmg2dWo2cmJLMVptMHZzUEYxVWNK?=
 =?utf-8?B?RHR0VEs1NzYveGxWN1FneS90aWpIeGlVVnB5ZllUcmJDdkVORGV0V2xwSHdK?=
 =?utf-8?B?VmxEVFFKdHVmWC9VZlZNK1FoVGM4Nko1aUpUS3pkMVV0TGdMTHlkZWZidzdK?=
 =?utf-8?B?RDd5NGFIWllLUXBaQ2xFNFhiMDdFNEFLSFM4WWNuZ3RkYnRIcmtEY2lCTkNH?=
 =?utf-8?B?TDNQYzhhci9NelNpQ3hZM3lGWGVZaVZyM3NTKzNjU1J6NG1EZmdLSmlrcjJU?=
 =?utf-8?B?R1JEMGZwYWczZzEvMDhVNXBxazZicElINGtaTENVZ3ZPVTdFN2hpVnFpVDFu?=
 =?utf-8?B?Zm5RcE1jTWFWMklySWdmRVNmRFdXMmlmNzlJVnRhSGx4dUtZS0RrQzNEeVZy?=
 =?utf-8?B?eDZDUVk0Zlg3N09CR2k1MTZxaThSTzUyWlN5MHpQMkxnUFlNWWZsWDNzVXYw?=
 =?utf-8?B?Wk5Pc3AvVzYxZ0NkOE9xWlFwMkVCbVkvd25pK3NScjlzNGh5VzhtTEtJWTZi?=
 =?utf-8?B?UkZqbkRaOHNxOXB0WHpQOVJscE5RdFFSa2dxelNmK1Jna1kzU3JGRkllTkdk?=
 =?utf-8?B?T0RtWDJ2UjFPU0h1VDVUSGxtd1FKRG11dEV4V0xEZGlROVBJMUY3czEyb2VY?=
 =?utf-8?B?Q1ZTWDg3UVB3YjE5d0VmWFpkUzN3NVBWOE9CMFIrdzcxYk5MaXB5a3VkbGxN?=
 =?utf-8?B?bjQwOUFNZFNKVlpqa1gyOEhXeGJ0bTdyZFFObDJkc0FZeHhLREV3RjE3UTBX?=
 =?utf-8?B?VWVyUHpzSEdUNWlEUStrcVdiL2hxN0xUeHlhZzZmdFZCbU1QRFJ2TjlzaWZC?=
 =?utf-8?B?SERCRVI1YkVZaUZSQVpMd1NIMERuYTkyT1hZL3V6ZHNYNTNvNTluSlladDVS?=
 =?utf-8?B?bmpEUG5qYXNEaC9iTWxadmVwWGVFWGRsRStlbE5nZFhxQWVIMXVXNkF2WkFt?=
 =?utf-8?B?MVRqdlRXNXBFWUNtdnJVeVp1MGlrRFBOcS9qUTAxMEtaMDRES05KRzZuUHAz?=
 =?utf-8?B?S1NycXVsYWdsdFl0QVErd29mK3JNb05zNnZTK2s5c3FUOUNrbUI5R0RDOW04?=
 =?utf-8?B?OEVjeG9EVHVkTUhUakx2eW0yNmFvUnpZbjg0Znl0R1NPeHNydHhKVC9jeXR0?=
 =?utf-8?B?c2ViTzNTeGp6aytKMVF1cGpqRU5LNGZBV2l1b0JVdUhBQURSNmJTYjJLdFFq?=
 =?utf-8?B?c1NRT1RjcllZVmwzeCsrMlpLUEZlcGxBaTBNL3V2Y0ZnU0hGZG1uaHpKalYr?=
 =?utf-8?B?NHhtd3F4b3hnU2VBVjVsQkpBbkVEWjhGSU9pLytMRCtvZVZkVnFPM1owUDl3?=
 =?utf-8?B?NS9qT2s2UjVSRnp1dWxxT3VSRFJPRm1Ndm1ZVVBubFFuUzlpR3AvVlNINnRa?=
 =?utf-8?B?NjZuOVNoaENiQVFURGMyYXg5RmN4TkZWb3BqNmdNOWV6c3FTMGR5UEZKRFhE?=
 =?utf-8?Q?GpNqHTo5f3W24lhFqKH6FsdpH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c19e9e8-7a3b-4c1d-904a-08dc39bd6862
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 07:01:24.5152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FvSbBu2DQZMOMlGWU/L1rrjIYRG6qyl04BzQtTH/ZQnx3RLkb2/irNwgysKVqQFc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4382
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

Hi Thomas,

Am 29.02.24 um 18:12 schrieb Thomas Hellström:
> Hi, Christian.
>
> On Thu, 2024-02-29 at 10:41 +0100, Christian König wrote:
>> Am 28.02.24 um 20:51 schrieb Zeng, Oak:
>>> The mail wasn’t indent/preface correctly. Manually format it.
>>>
>>> *From:*Christian König <christian.koenig@amd.com>
>>> *Sent:* Tuesday, February 27, 2024 1:54 AM
>>> *To:* Zeng, Oak <oak.zeng@intel.com>; Danilo Krummrich
>>> <dakr@redhat.com>; Dave Airlie <airlied@redhat.com>; Daniel Vetter
>>> <daniel@ffwll.ch>; Felix Kuehling <felix.kuehling@amd.com>;
>>> jglisse@redhat.com
>>> *Cc:* Welty, Brian <brian.welty@intel.com>;
>>> dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org;
>>> Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Ghimiray, Himal
>>> Prasad
>>> <himal.prasad.ghimiray@intel.com>;
>>> Thomas.Hellstrom@linux.intel.com;
>>> Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>;
>>> Brost, Matthew <matthew.brost@intel.com>; Gupta, saurabhg
>>> <saurabhg.gupta@intel.com>
>>> *Subject:* Re: Making drm_gpuvm work across gpu devices
>>>
>>> Hi Oak,
>>>
>>> Am 23.02.24 um 21:12 schrieb Zeng, Oak:
>>>
>>>      Hi Christian,
>>>
>>>      I go back this old email to ask a question.
>>>
>>>
>>> sorry totally missed that one.
>>>
>>>      Quote from your email:
>>>
>>>      “Those ranges can then be used to implement the SVM feature
>>>      required for higher level APIs and not something you need at
>>> the
>>>      UAPI or even inside the low level kernel memory management.”
>>>
>>>      “SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This
>>>      should not have any influence on the design of the kernel
>>> UAPI.”
>>>
>>>      There are two category of SVM:
>>>
>>>      1.driver svm allocator: this is implemented in user space,
>>>   i.g.,
>>>      cudaMallocManaged (cuda) or zeMemAllocShared (L0) or
>>>      clSVMAlloc(openCL). Intel already have gem_create/vm_bind in
>>> xekmd
>>>      and our umd implemented clSVMAlloc and zeMemAllocShared on top
>>> of
>>>      gem_create/vm_bind. Range A..B of the process address space is
>>>      mapped into a range C..D of the GPU address space, exactly as
>>> you
>>>      said.
>>>
>>>      2.system svm allocator:  This doesn’t introduce extra driver
>>> API
>>>      for memory allocation. Any valid CPU virtual address can be
>>> used
>>>      directly transparently in a GPU program without any extra
>>> driver
>>>      API call. Quote from kernel Documentation/vm/hmm.hst: “Any
>>>      application memory region (private anonymous, shared memory, or
>>>      regular file backed memory) can be used by a device
>>> transparently”
>>>      and “to share the address space by duplicating the CPU page
>>> table
>>>      in the device page table so the same address points to the same
>>>      physical memory for any valid main memory address in the
>>> process
>>>      address space”. In system svm allocator, we don’t need that
>>> A..B
>>>      C..D mapping.
>>>
>>>      It looks like you were talking of 1). Were you?
>>>
>>>
>>> No, even when you fully mirror the whole address space from a
>>> process
>>> into the GPU you still need to enable this somehow with an IOCTL.
>>>
>>> And while enabling this you absolutely should specify to which part
>>> of
>>> the address space this mirroring applies and where it maps to.
>>>
>>> */[Zeng, Oak] /*
>>>
>>> Lets say we have a hardware platform where both CPU and GPU support
>>> 57bit(use it for example. The statement apply to any address range)
>>> virtual address range, how do you decide “which part of the address
>>> space this mirroring applies”? You have to mirror the whole address
>>> space [0~2^57-1], do you? As you designed it, the gigantic
>>> vm_bind/mirroring happens at the process initialization time, and
>>> at
>>> that time, you don’t know which part of the address space will be
>>> used
>>> for gpu program. Remember for system allocator, *any* valid CPU
>>> address can be used for GPU program.  If you add an offset to
>>> [0~2^57-1], you get an address out of 57bit address range. Is this
>>> a
>>> valid concern?
>>>
>> Well you can perfectly mirror on demand. You just need something
>> similar
>> to userfaultfd() for the GPU. This way you don't need to mirror the
>> full
>> address space, but can rather work with large chunks created on
>> demand,
>> let's say 1GiB or something like that.
>
> What we're looking at as the current design is an augmented userptr
> (A..B -> C..D mapping) which is internally sparsely populated in
> chunks. KMD manages the population using gpu pagefaults. We acknowledge
> that some parts of this mirror will not have a valid CPU mapping. That
> is, no vma so a gpu page-fault that resolves to such a mirror address
> will cause an error. Would you have any concerns / objections against
> such an approach?

Nope, as far as I can see that sounds like a perfectly valid design to me.

Regards,
Christian.

>
> Thanks,
> Thomas
>
>
>

