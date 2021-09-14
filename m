Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4FF40B67D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 20:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B3F6E52A;
	Tue, 14 Sep 2021 18:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530466E528;
 Tue, 14 Sep 2021 18:03:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtwvNpDHcIyxn4MJ/4XS6T1OngN0PAwuwhbsb6ELoUyfhKhc3ZKf6uYE3TQu6ikUAG3tuhN8kftVs+FWD2YHFXvDa9d0gXxFDo9iVYy10gk49DdrOVOvVoXOJOPxp7CNPFmOHHoAp9V9eSalr/4Irikp2QAjpUr13A8vlxUvLyS6py5SYRwNrRkhpYLADceRKaFt9qZj+NQvqtsLsie3n10+A2YYqBFMdphnL7TahA7LQ8ePFDfMdSPG4RMWabzgK6qVYiTTkLRmq1AbzuHXbhfTPU5EEw6enmW1pq5mQrBK8CzTokgfJv4ddmjsblEtsFpWhBCBFq+8gir+tLhO5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=CziS3kcNiMlg1T3C8z/0IzI6f+KlNa+AU7IFzvLvNOY=;
 b=SsJsqzN6PgTKGEFYUvWarmjNoFSQ2qkhoL6baz/0myqxd9kV0yKTycKJkFGCFbCAlBiM9chjhuUWfTn9lZdC7ce4R7HWqVoTUFzXTi9fAGfRMLVvJ8GPDm4/l09Aahs9hPQ2L7pAgBO6Skvp8CjC8ZRb5GAhT2O0VdY924ZURtRgewSt2pVYiZHZY8CLHcKIBzJMDCkFTAnKmg0nNVI+HktHpmCE4daVHNLZye8RHQk5YztfXIrLKfUme4iXZQ/LalVRyiNN28+FSxLButHjsv5maDYkQKAoytsDs35zL3Wrb69wayDO15TAwW+Z7Aos7Yq5AydmzdS21S83suOSog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CziS3kcNiMlg1T3C8z/0IzI6f+KlNa+AU7IFzvLvNOY=;
 b=Kzu6wjOgHbHR5u0XYGPZTfHdZEIYe5+NFEUif88/qAstW60i69Hstzao7CAh8n7G0jqGcg3eka8hOK7zjEIr+G2P3mSQ043SclEPxhV5VH0wAY6yvTGDqrpbrwFQ201lQklnpckM9wTZgPtO0u4KkCBuLnuHhDsAR8BJMHlN4Mo20CXuKCwVNjbfHyMfjgYkzARAz8HTatR6ZYjpHRJyPSars/P0RNaloAcX7HG76Bu5Awnl0ETeJIE+jMXAWnm07VHDPuoTHk6tP8LQ1eFBP0qqItY5KOhRd2K9Pctqb36ZPSpSClmN9kH6vr3dUyeLXAueTA2yZXjwYydeO4Y4YA==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5190.namprd12.prod.outlook.com (2603:10b6:208:31c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Tue, 14 Sep
 2021 18:03:53 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 18:03:53 +0000
Date: Tue, 14 Sep 2021 15:03:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Christoph Hellwig <hch@infradead.org>, David Airlie <airlied@linux.ie>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 kvm@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 1/9] vfio/ccw: Use functions for alloc/free of the
 vfio_ccw_private
Message-ID: <20210914180350.GG4065468@nvidia.com>
References: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
 <1-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
 <YTtBDbVsRveVE3i9@infradead.org> <87sfy7gnr2.fsf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sfy7gnr2.fsf@redhat.com>
