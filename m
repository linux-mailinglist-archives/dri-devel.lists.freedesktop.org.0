Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8137DF2A5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 13:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD2910E07C;
	Thu,  2 Nov 2023 12:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC5F10E07C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 12:39:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmHfjO6G+qQqogBWeLBtuFP/MUJ7IvBc/L7BqOia+QvddvgJ6ZkU9tbnGtC5ycXwceduudHjuSHWHgASk8lm+UNdmdioUtpe4u0DUt434jQaWTYG2mEAkxOX9gbmw4d2HNWz3+NCQpUo0+Ep2QVgWQvnOCtJdid1Vzql9O4cEHJnpa4bI142W6mIL0KR5rbIe+1t/KVzFeHO3VnlB4gMPeFRryJTBgm9pF39rP8gfRrAAHXt4PkeJ8xrizdj4Wfm4Tzd5vC0OJFl+GfA8c5aNwnoLYS3N0MBcXVdpmWgx66yVMRLej8Q+XLpzwwUsnu7fs7c4+pOR9kc2jRy269TEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDQNmVVftdkGYNisB6UyJSMPPRokc43VyMLH7GNM65E=;
 b=ecKDkir5fWNGZ3eRBb8njTLkNgS560IvfDvBXrWkhYG1PLXLXYyGjneYT5iJr3GRtuXZOd4iVpVqjqwbsg0alz84taBGAvNa7argde8G+Cae8+nh6aRBLMItJtg8KZ+yLyD1YBTwduXWU1Zp55hO+YeGphjqfTnxK8x/X+O7ra5zVQE9HQfZAkHAuklrZFba+uV/HFg+vY9LzNhvG+/miXRb/afNDFdgJAkoPXD+Cy2GsaA1+WmmsLq5q00/2IodSNlXyOIPKP16L2zl/zfYF4sjpUqSxQjUhRyqOMhNzeFcyR7J4yy1tRgbpDf1RehUG3BT1JRXYn5s9IOmlk8Fvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDQNmVVftdkGYNisB6UyJSMPPRokc43VyMLH7GNM65E=;
 b=ug4Rk3XuZEuMht1prQxGJv8SEi/bhSgkHuXBatjc/UbK2bvuwQQ+a/ARiSwgX8CYRqQ+6toyzMzII/YRXoJBPqjMK+RQdXfVppxV5HhkZSsToTCadDm6mXTtQpQPLGhvXrs5E9olClDNwdksNcEs1zMos9Owr4kuH2rpKD+ciw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 12:39:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6933.029; Thu, 2 Nov 2023
 12:39:41 +0000
