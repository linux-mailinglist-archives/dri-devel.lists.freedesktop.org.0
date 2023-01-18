Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8D56728B5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 20:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C987810E816;
	Wed, 18 Jan 2023 19:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8007B10E814;
 Wed, 18 Jan 2023 19:48:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCXSmgppxvgVTQlyMucJxzR7c0pcqijzjHnKTdJSWDTKts5X6nZLyx6VdWaQ9VjAzS+1Nb+jsQ11eJhjoj3oGf7M9ugjGlr4zSno/vyomLey4ZURqBk6WZfp4bS/Q+9nqrJqdHOGKnusgHNxwsAVsGHWxfT+uwM4SRt6ZNRmxKAy9sidAUhnC9DDHtv9ITJ84tf6aV6/Nfa+bM8V39qzexyjG1sPvxMCcYQnvYstTkMXg8YqHhrq2oa9x0vF+RKE+v/aFJKZVzxEFwJlP1V2rskWrDki9zQFuQixSzvqmn1lo71VnNtkP4F8xPLUMwlssO6RGNBwtQrOecf4h8956Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gRgKbgieNsbCud9kO52396lVv6iU651O0TRJThN044=;
 b=mDrrkALhYo7OB/3QXltcoPFM/5n/oa6bdy+808wOc5JBkrujyxFQSuAcIzz8ULEF/BFFCld1ztICAMFszTOk5va38RFHS5I3HKkbst8zhkQgmwB4D5Xgmx5VKycXh5v6RC8tllloI1PDwmxkiT0I4yJlAarkFlebqqZ1vm0aJIMgDJ/nTyH61ZP/vd8iH1q0H36bdRLpNMmh0XoXXsK6uzviYtIQQUXQw394BGz2a0njDqyv+LfqD844TAwPAOHuWYEFKRqzE+NAy4Zlm8/uwBPZeiGfdxSUKcUv1je/t7U21Pfj2UuF8IFmtMKGHahcMPckGd0K9TQA57TwA9LNMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gRgKbgieNsbCud9kO52396lVv6iU651O0TRJThN044=;
 b=13T+0QHGR89F59znHyJYQGCjuodhlYZgQ0JVXAToO8q0hqLpjT2PZCDeOE8ycL3XW1ZgVgoBJtTxGqnlJXSN9OOcUkShbm7oPuxNk/NZ0fWCe4hwzoecuEoX92PnEmDdiBrKWl8xkNxcUA0jkynjX7H/R5eMH53sbWBGEivE3ds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB6416.namprd12.prod.outlook.com (2603:10b6:8:cb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.24; Wed, 18 Jan 2023 19:48:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 19:48:55 +0000
Message-ID: <7839c47e-6692-b93b-69a8-9584193cb07d@amd.com>
Date: Wed, 18 Jan 2023 20:48:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH drm-next 00/14] [RFC] DRM GPUVA Manager & Nouveau VM_BIND
 UAPI
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <db4fa0fc-c9a6-9a48-c45f-1d655b30aff9@amd.com>
 <02b0bcb8-f69f-93cf-1f56-ec883cb33965@redhat.com>
 <3602500f-05f5-10b8-5ec6-0a6246e2bb6b@amd.com>
 <bcbef353-f579-4e90-1c77-be36bbe61c0f@redhat.com>
 <CADnq5_PGaXFW-z3gt+R+W+vBVdeuL4wMuMOQh4muxU13Bemy3A@mail.gmail.com>
 <0f2d6e1a-a3b5-f323-a29d-caade427292c@redhat.com>
 <CADnq5_Nh-1esiHzvTG+qFBCfMjy21efX-YN2jfGG=WC+-4LwLQ@mail.gmail.com>
 <CAPM=9txMZO1uYj+kVdTfmCwV2Fq8uu_b3i4eq4xhqPEPKBW8Eg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9txMZO1uYj+kVdTfmCwV2Fq8uu_b3i4eq4xhqPEPKBW8Eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB6416:EE_
