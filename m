Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 259E0611A27
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 20:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372F410E8A5;
	Fri, 28 Oct 2022 18:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115E210E8A5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 18:33:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLV4wTVtQbiQaWL6lpWV0XUBlQggazuQ7NdVJe13lh7OjiSZJak1lNHVGB/PeiluxtN7OV5wJeaBrLVv8cPvsCY1KxHRtV5jDkPzNr2dHhPgQsbUflM0wkAQ2oY8/sy0tCsnrynqy0QheYy0ywDIBaxr6Qgg9j3/biUuDfRBHOLkl7IxCifPW6rLf/kc1A4q6PpMSrksov8doiL9lkbUpS86/QhM3ezP2tABQ74VhoJ5vw//m7p/G4RcPvtnGfSTkyRu1V+dUyyt9MhGC2OKQTE7DJ+HYRH2cDuzwCmSUNNGotgV8flq2IwdCN9qhHsSkaaLScNxmAmICXVPOgdkaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwbntNA0wtNv8I0jAM4zM3Lxf2EUKVQ3eqTs6a1Ij6g=;
 b=c9cfgzhTWSe9VcWEX4z5qf6WX5HypFpUNrCjnxYM7oHUCIDyDrbQCNRHdzH2PU9PHfKVXcMO6Dx1pW7uPQaMIwFds7bZHfM2xXi1Oida45z3zt2/bpQ9XBTtSPQ7nPxMo9tMOu/C8V83xDF37I1ePnVx4W0PN9uaKSfVi5P6I1TNE4SftuCwK5VaeGeh5QzQ/JMlIIUfagcPId7QN7eCVhGNf+HwBKL9DHF0JzBNsGA7M8GDcM2Cx4a4Bbryig3fM5+gwZSwd1xzCswrgPIXg539/fFagZxGVIywDNztfAuwm2FFT+it2OAw+arDMbIBTsq3sg6gZSclPZQbzGcU7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwbntNA0wtNv8I0jAM4zM3Lxf2EUKVQ3eqTs6a1Ij6g=;
 b=Ugy591lBWAAd7Zdu/GsIb5dxaS2E6VZq40ltVIz0FIN8gShVtZ9YmqnjwyF6TQYvm1tHNCH3N5Kwn5wrodZ3lZbsf0LhB2J6EQbZ9tvwQWoS/U9xp/vPgFaEFYReZX9updGTUzu/IpL+Zq/27AWsBORsplukevNFujOnJVuTJ9ZdrGWXFWIT/B7voW1qcZzvqFGXn7MmeesZuJopnUotpNfRcb89euJetERD/rhF16kw0EaexnRGbyVqZ5I5omp6fzf2MvlD5DWm/1hQUjH1AGU42IgJhkCAcBpy67jaI9o7U/VRlDdN7TJDAzkhXHz2eQXeqJ6NokCJB32Hu5SeZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5730.namprd12.prod.outlook.com (2603:10b6:208:385::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 18:33:27 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 18:33:27 +0000
Date: Fri, 28 Oct 2022 15:33:26 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH] mm/memremap: Introduce pgmap_request_folio() using pgmap
 offsets
Message-ID: <Y1wgdp/uaoF70bmk@nvidia.com>
References: <166630293549.1017198.3833687373550679565.stgit@dwillia2-xfh.jf.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166630293549.1017198.3833687373550679565.stgit@dwillia2-xfh.jf.intel.com>
X-ClientProxiedBy: BL0PR0102CA0035.prod.exchangelabs.com
 (2603:10b6:207:18::48) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5730:EE_
