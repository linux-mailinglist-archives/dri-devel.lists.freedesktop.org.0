Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA1B6BBD9A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 20:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE8A10EBD4;
	Wed, 15 Mar 2023 19:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::60c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D4E10EBCA;
 Wed, 15 Mar 2023 19:51:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUzCf+ZaSWEQPbwj2Uml9UAn6vdYEz9duk/BVhu1NQdxOAlt+CYYa3gvp94eOfvPjbhgqN1uyr7dnVmFvCj2XTWeWFjYVs5rLuQkzo+YP6CfEgc81bgaNFlP1oi9PvhVH7xkswC0xfBFHMxIZkyf/nPb6UrjwaRh2oZjftmqWKJJbB9NIYrsup767AYX6qwVb4oYy943IQxRgp0xbK3zOAj1wTpyIIpgn4QmqxqLPZWyh+QP7JlAQvyqfnFTwhgIJ9Jusz66q1cKoo/rmVI2rTSXhdSNfvh/GiBKL4U58fH0hwDNGZPp613W5FOsXgBwBZanhf/r6GUvVXYfUG637Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxSIQeGTug6AQp3kIBDxgM3IpkAk8v1U9mlGz7929G0=;
 b=ibRtjSAU+N7qb7sig1oAemo3BiToX0lALju/tRICAjLjp2iT619WH8qIoEn+BQdSRThF0PV3r7AvlX0+aR14zpmULwpCeOMj6Br2IXPUtuj/r7XBgP39J13Is4SD9O3CQefkzTxulVM71YUOS0hNPtPkg613zsFzkgla6U5UOTtrSotJm816YIF/XpPs7WgvG9YeoUQUcnxMa2915L2rmuHWbM4cCQ5P4jEnFQY9TPHD4CAITFxU0zVfDmOn5F70Am+SLYxXBam0t6SL0LcRCl3slKxCyAcCCHSrtbW6wTwkXId1OvGzACZf9GflYYvrn0lRAYVP5ajNgbLNebFAiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxSIQeGTug6AQp3kIBDxgM3IpkAk8v1U9mlGz7929G0=;
 b=mkSG7rMtkouJo6qaM2DHRSqQoKRXuFyHn3YO9EsKNOYTIDkYgctJxBldfpZSgrqqONR1Ku8KrgVpKvay1H6hnhWrMzgoPMEssY4gbpQhKpztCMKc9pxMe7551ey5QCFC/4vlZDBaAa2zgb0SbRqSdB99i2tSRkJHwcbZ289TJ2E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5066.namprd12.prod.outlook.com (2603:10b6:408:133::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 19:51:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.024; Wed, 15 Mar 2023
 19:51:55 +0000
Content-Type: multipart/mixed; boundary="------------0qulX44r01l1Geeg0NXyCVyE"
Message-ID: <2b7fe203-82f5-2726-cd64-01c7421560d3@amd.com>
Date: Wed, 15 Mar 2023 20:51:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [BUG 6.3-rc1] Bad lock in ttm_bo_delayed_delete()
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20230307212223.7e49384a@gandalf.local.home>
 <20230307212615.7a099103@gandalf.local.home>
 <b919b550-6da8-f9f0-a0eb-0fd8af513817@amd.com>
 <20230308074333.49546088@gandalf.local.home>
 <980021d5-09f7-9fc3-2726-44884a57822f@gmail.com>
 <CAM0jSHPf5u4=GGWm6x-zVkLA_LScAxq371ny2NoozuNjHfQefQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAM0jSHPf5u4=GGWm6x-zVkLA_LScAxq371ny2NoozuNjHfQefQ@mail.gmail.com>
X-ClientProxiedBy: FR2P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BN9PR12MB5066:EE_
X-MS-Office365-Filtering-Correlation-Id: a9d8ae7e-29d2-453f-c643-08db258ebab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wWFiiHctO6zJCvOI01pH8xa0pmh+t8n+Q3FIiIb6xw5ZRuRv2CuUO25OqLzZkE6s8Zu96CjbjRC9Poxn8/HqTvaUbUcJGOCbAnCsLrUO7fdTJEtjqru6wXRucFSrEack5zAPjL6i5ps2cYAHbDx7Hnh9FlqO/oV73FgvsnAW0lTaeEy99/afFM+BRi7ywrnWQYA7dfrIjNvxJxIi8ey30twM3hYXGHWsB8uNrXgba9AM6/qhBpzS/1mPMGKXAT0YGLUyZ+yq2NKc5bzi8I7mPR1USimGQ3iJ8BdIU0vWADT6um5UJw124joqE7lIEBXV/4mUh1J6nQv/3X/J4tCAcV0Kd9iCO5Nutl7X3EqdfDZJyNSuJMK2+SRtkE38AKLXbT/ipdOOpqNYbmXQUK7MmuL8osGD2vkT8Qdq8QrHZVSa5/TOyErniGee1Nm3pqRjjLKxSiFqsRW8qwuVUn2gb8WqZfoXlhH3hC3IUgacxVXh/qTXIBkHMdXE/RoXMsfUg7YL8zArOl5F1XPnhLpUMdR4YSXXzNqRj1FonL502dHyfSoVKDFWtughSsSVG7w/7QvS5CDYYJ39hqP2a5VXYbgZ2tYgog00x915fKhLMNdgMCwhcw2bKRevoq/X2rGEWEdhBNwqx1ydyTIGmxu9z1CBm+iB5AdERDbmyOtiH7IpUgZdNLzRIQEhXfmAyLZ1PHeLkVJ8G3ceZp+jJQmzM6qqhm5ZRTeNzUcaJchiDj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(451199018)(36756003)(86362001)(31696002)(38100700002)(41300700001)(8936002)(235185007)(2906002)(5660300002)(45080400002)(4326008)(2616005)(6512007)(33964004)(6506007)(186003)(83380400001)(66574015)(316002)(54906003)(110136005)(66476007)(8676002)(6486002)(66946007)(6666004)(966005)(478600001)(66556008)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R000Z2FaN2VaL2hwUUl0WS9BNko1bGhwZVd0U0RRRzl4L3I3WGpCSG03UElS?=
 =?utf-8?B?QStJVGFkeXNUVko5TjI4SUtML1RMQnA3U3JzVUFyY1MwMUxXSnZJRU9yUkFq?=
 =?utf-8?B?TFplb1ZaalYvd01temZKeDQ0czNRS0ZlQXlEd3F1RzVjZGVCZ3c3UGdDTm9L?=
 =?utf-8?B?blgzWlhDdFBqM3MvQ05iai9LMDh6dHNQdkpIeDl4U2VROCs1c1ZUZU5ycU5M?=
 =?utf-8?B?RXZ1TzdKZ0grZ0dwN3RVQW5ObnoxRXFyUE1tSjRtTGpUNU80dE9VNlp0MUMx?=
 =?utf-8?B?QVNTVVVQUzBrTUJYMVpRYWZROVpUOGxoaEhvaUlSSUorOVYxQVRLL2VWeWVq?=
 =?utf-8?B?ZGt3bWppbFZnRnNybWJFd0ZwT1hMYlgxY21GT0F3SVRPREI3bkxJU1hOaGVq?=
 =?utf-8?B?VEtyL0JXcWxTUkFiM0UydWc2cmp1dmZubFRNK09vSFFReGUvMy90MmVSMS9D?=
 =?utf-8?B?N000ZUNKVi9HbWpMU09XcDZYM3Jha1hzTnBvcjlITTFtMDk4M2FJWHhyWDhY?=
 =?utf-8?B?aS85QVNkMlM1dnZxdUtBbVpRM2VTeWxnUHlteFJjamFtcjNOb2ZLVzI4RVJu?=
 =?utf-8?B?N0hKejR3RldnWmgvTHoxQ2FtMUUrM2JZS0o5Q1M4Y1IrM1dJMFhaNy9SajY2?=
 =?utf-8?B?ZVB2ZGFNVTRlOHo2R1h4NllkNjVYZXI0ZHVOQzZ0Z0I5bzQ2ZDJkTnAvb25S?=
 =?utf-8?B?bHZ1bHB0NkVrdGZsaVZKNEt4aDZGbVNHeEcyeDJ3d0tLNkNzV1ZWa1AwN3NN?=
 =?utf-8?B?QUZpdGtjWE9ubG5RNC8zcC9oM2dYMFN0b2tDckxYcE9wV3JmbStaZzJMSEZq?=
 =?utf-8?B?aHo0aDUwLzc2UnlwSkwwRFVYaDlVQkI1NzhUUU42VFAzR3NhOHhJTXhCNm0r?=
 =?utf-8?B?cm9WcEJqaEVWQjUwOWxQQ2RXY1lMYmtEcE9Oc1c0ZzdXaC8xSUR0YktaMUZC?=
 =?utf-8?B?T3ltSWxiaHVJRlZnQ0VzcE9rSjFObDF1aU0xWC84TG00dFg3NWFvSy9UUElD?=
 =?utf-8?B?TTdmZ0N5WDdvYVpYcWxFTG5naHhxQnVLS0pjaXVGVUgybzR1TTZZWmRvd29L?=
 =?utf-8?B?THJMKzZ0bCtycVdoRVBsdk51aEY1S3pmeStiQWVSK0srdXZqMkFQd2dvcmE2?=
 =?utf-8?B?cWtTSS9aUTArenpUUk1penBYOXdmbGF4N3dqeUNOSE1lSC8ydFVXU3lFVCtY?=
 =?utf-8?B?TWhsT1JZbXp6ZVJpOGc1RjBxQVZITlB0ZGFrM0ZLQkMvZHpMdHdJbWtoa2lp?=
 =?utf-8?B?dzF5YUFxYWw1WkxmRytrT2hTOFNwQ25DTjErRXhCVlJ2UzRjUXhvWmtzV0Fm?=
 =?utf-8?B?T2FRZ1gyL2V2MXBZOE5xWURndFJBY0dUUy9hWjZjTWViQThXME15RWNhdlps?=
 =?utf-8?B?U3ZWeDN4OUxDb0ZNNTNJU3NibVg3YlpvTlZGWDc3cEdsRnI2ZUh5cUQ5clAv?=
 =?utf-8?B?UTR0Vm5NT1l3OVltamZhZ0wxLzJCM3JvUy9MQTROd01VUWpNcUFza0dRTWRw?=
 =?utf-8?B?dmxZSHlQL2Z0TTQ5dTNFTVBHMXE1bmNHWlltSkE3MjRjOTdTS2Fza1dTMXB0?=
 =?utf-8?B?RkJsZjd4OUNlbmx5dVIvdUtyYWJJc0tMQjkzTnRTb2x5UUVvS0dZTExHTmZB?=
 =?utf-8?B?ZlovZnR1QlhWc2phazFMTUxGSFNUbDJPY2hsOEZna1p0dDNlbWNzbDlFMFNr?=
 =?utf-8?B?VUtxbklRUjlGOXdOcW4xSHdRblJEOEE5b1NvWHkvaUMzZytJTEdNQWlQMmRR?=
 =?utf-8?B?WWlXaTcrVm5GV2IxcFppMGJUbGRSNHI4dzhMeGVBbTZSWDF0by9vVG1MVm1k?=
 =?utf-8?B?dkN4eldMVmxkWXVCVm9aZklYRFUyY24wSEtPbi9wdXd2SHE5ZWJSdDBQcW13?=
 =?utf-8?B?Tmp4MUJ5MU1GK085MVVTU3gzSlovMDdWOTFKZ200ZDlBaGd0bi90QmU1djNN?=
 =?utf-8?B?c3M4M203cys4Q2tpUHY3L0ZTQXNjU1pwSmRFWWNkYm9QZWxOcGFlZXR2eU1B?=
 =?utf-8?B?ejNmRmlkQ2gxbk9EWXBnV3AyMlJyY3FoeUVEQjA2WitLUG15NUw0WDM3VitR?=
 =?utf-8?B?cUJna21tZi93cmovNjNXTFJNbm9ER0tjM1FQdDk3bUtCZWpWbEtKTFNoSXZP?=
 =?utf-8?B?RDRLT0cra2Q2OWxJdzI4Z2tXa2h6WVM3TFBabDIxSXJ6VW5oVno4SGhYYTJP?=
 =?utf-8?Q?aNv1vo0ho7WASjKxac4B8wA0GGmDETUfQ8lv7sCcn9Yo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d8ae7e-29d2-453f-c643-08db258ebab5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 19:51:55.3459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J50R1MHRvjuaNWpU1tliEXv/GTLrdQhT9HTLRHvumU74c4jHxItwDzxpkiQWxoMt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5066
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
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Steven Rostedt <rostedt@goodmis.org>,
 amd-gfx@lists.freedesktop.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------0qulX44r01l1Geeg0NXyCVyE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Am 15.03.23 um 20:15 schrieb Matthew Auld:
> On Wed, 15 Mar 2023 at 18:41, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 08.03.23 um 13:43 schrieb Steven Rostedt:
>>> On Wed, 8 Mar 2023 07:17:38 +0100
>>> Christian König <christian.koenig@amd.com> wrote:
>>>
>>>> What test case/environment do you run to trigger this?
>>> I'm running a 32bit x86 qemu instance. Attached is the config.
>>>
>>> The libvirt xml file is here: https://rostedt.org/vm-images/tracetest-32.xml
>>> and the VM image itself is here: https://rostedt.org/vm-images/tracetest-32.qcow2.bz2
>> I've started to download that, but it will take about an hour. So I
>> tried to avoid that for now.
>>
>> But looks like there isn't any other way to reproduce this, the code
>> seems to work with both amdgpu and radeon.
>>
>> My suspicion is that we just have a reference count issue in qxl or ttm
>> which was never noticed because it didn't caused any problems (except
>> for a minor memory corruption).
> Why does ttm_bo_cleanup_refs() do a bo_put() at the end?

