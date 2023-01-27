Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C774F67E682
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 14:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D274810E46E;
	Fri, 27 Jan 2023 13:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECF810E46E;
 Fri, 27 Jan 2023 13:23:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJx3qZOodsMnkOV4Wp9XYuPKS8KcgQ2MOn+8PbUsxxajV6DtbCzb+ge75Gfv++V4KRBtQmdS13n+z+IQdekgqgiCkAkUucLbqzJrlD3zg6uj2uhtTtG21sJJwpKclFwReZXXhS1kO1AIUBU7mpA1zMKli+bJ6O3KJ7wC+C/vrs1b0aBpzdPI3OYyVkpcpwRnpr0g7iNPjuVN/q3XdUlAM1N+EsEJFQbd/oxVIGcjQWBn2io6l32RXkxotUGf4fceq9LUYSK9CsDAUMsrcDMNbtZPLn4z+cTB2fw6/bkG/xZVzSpyRJyXxuhStH36HvyvPORub54Jm4xUk65rgB69IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OM3UQ9Dp9WTczlgapuLIjw5JvxBJ2zp7HN5AUy49Zcc=;
 b=XkRWaDYLAWQ6acpfu41eFovkPk77W9JpfCDUjvs8hPauChc0rAlpYLORIdtueqC0+IrDmYpZW749VvL+g2T5NITFQzogOfZnJpFZ336/CqnOG1LA7UBC99BrszTP+gnF5YO99NmtyaNamH1U5Ar2rrktcNdHY5QKmv/gr0Xk2dPiTPUhOorfoWEC10+Fj/QNiCwrCNBOJ3wEOcSUH9lciWvpMoo/iLIDo54iiOVXZVBgD0C+1bcu3e8cmWqgdJ+tgPUqw3G6g7Zgk2d8nbeQjPCG9A5YntS9qyZr4Yt7R+NllcDZjBHPFCxGedEA3aDlJTYczPRF3m2roUBBUMxhUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OM3UQ9Dp9WTczlgapuLIjw5JvxBJ2zp7HN5AUy49Zcc=;
 b=wPIWUE45hkAUpCCgB8ZIcE+pKT+j940B8wZ5M1oC1OUDPM04YCNCmAGyoGooiL0XhVrTdyfdiKqmdi69QR932pBWe7PdyzBBCbhRtLADM2itPZQLIKRhlQ+B7b4DYsmqxncMCqfp+X8wVflwbmV2BAjNnkOyOnWc30/rO3SLPBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB7118.namprd12.prod.outlook.com (2603:10b6:303:213::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 27 Jan
 2023 13:23:11 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6043.017; Fri, 27 Jan 2023
 13:23:11 +0000
Message-ID: <a214b28b-043c-a8bb-69da-b4d8216fce56@amd.com>
Date: Fri, 27 Jan 2023 14:23:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi interfaces
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
 <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
 <c2256c7d-e768-ae3f-d465-b9f8080d111b@amd.com>
 <2427a918-5348-d1ef-ccae-a29c1ff33c83@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <2427a918-5348-d1ef-ccae-a29c1ff33c83@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB7118:EE_
X-MS-Office365-Filtering-Correlation-Id: deeb141a-adb0-451b-0c5e-08db0069a33b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8og+Cv9nEFGFTaz7xVtAjhTwkzvufBDAuLyFwQ64x9wEl5qaBeRnXTLus6j7WFLWOfqthKQaarPsJMyngvOYC/to+5BUOa9ivzUL7QpP1m+ETRu0KZi3HcEJGuQ7IQvpq5JiT2kcg1FbZbvKRyAojrb/m4qoz0+R+G7X8QeQySoNFgLGOfbEX3JwRedK8QylKsN39WhFwJLwuyixyTah06Ph4dXZm7LHUBVnCQGK+Pu9Cv4eDyaI+99rq9/CrG08ly1kGaCmsutYns4WRU8EZTzaQ7eOJnmBnIzkfKgXl3X2KSfc6nuPWqZuHdUKPY1/874510X9E6K6RhNTk1x8KQpXbsLMDDE+l9hUcteLtivsHbd8LhWlN5U+O4HdKiixtzFyAW7bDgGLeA2G+fu5AsBFFd7Uc+PPWZH7LULjXGQ6ZzhR+1neKZV/+LDa9o+XFyWTXurA2wuFIziIclhenfruxgF/0Cdp0haw6GDm/qKYGpo4vWeL0hMQtPUgaUkbIiwDk8UDMlaXRmKKVRgdYDL74bURvwP5+Oe3qUIN5VScKqXu9tBhrKNrAND0qovjtMCNJnyQ1gIl6i+3CeKG5FvqQXgA8ibdExuo8polyaXR+cpZcLP1Uo7DBFmplCL72mmE1s40X/aoxUdYvF2dtHUwdnzfnBBH3AE5ZWn3OU7O85X84m0uQWFWduwMogxqmr7E3DWj0m7Oya9VlrquCCa92iEzZrNgJnbxQoRSnZI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199018)(66556008)(2616005)(4326008)(110136005)(7416002)(478600001)(66476007)(38100700002)(6666004)(2906002)(53546011)(86362001)(6486002)(6506007)(8936002)(186003)(66574015)(36756003)(41300700001)(83380400001)(6512007)(31696002)(66946007)(5660300002)(316002)(8676002)(30864003)(31686004)(66899018)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzR0Q3lIeTdnbnkySzRWNFZEdnp6WnE2NUhTVGdJUVdPZDNiQjYrMjZSZE1z?=
 =?utf-8?B?MlVEYW40Umsxdy9ta1hITTNwQ0NjeFYrdDVUK3Z6dG5hNWt6TnpHUkdqdE00?=
 =?utf-8?B?ZmdEcUFHa3FCM3hPeWZyKzhsNS83WW95Z3Jrb3VVbFFTMHZZSE03aWgzKzdV?=
 =?utf-8?B?cnNrWmdEL1ZpU3pCK1RtNXBXdUxQTVFtZUZuTjBjUzlmZ3IwMEgvTnhka1Ji?=
 =?utf-8?B?dmpGdHQwdnF0YkdHQmtia1JZSUxjMXNTM3BVNTRyejJBRDhRaS9yL3RJZ2hF?=
 =?utf-8?B?Tk5nMDZxeWhzL3V2UHE2cVByK3VRa09GVFRuTGNjQlFMVS9JUldZNUhhejVJ?=
 =?utf-8?B?VmxybHlnTUpUTWVBWUdhZkM3Q0JpYm5jQXRZazNoRmdBRlByYXdpSjhVNm5i?=
 =?utf-8?B?dWpEQVdueXZSNzkyVVd2VEVNUE90bFArcVRNYnh2Z3BZQUFxcDBjTFVhTlNS?=
 =?utf-8?B?ckZtQ29Oc0wxaFlqSDAxUEp5RllvUjcrOGZCcVMyWldKa1FDYXJHUTNMOTg4?=
 =?utf-8?B?a0p0bDg3R0VISTY1aGNOWGtEd2NaZDlWdmNxMlZEWDRydXFabktWWWszeE1W?=
 =?utf-8?B?S2dYWEtpZUxvWmNKd1o0UFhveW5NeEp1MlBMcmVHLzhvQW5qVVZHajJ4cEI5?=
 =?utf-8?B?V2V5ajNPMSs5bVEzY3hHQlZrbUhWcCtzQitUOENqcThyNVZBQy9rMWNxc254?=
 =?utf-8?B?V21jckxOUzgzRnd3ZWJONTF1c3d6cU5LMytmOG9NVkFnOUtyem94Q25qVWFx?=
 =?utf-8?B?bE8wbzY1LzdoN1RFcTFrSmlHMHArWlAwOGxYSldTNTNTRXloUDJMS09UWW9p?=
 =?utf-8?B?N3ZCM1NJbzFxN3pmZ0FhL014d091c0p1OW9hbDNSOHFERnBCcUxpOTdWWUFm?=
 =?utf-8?B?ZER3cDR4cDJlNmhxdVBaVGo0ZzVjOGpQKzJXSTRZWmp0OFN1TmFqLzNERTJs?=
 =?utf-8?B?djEvdzU2U3E3OTA1MmNtbTNFR0szeC9kajVGNWkrV2NHbFE4UjhhLzgraTEx?=
 =?utf-8?B?SjBBSzVScGVzaG1FOG95MFQwc0tNaUg4dkFKV2NXem4xR2ZtMmZWaWViS3p6?=
 =?utf-8?B?WHRKRnJvaDUvaVlyNFIzbmlIUHFXYnYzT2lBSHQxZS9FalpnVTREMVVXK1Vk?=
 =?utf-8?B?RHhHR1U2dzdPb1J1YUNBSW4vbDQ2MytYZGpSUWsrd1dNRHJGNUNtT2w1bm1n?=
 =?utf-8?B?Z2RvNW16eFB4d05IK2hnYnhzanZmZGl0Wmt4bWpiSDV6ZUY2VU5OR0tlYzE4?=
 =?utf-8?B?eHplQThDdXdrOWlBVURQTi9vMHYyZ2NWLzJEcVRJSHZybHBVQkNHWU5wY3N1?=
 =?utf-8?B?S3Q1elV4b3Q4bVN4aXp6MUVLZzRrb1ZQQjBvekhZcDZYQTNKK1J2S250bjk2?=
 =?utf-8?B?YjB3SlNwdFpMYlgya2Y4LzdRd2QyMHI5QXc5dG5QNmtsdEFILytqY1l3b3p0?=
 =?utf-8?B?UEpSTmdYQlZmRWE4dnpCS1dQRmJhWUl6RWs5eXNuclArREtrMkMzbllRajNr?=
 =?utf-8?B?UkZTYzlVVWNYRlRoWGpIZHZnRWhYd0lDYzZLOXpjYzk4SC9leGtwQlJMclYz?=
 =?utf-8?B?WXBLTjhHVEo0ZmZMMkxyZkFYcWozcDlET2UzVlMxWWNiMkpmQlhNZVdjV0Nm?=
 =?utf-8?B?OUlpeUd5Wm9sZVJEcURTSEw2Yk1jNkdUNmRybldSYUlFeVBtU0w4OXpjdmlQ?=
 =?utf-8?B?UktlTUhSbWZFQzMyWlpZQVArNE5VS1JCWElJRGJ6V2NmR1F1c0xMMUNZT1R5?=
 =?utf-8?B?UXJPRFU0MWg3MDVWWXNuVXRRdkxFRzJtSFhwR2FzeXI0NjJGcldIMEhqTFBn?=
 =?utf-8?B?ekxLaDV5Q25hRi9PV0FzOTN1VTNFVVdXTjZ6bDBib1pkYlhBTkVrcWo1VkM4?=
 =?utf-8?B?SE54N1doYkZZSHZpaFFPU1hLRFNuNWJIUDZuRDhuNkRHVzhRNDJVeDE1ZDhj?=
 =?utf-8?B?aGN1WisreHg0dnhaZXhJVHc4WjVPeU9SdFN1UE9PdDRtNXNUU2FhUG9HbzJF?=
 =?utf-8?B?YlE0dzZoUFBKUTJoN1Q4dFd5VTc5N21nQ3JscTkyamIrWWJuaXk5eFk2RTll?=
 =?utf-8?B?NW5vdFhpbzZCRlpZN1RuQm82UDNpVmNDMHorZ2cxTEhsVVc0MU1xN09VbThX?=
 =?utf-8?B?MnQ5OHk4WGJ1UjhhSXVYQi9yd0cvdmRmYnNPZGJMK04rMjJZYXFnVmhxcnAw?=
 =?utf-8?Q?Wlu8H6K9bxggIj8pNSDgGsKtNYkjixNVvpWdHmGj6Jv0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deeb141a-adb0-451b-0c5e-08db0069a33b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 13:23:11.5366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKAfrKolVI/UkjS9r3oQbayciskoQA8mUkyAfCm9Ycy0Yayxt2TrVE9AhkYya8UY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7118
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



