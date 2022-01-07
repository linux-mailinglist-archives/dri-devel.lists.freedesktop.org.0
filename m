Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AE1487B9F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 18:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E4010FE0D;
	Fri,  7 Jan 2022 17:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EA010FE0D;
 Fri,  7 Jan 2022 17:47:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgY+Bw12/p6us65JgsIZUbwhYFtCq6qIRo0+ZQDLMjsYYJfBv8cjS6/OfOdUm9JBPZH5KykvXrYwtiMOuxKprtzSTncad7MXolnYr2gWvWdy4bRR0X5qF+6GvuiGyLbJjkwKnetauIpsZGBI5KZ6ebruyhPEAY4bH9KIodlng/Yie4kTe7mds101P3w7izutPksXn9PF9NsYBqUiheIgN7ZIG3zUYz9ipnlSJIfdlJmRh0QCtP0FD3fqRZM+RbLpVLsKjf5P4ul4+Airr6+yhCE2KDjE1ecK3ICwYt/N9r9By9Z0uT+FdPxRd66ULp8CYvSpcLsxkUyucOdCsIp9jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVtYDFc2gAqncR7dHCVw716VCwZq2L+ELfRP6yllzJA=;
 b=d+7YhyAgvCmCCD6WcSwtfMMoj8RffuRBUb3cst4IsJ6POC7Gs0mdNQk8SGYu+wAhKMNC453LhoAVh7oxPbEMAVMDJsQII3yoqY7YKHI9BAKkjV7c6Ovz5Mu4IDbVgCVDe9k7gthXNjltm/oa3EPhoO+F31pqmzI8eWqcaZQ339F/6/AdBnyJf1H6b6ucHgL9bLhuDC9IEJ627gSqlIR6lU/5Jt46+JzuyU/iintOXXUTXOn41Ws/cYKJHdkuxSRJDtljSq+jxGBjR5NMZhokvs0G7oTNSsUHF+QT3zY13Bma7Ovx7A8S53yeNIFqDpNlKit+CgHQ0AzjnxEh5wNdhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVtYDFc2gAqncR7dHCVw716VCwZq2L+ELfRP6yllzJA=;
 b=M+FUmt0/REwlSbyPlyVOdOaYCsRtJo4S1wgHi6qq7Y5lgYo3mWTT4LcGyNFXObumvBXi4TKTJlcFKyNOuwudQ2lQZtxjnldN26sQOfC+HIJVkACA7wzoJIXKJN2sG4lCj+RfayH0ae8r8KG95jV8l/iLGgT2FCAHiRholGZvW0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5365.namprd12.prod.outlook.com (2603:10b6:408:102::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Fri, 7 Jan
 2022 17:47:47 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 17:47:47 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
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
 <60760210-3b3d-952c-2637-4d70fab1a857@amd.com>
 <fd95f1c0-7550-0497-7284-64a5257304ca@amd.com>
 <ddb344cc-48ec-7323-4494-4e1cb8323585@amd.com>
 <071fbdc1-38ce-d1e8-0e11-25204a3cc217@amd.com>
 <af705589-a601-9774-ec55-d1c244f756a9@amd.com>
 <386142cc-1df5-228c-af24-2187998d9307@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <b80efca2-4a51-7ac9-cc9e-e497ac7c9c7c@amd.com>
Date: Fri, 7 Jan 2022 12:47:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <386142cc-1df5-228c-af24-2187998d9307@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0076.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::15) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5e1f803-a63f-4806-e8cb-08d9d205d100
X-MS-TrafficTypeDiagnostic: BN9PR12MB5365:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB536559FF4C0E863CBC89DD90924D9@BN9PR12MB5365.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RUBczCeBfvcOue2K+0ejwasr91BSczGh2icjFe0s9AH7ZdsWXIYrRp+r+JKxCjeF4mTswB5OxHMmm+5qNPaKiYOFsM2gRFhiqt5i9c7qoGqa8xTFJnjop816sxP7Eq1t4qFfKNpYFbcv4Tmy0reZV+Rlfy+0rpDxfyd4BRfd/VRhRWzBo9dM8v82i8ICfBLSyqp+J9ouWbHlsLMRa5BWniDHiQD6A0mjelKPFzkEiepMXjaR8OMutml40fwBIljS4a4cPJ9mlW5EqLCseeUPzcVR3pgWfDtmq/fm97yvQAZZlLK/cpu8FusR7Q//fEUnwYSjiOSMc1i70ZOpHg1zOZ1T7Ch2uCmybx1cGA+m57vXufMMwqI1xIIutBqINpyYhyPQ/WnD5vrVwdrQ0EEwZAcRCqVNRe14W1xWqe2133uvmFy4rFGf0wUHPtv8vlTZ26qz2aYXJzhu33Z/liE/6KCK9LVEbbgr8NdyWyp9p+r6m3ct2eTw58QBQlnLM0bevUmYuJmOvEN3oHh8cr9BoN+lvGVmo3Q9US9Z3buwngmK0v6JyqVxlEHeXXKssY0Frx8xJUkduFNgVsUQh4QkIEAIq83z6Zu0VbTXfphET4C/aBfZmLtXT1ISs8ak+jCQtnVwMJ220jfZkWz24BhmeNeLYhF3o0agyl7DDcdVvuHYdzOsTZFkXC9HXDtHSFBxPe1Seqbguxy9AJjoNziHp640/QnxDGR/PNo3JRQ16lA4No2rOy72C2HOKqApERO1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(4326008)(2616005)(66476007)(36756003)(66556008)(508600001)(8676002)(8936002)(6506007)(86362001)(5660300002)(44832011)(2906002)(186003)(31686004)(26005)(38100700002)(83380400001)(66946007)(31696002)(6486002)(66574015)(110136005)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkpqdDZweldRSFc5Yy9Wclo3QjQ0SWdkS054WG16SVdZMm9KN21sZmpLRXFO?=
 =?utf-8?B?YXdmdmtRS2lTQ01nTUxTa0w4dmFkTWNvQzVNbTN4eFVRc3NTdTZ2a2NQZFRG?=
 =?utf-8?B?VmRHbUgyNXlKcWN2Vit0TUtleTgwcHJFbSt2TW5sNmFZbWV2ckNuamYrN1hL?=
 =?utf-8?B?emJxOUQ1SmpqVnpDMkpkdFZlWUMrTzFMdUtyb3ZYZWp5SG9Gd05ycUc5bFBG?=
 =?utf-8?B?WTUwWmpKck5yRXJUOEg2VDZVcXZRRzc5UXR2NlhidEJoNm1ic3RQWkVpd0da?=
 =?utf-8?B?Mk80ZFAxRysyN1VRSVdzZkROTCtFbkdJTklScGVadTFQWW04UEg4K005bDJI?=
 =?utf-8?B?dmFiMW9QTzBWVTRJL3cxUUZjT1VjeUFOWi9QRyt2UWtLbUkwNEpyMytNcUda?=
 =?utf-8?B?ZWdVRjlkVWpSN1JYQ0ZraFZrdEplMjUzVFVad1c2ZmNVejFRYmVlNWNEb0Ju?=
 =?utf-8?B?bWxsRUswSytBN3l5aC9XRWRROWltaFdHQ2k5Z2pHb2pIdHFKQkY4MmxnMm8v?=
 =?utf-8?B?cTFqQnVrZmJMU3huc05CQ2p2TzYwaGVHZERNeTI1TTRmU1hMV0NZaHBOZmNs?=
 =?utf-8?B?Wk5TZXlFS3k0YWlwNWJrTStvZHNSb05UMFppWDlQTGNORVRuS2NiaGVId1cx?=
 =?utf-8?B?elJwSC83R1BJdWpobmtzODB6T3FENys3VEQvRlhWRHU4d0N3Q0dPd1RvQnhP?=
 =?utf-8?B?K0tCYXovMmVSWC9WajF5UWU1a3IySXA3clJiTWs3aUdMSFpvZzFWbHVnbXA5?=
 =?utf-8?B?aVphQmt0MHpCSHJSblQrTUJHOEwzeHNyUnBvUmtNMVZ1MHRaRHYrVURLTGp4?=
 =?utf-8?B?WGk1V2lvamU3NitwOERGR0ZwcytPUVhPTVVMYmcwVDhnTi95QnMySzRhTlND?=
 =?utf-8?B?aVM1eFFpWENDUWozZDRjNExaSnp1RnRPWU91Skp6Z1V3RnNMZHJrKy93SnF0?=
 =?utf-8?B?SkR6SXcwWkV2TkhlYzJxNzcwZUwrYTJCY2NudWN4OTh1U0h6bHhKWkNPNFhp?=
 =?utf-8?B?WVozaGdpTkN0ZzhCVGJPTVZGR3VZSGNmRmhuWEY5NXh6Y3BteDZRdy8rUTNl?=
 =?utf-8?B?c3JhMGdUZ2s0eFdhbEtFbVhBNzdBenhDaTVZQ0N5dGlVNll2cGZxUWdPSnRh?=
 =?utf-8?B?WDZIakNocU8xVDM4bDVwcENsejZuMURRRkNDYXpFem5BYlR6Q1lnaEhHQ0JM?=
 =?utf-8?B?WkNaRWtKREFwWmdGNVFiWkRBcUtBSGl1a0RVbkJXeWZRNGd4aWtLQmQ1L2Z1?=
 =?utf-8?B?eno4MEdkY2YrMTkwdUl0aUFOQ3ZyQWpISzhybGZVNVBpMFQ2UUlsTy9PcUxq?=
 =?utf-8?B?Q1V4MmV5WDBzMUgySnRBRkpiZmFST3ZXNlRwZmpXS1JRWEdvdS9iTVFSMmEr?=
 =?utf-8?B?L1VnclQ0QXZSTmsvY2xFNlhjbWRpOFE0ZVAycDZTUWZHU1FOR0xhbFh4UnpW?=
 =?utf-8?B?d1pHZUJUVVdManFhVHd5eThsejdXand0cWxwcm9lVnJXTUZ5QnQxc1E1Q0JW?=
 =?utf-8?B?aENiTkEvZDJFdmNTNjBoR3VJS2VEVCtPaXgxZzloeEd3UjYvY0h4anZSRXpJ?=
 =?utf-8?B?dGU0UTFWemxyM05xSHMzekRBMFBoQTBqVkFHV3Jzc1VWeXl2VnV3NmhEZkdh?=
 =?utf-8?B?SEJQMFV5V2lEcUhDT3ZFbzhxTHNBeEdYay9MQTZ4QjhGM0NHemhUTEFwMmZW?=
 =?utf-8?B?aXRrMkdOUnJUc29ydkhzUzVxK3ZyZ2ZLenBzaUhLRVR6SlFsUWV3UmFqbTRz?=
 =?utf-8?B?ektXcm5vUllEdnB6c2ZrZnpnZ3JxYmRGRDlCY1cwcDc5VzhqWkFTU2srbVY3?=
 =?utf-8?B?L0J6Rmp2clcxZEJxcGlwUzg5Ym9Yb3Nqd2pWaTBDWEJsL20yKzIwVkdNTGxp?=
 =?utf-8?B?SWRiM09SeHd6bXZyZ2Q1SitCK2ozWW14UXhudTIrSE9UZERTbVNkeVRvTkpD?=
 =?utf-8?B?ZGtBOXMza21DWWxZNFM5Z3o0OE5qVE9Jc3ZmeVBLdk5FUTIvdW95Q1R4TWtu?=
 =?utf-8?B?ejFudHY0TUQxSkVVUjRWdlg0LytwMllGYWJLVkNtRVRJSTdHQXBTTWhoT3hz?=
 =?utf-8?B?eWcrMW1QNEVGWHR2dUwxM3B4M1lNalovbENqYVZqSmpSZEhwVXRwVkZDR3c1?=
 =?utf-8?B?WHJidnV4NjVkWEZYeHN3VW1NWDhBZVllbFRDR1h2bFhUclMvRkZqSnY3TEdu?=
 =?utf-8?Q?tPnvO6ZXB7kYZrQpWKzE8k0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e1f803-a63f-4806-e8cb-08d9d205d100
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 17:47:47.4208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BifUyvKVf8Z/kYTaHTlZIKSCLjJZL3JV4zBiOMx58AxHLz453g2/dQos1MdbMrBGz/mr+sNVge/V0kG517z1fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5365
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

