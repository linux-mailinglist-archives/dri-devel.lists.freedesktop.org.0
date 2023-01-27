Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A684167DEBA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 08:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADD010E3FC;
	Fri, 27 Jan 2023 07:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC2310E3FC;
 Fri, 27 Jan 2023 07:55:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4B/te+Ap3diu2oAxyGO0kGWhh+5O7h1LD9Lk+s7bKvFgBLjMKnsioKOpFtSPEHpaz2oy6ifUB4m9vk8oJzs6dp/LJvtDXZPW6jkZdca3TDdS57rMy3YRNOgUj7kQFBW+Nr5/8Tdwm5I7PAA5htBKDXO9J1iKvoj2uoFrryEEaxDbYFfJJUTr66mTnlPgQVQr+Mgpj9csYfgJnQSmPmirCEgqkGm++pzIsuAacbDceLjrwXivz0jPIhpDrCE7bF+jb9GzCIwJ4bjge9hMSNjQBVyRdLxLtpjSRkoOZ6ptDKHjmiL1gn/+v41x/hIN6nfIpoq1EYdszI/p3sSRPUt6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoUHfWKJf00b2WVZdqUMajHXMEKEawXASJsDaQkiv5I=;
 b=Aj7AL+bYZPDf1pEJ7GW0YrGZaoxF3DOkxZC8AUaimbT+7GFiaWCzJxo7SUf4pwtS7mjJPH/QssD6P5/ARIvzz2wgqEJrd/28Ds4GT/hHowPNp71iakHxWmFiIwFYO3SxPrUj95g9TjKhJZexHg76Kau5a8CRCKLk+se1naUuvYgynCARLkzOkaQ1vB6iartW826szeCm+2ptbn971YJXGg3grRCMRRAOJV4MELRPD35K4McqW6gLN1KWy1A3235zdZF/0N8q6pLkr1MXm2c3S5We/FZvm91MztHv53qcdAlm9IwkSj34oDyhoAZATOT9KMjajZXHsUVjRstCaUA+cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoUHfWKJf00b2WVZdqUMajHXMEKEawXASJsDaQkiv5I=;
 b=Rbpyc2Vb82GlqaVMOpoLc1+ebo+4iM8q14wZqhAApJqgnYGv5FQsvaeBISKmxIbJgWl8LfLXz0+KaaML2afXjlVwY4cncmxKHjf7KZUN0dSuWpO1iDca+hVn9iOTi2eoX2qUz/bQSR/hMWsxXoqsHYY++HlVjBp11uFPCZHqF4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY8PR12MB7489.namprd12.prod.outlook.com (2603:10b6:930:90::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 07:55:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6043.017; Fri, 27 Jan 2023
 07:55:14 +0000
Message-ID: <c2256c7d-e768-ae3f-d465-b9f8080d111b@amd.com>
Date: Fri, 27 Jan 2023 08:55:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi interfaces
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
 <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY8PR12MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 62be27d9-a871-4df5-6bfb-08db003bd2e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BN4iydViVk7hHR3PKeAAgX7gfUYXLsIgD9mbnnYHqIyhjvnGbaK6R6enhGBuPTvaT9sKx0rMXG3P7+/huSUzWKudG5jiM/UQbgVrwemj4qg+QZCuW1muPrNO834fLPZsJe19SJmKYSTW6oU347dR79Whk8FlpZfGiAKoz/KKw8+D5xZG0t8XFUGml9fTmlNRXctgtR47j9czz/nBTUCsa5S7z53dyALDQ+rLhceuddEGE/dZ7Jm83eQhUTTS0saNVW4ZryEsC88d68dlP+7cu8OotDCPNDCvVXEJ0jA/+if79RHTqZzkFFiH6QmEyNWUFv66u3GdHvx2tCxQMq0NsIosqPsYEwE9/TvpxGnro262mM6ytMZ0uNjPccY0n1b2My/yWZlh37D/TWzdXeQi8fpmr7MBWYb1cmypqoUD8QA1+fgqVRB+BJ6uHUugQ7dbLplglCOTwaU669naS0OCe5gW7JBshO8yz4hvnS2+g04n3z/L4qGZk+/4w5LwYUpMIsQbwaH84tzrttl2tNxeEZGgLtxW6LXwz1sJahYqKE3X4dLEcVibWO/pSOswJYPAoE7BcSsEamOvBmatkZy5T1JeWEr6mcx/fHmFeAe77dgPomEvz6ieuAx5j0pDDA24w724CkTNOP341KTMKruHc+GRCALAp2XE612fzA1ASvwq2z9SW7Ybmp63Dd2UBl/saq3nkOuWGl9t8wkKJePqSpyNcIt2XWf7NSxptE7DXp4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199018)(6486002)(186003)(31686004)(6512007)(478600001)(2616005)(83380400001)(6666004)(316002)(41300700001)(8676002)(38100700002)(6506007)(53546011)(110136005)(8936002)(7416002)(86362001)(4326008)(66946007)(30864003)(5660300002)(66556008)(31696002)(66476007)(36756003)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S01KWHc2eVg1TjFIVjVLRWJ5K0dybXNFbHBMWm5FUGxEcFBtNzczc1hOV3dB?=
 =?utf-8?B?Y3NWZmN2NDN5Wm43SFdkTjZMMTlIZUtRMXJ0S05qR0hkSHJhb0VDOTVWKy8r?=
 =?utf-8?B?V3dJOVBvUTJuOTBOOFQ3RjhMQnZyb3l0S1ZvbDVnYUdOZ1VDTXZSM3BwNlZt?=
 =?utf-8?B?ZGtxd3oxRGlUZGd0anBMdWh0SjdFL2FlVytBNTlwRE5ud2JKa3RlVE50OW9T?=
 =?utf-8?B?NEZZZVp1L3lHeG5uZlUyNUhjcEMwdFAzQWZaa1NpNVdHdFlIcnFKN2Y0eEQw?=
 =?utf-8?B?QmFpajZNLzJkUEp6THQxWENmSnlYVXFnQ2hjSFVXYzMrVjJoYjZsbm5CR3By?=
 =?utf-8?B?bytSNUt2M2NENk1iR1gyeW1aVEVpTzEvUmpUSWpCZkUvTUx3MEU5TDdrLzRR?=
 =?utf-8?B?YWduK0NTZkE3a2Z3VTlVcDFIQVlCOGtTdjNrUnArWGZOalQ3a0ZkT1FGejBl?=
 =?utf-8?B?Z2lMdlBFaEZhY2lOY0pFdVNNTFc4aC8zZUxtTDdIVVUwWHdST3lSdzFkTkZV?=
 =?utf-8?B?M1VjTlBOVk4wVmRYeUFnbHJQd080OWJ2RVh4SFNYZUh6UmEwenpxQnhGeE9h?=
 =?utf-8?B?ZkpOOCsxc0lpeWVvYXMwTE4yR0hJMkhXSDBMM2ZJdmthTzQzR1E3WFV4eFc1?=
 =?utf-8?B?Yzdxbms5S3h6b0s2VUl2dXpTU0Qxd3g5M0t4WW5SOHV0R1ZYdGNmN3RBTFY3?=
 =?utf-8?B?TVR4NlJUWERrWksrUXJubjdMNmRVVHhPNkVSVWNiMmhGZ0R6STFvMVZ3STVj?=
 =?utf-8?B?SVJhblY1d1ViRitQRWVuRHYwa3VERmx0Yno0WXViNDFTbTlYdlBjYTc3THpF?=
 =?utf-8?B?R3h0YWgwNUg5NUxyUzcxRFBGZGhHNE1ydEpUM1BSQnhJZDdaRnBidzNML25k?=
 =?utf-8?B?VHlFQTBvRUZmNnROQ1NLcVlXMEM1RGZpU1p2U0lDVjlwak1EQUpNWldwMmty?=
 =?utf-8?B?cGtROWRXQjF6YTl4L3QrYnVtc0t0bnJram90ZTRESXZWQTRUdURyamQvUzJz?=
 =?utf-8?B?ZWFQWi9UK0w2YWF4RmJFVDNkSTVSNDFVMWR0cHBEdGVSV3dRajFuMFRZU2tr?=
 =?utf-8?B?QnBhMmFxU3hZVzB4SlQ1SVphbWp0eFliZmY3cmZTVWlYQ2NyMnk2akhtc3ZX?=
 =?utf-8?B?VHJ0M3k2QmNFZlFPSDlxUTF5SWFDQjhnZHpqSjBpbjE0SGJoalA1VVR3bExa?=
 =?utf-8?B?ZjhOYzN1cWlaRStLUFlwcGtoalZiam1pWGh3blNGVDJ3U1RHS0l2MEtMai90?=
 =?utf-8?B?NS9uWFVsL2IzSjYzaWJBLzZOaGhDZUtRRTd5dXgxa29MSXk3dk1ORDZvOHlr?=
 =?utf-8?B?akFIZXVlQ01jZDN3clZhOFhid1VmV2IxWitJdjZaOXdWNXBKMDQxa1gwS1NT?=
 =?utf-8?B?ck1BREw2bWRlL1h3Q0JoTWUwODJYY09vZWFCQ3FrWmF0L09QU0RxZlR2NjJv?=
 =?utf-8?B?eUZma2JaZEg2YzRYMkNSQVdYUm44bndBU3UvdzZBUlI5YytzSzNySjVPVWts?=
 =?utf-8?B?Q2IySkJWWVFNT3FMVWJpRytHQlJWenVBOVhqOWhJL21iOG13a0c3SEtwOGZp?=
 =?utf-8?B?K1RkNkFxYjZVZnA4QktZMkJYYld0UzVoRUc0QXR0QnlIeFY2NWFEUE5uYjlL?=
 =?utf-8?B?VDZ3S1FmVmgwVFhiVi9LTW13SnJjd0ozcFdicFBCZmw5ZCtYeWdCZUJMa0ly?=
 =?utf-8?B?THUxNkFCVDh3RCtNSzVjNjFjMWNITUtQZ0pnb2RGeEhWSW5qODI1OHlQQkhC?=
 =?utf-8?B?MUx5RHgwM3E0SkZUb015cjdiNktTbWIwbEVUYWlKVDdmbm9kN0g2SmpLL3F3?=
 =?utf-8?B?eE5xRXcyNWhZMS9IUDFNNFVvS1RQSEcyZVVHMWtDV3FpRGFOZVl6OFJLMDQx?=
 =?utf-8?B?TWdqTERoRHlDOERrd0VFVW1kS0ZWWE56c0U1ZW12VTZvOTZJV0FIazVmQndW?=
 =?utf-8?B?alNXNXVGU1lmWHQrZ2hRN2JFV2pyMWxyKytZUUZLc2hUanE2OUxxMmNjN25y?=
 =?utf-8?B?Y1hMTUZFWmRMVndkWjEwc25BaTJwZWlGREVHNUtVb1QrdDhqNmtzMmwxTkdu?=
 =?utf-8?B?RHZEUGJ2VWY1RUdmN0RKYXhib3piZDZLZDFqeXVNWTQ4dmc3aldHemZxM0Nm?=
 =?utf-8?B?QnNyL3AzSWtkTE9DQ3oxY2FnMlM3L3Z4dFM4ZlNmVU41aEx1RVRoUTdGWnRt?=
 =?utf-8?Q?yYlgRXJS5sGCxXsFbIALezyA95lcAglV4SSZ1vamh6Q1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62be27d9-a871-4df5-6bfb-08db003bd2e7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 07:55:14.6228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1dBMY9jp1GdN1WV+veeLa1BmWlZ/B0hx4jozjKzHWbSMQpyhbxrLaY8ztbUkvxj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7489
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
Cc: corbet@lwn.net, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bskeggs@redhat.com,
 jason@jlekstrand.net, nouveau@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.01.23 um 02:26 schrieb Danilo Krummrich:
