Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944714867DF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 17:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B790310EE72;
	Thu,  6 Jan 2022 16:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E6810EE72;
 Thu,  6 Jan 2022 16:48:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsQAJRxWXyaSJfyYgOVwIg+8Duz3Zg4m5gHX0XYJ7xLWlZ8s9lm7jCXK4MZXha+XLQSA66gVetm97WjhzxiUscJOMQjsfVYGivqQoc2RqM6NEMLI2JTZkgNDAmATSPHvulSYf6m4Lx73d85ij3iCQMKtrQZG1a88juCYcVYZcimgZsmRrALEAIVTLhzCI2/OlpEx8fs+La4CeE7FgUpdqyLLl67Bs9TiFT0h2FrxDXkFc7/kuNBVnDiqoYjmSMNqZbaYjnQmw4CfM/JyzEHJ+Pbaw0qJOFe9fUKGTEDm37wGXp2vxfNWC2GZV1tBWM8E5hd78Gw371cmFcJPCqbbTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=912qq3AIVhCEETTfMmb8Hw5uHG6g2EvvUt1oaQ6Aqc4=;
 b=lS0FStWgXGd4jPi9pJBI39bwzJRzxYKIli4yBLVif20qiGQbp75XUbyKk88nOmrvE/XubvR6xeWpDZ8ufClgIOK3s6LUv3whGFSwjYJEOZedc6Pe46+vtis9pfjE93pku81MJtjN9FGLo6wYqlms0wRa9Re9j9tP/CdIjeert+RQY6mo5s13WswCyw7qpsWXCepBZxaJZsM1s8j2ZnU+aYYN9R0BjQZjyBfZvY8gNpvfv7hIvRkLxXz9YSt9AHRqgPMqIdNMT55xe97xadWrlZ1LgMVXLqk4F+uvdDNL8id+KYnJRSkaac9Fzwv+wS0oBxopO0UbvG/QweacvthKZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=912qq3AIVhCEETTfMmb8Hw5uHG6g2EvvUt1oaQ6Aqc4=;
 b=BU09Y0B3z9TQ7odVIhsRqH/c7ub7qIzrPyGifgjQJp+BR8E4e/HbOj/wWdnrsA6j13n60Gkbj9d7WIjtPOBGc483ZO4MtqAStGx7lyHV1kVrlG57YOVABo9gHhL0z0fcU24OCaAFKJQgsf19X6tZVzx2FxPxHmBfXOr0ODod3oM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB2478.namprd12.prod.outlook.com
 (2603:10b6:300:e5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Thu, 6 Jan
 2022 16:48:35 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4867.010; Thu, 6 Jan 2022
 16:48:35 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: Felix Kuehling <felix.kuehling@amd.com>,
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <071fbdc1-38ce-d1e8-0e11-25204a3cc217@amd.com>
Date: Thu, 6 Jan 2022 17:48:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <ddb344cc-48ec-7323-4494-4e1cb8323585@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6P192CA0041.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::18) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d896ea28-22a4-4bf6-4c2a-08d9d13460f9
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2478:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB24787118A6CE8B8CE3D98326834C9@MWHPR1201MB2478.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oFNLn9IWjb0KkSQStfKTIDcFCDfakIREsRBsgEODXQ5nk6yB/dHennFio3IlKcU/0RdtUj8AHz+/Y6EXb4TMtQN+gFdS/S/gvs0wH4q4htiQ4i+MEU+hv8KHSSlU/755TsLq8+xOEXyZHlFMCzsm8z35YK9r7okB7t1yknp+/N0QUYrpS9tts62dPK74lR6xle2t/wzMNwOgpVD95BXcCV7e0V91trkHrpvOoYHY+sCtcYbFxioG0EXNYTIh+2cMqhVM1PXvyAO/JzcI/CVgXdecSssValpvyJp2fhxkq1J7mtURzBEj/yM2nvwMlOAEHaTx89EZZ8RqtL0FaBsFQDvcKtgZ+3alzq7jAL+n7PX6PdKszmilPEowFEZ2Nr0L90EHiAP5FpJGQ0I7N7Xmyfles7h+rvcUhYjrAEixZsvOuC9BavWQpZCDMgL7yZU6QsRULbtVPRBlOyhMFxTehQJ9EfuzipQfi7Rp/xnOnB/Gw7UoJ9yndcoJknalOSVnWtPI36yqgATbgcmslcLOuKBvl3CEMs91H88g7EVj2okf1YTs6siep7MBPXDDuTPCKDM+8I25aFccNaKbVQW5l4wXZMg/NnnTZZC5GiRQ0b3t4jbANSbm3r42f/n4B8+MUUiA7Pkf0eKGVblxz/v/r+QW2Yw+vAAtp9HQsT6Hb0jvs/ig5HuvqHrRmHJpNxA/a3Wv7Hwc+HDsdV91l2VQQsO6N7MQt5TiUh6UmDmjkx8WHva3uZbSSDoPPBN72lMp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66574015)(6486002)(8936002)(6666004)(4326008)(8676002)(31696002)(36756003)(66946007)(316002)(66556008)(110136005)(6506007)(31686004)(5660300002)(2616005)(38100700002)(2906002)(186003)(66476007)(86362001)(6512007)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTJ6WWNWS0xvV0lrWVVOMXcvOThZTEY3eE0ybnVVeHVlSG1rdzNndUlBRHlE?=
 =?utf-8?B?WG9TbmlxVkxqOGowejk4RjNhNnhlZ1M5cnpCTWlZUHNrNGJjb1pmejlwL0Jk?=
 =?utf-8?B?dTNhemQwck42N2Q3aXlNQ0o0YldSd3h5c0lrOHJXaHBCdjZza0wyUm1DMEtk?=
 =?utf-8?B?VWhXc2dLR3VqT2lDMDlxVndhMHo5Z1RaczkwUXlUYk4xUk1GdlFGWXpyWjkw?=
 =?utf-8?B?TEFsTWx6RjNwYlNNMmUySjRzakdWR0xWRUpNVE80eTNyS01VV1ZuOXRmNWpG?=
 =?utf-8?B?M3IxaVZPVWFMUC9tbjF1WmpOZGNvZk9VNEZJYjFicThiRlB4SFN2UGR5M2ph?=
 =?utf-8?B?YmxXdlFISkR4bmpGb0ZFV3dSeHh0UmVhZkVYbEdkNloxaElDQ0FXUmE0ME5K?=
 =?utf-8?B?S1dzM0FwSytuekhldHNVUE1KOHNxTWJaS2JsTitOanBDcmdkTHBaSEtrUUpq?=
 =?utf-8?B?R0I0czlxL21tSkJESEhhRDNwVjhLUVh0YkozSnRDOVBrRmNDZGkzTjNUYmRT?=
 =?utf-8?B?cytYOTdZd2JUTWFxcUlsdjBqbjFaa3pDTklkQkFaNnYzSVpXdGdEL3owNW45?=
 =?utf-8?B?VkRqdzdlc2ZkeFhuZ3c1cW1yMEZGNjdJa0lHWW9KZEtBZ1U0SnpYVzlsK2FD?=
 =?utf-8?B?ZnFzWUw5azBhUEFHdk9PaEt6RGFsWnNsclVsMVZ4WmsyRWtxck1qSHpJTFVZ?=
 =?utf-8?B?ZzVlUStuRW1hM2lpVUU1VmpZeG9mei8yZGRVYWlHRG02Ukx6NmpZYzNpdUYz?=
 =?utf-8?B?ZzdCcjhmZEcwS0dLTE1HRURWaGFIeGdZWFErWkRJMHhYbDY1WjVZTm5XN3JR?=
 =?utf-8?B?WlYxTkxyTU5mQ1U4SmFuN3AreVMrYjRsTzlhWnQwRWZaVGNCamxqb3pEbVh5?=
 =?utf-8?B?ZW14Umtya3p3dWlmbWVwTERnYU16dFFCNHpwYk5YNkZ1TXVnNXMyWDZiSWlQ?=
 =?utf-8?B?dkhqelZKQXV5TndNVENoVFRsS0FLZlJXcER5ZmJKREJncDdSYm1hdENQaTFH?=
 =?utf-8?B?V2JQbS91MURaY0xxdGhoK1UrK0hKYWJoMEhLY29wdzN2REVDOHY2bE1xNGhU?=
 =?utf-8?B?MmswTXNjRC9CaWVmWFZqbU9NN3luQ2Rqd1dzRFJuL3E5NWtoM1prWityZXJY?=
 =?utf-8?B?VHJCSG1zYzRXbXEwanYzcXZldWhSY0Rlc1RSOGtJVXdGd0ZJQW5ic29nYzBN?=
 =?utf-8?B?VmJ1WGI2WEZXRTZIeWNvZjZzMnljWHA4dG9GQmE4NmFFcWxzbVI5NktFa1RB?=
 =?utf-8?B?elBMK3NqbUV5a3NPY0JUTlg1RVJNakdSVng1NjVmbERWNkgrcnhUZk1NeXg1?=
 =?utf-8?B?MzZpamZ0RjlmOXM4dG8zTUg3VUxhR3AwY1hacll3MnBOVWE0VkFzVVhEaFRw?=
 =?utf-8?B?OVc0NDVKOC9wMXBJS1VzTDc1RW16SjVDbDhoeEtXS0QycStXSmRsNWtyS0lw?=
 =?utf-8?B?K3MzeElzbkJGbkpFejA5NDMyZ1hZWjNkWjNCRUJ5aE1Sd2srUUdDZmg5ZzNR?=
 =?utf-8?B?bFRudUZ2Lzd6em5NVlFYRGVkYjBCcmhFNDlBeGg3VEFYS0syWE9mRGY1N3g4?=
 =?utf-8?B?YjVWajZXNTcveXhITkU2WGdObW1GOHlXSXJvMXdQMDl4Y1h6MGc2Qk5WY2N2?=
 =?utf-8?B?dVp1T0JKdXhucG5jRW1hZ0VpeEE4NGdzcnlhcTNPZGFIaVcwSkFLbmtGQVpn?=
 =?utf-8?B?eXpWazBNODhXcmJEWmc1ZUNUTGpHT2ZkMDNGa1VlUmF3Z0dTdTMwR0ZiUVlJ?=
 =?utf-8?B?VTh3MFptWE9QMjdlZEVycWNrKzEyTHZqZlpleHRmY3c4T244ZjM3eTVjVHpC?=
 =?utf-8?B?WGVCL1lldXNqNGcweGJ0Snp5M3VpMStWenVHNUZma0twdHU2QmMzU2lRYnkv?=
 =?utf-8?B?N3UzSUVwd0lvWWpRTWs0UzNWcURQWG9xZUFoVVltbk5tdmp3OVhDLzhYTzVN?=
 =?utf-8?B?LzNzUzBVTXBieG9NL0U2QmIzZmw4a3YwM3hCdjloMDNTckRtRjNtc1QxZUdP?=
 =?utf-8?B?UnlBUWh2MGozNmFsc0Z4UzU4QVE0YWpvK2FMQXJCdFVYVWc2TS9KQmhLNlhV?=
 =?utf-8?B?Yzhmem1PNnNYU1dLd3NyREg0NUhBSlNwOUhJU1kvSXZjQWIzUkJGYUU5cno4?=
 =?utf-8?B?ZWRNTnVSNTBNWWVGdGZGQ0VSZDhhMlBRV2owRXRRVkx6Q1hKWEw1dlVKMWR0?=
 =?utf-8?Q?k/3EUgmA3ILN3rWLFv4+A0I=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d896ea28-22a4-4bf6-4c2a-08d9d13460f9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 16:48:35.1809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PvW7kcxUDShYz1/4bM++HYz4lWXfCEjTjXlLa0ws5wfiU7+1F66XdbyPdsRBHqd7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2478
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

