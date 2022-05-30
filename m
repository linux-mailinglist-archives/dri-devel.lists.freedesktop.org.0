Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 399E3537E46
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3957110ED00;
	Mon, 30 May 2022 13:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AA510ECEF;
 Mon, 30 May 2022 13:56:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWhkfLs65iVQv0+mt9DfStWvXbcYjJJ5myovjcMm7Ta3TEc8sSAcaV4LMo2zqgR+vBqlLNSmRFohsrgyUsInoYd5+DGRszdinu+j5JN+Xf2DodW8bD1gWPlFV+09sBT7KNW5tj5QK2Sh4oW6W7OvKobFwceAn2zhioyqZvp6ITO7GoCZru13szVhTy/SqLqdOzvnjDJEZPrsIEvj9MRDMvKZdmgVMSDX7TapjTXFLfMCDFS9t41YHC2Rt7uqLOXdqQX0y/hDmGh1BLsIY1BOr9PBEJm+YzyhdStVZuqHnFtbsI9ytqL41Qk48Xt7IXUHFv9zqx86VgkV+m6QsooteQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ln1IYHCrBrCaQS84rnoFBpWZLwjNyjzT+nTzcBkppU=;
 b=TbDgXJLIzJ1kD4HWYPsJhR7NFIxy3EhpXBGRzWXRJdA4R8akIE0mNkcsrvmfJAz4lulPj/sMPPQCa/9zrqiPCA+lhI0aTBQeVYGWHd0De7sUI2icHwV3YNIvWbvf7F6eexVOC6VIOcrzEFUQ4jUwj6+OZblwN/sO+6hsT8BfeLQMu2cBA7RslLAZK/5iloKeLLBiuNayQMhCPPCyoz4eHYyB6nJfv6m/A8/7UTuzzIieWcZh8zFnJvg1HxT0pvKs+4DKhFdae82/DR+biXmDn5S2wzlmCAtrhxEcYdanTas5gH0ADqC6dlTi+0rj+6RGs2XUqijMEibtP/AabWFOCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ln1IYHCrBrCaQS84rnoFBpWZLwjNyjzT+nTzcBkppU=;
 b=13ehhYFfxSWwAGsLkIAQffpe4EG92IwRz4RVTkutxhpU6BCWdggdvfHywDUQDBskAdXfedmF+60Eub0upNf3famO8vYXRRxBpWsIgBxw8OR00s4Jvx8/Uaap5BBkXQrjccQMwNUdkxi+myiNcPi9scswbsI3ZxJspipPqOUWjAQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW2PR12MB2441.namprd12.prod.outlook.com (2603:10b6:907:f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 13:41:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 13:41:25 +0000
Message-ID: <02e7946b-34ca-b48e-1ba6-e7b63740a2d9@amd.com>
Date: Mon, 30 May 2022 15:41:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v6 14/22] dma-buf: Introduce new locking convention
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Qiang Yu <yuq825@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <20220526235040.678984-15-dmitry.osipenko@collabora.com>
 <0a02a31d-a256-4ca4-0e35-e2ea1868a8ae@amd.com>
 <e6e17c52-43c2-064b-500e-325bb3ba3b2c@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <e6e17c52-43c2-064b-500e-325bb3ba3b2c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0085.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::26) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1ffce7a-8d23-4703-3cdb-08da42421776
