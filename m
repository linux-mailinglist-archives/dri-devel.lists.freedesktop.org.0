Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE06291403
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BB76E3FE;
	Sat, 17 Oct 2020 19:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56036E3E5
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Oct 2020 01:04:52 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f8a43250000>; Fri, 16 Oct 2020 18:04:39 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 17 Oct
 2020 01:04:40 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.51) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server
 (TLS) id
 15.0.1473.3 via Frontend Transport; Sat, 17 Oct 2020 01:04:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5Qwe+3ZBtKl/YVMp0s9fHKUmp5HRG258zFj00YeiVvnpZzQ+jg+Fx+Ca8KqheDzjRmYx/Hkk+XY0yyK2OxX+cEnn5xdCCVBDAbyb72HT+7ViXtwdiQAWPjBwF00g90I+4pSH5woZAgK7Ma75SX0q93qInOWA8UD5yi+V2zwCymjC4GGvNmx4vMR+u17tBcgydcCcyJ1EQmJi+cbK9ZDUoSM67+WH0CdC/X2Y7rnZCDoci26s0y/LWF3oXTKbW770TLsoDWxliytDYbvylX9xtVCfBxQO0RcIBRKWZ32FfsEUXORbhzaS5hUTJCbVOWlP+VwqpfAE51eAUpnaswbZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xgtFflxg3bpDIq+93IgyfKNLgFzELy2Lr0cQUv1yzM=;
 b=eLvSCho6ont/7ptBpa8onmtccStdiudG7yO7W1Wxhchmm1aRJfX03qOJpFulzygP43xGVOzqYUgSqID7sCH3M9mf10BGRf+8c5Z3a9DdEqc8yVeIHrOW6CQTNgw+J4umWbVxg1c19cM3OvwrNofYQy4OnwS4oIzag8ocW7kAPp9p2yO9mV47bPb8y1MilsxF2QNLKMmyk38KFsAxltiZmjo2VS0uYT/lGDKrwta0pZUqc+VyvtblfiU8SqdVNKeqY3geDqggFKrR20RgcUwVL+lGFFb27VSCF9ZPoyLaOSjx7YN8JlWP9oIrVKLkj7LDR0WQOsESda8yN9+C5g2LBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3836.namprd12.prod.outlook.com (2603:10b6:5:1c3::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Sat, 17 Oct
 2020 01:04:38 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3477.027; Sat, 17 Oct 2020
 01:04:38 +0000
Date: Fri, 16 Oct 2020 22:04:37 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [PATCH v5 1/5] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201017010437.GZ6219@nvidia.com>
References: <1602799365-138199-1-git-send-email-jianxin.xiong@intel.com>
 <20201017002816.GA334909@nvidia.com>
 <MW3PR11MB45556014C8D85ABC9EBFA97CE5000@MW3PR11MB4555.namprd11.prod.outlook.com>
Content-Disposition: inline
In-Reply-To: <MW3PR11MB45556014C8D85ABC9EBFA97CE5000@MW3PR11MB4555.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL0PR0102CA0025.prod.exchangelabs.com
 (2603:10b6:207:18::38) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 BL0PR0102CA0025.prod.exchangelabs.com (2603:10b6:207:18::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Sat, 17 Oct 2020 01:04:38 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kTaeD-001QCd-AH; Fri, 16 Oct 2020 22:04:37 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602896679; bh=2xgtFflxg3bpDIq+93IgyfKNLgFzELy2Lr0cQUv1yzM=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=O+2trJIXiDSlYVR880Uv2oepRo2fzVGTdoQWCnyimqSnLV9IiZ3gVnK9kyIg6ucAq
 DR6c0mc7qQMm0IKVhlVeyFEfysYdcx62JdlrcNxczsDh3sBnrSQz1xiwdSI9Ib+pUE
 NQ/tQVld2erejjyC7rQzqsnogPy+7cL+MST+o/vs2B5q1GDFZMu3vfmAQBpvfHcpY/
 9xzmdMaBGHNOmzjCQC8DJJ/ddOCAdoJ+dkjhQl+jiqiXIxMwKe+oJzqJ+tZLoQYWKg
 41vJXN3Lj68hlyAMNoZiTWbcLQcC5Sp0amkt2a0iYbuxd0fZAAayjGErmGLdWeqqxR
 wAukK4zIx9JTg==
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Doug
 Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 17, 2020 at 12:57:21AM +0000, Xiong, Jianxin wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Friday, October 16, 2020 5:28 PM
> > To: Xiong, Jianxin <jianxin.xiong@intel.com>
> > Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> > <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> > <daniel.vetter@intel.com>
> > Subject: Re: [PATCH v5 1/5] RDMA/umem: Support importing dma-buf as user memory region
> > 
> > On Thu, Oct 15, 2020 at 03:02:45PM -0700, Jianxin Xiong wrote:
> > > +struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> > > +				   unsigned long addr, size_t size,
> > > +				   int dmabuf_fd, int access,
> > > +				   const struct ib_umem_dmabuf_ops *ops) {
> > > +	struct dma_buf *dmabuf;
> > > +	struct ib_umem_dmabuf *umem_dmabuf;
> > > +	struct ib_umem *umem;
> > > +	unsigned long end;
> > > +	long ret;
> > > +
> > > +	if (check_add_overflow(addr, (unsigned long)size, &end))
> > > +		return ERR_PTR(-EINVAL);
> > > +
> > > +	if (unlikely(PAGE_ALIGN(end) < PAGE_SIZE))
> > > +		return ERR_PTR(-EINVAL);
> > > +
> > > +	if (unlikely(!ops || !ops->invalidate || !ops->update))
> > > +		return ERR_PTR(-EINVAL);
> > > +
> > > +	umem_dmabuf = kzalloc(sizeof(*umem_dmabuf), GFP_KERNEL);
> > > +	if (!umem_dmabuf)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	umem_dmabuf->ops = ops;
> > > +	INIT_WORK(&umem_dmabuf->work, ib_umem_dmabuf_work);
> > > +
> > > +	umem = &umem_dmabuf->umem;
> > > +	umem->ibdev = device;
> > > +	umem->length = size;
> > > +	umem->address = addr;
> > 
> > addr here is offset within the dma buf, but this code does nothing with it.
> > 
> The current code assumes 0 offset, and 'addr' is the nominal starting address of the
> buffer. If this is to be changed to offset, then yes, some more handling is needed
> as you mentioned below.

There is no such thing as 'nominal starting address'

If the user is to provide any argument it can only be offset and length.

> > Also, dma_buf_map_attachment() does not do the correct dma mapping
> > for RDMA, eg it does not use ib_dma_map(). This is not a problem
> > for mlx5 but it is troublesome to put in the core code.
> 
> ib_dma_map() uses dma_map_single(), GPU drivers use dma_map_resource() for
> dma_buf_map_attachment(). They belong to the same family, but take different
> address type (kernel address vs MMIO physical address). Could you elaborate what
> the problem could be for non-mlx5 HCAs?

They use the virtual dma ops which we intend to remove

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
