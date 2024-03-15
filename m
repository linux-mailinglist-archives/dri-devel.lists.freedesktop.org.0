Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDE287C78B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 03:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB4F10E43D;
	Fri, 15 Mar 2024 02:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VmSG1sAG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2084.outbound.protection.outlook.com [40.107.212.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965F410E3FF;
 Fri, 15 Mar 2024 02:33:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+Ceduhs79ZhA0D7XM4neN+Rgs3vMs5t+Wo67GXOA8MwX+aJGfjX7WPwuMv8iEULPg5dNzAIvDc7TvgFNZ95k4u+ftjRTBG9i3OId8HUd+s/li470+Q65MmR1qwKrl0yKLRLB5XsKbwwaNMEwe3hntbU54C8QsFpumsMtKaN99Rllh+QkYETPsNsI79fThhRP5AbrVOARf3fqBh14W05bSuCCSuFfc/h3tMxEt7EdfN+V+Ef0CoMVWCJkbVZ9Hl2GfvgeeiGLfsTkP/qYJe7d731XIW+aXrDA+lhLWbo6KLbQfKdJzGeNC8qK6Xsu3d1S6zkojOlJEcKZLsOs48iag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBiy6IfDi5JJbOgri4NaMj8gEInvKXAynq6wMT8A1WY=;
 b=jr8a+XUjrArvNyb/pyfiiGFCdhohRD8b/XpD2EKI/NyS+PlxBfwGaKxj819K3fvOR9OYrXMRrELELBS3Knh2neAVWW/6FNjMDEAzysMdQLdNIHbCZ6VHmZf+01mxGx3+QnqmQkPy/16yBk2Z60H7aJQ0fu2/Qfy9PqSwJ1qK1UarkbAY95xGOvYD46hUPJexKpGwCpgmVi0D1njZrmQtOj47odrIGoXpBHqJAqMupQnlcWHH98936PCWochj3yRZhKQZL/2oJqIPf3xJue1SHQjdBTfCNiaJQNcCObReG+m1+Gu/fCsK8WbkMArQ8r0NjGY6WNYgsIFR0ri2esxXDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBiy6IfDi5JJbOgri4NaMj8gEInvKXAynq6wMT8A1WY=;
 b=VmSG1sAGrOfQKBeZhu4NUsRZXlU05BZqWDc0HCAHamQrqPnU0tMgV1mIlbt2b1+JZP7fqTRwmKm69dRFQ+KdyZBA0IFSq0fWdjfkVMpNSLOBdodlxWButY3vtxr4d5yAthr77n2CNZWfweRTfO+z+P1c3gq9rTJzn+RUi0RwYbE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SA1PR12MB7295.namprd12.prod.outlook.com (2603:10b6:806:2b6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.34; Fri, 15 Mar
 2024 02:33:12 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::8099:8c89:7b48:beed]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::8099:8c89:7b48:beed%7]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 02:33:10 +0000
