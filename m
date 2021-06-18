Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75853AD1AD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 20:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9CD6EA5D;
	Fri, 18 Jun 2021 18:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2053.outbound.protection.outlook.com [40.107.212.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4316EA5B;
 Fri, 18 Jun 2021 18:02:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpKQ8C6X6w+bRWsVLZtr5S0zr6TiqJ/FetuGP6GMMSCVhTJ1ontr3wg/B48SX27JBlme0vrLEeo+gOimo9nOkpb9rKdecW/BB11lXpqQwzPjlYLDIFPzwcAFxZWabkoGSMr5wuScZJZeCDQ9/s/nPjiX2LVigoOTaGnaCWlL4+O59ovjjjltgdu8k+3KwKrFTEA6wo6wy42eJHziY6qUlRavi+gWhaXxzHjIYUdSpGLpmlGfqh1+Wp3oxS+coXcYNaOFs24h3rDhPvWFwh6DdjsDfae+tO/6PVUumdYbL8SKoe3NkfS4dog6Ry6oTrysnBsF28N9cAEiylNl5wmyfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jw5c4hzo/1VlHoVctLLG5i1fzHpBnIcddq/bWvvmR8=;
 b=kKkKuiJ23VHMwPd/PXXo19zdTolwvOhoerf80jGRyHc4t87hBuVyDe7O8OiY4GN5yuzXLDMmnTfDP8ao4ALRd2HQEn1Pvq/xozO9+JLvAjbndXjPuNGyAkBZYHZZ/9HN3WTFD2zy9XBJDaJoP7WaQRm/WUcg/7u9fmVJptKdRLAqTJinVNvw7aDlJzkhx7vR9UU5xCCLsgDnEa/Jp6UJsuEtbEFLT81LKN5BEyNP4o3CxytOilwvbCSuegeQwpHppTSOy5Ffmg9L4Es/Wa7zb0jDo7Qc/VFZU+7OHVM4ZER4nzN+dTHuoNu7/zTxvhucdK5BipGbJSV6UwxLMaAJDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jw5c4hzo/1VlHoVctLLG5i1fzHpBnIcddq/bWvvmR8=;
 b=h+v1jmvUQ/RHHtAtaocrtaD5k7YUgylOuVACvw0wkidryAWaFIoNEAAWkXu2zJPgu0jNqpmOChViYAerdOqDbYh8iQVDAof/itU44taxs1K+/aKPrlzjRFmuRCJHDpbefNzV2lRGzFpchI3WG4YEz9IiNcRMXoBxkyUaoilPmoA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3838.namprd12.prod.outlook.com (2603:10b6:208:16c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Fri, 18 Jun
 2021 18:01:59 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 18:01:59 +0000
Subject: Re: [Mesa-dev] [PATCH 0/6] dma-buf: Add an API for exporting sync
 files (v12)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210610210925.642582-1-jason@jlekstrand.net>
 <29e9795e-8ec7-282c-c8ec-413eaed2e4d4@gmail.com>
 <CAOFGe94oFA9=vy56--hm=9=232+Npnxrpn+6gGFpRM2dmJZh3w@mail.gmail.com>
 <84135114-71d4-77f0-7a6b-69bb81b7f73c@amd.com>
 <YMupgTffAfw8xw51@phenom.ffwll.local>
 <e8fc12a3-42eb-30f9-c6ac-772fbc675678@amd.com>
 <CAKMK7uH5oW3icBPOPsumRv+LJ-5qCVKgfniXd-J8mnA+JuRq+Q@mail.gmail.com>
 <53c1c0c2-5e17-a54f-155b-66f3cd4b48a3@amd.com>
 <CAKMK7uHng_beNWeYa50Nxrz2SQVmjTuuN-cAYz-SQtAymGdH3Q@mail.gmail.com>
 <b364d818-edeb-a2e9-a3a0-960e2463f086@amd.com>
 <CAKMK7uELvm+OFZ_GJT4NnB5xXChUcTEuozz4MTu9KwEne=bzgA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ce3fbc52-d629-f022-da52-bcc1adafbe23@amd.com>
Date: Fri, 18 Jun 2021 20:01:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAKMK7uELvm+OFZ_GJT4NnB5xXChUcTEuozz4MTu9KwEne=bzgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:a1e6:745d:56d6:b5df]
X-ClientProxiedBy: PR0P264CA0276.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:a1e6:745d:56d6:b5df]
 (2a02:908:1252:fb60:a1e6:745d:56d6:b5df) by
 PR0P264CA0276.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Fri, 18 Jun 2021 18:01:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e71681eb-2433-46bf-fd96-08d932832afb