Am 27.01.23 um 14:12 schrieb Danilo Krummrich:
> On 1/27/23 08:55, Christian König wrote:
>> Am 27.01.23 um 02:26 schrieb Danilo Krummrich:
>>> On 1/27/23 02:05, Matthew Brost wrote:
>>>> On Wed, Jan 18, 2023 at 07:12:47AM +0100, Danilo Krummrich wrote:
>>>>> This commit provides the interfaces for the new UAPI motivated by the
>>>>> Vulkan API. It allows user mode drivers (UMDs) to:
>>>>>
>>>>> 1) Initialize a GPU virtual address (VA) space via the new
>>>>>     DRM_IOCTL_NOUVEAU_VM_INIT ioctl. UMDs can provide a kernel 
>>>>> reserved
>>>>>     VA area.
>>>>>
>>>>> 2) Bind and unbind GPU VA space mappings via the new
>>>>>     DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
>>>>>
>>>>> 3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.
>>>>>
>>>>> Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC support
>>>>> asynchronous processing with DRM syncobjs as synchronization 
>>>>> mechanism.
>>>>>
>>>>> The default DRM_IOCTL_NOUVEAU_VM_BIND is synchronous processing,
>>>>> DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.
>>>>>
>>>>> Co-authored-by: Dave Airlie <airlied@redhat.com>
>>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>>> ---
>>>>>   Documentation/gpu/driver-uapi.rst |   8 ++
>>>>>   include/uapi/drm/nouveau_drm.h    | 216 
>>>>> ++++++++++++++++++++++++++++++
>>>>>   2 files changed, 224 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/gpu/driver-uapi.rst 
>>>>> b/Documentation/gpu/driver-uapi.rst
>>>>> index 4411e6919a3d..9c7ca6e33a68 100644
>>>>> --- a/Documentation/gpu/driver-uapi.rst
>>>>> +++ b/Documentation/gpu/driver-uapi.rst
>>>>> @@ -6,3 +6,11 @@ drm/i915 uAPI
>>>>>   =============
>>>>>     .. kernel-doc:: include/uapi/drm/i915_drm.h
>>>>> +
>>>>> +drm/nouveau uAPI
>>>>> +================
>>>>> +
>>>>> +VM_BIND / EXEC uAPI
>>>>> +-------------------
>>>>> +
>>>>> +.. kernel-doc:: include/uapi/drm/nouveau_drm.h
>>>>> diff --git a/include/uapi/drm/nouveau_drm.h 
>>>>> b/include/uapi/drm/nouveau_drm.h
>>>>> index 853a327433d3..f6e7d40201d4 100644
>>>>> --- a/include/uapi/drm/nouveau_drm.h
>>>>> +++ b/include/uapi/drm/nouveau_drm.h
>>>>> @@ -126,6 +126,216 @@ struct drm_nouveau_gem_cpu_fini {
>>>>>       __u32 handle;
>>>>>   };
>>>>>   +/**
>>>>> + * struct drm_nouveau_sync - sync object
>>>>> + *
>>>>> + * This structure serves as synchronization mechanism for 
>>>>> (potentially)
>>>>> + * asynchronous operations such as EXEC or VM_BIND.
>>>>> + */
>>>>> +struct drm_nouveau_sync {
>>>>> +    /**
>>>>> +     * @flags: the flags for a sync object
>>>>> +     *
>>>>> +     * The first 8 bits are used to determine the type of the 
>>>>> sync object.
>>>>> +     */
>>>>> +    __u32 flags;
>>>>> +#define DRM_NOUVEAU_SYNC_SYNCOBJ 0x0
>>>>> +#define DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ 0x1
>>>>> +#define DRM_NOUVEAU_SYNC_TYPE_MASK 0xf
>>>>> +    /**
>>>>> +     * @handle: the handle of the sync object
>>>>> +     */
>>>>> +    __u32 handle;
>>>>> +    /**
>>>>> +     * @timeline_value:
>>>>> +     *
>>>>> +     * The timeline point of the sync object in case the syncobj 
>>>>> is of
>>>>> +     * type DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ.
>>>>> +     */
>>>>> +    __u64 timeline_value;
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct drm_nouveau_vm_init - GPU VA space init structure
>>>>> + *
>>>>> + * Used to initialize the GPU's VA space for a user client, 
>>>>> telling the kernel
>>>>> + * which portion of the VA space is managed by the UMD and kernel 
>>>>> respectively.
>>>>> + */
>>>>> +struct drm_nouveau_vm_init {
>>>>> +    /**
>>>>> +     * @unmanaged_addr: start address of the kernel managed VA 
>>>>> space region
>>>>> +     */
>>>>> +    __u64 unmanaged_addr;
>>>>> +    /**
>>>>> +     * @unmanaged_size: size of the kernel managed VA space 
>>>>> region in bytes
>>>>> +     */
>>>>> +    __u64 unmanaged_size;
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct drm_nouveau_vm_bind_op - VM_BIND operation
>>>>> + *
>>>>> + * This structure represents a single VM_BIND operation. UMDs 
>>>>> should pass
>>>>> + * an array of this structure via struct drm_nouveau_vm_bind's 
>>>>> &op_ptr field.
>>>>> + */
>>>>> +struct drm_nouveau_vm_bind_op {
>>>>> +    /**
>>>>> +     * @op: the operation type
>>>>> +     */
>>>>> +    __u32 op;
>>>>> +/**
>>>>> + * @DRM_NOUVEAU_VM_BIND_OP_ALLOC:
>>>>> + *
>>>>> + * The alloc operation is used to reserve a VA space region 
>>>>> within the GPU's VA
>>>>> + * space. Optionally, the &DRM_NOUVEAU_VM_BIND_SPARSE flag can be 
>>>>> passed to
>>>>> + * instruct the kernel to create sparse mappings for the given 
>>>>> region.
>>>>> + */
>>>>> +#define DRM_NOUVEAU_VM_BIND_OP_ALLOC 0x0
>>>>
>>>> Do you really need this operation? We have no concept of this in Xe,
>>>> e.g. we can create a VM and the entire address space is managed 
>>>> exactly
>>>> the same.
>>>
>>> The idea for alloc/free is to let UMDs allocate a portion of the VA 
>>> space (which I call a region), basically the same thing Vulkan 
>>> represents with a VKBuffer.
>>
>> If that's mangled into the same component/interface then I can say 
>> from experience that this is a pretty bad idea. We have tried 
>> something similar with radeon and it turned out horrible.
>
> What was the exact constellation in radeon and which problems did 
> arise from it?
>
>>
>> What you want is one component for tracking the VA allocations 
>> (drm_mm based) and a different component/interface for tracking the 
>> VA mappings (probably rb tree based).
>
> That's what the GPUVA manager is doing. There are gpuva_regions which 
> correspond to VA allocations and gpuvas which represent the mappings. 
> Both are tracked separately (currently both with a separate drm_mm, 
> though). However, the GPUVA manager needs to take regions into account 
> when dealing with mappings to make sure the GPUVA manager doesn't 
> propose drivers to merge over region boundaries. Speaking from 
> userspace PoV, the kernel wouldn't merge mappings from different 
> VKBuffer objects even if they're virtually and physically contiguous.

That are two completely different things and shouldn't be handled in a 
single component.

We should probably talk about the design of the GPUVA manager once more 
when this should be applicable to all GPU drivers.

>
> For sparse residency the kernel also needs to know the region 
> boundaries to make sure that it keeps sparse mappings around.

What?

Regards,
Christian.

>
>>
>> amdgpu has even gotten so far that the VA allocations are tracked in 
>> libdrm in userspace
>>
>> Regards,
>> Christian.
>>
>>>
>>> It serves two purposes:
>>>
>>> 1. It gives the kernel (in particular the GPUVA manager) the bounds 
>>> in which it is allowed to merge mappings. E.g. when a user request 
>>> asks for a new mapping and we detect we could merge this mapping 
>>> with an existing one (used in another VKBuffer than the mapping 
>>> request came for) the driver is not allowed to change the page table 
>>> for the existing mapping we want to merge with (assuming that some 
>>> drivers would need to do this in order to merge), because the 
>>> existing mapping could already be in use and by re-mapping it we'd 
>>> potentially cause a fault on the GPU.
>>>
>>> 2. It is used for sparse residency in a way that such an allocated 
>>> VA space region can be flagged as sparse, such that the kernel 
>>> always keeps sparse mappings around for the parts of the region that 
>>> do not contain actual memory backed mappings.
>>>
>>> If for your driver merging is always OK, creating a single huge 
>>> region would do the trick I guess. Otherwise, we could also add an 
>>> option to the GPUVA manager (or a specific region, which could also 
>>> be a single huge one) within which it never merges.
>>>
>>>>
>>>> If this can be removed then the entire concept of regions in the GPUVA
>>>> can be removed too (drop struct drm_gpuva_region). I say this because
>>>> in Xe as I'm porting over to GPUVA the first thing I'm doing after
>>>> drm_gpuva_manager_init is calling drm_gpuva_region_insert on the 
>>>> entire
>>>> address space. To me this seems kinda useless but maybe I'm missing 
>>>> why
>>>> you need this for Nouveau.
>>>>
>>>> Matt
>>>>
>>>>> +/**
>>>>> + * @DRM_NOUVEAU_VM_BIND_OP_FREE: Free a reserved VA space region.
>>>>> + */
>>>>> +#define DRM_NOUVEAU_VM_BIND_OP_FREE 0x1
>>>>> +/**
>>>>> + * @DRM_NOUVEAU_VM_BIND_OP_MAP:
>>>>> + *
>>>>> + * Map a GEM object to the GPU's VA space. The mapping must be 
>>>>> fully enclosed by
>>>>> + * a previously allocated VA space region. If the region is 
>>>>> sparse, existing
>>>>> + * sparse mappings are overwritten.
>>>>> + */
>>>>> +#define DRM_NOUVEAU_VM_BIND_OP_MAP 0x2
>>>>> +/**
>>>>> + * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:
>>>>> + *
>>>>> + * Unmap an existing mapping in the GPU's VA space. If the region 
>>>>> the mapping
>>>>> + * is located in is a sparse region, new sparse mappings are 
>>>>> created where the
>>>>> + * unmapped (memory backed) mapping was mapped previously.
>>>>> + */
>>>>> +#define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x3
>>>>> +    /**
>>>>> +     * @flags: the flags for a &drm_nouveau_vm_bind_op
>>>>> +     */
>>>>> +    __u32 flags;
>>>>> +/**
>>>>> + * @DRM_NOUVEAU_VM_BIND_SPARSE:
>>>>> + *
>>>>> + * Indicates that an allocated VA space region should be sparse.
>>>>> + */
>>>>> +#define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8)
>>>>> +    /**
>>>>> +     * @handle: the handle of the DRM GEM object to map
>>>>> +     */
>>>>> +    __u32 handle;
>>>>> +    /**
>>>>> +     * @addr:
>>>>> +     *
>>>>> +     * the address the VA space region or (memory backed) mapping 
>>>>> should be mapped to
>>>>> +     */
>>>>> +    __u64 addr;
>>>>> +    /**
>>>>> +     * @bo_offset: the offset within the BO backing the mapping
>>>>> +     */
>>>>> +    __u64 bo_offset;
>>>>> +    /**
>>>>> +     * @range: the size of the requested mapping in bytes
>>>>> +     */
>>>>> +    __u64 range;
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct drm_nouveau_vm_bind - structure for 
>>>>> DRM_IOCTL_NOUVEAU_VM_BIND
>>>>> + */
>>>>> +struct drm_nouveau_vm_bind {
>>>>> +    /**
>>>>> +     * @op_count: the number of &drm_nouveau_vm_bind_op
>>>>> +     */
>>>>> +    __u32 op_count;
>>>>> +    /**
>>>>> +     * @flags: the flags for a &drm_nouveau_vm_bind ioctl
>>>>> +     */
>>>>> +    __u32 flags;
>>>>> +/**
>>>>> + * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:
>>>>> + *
>>>>> + * Indicates that the given VM_BIND operation should be executed 
>>>>> asynchronously
>>>>> + * by the kernel.
>>>>> + *
>>>>> + * If this flag is not supplied the kernel executes the 
>>>>> associated operations
>>>>> + * synchronously and doesn't accept any &drm_nouveau_sync objects.
>>>>> + */
>>>>> +#define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1
>>>>> +    /**
>>>>> +     * @wait_count: the number of wait &drm_nouveau_syncs
>>>>> +     */
>>>>> +    __u32 wait_count;
>>>>> +    /**
>>>>> +     * @sig_count: the number of &drm_nouveau_syncs to signal 
>>>>> when finished
>>>>> +     */
>>>>> +    __u32 sig_count;
>>>>> +    /**
>>>>> +     * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
>>>>> +     */
>>>>> +    __u64 wait_ptr;
>>>>> +    /**
>>>>> +     * @sig_ptr: pointer to &drm_nouveau_syncs to signal when 
>>>>> finished
>>>>> +     */
>>>>> +    __u64 sig_ptr;
>>>>> +    /**
>>>>> +     * @op_ptr: pointer to the &drm_nouveau_vm_bind_ops to execute
>>>>> +     */
>>>>> +    __u64 op_ptr;
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct drm_nouveau_exec_push - EXEC push operation
>>>>> + *
>>>>> + * This structure represents a single EXEC push operation. UMDs 
>>>>> should pass an
>>>>> + * array of this structure via struct drm_nouveau_exec's 
>>>>> &push_ptr field.
>>>>> + */
>>>>> +struct drm_nouveau_exec_push {
>>>>> +    /**
>>>>> +     * @va: the virtual address of the push buffer mapping
>>>>> +     */
>>>>> +    __u64 va;
>>>>> +    /**
>>>>> +     * @va_len: the length of the push buffer mapping
>>>>> +     */
>>>>> +    __u64 va_len;
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct drm_nouveau_exec - structure for DRM_IOCTL_NOUVEAU_EXEC
>>>>> + */
>>>>> +struct drm_nouveau_exec {
>>>>> +    /**
>>>>> +     * @channel: the channel to execute the push buffer in
>>>>> +     */
>>>>> +    __u32 channel;
>>>>> +    /**
>>>>> +     * @push_count: the number of &drm_nouveau_exec_push ops
>>>>> +     */
>>>>> +    __u32 push_count;
>>>>> +    /**
>>>>> +     * @wait_count: the number of wait &drm_nouveau_syncs
>>>>> +     */
>>>>> +    __u32 wait_count;
>>>>> +    /**
>>>>> +     * @sig_count: the number of &drm_nouveau_syncs to signal 
>>>>> when finished
>>>>> +     */
>>>>> +    __u32 sig_count;
>>>>> +    /**
>>>>> +     * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
>>>>> +     */
>>>>> +    __u64 wait_ptr;
>>>>> +    /**
>>>>> +     * @sig_ptr: pointer to &drm_nouveau_syncs to signal when 
>>>>> finished
>>>>> +     */
>>>>> +    __u64 sig_ptr;
>>>>> +    /**
>>>>> +     * @push_ptr: pointer to &drm_nouveau_exec_push ops
>>>>> +     */
>>>>> +    __u64 push_ptr;
>>>>> +};
>>>>> +
>>>>>   #define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
>>>>>   #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
>>>>>   #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
>>>>> @@ -136,6 +346,9 @@ struct drm_nouveau_gem_cpu_fini {
>>>>>   #define DRM_NOUVEAU_NVIF               0x07
>>>>>   #define DRM_NOUVEAU_SVM_INIT           0x08
>>>>>   #define DRM_NOUVEAU_SVM_BIND           0x09
>>>>> +#define DRM_NOUVEAU_VM_INIT            0x10
>>>>> +#define DRM_NOUVEAU_VM_BIND            0x11
>>>>> +#define DRM_NOUVEAU_EXEC               0x12
>>>>>   #define DRM_NOUVEAU_GEM_NEW            0x40
>>>>>   #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
>>>>>   #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
>>>>> @@ -197,6 +410,9 @@ struct drm_nouveau_svm_bind {
>>>>>   #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW 
>>>>> (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct 
>>>>> drm_nouveau_gem_cpu_fini)
>>>>>   #define DRM_IOCTL_NOUVEAU_GEM_INFO DRM_IOWR(DRM_COMMAND_BASE + 
>>>>> DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
>>>>>   +#define DRM_IOCTL_NOUVEAU_VM_INIT DRM_IOWR(DRM_COMMAND_BASE + 
>>>>> DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
>>>>> +#define DRM_IOCTL_NOUVEAU_VM_BIND DRM_IOWR(DRM_COMMAND_BASE + 
>>>>> DRM_NOUVEAU_VM_BIND, struct drm_nouveau_vm_bind)
>>>>> +#define DRM_IOCTL_NOUVEAU_EXEC DRM_IOWR(DRM_COMMAND_BASE + 
>>>>> DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
>>>>>   #if defined(__cplusplus)
>>>>>   }
>>>>>   #endif
>>>>> -- 
>>>>> 2.39.0
>>>>>
>>>>
>>>
>>
>

