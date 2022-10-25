Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ACF60D36E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 20:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C01710E03D;
	Tue, 25 Oct 2022 18:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B6A10E03D;
 Tue, 25 Oct 2022 18:17:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aE/xxgd28YwJBxIQ6rptVbBLUuO04PucKswAiUjZ5UQqUnUU7GBfaqtKEXbXC1VVHUstSY17JdhUM0HB8V1nHRUvpGOjJo7FSyygaIL46RDDa98PzgcrSwraP1hJTrv+KeKc3bBG0CL9r1A6tjr77CFqyAReMf+O9uH+8qieeVWK6P3uhv36aRxO1B7XmWwe6befNbhxDCI4/gzCWnU0bVFrC8fr1suDkl8+PrRE2UDc/Ap2PxOe70BBxECc3Kz2zpsJljsFhfqjjupSSv0dvojNlsl6rrH8TXXso6uuxBWoOnjLMJLzwfvoLfZmCATswyEl0FSGu8wtra/3ExEuUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsOW4B1r1+U61znfr6dVaOmz1XxoYd/r5UfbuJjNOZc=;
 b=CY1QgB7n3XhKcJyTMeSZ2kwRQqx4JNhQl/BjSjIuMWyzUrdzmSpOMYoRe4JNgohYFwDaNVhia9LGTajm1ZbDGF8sc99lCiTp2AmloSMLWIUtk5tyPSOeeVlEHwZCMsMYYHZe4f9bzwjTTRH0Z/jxuTWuIjLzhIrmChu86LDTNfqvwflVwkp0Z36RWscSVoCJcHoPbP6zak9eF8RLlxt/k2UFymSaWj3ZsXWym12MS4YD6x9ojJwzgTCdriY43mXtkh/27HVoVvdTjdb9gHj6V3Icwqq7JmbeHDkInWgxbHh2GHiJOey1pcLLO4CCGMCz7MCl+xYqLKOJKn2IoSfytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsOW4B1r1+U61znfr6dVaOmz1XxoYd/r5UfbuJjNOZc=;
 b=aehB73CCn5SD0amyUSr59arOeAAoBHtGE71GIRcVRLQDEpEPcziTYSvIKi/YMU3w/BFZNOuTNgFYmajkX1o2J2lCLMZvf4+OpFZRcTz8E6HVGUNlI4oFMoISsr/WaFVKFBa2oEswPKJaqR1TD8wUJ3+OteP78mm2lkbwyA5tlQJKYzNssyCMa4ckU7NpJqlQaabD1RkNYKwUknMGCjniJ5HSusFNuhRvgEFRrYKURN2xhKSHFthMyYz28/3utD6sabrFpR+tXtk2xdnipqXbDmE5ekfrGo2y9dgJTDnAMA0vhdV+QcrzkAPaBMKWV4s2efCy7lDHgG9jhN8yrmRORA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB7201.namprd12.prod.outlook.com (2603:10b6:806:2a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 18:17:17 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 18:17:17 +0000
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
Subject: [PATCH 05/10] vfio: Use IOMMU_CAP_ENFORCE_CACHE_COHERENCY for
 vfio_file_enforced_coherent()
Date: Tue, 25 Oct 2022 15:17:11 -0300
Message-Id: <5-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0400.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::15) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e5a9e4-ea24-4cc2-ce44-08dab6b52640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AT2HwfKYIopCf7cpOLIbRPS0WWsMA9pKo6CYJTKdCAnwNxhbrWpP/gHkeD74pKxbBPbLMnzLejODkq31H6m85WYBBPJ2leLbrOJ75CUgZy5JopsY9NvxhSmAHx67rCqgckveCEtt9mj+4UAp7Kjdw6WcN6votHV8Lp82AxMMzhiJzY5jzxilrj49jg1oBV4MqUblLVE//bEZCw49a5mm8mv2SRpXKdD5jyXgIfP/YUyk+ZdFpBaKGik0KuZLgXRye/tDhct/BMIpKD5eXgigGM3HN1AcWA4Z6wvaRJgGhaxWHhqf+ABEQFNui/P7U+g5dcr7efw2CSRbVg5d9SGWXF6krHj/8rbKmDXfpEl2gBreXHC4bFS1V3DtMiSgckrAteX7D/NIoqKE1mrnBOzid48N1VZvBwUaX4DuKbkIjsS1OFwBr9+ae6yV6p4o759P6xh1szPoEm+pQDA7tghggFvxnXOhwJ0IcGrCzIPaSv1I6ov++5IN+/Y84D2oOdlTTMWdHgM1PG7EimDhMPB+r59e0J/qNDekRvobd1/RVCQ37Ngro0z6A0ww4m8XY8CANa74YcVSryH3L+JYXhtYHiHwuofbVTwH4wjxBedhVy9bpaxUp2T2hDZv7qjkXG+vcPVm2L6nDxd/IKatAbf2Fw+M/6UvmJ7cESL4+GzwcPf1rx28gFZD1du+wMoK8P8crL9RVH+azvvLc+Zj2/c9WLO1YB4Cq5Pp2oTIMDyXzEX37/V15kdqhWxJrIWE5DgTLbUP/Y4lHvafS3c1ufwVuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199015)(110136005)(8936002)(54906003)(41300700001)(6666004)(6506007)(921005)(86362001)(38100700002)(5660300002)(7406005)(7416002)(66476007)(66556008)(66946007)(4326008)(8676002)(316002)(2906002)(478600001)(36756003)(2616005)(6486002)(83380400001)(186003)(26005)(6512007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZhZttySstPiz2e2T3B5knUblRKKHFmHugGP46x/cDWr0Pzaadi2IdIwWBt+9?=
 =?us-ascii?Q?dlZoISuFjxvWIe6kn4Rso6OY93rOOLqGHS5jHvrWLNv4BHEZCihmEG4GZNED?=
 =?us-ascii?Q?3um8r9+GHOxSB5l6UiNwNtxSw84VhQOZw0C7QRxD2HaDJlHnDtW/aSMYH57e?=
 =?us-ascii?Q?+JY8R2FSJjhdEw8N7avyZtttYqlFQQrtC0xFexy4PCo0lFpsnghBNKtnAYTo?=
 =?us-ascii?Q?wRzir52CiTYhUaH3gGgSuS617zTb7fKUb93Jzk5F4M+WYYtUs0yzivldBAfh?=
 =?us-ascii?Q?hzSs5M5155jz1uDMLR1GPBpjxKhrLw4qASRD9sOnmGCG8YVP0TwJQ+8akpWq?=
 =?us-ascii?Q?toz2KphgpegicNowMNyHAxd2Fbj27GWWGjts5qyZ5nhUDokt7KIQYDID1gwr?=
 =?us-ascii?Q?/lhAfrRSVFloSnn0yUvXHZk9+daSUalR3wQLVEl49IvTIbfAIfjFpXOku+14?=
 =?us-ascii?Q?EFLxJ7w8CT5GjiWcnEOc1k+w+6IBsIdqedJ0L9Wnq48TNVks8xc8p2Ti1Fct?=
 =?us-ascii?Q?7I9R2gcsHWg7FLrQYisbp8eZuZxvMwJ461jL4R+JViXUcF8+l+vzRTReNhid?=
 =?us-ascii?Q?cOcfIntjktF6sBOplfymhCb6iyw25fhFyycd11EJE3GLbTA868mgaEBu4nWo?=
 =?us-ascii?Q?74l/DY4eEHQwK2gSB62X6tuXlQUDUvZLezqno0+MSMRgmTdDiaKt4XzCGdW/?=
 =?us-ascii?Q?OJPqk03BGZ7pxZtKxOVAycvYDvUfkncvkyHz5PbIFW9XxTcWyr+4cssWt5XT?=
 =?us-ascii?Q?+WERHNPFmDHT0o0xt8Iu9RMTS8p6rnPDzRlwLq+RSDE/4k29qKgZ0uD8HqIO?=
 =?us-ascii?Q?/TSkMbljfPYi2JkKw6tTrNLStHR7Wv7zFwK8AiQZ5D7XizVzlvoHaI1cPcjw?=
 =?us-ascii?Q?V3TPkDhoTdskV+ig6d9KT4GtOC7QLSizf6zBihp0JlvPfuvj19xiGOxVoHJQ?=
 =?us-ascii?Q?OsH/fysSdE0yKjtU9Po8odjES4TyDE6Wh5qdf2WTcIr3hBK9S22CpVOU9N3r?=
 =?us-ascii?Q?PQs4r8gb0ANh4pqrkKAukGvTgM8VzIeUG6VuScBEpIoLT2Fm6VyPf4/4i+4z?=
 =?us-ascii?Q?70Jvwg6p/kxrXcp+PCIsNiJ9ya/74RF5L4HW6eDg2pwd+oaLLUFZjoVrqWry?=
 =?us-ascii?Q?mblIAjBgs0eWNrrTfTIqYvnhtPoSlzzi0jrSiayuye6W6EU8OZPfnHlF1ZaV?=
 =?us-ascii?Q?Pu2Pvs3lsAwfqSS5FTOYYz5+iLNAWfVvr3FcmydB7zD3lMUIy3us0GDms3tT?=
 =?us-ascii?Q?hWfywoSEsXytT6MnMVDGE72ne3lAZcxW7jFT/xJGX5EDH+Yp9PYlkrxbenqb?=
 =?us-ascii?Q?ZSDx0bguKFTF16e1PVMoPuHW91IcBFkBZO2qnO9lHLHa4zLvHjc2dtLp00mI?=
 =?us-ascii?Q?eQTHtMj1GYzwXOd65+J7ixUKyjoG46Nr6eGns4e9d+AKnmtCxHjTZC0ADdhz?=
 =?us-ascii?Q?qRgxc8ilEFgyt8i4cgc9ku4+t9aVoAJDXRRzH78XDPzamCYGB1zVlBnOaQJK?=
 =?us-ascii?Q?640yQzQOmBSZSeliDSdpZiTban0P+84kpX7rLNg5p/1/67RNLvIVuPoXfQM4?=
 =?us-ascii?Q?g1ObmLqYCvwM/JW7qNU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e5a9e4-ea24-4cc2-ce44-08dab6b52640
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 18:17:17.4954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bSdhiMaC2iQ4+NEnKVp8Uc2DnRVDtknEYZ8UKoRG3HV6e3qC8K6g/ZweLJ071VG
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

