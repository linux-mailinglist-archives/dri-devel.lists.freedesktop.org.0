Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353A93ED1CC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 12:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADD489B70;
	Mon, 16 Aug 2021 10:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6381C89B8E;
 Mon, 16 Aug 2021 10:17:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxiMWRAX7lE8ZNsn427H5bfAfwSrVYEfcT8kY4Yqsqi/rg/14imVd0yRiVdb7kvjTDiAms0+kMwqAM6B+n4iYlitBJVV/HnLGr8F4UBjKufvsQvGSpQMISh4Bx3mmJmwvSaMIb4ldd/UCv7X6yQZvUK/j7awrL1ET1lBLUv1qSafeuBX5n2sYmaWloHJmgRf4S9Xxg5VYOF47ITnvlVQLWcI8QGOJJZCWYB4r8dzniwXzH2AWUdxBH3sUlFy9+Gdm6xNF3RSa9zwUGhMVgqM8D+UbrZpyesjD5p42Yl0ZBu5gjUnhOGmiSBmbhqZ/CbYCJ4ySiwhtQNsoCC9bTEtaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXEBcwLpf7AdK9XcvKlAl+Ehs0UK96h11hVkC+RRWjk=;
 b=kML67Fkqd2MDHEkfllBAYE2zRPZnsfAK6vxB+k8RLtVx8HetmGXft8xblXaJ4xDh7JyqwF2Hi4gMIHSrFLIMM6XZRsvEpXfu3jUTkFzl5FoTps+711o8Lw56Kn1/1RVKY+ynDIRzaOkZ3F61Ro8uhkSd6EQfAAVZ8zuDrMTYmdRHo03ArDCWIXWcAriBPo4ZHgVnbwlS0CubjQQbvLbeEx7sLjWanxr1ZlvXwU/29RVM2b2oMNlgFyZj2gASpy0cGQYLG4Q6hkASZgZu18zItgISaIVe+zpIgTQB+nk9SEiM84yEC2XgiCcpg6mgzqLLkh+MtR607+eNfbDRiCtNaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXEBcwLpf7AdK9XcvKlAl+Ehs0UK96h11hVkC+RRWjk=;
 b=j/M5DxgCGVpqGzaq5083xpbWqd8CrZfXThFNm5J9opkGE0rXkn0UN4KohvnxdHmSDXZCu0YaYMJFu4EhJ8/AwOcYRRFHkLfbDBDPk+Y5Ja7WEOsmTlrLR+DRR9Dcml0QGMbBVg96A6zhDa2Dd0KxvlXD0JDAvtOk/TNJzsenaSk=
Authentication-Results: hisilicon.com; dkim=none (message not signed)
 header.d=none;hisilicon.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4535.namprd12.prod.outlook.com (2603:10b6:208:267::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 16 Aug
 2021 10:17:03 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 10:17:03 +0000
Subject: Re: [PATCH v2 0/5] dma-fence: Deadline awareness
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rob Clark <robdclark@chromium.org>, Alex Deucher
 <alexander.deucher@amd.com>, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>, Jack Zhang <Jack.Zhang1@amd.com>,
 Lee Jones <lee.jones@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Steven Price <steven.price@arm.com>,
 Tian Tao <tiantao6@hisilicon.com>
References: <20210807183804.459850-1-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9a7bdcb5-4f6f-539b-060e-d69ec15da874@amd.com>
Date: Mon, 16 Aug 2021 12:16:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210807183804.459850-1-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0268.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7d83:fd8:eb16:8605]
 (2a02:908:1252:fb60:7d83:fd8:eb16:8605) by
 PR0P264CA0268.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13 via Frontend Transport; Mon, 16 Aug 2021 10:16:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 491ff605-d02c-491a-78a9-08d9609efd91
