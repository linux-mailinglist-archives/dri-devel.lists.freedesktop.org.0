Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040A3C41342
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 19:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6081E10EB61;
	Fri,  7 Nov 2025 18:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="I5iXMBYR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B154A10EB5B;
 Fri,  7 Nov 2025 18:03:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTFhbBx0Pno/J70t8nBwOJiRS6t2tFM6FvxFWumeYaIHY7NmMy6CNaRGnZSAiBpJcUEgoa8CL2/nJcT3o4e9WPY/wiNJzSpDjWEAsc6kB78RpyTYl04xvIgJ84IeO8lwIW2+Zr9oSsnTNjlNLrRzLxA9CpkewQJmYZnZq5DXBM3c8HCUgM/WNpnoaJJ8A+vCe2uBwGk7Hiv7eiZkT3+aYZCU1ONINGeyISQjF2HpNiv3kzktEx46r3cL4WtxW4JPY1cX7RxrT3PWfQyUHZ3mj+LYzjtRuYVLXjUFcdGtJuhGjSI+US0/SVKHoWLgxugbjtmzfnogo8tZxv/f0rA/jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOxNGPCv3W9BIsmUr3bLYQ/2BDWgB32tzQ7z/n+3JNI=;
 b=V2LuX3JcKd5KwIEtx+Xa4GcNwM9VcSdFJ0fU8x4n93PYE2obauj7rvSEIidBXGeifRzUFgDXky6DfzvK8h0WQYOtHIldubCFi58+4kE3PvDPz3WEe3mR4SNVmwTJ4CTm2aY+SwdaNbOwYR5plnWvt2X+i+OkCbvC3v4TrjFo/AkyN1oeimKU9C8m/KsTZUldLYOW8Htc1VtuUp1DrVy2vLUiQmKJD7CEO1LAemWoAg63gFp/lMU2DalFqxURyXGrNJiKd0d21KZHAVaIVBbHdH4/iVlhBxPZt1KMwj+u8xCEQDsyx83ttdOFcF11rPRFjcPEZMzderhrdjUReHxCqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOxNGPCv3W9BIsmUr3bLYQ/2BDWgB32tzQ7z/n+3JNI=;
 b=I5iXMBYRYP6a19uwArDhBWWNse5ikI9muFDxcGc2zavrupSLL7kvHPdmsEFY8ydGQM01KG6zs82idd3jtVehPtsQAC25s67T2OUTEbKOJXcYjuwD2pF/rKB0Z1C4jQM3pt5oo9Mr7vpHGxqCziAOS4B1Nzr3EDznKC0T/Ksd7sig/5MFbuakTY4PTGwirwjhjb4DMnC4KcvH0NVvV+dXvhkDmvvb5fqyW7TLSbG7L3rRgc28e1cl1Kb3DVHabfJOc9ssu3WT036QDH2D7f+3YJ3ltLdPyFEV+Odr42RNk8VCwvnJPtRMAOlIBCXmRX6GLw7XFwYHoJKfKpmjUjB0kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ0PR12MB8091.namprd12.prod.outlook.com (2603:10b6:a03:4d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 18:03:32 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 18:03:32 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 virtualization@lists.linux.dev, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>
Cc: Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev,
 Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 16/22] vfio/mbochs: Convert mbochs to use
 vfio_info_add_capability()
