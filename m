Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B43A31B24
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 02:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4CF10E012;
	Wed, 12 Feb 2025 01:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Km6JNCFP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBD910E012;
 Wed, 12 Feb 2025 01:27:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7qLIVf3QOGu7NRU5txkWAwxmQF3zGeOJSjpfO3BSqF8sx/sE/pSFdiO7ZWeGZGk+L5dnFByxq4a6rlffyS6+U/qsCTzBYCFNmdvsTjjXIl7IgtPIvM+iOZe17r/7/xsqrmd5gZpg8qeNA7SDUzqh8///p1TasMyE65gEO/toPaBKyGZv2cM7j/raafJRnK8Zs0IMzvdZbKm1Pyi+Z/HYOfGyMZB9o2WIDKgXi5vbkoRSfnOAdIJbzCs/ptS80L5oRY/No/v+2jX4/5LiWHpNJS90DnvtQvH0m2t52n1A1fvbX/TZ73v6LlE7K0bb3cJMsL0tj5czFJbKiztnKhZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqHBRyYDetmLJVPN0u/jsYFLU4S0aRijkdz117xG0QY=;
 b=E4N2ozfJyyCSHRYyQkbBK1FV59gTFDgA9eCDOFvFNGHgdyOk3NGtFAu/0b10675WqtP7iwxViPwgMz+ih3rGxVNkMzIw3+k0sl0frVteJd9hO+6Z1LKErhy0ZQzQp5dC7diYGeCzRIf8osWdbzfklmI/ueirySStHnoKxGFLHK/yZkuSPXnvO3FjR/+/2DIUqoIDfNKDd2bK+R+MxQAk33cjtgtj1ftSyPA2D92pisGZJsXLSCqJnkd72A13+h/ZNVbtjHqXVjqooTNbYnrzFS4VpqfaFiSn+rpCS7Pc/iaIWJbZqjz+bmrh2j+NZJRiejQlk5qp0B0LlUJLGjCW1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqHBRyYDetmLJVPN0u/jsYFLU4S0aRijkdz117xG0QY=;
 b=Km6JNCFPw2+mprr/HphK8EfykhsPBeM41Anzq8wHh1pPIpsq1UWmRrSsPr5s/nkF7AoYDfzzcu78ro7ztPyULaXaze5sIJ3Zy1XruEo7ZJLpjK3Pk1VftZyOcplZ4mS5/v5xNxDDRBL4Y68zkUORRY7KDNeLRjzN2T/1a4s3I7y+WDX+jkyWMLdfX6yblv0GDSeKz4VadGmeK4c0XRbfcrVhzPOimLmbUPkpDbnNu7qE+FJwqnVfO6mx4wHoaRdc+489w/QJjE1toca2D/xPc/2l542mZtFODTkfWPGmNC4TeA2TmCWudcebJZdvsUcMHIzuYX0xoZjwqdxFB33k/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BN5PR12MB9509.namprd12.prod.outlook.com (2603:10b6:408:2a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 01:27:29 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 01:27:29 +0000
Date: Wed, 12 Feb 2025 12:27:24 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v1 1/2] nouveau/svm: fix missing folio unlock + put after
 make_device_exclusive_range()
Message-ID: <oy3q6xbgqfzk53bitgtefaycsya4wwcxt5gp46mhnwh4qpl7fh@74yluy6whpb3>
References: <20250124181524.3584236-1-david@redhat.com>
 <20250124181524.3584236-2-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124181524.3584236-2-david@redhat.com>
X-ClientProxiedBy: SYBPR01CA0033.ausprd01.prod.outlook.com
 (2603:10c6:10:4::21) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|BN5PR12MB9509:EE_
