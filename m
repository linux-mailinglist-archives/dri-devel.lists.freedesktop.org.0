Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF9189EB74
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 09:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC1E112EA2;
	Wed, 10 Apr 2024 07:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="a4OSspiz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2115.outbound.protection.outlook.com [40.107.255.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A694E112EA2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 07:09:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cC5vtpGZFYZ1kkWQ0HCf/2+f9/MA/eqqHPQmR3GlCTh2hBXNOq10n91Xun6WSEv4HYr0nesP2jFoJNj06rQYcxi6LZwl+lts6CCRW8i5E0JILC13WOisBtaMRqIlviqAJsWOa3RgA083DyaYe2nQgRCsUlW+043L9aQavv1VAnnsDmhD17kyZA0yeAjdAYa8WkGTWNLXq16fuYA/QwaWk1Oy3qCYHlIjfs/n46XxVMc8kZJ+RkxmqZSPeYEIn+brbpl+oYORB1I73wawr+NRM3tU2OmIR/M6VvLmXV+D/GgGP8XN3OCRvCjfrBmMJ1PkwXpxpPtnDMbPpOBbeXY8lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rBU8aBuE2ebgA6JoRVv4jqNfVXKoKJ+4MnJgFTrftI=;
 b=MUVss23A+Yzk5zxu3S0E6IsDqHh5L3UvpzfnUyc+qW+gbYc8kMval7JWMOFHuTiWEHmjNTECX1WQuC+hJNLcRXjI2nBiTYVuEgoDJCFC9RE9/Te+4yYBBTrv9Qq/8+UPxPaaexMPktUr0c2d1jlsSZKII63bxxuta5F9hGt7BYNBicB3JdoO00VIUrevfDuOiECgYap12uxBj+CLpmrp5FVg3qw1OPHaAOlUz4fTMarPOd/qM3Kx06foV4sRGf/HOwJTA6IVpFsK+2k0Z5T1AFu2DFuJl5Oiif1O/xxJB7BkG2k8oRE8kNFTQ8NVIpHh9jkNePriNI7cSLMBoSE8KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rBU8aBuE2ebgA6JoRVv4jqNfVXKoKJ+4MnJgFTrftI=;
 b=a4OSspizi/IDYZiTGlctZCRAAlkwrZ/i5XaHten6i1SucFFc0JoH7ORZIQXiLCW/YtEyvtglnxsrB4Vg+lCTWprbwQ6qpWdyto2aM10CbBWT34wTRau5tSg8hwgnaK3QvBihIFLSsBcJjZXMhgOKiHuJFKxclZzZp/mXnMIobJ+lxOm11v5yZ3SjSpy0YxzjNC45P9tWFqxBpURGgg3YM1F9CPyRiL0S3YxMSCvocXQXxO+SZmqjEBiWuNASM9SRI7C1J/arR31IlUMGT6f5mce/lNva9PqJkEao8CGhojfiQ2kz/SvKlCIG+ILt0AFeCdJaDDETRYhr5sIInVq5qw==
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB7366.apcprd06.prod.outlook.com (2603:1096:820:146::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Wed, 10 Apr
 2024 07:09:45 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::a60c:298:c201:e4a1]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::a60c:298:c201:e4a1%3]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 07:09:45 +0000
Message-ID: <603470e5-3310-47c4-854e-d6fc36366699@vivo.com>
Date: Wed, 10 Apr 2024 15:09:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: add DMA_BUF_IOCTL_SYNC_PARTIAL support
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Rong Qianfeng <rongqianfeng@vivo.com>, Jianqun Xu <jay.xu@rock-chips.com>,
 sumit.semwal@linaro.org
