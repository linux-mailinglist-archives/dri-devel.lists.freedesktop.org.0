Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4202B3C9520
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 02:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8336E536;
	Thu, 15 Jul 2021 00:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B782E6E513;
 Thu, 15 Jul 2021 00:20:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rz/cYWCzazEACVwZSW3ew24n3hh6YzyK5hOaIRtBFzuJnZ6lI5IAxva2GuWoINyem0oLLv6LYFW9L0RlyU8fQhfymtPr+CkrwniAKASGrKlSy71uYyCXfRhIW83HIWNTIyb066GJez3SuMV1pgZRpjVxOpWPGbicpyXDH0haCbkVYwKm5fcy5z0ni6Fo6hpKWrffvlgrzo3WaF54bmNvVRw+jtEpPOPLu8+VgEU8SwdFHp7iRSGrvwcmB/txjhX2+yicAPNvppq5NKIyMhv3lIyeWEYLJuUzHBEB6ko4MBr+7ZMfi0fWQyWjzm2oD343uCTmyLYVMXnhooJd+TnGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dl++p2mqgSkgtxbxzA1c4mbO75hETCVTZq0tQWzbH3Q=;
 b=TfJJkZvL5QhDJyfwaru+HVvu1qpLavrSTUppDLFBWQAihPF10q4jvoJcx4sH17ssEGSibBuM2iZU/l8P24uvQxb+zYsHULPYWBGOjtZIBjmC+DHarIn6eftg7R6ASz5P+wv+blXDPj69zds+Rp/kHz51gVWV7tR8WCdBXfnUg7d6KLQloFIRKuU0mFwk4Jbn3WNzRNWnhtPnUfm3UWt/dtoNPRuS9r9j9GKI9/4cnP3sVjE8RALOUKr6PEt34WS9fc0+KTn0Hqc0nhmSbioorIeGUF/NJpS4tT56jJxuOhB1ViVdoIHH5trTicMTV0fz+Cs+8cnl8J0/SqLS/eTbmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dl++p2mqgSkgtxbxzA1c4mbO75hETCVTZq0tQWzbH3Q=;
 b=BpXFs9ntVTCEF/NIbS1AwtgqrL7D4BFuB/JlQC3rGo1ykwNdS1qovcyJneJaBsKu53M/ftLC+iVkfCj2ciHCp4YWDX0fCgV3b9FhJeXz9M7Hr659fQhT/+DkPqWOI/tL0vgk9LeMCMuzHJ+OFzAd3xT8voRXtW5xEOmhljY9zQxDSJcEvzfRVx4sSm/3i6T/kZ12F8LS+3ev/tMzWuAA8ML5dChIhzOYDeQcOje/wFgyP40faVMuKKzt1fQZWlX3ubFNCIDDJp/tWMEqSX3p+lotfdXww5pjeFdGN0ejFZMLICtDWSTBuWCrHqCbfPJCVdy9vXhPAJvHbpgVr/K9Gg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5555.namprd12.prod.outlook.com (2603:10b6:208:1c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Thu, 15 Jul
 2021 00:20:50 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 00:20:50 +0000
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
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 11/13] vfio/ap,
 ccw: Fix open/close when multiple device FDs are open
