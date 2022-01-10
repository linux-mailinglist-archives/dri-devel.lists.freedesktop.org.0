Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BFB489E68
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 18:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2728010E338;
	Mon, 10 Jan 2022 17:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2055.outbound.protection.outlook.com [40.107.101.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0841910E338;
 Mon, 10 Jan 2022 17:30:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8WUpwXicFYoZ/cdpY0XolOiPwXVkvG3E4YlFpMWGrukD73HTTaZ86T+myvygKDpzzT4W33eucnqvbMfM2TNiGaxhHVDR5JKy0NObliPY+OY7OtvoKPezrSrk79lBPEt5GWYMw0lZ2haxEONwto1VfcVXAB9cYahWrqcg+9vyAhdxACaQCyzWINe2CtsVFVh5ZyVJRNd8SiXPfwzHkNQUMIUX0op8caNoDYwwdQ+DnI3wVgvRD1IiPO6RtL5IQoggJCa7oJk8cSbrAK6AdRNIw4D0iZX65RuGGkJiUxHjDMIF9TkQ/JpXNzNG1yAfFKJk3T7r9p1AD8vJ8ammv9k5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zQneVW9Ei6Ww18atd603B9/PzbQHGMrzOcccihP05Q=;
 b=JhFA4kMTn2ClrE1CVMzPUIL4AVFl4WQAgzaHP2PBpTDe2f5UancYZfm1WvhpsjUtdvno8CVcXLmrt2Ja2fpxaGopy2LTfVO7jsIq0zRa2oApTJr7VyzSy1cFbj9CSgNBC6GwsPLE2ynqVG0LKfFZJtcklHz8QRiMflkYxsbwodANkM1nCcJnnN5D2Klwr6YMDV+iC2FxKV1QFQzUDGjUxCOzEdRjZT6V7u7xVyPJh4+RGFi4BVLO1TWAqS/iHyEv1e2nlcv7Q8qYeK4gJ1kD1cB3JfG0S8GnB0ZLj8cNaqFY8OZ+THsr16IXwPTzeu5l8beYTTuDTg2v+fgOe+aqSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zQneVW9Ei6Ww18atd603B9/PzbQHGMrzOcccihP05Q=;
 b=1yYqPh1MmTWYYl23lMH1YcCj2uOKORqQs2QdEfu5WidQSbmqLfyb9IIYJ7RoRtjWjBf6L+uvmbynlgYWTjYtKuDtJJiaOj6Vg9CR+M9ZqnWSEkVrIl6jRoF06MfPEg+Pp9qBMZV8VIyLmpAI6W/K+Ix3c5BR5auYglDXvZRSDIE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1531.namprd12.prod.outlook.com (2603:10b6:4:f::8) by
 DM5PR12MB1177.namprd12.prod.outlook.com (2603:10b6:3:6d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.9; Mon, 10 Jan 2022 17:30:51 +0000
Received: from DM5PR12MB1531.namprd12.prod.outlook.com
 ([fe80::3039:1226:afd7:8ca]) by DM5PR12MB1531.namprd12.prod.outlook.com
 ([fe80::3039:1226:afd7:8ca%8]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 17:30:51 +0000
Message-ID: <c5c486a4-e1dc-5484-8da4-43b8b6224cce@amd.com>
Date: Mon, 10 Jan 2022 12:30:40 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
Content-Language: en-CA
To: Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adrian Reber <adrian@lisas.de>
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
From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>
In-Reply-To: <279c7ffc-99e5-f052-5de1-9b957c455d85@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:610:4c::39) To DM5PR12MB1531.namprd12.prod.outlook.com
 (2603:10b6:4:f::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a9b22c6-816e-4957-4f9c-08d9d45ef2b5
X-MS-TrafficTypeDiagnostic: DM5PR12MB1177:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB117761C7139CBFD1F4459BA3FE509@DM5PR12MB1177.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D5F8pTFbe90v/c4wz7s+6Oezkblkx1QUkcUxnGY18RKDQ92E3qsbcrEM9/JDcaTrYtJU3/ALv+dXRLOasNXM8NesdQO0v9rnrijPus3ylVOXzofqXwnMJ6CQmNnXmagNdSswtsIkbosoP8zEBEIVmqhu5Tmiu9++BfRAUzTigB8T75pjWLBnVYbHh2pJ4i7QJl5tAOnUF7tDmpTG6BguByrfHlamPuKKnAwsRxSSWlZMM152rM3Zp0Nu+lg99stoy+w1AYeQ0kiiwmnglwZOfqmS1xz3vjJ9vclR3qBpyhXBST7IhhNeti2NrAf4tjo+OhfesySu8eJ2lDpiGHD4yj77eSjZP7vIiutpVwmIA+jy5S3jbqIoAUIK2CaT4wrYRZMVqGSVHNNhLDT7g3aZH2C7JLXbhZfIFPwNvjYs5v/ZnEfCoBlTFzytxFC/CpHV+U/rdU6CVWA4kFFAy/oPEqXr/IHjAjrw5TVVKuQ5tSMHrgFpFsRwMUD5T0xToI+dcEd+eTX8IN134kzbY3fta6mzw45HIEjYe5z0TxIz0A6+e0L4vkSEb1g1wIFqcxtQOYUXZdu+xJt62bFnv43/YbDZgQwMr6tkX+o9QRW1r5XmjKtHUCN/EWsLBLoEdnGCKEmpMVJYLSTkA58PvD4I7bcKBTtDBuPROc1MVB+CkgC3b4m0uLwQcQLZBiclNqi4+f147Nukl57CXVohWi7q1tz6k9wT/E6n1oS5aSDsfs5KdrTcLfgx1+hBAc6TQ6Ml
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1531.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(6512007)(6666004)(31696002)(8676002)(26005)(186003)(36756003)(83380400001)(31686004)(5660300002)(66556008)(4326008)(66476007)(2616005)(66946007)(66574015)(4001150100001)(38100700002)(86362001)(53546011)(6486002)(508600001)(6506007)(2906002)(316002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHp2ZDZhZnVXc0dsTFRXdE1mbzc3Q2hYRDJjUVBSeng3MDVBZjVSdmU4TUNB?=
 =?utf-8?B?TlhZY25WTytPanNqSkFjczk0dzRHNTZyMWtDYWt0YURNSGlCbGVEN295aE9N?=
 =?utf-8?B?T2VvZjhiMDNzNmZhcEU4Q0lTbTUzUlhPRkU2VUl4UDB3WXVoRWJKRjY3dFdo?=
 =?utf-8?B?bEVWOFpWMHBSUVE0Um92K1UvMmtzSEdMSEllTXdjT1FFY3FzbG9hUEdGY1E2?=
 =?utf-8?B?bzZaVEQ0NkcweWtjOWN3M2QxeDZOTkNSZmNxMWIxbXhPTnZkWHZwY2wrSkZS?=
 =?utf-8?B?OGJkdTN5bFV4SWNtaDdaMWlGNHI5bVo2eGVIeHRhSXFtN1FXWlREK3o5R2xO?=
 =?utf-8?B?V2dMcVJ1azBxQkE3N0F1bDhaa1FhZUpXZ2hXRGwxN0VscG8xMUJONGpleVcr?=
 =?utf-8?B?TnJlOTAwMTBoYXlkTHdlVHhUVzlTeDJLZXV1YWV5UkpCVmgyTkdiMFNEYnhU?=
 =?utf-8?B?U3Z3bVZTb3k4WFErS3VoTjRUUDVRcU1EZmF3S3hsVVJzYUI2UW5FQzdhZ1RQ?=
 =?utf-8?B?S2JHcHp1aFpseFJSY3lRazd1cTZ4RW1KMGtVQWVKYTl2TTJZMTZBaXFkN0xT?=
 =?utf-8?B?dWJUQUdoSnlSSTNlaU52WVB3OUlIeXdrV1lOMVhIbFZ1VVk2TVJFd2hmaGZ2?=
 =?utf-8?B?bmpicVFEUUh6bVMvNUFMazhmN0Nad3d5NW1kZ09rOE0zK1YwWjZWNnN5REVz?=
 =?utf-8?B?UzkvZHk3amxsbjNRdFo5QjdSeDJkNjVUb2h3YVVVUEVZMmZiVWtsUFNOQVVJ?=
 =?utf-8?B?dnNia0tBSHhERmNKdUFLaWczZGI2aFRoVThsUjVWYkpUNU9pcW14eTNUOTdm?=
 =?utf-8?B?OVJwN1EzMHh4c0p3blJVL2lnRjJFczgwL1M0RFR5bXZBdzl4dENLNnNsSjF4?=
 =?utf-8?B?TWFyNEYvVWhXbzNTWkNJdUUwQ3lsYjVWSDdST3NFV0VkUHljUWhvemZHKy90?=
 =?utf-8?B?ZVQzUFBlS2t0ZWdYeEJLOG56S29sRFFWV1NOUFhqb3A1TzJpSE5vVzRnQ3dj?=
 =?utf-8?B?WTV6a25qMkZQdkNMejBpTkxlUHVrSjhYaTlLMm1PUkswZk1iaEk5K1grNEs0?=
 =?utf-8?B?NlU4cFRWSlBIbTZocUp5UWh4UTNST21OU3hoNVNNNmNFMzZlbXdOUC9iT2hY?=
 =?utf-8?B?TXJycjZwVXNmZWRERHF2cHViVlVDV2ZYcDRscEFEOGpMaTcrMGROK2ZPeWFj?=
 =?utf-8?B?dWRGdVJGUTVKUUNIdHQzd1RNeURyOHRXYUJiQWZDTlcwNitZRUREeEdxbk1j?=
 =?utf-8?B?QTREMm03cTAxRUxqNVdBR24wQUtsck1zQ0tlWjRIaGJDR3UvMnllREZCbkpu?=
 =?utf-8?B?UStkbTZ6NXA4R0t2NFpjVHpJbjVpRU1NMTNQcHdLVCtPaUFQTkQzR3lCSTZM?=
 =?utf-8?B?eWd2WlBOa0p4VlR1UENrR043ek5aejkxT0hpSFc1ekpxeFNVa3YrSWpsSnh6?=
 =?utf-8?B?SkVERVZBTitlTFNBL2o4RnFYek9BeVA4d2FET2pSRlliTHFmVFFXRzVFRGsz?=
 =?utf-8?B?bG9zSHhMeW1FLzNublR0WWQrNlpsZGdoT3JXY3pEaVltcDJhMXNnRnVpcTRM?=
 =?utf-8?B?NmtBNUNNYlNvSExXOStuTVhUTDZYSE9WR01jZW9wc1FYVFNYektJdUJZbXhZ?=
 =?utf-8?B?YXdBU1d5ZFNOQ2daM0tCbkZ3Q0FFK3hQNENVNFhtZUQxcE5NRzBxVkdkRGNT?=
 =?utf-8?B?cGN1QmFFRysxaVlBR3Rua3ZITVpuUitFZlUvU1JpZ2l1Skd1R0ZKQnUxWEJm?=
 =?utf-8?B?Uzl2QjUwOVh3MG1OWVljUVFoUGFERndNWTcyYWFsT09JUjZLV00xVEdmd2Rp?=
 =?utf-8?B?dndTcjY2dUVOYS9jOEJBTUtaRFgvbUdDdWFEZlRpUmYvUENXL015aWM3UllZ?=
 =?utf-8?B?TjA3cDAwVm40cTc4TEIrSGpuVU9ScXI3Um55V3A5NmpCellEdldYbzluamps?=
 =?utf-8?B?R1B3aUhUY0VPSDhIcGtNYWVkWkVrL3cySlpmWVlqL0llb3ZQd0lmRm9YZG94?=
 =?utf-8?B?b01HVHkvcmtrUmszUEJiYUxhZWlCNFc3dTFEdHhoWUtxVnlPODlFSDI4Unpv?=
 =?utf-8?B?a1ZJMTJmZnpzYzFsTVhLYVdFcERtZHRodi9YRy9Xelhobk10TTkrTUlwU2xt?=
 =?utf-8?B?RERzV0N4TlpNbnJkdVliMUtHZTNJK3hJSmpCb1dJbVJYbllzK2xlY3Mrb0Ex?=
 =?utf-8?Q?loHCOz1YUShnWu4pvz3fbno=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9b22c6-816e-4957-4f9c-08d9d45ef2b5
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1531.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 17:30:51.6431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1OiQ6DziZyIFlBFLafCwFsk2RqD6czxDWhdvk5aB1rIC8v1GJ4S4oaYgK5yQlWrYMriI4tSyP33mofbLsbORQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1177
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 David Yat Sin <david.yatsin@amd.com>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian


I have reverted the change from the amd-staging-drm-next as per the 
discussion.  Thank you.


Regards

Rajneesh

On 1/4/2022 1:08 PM, Felix Kuehling wrote:
> [+Adrian]
>
> Am 2021-12-23 um 2:05 a.m. schrieb Christian König:
>
>> Am 22.12.21 um 21:53 schrieb Daniel Vetter:
>>> On Mon, Dec 20, 2021 at 01:12:51PM -0500, Bhardwaj, Rajneesh wrote:
>>>
>>> [SNIP]
>>> Still sounds funky. I think minimally we should have an ack from CRIU
>>> developers that this is officially the right way to solve this
>>> problem. I
>>> really don't want to have random one-off hacks that don't work across
>>> the
>>> board, for a problem where we (drm subsystem) really shouldn't be the
>>> only
>>> one with this problem. Where "this problem" means that the mmap space is
>>> per file description, and not per underlying inode or real device or
>>> whatever. That part sounds like a CRIU problem, and I expect CRIU folks
>>> want a consistent solution across the board for this. Hence please
>>> grab an
>>> ack from them.
>> Unfortunately it's a KFD design problem. AMD used a single device
>> node, then mmaped different objects from the same offset to different
>> processes and expected it to work the rest of the fs subsystem without
>> churn.
> This may be true for mmaps in the KFD device, but not for mmaps in the
> DRM render nodes.
>
>
>> So yes, this is indeed because the mmap space is per file descriptor
>> for the use case here.
> No. This is a different problem.
>
> The problem has to do with the way that DRM manages mmap permissions. In
> order to be able to mmap an offset in the render node, there needs to be
> a BO that was created in the same render node. If you fork a process, it
> inherits the VMA. But KFD doesn't know anything about the inherited BOs
> from the parent process. Therefore those BOs don't get checkpointed and
> restored in the child process. When the CRIU checkpoint is restored, our
> CRIU plugin never creates a BO corresponding to the VMA in the child
> process' render node FD. We've also lost the relationship between the
> parent and child-process' render node FDs. After "fork" the render node
> FD points to the same struct file in parent and child. After restoring
> the CRIU checkpoint, they are separate struct files, created by separate
> "open" system calls. Therefore the mmap call that restores the VMA fails
> in the child process.
>
> At least for KFD, there is no point inheriting BOs from a child process,
> because the GPU has no way of accessing the BOs in the child process.
> The child process has no GPU address space, no user mode queues, no way
> to do anything with the GPU before it completely reinitializes its KFD
> context.
>
> We can workaround this issue in user mode with madvise(...,
> MADV_DONTFORK). In fact we've already done this for some BOs to avoid a
> memory leak in the parent process while a child process exists. But it's
> slightly racy because there is a short time window where VMA exists
> without the VM_DONTCOPY flag. A fork during that time window could still
> create a child process with an inherited VMA.
>
> Therefore a safer solution is to set the vm_flags in the VMA in the
> driver when the VMA is first created.
>
> Regards,
>    Felix
>
>
>> And thanks for pointing this out, this indeed makes the whole change
>> extremely questionable.
>>
>> Regards,
>> Christian.
>>
>>> Cheers, Daniel
>>>
