Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EF651CD7E
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 02:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2516010FE49;
	Fri,  6 May 2022 00:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEE710FE0E;
 Fri,  6 May 2022 00:08:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ypida9ZNEFagFH3myqSIFQi6ldDtls3+P0jxruTxhbX9c8eE7NTC8+W/xYtkRt/dD3BpOwsXa4lpgIhFnNIIIVTgsDxWg8hB/+N3+j/ofaoOyoGSSl67gGpW3PGMUGwwpBgSjAUoOdk6vEDpK8aX+30ZcNf1MM6pT0UgOZv2UljRzW/O+BD/ajQ/seXSBF9v6cdaBjohHhYX/TXqoOf/IK/o2RJBiqacaEoB4AkN+WpGAD0itjjhpKY5NZpdfQRhJxT/DdiQhkHW4MoU51efVtLsNqIiDNv1gMax57dc2LC5UyQsqhFJjhsBEzNLcubmnJBqvKxJES+TMSNgUYPEDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGsDroh7318M7IFYvIVTolUnNNiYq8HH8XrljJJ+kew=;
 b=JhkdRZ1d+22I/p0d9yhHvFRzvWrhS13kRK4eMnzhDrgS66yLE1t0dq1PPfToXy0i2gtfYqfcv7avWXMivycYZqKaV/AFf4pcZEIWICeoJN0H4hvmomEvxpJeTu73TB3f5PDdT2oDwJjZK8D8D/ttczshH10nCpeXO6CyIoDFqmmMcl9FGm/vrtAh1i+AS+Wvj3PuuULHNliN2L1r0TvJSXp79X//lEWousPahB1fA4cTjCc3hDwgf2veY9yZTwoQXUc5n4aC5VfpGGPTvr01JmPx4/Nx0aezo6UzUjslJx79FDiV2oXTZcnEr/Kta/73lZh8dhKt94QDKCEawQRWZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGsDroh7318M7IFYvIVTolUnNNiYq8HH8XrljJJ+kew=;
 b=icsCAIUQ1I0rdU9TIgStTYSz56LZ4szZaDbM8XGMBSpeFBKDQlxyJ9V1pgeoxBNsStNRTP2sJU5viszKb37c5vJdoarSBv1h0BvcgzkirVMSEQjf7p8XcM5u2TxzkmZ6HQrJ+optOOFwNhi6U5bg5h+jtNfxmUT7E6bdlo/QBW8336dTsy4IqT/xI1PsTgr5vbIA5Ov398g3Qfm5l1EDv+UTMKwfw8gaDH3POsIscaYs4VJbMBlD/CkJzR7vrVeeuSHrVtMOPGfzjyYjqi/bq3h7jaj5TmRvJtBXXqqaKxDV5WPf7ctSKOUUIA1YE3oooL7rNSn8CMe6D3jmjMErrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BYAPR12MB2934.namprd12.prod.outlook.com (2603:10b6:a03:13b::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 00:08:52 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 00:08:52 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
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
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v4 7/7] vfio: Remove calls to vfio_group_add_container_user()
Date: Thu,  5 May 2022 21:08:45 -0300
Message-Id: <7-v4-8045e76bf00b+13d-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v4-8045e76bf00b+13d-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:208:fc::27) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e75e0ca0-a46e-419d-033c-08da2ef497f2
X-MS-TrafficTypeDiagnostic: BYAPR12MB2934:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB293492DE64BAB8A2E49E3526C2C59@BYAPR12MB2934.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b8LNGpS/fzCumYu9pIiCr4gF2ktWu4z9bm9fBTzTP1Md7mRLlXtnTjPvlzDg6LxhSiot+uubJzMee8OWIwmT2PhLOO+QFRFKtvFrZe7texfz0sS9JNDLqSgPKu6155J2si3XhB2wivvb5NWVR5SggDxOefVtumP38YoYKJs1Ing6aEcwta6xEH6MnDQikzuf3W1JWRQbVzL0MipxiKsc5+XqA9Y1xYE+QFYca+RtVrSzyy/0bmAtI5wI0IowNsupTkSRAms7/2v7I4KCDOI1V8i/h+dbC2TNETqsuFbZ2o5EYtA3hK+p2Pt7o+OiuU8KRvpu7m01npj+XytpEKUTL6us35P/R8TlPIlfcEUe+bMC/Wcrx5tCvT2UedTclOazMq0uxTUiH3ELD5BFD2MFkFYYOol6CQiqdlIuOlYGjO2iBsrZqPjQBk4kHzNn88MzJCMoSUrM/4MCciFbKdmKfWrgxfDWWFdwUFBoiy1+ye1HttrNGc9lLD3luRu1GK+HuiVBQncapWLQqzeOXq/dFpmooZrU3hn8BzoYf7LWAwMeKnIpLbRtEl3Mz2JjX7Goq0CalfOa1Uu0md8sOGOt4E2ZSFFg0GQLHF7mdh/dd6VgffKq9TpbGxI97CrQHtzZREFtQ9BxSXHGBmQdOu+pm3kbqq+PZ+e0SkSCLVPUIsUzNOa2LkKbDcDf14opkrQHNWSku4Sp5lIcgKDeIddrtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(2906002)(66946007)(66556008)(54906003)(8676002)(86362001)(110136005)(4326008)(6486002)(38100700002)(508600001)(316002)(66476007)(6666004)(6512007)(6506007)(186003)(2616005)(921005)(26005)(7416002)(8936002)(83380400001)(7406005)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AZzzVS6y7ADOqpqDnmazmBdP6pQnC/uVqg+fB+6D6ml3ec0zTI9vSls041ez?=
 =?us-ascii?Q?oGOhp+djy7z/mIPVXegNHRpq/GLLUzwspAky7XTkyDxL352gmyCabbw1SRQT?=
 =?us-ascii?Q?Pn/eVVEcUyYIqHH43LbQSi+ZTZV0IscnF1Q+HD9jODe57IZum29EePMSKd2g?=
 =?us-ascii?Q?1L/vSRx/Rdbk9p9XYHPADJ/1ZmSS6mLzjG3hbB5OQVkp567RxFJL3498FH08?=
 =?us-ascii?Q?ELjnRFRDRBHgyQvs1nIKelDQgfP19EKH3ZNKAPYoN044p4Eul7UnCehcuJrE?=
 =?us-ascii?Q?T2QEufI/jCaPMjoPgeaQ8sgqW1jlbrJrx1QP7rS7iGRWUBXL3WP8biZWIG0q?=
 =?us-ascii?Q?a0/L7zlLf2NgBjp8AXZa7cuHv+5dNSGkFErmjaFV5d1JC6F7u8q65pQ9ziUf?=
 =?us-ascii?Q?9fgnCQR4ydsXyTUVkShkJRp2ik+fZWT/7dvloxvqMdbVilz+qNUJte2KbbAz?=
 =?us-ascii?Q?v+0h2iofVGrubZ9iO0WC/Pc67/bfi3j5dZ92p/hkafOkNcEoXo/o96IWF6qh?=
 =?us-ascii?Q?QUH3G/9rh5FpiqSZLMomN6AcFnCCLvonCPLbMtbp1LQNYf4Qn4Fc5RCcW0pg?=
 =?us-ascii?Q?QsSNQ6MwVFku9Sit0Kh/3TQy7e819vhlQLwWAyykkV3zjO+94LkxaChyCLc9?=
 =?us-ascii?Q?2R/N7wPLFk6mhknzahP+CWMGJXhhF/0p/K9nco/fxD60wW3ri8X/fFMUKfr2?=
 =?us-ascii?Q?m5OOA+HciCgzPu2x7gTULM+b7j7FiHvAJfQ+w0FQyV+UtPHmbhwf12QqOWlh?=
 =?us-ascii?Q?0JL76f9EGTnWCTRhNDmVBO95+x2M7ABMfe0LkE6TKgHYE1s1J7ngFiDoJMtf?=
 =?us-ascii?Q?HChfd+bZ9A/l/PnCgRSlN9fgPmPivHDriExDA+XaZHL1XSJfCOwkhRONxLXj?=
 =?us-ascii?Q?9tjOva1mIrcjeI9ssvZnIiNeSEMHciXqvEstBASbuUtJeH4UksRNTeK1kSdn?=
 =?us-ascii?Q?s4ER/JlmsxdFB0eRzzgqCXH0v7amgFfq2/azfTe9GQaY5lDcrGbDlx7KJy9Y?=
 =?us-ascii?Q?GCNUZjsgXxN8w6KcyA3CWqjw0nN7RBeBI7qOclgxI66BAUr2zt79DlbNRoNZ?=
 =?us-ascii?Q?2zorVnuLpcbDAR0RFj3oSjMoPIZs4cadU/nB7gwTCY5H+4UPWNCcdPQ+gE3u?=
 =?us-ascii?Q?r8xwHlpWlApUySe3t4Nfx5iO/DJYO0hBBWjhGsVOvwTMx9JNYgfjmhkAVrFR?=
 =?us-ascii?Q?j9sNHCmmZmAOij/O31qf88vIUreDtwodp1TUuUMrdAYNFGk2Zhe9RYzNwQ8y?=
 =?us-ascii?Q?3h4S7wtZN4bJoQGLsnBDWgO3HFlS5KXyZUVpNm/X8wgfSa0vkPb3m9N4sOEg?=
 =?us-ascii?Q?v/7D4rnAYiKDXhrRHHaikIv5t33NWl/3nu3dDKA/xW5SBbJeGuwtNw2E3dzM?=
 =?us-ascii?Q?GIzN2uWvmWDQT/l/I9qpNXx8M5iHGiPErwEjMILfDeGZmyVZh2x+XZHY2Bfv?=
 =?us-ascii?Q?upR971hrwm4AJAxptDbJZ4KGQJm9YhvImzkfiwXg0GiSYif3QyLDzGDtjqpk?=
 =?us-ascii?Q?jagRIZiudMTEePOMI0gPTGIj11dwumVjkM25ya7/QBWniVm3CA+Uf0DfJC9x?=
 =?us-ascii?Q?g8UaTslzQ/iBq2sWzlQEZjuqerPJDRZo6ruEj6BgRkrDDfUDt7GxvwR6RmQi?=
 =?us-ascii?Q?6TnASCEg1iz519T+aIEYrnstpoROhirtwyqZZzesuv5GQ8JSho/hfiONUne0?=
 =?us-ascii?Q?JGOcCW0DGEcj+CZ5OK4tgdUi9y1u/NeVWQR73TAp50DpQI+UXsDETC4Wml0x?=
 =?us-ascii?Q?2BzSOeJwsA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e75e0ca0-a46e-419d-033c-08da2ef497f2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 00:08:48.4495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1V/dWNUDTf5dRUdWrNNSzLfiuxiQfQvMtkTA4BPDhzL33lTzLZFvYtO1gIyRkD9u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2934
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Eric Farman <farman@linux.ibm.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the open_device() op is called the container_users is incremented and
held incremented until close_device(). Thus, so long as drivers call
functions within their open_device()/close_device() region they do not
need to worry about the container_users.