Date: Wed, 14 Jul 2021 21:20:40 -0300
Message-Id: <11-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR08CA0021.namprd08.prod.outlook.com
 (2603:10b6:610:5a::31) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH2PR08CA0021.namprd08.prod.outlook.com (2603:10b6:610:5a::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 00:20:45 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m3p7K-002Uxm-VN; Wed, 14 Jul 2021 21:20:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b67b33f3-a416-46c6-2bc0-08d947266388
X-MS-TrafficTypeDiagnostic: BL0PR12MB5555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB555502E6F25267B2E29D8563C2129@BL0PR12MB5555.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LzA3M10skBpdCQY10cYOMzvmjn6IQ2SvU16LKWhsM20bsSEHK9AH7dm4LYPZOBbY2Wyz6jFUOoQ7kPi27fBfFNR192cbR3tWIU3DbnTtksfug9gwFv7BY+puTxA4EmgvHiqWuL7xuRwrohktZsigd++sh6V1QWe/tGBODrVOTcbvYuR9BXrwfsfxB4ieH41Rb6n4UU0vEXr8e0GwYH73BF+J2lb+8OUNc850LxS73yg350taGYDcrg/+hGTpxN+Vhw4J71PuBjUpuEFeimjp88si92XF+yVSQiKM6pZB6FVwqmKrqsPq9tkTeDxzAfMqQdte6vwQ4DixSQ//o6CN+UAX/7lNeeT74MqEB2cwI9iA6MnC1m5RbkE4ChyOp9fCU1GfUORENQyuSQ7TSUys26t6MSMzs8FMRBjXhO1SCmR8rRni1bOqxQtAmNRMDXjp+HLTvSWGAtM6pWGXP8ZiFYms6KqG0g1Tep3H/mgycntZXBX2C/aXNy8Hzkq+ztpD70qT+8ErS68UruUVhm4/3VR+wS34JfNSO76EBEE+Rm43Dp5LX9ATNFU6K3j0g3tT1pjQjp0e3WF5qp8FqnyYs5YqxpHV5E44kjiRfFGZQyPywy2lj+qFBlXzuuau2ZFBdqT/2zW0xWVvJJneWZ5SZgWQnJygRdXKBSeHPXy+dxHWdhudG+B6OLWfX2WKxesk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(83380400001)(2616005)(426003)(316002)(107886003)(2906002)(478600001)(4326008)(7416002)(7406005)(38100700002)(36756003)(5660300002)(66556008)(66476007)(66946007)(921005)(9746002)(26005)(8936002)(110136005)(54906003)(8676002)(9786002)(86362001)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HVDSh9XFw+89KNVKag6eKI0GSNEoQ7Xb/BevIu/ntl9b0KG9dOr2yt6eDT4i?=
 =?us-ascii?Q?DGTmEtzK1ZriN/8G/30dKhF1rBnPkSscLfK6o/kF/PfpTMQ0fM30vx40cupx?=
 =?us-ascii?Q?IYUvv2Sd9qcYiwhrdv4jvsyYk7pdobR6C32wM6MO4vVhETpDTitqDOSJLpnk?=
 =?us-ascii?Q?XP23joeynhn9AKaophp/192CLIhxprpoKPdYhC9s9GI5yRYRU467j06OGu0p?=
 =?us-ascii?Q?qbQe2G3egepufXZcJCBiLXPRn/ivQBqojZudeMXESV0zw9kHieyvM7Q6e/oM?=
 =?us-ascii?Q?43Qk94qRp6FAAA5ubslPhw9l46ksoOIDRt5UbnkqB7NBGJqR8nzV8oFFDt4U?=
 =?us-ascii?Q?TYytuRdDAMBapjEFm7jBfgoog7QsmXacYN95QdrGRH+tJ0Iiqu/rz2VJSgci?=
 =?us-ascii?Q?6KsDTA+hEtByB6h0b2qxKqae36SiuXX8XOF2snWKIh2k1rVAOX9wkhofo0ya?=
 =?us-ascii?Q?lnWpNCXTsb1WeLzUu4LxFaN+fvkEkdQCmnLFo7QRtCT5X6jDtZTABOeHu86J?=
 =?us-ascii?Q?wQtvPsjitmJ0nfdVENDhwRkKXYuj3aDztFhVhhoqVGMRRYjVxokvUtfz1C50?=
 =?us-ascii?Q?XnFBc6ErIE27NFx7+IPCvU9R+Q2OKWJI/7hvxDcJuTuWL0Qv0KFcS+JEBYUP?=
 =?us-ascii?Q?jkUp5UddvdsahweFMNurEy3sjSOePLO1qVeVN2+NOcDo5v03wxBWLvIHybwF?=
 =?us-ascii?Q?Tr/Q9qXTdGWUCp8ixxmhU3gWqmlBU29rBtYpmPbfRZMLVXiwv6eVmNZf2ksF?=
 =?us-ascii?Q?o1TeTou8euY99THCLk4cuod6w766WfLqXIaTucgkl5/RqffL780dqz10aWeh?=
 =?us-ascii?Q?vo5Yj39lj2hLUGGlGv9GKeTFQ/f6tF+MwhtZRgpbWiRnyXA0SmmMGWIwyV8Q?=
 =?us-ascii?Q?1ldvJn53teG1P5nncK3UlyMh6XHng2uJfV+gO7n+JOJFNsbq4FXUj7Db9pKS?=
 =?us-ascii?Q?NERPiiJqKKN0rrHR7HCOa3NhQxZuXmDYY2iyJsrPsTH3/jV514gjRLLFfngY?=
 =?us-ascii?Q?CfKThmh3TjnZpXBGgewKMFhqQkut0amQHtQfbTO5jxHNI0BLBOoPuduHS4Ao?=
 =?us-ascii?Q?Ffb79Oy4E/uRln2BBZ21bPg4wJii75E/3lfZ0yfFVLDfzChohgYAPoXk20t7?=
 =?us-ascii?Q?DBtORw2sf6e988VzWBYUp4lVccBpPC97dhtjHHAMGbuwHzqmKFZOzjx1SAw2?=
 =?us-ascii?Q?p/iPIjLx450Ss8SWxv4QbuViSqXx0Qc8vdNAF+WlLI8SoSetgzmgxBJf/FHj?=
 =?us-ascii?Q?IjvdBOP5PBOWyzd1wUg2+/nW/Ru89oi8i0iz7rK8JM2WwAqnqhmzgalp+bEB?=
 =?us-ascii?Q?0D2X6OWoe3IHOIJLClNIghbK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b67b33f3-a416-46c6-2bc0-08d947266388
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 00:20:45.5058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOxdT5EreDyWpZmRqgMXMDmg61U3lnagee1KkHz2zS5l1SRfg8o1mvXBysw53g8c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5555
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
 Leon Romanovsky <leonro@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
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

