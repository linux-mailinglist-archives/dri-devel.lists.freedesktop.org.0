Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 587B53D009E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 19:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F2E6E4D2;
	Tue, 20 Jul 2021 17:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAD26E4C1;
 Tue, 20 Jul 2021 17:43:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H95dtuokBbjAII+RzM1qzHHs5B2yJJiVJU7ikGKfzeyF9+XGf8wFaXKrgsRTKqkIfTY5CbTm0AlOS2svoE5i3oWjHTXXWqGNBZc1oBYIPC7JdJqLs3Kgokb455j0RwmQMUG3tgDMXTF1TnwDFO3ldKNYAI03JKBEVZ/O3aHl0lTGZvl/NoL7tgIJ7phcu1c14d5AsKIN+qeSHFF1FuUnJx2zdZzEok21wOoj06K0iTFkpRiZSsf+QriF8d2U6ssonrr/maE3xDlrYWiofFu7oO4MWL9Um+H1tRli9GBLJVU132kVZHlHzYvtSt74UcB6MzBVYlXaFRPU6aOctSGwdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+yjMYhEcWEUEqiPJn9wZH0hUqIDhNY47wOx5CFzXys=;
 b=WNq9vkJbbNQMF9Jad8UPChE0g3m5AbZKGzdDc1nxU/tOkwravRPkdz2Kg1vNpz3gzK3hqw/1MZ/+7bucxMlJN7lpQtdGgHsDNW3+z+qRVM0pjcbIA4jFjMmAvvvWjrX5OosejvWfPwoH5JVMa6Y/Bn8u2YffHhqvZKG63EzdENVXhLM5eVDSu4bjnlZenVGuNqAj7FeRsmiu7WDR1L9FPT7QgaHPvcR2v9/+v/YDsq0B6AqUXlvYk8NFnfJKUC6f7zlQt69BN/JVuVX5YtlnT7N6B3soW9Xr8OjIp3D3/v1ZbKiuZm/8PM9NhtL/W87AZsBrCitub4IrXWUcfkxdWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+yjMYhEcWEUEqiPJn9wZH0hUqIDhNY47wOx5CFzXys=;
 b=GuCbhUSeFVEix59Iho7swLzubqExHEjOySZKWE0Cca9fLpvkwUdDN77qS75C1K5ExisapaCTFUT9oYClLglV06YNhU2mCmHB17KFwS8XiRE14WW9xEFd5vyRndeYDJ5CeH01lTB1sjgOaqoslUpthLPtR1peqfoXeFiBhJW7RArk1JDJr6gJ9LM3WkHtDme1d6+Uy4kcudd1m/Z4p8QYUWK4FHGdF2z0CgIt3Iqrdg+564YugHs+IqQXZ5ZH42DmTPp+xCAUUySsD8CLQ0Ccfe/ybm7D/+Rsh/EOzfx+1fdUKNb1X2u01uMbCrEvoDzQEMjBtbn+5Y/2heVAi7I9AQ==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5288.namprd12.prod.outlook.com (2603:10b6:208:314::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 17:43:06 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 17:43:06 +0000
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
 Vineeth Vijayan <vneethv@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v2 07/14] vfio/platform: Use open_device() instead of open
 coding a refcnt scheme
