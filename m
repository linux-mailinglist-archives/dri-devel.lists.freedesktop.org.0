Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9D97DF082
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 11:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102E510E13E;
	Thu,  2 Nov 2023 10:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FE210E13E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 10:48:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oF10wBIbOsCw21Xtwd02HfVhct8VcDscEUeBpa6NR2CD7HYKgdoe8noOHjU3CS7fHzMXglg+gY2SUzgkAINvAgEhDcbp+Sj15IQub7zeL01TCscCjAuxlDC8G6TogDzXr3UMpYIh6Lv/AgPIlGuzA3y19jIgfLZH0kizNr/NB/P0Gb4UxjKiv5hk4IBpJesHtpUSvrFc9Erh8uHCkPHXkiXR/8ZBB5jSFxutDI3lcIhSLn57Gfmbt4ihdi/m14U0VjjiQ7x3RXyAdqEsmAdyAR1Mkh/J5wpt7wDNI9vYdayqoLq0PU7fIzyEF9Q1fDvryQnxLVYS1OUjGtHuupJTjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDptVRG0DOkvawlolgR2whWkyKZPSfcjWERHxee1h60=;
 b=V9A0AFx7JoCNoF0z5PbYPy0qgxB3rifqh25TeT70gApE2JAWskHVduAiFmHz9qGKec4IdlKzMlMtA1Rd9jU1Uvyw5bGWHnrKjmlmU4WYNkUx9re0SfXrU4lJDSBqvZzWYm6e5+PcDr1v9iIeI1xmGktzLJQjStAopUzTe4YnGvQGdcYI/k3qal5EVpwkMgxP9+GoxmUw3gP/F4pruhzydAvZyscmoh7kpnJHsBpRhwIM126Mbhes3+BVkXst19SfsGyL7JDWii4qHhFqyrn4SOPnhqZhpAo6Rw3ZMyspT6CPPa8iMDbgdOnT5xR0l6NqaShSjJcQ0yAMKhIb8GwkMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDptVRG0DOkvawlolgR2whWkyKZPSfcjWERHxee1h60=;
 b=c5iuNqtG+Qu1HxFKq4jSK37qk0VwpOSfqFJ6e5daiEPSRxk/fCQq5ceCBmd3l6V8LwQxqGFSLjWqk5YvMl3khIT8514ORhbrxM/ydJMvSPrt1eTIvGNjCMiwtjH5vurSP0zNWPKTEUW1QPPxNZHEMaTkztyWuQKrZmR8RTxLJsA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4225.namprd12.prod.outlook.com (2603:10b6:a03:211::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 10:48:30 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6933.029; Thu, 2 Nov 2023
 10:48:30 +0000
Message-ID: <5438c132-e127-4456-9551-42c76fb521dd@amd.com>
Date: Thu, 2 Nov 2023 11:48:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>
References: <9c0cff84-45b1-268f-bdad-38c16316dbc3@amd.com>
 <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
 <bef7ef62-3cd9-6ceb-5eb4-5ae0c0236778@amd.com>
 <de502b41-2864-db1e-16a0-8a5d5e0e4ad3@asahilina.net>
 <d9dc2fd5-d054-dbf3-72b7-fe9deaa46350@amd.com>
 <236422117088ca854a6717114de73d99b2b9ba2f@rosenzweig.io>
 <a42bd218-6eb5-6ddb-bbb4-d25118c59f40@amd.com>
 <7b564e55-a9b7-0585-3cf1-d1f132f9a918@asahilina.net>
 <daf48d76-ceee-c82d-a63a-e8e7770a9d83@amd.com>
 <f5de10fa-57d6-a3d0-1cf9-084491aa6025@asahilina.net>
 <200e9d74-7191-b1ed-e5f3-775827550853@amd.com>
 <CAPM=9txcC9+ZePA5onJxtQr+nBe8UcA3_Kp5Da3zjKL7ZB4JPQ@mail.gmail.com>
 <CAKMK7uG0G02ierkgAmJE1gfLto08LK5twGUEX1qN+qk9-AavYA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKMK7uG0G02ierkgAmJE1gfLto08LK5twGUEX1qN+qk9-AavYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0232.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BY5PR12MB4225:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e5ed2f6-d874-44d2-55ec-08dbdb914057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QivuwgjfYxMk1s66zh+0NKVR/nIWEXG7eM4JjrlF06ly0y4rVtqhlfHAWiCL7R7rBpCfCkSKZ3C9R7Nw68YH0tKpJ7GNaXoynLTbtQXMH8nibsJ8gHS1726N/KeLiiOo6RFrUnuxTdTuj4vrbM9Jgg3rkMQ0sEMuPNMGhR55FVKXmKKdh2rpzIpYERBvOkYGVd0nk5/gmdZ0K0HMbWu2RhmM26JYfZAydQCBlrJGkgnR7SyGo03KV4943rXYErObyOmu0V9oqpDgk/2N2PsxDBFfmSBEY9ju393ynqOebgQ02+ObB5yIXUCA3YF8NoY2kVE1vLvAwA6rpZ1e55ScLABaSC8eauyHd/jcINFZxpumZJvFBeeU3AWVaSnPCs4cXgOK2c3sQY6wgf7uA5sbIU2AjDsXGJbYqNNjNEjAkXIq4uofhXnZ1hRD4D48dpIK5y8uRzHpspcKmQ/aL5yHMncPMWs0mgBkfNway5OetUkNaKsbBFgrz8Gm6Fq9AfSyDvLgJWhTxHSC0kvmDWEQQAv3sdOcAvMNxq2IAzZG3gDAoyAu0Fm9AQCC9DqNZMSCq0Xox2MN5LYYM/EGI66hV9FRyvI1F+N0VJNIcW4uz+ze/i1K/QwxYKJ3Sly9Id8k0OSN+N7tlAIbjgnjC6ZsZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(366004)(136003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(41300700001)(8936002)(8676002)(4326008)(7416002)(5660300002)(36756003)(2906002)(66899024)(316002)(26005)(2616005)(83380400001)(6506007)(6512007)(6666004)(31686004)(31696002)(86362001)(38100700002)(66556008)(478600001)(66946007)(66476007)(110136005)(54906003)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjFsci96QVlOa3YwYXVUNjQ1ZUFuWURqWVJuVmN3NXZBbS9UVTUrSU1ZY2Qv?=
 =?utf-8?B?NHA3R1FjblNFWkdaRThUNWtlVmR2NXRiRGRCY1NoTjNMSU5nUzE5RVI3bVhB?=
 =?utf-8?B?UUlUNjRONTErQTMyYjhQSG1Uc1phR0tBUlZrV0J4Z3hSQ2htY1V0Yy9NMGFF?=
 =?utf-8?B?WHFKSkZibEZzSC9wbWhmekhvS1VNUFhjN3FYQ0Q5bzR0OG5SRi9tWllsa2tT?=
 =?utf-8?B?SDltN1cvaUl4UjFMWFdNY3kxc1BoWDJaVVRMc2NnME1CYmNSUnZLODVpd2Fy?=
 =?utf-8?B?eS9DdXhiRXJMRm5UTnREZE96b1RZV0xRV2ZGNHpBN1lXTy9vZHFsdk9VaWtt?=
 =?utf-8?B?d0drQzVFSGljY0FUU3Bpdmxhc242Z1BwUFNxSENSNTltUmtqdWpCejY5THRW?=
 =?utf-8?B?bHFjeVR3SDNaNlVDaTh1ek5vUEFZY0JTeitGSmwyVmlyQmxSM3M4alNNdURU?=
 =?utf-8?B?SWEraTMwVHpESDFXZUxzeXZuRnY5QjNaMEFMdVlDeXBLTjB4bzdNbGJ0amZD?=
 =?utf-8?B?K2cydldlTEhkSjByL2xPNVBvTWU5NHVFRHUzRmpJT3NBb0FaYXYrZ1hRaEly?=
 =?utf-8?B?TzJ6UktPTUdicDg3b1JxWnVVU0FEWENTWHRYWHR6K1NtSVU3clBSZVhaR1Vl?=
 =?utf-8?B?YUx4Q3JsdDNnWTVTdGVuaDZXaVdZQnRwUmM0clgrbmpQUWlxaXZJQ2ZMVjJF?=
 =?utf-8?B?Tjhua0VNR3pudEJsWjdwaEpUNUJuTlMzUmZtSEgyYmpnNkRjK0NKQURZSEZI?=
 =?utf-8?B?SFh6cmJHd1E1cllac2pER3lZMjJCeWsyMDl5bVlMcHllblVhNTExNUgzSHlG?=
 =?utf-8?B?RHFsM3UvS25JMjZoTGlNWW1sMUluZkxUZmhXb3VPT0tvZ3NSWGs4RXN0NE41?=
 =?utf-8?B?SlBWeDlQeVZnV1VkaHA3M1ExWG50ZzUwUXE5dU9UdlZXdzB0TGVlTWFLVUNR?=
 =?utf-8?B?NkN3Q1M2RXovdGNwaXNaVURuY2VVclVnL3FJUkd3T3czcVY4SHp6VWhQVk04?=
 =?utf-8?B?NngyOWZMZXh0U3ZZeXdmSk1hSDJTSzRsRnZyVzBNalpobVFpUzBqYmFkS2I2?=
 =?utf-8?B?dnZaUnEyWFdDc2k2ZmxieHlkYVBQalFXN0pZNTRTaFU3R1VSL3BQR3RMelAv?=
 =?utf-8?B?Q2swdVpSeXVoYnZueGp5K0Y0bWVLSVJqbDJFMVFkU3RIbndEQ3I5U3hoYjNH?=
 =?utf-8?B?aUN2OThMY0pqUit6cmhKLzZrWUt6TzhrUmRYUmh5ZHg2N1FEQXg0amhCUzBo?=
 =?utf-8?B?NXlsRWNjNnBwTytydmQ4WDZjbGR6czRReFRvenJ3ZUJjazIwaFRlVWhhWCtP?=
 =?utf-8?B?R1plSWptK0xTaVhBckR1MUpGT0xkTDdIc3VmSzg4K1BZY2V2c2tqZjhUVGpD?=
 =?utf-8?B?UThkWnBsV2ErSGhBcWdFcXcrSkljRVRXNnVlSlowejEzZlJOY0huc2JwbDlL?=
 =?utf-8?B?WXdRa01CSTcwYkFtNkZQeHpPME9QbFdiNVBySjd6V0Vld3VYS1lUbkp1eGN5?=
 =?utf-8?B?b0lPK0kzenR1MHJ2YTJKVStFQ1cyVU4veUMzVVJoZHN2ZHBPRUp4cFo5MWEy?=
 =?utf-8?B?OXV4b2JMbExhdEQrTW9LTXFKTW1nMzkwSmNFTEVxRVpmRytPamFscFNNL1Jx?=
 =?utf-8?B?ZjNJK05wWWtraDExNzUwMlE3K0ZtdC9aeGd6dHBURkd3bkNISm0ySklLSERT?=
 =?utf-8?B?d2NMc3AwaWs0U0JoL2lyQVY1bXNXeE5SZzRTdDI2Q1RvU1BaL3hWb05wdURD?=
 =?utf-8?B?alNjTzZmcXBzUm15bHEwSFFuZ0pvb2psRGpjMmpXOXlXLzlHbXpJSkgzQ09j?=
 =?utf-8?B?dHMwU1pMeFlucFQ4b2VwbWlQOXFaaTFnTFpZWjRUZWdTbUttUHNpaXpXU3NO?=
 =?utf-8?B?bEYzdzRjd1U1RXZEZmtsQklCVCtJbHI0cG5Vd2NVM2gzNktyS1BvY1RqQVVE?=
 =?utf-8?B?Nkh5OUthSHgwUFZzeXkrd2haYm9yanNUMlZmejV4b3NZMUJ0K0NFRklhdGlz?=
 =?utf-8?B?ZlJwWWhHTHNXS3hBSzVYRWpKT3hXeHVWMUtzMmp3Q1pCT2pUc1EwZ2U0WDZ1?=
 =?utf-8?B?cGlPQ0FJNnU2S3MycDlXTXBuWGRhZldjTjZWUEtNR1lvb2l1d25OZ1lmRnk5?=
 =?utf-8?Q?KClQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5ed2f6-d874-44d2-55ec-08dbdb914057
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 10:48:30.1472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9EQzujH40G5tLMO51+Sj4PNh4MaqFyf0BHNaz/5RcNz/x5+vcWDOVsuAA6BHQEtr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4225
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
Cc: asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>,
 Luben Tuikov <ltuikov89@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.11.23 um 09:13 schrieb Daniel Vetter:
> On Wed, 1 Nov 2023 at 07:59, Dave Airlie <airlied@gmail.com> wrote:
>>> Well, to make it clear once more: Signaling a dma_fence from the
>>> destructor of a reference counted object is very problematic! This will
>>> be rejected no matter if you do that in C or in Rust.
>>>
>>> What we can do is to make it safe in the sense that you don't access
>>> freed up memory by using the scheduler fences even more as wrapper
>>> around the hardware fence as we do now. But this quite a change and
>>> requires a bit more than just hacking around
>>> drm_sched_fence_get_timeline_name().
>> I really think this needs to be documented if nothing else out of this thread.
>>
>> Clearly nobody is going to get it right and hidden here in this
>> thread, this info isn't useful.
>>
>> Can we have some sort of design document for the dma-fence/scheduler
>> interactions written and we can try and refine it with solutions on
>> the list, because I'm tired of people proposing things and NAK's
>> getting thrown around without anything to point people at.
>>
>> The next NAK I see on the list will mean I block all patches from the
>> sender until they write a documentation patch, because seriously this
>> stuff is too hard for someone to just keep it in their head and expect
>> everyone else to understand from reading the code.
> I very much like the idea that NAK replies are counted as "you've just
> volunteered yourself for some documentation patches so that next time
> around you can reply with a link to the docs instead of just a NAK".

Yeah, that sounds like a great idea to me as well :)

Especially when I can use it to convince managers that we need to have 
more work force on writing documentation.

> I don't think we'll get out of these discussions otherwise, since
> currently we have undocumented, but very tricky semantics of the
> drm/sched codebase for ringbuffer scheduling which is extended to fw
> scheduling in also very tricky ways, with not entirely clear impacts
> on semantics of all the drm/sched things. And as a result we just pile
> up enormous amounts of threads where I think the only thing assured is
> that people talk past each another.

The scheduler is certainly the ugliest part, but it's unfortunately 
still only the tip of the iceberg.

I have seen at least halve a dozen approach in the last two years where 
people tried to signal a dma_fence from userspace or similar.

Fortunately it was mostly prototyping and I could jump in early enough 
to stop that, but basically this is a fight against windmills.

I was considering to change the dma_fence semantics so that 
dma_fence_signal() could only be called from the interrupt contexts of 
devices and then put a big fat WARN_ON(!in_interrupt()) in there.

It's a sledgehammer, but as far as I can see the only thing which might 
help. Opinions?

Thanks,
Christian.

>
> Converting NAKs into doc patches should at least eventually get rid of
> the worst confusions we're dealing with here.
>
> Cheers, Sima