X-MS-TrafficTypeDiagnostic: MN2PR12MB4535:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4535F89108ADFCB9D7A13AAC83FD9@MN2PR12MB4535.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X/mVBiHA8kBV7ZDw8obLGQvZI6KKlf7P0LIyCSeeYw7Efr1Y3i9e3ldfNcorreWhfgHIfAuzAKTXffvcHDbdz/4H0KChnrZVE9TanEcz/zD2iYf3Q1JWKj4GGIcxh9vqkfLhk1n45sagKysfvuOvYronQTnlCf2khWz7x3R30X3AU3GGe/7dbxGHsqD1H/jwZcQgvIw2cvyIsRF7Esr5fd38OJ87ngCUn7IfDb/s5Isb9q+7oLF0Yr+PM5SObRz1Yw6VTG5AxjRxH9GHzf4OOCleDTxtXkbGzNf8obhUnqqDOZUmi4CXDq/PNk0QQlQUcN3ZcfbqLych7YE5cxdmToXp4+oeKSGw9qopJuV2IjRQ/qz5ra4CsyXu0i6GvPHaUdNd0138o3y0kN4eOB15ZfXOgYXnWhFvVajk1svr2BcLdOtOMZ/g4lWtgFfcMcjigBmJ5qSoMPhQDxTZiAmobyovnDW8BeQuaLXW+G4Yo7LlS5yR2A7yI2vACYCvZOisdjDEMWXJUXuYkU7kbFevZLttzXYc6VN1nXeaXd6N5s2oNVKgGaaECKBIw/ZTLcWHNple1+/eQRjitJ4+tbmiJeXmbPa1yRmi0j13990LLq5rYy4gqTQpt/QtrjKCKKMseH4dNKV0u3o9dQYlD933Bvdazidlo3ZLSvwE9PSyNH9jBOZbxoHVT4MSPYkxYODoVcbz6uTa+qDSjIX7cZIJ0G3W5HiGR9Ky+SpMTLhKK2eqv5XSyug75vLH8BI3Y+nI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(86362001)(54906003)(2906002)(31686004)(6486002)(966005)(5660300002)(66556008)(66476007)(2616005)(66946007)(31696002)(316002)(478600001)(36756003)(186003)(8936002)(6666004)(38100700002)(4326008)(7416002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aW9CR0hBN2hQRTVpL0tIenVyMFhDL0VqUE9DMExTbjNqYmpEVmxGR051TUUz?=
 =?utf-8?B?c1lEcnl4K21SemQxMTNnU3lJMEJwZlpoSXB3NDNTSFlnbEpiZ1B1SWhnM3Fk?=
 =?utf-8?B?TGdqZm5xYnRQdDBPcEpGZ2dHWjVWRHpNVUJ2VWdEeEttYmNUOUtCRlNVMVFB?=
 =?utf-8?B?YU94U3lMS0UvR0Qwc1JTUG4vR3p0bWpPZVN0b1c0dENRTG84SzIyaGd4UFR5?=
 =?utf-8?B?aWhKQVdBWlp3b01nT0xjK2ozNUR3R0YzaUo3QjhIVnp1ejRoWEdaN2M3bEpk?=
 =?utf-8?B?bktuN2F1R1gxdnc0Q1I4YzFhVmtWOUdtNTdzQ3lvMWVwSURmMDRYSWxFbzRN?=
 =?utf-8?B?SnQ1Tm1meVBldVVaVUlsVHc0UjhEQTlDS2JQNE5aUEtaZGVWdFIzZ1RDMjRj?=
 =?utf-8?B?RDBROWp0WDc2WXFTUXFyaTFZZlVWU1pCR0tVSzhKUXBqY3RkOS9YZ25EL2ta?=
 =?utf-8?B?NUh1ZEpZbDZmay8xaVgwbU9jZ3Qyc2NzRHVTK0UyUXBOd3YwbjZuclZaelZt?=
 =?utf-8?B?TG5KR3JBa2tqZTJxeVBJN29tb29KY2xiblpURm9OTmc3dmwwbDdnVlc3cTdu?=
 =?utf-8?B?WkFZV0ZMWTB1eUQ1bDJOSWppZnl6V0lNYitDVHd2cG1TT2gxNEFHRTZiMkRN?=
 =?utf-8?B?ekNMT2t2eEpNRlpHZnBWcUZTMHdjeGx0dnU4MjNTVU5KR0dRTjhmNVV2WGZU?=
 =?utf-8?B?M0grdUZSejY0VitiOEplT2JJWTRaajJYcGVmUjZCS1A2c3RLbnB6SURYNjcz?=
 =?utf-8?B?REhVbFJNMkJqU3ZkRnFDV2IrWDNSV2lrd3luaW96bEhJaTZSNzF3dlA4NWZj?=
 =?utf-8?B?azdua2picmZhVkFOZXdES1pFSVBYMDRkY083ei9JRjdIdXQwN3NTMThyVU5E?=
 =?utf-8?B?bTBTRUxDcXdxRHFoeWd4b2MzSkpXNVBHbmFRWmhTZ1JZU2lqWThlcjJCakhv?=
 =?utf-8?B?bm9IWmMrME9FSE1xb291TDVGYmFkcnhvcWhnMTV3WURvbmtZTytuUHloS3Z4?=
 =?utf-8?B?Q0tEd04wdmVueWtNYTVBd1Zac08vMkNzaUdoSjNUTXNhTWE5dm1rbXBYUXdP?=
 =?utf-8?B?d1pIMTNNNnJOYzlrRm8xWjhiWU4yL0x5d0JCMTZiUjBTcDFZWUlySVIvU3ds?=
 =?utf-8?B?N1MvVzVmUmFBZ0dWZWdQUC94RkRTZjNaaEhCMmg2Ukk2UjFkL1FKTXd3akZK?=
 =?utf-8?B?ZzVSemkxQUJuaHpFNzVpTWlza2hnZDdBYXhIZnlIMUluSEpQTlVpTnZXV3li?=
 =?utf-8?B?a0tLZTMyNTBDOTVWMWVOMDJkaHZqY2lhRTlFSlZobllQYjdWN0Z3c1kxa0RG?=
 =?utf-8?B?Si95QVBMR21TSXZidnozMlZWNVVkY0N6cVVURE5CNnBnS2d6aUZqdjR4Q1Bi?=
 =?utf-8?B?eFlmMkFXN21XdG1vQ1dvdXg0UEZCQjUyZVFFTHZOWEU4NzA3WVB4bHp1QTNv?=
 =?utf-8?B?Rnh3Yjl1OVNXbGZJYU1uVmR4ZDQrZVZrZysxVEtVZUN5ZW94cFNtWk5QWXRC?=
 =?utf-8?B?alI2VjU1RWF4S1oyV2RvQWNVMllGaTFLZms2enk5RmVSVWxsY2tnem1RdVVD?=
 =?utf-8?B?amk1TmlUWXR5Y3plbHlYWTZlYmZ6TjRudWNFQ3g2dnJ1cGVuRFR0N3J4Z3l2?=
 =?utf-8?B?aDdwd0ZJZmZqS1FqNTgxZjdsUDJPUGFVTytXYmtLZHp3SnFFVnQzVWxSVzNU?=
 =?utf-8?B?UG1KcjFpSlhBMWpjSnorUmlUWUdmYXhiRk11WkJ0cjVNZnB4TGRlOS9CNFFC?=
 =?utf-8?B?MENQUlgvZGNEQiswaS9Wb3ozU3JsRFRDdkpISHlzYUEyS1BEaUVNNHJ3bDda?=
 =?utf-8?B?ZlpLaGN4OFRFUFZpVTVURy9uNnZSNVhxeXNxWG9VQTBneHdKNjNJYUJKRUNT?=
 =?utf-8?Q?eU/UJDR7KJuqs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 491ff605-d02c-491a-78a9-08d9609efd91
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 10:17:03.1110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVkrkTOemsZ/SC2oZhzPDIui9FKVAA7HpVVtKe7KvEOupLL08/pKHkGzkY7HK2Dm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4535
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

The general approach seems to make sense now I think.

One minor thing which I'm missing is adding support for this to the 
dma_fence_array and dma_fence_chain containers.

Regards,
Christian.

Am 07.08.21 um 20:37 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Based on discussion from a previous series[1] to add a "boost" mechanism
> when, for example, vblank deadlines are missed.  Instead of a boost
> callback, this approach adds a way to set a deadline on the fence, by
> which the waiter would like to see the fence signalled.
>
> I've not yet had a chance to re-work the drm/msm part of this, but
> wanted to send this out as an RFC in case I don't have a chance to
> finish the drm/msm part this week.
>
> Original description:
>
> In some cases, like double-buffered rendering, missing vblanks can
> trick the GPU into running at a lower frequence, when really we
> want to be running at a higher frequency to not miss the vblanks
> in the first place.
>
> This is partially inspired by a trick i915 does, but implemented
> via dma-fence for a couple of reasons:
>
> 1) To continue to be able to use the atomic helpers
> 2) To support cases where display and gpu are different drivers
>
> [1] https://patchwork.freedesktop.org/series/90331/
>
> v1: https://patchwork.freedesktop.org/series/93035/
> v2: Move filtering out of later deadlines to fence implementation
>      to avoid increasing the size of dma_fence
>
> Rob Clark (5):
>    dma-fence: Add deadline awareness
>    drm/vblank: Add helper to get next vblank time
>    drm/atomic-helper: Set fence deadline for vblank
>    drm/scheduler: Add fence deadline support
>    drm/msm: Add deadline based boost support
>
>   drivers/dma-buf/dma-fence.c             | 20 +++++++
>   drivers/gpu/drm/drm_atomic_helper.c     | 36 ++++++++++++
>   drivers/gpu/drm/drm_vblank.c            | 31 ++++++++++
>   drivers/gpu/drm/msm/msm_fence.c         | 76 +++++++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_fence.h         | 20 +++++++
>   drivers/gpu/drm/msm/msm_gpu.h           |  1 +
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 20 +++++++
>   drivers/gpu/drm/scheduler/sched_fence.c | 25 ++++++++
>   drivers/gpu/drm/scheduler/sched_main.c  |  3 +
>   include/drm/drm_vblank.h                |  1 +
>   include/drm/gpu_scheduler.h             |  6 ++
>   include/linux/dma-fence.h               | 16 ++++++
>   12 files changed, 255 insertions(+)
>

