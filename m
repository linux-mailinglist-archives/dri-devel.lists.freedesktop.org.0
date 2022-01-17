Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 999C4490A27
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 15:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406C510E2B5;
	Mon, 17 Jan 2022 14:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2084.outbound.protection.outlook.com [40.107.100.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9052010E2B2;
 Mon, 17 Jan 2022 14:17:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UX/00CCZjK1hy+2JrXhFCsTiAl12jspBpoJIPb9HXpPrt7pIzBFEFcv6ITKrKTQcL6I26k3uQMit/AxqQsLYjIauG6UrEjoWgTY2Z2xvoyjQHDAq7K+H2myHZjkpfn3DwoPHbmKauLw1OUyfdQ47G30i3A0N9iKrRdoxABJtpchFnSJxgI52AqoBhZcn1HuAErpFpn6XZJU0XuiSuTIvidGZfkyLxjVGN8eP8UKaNvJFLR5/I1VGgh15kuIZnLLils50i5zo8cBwXHb7g/7sAMBShzpe9p7ehZZSXJ6nku0d0+rata1nxxMDfxMtupesuFzYHghNN6mSXxr2QSdYPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IyoX/Gx17VzAyo4x9OQ70dXKX2BtYP9x2Nh01H3Hqo=;
 b=AsTFvSeEsohGI8lC0OKzrgp1+FPtl/KKw6U8N+DgCtMz7APFLJustIg1tmupX/LKz8ussAgcZBgiuLfvrNwZvJeZsmOsTrWDHbJ34o88YAAbdvtnQIOuMZzvsEYWJcGEXXT/WOVMHh6doWElC8rKKBYCubAE5aX7tQvccXpl936xX2yD2xeKXr43Mkur/0PJfu3IFoTQRRJXhfMGJYsF7T2pQfDggS4rSaj+p8Key07kdkRusLpAkloBa5bFMS/aGTCFBJvP77jmitEZArH8r8K4FxA12SBInt0NgMrkMmxAKHvLdVJNkP/gmp4LZilzdYY/Yyk66o/fE8Ie3Oz+MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IyoX/Gx17VzAyo4x9OQ70dXKX2BtYP9x2Nh01H3Hqo=;
 b=sFsR5vaKNXSbd9GZ8bCzF6NLWwZdP0MAUNNtMfRKLF6Gel3nYa6a/P30R8tBbBZcTrNQWj5r3GjPDSw8VLkLHqEzIuln0xRCTuhmoR14MPMtzeUaeJrDWn+I8t4nt+fHfUweI0hFAc13I+nMEob7y3k5n8dxUz6BflKC2u8mSvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BY5PR12MB4321.namprd12.prod.outlook.com (2603:10b6:a03:204::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 14:17:06 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 14:17:06 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <a5c769fd-7eac-2628-a36d-fedddfb7d398@amd.com>
 <279c7ffc-99e5-f052-5de1-9b957c455d85@amd.com>
 <1ab2558b-1af0-3319-dce6-b805320a49d0@gmail.com>
 <60760210-3b3d-952c-2637-4d70fab1a857@amd.com>
 <fd95f1c0-7550-0497-7284-64a5257304ca@amd.com>
 <ddb344cc-48ec-7323-4494-4e1cb8323585@amd.com>
 <071fbdc1-38ce-d1e8-0e11-25204a3cc217@amd.com>
 <af705589-a601-9774-ec55-d1c244f756a9@amd.com>
 <386142cc-1df5-228c-af24-2187998d9307@amd.com>
 <b80efca2-4a51-7ac9-cc9e-e497ac7c9c7c@amd.com>
 <YeGoVhLgMDOJS15K@phenom.ffwll.local>
 <92f1cc2b-d4db-6c50-d8a3-cdcd31127d15@amd.com>
 <63c48a97-aa76-0a3c-0c68-97de628b864c@amd.com>
 <387a53c6-8ec0-ff6b-aaa2-34398f36a369@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <0210e651-cc71-c1d2-5166-7473f664f405@amd.com>
Date: Mon, 17 Jan 2022 09:17:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <387a53c6-8ec0-ff6b-aaa2-34398f36a369@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::12) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebd4c1fb-f477-4ee3-275a-08d9d9c40a35
X-MS-TrafficTypeDiagnostic: BY5PR12MB4321:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4321804FB9FB670D055E23F592579@BY5PR12MB4321.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8RPS1p3zk1DYL2SZQhJTvsST2eDzSd4xBIYibCv63rS73MvJa1algzmeJZZc1lEb+zQdwgbwBJ4oReyOfygQVBdM6Zfap4f25EK6de00Hfz8v2ZO+QsMnpQzUlsarNjo1kPdWKjcbg1SwJSNBFGrMkdRhOuELOvyxFws7M5YUdxFBMN+e6GIC18PzY9Trx2mNXJz/pzqiA6m/EY8J4rL7ZWqu9ZKevnB2FclUPekInJkDhEiMBEb/A9/eVh/RaUxtnbE/L5QyqYhrfa36cbHIeZIpv0SC/SZt3s+avCKlKTOLAXNqEyS+l0KzawI1rUvJritGXAEpIjTPP64jMwQVeVo4Fd37ktKTewxBhYZU+ZpUr2TLOMrq/dcBtDuXnx+KvzN4nGZOxVtraGr7zj2y5P1y6TidWR5+fO8sqw4AWjbyy/NRoSKSX6zrUkb81S6j+GLQH2DNQf2mFiD/qLJUBEHzXjM/B/KGABChwffutui5QMif1pg75W5ZIQ3zzLBR6o7YPpDR4kfJYFys15qF+IB5tb4tjtC4vVt3lDagurhECZec1/u98oykMU2JldnHhrHtdqjxMjXN8iAwsTvPQ0KadrrVQmc55+gR5mdONJdtlp//ls6Wpt7cEM8xKLa5xXbTRCOwSbVhZJZCq7rGMtHD9UnZkKf2DQWR1QjIejmeMxiw5NS3/DBysqgkZy9//QxGuKxXNh72rzDdo+ppLeuCpEFA6ETggnaOXiEX87vOcsc8oOt3d4tF0WmcYcc+mS8wioEXWJIcJAm/QUFxnx2OI3K3q19bAw89Lz5z8SFH6sXIFd327tp5llov6NZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(31686004)(36756003)(31696002)(2616005)(6666004)(2906002)(966005)(38100700002)(6486002)(44832011)(8676002)(110136005)(66574015)(8936002)(54906003)(316002)(86362001)(186003)(6512007)(83380400001)(6506007)(5660300002)(66556008)(4326008)(66946007)(66476007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3VUbmpWakJOb0hMcVF0Wkl4dnpNaGltcEl2STAxbG5nTjhNVkIzK3pSMFpT?=
 =?utf-8?B?a08rdU55VUhsamd5OG9iMVdKUHRGWmh6WlhlMkZEdnJLUDhvM05EVnhRMXcw?=
 =?utf-8?B?NE5adzlvRlQ2ZjFIUmZ1RzZFeUlzVFRSNW5JNkJpRzhHWUFnSUtVTGdvWGdi?=
 =?utf-8?B?VkhBSWQxRGtNbzBsdWxiVnB3K1lGL3pBWnEwOHVMemNDUDBOZG9FTVowZUZk?=
 =?utf-8?B?dHlZRXZsd1pndTVHQ1RRd3pvN1FlR2FSMUg4elRFOXcxMjZJSmhyUkhJbi8z?=
 =?utf-8?B?d1ZzemRNckx3V0FSY0Z6NitGeGdJd2swd1hCR04xcS9aUlJnMmJhNnV5bUZr?=
 =?utf-8?B?MlprTWZLRkg5a0RKL2M0RlhEQjZoNElzZldWTGtZVW5QOERCaUI2R2R3VnNn?=
 =?utf-8?B?ZHNDaFFWWEVFbXhEV1Q1RlNNV3M0ejZMNjZGODhkSHcwdUhmYXRaUExTLysw?=
 =?utf-8?B?bnVMdHFSY1YwTHNZWmVyMENqZE9KZWMxN3o4aGZjMlRPb2ROYUtmSDJLV1px?=
 =?utf-8?B?YVU3Yy9HY1pRZ3U3OHJSRU9QWHlUalpoVTc1UUxicEhmRGRReDV4YXV5OUVO?=
 =?utf-8?B?WDNxUWx2QVdlV3RIT2RaTjBvVlRpQzB3allaSXk5dXFLMTV6UndQS0lITFJO?=
 =?utf-8?B?R2tsVCtDYzg4VDhsa29mdWhhMnBSUFZWWHliN2xUdEp5bFVmU2tSbnBua0pK?=
 =?utf-8?B?ZzJCVk1LSFBENG4xZld5U210eEdyalVNSmxleDE3SmhvSHNGVzNETmw0ZzZq?=
 =?utf-8?B?cGc1cW15amNibHlEcHZHMjllV0JqL0xqYVNpQnpWby90UkhkNFlFd3ZjZnh6?=
 =?utf-8?B?d2UyOGFSMEFwUzd4NDhxVkVqWXo2Tm9RYTlHN0hDajBPZ1hvd3hZaUsybW44?=
 =?utf-8?B?cDczNk85aGo1c1FIRUJOcXNrQUpncmxHcFV3a3dqY0crMGtCWEZOYjQyQXFx?=
 =?utf-8?B?eUtxS1BqeEtnSnd1RkVLMDVvRFQxSWNkU0drVWtOTWVwWlR2VFh0OGI0bkRo?=
 =?utf-8?B?ZHVEZTZaZHVYUk1XSEs3TzYzcDNxeG90eGwvN3hmYmFleG1nWThQbCtyMTVN?=
 =?utf-8?B?bkZ6eWlQVVV3amxlTzlCVmRwK29yVXRTaG15USt2VWNSNVVPY2kwK1ZSSGFq?=
 =?utf-8?B?aGplcjRoeGpPR3E5VjcybUtsWkN4bGpIQ2ZITWZ1aWFIUHVteExucExlYmhn?=
 =?utf-8?B?MWdJQmVzMDJXTHU3ay94bjNWY1NQM1k4ZTcvKzFiRWp1cmFYd25QWDd2emhP?=
 =?utf-8?B?S01TRHlBS05vTDN1c2hZaTJtamJMR0ZMRVdlbzMzQy9HUzFZWit0aExKRURF?=
 =?utf-8?B?UjFxd0tiMkhlOHJibWZsNXdTTk1ENGt4NUpWbzFSQnBDS2dld2FtMjdjNHFR?=
 =?utf-8?B?aXovK1o5RllBdU4wdEpudUxIeVRqOXBiWGlqSWorbXovenBYSlkvMTRXbGxj?=
 =?utf-8?B?dE1RN0VuQU1qZW12UmRTUlMySlVwR2tUaW1EMHlSL29zQXY0b3F2eHp0K0pR?=
 =?utf-8?B?aHlYWURkSEhwd3JpK0EwY2Y3YzRPVlFpYjc0anA5S0RFd2NpdS8vMFJKb1Bt?=
 =?utf-8?B?UEhJaDQ0emhYV01PSW5SS2dpSEdQRXdxMjZvYVMvWklwaC9NK3Z0V1UyL05I?=
 =?utf-8?B?SjdyWDMrVWRxeDNXZDNFdmJaYTNLWnBFaWl2NDIvUU41dE9qbXo4dENra0ZZ?=
 =?utf-8?B?Vkd2SjVhWThrYmlnblg3Tk9oN0FnYk5mamU3Mm9JN3o0c2dJNUZsay9oa1RN?=
 =?utf-8?B?VFMvcjFnSTE3TitmME9pTWVaTldlVXpyenhSMGlrUW1keEdnUERIek9BMExa?=
 =?utf-8?B?WS90NjhIUmN3ZG92M040ZnlDQWZtbVprZlRYNnppSjdlV3BJYVB4NzFrRVBi?=
 =?utf-8?B?clhFL1dWcFFteG1jZWJaOCsvbG00c3U2OGwxN0pNLzF6K3BqK1hScUdPWmxK?=
 =?utf-8?B?V1dEc3hIbFR5eEJuR0pLQUxDTWVxUEVmaWNyVXJ5amhZZ3oySnJBUWNuYnBm?=
 =?utf-8?B?VG9oUlhDcHNuSmtrT090TTZ1S00xMFRJb1RBWGlMQldGVEZDdXBwWGxIN1NZ?=
 =?utf-8?B?d3BiNUMvVkV1Sjk3dXhLSVNxZ2NNdmJOOElWeDFNaVZrZ0VrNFdBV1lMaFha?=
 =?utf-8?B?UFl0ZW9yQ2VnV0JhSmpWVWVCSnVYN2FqNjkxc0ZiOEFoK0c2Y1lGMWltWFBQ?=
 =?utf-8?Q?tr5dggqCR2Z0ohiOveb1m5E=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd4c1fb-f477-4ee3-275a-08d9d9c40a35
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 14:17:05.9114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhLkLYLbjJqWHDXec+YQUFfSKompd3yb1opqvDSUO2zu4D3S0lgnNhpOnKjtkIAQwM5mrMlXLhJHohmc4nBe1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4321
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
Cc: daniel.vetter@ffwll.ch, "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>,
 dri-devel@lists.freedesktop.org, David Yat Sin <david.yatsin@amd.com>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, airlied@redhat.com,
 Adrian Reber <adrian@lisas.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-01-17 um 6:44 a.m. schrieb Christian König:
> Am 14.01.22 um 18:40 schrieb Felix Kuehling:
>> Am 2022-01-14 um 12:26 p.m. schrieb Christian König:
>>> Am 14.01.22 um 17:44 schrieb Daniel Vetter:
>>>> Top post because I tried to catch up on the entire discussion here.
>>>>
>>>> So fundamentally I'm not opposed to just close this fork() hole
>>>> once and
>>>> for all. The thing that worries me from a upstream/platform pov is
>>>> really
>>>> only if we don't do it consistently across all drivers.
>>>>
>>>> So maybe as an idea:
>>>> - Do the original patch, but not just for ttm but all gem rendernode
>>>>     drivers at least (or maybe even all gem drivers, no idea), with
>>>> the
>>>>     below discussion cleaned up as justification.
>>> I know of at least one use case which this will break.
>>>
>>> A couple of years back we had a discussion on the Mesa mailing list
>>> because (IIRC) Marek introduced a background thread to push command
>>> submissions to the kernel.
>>>
>>> That broke because some compositor used to initialize OpenGL and then
>>> do a fork(). This indeed worked previously (no GPUVM at that time),
>>> but with the addition of the backround thread obviously broke.
>>>
>>> The conclusion back then was that the compositor is broken and needs
>>> fixing, but it still essentially means that there could be people out
>>> there with really old userspace where this setting would just break
>>> the desktop.
>>>
>>> I'm not really against that change either, but at least in theory we
>>> could make fork() work perfectly fine even with VMs and background
>>> threads.
>> You may regret this if you ever try to build a shared virtual address
>> space between GPU and CPU. Then you have two processes (parent and
>> child) sharing the same render context and GPU VM address space. But the
>> CPU address spaces are different. You can't maintain consistent shared
>> virtual address spaces for both processes when the GPU address space is
>> shared between them.
>
> That's actually not much of a problem.
>
> All you need to do is to use pthread_atfork() and do the appropriate
> action in parent/child to clean up your context:
> https://man7.org/linux/man-pages/man3/pthread_atfork.3.html

Thunk already does that. However, it's not foolproof. pthread_atfork
hanlders aren't called when the process is forked with a clone call.


>
> The rest is just to make sure that all shared and all private data are
> kept separate all the time. Sharing virtual memory is already done for
> decades this way, it's just that nobody ever did it with a statefull
> device like GPUs.
My concern is not with sharing or not sharing data. It's with sharing
the address space itself. If you share the render node, you share GPU
virtual address space. However CPU address space is not shared between
parent and child. That's a fundamental mismatch between the CPU world
and current GPU driver implementation.

Regards,
  Felix


>
> Regards,
> Christian.
>
>>
>> Regards,
>>    Felix
>>
>