Date: Fri,  7 Nov 2025 13:41:32 -0400
Message-ID: <16-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:208:256::23) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ0PR12MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 46cb3a4a-fcb4-4414-a70e-08de1e27f6b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eCc/412fa1FJ5MTmBGFRC+to9ng0wiZLhcgCj7lBxmHiAywupGbDJ7kCohRI?=
 =?us-ascii?Q?69VzrjphFX8jocFnYNZVwIa00BzMmnVImIAGbjpIg2JBGHUmfUNRoQKoMhnS?=
 =?us-ascii?Q?FKtpwdUSCK/tkiOCwDmuGrIxpoBEBPRZ6VGcHJmlvhg65ouXt1iyolHAlcCG?=
 =?us-ascii?Q?WCDwvbmp+gicRqmmUkQGgr2jLutwZS8wB4IBhAxdpmmL85omcqYnJk/ej0T+?=
 =?us-ascii?Q?rN5eAEk+E01N+9P0LAp+ARxxV/gbLmlAvS0EQB2ljxoeRZZZNdtGE3gw4dpJ?=
 =?us-ascii?Q?zi7zDC4dt6/M2OXnALd9xN4JHjRjG8xi+s5YUE1HD5sEcJKiVn7LJvxVyC/W?=
 =?us-ascii?Q?sI5n2SRSV8xJEUYBqTTLEK3jhRvRilRjG3vPvSUPNTSXV3ClYnh6lcR2d38C?=
 =?us-ascii?Q?+P5t8umYZ4RKDskBo+wP7OdPa4bxBSn5VyjIi0Qf6VmvsUiYuhbM1jjlb+M2?=
 =?us-ascii?Q?ML3nR0frdw0647nj4JtJ2wJVqFuvxPqeIHg1kPfw/gQX0Zr7XJDHqFhRg64z?=
 =?us-ascii?Q?6OXSvEbEzX1z390JXlVomJWIq+JzQ08cE0nHR8AWe/OB0mVryt6VJ2Zt5Xtg?=
 =?us-ascii?Q?HAQrIYxGo4FVfXvNzJkCRM7etnO+bM3bUxlB8vDCj8CHgI+RgkgpJY9u81CC?=
 =?us-ascii?Q?RU2DXr6rUr0WFtjwiBSjsxsYn+regVtRpRG5SDf+mzZ8xIohQFmCQqlqHUFf?=
 =?us-ascii?Q?EmkxzMFMKk2WZny7axwDwrjj/q4+6LirgC/s37/orLKxWEfwjhFqotq3MHMe?=
 =?us-ascii?Q?c+DSukKSm/tEH+IicJbVYsqj1keeteZ9nI7NoAxH5CxPElMm2IE/3hc9YeBW?=
 =?us-ascii?Q?Bn1jks4L33WoaIVHF9C0wAf8MR6orKYnQss1V6ANnX+V37ubaqoeSuMdX1rf?=
 =?us-ascii?Q?zACA3oUPL/NmYUnvs+WVxzi8Bvj9DKaBdCB4paBQeFc+QLNB5PdUDxRXOZY0?=
 =?us-ascii?Q?Bza99FUZUgRMnkbzgwCTVFGIwQnqyfsqVY3LFD1CArhCk6L4hYhIvSCJ1Kgr?=
 =?us-ascii?Q?sc6muxz/+gEUUZvSL9wvosx8oQvq+jOb9BM97wxYeWANxtrfYNe0/7Y9zcPK?=
 =?us-ascii?Q?+XXNmH/JnMedNuuvjLknLSianKrGc0n2EbegLjLzIWteu7Z+VccRqM0I+wTZ?=
 =?us-ascii?Q?rrI0sHUDWtm6o7oBsrIoBBlt/iQM8kA3ngekIJg19yKAXB3gtvvr4hq2XVBI?=
 =?us-ascii?Q?b0fl54r1bBcZbXGVZu/Nala7zXiOMirP7bbLSJGcNkw/WSQ3L/vnWi8e2GMZ?=
 =?us-ascii?Q?6kl/F/MGntaTXInfbvN0ySCCIIi0yyDjxGzJXcYWPkJ26DHv7/FBSKylx+wq?=
 =?us-ascii?Q?41GBzeojujK9v03RA9O5FbuFPY5oOiGP/02YkiE+d94ntvUzspksm80iQ0/E?=
 =?us-ascii?Q?KJETcrYyhwqnpuN3cUZ5J9rQloPk2TnfCgQmtQjCRZRxeM0t7b7P0XbogAMt?=
 =?us-ascii?Q?w7cAUBYLIk6xyTXkZPxoIBOtr+sKXmmOmkBaxfjo9PXAXbcPN3lg3tylaX8P?=
 =?us-ascii?Q?WDZzjRyw36KxQhc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?giVKFcqee0GxzMRzLN8tIKxfipchq8koJHCPt+c1SX2mFENjWoeCEk0rbXNp?=
 =?us-ascii?Q?+nzaHsnJCye8y588X22dIiX05GJVak5IjdmaqP/BMR+f06hqB/Kx9y5b+VFb?=
 =?us-ascii?Q?G5kG74JPgI0chzlKT1DDGHfGqKnddJZIJs5aujtfHRxjjfWSD4NzfZuE5Ffg?=
 =?us-ascii?Q?Jx5zP8eZJHZPQ3Aho5kKnGI7SGuLRfpK86NtnGT6WYubCTPsPN1glGRU9+F+?=
 =?us-ascii?Q?2IGrFGytf/02WZKWojuw0EC6i63Pqnr1+b2jqigOQpUx6OWuoFujswC2OvHl?=
 =?us-ascii?Q?GL9za49RzCZAFjF7ds6GQZKGLjR/SYzAudPhgLZZmuywxU8IfXf111Hfd6qB?=
 =?us-ascii?Q?p1C8WKgRctl2EZnrpcISH50aj51rGDQ+koMoDIjlfWow+pyTEARdgR11tu2A?=
 =?us-ascii?Q?VF3k6lGGe7h7yA+Gz09zeZ0JcgPAvwHs4QjWJPALL6Y3ACq0IMF3NxVOl2h4?=
 =?us-ascii?Q?Hwj9DAlhJfAJv7j7Co3e7YBcw3pgAOWTz0+2KSbleoTyAQ2MlFyiAoXOxQFX?=
 =?us-ascii?Q?kId72jHZb9WZyhDe/kRKjsfM9CAv76XSCOE+DavpW31XfWKDlbE53Hd6frit?=
 =?us-ascii?Q?EuT0bR9zyZXUpb/faOfdvrWlXvRciCxtEXAu+eNitVpw8wqMTk/YaOBUf6vZ?=
 =?us-ascii?Q?ncCehROj7rtC8Ovn77/tEz5QHy+Io5zxJO8E/hHbIsyjHm01V+geEBvvZw0r?=
 =?us-ascii?Q?JY84kjXolRzsRa70MBIMXc/IVM2jepa4QU0g8R0Lm2PNz0zVRSJ3lj6GCUik?=
 =?us-ascii?Q?0ngwfXyMvg3ZcouuR2Fpsa0jTz5afHSpHYwWv/91gaalP85+mrj33kMFvh/j?=
 =?us-ascii?Q?tkIIHLv6fn7guLBLF70jN+YsqUzUJbWglWqiCEgZ1kpmkMIorxzqkaP5VRZx?=
 =?us-ascii?Q?HiLEYxgK+CDdGobQx2f468Zqnp9ApJ27B7TJpp8DR2f3n3vPSuKkJYi2+UOq?=
 =?us-ascii?Q?Yz0E6KKUDEjDMFZyAwvnpS3KtHkCt3fmytZmUYU9FxUV8fj7MIPzXzIsignc?=
 =?us-ascii?Q?66QEjOHJLOb7rhPxZWat4m2mOi4MCU3kSllzuZ993w+k2+tkwAW2eg+JgAT6?=
 =?us-ascii?Q?0Vo/rJxEQcZirTotQ11/i71w29DNev5QA104CPq5A0Fqfq/nAXsCUNSOwKt2?=
 =?us-ascii?Q?zcd96pwtsEEZoqnk68cmYROBhtUsc4sHQA0oaf5pMKV6Rk9yM4+K4X5BEycl?=
 =?us-ascii?Q?Ya5YoriKL3KpDdrnRxKfvKqvkVKp/WBW7Nmnhi9ug5EADMn6vk6gd1+oLkSj?=
 =?us-ascii?Q?6nX0KjHUisnPMTeWWl45WYawNU5/VCAb6CRFpiuzwxdPwmBM/lcF4Tnqz8Z1?=
 =?us-ascii?Q?qx3a3y8mvQSqnvpsl+WUL3SOlINkpO+zld6MxyexVu4tcurNQKmbqh1sCSC3?=
 =?us-ascii?Q?LJ+0weCgE4EOK414snhfpfOQHTxJ99dK4pU6XUlkNWikmWz9BQa3odprOVbV?=
 =?us-ascii?Q?Ak/hJ67W+DY9nj6JAFzI5mAlXPgJ06pXSkyGLdFEH4JahXCs8O0WNClBZXnc?=
 =?us-ascii?Q?r01FLhxeix/jqGgBx5njJJ/mAcBJXEDIEhGC0bdn8SfzUjwiTlznsPpHSXT5?=
 =?us-ascii?Q?oeVxleiejQvTqI92MB0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46cb3a4a-fcb4-4414-a70e-08de1e27f6b1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 18:03:32.6271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uE4ImR9UvWGeeyn2qfT4SlwvLEoehKtMTmgK3A/SXRcJ6LAo7CWysPwOYUoEcWZ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8091
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

