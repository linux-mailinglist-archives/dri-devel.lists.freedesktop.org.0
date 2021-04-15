Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8645360BE1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 16:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14B96E53E;
	Thu, 15 Apr 2021 14:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646026E53E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 14:34:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UjSqX3NeBU7Np07DH3EqQ4IfIEzhr+KlM2EuZ4Uu7ytrn9xudDFPymYXK2puD/yo5dPasKuafj8lDJNPlKoQPO5xSESaZgmy/bsNYUr/cN6Pzo6NyaTWH3Wa+xCPHJfGj3kIk1N1UT5KncRJ3oMDC2zr7klIxc6+eMkeKQZ7D72PddUu1wkbcG9s29OwZbMcCXDLsoWeRMcX/+CH3BYC5yfM4Qm6aczD0sqndrfR640jzMFqH/CNKmoXRDnKsTMS6WQThMTe02En3t5kb+EWDyHxY3iP4Zwbm/xNzmiRkYMscHCwP/HykzBUZQtxy7mCUfborFSYe5ymQSAj9fQ5Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niXuXUg954VJdMB0LYNyCQh2u0vh9Ic5Wxm81MoWo5s=;
 b=b8eGIUJO6g/S48eZCIWsQ5hKyz4L2PRQtN5tD6MXSWKfdTd1zkFWG4XZUp07+Iqjng4ei61Vm7XHqPavQP3KsRRdWwbiCag65Gl6KtHzhplK4c3DADTFo9aMn4I2wl5tgIvYX/EyfWLGxFeh0oo0wjcKMgBluaO4NxRPxq/oS6wkSR0++aXE1VHlyCOW+D/BP9bhnL6tqxhK1tbxEYJ6V8w/U92wk21QpCg1FSVhEk2mMybmucCwVOUYodTgAeWB8XdFbD/d6l/lF5mux2E1lIYWLoczvl3ehBP2ilWtQGafVNG88pn0k8PNGC0dHPYHJvlK84VhhY/kCAILj4CiGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niXuXUg954VJdMB0LYNyCQh2u0vh9Ic5Wxm81MoWo5s=;
 b=ag93qGVMl2TSSJF0+IEWsVmFPwyIxybp/5BwDBAkQAgFv0P7ovpWahXd6tQF3fG9rHT7BMI66J42TRqMoV7F/TX/leO5oDlIXd8JerZBb3n0wnp1gbnWVgEjivLrydGQMqUZJwgoCllpIM7O9CWp+Tz+GA0W7BTecxKrO1aLlrA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR1201MB0126.namprd12.prod.outlook.com (2603:10b6:301:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Thu, 15 Apr
 2021 14:34:31 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::5094:3a69:806f:8a28]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::5094:3a69:806f:8a28%5]) with mapi id 15.20.4042.018; Thu, 15 Apr 2021
 14:34:31 +0000
Date: Thu, 15 Apr 2021 22:33:57 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/2] drm/ttm: optimize the pool shrinker a bit v2
Message-ID: <20210415143357.GA2671700@hr-amd>
References: <20210415115624.2904-1-christian.koenig@amd.com>
 <20210415115624.2904-2-christian.koenig@amd.com>
