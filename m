Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770C43D9A6F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 02:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470806EB8F;
	Thu, 29 Jul 2021 00:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BDF6E372;
 Thu, 29 Jul 2021 00:49:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6ehoD2urzH9Fe0SmXqdIn9NNo9ubTLkPZF2hVdMeMcjwRSAAf4EFc4Jia+FXrEUte4T/BTDTr7a5quh5ntD3jYSTPkh726KQCNPy9sinZL09s1B297GsNKmiA6nlz4qQuzrnuDtEOYiQbcne0iP7+WkK4gNe6TQo/498x4LAfSy4P5auXS4mD4srlAPvwQ0L4eZvMKJusw5zsI6w5AvCqV52Blnvn6kvS+ACsn/JgPxcorIXxplgL3bfCd8o+fxglXBiiST+KJgOiW0HJsvNVGQhenOGO2nNA2AcukPr0jSAV3kDRv2E88yPcbqHvplP/kLbpTdC290Cij1ZkBQsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PP68ToLBFJ0Dwz5i+qGvcWDPVJAQD4k+3KgPTgp0iKg=;
 b=cQKB9BcgZU7aKn2VdhrxEjN0lvC7oBQxunQcM0zqc+lT87CeOOmmxpgnndqEz+y0lm4rhJzqm2OcE8qC03biNGvLCiiBlttrJaZr6FQJtorodFVDyqaOVu8ckPq3iEcAibf/cDqgh9CB7vh+6eJRtIlKrSrHC7C9qk4ZWOAZTDEgqnIL7A11yVqVek2AKmqFij1AVBhranKx9BnZu4DtEkxpbWDUMFhe5oPZZ77DFjyJH/En+mkC+iFQS3xt9zbvfy8ZXDBRcbv8R0hcDw2donzcmfEMXcMLQbqEPPGQKjXZkJkzG4zFbncKUJMEULr8DNHs0a9eujeDj1zWB5CcZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PP68ToLBFJ0Dwz5i+qGvcWDPVJAQD4k+3KgPTgp0iKg=;
 b=urlQScjMPwawIE0Pbya/yw6sj0AvzRJ21Jhy0WrR13RdbgM1JnSFEm4qxhWWIz+3qrOjGrxS7NC7nIoWabV5DBDuO6kcovrxmBmQhOUFxr3/3kyQyHew31TfBZGGhqD5vy5/XcZWU0Z3dxtsumchljLdJQKDSvUEFfk/Z0CaDY1f23bMhTfNVpv3o2N0tTvriH0CRCymGAWZNZmAhlL1um/bHDREm6047VH9/CI2SPb5dPrAXXSeZDvWDmuSsFQUV6R1+tvtG7ScxjUrDldWgJ/RFMUHXspdTFn+xdBGJU196V6Xs3nBl6gZbDtgbO0oRw6ZKUppyUrsZLuHQiO6EA==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 29 Jul
 2021 00:49:29 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4373.019; Thu, 29 Jul 2021
 00:49:29 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v3 11/14] vfio/mbochs: Fix close when multiple device FDs are
 open
