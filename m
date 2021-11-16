Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B0D452BB2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 08:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469976EE09;
	Tue, 16 Nov 2021 07:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CADC6EE12
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 07:39:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ctnf/PxI4aG+GKhXmf0ap52TjjouinzxcqrVc2yCLXhTgwGa+s2AFDz61kcIyUXasPphEOtgLF4DdzaXbKZOPi9kqL2OSH1/Zyakv9CxsivvoBfBWEAwhhYOetEIPZZIjqHhN20n9tCZuzPy5v0KInCtILlDVYyuY1U/9343Eusw86CYaxaHJGGniovnn+btm3BS5gHE843pgOVUlSzuIDA3ycHZcavgxcrH9KpT0Yx/ladULb3iy0NFrKitDK4T8FYj/B4pTgxrSbFJhUId5YZIlj719ukXgsII1Ur5YAoI21ehveXinVl3foj6BH1OatunEcGSPecPvCi+y5OYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5R9Z/UB2+XMrKGYAl/J4eInOvaLBlF8YBhakvgBxrQ=;
 b=illykxMh8t1WRYRjmGhQ0ZdbyfwKgcWgM7s0LcPhiSeKQ7Z94YP2CRd1Diy9mYnA2tqyjMowErnYZ4JsA3ZvygTSgVSI5SQXc+2YFNdQuMHszhE8WfYYfbAr+Si1Py7J5NaH7lNUYliCNa8Tz4KipHJ+fXgkU3TJID/slt/jWv1yN/wgYVcCi5r7/ZJeywEJk6fwpNkgIpaAH4SraQ0B0FiV1OnCRTkPPMlQ6WrTQ/ZNrKZwaEvNysQsv826izSAqhsE7/aMiuOdV94F2xwScyZw/yYkeBbANy3tun8GI0hJ5DulxAsdLjA+Fjbpc6n2tlDSVJVGL+JxrSBWWvDX7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5R9Z/UB2+XMrKGYAl/J4eInOvaLBlF8YBhakvgBxrQ=;
 b=p7kXaoX0XWgSllKLPFziGF9JDiYnPjhbFNsQDgEkC9/6htwA5E2kvnIjPrAdyCQdaZqRhqV0d2S2eXK3BjG50O6PsZBkwqwvBBNS0squk1pBWVhrXfEPQVfuehU9KnEz8igi8s+1w+nIOB5Iufn+ssexysKLDUJuE410BNpKVMI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB0032.namprd12.prod.outlook.com
 (2603:10b6:301:4f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Tue, 16 Nov
 2021 07:39:55 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 07:39:36 +0000
Subject: Re: Panic with linus/master and panfrost
To: Daniel Vetter <daniel@ffwll.ch>
References: <20211114234045.cc5tearljna2ywij@core>
 <CAPj87rPxtQVQnrs0BiXy0H1viF-oMNeCCP_Aptsxt_sgeK+CpA@mail.gmail.com>
 <CAKMK7uGd+W3yOr2wGRREW08pcX=g1UPvkX4n13dVo7YdQ4dpxg@mail.gmail.com>
 <fd82ad9c-2b48-9bf3-0552-6f103847260b@amd.com>
 <CAKMK7uG3TPHH_jeGygKONNiivRiSvxM=mKafi4+6ceDuN1HErA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1e26455d-5637-ba21-498d-4b140c6db1d9@amd.com>
Date: Tue, 16 Nov 2021 08:39:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAKMK7uG3TPHH_jeGygKONNiivRiSvxM=mKafi4+6ceDuN1HErA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR10CA0052.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::29) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.183.123) by
 AM6PR10CA0052.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.25 via Frontend Transport; Tue, 16 Nov 2021 07:39:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 626431cc-6c43-4c1d-7b06-08d9a8d43d29
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0032:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0032EE496B7E6E1E2EF7685F83999@MWHPR1201MB0032.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C6h4xoYGfZfiDTrBW3/sF/BHy5KBrcs/o03RiA/DGn/vXL9/PO7sO4j1DxtqIlHopDduyHRcDWeWhcezhlmh2mFMkHbU1bXSKC4EWZ8QcK8jmL6U3uKfA4pZRoTi2cOoyshlJwHx+qB3ruEcX6hte6TTfw0WdfDNBmW12brR4HsWdq8iGHcfm7HVxejzdH4kZspMXrlWsln7NeXlYfwhBEru8mTvCAtr2LrwlyleB8G0mDH/UK3N3fLXYxQyeAsnvGbtlY329lLajZvjcEFE7hbtmOHPuarjnq6IQSDH+Gv7NkW9jHtFtP4zCRRj0CR+ZeTgQ3SBT3V4U09ia7t3NwbkP7PWV4oc2Hr9uCy6Ewk9ywAMOvyUlJSBWmy/vSdzYzBqOplExj9gcbkiDubQo+0hsUv2pcpJTCw3/EPN8zVsXgF9fURWEM5T7hYpdZvikWwUK8LfY5k7AYE33T4c8o8bA+aLFUtTKtxyZ+yoxtUbfHWiDHS7NMQHeieDHxu1S0INDO/Xz0UHKmQUMsYH+WDDmVw/HMvB38P264RrzugJotGt98y3A3fDefb6xoeBAfV91gpgSxb84S+7C/C6vn6L3k7YHAH0W2evmCnh3I1XKr1k6JDqKPP/meEDudeSwKuDDXjJLY931K2bPDd2Bnd+NcJz8rj0yGwga7XESvdkr1IWeHiGDi8pQ7mSA1rrEfybNFRdZh3Ax6zWkX3eVZHQQT3zHBIkouxcIkJn7u3p4kRfe/urghkd6pZz0xLLJoKBD7M5QnhZhZBEOOFnOCZ/CPeawuoPFqgiZpgtGk/4q2Q4Ur5ZwOJrMPiBBmbz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(86362001)(2616005)(31696002)(6486002)(38100700002)(53546011)(956004)(31686004)(36756003)(16576012)(186003)(316002)(966005)(45080400002)(83380400001)(4326008)(8676002)(2906002)(508600001)(66574015)(6666004)(26005)(8936002)(6916009)(54906003)(66556008)(66946007)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2FkRVpyTnNBZkQvdWk1UHdxNlhnSDJPOUY2QlhNRlpwUnYvVHdWaUpaci82?=
 =?utf-8?B?UHZjd1h0M1VnNEhRanZ6cllsd01mTzY3Zk5TVEM5M29aM2R3VklITHNTUU1v?=
 =?utf-8?B?cFYyNGZXTndSNG5wb3ZyTENyRFIrSHNyRWV5UXZTeWd3UUdGWDA2a2w0Ty9E?=
 =?utf-8?B?RHcxZDBFaHJSdEdjdkpnMysxajQvZkUxRkNvN0hmWE9FYVBoUEcyR1VKTDhB?=
 =?utf-8?B?NDhORktoRkhZM3RMQ2RqdDIyNmEzUHNUOUlWTVk4aUhFNUJHWDZvbDhPUTZ1?=
 =?utf-8?B?UFlxQ0VDUW9HTFl0L3IyUU1aRkZIZWpwQ3phTVA4Y0JBZUN0aS9kS1J5SDd6?=
 =?utf-8?B?TlBUL3VWNXpoOE5McjBWbWFvb1h3NFlGMTZQTGVYNngyRVE5cmhZT1VZMkNN?=
 =?utf-8?B?T0kwT2QwOExGWi83V1VhVktKSGgxcFV1dzlQK2twdDNvNHVJbjYyTFNJb3JF?=
 =?utf-8?B?S2d1cXZBUzJNVU9KQkk4NVdzNUlOMVpDa2k5SW9ndHV4SGY1aWxoNWtBMGNJ?=
 =?utf-8?B?TTUySlQrQjNzNStUVjlLZVV4SkFXSnFjK3JZcE8rQUJPeVpjZ1JqdTRodS90?=
 =?utf-8?B?WGRqbVc2bm5ZOEZNN3VoRm5kT3FMbml3RTVCb3EwTi9XYXdnRHNXNFZuVzVZ?=
 =?utf-8?B?dUd5QW11TXllSmhlOXFrbW1WTFZsQ21RQzQ2alYzSmQvd3RzNWNtdkcwRnVD?=
 =?utf-8?B?OVQyakR2bFhuTURaSEtpYlQ4YjMzVUltaERkRUhHYlBGUWVHV2Iwb0k1QXY2?=
 =?utf-8?B?OGdrY2RqTTdSL0hpdno0Nkx1SmdyWWU1ZXp3QWtmZmhWT3REYlJTNDE4SVRt?=
 =?utf-8?B?ci84VDR4N1o1cnMyQUt1U0RocWFvcURaY2N3MVBZRzFpREhNNkVwemhkaUU2?=
 =?utf-8?B?QzFvYXdNV2xhUFI5NmV6RmNZL0RNOVQyaVcxeGdXdjZ6OUVDRW5kb0FYU1o2?=
 =?utf-8?B?VUUxNWdnbVlhdzdXREg0SlkvVjZBempBdktLWEpTUXE2ZzRPVHpTQVJnV2Zk?=
 =?utf-8?B?T2hYZ3VWV3VQQzlxcXAxMGdxYlVaaENhemRUZVNKVlEwcTVKSEJabHI3dEx4?=
 =?utf-8?B?bnNheUFtZW45QWZBdktLYmc4bEtFWHF5QUErcElYL1BJTzFxdG5xYVdpNkFj?=
 =?utf-8?B?ckJkNUE5RFQwTmcyd2pYUnVZVjV0eGc5UkM1a21PQVpkZFI1MlZoR3pXdjVr?=
 =?utf-8?B?ay9DVTB4QlBKMWRKSUNsU0JHbElhR0x4cXVGWVNiZzR4ZGt4VjV0NkJhODMw?=
 =?utf-8?B?NG1Qcm1YMVRiVjdqTE1tSUpoZE1hNVlQb1VmWnh4Y1BCZnhZVm5hRm1sQ3FE?=
 =?utf-8?B?VVJVVm9xRVFmNnlxb0lnN09YOE9UZWhEL3JkejMxMTBkZTNJNkFGdzlBOUZT?=
 =?utf-8?B?ZFYvbis3RGxBbkpwTWFZY0Y4SzlMMlJwb2cyZEd2VW9xMUtxK2tVcHcxSXNK?=
 =?utf-8?B?WVlZRndlMWN2SXdtT2VWaE11OGc0MDZ1UkJWV2RRTnBXMG94cWZjYXZ2WDNE?=
 =?utf-8?B?K2Q5ZjhoV09OSnZyUWpZT3pDVSs0Q24wdkF5d2g0MkZnUEMwL21WaUl4STBm?=
 =?utf-8?B?VVF6RGxMWkNaeDk3Z3FpTW1MSXZTOWNlNnBGT1RmaWNkQTkxTjBsaVFKRFhx?=
 =?utf-8?B?N09xdWhCMkxxRnp4ODY4Y2NKOEE5bU1pU0haMGZla01rU0ZRQzFnaTdGNlVa?=
 =?utf-8?B?QTBpVW10VHh3N0V6ZmRFMkQrYkV1Si8weWJtSTE1YmV3eHRDZG5XbGUwOFFj?=
 =?utf-8?B?OUk3YUwyM1hvVVFUU2xrTkZwZHN4YzJ5aG5LRWJHWC9kQ2RyZklYbi8xZjRV?=
 =?utf-8?B?MzlFUDlkbTV2ZEV3cnVITFlQWk04a05Bd0NwZ3g1eFMrZGdVcGJnWVBKckNx?=
 =?utf-8?B?K1RGMGcvaVZWZU44cjRURzJhSTBFbW1RWG1Pc1NOZkpPblhXb2x2L1VvT3Qz?=
 =?utf-8?B?SGlkZnJLd0hDRzZoTTNnTTNOaWQ0Z3czcWVyeWZuUjNKU3ZJaGRvY00ycUJn?=
 =?utf-8?B?YUZGd1JkVEdzcEkyNlhzWUFjL0hUd2lZNlA4L0JLZnRKRTFtZm81NExOSVhq?=
 =?utf-8?B?TWJSR3VSV2U2aWFPVUNTUXRQNkI3RmRVZ1B3WjhNNDY1a044NFFyVWtQa1BG?=
 =?utf-8?Q?yBDw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 626431cc-6c43-4c1d-7b06-08d9a8d43d29
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 07:39:36.3776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DR/lgKYNZtbsXuryLT+vI5vzcEcJnMJ1kRmrlvqAuaqDFyttxVJKQ88eaCO7HIIX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0032
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
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megi@xff.cz>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.11.21 um 08:37 schrieb Daniel Vetter:
> On Mon, Nov 15, 2021 at 9:23 PM Christian König
> <christian.koenig@amd.com> wrote:
>>
>>
>> Am 15.11.21 um 16:05 schrieb Daniel Vetter:
>>> You need
>>>
>>> commit 13e9e30cafea10dff6bc8d63a38a61249e83fd65
>>> Author: Christian König <christian.koenig@amd.com>
>>> Date:   Mon Oct 18 21:27:55 2021 +0200
>>>
>>>      drm/scheduler: fix drm_sched_job_add_implicit_dependencies
>>>
>>> which Christian pushed to drm-misc-next instead of drm-misc-fixes. I
>>> already asked Christian in some other thread to cherry-pick it over.
>> Sounds like you haven't seen my answer to that request.
>>
>> I can't cherry pick the patch to drm-misc-fixes because the patch which
>> broke things hasn't showed up in that branch yet causing a conflict.
> Yeah I asked Maxime to roll forward to -rc1 right after sending out
> this mail so you can do that.