Am 2022-01-07 um 3:56 a.m. schrieb Christian König:
> Am 06.01.22 um 17:51 schrieb Felix Kuehling:
>> Am 2022-01-06 um 11:48 a.m. schrieb Christian König:
>>> Am 06.01.22 um 17:45 schrieb Felix Kuehling:
>>>> Am 2022-01-06 um 4:05 a.m. schrieb Christian König:
>>>> [SNIP]
>>>> Also, why does your ACK or NAK depend on this at all. If it's the
>>>> right
>>>> thing to do, it's the right thing to do regardless of who benefits
>>>> from
>>>> it. In addition, how can a child process that doesn't even use the GPU
>>>> be in violation of any GPU-driver related specifications.
>>> The argument is that the application is broken and needs to be fixed
>>> instead of worked around inside the kernel.
>> I still don't get how they the application is broken. Like I said, the
>> child process is not using the GPU. How can the application be fixed in
>> this case?
>
> Sounds like I'm still missing some important puzzle pieces for the
> full picture to figure out why this doesn't work.
>
>> Are you saying, any application that forks and doesn't immediately call
>> exec is broken?
>
> More or less yes. We essentially have three possible cases here:
>
> 1. Application is already using (for example) OpenGL or OpenCL to do
> some rendering on the GPU and then calls fork() and expects to use
> OpenGL both in the parent and the child at the same time.
>     As far as I know that's illegal from the Khronos specification
> point of view and working around inside the kernel for something not
> allowed in the first place is seen as futile effort.
>
> 2. Application opened the file descriptor, forks and then initializes
> OpenGL/Vulkan/OpenCL.
>     That's what some compositors are doing to drop into the backround
> and is explicitly legal.
>
> 3. Application calls fork() and then doesn't use the GPU in the child.
> Either by not using it or calling exec.
>     That should be legal and not cause any problems in the first place. 
>
> But from your description I still don't get why we are running into
> problems here.
>
> I was assuming that you have case #1 because we previously had some
> examples of this with this python library, but from your description
> it seems to be case #3.