Message-ID: <330606ad-4236-4b2c-9606-b51ec6567a25@amd.com>
Date: Thu, 14 Mar 2024 22:33:08 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Proposal to add CRIU support to DRM render nodes
Content-Language: en-US
To: Tvrtko Ursulin <tursulin@ursulin.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 criu@openvz.org
Cc: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <03a9977c-2044-40c7-9688-9ab326abb81c@amd.com>
 <81c7b2c3-564a-4946-832b-5394cd19a7b7@ursulin.net>
 <b5134b40-6e84-47c9-a4f2-2a2c0faa9481@ursulin.net>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <b5134b40-6e84-47c9-a4f2-2a2c0faa9481@ursulin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXP288CA0018.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::48) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SA1PR12MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: fff5bdeb-63b3-46ad-c74e-08dc44984169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AFdvOxOhtiQ21jAVupn1t3GNd9pdED9UwmLjuUuRFNwX/DUWXaDXBNalsNdKgc7zJZLzsQjKlPxlOMyXEiRtW2EHX1/ZLVe4R9yV9/zw8kBVfP6VOSMg6glut42i2oCbNrpaKSyh6AjIehgdXtOdGktONe3manXWmLO7gfAxvf6yOjP+l4e9e3kh2BYNneqhYTwJVLqBG3KT49nw+IlVipFPXOzI5zuhGqTK7sMlP6gayGaK08OC87ZxeDeA1EJHqgIzngO785Kr6VsUJmztePB7EjroTgBWBxvgcNIqa7H+wws7QqujUUPpX9KGZcHQLmncGVBTFPEdQgvEAeq1F/SjNe950Zd2F2HyF3vNwLSy+sNvc96KXnY3DX6SZQSg/ss44+rCaavJKKRFzrS0fj0ep1CuMO9hkkPHXVOR7KbYXmX0sx13IBJVPa+voucF0JHawn++lVL8DdNfJFbufhic5ZU/Si1poUK+g9nfbcZWT8j3iHY/zlhLgNIN+NOZJmoxwD1MjvdVs1BhM/5rw+xJvAKldNLOKbFsRJaoYSkl+kG1Ey4QzqttkDrdNnzyz2F71E/JcbOoUlcXceR8G2V6OFfgHMRjFClHNMhYW5LC3F1+vLrGb7sR2UATDP6Z8AtM+tK7sWWhPk+ofjrzvOnj2MrvWsCWpEMFIDrpADE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(3613699003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnVBb1YvZnVObWJxZGptcjMvWlVpWkY2aldHMFQrVCs0Tmd2VzRnTUpadmVC?=
 =?utf-8?B?cjlvRGtPY2lJMVVmQzluazFNU0FYN1hUNnNRbkRhQVl2SlgwNE1vVlVGSzFB?=
 =?utf-8?B?UUtvc25scDJYTU1Kdm1PckhUK3RmS2t3d2hmekRpeVE3Mi9JMVlBOVEwTlBM?=
 =?utf-8?B?SU01bDFuekNaWkFHSTE0SEpHM3pKdlVZa3h3cDVqc1FtVEIyZjNPR1U2NWow?=
 =?utf-8?B?eU4xOWk0ZlZuQTMrejZFRlVOT2ZNVVBEQW9XTUo5TDlCTzVYbmhRMDdvNzM3?=
 =?utf-8?B?emZXbHJoVEVLOXowUVlFTFFmc0pSTGp0Qkc3Qjl6dGcvQlNIejlwNElXbmto?=
 =?utf-8?B?NU5NN2NOMFNJVEdWWkdseXFBQ1c4dVR3cjdPV0Y5SVk3cThER25ZMVl1ZGNt?=
 =?utf-8?B?SURSZU5xYW9rSDFwbTZHYnpiUnhRd2RNNVhRcUg2a3NNUjFhaWwwamp2Y3Jt?=
 =?utf-8?B?cHFWRlBYK3VSWmdLb3VDZXdJYmtBakJLUVlMY1NtRnhnZ0ErNis2L1lBTjZW?=
 =?utf-8?B?VEFiVDhvaGVuYlI5QkN4ZzFHWWFROGwwWEgzdzNjUzRqLzRtMzB2UElsZEFF?=
 =?utf-8?B?M0pDbjUzMVgxZExKak1JK21uTFFDZ1k3Umw2ZUZtK1QwR0czL0xZMHYwQTVY?=
 =?utf-8?B?Q3RFdWQzWHM5cGZSQTJnY2IyamwvZ2l1M2JiVzQ1dUZ5djRNMjNjWk1YTzFP?=
 =?utf-8?B?b1ljU3MxMm1oUEtGWHhxZXoySlFmWHlyYmdqUnpjcGRHVHdXcHdyc01PdmVF?=
 =?utf-8?B?MWRQdW1qZjh0S3BGRGxtNmMxUWZaM29KYWdqaTBucVJWTmVQN0pRcnV4bmJT?=
 =?utf-8?B?RnNRKzI0bkxpalJaOW9VcUMxcko1Rkw3U29uSEExUVV6TTFuU01xdXdzOXdS?=
 =?utf-8?B?MzdUVHNZWXhVSHkrc1U2SUx1V0pod01lMm1JdFhoOS9vMk0yb1FudGh5ODZx?=
 =?utf-8?B?MnlKa1RQQnVjcUJqLy9ZYjk2Vi91L1J5R1JHRlhrK0RvaHF3V0xrdXBEQUxk?=
 =?utf-8?B?eHFMVzAvaVpxdFdaT0haMDh3QkE2RkxFNVBUM0RyTFlCQkVzb2tGTjh2bWEz?=
 =?utf-8?B?WVFiWFI4eDVzNm8wN1R0WVhlOVJzcll0MjhZWFVzbFFLTlFSYThBeDUyQmhl?=
 =?utf-8?B?RC9EOWRaRkxhWWVkWlBkdi8vTVFjRWdlbmxnZUthQ01YVlB2NWU4NGZpdXk5?=
 =?utf-8?B?MnhvL1kxMld3cEZFbEkyWjRUbVM0TTJWNy9BVWtTbzlTVnprcTRueGVXV1Uw?=
 =?utf-8?B?ZG1EMmE5TWVXT1krMTNEejdoek5jdjl2QjJGOHpwVElqcjZ0MjNZcVdFdzkx?=
 =?utf-8?B?R2JJU0hMTHg4M3ROaW1ocGwzU0tSNm4xZnpWOHIzb3NINkhGMWNmeWpHcDZy?=
 =?utf-8?B?WFQwcHBTMU5WU2dacjJtNERicFpOTlZvZlN6aWVtZXdOQ1pJTU4zL0E0K0Rw?=
 =?utf-8?B?OXhSTGs4clU1MzhqTnR1bkFLcXJ6cGNDT0ZrMzE4ZGdKeW5iS3A0V0lnc1R5?=
 =?utf-8?B?cDVCTm12ZDRNcWszWC9sNWM2QW5QcHJVVkxGK1JieUd2Rk5PNUE1YnZzc2xZ?=
 =?utf-8?B?TEVYdit2L2hLT2dvcWVOV3ZaNUdsU01WR0hIRk44U1dURElpbk9nejBMdVlF?=
 =?utf-8?B?ZVhubmRtcTFCaGxhR1JTZGlkbjJ2VVNSSmp5aStCZ3N0Z0JMY0hUREd4NGVq?=
 =?utf-8?B?RGZnWXo1NXZhaDFwdzlSb1JaczFWeUxJYzJlVkMvMnZCdnFJYjVjQ3EyZmo1?=
 =?utf-8?B?REx3SDhzTVR2ZUtPSVFGYmpCbEMvY1Z1eVZpdVFWYnc3ZHB2enpWNDNkTkVE?=
 =?utf-8?B?MGR5TDEreTljdHRkeUNEVTBZdWU3NXFQeUVmNXZnWUpkWjNac05KUnF0Y0JN?=
 =?utf-8?B?NTFxQ2ExMUxyS0lYRVMzRVNNZUFPb3dCSkFEZTBzeEVrOTRPZWlsVVVCbk5I?=
 =?utf-8?B?Rk5OeEtSNkZLeUYyOERHSEtwVENmWTBXUXFCWDJjMmdSL1hkbmJ0eGwzVUdD?=
 =?utf-8?B?Q1phVzRTY2JLTEVINGpWYmkzUlU3b2ZsVm5vM1Fuait0QWVYOFlWVXhnTVZq?=
 =?utf-8?B?cDZjKzlQVXBwZWdJSG9EMzB3TnhnTnpnL3VxOUMwYzJkWUtZdlQ4UHhhUEd0?=
 =?utf-8?Q?qrgoN1hIXTivyX0cIoydZCFl4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fff5bdeb-63b3-46ad-c74e-08dc44984169
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 02:33:10.4169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBjRwliKdFqOOLLQJsOFZ1fNH0wWtikIRWyC8Kp9EQDvj3QDgdgBVF3d+XLrDjJNVgwWwlPUmHkvoov/Fc7znw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7295
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


On 2024-03-12 5:45, Tvrtko Ursulin wrote:
>
> On 11/03/2024 14:48, Tvrtko Ursulin wrote:
>>
>> Hi Felix,
>>
>> On 06/12/2023 21:23, Felix Kuehling wrote:
>>> Executive Summary: We need to add CRIU support to DRM render nodes 
>>> in order to maintain CRIU support for ROCm application once they 
>>> start relying on render nodes for more GPU memory management. In 
>>> this email I'm providing some background why we are doing this, and 
>>> outlining some of the problems we need to solve to checkpoint and 
>>> restore render node state and shared memory (DMABuf) state. I have 
>>> some thoughts on the API design, leaning on what we did for KFD, but 
>>> would like to get feedback from the DRI community regarding that API 
>>> and to what extent there is interest in making that generic.
>>>
>>> We are working on using DRM render nodes for virtual address 
>>> mappings in ROCm applications to implement the CUDA11-style VM API 
>>> and improve interoperability between graphics and compute. This uses 
>>> DMABufs for sharing buffer objects between KFD and multiple render 
>>> node devices, as well as between processes. In the long run this 
>>> also provides a path to moving all or most memory management from 
>>> the KFD ioctl API to libdrm.
>>>
>>> Once ROCm user mode starts using render nodes for virtual address 
>>> management, that creates a problem for checkpointing and restoring 
>>> ROCm applications with CRIU. Currently there is no support for 
>>> checkpointing and restoring render node state, other than CPU 
>>> virtual address mappings. Support will be needed for checkpointing 
>>> GEM buffer objects and handles, their GPU virtual address mappings 
>>> and memory sharing relationships between devices and processes.
>>>
>>> Eventually, if full CRIU support for graphics applications is 
>>> desired, more state would need to be captured, including scheduler 
>>> contexts and BO lists. Most of this state is driver-specific.
>>>
>>> After some internal discussions we decided to take our design 
>>> process public as this potentially touches DRM GEM and DMABuf APIs 
>>> and may have implications for other drivers in the future.
>>>
>>> One basic question before going into any API details: Is there a 
>>> desire to have CRIU support for other DRM drivers?
>>
>> This sounds like a very interesting feature on the overall, although 
>> I cannot answer on the last question here.
>
> I forgot to finish this thought. I cannot answer / don't know of any 
> concrete plans, but I think feature is pretty cool and if amdgpu gets 
> it working I wouldn't be surprised if other drivers would get interested.

Thanks, that's good to hear!


>
>> Funnily enough, it has a tiny relation to an i915 feature I recently 
>> implemented on Mesa's request, which is to be able to "upload" the 
>> GPU context from the GPU hang error state and replay the hanging 
>> request. It is kind of (at a stretch) a very special tiny subset of 
>> checkout and restore so I am not mentioning it as a curiosity.
>>
>> And there is also another partical conceptual intersect with the (at 
>> the moment not yet upstream) i915 online debugger. This part being in 
>> the area of discovering and enumerating GPU resources beloning to the 
>> client.
>>
>> I don't see an immediate design or code sharing opportunities though 
>> but just mentioning.
>>
>> I did spend some time reading your plugin and kernel implementation 
>> out of curiousity and have some comments and questions.
>>
>>> With that out of the way, some considerations for a possible DRM 
>>> CRIU API (either generic of AMDGPU driver specific): The API goes 
>>> through several phases during checkpoint and restore:
>>>
>>> Checkpoint:
>>>
>>>  1. Process-info (enumerates objects and sizes so user mode can 
>>> allocate
>>>     memory for the checkpoint, stops execution on the GPU)
>>>  2. Checkpoint (store object metadata for BOs, queues, etc.)
>>>  3. Unpause (resumes execution after the checkpoint is complete)
>>>
>>> Restore:
>>>
>>>  1. Restore (restore objects, VMAs are not in the right place at 
>>> this time)
>>>  2. Resume (final fixups after the VMAs are sorted out, resume 
>>> execution)
>>
>> Btw is check-pointing guaranteeing all relevant activity is idled? 
>> For instance dma_resv objects are free of fences which would need to 
>> restored for things to continue executing sensibly? Or how is that 
>> handled?

In our compute use cases, we suspend user mode queues. This can include 
CWSR (compute-wave-save-restore) where the state of in-flight waves is 
stored in memory and can be reloaded and resumed from memory later. We 
don't use any fences other than "eviction fences", that are signaled 
after the queues are suspended. And those fences are never handed to 
user mode. So we don't need to worry about any fence state in the 
checkpoint.

If we extended this to support the kernel mode command submission APIs, 
I would expect that we'd wait for all current submissions to complete, 
and stop new ones from being sent to the HW before taking the 
checkpoint. When we take the checkpoint in the CRIU plugin, the CPU 
threads are already frozen and cannot submit any more work. If we wait 
for all currently pending submissions to drain, I think we don't need to 
save any fence state because all the fences will have signaled. (I may 
be missing some intricacies and I'm afraid it may not be that simple in 
reality, but that's my opening bid. ;)


>>
>>> For some more background about our implementation in KFD, you can 
>>> refer to this whitepaper: 
>>> https://github.com/checkpoint-restore/criu/blob/criu-dev/plugins/amdgpu/README.md
>>>
>>> Potential objections to a KFD-style CRIU API in DRM render nodes, 
>>> I'll address each of them in more detail below:
>>>
>>>   * Opaque information in the checkpoint data that user mode can't
>>>     interpret or do anything with
>>>   * A second API for creating objects (e.g. BOs) that is separate from
>>>     the regular BO creation API
>>>   * Kernel mode would need to be involved in restoring BO sharing
>>>     relationships rather than replaying BO creation, export and import
>>>     from user mode
>>>
>>> # Opaque information in the checkpoint
>>>
>>> This comes out of ABI compatibility considerations. Adding any new 
>>> objects or attributes to the driver/HW state that needs to be 
>>> checkpointed could potentially break the ABI of the CRIU 
>>> checkpoint/restore ioctl if the plugin needs to parse that 
>>> information. Therefore, much of the information in our KFD CRIU 
>>> ioctl API is opaque. It is written by kernel mode in the checkpoint, 
>>> it is consumed by kernel mode when restoring the checkpoint, but 
>>> user mode doesn't care about the contents or binary layout, so there 
>>> is no user mode ABI to break. This is how we were able to maintain 
>>> CRIU support when we added the SVM API to KFD without changing the 
>>> CRIU plugin and without breaking our ABI.
>>>
>>> Opaque information may also lend itself to API abstraction, if this 
>>> becomes a generic DRM API with driver-specific callbacks that fill 
>>> in HW-specific opaque data.
>>
>> This feels sound in principle to me. Fundamentally the state is very 
>> hardware specfic, and/or driver version specific, so I don't see 
>> anything could be gained in practice by making it much less opaque. 
>> (Apart from making things more complicated.)
>>
>> I was however unsure of the current split of how you dump buffer 
>> objects with some data in the defined bo structure, and some in 
>> completely opaque private data. Is there a benefit to that split, or 
>> maybe in other words, is there a benefit on having part transparent 
>> and part opaque for buffer objects?

Some of the buffer object state is needed by the plugin. E.g. the size 
and mmap offset are needed to match VMAs with BOs. I'd have to review 
the plugin in detail to prove that all the fields are, in fact, needed 
by the plugin, but that was the intent. Anything that the plugin doesn't 
need to know should be in the opaque data structures.


>>
>> To slightly touch upon the question of whether this could become a 
>> generic DRM API. It feels it would be hard to do it from the start. 
>> What sounds more feasible is if/when generic looking helpers can be 
>> spotted while developing the RFC then potentially structure the code 
>> they can easily be promoted to shared/common at some future moment.

Yes, that's how this usually goes, in my experience. Thanks for confirming.


>>
>>> # Second API for creating objects
>>>
>>> Creating BOs and other objects when restoring a checkpoint needs 
>>> more information than the usual BO alloc and similar APIs provide. 
>>> For example, we need to restore BOs with the same GEM handles so 
>>> that user mode can continue using those handles after resuming 
>>> execution. If BOs are shared through DMABufs without dynamic 
>>> attachment, we need to restore pinned BOs as pinned. Validation of 
>>> virtual addresses and handling MMU notifiers must be suspended until 
>>> the virtual address space is restored. For user mode queues we need 
>>> to save and restore a lot of queue execution state so that execution 
>>> can resume cleanly.
>>
>> This also sounds justified to me. Restore creating all internal 
>> objects is definitely special and sounds better to add uapi to create 
>> them directly with the correct properties, than to add uapi to adjust 
>> internal properties after creation. And in case you would always need 
>> some new uapi - so at least to adjust after creation. At which point 
>> you may have both in one. Internally implementation can be split or 
>> common, whatever makes sense for a given object type, but new uapi 
>> definitely sounds is required.
>>> # Restoring buffer sharing relationships
>>>
>>> Different GEM handles in different render nodes and processes can 
>>> refer to the same underlying shared memory, either by directly 
>>> pointing to the same GEM object, or by creating an import attachment 
>>> that may get its SG tables invalidated and updated dynamically 
>>> through dynamic attachment callbacks. In the latter case it's 
>>> obvious, who is the exporter and who is the importer. In the first 
>>> case, either one could be the exporter, and it's not clear who would 
>>> need to create the BO and who would need to 
>>
>> To see if I follow the former case correctly.
>>
>> This could be two clients A and B, where B has imported a dma-buf 
>> shared BO from A and has since closed the dma-buf fd? Which results 
>> in a single BO with reference count of 2 and obj->import_attach 
>> unset. History of who created the object is lost.

Yes. In the amdgpu driver this happens when the exporter and import 
device are the same.


>>
>> In fact it could even be that two imported objects remain (clients A, 
>> B and C) and A, who originally created the BO, has since fully 
>> released it. So any kind of "creator" tracking if added wouldn't be 
>> fully reliable either.

That's a good point.


>>
>>> import it when restoring the checkpoint. To further complicate 
>>> things, multiple processes in a checkpoint get restored 
>>> concurrently. So there is no guarantee that an exporter has restored 
>>> a shared BO at the time an importer is trying to restore its import.
>>>
>>> A proposal to deal with these problems would be to treat importers 
>>> and exporters the same. Whoever restores first, ends up creating the 
>>> BO and potentially attaching to it. The other process(es) can find 
>>> BOs that were already restored by another process by looking it up 
>>> with a unique ID that could be based on the DMABuf inode number. An 
>>> alternative would be a two-pass approach that needs to restore BOs 
>>> on two passes:
>>>
>>>  1. Restore exported BOs
>>>  2. Restore imports
>>>
>>> With some inter-process synchronization in CRIU itself between these 
>>> two passes. This may require changes in the core CRIU, outside our 
>>> plugin. Both approaches depend on identifying BOs with some unique 
>>> ID that could be based on the DMABuf inode number in the checkpoint. 
>>> However, we would need to identify the processes in the same restore 
>>> session, possibly based on parent/child process relationships, to 
>>> create a scope where those IDs are valid during restore.
>>
>> If my understanding above is on the right track, then I think this is 
>> the only thing which can be done (for all scenarios).

I presented two alternatives. I think you're in favor of the first one, 
where it doesn't matter who is the importer and exporter. I think the 
two-pass approach requires that you can identify an exporter. And as you 
pointed out, the exporter may already have dropped their reference to 
the BO.


>>
>> I also *think* it would be safe. At least at the moment I cannot 
>> think what could go wrong. Semantics are that it doesn't really 
>> matter who created the object.

I would agree. What matters is that the object is recreated on the 
correct device, and that all the direct references and import 
attachments pointing to it are restored.


>>
>>> Finally, we would also need to checkpoint and restore DMABuf file 
>>> descriptors themselves. These are anonymous file descriptors. The 
>>> CRIU plugin could probably be taught to recreate them from the 
>>> original exported BO based on the inode number that could be queried 
>>> with fstat in the checkpoint. It would need help from the render 
>>> node CRIU API to find the right BO from the inode, which may be from 
>>> a different process in the same restore session.
>>
>> This part feels like it is breaking the component separation a bit 
>> because even for buffers fully owned by amdgpu, strictly speaking the 
>> dma-buf fd is not. At least my understanding from the above is that 
>> you propose to attempt to import the fd, from the kernel side, during 
>> the checkpoint process? Like:
>>
>> Checkpoint:
>>
>> CRIU for each anon fd:
>>    amdgpu_plugin(fd)
>>      -> attempt in kernel dma buf import (passes fd to kernel via 
>> ioctl?)
>>          -> is it ours? (no -> error)
>>              -> create a record mapping fd number to amdgpu BO
>>
>> Restore:
>>
>> for each dma-buf fd record:
>>     create BO if does not exists
>>     export BO to same fd
>>     close BO handle if not in regular BO handle records
>>
>> Or since you mention lookup by inode, that would need to be 
>> dmabuf_plugin so it can lookup inodes in the private mount space. 
>> However how would it co-operate with amdgpu_plugin is not clear to me.

The way I think about the ownership is, whichever driver created the 
underlying BO owns the checkpointing of the dmabuf. You need 
driver-specific information to link the dmabuf with the driver's BO and 
you need the right driver to recreate the BO and the dmabuf fd when 
restoring the checkpoint.

It gets really interesting if you have an amdgpu plugin and an i915 
plugin, and they checkpoint an application that shares BOs between the 
two devices through DMABufs. E.g. if i915 created a BO and amdgpu 
imported it, then during restore, i915 needs to restore the dmabuf 
before the amdgpu import of it can be restored. I think that brings us 
back to a two-phase approach to restoring the memory sharing 
relationships. Uff.


>
> I later also realised that I was maybe increasing the scope for you 
> here. :) You did state focus is ROCm applications which possibly 
> doesn't care about dma-resv, fences, syncobjs etc?

That's my focus for now. But I don't want to engineer a solution that 
would preclude your use cases in the future.


>
> But I think the "how to handle dma-bufs" design question is still 
> relevant and interesting. For example I had this thought that perhaps 
> what would be needed is a CRIU plugin hierarchy.
>
> Because fundamentally we would be snapshoting a hierarcy of kernel 
> objects belonging to different drivers (kfd, amdgpu, dma-buf, ...). 
> And if one day someone would to try to handle dma fences and drm 
> syncobjs, the argument for a hierarchial design would be even stronger 
> I think.
>
> Something like a drm_plugin.so could call sub-plugins (amdgpu, 
> dma-buf, sync file, ...) and internally build the representation of 
> the whole state and how the relationship between the objects.

Maybe. I guess a structure similar to libdrm makes sense. I'm not sure 
it's strictly a hierarchy. Maybe more like some common code shared by 
multiple GPU driver plugins. I think the common checkpoint state is 
quite limited and restoring it requires the GPU-specific drivers anyway.

Also the idea of building a representation of the whole state doesn't 
work well with the CRIU design, because "the whole state" can include 
multiple processes that restore themselves concurrently and only 
synchronize with each other in a few places in the restore process. I 
feel, if we can work out how to checkpoint and restore shared objects 
between processes, we can do the same for shared objects between drivers 
without imposing a strict hierarchy and some omniscient entity that 
needs to know "the whole state".


>
> With that kind of design there probably would be a need to define some 
> common kernel side api and uapi, so all involved objects can be 
> enumerated with some unique ids etc.
>
> Now.. the counter argument.. the more state from different drivers 
> would one want to handle the bigger this project would get. Would it 
> even be feasible is the question, to the point that it may be simpler 
> to just run the workload in a VM via SR-IOV and simply hibernate the 
> whole thin guest. :)

Well, CRIU kind of tries to do that, but with containers instead of VMs. ;)

Regards,
   Felix


>
> Regards,
>
> Tvrtko
