Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2003E20DE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 03:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E7F6E951;
	Fri,  6 Aug 2021 01:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593C06E902;
 Fri,  6 Aug 2021 01:19:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRqgyDPLn8PTh7Yrz2QqVVPigP3YsbpVwwXSbr9EjjYOXi1FcS3kfQtqFE37D2n2c/pyT9Duu0m/iUcq2MxmFbf8dU+HuiA0Km8pPRWRY0CUlySiZG5F7LHaKh+si7sQ6s+t0IR6Kz5Jtn5meq4EBgHjxm2FaitvneUYnSfWYOIdQL/i48gZFvbfjuXiZbs/7uFBCG9DVfzUeO4QpdiUm+t5UmpEA09PMOPQ26Hww1iIDW/Y6Jaz11YjdTpPbxNHOkKoiKK+ouL5iSHK3M0aprRHESQJyCr6TYPoVBnwSs6fEnGDZlKu+KIc/kxo06WCunIughFVQxTFGeT0Tkc7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJK14RuN27yL4pbSykuBL3LBGOhHR4BSiLIrEDi331s=;
 b=OMjiMVD7ULtpq1Pd6nDXaqM+jFGdR4bdw/pr+HTq65hYI8yogpDAqgmT08OefdOWE3EpTB2oVKTEJVXbEy2UYX1pKLZ+Ssg9vNcYMjIECLXy34huvF0+XqMxPGVzx0ofT9pIGe/NHGOrM4WFTGnpW9sXgsOgs5dZ7vpUj7cjW9hl5DDs5UEW61+cLvRXcGXMpNO6aD61KgqR/NMFuux67rgb4xnfesvrRJust8Mb+cnaIu+dKoMal40lyt0r+8QyKOcVtaSTgWTa9tC1sUTII/y5UJALjvhapgjqHesq9WFHglw02Cm/mU297KvHBVDetUGsvNRat2VFNnEHkG7PDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJK14RuN27yL4pbSykuBL3LBGOhHR4BSiLIrEDi331s=;
 b=hRkRoYvjlaoJoxCbPkNNbD6Mvu64hC1Pai9rTj8OoLjdVLamUOGN6xyXqxVasZMLTls+9NE1WBYQi4ca0gy0YV7wNUYtp73izOSVDaE00YAKC+zytxH8fwAatuFFk2adyDGzjXpAdwdi6KsgcxbilaBfLKHbrhjOdr5Nb11UNzd3lMEBmYb/CjCRHi06NK25lnuq5yY+Ev5t6sdh0GbTYyL4oxH3Aj40dHLjbTSnd3wTHjpJ44rarOIIbmDpJEOMVpdQkhSUNYsKHZm0Pz6Qdk2x78amKSlWju5Y0vSF2MtpJQOtrm1hixvHtglh4MfOL5/CK96t+i4S+VCNCEbegQ==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5206.namprd12.prod.outlook.com (2603:10b6:208:31c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 01:19:13 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%7]) with mapi id 15.20.4394.018; Fri, 6 Aug 2021
 01:19:13 +0000
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
Cc: "Raj, Ashok" <ashok.raj@intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [PATCH v4 12/14] vfio/ap,
 ccw: Fix open/close when multiple device FDs are open