> On 1/27/23 02:05, Matthew Brost wrote:
>> On Wed, Jan 18, 2023 at 07:12:47AM +0100, Danilo Krummrich wrote:
>>> This commit provides the interfaces for the new UAPI motivated by the
>>> Vulkan API. It allows user mode drivers (UMDs) to:
>>>
>>> 1) Initialize a GPU virtual address (VA) space via the new
>>>     DRM_IOCTL_NOUVEAU_VM_INIT ioctl. UMDs can provide a kernel reserved
>>>     VA area.
>>>
>>> 2) Bind and unbind GPU VA space mappings via the new
>>>     DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
>>>
>>> 3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.
>>>
>>> Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC support
>>> asynchronous processing with DRM syncobjs as synchronization mechanism.
>>>
>>> The default DRM_IOCTL_NOUVEAU_VM_BIND is synchronous processing,
>>> DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.
>>>
>>> Co-authored-by: Dave Airlie <airlied@redhat.com>
>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>> ---
>>>   Documentation/gpu/driver-uapi.rst |   8 ++
>>>   include/uapi/drm/nouveau_drm.h    | 216 
>>> ++++++++++++++++++++++++++++++
>>>   2 files changed, 224 insertions(+)
>>>
>>> diff --git a/Documentation/gpu/driver-uapi.rst 
>>> b/Documentation/gpu/driver-uapi.rst
>>> index 4411e6919a3d..9c7ca6e33a68 100644
>>> --- a/Documentation/gpu/driver-uapi.rst
>>> +++ b/Documentation/gpu/driver-uapi.rst
>>> @@ -6,3 +6,11 @@ drm/i915 uAPI
>>>   =============
>>>     .. kernel-doc:: include/uapi/drm/i915_drm.h
>>> +
>>> +drm/nouveau uAPI
>>> +================
>>> +
>>> +VM_BIND / EXEC uAPI
>>> +-------------------
>>> +
>>> +.. kernel-doc:: include/uapi/drm/nouveau_drm.h
>>> diff --git a/include/uapi/drm/nouveau_drm.h 
>>> b/include/uapi/drm/nouveau_drm.h
>>> index 853a327433d3..f6e7d40201d4 100644
>>> --- a/include/uapi/drm/nouveau_drm.h
>>> +++ b/include/uapi/drm/nouveau_drm.h
>>> @@ -126,6 +126,216 @@ struct drm_nouveau_gem_cpu_fini {
>>>       __u32 handle;
>>>   };
>>>   +/**
>>> + * struct drm_nouveau_sync - sync object
>>> + *
>>> + * This structure serves as synchronization mechanism for 
>>> (potentially)
>>> + * asynchronous operations such as EXEC or VM_BIND.
>>> + */
>>> +struct drm_nouveau_sync {
>>> +    /**
>>> +     * @flags: the flags for a sync object
>>> +     *
>>> +     * The first 8 bits are used to determine the type of the sync 
>>> object.
>>> +     */
>>> +    __u32 flags;
>>> +#define DRM_NOUVEAU_SYNC_SYNCOBJ 0x0
>>> +#define DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ 0x1
>>> +#define DRM_NOUVEAU_SYNC_TYPE_MASK 0xf
>>> +    /**
>>> +     * @handle: the handle of the sync object
>>> +     */
>>> +    __u32 handle;
>>> +    /**
>>> +     * @timeline_value:
>>> +     *
>>> +     * The timeline point of the sync object in case the syncobj is of
>>> +     * type DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ.
>>> +     */
>>> +    __u64 timeline_value;
>>> +};
>>> +
>>> +/**
>>> + * struct drm_nouveau_vm_init - GPU VA space init structure
>>> + *
>>> + * Used to initialize the GPU's VA space for a user client, telling 
>>> the kernel
>>> + * which portion of the VA space is managed by the UMD and kernel 
>>> respectively.
>>> + */
>>> +struct drm_nouveau_vm_init {
>>> +    /**
>>> +     * @unmanaged_addr: start address of the kernel managed VA 
>>> space region
>>> +     */
>>> +    __u64 unmanaged_addr;
>>> +    /**
>>> +     * @unmanaged_size: size of the kernel managed VA space region 
>>> in bytes
>>> +     */
>>> +    __u64 unmanaged_size;
>>> +};
>>> +
>>> +/**
>>> + * struct drm_nouveau_vm_bind_op - VM_BIND operation
>>> + *
>>> + * This structure represents a single VM_BIND operation. UMDs 
>>> should pass
>>> + * an array of this structure via struct drm_nouveau_vm_bind's 
>>> &op_ptr field.
>>> + */
>>> +struct drm_nouveau_vm_bind_op {
>>> +    /**
>>> +     * @op: the operation type
>>> +     */
>>> +    __u32 op;
>>> +/**
>>> + * @DRM_NOUVEAU_VM_BIND_OP_ALLOC:
>>> + *
>>> + * The alloc operation is used to reserve a VA space region within 
>>> the GPU's VA
>>> + * space. Optionally, the &DRM_NOUVEAU_VM_BIND_SPARSE flag can be 
>>> passed to
>>> + * instruct the kernel to create sparse mappings for the given region.
>>> + */
>>> +#define DRM_NOUVEAU_VM_BIND_OP_ALLOC 0x0
>>
>> Do you really need this operation? We have no concept of this in Xe,
>> e.g. we can create a VM and the entire address space is managed exactly
>> the same.
>
> The idea for alloc/free is to let UMDs allocate a portion of the VA 
> space (which I call a region), basically the same thing Vulkan 
> represents with a VKBuffer.

If that's mangled into the same component/interface then I can say from 
experience that this is a pretty bad idea. We have tried something 
similar with radeon and it turned out horrible.

What you want is one component for tracking the VA allocations (drm_mm 
based) and a different component/interface for tracking the VA mappings 
(probably rb tree based).

amdgpu has even gotten so far that the VA allocations are tracked in 
libdrm in userspace.

Regards,
Christian.

>
> It serves two purposes:
>
> 1. It gives the kernel (in particular the GPUVA manager) the bounds in 
> which it is allowed to merge mappings. E.g. when a user request asks 
> for a new mapping and we detect we could merge this mapping with an 
> existing one (used in another VKBuffer than the mapping request came 
> for) the driver is not allowed to change the page table for the 
> existing mapping we want to merge with (assuming that some drivers 
> would need to do this in order to merge), because the existing mapping 
> could already be in use and by re-mapping it we'd potentially cause a 
> fault on the GPU.
>
> 2. It is used for sparse residency in a way that such an allocated VA 
> space region can be flagged as sparse, such that the kernel always 
> keeps sparse mappings around for the parts of the region that do not 
> contain actual memory backed mappings.
>
> If for your driver merging is always OK, creating a single huge region 
> would do the trick I guess. Otherwise, we could also add an option to 
> the GPUVA manager (or a specific region, which could also be a single 
> huge one) within which it never merges.
>
>>
>> If this can be removed then the entire concept of regions in the GPUVA
>> can be removed too (drop struct drm_gpuva_region). I say this because
>> in Xe as I'm porting over to GPUVA the first thing I'm doing after
>> drm_gpuva_manager_init is calling drm_gpuva_region_insert on the entire
>> address space. To me this seems kinda useless but maybe I'm missing why
>> you need this for Nouveau.
>>
>> Matt
>>
>>> +/**
>>> + * @DRM_NOUVEAU_VM_BIND_OP_FREE: Free a reserved VA space region.
>>> + */
>>> +#define DRM_NOUVEAU_VM_BIND_OP_FREE 0x1
>>> +/**
>>> + * @DRM_NOUVEAU_VM_BIND_OP_MAP:
>>> + *
>>> + * Map a GEM object to the GPU's VA space. The mapping must be 
>>> fully enclosed by
>>> + * a previously allocated VA space region. If the region is sparse, 
>>> existing
>>> + * sparse mappings are overwritten.
>>> + */
>>> +#define DRM_NOUVEAU_VM_BIND_OP_MAP 0x2
>>> +/**
>>> + * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:
>>> + *
>>> + * Unmap an existing mapping in the GPU's VA space. If the region 
>>> the mapping
>>> + * is located in is a sparse region, new sparse mappings are 
>>> created where the
>>> + * unmapped (memory backed) mapping was mapped previously.
>>> + */
>>> +#define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x3
>>> +    /**
>>> +     * @flags: the flags for a &drm_nouveau_vm_bind_op
>>> +     */
>>> +    __u32 flags;
>>> +/**
>>> + * @DRM_NOUVEAU_VM_BIND_SPARSE:
>>> + *
>>> + * Indicates that an allocated VA space region should be sparse.
>>> + */
>>> +#define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8)
>>> +    /**
>>> +     * @handle: the handle of the DRM GEM object to map
>>> +     */
>>> +    __u32 handle;
>>> +    /**
>>> +     * @addr:
>>> +     *
>>> +     * the address the VA space region or (memory backed) mapping 
>>> should be mapped to
>>> +     */
>>> +    __u64 addr;
>>> +    /**
>>> +     * @bo_offset: the offset within the BO backing the mapping
>>> +     */
>>> +    __u64 bo_offset;
>>> +    /**
>>> +     * @range: the size of the requested mapping in bytes
>>> +     */
>>> +    __u64 range;
>>> +};
>>> +
>>> +/**
>>> + * struct drm_nouveau_vm_bind - structure for 
>>> DRM_IOCTL_NOUVEAU_VM_BIND
>>> + */
>>> +struct drm_nouveau_vm_bind {
>>> +    /**
>>> +     * @op_count: the number of &drm_nouveau_vm_bind_op
>>> +     */
>>> +    __u32 op_count;
>>> +    /**
>>> +     * @flags: the flags for a &drm_nouveau_vm_bind ioctl
>>> +     */
>>> +    __u32 flags;
>>> +/**
>>> + * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:
>>> + *
>>> + * Indicates that the given VM_BIND operation should be executed 
>>> asynchronously
>>> + * by the kernel.
>>> + *
>>> + * If this flag is not supplied the kernel executes the associated 
>>> operations
>>> + * synchronously and doesn't accept any &drm_nouveau_sync objects.
>>> + */
>>> +#define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1
>>> +    /**
>>> +     * @wait_count: the number of wait &drm_nouveau_syncs
>>> +     */
>>> +    __u32 wait_count;
>>> +    /**
>>> +     * @sig_count: the number of &drm_nouveau_syncs to signal when 
>>> finished
>>> +     */
>>> +    __u32 sig_count;
>>> +    /**
>>> +     * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
>>> +     */
>>> +    __u64 wait_ptr;
>>> +    /**
>>> +     * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finished
>>> +     */
>>> +    __u64 sig_ptr;
>>> +    /**
>>> +     * @op_ptr: pointer to the &drm_nouveau_vm_bind_ops to execute
>>> +     */
>>> +    __u64 op_ptr;
>>> +};
>>> +
>>> +/**
>>> + * struct drm_nouveau_exec_push - EXEC push operation
>>> + *
>>> + * This structure represents a single EXEC push operation. UMDs 
>>> should pass an
>>> + * array of this structure via struct drm_nouveau_exec's &push_ptr 
>>> field.
>>> + */
>>> +struct drm_nouveau_exec_push {
>>> +    /**
>>> +     * @va: the virtual address of the push buffer mapping
>>> +     */
>>> +    __u64 va;
>>> +    /**
>>> +     * @va_len: the length of the push buffer mapping
>>> +     */
>>> +    __u64 va_len;
>>> +};
>>> +
>>> +/**
>>> + * struct drm_nouveau_exec - structure for DRM_IOCTL_NOUVEAU_EXEC
>>> + */
>>> +struct drm_nouveau_exec {
>>> +    /**
>>> +     * @channel: the channel to execute the push buffer in
>>> +     */
>>> +    __u32 channel;
>>> +    /**
>>> +     * @push_count: the number of &drm_nouveau_exec_push ops
>>> +     */
>>> +    __u32 push_count;
>>> +    /**
>>> +     * @wait_count: the number of wait &drm_nouveau_syncs
>>> +     */
>>> +    __u32 wait_count;
>>> +    /**
>>> +     * @sig_count: the number of &drm_nouveau_syncs to signal when 
>>> finished
>>> +     */
>>> +    __u32 sig_count;
>>> +    /**
>>> +     * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
>>> +     */
>>> +    __u64 wait_ptr;
>>> +    /**
>>> +     * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finished
>>> +     */
>>> +    __u64 sig_ptr;
>>> +    /**
>>> +     * @push_ptr: pointer to &drm_nouveau_exec_push ops
>>> +     */
>>> +    __u64 push_ptr;
>>> +};
>>> +
>>>   #define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
>>>   #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
>>>   #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
>>> @@ -136,6 +346,9 @@ struct drm_nouveau_gem_cpu_fini {
>>>   #define DRM_NOUVEAU_NVIF               0x07
>>>   #define DRM_NOUVEAU_SVM_INIT           0x08
>>>   #define DRM_NOUVEAU_SVM_BIND           0x09
>>> +#define DRM_NOUVEAU_VM_INIT            0x10
>>> +#define DRM_NOUVEAU_VM_BIND            0x11
>>> +#define DRM_NOUVEAU_EXEC               0x12
>>>   #define DRM_NOUVEAU_GEM_NEW            0x40
>>>   #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
>>>   #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
>>> @@ -197,6 +410,9 @@ struct drm_nouveau_svm_bind {
>>>   #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW 
>>> (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct 
>>> drm_nouveau_gem_cpu_fini)
>>>   #define DRM_IOCTL_NOUVEAU_GEM_INFO DRM_IOWR(DRM_COMMAND_BASE + 
>>> DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
>>>   +#define DRM_IOCTL_NOUVEAU_VM_INIT DRM_IOWR(DRM_COMMAND_BASE + 
>>> DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
>>> +#define DRM_IOCTL_NOUVEAU_VM_BIND DRM_IOWR(DRM_COMMAND_BASE + 
>>> DRM_NOUVEAU_VM_BIND, struct drm_nouveau_vm_bind)
>>> +#define DRM_IOCTL_NOUVEAU_EXEC DRM_IOWR(DRM_COMMAND_BASE + 
>>> DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
>>>   #if defined(__cplusplus)
>>>   }
>>>   #endif
>>> -- 
>>> 2.39.0
>>>
>>
>

