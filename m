Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF34620558
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 01:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8388F10E395;
	Tue,  8 Nov 2022 00:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC6D10E377;
 Tue,  8 Nov 2022 00:53:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3U/BGYZErd4DTEbAY0mlBk3zY8r1rqd1V3WTFhZgDL8x2imU/aWSJXUFoI0WRT/rXj7C1dwqU7YcVhcwU1qdI1zJrlpOK3+rvEI3Se6fchfqp3Dafk9xH2hHYZIN3BvShVbBtllQ9SIxjkydEznHEujEHYqkocla8HO2lMu0a90EKiDUq57/JOUbvgyHJTSsgFtciUdjhPW+Kjw4qtAkPnUn/Dg81iBKjGiTGaDtRh4dIodNfsP+6XibaKqGXUpwgTZC7cHWMNtWYaC1XKiQDLGlhKhKA442vIwHuET4G7l2MD9sLVA6pyuQrOad7DDO8KzE06kVy+kbI5BFyDEGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gkFzRSwE27dbKGKEZx1tLmkGTXOZlPKYyVqtHMnB08=;
 b=KRS7Dw3YjtW6rtrRxc0GupC3p1HX3/FN+EVWhqbg/sml96e5U0nI6Ky5hlsQrh9ERjWrzRWOLSgJL/NZh7u84Haq64F2up9MOSRrZLGcD4SBgoKBCKMZbBhbWcAHk71uDkmoKhk4bXqXWBTm9VUiSNv3DDrzfnd9e51owDb9wkN+QMWYWZghIM7IN3wvxSga0j09yD6M04ZzjFAQiiIuubn6Evtxk7A8LkNfD3c2sok4aOS+8Ebxo9XLJLv135MEXOJW2HpXQGLIQ9ALQjFJSxncIaOAO+CtfkHQPFSX0xdecSkLuHMy2bBBXqj7IUAQc1cz3f8nxXyURsnvDQXDFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gkFzRSwE27dbKGKEZx1tLmkGTXOZlPKYyVqtHMnB08=;
 b=UZ7ty1gHbP3tjZrzz+kFyDXclQUGnVsb69dgN3wpwZ7MO27CDda2YcBC+glz2e6FG7qPT2wKQtM/mwV/kwCRDxp4UjVgfa+g5faWj0Y5GedLj05+P926xFleJG7H2rgqwffjQoY9RO8EHqY2SL3nKxj4RV9/DsIVoxTZEkDwQR+uOBr6N1bE2aEwZrmO7OYi5cYWQX33n6rb03B5HhDEGOShtARSkKvT52FRt2ITuJpW+SsLeGXDg388tzvNdBrYfR7yLaO+r82gD0fVRDZur3/szvaoXMKAa5G9LgnBqNpxNWdbVRyD4ZluIBTXH36nTJOkF5SQLL34LmtbjHLTwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ0PR12MB6686.namprd12.prod.outlook.com (2603:10b6:a03:479::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 00:53:02 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 00:53:02 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Diana Craciun <diana.craciun@oss.nxp.com>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 iommu@lists.linux.dev, Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v2 04/11] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Date: Mon,  7 Nov 2022 20:52:48 -0400
