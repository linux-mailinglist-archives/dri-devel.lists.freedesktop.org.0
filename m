Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FF64FF85F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 16:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F3410E4B6;
	Wed, 13 Apr 2022 14:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2086.outbound.protection.outlook.com [40.107.100.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A8010E4B6;
 Wed, 13 Apr 2022 14:03:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMAAZfR2yFc98zwwhgxh8MfTjMewStIMCSa/pQDiqgIq3O+52XccM3f29GP/fBX/8u7J6tBmYAQvAvMcFqaqmToqLEoGlFtXj1nl9PIIIwE0uSn0BU71I3sIedtV96/VIlPQyAoFo2zP9ZXqNNjQ0AeWmVO3qbFVq2wlfyYtczveWTtzG1c8axU5ErzNThGISQb56t4eQmg86+K8/wKIWGM1sGakKVUDEKshhIIwc2zF+KWixIUhZ4X6YwPNe4wNoBkaEq//XfrO9IUeXHJFJjKOjJYwNDObRLYxBris1g3yVoT+d+b5VcMMOgr4jvEdv71t9stssq2vDl1rrUKcVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htES9/Z1DHp50Vo2bjCdCcMNdB/gjurvWu2fIzRZDmA=;
 b=lE700iHTj2hkkau3WHpyNTtAlEZGeVcj2A0tjMKklzpunbrPdbFiBM+o5KeFwkVzj9caZnwFEINhYI2+It0f8f61EPG1dwV9WVslpZQzQVt0OInLXMZYwZoTwBPb9r3m3WGQiP4FUTp7hUZBLf/ZrIyMWsOYls2kKUynUqbszs4KDN3r94/nGYySbJf+Br31keohXMRm6ZHyJlLqXUmFI9zF80JK4246Y1htxCD2Pg8NCcmZye37LpPa9SePpB6BYAHoSHLJV6Dhzwm1o/xD10g4JluXi3C2+zwodW4zgQvxqg+MHvrgCJ0BEF++OEGawPHXgsZPFtNhQh45Yjrg3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htES9/Z1DHp50Vo2bjCdCcMNdB/gjurvWu2fIzRZDmA=;
 b=VrjQwYH6KTdqn1YqjP0yN2UNejhJPbNXLRd4QRgQ8sYYrGk/H5PjWt9mqkKEm2BjkPfsXBTv9yQB2U4IFE2huvy+21kmiJurhiGdPMRv5EcFpVj3oHejIyR/15mv9t2mQPmIvqpcOlmqF/hy0CWuJ6PC6l3Fd517h17zwPhnBVF2Rx1Ppmm/pZ/AE9apnWfMkAFPe8VWDduUFd66WB9bL6JG0+kJkehifEoR2RekMZjnkolkOiutlbsVVNGF6uXYyFfbAxmpGSvnUoJ8ryYKOT+SxvDEo9IZlLeW/vh3raJ4rGEQMa+ToSyYtSCkzOQO9uGNOOHCiYmkijS+GhPPBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN6PR12MB1345.namprd12.prod.outlook.com (2603:10b6:404:18::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Wed, 13 Apr
 2022 14:03:06 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 14:03:06 +0000
Date: Wed, 13 Apr 2022 11:03:05 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 9/9] vfio: Remove calls to vfio_group_add_container_user()
Message-ID: <20220413140305.GD368031@nvidia.com>
References: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <9-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <20220413061105.GA32701@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413061105.GA32701@lst.de>
X-ClientProxiedBy: BLAPR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:208:32a::10) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab62ac54-2289-4941-f440-08da1d565547
X-MS-TrafficTypeDiagnostic: BN6PR12MB1345:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB134593C717A21637159F09E2C2EC9@BN6PR12MB1345.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1tUM+K4OPFCYfBqiv6qLV695hAI3FKkpQwetL+0ssPovPrNPGj+CtxIvoO8JYhhJpDUj4Eo3hCpSVaaZpbKbtLJkYOO3uoJLfkQltkMJ6v1U8iePJSTK5Q69NJDY3q5z0oeNw0L2j98cb9WvhO9S9fuBd0Ed/149Y+OwzHZJy/jpaD4Qp5JVZLgvqpPbC01Cq2IQZzX/Xj1sses82C9vPD1v2NDoVAdU29FxALrSCnc+qet5Z2Nxi5oHLX1KCrX+sD4Bp6ad8aUB9wkoSHeO2NZvLC1oqJ0iHve709SwZ9gtu2pkGBwIrKt8NT9K2P3gHzeU5UT+hPhHGbhAsOy7yWzK2C3sgN2DDpcbWLIka8IkeBN+5ZEcusXvwvUGY+4iCLG5eXJkFtH8CCYNaaOeMcN/RNSP5DJbRAr4gBzY/U9ftnNoz6TpQEa4NTEIX99C4teOsUYumPaO1L8ahaDAJe7mR0X5Q/k3i8mlJJLYQTsN+D8v7jA9WaGmx+e9ex4XpGZrlaQYv/k9eNpZcA0G9nfAtTaotY3lDDGEKrsCooxWjOBu1K9khihLNMxptxyuLdp4OSQPcBR3rOiEsZM9y4ELU+LUYCFLm2EsREAKjvy+/5dQoJLNnSWxalYmQ25znJgzKvvaKc12VK4Lz4GbwsJqYGX3Unv9tvwtwfLAFVrJrATem2vcGSncO/4WZpU8SzCygpQbFaNOnLt0oZA24w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(66476007)(38100700002)(7406005)(66556008)(5660300002)(7416002)(4326008)(8676002)(26005)(66946007)(6506007)(6512007)(2906002)(186003)(1076003)(2616005)(83380400001)(508600001)(6486002)(6916009)(316002)(54906003)(86362001)(36756003)(33656002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FTFQzmBKbab3fHCiCckJ/1fnYxrgFSG8W4ep+BbiVf0gpgXno54Sh7Yg2onN?=
 =?us-ascii?Q?GHFcGr0cFGmUdqwWecYA21r3mlWuTocaCe4ABIsXmOL+tiZh3K1RhwmH1Gc5?=
 =?us-ascii?Q?o/JMJzyTSotMb4ChDEVre1MmutYiAX8AgCZQ75iF/UAF3DGwzkrqE7Vlxw5y?=
 =?us-ascii?Q?0LUxOzQVXVKukwNyRgCKpB7PIWt537duscLo7S4IaAhTnm3FLd0l5y/kvX4W?=
 =?us-ascii?Q?qWgUtYnD19ZtU8SCeysSI1Y4aQoxwdhJYdt7ZjvBfMKU9ZoIvbbXJKUo60Ik?=
 =?us-ascii?Q?KP0PkU/cem7QRinujkEFKMQEc7TXUJUAZ0ejUOp/aPT2MQQllXRYS3/TdNuZ?=
 =?us-ascii?Q?CXCfREdtopL82TuHxBkKXXCwkW90/31wfOlULSaAmw7cRKKq6r2hlWBvP2RB?=
 =?us-ascii?Q?FiEUYR6kCZWyfvgoFv+g60Swms+YG+O2yxIOBrUrTeKssdZnNcNCO6aHkKcN?=
 =?us-ascii?Q?ELTuGtH17fDDflMGvoG8ua5d6+z34DwZAFScUHBtyccK0BAQc2w0kCaikh1Z?=
 =?us-ascii?Q?m5TbbfUKQ9bEE5KC6u/CA+PW0xg2dwQhKWpWQHCIY0H/arj2/NUUeHSBX+Nw?=
 =?us-ascii?Q?7OZxBAfo1umbB07cLZCXrCaHTTcffI8DbYx9omaUmHpevWqY9tHyf9rtC1be?=
 =?us-ascii?Q?AUQ7GQmgf8XU+0hiah3NKUFSg9rlBOzJyqOVaW9h0ojuOqOhB+U2mX3ICc3p?=
 =?us-ascii?Q?23XON9Ufnm0V5+TYmlKg4+XfXgvHI5KuEWoyxpfGQkWSVeRbg95KI/a0Z/fG?=
 =?us-ascii?Q?twx61MZ5uJDDo4utG4WBch1qibiTt6i8H5E1nUlGxl2hVVMRrbVd7CeE6Wzg?=
 =?us-ascii?Q?Qrb2VQWMHhUZY4Zp5sPWQlMxkQsWc2ueYEWoAKMUEkORZ6/87/OF/1GXcxmU?=
 =?us-ascii?Q?TSU2cV5c3ZoS3RqVjr8Mg0Fzkx5v/HgQ4M/9quqd/Qqz8p8fOBZhwG07WJUZ?=
 =?us-ascii?Q?Dr/Ngkkyl+SpnDhJsvL9MSjRlNj0mVxPf+6c2XakPElYSZbyRJTuoPYKNj2W?=
 =?us-ascii?Q?tVvY7HTwksbUnbHSUfESFwfM/HblapWslcoWCgb5dnBj6FVRxvbGeAYqJSH4?=
 =?us-ascii?Q?qCjHaJ810y2f8U38feSoLwYs6SJgMDdkuc2LLMEfDJi9TtOFL268/ZpB/MI/?=
 =?us-ascii?Q?k7/hiQaNn0rjddVx4UoNUFnlZnFX2tauLB646G/3bPbQAzRYsgzjivuRzJkU?=
 =?us-ascii?Q?GPywsW8K/+SPDMsYy2oCEVJhSBkVMG8c0Qdf3UkLL5qNysuffJfsCashSkEC?=
 =?us-ascii?Q?32X70KpoFAaqH9hoLpR2ju47N2RXRuNUJgbQo5jozL1H0NoogDN4FCXxNvhY?=
 =?us-ascii?Q?P5eAfaAB1oc16NoQKcuw1tKQgaFhyKyUcOU3YatRtAb/6PFtvs1UlXaWFUA7?=
 =?us-ascii?Q?kpCsxkJDfOv9qYNHjXycCsmmPQWsUPN6K236678xNXgu0RNorP4HWvUysaD8?=
 =?us-ascii?Q?G8gg5gzGcxq6/S3t9G0FSF7bJVrD7fD2PyOwUZpMx6Dfg1fiIkf03mWDYI4/?=
 =?us-ascii?Q?SR3QmXqhSRMscJP6Ov+/zlf39Nj1F0KxxK/Apt8ndiJhT9v0MB+8pP2JxFin?=
 =?us-ascii?Q?PFsCcZZzh6Hj1p9vM14Mor9BGiF5O4oFxSh+oJVuIaRCuF1lRoJQtlgRluDc?=
 =?us-ascii?Q?I5Hpm4hh4STAi/W4C+0KBFEvmzeRwtMFJbwoXG8OnhXIIZAyCn2fWMTdTflA?=
 =?us-ascii?Q?45IuaYkXmitaCVxoat6CWylpIFssuthO3AD1gJC/u5+scTJpi2AtEfzUFL/P?=
 =?us-ascii?Q?82FBRQhUgg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab62ac54-2289-4941-f440-08da1d565547
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 14:03:06.5580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RK77JCdFE871v5kG5Awtvw9TBizHO5ueDXj0fJbwN9Q9vXx69udfcDHpGFLJJYRC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1345
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, "Tian, Kevin" <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 08:11:05AM +0200, Christoph Hellwig wrote:
> On Tue, Apr 12, 2022 at 12:53:36PM -0300, Jason Gunthorpe wrote:
> > +	if (WARN_ON(!READ_ONCE(vdev->open_count)))
> > +		return -EINVAL;
> 
> I think all the WARN_ON()s in this patch need to be WARN_ON_ONCE,
> otherwise there will be too many backtraces to be useful if a driver
> ever gets the API wrong.

Sure, I added a wrapper to make that have less overhead and merged it
with the other 'driver is calling this correctly' checks:

@@ -1330,6 +1330,12 @@ static int vfio_group_add_container_user(struct vfio_group *group)
 
 static const struct file_operations vfio_device_fops;
 
+/* true if the vfio_device has open_device() called but not close_device() */
+static bool vfio_assert_device_open(struct vfio_device *device)
+{
+	return !WARN_ON_ONCE(!READ_ONCE(device->open_count));
+}
+
 static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
 {
 	struct vfio_device *device;
@@ -1544,6 +1550,7 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
 	struct vfio_device *device = filep->private_data;
 
 	mutex_lock(&device->dev_set->lock);
+	vfio_assert_device_open(device);
 	if (!--device->open_count && device->ops->close_device)
 		device->ops->close_device(device);
 	mutex_unlock(&device->dev_set->lock);
@@ -2112,7 +2119,7 @@ int vfio_pin_pages(struct vfio_device *vdev, unsigned long *user_pfn, int npage,
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	if (!user_pfn || !phys_pfn || !npage)
+	if (!user_pfn || !phys_pfn || !npage || !vfio_assert_device_open(vdev))
 		return -EINVAL;
 
 	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
@@ -2121,9 +2128,6 @@ int vfio_pin_pages(struct vfio_device *vdev, unsigned long *user_pfn, int npage,
 	if (group->dev_counter > 1)
 		return -EINVAL;
 
-	if (WARN_ON(!READ_ONCE(vdev->open_count)))
-		return -EINVAL;
-
 	container = group->container;
 	driver = container->iommu_driver;
 	if (likely(driver && driver->ops->pin_pages))
@@ -2153,15 +2157,12 @@ int vfio_unpin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	if (!user_pfn || !npage)
+	if (!user_pfn || !npage || !vfio_assert_device_open(vdev))
 		return -EINVAL;
 
 	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
 		return -E2BIG;
 
-	if (WARN_ON(!READ_ONCE(vdev->open_count)))
-		return -EINVAL;
-
 	container = vdev->group->container;
 	driver = container->iommu_driver;
 	if (likely(driver && driver->ops->unpin_pages))
@@ -2198,10 +2199,7 @@ int vfio_dma_rw(struct vfio_device *vdev, dma_addr_t user_iova,
 	struct vfio_iommu_driver *driver;
 	int ret = 0;
 
-	if (!data || len <= 0)
-		return -EINVAL;
-
-	if (WARN_ON(!READ_ONCE(vdev->open_count)))
+	if (!data || len <= 0 || !vfio_assert_device_open(vdev))
 		return -EINVAL;
 
 	container = vdev->group->container;
@@ -2294,10 +2292,7 @@ int vfio_register_notifier(struct vfio_device *dev, enum vfio_notify_type type,
 	struct vfio_group *group = dev->group;
 	int ret;
 
-	if (!nb || !events || (*events == 0))
-		return -EINVAL;
-
-	if (WARN_ON(!READ_ONCE(dev->open_count)))
+	if (!nb || !events || (*events == 0) || !vfio_assert_device_open(dev))
 		return -EINVAL;
 
 	switch (type) {
@@ -2321,10 +2316,7 @@ int vfio_unregister_notifier(struct vfio_device *dev,
 	struct vfio_group *group = dev->group;
 	int ret;
 
-	if (!nb)
-		return -EINVAL;
-
-	if (WARN_ON(!READ_ONCE(dev->open_count)))
+	if (!nb || !vfio_assert_device_open(dev))
 		return -EINVAL;
 
 	switch (type) {

Thanks,
Jason
