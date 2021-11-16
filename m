Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 371AC452B48
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 08:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0786E072;
	Tue, 16 Nov 2021 07:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2059.outbound.protection.outlook.com [40.107.100.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438EC6E072
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 07:06:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMVocFQvTNbo8RlWKKN5C0l2U6taA9uLr2lDIsCR2bqW6GEIgRwZm+6blQ/Qjn8AAEH7k3jlaCOMBAaUMK5egmT9yvkv0w/CkBqDA2ZzP79cln8QGMWsDPdPWxYyt1wYUC3Qvvv8GhWZhUBRJUFPvm6I4NOV3P8mMbzOXsybMgIu6qhp5zfRf8JgDnKI5TwHO2F8Ds1T6bccqcOoFML/QUn2V9arVnii+ooLcImiPIT6+omCituGW65uIza66JrL56LOR3jnDgNTz1J5+7EjXbef9cOh2ZOqdvVkzD0KkcqZ0QyfsHvKKgnC+4npxCxyUome2i5xc094eUQkidsbVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCMDuAYX3fSm9LH946eXsFGqPDcZ4udj+0L7d1novGg=;
 b=B24cuLdGSjsNd/Zbi0tMOrmBqNRC0ctyQopREBDjvxsboIbJOC3ynPclqQawAimRL8ZZSGsVGN3RcL+dtpGgYoFi/6WRq1mBBJMhlCFaAb0MX3+J8w+8haUdpuNsyUIJ1Q0BmLZ46A/9hjjIRxRvqRXdDkTRbX0Eg8ETFOwipY4oCkchsQMlXuFTcSoVg5fgHht8L+D87dbAhqitYyta9yTQnF+MXQXuAqBc9Kus+q2iyVpBFmIAiANblUHkUw6dA7BZFYDx3+zb/NhgaHC7bVWY4N2AxhqzgWv0truP61i1rzYJUUEn0tO05L0owBniTCBfQh1HMNWna3jcjWpXMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCMDuAYX3fSm9LH946eXsFGqPDcZ4udj+0L7d1novGg=;
 b=ZcqVfpQwkJIXRDD2Kji/UMCNxISUXBhdTTPlmPJsf6P+LZmmsDVXUXLarem4UNMeeuIenFl8eNRZ6p5zgGn+p1osHbzM+nJgK/cPBCuA5TGyQ9y8vy5E9Fp9ra2+nOdxDmVpWxJsrpDQwLJ+8nrfxYf+qADhtHZVqXclNTPb4Lo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1488.namprd12.prod.outlook.com
 (2603:10b6:301:f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Tue, 16 Nov
 2021 07:06:54 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 07:06:54 +0000
Subject: Re: Panic with linus/master and panfrost
To: Rob Clark <robdclark@gmail.com>, =?UTF-8?Q?Ond=c5=99ej_Jirman?=
 <megi@xff.cz>
References: <20211114234045.cc5tearljna2ywij@core>
 <CAPj87rPxtQVQnrs0BiXy0H1viF-oMNeCCP_Aptsxt_sgeK+CpA@mail.gmail.com>
 <CAKMK7uGd+W3yOr2wGRREW08pcX=g1UPvkX4n13dVo7YdQ4dpxg@mail.gmail.com>
 <20211115160436.llmlb3j6quts2frz@core> <20211115161634.jkgfmknuvlkbzkbp@core>
 <CAF6AEGs7ncX8O78_R5sr3pr=z1H3gUTNSJdQOF22_Qr_VY5hTQ@mail.gmail.com>
 <CAF6AEGs10VGHGAbOHh4_9+ePJCxE84L0L6k=2y663wAm8tutQA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e1f7dd3b-2d9e-b1a6-6a3a-1821a7f432b9@amd.com>
Date: Tue, 16 Nov 2021 08:06:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAF6AEGs10VGHGAbOHh4_9+ePJCxE84L0L6k=2y663wAm8tutQA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0088.eurprd07.prod.outlook.com
 (2603:10a6:207:6::22) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.183.123) by
 AM3PR07CA0088.eurprd07.prod.outlook.com (2603:10a6:207:6::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.16 via Frontend Transport; Tue, 16 Nov 2021 07:06:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 451381ec-b0ac-45bf-f6b4-08d9a8cfabc4
X-MS-TrafficTypeDiagnostic: MWHPR12MB1488:
X-Microsoft-Antispam-PRVS: <MWHPR12MB14887EC5A84B88BF21314E9783999@MWHPR12MB1488.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T6eaKNUL4KeBa1HbBLh5xZryZTiwFvYsXq7s65c+d4xfZDc7MNxHAjVbTAFhGuPH3eXdC85ssE2RPjVrhPxmHy9zDew5AB4OyN5ecoB0PC84VIeGn4+P86cqbM4tNfqa4eBy/VdzEGS8t1VCBoHCZBDza9CoOCGDOUkZ1Z4+PeVzhQ6mfHK0zaR++j3WJQXuRP0KEhyEbCJXtrWUMP3b3qtA+B9W66sDnbceEV6ImhpvjqceQPTCeIxPORVhgeSpkiWnZcHAznfGsVUIXD/dp9L5zIZM8jjgteViy6q8+II68d3wo3KUb2T4/U/7Yif0JrKCxB/qVqJ28E9vnxO71CtSi7jj4j1xfQZtYX2b98Uas+1ENHYgVn+vRm7LJFq+tz4LRlaK7n9elfSom9/KPMyqKM/nX6AwCrb64zowPUxFEwlJA7pZQrPndSzbPD2N8tRWIWINp3vMhDX3vUJmmoTbLGXuAg0sjgfhpnmTebRa2J+f//OsSKn5PWSUv8EaHY60ymGYFGZeAOVvWj/nK+7WX+V2E+KzkSRztzvidayvsCaZ6I8M1cLEeheaiqUTS4qGoS69fgkb6j0axS/G9DzcCTXBZGPfC6RO2qZzwwBYKaxqSOsVfkCE4IbTbhvhC9TNHQ6DjtoUjNy4fBMVrIckGMSo66fvI2VQLhQHU5ph1iCjP7bAorzwKwntb8QBf7+FvvZAQFYpe2UmmzRbqZnP/TvgmKpp3Voq54bWXOk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(26005)(8676002)(8936002)(36756003)(6666004)(31696002)(16576012)(54906003)(316002)(110136005)(4326008)(508600001)(53546011)(45080400002)(86362001)(186003)(66574015)(6486002)(31686004)(83380400001)(66476007)(5660300002)(38100700002)(956004)(66556008)(2616005)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlN5ZWpZbk9oRUJoMWMwV3dqWWRBUjRLWXdCcUJVMFVnSU5SejIra0plR1Vl?=
 =?utf-8?B?NlpuU0RzdVFCQi9DQlFJWUlkZ2x4WlZhcXExVnUwMEh5dGtCL2VBNk1IWHJX?=
 =?utf-8?B?SlBTNkJkTzNKNDkrL0M0WVQ1SVJjRFlsZi9hUVdTdXBkOU94WG9WaEtVbEN6?=
 =?utf-8?B?TkdmcjUvUXFqSmpDUHNKNlc4M21GMEcyeFRqNUIrTGlvamxsaTlKSUpTN2gx?=
 =?utf-8?B?ekZtd0t1Q3VhNjBBWEdlVFhLa2NOdDMxTnFCSHg4QmNYRzVZWjJQVDl4Vmd6?=
 =?utf-8?B?cS9KRTl3YXhJVlpMQ2xMN2ZPM1dFeXZBRU1hK3c3SnRxR2RXOXFSQTZIWVU2?=
 =?utf-8?B?NUw4Qm5YbzdHdmZTWGNLaVM1Ylc4dytzVFBVbWZWTk1iMWdZWVk0Nm9yS0xU?=
 =?utf-8?B?TUF4aHJoUXZqaVFyQm5QYm5sYUhGL1YySUtTa0JVdWJ4NGFzNnJNbzlrVFpn?=
 =?utf-8?B?aGovaGdiemcyMmhtYytpVmNDaS95MXdmdG5teDJIeVZzRjBHd0daQzRseG1u?=
 =?utf-8?B?M3Vrb3BKTW9POUdIbHRJS2szZDdZMDlvZE0ybXFaSkJSZkl4OEZlaDg3OVlK?=
 =?utf-8?B?WU1xMHpFdzJBaG9lcHF6djMzZ3FySmg0RGloM1B2VHRCdTNzREdxbHowMkNE?=
 =?utf-8?B?R0xkbFdsYXB4bWhnNEE5aUVYMWhVd1o0emxUSVFrNDUvREVyS3N0TUJ0YmRk?=
 =?utf-8?B?ejY2bXJSRHZRYmExZGF2eVpyWUtRTzE4U0FURGJQelZSY3l3akoxYTlWa0Jx?=
 =?utf-8?B?VlVaQzJ6ZVIrQWVZWWVFbUdoUEpodTI4ZlhOWEJhS0VCSmo2K2lidmJoS29m?=
 =?utf-8?B?ZENZWTAwWmlReFdpM1FhdE5nMFlYNko0SDNDUmRqK3hENWVVRGZIejRRQWZ6?=
 =?utf-8?B?Ty9XY1J3Z05vTW0wa29pcTlSSWFPT0hDeEliMUJMNFJrTFRTWW1XaHlLOE9y?=
 =?utf-8?B?RERyVUNGNUxxd2Y1cUQ1K09salptd2c3WkZlcEJoRDVydFMzcTkrN0ZyZUJz?=
 =?utf-8?B?ZGhFV05NbU5lLzZCd3BpZWgybDk5aUx0cWFKaFRxRTRsckdCeFNJVExQNVBF?=
 =?utf-8?B?enVyVTFwcHpSNzRsN085SVBNSGtFanlVUGEyTDAxS3RFbGJrdnBBTVRjVjhV?=
 =?utf-8?B?UXdPTjBkMU9Ya1BucXZudEJTdnErSmd4TUxheUxoMFpqUFQ3cVBZdkUrRkM4?=
 =?utf-8?B?WXM3blozd1FFK010NHk5RDFuTEVYTTBNMFZkZDBGMXg3UHZYYnhkUENTQTdt?=
 =?utf-8?B?Und5dFZTejF3anFENktGZEs5YVVaTzJ5QytHL1BnbGFqeGZvYUE3WXE1c0Rm?=
 =?utf-8?B?aG10MnoxbUhDMnRXNHN2SHpqbllRNENlaEYxYWtlelF1cWJDNzdlOXBnK0l3?=
 =?utf-8?B?a1NzaURpYWZ0Ry9vMlZ1VWxYRjJ2K1E1MWoxRWxJT1BsUHMxQzdNTlJSUmFB?=
 =?utf-8?B?dWo2QW5PV0lJYzFmeWQ2cnB1eThqOXBML1E2UXNTTzBob0p5VkNicFNSTVE2?=
 =?utf-8?B?bG9GRXQ4bk5PVHBodkJjT1pnTTQ3MzMvMGVCMmF5NTlEMHRFWmFyRHcyY01j?=
 =?utf-8?B?WEViYTVTbExob1A2UDZkQjBLdkR4aFpUOUJqb1BUaE04Y1RPY1VQY2h2Q0Nv?=
 =?utf-8?B?c0hjR2pRdEFrY0NzMW9Kc0w1akdEemdPaVFFNGo4c3I3b2k1elpWc1hwaGRz?=
 =?utf-8?B?QjJRcnRjMW1sL0JBeXpVZ0RSYnhCSUhVazdkdzJaZ3ZneHFZOE85V3Avbk9v?=
 =?utf-8?B?cm9VcDY1M1NjWXpxem9PcW50OGU2UVZZU1Q2SDNjL0JQQTlvUUlKMGVCMXB4?=
 =?utf-8?B?YWo3UFM5N1RKc0RRWndrcW1ocFMxMkpTNGYvSUMwR1EvRlNoRmFOMURpZWNs?=
 =?utf-8?B?NGR3WERRcG5QdVdrNmtxSVVpUzJiQkx1dkduem9wa0p3WVhNbFNmT0NhMmhi?=
 =?utf-8?B?K3JZNm1LOFRUT2JkVzhxQzRnY0QwVTk2YllHVGxRRnY5Y3hOeWE3dnhMZkRs?=
 =?utf-8?B?cGpVWmhNWk4yQ01NNGxIUVFwVU9wUjNDWFBYZkFjNXI4KzFEZkRxWXFreGw3?=
 =?utf-8?B?UFlwZ1NnTEFrUXo2M3BaTFBvOEJqaXhFZkR1L0x5eWxaV1lPT2puY3F5cWF3?=
 =?utf-8?Q?WWOE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451381ec-b0ac-45bf-f6b4-08d9a8cfabc4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 07:06:54.6683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1TMRImaNN3K7xLRoNvKkPOVbRj1yJLfkfUbhMX+ru6iRNmIBSX62yKXd2US6IrG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1488
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.11.21 um 00:04 schrieb Rob Clark:
> On Mon, Nov 15, 2021 at 2:43 PM Rob Clark <robdclark@gmail.com> wrote:
>> On Mon, Nov 15, 2021 at 8:16 AM Ondřej Jirman <megi@xff.cz> wrote:
>>> On Mon, Nov 15, 2021 at 05:04:36PM +0100, megi xff wrote:
>>>> On Mon, Nov 15, 2021 at 04:05:02PM +0100, Daniel Vetter wrote:
>>>>> You need
>>>>>
>>>>> commit 13e9e30cafea10dff6bc8d63a38a61249e83fd65
>>>>> Author: Christian König <christian.koenig@amd.com>
>>>>> Date:   Mon Oct 18 21:27:55 2021 +0200
>>>>>
>>>>>     drm/scheduler: fix drm_sched_job_add_implicit_dependencies
>>>> Thank you, that fixed the panic. :)
>>> I spoke too soon. Panic is gone, but I still see (immediately after
>>> starting Xorg):
>>>
>>> [   13.290795] ------------[ cut here ]------------
>>> [   13.291103] refcount_t: addition on 0; use-after-free.
>>> [   13.291495] WARNING: CPU: 5 PID: 548 at lib/refcount.c:25 refcount_warn_saturate+0x98/0x140
>>> [   13.292124] Modules linked in:
>>> [   13.292285] CPU: 5 PID: 548 Comm: Xorg Not tainted 5.16.0-rc1-00414-g21a254904a26 #29
>>> [   13.292857] Hardware name: Pine64 PinePhonePro (DT)
>>> [   13.293172] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>> [   13.293669] pc : refcount_warn_saturate+0x98/0x140
>>> [   13.293977] lr : refcount_warn_saturate+0x98/0x140
>>> [   13.294285] sp : ffff8000129a3b50
>>> [   13.294464] x29: ffff8000129a3b50 x28: ffff8000129a3d50 x27: ffff000017ec4b00
>>> [   13.294979] x26: 0000000000000001 x25: 0000000000000001 x24: ffff0000127cca48
>>> [   13.295494] x23: ffff000017d19b00 x22: 000000000000000a x21: 0000000000000001
>>> [   13.296006] x20: ffff000017e15500 x19: ffff000012980580 x18: 0000000000000003
>>> [   13.296520] x17: 0000000000000000 x16: 0000000000000000 x15: ffff8000129a3b58
>>> [   13.297033] x14: ffffffffffffffff x13: 2e656572662d7265 x12: 7466612d65737520
>>> [   13.297546] x11: 3b30206e6f206e6f x10: ffff800011d6e8a0 x9 : ffff80001022f37c
>>> [   13.298059] x8 : 00000000ffffefff x7 : ffff800011dc68a0 x6 : 0000000000000001
>>> [   13.298573] x5 : 0000000000000000 x4 : ffff0000f77a9788 x3 : ffff0000f77b56f0
>>> [   13.299085] x2 : ffff0000f77a9788 x1 : ffff8000e5eb1000 x0 : 000000000000002a
>>> [   13.299600] Call trace:
>>> [   13.299704]  refcount_warn_saturate+0x98/0x140
>>> [   13.299981]  drm_sched_job_add_implicit_dependencies+0x90/0xdc
>>> [   13.300385]  panfrost_job_push+0xd0/0x1d4
>>> [   13.300628]  panfrost_ioctl_submit+0x34c/0x440
>>> [   13.300906]  drm_ioctl_kernel+0x9c/0x154
>>> [   13.301142]  drm_ioctl+0x1f0/0x410
>>> [   13.301330]  __arm64_sys_ioctl+0xb4/0xdc
>>> [   13.301566]  invoke_syscall+0x4c/0x110
>>> [   13.301787]  el0_svc_common.constprop.0+0x48/0xf0
>>> [   13.302090]  do_el0_svc+0x2c/0x90
>>> [   13.302271]  el0_svc+0x14/0x50
>>> [   13.302431]  el0t_64_sync_handler+0x9c/0x120
>>> [   13.302693]  el0t_64_sync+0x158/0x15c
>>> [   13.302904] ---[ end trace 8c211e57f89714c8 ]---
>>> [   13.303211] ------------[ cut here ]------------
>>> [   13.303504] refcount_t: underflow; use-after-free.
>>> [   13.303820] WARNING: CPU: 5 PID: 548 at lib/refcount.c:28 refcount_warn_saturate+0xec/0x140
>>> [   13.304439] Modules linked in:
>>> [   13.304596] CPU: 5 PID: 548 Comm: Xorg Tainted: G        W         5.16.0-rc1-00414-g21a254904a26 #29
>>> [   13.305286] Hardware name: Pine64 PinePhonePro (DT)
>>> [   13.305600] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>> [   13.306095] pc : refcount_warn_saturate+0xec/0x140
>>> [   13.306402] lr : refcount_warn_saturate+0xec/0x140
>>> [   13.306710] sp : ffff8000129a3b70
>>> [   13.306887] x29: ffff8000129a3b70 x28: ffff8000129a3d50 x27: ffff000017ec4b00
>>> [   13.307401] x26: 0000000000000001 x25: 0000000000000001 x24: 0000000000000000
>>> [   13.307914] x23: 00000000ffffffff x22: ffff0000129807c0 x21: ffff000012980580
>>> [   13.308428] x20: ffff000017c54d00 x19: 0000000000000000 x18: 0000000000000003
>>> [   13.308942] x17: 0000000000000000 x16: 0000000000000000 x15: ffff8000129a3b58
>>> [   13.309454] x14: ffffffffffffffff x13: 2e656572662d7265 x12: 7466612d65737520
>>> [   13.309967] x11: 3b776f6c66726564 x10: ffff800011d6e8a0 x9 : ffff80001017893c
>>> [   13.310480] x8 : 00000000ffffefff x7 : ffff800011dc68a0 x6 : 0000000000000001
>>> [   13.310993] x5 : ffff0000f77a9788 x4 : 0000000000000000 x3 : 0000000000000027
>>> [   13.311506] x2 : 0000000000000023 x1 : ffff0000f77a9790 x0 : 0000000000000026
>>> [   13.312020] Call trace:
>>> [   13.312123]  refcount_warn_saturate+0xec/0x140
>>> [   13.312401]  dma_resv_add_excl_fence+0x1a8/0x1bc
>>> [   13.312700]  panfrost_job_push+0x174/0x1d4
>>> [   13.312949]  panfrost_ioctl_submit+0x34c/0x440
>>> [   13.313229]  drm_ioctl_kernel+0x9c/0x154
>>> [   13.313464]  drm_ioctl+0x1f0/0x410
>>> [   13.313651]  __arm64_sys_ioctl+0xb4/0xdc
>>> [   13.313884]  invoke_syscall+0x4c/0x110
>>> [   13.314103]  el0_svc_common.constprop.0+0x48/0xf0
>>> [   13.314405]  do_el0_svc+0x2c/0x90
>>> [   13.314586]  el0_svc+0x14/0x50
>>> [   13.314745]  el0t_64_sync_handler+0x9c/0x120
>>> [   13.315007]  el0t_64_sync+0x158/0x15c
>>> [   13.315217] ---[ end trace 8c211e57f89714c9 ]---
>>>
>>> In dmesg. So this looks like some independent issue.
>>>
>>
>> I'm seeing something similar with drm/msm, which is, I think, due to
>> the introduction and location of call to drm_sched_job_arm().. I'm
>> still trying to untangle where it should go, but I think undoing
>> 357285a2d1c0 ("drm/msm: Improve drm/sched point of no return rules")
>> would fix it
> ok, disregard that above.. what actually seems to have fixed it for me is:
>
> ------------
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 94fe51b3caa2..f91fb31ab7a7 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -704,12 +704,13 @@ int
> drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>          int ret;
>
>          dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
> -               ret = drm_sched_job_add_dependency(job, fence);
> -               if (ret)
> -                       return ret;
> -
>                  /* Make sure to grab an additional ref on the added fence */
>                  dma_fence_get(fence);
> +               ret = drm_sched_job_add_dependency(job, fence);
> +               if (ret) {
> +                       dma_fence_put(fence);
> +                       return ret;
> +               }
>          }
>          return 0;
>   }
> ------------
>
> The problem looks like that drm_sched_job_add_dependencies() was
> dropping the last ref before the dma_fence_get()..
>
> Not sure if I should send a patch or if this can be squashed into the
> existing fix?

Good catch. A separate patch would probably the best option.

Regards,
Christian.

>
> BR,
> -R