These functions can all only be called between open_device() and
close_device():

  vfio_pin_pages()
  vfio_unpin_pages()
  vfio_dma_rw()
  vfio_register_notifier()
  vfio_unregister_notifier()

Eliminate the calls to vfio_group_add_container_user() and add
vfio_assert_device_open() to detect driver mis-use. This causes the
close_device() op to check device->open_count so always leave it elevated
while calling the op.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/vfio.c | 80 ++++++++++-----------------------------------
 1 file changed, 17 insertions(+), 63 deletions(-)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index c651c4805acd59..8bb38941c1dfd8 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1115,6 +1115,12 @@ static int vfio_group_add_container_user(struct vfio_group *group)
 
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
@@ -1329,8 +1335,10 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
 	struct vfio_device *device = filep->private_data;
 
 	mutex_lock(&device->dev_set->lock);
-	if (!--device->open_count && device->ops->close_device)
+	vfio_assert_device_open(device);
+	if (device->open_count == 1 && device->ops->close_device)
 		device->ops->close_device(device);
+	device->open_count--;
 	mutex_unlock(&device->dev_set->lock);
 
 	module_put(device->dev->driver->owner);
@@ -1897,7 +1905,8 @@ int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	if (!user_pfn || !phys_pfn || !npage)
+	if (!user_pfn || !phys_pfn || !npage ||
+	    !vfio_assert_device_open(device))
 		return -EINVAL;
 
 	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
