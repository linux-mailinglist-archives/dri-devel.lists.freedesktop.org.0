Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A57FF2FFE7B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1A76E9B6;
	Fri, 22 Jan 2021 08:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 300 seconds by postgrey-1.36 at gabe;
 Thu, 21 Jan 2021 17:04:23 UTC
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C57B6E0B6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 17:04:23 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6009b2e90001>; Thu, 21 Jan 2021 08:59:21 -0800
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Jan
 2021 16:59:21 +0000
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Jan
 2021 16:59:14 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 21 Jan 2021 16:59:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhDtqBuzDQvA0i7uixdE9lRLyH8FXSlkzPRTOyevmvzsRFV1gDBSx1UfugCzoUKchMMlXm6afX9IW7+F7wMWXZsdgmNRFdEHUzHm8GMSwiYKU71VeIf8lL20bJwX4tpeTjrGenVL2w2qufqe4CS/MymfzRJ6zewTyWt8xkTH/AZX5f123gBA0Eu5M85JecAffxsLzJMz0REJ3BbJ7m/5V21Nofb+TvDMMO8OIv6W5E4VQ2BOCedkr+Ns8BpXl1foO6JbAIBTcOfhLVzqSYaQ5gn2qpYPoBVMMlljeY+HJmO4dvFbc9ldYaSIABvZfKy/UTSSI2NFRB9y7cphKNOMqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySgBPBUcnGhRCLdVhLCCc2WbSy0IU7H6SBuWiaOIui4=;
 b=CLqH+6WqAGI+sKKUtMEZSlTe0cU+OdyHDN2xwUTqTxjxFdVqbEitCp4coK4zJ0kP3xjmof0XoMVJsZ+u737HlSFgv3Kk9OoCSrfcSHpbIAltT9cKKoj4DHlZN3T182HfDI/DHFRH0XE9i67yP72/hnYotL618t40gF8vjeK+MfT5yOOzb9glVElO8kQmu5JB3mXUHbYwnu0GACU1BSXYgmJ8+5K15/oV7D/xjFkCBb9DD8M1oXrB2Gi85G5QgcEk2GbEZW5QEaCST3Z69YjwmVUccvWd8zs84Ubx9fPnifoy+7IK7omWIdIKTjrgn5Qx70yi0gcV1c1vbnYIzCumNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB1434.namprd12.prod.outlook.com (2603:10b6:3:77::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 21 Jan
 2021 16:59:10 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::546d:512c:72fa:4727]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::546d:512c:72fa:4727%7]) with mapi id 15.20.3784.011; Thu, 21 Jan 2021
 16:59:10 +0000
Date: Thu, 21 Jan 2021 12:59:08 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
Message-ID: <20210121165908.GA1145246@nvidia.com>
References: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
Content-Disposition: inline
In-Reply-To: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
X-ClientProxiedBy: BL1PR13CA0535.namprd13.prod.outlook.com
 (2603:10b6:208:2c5::30) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 BL1PR13CA0535.namprd13.prod.outlook.com (2603:10b6:208:2c5::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.5 via Frontend
 Transport; Thu, 21 Jan 2021 16:59:10 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1l2dIa-0056pd-94; Thu, 21 Jan 2021 12:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611248361; bh=ySgBPBUcnGhRCLdVhLCCc2WbSy0IU7H6SBuWiaOIui4=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=EuIzT32YP7C8ZS0pDPNz/sFmTO4qVhk7JBG2tF5S9H/KQjRfGUsgKRD75nk4QeEvp
 vVW9DrssGx/4nfOiHgVilbocGnJjQIDEmOWhgSx2wTriNCvF6Yy0dVO5XT9D8aFOTe
 LOyJGDKh+tDhvwxD26lh0D6week6VGBiclsYVjU1G/mh90JcSgCAUyKvb6xQ2Gdpt4
 S5udfZQm/ZFaj3go+7IihAug4ZATk4Tk1HpFQmXnNME4a6sFdlxr4ZGjQd8E4AWAry
 gmqXXlIbC3VhAvd6GHW1RY2MaICdbpdIwAFQgQSPGkSR7dnZJNmywvOd2PvOM7PYPt
 PHrmSPSFZ8nkg==
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
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

On Tue, Dec 15, 2020 at 01:27:12PM -0800, Jianxin Xiong wrote:
> Jianxin Xiong (4):
>   RDMA/umem: Support importing dma-buf as user memory region
>   RDMA/core: Add device method for registering dma-buf based memory
>     region
>   RDMA/uverbs: Add uverbs command for dma-buf based MR registration
>   RDMA/mlx5: Support dma-buf based userspace memory region

I applied the below fix for rereg, but otherwise took this to rdma's
for-next

Thanks,
Jason

diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
index f9ca19fa531b45..a63ef7c66e383d 100644
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@ -1825,9 +1825,6 @@ struct ib_mr *mlx5_ib_rereg_user_mr(struct ib_mr *ib_mr, int flags, u64 start,
 	if (flags & ~(IB_MR_REREG_TRANS | IB_MR_REREG_PD | IB_MR_REREG_ACCESS))
 		return ERR_PTR(-EOPNOTSUPP);
 
-	if (is_dmabuf_mr(mr))
-		return ERR_PTR(-EOPNOTSUPP);
-
 	if (!(flags & IB_MR_REREG_ACCESS))
 		new_access_flags = mr->access_flags;
 	if (!(flags & IB_MR_REREG_PD))
@@ -1844,8 +1841,8 @@ struct ib_mr *mlx5_ib_rereg_user_mr(struct ib_mr *ib_mr, int flags, u64 start,
 				return ERR_PTR(err);
 			return NULL;
 		}
-		/* DM or ODP MR's don't have a umem so we can't re-use it */
-		if (!mr->umem || is_odp_mr(mr))
+		/* DM or ODP MR's don't have a normal umem so we can't re-use it */
+		if (!mr->umem || is_odp_mr(mr) || is_dmabuf_mr(mr))
 			goto recreate;
 
 		/*
@@ -1864,10 +1861,10 @@ struct ib_mr *mlx5_ib_rereg_user_mr(struct ib_mr *ib_mr, int flags, u64 start,
 	}
 
 	/*
-	 * DM doesn't have a PAS list so we can't re-use it, odp does but the
-	 * logic around releasing the umem is different
+	 * DM doesn't have a PAS list so we can't re-use it, odp/dmabuf does
+	 * but the logic around releasing the umem is different
 	 */
-	if (!mr->umem || is_odp_mr(mr))
+	if (!mr->umem || is_odp_mr(mr) || is_dmabuf_mr(mr))
 		goto recreate;
 
 	if (!(new_access_flags & IB_ACCESS_ON_DEMAND) &&
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