Content-Disposition: inline
In-Reply-To: <20210415115624.2904-2-christian.koenig@amd.com>
X-Originating-IP: [58.247.170.245]
X-ClientProxiedBy: HK2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:202:2e::28) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (58.247.170.245) by
 HK2PR06CA0016.apcprd06.prod.outlook.com (2603:1096:202:2e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 14:34:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e7c6d3e-c6e2-47ef-75b3-08d9001b94dc
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0126:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB012616B7DEB03092F2D28535EC4D9@MWHPR1201MB0126.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rxnQTY72PrLhv/Y+hsy+rYaXEzPdpM7NGWabSoj5xfX/oE9FOYfOA2AcQpQfmjMJVvdL607oiLAYUPjOIyW6jwPWHaHal2zRNXqWUWO2aE7PLaclXx8F5Zmxju2R58I1VNExW5olQgMjFTISLmYbu27gAKV8D9mTJyBTlXQ26phS6/xn5oc/MSYOnhw7qcnvDy3vFhdcHt+Wn8lWKx0xMXUdykURnMWgAz9v1z44KbcQqWgMNDC6WN7z7Uri0khpA6ZA7jpPV3vospDqmGErzAXhElBIjmpKBjrbC9z9bHFTvncA922QxmFJmWlYldYNTRHfh8KogRMIPlsTYF4MVuRX7aIoynPqigwMxIAxdUqDNpk3BsBJj8eCNkcEGjL786XDXG5GKaWkmp9Qh/xDkgWcFr8zbR+N5BpFe+VvDYFBxdMCst39eymz3o8x+il3EzLXckYljakCl21SikvouQj8LSPU9ZyOoXsA2fh2EeAfiF9vQQOhqaaNafe/Ze+2ESscd38gWn6+O5uSZfund2d85+b08+nkW5eIt/rbw/dp4EtRvJhSCWzrm3cjPIBLHPkyLd11V4yH7sw1sp2IuyStj6mK7hi7Hjt4e8hvif6bqUgKoDAXObGRHPLBOneWHaHQAWb7oa5bUWy1Z0wvYCZWrHSzPovRx88pR7PQ538=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(33656002)(956004)(8676002)(54906003)(26005)(6496006)(1076003)(8936002)(33716001)(83380400001)(186003)(86362001)(16526019)(316002)(55016002)(66946007)(478600001)(66476007)(52116002)(6666004)(66556008)(6916009)(66574015)(9686003)(38100700002)(38350700002)(4326008)(2906002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?CyZtaZdb6FD146XFNZpzrmBU9ITrlw4B0iXB8YB76j5xQGoT/SxFBA4d9e?=
 =?iso-8859-1?Q?81YrZShot9dUvTAQiAlX8AEiwEyjXq8fiB14h3mn5fOrfV7hnYAdI+ncs4?=
 =?iso-8859-1?Q?/rbEtUUoygwruLO9eJ7G2RMWQ2UMBHqoOcfcB2h1dJyGgCNIcOrzYprWa8?=
 =?iso-8859-1?Q?0Rqa9k8PyWsTUy75Q6cGV4otLHy+cyXieAw5YsKrpUkxAG/4JwCp7R24ec?=
 =?iso-8859-1?Q?bM0rhouPqia0mMeoqLmOVM9f7U00emjfKBdyYa/I8qfF+DZvAqyfkoWjZc?=
 =?iso-8859-1?Q?WwAqG3KNGSGPce2L+WwJC2HOoLZMjfPZYuqwqVUfKtEjxockpsFzWV+XYc?=
 =?iso-8859-1?Q?wOAFoVKJpiJ+vZOfIcNMNDHTmAVxmf2SPdeC3PUswgxsQyGOHFEZhoTtcv?=
 =?iso-8859-1?Q?PiiZ4EC/H7qFlqFlgwUcdjW53d0gii5vB0lvtEPVJ7sfHGCOhit6IXbYCH?=
 =?iso-8859-1?Q?FLcpWEMV0qXaC8sjbOb1c+5N1S1AHXYYVsy1Cp0tTN1LNE5e8eaoIImvbf?=
 =?iso-8859-1?Q?Qc45owPlY7sxwfIW19u6VPmfRN+Zi6DPNTSUpJF1hLl1JWaiP4g+yDJdyK?=
 =?iso-8859-1?Q?v2TCvnHqn0Tz9OM+H91AKSh9E7A32GpwXDPEMEGbiqKi5S1vQ54US2VePx?=
 =?iso-8859-1?Q?aX0Jkl5VrppFBZS0kWhuSfp2zBBm/RVat1rcHeQ7vzDjbmNdj/ulEq7v9H?=
 =?iso-8859-1?Q?Dk58UuKyKP2RaixXuZmAb4HEuu5HScFeHeIDG+Frb8xNGRLFeWKKBFc8cn?=
 =?iso-8859-1?Q?X+Sw5+RRkgIpkCfKXHjB5lrLqE1johF2isUsfOXWSnSKr1f4OqO98SGvvU?=
 =?iso-8859-1?Q?tDSn6SVvPGYThNdNowVlylVLTFrtIbNhouuSWWpyUErrSvQOEJzeTu2yRr?=
 =?iso-8859-1?Q?zIO4p/BhMIvwfEZqy55OOfGfaWtjsXH3yket4xwzZakMJK35LlaW0pcovs?=
 =?iso-8859-1?Q?MNfa2hT4JbzahHX4a1ljFjrTbgdtpStTVf8OjwbBrBjb7bQW6JZUzyJMuD?=
 =?iso-8859-1?Q?DCkU7QlyjXbwUNKFeb7kZRc8BWVt8alLsCEYeWY5khspmusJQcLmbY9nOM?=
 =?iso-8859-1?Q?lilfGy2+bjmA+lgt2Qdi4Wn2qQdz9Ce4iQCjiaiJnEsWJFUquIys/2HV8C?=
 =?iso-8859-1?Q?DlG78WntJ6urHTLA57jB4zHpS9kP4uDEhdKr34pukvwtCwvUZdY/wDcTaq?=
 =?iso-8859-1?Q?Png6YPLJe3gOFPLLkrTnGVInC19cNcyShFb3gj2GUOBiYR5go5rBImT/mp?=
 =?iso-8859-1?Q?xhrQstVF3DHC4pJi/+ALiT7y00usInPSBRB9BJ6wNjEkihRar216TXyIPz?=
 =?iso-8859-1?Q?360U1en288CTk27aziC5buiZBodvq8NCK6iDkFVOMnGg2fauCOcxfU0+cj?=
 =?iso-8859-1?Q?13PuVq3Inw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7c6d3e-c6e2-47ef-75b3-08d9001b94dc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 14:34:31.4937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVFeeljCzbf7xXCWrRC3LB4Atjkcd//723oeANX6+wF1ZOiZ9u731aQG5180orgeLJfG/wRfV+jz6l2fMdQAMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0126
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "vbabka@suse.cz" <vbabka@suse.cz>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 15, 2021 at 07:56:24PM +0800, Christian K=F6nig wrote:
> Switch back to using a spinlock again by moving the IOMMU unmap outside
> of the locked region.
> =

> v2: Add a comment explaining why we need sync_shrinkers().
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Series look good for me as well.

Acked-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 44 +++++++++++++++++-----------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_poo=
l.c
> index cb38b1a17b09..955836d569cc 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -70,7 +70,7 @@ static struct ttm_pool_type global_uncached[MAX_ORDER];
>  static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
>  static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
>  =

> -static struct mutex shrinker_lock;
> +static spinlock_t shrinker_lock;
>  static struct list_head shrinker_list;
>  static struct shrinker mm_shrinker;
>  =

> @@ -263,9 +263,9 @@ static void ttm_pool_type_init(struct ttm_pool_type *=
pt, struct ttm_pool *pool,
>  	spin_lock_init(&pt->lock);
>  	INIT_LIST_HEAD(&pt->pages);
>  =

> -	mutex_lock(&shrinker_lock);
> +	spin_lock(&shrinker_lock);
>  	list_add_tail(&pt->shrinker_list, &shrinker_list);
> -	mutex_unlock(&shrinker_lock);
> +	spin_unlock(&shrinker_lock);
>  }
>  =

>  /* Remove a pool_type from the global shrinker list and free all pages */
> @@ -273,9 +273,9 @@ static void ttm_pool_type_fini(struct ttm_pool_type *=
pt)
>  {
>  	struct page *p;
>  =

> -	mutex_lock(&shrinker_lock);
> +	spin_lock(&shrinker_lock);
>  	list_del(&pt->shrinker_list);
> -	mutex_unlock(&shrinker_lock);
> +	spin_unlock(&shrinker_lock);
>  =

>  	while ((p =3D ttm_pool_type_take(pt)))
>  		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> @@ -313,24 +313,19 @@ static struct ttm_pool_type *ttm_pool_select_type(s=
truct ttm_pool *pool,
>  static unsigned int ttm_pool_shrink(void)
>  {
>  	struct ttm_pool_type *pt;
> -	unsigned int num_freed;
>  	struct page *p;
>  =

> -	mutex_lock(&shrinker_lock);
> +	spin_lock(&shrinker_lock);
>  	pt =3D list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
> +	list_move_tail(&pt->shrinker_list, &shrinker_list);
> +	spin_unlock(&shrinker_lock);
>  =

>  	p =3D ttm_pool_type_take(pt);
> -	if (p) {
> -		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> -		num_freed =3D 1 << pt->order;
> -	} else {
> -		num_freed =3D 0;
> -	}
> -
> -	list_move_tail(&pt->shrinker_list, &shrinker_list);
> -	mutex_unlock(&shrinker_lock);
> +	if (!p)
> +		return 0;
>  =

> -	return num_freed;
> +	ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> +	return 1 << pt->order;
>  }
>  =

>  /* Return the allocation order based for a page */
> @@ -530,6 +525,11 @@ void ttm_pool_fini(struct ttm_pool *pool)
>  			for (j =3D 0; j < MAX_ORDER; ++j)
>  				ttm_pool_type_fini(&pool->caching[i].orders[j]);
>  	}
> +
> +	/* We removed the pool types from the LRU, but we need to also make sure
> +	 * that no shrinker is concurrently freeing pages from the pool.
> +	 */
> +	sync_shrinkers();
>  }
>  =

>  /* As long as pages are available make sure to release at least one */
> @@ -604,7 +604,7 @@ static int ttm_pool_debugfs_globals_show(struct seq_f=
ile *m, void *data)
>  {
>  	ttm_pool_debugfs_header(m);
>  =

> -	mutex_lock(&shrinker_lock);
> +	spin_lock(&shrinker_lock);
>  	seq_puts(m, "wc\t:");
>  	ttm_pool_debugfs_orders(global_write_combined, m);
>  	seq_puts(m, "uc\t:");
> @@ -613,7 +613,7 @@ static int ttm_pool_debugfs_globals_show(struct seq_f=
ile *m, void *data)
>  	ttm_pool_debugfs_orders(global_dma32_write_combined, m);
>  	seq_puts(m, "uc 32\t:");
>  	ttm_pool_debugfs_orders(global_dma32_uncached, m);
> -	mutex_unlock(&shrinker_lock);
> +	spin_unlock(&shrinker_lock);
>  =

>  	ttm_pool_debugfs_footer(m);
>  =

> @@ -640,7 +640,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct se=
q_file *m)
>  =

>  	ttm_pool_debugfs_header(m);
>  =

> -	mutex_lock(&shrinker_lock);
> +	spin_lock(&shrinker_lock);
>  	for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>  		seq_puts(m, "DMA ");
>  		switch (i) {
> @@ -656,7 +656,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct se=
q_file *m)
>  		}
>  		ttm_pool_debugfs_orders(pool->caching[i].orders, m);
>  	}
> -	mutex_unlock(&shrinker_lock);
> +	spin_unlock(&shrinker_lock);
>  =

>  	ttm_pool_debugfs_footer(m);
>  	return 0;
> @@ -693,7 +693,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>  	if (!page_pool_size)
>  		page_pool_size =3D num_pages;
>  =

> -	mutex_init(&shrinker_lock);
> +	spin_lock_init(&shrinker_lock);
>  	INIT_LIST_HEAD(&shrinker_list);
>  =

>  	for (i =3D 0; i < MAX_ORDER; ++i) {
> -- =

> 2.25.1
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
