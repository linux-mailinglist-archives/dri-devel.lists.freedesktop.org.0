Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6BB3D2406
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 15:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0141889736;
	Thu, 22 Jul 2021 13:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D145892E6;
 Thu, 22 Jul 2021 13:00:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O39Gmabx1z2eGWZ5V8as5HNpnNmpaAAgSV/XBQTQWDo9n/XFi56z9Ecw1Hh5OaA90biCHt+mc9Ni1d6Y5mCKHKIoXtPrNrj9JtApzNoQbjZXHgytdMyDQ1viHaYomn7A5WfFGeAvIs5Rnvq+YF5pLt7sd9yj3v0+wcZRdpzjdclTfb762viyzG1fDK0KhIAWvgMBKIMr0xAmibqbS2vWSsLWB8wwL6PioP8TXHRHqPWB+VMclXiaoRzCGuaq/rsHQhHenoznBBpAY2ol/4MoJxBUk9jq28MJRBNtZXFLj4vssfVXChNFjnn2tCJXJyTJB23/Z3JLPF4TIdMz41twew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9YwgCHJ0XJArZDHZWl+tareDFbOI+R1eygG4N/Ww0c=;
 b=YhgrD3359FNBVSrEddpZ77tyg3nCND8cGlbpS7WqId+OSBUrDf+d3EXfQGnUUMIl0dXTDjIjQSzx1CtXBHmSBh8gS2NwexU9LliD7FS1DPQmxhmYhyJiI1+6GSpeO1vMW7CRuJpOAWbK34m00ZgqGd2l6ff77xhWJbPNFZHQLEVK1a+JzE3t+HySSn9k5IvBwbcHE9w4DdsfWg8hNl4BUSBmuCD3or0Bf3KITzD2g2ccaD7igdEhaaEVn8FFTlgMCK9zVBfHa/ZZfsnf2tuqj/kZIwVs3gSPeAFpEeE7MvqCSumDvvksHzlKHVVTsWACfTQe7R/ipuhhlHVQxkUQ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9YwgCHJ0XJArZDHZWl+tareDFbOI+R1eygG4N/Ww0c=;
 b=TmgRd4Ds2xI03HU54r/mJ8X1wGTztwrcXDqDXUzmX3DTneRt5Rsmo9Hr51G4zyEh0D/qxwAYOsIgU9747iAIWODpr8uvkqQCGFe5zmiLUCErBIv5hTL1Wj9OwErc1IjJ6yAFJzn59v4GPP3PyYtAE8eAscwcZfV9BgYfES0n8tzoP/5+XxsUdqC1dNh+OzJErY1q9w6H/UlCSXvQzJdeF+1h8jB2arv8w5kTWi+dJdMRjWE5DuCfJBo20DgWm/kfhNG7d8rtPvoWpsncoPzDKaBi5w6/L06HY6cGRiN//Fq90JdOFOoBjWkCAnSPuBzr6vOI4+fPvM13rcyRKz6Blg==
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5350.namprd12.prod.outlook.com (2603:10b6:208:31d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Thu, 22 Jul
 2021 13:00:42 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%4]) with mapi id 15.20.4352.026; Thu, 22 Jul 2021
 13:00:42 +0000
Date: Thu, 22 Jul 2021 10:00:40 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH rdma-next v2 1/2] lib/scatterlist: Fix wrong update of
 orig_nents
Message-ID: <20210722130040.GH1117491@nvidia.com>
References: <cover.1626605893.git.leonro@nvidia.com>
 <36d655a0ff45f4c86762358c7b6a7b58939313fb.1626605893.git.leonro@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36d655a0ff45f4c86762358c7b6a7b58939313fb.1626605893.git.leonro@nvidia.com>
