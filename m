Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D825EF3D3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 13:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF9F10E5CF;
	Thu, 29 Sep 2022 11:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C585910E5D8;
 Thu, 29 Sep 2022 11:01:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3jR7C69QNukBSQfCD0XMDxNW04FWvPGBKiz5/wbbE0MWJpVo/WZflNPkN6uwevIwQietocIHoN9sSNtyf0c7H7U2Dkzp0BeDlp5M99BWRYscmHZ4v7IRBAnJw/TgxMvA+p0QJaXsCR0qe9qjQmFS6t/ngE3h7emRj3LcO4+npmVZDDERzGbbkUBoAkcTOQiZADiVTqZBez7SusQU4cJ791vzWuquvIz8bqbBuSTG7HNDZ+oHNzd3jGt4Fn1FlKH7sErFAH7FwegJOc7K64BuTf5tpjmQKsg9prbv7o3fAMSVDCdIfjeDQjycuIhbxIuyKUoYm47cIoTmMvPY7Fitw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJHqDUeC/VW47eCy9EAwMIltMALfpAEdMm5nVJuq23A=;
 b=jLeRI+kL4BCY5EsKrk/Drn3WGAcUBeAk2uc/SNAlqV5+eWqKH0XvCmsYRMV+StxE2ul4lpuYtvAQku+Ybz9oAHkb3qopf2bkss8+ET3y+4+NGaDtcAgu45hhMg7m3Nts4viBMX049PYRPHX3hqTbz/7b1DGr9YHUVtkloIgSo+tke/Gh44kJVHMgbCW+JJlprsWzrdvL4fEl6Y1GhR4CYfCiyEuGQvIAvVKJch7Qe1ecsONtQRqeJV9UcOdG9CEquHU7hZxDChsMzhMXmQRlyUy9h8VOa/DPVSZWknbeZ9ItrVTGw8xgGbd1+wqbo39aCySY+813mAiGv7cuVsawCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJHqDUeC/VW47eCy9EAwMIltMALfpAEdMm5nVJuq23A=;
 b=GGRhLTM69TOP9rW//L940gMp2U9Bkla46egv75vXzkIu7l7/OgT9KWO4YuFHzGF51dqlpWSu8Hs14EbNz0ZfFRoTBd0hmnhVv7xhAJHHIAJKnAsMgCSQRed/2WweI9rPWq1owRYI/CjNIk99mSIaAMgLdm0PCm9oYA7a1pLxGFi735/DzgKVwl7tfZ//mL7xR0/8eH6A/iFSWrwg9gkcIgTFUTeK6xpPtRFP6AP/kaOZmVuOkuNo9+mLj8nHcwiyPq+npe/ZibrcZmrwmqQUxDIWGnRadAxXAdS7u0rGFn0afYoBvmBpOnGICLw7zo046S2f+g3GTtk5wcDcgpWtJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by SA1PR12MB5658.namprd12.prod.outlook.com (2603:10b6:806:235::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 11:01:08 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936%5]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 11:01:07 +0000
References: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
 <a73cf109de0224cfd118d22be58ddebac3ae2897.1664366292.git-series.apopple@nvidia.com>
 <20220928081017.3bf0b67d34a674b0a6df6b0d@linux-foundation.org>