Message-Id: <4-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:208:32e::24) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ0PR12MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: 19800e18-4dc5-4084-0fc3-08dac12393b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NH95O8Y8YqukHF7mhZEgWrJtCZIcLmDs73KS4h2zbXzwzonYMCYRY9a9It8EKuMcxQ+v37ml+Q6k7BtKRa7SuUFcZ3ZwP/ItM2DKS6CJYjfujlXBM3hnqcWK7OTQB/jVvBvE/rClNwRMOg8XhMsTRXpheVf43Dx0ilez8MZN+4JNBSBG9TWU0emriZuxw6j1XuNRdl6GPp1kuY4drcB8YmVKJH9Ypm0NGypjArtDy3jh+C118Jz8OBoGeqWoEikbIup8HdzACmdIylCgzCz7vvJG2IsTW2luEoKQTXRvGj9Pft8ZMTLE0fVmvVPGYACm6J6cnjHhY+yuwBuqcLFIV3VQ9GuclQv2AIPhfHHOFywKYz6dusnvntq1u3fZorOEi0/Akhd3J3t09oz1lcAY1zCSguNkvlNBdMhxqKERRC7IS2BmfXKT8G5ssLavCaB65d2KdhuXlSwAajt6Wnopg2zh5P4RfctpSfAogD4B5iPtaMjkBVxgzspWQ5Cb+2mkR+hsIwD16UCgL/UDyv19JfxW1AQ6BbE05Y/ojnIzfF9SxIyNMHydsknDU0p1UcGiVIc/b0XC+8mui09ic6Y6DG5CIhiNcfzljO2XzLSWGnA4RA0KIBagjkV/jfzhvyxxjAF29CpREEEuIZ3P66cnzVkHu8Ib6YWSc8Ea/BDTDvj8E1wSFXxVpQpSL0ue4eEfsYBbHwTSLAR1Zg6pAMykPvcPwXdd1+Q6fvZtYW+RO47bYTCg0V9xgkI9d5I8f9pGbbSQ9QHw0nFmesm8X3naBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199015)(2616005)(921005)(83380400001)(38100700002)(186003)(2906002)(7416002)(7406005)(8936002)(86362001)(5660300002)(478600001)(6666004)(6486002)(26005)(6512007)(6506007)(66476007)(66556008)(8676002)(4326008)(316002)(41300700001)(110136005)(54906003)(66946007)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8V+Enb3OWu6WMVwJq4NTT8RASXHqT8VumlLllayDhesleLPHQCimoiFRMHAV?=
 =?us-ascii?Q?oP3JWf7t41gmdCjtwpvpi0qlsPVjdeKQhK/fx2lr26FLNHbHHv99kp8SDe55?=
 =?us-ascii?Q?sVfTKzy0sk3rhaN6pbK1lRRnoWw+cMFSKiEmkg05GKYcXzI428XiMt0z3S89?=
 =?us-ascii?Q?h2XptiKoIMg7xEniKynk/ys61Q17haJT7Zux7rUfHGN/Gjy5z6WRS+OJrpxq?=
 =?us-ascii?Q?3Uva+DZqOrNmDlIh4SX6wDyFJ01kcE1lolJ3gMkAAn/cXfHmvaSJqvQJwZzc?=
 =?us-ascii?Q?kTH+FyC+QH2VO1inCI0DXKam7Tadq7SDvwUS2d12gx2ZPLufLSCOUcz+FD1z?=
 =?us-ascii?Q?CRzKBBeW8WvDmCJIdkALcdFfAJ4DXYO1Vfsggrt+ePxvWskZ1aWxB63emT4Q?=
 =?us-ascii?Q?ibJpJggQ8zbB+u3AnRxZtAsCiVzHguMVOb/Xy4hMLV6proeoDoqu8BCTu1ZM?=
 =?us-ascii?Q?jSWo1lQ73QWPoDWfguv0ftSTlSzSiZaS1jAnssd7bFIx2xz4O+E2J2ZxhWbG?=
 =?us-ascii?Q?fNgOc1545+Ha1oJgaYCUkhqKoApHnqDCZwFtXRgAG3IGnBRBfJ6PKMY9BJZg?=
 =?us-ascii?Q?TALiDK5mFdF92Zp1PZz+AawMxlWYrUMW/t6em6HTxn5vQ28xwcNy6NauwL8g?=
 =?us-ascii?Q?7w9XHFHFbYPoZqXVbPO483OMEdg7sXaUFF9uUtCv1sIY7ivDvtD2gqYgSUkD?=
 =?us-ascii?Q?0D2jQeSPMPdMm4CqiAtWszzgXoxNfHnnXvhPiYkKhVCwSXw+yQwP1I5nGd6Y?=
 =?us-ascii?Q?rygpGnO4If/G3TQtYasJS0PKQ3QH0wBE4GNdv1G6V9AjgRGSI5PVxErbrXqD?=
 =?us-ascii?Q?5O4dgObBKCjyz0MIfV4mzSs/MdJEOksT7YCljuI+byste5rPGVY2ML9aAaOL?=
 =?us-ascii?Q?C3ZQlL9pmE7iIr0WGUDJXTS2oM794ouGVDf5c6je+ZiqYGlDcWTJFOOyjZ0l?=
 =?us-ascii?Q?nDQiON6fJ8P3NUJAj7+BvX1u8EY8Ggt+Z6wM25BM9kqR0YiSn2kCXAYOB/3q?=
 =?us-ascii?Q?Vzjy4vNxzBW3xRZeosISDAQrEvC8+SmzSh+dLwwYfbDN0qhdVYlj8nUh1fYq?=
 =?us-ascii?Q?ChMq654n6NytSog9iTS0Ok0AYukip7dM8KD4sTlAw790VmyIifjCoNyALJTc?=
 =?us-ascii?Q?RN/AyqYuKJRYifSklS6lwZo0M7AkGplMSEz6/mruyByfXA18FSYucN2SyIkp?=
 =?us-ascii?Q?0I9CazYWfrQRFwnaTalQzVMV/yf2GQyandU86vIXkmS8IRWGFth76KckvLpm?=
 =?us-ascii?Q?bhUVPt/vKM2GmE3TkX3wl56yytu+mW2a2k3SeExsa4SidKBqetzhTroLptoy?=
 =?us-ascii?Q?Dbidw4Pdiho7I8wu9vbClV8UZJdjB84qd8TSUt+DLT2QjkQhUDQqeQN1a3x1?=
 =?us-ascii?Q?9oTKTXcpv86t6kpOX+NI0K/DzFg7stZb5rGH4N3pYp8CBcc3wXV1GbrO3zW8?=
 =?us-ascii?Q?Qx8CkNhF+IW7EQgRoZn5DpMo0URQKpp4wa/yjQwi1Yz6dzvDh1MOKtfKInPT?=
 =?us-ascii?Q?s0P9kkFJm4FQt/HxX6C0HLOa1nFYDlz36YeGeDWvAPXuGRpB+4Q7fuP7fXFG?=
 =?us-ascii?Q?0nkNYB+DmR2XW0T2Ypo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19800e18-4dc5-4084-0fc3-08dac12393b9
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 00:52:57.4772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TtFiYtKAjNalSUvvi77B/qRsbKt1xdvtkpzuXZ5ZmsxUEsQwBnJPJPpeemq1ru/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6686
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This legacy module knob has become uAPI, when set on the vfio_iommu_type1
it disables some security protections in the iommu drivers. Move the
storage for this knob to vfio_main.c so that iommufd can access it too.

