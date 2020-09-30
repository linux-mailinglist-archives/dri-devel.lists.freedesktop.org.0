Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 829D727FB58
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E606E87F;
	Thu,  1 Oct 2020 08:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381F46E0AB;
 Wed, 30 Sep 2020 11:58:43 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7472e50001>; Wed, 30 Sep 2020 04:58:29 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Sep
 2020 11:58:41 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 30 Sep 2020 11:58:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2EvexECMXk0gLDS728KRDPpIrs6GBzTyOM0BC8KbJRceHNw2e5Z9G7qbniVjZfR9sue6V9ONpHwaJEKfbx84YpTlrsUqTUIKCJdmom9Cpb6lwEpc0R6q9cSg4i1cNHEFGI2QY2RRShvsxDKP7aSHoVEQq9rwjQP5qDh96YWLKhHjEDgfeUejxNRmgxa1t/WPhOTDals9ysURBvAShgg/ItbsIl311LG9HZGKttzObHdm5QElbfUT5LlQYJzdz/nHxgw/HaqF0LZP+X8DHbOgnEURQ1Ydmk/XxJsR/QMjQ4h5C1l9jgwcsew7MjotFGGiy/rxT3Osi9fFxaQFvg3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rhl15iQQ2nhZJ+bcGnlINA2ynwLtbeh4dQh9msgBhCE=;
 b=io+gnHtSKQifoUgxJgY3j8rIp5zZ0/LxU3lCez9geWd6CVWe8tJNHFEcMMlmbe0BDHDppNuJBFKfK9fwCJ5ESqa+jA2s6ZH51oaugu9cpak15b+BI2uTK9CaK9bJDtuXACzEJFEBJnA1hWaIyd83/y2ZxtlEo4pTwm7t24fQRn2JNq2KXDsfv2ZxXwroFY6XK5gjcQDL3z/tmgmwYbrO/quYv60v9j07rM/SkrJBYDCWfmJlID3ey5UQM3Ai0aFf9M5H+LcXbc8Pa+lzRUX8nvTvCdr6lhgeqK8kq5rPwiqOeXZUOmAE1U/R3xqMvS6gzrybrJYM1MictAHPSy355A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB1244.namprd12.prod.outlook.com (2603:10b6:3:73::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Wed, 30 Sep
 2020 11:58:39 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 11:58:39 +0000
Date: Wed, 30 Sep 2020 08:58:37 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Maor Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH rdma-next v4 4/4] RDMA/umem: Move to allocate SG table
 from pages
Message-ID: <20200930115837.GF816047@nvidia.com>
References: <20200927064647.3106737-1-leon@kernel.org>
 <20200927064647.3106737-5-leon@kernel.org>
 <20200929195929.GA803555@nvidia.com> <20200930095321.GL3094@unreal>
 <20200930114527.GE816047@nvidia.com>
 <80c49ff1-52c7-638f-553f-9de8130b188d@nvidia.com>
Content-Disposition: inline
In-Reply-To: <80c49ff1-52c7-638f-553f-9de8130b188d@nvidia.com>
X-ClientProxiedBy: MN2PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:c0::16) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR05CA0003.namprd05.prod.outlook.com (2603:10b6:208:c0::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.13 via Frontend Transport; Wed, 30 Sep 2020 11:58:38 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kNakn-003vWb-LI; Wed, 30 Sep 2020 08:58:37 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601467110; bh=Rhl15iQQ2nhZJ+bcGnlINA2ynwLtbeh4dQh9msgBhCE=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=JTVIGhFvjwui4mlIeo2K/XI8Ubo93r87mw3+Tr1+CX5ZQfaDIV2p8uT6AgQrKlylh
 /0krm9Tt9zrEjmMJuio2n6pkwz3bY+Yd0fd+uEmr5nt7yhgaPbqR+WuDPkUyt9z6Db
 I4yta0M/n5djqI0zcLOGBQXTeFW9sqlvEikAkgWBGuDuWlCge5LtZn9p2+lLKEE7Ws
 XZnwVWSsPK+bMjVJwZNj05kG57JCf7AuX4P7qRLjiAK1SBVx3bL2tXl+xH5snA6FqQ
 j7WdmXWn84ol/4EmM+OG7s4yF38yUMJn0Iy3Sg9eTvSTR3plMw/RgBRVD19PmLbAmO
 CbgUkj/TdvW5w==
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, Tvrtko
 Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 30, 2020 at 02:53:58PM +0300, Maor Gottlieb wrote:
> 
> On 9/30/2020 2:45 PM, Jason Gunthorpe wrote:
> > On Wed, Sep 30, 2020 at 12:53:21PM +0300, Leon Romanovsky wrote:
> > > On Tue, Sep 29, 2020 at 04:59:29PM -0300, Jason Gunthorpe wrote:
> > > > On Sun, Sep 27, 2020 at 09:46:47AM +0300, Leon Romanovsky wrote:
> > > > > @@ -296,11 +223,17 @@ static struct ib_umem *__ib_umem_get(struct ib_device *device,
> > > > >   			goto umem_release;
> > > > > 
> > > > >   		cur_base += ret * PAGE_SIZE;
> > > > > -		npages   -= ret;
> > > > > -
> > > > > -		sg = ib_umem_add_sg_table(sg, page_list, ret,
> > > > > -			dma_get_max_seg_size(device->dma_device),
> > > > > -			&umem->sg_nents);
> > > > > +		npages -= ret;
> > > > > +		sg = __sg_alloc_table_from_pages(
> > > > > +			&umem->sg_head, page_list, ret, 0, ret << PAGE_SHIFT,
> > > > > +			dma_get_max_seg_size(device->dma_device), sg, npages,
> > > > > +			GFP_KERNEL);
> > > > > +		umem->sg_nents = umem->sg_head.nents;
> > > > > +		if (IS_ERR(sg)) {
> > > > > +			unpin_user_pages_dirty_lock(page_list, ret, 0);
> > > > > +			ret = PTR_ERR(sg);
> > > > > +			goto umem_release;
> > > > > +		}
> > > > >   	}
> > > > > 
> > > > >   	sg_mark_end(sg);
> > > > Does it still need the sg_mark_end?
> > > It is preserved here for correctness, the release logic doesn't rely on
> > > this marker, but it is better to leave it.
> > I mean, my read of __sg_alloc_table_from_pages() is that it already
> > placed it, the final __alloc_table() does it?
> 
> It marks the last allocated sge, but not the last populated sge (with page).

Why are those different?

It looks like the last iteration calls __alloc_table() with an exact
number of sges

+	if (!prv) {
+		/* Only the last allocation could be less than the maximum */
+		table_size = left_pages ? SG_MAX_SINGLE_ALLOC : chunks;
+		ret = sg_alloc_table(sgt, table_size, gfp_mask);
+		if (unlikely(ret))
+			return ERR_PTR(ret);
+	}

Jason 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
