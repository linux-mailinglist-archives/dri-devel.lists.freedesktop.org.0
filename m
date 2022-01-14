Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E18948EF38
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 18:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C7510E443;
	Fri, 14 Jan 2022 17:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD70110E261;
 Fri, 14 Jan 2022 17:26:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrUCBCRBxe4mgzycslPMi5lqW4x/mWGI+HikEZ6oYrVrRlLHygzM/7jhMa0QoJkKywANJ8dwWiXuRUedUha7myBMPpc1bjSr4/maLE+Fm0FPZSPLBzwClKNAD0QsgK3BGS/GJ7o/bLBYlQ5QDg60LgdeGvTFggFXHAgwtcu3b0ZBSabQjtWVtSEoJbZ4EYzkDsVyngH4XKbBvPSPqi44lxsE2lEW5t3pn4g+XA8QMrArBmXog4xi06rC/dZBEMHnqAuYvRndj7GLNNxrnwPq5Q1Z+10z2L3EK12rNZ3CXZvFxoi0DXEtZp8WgE8ZtYmsP82l8UXYoKDnJKH32jR2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkKncVbnY1VxdtpO53wINXqqvh247kIjVhSvpr0C8k4=;
 b=k+gZvl2nZSPnZR1rvDIH3eLICfcf5AkKEyHJhxOYGz5lEWwsu6tDhMIzz8rVUOH+JZx6aiec+BH6Ka5B2FMYKjRLm9vOR4NH4Yh3V8QAaj42UFxHKUEGH1BCM/tbQXCpCaMaj874DCZCRss5qG8FW0mn94Ub8uOnaaHs6ge+l7hsim0g1JdvUqW/EZ/2+6YVEZE0MfGbU4vtjsFC45P6PHkFQDtp2oBJVw6Qa9Z4Kc/i17navEOF6DC/5GsKKGzJzZUQvQkiiL1IuuDXu6qSgw5c98CuK/g+k7IfYVUlhQCeqJNEaA/mZSeAxpHJnAkYGbh696BXGuBapHySJCxfVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkKncVbnY1VxdtpO53wINXqqvh247kIjVhSvpr0C8k4=;
 b=DSVcDF3eHjyhy/vT7e6vAv+SI3eaYUkgrVnt6TpEorZPHfLOfANwGyDvaeqzaUYx06nZgstBZ/+T37/E4qEgeIDeqR5VYVUEWlDh7i4hkO8/FImUAkahD3vG9eWbs3mIBQQHU9WlNAQDdPQ/tsWQPidmxJRz/D/p04koWBNzdYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MN2PR12MB3486.namprd12.prod.outlook.com
 (2603:10b6:208:c6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Fri, 14 Jan
 2022 17:26:24 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4888.010; Fri, 14 Jan 2022
 17:26:23 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: Daniel Vetter <daniel@ffwll.ch>, Felix Kuehling <felix.kuehling@amd.com>
References: <a5c769fd-7eac-2628-a36d-fedddfb7d398@amd.com>
 <279c7ffc-99e5-f052-5de1-9b957c455d85@amd.com>
 <1ab2558b-1af0-3319-dce6-b805320a49d0@gmail.com>
 <60760210-3b3d-952c-2637-4d70fab1a857@amd.com>
 <fd95f1c0-7550-0497-7284-64a5257304ca@amd.com>
 <ddb344cc-48ec-7323-4494-4e1cb8323585@amd.com>
 <071fbdc1-38ce-d1e8-0e11-25204a3cc217@amd.com>
 <af705589-a601-9774-ec55-d1c244f756a9@amd.com>
 <386142cc-1df5-228c-af24-2187998d9307@amd.com>
 <b80efca2-4a51-7ac9-cc9e-e497ac7c9c7c@amd.com>
 <YeGoVhLgMDOJS15K@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <92f1cc2b-d4db-6c50-d8a3-cdcd31127d15@amd.com>
Date: Fri, 14 Jan 2022 18:26:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YeGoVhLgMDOJS15K@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM5PR0101CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::21) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1314472-7405-4e3d-6496-08d9d782fc99
X-MS-TrafficTypeDiagnostic: MN2PR12MB3486:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3486E050FDCE7E379326B3BA83549@MN2PR12MB3486.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l1O3j8uY8TxLp8+4/bD+N6yI9yG/NxqFNfrEL4iOEnWy/iSZM/k4JSOVzsXlGXU5xMi+5pukM/RAwlqhaVWQ9qYaWITBKTUm8Rtrri7JDxG7TLL2hK2S54NGmJliqLYHaCvKU85ZmvuzfE7ZszlBL864qMatTjJ/yZjHRZGsYBYF7E7RBdgbiZVGa1z6geWxdaQE8wLSI65SoGeWMKKZd/1akwn2FbZJUNruqlIa/41F9sVWDuQImEKPxiYxRRTOxuIwFVA8fooItXgi2KepNaiUNK61Nt4TNU/kFEAV1weBQxyo5ny3mXWpkS+p3hgy83IHQFfXmRnoGJCuolEusnpqgELiuwPkf/ICzaLLh//yQa3isjvWVcELBxPjxy3neoXVdRzt2mzfGG85k3rSZziTL5WZ/iSTTfMuqyMxdjEcAECWoROMGnmBY9NIAfg57Ssxcc6/PgQl8dQuzORxHSTYdH26G7GAHEntVW8SJOCkY5+cC7VToY9e/DQgKwXUOTHasgjT7Ur9RNFQg6ygy9DpjzlsamPZW1ZhirIti1GhZXz0lwFXi1808qWB7P3fGJ/9OryuSvAbEfcyLcoJGKJ4rMgxWe0SZZn61nT0tinAWzPCV/RvYbaPQGQieycb0Oqh1kNBy6S04TzadQeTWlZ4oldYjaYs1xnTVDrSpiZWdYMxnq8bZLbBV99yFZ5VRVT85lV4y9MtgodjnmHVfn2hMM9IC2i7jRcnhQ7f0Xc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(66574015)(38100700002)(2616005)(86362001)(83380400001)(66556008)(66476007)(6666004)(4326008)(110136005)(6486002)(6506007)(6512007)(186003)(8936002)(8676002)(31696002)(508600001)(316002)(31686004)(54906003)(2906002)(6636002)(66946007)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVZRalhIdTBkYjVIRXJhOFhScEM0T08zOWk0aEZkNEdFbWZSSkJZMnBGcFpN?=
 =?utf-8?B?TlJwKytvZXo3NmU0NWl3cXJGcW5INFdOT0ljTmp4emNNRnJGL1pkWitpcmZy?=
 =?utf-8?B?b2FEN0p3bE1pS0tpc2w4ekppMHM0WnpYWGlJS1IvcHFXb0I5RUppOFVrQjAr?=
 =?utf-8?B?QTBEWWwxM2l1Sk9NbExKY1RBOG44K05TWlBkN3JmRmJGOXphNkF2d1lITjlJ?=
 =?utf-8?B?Y2J6RFV2andSN0xuaXRHcW5OMTJwUE1zU2ZMeklLL1Z4Z3ZzUnZZZHBKT0FK?=
 =?utf-8?B?cHA5dUNldWdhdGlSUGkrOW5EZ1Vadk9WbXZONDdkSXJiWkVrLzVjTUlUUHAy?=
 =?utf-8?B?YjIxTkdOdGFMbXJBcFFPTzJEejUxM2FuelFQYWE3UGtvdlVlK0FjdzFyUFRM?=
 =?utf-8?B?cU0rWGZVcm42bHNNOFhWeFJubENlOUNiQ3dUUnppWFI2ZnF3bElqTnViYnRD?=
 =?utf-8?B?YThleDhOWFVQbXFaQ3ZFMzRKVDVYS283N3Ntd3Z0by9QUE1tVmNLT3hKMUlo?=
 =?utf-8?B?cmdmY0hJN1dDM3lwL0NiZE1ZKzNCWEdKdGRPUWl2dndCWkZjRjB4N2FBY0t3?=
 =?utf-8?B?aVM4RnNsWUFxLysxcUprMHlVTDM2aS9ScVBPRUxtRW5CZlVCZjZRRy9rc3JY?=
 =?utf-8?B?cWYzb0RoTFVFVGR6emlJSlRCZk94M0RUOHJ0OWdmR0kreDJNaXJCd1l6dWZw?=
 =?utf-8?B?UjFhb0owb2NqT2ROeXZkMGhIOEx4TW5xbHF6MEdLTXpJUUt0V0NBdE1KYUZv?=
 =?utf-8?B?V0V6QjZwMndvbmxISnVxUXg4c25CbWxWVWlVR1EzVi9vcS81WW0yWjViTnND?=
 =?utf-8?B?eUlsbjJpY2dCZzhFOWdDZkhuMEJ6emljbEE2V25hd0Y0dkp1UHBjMTM3YktG?=
 =?utf-8?B?UDcrZHRvYSt4Y0RjRE85cWFtQ0xCakk4TkFUMFlRV3IrZ3drdnp4WnlXSTQ4?=
 =?utf-8?B?cWxHb2RNY0NGU3l1bWVLejVWMi9SUW5neElwMnpwNXVaUmFJNU9sdmxJbDcy?=
 =?utf-8?B?VXF6SUdmUm5wUG9mNTdvcnJtUlZSNmFGSXkyalh4Y04yei9CRTdwSUNTM1g4?=
 =?utf-8?B?VGtBaHVYQkJxMjc0bTZuVDBBNlhWdFlrZU5lYzNpZUU3VUsvZXdGbXR5SWlt?=
 =?utf-8?B?UjhKUTFLZnNjbXYvTmpjTXI4UEtrcXJxdm5RREZtL2NJaVlGR3RvNTNoQmk1?=
 =?utf-8?B?bG9rc3B2VWUxbHlCYXdQMHhzWCt1bk1EZ1BXdjl4N3dPSzNYL1A1TklUL1o1?=
 =?utf-8?B?ZmlkZ1FnWVpQbVVEWVBLR1lCVDJaWkNxeHNuM3RjRUYrbE96WXpGZzBtY21j?=
 =?utf-8?B?bzF0OFRQQStNQVE2T0RvR2I0a3BNdWt5cS82T3VQckRnaE9CN1RGS0p4dEJm?=
 =?utf-8?B?M1Uwa2I1Q0RDcThodWtTZEl1OVR0MVlmMy9FVnN3ZTVBdXk0cjlQczgzdGpZ?=
 =?utf-8?B?L2tFMlh1UlFua2xmYzhjK2N6ZHlKNHFNM3N1UHVDV1QzUitHeEZhdUVsQ3Nz?=
 =?utf-8?B?djZHbmJyTTV3Zk5Gc2swZ3U4UkYzeVd1Tmc2azJTcU0zVkUwMWo5YkxJVkM5?=
 =?utf-8?B?VXFDYkI4K3BoSHRtZWhlVnk3bndnZERXaG0xc2pOUVYzaVVIS0pZYkFnbkpN?=
 =?utf-8?B?VnVxSS90NUJhZUw5WEJDTzMraFRkTExzM0RjQUowZ3c1Q1dXZTdJY05qcDcy?=
 =?utf-8?B?WFlHL1dYUU5qdTZRd2xrNGg3Y0tVM1E0YTc5R05CcUM3eWJ1NGxPYmMzTHpo?=
 =?utf-8?B?K2Fwa2h6UEFXZHd0UFg2RklPaVNIbHBKLytvS1c0TXdmSWlZeDVIaHJoenRu?=
 =?utf-8?B?YzVCN1BnU0tQMXpLbWY2MXZldjdhOWE4d00yZVdtZk9KbzdzSDA3Q3VxTzNC?=
 =?utf-8?B?Z1ZYYlVQalRLclZkQ2c1cG9wSWk0eWVtMVZ4czg3MlcxcjBjcHhRUlNOMVRH?=
 =?utf-8?B?RHlQNTQraW1JQ0JHc1NCbWljd3VlVU9Qc3B4dHFqc2ZKQm5Ec0ZmTC9tWGo1?=
 =?utf-8?B?TWFCTU9GUXJmR3RZaldQK3YyR3J6RXczalhSMjNsRjhNYktsaEdkbVFxaFdr?=
 =?utf-8?B?RXFtY2FuazBKbGhvUDJlMHRTUVNyazVyOUtGR1ZScm1MaGMzSk9GM2RuQSt6?=
 =?utf-8?B?MlpJWk00alB6aGRTQnVnZFFqN014eDIwOUUrYmI5Tm1zWm4wdFBNVUFlb21i?=
 =?utf-8?Q?/ABrPXzlgWRAFzsJbPBVrw0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1314472-7405-4e3d-6496-08d9d782fc99
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 17:26:23.7329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjsFESsG075kLXi3yejVJkPsf/xekoJqMUAXspwxeEnCUJr89fN7sbj8Ns1zqbKU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3486
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
Cc: daniel.vetter@ffwll.ch, "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>,
 dri-devel@lists.freedesktop.org, David Yat Sin <david.yatsin@amd.com>,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 alexander.deucher@amd.com, airlied@redhat.com, Adrian Reber <adrian@lisas.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.01.22 um 17:44 schrieb Daniel Vetter:
