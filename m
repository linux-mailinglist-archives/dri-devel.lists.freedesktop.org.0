Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD12E4ACB23
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 22:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B7210F91E;
	Mon,  7 Feb 2022 21:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB52E10F904;
 Mon,  7 Feb 2022 21:19:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZ6YtKuDtUjnGLhA3rysnPZIpbfRIxuEg/4EB0jlOxktmdjOkRSHJf3Dq+ahI6B9P5JEsakXiFupGV9747x9BBoh/rXAZ4JSIIdm7678VfWunlM2f5ijJ4qaK7WieHWyWb9s10jMrStS0C/nyLV3GZB6ptDx9/SShhHRwF+piauNKaymy0P5E/jpMVflOHXXbOysSP1um0YxsZjrqlPphHdG/1L3tRWEI8vBZJWW8wIDaSfeFvJ+JTTCuTKcOi4pDg4QTuOOMcAx7TAqB9i19huyLpJIQ37pV4+60Wya+drckRK53bKW0mZqZOeFFttyaySEwx5bI0zUZNwlJOkEuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdTLTDt99eDVa++Z5iH9r+SNIk6aNNfYsy5ueSrK5Zc=;
 b=CvEVcBAN26eKA+q9TdzdpR82deHs7ohIzf8J1ysCUOo0A7kBuWWMO4FDWQvjuEO5Zew8DsEia0XTgGk2kW1fB/0BDp8WA6lOk7aoNEBj7mVY5bKhOdWC+XNRbc1PB5NHQQurGCsGaX6fdH5qmUlPdJXDAgepGyohle2yQPV5CIF5GQZZ1dPpTtcRXgcn/LWjqS6YP9KIpOwbL1IlcuntYrxL9Ox+BmP80KBFaOgC6wIowo/RRznsHw4WExGUt4axhoZsxvjE+MeQ8pei3cVBHiOE9uuDWfSRLfKK4bYsXvPv3jdiAGy+7CNJUI6iGvKrCY+yFZK6Uqe8vjYpgN47Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdTLTDt99eDVa++Z5iH9r+SNIk6aNNfYsy5ueSrK5Zc=;
 b=TUoqQoOG5HKdIpeBpD5xa0ftbd7u05yhc85ItYCB7e9ObF1jFou3GF1xLPLBbK0Qa98/dgRFe62lZ/vV6xBff5Ggv0HTSu08FjkuZPizg1gNCYIlpjpNiAzap8jK9NgZgn/YIXhedBYegxRw8QgWD8TqV0NXwfndw0iL634RN3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MWHPR12MB1776.namprd12.prod.outlook.com (2603:10b6:300:113::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 21:19:31 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%8]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 21:19:31 +0000