Date: Thu,  5 Aug 2021 22:19:08 -0300
Message-Id: <12-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::13) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR07CA0003.namprd07.prod.outlook.com (2603:10b6:208:1a0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Fri, 6 Aug 2021 01:19:12 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mBoVz-00Dt7b-Dt; Thu, 05 Aug 2021 22:19:11 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0265e3b2-c582-4d54-87e5-08d95878330c
X-MS-TrafficTypeDiagnostic: BL1PR12MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5206310CDD3A06325A34169BC2F39@BL1PR12MB5206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bSHMcXkOCg3iSSPzTxHcyVqY7ZMBctNsyCOhuUzQxfclNoVj6kS55/BXgPaFfA21pEzuq1NbSrWc0DBGjeDFICcC+op/QV9dQBgrUTL9tMRqXcrDFNxZSgGirrMC2TGJ40O/vmbj0XY6NL3VDh94O50VDVw8eatpQz6k/m434yuGmeqbMtz2b6X5Bs07OrKk0PTpRm7CSKVwL+2QQJSL7hqd5q7OLS1XXXyai0dLuTNKIwubt4slmx6ymMUsBTpU9r3QTVQEdqiZzk/6Zbxs2RNTQkaikaPLW0DwGYkEa1/TTkC7NmDGs8/Vi9ruCfrppOjTQuZHkLIv3inBHRdhHiv+8st0UU6gwEg1ql6fVYasIVQxvDSwh3Io/rZ4k+WUGgM44X+bWX49EBfOGJzJtPzzryl0iClw8Oads4Gtjf/oAOTWUK0iGa68BXJR52eukEhxxqBgEhHPYkxaMylhfl1xS3R5uwcOYxHOEVO3a5e4DHovws32kDh1k0GhLPnsJMmHc40z2I8KMjFwLBCEUSZEySqFQ56HM5DIUaZaI1tApl5H3Wk2Yd5CZ8qQJc/l0bA0va4lSmVMKlWjVr0SBGDyKZQWi8VeCnsS1dPqV2cBtHrCWhgDUTuo+FtCbdxoFuwt/tjDruGT88rHkJ0PtVB2NWnWCAC+IshJvmVgz9Vs6B8oqg6uWwFO8Cf7F7uD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9746002)(83380400001)(86362001)(9786002)(8936002)(426003)(2906002)(7416002)(38100700002)(7406005)(66946007)(921005)(8676002)(5660300002)(186003)(2616005)(26005)(36756003)(508600001)(6666004)(66476007)(316002)(4326008)(66556008)(110136005)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?feL0pT6rronCCs9j0+1zUphWrFGRBBUm4lImNknZlzJwh+Z+9W44v/LuHPzu?=
 =?us-ascii?Q?5MCij1ucg79g/kczmxjoKCRGe2cnGIocK5SmPceWjYA9OgMz6n0VB39egN1F?=
 =?us-ascii?Q?YybeiOy9UJ0PE1l72j7XTCBBrcoBKkDh7DxM5rNM96uoT+ZhTZz5PhR0IHCD?=
 =?us-ascii?Q?L7UV2PhD+Dcf/nmcGJh7C6mFuKtZtVFNylRUo8Ujvsolj5oHFfWpFTDX00IM?=
 =?us-ascii?Q?RM7b4w/KuQB74+ll4M74mDgxxJUhqHi47quPVEaFfA6xzsxZVL1Wips+IPLr?=
 =?us-ascii?Q?/oLs52jAYm0/i/uaNKPFjREnzlwwr4VBaufnP38MjkpnA2rKK0fQTFaM1fgF?=
 =?us-ascii?Q?bDWQoDRvCASmi13STDRsYZS0U3HeB5wY9PrMPbZ4RPKVztBEd4au5Dgs/Kp+?=
 =?us-ascii?Q?yZcFwaVXjUaRnLuvVLMHhxO5lWbSKGD9Cp8rSLSkrulJsWvssy3csp6wKTjq?=
 =?us-ascii?Q?1tTlFzxQPKcV0DFnP0iDb/Q9STanZxT18CaY8M35hCeREUEVDy9kj3CPahdD?=
 =?us-ascii?Q?JB+fpeurFpwzSDsezhFyGq9IpclXNuYVPpvKjCcpeJRaBp/iIHBPiDM1Pr3l?=
 =?us-ascii?Q?w0CcZrLkM38Rbqy2YPQdJvgue97uYcs0MhAHs/lL3BhbN9Nt2a+yKizrn+VX?=
 =?us-ascii?Q?Y6vPP274sPNRqWMm/eX1LokO/hKyY/gTl/KHGHvacxNf00+3XhMYmFLkLRBh?=
 =?us-ascii?Q?CZrdsZUN+Al50P9fpw1FBhzGyaJKLi7qBBwvOlaTi5AsIM9glk1pCTrjm1fT?=
 =?us-ascii?Q?NQFUN1ApHoQTiHr8WkN//ifQg8Fk48N/s6zbrlXZvV5gHIKTRY2zyKd/ua1q?=
 =?us-ascii?Q?ErtOM1RWYEHHvF5FZED+R/Rcmyjh9KgRTh9TarjRnbLsoe9WQ0k0A79hQFLM?=
 =?us-ascii?Q?l+pOWwRaUprDwyTLsp3hcZKa+T0zMqx7d3TAEWdFlxev1Gpf0R+G8DuTyqCR?=
 =?us-ascii?Q?6qr+hwh79c6ax5rJH+rKHD8By+UdwDObXaT+AEGcUKLPoRzAnvDN8Fv5kgw5?=
 =?us-ascii?Q?7kQbdZTCVdmWkiHrTK+OzDUTDw8Rql3i8sHqIWoA7WdakvEmN6A5knUhpqwK?=
 =?us-ascii?Q?o7/kbcv3Uhoqq5JXdKVh5PcNDI3qPU3w/m1ZNCHjLAFaYTlxWXjfk7aW9t16?=
 =?us-ascii?Q?e1b0auYHYrHdABrAqr4HRXzFpUwNsEXPckiZLgQqIs/bSueLB3yk3iqXozVA?=
 =?us-ascii?Q?Z2MBUaL9fcNeSbzp6QEYa7wVhr4Vo3Qno38HMBKl5LB3YNgyvFGAL6oYBg1d?=
 =?us-ascii?Q?6oZKkybkONFpPosBPGXr6GQh8tRLz5j2sTMCoEpSdxxwODY5BBX5TZi7TaCC?=
 =?us-ascii?Q?unLDV0TiLKZ/9FwMx0ksxdNx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0265e3b2-c582-4d54-87e5-08d95878330c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 01:19:12.7017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbSJGDM1DcrLi0wNYsXVf+O9tjxDG5pND/ZI/vG0IpexbMEFZJTdVNaqT8VQkqR+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5206
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