iommufd doesn't establish the iommu_domains until after the device FD is
opened, even if the container has been set. This design is part of moving
away from the group centric iommu APIs.

This is fine, except that the normal sequence of establishing the kvm
wbindv won't work:

   group = open("/dev/vfio/XX")
   ioctl(group, VFIO_GROUP_SET_CONTAINER)
   ioctl(kvm, KVM_DEV_VFIO_GROUP_ADD)
   ioctl(group, VFIO_GROUP_GET_DEVICE_FD)

As the domains don't start existing until GET_DEVICE_FD. Further,
GET_DEVICE_FD requires that KVM_DEV_VFIO_GROUP_ADD already be done as that
is what sets the group->kvm and thus device->kvm for the driver to use
during open.

Now that we have device centric cap ops and the new
IOMMU_CAP_ENFORCE_CACHE_COHERENCY we know what the iommu_domain will be
capable of without having to create it. Use this to compute
vfio_file_enforced_coherent() and resolve the ordering problems.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/container.c |  5 +++--
 drivers/vfio/vfio.h      |  2 --
 drivers/vfio/vfio_main.c | 27 ++++++++++++++-------------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/vfio/container.c b/drivers/vfio/container.c
index 499777930b08fa..d97747dfb05d02 100644
--- a/drivers/vfio/container.c
+++ b/drivers/vfio/container.c
@@ -188,8 +188,9 @@ void vfio_device_container_unregister(struct vfio_device *device)
 			device->group->container->iommu_data, device);
 }
 
