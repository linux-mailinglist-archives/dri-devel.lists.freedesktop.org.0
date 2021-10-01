Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 154B741F3E7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8AD6EEBD;
	Fri,  1 Oct 2021 17:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294676EE91;
 Fri,  1 Oct 2021 17:52:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cogXvKqXFA1sEFHEzgpUDot76lctGXejklMwU6GuryebrA+3we3QRU4325mfePbu4FLYDPiQsTKZIg9qYeKm4K8Kcjc4ls3SDofcwH9WMz1RlbA4LjebVTJL0RJ2G51hQF/SG94f0P7/0UArDLFyMrfyGpRvgy8W1H3wVgPIqtVRowswqa6hJUv7JilNtnCuY7uzUl8XxvKAeuqmyHWICqmCCq1vuQQp5WdG7NEA+qGXspHLPaHGGawLi2OB0ugXHlyiigsww/EnXtQZe0qAg0LrSGouhg/bByc0RvewdiDVkhDbsr3v7pav0CruAJlLRbzbdc13s9cBhEAb5fbXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsGMr5LHVaWbM8ZmJ+WXqcS4MozvEdilF4vXkB3vl1M=;
 b=GE6ZUV1OTnpSZ7iW2+IAUuuMXvwvLWcagv2Bl8SaDUUyZDDmpeRveSaaOOzp9f6LQc2leytRmiiZZ7ua2EqXyEUMjaAURfg9R9uOP3o4xGKQik30s1gLpD5GBSUsMSulsrLN4owVm4VHhd7hd8GQG3ML0Qr4FZ5sStbos2YH6I0hNwKaJbWYTMFbC/SX4PKUsCTkC5ppsJpVDtubI9lajp3UXcqI0wnzNFxALIOOlLq52Z+piSa81tFdorCMQLHjdixqn+mu4Qejj/VkjwwEARYAQQxjnLM9X6DixSWi2DL8piZojhXkpS5jOpBc9FeIoD7dZ+cdy2fmt+ZCiomziA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsGMr5LHVaWbM8ZmJ+WXqcS4MozvEdilF4vXkB3vl1M=;
 b=WOSbXDXeoZGifHofADBD71iZiII8eTU+ZkpYfd+PH/+0oRhWqY9DBc706qgXd0C3FUSYEnNfKiS0L/u0BfymSAWuXs7qB+6vTHLq+tCG+O5yV3nGNC76jKZOr8+YL61o15sa1zeTGxrSTjdUzyKaj1zLAGfQIvhnvPdQimln9FycyAyCJdvcUhuBMCsKOJzJvNTNmP7FO4cNejQPt5bCaWotIFYaMd01jHTLqx295OFb3vvnxg36BiMbOPt0D4UYj944vkW1fRywpv8FfGUa0orqqYZvJy4n0nbL3h6ujnyUR/Eh1Xn6ifpQDijY6BniVtTR4eCA2/kx/Jaem5Kafw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5207.namprd12.prod.outlook.com (2603:10b6:208:318::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 17:52:55 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 17:52:55 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
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
Cc: Christoph Hellwig <hch@infradead.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v3 06/10] vfio/mdev: Consolidate all the device_api sysfs into
 the core code