I've pined him again just a second ago because a "dim update-branches" 
still doesn't show the patches from -rc1 this morning.

>   Which you could have done too :-)

Hui? I can push merges from upstream into drm-misc-fixes? ^^

Christian.

> -Daniel
>
>> Regards,
>> Christian.
>>
>>> -Daniel
>>>
>>> On Mon, Nov 15, 2021 at 3:56 PM Daniel Stone <daniel@fooishbar.org> wrote:
>>>> Hi Ondrej,
>>>>
>>>> On Mon, 15 Nov 2021 at 07:35, Ondřej Jirman <megi@xff.cz> wrote:
>>>>> I'm getting some fence refcounting related panics with the current
>>>>> Linus's master branch:
>>>>>
>>>>> It happens immediately whenever I start Xorg or sway.
>>>>>
>>>>> Anyone has any ideas where to start looking? It works fine with v5.15.
>>>>>
>>>>> (sorry for the interleaved log, it's coming from multiple CPUs at once
>>>>> I guess)
>>>> Thanks a lot for the report - are you able to bisect this please?
>>>>
>>>> Cheers,
>>>> Daniel
>>>
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C16b6abb8eeee435be5c908d9a8d3e8d8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637726450378319982%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=0SieiO%2FNcLgRmlDWvyifVcfsfHGbVhQqA4ff6oj81SQ%3D&amp;reserved=0
>

