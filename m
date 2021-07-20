Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D11A23D009D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 19:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D296E4AD;
	Tue, 20 Jul 2021 17:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE57D6E4C4;
 Tue, 20 Jul 2021 17:43:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiScgioDV4lb5kGTbpd8z3lGB+WLbs+34jvuHSpC/tv32PR7FmwlPo18VelM4MFBeldv0ZHPwwfcY47giFul1Pr/mEG1kbs0dXySs+3IxlomRW0kv0tEYsLcybtktcpsMHfmZkwARMrflBWX5ZgyeT6Aq19+j/hAE5dhocBA4vIxBeGwn3Vq1kEl3rU5xvVfBHjUc4xev7sk6UTdn7ETomZ0RRv53I/2evmgCz19hLQeRJRRJG7d91iluTRIW2fUZ0tokifhS1OBUu04jksSLKJLMG3zR38T5TqnvnZhzSJlksmINVd8a1ecvSlYP8xRSEAvep1oKeXpr5joefAmrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJK14RuN27yL4pbSykuBL3LBGOhHR4BSiLIrEDi331s=;
 b=ihQJa6vcaC4hqq0e7kLa7T4PqEpapDkc8Hv5Xo7wTNTMCx15l327yRekjgbb9+v/nLGwU3vH6ZGkAF8d2qH+45rUWXTGN1G9dUUA5u+Y9+0re2GMFvETuJP2ks8CcHVeyFxKmIQoPGoqnCHA8Dl5Y8X2aX94YAZJYipuEgrSz4ONyWhwOL1jWlP2tN+DBzt4qFfQt7QZp9Hd6rYyTr5wJWqdnU14AaXnfN/od/o/AzcA2t0tmOPNbqbbme5X3/8kw8F3LuwjnS2GdDzatTuPW3gIC6QSNfrS005veDGwBrreM7gR6CMzgaITiALBuYCiKlNf0+Ynu//iV1vh9Pp1Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJK14RuN27yL4pbSykuBL3LBGOhHR4BSiLIrEDi331s=;
 b=j5kuaGYzf3GO45cktxrY94NkmzOQA/eYV6DR6G12fP4o1CAHzPoM6yPC9QA/kS+37ZCgJ3Z8ZuhgiWJQ2wdCyPcI83wom7j/pHoOHpPyRfASadijtI7IgkzbsMMw4ygPGmKj/GCNSNhdZKvQXqQg7nMwpaX377QkPmeq0ohlHfW4CPOUr3jF8oW3kV+2p+SB2ws+/g1BpM4xiEY95g9O22u5Cecn3Y0F50ky+8NafIvZx7ProLSfv6XUudywcLE9foWzi9T1ev1ItPSn11ySWm64k++o8p/yrqsz7sinOo1AMvm89I4lxYYcUvQV4YSzWUZY1+Z6sUSMo2anXcN3kg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5288.namprd12.prod.outlook.com (2603:10b6:208:314::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 17:43:05 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 17:43:05 +0000
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
Subject: [PATCH v2 12/14] vfio/ap,
 ccw: Fix open/close when multiple device FDs are open
Date: Tue, 20 Jul 2021 14:42:58 -0300
Message-Id: <12-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:208:fc::27) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR02CA0014.namprd02.prod.outlook.com (2603:10b6:208:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 17:43:03 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5tll-0051FG-P7; Tue, 20 Jul 2021 14:43:01 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2bf8cce-6922-488d-f713-08d94ba5d31f
X-MS-TrafficTypeDiagnostic: BL1PR12MB5288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB52888F030653E2DE48F3D7E1C2E29@BL1PR12MB5288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zaoKGOUd9zvDbgXSVs/ZxwTY5o6FeD5pIyh8g+G7YFEZAF6npQUU70yMWNYNmBFw6cXxXSp15ZKxuGqs0wipGCKdF0LmIJdSGmrAq6eVGipRD6CeetNsMUB8aNfUwa2JZspsTDk69iypUphVQi9jvY9EkFI1Xt2Srzg7fK+WRS2fVc0/Qec2xJxEhL9Y373lbYKw1teDgla+sD8vgCKq1Yrp/MVVB8bvMXLLqQYM32/MZlcTVZP5cCQ7GJ41hF1yXUchyJo1DtBIBzOj8KZZHz9nkGv/jjpgnDTxBWO/F9WFS9A/q74ca12x+i6zQM60zpcxT21/RR1clphA8VPe7vNSfZoNCVmHHp0uqbWyJMYL6s/k/Todyo9zqzp1DdMDdt0zAanxhjluNmnYuc8pCDB4eAjfYqbuBfd9jOa1upMF9pGuUEetIPCYqvNOJmeve94WiwgX9Ppx0nV5FrhPQqnyr7Tz7AAvNlIE9R1UKCwR08CUFBDor2DlcjgcqdNU3jPapsJkJSZYjoFRNN9u1YLMqQWYg8DIitr7R05iym9HOO5HG45S+6GFRm+wEtPgp5mkAISqTL+hBPRIoOXmVfRHrzB/TciENDgFr540dOChm6UNIDK0JU9dqA5h4Rd1a5maXIvuCyBaGMGZfphpxnEp5HxgLThanj+TCpXt/x96e9jXhIEfPDLxwIo0bWCV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(6666004)(66946007)(7416002)(7406005)(86362001)(2906002)(66476007)(54906003)(38100700002)(83380400001)(8936002)(316002)(110136005)(478600001)(36756003)(66556008)(186003)(26005)(5660300002)(8676002)(921005)(9786002)(9746002)(4326008)(426003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+chi1yNcQrop+JNtaMsUesGaf0VgpTEogbrM9dAJ3FzwVoeLNiEN9hOBdoMN?=
 =?us-ascii?Q?5DNrFmKGnnRO8WtwC0UB3FInApdJUOdCIw5QNPY/UGWwrqpvhMt/WIqEKaAq?=
 =?us-ascii?Q?ZYcDNfqT1u6OMeLPvwN1L+ngKu5HgQ9hEE48y4XTgqoSedV8/Vw1CGaWf7db?=
 =?us-ascii?Q?vISbWIBGz/myu6k9nP5DTJZT1MyrmyuT7MFut2ixc61xl5xr3OIv/+wyZfht?=
 =?us-ascii?Q?2C0IC7SUsuQeqLvTDZJ1JTkyhxUBZ+p+uX/7TEvyvYFQZlD1DDx2N5RslwNb?=
 =?us-ascii?Q?9PqN3vtGHl2cqrfi7fF6fMUVZgsG4H64BY3T3PprzAjpYEFQpODM41dbz+n3?=
 =?us-ascii?Q?2l28KtFeXtHvS5wFzX0hZIfSbdDSZ1oq/LsXMehQizHOI2sYoX/mTPFWHLjZ?=
 =?us-ascii?Q?BZKsmb/B3gVX5fYddrmyRspQOhdF0e5Ib+crVAwRgoHc4F31wdnp4zr//6Lr?=
 =?us-ascii?Q?Oo+sriSvu8wdI3ANt+lQsY+QKT4veHTVv793P8Y2nP8twTcbSG0+ETaHZVp5?=
 =?us-ascii?Q?Vf0MRDuX4Jutd5gJS+nXDWD7roweHS1m7BTZwb9hjTfAuFCov0Bbx4gyJMiP?=
 =?us-ascii?Q?e3uwkqtCPCplYW3OUQVFzRaxEZjSE98gBD2hNqUkyqCKlVIRHXRbElkvlgY2?=
 =?us-ascii?Q?ja+jBCxC7dgPXRm1c7W+6OoTYZJw6CbrwVC/fyPAySd/TRqyNPJClkPkBfZI?=
 =?us-ascii?Q?tOfq9Sp1y52sE0lV8VJJ8T6rMxMp+E8FfxEvEGijtq6XBYPR3HXZT7kak3Cz?=
 =?us-ascii?Q?wJk+1p/oa1HAYr/QKW6yBPxqDQgEe702AJ4QW5274IH4Bd1z//753r7WYZpR?=
 =?us-ascii?Q?vl36AKKCxfLmP1y6S8xBJOrskYCsK6m0KHGDeoqi9XcMJ1stSHkp65CIKxgV?=
 =?us-ascii?Q?PSO6Dl1NI6T3ZdkGAF61PSD/rUZBQdjfAamf1KoNfbiWZiBvcdVXgMtA22rQ?=
 =?us-ascii?Q?mw3cZjCRIl70czKNCbCX7vTHscMFhfGNsKUD/bHbDNZWqpecgoXtKFiweAxz?=
 =?us-ascii?Q?bZlXR3YCd0KlDfMVzHL4D1xz4uEmKWJFLBMZeF8MvhRcOE6zZwvsjuP5CRt8?=
 =?us-ascii?Q?gvuA3bwCJrIOsCE3/ULZrRpz76AQvVvc4qaicHl6B1ZO7iSrH+uI+60UGu/0?=
 =?us-ascii?Q?a1WuGlfPDRg8/Xnyw36uQEmLfQYh7jiNy+BkuZf+NyJRLvEfRMWX72+e/Ice?=
 =?us-ascii?Q?AAzfsqR5LmradPNV/SUvboezEEgLN81kKbMdfDCVnWsZmt6apm4TTAbjvdR4?=
 =?us-ascii?Q?RYC9wPTOjjNJNtYEuikYOsWRaIYC25O4fFExc0++7jBMTrnOaSxG/kj1ke+k?=
 =?us-ascii?Q?4iTb4RB4Fh7gxsEJ+btZ5ACv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2bf8cce-6922-488d-f713-08d94ba5d31f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 17:43:03.5302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsE8qDlijTFay49Cr1QyQTl9YD1A8S7IVtA06Yc4PEWc9jwJOB1iu1tBshAI0leR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5288
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