X-ClientProxiedBy: MN2PR18CA0017.namprd18.prod.outlook.com
 (2603:10b6:208:23c::22) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR18CA0017.namprd18.prod.outlook.com (2603:10b6:208:23c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Tue, 14 Sep 2021 18:03:53 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mQCmc-000YTR-VB; Tue, 14 Sep 2021 15:03:50 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b13a6db-b226-4577-a1da-08d977aa0339
X-MS-TrafficTypeDiagnostic: BL1PR12MB5190:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5190B774E2E3C55C34B9C5AAC2DA9@BL1PR12MB5190.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E8FvhBcqOISa6XICjz1Urr5f0S5w++LUFgonvJkfaBk29RMP28L4qo5s3oQt59hG9fOEopIwgordIOJoC6S/PgMXIAoXBX051wRKeoFv9KVovPJg0hxRLdsVnygNGVldmLwCCWsfUt+/8Fb86+Py7GWODhKkEunE/50BHsNXtXtjTrgxNI4yQ6ywgs8KZJt9ezQt6+v0v0hBVbuGN85BvrjKE5UAIhA6hpWyPJsr9yeyutdOQQ0gMhpHH1pzyZQy81vwWzasYOn4yWyM2elsHHNbnkjBrsO7RZch/4h8tY8xP8vueoSQVuGyDyuhDuO3lS6s7+CNhI+kxcxLPhTH5TuUiCkBANZdaSFq3PaTykNN6QDYDbECL2Bx5lS9Y+V8LGGYmK5SZI3bKIXHIEEakpuzvTm77RmrDoNF/P7XQizULyZ7SvYzEN8Mdq5WjIAYaijauB6TLDnet2fupBMx0UvNFzj/PUKrEr5SjTE7rArwNo1QbjBPNlpQQtiC1Go9TurxoVZ2Gc/KV+dKju0leoqJWIYWVrEwbEYSD1i0bw+bn6UxzbkYHcYkdldGBuqSMbvh2gUQokjSL3o+BLKo2l2ppNb2e8zGi8mUWpgj86pQso/82xxy/PGSldAwf4vcOhV+QhdlVT1GDRy0wePX3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(66556008)(66476007)(8936002)(36756003)(54906003)(1076003)(33656002)(66946007)(26005)(316002)(2616005)(6916009)(2906002)(38100700002)(8676002)(83380400001)(9786002)(53546011)(9746002)(7416002)(4326008)(186003)(5660300002)(478600001)(86362001)(426003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GHPDTgXzphz0Ldlv8YB1F4hm5ZM03ta0Da3ZwQaUAzgDE2kv8UmbP2G5qt2g?=
 =?us-ascii?Q?hxiUk8cRiNKIhsymVKVIjKpWEnwi+OnYudFrF4LG93DDPzmNH5ML1kS1D6X/?=
 =?us-ascii?Q?3beC/TcY3QUKlV+HNDSSS7LzvylRIW4GF5C5LVTbBcQDO3TlDSCymu5svldU?=
 =?us-ascii?Q?v2MpKtGG6iES93gHJfveougMyxJCUlajFav2H70vRdvYmU/Qrlhlk4ij7nZ0?=
 =?us-ascii?Q?bFNxyB9Xb8IU5IwE6qWo0HQVuFmsV5D7GBUx+OMnBbxoTh49gLndBNwdV8mz?=
 =?us-ascii?Q?R7seBqxTFa8XZ4jCbocKExaKYUNSL6JHrDjwauCbtoQSeg1K6vxnZtxWV9dw?=
 =?us-ascii?Q?0W9/lTy0DiwrXcWdq4Ag8yroo5fumACOLx8Dnbi5RyBYNdC/wM+FM6fsCxd8?=
 =?us-ascii?Q?3VT8/YWTcOK0Ms5jo3tzuCC/gKCygcgDlKtCuyLqQj8OCv9n6vA/tQfV+pRd?=
 =?us-ascii?Q?iXgVMweqVy+0C6bMp859cQZtLkAEZgPsfve1P6PL+5fjmCFUg9jFACQWRS0T?=
 =?us-ascii?Q?kKmKcLAIy2dJkPRdAz9t7KWHiIgCcWlm06/3fBqwcRe7aBOGMShXHzxFKjDy?=
 =?us-ascii?Q?q2HaZgVrxjRUoGgL/1dFgJJeP7Phw0YVU/4WZc2EUGEDXtEKPXUQLEbe1Zty?=
 =?us-ascii?Q?GfIiq/4dJLYc4+lsn1BG2nLrcfVvaMh0Q4fplm1BPGnNw4RqJScO3tqIg4dV?=
 =?us-ascii?Q?UEuwhegiAO7CZ2NdcBbU4zq+Mw+3T4Jih52svi5aXrA7i4nLuCjRhbtHVd7T?=
 =?us-ascii?Q?IshRGZM1e8iS3laYC/n5rkbanpax8ZHGvFbBK1HCg95VYDyrPrM1yXGztj33?=
 =?us-ascii?Q?1sG3RTTM98yoy2C3zdWv//7+3Fofu6GR5B6K7UFsAQQ1FsT64ydKRvsbFznK?=
 =?us-ascii?Q?17QOG7amMojqLYHYCudovW4rCR5yRLcy7vLvLpQ5q6PYZ7q4LBrIkWg0Gpu3?=
 =?us-ascii?Q?DjnKUs9l2Ua3UYDief5JZBXNaBCgLArx66oxvokkzUUNIjDTJ4KohpqjhxWY?=
 =?us-ascii?Q?ORwwo3Y7HatMvJ7wesnTGZsfn+ww3DhCVGqYU1D6ZBqWpNRVBV+gqDkhUo8M?=
 =?us-ascii?Q?V+IzkYHdOLAGZGb4oNCcx6MLPdUjQMX322PX7/KmguNGwvg510GmZFj0yOlA?=
 =?us-ascii?Q?q58lGigmKMY4Z2KIO5bXaI0sZ0qWHQZf5ZdiRBRgObZrG6g/vWEwbdcV2TZU?=
 =?us-ascii?Q?RF4ZCYjiyKtuB9jJDV0STOfoU5eGxNXY1YB2glBAc050c777r3+KR//yMYX3?=
 =?us-ascii?Q?ZAZ51TDLIdFxB5qs8rzsR76Z+3WZ/FeKpER9OvuYC41xv+NafteriiVSods5?=
 =?us-ascii?Q?U3b/07a/5b5LY+mbDeLTOrCJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b13a6db-b226-4577-a1da-08d977aa0339
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 18:03:53.4628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/ZiNFS2yVlx68HZ5fHXXIR9x17lLounB9lOkHMK61x9rj/8mQhVeik2FEHF9p6P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5190
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 14, 2021 at 05:50:25PM +0200, Cornelia Huck wrote:
> On Fri, Sep 10 2021, Christoph Hellwig <hch@infradead.org> wrote:
> 
> > On Thu, Sep 09, 2021 at 04:38:41PM -0300, Jason Gunthorpe wrote:
> >> +
> >> +	private = kzalloc(sizeof(*private), GFP_KERNEL | GFP_DMA);
> >> +	if (!private)
> >> +		return ERR_PTR(-ENOMEM);
> >
> > Nit: there is no need to add GFP_KERNEL when using GFP_DMA.
> >
> > Also a question to the s390 maintainers: why do we need 31-bit
> > addressability for the main private data structure?
> 
> I don't think we need it anymore since c98e16b2fa12 ("s390/cio: Convert
> ccw_io_region to pointer") and probably should just drop the GFP_DMA.

I added this to the series:

From 0d40f9c57430400a81aa60920b70761535967048 Mon Sep 17 00:00:00 2001
From: Jason Gunthorpe <jgg@nvidia.com>
Date: Tue, 14 Sep 2021 14:21:49 -0300
Subject: [PATCH] vfio/ccw: Remove unneeded GFP_DMA

Since the ccw_io_region was split out of the private the allocation no
longer needs the GFP_DMA. Remove it.

Reported-by: Christoph Hellwig <hch@infradead.org>
Fixes: c98e16b2fa12 ("s390/cio: Convert ccw_io_region to pointer")
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index 76099bcb765b45..371558ec92045d 100644
--- a/drivers/s390/cio/vfio_ccw_drv.c
+++ b/drivers/s390/cio/vfio_ccw_drv.c
@@ -161,7 +161,7 @@ static int vfio_ccw_sch_probe(struct subchannel *sch)
 		return -ENODEV;
 	}
 
-	private = kzalloc(sizeof(*private), GFP_KERNEL | GFP_DMA);
+	private = kzalloc(sizeof(*private), GFP_KERNEL);
 	if (!private)
 		return -ENOMEM;
 
-- 
2.33.0