Date: Fri,  1 Oct 2021 14:52:47 -0300
Message-Id: <6-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::15) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR07CA0005.namprd07.prod.outlook.com (2603:10b6:208:1a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.20 via Frontend
 Transport; Fri, 1 Oct 2021 17:52:53 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mWMiK-00989K-68; Fri, 01 Oct 2021 14:52:52 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18be6b34-073a-403e-bd5c-08d985044af4
X-MS-TrafficTypeDiagnostic: BL1PR12MB5207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5207F43F5A74F7C7E904525BC2AB9@BL1PR12MB5207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2RWc/Uzg0cYe9KgWWpP/+oPyZdcCCwEYlncETgjjttAQ9CRmGJBEV8Ckovgxs9ZKQQKuHz8H307T+ffAEermH6KRdAl4XyUp0gYZApn7QnIWceinJMhTzL9/uv9g5PRSVge7RCzCYHjRQK/o3zbxhpS6KlBlYsVXWKnf5WlxtoRrYNdoQGYciqAympmO7LBY4J3hOafP0fcxnw6KOl85Qr84LgIoFo4B0YD3Lre2SVZrgVuJvqwmRTBRpYpuH16ihrccK+AYA8lic9IR8cRNeWj5/SgHdp9gEBeETOQhXg9b7Mr1BqAB3Qh8kR7PmwdDwWyQrGewojh4/ef1OusQvO+RyC6yQ+W2WJB6PYFfSodKrP9O214cqH8fiSI/04u65pX4gn4Cj8VkRx2s7cYPig8Xf2q0V2yg8HYqKHW9H0h5mVo7AQdDbb+rktLagTMTIqeVnokln2yBg1whAw6P7QXcWB6B8okVyJjMoCoVTZVKMuXohl+k1w+cRX4JJSG+uYnNpo1WO7ZhWzRhA3Vsw2OTdM1c/hKRv8TzMJWiIbBkKjVPGkjTnd6UGRfht71iYy2gNLwZ0iqcWZWEsZtXT+jNu0fwXjNHsnzEIjaCPO2bIEUc223tsteE6yGSUFx3BT//r61zbLz0hc1KxhQ2Gt82B7KfdRn4WKnsIJ/yqfxL3xk3cRCROqF2kd3pwkc6rne9QGPBiZtX4SWGBMdtDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(2906002)(83380400001)(66556008)(8676002)(38100700002)(66476007)(5660300002)(2616005)(508600001)(426003)(9786002)(26005)(186003)(6666004)(9746002)(54906003)(36756003)(7416002)(4326008)(110136005)(86362001)(8936002)(921005)(30864003)(316002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YWuc43/RDIfHx3txlmFMNdITSziUNxaIJ0cPc9sXnfdWyb0JJqdzbLOclncK?=
 =?us-ascii?Q?65w57JpTIIoT6zLq4sRK/4kiHKpCIOyrQGKcfGfdTsGdc6ajYiecxvQCrlgk?=
 =?us-ascii?Q?KhDRB45OIZeGVeidtG/IJT9VCeRJaJeikHRVWVtbc+Cgy9NaU3u6988yTGHh?=
 =?us-ascii?Q?xWqFFxvueuBHEB1oMgZFAqJfyXle/gu9OkLT7+aYy3T2QFH+VAFSrQ2Uwlad?=
 =?us-ascii?Q?3U8ePd3BumfJQmdIinieNj00HFiMkBNMZlLhpGrCKr8UzTePfBZm62gYhB3S?=
 =?us-ascii?Q?B+72Q1xPAtSHppU49eI6ZuAmeFoL64kg+4CJXRYLUS+U/K+5EyAt+e/ilQmj?=
 =?us-ascii?Q?pRkIZE6FhOL/vGHWPDxRbZvHz3H5YKAYsoY/vBxoFwFisSBbbtCyg4PaqcKF?=
 =?us-ascii?Q?VgnXDp8ZGRAF/ZxIk0XrXOV+llPhjhfcg41Q89CF++ERutMB3glTtl7PlBOo?=
 =?us-ascii?Q?r6r0R3p7yyyuHO4EXER2aThUZX28hTXOKFFMdRHceAbGiBGIFiG7cM9qgOyk?=
 =?us-ascii?Q?QMPQz18x19TVwifrghTUfOZm+/dAgqjPa2nE5hO6XdIEFIYSD6PitNdHFrYp?=
 =?us-ascii?Q?k/ckkc4pKKFFgEbgSD0Ek1knX5ryaHUVeWudE7AEFNBl1ehprbsAWKZ7Xlca?=
 =?us-ascii?Q?DVLMJHN68387SYwAz285Yc5kAPu1ZwRSJWIcm5m2a0RjKLM5N5q1TETUBTyL?=
 =?us-ascii?Q?tXf6ZykHd4U6999WpeJfOAhKz8orhkLU1/gpCw27YuMmJ7qHKRdaQjOlCDKf?=
 =?us-ascii?Q?cp2QDOMuejOP4LFSedYtMJWC2/BB2h/l+7D/jDai1T1AxYH/RUTxygGsQMkc?=
 =?us-ascii?Q?/ae37wPMBA8bxTfegBWXG2mCDSDKE0LNpYuHWQ8MmbbRD5nobePd/+rqwsNg?=
 =?us-ascii?Q?+qXqGOiYNxsGF6/o3fHXuHaLEwOOvg4COqIoKVXpBDmRzDJtcJ1OYllMcgzq?=
 =?us-ascii?Q?1cjyGpOJ3pRvIlzyasAv26+uYTfxu7aKZOc5GMWUIrTNhfag+p6YhoqYXAFh?=
 =?us-ascii?Q?ixgqtnC962vUnLiQMQj845PcAPRDgyUiKczDotpVdGdAw6qplBmbHo0REeuK?=
 =?us-ascii?Q?18YsDE2eeV5ucy90TsUfwvtCxJcQeUZyUwPX0o8xLNN1GaigB3n1eHdnvQY2?=
 =?us-ascii?Q?vpTzOV9+UahM+FghtoDtDKVIu3GY3yRQss+iGxC5P5yOpR88ZxfvGXQe5vKP?=
 =?us-ascii?Q?pXsgak4LtZB0vlQ6dIoP82eoEvFOtznzWJ0NCddc2XW0gqhURK4RWDVC3hXs?=
 =?us-ascii?Q?6LgHxF+wCuayBH71snb0uBlUk0AxH8fRqfZkybg/o5jIVUOYxRsbqRJbJjUn?=
 =?us-ascii?Q?fdanb5EacxCaORoiax6oXtE9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18be6b34-073a-403e-bd5c-08d985044af4
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 17:52:53.6310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9DE58mJWO2JSkaZbcwPfL9QNZQBv5w+O2Q2CKa/2CjGBO3f3YKRwKnm+1RL2ae99
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5207
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

Every driver just emits a static string, simply feed it through the ops
and provide a standard sysfs show function.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 .../driver-api/vfio-mediated-device.rst       |  4 ++-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  9 +------
 drivers/s390/cio/vfio_ccw_ops.c               |  9 +------
 drivers/s390/crypto/vfio_ap_ops.c             |  9 +------
 drivers/vfio/mdev/mdev_core.c                 |  2 +-
 drivers/vfio/mdev/mdev_sysfs.c                | 27 ++++++++++++++++---
 include/linux/mdev.h                          |  7 ++---
 samples/vfio-mdev/mbochs.c                    |  9 +------
 samples/vfio-mdev/mdpy.c                      |  9 +------
 samples/vfio-mdev/mtty.c                      | 10 +------
 10 files changed, 36 insertions(+), 59 deletions(-)

diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
index 9f26079cacae35..f410a1cd98bb06 100644
--- a/Documentation/driver-api/vfio-mediated-device.rst
+++ b/Documentation/driver-api/vfio-mediated-device.rst
@@ -137,6 +137,7 @@ The structures in the mdev_parent_ops structure are as follows:
 * mdev_attr_groups: attributes of the mediated device
 * supported_config: attributes to define supported configurations
 * device_driver: device driver to bind for mediated device instances
+* device_api: String to pass through the sysfs file below
 
 The mdev_parent_ops also still has various functions pointers.  Theses exist
 for historical reasons only and shall not be used for new drivers.
@@ -225,7 +226,8 @@ Directories and files under the sysfs for Each Physical Device
 * device_api
 
   This attribute should show which device API is being created, for example,
-  "vfio-pci" for a PCI device.
+  "vfio-pci" for a PCI device. The core code maintins this sysfs using the
+  device_api member of mdev_parent_ops.
 
 * available_instances
 
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 7efa386449d104..d198cc3d132277 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -161,12 +161,6 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 	return sprintf(buf, "%u\n", num);
 }
 