Date: Wed, 28 Jul 2021 21:49:20 -0300
Message-Id: <11-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT1PR01CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::16) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0047.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17 via Frontend Transport; Thu, 29 Jul 2021 00:49:26 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m8uEm-009pnK-73; Wed, 28 Jul 2021 21:49:24 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a59ebd85-90e5-4287-546f-08d9522ab6fe
X-MS-TrafficTypeDiagnostic: BL1PR12MB5160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5160766B10A834E5943743DAC2EB9@BL1PR12MB5160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BbdmGvh5VjxpuGrRZFclnlZrHjF+/+F7vnnvhQIjIautlCYAbssgtB06lxgAwnLoYMPtRrYlFyuL8ixOiG+MJ8kSYXUhkuzic/X9fzvtxAhvN4TS3w6luAY36ZamSlp/uDSEn3VaAmyDDEhftLyLthITI2ep8fNenhDdT1NUex0qcCsAed4MexV6oDk9wF4MueNIjSZirFG3QuJtrAuAX7hzTuXjxLL++4whR5vSJ1DcLnrM9rjG7iy70ypSf6rqHtkAuVWqnNn9Duwnh/PSQWZ7D65Pn966/oHYz3AaaIYTse24WCmUkAPqlZBrhVEdVn/eK5vmK75HEVlzxF8Bewfylx+PjJ/CgaK824rW+nY5/bdU9X3AEGT+YARYGq2GMVlDVTudDLZgQmKbGAJTqJUO+2na//86eb6QzZRzBm94LRxCvHaDSPOnTFTQnt0VH9snQ4jPgYdV8zg0+qUU+ziUXEFDD7eTyh6A2ujOjZmZszsDiL/VrSu6BoBZt9WfbEzbzK+U2moVAVnkZ52Uo3ZhbzqgggGrrOzgg3DLfRp+BHycPD0gqTXf0spOHvQsQ+6fXUH/a3yv9TfjzqFUOhUL6DPIop7WrzO/vozOkWwC9/Ar7YxRP0qB6etyZ9Skr6y+UTvbAAziRqrYKVb0+t3YNI7XVeQlySswWFMZk6JpytQVz4zydHLiVmlGZ/Tf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(8936002)(86362001)(2906002)(6666004)(426003)(921005)(8676002)(2616005)(5660300002)(316002)(186003)(7406005)(7416002)(54906003)(110136005)(26005)(66946007)(66556008)(66476007)(36756003)(9786002)(9746002)(4326008)(83380400001)(478600001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PpvsYv1q9LL0zkFVsT/Hfx3NeAaM7t2xCtxMmB99tAI8FeFsYdy2ZrsGXQ2w?=
 =?us-ascii?Q?25Xn1T/v2jD+CAn74BYF0Mnju8jon9skuRjwiE9beE3CDN20ibK1lVLAiA7s?=
 =?us-ascii?Q?CesoNM2XoU3M6ShSjoKrQ1EQqf4tOvD5Gg1bRl4DFhaPIViqYEB6nyTFn1VZ?=
 =?us-ascii?Q?Tb7AYLiEplnh88LPktZM0stJ8qPgk/Y4EqxKhBNyIRJwj5u8fqOQWN9w9EO/?=
 =?us-ascii?Q?4+AQObk7rsP/+bhN8E5AtnOYBCzitKxeKKVfeLtaJv4Bba8oJPyNkKSJfb+o?=
 =?us-ascii?Q?EQSslmkTWAuLKiS2Hf6s+HxV3jdFqrEOn89/CyCBmIqJqqM3aPz7CslYnFr/?=
 =?us-ascii?Q?LbUwvdHkdSrQ7GnGEmkybNoGoeYgfTdSVUKAKrts+X3fIRTmLUj9BEuUwyT+?=
 =?us-ascii?Q?BlNjupI4JLKvOi60+emIZ06XHqzBP7Ikr46k0bdpAZMn1iwpj8EuE9aybA3i?=
 =?us-ascii?Q?8h8gTy5H5vpTSmCK7X9i/OLH2XfezQcYwwY1jbh/pBkNaBWde2q+H8vzewE3?=
 =?us-ascii?Q?v5+xIIhGnxwVNkWDDahJwfavQaijkW7MLlmZnk55z66QmNfVgxtLIptUwrFk?=
 =?us-ascii?Q?mwVq4tmZ82OGFoTKYIl9xHsFT7qxkAcknk4TI3WqKFTHO+rdaE33ebkEBVHv?=
 =?us-ascii?Q?u42mn9leduflBjslaguK2E6AFYv6inxBczTsOFfMl12T/KZkzYQWFZgRz0xM?=
 =?us-ascii?Q?Wsbdlx6Q4/M/1jpcw+oFpdsoVri0Wf2GeldijuSKT1dLAzqRBMUcNy2JJ/AP?=
 =?us-ascii?Q?DLeuo24aKe4SXTdvnifvctb8iF8pYFiJe3OlNyWEh31YVR61mCCIm9S6Xd03?=
 =?us-ascii?Q?KTZU5pMzChUFbyHgD7NViV6keaDZXaWgi5Vpu/VbnLOgiAOop+RCJrNTepa9?=
 =?us-ascii?Q?O+xdj/3p3z9qL46y92CZEyPgfvbB565YFT62RcTMLXsVM5QJA5nkaxAgqXVa?=
 =?us-ascii?Q?DwNi/MeChyzb0IPf6p5RJNRGxAX+m5oriCCkg2Q8uPcuGYFQihDi9sSysXvY?=
 =?us-ascii?Q?MBy+6LgLa9tidtUkubx38aFiTJk8Q/BKzhNieVkYDNnTP01nh2NMIfbmsayB?=
 =?us-ascii?Q?gpIVMfLuv6aUOzUpwQJ56elx2AkC1sNJ4zZol6jhmw+qyLDWE98vFxhwXN3M?=
 =?us-ascii?Q?jtUcxmbbAdEE/83XZNyhrrk4AeWAfWdQp9JdOuWPjmW7heCpKCln2/XFE+kq?=
 =?us-ascii?Q?ziq6p9AOhIcg+Vk9UpgI9FLCAh25YPILuTl9qH1adcmhssrSAK/HupOAeVVz?=
 =?us-ascii?Q?/AfhDxKbf8kU7DvR9UfQe7Z7nCKRDCfl1r6Ix/XSInKASDjb2mFzTmGfVI6x?=
 =?us-ascii?Q?uSW5hRuucGaxG1GTMrpiO6DY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a59ebd85-90e5-4287-546f-08d9522ab6fe
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 00:49:26.4190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWFv6sjjM2pZ3Y4wVa/LtLC8UWnwosCr0kr6s2HdBH+dxHO81rtZz07RgbPKJ0I2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5160
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 "Raj, Ashok" <ashok.raj@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mbochs_close() iterates over global device state and frees it. Currently
this is done every time a device FD is closed, but if multiple device FDs
are open this could corrupt other still active FDs.

Change this to use close_device() so it only runs on the last close.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mbochs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 5ac65894fcd38c..6974626ec1c5d0 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1278,7 +1278,7 @@ static long mbochs_ioctl(struct vfio_device *vdev, unsigned int cmd,
 	return -ENOTTY;
 }
 
-static void mbochs_close(struct vfio_device *vdev)
+static void mbochs_close_device(struct vfio_device *vdev)
 {
 	struct mdev_state *mdev_state =
 		container_of(vdev, struct mdev_state, vdev);
@@ -1396,7 +1396,7 @@ static struct attribute_group *mdev_type_groups[] = {
 };
 
 static const struct vfio_device_ops mbochs_dev_ops = {
-	.release = mbochs_close,
+	.close_device = mbochs_close_device,
 	.read = mbochs_read,
 	.write = mbochs_write,
 	.ioctl = mbochs_ioctl,
-- 
2.32.0