@@ -1906,10 +1915,6 @@ int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
 	if (group->dev_counter > 1)
 		return -EINVAL;
 
-	ret = vfio_group_add_container_user(group);
-	if (ret)
-		return ret;
-
 	container = group->container;
 	driver = container->iommu_driver;
 	if (likely(driver && driver->ops->pin_pages))
@@ -1919,8 +1924,6 @@ int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
 	else
 		ret = -ENOTTY;
 
-	vfio_group_try_dissolve_container(group);
-
 	return ret;
 }
 EXPORT_SYMBOL(vfio_pin_pages);
@@ -1941,16 +1944,12 @@ int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	if (!user_pfn || !npage)
+	if (!user_pfn || !npage || !vfio_assert_device_open(device))
 		return -EINVAL;
 
 	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
 		return -E2BIG;
 
-	ret = vfio_group_add_container_user(device->group);
-	if (ret)
-		return ret;
-
 	container = device->group->container;
 	driver = container->iommu_driver;
 	if (likely(driver && driver->ops->unpin_pages))
@@ -1959,8 +1958,6 @@ int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
 	else
 		ret = -ENOTTY;
 
-	vfio_group_try_dissolve_container(device->group);
-
 	return ret;
 }
 EXPORT_SYMBOL(vfio_unpin_pages);