User-agent: mu4e 1.8.10; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 8/8] hmm-tests: Add test for migrate_device_range()
Date: Thu, 29 Sep 2022 21:00:23 +1000
In-reply-to: <20220928081017.3bf0b67d34a674b0a6df6b0d@linux-foundation.org>
Message-ID: <87v8p6igwi.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY2PR01CA0016.ausprd01.prod.outlook.com
 (2603:10c6:1:14::28) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|SA1PR12MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: c87ce34c-07ee-47c4-f4fb-08daa209e8be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hWjNcerQyy/3r+9nOjWy2KrAoZY0VCrelIEL2mFmJG2Ap7LyEWJ7KuCfI1IVXWlT086h8N/aMP4giChehrZpk9YRO1WyKMVEzWm+PhqI5Fpbgt/Loh+sLr2vFn25dY1fG5eDzpOTDw/S8/Q2AdQTD89jjIhHoITDPXcwm0gtRD2Px5SG2wnGe7Fg9WkxCH7csAb/BgNS/XUVVKFNFm4bERshtIG48Isvbn5for6XH/hlq1f0WYOQKHiCXNHUmQwMevwkGgTmHSv4YPGz/DctMJzNc+xRvasu4dzcStMWK7p1GwkI4Zf1rJonJhgKJEh6wmbgYxAWZBBKeRuWmlooAIVaaIbscbJTIS0N3+XwYBkjFxpOPqIJodKICBhYIcGki1Enjd9XhRTQbQvg4uJBOFdAwGimOyX1ouMTMUdpENJvjjF3uuZd+VUuX4cS5aUFVHrW+e7vx6lH6dyyiAKwli7l+hKEIk+EAgzjZO8/WPjemnSuvUrE1Dyl+lBjRHuCD4RjDLCsKMwq5IzXaa9LLntyu1ki7z9iXHlv1BkAPVCtAf6p7z2lFAUvnTcMjVVSVAJL0plqpalEvGvpQsvEUWYtLnmiQSIz4i0Dz+QCgRJiBVbMDaMcPi5tJ37x03I2tKM31VU7DtoJAJ0WPX4kstCefITTaMh9u8nPEnNem66hL/U+6x0vWjSbVTz3qveTnGi6pCWCq68gNaOvM4I68BduT4EbumDM+/2sp5Vux4qEj7zwHK8Ni2UswDuAodqt62+QamxB/4cJyN9V6ao5NZ4HR55NnvZo240y982D8qg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199015)(8936002)(41300700001)(966005)(6486002)(5660300002)(83380400001)(186003)(8676002)(4326008)(66946007)(66476007)(54906003)(38100700002)(478600001)(66556008)(86362001)(6916009)(9686003)(6506007)(26005)(6512007)(6666004)(316002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vPDpQfB5mRQLBTFmElP9tmgwDarrslPMb1MQG2/RDFrvtZlSDqZ1UUtQKLhz?=
 =?us-ascii?Q?PQFUuFXXQkDExdkXmuJ/UPxWMt09qGMg1BctVYK9kWQqIybWabZtRmEJ0SVT?=
 =?us-ascii?Q?2LFGN+mZ4Fv3KvkWDhkMIIpxd4RBCBoYALHkkaU/OfrP3qiUiAfySMyrU23u?=
 =?us-ascii?Q?PW1lKi6+Gtqsd7fmhrUdC/x7JkS2/gpNOY7sbGOvjmvDgxzPzHXNZRSWp2l+?=
 =?us-ascii?Q?FTFMFx0Nsspa8YY1Q+gtNH5ZsjHC9fIVkenKgVXKRHIIaCac53G9E/z9OX0t?=
 =?us-ascii?Q?zMoGu+zEN/5tm9XPlx4fLIiVabSIOraOoybhLCvLRQOACsd99GANzQFY+fO2?=
 =?us-ascii?Q?J5MYWDNltWLIYf8YkFwKWxBriQx1VzTn79IGZgUqjYeoc1PVv/XizToEgM0e?=
 =?us-ascii?Q?DMjEELv1y0kJM8HPMy+IlwXqkQgRfML183VYzCVQh66YVtOKcJhMJrAePrDt?=
 =?us-ascii?Q?i6DC7nJG5UMclSnnn6Pwkf9v/tUDPbnEVsPvM9uWVUtt8SxAHzPdgo2aGeAQ?=
 =?us-ascii?Q?kwZuwoAeAea0LWltc1Ffuzn5olaau7yEP62MDXD9yQy4ZSh8UtqI1qThBEi2?=
 =?us-ascii?Q?LlWzV9ZATvs2CGs/u9hot5dXtjheKJgfNZwp47vH0/ElsodtRYYSErNK6PEx?=
 =?us-ascii?Q?sHP1wL/x+J821BTDIFlWqr0H9t6hojRHgpCH1YW62WkBSN4Sq9WFVB2Rb7yz?=
 =?us-ascii?Q?KJ4p7QFx5aH01vJmmjx/Dzi9HJmBaAZV6PqQAaJ3/kVGIjmShdpSzMS0CsJ2?=
 =?us-ascii?Q?dI8jIJkTQe3VqEbWUARxsbUD79RkrswIdQyIxoEN5LXD7SibEy9gThEIlBQG?=
 =?us-ascii?Q?0cmKdvM/XVHd2R+3iraZpQ8a6C8bi61jWGxD+U43G6EkSNB+4+V/jvAVPneS?=
 =?us-ascii?Q?136xmVs5VoO9Lj0f6ng4G6WzixidNUnj1dO6d5ZauWUyUpRxIj/iENe+TvcL?=
 =?us-ascii?Q?Reuio05/PIB2VqAzHe8b1u6HcokxGyE22CTKj/28uhsQgmvlwhUUEM4KTRiE?=
 =?us-ascii?Q?IglCJ1OI9p5D37NL74w41IOf3YF7DjPSMAgkmM4dQ7jTfYYsBDL7RQzcp922?=
 =?us-ascii?Q?w0d/WgOo3OG20m5x8IV4VAAPr8WZfqdNX58T3if9WsyndmKHRntU2I/A6tWd?=
 =?us-ascii?Q?potQFsf7Cg0OKWJf0nEsSY4yFhGsOhaIcqovZFlQgehGjlaHd4MIPjg0i0/y?=
 =?us-ascii?Q?YYt0jUdASy4RUQ7WB5rih0/rhHbOdcZMrrETDzx0aauCubJM8hOE2aUTfUZq?=
 =?us-ascii?Q?M0tLMBn87lkMqJocDYKSIkIgGSJwV/3Z+5Cf+pbWYS3gWjRiZ8KWyriJn42/?=
 =?us-ascii?Q?6IvXclWzmtbR9wHrtSDNQ6aOWXilz1PJUlmFCDmbWiEmp1hSAmKYzP8HTrhc?=
 =?us-ascii?Q?Arx44bom3qTlmKKjY9/dWLSHhhAr3dvOZAn0dNLyi5fboJ1yHjigGfyg4EDA?=
 =?us-ascii?Q?S6L/pPYfb8vK3NbZTfsd5dYsuA0N2vO99CX9P7ksli+Z7nrdMdYMparqkzjT?=
 =?us-ascii?Q?fJYYY/JdgozBELbK0DNIfJO9mnI5whGt0aiViv3RaNksCr30qvFAHr5dQzi0?=
 =?us-ascii?Q?3IY0OQzi1DbMwWw9d2Jtp6UDYGuGKg9IJ2JCdXJc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c87ce34c-07ee-47c4-f4fb-08daa209e8be
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 11:01:07.3174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnjajFzNNncTqhuh4CCjHcKGCpMnf9stHeDi/t8/mn1AnjbkTuE9InKGDD4x9bTetluhwvXXK8E04T7JczyjxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5658
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
Cc: Alex Sierra <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Andrew Morton <akpm@linux-foundation.org> writes:

> On Wed, 28 Sep 2022 22:01:22 +1000 Alistair Popple <apopple@nvidia.com> wrote:
>
>> @@ -1401,22 +1494,7 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
>>
>>  static void dmirror_device_remove(struct dmirror_device *mdevice)
>>  {
>> -	unsigned int i;
>> -
>> -	if (mdevice->devmem_chunks) {
>> -		for (i = 0; i < mdevice->devmem_count; i++) {
>> -			struct dmirror_chunk *devmem =
>> -				mdevice->devmem_chunks[i];
>> -
>> -			memunmap_pages(&devmem->pagemap);
>> -			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
>> -				release_mem_region(devmem->pagemap.range.start,
>> -						   range_len(&devmem->pagemap.range));
>> -			kfree(devmem);
>> -		}
>> -		kfree(mdevice->devmem_chunks);
>> -	}
>> -
>> +	dmirror_device_remove_chunks(mdevice);
>>  	cdev_del(&mdevice->cdevice);
>>  }
>
> Needed a bit or rework due to
> https://lkml.kernel.org/r/20220826050631.25771-1-mpenttil@redhat.com.
> Please check my resolution.

Thanks. Rework looks good to me.

> --- a/lib/test_hmm.c~hmm-tests-add-test-for-migrate_device_range
> +++ a/lib/test_hmm.c
> @@ -100,6 +100,7 @@ struct dmirror {
>  struct dmirror_chunk {
>  	struct dev_pagemap	pagemap;
>  	struct dmirror_device	*mdevice;
> +	bool remove;
>  };
>
>  /*
> @@ -192,11 +193,15 @@ static int dmirror_fops_release(struct i
>  	return 0;
>  }
>
> +static struct dmirror_chunk *dmirror_page_to_chunk(struct page *page)
> +{
> +	return container_of(page->pgmap, struct dmirror_chunk, pagemap);
> +}
> +
>  static struct dmirror_device *dmirror_page_to_device(struct page *page)
>
>  {
> -	return container_of(page->pgmap, struct dmirror_chunk,
> -			    pagemap)->mdevice;
> +	return dmirror_page_to_chunk(page)->mdevice;
>  }
>
>  static int dmirror_do_fault(struct dmirror *dmirror, struct hmm_range *range)
> @@ -1218,6 +1223,85 @@ static int dmirror_snapshot(struct dmirr
>  	return ret;
>  }
>
> +static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
> +{
> +	unsigned long start_pfn = chunk->pagemap.range.start >> PAGE_SHIFT;
> +	unsigned long end_pfn = chunk->pagemap.range.end >> PAGE_SHIFT;
> +	unsigned long npages = end_pfn - start_pfn + 1;
> +	unsigned long i;
> +	unsigned long *src_pfns;
> +	unsigned long *dst_pfns;
> +
> +	src_pfns = kcalloc(npages, sizeof(*src_pfns), GFP_KERNEL);
> +	dst_pfns = kcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL);
> +
> +	migrate_device_range(src_pfns, start_pfn, npages);
> +	for (i = 0; i < npages; i++) {
> +		struct page *dpage, *spage;
> +
> +		spage = migrate_pfn_to_page(src_pfns[i]);
> +		if (!spage || !(src_pfns[i] & MIGRATE_PFN_MIGRATE))
> +			continue;
> +
> +		if (WARN_ON(!is_device_private_page(spage) &&
> +			    !is_device_coherent_page(spage)))
> +			continue;
> +		spage = BACKING_PAGE(spage);
> +		dpage = alloc_page(GFP_HIGHUSER_MOVABLE | __GFP_NOFAIL);
> +		lock_page(dpage);
> +		copy_highpage(dpage, spage);
> +		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
> +		if (src_pfns[i] & MIGRATE_PFN_WRITE)
> +			dst_pfns[i] |= MIGRATE_PFN_WRITE;
> +	}
> +	migrate_device_pages(src_pfns, dst_pfns, npages);
> +	migrate_device_finalize(src_pfns, dst_pfns, npages);
> +	kfree(src_pfns);
> +	kfree(dst_pfns);
> +}
> +
> +/* Removes free pages from the free list so they can't be re-allocated */
> +static void dmirror_remove_free_pages(struct dmirror_chunk *devmem)
> +{
> +	struct dmirror_device *mdevice = devmem->mdevice;
> +	struct page *page;
> +
> +	for (page = mdevice->free_pages; page; page = page->zone_device_data)
> +		if (dmirror_page_to_chunk(page) == devmem)
> +			mdevice->free_pages = page->zone_device_data;
> +}
> +
> +static void dmirror_device_remove_chunks(struct dmirror_device *mdevice)
> +{
> +	unsigned int i;
> +
> +	mutex_lock(&mdevice->devmem_lock);
> +	if (mdevice->devmem_chunks) {
> +		for (i = 0; i < mdevice->devmem_count; i++) {
> +			struct dmirror_chunk *devmem =
> +				mdevice->devmem_chunks[i];
> +
> +			spin_lock(&mdevice->lock);
> +			devmem->remove = true;
> +			dmirror_remove_free_pages(devmem);
> +			spin_unlock(&mdevice->lock);
> +
> +			dmirror_device_evict_chunk(devmem);
> +			memunmap_pages(&devmem->pagemap);
> +			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
> +				release_mem_region(devmem->pagemap.range.start,
> +						   range_len(&devmem->pagemap.range));
> +			kfree(devmem);
> +		}
> +		mdevice->devmem_count = 0;
> +		mdevice->devmem_capacity = 0;
> +		mdevice->free_pages = NULL;
> +		kfree(mdevice->devmem_chunks);
> +		mdevice->devmem_chunks = NULL;
> +	}
> +	mutex_unlock(&mdevice->devmem_lock);
> +}
> +
>  static long dmirror_fops_unlocked_ioctl(struct file *filp,
>  					unsigned int command,
>  					unsigned long arg)
> @@ -1272,6 +1356,11 @@ static long dmirror_fops_unlocked_ioctl(
>  		ret = dmirror_snapshot(dmirror, &cmd);
>  		break;
>
> +	case HMM_DMIRROR_RELEASE:
> +		dmirror_device_remove_chunks(dmirror->mdevice);
> +		ret = 0;
> +		break;
> +
>  	default:
>  		return -EINVAL;
>  	}
> @@ -1326,9 +1415,13 @@ static void dmirror_devmem_free(struct p
>
>  	mdevice = dmirror_page_to_device(page);
>  	spin_lock(&mdevice->lock);
> -	mdevice->cfree++;
> -	page->zone_device_data = mdevice->free_pages;
> -	mdevice->free_pages = page;
> +
> +	/* Return page to our allocator if not freeing the chunk */
> +	if (!dmirror_page_to_chunk(page)->remove) {
> +		mdevice->cfree++;
> +		page->zone_device_data = mdevice->free_pages;
> +		mdevice->free_pages = page;
> +	}
>  	spin_unlock(&mdevice->lock);
>  }
>
> @@ -1408,22 +1501,7 @@ static int dmirror_device_init(struct dm
>
>  static void dmirror_device_remove(struct dmirror_device *mdevice)
>  {
> -	unsigned int i;
> -
> -	if (mdevice->devmem_chunks) {
> -		for (i = 0; i < mdevice->devmem_count; i++) {
> -			struct dmirror_chunk *devmem =
> -				mdevice->devmem_chunks[i];
> -
> -			memunmap_pages(&devmem->pagemap);
> -			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
> -				release_mem_region(devmem->pagemap.range.start,
> -						   range_len(&devmem->pagemap.range));
> -			kfree(devmem);
> -		}
> -		kfree(mdevice->devmem_chunks);
> -	}
> -
> +	dmirror_device_remove_chunks(mdevice);
>  	cdev_device_del(&mdevice->cdevice, &mdevice->device);
>  }
>
> --- a/lib/test_hmm_uapi.h~hmm-tests-add-test-for-migrate_device_range
> +++ a/lib/test_hmm_uapi.h
> @@ -36,6 +36,7 @@ struct hmm_dmirror_cmd {
>  #define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
>  #define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x05, struct hmm_dmirror_cmd)
>  #define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
> +#define HMM_DMIRROR_RELEASE		_IOWR('H', 0x07, struct hmm_dmirror_cmd)
>
>  /*
>   * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
> --- a/tools/testing/selftests/vm/hmm-tests.c~hmm-tests-add-test-for-migrate_device_range
> +++ a/tools/testing/selftests/vm/hmm-tests.c
> @@ -1054,6 +1054,55 @@ TEST_F(hmm, migrate_fault)
>  	hmm_buffer_free(buffer);
>  }
>
> +TEST_F(hmm, migrate_release)
> +{
> +	struct hmm_buffer *buffer;
> +	unsigned long npages;
> +	unsigned long size;
> +	unsigned long i;
> +	int *ptr;
> +	int ret;
> +
> +	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
> +	ASSERT_NE(npages, 0);
> +	size = npages << self->page_shift;
> +
> +	buffer = malloc(sizeof(*buffer));
> +	ASSERT_NE(buffer, NULL);
> +
> +	buffer->fd = -1;
> +	buffer->size = size;
> +	buffer->mirror = malloc(size);
> +	ASSERT_NE(buffer->mirror, NULL);
> +
> +	buffer->ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
> +			   MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
> +	ASSERT_NE(buffer->ptr, MAP_FAILED);
> +
> +	/* Initialize buffer in system memory. */
> +	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
> +		ptr[i] = i;
> +
> +	/* Migrate memory to device. */
> +	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
> +	ASSERT_EQ(ret, 0);
> +	ASSERT_EQ(buffer->cpages, npages);
> +
> +	/* Check what the device read. */
> +	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
> +		ASSERT_EQ(ptr[i], i);
> +
> +	/* Release device memory. */
> +	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_RELEASE, buffer, npages);
> +	ASSERT_EQ(ret, 0);
> +
> +	/* Fault pages back to system memory and check them. */
> +	for (i = 0, ptr = buffer->ptr; i < size / (2 * sizeof(*ptr)); ++i)
> +		ASSERT_EQ(ptr[i], i);
> +
> +	hmm_buffer_free(buffer);
> +}
> +
>  /*
>   * Migrate anonymous shared memory to device private memory.
>   */
> _
