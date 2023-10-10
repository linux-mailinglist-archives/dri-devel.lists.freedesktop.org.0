Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1BE7BFE6C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CA310E371;
	Tue, 10 Oct 2023 13:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2064.outbound.protection.outlook.com [40.107.96.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B56710E371
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:51:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWCHUvDCt65Bps1AhLf3Jr+4Z3qr4H9p6Qu5U8S/EMVmGDkGTK2qJt/Eh20fi3Hr0I4ZoYMZP5lbAhGE52QxclmxFBZ39WYO3BcyPWxAAOtxDJ7/tUHNixMQtKi5vahc45MaGv4hXsjMgeJbrqrcQ4cn0UVE+FijAOsXy/JPGq4g+MJg0vfknOXU+J5t6mTdMJI0KJLyN17X5ynqCn7YhVgMlZqiVZb3m9auuwo2S0h9XRIFfcCzgwa6+aor1XP9/vAGot5g0mFkMO9qeQTYLpyjel74Eg6DeAmlljY0y67zUUrio1JelIyHLPTbrIQoeffx1J0iXSRAN52+CjU6Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZD56zNKoM6ku4Q2hBJLfJaLyzfO/3OSj8JAkLUhC+k=;
 b=W6Qkc1VLEolAqDDkq1L0tN7RMu3Uv0K+9o6LFNHngrk7pqDq/qDty8vng1DM4dFxa7YTbI0bELVkSZORp3mnDswsB2/RfLq5ex7fQBZzpm8JsDzGJK0WL6t1cZdGUvBqmVGR0E5qqDBequZ0vpMkSGX/Q/7m/Z7E21meZv5gMEARlkJssyJEPAypKrkD+vhePXC+OYFu8io6e+WKKty9OoWVaaF/4oFNPRaI7gi2/UtGU1NwXInrgxeevR5jfg1xtuaSmJNQY7+SFRyja24xMEYvzr1NslZ8pOB8tYwtGeT0miamjAce4WTWPQ0oQAgoTP1t4VE7wOG3EXZQVr2KgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZD56zNKoM6ku4Q2hBJLfJaLyzfO/3OSj8JAkLUhC+k=;
 b=OMpeo4NkOJQqyEsTL2LctW974375/8Rgnz7JAOpQScl4IfsnDp2p3LC6xZ6p2fEwXjrC5ghoVKonKXUfWlWxMZ/EzKDAk9+FNZCC4ipnl6r+uXhAdNkoTZpNajqDG7b0Q7fiFiLj6tog2zZ4eb3utJ7pn9RGzn719ZyU7coE8QzeaPxa8HowqIaMMJsHJezIKWs9xYJ6ly72u5NT8dVVaOEsg2apirY6X0nlI1sCM6xGwuX1LOhCt9rrhaQoL4eytF7ENHEDm5YDwORRMJ4eGlNswEscnakXnHhVv0wwhppReKTFmvNk9KNSSAz261IHBq6tdmBoiUHck+aSmU2rUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ0PR12MB6784.namprd12.prod.outlook.com (2603:10b6:a03:44f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Tue, 10 Oct
 2023 13:51:23 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2%6]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 13:51:23 +0000
Date: Tue, 10 Oct 2023 10:51:21 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v1 1/3] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages
Message-ID: <20231010135121.GK3952@nvidia.com>
References: <20231003074447.3245729-1-vivek.kasireddy@intel.com>
 <20231003074447.3245729-2-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003074447.3245729-2-vivek.kasireddy@intel.com>
