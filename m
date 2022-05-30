Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA01537477
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 08:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C51D10EF02;
	Mon, 30 May 2022 06:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2075.outbound.protection.outlook.com [40.107.101.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EC310F1DB;
 Mon, 30 May 2022 06:50:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDxxDdSK9rdhIq1nz9tK0tVTrU4pKp4T9WaDpO+9TL2089c5SFo6PrHRndBwlkohtj655ZWX6pOSj7RtQlroG/SIq4O5C2ZSmDKWXypK7Xs5YnVv8CEZVyl+rKqYGkSh3ekphyuy3dWvLMIzm9UpQXmkc+VyDG3Uda/OTWbtprx2P7uubiQuaIVcZgxsNnAlBE7jZXCog5r8ZDOqxTqrCw5L0jaODZIK52mWmUmMcM5g10/sJg1A0B1ddqjtJBVrdDxIYz1j4+sAMQGHBX49uv+gOQ4gpD4CYp/VjeZwZW6DzApNqIxjSuULPkGRQxkaPa2G7DgCZgduc1eQJaGFWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1XiM7r3jU6j8DNIQSNM8E4H5AKVslAsVRwj8uINKek=;
 b=F6udbZEQ/4yXcCspzHuPzs0Ug5A6Do1LFpkkfaeAt8cFpWSvSlm9vcMSrdOoFkqKmJpX6sTMAUcaiokKHH6q2D+Xzzo52spoadzHhZtNX7Lj6V6uOI4fUOIcd7AEZeYemsiPiwfZ4+0ve36bVC4RjsXhatGi7sRjhtBmbhT+QGcie03h45cxVmxCgDdGj1WVWImsG5H4IzY0SgEnMYzH9XpdQ3demD+wXARGpnRgH7xcF2fpMz2aTeb7K07ndrHQ53mgVLT3KZAglJ96vyjfEh3/YS7W8mV2sO+7lzjZnkZv+FkRunOvw92mT5LZl15BfP+WnDLynCA8MdP3i1didQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1XiM7r3jU6j8DNIQSNM8E4H5AKVslAsVRwj8uINKek=;
 b=tOcZ2EFvpWGd+VkGT2lkOITze7W9O/3DdPvZNSAIJNwJ6yMMrKxMmEodLP0jkhzp4Ml5kdtfb3G8UWUhxT4VNG0+mERDOghkarjAH4G6xX4HKBK8TGASgMxPb+nt9S1861u6SHo1Hxzt7cuotX+IYUId+3yYm2x0iO7WKh2ii74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL0PR12MB4868.namprd12.prod.outlook.com (2603:10b6:208:1c4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 06:50:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 06:50:22 +0000
Message-ID: <0a02a31d-a256-4ca4-0e35-e2ea1868a8ae@amd.com>
Date: Mon, 30 May 2022 08:50:11 +0200
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220526235040.678984-15-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0377.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d30d45f8-1742-471e-a50c-08da4208aaab
X-MS-TrafficTypeDiagnostic: BL0PR12MB4868:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB4868AC1D0356C9902B48DB6283DD9@BL0PR12MB4868.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eIEetrfYbBViWQiOO32xQFYqH6Ll/GGetPsdxsH7Bl8Ug6QhwyCDaEbkRcA0p4eLDbZCbmVpMUBw7FJGoAdbSnvvrME8pkvw0uh4sxjKGumPi2ukFi51WFbqIdwJ3Ovfv5ZfNvvH8iyyq8NKnnnbzAtIC4dPb4vrlZIhDkAqKsbH29whRN2yDqMiKwrvNYEm/6/PaMmw4EvV665vRysyrjSez5nfo09pPozX8Cju74X0KIeyjU/C4H9sp76TRvWcTvqsQ/gNy1ppefDn3QZL1YJFQ3LAr3ugXeTP4LZUkdHNgFOrZpFGIbbY5gu/kmYm7GGa9CoCm1DTMFLDTOEQnAeRMgBR59xN8feDAdO0CJv56wg7KZvwOyk2Zc1h09f8A2BdriSCU9DwnFPU1QuaV1ZdhliZ1Aq2AgGXWRUneu0q+0hFjS541/XmSr3fGf3CER1B5WwC9GS5t4FQ0f7XYHhR9honZfZmP9Q49TFVN7N7aCWtZsPK615ju4ZZ8zcm+dPYSyEZXEYgJEQkGt2IQujkQMvhqZ6hA0zD5qxdzMZvfwyVAm9GTbREoQ5eRORP1jm8FCJgMaYzG0xHPUSHWiUv6YV35Y8OvE+9tDrKsmw8H3L6vFXT4qCX8YF4v43KD7rLNFVhpWNYt7fOv8sA4Tu3h4nAUxePQtLJ6nUp+x2u4HuZlxFblCC9koCSVA8smRsY0zPC9PHUbWtnHjGF0cVEpRYw47Wpf/+/sVm2/9WcG8N0/Cuz7swYikVYIh8oJIVmyGuL+XbVvXT/SGakog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(83380400001)(6486002)(110136005)(316002)(36756003)(66476007)(66556008)(4326008)(66946007)(31686004)(6506007)(31696002)(8676002)(8936002)(921005)(38100700002)(86362001)(6512007)(186003)(2616005)(30864003)(6666004)(2906002)(7416002)(7406005)(5660300002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0U4dkJHenE4b0RTbG9zeG5KNDdxalRvRWtZY2hJM1BXYlRaTW83SnFkT3Er?=
 =?utf-8?B?NXhuNHZGaGgxTFhnTmo1S05WSVYyVU9PZm9vL2JMNmVrRkVFS3R4V1pGYWg4?=
 =?utf-8?B?OUdoaVBDSHQzTStVc2oyRThWdnZ1cUR5RjBtdFkyOVFqa2dJdXVOdTdZM0Nn?=
 =?utf-8?B?ZlFHN01qMERQWXlMWm53RlJHZTdqeVdUQ2RnaVVGTktBTlBsdVJ5ZkgvYmRv?=
 =?utf-8?B?STdYWTBZcUhwM2tGU0ZpcU1uWWdEUVpiREZmaEhtdnVZU2dEVTU4MDkzbTRH?=
 =?utf-8?B?NmVBNkk4T3c5NWM1Z1JTd0ZVNWI0TnJ6RDFFWmZxcGlVeURRQ0NoeXdrTHJ3?=
 =?utf-8?B?NW92ZlRNKzFHRGkwQkNIMHNDM3Z2K0lQYzZWdWRUdDkwWmFaUFFSc3BwZmFs?=
 =?utf-8?B?S1hMT1RsMGx5MUhaS0R4ZEh2R3FPaXR4ckNkdFpJcFM3QmZYQjYwbkUxallJ?=
 =?utf-8?B?ajlya2RvdU9aU2JsaVFzN1FPWEcxdHdaeE0wTEk4NHFYQ21pM0lNYXVTcDFV?=
 =?utf-8?B?OGFIck1EaStWeWZ2cW1IdWVUdXFaRHoyYzh2Wk9rY0IrNHNsMjVGVFIxQmNN?=
 =?utf-8?B?YWliYWwzek4vMXZuL0RralFtRnFWeFdZQmdmMmVFVkJXL1EwSXJaVlozVE5P?=
 =?utf-8?B?SVNCZW1ha3FDa3Bva2VhVGJmdjA5QU9qTVkxdm1YNkxCRUNzdW9KVVhrei83?=
 =?utf-8?B?UXRRdGYvQ3EzL2N3bVRUMTlIQ2ZVOXNVZHo3b0RFWlZ2NnV5L0cyb2gvOUh6?=
 =?utf-8?B?NmdIRDRuVG9SQ0FRdmlVdHljZVhNbHF5V2gwSnY4WXF4MkZ3Z3ljUWg5c2NY?=
 =?utf-8?B?djdodUV4OUJBRTU3a29zeW1vS0VPTyt5WFJiUW1EYWczNW5HaWNTVXIveVVo?=
 =?utf-8?B?M1FQS1lMZGJPTkhSUGQyemFJMWVWb3lvNUFVd1lOeGRESEpwTnYrUWF2OGNt?=
 =?utf-8?B?QnRpdWpsdGpUdzRLRXZzUjUvbjRTZG53VnBSL0JLQnBqL2J0UzVnVXA1RHU1?=
 =?utf-8?B?eEIrWmoyMVpGUXA2bEtsakZBblg0T1NKVmxlNDNpWVdTMHlmcW8zV1M2OFFq?=
 =?utf-8?B?WjJjbHRmWmpXZDFvRE9oN1FtTmEwSmo4VVc5blNSRFNZRUt0TFp5K1Ara1FV?=
 =?utf-8?B?eEhlZEhML3dlUjJpWXNjbStyelB5ZTk5dXRsTTBFYzVYak9vQS9ORjEzMW1x?=
 =?utf-8?B?R0tXTkI4K3h4VXkzYkhwbGNYODNSNE9GKzFpbWFmSC9ZTFhpRmF3Ui9ZeXUx?=
 =?utf-8?B?WHBvQ2l4VkEyM0Z1c1FNM2hsNHQzSXJEWHFvQUpsS2RCRVE5enBMQzRHa1hZ?=
 =?utf-8?B?SEF4ZHJ4d1ZjY2R3a21Hd3VNY0NpZzVOUXMyQ0IvVlF3VHJkNlhKc0VDc0hL?=
 =?utf-8?B?QTc4K0ZQejczQURhQVhsR3VObkc5SlFZYWVuSFFOZUhscGtaQkk0ZHRZR05X?=
 =?utf-8?B?Ym0xNVhKaCtuckNYZys5cmN4bWRCVC83cVZBVTJzekN6UzFIbmNyNEU4RzJy?=
 =?utf-8?B?dmI2RHdwT2N4YzN3Y1g5bG9nd1JUcHhUOHhMSTVKazVXQ2dLSjZhNmNzSkRE?=
 =?utf-8?B?b0dqUGYzZ0lTNWJRNDV3bURaVy9OcG5wTWh5YUc4azBLaTVFOE9RdFhMLzlz?=
 =?utf-8?B?Y0wwWE0vdm9UQU5mdVgwdmlZbHVkZ21ZcEdoVEN1NGZTS1prZ1dQVThwVENO?=
 =?utf-8?B?c3RrMEtWbER0KzJRWDdLN0o2MXJNMVRrdDVGcnBscWxRYlo4WEV0TURGNklz?=
 =?utf-8?B?QVVyeWJPc05yNzZHeTBzcW42c28ySnhDLzZNdENLYWZpcHc2SXM5SEI1SHdV?=
 =?utf-8?B?YVFXR2lQOHlYazdmUS9KSFBRS1VUemMzZk1QYjVpcFNiOTUwdzI3NjByc1FU?=
 =?utf-8?B?S3FaQXc2bTlKV2NqcWgvSytRVXY4NUxLL0RHS1YzOUpXbnFRWnJxbUc3SHFi?=
 =?utf-8?B?WEIzQWZwYkoyMzBBbFV3MXNtS1g5cjZLMGF4NnlsbEo2eDBPbG1zUXNEM3Zo?=
 =?utf-8?B?Qmg2WHRUd2hNNklZT1lzNCt0Q0NQNkVkUGprZGVVeEQ5NUQ1YUZYNURyVzNI?=
 =?utf-8?B?VGFPRk54Nk1rR3JJL3M3bHhnVVhsOHhYQ25jcE1Ma0pEWVhhYWtueFlSZTVT?=
 =?utf-8?B?NFZYaDBPTzUvT0V6YkFPeHhzM1ozMXJlMjh0dGQzYmdzM2xEYzNFZENxbmVK?=
 =?utf-8?B?RkFabVpnRzl0ait5MjF0OVc4cS83ZTFHbTROcXR3ZmV2Y1FQM0d1cjVISkFX?=
 =?utf-8?B?NThaY1FXbzROcXFZbGplWnRtMlVVa2R3eWphZEZDT2dqMGhEUmduSFhPYkZu?=
 =?utf-8?B?NUhIb3VlMVRZN01FVXJhSGFXbmYyTWl6MStwQm5KTEpUbVRxRVlhUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d30d45f8-1742-471e-a50c-08da4208aaab
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 06:50:21.9706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LoB1pxQFMK6fgd88TPer72/DGkXJ2E/32A1z8Wrtamjlxujkwtj9UXSj6fR1PvjX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4868
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

First of all please separate out this patch from the rest of the series, 
since this is a complex separate structural change.

Am 27.05.22 um 01:50 schrieb Dmitry Osipenko:
> All dma-bufs have dma-reservation lock that allows drivers to perform
> exclusive operations over shared dma-bufs. Today's dma-buf API has
> incomplete locking specification, which creates dead lock situation
> for dma-buf importers and exporters that don't coordinate theirs locks.

Well please drop that sentence. The locking specifications are actually 
very well defined, it's just that some drivers are a bit broken 
regarding them.

What you do here is rather moving all the non-dynamic drivers over to 
the dynamic locking specification (which is really nice to have).

I have tried this before and failed because catching all the locks in 
the right code paths are very tricky. So expect some fallout from this 
and make sure the kernel test robot and CI systems are clean.

> This patch introduces new locking convention for dma-buf users. From now
> on all dma-buf importers are responsible for holding dma-buf reservation
> lock around operations performed over dma-bufs.
>
> This patch implements the new dma-buf locking convention by:
>
>    1. Making dma-buf API functions to take the reservation lock.
>
>    2. Adding new locked variants of the dma-buf API functions for drivers
>       that need to manage imported dma-bufs under the held lock.

Instead of adding new locked variants please mark all variants which 
expect to be called without a lock with an _unlocked postfix.

This should make it easier to remove those in a follow up patch set and 
then fully move the locking into the importer.

>    3. Converting all drivers to the new locking scheme.

I have strong doubts that you got all of them. At least radeon and 
nouveau should grab the reservation lock in their ->attach callbacks 
somehow.

>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>   drivers/dma-buf/dma-buf.c                     | 270 +++++++++++-------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   6 +-
>   drivers/gpu/drm/drm_client.c                  |   4 +-
>   drivers/gpu/drm/drm_gem.c                     |  33 +++
>   drivers/gpu/drm/drm_gem_framebuffer_helper.c  |   6 +-
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  10 +-
>   drivers/gpu/drm/qxl/qxl_object.c              |  17 +-
>   drivers/gpu/drm/qxl/qxl_prime.c               |   4 +-
>   .../common/videobuf2/videobuf2-dma-contig.c   |  11 +-
>   .../media/common/videobuf2/videobuf2-dma-sg.c |  11 +-
>   .../common/videobuf2/videobuf2-vmalloc.c      |  11 +-
>   include/drm/drm_gem.h                         |   3 +
>   include/linux/dma-buf.h                       |  14 +-
>   13 files changed, 241 insertions(+), 159 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 32f55640890c..64a9909ccfa2 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -552,7 +552,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>   	file->f_mode |= FMODE_LSEEK;
>   	dmabuf->file = file;
>   
> -	mutex_init(&dmabuf->lock);

Please make removing dmabuf->lock a separate change.

Regards,
Christian.

>   	INIT_LIST_HEAD(&dmabuf->attachments);
>   
>   	mutex_lock(&db_list.lock);
> @@ -737,14 +736,14 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   	attach->importer_ops = importer_ops;
>   	attach->importer_priv = importer_priv;  3. Converting all drivers to the new locking scheme.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>   drivers/dma-buf/dma-buf.c                     | 270 +++++++++++-------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   6 +-
>   drivers/gpu/drm/drm_client.c                  |   4 +-
>
>   
> +	dma_resv_lock(dmabuf->resv, NULL);
> +
>   	if (dmabuf->ops->attach) {
>   		ret = dmabuf->ops->attach(dmabuf, attach);
>   		if (ret)
>   			goto err_attach;
>   	}
> -	dma_resv_lock(dmabuf->resv, NULL);
>   	list_add(&attach->node, &dmabuf->attachments);
> -	dma_resv_unlock(dmabuf->resv);
>   
>   	/* When either the importer or the exporter can't handle dynamic
>   	 * mappings we cache the mapping here to avoid issues with the
> @@ -755,7 +754,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   		struct sg_table *sgt;
>   
>   		if (dma_buf_is_dynamic(attach->dmabuf)) {
> -			dma_resv_lock(attach->dmabuf->resv, NULL);
>   			ret = dmabuf->ops->pin(attach);
>   			if (ret)
>   				goto err_unlock;
> @@ -768,15 +766,16 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   			ret = PTR_ERR(sgt);
>   			goto err_unpin;
>   		}
> -		if (dma_buf_is_dynamic(attach->dmabuf))
> -			dma_resv_unlock(attach->dmabuf->resv);
>   		attach->sgt = sgt;
>   		attach->dir = DMA_BIDIRECTIONAL;
>   	}
>   
> +	dma_resv_unlock(dmabuf->resv);
> +
>   	return attach;
>   
>   err_attach:
> +	dma_resv_unlock(attach->dmabuf->resv);
>   	kfree(attach);
>   	return ERR_PTR(ret);
>   
> @@ -785,10 +784,10 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   		dmabuf->ops->unpin(attach);
>   
>   err_unlock:
> -	if (dma_buf_is_dynamic(attach->dmabuf))
> -		dma_resv_unlock(attach->dmabuf->resv);
> +	dma_resv_unlock(dmabuf->resv);
>   
>   	dma_buf_detach(dmabuf, attach);
> +
>   	return ERR_PTR(ret);
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, DMA_BUF);
> @@ -832,24 +831,23 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>   	if (WARN_ON(!dmabuf || !attach))
>   		return;
>   
> -	if (attach->sgt) {
> -		if (dma_buf_is_dynamic(attach->dmabuf))
> -			dma_resv_lock(attach->dmabuf->resv, NULL);
> +	if (WARN_ON(dmabuf != attach->dmabuf))
> +		return;
>   
> +	dma_resv_lock(dmabuf->resv, NULL);
> +
> +	if (attach->sgt) {
>   		__unmap_dma_buf(attach, attach->sgt, attach->dir);
>   
> -		if (dma_buf_is_dynamic(attach->dmabuf)) {
> +		if (dma_buf_is_dynamic(attach->dmabuf))
>   			dmabuf->ops->unpin(attach);
> -			dma_resv_unlock(attach->dmabuf->resv);
> -		}
>   	}
>   
> -	dma_resv_lock(dmabuf->resv, NULL);
>   	list_del(&attach->node);
> -	dma_resv_unlock(dmabuf->resv);
>   	if (dmabuf->ops->detach)
>   		dmabuf->ops->detach(dmabuf, attach);
>   
> +	dma_resv_unlock(dmabuf->resv);
>   	kfree(attach);
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_detach, DMA_BUF);
> @@ -906,28 +904,18 @@ void dma_buf_unpin(struct dma_buf_attachment *attach)
>   EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, DMA_BUF);
>   
>   /**
> - * dma_buf_map_attachment - Returns the scatterlist table of the attachment;
> + * dma_buf_map_attachment_locked - Returns the scatterlist table of the attachment;
>    * mapped into _device_ address space. Is a wrapper for map_dma_buf() of the
>    * dma_buf_ops.
>    * @attach:	[in]	attachment whose scatterlist is to be returned
>    * @direction:	[in]	direction of DMA transfer
>    *
> - * Returns sg_table containing the scatterlist to be returned; returns ERR_PTR
> - * on error. May return -EINTR if it is interrupted by a signal.
> - *
> - * On success, the DMA addresses and lengths in the returned scatterlist are
> - * PAGE_SIZE aligned.
> - *
> - * A mapping must be unmapped by using dma_buf_unmap_attachment(). Note that
> - * the underlying backing storage is pinned for as long as a mapping exists,
> - * therefore users/importers should not hold onto a mapping for undue amounts of
> - * time.
> + * Locked variant of dma_buf_map_attachment().
>    *
> - * Important: Dynamic importers must wait for the exclusive fence of the struct
> - * dma_resv attached to the DMA-BUF first.
> + * Caller is responsible for holding dmabuf's reservation lock.
>    */
> -struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
> -					enum dma_data_direction direction)
> +struct sg_table *dma_buf_map_attachment_locked(struct dma_buf_attachment *attach,
> +					       enum dma_data_direction direction)
>   {
>   	struct sg_table *sg_table;
>   	int r;
> @@ -937,8 +925,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   	if (WARN_ON(!attach || !attach->dmabuf))
>   		return ERR_PTR(-EINVAL);
>   
> -	if (dma_buf_attachment_is_dynamic(attach))
> -		dma_resv_assert_held(attach->dmabuf->resv);
> +	dma_resv_assert_held(attach->dmabuf->resv);
>   
>   	if (attach->sgt) {
>   		/*
> @@ -953,7 +940,6 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   	}
>   
>   	if (dma_buf_is_dynamic(attach->dmabuf)) {
> -		dma_resv_assert_held(attach->dmabuf->resv);
>   		if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
>   			r = attach->dmabuf->ops->pin(attach);
>   			if (r)
> @@ -993,42 +979,101 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   #endif /* CONFIG_DMA_API_DEBUG */
>   	return sg_table;
>   }
> -EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment, DMA_BUF);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment_locked, DMA_BUF);
>   
>   /**
> - * dma_buf_unmap_attachment - unmaps and decreases usecount of the buffer;might
> - * deallocate the scatterlist associated. Is a wrapper for unmap_dma_buf() of
> + * dma_buf_map_attachment - Returns the scatterlist table of the attachment;
> + * mapped into _device_ address space. Is a wrapper for map_dma_buf() of the
>    * dma_buf_ops.
> - * @attach:	[in]	attachment to unmap buffer from
> - * @sg_table:	[in]	scatterlist info of the buffer to unmap
> - * @direction:  [in]    direction of DMA transfer
> + * @attach:	[in]	attachment whose scatterlist is to be returned
> + * @direction:	[in]	direction of DMA transfer
>    *
> - * This unmaps a DMA mapping for @attached obtained by dma_buf_map_attachment().
> + * Returns sg_table containing the scatterlist to be returned; returns ERR_PTR
> + * on error. May return -EINTR if it is interrupted by a signal.
> + *
> + * On success, the DMA addresses and lengths in the returned scatterlist are
> + * PAGE_SIZE aligned.
> + *
> + * A mapping must be unmapped by using dma_buf_unmap_attachment(). Note that
> + * the underlying backing storage is pinned for as long as a mapping exists,
> + * therefore users/importers should not hold onto a mapping for undue amounts of
> + * time.
> + *
> + * Important: Dynamic importers must wait for the exclusive fence of the struct
> + * dma_resv attached to the DMA-BUF first.
>    */
> -void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
> -				struct sg_table *sg_table,
> +struct sg_table *
> +dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   				enum dma_data_direction direction)
>   {
> +	struct sg_table *sg_table;
> +
>   	might_sleep();
>   
> -	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
> -		return;
> +	if (WARN_ON(!attach || !attach->dmabuf))
> +		return ERR_PTR(-EINVAL);
> +
> +	dma_resv_lock(attach->dmabuf->resv, NULL);
> +	sg_table = dma_buf_map_attachment_locked(attach, direction);
> +	dma_resv_unlock(attach->dmabuf->resv);
>   
> -	if (dma_buf_attachment_is_dynamic(attach))
> -		dma_resv_assert_held(attach->dmabuf->resv);
> +	return sg_table;
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment, DMA_BUF);
> +
> +/**
> + * dma_buf_unmap_attachment_locked - Returns the scatterlist table of the attachment;
> + * mapped into _device_ address space. Is a wrapper for map_dma_buf() of the
> + * dma_buf_ops.
> + * @attach:	[in]	attachment whose scatterlist is to be returned
> + * @direction:	[in]	direction of DMA transfer
> + *
> + * Locked variant of dma_buf_unmap_attachment().
> + *
> + * Caller is responsible for holding dmabuf's reservation lock.
> + */
> +void dma_buf_unmap_attachment_locked(struct dma_buf_attachment *attach,
> +				     struct sg_table *sg_table,
> +				     enum dma_data_direction direction)
> +{
> +	might_sleep();
> +
> +	dma_resv_assert_held(attach->dmabuf->resv);
>   
>   	if (attach->sgt == sg_table)
>   		return;
>   
> -	if (dma_buf_is_dynamic(attach->dmabuf))
> -		dma_resv_assert_held(attach->dmabuf->resv);
> -
>   	__unmap_dma_buf(attach, sg_table, direction);
>   
>   	if (dma_buf_is_dynamic(attach->dmabuf) &&
>   	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
>   		dma_buf_unpin(attach);
>   }
> +EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_locked, DMA_BUF);
> +
> +/**
> + * dma_buf_unmap_attachment - unmaps and decreases usecount of the buffer;might
> + * deallocate the scatterlist associated. Is a wrapper for unmap_dma_buf() of
> + * dma_buf_ops.
> + * @attach:	[in]	attachment to unmap buffer from
> + * @sg_table:	[in]	scatterlist info of the buffer to unmap
> + * @direction:  [in]    direction of DMA transfer
> + *
> + * This unmaps a DMA mapping for @attached obtained by dma_buf_map_attachment().
> + */
> +void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
> +			      struct sg_table *sg_table,
> +			      enum dma_data_direction direction)
> +{
> +	might_sleep();
> +
> +	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
> +		return;
> +
> +	dma_resv_lock(attach->dmabuf->resv, NULL);
> +	dma_buf_unmap_attachment_locked(attach, sg_table, direction);
> +	dma_resv_unlock(attach->dmabuf->resv);
> +}
>   EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, DMA_BUF);
>   
>   /**
> @@ -1224,6 +1269,31 @@ int dma_buf_end_cpu_access(struct dma_buf *dmabuf,
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_end_cpu_access, DMA_BUF);
>   
> +static int dma_buf_mmap_locked(struct dma_buf *dmabuf,
> +			       struct vm_area_struct *vma,
> +			       unsigned long pgoff)
> +{
> +	dma_resv_assert_held(dmabuf->resv);
> +
> +	/* check if buffer supports mmap */
> +	if (!dmabuf->ops->mmap)
> +		return -EINVAL;
> +
> +	/* check for offset overflow */
> +	if (pgoff + vma_pages(vma) < pgoff)
> +		return -EOVERFLOW;
> +
> +	/* check for overflowing the buffer's size */
> +	if (pgoff + vma_pages(vma) >
> +	    dmabuf->size >> PAGE_SHIFT)
> +		return -EINVAL;
> +
> +	/* readjust the vma */
> +	vma_set_file(vma, dmabuf->file);
> +	vma->vm_pgoff = pgoff;
> +
> +	return dmabuf->ops->mmap(dmabuf, vma);
> +}
>   
>   /**
>    * dma_buf_mmap - Setup up a userspace mmap with the given vma
> @@ -1242,29 +1312,46 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_end_cpu_access, DMA_BUF);
>   int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>   		 unsigned long pgoff)
>   {
> +	int ret;
> +
>   	if (WARN_ON(!dmabuf || !vma))
>   		return -EINVAL;
>   
> -	/* check if buffer supports mmap */
> -	if (!dmabuf->ops->mmap)
> -		return -EINVAL;
> +	dma_resv_lock(dmabuf->resv, NULL);
> +	ret = dma_buf_mmap_locked(dmabuf, vma, pgoff);
> +	dma_resv_unlock(dmabuf->resv);
>   
> -	/* check for offset overflow */
> -	if (pgoff + vma_pages(vma) < pgoff)
> -		return -EOVERFLOW;
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
>   
> -	/* check for overflowing the buffer's size */
> -	if (pgoff + vma_pages(vma) >
> -	    dmabuf->size >> PAGE_SHIFT)
> -		return -EINVAL;
> +static int dma_buf_vmap_locked(struct dma_buf *dmabuf, struct iosys_map *map)
> +{
> +	struct iosys_map ptr;
> +	int ret;
>   
> -	/* readjust the vma */
> -	vma_set_file(vma, dmabuf->file);
> -	vma->vm_pgoff = pgoff;
> +	dma_resv_assert_held(dmabuf->resv);
>   
> -	return dmabuf->ops->mmap(dmabuf, vma);
> +	if (dmabuf->vmapping_counter) {
> +		dmabuf->vmapping_counter++;
> +		BUG_ON(iosys_map_is_null(&dmabuf->vmap_ptr));
> +		*map = dmabuf->vmap_ptr;
> +		return ret;
> +	}
> +
> +	BUG_ON(iosys_map_is_set(&dmabuf->vmap_ptr));
> +
> +	ret = dmabuf->ops->vmap(dmabuf, &ptr);
> +	if (WARN_ON_ONCE(ret))
> +		return ret;
> +
> +	dmabuf->vmap_ptr = ptr;
> +	dmabuf->vmapping_counter = 1;
> +
> +	*map = dmabuf->vmap_ptr;
> +
> +	return 0;
>   }
> -EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
>   
>   /**
>    * dma_buf_vmap - Create virtual mapping for the buffer object into kernel
> @@ -1284,8 +1371,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
>    */
>   int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>   {
> -	struct iosys_map ptr;
> -	int ret = 0;
> +	int ret;
>   
>   	iosys_map_clear(map);
>   
> @@ -1295,52 +1381,40 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>   	if (!dmabuf->ops->vmap)
>   		return -EINVAL;
>   
> -	mutex_lock(&dmabuf->lock);
> -	if (dmabuf->vmapping_counter) {
> -		dmabuf->vmapping_counter++;
> -		BUG_ON(iosys_map_is_null(&dmabuf->vmap_ptr));
> -		*map = dmabuf->vmap_ptr;
> -		goto out_unlock;
> -	}
> -
> -	BUG_ON(iosys_map_is_set(&dmabuf->vmap_ptr));
> -
> -	ret = dmabuf->ops->vmap(dmabuf, &ptr);
> -	if (WARN_ON_ONCE(ret))
> -		goto out_unlock;
> -
> -	dmabuf->vmap_ptr = ptr;
> -	dmabuf->vmapping_counter = 1;
> -
> -	*map = dmabuf->vmap_ptr;
> +	dma_resv_lock(dmabuf->resv, NULL);
> +	ret = dma_buf_vmap_locked(dmabuf, map);
> +	dma_resv_unlock(dmabuf->resv);
>   
> -out_unlock:
> -	mutex_unlock(&dmabuf->lock);
>   	return ret;
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_vmap, DMA_BUF);
>   
> -/**
> - * dma_buf_vunmap - Unmap a vmap obtained by dma_buf_vmap.
> - * @dmabuf:	[in]	buffer to vunmap
> - * @map:	[in]	vmap pointer to vunmap
> - */
> -void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
> +static void dma_buf_vunmap_locked(struct dma_buf *dmabuf, struct iosys_map *map)
>   {
> -	if (WARN_ON(!dmabuf))
> -		return;
> -
>   	BUG_ON(iosys_map_is_null(&dmabuf->vmap_ptr));
>   	BUG_ON(dmabuf->vmapping_counter == 0);
>   	BUG_ON(!iosys_map_is_equal(&dmabuf->vmap_ptr, map));
>   
> -	mutex_lock(&dmabuf->lock);
>   	if (--dmabuf->vmapping_counter == 0) {
>   		if (dmabuf->ops->vunmap)
>   			dmabuf->ops->vunmap(dmabuf, map);
>   		iosys_map_clear(&dmabuf->vmap_ptr);
>   	}
> -	mutex_unlock(&dmabuf->lock);
> +}
> +
> +/**
> + * dma_buf_vunmap - Unmap a vmap obtained by dma_buf_vmap.
> + * @dmabuf:	[in]	buffer to vunmap
> + * @map:	[in]	vmap pointer to vunmap
> + */
> +void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
> +{
> +	if (WARN_ON(!dmabuf))
> +		return;
> +
> +	dma_resv_lock(dmabuf->resv, NULL);
> +	dma_buf_vunmap_locked(dmabuf, map);
> +	dma_resv_unlock(dmabuf->resv);
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap, DMA_BUF);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index be6f76a30ac6..b704bdf5601a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -882,7 +882,8 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>   			struct sg_table *sgt;
>   
>   			attach = gtt->gobj->import_attach;
> -			sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
> +			sgt = dma_buf_map_attachment_locked(attach,
> +							    DMA_BIDIRECTIONAL);
>   			if (IS_ERR(sgt))
>   				return PTR_ERR(sgt);
>   
> @@ -1007,7 +1008,8 @@ static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
>   		struct dma_buf_attachment *attach;
>   
>   		attach = gtt->gobj->import_attach;
> -		dma_buf_unmap_attachment(attach, ttm->sg, DMA_BIDIRECTIONAL);
> +		dma_buf_unmap_attachment_locked(attach, ttm->sg,
> +						DMA_BIDIRECTIONAL);
>   		ttm->sg = NULL;
>   	}
>   
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index af3b7395bf69..e9a1cd310352 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -323,7 +323,7 @@ drm_client_buffer_vmap(struct drm_client_buffer *buffer,
>   	 * fd_install step out of the driver backend hooks, to make that
>   	 * final step optional for internal users.
>   	 */
> -	ret = drm_gem_vmap(buffer->gem, map);
> +	ret = drm_gem_vmap_unlocked(buffer->gem, map);
>   	if (ret)
>   		return ret;
>   
> @@ -345,7 +345,7 @@ void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
>   {
>   	struct iosys_map *map = &buffer->map;
>   
> -	drm_gem_vunmap(buffer->gem, map);
> +	drm_gem_vunmap_unlocked(buffer->gem, map);
>   }
>   EXPORT_SYMBOL(drm_client_buffer_vunmap);
>   
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 7c0b025508e4..c61674887582 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1053,7 +1053,12 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
>   	vma->vm_ops = obj->funcs->vm_ops;
>   
>   	if (obj->funcs->mmap) {
> +		ret = dma_resv_lock_interruptible(obj->resv, NULL);
> +		if (ret)
> +			goto err_drm_gem_object_put;
> +
>   		ret = obj->funcs->mmap(obj, vma);
> +		dma_resv_unlock(obj->resv);
>   		if (ret)
>   			goto err_drm_gem_object_put;
>   		WARN_ON(!(vma->vm_flags & VM_DONTEXPAND));
> @@ -1158,6 +1163,8 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
>   
>   int drm_gem_pin(struct drm_gem_object *obj)
>   {
> +	dma_resv_assert_held(obj->resv);
> +
>   	if (obj->funcs->pin)
>   		return obj->funcs->pin(obj);
>   	else
> @@ -1166,6 +1173,8 @@ int drm_gem_pin(struct drm_gem_object *obj)
>   
>   void drm_gem_unpin(struct drm_gem_object *obj)
>   {
> +	dma_resv_assert_held(obj->resv);
> +
>   	if (obj->funcs->unpin)
>   		obj->funcs->unpin(obj);
>   }
> @@ -1174,6 +1183,8 @@ int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
>   {
>   	int ret;
>   
> +	dma_resv_assert_held(obj->resv);
> +
>   	if (!obj->funcs->vmap)
>   		return -EOPNOTSUPP;
>   
> @@ -1189,6 +1200,8 @@ EXPORT_SYMBOL(drm_gem_vmap);
>   
>   void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
>   {
> +	dma_resv_assert_held(obj->resv);
> +
>   	if (iosys_map_is_null(map))
>   		return;
>   
> @@ -1200,6 +1213,26 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
>   }
>   EXPORT_SYMBOL(drm_gem_vunmap);
>   
> +int drm_gem_vmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map)
> +{
> +	int ret;
> +
> +	dma_resv_lock(obj->resv, NULL);
> +	ret = drm_gem_vmap(obj, map);
> +	dma_resv_unlock(obj->resv);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_gem_vmap_unlocked);
> +
> +void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map)
> +{
> +	dma_resv_lock(obj->resv, NULL);
> +	drm_gem_vunmap(obj, map);
> +	dma_resv_unlock(obj->resv);
> +}
> +EXPORT_SYMBOL(drm_gem_vunmap_unlocked);
> +
>   /**
>    * drm_gem_lock_reservations - Sets up the ww context and acquires
>    * the lock on an array of GEM objects.
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index f4619803acd0..a0bff53b158e 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -348,7 +348,7 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb,
>   			iosys_map_clear(&map[i]);
>   			continue;
>   		}
> -		ret = drm_gem_vmap(obj, &map[i]);
> +		ret = drm_gem_vmap_unlocked(obj, &map[i]);
>   		if (ret)
>   			goto err_drm_gem_vunmap;
>   	}
> @@ -370,7 +370,7 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb,
>   		obj = drm_gem_fb_get_obj(fb, i);
>   		if (!obj)
>   			continue;
> -		drm_gem_vunmap(obj, &map[i]);
> +		drm_gem_vunmap_unlocked(obj, &map[i]);
>   	}
>   	return ret;
>   }
> @@ -398,7 +398,7 @@ void drm_gem_fb_vunmap(struct drm_framebuffer *fb,
>   			continue;
>   		if (iosys_map_is_null(&map[i]))
>   			continue;
> -		drm_gem_vunmap(obj, &map[i]);
> +		drm_gem_vunmap_unlocked(obj, &map[i]);
>   	}
>   }
>   EXPORT_SYMBOL(drm_gem_fb_vunmap);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index f5062d0c6333..09502d490da8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -72,7 +72,7 @@ static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf,
>   	struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
>   	void *vaddr;
>   
> -	vaddr = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
> +	vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
>   	if (IS_ERR(vaddr))
>   		return PTR_ERR(vaddr);
>   
> @@ -241,8 +241,8 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
>   
>   	assert_object_held(obj);
>   
> -	pages = dma_buf_map_attachment(obj->base.import_attach,
> -				       DMA_BIDIRECTIONAL);
> +	pages = dma_buf_map_attachment_locked(obj->base.import_attach,
> +					      DMA_BIDIRECTIONAL);
>   	if (IS_ERR(pages))
>   		return PTR_ERR(pages);
>   
> @@ -270,8 +270,8 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
>   static void i915_gem_object_put_pages_dmabuf(struct drm_i915_gem_object *obj,
>   					     struct sg_table *pages)
>   {
> -	dma_buf_unmap_attachment(obj->base.import_attach, pages,
> -				 DMA_BIDIRECTIONAL);
> +	dma_buf_unmap_attachment_locked(obj->base.import_attach, pages,
> +					DMA_BIDIRECTIONAL);
>   }
>   
>   static const struct drm_i915_gem_object_ops i915_gem_object_dmabuf_ops = {
> diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
> index b42a657e4c2f..a64cd635fbc0 100644
> --- a/drivers/gpu/drm/qxl/qxl_object.c
> +++ b/drivers/gpu/drm/qxl/qxl_object.c
> @@ -168,9 +168,16 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map)
>   		bo->map_count++;
>   		goto out;
>   	}
> -	r = ttm_bo_vmap(&bo->tbo, &bo->map);
> +
> +	r = __qxl_bo_pin(bo);
>   	if (r)
>   		return r;
> +
> +	r = ttm_bo_vmap(&bo->tbo, &bo->map);
> +	if (r) {
> +		__qxl_bo_unpin(bo);
> +		return r;
> +	}
>   	bo->map_count = 1;
>   
>   	/* TODO: Remove kptr in favor of map everywhere. */
> @@ -192,12 +199,6 @@ int qxl_bo_vmap(struct qxl_bo *bo, struct iosys_map *map)
>   	if (r)
>   		return r;
>   
> -	r = __qxl_bo_pin(bo);
> -	if (r) {
> -		qxl_bo_unreserve(bo);
> -		return r;
> -	}
> -
>   	r = qxl_bo_vmap_locked(bo, map);
>   	qxl_bo_unreserve(bo);
>   	return r;
> @@ -247,6 +248,7 @@ void qxl_bo_vunmap_locked(struct qxl_bo *bo)
>   		return;
>   	bo->kptr = NULL;
>   	ttm_bo_vunmap(&bo->tbo, &bo->map);
> +	__qxl_bo_unpin(bo);
>   }
>   
>   int qxl_bo_vunmap(struct qxl_bo *bo)
> @@ -258,7 +260,6 @@ int qxl_bo_vunmap(struct qxl_bo *bo)
>   		return r;
>   
>   	qxl_bo_vunmap_locked(bo);
> -	__qxl_bo_unpin(bo);
>   	qxl_bo_unreserve(bo);
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_prime.c
> index 142d01415acb..9169c26357d3 100644
> --- a/drivers/gpu/drm/qxl/qxl_prime.c
> +++ b/drivers/gpu/drm/qxl/qxl_prime.c
> @@ -59,7 +59,7 @@ int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
>   	struct qxl_bo *bo = gem_to_qxl_bo(obj);
>   	int ret;
>   
> -	ret = qxl_bo_vmap(bo, map);
> +	ret = qxl_bo_vmap_locked(bo, map);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -71,5 +71,5 @@ void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
>   {
>   	struct qxl_bo *bo = gem_to_qxl_bo(obj);
>   
> -	qxl_bo_vunmap(bo);
> +	qxl_bo_vunmap_locked(bo);
>   }
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 678b359717c4..617062076370 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -382,18 +382,12 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
>   	struct dma_buf_attachment *db_attach, enum dma_data_direction dma_dir)
>   {
>   	struct vb2_dc_attachment *attach = db_attach->priv;
> -	/* stealing dmabuf mutex to serialize map/unmap operations */
> -	struct mutex *lock = &db_attach->dmabuf->lock;
>   	struct sg_table *sgt;
>   
> -	mutex_lock(lock);
> -
>   	sgt = &attach->sgt;
>   	/* return previously mapped sg table */
> -	if (attach->dma_dir == dma_dir) {
> -		mutex_unlock(lock);
> +	if (attach->dma_dir == dma_dir)
>   		return sgt;
> -	}
>   
>   	/* release any previous cache */
>   	if (attach->dma_dir != DMA_NONE) {
> @@ -409,14 +403,11 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
>   	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir,
>   			    DMA_ATTR_SKIP_CPU_SYNC)) {
>   		pr_err("failed to map scatterlist\n");
> -		mutex_unlock(lock);
>   		return ERR_PTR(-EIO);
>   	}
>   
>   	attach->dma_dir = dma_dir;
>   
> -	mutex_unlock(lock);
> -
>   	return sgt;
>   }
>   
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index fa69158a65b1..d2075e7078cd 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -424,18 +424,12 @@ static struct sg_table *vb2_dma_sg_dmabuf_ops_map(
>   	struct dma_buf_attachment *db_attach, enum dma_data_direction dma_dir)
>   {
>   	struct vb2_dma_sg_attachment *attach = db_attach->priv;
> -	/* stealing dmabuf mutex to serialize map/unmap operations */
> -	struct mutex *lock = &db_attach->dmabuf->lock;
>   	struct sg_table *sgt;
>   
> -	mutex_lock(lock);
> -
>   	sgt = &attach->sgt;
>   	/* return previously mapped sg table */
> -	if (attach->dma_dir == dma_dir) {
> -		mutex_unlock(lock);
> +	if (attach->dma_dir == dma_dir)
>   		return sgt;
> -	}
>   
>   	/* release any previous cache */
>   	if (attach->dma_dir != DMA_NONE) {
> @@ -446,14 +440,11 @@ static struct sg_table *vb2_dma_sg_dmabuf_ops_map(
>   	/* mapping to the client with new direction */
>   	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
>   		pr_err("failed to map scatterlist\n");
> -		mutex_unlock(lock);
>   		return ERR_PTR(-EIO);
>   	}
>   
>   	attach->dma_dir = dma_dir;
>   
> -	mutex_unlock(lock);
> -
>   	return sgt;
>   }
>   
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> index 948152f1596b..3d00a7f0aac1 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -267,18 +267,12 @@ static struct sg_table *vb2_vmalloc_dmabuf_ops_map(
>   	struct dma_buf_attachment *db_attach, enum dma_data_direction dma_dir)
>   {
>   	struct vb2_vmalloc_attachment *attach = db_attach->priv;
> -	/* stealing dmabuf mutex to serialize map/unmap operations */
> -	struct mutex *lock = &db_attach->dmabuf->lock;
>   	struct sg_table *sgt;
>   
> -	mutex_lock(lock);
> -
>   	sgt = &attach->sgt;
>   	/* return previously mapped sg table */
> -	if (attach->dma_dir == dma_dir) {
> -		mutex_unlock(lock);
> +	if (attach->dma_dir == dma_dir)
>   		return sgt;
> -	}
>   
>   	/* release any previous cache */
>   	if (attach->dma_dir != DMA_NONE) {
> @@ -289,14 +283,11 @@ static struct sg_table *vb2_vmalloc_dmabuf_ops_map(
>   	/* mapping to the client with new direction */
>   	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
>   		pr_err("failed to map scatterlist\n");
> -		mutex_unlock(lock);
>   		return ERR_PTR(-EIO);
>   	}
>   
>   	attach->dma_dir = dma_dir;
>   
> -	mutex_unlock(lock);
> -
>   	return sgt;
>   }
>   
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 9d7c61a122dc..0b427939f466 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -410,4 +410,7 @@ void drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
>   int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
>   			    u32 handle, u64 *offset);
>   
> +int drm_gem_vmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map);
> +void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map);
> +
>   #endif /* __DRM_GEM_H__ */
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 71731796c8c3..23698c6b1d1e 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -326,15 +326,6 @@ struct dma_buf {
>   	/** @ops: dma_buf_ops associated with this buffer object. */
>   	const struct dma_buf_ops *ops;
>   
> -	/**
> -	 * @lock:
> -	 *
> -	 * Used internally to serialize list manipulation, attach/detach and
> -	 * vmap/unmap. Note that in many cases this is superseeded by
> -	 * dma_resv_lock() on @resv.
> -	 */
> -	struct mutex lock;
> -
>   	/**
>   	 * @vmapping_counter:
>   	 *
> @@ -618,6 +609,11 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags);
>   struct dma_buf *dma_buf_get(int fd);
>   void dma_buf_put(struct dma_buf *dmabuf);
>   
> +struct sg_table *dma_buf_map_attachment_locked(struct dma_buf_attachment *,
> +					       enum dma_data_direction);
> +void dma_buf_unmap_attachment_locked(struct dma_buf_attachment *,
> +				     struct sg_table *,
> +				     enum dma_data_direction);
>   struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *,
>   					enum dma_data_direction);
>   void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct sg_table *,