X-MS-TrafficTypeDiagnostic: MW2PR12MB2441:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2441DBAE277206CC9B13C10D83DD9@MW2PR12MB2441.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iSW1wIoCn3nNFjZJBQ1vVHTV4DmbG7Pguh9zjakZuKfexezjAX9RzSr2q+jzbmy/pmZffq8/LpakTy5pBFcDAworhdC/7/i1vg8M76wK2hEcPOwrV+FPaB0gaA3b6ou5npDbyKmelZ9o+gLFGHSLYIU3WyrL1hcJOBI0x7269ze2XOmr65aRKKBRAOAKFE4eIofz0U1UsWLiaEW0mrxY+Ee15EUJ9ZYZ7ne4rzcGPgLsjOZfmF1QS+iCcpOmzeAI1mF0VzgjkT2h/p2o378+qIb0XPuGI0LsIwQne/y/bTWmX/uTsfwGfCD/X/eeNHuhGHUiawshG6purNZ3P/Gl01dBkomujtNqIs4WPJ4hS8GG22IvqjY7uC6dSKRf0cAq+4oyD/bzGNx4Q4Bov2KbPdu5eIkBJW6xmWZ06K5fQTS7KXP8+OlfnC761AirGjBvz7OEMdYQLCUVfPFRK07BX1r/misEdHCvyzWxfVu4F3iPlUe9On/qIFBrlz96lVC7reTmjbqZYQ1NIzFyNZhTvLrNDWr41V/dYj1meGasC4tGClUxRG/YlcJavEGJkX8mQDrlI/5fKT2RfGg6CU/wyQL9Tm6vuZ7hvtx8BOGDpoCXe1C3NpyFm0l0PU9dOkkHLMLsjlMILagVF1RYcItVWeef0wAN6sD52qXCXlEyWYwn5QL67/wSMGPmDIw7dy+c2nimlRzNxOJ1lrB1RZvmzLHGeK9QjXGqgL1dNa/xWsf/zWxEnElUKJib5NRQGmJm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(83380400001)(110136005)(66574015)(6666004)(6506007)(8936002)(7406005)(5660300002)(38100700002)(66476007)(66946007)(86362001)(26005)(66556008)(53546011)(186003)(7416002)(6486002)(36756003)(2616005)(8676002)(6512007)(31686004)(4326008)(31696002)(2906002)(921005)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0pPUFVQVUgyMjFNaVg2cE5QdUJjWG5Xb3FTOUlsNUhlRjVkMSsyRGM0NTNr?=
 =?utf-8?B?TU8xbURXdlZSRXh2TnhlanJramY2R0V2VDIvR2VzVnVqTlRLbWdkMTlFVnhp?=
 =?utf-8?B?OG44WGpBd0pRaHd5eXhTZmFHL0M4UUM0ZWtJVzFuSEUwQVZnT0d6QWFQYlc0?=
 =?utf-8?B?U1BsbkxtUytQV2hyaGtXVUdDY1FlQ1AwZTRvTDRkdENETGZtZ1Vwd0JvZFBU?=
 =?utf-8?B?emw4MUhDZmNhTWE3R3BwUVg1RzJ6bnQzejdhMG15MTNvcU9FWTAxdEJ1bkVl?=
 =?utf-8?B?TVlsb1pYTnlvYmtqTE5kK3lDU2Fld2lZSm15UkgzdmFEMmFkeEJLTUdoN255?=
 =?utf-8?B?TFR4TWRwSkw4cysyOXFTUUxsWTFrMndXTWxiajVJdmdwN3ZpNWVEZ0pubzkx?=
 =?utf-8?B?dHMxR0hidHZUKzlZbm1UZC9LOFFNQUJrdW80dnY3Q2dQK1F6NS82NHN5bVZs?=
 =?utf-8?B?RTFYWm5HOXN5SzB1Vjkyb2NHQVkxMWRkNU5jM2l5eU1NMVhUSWRFTkhHZ3Ra?=
 =?utf-8?B?dVBtRFJNbGt2RitTV1laQnBtdnkreGdRd0JocFFaVDlHSTFnMEpiMFVBUWoz?=
 =?utf-8?B?Mk14TkVXZDNoQlY1OXNYMGtQR09ZM29uTVdyVUJMeHp0MW0zMXlCdVphZ3do?=
 =?utf-8?B?dnBraTliZTZUMitDR0ZsUnF4ZE9VRy9vUzgwL1R3UVhMdi9OeXNhallkbTNK?=
 =?utf-8?B?eWl1b1pIREJrandSd21WeVd6VmhQTE9MaWJqZFA2eUlKNkltWi8vV1ZMRlpj?=
 =?utf-8?B?NmxvbXVEL0EvRW5NWlMzYWNyM2t4YTh0MmEwZE5MS0xsNVVVU0tqUGNIV2Zy?=
 =?utf-8?B?SlhNZldFaWN5eE01Vit3c2pMYlpxV09ZcExOcXpPYjltdDZwVGozT2FKSkpu?=
 =?utf-8?B?d3dnYTIrZVlmRXZPeklEYUg1Y21TUFE1ZTJEUGJabWE4NnpmMFNXeE9zTlhI?=
 =?utf-8?B?ZVY0cjBaeTMzalRYR2MyZisrRkNmL05BMEIrWXJxTlB0SzEwVEZPdi9TQW53?=
 =?utf-8?B?NkNnU1h2elNBcHBrRExlRzBSTVZPOW85Y2pEWE02NE9wTEg1bFhOL1ZvZ2Mv?=
 =?utf-8?B?Z0JIdnQ5Sld1OW53U0R5YTY2R294Y0ZrQTVERWl2QWJ5MVFMVHYzcXcrUk96?=
 =?utf-8?B?eEtTM3NPRzBmRGxNTk5ub2NrYUF1azRhS09LM0hEaSs0ZENZbVozWXBmR0t1?=
 =?utf-8?B?NE9RbDJzRDQxRkxHWDRSWHBDOFdyVkZXejJqZ2RHeHAySTFRL1pSTHlnWGhY?=
 =?utf-8?B?WExMYjBsRlpXTWNMTFZGUXdRMCswNjVHQU4zT2Rta2Y0YklUN0YvYVlVb0ti?=
 =?utf-8?B?VGVLY3YrNCtCVEFVbEJNb1h3YXJRMGZESERmS0w5ZFNWRTJXTTJKdy9WZi9x?=
 =?utf-8?B?VVU2VG1hbllJeW9CcFZGSTJNQlV1akJyenBQMThncW4zaTR4dit4KzRVQ3Er?=
 =?utf-8?B?WUlnUy90clRXS2MrNVV3WFBFWis1YWZRTFNUMnlNNWJWNElWaGdGU2hJUUZR?=
 =?utf-8?B?V0RFSCtNRTFnQTVHMEFqSDJMenBzYTluVkZwWlRmR1VLVWpXRkQxWmFUVEdk?=
 =?utf-8?B?ZmpnakorY0puZ2lKQ0JjVE4wSzMySVNTL0dBK0pFN0ZTWmM2YmVnNVZyLzNy?=
 =?utf-8?B?Q09zbUR5cjZtMXI4M1JmMlV0eWdFZTBrd1VZR0ZRbnZObkxjRHM3Q1pqWml1?=
 =?utf-8?B?d2E4czZZbjFwWFBaZ3VjWW1vWmYrOWFCNDdraEVqV3pFOTVqeThSbTdrcHpo?=
 =?utf-8?B?emVDNmd1MXJIZHd1MkplZGVJY001cSs4ZHFSaTg4ZHl4OS9zOVJMa0Q4dVNt?=
 =?utf-8?B?dnRFUUVnbkJCNkRaUFFKdGFuMTd2c0ZpSHdMLzN1MTUrUTJkdlVxY0V3SFFv?=
 =?utf-8?B?UHhaWlZUN1ZWQ3pmanYyVWc2eUo2by9qbDBnYm42YTRFQVM1TjdhMVM0M05P?=
 =?utf-8?B?M1RIQ1k1VE5MbUdhSHIyanBSdENHYTUwMWtTMjN0VndqVUl4REZBanV2V1hN?=
 =?utf-8?B?MzlueVd0dGZzM3M1MERRWlMyUStwTHpGbDczZ2JWMHhsd3NsaE93OTAyd2lW?=
 =?utf-8?B?WVFRdkJSdHpMSmxMWHZSYkw0ajZOWm5tRURiRnF4SWU3SUdNZ05VRDhCcWlF?=
 =?utf-8?B?Y0xycnVtejF1MXZWZ0p4Yzljem9KTzhJOXdMR3pLc1VMUEpwYjFYK0M0ZnA3?=
 =?utf-8?B?b2QycFAxTmJQUHRtRFcwcVM3dUFmUjgvamVsenVjM0pXb2lvSHJBMFA2RXBu?=
 =?utf-8?B?dS81TFRDK3ltdW1WSDF4b0x3K1lvNHZ5Zk40cEdRNCtSeGVFN2Z5cjBWQjZZ?=
 =?utf-8?B?eUVSU1c4eUErVUZwdVJlVXV4R1hxdElUOXJ1UEZyTHR4VEg2djdiQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ffce7a-8d23-4703-3cdb-08da42421776
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 13:41:25.6964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKlBf/nVEJ1X9nxM5Oz0JjeCcNh0J4+oP26sfpG5+KmhP4Sme4vWuenl2MB9dIje
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2441
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

