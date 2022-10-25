Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F83D60D36A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 20:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4639D10E419;
	Tue, 25 Oct 2022 18:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EE110E40C;
 Tue, 25 Oct 2022 18:17:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyzkztsBBiUe67jvFEC1e+/C27l3MhxqBXfAzxEO4uIROj/zb3QB1gFIwmypIVq1l371GZHCFF9yCezLTa5hAi4cruXic7Wx5Su7NU88JtMPXoPmrAqUV6rfJGEac+U5t/NdycquFNdQKRQJ4RP3lq7D/a3qDS4POCr5aaTr+47HhuisEG+ix1+b1vmxzTuQEZMLV+fSYwPai5Cuu9uAxf4NxR3KLKEdPWUNGAs7ohXkSUGs6y3RjR5v5A8CIjM+SKpvg6DTivsStv/0iSmWW8eq1t2v8Wj6hLqNLdLlfYpI4XBQMO0cSwcUuUsDaDwkoOUAce2wsvkVPBUgu2KB8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2zBahxdrkqL967Sz20H0dTbL5GKaOxTLYMa6Q8DTQU=;
 b=DWOMQJlI4EUJYP/yeU3PgjpeX/Wp0CPAoimYeT8DVOrmn27R1wR7m1E3PsEWLAIpCgaeT39RjIoq912YDmKrb66rtTUNvygkIg8mTrdTaQfNBk6HVwVHnnYBhd0EzPcpGNOnNXE/87lHJIV5mot0x7XKXp3ohRXuqc4/VXBWZapeuGE6kiJeZzp6NYn0IETT+zriVP/Vx+W+zmPvtPArS1F1+hurax0U2tMQsQIt/hgo4Z7eUi1Tb1nMfZiVQbb1Z283S0suHoSuwFgCT1foP2RMdOPAmsaS0c3+ZXfC7tQ8SUnDxK/rxA8TKlSW8E9pJZbkU+Eukp+Su+bzhGgS2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2zBahxdrkqL967Sz20H0dTbL5GKaOxTLYMa6Q8DTQU=;
 b=MZ75w2AT1/PHtBMNsHHV9V2dYlEw4SH0QAlNZDIOlv18ayMC80KEnq/8AyhOCFs9E7IQow8o/UrpJwXVzYhmlYAkomNpdE6rjvlplrZ14VPpgrGjnJZnghVBa0l7BCwJa44D1cPnGESM8Moxu90i7WyNR5p4rBv+K+ZBlX3x/yX07f38JSUCW2ws0gKhNkDEBk8bi8E0s6usyh7afQDL/GZctU9uicLm1249P/6V0nFEAUK16wjzObzMIMBKVTkzcnZXACJlRgThqUkcE6nINE5HA7NhyspzuDEU5VaWD9n+0Q0YNpULved8eO7BOdgLCgDgr00QdtJmtjvgUCqRRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB7201.namprd12.prod.outlook.com (2603:10b6:806:2a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 18:17:19 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 18:17:19 +0000
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
Subject: [PATCH 04/10] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Date: Tue, 25 Oct 2022 15:17:10 -0300
Message-Id: <4-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0018.namprd11.prod.outlook.com
 (2603:10b6:208:23b::23) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c48c950-48b3-4846-dbd3-08dab6b526da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9O46+OTLavxMdkmoxAHeSxrGzrTUeojNxyY9Twkvlo7Fm8PYttgyOoFpOw7H5PEtzzKCf9jdvlbYaAkDD2x2PCb7XEbPGfbiZQSBm5F/w48N7JtoaG6YUQ/r0lA1I2JfkXipHL6+DL4leEfPx2oaxzP+8HPoKBR0J9ob2+Bm8LFr+8PFpzKN/5KH5evpnKF0hAXkzhtNgxGZ+Lpp4Dc60XVkegLXHcNjmhypc4MY58b9Pjb6By4D6Tp/8ynCldLzsOANjwz84tj6FOJbJg2q1P5DK6HRLVDlx0nZx3rhW+IM9uNJ0tjVx1bO5xKb076uGB+g1ctNX6I04GOHa8HCBK6OkJFw/1tda1NVb78QAnbEeCj3sw2zCQzwn2LCH8vihkAYKW/vVg1OXB1ogNaWBS595dLcmrahu5vJr+E92gFj5gvWNzeSW9AC5Y+FN4po/6LRDrA3MZ6DFJbtdeRHCEDVAWtwlsSJ6LL/YuZNGUE4ryAqVDb6T4k/Z2A7A4KLXZ760HwHIufL1Q8YiWrL8ETiiNABz2KwT6ygG6P96OqN8smO2gv9v/4iAURZfN0O8r0pd42Bu8OCrQuKHHVa4zmoiWtv7SFK4Ce3upQRTPGS6WDbYglBypgemJlCeT/M2sTUnQIJeYmYNcuIias0Jby0jq5GNT4PXeRe2zfYqenfna1mv3wpwrv69E5/RqsWZEc9+uSZjGGgrDFj4wkABS0dBo4XzpKQdDz2p2rviDKq9QHNfQ+msbsaaJfVGxTm9kpAQwOHQWq/UKLYluk8Gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199015)(110136005)(8936002)(54906003)(41300700001)(6666004)(6506007)(921005)(86362001)(38100700002)(5660300002)(7406005)(7416002)(66476007)(66556008)(66946007)(4326008)(8676002)(316002)(2906002)(478600001)(36756003)(2616005)(6486002)(83380400001)(186003)(26005)(6512007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RhqkKjRi8Pk15PBvIYwm8CLJN95eixOGlap7XcCXvj00k278M53ps32ytlFT?=
 =?us-ascii?Q?uSc/qdX9N4ltnSTahJzEZW7Ym4wyZci4SJCigAZ8LMqbsc6f/PS7SRqOTULz?=
 =?us-ascii?Q?DOgavdVzZjYGYjX1bDPnvx5INnKKke2dRERw94CGabrj1i63aNa68BL6G02G?=
 =?us-ascii?Q?kfJAVxPPTg4Ye4xq+IG90jxop4DKM/T6+1dgJaALGnvBCgIGUyePKYA7RxZG?=
 =?us-ascii?Q?0HqCTHwPkkbNVrvXDdx0NCsTwEkQ0nh2fXe30wojqQ0hf7WkoXghuq1yC8MO?=
 =?us-ascii?Q?2sz2toflnC2dpg0t81uz7aPCvu7zN61gxKA5+cc2bdFx2O0rkNdOzrg7wm/k?=
 =?us-ascii?Q?BLbJnFyas0g9vf4zciwxgw3fG3KQJRrXPwF5KVZh7FdhcVxxLtNAUj54caCN?=
 =?us-ascii?Q?WfqiJUfSvVypzKSDC8SSjU7zysbSDa1r8zq7uxOgpOVcX9OtYg/Mpr7GXOgR?=
 =?us-ascii?Q?cYz5RjXZZCOffLllopBRn6i+cOC3KcNf31kAC6aDJKx2DoIToV84X6SW6WP0?=
 =?us-ascii?Q?DxhyqOTFZGao2e/ARaCslGAY2osdQg66JgPhFcnNUP8ce2hiPGorQlK95VQg?=
 =?us-ascii?Q?g29NZ2JDxxAyEqzHvIj2eAR9MzhdG4dMT3SAPBF35kl/m1nSbvCsgbLW9qdO?=
 =?us-ascii?Q?cHVMlzBeKC16mXI2X/zVn1onNwo3Yd7q6bRt0lQ+6Zhcy/svjZb2PRGVRcg1?=
 =?us-ascii?Q?8lWx3jApMQcmPQGmbwnW1tfDvdfSEzKvmOE05a4n+kqTaGi5ZFS/k3qP7jDl?=
 =?us-ascii?Q?yWySo1B9F1RFZCiyGVPH+0oMTFqsoJcAE7b7jNf7UuETdef55olOmvK/SS8M?=
 =?us-ascii?Q?r+T/NF2axjPURF87hm5skfOWctFg4bZOHXyo+P2JZ+FK4zmO4Lyem7IIvG/Y?=
 =?us-ascii?Q?1ULOPzdsyeN07ffkGO4wBTZN0xsnXhE2talULnr9we8QcnrantwIHqLGAPLe?=
 =?us-ascii?Q?naCJACAc5zHZtCJZZXOROhnQJgdOiQv/d4nUZnM457jvnpVa5750UVLUtIRU?=
 =?us-ascii?Q?bygcAS63/QhYBMFw1g4fg8OJv4TE+eHrb4VObRDv3DMeXspXCQTRPNMWymvw?=
 =?us-ascii?Q?FY7b2UazeAaWRW6d30BkX+mZ9bXK7VyQHn93LmjOjDb/nGN/51+2YUFR2103?=
 =?us-ascii?Q?xopGTpgjjS3bkguOPQ0Se5shqpqvUVEOP31OV48LR7QBRg4iHtY+/EWVks/X?=
 =?us-ascii?Q?ulJOchxEQnkAWpxw2vnm6N0M7TS2vu7RjGDb0QwJAb6Awi36UISfFLQ/JEAJ?=
 =?us-ascii?Q?ZfsWQkWLvbgY3XZ20eBjdzjG99plNf64BJP9yhXOUtoHYTlD8CmFeSSo782c?=
 =?us-ascii?Q?8Nn+ith0gg76uA/2gJZlANympkCNPJAMn0j4vSfwQbwGmzkx87kBv6iHAFqm?=
 =?us-ascii?Q?F4VEPb0ZzEC0MlgKhkmSQGFUSVcqDPIdzIRcx6RO+zVfyp8HZydltmH+gl0L?=
 =?us-ascii?Q?wAikfIiQnHfL9jefUWFtyMsPl+5z5gmcaWns7xvp8KCCENQSw0RtRpgnjAMq?=
 =?us-ascii?Q?8ga+7I7oMv/McZlZ3IQP3Q4krE1+vS3bDlfOFme+V4P+qK+BwZiwH6St+J/F?=
 =?us-ascii?Q?Z/bSg82G2+UAAU3mCVw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c48c950-48b3-4846-dbd3-08dab6b526da
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 18:17:18.4496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9q9Rlyi9obQygyKVIylZ2CUizxdP3yxXa9XmsIPvb/6sPnnIv/EkdVwbqviZCM2j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7201
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
Cc: Yi Liu <yi.l.liu@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This legacy module knob has become uAPI, when set on the vfio_iommu_type1
it disables some security protections in the iommu drivers. Move the
storage for this knob to vfio_main.c so that iommufd can access it too.

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
index 8d809ecd982b39..1e414b2c48a511 100644
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
2.38.0

