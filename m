Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFB42913FA
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C66C6E20A;
	Sat, 17 Oct 2020 19:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EA86E849
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Oct 2020 00:28:28 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f8a3a500000>; Fri, 16 Oct 2020 17:26:56 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 17 Oct
 2020 00:28:20 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Sat, 17 Oct 2020 00:28:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCO6hP5KbCBWx1NJlV8ZJnW+tL9fXgPjrvqQJTrnAS16dX41nQ3uHXsQ6ymCYaApyLAX/Wba57+u1LTCJqLTjbFcl3xzVOcr7lIhxbPwtBElTQi2AJohYECvlIu4pAfgaK08WyySNdenhhNhev1yUdUdB5A+4DsC4jp8jNAZZ6Kc+rNJa4r+ouqSq2gMTK5SYD27fiANAmaxX5ueerKIfEj7cgRI3A0VQZpqqoZPWySYmAAJ2ZZhONxvh1mh5XAYn/tc5TxfVgd+bxwvoxuh97be+HwayZ5nukbQCw4YOSR6XOnkeUJGHaBcRbTGagCnC/9RVMVoe1BUCLbhumf21w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVE1fw1NI1nwsmeN/2prcO99rO8jINgr985drAaXQ1Q=;
 b=frzAfHPHGkUCet+ArUfPUPVYHZVzmWUdnzQ0iEcf4TvY6A3BqivXyxzEVpIXe0UnLWAJodLBC2NTBaqUkaoRkECdQNxXkeQuax4JDeTkpCHE8CWw7JlwULM3QDF+p4JoXwvPZZTQQjuSbfvMcJhHbl+Wx+NJCu0EExPXjvmOtoHn87miiW+Pc0cBvMVBXvuIvHJKcd8HgTkOCu321epHraH6s1FBpqL6FYgkxrsVQA/OQ5u2NTQ0NAjp/ZoZesptvKTvVq/V50ECwMvWUxxcs4njhMBWgu7t8ZKos+SK65RZbWknqx0ngAOMHRWxkOA8AWChpTs7GdS4PueZGGZAeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB2857.namprd12.prod.outlook.com (2603:10b6:5:184::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.27; Sat, 17 Oct
 2020 00:28:18 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3477.027; Sat, 17 Oct 2020
 00:28:18 +0000
Date: Fri, 16 Oct 2020 21:28:16 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v5 1/5] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201017002816.GA334909@nvidia.com>
References: <1602799365-138199-1-git-send-email-jianxin.xiong@intel.com>
Content-Disposition: inline
In-Reply-To: <1602799365-138199-1-git-send-email-jianxin.xiong@intel.com>
X-ClientProxiedBy: MN2PR16CA0048.namprd16.prod.outlook.com
 (2603:10b6:208:234::17) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR16CA0048.namprd16.prod.outlook.com (2603:10b6:208:234::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.23 via Frontend
 Transport; Sat, 17 Oct 2020 00:28:17 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kTa52-001PEr-Lz; Fri, 16 Oct 2020 21:28:16 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602894416; bh=iVE1fw1NI1nwsmeN/2prcO99rO8jINgr985drAaXQ1Q=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=SKeGzT4j5o/zTDon5qq8GsoUb5KfMblmN/zeQDD+OhmVKEQHpdxAoDeOYDkonRgIX
 0P8SEUNrmszeVvPzf0HAoA8MSI/9+G5XDYDS1s3AHy9sG3vvMfhI2tcRX1frTkLXIc
 52USzEkEqlwNCT/SnVm30CG1kLhgrhOS/8yTbcxCherqLkeRLpZQlno20Dy4VuB9pa
 o7af+/s/Gx1GDrw4HKVe0hi3I73Hhqq8dzU3IXfHbbuCcugMmyX5SBZBXVtVMJf07t
 Q6GyhSX+pvEtCQQPaJokuvudAtHRRClTUJkiDHvpOR4lhNbjYh/DsBrWdHp8h8apmp
 2tMLRZgi3ZUGw==
X-Mailman-Approved-At: Sat, 17 Oct 2020 19:04:47 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Doug
 Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 15, 2020 at 03:02:45PM -0700, Jianxin Xiong wrote:
> +struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> +				   unsigned long addr, size_t size,
> +				   int dmabuf_fd, int access,
> +				   const struct ib_umem_dmabuf_ops *ops)
> +{
> +	struct dma_buf *dmabuf;
> +	struct ib_umem_dmabuf *umem_dmabuf;
> +	struct ib_umem *umem;
> +	unsigned long end;
> +	long ret;
> +
> +	if (check_add_overflow(addr, (unsigned long)size, &end))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (unlikely(PAGE_ALIGN(end) < PAGE_SIZE))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (unlikely(!ops || !ops->invalidate || !ops->update))
> +		return ERR_PTR(-EINVAL);
> +
> +	umem_dmabuf = kzalloc(sizeof(*umem_dmabuf), GFP_KERNEL);
> +	if (!umem_dmabuf)
> +		return ERR_PTR(-ENOMEM);
> +
> +	umem_dmabuf->ops = ops;
> +	INIT_WORK(&umem_dmabuf->work, ib_umem_dmabuf_work);
> +
> +	umem = &umem_dmabuf->umem;
> +	umem->ibdev = device;
> +	umem->length = size;
> +	umem->address = addr;

addr here is offset within the dma buf, but this code does nothing
with it.

dma_buf_map_attachment gives a complete SGL for the entire DMA buf,
but offset/length select a subset.

You need to edit the sgls to make them properly span the sub-range and
follow the peculiar rules for how SGLs in ib_umem's have to be
constructed.

Who validates that the total dma length of the SGL is exactly equal to
length? That is really important too.

Also, dma_buf_map_attachment() does not do the correct dma mapping for
RDMA, eg it does not use ib_dma_map(). This is not a problem for mlx5
but it is troublesome to put in the core code.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