X-MS-Office365-Filtering-Correlation-Id: e88d9e83-340d-4728-f6d6-08dd4b046a53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RqRvPjsfAr0R1TfKs8NYsCbWd2k8xBHIZUULJY3J7SabWK/Tm3hkeMkWg7ef?=
 =?us-ascii?Q?GEp7UqQM4fC+tQZh46n5JyaVBsnRqBWjUSZPTIxXK12IDB5VeIsZNl7oQe1t?=
 =?us-ascii?Q?7xU9W4AimEICg3aYjnwVmEFyH9RC1tC5TrzY4tyB2g4OSUSF+pKkTSX+Dt3z?=
 =?us-ascii?Q?SG3LAIryWy2hbV3OtW3XGmIxTrVPyzvbvKfyLXq3uexS7KrkzRxGUt8VGCcN?=
 =?us-ascii?Q?C+mpjNnKHVVgMoUgWjh2hV1qInSYSQPTEIMeye7uSlTwyTAVvDw1crs7kkdn?=
 =?us-ascii?Q?KJWHl+9SuDILjwDBiKTxnN7vsHYornE7HJn97p2wlcsojmVg8NazIGgSbayq?=
 =?us-ascii?Q?uFiKQdN6td3a8drKNkBtTyaeYDsAlzkoMsxRD5y4Pvy66pMXdkjOfa7ePzVR?=
 =?us-ascii?Q?ImO228DrwfpM0Eh3X5DuP3T6P0lXNIqpL6ht1jvNferoWB+3OwtXFrGJ6KMS?=
 =?us-ascii?Q?Wkrz9cEBz6We19T5NsTmjhy8kMOkgqBB1UmvLtI57zS8KwvasGr1NuFfteDH?=
 =?us-ascii?Q?2/EXGs3NyULdKoEtndHYizT6ok2Wp5idhHvvoos/5Dpi25jdVVmM4q7OO1S6?=
 =?us-ascii?Q?BNf4nrNFLrxzaOor4BW82g47NGXBAmZSSdcHcArubqp/tx1ilGhJ0FWRNwec?=
 =?us-ascii?Q?g6uYbLF6wtw+X99xUMh72EHSEnFmx2R/2HA0feo8zD1dq1OUNS1SZkeqei1k?=
 =?us-ascii?Q?ZSSV9Ms3nWBT4XTuh7pVV6FsKJ7mMRlZo9nvNqZgk5r4bTYaAodbGvreTHqL?=
 =?us-ascii?Q?yKj6QtcaSkJsZsebOoQYk02DtvLeFMn5K42tG8fdEmDIuT+yhOIXowC4xbUf?=
 =?us-ascii?Q?hSYjP0271adr3BYxkhwSd2y4WXogQrY9iQ53ulAResOTAiurqVICyht2xp4O?=
 =?us-ascii?Q?I2T4pexgRkzz1wrs9r1FROxPZlNfOHrngKngVPqXWHbbQgyavkW7IhwMVY2k?=
 =?us-ascii?Q?OjgI4n9v/qNxsspwDb3R5jZq5Y4senrf7CRA9lVa6oVM9rGapZE3zGFIErHg?=
 =?us-ascii?Q?c52I9+Yp8Whi2GU6SzfSdGij/0ItHaYPbntDIb55f05Lu4pSSOGEC35qER/W?=
 =?us-ascii?Q?04fLfKC3TArnF7zeRrfQZRKKA3GFuHGlKOaGW3P7/2dspslZfovE6p4St6Tq?=
 =?us-ascii?Q?J6BJoO71PK9ocyrskLd6vxjK2gqNRPId3ABPtStQaxczEKlHVMHgYX2MEgZ0?=
 =?us-ascii?Q?I9pYBMd4cfLBXRS8+eEaEP6F4m6e2JbQyB5DAM9I0wRe5mkF8p2lBp/gsyNV?=
 =?us-ascii?Q?XqWwsoDUQ4aSbc5khcsfspP5redVL/pgJ6n651W0CyNP7g97XdJADhEpF1ZN?=
 =?us-ascii?Q?ewQm22CnelZJii5ROHeNNfuBj4n75XtRA7yEwk/CSEO5Qozw+h0JbSIX55cj?=
 =?us-ascii?Q?KROFXq1MFZf+JmR+hKvKDioyZjc7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VUp/Y0jPKjnRVSmqtdF/b2jJYpoZOWVuTvI6rkrLN36hCRl2CTgAQ0ltwWnq?=
 =?us-ascii?Q?DO9/CR0cH4epISw9W+78P4NPEJfOD1ooGkDpVIzYmxp/gKqjXzVFRnWLqXTB?=
 =?us-ascii?Q?rDX7P5DadLiQ+ybMCOAtdr8NO1d+agaLr/eJur8sFBrYyvcRfV9LhdVrWBZT?=
 =?us-ascii?Q?M9kGDjUn+vTq9Znrp3PKexFQfdWOxlomcV48XrqWZE0yzMThNaGWP7/7c8Aw?=
 =?us-ascii?Q?MVoe1cxJ0+BfmQroscyAwlQI19GlcbzfiIvBoQ4ydFIJlgoON3AHJ4xPCZFK?=
 =?us-ascii?Q?zA8zWHxz3DWsh4jeTIq2kQs50uN2zjSNU9GjElUFUn90GQAvd8FnVK8qZpcJ?=
 =?us-ascii?Q?WGUILa+y6AScqQZIgX9S7r7Z7xaDHcLOgILbvsIdMlxJl+s/LhoMkepWkOnY?=
 =?us-ascii?Q?L0v1w7YfbomRHNby0CbCeHi8qY1iL6wuP2piMStrlHaLwYzGtbtx3fwvnQy3?=
 =?us-ascii?Q?fUlqFsn4JFVQ3KaIxASWUg4gy9Bl/ZvePwYxFBXXu3V2OCDzO+jHuhVGdF68?=
 =?us-ascii?Q?7waCPFdN0BhfgqvD52GbAFU9+Gp836awwC8HkhyNuBuxjWfq3j9Z8buqBiMe?=
 =?us-ascii?Q?W8A8is0Kxl5aAw5oeU5J9I4HZ5jEDSQSJprHoKvqRloPzKy1xnsvAKGe1vuE?=
 =?us-ascii?Q?i8MXkpyBg1TCopyYdjkj2u8hF6GWiWL6pugc19qMSKVCh3quQvAP1E5qxRIs?=
 =?us-ascii?Q?CfjSqcRN3AeTCo36Px8g47CUP41u873rHS6cQDRRl8Opvp5kzkr3sVB9Tyxe?=
 =?us-ascii?Q?YCXmCavCJArP3dWPPlj3Px3HKy7EQ7d/bV6I2VGJfqT7NwdODA54xSO3zQt/?=
 =?us-ascii?Q?j1MDVxIxgAz3DTCOOCltxymDZxisMAzpG/O1M6IQAuOfGONTyVca4uVGEiZk?=
 =?us-ascii?Q?61WundxcIFkRGTQXVScH/HXfQ4qdt4T5OyHlJnaUEX4BlxTFEYhO2H6nKWRR?=
 =?us-ascii?Q?LUd32CnbT9T2VsVwNKRqda8cz3nmJ5FYl0KqZ8Tk8dXaM/7YQeCNdQ4vbTmn?=
 =?us-ascii?Q?EtAwp6EiP5sOMQSEGd8gMLhiN1qR0TtvlGK0MavwNhHCdV2AJQUsTair6V1t?=
 =?us-ascii?Q?R0n9O6P7jrVXFGaANYYLBYwPjd9gUSMl+27cym0n8xwQCOQDaXkcRcu0ziCn?=
 =?us-ascii?Q?Kep9KNiivn8jIpHZWyXaBdhjZeUUZBkhfcVdaS3lesXZWcdPKz20AtJO8Wi3?=
 =?us-ascii?Q?Jx9wGhB0LRcd+5fz2P+O72snFr11/NnM4bnruo5eW0Ogd7qBP4O47O9V+4s2?=
 =?us-ascii?Q?mR3xlvkj1AkL4ICa7yLmIonaKuM5aUr65BBcv246ouMj8Ur5QWtnqVptotyc?=
 =?us-ascii?Q?k0QPFzUTn6TikCuNc6RHUwMWYIofrnvGcpOuCJmrMnkqdtRBcLjo38Mq2jdS?=
 =?us-ascii?Q?bjjdmrTH+ibsLNjLWFK1U1Y05XjI/A6QtTd8gyaoXzV9VTL2iWMShMG2FKZb?=
 =?us-ascii?Q?nT9Z0aTWtnLlo48gGr+LyfzoYrnTZ5g042nGkebJ2Tl/s85eCU9kljvwKR0j?=
 =?us-ascii?Q?fdYzk9gMPvoX6tQueqkIlOsd3uhEFYMQGSecvQD2MeFJ71wXGtN4KnMpqRCr?=
 =?us-ascii?Q?BzDDSa5a2qytvemiQUxTe7rMslHbXJfK4uqu+SL5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e88d9e83-340d-4728-f6d6-08dd4b046a53
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 01:27:29.3849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3/eo8ilb8YAu3BUN+RMUuQgN5eO2rNFMu8XXNOXT+moDpwxeDVCDAZ1cGQghqOSpsqmriia8M3F8kk9wayObg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9509
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

