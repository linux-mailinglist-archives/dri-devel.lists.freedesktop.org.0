Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F86355CAF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 22:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E17B6E8B3;
	Tue,  6 Apr 2021 20:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A9B6E8AF;
 Tue,  6 Apr 2021 20:07:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKaYyFNLaNQOZEemqx+qlQ2n20kZ67guoxSFxYDvegm5fE0bFGBLZ0aPdJdhUpLMyFoogLJN3ZlL7UuRyQx2UTdHMAvYM2lUoDZHPN7QSHrGzDXa/O1QwmrFH8dtPmhNtJ0MO/J0K7QuZ+Z0C4kziNl78juXYLgiSaRjCiAfjWr+XmuMYMk+w31ax8EE57R55+4pvhkGRZRdUs0aPzrlOyqT9mtMtzuXkkO2NSl59bj4nP1yANpgYOXJ5KLbcjzhk1xrxhjFjJ6aQCDG5WYIM74JmoVz4QRqZTX54LQZqcErhS+eQ9GaNYl1a+xqcHOwaM5nALTuSbrSFegOfrslkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQz5KvjjX7thR+DVlFOXa9VeJSk7pPDIRbsC+KXJL14=;
 b=ClC5PWnLYp1OBqo0VtByrW2B4eTLQGly9ybavPgbQtTn61nrG6XrpQYyDg4POULQIR/seiCblMTeRSMTnWuWRWKQt3hulpv0D3CqvuoqIp/bNdLhnmXpnwsMR2e8XfLI0GB0DVClyf4w32bBSaiCqdixT9WNiVXRDtOCbDU84JjDRcgiNawDcwnQTIlb2KTZW8ig3pAkXug4bLHNV5OZ5HHSCVap5l8cq4hlDFVYUnDD0XsnOPHufe4cjh3Nw33E0FxgEBxlQijXZO+WB69u2g/6bPg0LqgNz3g+/4OWzlc7g+bYCIjVF2WTEfM64CFh9EggBZrZG4V+JBK2eIA8Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQz5KvjjX7thR+DVlFOXa9VeJSk7pPDIRbsC+KXJL14=;
 b=QfFr32B9vMcAbiYck7Hr/4oP8Mc2U/jn6+qRnC0xkB739fliwPRUqs/xlHedbgTEZQ8/r1Z7qhUCOBvJoam04j7dSGNxZjJFp+y7FldSsX23a3AuB99OAAlKHQA6hWEGlHP1CxDR5HXxeQ1WIhvPIN8IacEZd9MWUo4O1ZAqbsTIMCiXSUdPTaelIL0L0N/MtbZ9o0ZVcIXSi9hlWjTmkN4zrInIub89XjhKDP9XS2FRij+v6nlNVrxMFo+8CyvKCSzHYadtJOAz60meRfr+WEHao+Vzb2ePk2RRtwN+AwNhm7LW+EzaOrzaawCTvujfojVv7cto+jEudje2L0dxTw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB1883.namprd12.prod.outlook.com (2603:10b6:3:113::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 20:07:23 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 20:07:23 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Eric Farman <farman@linux.ibm.com>,
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
Subject: [PATCH v2 17/18] vfio/mdev: Remove kobj from mdev_parent_ops->create()
Date: Tue,  6 Apr 2021 16:40:40 -0300
Message-Id: <17-v2-d36939638fc6+d54-vfio2_jgg@nvidia.com>
In-Reply-To: <0-v2-d36939638fc6+d54-vfio2_jgg@nvidia.com>
References: 
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: BL0PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:208:2d::40) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 BL0PR03CA0027.namprd03.prod.outlook.com (2603:10b6:208:2d::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.28 via Frontend Transport; Tue, 6 Apr 2021 20:07:22 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lTrZ4-001mXu-G3; Tue, 06 Apr 2021 16:40:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c16b43ec-dcd5-4cc6-a792-08d8f9379728
X-MS-TrafficTypeDiagnostic: DM5PR12MB1883:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1883F603D6A7F66D3F8F40ECC2769@DM5PR12MB1883.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 12ZzVD5Lr87fpvFfZOj3vtlSDl8Zw/a4G1+IEhgYYx2uhlo0YZfJh1FVE+rR0GAcg/tFihwHSCNSUs3m7YDiMrV8vqtwNALKWjroboaAyhpYICb+MctRc9lmDkXUIhQLUN1dhJUtTcYmlJPAs4ukBUHivJ/ttOL9bxQomEyY3ZZFdKPzZFWwioqsBwkcyXzcsA4sNTiZ+NBdWIVFmwThlvc1NnR6pTYFEobcv4zJ6XY40tLFGf+48Hn/w9FXZ0wrdWc03EaG/jhP7T2HSf1/m2ulYxFy9CWUHfK1wOwN5dvyCXzT6nIVfjZqyM25O0GQNy6+pBGWob2abtRNjPdXcmetBA9/BrIM/FTd7XDpaNusIR8GxfakZFzQuGMhlXHP5TxVW/7WRmyWPGEXnzm5uUmgpaJLLuowJr2Ob57xyacSwoPIqyhhdj77xLEuxU263RP/Fc8OSXSppd03P7+Ut0GLznHD9LBnx9EzwlKUYaVpHYFVOkYRv/cR7B65/wYNMtnezy6ewoGs11seYrzTGY7cXzH4uBBiSsZts8Upj4WP8XxqEaW5Bejt01Iw8vfUaC/gyBFjC28Od+c4t7MvA2F5fE2k/ZoVI6gGp5t97GSnB78EIeDeALfADmUhCS7OYCdiBOScG3VnAdJY5Z6BVNK5Q2Zns7zoWdyLdT5C0xAnaIyV8VClZjtZLILYtoL4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(38100700001)(186003)(86362001)(8676002)(8936002)(2906002)(2616005)(316002)(7416002)(54906003)(478600001)(110136005)(9746002)(83380400001)(26005)(66556008)(5660300002)(66946007)(107886003)(9786002)(4326008)(36756003)(921005)(426003)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GGibTQ8RLskmI4XO6PdQDP97SIeXXTeK0Sw6sDdYWElf2x/uRfvrwXXYvqif?=
 =?us-ascii?Q?gMsBqRb2mvrYv/eautLS5iVXPPvs1HB/4/D/c7mdVt7CMYceM+TnvNY9rFDM?=
 =?us-ascii?Q?a4N2JzRIz+scV+xwfkG1FeVCvP8OWIx4aa9wWJQtN1eTl46TBejt4gCicnsG?=
 =?us-ascii?Q?Bll7dvpne4Wsm1ZJwLYKboKQiHM4pKUZ/MSzztdJKsjb4mlfpndYpGu0W6RN?=
 =?us-ascii?Q?y1g6u2iGgXnTf83Tw1kgUv28AN2oTnYooIpj7WPe5tDVcuBseVp82A7eXnaL?=
 =?us-ascii?Q?kyLsZ2aBfHYUH6dVJlCfjapYnZ6UGsllrD5DnBcdZ1TL5TggWpwPuaIJmmdg?=
 =?us-ascii?Q?fYgCGcU/1c0D8499ijVAi7B+12XBbA+zy0pQoCxbPVENz+1Wa/bA1GQl9Taq?=
 =?us-ascii?Q?N4t3fCzoOF5c6KqKH7KpS/MYFfs2FCXzyaUnrNMZADwovLMjAe9Uc7sUUOlW?=
 =?us-ascii?Q?P/iGtGHW43YvNhjF0m5pVBZhQAjyJB8mZnYRmH1fpmbCXteeFI6ytVwf2TKh?=
 =?us-ascii?Q?aoM4gT7TAMtgIjMiS+uALsyS5AXsZZc0Z8uul4d0nalZqWjdfvYxLfhyc3ZT?=
 =?us-ascii?Q?TCbNm5pyKIFmuWVlxx0NaMIRwGja7zmXpQIrDGjqbP0cFGxITmIpE0x5/T4G?=
 =?us-ascii?Q?KrBMltoelaCEo4USzaTqjHAFoL1xjoe6l7Vul3Rxjm5S9vAkO5JUWwoUrb16?=
 =?us-ascii?Q?NICCUjVQvvGVnsFhLs2Weoi8HOCe1fFSWxuG7ARLhfe75DY1M+/xgLThPbjI?=
 =?us-ascii?Q?RV8gSf9cplx2NGrkQepaKssmqgV/vmgFW6Q54ivob0Vyo4MFI/PnbEGVEprr?=
 =?us-ascii?Q?kOBloS83Bge/KROc9BIQXU9o9eqleT71+iQWYks4qY9i4j3MLadbOVg7iK/n?=
 =?us-ascii?Q?CqgtoJIj5ymcz6HwdDMt8+HBmGqUPqf7Tx0Cie//np/s16q9LkdGj6wfAxK7?=
 =?us-ascii?Q?pjFYmDhZIRjSlW1b3sJOiVN6UIaz/l7sIwINXlNX7RQJ0lwBQgxwdVKmyWrC?=
 =?us-ascii?Q?yGpxiDrYCiH3kjDBVYMvZKSUvRiitYiaJ5iPcNQa4yhms3+1dWRW2Bw62+KE?=
 =?us-ascii?Q?3IfG0PzDDTQkMANtuZz3w0SMhzA1WCxE+u1yjiIkinmx+F2TI/0XWVSsaQCT?=
 =?us-ascii?Q?VjVtopz3j781mid5aZd+oR4+Pue3nXwa9WnZxiXaBA0Do1KxKzKsML4cxL6D?=
 =?us-ascii?Q?14oCdBgIkKAm1xWbgn5Pmgxn8GnR5d8LRZxy+i1OFAXO0L6kSpuZGdkNZtcp?=
 =?us-ascii?Q?IC3SxpY7mHVKpZMctp2P/Bi37UXVfGDu8z+mfT3EsOaWWHeByXg711Vk9ueq?=
 =?us-ascii?Q?OOCI76CbMQadF6YI0lbjasIr++8czRnZlfna2OZaEcFz/Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c16b43ec-dcd5-4cc6-a792-08d8f9379728
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 20:07:23.1174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EAt7p3spiPjS8SsQNFCHDz03CNjrL6DLOxk65OD541zQJcWthTd27IOHWxHpQ0Sw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1883
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 "Raj, Ashok" <ashok.raj@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 Tarun Gupta <targupta@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kobj here is a type-erased version of mdev_type, which is already
stored in the struct mdev_device being passed in. It was only ever used to
compute the type_group_id, which is now extracted directly from the mdev.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
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
index 767ac41686fe2f..10407cf67583c6 100644
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
index 1ffdd411201cd6..d319152dd484a2 100644
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
index 5ae06f951a0998..10eff33ce1f263 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -286,7 +286,7 @@ int mdev_device_create(struct mdev_type *type, const guid_t *uuid)
 		goto out_put_device;
 	}
 
-	ret = parent->ops->create(&type->kobj, mdev);
+	ret = parent->ops->create(mdev);
 	if (ret)
 		goto out_unlock;
 
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
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
