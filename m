Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD96228472B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5246E372;
	Tue,  6 Oct 2020 07:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E346E1B7;
 Mon,  5 Oct 2020 23:57:00 +0000 (UTC)
Received: from HKMAIL102.nvidia.com (Not Verified[10.18.92.77]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7bb2c80000>; Tue, 06 Oct 2020 07:56:56 +0800
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 5 Oct
 2020 23:56:54 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 5 Oct 2020 23:56:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dipvrrvzmQtdftM3EV0BGWuO8jt44pKFHgZqNjLwaSAnYNHejDNtU95If8O/ycCi0TcG8FYGiMIa8E/dubdFbFecErYGZVIMoqjaVns6mO14qqT4NkGrZZQfx+xAHYyNUv7dJHu3jKGRCOZMu39F1zj4uMtaRWKT2iZ+xl1P0a7W+RwOQxsXhizkpK+IV09UAKWrasmkfjsJUkI8ccs/26uSji/LtUTWlv/gEFW3GfRgjY59QDcfIWXl7oqNI+5+cqZAdVXpbR8sT+egfJRNYb4ehAnkPJwfVmRXr94zdrP80z+Vkbh9yhw4mnEbQE26mjZhdE9b8Do6qDQDqKUWiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eC//KVXSEK8lQeTwFlktPVzROBgORX/GvC90m/bkQQc=;
 b=jR5TALhaA+6B5WJ+ZJO1fk8+deV4hrQMa98hXPB6rWUNRJC/plXORE7LLO/au1zXgbNTZsy1oyZOp/ywVdIDx1n9y9wP793/JTRJCotNmHeYRkm1FrxnORNtnEWoQFvN5c8hEVlA+waV5LFrM4SCpBMi3TmT3nwujr5v4/Zh8awuk5z3/DBjJ8NNk32n3F/PccjC7JPIHbjJnENtfeReUHsC3yy1gKbNeHbveeedRS1IdEiKIaOVGtdSixJ56VsMtP2W6AmBGGYmEUjlTlEOtjWEQSMcNQ2ktXkR1PueT4ItpYZcuwQqsnchPWnMLqFRkxpEa/EYv1VQlofdqER0Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR1201MB0201.namprd12.prod.outlook.com (2603:10b6:4:5b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Mon, 5 Oct
 2020 23:56:51 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3433.044; Mon, 5 Oct 2020
 23:56:51 +0000
Date: Mon, 5 Oct 2020 20:56:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH rdma-next v5 0/4] Dynamicaly allocate SG table from the
 pages
Message-ID: <20201005235650.GA89159@nvidia.com>
References: <20201004154340.1080481-1-leon@kernel.org>
Content-Disposition: inline
In-Reply-To: <20201004154340.1080481-1-leon@kernel.org>
X-ClientProxiedBy: MN2PR08CA0025.namprd08.prod.outlook.com
 (2603:10b6:208:239::30) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR08CA0025.namprd08.prod.outlook.com (2603:10b6:208:239::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.39 via Frontend
 Transport; Mon, 5 Oct 2020 23:56:51 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kPaLa-000NDN-DP; Mon, 05 Oct 2020 20:56:50 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601942216; bh=eC//KVXSEK8lQeTwFlktPVzROBgORX/GvC90m/bkQQc=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=k5CtK4UbOhkQN8n8jvbhpqmHp02fFysPyRIi6D8HbfXOgIm85IeTsS3fP2OWpiqpz
 bfGeMGKFMvNRWoo5ZcCn0wv20bBKSPopEpcE5yqeXgceYo5Ii/daTLCH/fh2uqTUgB
 m5bmcWKrJmUgXpU4heuEft2eocN7WhutKb7UN3Ju4gSjvltb8VZl3kzyC9AYJjcPvv
 OIeT84dOKm0JPZ+SGvokwaDcD9DaKd5E3mu8wd3b+fauUOjr7hHdyeigjXBHFpN1fb
 f+RqTF3d+t6Y41hdJ6balQGyPxwdQ23Ihz5dHT2Uy0wUEJUUlpUXXBDlUlJ59zVD1a
 JASor+OHDHM1A==
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 Maor Gottlieb <maorg@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 Doug Ledford <dledford@redhat.com>, VMware
 Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 04, 2020 at 06:43:36PM +0300, Leon Romanovsky wrote:
> This series extends __sg_alloc_table_from_pages to allow chaining of
> new pages to already initialized SG table.
> 
> This allows for the drivers to utilize the optimization of merging contiguous
> pages without a need to pre allocate all the pages and hold them in
> a very large temporary buffer prior to the call to SG table initialization.
> 
> The second patch changes the Infiniband driver to use the new API. It
> removes duplicate functionality from the code and benefits the
> optimization of allocating dynamic SG table from pages.
> 
> In huge pages system of 2MB page size, without this change, the SG table
> would contain x512 SG entries.
> E.g. for 100GB memory registration:
> 
>              Number of entries      Size
>     Before        26214400          600.0MB
>     After            51200            1.2MB
> 
> Thanks
> 
> Maor Gottlieb (2):
>   lib/scatterlist: Add support in dynamic allocation of SG table from
>     pages
>   RDMA/umem: Move to allocate SG table from pages
> 
> Tvrtko Ursulin (2):
>   tools/testing/scatterlist: Rejuvenate bit-rotten test
>   tools/testing/scatterlist: Show errors in human readable form

This looks OK, I'm going to send it into linux-next on the hmm tree
for awhile to see if anything gets broken. If there is more
remarks/tags/etc please continue

Thanks,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
