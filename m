Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E68282309
	for <lists+dri-devel@lfdr.de>; Sat,  3 Oct 2020 11:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DC36E2E1;
	Sat,  3 Oct 2020 09:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0396E101;
 Fri,  2 Oct 2020 16:19:19 +0000 (UTC)
Received: from HKMAIL102.nvidia.com (Not Verified[10.18.92.77]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7753020000>; Sat, 03 Oct 2020 00:19:14 +0800
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 16:19:10 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 2 Oct 2020 16:19:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6hPXdODBseL26BhbRZS3p+D48l26Z4dnxkphJQza7gLyRqzZy7yvHP9hRjyeBrPZt/vO/fq1Ua4VK1E0t+eyuI9NlECgVetrM6+I4mj7kFnC5HJOYkLypT08CmSD9E/40B35g/VzoGXJXiZ3U6i2ENzCyAJm7fJFDvs8WWrxwOzhiV4P8olnvBzfDUpaL3ypla9AfAujnPBinvONbHJF//8bm1TEuQ7kojXI8FWiOVJ1KaXS+tjoSzb2YQ5aycnmJDmuYcb0JhEGoUuPBPC2lltuMd7jsF2x5Wqm9FxYEMM9/fa0usoiHba8MhpvTrKEXM5G53jgGAa0Ya21EaP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfhCU4BqWl744V0A8uhrBWr2Km5jVCXnZBEZss7cHLA=;
 b=l19EYNn+Y9AyRksOLMKLW6U3WE8ZN0dKH/OZ0LThbX9IcM+Pp1GKaZ+SRP8K+EuUT9C3hKp36A/v5zynUeEcmTzpqoKlcIhs8jLZ5qBKlM88HqQ9pw4GeRq+e7skRuYitlurNRQuBlJOcSgzmrEr+717dkd3/tQFdJW1NS3iuI/tFToQMQqYEYHObTqzeTJtoCIaWKFntCZ6Aho70QOcJHNYuaw1MeMBqTVaHXGMMpw6kSAzMQpbuCiPRnLSGJXsxYwBxUtBMLi1subpnt9LwU0cX+l4vms/6z7psQQ9qZSH8iPj8lsANit1hMX/ZkmFV2UfFu5Q7+V5wFZEpeY++Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB2858.namprd12.prod.outlook.com (2603:10b6:5:182::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Fri, 2 Oct
 2020 16:19:07 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3433.038; Fri, 2 Oct 2020
 16:19:07 +0000
Date: Fri, 2 Oct 2020 13:19:05 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Maor Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH rdma-next v4 1/4] lib/scatterlist: Add support in dynamic
 allocation of SG table from pages
Message-ID: <20201002161905.GJ816047@nvidia.com>
References: <20200927064647.3106737-1-leon@kernel.org>
 <20200927064647.3106737-2-leon@kernel.org>
 <20201002150227.GA1350139@nvidia.com>
 <ba152cb1-db38-0d70-08a8-ba3c052b5b4e@nvidia.com>
Content-Disposition: inline
In-Reply-To: <ba152cb1-db38-0d70-08a8-ba3c052b5b4e@nvidia.com>
X-ClientProxiedBy: BL0PR01CA0026.prod.exchangelabs.com (2603:10b6:208:71::39)
 To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 BL0PR01CA0026.prod.exchangelabs.com (2603:10b6:208:71::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 16:19:06 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kONlx-006214-3p; Fri, 02 Oct 2020 13:19:05 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601655554; bh=cfhCU4BqWl744V0A8uhrBWr2Km5jVCXnZBEZss7cHLA=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=PcBb27SoY/4CZPJ4JoKHJ9MWxRMmFox9A2SURHGQeBMWtluouFUSnzApay5O0AzTR
 h8RJ3Pu4eUDB+0d3KBPeTvvyx3rC7FCiioe03QSaVGjG8c8PAVtC2lbT62TSA1rJaN
 pDIIK3pg7Hy6MLuVgKolOzW1uBVAapFWBGHP0l1AteVCfN2lOiqOaw15IkEQnDHNsa
 Dg1XbyZLZtgHR1Z/oea9GdZPYygJ1eml1MsctroehJT9QH0Cv/C4GAhFbOj3rBIn5T
 Jp86zoW2g+YYmEQrIUWDvuTNMm5IrmUaUNusbKs13fw61AgEIyvqVVEZ5VMo3jDY+t
 1NficvusmJByw==
X-Mailman-Approved-At: Sat, 03 Oct 2020 09:23:39 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Roland
 Scheidegger <sroland@vmware.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maor Gottlieb <maorg@mellanox.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 02, 2020 at 07:11:33PM +0300, Maor Gottlieb wrote:
> 
> On 10/2/2020 6:02 PM, Jason Gunthorpe wrote:
> > On Sun, Sep 27, 2020 at 09:46:44AM +0300, Leon Romanovsky wrote:
> > > +struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
> > > +		struct page **pages, unsigned int n_pages, unsigned int offset,
> > > +		unsigned long size, unsigned int max_segment,
> > > +		struct scatterlist *prv, unsigned int left_pages,
> > > +		gfp_t gfp_mask)
> > >   {
> > > -	unsigned int chunks, cur_page, seg_len, i;
> > > +	unsigned int chunks, cur_page, seg_len, i, prv_len = 0;
> > > +	struct scatterlist *s = prv;
> > > +	unsigned int table_size;
> > > +	unsigned int tmp_nents;
> > >   	int ret;
> > > -	struct scatterlist *s;
> > > 
> > >   	if (WARN_ON(!max_segment || offset_in_page(max_segment)))
> > > -		return -EINVAL;
> > > +		return ERR_PTR(-EINVAL);
> > > +	if (IS_ENABLED(CONFIG_ARCH_NO_SG_CHAIN) && prv)
> > > +		return ERR_PTR(-EOPNOTSUPP);
> > > +
> > > +	tmp_nents = prv ? sgt->nents : 0;
> > > +
> > > +	if (prv &&
> > > +	    page_to_pfn(sg_page(prv)) + (prv->length >> PAGE_SHIFT) ==
> > This calculation of the end doesn't consider sg->offset
> 
> Right, should be fixed.
> > 
> > > +	    page_to_pfn(pages[0]))
> > > +		prv_len = prv->length;
> > > 
> > >   	/* compute number of contiguous chunks */
> > >   	chunks = 1;
> > > @@ -410,13 +461,17 @@ int __sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
> > >   		}
> > >   	}
> > > 
> > > -	ret = sg_alloc_table(sgt, chunks, gfp_mask);
> > > -	if (unlikely(ret))
> > > -		return ret;
> > > +	if (!prv) {
> > > +		/* Only the last allocation could be less than the maximum */
> > > +		table_size = left_pages ? SG_MAX_SINGLE_ALLOC : chunks;
> > > +		ret = sg_alloc_table(sgt, table_size, gfp_mask);
> > > +		if (unlikely(ret))
> > > +			return ERR_PTR(ret);
> > > +	}
> > This is basically redundant right? Now that get_next_sg() can allocate
> > SGs it can just build them one by one, no need to preallocate.
> > 
> > Actually all the changes the the allocation seem like overkill, just
> > allocate a single new array directly in get_next_sg() whenever it
> > needs.
> 
> No, only the last allocation could be less than maximum. (as written in the
> comment).

The point is that get_next_sg is fully redundent with
sg_alloc_table() because it is always used in cases when prv is
set. There is zero reason to call sg_alloc_table here in the one case
where prv is not set.

Further this cleans up the spagehtti goto in the middle of the for
loop and avoids allocating an extra chunk if the page list fully fits
in prv.

Given how much smaller it is I think you should look more carefully.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