X-ClientProxiedBy: BL1PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::25) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ0PR12MB6784:EE_
X-MS-Office365-Filtering-Correlation-Id: de15ae1d-c1fe-4adf-e714-08dbc997fd9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ifjf+wKzMi9M/eEeMaYlCYsG0apSqNoGvZZAGriVCIP23r1Avdy9F/jvHJOAefqf58yFm9jq9xTTegOfH/tzegKX4mgMOvsHqpphf8hutgRVKOAM6mWKNLkxguiw8BRg3sVdJnT9pE5AWEQg8gcNKkFpCvMKaZaX+/xNzR7dapin3IGrfyxI12i9kYT47kjg1phutBY1NvdSDN9isElRoZjZ3rFgIcDhGjxs+W/m53BkKuDgW8SmwQxrpBFG+X+h9LcnKbdBjIz6+nceBZsn8BpBtKqeY5Ckcn03CWwB71JllPwKGnxLstbhdTmhqvsH2b8bZSpL+N9CQiBZiL8+dIL9+yf7U5ccdU3kng+ltRHVMxfAywY15dFv3oKTs3lsrHRLwzrwRc7VhBnNne4pYHdqnvxP3rVjNN2LUOuQ8FhLj5Ej2ohF24JVSpv1ggojpl5Fq9U6Y8GTks5WoZ0nNzF8htLzWRH36lL5owY3zL4HIWlaVhJLHggzQCwIrXOluTdNwPaFiXnHaiKxGzOptB1rg7u2u7KOzRI/uc9ZhjxsCymUCA5D9TUG8WKlVWJm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(83380400001)(36756003)(478600001)(6512007)(6506007)(38100700002)(54906003)(6486002)(1076003)(2616005)(26005)(66556008)(66946007)(66476007)(6916009)(316002)(41300700001)(8676002)(8936002)(4326008)(5660300002)(7416002)(2906002)(33656002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8oL0//rBB+6+u+efndCvnlCn32d7kqnw721lD2uADfpaHGNOjeHgLmkqPfvz?=
 =?us-ascii?Q?bIviBgmq5hz3YRWokoGlR/4ir3vZf3E3ogHFw1MFW1OZYy8zDCGbzhnVBsSV?=
 =?us-ascii?Q?YpEh0/JqhR6gStu9cU1RAGKnWd5pTKsdJ9O+Jbcr97vYw2A1yBJqK8i+ojUp?=
 =?us-ascii?Q?/Gx/h+TGtNsDrMgCjs+9roK40lnTNxn1Jf+peGTdG4bs5zoJcu+7SDEk1Kni?=
 =?us-ascii?Q?H6gLD8ZYoGPqltrizBtCqXrHvm0CT0mPozOzYGW0MMqRprqM41ORvfIU51nn?=
 =?us-ascii?Q?5dvJO72emTLBtkRVjldgNs4iQfXqEYq3Oamzud6SW4Gsv9W9K8C9wU6G3l10?=
 =?us-ascii?Q?ZHtl7PKZOOKhcoACsRfrIBRcU/k5Mu+gjOf0clu/CToQRT3zdDjpgQLTNE1g?=
 =?us-ascii?Q?OwW+Une6YYlO+hFH24GndyMn2OnyAcYgxtpaySdVrMXvsu8LLb2Drt683l3C?=
 =?us-ascii?Q?fK1F5Lvg0kLyTxZtDAnqXSWQNQ9WD8Oz0NySVe00QX1u38xaRbmAsrbutoNc?=
 =?us-ascii?Q?KDCxNy8QJ134mINhf9Nc4myy1PRLSVNqiGYMFQumgLnJiQXC9pjAF0v8Z9Fq?=
 =?us-ascii?Q?vUf+ZHnWvPs/GQIoWOukDG2zikOWGhwmTi2/ZXfO86it4mcUHfxPZ4peJXdZ?=
 =?us-ascii?Q?GLmchUGDqfg60rLnyBpR3gsZV0YeAginrhT9S8HGsRZ08Xkhz9ZyWwU0Xlvf?=
 =?us-ascii?Q?LFqZTtlouf+KPZop4Qf1xNOpYSYNeC9Nd801UpvFABwMzLsDQeOD8yGGBFD+?=
 =?us-ascii?Q?2wLk4tSdrHXkoqdVAeM/33xMl+dlY5dGZDvF0h9HXH7KZGdvIAyN+LKLBr4M?=
 =?us-ascii?Q?womw2GpN0lXZpiWNQhe+5GYWjQPmKP3je8lmKlNZETEYGWf6JM4gfgOOGwUa?=
 =?us-ascii?Q?n4I1yU7u/MB1OhRc6APRs6MdvM0NUg1OMiXkipMsLEu9ykbLMjea2Muk2ld0?=
 =?us-ascii?Q?++AaDu3Wp2Yo/XDzvjE2LGOecEZdCWsIFgFX9CMz1s0mg/kLTLQSW9H8PevL?=
 =?us-ascii?Q?F9pYbt7b3Xdld7iWThtkMCeH36SwLYVQ+Smg0fvOuV5aDCW9S6a1zvxkCOTx?=
 =?us-ascii?Q?nBvSFzk8MdYHj+81egO7ORIG2b4yaVXFAvT+bnwkMSd+is0v/BKmjO/Epka3?=
 =?us-ascii?Q?59yERtDCZ2NpnFR5vD5+muQQQNjJ7OiLlwhmvPSTqbjqNv/11Py8xn1AzrLf?=
 =?us-ascii?Q?wjafupR8zGvJYdTiZKmEiKnMe+Wv1M4TON7Ff20TCrm83f0HTg9qkqlTy5QY?=
 =?us-ascii?Q?ITIsEQCOWF9M/uV/qdOA4iG+GS9H1mvvzEVKriQgTKRI77/k1uNm2/oDFV1y?=
 =?us-ascii?Q?qBB/RdYSljDUgD4X6W04kwkPlq2W3bHntJgLpncMjThNNAwPkQn/yi4a77Hy?=
 =?us-ascii?Q?ZUuaO5wswUnb1FMJPNRLDAQYQwDw37u+8a0/BSi36ytQ6sGDQaLWhUL8w5Zx?=
 =?us-ascii?Q?QaV3C1VtHwiJq63D/0wD8TVxT2x+WFPXokDLyg150mHxZvhUH7ffasuxWstP?=
 =?us-ascii?Q?LLcN81fFoxQrFS1XRsJbLKE5JeP2ucb70ZxPiMBSzgzJ57+Eh1abYf6bLtEu?=
 =?us-ascii?Q?pbm/MHw6atRN6R3OZBTPkJ3gkNSeuPAENghwH/Ek?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de15ae1d-c1fe-4adf-e714-08dbc997fd9e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:51:23.8180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XoMB4cqym4pPddxp3u46R6q11zRLhoPB+tqSkip5f/PAxainQPhNjGvXId4AEv8/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6784
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hugh Dickins <hughd@google.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Peter Xu <peterx@redhat.com>,
 Junxiao Chang <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 12:44:45AM -0700, Vivek Kasireddy wrote:

> +/**
> + * pin_user_pages_fd() - pin user pages associated with a file
> + * @fd:         the fd whose pages are to be pinned
> + * @start:      starting file offset
> + * @nr_pages:   number of pages from start to pin
> + * @gup_flags:  flags modifying pin behaviour
> + * @pages:      array that receives pointers to the pages pinned.
> + *              Should be at least nr_pages long.
> + *
> + * Attempt to pin (and migrate) pages associated with a file belonging to
> + * either shmem or hugetlbfs. An error is returned if pages associated with
> + * hugetlbfs files are not present in the page cache. However, shmem pages
> + * are swapped in or allocated if they are not present in the page cache.
> + *
> + * Returns number of pages pinned. This would be equal to the number of
> + * pages requested.
> + * If nr_pages is 0 or negative, returns 0. If no pages were pinned, returns
> + * -errno.
> + */
> +long pin_user_pages_fd(int fd, pgoff_t start, unsigned long nr_pages,
> +		       unsigned int gup_flags, struct page **pages)
> +{
> +	struct page *page;
> +	struct file *filep;
> +	unsigned int flags, i;
> +	long ret;
> +
> +	if (nr_pages <= 0)
> +		return 0;
> +	if (!is_valid_gup_args(pages, NULL, &gup_flags, FOLL_PIN))
> +		return 0;
> +
> +	if (start < 0)
> +		return -EINVAL;
> +
> +	filep = fget(fd);
> +	if (!filep)
> +	    return -EINVAL;

I think the caller should pass in the file *

In some cases we will need to hold a reference on it for a long time.

> +	if (!shmem_file(filep) && !is_file_hugepages(filep))
> +	    return -EINVAL;
> +
> +	flags = memalloc_pin_save();
> +	do {
> +		for (i = 0; i < nr_pages; i++) {
> +			if (shmem_mapping(filep->f_mapping)) {
> +				page = shmem_read_mapping_page(filep->f_mapping,
> +							       start + i);
> +				if (IS_ERR(page)) {
> +					ret = PTR_ERR(page);
> +					goto err;
> +				}
> +			} else {
> +				page = find_get_page_flags(filep->f_mapping,
> +							   start + i,
> +							   FGP_ACCESSED);
> +				if (!page) {
> +					ret = -EINVAL;
> +					goto err;
> +				}

I don't know these APIs at all, but I admit to being surprised we need
the special case for shmem ?

> +			ret = try_grab_page(page, FOLL_PIN);
> +			if (unlikely(ret))
> +				goto err;
> +
> +			pages[i] = page;
> +			put_page(pages[i]);
> +		}
> +
> +		ret = check_and_migrate_movable_pages(nr_pages, pages);
> +	} while (ret == -EAGAIN);

It seems OK, but I do wish it was faster :) Maybe for another day.

Jason