Am 30.05.22 um 15:26 schrieb Dmitry Osipenko:
> Hello Christian,
>
> On 5/30/22 09:50, Christian König wrote:
>> Hi Dmitry,
>>
>> First of all please separate out this patch from the rest of the series,
>> since this is a complex separate structural change.
> I assume all the patches will go via the DRM tree in the end since the
> rest of the DRM patches in this series depend on this dma-buf change.
> But I see that separation may ease reviewing of the dma-buf changes, so
> let's try it.

That sounds like you are underestimating a bit how much trouble this 
will be.

>> I have tried this before and failed because catching all the locks in
>> the right code paths are very tricky. So expect some fallout from this
>> and make sure the kernel test robot and CI systems are clean.
> Sure, I'll fix up all the reported things in the next iteration.
>
> BTW, have you ever posted yours version of the patch? Will be great if
> we could compare the changed code paths.

No, I never even finished creating it after realizing how much work it 
would be.

>>> This patch introduces new locking convention for dma-buf users. From now
>>> on all dma-buf importers are responsible for holding dma-buf reservation
>>> lock around operations performed over dma-bufs.
>>>
>>> This patch implements the new dma-buf locking convention by:
>>>
>>>     1. Making dma-buf API functions to take the reservation lock.
>>>
>>>     2. Adding new locked variants of the dma-buf API functions for drivers
>>>        that need to manage imported dma-bufs under the held lock.
>> Instead of adding new locked variants please mark all variants which
>> expect to be called without a lock with an _unlocked postfix.
>>
>> This should make it easier to remove those in a follow up patch set and
>> then fully move the locking into the importer.
> Do we really want to move all the locks to the importers? Seems the
> majority of drivers should be happy with the dma-buf helpers handling
> the locking for them.

