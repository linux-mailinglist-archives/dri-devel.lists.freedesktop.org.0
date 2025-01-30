Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7790FA22895
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 06:34:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2B310E24E;
	Thu, 30 Jan 2025 05:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dg6ngUpm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2044.outbound.protection.outlook.com [40.107.96.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E5F10E24E;
 Thu, 30 Jan 2025 05:34:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XximfT1qh/JzV65LcKSBhXFrr40DByBXw6SJ2Pdf5C2t3p1BmOM/btrDHp9cSD0r/BRCdmmZfrkPfsgAlK3a+wz9aZVo/Thz8M4lTIObqAEcUtVqwQPvT7BEeHVwmYGKwqXwq2ipm7Fu2yzehNnUoAwoiVv040QRIT3EmHB/PS1sKGsfYJyKtUeeDAVhFolShLUozDA/e9cDkKuqRyZ5xQ1EPOzWfwN26CgExmVxi2rVaJB0IdPWiZcU9UiVqj/+Wjat5vsfyu6dxjPQSOnwFUDK74kQAZlgNjyO4JK3avALT145gS/Rh29pHgHA2+gWHvcLiHeftflTLWIKCf2pBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xwbbTRnw01EQia5O9RC+bIjzAa+VrXUMzKToWKJxBM=;
 b=pgis1xqBt8xx34l5HKQ3WjUfgD1S5HfA8xECOarX7twUiE4j0tYgtxb6t/TG7LU1wwbWDNbsxCfiBkWIxmlZj8/ZaccMV2CIBHGZLyPuDmfPFpCENBQhBCzPpMulTB9skOoLWxFJj4HPvErbWca74t80jtuNOAI5qo4xV9rreYIdW886KkcIgEn2QKpiQOYHd1AC1JfKbbQw6wKIPPqoKW1XDxfnou/EIGWtB8jX8IlViq4ccfrKCxMBN9ibVajFwpYSxGyoKdp9yI6nW0dZTLaahjOWqHxVcDifKVMINVEZ/Hvn0vB9fmTDaVrX2fIZv5by52PhyPnLm6vlBy3wng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xwbbTRnw01EQia5O9RC+bIjzAa+VrXUMzKToWKJxBM=;
 b=Dg6ngUpmavcwxKastpgAPVV9BdVFU67RjgB1P+d0vunJNpvfnfjxu9g8ZGT05y/PNIjT5ZP3eS1XOj0mAzYHzG0f3WHDT4Izf49qz0vT4Ke+LHtxn9w70ioFfSIjiLLi/+3SMNTpUaDzE3Hv3/H/bhZwCK8iI2gNyXtgB3xU5i/QeBDWEDAHV7Z6rTnw8fft41DJllQ+q8ILnHznuuBL0UssWxJPCDh1/F9saT3dg0xW9DIv2kcGvUAs8lzjBib3gqZZnZzxd3/5iaUSyXraC6pkz6YWYfd2sSboMaaqw3VKQO8NKpg4aS5VZWXA76rbPpsr4x5wdSkcgT+1iZdEIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MW6PR12MB7071.namprd12.prod.outlook.com (2603:10b6:303:238::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.18; Thu, 30 Jan 2025 05:34:37 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 05:34:37 +0000
Date: Thu, 30 Jan 2025 16:34:32 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 2/4] mm/mmu_notifier: drop owner from
 MMU_NOTIFY_EXCLUSIVE
Message-ID: <h4dnoixvp2kjeao6mzcpze4zx6t34ebpltqadkjl5zxcjhddkf@lbzo2yhzu5sz>
References: <20250129115803.2084769-1-david@redhat.com>
 <20250129115803.2084769-3-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115803.2084769-3-david@redhat.com>
X-ClientProxiedBy: SY5P282CA0182.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:249::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MW6PR12MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d50167-ef75-4c2b-58d0-08dd40efc8ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NZo0dI6r/l2D63NRQFDlejTFTj8r1kndlMF2ebgZUdqZWWAazw8K0/iUyWpi?=
 =?us-ascii?Q?X978sLHxDr3wH12yM2RLwvXcuAjDSTGBU7re4tYk6erzXGXY7VMS/52ngGyR?=
 =?us-ascii?Q?jDrBNx/OB4MCI20cQyQrrJfMurJ/cCNmAoPcrvxhprdwzCWV8kyIsD0UQHil?=
 =?us-ascii?Q?Hf94pRGUdiYKjvOjtlPZGhnyY/Oyx9ULOYJywBshoVoSqJ1ua7owv7zdQXID?=
 =?us-ascii?Q?eyDlIhp/VTQz53wNG7j6BBB+HoxIUCYWE73lhUdh2LLLzocnhTLsN1ai21Xn?=
 =?us-ascii?Q?cxnk9r5NbOo2pRl4CA4XU4Zg0rD/1xOjwZpPCxGqBXe2NqS36oZrjXrMNOeY?=
 =?us-ascii?Q?JswQ8VRT3NZKTFjmsXxKXsm7VnGaCJhRQaDgRb5825B8RCAs28xzw12I4DSv?=
 =?us-ascii?Q?SylVItsjDQFzjH7bRDGVwHfgBXN4HGeaz9i2gURg2gdLU/dHfDFCTt2QhJjC?=
 =?us-ascii?Q?XbcFwyFLIkkTWTpqNiogHqG1g7DMZZj7pwG7rXWct+x3Zw8pUeRNA1/kl7ku?=
 =?us-ascii?Q?xyDlFli1tkn0XaVljXP+QnSousy+LSF+hpKaq3Wn4XRJqs+uuj1qspd4TvmP?=
 =?us-ascii?Q?y/4dsIWBbj9XqGxYAoZ4wpW2HmFPg2XfWuSA0eGgYwfrQx4oZWxfodH6dSnf?=
 =?us-ascii?Q?+E0Y7QfXFlmyavEKlfegBFR4YdvivN5vnwXvmEYZ0pdeUPssSSWGkVhTonM8?=
 =?us-ascii?Q?1HHcVgfEg6molJpNBHbTW0JfsK/G3DHeZ0mqyb56wEHU+mnuOyxMFFeXBKx3?=
 =?us-ascii?Q?bISw1yeIo/d0bQRZceul2Ku0OR8HA9RHe9OrwtVyEWxMIHJwKupN1wRUth/B?=
 =?us-ascii?Q?M02+D+B89OqKxapDdBy7jp5EkdfXDPD60ut9uwtsal88wPyRswn4LNbkcW5u?=
 =?us-ascii?Q?gSZqlfubEHMu++sovaKXnMQtIVpWnYv99WOKCtjwkTF/qmqVG+gW60JK+vPL?=
 =?us-ascii?Q?uvSVD1ken2BrAMYnmQhpphk8cW1tbrKZdREktk7CkKuCe3weapzG0n6mPdd8?=
 =?us-ascii?Q?CLLYaUhMfuXTb1fks6a0LCizgdP9iupHr6/25l3+bZ+TedAWPDUzGcQc+/4B?=
 =?us-ascii?Q?P8hpUaZEQYw0ty+jqf2l8UKlyfFRu7MSFQXktSM9eSjK1l1dL9GvYlxtXPZ6?=
 =?us-ascii?Q?rwl/uttMCINuF5U1sHCHgwDvpjQbgr1RD6Qal72npPB5fmJ9Fsn+9SvEeisz?=
 =?us-ascii?Q?aUBg7LVfw0X2/RMn5KPnHFgqeiMXL6TmnysdEYTEEhhoGSaiImeSzO0ThEHJ?=
 =?us-ascii?Q?cngSvtAXrwvhIvs9ghMnyOOb9/wEEZ/ewZSwXQ/bqyNUtSofpvbcTeXoJX5T?=
 =?us-ascii?Q?KFxyUXjLSro/se17pyUIDOIN16gUcspL3F0DUJwBLjZSGFqKv2UAVxyymWNz?=
 =?us-ascii?Q?AwGjnXPaDv/UbfiV3HUYYMdeLV5K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dwg0nPU6gThfqtK1FD5MeX56s+iE4fgnJoR+F+VQCefq3p+QCApfycw4jVOe?=
 =?us-ascii?Q?EcZsFGvCMbKjdPypxDEV2BNxZyRR1jSj7/SZbICOXt7FgFFGEsicUMhSEhhc?=
 =?us-ascii?Q?ggy3jq5UQ0RYWiMZEIVIT6iAk+zrbtDK013lKvYFU45sh90wqZhqfkUOqWZT?=
 =?us-ascii?Q?xityvWbixGfC04xBOwG9qgJge13XrJvVv5rU0beWp3R9EnuFgGkObLUOYWWW?=
 =?us-ascii?Q?Gk+NqGRg0oo88QrimuoZaE+2t5m1mOc3148eGsqnCIEhVdY6+rR17mkT0Mcv?=
 =?us-ascii?Q?oYZvWLdIHhQzchLrFocg5A2VXEofK8e1GO4ZZbDNkiTtYMhDDoS7Gz7pfQd7?=
 =?us-ascii?Q?Yq6R8xOGFPtl6yVHZqPCBx2U8k2MteMOz/novS25nU6ujowxJ1WbzJeS+grl?=
 =?us-ascii?Q?0ejCnvVtAXufFUV3hMac5wLYKKwuN8RNpfKxP6squ4fib7TIpIF+SeDg7344?=
 =?us-ascii?Q?SazUCsn6AgTnYH0/nuprxXA7xMMTBHHvMCOGy9F5551tB9cKZh9amKDHHdhz?=
 =?us-ascii?Q?dOMfp+FXPIvXBM+XpdTTKZ5OvkUFNkeAKult9qXbmFZYMmeqlZSlhKwtldu2?=
 =?us-ascii?Q?v2gmznF8zHBppfkuxFZ/zI1WFNo56c0t4Qbg+0vWM0ypGQ/3Qk+e/cdmymeC?=
 =?us-ascii?Q?ER283ErLzw84I0iQxtXEXglXS6p5Phir9tfZajuiy0e2DxBjOvpD9NjKfhcN?=
 =?us-ascii?Q?X2WkC5c+wXhPk87sZGVfvmwR/1n2AtGRySgyU++D28CAhbBB7kGpHpAcFexZ?=
 =?us-ascii?Q?fic3IkMLFKKKZED1p48Qmv5fZKda5c5ReYvQaC1ekKWw4qy2F7kulTpIqIcQ?=
 =?us-ascii?Q?xybqlWh1rrJFPwrkxgE2i/iOg6IrSN6iScfh90QWbV41LMVbwMFG8JcUDwwb?=
 =?us-ascii?Q?B9ves7ISfFzIFdBxIppWQFPF10PrH2isTfjRyIaFg67k3THn30yZvS93cjMN?=
 =?us-ascii?Q?N32Kg3Gfk6jGXesgnaRR12ifRnSzaKbFRdufO3xuBaqwoZZUsVgr/Hy/Jkyo?=
 =?us-ascii?Q?WaLvv73MlNDXV7VIT7P4YU4a4+I98Bj80f+S6bkknpmxqqBYFCAwQit8Eim2?=
 =?us-ascii?Q?VnL7u/VSJlpip8yQ3fAQxi/JnAHGAH8bwUggav38haIOby+lqAjsG027qwFx?=
 =?us-ascii?Q?BPdsdmO21x2bAhAsG/gCmUEBZzyzTZibhzPdPRaLjWYrGVcBBY63RKeJpGRY?=
 =?us-ascii?Q?CWoXsjhYPmatqs6e7d1IT+weMZ3sazKXfa6Dsk9/oYHwcRmkoYDxdrJ2nWmM?=
 =?us-ascii?Q?hIhcUBjP5CNmQkudZFxa9sY5ZzkyB16PyuqxkMpjI/3Z4XiM2aQSpLllpj/V?=
 =?us-ascii?Q?3rCBaxAKScSvSkNw3Ul+hStGGR/0AjsVNrq52eXcXgmppdoMm5K/GdP8UZrm?=
 =?us-ascii?Q?PgQJvjhs37IRqmhC84YpoqPzkYOWzDEBD4qCMwlTHpGu8WFuDypvugKec1M7?=
 =?us-ascii?Q?M8mW+q5+7HuTdSpZdey6nm+vAZViFyho7FmduwJSgxMPgcwz3A5CaBk6nBpr?=
 =?us-ascii?Q?gkSvwMTiDna9Je3p13NJRqGk0wCrnHUEgHIkyjLXAVJ8FBQxIEhn772zYIru?=
 =?us-ascii?Q?feHOwGm/psJ2XXz+kfAhLeQRIXJNpc3MgQwBH6Ch?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d50167-ef75-4c2b-58d0-08dd40efc8ea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 05:34:37.1850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2Umme52R3RcFsYALty1TlmXGJmClKrA1mAyPzc9LgUQeQmCgJfLqo7NnhkyugL5U8/Xbk3pLOxKGk7rCRDRtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7071
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

On Wed, Jan 29, 2025 at 12:58:00PM +0100, David Hildenbrand wrote:
> We no longer get a MMU_NOTIFY_EXCLUSIVE on conversion with the owner set
> that one has to filter out: if there already *is* a device-exclusive
> entry (e.g., other device, we don't have that information), GUP will
> convert it back to an ordinary PTE and notify via
> remove_device_exclusive_entry().

What tree is this against? I tried applying to v6.13 and Linus current master
but neither applied cleanly.
 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 6 +-----
>  include/linux/mmu_notifier.h          | 4 +---
>  include/linux/rmap.h                  | 2 +-
>  lib/test_hmm.c                        | 2 +-
>  mm/rmap.c                             | 3 +--
>  5 files changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index 39e3740980bb..4758fee182b4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -510,10 +510,6 @@ static bool nouveau_svm_range_invalidate(struct mmu_interval_notifier *mni,
>  	struct svm_notifier *sn =
>  		container_of(mni, struct svm_notifier, notifier);
>  
> -	if (range->event == MMU_NOTIFY_EXCLUSIVE &&
> -	    range->owner == sn->svmm->vmm->cli->drm->dev)
> -		return true;

I think this will cause a live-lock because make_device_exclusive_range()
will call the notifier which without the filtering will increment the sequence
count and cause endless retries of the loop in nouveau_atomic_range_fault().
The notifier needs to be able to figure out if it was called in response to
something this thread did (ie. make_device_exclusive_range) and can therefore
ignore the invalidation, or from some other thread.

Looking at hmm_test I see that doesn't use the sequence counter to ensure
the PTE remains valid whilst it is mapped. I think that is probably wrong, so
apologies if that lead you astray.

>  	/*
>  	 * serializes the update to mni->invalidate_seq done by caller and
>  	 * prevents invalidation of the PTE from progressing while HW is being
> @@ -609,7 +605,7 @@ static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
>  
>  		notifier_seq = mmu_interval_read_begin(&notifier->notifier);
>  		mmap_read_lock(mm);
> -		page = make_device_exclusive(mm, start, drm->dev, &folio);
> +		page = make_device_exclusive(mm, start, &folio);
>  		mmap_read_unlock(mm);
>  		if (IS_ERR(page)) {
>  			ret = -EINVAL;
> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
> index d4e714661826..bac2385099dd 100644
> --- a/include/linux/mmu_notifier.h
> +++ b/include/linux/mmu_notifier.h
> @@ -44,9 +44,7 @@ struct mmu_interval_notifier;
>   * owner field matches the driver's device private pgmap owner.
>   *
>   * @MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no
> - * longer have exclusive access to the page. When sent during creation of an
> - * exclusive range the owner will be initialised to the value provided by the
> - * caller of make_device_exclusive(), otherwise the owner will be NULL.
> + * longer have exclusive access to the page.
>   */
>  enum mmu_notifier_event {
>  	MMU_NOTIFY_UNMAP = 0,
> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> index 86425d42c1a9..3b216b91d2e5 100644
> --- a/include/linux/rmap.h
> +++ b/include/linux/rmap.h
> @@ -664,7 +664,7 @@ void try_to_migrate(struct folio *folio, enum ttu_flags flags);
>  void try_to_unmap(struct folio *, enum ttu_flags flags);
>  
>  struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
> -		void *owner, struct folio **foliop);
> +		struct folio **foliop);
>  
>  /* Avoid racy checks */
>  #define PVMW_SYNC		(1 << 0)
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 1c0a58279db9..8520c1d1b21b 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -786,7 +786,7 @@ static int dmirror_exclusive(struct dmirror *dmirror,
>  		struct folio *folio;
>  		struct page *page;
>  
> -		page = make_device_exclusive(mm, addr, &folio, NULL);
> +		page = make_device_exclusive(mm, addr, &folio);
>  		if (IS_ERR(page)) {
>  			ret = PTR_ERR(page);
>  			break;
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 4acc9f6d743a..d99dbf59adc6 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2397,7 +2397,6 @@ void try_to_migrate(struct folio *folio, enum ttu_flags flags)
>   * make_device_exclusive() - Mark an address for exclusive use by a device
>   * @mm: mm_struct of associated target process
>   * @addr: the virtual address to mark for exclusive device access
> - * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier to allow filtering
>   * @foliop: folio pointer will be stored here on success.
>   *
>   * This function looks up the page mapped at the given address, grabs a
> @@ -2421,7 +2420,7 @@ void try_to_migrate(struct folio *folio, enum ttu_flags flags)
>   * Returns: pointer to mapped page on success, otherwise a negative error.
>   */
>  struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
> -		void *owner, struct folio **foliop)
> +		struct folio **foliop)
>  {
>  	struct folio *folio, *fw_folio;
>  	struct vm_area_struct *vma;
> -- 
> 2.48.1
> 