X-MS-Office365-Filtering-Correlation-Id: f8806874-d357-498d-7ba9-08daf98d083b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QwrNu73qUM2n2dfAmLSt1l36DW0vkik1AMVjJUDvPCTgNpgmfm6rdEvQ98NY0idPlaaV3Qi36hriaRK8KUWej+XgcyTC8uP+ORHO40R0H7UuE8ntF6B76jUYiXSZarAtZsLCyvZ5A/DBsImLCsXz1TiBiUsZ1JiOtDKSeMbp1kUp2TK42J+TXhbQpbRNHx2oeRe/Vay76OZ1BanqOwR9GQKCgbfVfvvxNms+9leCyDlPIXKCMkG94F43dBK/Vw77IjLcg+fPEGqr9Ur0Jg6zYVASFagADHjPQPH/pbx/kQwHm5Yyl0ElsyNK3bt4fHXlYrBRCk1byYjA4QKYiy8KwsqlYh08IR81b+Tth4C9q5SxvriWFqJAMZC/CrVzYTaY783y5ZU9I8swc3YkqNRA/Tgjp7Z4ymiJJOXC2iNMe8pUjLtohwisUQW4/fdjUpijleFwokHWPDapJ+0At2L74QUzmZooQDyDBx6exLLv4tfcqs0Vk4cI4+g27eDnLY46JEG+XAZEMJUKlwq6vC5y6geDx8Q0IRAEHHlyVj3+UEj2in0bzmwsCEYhPAaDw3C+ZDtqac/WwJi8cRzvsTZpGxuIW34/iF7cNx4tm4G4C9WA9/D45fQooOLSpF2p3kVEW48nmByi1lnZez4ycHmWrPNj6fSpd8e6bq/laqpMKPZvWk5zSfYEIkqYd7icTbARHm99DmJYe7AZK1XSc5OL62qwotWnITn74X2CAzImg8s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199015)(66899015)(31686004)(2906002)(7416002)(66946007)(66556008)(8936002)(5660300002)(31696002)(38100700002)(66476007)(316002)(6666004)(110136005)(66574015)(53546011)(6486002)(86362001)(6506007)(478600001)(36756003)(8676002)(4326008)(41300700001)(186003)(83380400001)(6512007)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTIrclFoWkJxeGw0cHQ4T2hJNEJiT3VyQ1hmZ2puTkpFUmhoUHQyT0grTkxB?=
 =?utf-8?B?dno0cmVIYmVZK1BRUXg1L2Y4NDA1TDdEd1YyaHZSTHlITkR1OVBnN0d3SGls?=
 =?utf-8?B?OEZUWkkrSVE1clE5Q0xjSXlHMmhLWUpBUEx5TEx1ZG82cmxkY3dkWExJMERR?=
 =?utf-8?B?dHdFSGtrZ2R3eWNrYnJwVDJOZUlIZVdlazNQMDNZdlRwbmZUWHNXK0tZd214?=
 =?utf-8?B?cHJzZzZ0RUVmL2pLejlpbktKcjhXQ3pjSlJGcTB6TCtoWitNZ0hwQWg3SW85?=
 =?utf-8?B?cnJlbGUzMi8zQnU0RHN5REpUNEE4cnYwTmdJcVpQbUNRL2Fod1B0OHVGVkdC?=
 =?utf-8?B?QzVWZWsyaURjK1JDOWVqdklzeUtEc3NQTmh1cENjUzZ6UFlHaHpYalVBRjBh?=
 =?utf-8?B?OG1RV0xTMFdWRmV0T2R0bWlmS251cXphQXI0VWRXcHlkRVZNTHovdURBclJa?=
 =?utf-8?B?L0JqTnVvaENDdVRYREMyS1MxZTEvT09nbzhkeDJVODRCSG9sVjgzZW9BVHRj?=
 =?utf-8?B?NXVNUG5waE5sMXB0bnZTZWREd0QrNU9abHRnTVhSQUVXLzJaVlVieGs0bEsw?=
 =?utf-8?B?ckZaRW1XQ01NQU9VUHoxcUwvcHdaK2tNZ0lybWZ4YmN3eTI1OWh2MFkyVmlE?=
 =?utf-8?B?ajhyLzNKUDdqa3ZYVWVwMEpXN3BqVXFNdkNVb2hrUGFUaW9uaWM2cTFjUStq?=
 =?utf-8?B?aFNzblRtOWg0Nm8xa2pHeHpkWERKc0FGeFUwZlNUbDJZYXJERzViWU1DZU5O?=
 =?utf-8?B?MUo4RmJ3eXlSRGEyQVVlV3dvcVRZZVVZMWlGNVdiY2JHOWo2bHp2YlFJcFpY?=
 =?utf-8?B?c1M1L2xLVkxzUzg5eE9xRUI4eHl6WU1lVC9iZjZFRm1aNlhvSXcreGU5M095?=
 =?utf-8?B?TmJkcm1LTlg5c0VieWNzSzhtWXhlelcvLytFUHBxTDBVK1JOUGV3MjMyTHFU?=
 =?utf-8?B?Vm9GdTdvUmh5UG1BOUlSUVZWZWVxZFZndlVyY2c1a0R2Z2ZCa0tIU0gwUEN5?=
 =?utf-8?B?RmZ4S241cjNFVTlNMFc1d0ZVenFHeGJlczdyS3orbUE2VnZtWWp0RENPVkVQ?=
 =?utf-8?B?dDIxY1EyUDJIdkVaMFkvVGxLdlM4d0htUVIvb2pRVHYzUUhZZkRrQ2h6UXNL?=
 =?utf-8?B?V1NQamRXbG9kakh6NXIyUm9sdk9TTjg0Szc2aUVrT0VPQ2xWWnlGRXpoRzdo?=
 =?utf-8?B?VzA0dzRSYWM2bTl1b2ZoR1RyZDBic1NuWmhLSW0wOUxES0ZPc3N6SDlEQUdY?=
 =?utf-8?B?ZnpBWU80M2Y4cVI1UEVmelF5bDZTb2FEUTB5WmEwN013Q0hnSHlRN2VDTm5T?=
 =?utf-8?B?aUxxQnNKWGg5YnFUT1E1eW9KZFBhZnJ0dzdHVGxHZkRVU0dxYWxMZW1pczls?=
 =?utf-8?B?cTZhTWVFeVJkRHkrSzV5ZUl2RkdxVU5iQkxPNVNxUmtMRVhLaU5sL3g4c1Zt?=
 =?utf-8?B?QTFScTVuN0NvWmRidWZETHE2UE5uWjl3cUlJUWZnL1JnamRsKytKWXRtbzJm?=
 =?utf-8?B?b1laYWJUWXNRWW84ekxMNXgzcUNIZE5rV3JJSHBhalhOc1gvVXcwMWxWUzQv?=
 =?utf-8?B?Yk9uR0U5bnpiQTdtY2xoS3FxUXozN21FQVVsUWJmVXlUUVRDMi9qNWtlVCtJ?=
 =?utf-8?B?TkFSdHcwWElCY1J3V1BvMGpYWWJIUDFmNEgxVHpTTG45dlhSQ0xLVWlGVUNx?=
 =?utf-8?B?QlVhMmswTHYyMFBNSUVwRXp0Z003YTBlYXlINmFZOTZwMllNb0ZtTWR3NHg0?=
 =?utf-8?B?eDI1YXB4NkwvcWtUYmpkQThPeFRQcWx5YVUwdXhIZ0s1Z09NQndlZkhIeGpI?=
 =?utf-8?B?ZER5L0svNzBRWEZkUFV4aGN3RVppSWN3WGMwdmh1MzQ3blRaVm1qd21OSlRr?=
 =?utf-8?B?a0lVa2cydWZyUmoxTldCQmZQaWNUN2FxdUlySzNCWkdMZlc5RmNCMHV3VEFj?=
 =?utf-8?B?cTI1TEdWbzhjY0VVZCtMbHd6MjhzMGlnK0lCZFJlVzZJRHJHa2Y3d1h2UzJx?=
 =?utf-8?B?d3ZLczhIdFZhbWxadjVFbFZ4d09KdTFvemxCRC80WjJ5Q2xVd2o3Um43MkhK?=
 =?utf-8?B?MEl1cW1naFBsQndMNGFZYWErd0JoTXJZd3BUSDNRekMvY0RkaEw2aGo1T2dw?=
 =?utf-8?B?UjVJNmp4SzZudFdlNkNFRHp6UmRxaTZ6Y3BaenF5bUJDNEJWbElhTlRFVnJ3?=
 =?utf-8?Q?2x3Y43l0FIJ0DCBDz2IL5zxNa3fyNj6uLP4ALxeqgTc5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8806874-d357-498d-7ba9-08daf98d083b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 19:48:55.2979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3u1zyLPe0idKftgxfuEWYhbNQAUw1ZzZAvT5u6Kl+jc+KhaUWX0fO6mXqAU0X6vb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6416
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
Cc: jason@jlekstrand.net, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 bskeggs@redhat.com, tzimmermann@suse.de, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.01.23 um 20:17 schrieb Dave Airlie:
> On Thu, 19 Jan 2023 at 02:54, Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Wed, Jan 18, 2023 at 11:50 AM Danilo Krummrich <dakr@redhat.com> wrote:
>>>
>>>
>>> On 1/18/23 17:30, Alex Deucher wrote:
>>>> On Wed, Jan 18, 2023 at 11:19 AM Danilo Krummrich <dakr@redhat.com> wrote:
>>>>> On 1/18/23 16:37, Christian König wrote:
>>>>>> Am 18.01.23 um 16:34 schrieb Danilo Krummrich:
>>>>>>> Hi Christian,
>>>>>>>
>>>>>>> On 1/18/23 09:53, Christian König wrote:
>>>>>>>> Am 18.01.23 um 07:12 schrieb Danilo Krummrich:
>>>>>>>>> This patch series provides a new UAPI for the Nouveau driver in
>>>>>>>>> order to
>>>>>>>>> support Vulkan features, such as sparse bindings and sparse residency.
>>>>>>>>>
>>>>>>>>> Furthermore, with the DRM GPUVA manager it provides a new DRM core
>>>>>>>>> feature to
>>>>>>>>> keep track of GPU virtual address (VA) mappings in a more generic way.
>>>>>>>>>
>>>>>>>>> The DRM GPUVA manager is indented to help drivers implement
>>>>>>>>> userspace-manageable
>>>>>>>>> GPU VA spaces in reference to the Vulkan API. In order to achieve
>>>>>>>>> this goal it
>>>>>>>>> serves the following purposes in this context.
>>>>>>>>>
>>>>>>>>>        1) Provide a dedicated range allocator to track GPU VA
>>>>>>>>> allocations and
>>>>>>>>>           mappings, making use of the drm_mm range allocator.
>>>>>>>> This means that the ranges are allocated by the kernel? If yes that's
>>>>>>>> a really really bad idea.
>>>>>>> No, it's just for keeping track of the ranges userspace has allocated.
>>>>>> Ok, that makes more sense.
>>>>>>
>>>>>> So basically you have an IOCTL which asks kernel for a free range? Or
>>>>>> what exactly is the drm_mm used for here?
>>>>> Not even that, userspace provides both the base address and the range,
>>>>> the kernel really just keeps track of things. Though, writing a UAPI on
>>>>> top of the GPUVA manager asking for a free range instead would be
>>>>> possible by just adding the corresponding wrapper functions to get a
>>>>> free hole.
>>>>>
>>>>> Currently, and that's what I think I read out of your question, the main
>>>>> benefit of using drm_mm over simply stuffing the entries into a list or
>>>>> something boils down to easier collision detection and iterating
>>>>> sub-ranges of the whole VA space.
>>>> Why not just do this in userspace?  We have a range manager in
>>>> libdrm_amdgpu that you could lift out into libdrm or some other
>>>> helper.
>>> The kernel still needs to keep track of the mappings within the various
>>> VA spaces, e.g. it silently needs to unmap mappings that are backed by
>>> BOs that get evicted and remap them once they're validated (or swapped
>>> back in).
>> Ok, you are just using this for maintaining the GPU VM space in the kernel.
>>
> Yes the idea behind having common code wrapping drm_mm for this is to
> allow us to make the rules consistent across drivers.
>
> Userspace (generally Vulkan, some compute) has interfaces that pretty
> much dictate a lot of how VMA tracking works, esp around lifetimes,
> sparse mappings and splitting/merging underlying page tables, I'd
> really like this to be more consistent across drivers, because already
> I think we've seen with freedreno some divergence from amdgpu and we
> also have i915/xe to deal with. I'd like to at least have one place
> that we can say this is how it should work, since this is something
> that *should* be consistent across drivers mostly, as it is more about
> how the uapi is exposed.

That's a really good idea, but the implementation with drm_mm won't work 
like that.

We have Vulkan applications which use the sparse feature to create 
literally millions of mappings. That's why I have fine tuned the mapping 
structure in amdgpu down to ~80 bytes IIRC and save every CPU cycle 
possible in the handling of that.

A drm_mm_node is more in the range of ~200 bytes and certainly not 
suitable for this kind of job.

I strongly suggest to rather use a good bunch of the amdgpu VM code as 
blueprint for the common infrastructure.

Regards,
Christian.

>
> Dave.