The may need enhancing as we learn more about how necessary
allow_unsafe_interrupts is in the current state of the world. If vfio
container is disabled then this option will not be available to the user.

Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/vfio.h             | 2 ++
 drivers/vfio/vfio_iommu_type1.c | 5 ++---
 drivers/vfio/vfio_main.c        | 3 +++
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index f95f4925b83bbd..54e5a8e0834ccb 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -130,4 +130,6 @@ extern bool vfio_noiommu __read_mostly;
 enum { vfio_noiommu = false };
 #endif
 
+extern bool vfio_allow_unsafe_interrupts;
+
 #endif
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 23c24fe98c00d4..186e33a006d314 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -44,9 +44,8 @@
 #define DRIVER_AUTHOR   "Alex Williamson <alex.williamson@redhat.com>"
 #define DRIVER_DESC     "Type1 IOMMU driver for VFIO"
 
-static bool allow_unsafe_interrupts;
 module_param_named(allow_unsafe_interrupts,
-		   allow_unsafe_interrupts, bool, S_IRUGO | S_IWUSR);
+		   vfio_allow_unsafe_interrupts, bool, S_IRUGO | S_IWUSR);
 MODULE_PARM_DESC(allow_unsafe_interrupts,
 		 "Enable VFIO IOMMU support for on platforms without interrupt remapping support.");
 
@@ -2282,7 +2281,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
 		    iommu_group_for_each_dev(iommu_group, (void *)IOMMU_CAP_INTR_REMAP,
 					     vfio_iommu_device_capable);
 
-	if (!allow_unsafe_interrupts && !msi_remap) {
+	if (!vfio_allow_unsafe_interrupts && !msi_remap) {
 		pr_warn("%s: No interrupt remapping support.  Use the module param \"allow_unsafe_interrupts\" to enable VFIO IOMMU support on this platform\n",
 		       __func__);
 		ret = -EPERM;
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 8c2dcb481ae10b..e1fec1db6a3c93 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -51,6 +51,9 @@ static struct vfio {
 	struct ida			device_ida;
 } vfio;
 
+bool vfio_allow_unsafe_interrupts;
+EXPORT_SYMBOL_GPL(vfio_allow_unsafe_interrupts);
+
 static DEFINE_XARRAY(vfio_device_set_xa);
 static const struct file_operations vfio_group_fops;
 
-- 
2.38.1