@@ -1989,13 +1986,9 @@ int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova, void *data,
 	struct vfio_iommu_driver *driver;
 	int ret = 0;
 
-	if (!data || len <= 0)
+	if (!data || len <= 0 || !vfio_assert_device_open(device))
 		return -EINVAL;
 
-	ret = vfio_group_add_container_user(device->group);
-	if (ret)
-		return ret;
-
 	container = device->group->container;
 	driver = container->iommu_driver;
 
@@ -2004,9 +1997,6 @@ int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova, void *data,
 					  user_iova, data, len, write);
 	else
 		ret = -ENOTTY;
-
-	vfio_group_try_dissolve_container(device->group);
-
 	return ret;
 }
 EXPORT_SYMBOL(vfio_dma_rw);
@@ -2019,10 +2009,6 @@ static int vfio_register_iommu_notifier(struct vfio_group *group,
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	ret = vfio_group_add_container_user(group);
-	if (ret)
-		return -EINVAL;
-
 	container = group->container;
 	driver = container->iommu_driver;
 	if (likely(driver && driver->ops->register_notifier))
@@ -2030,9 +2016,6 @@ static int vfio_register_iommu_notifier(struct vfio_group *group,
 						     events, nb);
 	else
 		ret = -ENOTTY;
-
-	vfio_group_try_dissolve_container(group);
-
 	return ret;
 }
 
@@ -2043,10 +2026,6 @@ static int vfio_unregister_iommu_notifier(struct vfio_group *group,
 	struct vfio_iommu_driver *driver;
 	int ret;
 
-	ret = vfio_group_add_container_user(group);
-	if (ret)
-		return -EINVAL;
-
 	container = group->container;
 	driver = container->iommu_driver;
 	if (likely(driver && driver->ops->unregister_notifier))
@@ -2054,9 +2033,6 @@ static int vfio_unregister_iommu_notifier(struct vfio_group *group,
 						       nb);
 	else
 		ret = -ENOTTY;
-
-	vfio_group_try_dissolve_container(group);
-
 	return ret;
 }
 
@@ -2085,10 +2061,6 @@ static int vfio_register_group_notifier(struct vfio_group *group,
 	if (*events)
 		return -EINVAL;
 
-	ret = vfio_group_add_container_user(group);
-	if (ret)
-		return -EINVAL;
-
 	ret = blocking_notifier_chain_register(&group->notifier, nb);
 
 	/*
@@ -2098,25 +2070,6 @@ static int vfio_register_group_notifier(struct vfio_group *group,
 	if (!ret && set_kvm && group->kvm)
 		blocking_notifier_call_chain(&group->notifier,
 					VFIO_GROUP_NOTIFY_SET_KVM, group->kvm);
-
-	vfio_group_try_dissolve_container(group);
-
-	return ret;
-}
-
-static int vfio_unregister_group_notifier(struct vfio_group *group,
-					 struct notifier_block *nb)
-{
-	int ret;
-
-	ret = vfio_group_add_container_user(group);
-	if (ret)
-		return -EINVAL;
-
-	ret = blocking_notifier_chain_unregister(&group->notifier, nb);
-
-	vfio_group_try_dissolve_container(group);
-
 	return ret;
 }
 
@@ -2127,7 +2080,8 @@ int vfio_register_notifier(struct vfio_device *device,
 	struct vfio_group *group = device->group;
 	int ret;
 
-	if (!nb || !events || (*events == 0))
+	if (!nb || !events || (*events == 0) ||
+	    !vfio_assert_device_open(device))
 		return -EINVAL;
 
 	switch (type) {
@@ -2151,7 +2105,7 @@ int vfio_unregister_notifier(struct vfio_device *device,
 	struct vfio_group *group = device->group;
 	int ret;
 
-	if (!nb)
+	if (!nb || !vfio_assert_device_open(device))
 		return -EINVAL;
 
 	switch (type) {
@@ -2159,7 +2113,7 @@ int vfio_unregister_notifier(struct vfio_device *device,
 		ret = vfio_unregister_iommu_notifier(group, nb);
 		break;
 	case VFIO_GROUP_NOTIFY:
-		ret = vfio_unregister_group_notifier(group, nb);
+		ret = blocking_notifier_chain_unregister(&group->notifier, nb);
 		break;
 	default:
 		ret = -EINVAL;
-- 
2.36.0