-long vfio_container_ioctl_check_extension(struct vfio_container *container,
-					  unsigned long arg)
+static long
+vfio_container_ioctl_check_extension(struct vfio_container *container,
+				     unsigned long arg)
 {
 	struct vfio_iommu_driver *driver;
 	long ret = 0;
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 54e5a8e0834ccb..247590334e14b0 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -119,8 +119,6 @@ int vfio_container_attach_group(struct vfio_container *container,
 void vfio_group_detach_container(struct vfio_group *group);
 void vfio_device_container_register(struct vfio_device *device);
 void vfio_device_container_unregister(struct vfio_device *device);
-long vfio_container_ioctl_check_extension(struct vfio_container *container,
-					  unsigned long arg);
 int __init vfio_container_init(void);
 void vfio_container_cleanup(void);
 
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 1e414b2c48a511..a8d1fbfcc3ddad 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1625,24 +1625,25 @@ EXPORT_SYMBOL_GPL(vfio_file_is_group);
 bool vfio_file_enforced_coherent(struct file *file)
 {
 	struct vfio_group *group = file->private_data;
-	bool ret;
+	struct vfio_device *device;
+	bool ret = true;
 
 	if (!vfio_file_is_group(file))
 		return true;
 
-	mutex_lock(&group->group_lock);
-	if (group->container) {
-		ret = vfio_container_ioctl_check_extension(group->container,
-							   VFIO_DMA_CC_IOMMU);
-	} else {
-		/*
-		 * Since the coherency state is determined only once a container
-		 * is attached the user must do so before they can prove they
-		 * have permission.
-		 */
-		ret = true;
+	/*
+	 * If the device does not have IOMMU_CAP_ENFORCE_CACHE_COHERENCY then
+	 * any domain later attached to it will also not support it.
+	 */
+	mutex_lock(&group->device_lock);
+	list_for_each_entry(device, &group->device_list, group_next) {
+		if (!device_iommu_capable(device->dev,
+					  IOMMU_CAP_ENFORCE_CACHE_COHERENCY)) {
+			ret = false;
+			break;
+		}
 	}
-	mutex_unlock(&group->group_lock);
+	mutex_unlock(&group->device_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
-- 
2.38.0