> Top post because I tried to catch up on the entire discussion here.
>
> So fundamentally I'm not opposed to just close this fork() hole once and
> for all. The thing that worries me from a upstream/platform pov is really
> only if we don't do it consistently across all drivers.
>
> So maybe as an idea:
> - Do the original patch, but not just for ttm but all gem rendernode
>    drivers at least (or maybe even all gem drivers, no idea), with the
>    below discussion cleaned up as justification.

I know of at least one use case which this will break.

A couple of years back we had a discussion on the Mesa mailing list 
because (IIRC) Marek introduced a background thread to push command 
submissions to the kernel.

That broke because some compositor used to initialize OpenGL and then do 
a fork(). This indeed worked previously (no GPUVM at that time), but 
with the addition of the backround thread obviously broke.

The conclusion back then was that the compositor is broken and needs 
fixing, but it still essentially means that there could be people out 
there with really old userspace where this setting would just break the 
desktop.

I'm not really against that change either, but at least in theory we 
could make fork() work perfectly fine even with VMs and background threads.

Regards,
Christian.

> - Get acks from userspace driver folks who know real-world gl/vk usage and
>    khr specs in-depth enough to be able to tell us how much we'll regret
>    this.
>
> - Merge it. Or come up with something new. Or maybe stick to the Nack, but
>    then maybe it would be good to document that somewhere in-tree?
>
> This entire can of worms just feels way too tricky to have it be handled
> inconsistently across drivers. And trying to fix these kind of low-level
> things across drivers once divergences exists is just really painful (e.g.
> trying to make all dma-buf mmap VM_SPECIAL or the herculeian task
> Christian is doing to get our dma_resv rules consistent across drivers).
>
> Cheers, Daniel
>
> On Fri, Jan 07, 2022 at 12:47:45PM -0500, Felix Kuehling wrote:
>> Am 2022-01-07 um 3:56 a.m. schrieb Christian König:
>>> Am 06.01.22 um 17:51 schrieb Felix Kuehling:
>>>> Am 2022-01-06 um 11:48 a.m. schrieb Christian König:
>>>>> Am 06.01.22 um 17:45 schrieb Felix Kuehling:
>>>>>> Am 2022-01-06 um 4:05 a.m. schrieb Christian König:
>>>>>> [SNIP]
>>>>>> Also, why does your ACK or NAK depend on this at all. If it's the
>>>>>> right
>>>>>> thing to do, it's the right thing to do regardless of who benefits
>>>>>> from
>>>>>> it. In addition, how can a child process that doesn't even use the GPU
>>>>>> be in violation of any GPU-driver related specifications.
>>>>> The argument is that the application is broken and needs to be fixed
>>>>> instead of worked around inside the kernel.
>>>> I still don't get how they the application is broken. Like I said, the
>>>> child process is not using the GPU. How can the application be fixed in
>>>> this case?
>>> Sounds like I'm still missing some important puzzle pieces for the
>>> full picture to figure out why this doesn't work.
>>>
>>>> Are you saying, any application that forks and doesn't immediately call
>>>> exec is broken?
>>> More or less yes. We essentially have three possible cases here:
>>>
>>> 1. Application is already using (for example) OpenGL or OpenCL to do
>>> some rendering on the GPU and then calls fork() and expects to use
>>> OpenGL both in the parent and the child at the same time.
>>>      As far as I know that's illegal from the Khronos specification
>>> point of view and working around inside the kernel for something not
>>> allowed in the first place is seen as futile effort.
>>>
>>> 2. Application opened the file descriptor, forks and then initializes
>>> OpenGL/Vulkan/OpenCL.
>>>      That's what some compositors are doing to drop into the backround
>>> and is explicitly legal.
>>>
>>> 3. Application calls fork() and then doesn't use the GPU in the child.
>>> Either by not using it or calling exec.
>>>      That should be legal and not cause any problems in the first place.
>>>
>>> But from your description I still don't get why we are running into
>>> problems here.
>>>
>>> I was assuming that you have case #1 because we previously had some
>>> examples of this with this python library, but from your description
>>> it seems to be case #3.
>> Correct. #3 has at least one issue we previously worked around in the
>> Thunk: The inherited VMAs prevent BOs from being freed in the parent
>> process. This manifests as an apparent memory leak. Therefore the Thunk
>> calls madvise(..., MADV_DONTFORK) on all its VRAM allocation. The BOs
>> that are causing problems with CRIU are GTT BOs that weren't covered by
>> this previous workaround.
>>
>> The new issue with CRIU is, that CRIU saves and restores all the VMAs.
>> When trying to restore the inherited VMAs in the child process, the mmap
>> call fails because the child process' render node FD is no longer
>> inherited from the parent, but is instead created by its own "open"
>> system call. The mmap call in the child fails for at least two reasons:
>>
>>    * The child process' render node FD doesn't have permission to map the
>>      parent process' BO any more
>>    * The parent BO doesn't get restored in the child process, so its mmap
>>      offset doesn't get updated to the new mmap offset of the restored
>>      parent BO by the amdgpu CRIU plugin
>>
>> We could maybe add a whole bunch of complexity in CRIU and our CRIU
>> plugin to fix this. But it's pointless because like you said, actually
>> doing anything with the BO in the child process is illegal anyway
>> (scenario #1 above). The easiest solution seems to be, to just not
>> inherit the VMA in the first place.
>>
>> Regards,
>>    Felix
>>
>>
>>>> Or does an application that forks need to be aware that some other part
>>>> of the application used the GPU and explicitly free any GPU resources?
>>> Others might fill that information in, but I think that was the plan
>>> for newer APIs like Vulkan.
>>>
>>> Regards,
>>> Christian.
>>>
>>>> Thanks,
>>>>     Felix
>>>>
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Regards,
>>>>>>      Felix
>>>>>>
>>>>>>
>>>>>>> Let's talk about this on Mondays call. Thanks for giving the whole
>>>>>>> context.
>>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> Regards,
>>>>>>>>       Felix
>>>>>>>>

