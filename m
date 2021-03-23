Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A69343466DC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 18:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37ABE6EC62;
	Tue, 23 Mar 2021 17:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690064.outbound.protection.outlook.com [40.107.69.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EB86EC62;
 Tue, 23 Mar 2021 17:55:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltzQOiW522Y4dkHdAL3BqxM6IIQPyb09MgiEHo7tyal0IA46LbeAr7XMu6QPlixNIphmzSyEYOq+7J2xw7xbTER6Gppw+h4ODQl9uaHPmmpgN+JmxzU8xLY51uW90yoMm9c19dYrdBeeDYmQW7gIlMlaxxKh6AxxhAXTCj62A17/RyQQKY+eRY0taNaCp5utg0+REaxjuBjcXiA+W2s3m4x/xUsdBmAHMeNrux7GkI7dmPZ3TfYUzSkfoQhkaVr/LJrk9Mex20bsmpSaET7bsnAUIPmHigqF80PZuWoNYBMtJ8UtFmnLFarfDF/8bkZjEhQtMnaCD6LC6FuK9q2mlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhnSqc0n+mNNMJCgBL2mzcTzmW+ce6iSPtXfQNgWPcA=;
 b=kkjWhAPK0qyw7g0ghPa6LwDdqqLW9cIDZiI9x6lsqpNF1xD3dJlQkYWO5XQ6Ro/s/x1n+cOUVQ6NZqE3BDa/r1EO7bo7uNIyn0iqFeq4ApCSLlSAxDy1cNMrheQkKL6bFCcoA4lWWZ5YHRa3mlB/colmFwwVNtNYGq3sjRzRzx6nenL8Lq7Nlm24ozhCjS7Bu0fPY35S3f5U5MNSdBVZN73eYmGYizcFZGXR+I44menAB4FZBjby0rcqfwG6qN3DdXWK+DO+9rW9O06mNFjZ3ao8KMyqSaGJc5JPqLoMIuvWv3PtsJkxoG/ir7ssx6HO7K33zXltaQDYlz0sHzvrDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhnSqc0n+mNNMJCgBL2mzcTzmW+ce6iSPtXfQNgWPcA=;
 b=NVeI1Jdmlz6Bp3sLOcPO5DnlwWVTjuKp4ow02VJAWvFNifTU2x9gm/wIWf0Tq1OTtAjk9jGxtBQdkbVRaaY4tHeeFiyT7Zj5oh4besZrQo5+s3EO8R9Q1tNGzAc1t7LXcMoGKLXkLqCgYuoCe2VeIxITGUkaIgHoS3ne48ILKTKQHIESv/jCXdskcTKxKazbXVibG+U65U4fsxPbW3wa/hawShKS73JitFw34SI1J6EulLYG+nnxhycbvKIjgjath5aKvNCgUN08hL9ncMdemQNfoHOljOJHzxkI7pFOZhwf1dTqDwVmMlwduJtYZwQSeOXml06jz5CCJVx8FYpNQA==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3932.namprd12.prod.outlook.com (2603:10b6:5:1c1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Tue, 23 Mar
 2021 17:55:39 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 17:55:39 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 17/18] vfio/mdev: Remove kobj from mdev_parent_ops->create()
Date: Tue, 23 Mar 2021 14:55:34 -0300
Message-Id: <17-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
In-Reply-To: <0-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
References: 
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: BL0PR0102CA0029.prod.exchangelabs.com
 (2603:10b6:207:18::42) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 BL0PR0102CA0029.prod.exchangelabs.com (2603:10b6:207:18::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 17:55:37 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lOlFf-001chT-Sg; Tue, 23 Mar 2021 14:55:35 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fe83c2a-9440-40b3-3c68-08d8ee24dd7a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3932:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3932C7E77A9ACD0DD1FEB83FC2649@DM6PR12MB3932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cvWuYBLSeBhpQK5P6xQZWZ4Jj15CkkIG6HzQxVExVZMFR/F+vF4uJRtuNxkS66qE5t1XQNA/c5cyP4Q6VGrFbXilKVwe5e8BrHfnqca0n76h0cyj3RDC4O03khjox+sM2DFC7NKgGzQJyuQobmJpZcBFon1Hx7gf8Pu/8bUjvkZcsdFDmo+SkURY1ogIz0TYN5LpySgkEhcp6I7RUBtifuZ7VERjut7LDRQN6Qd8DQXcJPJZr8MIe7w1og9ubT4GoAHzi2NGaI9+3Tyi1vT6pBTVVnAiA9Vl7DRnpwL3RE3EQgi3tvSQV4aAAEXMG3P6IJH9nh3tx06c0JHxaD9+yFekGhsOcNg+xv/r11myJ7/2yvyeIWHiA3NJX1lOsYUbGRlmGEB/I+QlGGwjy+2odiR4mgXT0RTpaGZdib8moLpnrbNqqQ4qxhkqwSJNQhNrYurx9BGYouXIZeVS2SlAJxj/Pd6hoGbDtLLNXBruTQ5GlsvwE5H5ILFkq3ydO7rGoA6ibbwjeia6YuvBi3VWMo/dS/Xt5rdiqYppbNuk8q1A0Wibfl99r6efol4/d3PgZiUrjLPnOxUECJzErEqcVMxkLhz2TAPwn3BhcmI84aBL3pgsHgnrx+7ir8tT1JzZ6AO5J8FFbAOF8obRBzhkXMtSeEJeWNnStFkTGz/pQPqDqcTbQ6uYYHgdFqcmrGnn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39840400004)(396003)(346002)(2616005)(9786002)(478600001)(66556008)(86362001)(8936002)(107886003)(66946007)(83380400001)(9746002)(66476007)(26005)(921005)(5660300002)(54906003)(8676002)(316002)(2906002)(4326008)(186003)(38100700001)(426003)(7416002)(36756003)(110136005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ytix0lNIz13iTRqUP3z9vwM9VyqRrkvZYjLUnAODMzzFJRMyb2FFDFm0acci?=
 =?us-ascii?Q?UucxU2EPVKsbbP97glCbnrx9/IkC1/5ZwyfEmZJ1hTGcDWL7Mm3D/kyzRVim?=
 =?us-ascii?Q?yJ7HQeADExQqXqrs+fA4fccy8WqtRASdNo2HUNz+C7nPMHMCh4/jCB7zlgL0?=
 =?us-ascii?Q?qOBzZOPcRZxbtWDCoWTlwKvgqjQpJOWFitmy4K+d3cdbkm47FKP0Rpe/9mp2?=
 =?us-ascii?Q?mwW5YDOSgnHLFUGw5TsDmYRqOTyQ7vVkVrBp3+a6bU2Gpim2Qh3G5WtW6fjX?=
 =?us-ascii?Q?xxTAqvvwdFSeUb/0cjsI2h/HB2JAsA77e7rKembLomHGHll6f8UdlrDbwKmL?=
 =?us-ascii?Q?D8z6MYadPXcF+85GXYV4I9CAluZFSX1+eAVP31Pz2bpBpUFH2XJKZ7Jjhpau?=
 =?us-ascii?Q?Entnp52n9c0NfgrSWkOA+GAcFof4ievuXOIAdPNJAwAffQiQxgOMDTx0mu52?=
 =?us-ascii?Q?XlyBopdkV6/7BxDzwJrq/pGWA4blRv7/wdfqSoOwR62MdM9H4iwF5sV/Svbp?=
 =?us-ascii?Q?R6ARgDFG31uSm+jUZNIm3FSCA8BtifpFMd1ddFzH67um15FefUXP1TvwPaGe?=
 =?us-ascii?Q?r7svouEpIM8QsM3169sfhNhud8tFJ/bpeG3qoJCM7kUACUqk9N0m/x8DjbKm?=
 =?us-ascii?Q?HAAQuiUxmwEjvJis5gRSH42yGvse7C28XU/FRl2rLtKY6xyjdUyl05Km6/2Z?=
 =?us-ascii?Q?9GqEsBJ1KEfTruri5ZWCcJzmyMryfEty25eMk6AALi0dZ/Ann9FZgrj+hcJU?=
 =?us-ascii?Q?pNwjJnSrYtD/YPATDXV+tn5QyI3Pgdm+RZ8gTv0IPWhD7V78Y44+iJUWNDRn?=
 =?us-ascii?Q?wn8MfjHJ4xghO02iKPP4SFW55P6h5TjbDwINmXjrh3ht5mrje+PUMYDQ4yaW?=
 =?us-ascii?Q?RH7+NWmpv5sX1m7MTH8ZV6YV4+Wak1blxr3X28kjrmk4xuWITUFX/25DS4Wj?=
 =?us-ascii?Q?WBu3kP5fA6tuK5TKDPgQVpWL46uUHw2SPx07aKryE1IpCypb18gPC1uM8S4N?=
 =?us-ascii?Q?3kTLKXpbsiWCSG0NreWxiDpmij+xCy8r0+n9FajvpHBdaleld9RA94yr9EcE?=
 =?us-ascii?Q?VYGb3qBA8UGrJgxNE0IUdWTCmqDrBPE+Zm7e6iv6eIRGmwNElaHGmkHFqe/5?=
 =?us-ascii?Q?CyfXUvrIM5LnWGLFF94xnrn8E8pE/XGeHyChgik0tIFAppd80sdpuWxRnWn2?=
 =?us-ascii?Q?4TFNGYNoSTOCTXWksrOsCxcWdAjCliVnz+BQyRsnjv4IVAnCmvrV/2YTftHd?=
 =?us-ascii?Q?utK0kNhHmTe/ZK0Fsi6PU57cm6pLPzjCj1jy+TCrP/K+uuCDlRCc5gRIr+Dl?=
 =?us-ascii?Q?i15XLrjxXvmAJiVrSqAJLOdK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe83c2a-9440-40b3-3c68-08d8ee24dd7a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 17:55:37.7102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbJDDUsMiQ/E56qJl3xN/slkyqbUaugEScUmOz9kV9BXHNPtWzaaOMel2FJTFkH2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3932
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Tarun Gupta <targupta@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kobj here is a type-erased version of mdev_type, which is already
stored in the struct mdev_device being passed in. It was only ever used to
compute the type_group_id, which is now extracted directly from the mdev.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c  | 2 +-
 drivers/s390/cio/vfio_ccw_ops.c   | 2 +-
 drivers/s390/crypto/vfio_ap_ops.c | 2 +-
 drivers/vfio/mdev/mdev_core.c     | 2 +-
 include/linux/mdev.h              | 3 +--
 samples/vfio-mdev/mbochs.c        | 2 +-
 samples/vfio-mdev/mdpy.c          | 2 +-
 samples/vfio-mdev/mtty.c          | 2 +-
 8 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 16e1e4a38aa1f6..6bf176e8426e63 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -689,7 +689,7 @@ static void kvmgt_put_vfio_device(void *vgpu)
 	vfio_device_put(vdev->vfio_device);
 }
 
-static int intel_vgpu_create(struct kobject *kobj, struct mdev_device *mdev)
+static int intel_vgpu_create(struct mdev_device *mdev)
 {
 	struct intel_vgpu *vgpu = NULL;
 	struct intel_vgpu_type *type;
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 68106be4ba7a19..06a82ec136080c 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -110,7 +110,7 @@ static struct attribute_group *mdev_type_groups[] = {
 	NULL,
 };
 
-static int vfio_ccw_mdev_create(struct kobject *kobj, struct mdev_device *mdev)
+static int vfio_ccw_mdev_create(struct mdev_device *mdev)
 {
 	struct vfio_ccw_private *private =
 		dev_get_drvdata(mdev_parent_dev(mdev));
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index 41fc2e4135fe18..6d75ed07bcd49d 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -322,7 +322,7 @@ static void vfio_ap_matrix_init(struct ap_config_info *info,
 	matrix->adm_max = info->apxa ? info->Nd : 15;
 }
 
-static int vfio_ap_mdev_create(struct kobject *kobj, struct mdev_device *mdev)
+static int vfio_ap_mdev_create(struct mdev_device *mdev)
 {
 	struct ap_matrix_mdev *matrix_mdev;
 
diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index 3ba5e9464b4d20..71455812cb84cf 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -286,7 +286,7 @@ int mdev_device_create(struct mdev_type *type, const guid_t *uuid)
 		goto mdev_fail;
 	}
 
-	ret = parent->ops->create(&type->kobj, mdev);
+	ret = parent->ops->create(mdev);
 	if (ret)
 		goto ops_create_fail;
 
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index 41e91936522394..c3a800051d6146 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -61,7 +61,6 @@ unsigned int mtype_get_type_group_id(struct kobject *mtype_kobj);
  * @create:		Called to allocate basic resources in parent device's
  *			driver for a particular mediated device. It is
  *			mandatory to provide create ops.
- *			@kobj: kobject of type for which 'create' is called.
  *			@mdev: mdev_device structure on of mediated device
  *			      that is being created
  *			Returns integer: success (0) or error (< 0)
@@ -107,7 +106,7 @@ struct mdev_parent_ops {
 	const struct attribute_group **mdev_attr_groups;
 	struct attribute_group **supported_type_groups;
 
-	int     (*create)(struct kobject *kobj, struct mdev_device *mdev);
+	int     (*create)(struct mdev_device *mdev);
 	int     (*remove)(struct mdev_device *mdev);
 	int     (*open)(struct mdev_device *mdev);
 	void    (*release)(struct mdev_device *mdev);
diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index a1af30df10a2ee..ac4d0dc2490705 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -506,7 +506,7 @@ static int mbochs_reset(struct mdev_device *mdev)
 	return 0;
 }
 
-static int mbochs_create(struct kobject *kobj, struct mdev_device *mdev)
+static int mbochs_create(struct mdev_device *mdev)
 {
 	const struct mbochs_type *type =
 		&mbochs_types[mdev_get_type_group_id(mdev)];
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index 08c15f9f06a880..da88fd7dd42329 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -216,7 +216,7 @@ static int mdpy_reset(struct mdev_device *mdev)
 	return 0;
 }
 
-static int mdpy_create(struct kobject *kobj, struct mdev_device *mdev)
+static int mdpy_create(struct mdev_device *mdev)
 {
 	const struct mdpy_type *type =
 		&mdpy_types[mdev_get_type_group_id(mdev)];
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index 191a587a8d5ab1..f2e36c06ac6aa2 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -708,7 +708,7 @@ static ssize_t mdev_access(struct mdev_device *mdev, u8 *buf, size_t count,
 	return ret;
 }
 
-static int mtty_create(struct kobject *kobj, struct mdev_device *mdev)
+static int mtty_create(struct mdev_device *mdev)
 {
 	struct mdev_state *mdev_state;
 	int nr_ports = mdev_get_type_group_id(mdev) + 1;
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