On Fri, Jan 24, 2025 at 07:15:23PM +0100, David Hildenbrand wrote:
> In case we have to retry the loop, we are missing to unlock+put the
> folio. In that case, we will keep failing make_device_exclusive_range()
> because we cannot grab the folio lock, and even return from the function
> with the folio locked and referenced, effectively never succeeding the
> make_device_exclusive_range().
> 
> While at it, convert the other unlock+put to use a folio as well.
> 
> This was found by code inspection.

I couldn't (easily at least) trigger this condition from userspace, probably
because the window is pretty tight between mmu_interval_read_begin() and
mmu_interval_read_retry(). But I tested it by manually forcing at least one
retry and it fixes the issue observed via inspection. There's no reason to think
it would be entirely impossible to hit either, and the change looks good so
please add:

Reviewed-by: Alistair Popple <apopple@nvidia.com>
Tested-by: Alistair Popple <apopple@nvidia.com>

> Fixes: 8f187163eb89 ("nouveau/svm: implement atomic SVM access")
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index b4da82ddbb6b2..8ea98f06d39af 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -590,6 +590,7 @@ static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
>  	unsigned long timeout =
>  		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>  	struct mm_struct *mm = svmm->notifier.mm;
> +	struct folio *folio;
>  	struct page *page;
>  	unsigned long start = args->p.addr;
>  	unsigned long notifier_seq;
> @@ -616,12 +617,16 @@ static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
>  			ret = -EINVAL;
>  			goto out;
>  		}
> +		folio = page_folio(page);
>  
>  		mutex_lock(&svmm->mutex);
>  		if (!mmu_interval_read_retry(&notifier->notifier,
>  					     notifier_seq))
>  			break;
>  		mutex_unlock(&svmm->mutex);
> +
> +		folio_unlock(folio);
> +		folio_put(folio);
>  	}
>  
>  	/* Map the page on the GPU. */
> @@ -637,8 +642,8 @@ static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
>  	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args, size, NULL);
>  	mutex_unlock(&svmm->mutex);
>  
> -	unlock_page(page);
> -	put_page(page);
> +	folio_unlock(folio);
> +	folio_put(folio);
>  
>  out:
>  	mmu_interval_notifier_remove(&notifier->notifier);
> -- 
> 2.47.1
> 