Yeah, that's the bug. I own you a beer!

In the old model we had an extra reference while the BOs where on the 
deleted list and I've forgot to remove this put here.

Steven please try the attached patch.

Thanks,
Christian.


>   It doesn't
> make sense to me. Say if the BO is in the process of being delay freed
> (bo->deleted = true), and we just did the kref_init() in
> ttm_bo_release(), it might drop that ref hitting ttm_bo_release() yet
> again, this time doing the actual bo->destroy(), which frees the
> object. The worker then fires at some later point calling
> ttm_bo_delayed_delete(), but the BO has already been freed.
>
>> Now you get a rain of warnings because we try to grab the lock in the
>> delete worker.
>>
>> Christian.
>>
>>> It happened again in another test (it's not 100% reproducible).
>>>
>>> [   23.234838] ------------[ cut here ]------------
>>> [   23.236391] DEBUG_LOCKS_WARN_ON(lock->magic != lock)
>>> [   23.236429] WARNING: CPU: 0 PID: 61 at kernel/locking/mutex.c:582 __ww_mutex_lock.constprop.0+0x566/0xfec
>>> [   23.240990] Modules linked in:
>>> [   23.242368] CPU: 0 PID: 61 Comm: kworker/0:1H Not tainted 6.3.0-rc1-test-00001-ga98bd42762ed-dirty #972
>>> [   23.245106] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
>>> [   23.247900] Workqueue: ttm ttm_bo_delayed_delete
>>> [   23.249642] EIP: __ww_mutex_lock.constprop.0+0x566/0xfec
>>> [   23.251563] Code: e8 2b 5a 95 ff 85 c0 0f 84 25 fb ff ff 8b 0d 18 71 3b c8 85 c9 0f 85 17 fb ff ff 68 c0 58 07 c8 68 07 77 05 c8 e8 e6 0a 40 ff <0f> 0b 58 5a e9 ff fa ff ff e8 f8 59 95 ff 85 c0 74 0e 8b 0d 18 71
>>> [   23.256901] EAX: 00000028 EBX: 00000000 ECX: c1847dd8 EDX: 00000002
>>> [   23.258849] ESI: 00000000 EDI: c12958bc EBP: c1847f00 ESP: c1847eac
>>> [   23.260786] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
>>> [   23.262840] CR0: 80050033 CR2: ffbff000 CR3: 0850e000 CR4: 00150ef0
>>> [   23.264781] Call Trace:
>>> [   23.265899]  ? lock_is_held_type+0xbe/0x10c
>>> [   23.267434]  ? ttm_bo_delayed_delete+0x30/0x94
>>> [   23.268971]  ww_mutex_lock+0x32/0x94
>>> [   23.270327]  ttm_bo_delayed_delete+0x30/0x94
>>> [   23.271818]  process_one_work+0x21a/0x538
>>> [   23.273242]  worker_thread+0x146/0x398
>>> [   23.274616]  kthread+0xea/0x10c
>>> [   23.275859]  ? process_one_work+0x538/0x538
>>> [   23.277312]  ? kthread_complete_and_exit+0x1c/0x1c
>>> [   23.278899]  ret_from_fork+0x1c/0x28
>>> [   23.280223] irq event stamp: 33
>>> [   23.281440] hardirqs last  enabled at (33): [<c7d28089>] _raw_spin_unlock_irqrestore+0x2d/0x58
>>> [   23.283860] hardirqs last disabled at (32): [<c71d4ba5>] kvfree_call_rcu+0x155/0x2ec
>>> [   23.286066] softirqs last  enabled at (0): [<c71217fd>] copy_process+0x989/0x2368
>>> [   23.288220] softirqs last disabled at (0): [<00000000>] 0x0
>>> [   23.289952] ---[ end trace 0000000000000000 ]---
>>> [   23.291501] ------------[ cut here ]------------
>>> [   23.293027] refcount_t: underflow; use-after-free.
>>> [   23.294644] WARNING: CPU: 0 PID: 61 at lib/refcount.c:28 refcount_warn_saturate+0xb6/0xfc
>>> [   23.296959] Modules linked in:
>>> [   23.298168] CPU: 0 PID: 61 Comm: kworker/0:1H Tainted: G        W          6.3.0-rc1-test-00001-ga98bd42762ed-dirty #972
>>> [   23.301073] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
>>> [   23.303642] Workqueue: ttm ttm_bo_delayed_delete
>>> [   23.305190] EIP: refcount_warn_saturate+0xb6/0xfc
>>> [   23.306767] Code: 68 70 e1 0c c8 e8 f6 d6 a9 ff 0f 0b 58 c9 c3 90 80 3d 8a 78 38 c8 00 75 8a c6 05 8a 78 38 c8 01 68 9c e1 0c c8 e8 d6 d6 a9 ff <0f> 0b 59 c9 c3 80 3d 88 78 38 c8 00 0f 85 67 ff ff ff c6 05 88 78
>>> [   23.311935] EAX: 00000026 EBX: c1295950 ECX: c1847e40 EDX: 00000002
>>> [   23.313884] ESI: c12958bc EDI: f7591100 EBP: c1847f18 ESP: c1847f14
>>> [   23.315840] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010246
>>> [   23.317887] CR0: 80050033 CR2: ffbff000 CR3: 0850e000 CR4: 00150ef0
>>> [   23.319859] Call Trace:
>>> [   23.320978]  ttm_bo_delayed_delete+0x8c/0x94
>>> [   23.322492]  process_one_work+0x21a/0x538
>>> [   23.323959]  worker_thread+0x146/0x398
>>> [   23.325353]  kthread+0xea/0x10c
>>> [   23.326609]  ? process_one_work+0x538/0x538
>>> [   23.328081]  ? kthread_complete_and_exit+0x1c/0x1c
>>> [   23.329683]  ret_from_fork+0x1c/0x28
>>> [   23.331011] irq event stamp: 33
>>> [   23.332251] hardirqs last  enabled at (33): [<c7d28089>] _raw_spin_unlock_irqrestore+0x2d/0x58
>>> [   23.334334] hardirqs last disabled at (32): [<c71d4ba5>] kvfree_call_rcu+0x155/0x2ec
>>> [   23.336176] softirqs last  enabled at (0): [<c71217fd>] copy_process+0x989/0x2368
>>> [   23.337904] softirqs last disabled at (0): [<00000000>] 0x0
>>> [   23.339313] ---[ end trace 0000000000000000 ]---
>>>
>>> -- Steve

--------------0qulX44r01l1Geeg0NXyCVyE
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-ttm-drop-extra-ttm_bo_put-in-ttm_bo_cleanup_refs.patch"
Content-Disposition: attachment;
 filename*0="0001-drm-ttm-drop-extra-ttm_bo_put-in-ttm_bo_cleanup_refs.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBhYWFmNGFiOTZiMjdjODM5ZGE3YmMzZjhlN2E5NzM3Y2Y4NzFlNWYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/Q2hyaXN0aWFuPTIwSz1DMz1CNm5pZz89IDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMjA6NDg6MjQg
KzAxMDAKU3ViamVjdDogW1BBVENIXSBkcm0vdHRtOiBkcm9wIGV4dHJhIHR0bV9ib19wdXQgaW4g
dHRtX2JvX2NsZWFudXBfcmVmcwpNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQv
cGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKVGhh
dCB3YXMgYWNjaWRlbnRpYWxseSBsZWZ0IG92ZXIgd2hlbiB3ZSBzd2l0Y2hlZCB0byB0aGUgZGVs
YXllZCBkZWxldGUKd29ya2VyLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpGaXhlczogKCI5YmZmMThkMTM0NzMiKSBkcm0vdHRtOiB1
c2UgcGVyIEJPIGNsZWFudXAgd29ya2VycwotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
LmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
YwppbmRleCA0NTlmMWI0NDQwZGEuLjYzMTQ2NTNlOTFmNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCkBA
IC0yOTQsOCArMjk0LDYgQEAgc3RhdGljIGludCB0dG1fYm9fY2xlYW51cF9yZWZzKHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJaWYgKHVubG9ja19yZXN2KQogCQlkbWFfcmVzdl91bmxv
Y2soYm8tPmJhc2UucmVzdik7CiAKLQl0dG1fYm9fcHV0KGJvKTsKLQogCXJldHVybiAwOwogfQog
Ci0tIAoyLjM0LjEKCg==

--------------0qulX44r01l1Geeg0NXyCVyE--