-static ssize_t device_api_show(struct mdev_type *mtype,
-			       struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
-}
-
 static ssize_t description_show(struct mdev_type *mtype,
 				struct mdev_type_attribute *attr, char *buf)
 {
@@ -187,12 +181,10 @@ static ssize_t description_show(struct mdev_type *mtype,
 }
 
 static MDEV_TYPE_ATTR_RO(available_instances);
-static MDEV_TYPE_ATTR_RO(device_api);
 static MDEV_TYPE_ATTR_RO(description);
 
 static struct attribute *gvt_type_attrs[] = {
 	&mdev_type_attr_available_instances.attr,
-	&mdev_type_attr_device_api.attr,
 	&mdev_type_attr_description.attr,
 	NULL,
 };
@@ -1750,6 +1742,7 @@ static const struct attribute_group *intel_vgpu_groups[] = {
 
 static struct mdev_parent_ops intel_vgpu_ops = {
 	.mdev_attr_groups       = intel_vgpu_groups,
+	.device_api		= VFIO_DEVICE_API_PCI_STRING,
 	.create			= intel_vgpu_create,
 	.remove			= intel_vgpu_remove,
 
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index bd4d08afa3e4dc..a7f642be9c8898 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -70,13 +70,6 @@ static ssize_t name_show(struct mdev_type *mtype,
 }
 static MDEV_TYPE_ATTR_RO(name);
 
-static ssize_t device_api_show(struct mdev_type *mtype,
-			       struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_DEVICE_API_CCW_STRING);
-}
-static MDEV_TYPE_ATTR_RO(device_api);
-
 static ssize_t available_instances_show(struct mdev_type *mtype,
 					struct mdev_type_attribute *attr,
 					char *buf)
@@ -90,7 +83,6 @@ static MDEV_TYPE_ATTR_RO(available_instances);
 
 static struct attribute *mdev_types_attrs[] = {
 	&mdev_type_attr_name.attr,
-	&mdev_type_attr_device_api.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
@@ -640,6 +632,7 @@ struct mdev_driver vfio_ccw_mdev_driver = {
 static const struct mdev_parent_ops vfio_ccw_mdev_ops = {
 	.owner			= THIS_MODULE,
 	.device_driver		= &vfio_ccw_mdev_driver,
+	.device_api		= VFIO_DEVICE_API_CCW_STRING,
 	.supported_type_groups  = mdev_type_groups,
 };
 
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index 2341425f69675a..f80246b30aff30 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -401,17 +401,9 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 
 static MDEV_TYPE_ATTR_RO(available_instances);
 
-static ssize_t device_api_show(struct mdev_type *mtype,
-			       struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_DEVICE_API_AP_STRING);
-}
-
-static MDEV_TYPE_ATTR_RO(device_api);
 
 static struct attribute *vfio_ap_mdev_type_attrs[] = {
 	&mdev_type_attr_name.attr,
-	&mdev_type_attr_device_api.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
@@ -1387,6 +1379,7 @@ static struct mdev_driver vfio_ap_matrix_driver = {
 static const struct mdev_parent_ops vfio_ap_matrix_ops = {
 	.owner			= THIS_MODULE,
 	.device_driver		= &vfio_ap_matrix_driver,
+	.device_api		= VFIO_DEVICE_API_AP_STRING,
 	.supported_type_groups	= vfio_ap_mdev_type_groups,
 };
 
diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index b314101237fe22..c3018e8e6d3258 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -129,7 +129,7 @@ int mdev_register_device(struct device *dev, const struct mdev_parent_ops *ops)
 	char *envp[] = { env_string, NULL };
 
 	/* check for mandatory ops */
-	if (!ops || !ops->supported_type_groups)
+	if (!ops || !ops->supported_type_groups || !ops->device_api)
 		return -EINVAL;
 	if (!ops->device_driver && (!ops->create || !ops->remove))
 		return -EINVAL;
diff --git a/drivers/vfio/mdev/mdev_sysfs.c b/drivers/vfio/mdev/mdev_sysfs.c
index f5cf1931c54e48..d4b99440d19e9a 100644
--- a/drivers/vfio/mdev/mdev_sysfs.c
+++ b/drivers/vfio/mdev/mdev_sysfs.c
@@ -74,9 +74,30 @@ static ssize_t create_store(struct mdev_type *mtype,
 
 	return count;
 }
-
 static MDEV_TYPE_ATTR_WO(create);
 
+static ssize_t device_api_show(struct mdev_type *mtype,
+			       struct mdev_type_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%s\n", mtype->parent->ops->device_api);
+}
+static MDEV_TYPE_ATTR_RO(device_api);
+
+static struct attribute *mdev_types_std_attrs[] = {
+	&mdev_type_attr_create.attr,
+	&mdev_type_attr_device_api.attr,
+	NULL,
+};
+
+static struct attribute_group mdev_type_std_group = {
+	.attrs = mdev_types_std_attrs,
+};
+
+static const struct attribute_group *mdev_type_groups[] = {
+	&mdev_type_std_group,
+	NULL,
+};
+
 static void mdev_type_release(struct kobject *kobj)
 {
 	struct mdev_type *type = to_mdev_type(kobj);
@@ -123,7 +144,7 @@ static struct mdev_type *add_mdev_supported_type(struct mdev_parent *parent,
 		return ERR_PTR(ret);
 	}
 
-	ret = sysfs_create_file(&type->kobj, &mdev_type_attr_create.attr);
+	ret = sysfs_create_groups(&type->kobj, mdev_type_groups);
 	if (ret)
 		goto attr_create_failed;
 
@@ -144,7 +165,7 @@ static struct mdev_type *add_mdev_supported_type(struct mdev_parent *parent,
 attrs_failed:
 	kobject_put(type->devices_kobj);
 attr_devices_failed:
-	sysfs_remove_file(&type->kobj, &mdev_type_attr_create.attr);
+	sysfs_remove_groups(&type->kobj, mdev_type_groups);
 attr_create_failed:
 	kobject_del(&type->kobj);
 	kobject_put(&type->kobj);
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index 15d03f6532d073..8a5fc5d54f9b76 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -36,6 +36,7 @@ struct device *mtype_get_parent_dev(struct mdev_type *mtype);
  *
  * @owner:		The module owner.
  * @device_driver:	Which device driver to probe() on newly created devices
+ * @device_api:		String to return for the device_api sysfs
  * @dev_attr_groups:	Attributes of the parent device.
  * @mdev_attr_groups:	Attributes of the mediated device.
  * @supported_type_groups: Attributes to define supported types. It is mandatory
@@ -80,6 +81,7 @@ struct device *mtype_get_parent_dev(struct mdev_type *mtype);
 struct mdev_parent_ops {
 	struct module   *owner;
 	struct mdev_driver *device_driver;
+	const char *device_api;
 	const struct attribute_group **dev_attr_groups;
 	const struct attribute_group **mdev_attr_groups;
 	struct attribute_group **supported_type_groups;
@@ -108,11 +110,6 @@ struct mdev_type_attribute {
 			 size_t count);
 };
 
-#define MDEV_TYPE_ATTR(_name, _mode, _show, _store)		\
-struct mdev_type_attribute mdev_type_attr_##_name =		\
-	__ATTR(_name, _mode, _show, _store)
-#define MDEV_TYPE_ATTR_RW(_name) \
-	struct mdev_type_attribute mdev_type_attr_##_name = __ATTR_RW(_name)
 #define MDEV_TYPE_ATTR_RO(_name) \
 	struct mdev_type_attribute mdev_type_attr_##_name = __ATTR_RO(_name)
 #define MDEV_TYPE_ATTR_WO(_name) \
diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index cd41bec5fdeb39..1c5b51390b3a87 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1358,17 +1358,9 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 }
 static MDEV_TYPE_ATTR_RO(available_instances);
 
-static ssize_t device_api_show(struct mdev_type *mtype,
-			       struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
-}
-static MDEV_TYPE_ATTR_RO(device_api);
-
 static struct attribute *mdev_types_attrs[] = {
 	&mdev_type_attr_name.attr,
 	&mdev_type_attr_description.attr,
-	&mdev_type_attr_device_api.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
@@ -1417,6 +1409,7 @@ static struct mdev_driver mbochs_driver = {
 static const struct mdev_parent_ops mdev_fops = {
 	.owner			= THIS_MODULE,
 	.device_driver		= &mbochs_driver,
+	.device_api		= VFIO_DEVICE_API_PCI_STRING,
 	.supported_type_groups	= mdev_type_groups,
 };
 
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index fe5d43e797b6d3..402a7ebe656371 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -670,17 +670,9 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 }
 static MDEV_TYPE_ATTR_RO(available_instances);
 
-static ssize_t device_api_show(struct mdev_type *mtype,
-			       struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
-}
-static MDEV_TYPE_ATTR_RO(device_api);
-
 static struct attribute *mdev_types_attrs[] = {
 	&mdev_type_attr_name.attr,
 	&mdev_type_attr_description.attr,
-	&mdev_type_attr_device_api.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
@@ -728,6 +720,7 @@ static struct mdev_driver mdpy_driver = {
 static const struct mdev_parent_ops mdev_fops = {
 	.owner			= THIS_MODULE,
 	.device_driver          = &mdpy_driver,
+	.device_api		= VFIO_DEVICE_API_PCI_STRING,
 	.supported_type_groups	= mdev_type_groups,
 };
 
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index a0e1a469bd47af..5dc1b6a4c02cbc 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -1281,17 +1281,8 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 
 static MDEV_TYPE_ATTR_RO(available_instances);
 
-static ssize_t device_api_show(struct mdev_type *mtype,
-			       struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
-}
-
-static MDEV_TYPE_ATTR_RO(device_api);
-
 static struct attribute *mdev_types_attrs[] = {
 	&mdev_type_attr_name.attr,
-	&mdev_type_attr_device_api.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
@@ -1333,6 +1324,7 @@ static struct mdev_driver mtty_driver = {
 static const struct mdev_parent_ops mdev_fops = {
 	.owner                  = THIS_MODULE,
 	.device_driver		= &mtty_driver,
+	.device_api		= VFIO_DEVICE_API_PCI_STRING,
 	.dev_attr_groups        = mtty_dev_groups,
 	.supported_type_groups  = mdev_type_groups,
 };
-- 
2.33.0