Date: Tue, 20 Jul 2021 14:42:53 -0300
Message-Id: <7-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR01CA0028.prod.exchangelabs.com (2603:10b6:208:71::41)
 To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR01CA0028.prod.exchangelabs.com (2603:10b6:208:71::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Tue, 20 Jul 2021 17:43:03 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5tll-0051Ew-Db; Tue, 20 Jul 2021 14:43:01 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2129b992-d23a-491b-a332-08d94ba5d37c
X-MS-TrafficTypeDiagnostic: BL1PR12MB5288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB52887FD9255CF647B988BAACC2E29@BL1PR12MB5288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EJ2kh/dLJCF9YqHKYAhzG7hoUIY55U3WmpOdcMfgICwMYkENzhXG0TA/ix9z3thldg7By/cUnryskFWHj5i8bxSn/Q0eJw3Hrx9NXVnPAUFsbzXfL0KAfL9rr4dT+CLoFKff0pi8KwLbM9cwJmSiTwzTpeasuOAARhwzl2NwmMirtYdzbrHJB4atQpvXy1hlKcODQFbNXpP+6sRxvQs84Xc5xrKRKXlNvHmOzJJMePreg6xo3Q6BUgMaK4kHhDYflxfCA0BXRJMjpuSMrJMFh735Cr6wHkD0+GyM17ZkKG73GTEjxYL0JlFNAsM8aMX1vdI4qsFiEBIUw0BAHrmJEk2iFoT6js9KC+6siSzHAYiV2S6Tr1RuL5nen/avGteRxJAM4cTdOC3tMOV4cxQ5n0s0gCqRY5l2QCnuKkruM8AKF5GEB2nXLZCHvkCkrs57ZGj6vPtURRiJ4KxsBSvKjzeQiPuUkdXA1W8GWol6xwtyN/os5ZJpXb6n+A9bXw5Ml2m0+qGsPr70kAg4OEQci1olpduNzLLMyAX8m9ZxIA0aXeOG5iWyk2on23T7gRmBYhL/NItKTxuQLiEc7EnUdo5oSmRoE2ze/CpVhjVeZ6Y+MHSoxDJQvNoOtycD5mcPLfBDbL9KHuMBFRnGfDBoEdpKs2Otmox8aU1QlYvoH4Bkcgoff1Jjx2DsBRNfwhUdvOQ5OZrnIbQ3OXo2mp2lGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(6666004)(66946007)(7416002)(7406005)(86362001)(2906002)(66476007)(54906003)(38100700002)(83380400001)(8936002)(316002)(110136005)(478600001)(36756003)(66556008)(186003)(26005)(5660300002)(8676002)(921005)(9786002)(9746002)(4326008)(426003)(2616005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kjWwm5rC2V4+w8AmXDRx4SBAnGgZE5lpUud4hifjFUhiu8e/JDiROG2dlk8Q?=
 =?us-ascii?Q?XbmgtTKW5uwn/GziS39lewOj106yiDmJy3DbTDnKU8ZAfvY26muCYdcgoWuo?=
 =?us-ascii?Q?9sDv7SsgAPsb4TDIju6V9ow20ncVIFG3oQjNbMakvmX27AMenDUgCrGefzMX?=
 =?us-ascii?Q?GuM2jfZPNfu36WivqCLupHdG89KLz/oIZzUoAhZPF3noxtAClQf2Viogfdgi?=
 =?us-ascii?Q?Ci7ComdA0q7s6oSr12bKJ1TLlxRlD0nVxHEHBlmdDpyNY5WUqucm7zQ2/rbQ?=
 =?us-ascii?Q?HYTxCEfgPhq8OxtdAE4II+kZhefoCsrz69T7aaNae2Ou4An16tfXULfNAzD9?=
 =?us-ascii?Q?IKYjrTlumZEP/Nu4nCn222q+regWG4i13t+ONbiBBkrQQhV94s+hKTPvoh6q?=
 =?us-ascii?Q?+3VQuJlwN6W/ZFmor89fAmGvdt2RYOG0ZoMWWNWd1wUwyz9XiObDZ8l682jU?=
 =?us-ascii?Q?6sMRHjRFV7Q2c0eCPGMZcwoArwRU50j9e3f614H4k+fAgfiV2ql6rf7le18I?=
 =?us-ascii?Q?vlSVgcD/zd9s1i5RXOFUtIh+arkzvgKir36+gyzN63hjjnyoNJKe8Sm1Ofst?=
 =?us-ascii?Q?Ioj6c2MrotU5QBQiG2IMuW9AlwKZ4fSdb8vFJFs04T+4bqNbpReifMQv6qUo?=
 =?us-ascii?Q?nvM/BWi+FFMNDUWkqpat0Zo2iA1XUXG3n392Fqro5pKIy9n1uHJFwCysZbHJ?=
 =?us-ascii?Q?KjalvTrXcqXAxhF0PqFpoUlsE2hQ8rUCbMgmkR855gM2dEA9+4IRr0Xlc0xx?=
 =?us-ascii?Q?1ZrWdyN58047lHAFFjPvc0iTclZl4035eXP6etG3KaNW2b/2reVOV8wodB2+?=
 =?us-ascii?Q?67r/oEXPlmI4xiOG+IQhZLLM/tT6ezb3dHNJm57EXLzq8sbsxlTmNvwGHbmR?=
 =?us-ascii?Q?vaEBL4Y5wBaFcO9LEClxdVpjNQH6gRm3WEnZ8QC0ARmN0yK3OZNFok2WALK+?=
 =?us-ascii?Q?oiUeQsdojuJ276e/qYNcLKll55uSRpcHQrs5VI0dEsjoT96dzkb6x5IyDh8b?=
 =?us-ascii?Q?Mi16Hw11dHIk+ulzjbM5HDoLGavoEQ1jakqfv0Uo2QXayZkOETeY6iaIckFx?=
 =?us-ascii?Q?WguAZ+gsoBCnp0Yu2uncWUVI9ZhTFExZFuf7SdINcXfsV51uUGttHk7Qa1eF?=
 =?us-ascii?Q?1M8D8sDnnPAb+nW4aspcMdXAZ+kPyAMO7cWHrbDi+3Gp1B7ItRY7m+zVlrX1?=
 =?us-ascii?Q?8kQ8hLs5GYN09w8Ad677FZV3/mqUVyncskoCmVlgP1/3xXwOfdRbi89LcFFr?=
 =?us-ascii?Q?Yd9j1KFrpU+wz8xn+mAzzB+S1j6u48oTov4RVcBh5eDk1bZ3LkYbv83/Lych?=
 =?us-ascii?Q?8KA99R6MPhH6LkbcZo+AH5hH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2129b992-d23a-491b-a332-08d94ba5d37c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 17:43:04.1206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABir0nK7RzyTFx7sj1+Fx64SmOkxI1KZGLwFuIvTKOru33dulJOCJcMtIOVsRUtw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5288
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
 "Raj, Ashok" <ashok.raj@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Platform simply wants to run some code when the device is first
opened/last closed. Use the core framework and locking for this.  Aside
from removing a bit of code this narrows the locking scope from a global
lock.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/platform/vfio_platform_common.c  | 79 ++++++++-----------
 drivers/vfio/platform/vfio_platform_private.h |  1 -
 2 files changed, 32 insertions(+), 48 deletions(-)

diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
index bdde8605178cd2..6af7ce7d619c25 100644
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -218,65 +218,52 @@ static int vfio_platform_call_reset(struct vfio_platform_device *vdev,
 	return -EINVAL;
 }
 
-static void vfio_platform_release(struct vfio_device *core_vdev)
+static void vfio_platform_close_device(struct vfio_device *core_vdev)
 {
 	struct vfio_platform_device *vdev =
 		container_of(core_vdev, struct vfio_platform_device, vdev);
+	const char *extra_dbg = NULL;
+	int ret;
 
-	mutex_lock(&driver_lock);
-
-	if (!(--vdev->refcnt)) {
-		const char *extra_dbg = NULL;
-		int ret;
-
-		ret = vfio_platform_call_reset(vdev, &extra_dbg);
-		if (ret && vdev->reset_required) {
-			dev_warn(vdev->device, "reset driver is required and reset call failed in release (%d) %s\n",
-				 ret, extra_dbg ? extra_dbg : "");
-			WARN_ON(1);
-		}
-		pm_runtime_put(vdev->device);
-		vfio_platform_regions_cleanup(vdev);
-		vfio_platform_irq_cleanup(vdev);
+	ret = vfio_platform_call_reset(vdev, &extra_dbg);
+	if (WARN_ON(ret && vdev->reset_required)) {
+		dev_warn(
+			vdev->device,
+			"reset driver is required and reset call failed in release (%d) %s\n",
+			ret, extra_dbg ? extra_dbg : "");
 	}
-
-	mutex_unlock(&driver_lock);
+	pm_runtime_put(vdev->device);
+	vfio_platform_regions_cleanup(vdev);
+	vfio_platform_irq_cleanup(vdev);
 }
 
-static int vfio_platform_open(struct vfio_device *core_vdev)
+static int vfio_platform_open_device(struct vfio_device *core_vdev)
 {
 	struct vfio_platform_device *vdev =
 		container_of(core_vdev, struct vfio_platform_device, vdev);
+	const char *extra_dbg = NULL;
 	int ret;
 
-	mutex_lock(&driver_lock);
-
-	if (!vdev->refcnt) {
-		const char *extra_dbg = NULL;
-
-		ret = vfio_platform_regions_init(vdev);
-		if (ret)
-			goto err_reg;
+	ret = vfio_platform_regions_init(vdev);
+	if (ret)
+		return ret;
 
-		ret = vfio_platform_irq_init(vdev);
-		if (ret)
-			goto err_irq;
+	ret = vfio_platform_irq_init(vdev);
+	if (ret)
+		goto err_irq;
 
-		ret = pm_runtime_get_sync(vdev->device);
-		if (ret < 0)
-			goto err_rst;
+	ret = pm_runtime_get_sync(vdev->device);
+	if (ret < 0)
+		goto err_rst;
 
-		ret = vfio_platform_call_reset(vdev, &extra_dbg);
-		if (ret && vdev->reset_required) {
-			dev_warn(vdev->device, "reset driver is required and reset call failed in open (%d) %s\n",
-				 ret, extra_dbg ? extra_dbg : "");
-			goto err_rst;
-		}
+	ret = vfio_platform_call_reset(vdev, &extra_dbg);
+	if (ret && vdev->reset_required) {
+		dev_warn(
+			vdev->device,
+			"reset driver is required and reset call failed in open (%d) %s\n",
+			ret, extra_dbg ? extra_dbg : "");
+		goto err_rst;
 	}
-
-	vdev->refcnt++;
-
-	mutex_unlock(&driver_lock);
 	return 0;
 
 err_rst:
@@ -284,8 +271,6 @@ static int vfio_platform_open(struct vfio_device *core_vdev)
 	vfio_platform_irq_cleanup(vdev);
 err_irq:
 	vfio_platform_regions_cleanup(vdev);
-err_reg:
-	mutex_unlock(&driver_lock);
 	return ret;
 }
 
@@ -616,8 +601,8 @@ static int vfio_platform_mmap(struct vfio_device *core_vdev, struct vm_area_stru
 
 static const struct vfio_device_ops vfio_platform_ops = {
 	.name		= "vfio-platform",
-	.open		= vfio_platform_open,
-	.release	= vfio_platform_release,
+	.open_device	= vfio_platform_open_device,
+	.close_device	= vfio_platform_close_device,
 	.ioctl		= vfio_platform_ioctl,
 	.read		= vfio_platform_read,
 	.write		= vfio_platform_write,
diff --git a/drivers/vfio/platform/vfio_platform_private.h b/drivers/vfio/platform/vfio_platform_private.h
index dfb834c1365946..520d2a8e8375b2 100644
--- a/drivers/vfio/platform/vfio_platform_private.h
+++ b/drivers/vfio/platform/vfio_platform_private.h
@@ -48,7 +48,6 @@ struct vfio_platform_device {
 	u32				num_regions;
 	struct vfio_platform_irq	*irqs;
 	u32				num_irqs;
-	int				refcnt;
 	struct mutex			igate;
 	const char			*compat;
 	const char			*acpihid;
-- 
2.32.0