Am 06.01.22 um 17:45 schrieb Felix Kuehling:
> Am 2022-01-06 um 4:05 a.m. schrieb Christian König:
>> Am 05.01.22 um 17:16 schrieb Felix Kuehling:
>>> [SNIP]
>>>>> But KFD doesn't know anything about the inherited BOs
>>>>> from the parent process.
>>>> Ok, why that? When the KFD is reinitializing it's context why
>>>> shouldn't it cleanup those VMAs?
>>> That cleanup has to be initiated by user mode. Basically closing the old
>>> KFD and DRM file descriptors, cleaning up all the user mode VM state,
>>> unmapping all the VMAs, etc. Then it reopens KFD and the render nodes
>>> and starts from scratch.
>>>
>>> User mode will do this automatically when it tries to reinitialize ROCm.
>>> However, in this case the child process doesn't do that (e.g. a python
>>> application using the multi-processing package). The child process does
>>> not use ROCm. But you're left with all the dangling VMAs in the child
>>> process indefinitely.
>> Oh, not that one again. I'm unfortunately pretty sure that this is an
>> clear NAK then.
>>
>> This python multi-processing package is violating various
>> specifications by doing this fork() and we already had multiple
>> discussions about that.
> Well, it's in wide-spread use. We can't just throw up our hands and say
> they're buggy and not supported.

Because that's not my NAK, but rather from upstream.

> Also, why does your ACK or NAK depend on this at all. If it's the right
> thing to do, it's the right thing to do regardless of who benefits from
> it. In addition, how can a child process that doesn't even use the GPU
> be in violation of any GPU-driver related specifications.

The argument is that the application is broken and needs to be fixed 
instead of worked around inside the kernel.

Regards,
Christian.

>
> Regards,
>    Felix
>
>
>> Let's talk about this on Mondays call. Thanks for giving the whole
>> context.
>>
>> Regards,
>> Christian.
>>
>>> Regards,
>>>     Felix
>>>

