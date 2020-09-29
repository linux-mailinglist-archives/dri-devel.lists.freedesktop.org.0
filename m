Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E68E827E2EA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 09:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB32C8982C;
	Wed, 30 Sep 2020 07:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCAF897C5;
 Tue, 29 Sep 2020 19:59:34 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7391c00000>; Tue, 29 Sep 2020 12:57:52 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 29 Sep
 2020 19:59:32 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 29 Sep 2020 19:59:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpQE0xXT6R29dDNNYmU5LuVUlx8pz4e3aWmZ9nOvpzFwhmgEcsCw859SIedWOJdmXXSQqny47/pOOyVMp8+Cb86Aot6oDc/QD+62YVggk/rshDd9AHksNWemqqo0mZsPeYJIJNfjOR349YlV9utM2yMCr+baszsluLE8/UE81zy7VqdN7DRV5W8qDp9hGhUKnjlTfYbGBWy3KWER53gGf5ozbf4BuNiZZnu7jw64sQJdpLC6Xc5pv+g9Eq+yh0Qp7MbXmw4RnrW65Dk7aZcpty6g0FTPgQNqiKNu/dbZD6siwQZh0lk4FWoODN8eFQph6PIvFVbArEyfMHsMBU7pfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbTynvgPyPjA+95ZRshJ0r2pHgwVG61L3zu9wlQdKUY=;
 b=lROk2rtY9LlIV0VV+uyXYH0pK6gOM7W91Fh/acYxP218J6NnSZoo6rAVTD9u14rXzulc+APDClUQK7fa+SdPW5f+zK9cxHbTBtYorxgr3SEqEwKfUy+KxkCnsCZEV0u2GE8inr0h/yIeuRX4W9prkDg00J7bLQNA6HglpRlCig5ZqE+KF62W3cIOPTCVZlg+0UmifqxAXPWc/UGqSn5wEN54ytvgcW8nnEcNTKHLhS7MxZCjThmh9NBhJH+FzLClwVWEwDO+k2cx5kVJ+QMHPHagUBdtjbcyzYmiegC0hC2qMFJoY4W8h18fju5wMn9KbqJdSR049ZVG8qcVAHUvpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3209.namprd12.prod.outlook.com (2603:10b6:5:184::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Tue, 29 Sep
 2020 19:59:31 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 19:59:31 +0000
Date: Tue, 29 Sep 2020 16:59:29 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH rdma-next v4 4/4] RDMA/umem: Move to allocate SG table
 from pages
Message-ID: <20200929195929.GA803555@nvidia.com>
References: <20200927064647.3106737-1-leon@kernel.org>
 <20200927064647.3106737-5-leon@kernel.org>
Content-Disposition: inline
In-Reply-To: <20200927064647.3106737-5-leon@kernel.org>
X-ClientProxiedBy: MN2PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:208:23a::33) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR03CA0028.namprd03.prod.outlook.com (2603:10b6:208:23a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Tue, 29 Sep 2020 19:59:30 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kNLmb-003NQ0-Io; Tue, 29 Sep 2020 16:59:29 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601409472; bh=LbTynvgPyPjA+95ZRshJ0r2pHgwVG61L3zu9wlQdKUY=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=iSmska3JZTIwY67fbkfO3gQL7hZD6bfd47hENqfwiNTYSB5LY6cGsQm+jZ+sYMRHO
 JxfHosdNev+wqVzoOV7t82t96iLfcRbDLNiG58sA6X/waxJSkvzcPVNAAbEQUBmhke
 ebZaoB456MkvM9RITmUnZsTIfajHih+nZR4gFs4CUf8HXgxLLovMa5gBAHDSH8Rbxn
 2fGaMrhaoPm6HuEg32KEe/0Q9InmJ/zntpZsX4yR/uaBat9HN27tHmSEJisHHzdz62
 LwXQPFrR0z8urAf4OB8SCh0m8DWleuVmmwGiBl5M42mABlUwgq4Q3Gt2elJadwLkLF
 NayfjPM/0geOw==
X-Mailman-Approved-At: Wed, 30 Sep 2020 07:50:09 +0000
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
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maor Gottlieb <maorg@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 27, 2020 at 09:46:47AM +0300, Leon Romanovsky wrote:
> @@ -296,11 +223,17 @@ static struct ib_umem *__ib_umem_get(struct ib_device *device,
>  			goto umem_release;
> 
>  		cur_base += ret * PAGE_SIZE;
> -		npages   -= ret;
> -
> -		sg = ib_umem_add_sg_table(sg, page_list, ret,
> -			dma_get_max_seg_size(device->dma_device),
> -			&umem->sg_nents);
> +		npages -= ret;
> +		sg = __sg_alloc_table_from_pages(
> +			&umem->sg_head, page_list, ret, 0, ret << PAGE_SHIFT,
> +			dma_get_max_seg_size(device->dma_device), sg, npages,
> +			GFP_KERNEL);
> +		umem->sg_nents = umem->sg_head.nents;
> +		if (IS_ERR(sg)) {
> +			unpin_user_pages_dirty_lock(page_list, ret, 0);
> +			ret = PTR_ERR(sg);
> +			goto umem_release;
> +		}
>  	}
> 
>  	sg_mark_end(sg);

Does it still need the sg_mark_end?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