This driver open codes the cap chain manipulations. Instead use
vfio_info_add_capability() and the get_region_info_caps() op.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mbochs.c | 75 ++++++++++++--------------------------
 1 file changed, 23 insertions(+), 52 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 7f889b31fa2ce2..64ea19253ee3ad 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -143,11 +143,6 @@ static struct mdev_parent mbochs_parent;
 static atomic_t mbochs_avail_mbytes;
 static const struct vfio_device_ops mbochs_dev_ops;
 
-struct vfio_region_info_ext {
-	struct vfio_region_info          base;
-	struct vfio_region_info_cap_type type;
-};
-
 struct mbochs_mode {
 	u32 drm_format;
 	u32 bytepp;
@@ -1033,10 +1028,12 @@ static int mbochs_dmabuf_export(struct mbochs_dmabuf *dmabuf)
 	return 0;
 }
 
-static int mbochs_get_region_info(struct mdev_state *mdev_state,
-				  struct vfio_region_info_ext *ext)
+static int mbochs_ioctl_get_region_info(struct vfio_device *vdev,
+					struct vfio_region_info *region_info,
+					struct vfio_info_cap *caps)
 {
-	struct vfio_region_info *region_info = &ext->base;
+	struct mdev_state *mdev_state =
+		container_of(vdev, struct mdev_state, vdev);
 
 	if (region_info->index >= MBOCHS_NUM_REGIONS)
 		return -EINVAL;
@@ -1061,20 +1058,23 @@ static int mbochs_get_region_info(struct mdev_state *mdev_state,
 		region_info->flags  = (VFIO_REGION_INFO_FLAG_READ  |
 				       VFIO_REGION_INFO_FLAG_WRITE);
 		break;
-	case MBOCHS_EDID_REGION_INDEX:
-		ext->base.argsz = sizeof(*ext);
-		ext->base.offset = MBOCHS_EDID_OFFSET;
-		ext->base.size = MBOCHS_EDID_SIZE;
-		ext->base.flags = (VFIO_REGION_INFO_FLAG_READ  |
-				   VFIO_REGION_INFO_FLAG_WRITE |
-				   VFIO_REGION_INFO_FLAG_CAPS);
-		ext->base.cap_offset = offsetof(typeof(*ext), type);
-		ext->type.header.id = VFIO_REGION_INFO_CAP_TYPE;
-		ext->type.header.version = 1;
-		ext->type.header.next = 0;
-		ext->type.type = VFIO_REGION_TYPE_GFX;
-		ext->type.subtype = VFIO_REGION_SUBTYPE_GFX_EDID;
-		break;
+	case MBOCHS_EDID_REGION_INDEX: {
+		struct vfio_region_info_cap_type cap_type = {
+			.header.id = VFIO_REGION_INFO_CAP_TYPE,
+			.header.version = 1,
+			.type = VFIO_REGION_TYPE_GFX,
+			.subtype = VFIO_REGION_SUBTYPE_GFX_EDID,
+		};
+
+		region_info->offset = MBOCHS_EDID_OFFSET;
+		region_info->size = MBOCHS_EDID_SIZE;
+		region_info->flags = (VFIO_REGION_INFO_FLAG_READ |
+				      VFIO_REGION_INFO_FLAG_WRITE |
+				      VFIO_REGION_INFO_FLAG_CAPS);
+
+		return vfio_info_add_capability(caps, &cap_type.header,
+						sizeof(cap_type));
+	}
 	default:
 		region_info->size   = 0;
 		region_info->offset = 0;
@@ -1185,35 +1185,6 @@ static int mbochs_get_gfx_dmabuf(struct mdev_state *mdev_state, u32 id)
 	return dma_buf_fd(dmabuf->buf, 0);
 }
 
-static int mbochs_ioctl_get_region_info(struct vfio_device *vdev,
-					struct vfio_region_info __user *arg)
-{
-	struct mdev_state *mdev_state =
-		container_of(vdev, struct mdev_state, vdev);
-	struct vfio_region_info_ext info;
-	unsigned long minsz, outsz;
-	int ret;
-
-	minsz = offsetofend(typeof(info), base.offset);
-
-	if (copy_from_user(&info, arg, minsz))
-		return -EFAULT;
-
-	outsz = info.base.argsz;
-	if (outsz < minsz)
-		return -EINVAL;
-	if (outsz > sizeof(info))
-		return -EINVAL;
-
-	ret = mbochs_get_region_info(mdev_state, &info);
-	if (ret)
-		return ret;
-
-	if (copy_to_user(arg, &info, outsz))
-		return -EFAULT;
-	return 0;
-}
-
 static long mbochs_ioctl(struct vfio_device *vdev, unsigned int cmd,
 			 unsigned long arg)
 {
@@ -1381,7 +1352,7 @@ static const struct vfio_device_ops mbochs_dev_ops = {
 	.read = mbochs_read,
 	.write = mbochs_write,
 	.ioctl = mbochs_ioctl,
-	.get_region_info = mbochs_ioctl_get_region_info,
+	.get_region_info_caps = mbochs_ioctl_get_region_info,
 	.mmap = mbochs_mmap,
 	.bind_iommufd	= vfio_iommufd_emulated_bind,
 	.unbind_iommufd	= vfio_iommufd_emulated_unbind,
-- 
2.43.0