Message-ID: <9ae839f1-442c-4184-80a8-6f2b51a7b8de@amd.com>
Date: Thu, 2 Nov 2023 13:39:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>
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
 <5438c132-e127-4456-9551-42c76fb521dd@amd.com>
 <18a77f80e2dfed630d22b9d6246c7d2122629a5a.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <18a77f80e2dfed630d22b9d6246c7d2122629a5a.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ce8247-ee74-4fa5-136e-08dbdba0c871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3W7A7UAu+tJgAkqnv5QD94bbVzqbBtkvHIAxZogjWbWPuKmk70r8M11CqahptNl62NxIMe0emjCLRC90FZ1VDbgwQe4Gtffr2ay+w/uYzW8KwdG1P19wkw6+JIBUaRIUfRWyhssAkw3gQqb5rfLuQRfcXFO9k29ZIv6Cybz2j2ArnHMzqfNgSxZzIFM00Ow6zKd/u0I6Blmlqd+xTHKYABx/CaI1TVXssBFHho8u96sp/nF8QY1qpqqSGf3JqRXUFPO6qft3bQDPrzt4Ucm8JaQOhk/joO4FuG+9h81J68PWGiQ5A9PH72obQraygy7ghKWbcgLVUUTsSDANa0Xq40m1OyMexV2aaxAxWuUAcK24lrTx7xXAxLtHWQNc/kk7qCIkmrQ0QKjfUyFJr2ApV5DZ4MK1pJn7hhNwi4OPkXwxwAlEhiosl5j9NsI/fykxC02oUjWfnx7gDA05qVa03v4jOE1vupMnTHqLCEMnJ0fxsqVMSX5p+urEGDb6mD1VhZoIECYCMyJ6oqa0emS1i1os7xa5fp3HlSNIiTt731CBYDqCXJ21UirD0IjZU4ohuD+16T99w/eMURKCGuXJi8Iv8ITTdKsH0qyBCnCCmoiJh4fO81FYN12ZyoTlD9dI0RMmy666LiZK+TYyRPwFHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(376002)(136003)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(36756003)(86362001)(66899024)(31696002)(6666004)(6512007)(6506007)(26005)(7416002)(4744005)(478600001)(6486002)(41300700001)(83380400001)(2616005)(2906002)(38100700002)(8676002)(8936002)(4326008)(110136005)(54906003)(316002)(31686004)(66946007)(66476007)(5660300002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azczZ04vM0RpTnRSVWZXWno1WEZuaHpPM3U3VS96U0JPV2ViSkNBa1QrL1dB?=
 =?utf-8?B?TSs0eFVOTU4xai9ILzkrNkh2TUhlTzlERlNsS3pOTFl3UDBwQkpNem9sYWtn?=
 =?utf-8?B?YWIzUFpYQmloUDdjSUtacjZDV1FtcE1LbHI3NVlXSUlnaWFsajJqamY5bSsz?=
 =?utf-8?B?cUNiVXpuREdsZzhzaEZyM09Zd25ZNVQrT0dpODMxSTFEejlGN1YwSHBCemp0?=
 =?utf-8?B?RmJEWVRDL2FuVVFBQmNORFpjVERlL0EyWU1YeUFPVDArMjRJYTl1dCtPZDNC?=
 =?utf-8?B?ejhraWZCeDB1dnRZUVpnQXlJS1RlV0JvTUVReGUxOU1HUUNrcDVSVGxyRWYw?=
 =?utf-8?B?YlVtcWNKNlFzMWNyYVd6cGV1N1dxTDBpU3FnRlB6K1RvVHpkbTI4NHVPVC9q?=
 =?utf-8?B?TEF2Y1BRNWpIOWZCU3BCTElseWNqaFJsVGJNakVrUHg3b3hrUTdENnpMc05p?=
 =?utf-8?B?SkU3Y2txVWNGdGJSTVc4cVc5TGFpS0FHWWEyNUkzMytDY3JlSjkrY0pNYXJZ?=
 =?utf-8?B?WU56blhmb3pwV09yYUJLZDZyVElnWFViaVMwQmVGYlBhZGRyeXZnOE1pdzNM?=
 =?utf-8?B?Vjc4VEhhYjJocWtEaDlja3pTT0Q4Y09kRlVGdmw0Y2hsVTR5a0Rud0JCTW9N?=
 =?utf-8?B?QnFvSVlpaXk3VUNmemtBLzlyYzY1SlhrSkVQekZTTWNGMmlhckI3WXZxTU45?=
 =?utf-8?B?Y2srY1pZbEMvR1VxTDBsQ2pBcFAybUVJZXh2NVhlYUJINUZpOUdsTXhNcGRm?=
 =?utf-8?B?ZDM0SXJSb2VlSk1ldzgwVW5ZdTBha2pxZlp4cnFGbEZwMXQvdW85WjgwNHpX?=
 =?utf-8?B?U1U4TU5OOFVuZkZXSTFUbVVMaTFJK1M1VmRFTGl4QzRQV1BXbzVhNzEvVEV5?=
 =?utf-8?B?WlRQekNsMzZkZlJ1dTBIUndZR0R0dVlLWXNPdkNjbktMOVg3dW5sRUNROSsw?=
 =?utf-8?B?MXBCNCtoRE1IcS93NDFtRE4zMmkvZGJaa0ErTTJ1Z1RHOTNZdkhwWTB0ZEZT?=
 =?utf-8?B?b3JHVEtUOUdXQzdJck81VHNqakd0YVk2S21STmhFR0JlTE5XOXJKejBPSWdQ?=
 =?utf-8?B?enpGOUNLdlY2d2phTHFIVTc5bThObkxXWlE2YmwzWFpzck9FYTB2UUNabUY3?=
 =?utf-8?B?VzRyL05EUGRmNVBZNnNsYW1pUFV1VnpPV0tZMjk1aEtNMTBSajZhWU53clo4?=
 =?utf-8?B?K0hDTXFEbHFaL3Rqam15YmJ6d3BVdVI5czBOOHBCclArUll6NE5rV3M2cjVu?=
 =?utf-8?B?Ykkrd1AweWFkcGlwVkJyVjdVNWZha0NJcGUvTVBWeFVJdEsyZ05DZ3U5bVJr?=
 =?utf-8?B?bnI4dkp3YXBaT1lxNFBOVWMyZEpvK0k5WHRJMUxMNjNWdjc2NytaaW0wL3RL?=
 =?utf-8?B?dmtWRk9CTUs4dVhmbXJTWTY3NmU2NXQzenNYZnZwbVVjR1NiVTk4aFdqV1JM?=
 =?utf-8?B?Rk1EM09DelNwcE9aZHYyNGJvWGY0QXJPWFNrMUgvZjRnbWxHam1KL3JwbENw?=
 =?utf-8?B?d2cvcmhURUg2eHJxUldWVjllWjE5ZDJJcURTSE5wREoyTG9KcE90RnhuQUlS?=
 =?utf-8?B?RjR6VFgrR2tXWHdKSzRhbWY2QWxOeGJqTzNKNkhVZXNwSTc5S1g3TW12YlQ5?=
 =?utf-8?B?QU1jS00zTmx0TENZT0hJT3gvdlRaRElmT3VIaVdIUEg5WlFGZ1NxOG1CTExR?=
 =?utf-8?B?Y29BMHZGS21sa3RJV25NeCs4UkdrdWxvZHV4K3VwZENibS9VWXRZNHBCWDF1?=
 =?utf-8?B?L0EzMW43V1l3WHhUSmNRT0JvNVd1M1Y5dWd5YlFoOGVrWFc3Rk4vUTRFVDU0?=
 =?utf-8?B?ejB2NlJVMkp5Vy8yZDdMeXhPaTNoTzlxL25UZ3Y0M2U1TTJpeXQxVUJGZlZn?=
 =?utf-8?B?cGpsamhSTFFxVHVNLzFpZGpicEo0emlxL3pVUTBoRzRndE5ObUF4MXhXYit4?=
 =?utf-8?B?Z0lKakNUdnRDdzM1U0J4NHhQdUtoeWFPNEpoTFhpaHB1M3Z6YVVOOUxTelRy?=
 =?utf-8?B?Vml0T05pMHVOUEhBTUQ1aVZ3RUhRZXV6WWY4Z0FJeUZwU25LSStGQU5LL0s4?=
 =?utf-8?B?NWJaT3BvZE5QK1lZVHNPSGhSOVVyZkFEbk92T3Bwa2VjcitBZ2VXbnZvV2dy?=
 =?utf-8?Q?Qnso=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ce8247-ee74-4fa5-136e-08dbdba0c871
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 12:39:40.9165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ts0mbgRcZ5q6RiCoJrkprUmTLpfVZEo4+UvjhEIPXNv+v++gxiZJn7Zcf/4l3d+c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Asahi Lina <lina@asahilina.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev, Sumit Semwal <sumit.semwal@linaro.org>,
 alyssa@rosenzweig.io, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.11.23 um 12:19 schrieb Lucas Stach:
> Am Donnerstag, dem 02.11.2023 um 11:48 +0100 schrieb Christian König:
> [...]
>> I was considering to change the dma_fence semantics so that
>> dma_fence_signal() could only be called from the interrupt contexts of
>> devices and then put a big fat WARN_ON(!in_interrupt()) in there.
>>
>> It's a sledgehammer, but as far as I can see the only thing which might
>> help. Opinions?
> That's not going to fly. As soon as you are dealing with device drivers
> that use IRQ threads, either voluntarily or even involuntarily on RT
> kernels, the dma_fence_signal will be from process context.

Ah shit, yeah of course. We use IRQ threads in amdgpu for the second 
interrupt ring as well.

Ok, nail that coffin. Any other ideas how we could enforce this?

Thanks,
Christian.

>
> Regards,
> Lucas