X-MS-Office365-Filtering-Correlation-Id: 77540522-2b2a-434b-4e6e-08dab912e799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IyCbmLXH/EgyiOig0IArC6RpwQOH0prhB2AVL97I7MsopgVqZpD8TlM0jJDemnilfCbLh4th+t95mqC/zx76NdDAZD5y3laawL2P/JWPEZrFYiq/yxmubLz7D9nAnwSb/VStswRdU2tyd8RD5JJ1UoxDQ1ohCU8MQYtfGI+XfNEFjrCSAfAt5g3nD5JGm6Z62Ej1AqZO73wlvVxfz+NT80qcHeBbNL7Ux5vDD9AdUb3Qmbmne8AphwKtPrvMQfLTs1q8RNEdI7HXxJQrDlLQjS03ThvvIIwQiX++iFgD+DDZBlOcuCEPvVULXco0FW6yD1TT9wrFEikg9dWqwxFYnU0bGaSKF/eAROlVJKZF/Im88/WqFrR47MdeBrEYRnMxSq5tS6uklMf1MI1Zuda3q7SjxkruTKtxIbPhGZoLRhCbzlYKP7e6yfZFmTqxY/eBdJ/FXABHmVj5USaj6CH/7KqavQ34vaitbcAbvWq9SIl3wHmW067inJZF4lwWwoKHGWbzPlZbv0xfWlVU5zSFZXgYlJg4HPbrL8E22fI/tF2ZO+7laVC8QqPMj5CcIuC7Mytq3CnXkb9p8ggmp8kgFalvHk9o4zPTCdtJSwtCSqmNFHpmOdKDTsCLH39ighljBQweBQRvC2iPlMbXG8Y0jXSAaGblTRjFwTKLLFQUPOncAVItiKFcx5CNe5fMw5Pc3v2Z7a8vEZiLa/6FHq1Vqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199015)(186003)(66899015)(2616005)(6512007)(83380400001)(26005)(2906002)(6506007)(7416002)(41300700001)(66556008)(54906003)(66946007)(478600001)(38100700002)(6486002)(5660300002)(6916009)(36756003)(8936002)(8676002)(4326008)(86362001)(316002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wWREoK5JdO/KyfVmte5HzCh+hKPWUPYp8RlsgbxolUT8qeK3pk6ejRc22hUe?=
 =?us-ascii?Q?7EqI1oWrODfb8e/X0ttftZCbzagh3RtbxqroIF69oYE/IcabU+nZDlF0nRaL?=
 =?us-ascii?Q?vrDmewH8jYwFysZUinJDAx0cCexfyXKuLpjuNFsH1mh0pA3/O9IOTgmHohOz?=
 =?us-ascii?Q?+YG4PNzHyhlbUy6kyJyeyR0zwXEd5V7Kbsw6XyCsFEspcX5hghRJ2QnJxTQk?=
 =?us-ascii?Q?K0/ZxhyGH3WnFQEjYqWGyLKtqNkFUw7Ojwe7sCYNafqSWqr3RsMMyCSM46HU?=
 =?us-ascii?Q?7HjrQeGzYmDO99voFQbPKcBRMqPCBohc/qxl+OSR1oWkC+VdA1dCbhaPRlJv?=
 =?us-ascii?Q?9wyVddeP/Zg/7HTUdkENXFQiZr7OEZz2v12J5WHsqNj4zdrMKI/O9K3fU0c8?=
 =?us-ascii?Q?l9Wjrnp1OSx4nYNpMzeYnbumueAhJov+QBevnM/mHY7gdCHVcLijHM6vuwvu?=
 =?us-ascii?Q?aVLGfS5rLYyH6KyuqDNjAQTKMYo181Pk8bm29R9tgD4xVUQPOdVzYLT33Kme?=
 =?us-ascii?Q?f5sOpC93ComDgzYROb2fXs6HTSSq+22sNYNd7yRig5J+gwVLsuVvsY1liWpX?=
 =?us-ascii?Q?kEF94voFOW+2/fUUfz0zKf0Mn9gntvqDocMIy9ggYQLH65z7XKG7A8UR/Vrq?=
 =?us-ascii?Q?eH/xLhIBJOzxj/ThYEBQeiaDA9sjHz/CAmc2TYR6m/+s1QpwjUVU9TE/xFs2?=
 =?us-ascii?Q?sD3pi59Z5r9IA2k7JbNsOIkSVHufPeMkAi8zhFgRZoNaEN6GbqV1m9JHp8Oq?=
 =?us-ascii?Q?blhoq2/BIHVe0LO/zPjE0gPM34M/6XKP7j8m3Va7MVEZu2eWswtZTfII69TI?=
 =?us-ascii?Q?h52R/GwVZlOXKPNI1pBhI3U6LupTWCKGh09BJOHOe07pGrS08J3X0JFKDDgy?=
 =?us-ascii?Q?z/w+5JWFa9GZ/eP2pzjueZy3ESJkT3N0GBe9dOZx7kuRO93t9eNe390RRUzb?=
 =?us-ascii?Q?n4ODOqaxdkqmH06Lm49pyuo4lPDGkJHVMor80on2F+YqzmF0vXVObq4p/AYC?=
 =?us-ascii?Q?z1R+Q6ozF0hot1jj01FtMfvHnkWDtVRKy2jVd6OVZF5WLsCyd0IzzZvxs3Rl?=
 =?us-ascii?Q?l9KpOXo9S0I9j9bnaFNoQqv/30MLBp6m+A/AfHTSYfp2uZmL04VetNRO7NvY?=
 =?us-ascii?Q?/zkxnQp0rKUDIQ32k4BgmyCBXaEwTNCTViVCUkl+S3DB3BUiEFtjBaYERgRV?=
 =?us-ascii?Q?lSnIZZrl7X8Gf4b0q/ZQ7PCcsUmOJ8NLFpUZJRdQuJDo68WUbd5EnZM23dXw?=
 =?us-ascii?Q?L+7VCGLjR00DEQHTn/uf0E2uEQcpmhxaG/OwsnAAbOKP6zRo5gu0pA0mekqz?=
 =?us-ascii?Q?cgvSuYGuzKvwyZJ8Mik507funoTzLObRGREsa4M2Dk3G2/i/5DV4qa76EuiI?=
 =?us-ascii?Q?CQw+yOESKQ4JRk5U6wgvNzrquAduSyz0TYE0guRmUKZMSYPIxj0aZIQ2dTt8?=
 =?us-ascii?Q?8VOfiP2D5S6M1xm6eh0GoPBnDmSBdq341gf9t1fU+PG3LRtOezYKwMaPmgP5?=
 =?us-ascii?Q?C6gVo91jl6frppAX79Ffx5Xj3sveY2xCmJMZlpxbASD6CJlrJS9wIBWppmcu?=
 =?us-ascii?Q?sVvvb+aIWQ11dJ9m/Vw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77540522-2b2a-434b-4e6e-08dab912e799
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 18:33:27.4354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jpYjsq59Op4B4j7BnUQ4EJjtJugw/t7datrUEXvURslxcUHSeP/zj1OwVMVs3QHu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5730
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
Cc: nvdimm@lists.linux.dev, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Jan Kara <jack@suse.cz>, dri-devel@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 "Darrick J. Wong" <djwong@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alistair Popple <apopple@nvidia.com>, Matthew Wilcox <willy@infradead.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 02:56:39PM -0700, Dan Williams wrote:
> A 'struct dev_pagemap' (pgmap) represents a collection of ZONE_DEVICE
> pages. The pgmap is a reference counted object that serves a similar
> role as a 'struct request_queue'. Live references are obtained for each
> in flight request / page, and once a page's reference count drops to
> zero the associated pin of the pgmap is dropped as well. While a page is
> idle nothing should be accessing it because that is effectively a
> use-after-free situation. Unfortunately, all current ZONE_DEVICE
> implementations deploy a layering violation to manage requests to
> activate pages owned by a pgmap. Specifically, they take steps like walk
> the pfns that were previously assigned at memremap_pages() time and use
> pfn_to_page() to recall metadata like page->pgmap, or make use of other
> data like page->zone_device_data.
> 
> The first step towards correcting that situation is to provide a
> API to get access to a pgmap page that does not require the caller to
> know the pfn, nor access any fields of an idle page. Ideally this API
> would be able to support dynamic page creation instead of the current
> status quo of pre-allocating and initializing pages.
> 
> On a prompt from Jason, introduce pgmap_request_folio() that operates on
> an offset into a pgmap. It replaces the shortlived
> pgmap_request_folios() that was continuing the layering violation of
> assuming pages are available to be consulted before asking the pgmap to
> make them available.
> 
> For now this only converts the callers to lookup the pgmap and generate
> the pgmap offset, but it does not do the deeper cleanup of teaching
> those call sites to generate those arguments without walking the page
> metadata. For next steps it appears the DEVICE_PRIVATE implementations
> could plumb the pgmap into the necessary callsites and switch to using
> gen_pool_alloc() to track which offsets of a pgmap are allocated. For
> DAX, dax_direct_access() could switch from returning pfns to returning
> the associated @pgmap and @pgmap_offset. Those changes are saved for
> follow-on work.

I like it, though it would be nice to see drivers converted away from
pfn_to_pgmap_offset()..

>  /**
> - * pgmap_request_folios - activate an contiguous span of folios in @pgmap
> - * @pgmap: host page map for the folio array
> - * @folio: start of the folio list, all subsequent folios have same folio_size()
> + * pgmap_request_folio - activate a folio of a given order in @pgmap
> + * @pgmap: host page map of the folio to activate
> + * @pgmap_offset: page-offset into the pgmap to request
> + * @order: expected folio_order() of the folio
>   *
>   * Caller is responsible for @pgmap remaining live for the duration of
> - * this call. Caller is also responsible for not racing requests for the
> - * same folios.
> + * this call. The order (size) of the folios in the pgmap are assumed
> + * stable before this call.
>   */

I would probably add some discussion here that this enables
refcounting on the folio and the pgmap_ops page free will be called
once the folio is no longer being used.

And explain that the pgmap user is responsible for tracking which
pgmap_offsets are requested and which have been returned by free. It
would be nice to say that this can only be called on free'd folios.

> -bool pgmap_request_folios(struct dev_pagemap *pgmap, struct folio *folio,
> -			  int nr_folios)
> +struct folio *pgmap_request_folio(struct dev_pagemap *pgmap,
> +				  pgoff_t pgmap_offset, int order)

unsigned int order?

>  {
> -	struct folio *iter;
> -	int i;
> +	unsigned long pfn = pgmap_offset_to_pfn(pgmap, pgmap_offset);
> +	struct page *page = pfn_to_page(pfn);
> +	struct folio *folio;
> +	int v;
>  
> -	/*
> -	 * All of the WARNs below are for catching bugs in future
> -	 * development that changes the assumptions of:
> -	 * 1/ uniform folios in @pgmap
> -	 * 2/ @pgmap death does not race this routine.
> -	 */
> -	VM_WARN_ON_ONCE(!folio_span_valid(pgmap, folio, nr_folios));
> +	if (WARN_ON_ONCE(page->pgmap != pgmap))
> +		return NULL;

Checking that pgmap_offset is not bigger than pgmap length is also a
good assertion.. At that point if pgmap is not right then the struct
page has been corrupted.

>  
>  	if (WARN_ON_ONCE(percpu_ref_is_dying(&pgmap->ref)))
> -		return false;
> +		return NULL;
>  
> -	for (iter = folio_next(folio), i = 1; i < nr_folios;
> -	     iter = folio_next(folio), i++)
> -		if (WARN_ON_ONCE(folio_order(iter) != folio_order(folio)))
> -			return false;
> +	folio = page_folio(page);
> +	if (WARN_ON_ONCE(folio_order(folio) != order))
> +		return NULL;

Do you see a blocker to simply restructuring the pages into head/tail
here? If the refcounts are all zero it should be safe?

> +	v = folio_ref_inc_return(folio);
> +	if (v > 1)
> +		return folio;

IMHO, ideally, this should require the foilio to have a 0 refcount and
this should set it to 1.

> +	if (WARN_ON_ONCE(!percpu_ref_tryget(&pgmap->ref))) {

This should not be a warn on, there should be races where the dying
check could miss but the refcounts all reached zero anyhow.

Jason