Message-ID: <3287da2f-defa-9adb-e21c-c498972e674d@amd.com>
Date: Mon, 7 Feb 2022 16:19:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 6/8] mm: don't include <linux/memremap.h> in <linux/mm.h>
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Andrew Morton
 <akpm@linux-foundation.org>, Dan Williams <dan.j.williams@intel.com>
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-7-hch@lst.de>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220207063249.1833066-7-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::30) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4a84fe0-231b-4598-4e53-08d9ea7f87be
X-MS-TrafficTypeDiagnostic: MWHPR12MB1776:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1776E2FDC7EA1C5FB68178B5922C9@MWHPR12MB1776.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ywv86SR9WAtdng9B1Vr6miNH4FTFFdWV9AKD4DJ9BiEmGBtZeEh3tt0oh0qz5/Hp3xYJlHthXLSHTvEihqcFEVPDpTrFwHSWYVMKUuuSvgwPurxxsZwunYPNZamLNGo10FIOT+qYY8bEWwZq4IzhMQO+rDGr8N6hzF4Bw+XvDMnofzXzgoHjS6taOTpArkgO2SKhUJAPkvTy0lvD3rBZZx221Ra8YUNeLhkG9vCom/pFyyNjPq8uXQ9Q7BlV3tG2hcVqFEYqpMYbhfSCnCmvLiwvxohnFXJUz5q680vHNl5xgNsRExAEipRMPXezA9aKebHu8g4HklmG6B8ERpnxwJqgXs9pRNU8EOhtQtZOKqwT1EuiGJmlSbvfzaeblBRWIqVptUZTVB/h50TC0C/A5pYoG3WamaywBbNYHU6VFbESbBZXJ+L0CCmp+T2J5e0PJUfxwUPVIbqyIdSteIMzYasCnbH8xpOsSxUVm9dWd0Sh5U+n4l6dsD9GMkbSXsQUMf2ChzO7HQ1HM+lJoJYB5f0RXPdJpL1CvXSXboxh7GixEncuVINT1O9GhTC1ctTZCFj5LNeMEzFXQWxAF7/Yz3u/L80NRZfk2p/02Ia6sm4TbcAiRmzxi3EcjM+IyfB0A3suLIyrDdpWDeiRJAQTMGkXc6SS0P7tDzZq8PJexPRNxpxlqsct741tVLEZ1pLhyWDwQyv43wYbQmRlQulgVUh8enAe7aLU8qoHFEXHTDS0l6W8c8wV3DjVNtWXTK24
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66574015)(66476007)(26005)(186003)(8676002)(83380400001)(31686004)(36756003)(66556008)(4326008)(54906003)(110136005)(316002)(8936002)(66946007)(5660300002)(6486002)(6512007)(7416002)(31696002)(6506007)(38100700002)(508600001)(44832011)(2616005)(2906002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW9ocEl0aFZ6bHhraDduU21ndUFzTGdmK21QV1JiMGhIRXh3a0NNUk1oRkp2?=
 =?utf-8?B?cWJxb0d6MmpCcVYyaVI4Wi9URmN1RzNmODZLUlRhcnppRzZKakc3Z0lyNkJt?=
 =?utf-8?B?WDVyVTlESFNoaWI5OWltM1F5Tm5POSsrc2dHVjJQdkZNQ3ZiY0F2cldMUDg0?=
 =?utf-8?B?bEJrdHB5TUxEZ0x3czBJVTB6djA3RU9zUnltaGZWVkxKdUFubHcyT0hRKys4?=
 =?utf-8?B?dUJtZ2tSbkFCWGRvVWY4WEg2clZYV2JHMjJpRm9jcHJubm5jVTJiZUFISGk0?=
 =?utf-8?B?QlhxUlo5c3BpeEJxLzZNa25VYVJUNXlDckZYVnZrMHRjbjNXNmh2emh3TVIr?=
 =?utf-8?B?Z0hWcGxrelhJUkRFR0FobE9NT2xXcWp5V0Z5VlZPS3JNTHYxd1M4eExvME5W?=
 =?utf-8?B?bWlhaTNZc01OMmE1TklycXA0UWZkaVhwUEk0ODZHL0RFWUp1UmdSTUZTbkpQ?=
 =?utf-8?B?RjIxWS9rS1FIc2duQk9qbjN3VFdTeUJNZzRxWlhGZUpvbFhaVUREbzhTWnl0?=
 =?utf-8?B?WnB3Q25XWmtwTysvNTRhdDZiOHkreW56YjY0QUVtRzFFQVVxdUpEQUFYQjdk?=
 =?utf-8?B?N29PYmFXekkwbHc1bDdIUlVTcFdZNm5lTE5LcDZ3b3FraVJTOXhTL0YxZFh5?=
 =?utf-8?B?RXlQUnlGcUUrVTNNbkZBeGloYnZpVmo1WG9ueXd0QWZDZnJvUW4wMElWOXJP?=
 =?utf-8?B?ak00bitCNk5HZDVpQ0hKd0FpYUw5MTZ2WHpXb0dXSmhVYXJHMm9DL1E2Z2hm?=
 =?utf-8?B?Y2M1YVBUajJtZ211WVZkYTVwRU1zV1BTNEtCU0hVVTdsTUxackxmNkk0b3Na?=
 =?utf-8?B?YlpnRTNna3JMdmtwdVJ2TVJzbkI1dFZSY2tKdFJnMGRWd3RGNHYyTDhkSWhm?=
 =?utf-8?B?UGZhSXlITDlldG5KbGVRbTkwa2pGN2FSbkFXWE9YYlhURm1yYnJaMWJTMnNG?=
 =?utf-8?B?NjQ1d1U0QUFQZktqTFhRMEIvZVZGSy9rZUlQdVh2SlBrOHZHcnFFc0k4dnZj?=
 =?utf-8?B?c0pZbUEyOWZrZTBhVTFyUXFqcVUrekRoOTdPYUpOWXZtRnIwbGdhZkorRWVS?=
 =?utf-8?B?ODNKN2h2WU0rbkhHSU5iMHlxVEszcWYxSGNoM1Z5VC94YXhEbGlmWmNqUHQ1?=
 =?utf-8?B?aWNMMXRYMW5kM0trTCtRbXZLQ2pCbU1QYzYvNS82WDlTYkxqeXpFYVdaTzJF?=
 =?utf-8?B?Y3Z1eGd0dEh6VFBqS281VXo0VnZUYXhvcHZUYytXM29jVUtMekwrR0RXYTlE?=
 =?utf-8?B?eXNvRU5sS3dxUm1aNGNqNWdjdmkvWVRGYittaFgzZiszYUIxeUVQVXBLQzJV?=
 =?utf-8?B?bkp0M3R4ZTgzZTRNVWllNjhiYkpnOWJMdTVmWTYralY2YVpLRk5XUm5hT0Yw?=
 =?utf-8?B?VlJSOXArV01pUlZGMFJpSi9SVmpoREo2Njh6anNOcENYWm1NOEJWVDlFNE4v?=
 =?utf-8?B?T0dBajY1U2NTaForMlhJZE5mNjBSSGw1L0VBbUxpbHdkd3VYd0ZVZFBzeUho?=
 =?utf-8?B?TXR0V0t4bXBqZHhlVEgzeDhMaEF0cE5GVUtIbmJmU0RuZURmblllL1JQZndC?=
 =?utf-8?B?R2dhWmJOWmNCL0RZWGVCaFFnQTJnZ0paU3liU0docHFtWkhiUE9XdGRyM2Rk?=
 =?utf-8?B?eUoxdkJycTZyQ0lTcVJuMVJreDhTc2tBanU4UkFHWG5yUlQycmtEQkU4aUF0?=
 =?utf-8?B?ZTZUUGoxYTIzZ1pvR3pPNG9kdGo2bHhYSWJwaVZqcVRDWEdsM0N6aFJvdGJ2?=
 =?utf-8?B?WHdDK1JSd0lwR0sxa1p1TDl5Z3lnWGtXUUxBVU9NdzJVYmQ3NlZFSmhGVzRB?=
 =?utf-8?B?MjAyVnBOS3BWR0V2TWRhMjZ4WFhheER0N1lsVGJSZWNPdkdDNmthWG5MSWNS?=
 =?utf-8?B?cGN5UUFoZGQ5UUlIa0ljcDRWeUd5bEJzME03aXhPZEVSditlTFhmd2I2dStt?=
 =?utf-8?B?TEs2RHVKT0VBcXFLdjRZSjB5SUVoeVd2Y1Y4d2lYR1RNLzBjclc3bC9vOXJ2?=
 =?utf-8?B?U0xkcDhYV3V5TDM4SVRFbVBwamY2aHZvcWNlSkhpWkF5WUNaYWY2VlRHYVJs?=
 =?utf-8?B?OWQ4WVRDdHRKeHJnMUhYSkVjN1A5OUV4NXFobUpNU09kbkxoc2ZqUnEvZnJQ?=
 =?utf-8?B?WkJtVy9oQXFDNGRpeUp0RjdtVHdsdndsS1NsQWhKa01XdGRJcFZiZjdXcUZs?=
 =?utf-8?Q?KPsS9mZfO8MYHsbvr/kirvA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a84fe0-231b-4598-4e53-08d9ea7f87be
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 21:19:31.1121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zPO0TBl+3C3l8SLbGp/6FpTuHGuKSAp6rLAUNAI+8pFJZTnQRGOKLETQz2I+QhdcxEk9Rxc2j4iiihUE5QcMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1776
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Karol Herbst <kherbst@redhat.com>,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-02-07 um 01:32 schrieb Christoph Hellwig:
> Move the check for the actual pgmap types that need the free at refcount
> one behavior into the out of line helper, and thus avoid the need to
> pull memremap.h into mm.h.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

The amdkfd part looks good to me.

It looks like this patch is not based on Alex Sierra's coherent memory 
series. He added two new helpers is_device_coherent_page and 
is_dev_private_or_coherent_page that would need to be moved along with 
is_device_private_page and is_pci_p2pdma_page.

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   arch/arm64/mm/mmu.c                    |  1 +
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h  |  1 +
>   drivers/gpu/drm/drm_cache.c            |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_dmem.c |  1 +
>   drivers/gpu/drm/nouveau/nouveau_svm.c  |  1 +
>   drivers/infiniband/core/rw.c           |  1 +
>   drivers/nvdimm/pmem.h                  |  1 +
>   drivers/nvme/host/pci.c                |  1 +
>   drivers/nvme/target/io-cmd-bdev.c      |  1 +
>   fs/fuse/virtio_fs.c                    |  1 +
>   include/linux/memremap.h               | 18 ++++++++++++++++++
>   include/linux/mm.h                     | 20 --------------------
>   lib/test_hmm.c                         |  1 +
>   mm/memremap.c                          |  6 +++++-
>   14 files changed, 34 insertions(+), 22 deletions(-)
>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index acfae9b41cc8c9..580abae6c0b93f 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -17,6 +17,7 @@
>   #include <linux/mman.h>
>   #include <linux/nodemask.h>
>   #include <linux/memblock.h>
> +#include <linux/memremap.h>
>   #include <linux/memory.h>
>   #include <linux/fs.h>
>   #include <linux/io.h>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index ea68f3b3a4e9cb..6d643b4b791d87 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -25,6 +25,7 @@
>   
>   #include <linux/hashtable.h>
>   #include <linux/mmu_notifier.h>
> +#include <linux/memremap.h>
>   #include <linux/mutex.h>
>   #include <linux/types.h>
>   #include <linux/atomic.h>
> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
> index f19d9acbe95936..50b8a088f763a6 100644
> --- a/drivers/gpu/drm/drm_cache.c
> +++ b/drivers/gpu/drm/drm_cache.c
> @@ -27,11 +27,11 @@
>   /*
>    * Authors: Thomas Hellström <thomas-at-tungstengraphics-dot-com>
>    */
> -
>   #include <linux/dma-buf-map.h>
>   #include <linux/export.h>
>   #include <linux/highmem.h>
>   #include <linux/cc_platform.h>
> +#include <linux/ioport.h>
>   #include <xen/xen.h>
>   
>   #include <drm/drm_cache.h>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index e886a3b9e08c7d..a5cdfbe32b5e54 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -39,6 +39,7 @@
>   
>   #include <linux/sched/mm.h>
>   #include <linux/hmm.h>
> +#include <linux/memremap.h>
>   #include <linux/migrate.h>
>   
>   /*
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index 266809e511e2c1..090b9b47708cca 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -35,6 +35,7 @@
>   #include <linux/sched/mm.h>
>   #include <linux/sort.h>
>   #include <linux/hmm.h>
> +#include <linux/memremap.h>
>   #include <linux/rmap.h>
>   
>   struct nouveau_svm {
> diff --git a/drivers/infiniband/core/rw.c b/drivers/infiniband/core/rw.c
> index 5a3bd41b331c93..4d98f931a13ddd 100644
> --- a/drivers/infiniband/core/rw.c
> +++ b/drivers/infiniband/core/rw.c
> @@ -2,6 +2,7 @@
>   /*
>    * Copyright (c) 2016 HGST, a Western Digital Company.
>    */
> +#include <linux/memremap.h>
>   #include <linux/moduleparam.h>
>   #include <linux/slab.h>
>   #include <linux/pci-p2pdma.h>
> diff --git a/drivers/nvdimm/pmem.h b/drivers/nvdimm/pmem.h
> index 59cfe13ea8a85c..1f51a23614299b 100644
> --- a/drivers/nvdimm/pmem.h
> +++ b/drivers/nvdimm/pmem.h
> @@ -3,6 +3,7 @@
>   #define __NVDIMM_PMEM_H__
>   #include <linux/page-flags.h>
>   #include <linux/badblocks.h>
> +#include <linux/memremap.h>
>   #include <linux/types.h>
>   #include <linux/pfn_t.h>
>   #include <linux/fs.h>
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index 6a99ed68091589..ab15bc72710dbe 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -15,6 +15,7 @@
>   #include <linux/init.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
> +#include <linux/memremap.h>
>   #include <linux/mm.h>
>   #include <linux/module.h>
>   #include <linux/mutex.h>
> diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
> index 70ca9dfc1771a9..a141446db1bea3 100644
> --- a/drivers/nvme/target/io-cmd-bdev.c
> +++ b/drivers/nvme/target/io-cmd-bdev.c
> @@ -6,6 +6,7 @@
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>   #include <linux/blkdev.h>
>   #include <linux/blk-integrity.h>
> +#include <linux/memremap.h>
>   #include <linux/module.h>
>   #include "nvmet.h"
>   
> diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
> index 9d737904d07c0b..86b7dbb6a0d43e 100644
> --- a/fs/fuse/virtio_fs.c
> +++ b/fs/fuse/virtio_fs.c
> @@ -8,6 +8,7 @@
>   #include <linux/dax.h>
>   #include <linux/pci.h>
>   #include <linux/pfn_t.h>
> +#include <linux/memremap.h>
>   #include <linux/module.h>
>   #include <linux/virtio.h>
>   #include <linux/virtio_fs.h>
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 1fafcc38acbad6..514ab46f597e5c 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -1,6 +1,8 @@
>   /* SPDX-License-Identifier: GPL-2.0 */
>   #ifndef _LINUX_MEMREMAP_H_
>   #define _LINUX_MEMREMAP_H_
> +
> +#include <linux/mm.h>
>   #include <linux/range.h>
>   #include <linux/ioport.h>
>   #include <linux/percpu-refcount.h>
> @@ -129,6 +131,22 @@ static inline unsigned long pgmap_vmemmap_nr(struct dev_pagemap *pgmap)
>   	return 1 << pgmap->vmemmap_shift;
>   }
>   
> +static inline bool is_device_private_page(const struct page *page)
> +{
> +	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
> +		IS_ENABLED(CONFIG_DEVICE_PRIVATE) &&
> +		is_zone_device_page(page) &&
> +		page->pgmap->type == MEMORY_DEVICE_PRIVATE;
> +}
> +
> +static inline bool is_pci_p2pdma_page(const struct page *page)
> +{
> +	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
> +		IS_ENABLED(CONFIG_PCI_P2PDMA) &&
> +		is_zone_device_page(page) &&
> +		page->pgmap->type == MEMORY_DEVICE_PCI_P2PDMA;
> +}
> +
>   #ifdef CONFIG_ZONE_DEVICE
>   void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>   void memunmap_pages(struct dev_pagemap *pgmap);
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 26baadcef4556b..80fccfe31c3444 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -23,7 +23,6 @@
>   #include <linux/err.h>
>   #include <linux/page-flags.h>
>   #include <linux/page_ref.h>
> -#include <linux/memremap.h>
>   #include <linux/overflow.h>
>   #include <linux/sizes.h>
>   #include <linux/sched.h>
> @@ -1101,9 +1100,6 @@ static inline bool put_devmap_managed_page(struct page *page)
>   		return false;
>   	if (!is_zone_device_page(page))
>   		return false;
> -	if (page->pgmap->type != MEMORY_DEVICE_PRIVATE &&
> -	    page->pgmap->type != MEMORY_DEVICE_FS_DAX)
> -		return false;
>   	return __put_devmap_managed_page(page);
>   }
>   
> @@ -1114,22 +1110,6 @@ static inline bool put_devmap_managed_page(struct page *page)
>   }
>   #endif /* CONFIG_DEV_PAGEMAP_OPS */
>   
> -static inline bool is_device_private_page(const struct page *page)
> -{
> -	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
> -		IS_ENABLED(CONFIG_DEVICE_PRIVATE) &&
> -		is_zone_device_page(page) &&
> -		page->pgmap->type == MEMORY_DEVICE_PRIVATE;
> -}
> -
> -static inline bool is_pci_p2pdma_page(const struct page *page)
> -{
> -	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
> -		IS_ENABLED(CONFIG_PCI_P2PDMA) &&
> -		is_zone_device_page(page) &&
> -		page->pgmap->type == MEMORY_DEVICE_PCI_P2PDMA;
> -}
> -
>   /* 127: arbitrary random number, small enough to assemble well */
>   #define folio_ref_zero_or_close_to_overflow(folio) \
>   	((unsigned int) folio_ref_count(folio) + 127u <= 127u)
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 396beee6b061d4..e5fc14ba71f33e 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -12,6 +12,7 @@
>   #include <linux/kernel.h>
>   #include <linux/cdev.h>
>   #include <linux/device.h>
> +#include <linux/memremap.h>
>   #include <linux/mutex.h>
>   #include <linux/rwsem.h>
>   #include <linux/sched.h>
> diff --git a/mm/memremap.c b/mm/memremap.c
> index f41233a67edb12..a0ece2344c2cab 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -4,7 +4,7 @@
>   #include <linux/io.h>
>   #include <linux/kasan.h>
>   #include <linux/memory_hotplug.h>
> -#include <linux/mm.h>
> +#include <linux/memremap.h>
>   #include <linux/pfn_t.h>
>   #include <linux/swap.h>
>   #include <linux/mmzone.h>
> @@ -504,6 +504,10 @@ void free_devmap_managed_page(struct page *page)
>   
>   bool __put_devmap_managed_page(struct page *page)
>   {
> +	if (page->pgmap->type != MEMORY_DEVICE_PRIVATE &&
> +	    page->pgmap->type != MEMORY_DEVICE_FS_DAX)
> +		return false;
> +
>   	/*
>   	 * devmap page refcounts are 1-based, rather than 0-based: if
>   	 * refcount is 1, then the page is free and the refcount is