X-MS-TrafficTypeDiagnostic: MN2PR12MB3838:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3838DA7F9278095B41158B42830D9@MN2PR12MB3838.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZzGO8hvLwgJecylqpHzapNap5UtVJmWezy54b43yGyKSg++ElWnJrYdAC+kT1RBc8HsMrHeyzwHzZWAw7NiuBMzkTcILcf0u13PV/fc4ukoDvvXe+z8WBMlR+es72yHoB17cuslXROD6EGyWJo0CPYCLbAkwjn8ldclozhnT2RV6phsZw0NTcjBX1aR3ZdiUdoI2eAcof73ncJLa4LqoJ2i2ZON+LpnrddFRFHBsuGIVBjtp93FzK7/q8Orn6IJfHKhnqn4jLkyyJZp/ByOl2PU/xVvn8xnpBrSyWA1apkDqzYZ6iflga83fGy+heGwtgDs3BKowZZvY/uh6UM3czbiBDeXeKiS9RhdSv0EPTDBHWWqDrQ6M/ktNmWP7pUMMj7XHP7jy01v1CkBZuwSR0iqRNLC/nDblCreIa932Ezwplksl1cljNteOATcJ+GlCdXgHZN6CAINhp9hwTxqsnHcq35Nlk8AKLzhe6iyS4J3evZoUwJpEsDbCuFknJOsleE42L34A3jsRr1YZIT3AgxjmFgAVddN+/RT2g1n7e1/Kq6Eu1g2wR4At4S8RHCqV37bh4cjmrEIdKNdXZbQL77VV8AN7S9b5d9/gqyd9sGmvozUFnO92COe0k8l/SI+Jgjx3BrUwCxXNRzEEXzt8rNdZgavDMTIDQuWQSdU78eFz82g/fsQQQM4pzbJZpAnK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(2906002)(316002)(54906003)(2616005)(31686004)(6486002)(38100700002)(31696002)(8676002)(6666004)(86362001)(66574015)(83380400001)(36756003)(8936002)(53546011)(4326008)(5660300002)(186003)(6916009)(66946007)(16526019)(66556008)(66476007)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eElBNk9pbTMxektFSE5XTFdhd055L05VWXRPaDNqVWk3eHArWEdwaWx4ZjFh?=
 =?utf-8?B?eHc0UmxHMitZbURxWUFyYWplRXFQaVhlVUl5eEpwWjlvSDgvVHNiTTlMeSt1?=
 =?utf-8?B?bktOZkE4UUFONVNWKy9oNlRaTnBtVVFrNU1nVnM1SlhYQVBpTnR5dXRGZGxp?=
 =?utf-8?B?ejkyUUJTM0ZGbHJ6UXBFRmRtV3BVRzJFKzFrY1VnVEFaVW1CTW1wYkMzbTRH?=
 =?utf-8?B?WWhXRnBmdDZ2cCtteUEyd0lsUmNRVnJyNURlQ2xYZTVYalA4WnZmVDFhNFdY?=
 =?utf-8?B?TjllRTNpSDFDaTdiaTF6azZQbENiTU1LWE9BdENEWndtbzF0bDN1SktVNUJI?=
 =?utf-8?B?d2c5R2IyQlRoY1Vucmp4YzBiS0N0eGlXMnlWOFZuNTZjQldVRnB5ZlF2K0N1?=
 =?utf-8?B?dklDcldjTkxvdm1VblI3cUlrNW1JQ0dGQVNhcUtNWG9VTjVOamVnTnpXaUxX?=
 =?utf-8?B?TDFCWTRjRTVjMkQ4cU9MUTlZRUkxTmpISEhNZDIwNExZQjZobTZaVGE3ZnAw?=
 =?utf-8?B?dHlGM3hhelZMQTJEVk1ZTmxJUW9nUUVQYUpKSjFrRHlMRnNPZWNyU1dUZko1?=
 =?utf-8?B?eWpoM25KcGFSZDZndlZjeFhicEgyZW5KRVdKeTg3YmdnZjFuZnMyNXczNnFC?=
 =?utf-8?B?OXQyeHJDOXV3RTdocUZ2QVp0T2ZPcW84Vkk0TTJPMlp3QnhTVkJaaG9VVTRl?=
 =?utf-8?B?ZlVUY2dZVXVURDhUT3RNR1dLM1NaSnN1S1VIRENlYTVoa1kwa1ZRNmtjZGZB?=
 =?utf-8?B?NnhtNWJCcytKU1F0RG5LMlJCL0tRZU9HUWRCbkFmeUJlV2Z6RFB3elZzeVo2?=
 =?utf-8?B?M09xY2FpYktWZm15M3ZCMW1LSE1lNEpxbTFxdEMyVlJvVk9sYVRMdDZkK1p6?=
 =?utf-8?B?REZCNklMZWRqTlQ4UHM3a1dwQWZqQURXb1ZKU3ZyZExmcU5rZDdaYVFCQy9T?=
 =?utf-8?B?RmJLaGhkWFIweG4xS3dhcnA0Zk9IbmV1b2pnSXA0SU9NMGhLaHhrbkY5VTY0?=
 =?utf-8?B?ZzdsMmtZZlVSV2FKQXA0RUsxT1Y0bXlWWUtibjZEM29iNWxLL1pOcEVNSFll?=
 =?utf-8?B?VDJvM2d5d25lSy9CMlR0c0FqeUpZL1ZNZEZoNlNWUmVuTzFwR0xJRXlsSG5F?=
 =?utf-8?B?cEVhbHhKbmQrV3g4bGMwSGw3SGtlUWhhVCtDQzBmUUp5RURMcUptbjVpMW5D?=
 =?utf-8?B?S2NvS1AzZ1JCR2xiM3NLVnZOWHZpbmNMMmE0K0FleWxsNXc2ZzF5Z2FyeVkx?=
 =?utf-8?B?emYzY2lnS2NMOGZzQTZLdGJsLzBmL1poV2w0bzBGTGJNWjJCb1RjbXg2QWhr?=
 =?utf-8?B?K2xZRDU5a1NkbXU3Nyt6bjNjcithUk4yU2pPNXFEbm8wNlVSNUNaSEp6VVV4?=
 =?utf-8?B?RmdENW0yZHErZGRpNTR1ZlVIVVJHV0pCaWJMZ3ZDT0lLM2luTGxMRWt6WFFQ?=
 =?utf-8?B?eHFLS043eStONmpML1BLcnFmMk1wc2xuS3dmR242R21WUVpQd3FjejFmU3Ja?=
 =?utf-8?B?YjMxaEhOeEpTaWVsaUpSR0xjNm9na21JaHBBRkVxVEl4cDhQSVFtb1N1cXVQ?=
 =?utf-8?B?N1NmRDJYbzVPc3EyT2x5RENBUFhKYS9sSHVXdnNCTFRFS0NEMVErWHlUMXVi?=
 =?utf-8?B?NEpmbmxLeUZLNkNBYThQWXpON3o0NzlTY1VmeGxBQXZHdVhMeVErNzhrUjBU?=
 =?utf-8?B?QkN4eEppeE4rU0p3WjFwVUpXMm40dHNxY3pKUWVSLzFYd1hLT04vOHdpVHd1?=
 =?utf-8?B?Qmx6ekVJM2VTSHhDNDdPeFZrTHc3ZiswbXlFZGhJVzlPMTRzV29HdEJSNUZH?=
 =?utf-8?B?SWZZWkhZck8yS3dySk9WenFBNEIxTzJTRTRvN0ZHY2xhUGR2Z0xKT29aVkV4?=
 =?utf-8?Q?tkB9f0730Y7Pb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e71681eb-2433-46bf-fd96-08d932832afb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 18:01:59.4856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rh/tDhpE2ENZZbOrr1mAN03QmVwihWgEQIuUcOCul+/3w4Aa3DgNbfHRG9BCEzL8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3838
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
Cc: Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>, ML mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.06.21 um 19:20 schrieb Daniel Vetter:
> On Fri, Jun 18, 2021 at 6:43 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 18.06.21 um 17:17 schrieb Daniel Vetter:
>>> [SNIP]
>>> Ignoring _all_ fences is officially ok for pinned dma-buf. This is
>>> what v4l does. Aside from it's definitely not just i915 that does this
>>> even on the drm side, we have a few more drivers nowadays.
>> No it seriously isn't. If drivers are doing this they are more than broken.
>>
>> See the comment in dma-resv.h
>>
>>    * Based on bo.c which bears the following copyright notice,
>>    * but is dual licensed:
>> ....
>>
>>
>> The handling in ttm_bo.c is and always was that the exclusive fence is
>> used for buffer moves.
>>
>> As I said multiple times now the *MAIN* purpose of the dma_resv object
>> is memory management and *NOT* synchronization.
>>
>> Those restrictions come from the original design of TTM where the
>> dma_resv object originated from.
>>
>> The resulting consequences are that:
>>
>> a) If you access the buffer without waiting for the exclusive fence you
>> run into a potential information leak.
>>       We kind of let that slip for V4L since they only access the buffers
>> for writes, so you can't do any harm there.
>>
>> b) If you overwrite the exclusive fence with a new one without waiting
>> for the old one to signal you open up the possibility for userspace to
>> access freed up memory.
>>       This is a complete show stopper since it means that taking over the
>> system is just a typing exercise.
>>
>>
>> What you have done by allowing this in is ripping open a major security
>> hole for any DMA-buf import in i915 from all TTM based driver.
>>
>> This needs to be fixed ASAP, either by waiting in i915 and all other
>> drivers doing this for the exclusive fence while importing a DMA-buf or
>> by marking i915 and all other drivers as broken.
>>
>> Sorry, but if you allowed that in you seriously have no idea what you
>> are talking about here and where all of this originated from.
> Dude, get a grip, seriously. dma-buf landed in 2011
>
> commit d15bd7ee445d0702ad801fdaece348fdb79e6581
> Author: Sumit Semwal <sumit.semwal@ti.com>
> Date:   Mon Dec 26 14:53:15 2011 +0530
>
>     dma-buf: Introduce dma buffer sharing mechanism
>
> and drm prime landed in the same year
>
> commit 3248877ea1796915419fba7c89315fdbf00cb56a
> (airlied/drm-prime-dmabuf-initial)
> Author: Dave Airlie <airlied@redhat.com>
> Date:   Fri Nov 25 15:21:02 2011 +0000
>
>     drm: base prime/dma-buf support (v5)
>
> dma-resv was extracted much later
>
> commit 786d7257e537da0674c02e16e3b30a44665d1cee
> Author: Maarten Lankhorst <m.b.lankhorst@gmail.com>
> Date:   Thu Jun 27 13:48:16 2013 +0200
>
>     reservation: cross-device reservation support, v4
>
> Maarten's patch only extracted the dma_resv stuff so it's there,
> optionally. There was never any effort to roll this out to all the
> existing drivers, of which there were plenty.
>
> It is, and has been since 10 years, totally fine to access dma-buf
> without looking at any fences at all. From your pov of a ttm driver
> dma-resv is mainly used for memory management and not sync, but I
> think that's also due to some reinterpretation of the actual sync
> rules on your side. For everyone else the dma_resv attached to a
> dma-buf has been about implicit sync only, nothing else.