X-ClientProxiedBy: BL0PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:208:91::35) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR05CA0025.namprd05.prod.outlook.com (2603:10b6:208:91::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.11 via Frontend Transport; Thu, 22 Jul 2021 13:00:41 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m6YJc-006DRo-PB; Thu, 22 Jul 2021 10:00:40 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a78ac32-d316-4cc2-e629-08d94d10b619
X-MS-TrafficTypeDiagnostic: BL1PR12MB5350:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5350C47807F4BDD23E3D6864C2E49@BL1PR12MB5350.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yfDYKK1DFAAxa62kBBvpPBa3UHu/VpHRVrfxAoob9hF5AYX2JVb3IcO0dE6gfmA+OSWEvizmByaUDFVN4Vb5S4ggCztzjHul5Ss8KF1ond9YSVicoClEUObMH2IfQrTpG4fZgHfYoToMwlVjGLSzMXJm3RQPjYtBKNNrKIchbjfEa1mEvADGFUJXXdrgW4ze/sy3mA9Hnb4cOy9TmABgLJrB7KQfttugXnOgnqxuvNQVwxFtJe4qMszBPSSl0RDxWKM2cT7PFCdhyOnZKiEgLp56WEpnYDhx7kbf7DuE0LIANtJTzBmADsxJvQDxQ5J747ZX8z3gVrH9nZMzANi6gKdgM0ixzxnTaMJz6nApyPIlGtwNmP19dxLBNrXrKIX5p+44uUyDr0h3F1blzoUffJWRtYKd/LXJO0+p6zbDiRRMBqB1cFFbGrTPtQ98KVibsJRLGbTqvbhmx+HSP+x42wI2PXXcmd2yYWjaaSpHJX0wDZ4jwimadETe52OJs87a7VxxcmW20odoYi+UJvoCynS43/8SlinkgFBy07fc7KqlRtE4OuENh6E8EXJmE1bprc75P7AcUpOtLCf9ZcMiS1+503AcB0goXnNG2prQSIpjlsOssHvWSfDH3Yk3uFoHKFdw0d2PL51fCyElYdotAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(186003)(86362001)(15650500001)(83380400001)(54906003)(26005)(66946007)(1076003)(2906002)(316002)(7416002)(36756003)(5660300002)(478600001)(66476007)(66556008)(6916009)(9786002)(2616005)(4326008)(426003)(38100700002)(9746002)(8936002)(33656002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hb9v9Esj1FYY+Q4t3g8x2wk7t0YdTyKgfQgUa97nkueB+aBMoQoHLnKrXas/?=
 =?us-ascii?Q?gRNXINxAsFlDsLFyHFZ3nAL+hbvcR4tLqh+mv+WIhe9OruN36JMIhaAiT7Hu?=
 =?us-ascii?Q?nyD9JTS/HvAxxTWGJMYkRqCfftSbtJVjtyt5rcfAtbzVdXc7++zsKM7kN40W?=
 =?us-ascii?Q?1kYn+k862f97idba0FVhHh5VLhoXO0zcCndkjJlsPPUBlK/vSXP4fs5YYDDh?=
 =?us-ascii?Q?Cuv9l8fdXEGjNfT/UNAs3nNVX9CMjrrhXUb3eX9ChwDBX91DBXvKlU7f9wbq?=
 =?us-ascii?Q?gfk3tUtxQcAPJjUoTEc1+qhKTpyeKR9h2eCRThTSdr7bBSz3Wqxg0JlQ9VIH?=
 =?us-ascii?Q?FTuXWlBuRL61sU6ROHBCQ17rs2b5ghraFm8MIlMmPSvaPoWFnROayFP5tayb?=
 =?us-ascii?Q?98AvzAambZ+LBGHFoeEAYDkEHh4tawGDn1LapYyLFtNNQuH90tslNOOb7NXw?=
 =?us-ascii?Q?Vrk/Be30WXnNx3iTzqkZt1a7ZSSbp3bYKhTaAEWB6tGbwo+h5uazpQIxsHfH?=
 =?us-ascii?Q?zY2YHNTLQPk3pCgfApySrceSCjq6UKxX1nIWp9flNjBS7rQv/gFWZgYiaN70?=
 =?us-ascii?Q?5OViz1j5Zur5DhbV+m4MU6llYy4XscvK+bgnppIY7+CXHaO4Vuw50w4NI8qz?=
 =?us-ascii?Q?JNh8oWKTnFQ2TrG9pt/3b1h6EV1li/XTn5WhFfaMJBuu/jn+JvxOGRSTcOhd?=
 =?us-ascii?Q?a2lV6bwG5d09amqFcYSDLcad5xlVJhWa6+DkeucVS81SMk16Uy9FAk6MEFNK?=
 =?us-ascii?Q?eTglE6LNtpEh8HUEfTE6WB2OuATLq8blrxd4l+s3wV/Fs+wynrIY2ucI1W5a?=
 =?us-ascii?Q?ls6iwAU94oIvJM1muUideh+qtYFg22h5NqYBslfnrZwyw7FOAWKJRiFm6cuG?=
 =?us-ascii?Q?JipKLh2pOj8yUVJ8977zXbGKAg9BHYTnBnKTz0T081LN7dQ555cl175y1/JO?=
 =?us-ascii?Q?poDV6Fhg6r0EjQHaWXwpw6reFzKNWPd5oRQTvXoZI/hPcn2k6SIDjpV8Vs6L?=
 =?us-ascii?Q?ZkTDbAgfN9tkXitAbwL6gnqGu6IR7aUV4uakNkXdmeq3JEPy0W9mh0tujAki?=
 =?us-ascii?Q?dE92Gu0Qc2LpOVW25ux2UwY3JhFureO8foscVGqsZgqKN0vCywCRQrjvU+jh?=
 =?us-ascii?Q?sKxlGDQyqKOuoUB+hiDwTjLkzsQbEFEhJcPti49QTV3zYjTksbTGIiooLVQl?=
 =?us-ascii?Q?dZEwEc3Tatk2dpVgdFJpvvbRHHfaw6tNufgj5mRzsnP+ddblmmgNF+hEU/Az?=
 =?us-ascii?Q?nIryF3H91VZRcmDYtnxZr0bQUBQ9liyDOxGmxv3qfPyYEBBUEBCzChVrjpUy?=
 =?us-ascii?Q?LJlTcWjuSZfVFvCev205lMGd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a78ac32-d316-4cc2-e629-08d94d10b619
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 13:00:42.1563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ybKh48z2uWt7c2Cx0Hv8W4nhWJp11AeuozVtnYgOAzbq7o5Dd2+B6D9ZLMnxHfYm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5350
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
Cc: David Airlie <airlied@linux.ie>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 dri-devel@lists.freedesktop.org, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Doug Ledford <dledford@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Yishai Hadas <yishaih@nvidia.com>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Maor Gottlieb <maorg@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 18, 2021 at 02:09:12PM +0300, Leon Romanovsky wrote:
> @@ -386,12 +414,14 @@ static struct scatterlist *get_next_sg(struct sg_table *table,
>  		return ERR_PTR(-ENOMEM);
>  	sg_init_table(new_sg, alloc_size);
>  	if (cur) {
> +		if (total_nents)
> +			*total_nents += alloc_size - 1;
>  		__sg_chain(next_sg, new_sg);
> -		table->orig_nents += alloc_size - 1;
>  	} else {
>  		table->sgl = new_sg;
> -		table->orig_nents = alloc_size;
>  		table->nents = 0;

Why does this still touch nents?

> @@ -515,6 +548,7 @@ struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
>  		cur_page = j;
>  	}
>  	sgt->nents += added_nents;
> +	sgt->orig_nents = sgt->nents;

And here too?

nents should only be set by the dma mapper, right?


I'm also trying to understand why it is OK to pass in NULL for
total_nents?

Any situation where _sg_alloc_table_from_pages() returns with
sgt->orig_nents != total_nents requires the use of
sg_free_table_entries()

It looks like there is some trouble here:

	for (i = 0; i < chunks; i++) {
		s = get_next_sg(sgt, s, chunks - i + left_pages, gfp_mask,
				total_nents);
		if (IS_ERR(s)) {

This will update total_nents but after a few loops it can exit without
synchronizing sgt->orig_nents - thus any caller handling an error
return from __sg_alloc_table_from_pages() must not pass in NULL and
must use sg_free_table_entries()

So I would see two options:

 1) Remove the possiblity to return NULL and fix all callers to use
    sg_free_table_entries() on error

 2) Once __sg_alloc_table_from_pages() fails the sg_table is corrupted
    and the user must call sg_free_table_entries().
    ie forcibly store total_nents in the orig_nents and thus destroy
    the ability to continue to use the sg_table.

    This is what sg_alloc_table_from_pages() already has to do

Further upon success of __sg_alloc_table_from_pages() it should be
true that sgt->orig_nents == total_nents so the ib_umem change is
confusing. total_nents should be removed from the struct and only the
failure paths in the function calling __sg_alloc_table_from_pages()
need a stack local variable and sg_free_table_entries()

IMHO this API may have become unwieldly and complicated, I wonder if
this is better:

   struct sg_append_table state;

   sg_append_init(&state, sgt, gfp_mask);

   while (..)
     ret = sg_append_pages(&state, pages, n_pages, ..)
     if (ret)
	 sg_append_abort(&state); // Frees the sgt and puts it to NULL
   sg_append_complete(&state)

Which allows sg_alloc_table_from_pages() to be written as

   struct sg_append_table state;
   sg_append_init(&state, sgt, gfp_mask);
   ret = sg_append_pages(&state,pages, n_pages, offset, size, UINT_MAX)
   if (ret) {
      sg_append_abort(&state);
      return ret;
   }
   sg_append_complete(&state);
   return 0;

And then the API can manage all of this in some sane and
understandable way.

Jason