Yes, I clearly think so.

>
>>>     3. Converting all drivers to the new locking scheme.
>> I have strong doubts that you got all of them. At least radeon and
>> nouveau should grab the reservation lock in their ->attach callbacks
>> somehow.
> Radeon and Nouveau use gem_prime_import_sg_table() and they take resv
> lock already, seems they should be okay (?)

You are looking at the wrong side. You need to fix the export code path, 
not the import ones.

See for example attach on radeon works like this 
drm_gem_map_attach->drm_gem_pin->radeon_gem_prime_pin->radeon_bo_reserve->ttm_bo_reserve->dma_resv_lock.

Same for nouveau and probably a few other exporters as well. That will 
certainly cause a deadlock if you don't fix it.

I strongly suggest to do this step by step, first attach/detach and then 
the rest.

Regards,
Christian.

>
> I assume all the basics should covered in this v6. At minimum Intel,
> Tegra, Panfrost, Lima and Rockchip drivers should be good. If I missed
> something, then please let me know and I'll correct it.
>
>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>> ---
>>>    drivers/dma-buf/dma-buf.c                     | 270 +++++++++++-------
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   6 +-
>>>    drivers/gpu/drm/drm_client.c                  |   4 +-
>>>    drivers/gpu/drm/drm_gem.c                     |  33 +++
>>>    drivers/gpu/drm/drm_gem_framebuffer_helper.c  |   6 +-
>>>    drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  10 +-
>>>    drivers/gpu/drm/qxl/qxl_object.c              |  17 +-
>>>    drivers/gpu/drm/qxl/qxl_prime.c               |   4 +-
>>>    .../common/videobuf2/videobuf2-dma-contig.c   |  11 +-
>>>    .../media/common/videobuf2/videobuf2-dma-sg.c |  11 +-
>>>    .../common/videobuf2/videobuf2-vmalloc.c      |  11 +-
>>>    include/drm/drm_gem.h                         |   3 +
>>>    include/linux/dma-buf.h                       |  14 +-
>>>    13 files changed, 241 insertions(+), 159 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index 32f55640890c..64a9909ccfa2 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -552,7 +552,6 @@ struct dma_buf *dma_buf_export(const struct
>>> dma_buf_export_info *exp_info)
>>>        file->f_mode |= FMODE_LSEEK;
>>>        dmabuf->file = file;
>>>    -    mutex_init(&dmabuf->lock);
>> Please make removing dmabuf->lock a separate change.
> Alright
>