No, that was way before my time.

The whole thing was introduced with this commit here:

commit f2c24b83ae90292d315aa7ac029c6ce7929e01aa
Author: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Date:   Wed Apr 2 17:14:48 2014 +0200

     drm/ttm: flip the switch, and convert to dma_fence

     Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>

  int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
....
-       bo->sync_obj = driver->sync_obj_ref(sync_obj);
+       reservation_object_add_excl_fence(bo->resv, fence);
         if (evict) {

Maarten replaced the bo->sync_obj reference with the dma_resv exclusive 
fence.

This means that we need to apply the sync_obj semantic to all drivers 
using a DMA-buf with its dma_resv object, otherwise you break imports 
from TTM drivers.

Since then and up till now the exclusive fence must be waited on and 
never replaced with anything which signals before the old fence.

Maarten and I think Thomas did that and I was always assuming that you 
know about this design decision.

It's absolutely not that this is my invention, I'm just telling you how 
it ever was.

Anyway this means we have a seriously misunderstanding and yes now some 
of our discussions about dynamic P2P suddenly make much more sense.

Regards,
Christian.


>
> _only_ when you have a dynamic importer/exporter can you assume that
> the dma_resv fences must actually be obeyed. That's one of the reasons
> why we had to make this a completely new mode (the other one was
> locking, but they really tie together).
>
> Wrt your problems:
> a) needs to be fixed in drivers exporting buffers and failing to make
> sure the memory is there by the time dma_buf_map_attachment returns.
> b) needs to be fixed in the importers, and there's quite a few of
> those. There's more than i915 here, which is why I think we should
> have the dma_resv_add_shared_exclusive helper extracted from amdgpu.
> Avoids hand-rolling this about 5 times (6 if we include the import
> ioctl from Jason).
>
> Also I've like been trying to explain this ever since the entire
> dynamic dma-buf thing started.
> -Daniel