Cc: pekka.paalanen@collabora.com, daniel.vetter@ffwll.ch,
 jason@jlekstrand.net, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20211113062222.3743909-1-jay.xu@rock-chips.com>
 <1da5cdf0-ccb8-3740-cf96-794c4d5b2eb4@amd.com>
 <3175d41a-fc44-4741-91ac-005c8f21abb8@vivo.com>
 <9e6f1f52-db49-43bb-a0c2-b0ad12c28aa1@amd.com>
 <5c7ac24c-79fa-45fc-a4fd-5b8fc77a741b@vivo.com>
 <42aea61f-52d7-4cea-9944-7130ffcf9c15@amd.com>
From: Rong Qianfeng <11065417@vivo.com>
In-Reply-To: <42aea61f-52d7-4cea-9944-7130ffcf9c15@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0180.apcprd04.prod.outlook.com
 (2603:1096:4:14::18) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB7366:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 71ZU/joFeQPoLJHuURvJq1RpdD5qfNMKce6SVrWu0l1DIqih2eZi6PuWxfNhqKd9ImO78JlwXCOxTx3XZ8S0zvYRGg1JD03F4DfcPBRnNhNQZ9dZXSIaCIvI3Wtp5JGGNTBtspmpMd9Dng8G9RRWAyjuKDmU210ZwLGdcmnhfDl7xRGxABz29ruHyCzTZlfj2bCBVUWLteaPmIjILmlHBxvik3cU457o+FYomUKUUpQL5+bfcsflRh0/kx6giYK5bXCEpPLRwuZmOgmZ2WlXZ+5/u49LYiF6BuPRJBlG5GE5oznitQXnzQWGr3ecYqizLNTYRw2xf9p5v8ZKw+M62wi79VKoTz9s1jkixbMskdXwV7jZLqjBzwdq0JvbySuEuUpaun6JWDQoy8dLFaWvDO/sbbQmgc0WGPPTa8ExSaJ3j8dEsV4DZXgJS0EuRxyMca1g0HN1MM1/cZZFD4+hLnGdjzUxnoRJDlGb5JJL3aQmFDdpk8SUxSJzr/EwZYP7ZZZ7hTUE4wdBzlg+AII94jXS2MvMqH8gAdvmmaDX2PjZvNM1PV9TyAUZzgblaia2BQDzlC9X5tyr3eqRtJLjz8itrUy8ovZ+51Zykvl7eAJY1Y/g87dhKxUlXTvvc5UkMAdIbDakpoDvQ3vk2yuQyVCUSVd2vBRDeNQExKbi1gqSyV59gs2n4MJaaEqNvBJe2B/lc9xh1LxknfpzZ+MVBrhAOpLA2gmyRBigVDyAqof1zbW9kgMjauc6LeWcdy+G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(1800799015)(52116005)(376005)(38350700005)(81742002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGZ6SUlqTU9oU0VkSWJLUm85R28zSFpIUUU0NHZIeDVJaDFXKzFxSWFmajds?=
 =?utf-8?B?MlNYTjV2RWY0RGNxTUNIVzVLNkVweGkyQ2ZtNGhZZ29jYmVRNHZNWGdpejlm?=
 =?utf-8?B?YksxWVpQenZoVVlCRlF4WXV3SWhteFhPaXJSSk5aOFpVdENFcVFMS0c1OXRk?=
 =?utf-8?B?LzVkeDZmTDE4b0tUVlZwcm5XU0FEMVVjS3ZXd1l0U2V4TXdzYmxmQ1huVXE2?=
 =?utf-8?B?dXR6Ty95bHMwamJpOWlVcmNKM3JNSnZ0alR2WkR3OHYzUWY5NEZhWjJ0bWJX?=
 =?utf-8?B?a3JMRExPNytLSTdkQktHSDQ5a2p5UlN1ZlJYL0V5NHViaUw2TVFseGJmMDZ1?=
 =?utf-8?B?aXR2U0Voa2lvWlJpL1d2SXJBcjhHWGhFdUJNWHg1ckFoOWxnY1d4OGNTQ0NN?=
 =?utf-8?B?VUt3N0NEbGJFNjJtdmhXajdFT0NuaGlIZldsSVQyVkMyYWVJRDZOemdvMncw?=
 =?utf-8?B?N1A1VlN5S3FiNDZZRHZTTytBamJwUk5jZDAwRzR5cWVmZGl1eUdmNkRWcTJl?=
 =?utf-8?B?NUc3YThqOTY4aEhTa0p6cVpCRWdHNUozMnJMSG1LbmZLb2N1aXFFR1dBRFBw?=
 =?utf-8?B?MjJ0aVdYTjJrSkFSU1JkdkZ1cisybkJlaHVxTzVVUUxrS1F4SHEvUisxRFdn?=
 =?utf-8?B?WENrMVpDUEI4MmJpNXhmeWYvTHBiK0I1Y0JRMktWSTFwbnBnK1JkTW9sUlMx?=
 =?utf-8?B?RExnbCs2T3ovS3M5WmtNOXIxc3dHaGI4UHMyYis2SWl3VGo4a1RWWXF4eEg1?=
 =?utf-8?B?L2hCSUY5MmY5VTY2eHE2RnpVRTRoeDRlZ3BJSlNUZktKaXRWNTlQU0V1YjN3?=
 =?utf-8?B?dVRGNEhMZW5wM1YxM1h5U2RLaVBPUURtRlQxcU1UMFM5RkFrOHozYS9RemRu?=
 =?utf-8?B?LzFIWk56alNmYkg3NEhTKzBhMWROQkxCeVBYYXdOZURWVFF2TU1RbnVHVVRT?=
 =?utf-8?B?cGdXdDJYVGlmWjQ3VHZOSThieVlZWVJHKytEUG4waStMUXVVRmNpdEY0WVlv?=
 =?utf-8?B?amwyOEhTdHFKOGlSNUNvSFd4YnRBUDJkM1pRVkZ1TUg5dGJsTHlQTTYxOFZY?=
 =?utf-8?B?RXpSY0E1dE9ZcVRzM2F0RVdEdjlMTHZaR2JCNS9jTjdDTTEvb2Z4OWRLa0RW?=
 =?utf-8?B?V2orbjRlUkx6VUdvNXM2NHkvREducy94Zkd0Rkxhc3Nhb0hPV3BVdmQ1WnVS?=
 =?utf-8?B?OUhBY01mUmtydjdycm0zMEpiR3B4bFlQZmc2T0V3WWlraVM4VnprVU05bVZy?=
 =?utf-8?B?ZWpKbllYemdKNUIzakFNTEdpc3F6ay9TWU1VY2NIUTVkdU4xeS83WW1PcElT?=
 =?utf-8?B?ZEdZWXl2R2lHeXd1OG93UFlTcWU0M2dwZUlUa2NRRUNrVE5WRTIxTWpNVVd0?=
 =?utf-8?B?SHlabmh1dEl5R2Y0bU1EU29lYTQyS1NuZnNvQWZjaWo0WngvckFlWUxHb09a?=
 =?utf-8?B?SExSWFRkajhyRmQzUTU5TGIrWmpqQ3BzK0QvMEFUa2V4dTIvbHFMOCtBYy9y?=
 =?utf-8?B?TnlPWk1oamJveEpBNG5JVm5EZGpYVmhlK0dMeHhmNWhxMU9BU3V4RVlNYXNL?=
 =?utf-8?B?VXZDb281VUUvSFhHUzBrVjJmM01WSFFicGlmVGU3dVhrdmZiWitWeGVoRzVV?=
 =?utf-8?B?VFJzNUZaVVZqWTlBcDVjV040cis1TG1GVVVUY1lxbUhhMDRycWdlWnJjQWU1?=
 =?utf-8?B?M2pvVThBWWtHUUl1TlpwZ2VCYnEvcm5sQnNNNXpOdFdTWGsybE1OWmdqS0Nw?=
 =?utf-8?B?dE5nc3g3enJxWUQ4SHpBemNGT1kzdUhkeXAvaUd3WVBZTm45SXBSK3FvRXdZ?=
 =?utf-8?B?NWN2Z0VJK3hWNllpMytrbndoY3FhdHlwVFVMczB4bmRJTVpzVkozMVlvdy84?=
 =?utf-8?B?enZxS0RTZkZrMklWTE80MFY4SzBxbHhHZXJDVGRxT21OSitjTDY3VmFFRWhF?=
 =?utf-8?B?TFRSRWRZMlljM3A2TGZocCtxRGJsRUdIWEcwL0ZQdE5Ram51K0tpZDJUNXJ4?=
 =?utf-8?B?R0hTV2dGaDhaS3VDK0ttc29nRy9VczFOdll6eHNaT2J3RWdmOWo3SitBeDBr?=
 =?utf-8?B?MXlaK1JnMmZrcVpkMFV0aFpXbU1LYklwM2szN2pIMjJpVUNWdm96VTVwWkti?=
 =?utf-8?Q?g/zEwmMgSJY/3+TJNmmnQUqRM?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce586b1e-e438-4b7f-3563-08dc592d335f
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 07:09:45.1415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0Yqi+9nlFzCBkkc1/XSH8CeeMuHrgluBSK92rOWnXxKs40oWc3ZVShOgLt2ALui518OKRKSWcHiz6kzYmKkeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7366
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


在 2024/4/9 23:34, Christian König 写道:
> Am 09.04.24 um 09:32 schrieb Rong Qianfeng:
>>
>> 在 2024/4/8 15:58, Christian König 写道:
>>> Am 07.04.24 um 09:50 schrieb Rong Qianfeng:
>>>> [SNIP]
>>>>> Am 13.11.21 um 07:22 schrieb Jianqun Xu:
>>>>>> Add DMA_BUF_IOCTL_SYNC_PARTIAL support for user to sync dma-buf with
>>>>>> offset and len.
>>>>>
>>>>> You have not given an use case for this so it is a bit hard to 
>>>>> review. And from the existing use cases I don't see why this 
>>>>> should be necessary.
>>>>>
>>>>> Even worse from the existing backend implementation I don't even 
>>>>> see how drivers should be able to fulfill this semantics.
>>>>>
>>>>> Please explain further,
>>>>> Christian.
>>>> Here is a practical case:
>>>> The user space can allocate a large chunk of dma-buf for 
>>>> self-management, used as a shared memory pool.
>>>> Small dma-buf can be allocated from this shared memory pool and 
>>>> released back to it after use, thus improving the speed of dma-buf 
>>>> allocation and release.
>>>> Additionally, custom functionalities such as memory statistics and 
>>>> boundary checking can be implemented in the user space.
>>>> Of course, the above-mentioned functionalities require the 
>>>> implementation of a partial cache sync interface.
>>>
>>> Well that is obvious, but where is the code doing that?
>>>
>>> You can't send out code without an actual user of it. That will 
>>> obviously be rejected.
>>>
>>> Regards,
>>> Christian.
>>
>> In fact, we have already used the user-level dma-buf memory pool in 
>> the camera shooting scenario on the phone.
>>
>> From the test results, The execution time of the photo shooting 
>> algorithm has been reduced from 3.8s to 3s.
>>
>> To be honest, I didn't understand your concern "...how drivers should 
>> be able to fulfill this semantics." Can you please help explain it in 
>> more detail?
>
> Well you don't give any upstream driver code which actually uses this 
> interface.
>
> If you want to suggest some changes to the core Linux kernel your 
> driver actually needs to be upstream.
>
> As long as that isn't the case this approach here is a completely no-go.

Ok, I get it now, thanks!

Regards,

Rong Qianfeng.

>
> Regards,
> Christian.
>
>>
>> Thanks,
>>
>> Rong Qianfeng.
>>
>>>
>>>>
>>>> Thanks
>>>> Rong Qianfeng.
>>>
>