Correct. #3 has at least one issue we previously worked around in the
Thunk: The inherited VMAs prevent BOs from being freed in the parent
process. This manifests as an apparent memory leak. Therefore the Thunk
calls madvise(..., MADV_DONTFORK) on all its VRAM allocation. The BOs
that are causing problems with CRIU are GTT BOs that weren't covered by
this previous workaround.

The new issue with CRIU is, that CRIU saves and restores all the VMAs.
When trying to restore the inherited VMAs in the child process, the mmap
call fails because the child process' render node FD is no longer
inherited from the parent, but is instead created by its own "open"
system call. The mmap call in the child fails for at least two reasons:

  * The child process' render node FD doesn't have permission to map the
    parent process' BO any more
  * The parent BO doesn't get restored in the child process, so its mmap
    offset doesn't get updated to the new mmap offset of the restored
    parent BO by the amdgpu CRIU plugin

We could maybe add a whole bunch of complexity in CRIU and our CRIU
plugin to fix this. But it's pointless because like you said, actually
doing anything with the BO in the child process is illegal anyway
(scenario #1 above). The easiest solution seems to be, to just not
inherit the VMA in the first place.

Regards,
  Felix


>
>> Or does an application that forks need to be aware that some other part
>> of the application used the GPU and explicitly free any GPU resources?
>
> Others might fill that information in, but I think that was the plan
> for newer APIs like Vulkan.
>
> Regards,
> Christian.
>
>>
>> Thanks,
>>    Felix
>>
>>
>>> Regards,
>>> Christian.
>>>
>>>> Regards,
>>>>     Felix
>>>>
>>>>
>>>>> Let's talk about this on Mondays call. Thanks for giving the whole
>>>>> context.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Regards,
>>>>>>      Felix
>>>>>>
>