The user can open multiple device FDs if it likes, however these open()
functions call vfio_register_notifier() on some device global
state. Calling vfio_register_notifier() twice in will trigger a WARN_ON
from notifier_chain_register() and the first close will wrongly delete the
notifier and more.

Since these really want the new open/close_device() semantics just change
the functions over.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_ops.c   | 8 ++++----
 drivers/s390/crypto/vfio_ap_ops.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index c57d2a7f091975..7f540ad0b568bc 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -159,7 +159,7 @@ static int vfio_ccw_mdev_remove(struct mdev_device *mdev)
 	return 0;
 }
 
-static int vfio_ccw_mdev_open(struct mdev_device *mdev)
+static int vfio_ccw_mdev_open_device(struct mdev_device *mdev)
 {
 	struct vfio_ccw_private *private =
 		dev_get_drvdata(mdev_parent_dev(mdev));
@@ -194,7 +194,7 @@ static int vfio_ccw_mdev_open(struct mdev_device *mdev)
 	return ret;
 }
 
-static void vfio_ccw_mdev_release(struct mdev_device *mdev)
+static void vfio_ccw_mdev_close_device(struct mdev_device *mdev)
 {
 	struct vfio_ccw_private *private =
 		dev_get_drvdata(mdev_parent_dev(mdev));
@@ -638,8 +638,8 @@ static const struct mdev_parent_ops vfio_ccw_mdev_ops = {
 	.supported_type_groups  = mdev_type_groups,
 	.create			= vfio_ccw_mdev_create,
 	.remove			= vfio_ccw_mdev_remove,
-	.open			= vfio_ccw_mdev_open,
-	.release		= vfio_ccw_mdev_release,
+	.open_device		= vfio_ccw_mdev_open_device,
+	.close_device		= vfio_ccw_mdev_close_device,
 	.read			= vfio_ccw_mdev_read,
 	.write			= vfio_ccw_mdev_write,
 	.ioctl			= vfio_ccw_mdev_ioctl,
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index 122c85c224695e..cee5626fe0a4ef 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -1315,7 +1315,7 @@ static int vfio_ap_mdev_reset_queues(struct mdev_device *mdev)
 	return rc;
 }
 
-static int vfio_ap_mdev_open(struct mdev_device *mdev)
+static int vfio_ap_mdev_open_device(struct mdev_device *mdev)
 {
 	struct ap_matrix_mdev *matrix_mdev = mdev_get_drvdata(mdev);
 	unsigned long events;
@@ -1348,7 +1348,7 @@ static int vfio_ap_mdev_open(struct mdev_device *mdev)
 	return ret;
 }
 
-static void vfio_ap_mdev_release(struct mdev_device *mdev)
+static void vfio_ap_mdev_close_device(struct mdev_device *mdev)
 {
 	struct ap_matrix_mdev *matrix_mdev = mdev_get_drvdata(mdev);
 
@@ -1427,8 +1427,8 @@ static const struct mdev_parent_ops vfio_ap_matrix_ops = {
 	.mdev_attr_groups	= vfio_ap_mdev_attr_groups,
 	.create			= vfio_ap_mdev_create,
 	.remove			= vfio_ap_mdev_remove,
-	.open			= vfio_ap_mdev_open,
-	.release		= vfio_ap_mdev_release,
+	.open_device		= vfio_ap_mdev_open_device,
+	.close_device		= vfio_ap_mdev_close_device,
 	.ioctl			= vfio_ap_mdev_ioctl,
 };
 
-- 
2.32.0

