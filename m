Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0645B2F2D67
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 12:07:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C21F6E1C0;
	Tue, 12 Jan 2021 11:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770054.outbound.protection.outlook.com [40.107.77.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DC86E1C0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 11:07:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4VtXkmM5KpiJ1+JMhww4DnBhFKemeWnWv0tAqhEGrxpQ3yoR52UQQOezEO4cB49se5QwOA6PKeFY0dK8y6D0UgWIWacqazckEbnrlH134yFJjySJQtNGJ0oKXfnPkRY3OJluVIrmMuNIEi4rFMyh2pkR8FMd0YugvrsOqkuO6Z6Vrx6YWbgNfI85YFyRgV2hnBPSZ8SeM1XuPaQY+c8fhsNfIDBIZiQNNR8gVR80sxHDqe2PuFwl0dDdS35eBQVumgkvuqQ4PyM6uTrXPXvJkIeWDL6or2jgrU7Ca7is8tTbUBg/IOkgQ2FH7NraDBNtg9T3k/uX6/h3bOgrHMcLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FelCusxfD5xGK5J/6jDUkxBjNxNDfHs1ihHoOuxQvbM=;
 b=hbtzvkuL1n8e/52gN6OkOC016VOn78eg28PhLZFQV+Ad7XLtM/QNht16t2c+DUdIr8VKTND8Ku1N3y1gEc74yzpm1XzABJxsRC/QT5QT8q0/L+BeHS/mxFxdkAaEJbCTkr003mRpa1mU4TZSw6Z7MOH7iNJSw7ob9iMpI+cXNu5h2VZx9gKKbassOXjIXciBAm31dnmPXljHGP492rN5DT/QlHz3YJ6u00KSjYTEht17E/gKm0VIo/D+5pvK/DFpUKDEQDAZBoLIV3ZlbzaOKdUB/b+tuq+jloCgvtOcohl5E1zbmbWtA7l7oep9vlJ+kuIskzg3fuCtwL8sT6h+Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FelCusxfD5xGK5J/6jDUkxBjNxNDfHs1ihHoOuxQvbM=;
 b=mIBBPfFfbFIm7tI6NT/qCi/HKN3KpPiT3pVjEhs44zLowfPx0wnYuMKzdmKkO03yWh2gRq9XrPLeU0o/kX7Uzu3F/3OX4U9U5T5AfQj0Kooyq2snZvi7IyP4our+VdHu6JCwZ3onI/1AVKLro2RsYXdEUq4iiGajqFZ0lDlg6tY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR12MB1599.namprd12.prod.outlook.com (2603:10b6:301:10::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 11:07:15 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98%6]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 11:07:14 +0000
Date: Tue, 12 Jan 2021 19:07:05 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: make the pool shrinker lock a mutex
Message-ID: <20210112110705.GA122980@hr-amd>
References: <20210111135721.2704-1-christian.koenig@amd.com>
 <2595593a-59e7-3bc8-78e9-c31ee55f625d@gmail.com>
Content-Disposition: inline
In-Reply-To: <2595593a-59e7-3bc8-78e9-c31ee55f625d@gmail.com>
X-Originating-IP: [180.167.199.189]
X-ClientProxiedBy: HK2PR0401CA0004.apcprd04.prod.outlook.com
 (2603:1096:202:2::14) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (180.167.199.189) by
 HK2PR0401CA0004.apcprd04.prod.outlook.com (2603:1096:202:2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Tue, 12 Jan 2021 11:07:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4add10c6-d90d-4d48-afa6-08d8b6ea37dc
X-MS-TrafficTypeDiagnostic: MWHPR12MB1599:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1599C8CB5F0F99F2BE5AE858ECAA0@MWHPR12MB1599.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rtGtUTfEBDR7WSCY1tFA/MMZvLqC60VNmQ0G1vwQbpc1LDJmF9cMbR5EA4Ex7jNMRdoVCbTgGtxu0E/2zd+ZndIgIZdWpZ8NzSiQcYJnXnRHu9JAum9tO+jrzZfTwKC5UEP9L4WP7aEhdX07jeUJoAWe7TI5/iJUMx7qi9nj6/Rqmm6vv606LJj9632vLYKKf+YWgb3pTEqK16UavS8klcDGwvIRoS1iazX7eIZwJPWJK+0Afw3CJ6ECCAMwPLs1KXuLAuqi6CAvTsjirUwJZIFF8efw9MIJf0Ep/LZ5RU4gI+oqW6KSis1b5AY//BAuBir+VAK8uHRh4rlBoER0tnIa0cDLTzKF51rAcFfq7P/YIiDdU335SAnV3j0HquZzrsqWU0Fi5hhNqmWvAXHaZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(33656002)(2906002)(8936002)(1076003)(52116002)(66946007)(186003)(6666004)(26005)(5660300002)(55016002)(86362001)(16526019)(66476007)(33716001)(9686003)(316002)(4326008)(66574015)(478600001)(6496006)(956004)(83380400001)(6916009)(8676002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?u7JrKfuoU/fq7aN4TfI2gOYqBfISqruqKsUd1KQXZ5HQXEzN0ocidnhZpr?=
 =?iso-8859-1?Q?1v/RYVsvAIKaxPdhdmwffFJxoIL/3ksjo4pKIxeWQZP4XI53/PQfvioDd0?=
 =?iso-8859-1?Q?ANZeP2ma91s7EH3HY0fHc/2eNnMKDBm32/yztnognz4kyebR6gOrDCgu6A?=
 =?iso-8859-1?Q?z/mCkjQwns/UcJhFWluGwkQUd6EdQlaQGQqEdCh4qK/UN9iGQwKz7PTa6W?=
 =?iso-8859-1?Q?NhTzIlgGW4STFZr92n/RFGNQaxj5miC9p7MiDUGCM5rrSGnwPw54vfeRW+?=
 =?iso-8859-1?Q?c0mo30wjIdGpPPk3X/T6JAIVs759L2pG/U/zXZrz0h82u70FBGXLyahiRq?=
 =?iso-8859-1?Q?CIbijxHfNSEJpffheV0kEF3DgpkN9JYAOjKNJfYd/GyT1Wm8ODfn5OFTrg?=
 =?iso-8859-1?Q?W6TrPKg7myyQW/iTaEmRHTEDB9Zw4j0C+y8ac5XY+tezo/lsd5Gp5Wsf72?=
 =?iso-8859-1?Q?iYT8s2yM7CtU/8I5vkbFtdtiSrP8q+Mut4BoLPC4VHXIY4Z0PBYkq7i5Ru?=
 =?iso-8859-1?Q?x8mrSKgMtqc4WVhVN9DyJRrrYFxAS/nwPlarTfrqGRpCEpXqNJYvneVkGg?=
 =?iso-8859-1?Q?9rILKEdfikYU7Yn0AawDNA956rZauzxSU0ulLKSA93WGSc/o46FEMoJfht?=
 =?iso-8859-1?Q?U3I4EizW2D6nM9+Pz0DpOUKfr/Fw3XXl0MAVWwO+EEN3dRlI8QuPTmHuQG?=
 =?iso-8859-1?Q?6kilT+EbjehvbO6S+TAg6XbdBrHT7TLjUUS99wIyi7tJELK0V+cig1c6+y?=
 =?iso-8859-1?Q?jUUhRB6McQhwyDbzvnYWteialAxzF/qFNY+6glkLKmvwl2YLYU1W5dFXXk?=
 =?iso-8859-1?Q?0Etq6JeI2Ahm32N5mb4h6egfPc9MJZIxkQmeTDrI58CUyDHbBgUQjp67Yx?=
 =?iso-8859-1?Q?81jFvh9llG+DVKZWvZKUu1e7qtKMnzgfUF7irs6ZLlmAvPtI0Q8mmC6TnX?=
 =?iso-8859-1?Q?UKjks1Y69YGMZbsW2sO2u7rY1LHyp+T732CVtNTxD/lYU9kngwrdTP2EPn?=
 =?iso-8859-1?Q?UXlyBjC7FbvwCmc9AISTC8/RexXayCYiRb+enQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 11:07:14.7138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 4add10c6-d90d-4d48-afa6-08d8b6ea37dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7brjSkhNP/8sHLctcZatIyJbsa6O5rgzR6kg/TYdpg2pHt/vtfDfFZON1FWHq8sI9U0FM+EEt7Cck144OkCkSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1599
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 12, 2021 at 06:49:18PM +0800, Christian K=F6nig wrote:
> Ping? Ray can I get an acked-by? It's an important bug fix.
> =

> Thanks,
> Christian.
> =

> Am 11.01.21 um 14:57 schrieb Christian K=F6nig:
> > set_pages_wb() might sleep and so we can't do this in an atomic context.
> >
> > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> > Fixes: d099fc8f540a ("drm/ttm: new TT backend allocation pool v3")

Sorry, missed this mail yesterday.

Patch looks good for me.

Reviewed-by: Huang Rui <ray.huang@amd.com>

> > ---
> >   drivers/gpu/drm/ttm/ttm_pool.c | 20 ++++++++++----------
> >   1 file changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_p=
ool.c
> > index a00b7ab9c14c..6a6eeba423d1 100644
> > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > @@ -66,7 +66,7 @@ static struct ttm_pool_type global_uncached[MAX_ORDER=
];
> >   static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
> >   static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
> >   =

> > -static spinlock_t shrinker_lock;
> > +static struct mutex shrinker_lock;
> >   static struct list_head shrinker_list;
> >   static struct shrinker mm_shrinker;
> >   =

> > @@ -249,9 +249,9 @@ static void ttm_pool_type_init(struct ttm_pool_type=
 *pt, struct ttm_pool *pool,
> >   	spin_lock_init(&pt->lock);
> >   	INIT_LIST_HEAD(&pt->pages);
> >   =

> > -	spin_lock(&shrinker_lock);
> > +	mutex_lock(&shrinker_lock);
> >   	list_add_tail(&pt->shrinker_list, &shrinker_list);
> > -	spin_unlock(&shrinker_lock);
> > +	mutex_unlock(&shrinker_lock);
> >   }
> >   =

> >   /* Remove a pool_type from the global shrinker list and free all page=
s */
> > @@ -259,9 +259,9 @@ static void ttm_pool_type_fini(struct ttm_pool_type=
 *pt)
> >   {
> >   	struct page *p, *tmp;
> >   =

> > -	spin_lock(&shrinker_lock);
> > +	mutex_lock(&shrinker_lock);
> >   	list_del(&pt->shrinker_list);
> > -	spin_unlock(&shrinker_lock);
> > +	mutex_unlock(&shrinker_lock);
> >   =

> >   	list_for_each_entry_safe(p, tmp, &pt->pages, lru)
> >   		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> > @@ -302,7 +302,7 @@ static unsigned int ttm_pool_shrink(void)
> >   	unsigned int num_freed;
> >   	struct page *p;
> >   =

> > -	spin_lock(&shrinker_lock);
> > +	mutex_lock(&shrinker_lock);
> >   	pt =3D list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
> >   =

> >   	p =3D ttm_pool_type_take(pt);
> > @@ -314,7 +314,7 @@ static unsigned int ttm_pool_shrink(void)
> >   	}
> >   =

> >   	list_move_tail(&pt->shrinker_list, &shrinker_list);
> > -	spin_unlock(&shrinker_lock);
> > +	mutex_unlock(&shrinker_lock);
> >   =

> >   	return num_freed;
> >   }
> > @@ -564,7 +564,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct =
seq_file *m)
> >   {
> >   	unsigned int i;
> >   =

> > -	spin_lock(&shrinker_lock);
> > +	mutex_lock(&shrinker_lock);
> >   =

> >   	seq_puts(m, "\t ");
> >   	for (i =3D 0; i < MAX_ORDER; ++i)
> > @@ -600,7 +600,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct =
seq_file *m)
> >   	seq_printf(m, "\ntotal\t: %8lu of %8lu\n",
> >   		   atomic_long_read(&allocated_pages), page_pool_size);
> >   =

> > -	spin_unlock(&shrinker_lock);
> > +	mutex_unlock(&shrinker_lock);
> >   =

> >   	return 0;
> >   }
> > @@ -644,7 +644,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
> >   	if (!page_pool_size)
> >   		page_pool_size =3D num_pages;
> >   =

> > -	spin_lock_init(&shrinker_lock);
> > +	mutex_init(&shrinker_lock);
> >   	INIT_LIST_HEAD(&shrinker_list);
> >   =

> >   	for (i =3D 0; i < MAX_ORDER; ++i) {
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
