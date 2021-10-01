Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B58641F3DE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE266EE92;
	Fri,  1 Oct 2021 17:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948C16EE92;
 Fri,  1 Oct 2021 17:52:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1q7TCl6oy7osFxSPwhe040ECIysm52tuoq++obWwbzUoGNocD+my+uZPGJDm4HPL6Cf7vCFln7Bt+2fM9JlB0X19j3zeUjCW2kiyIw//wY08D4RUC+WsTr5pqxTqV3dTifZZZbdvoyWvxfkGSpsapUUZC8GurwZ5JFmcoZhyNgDUzRt/PU5xQIDOfbPZZCxMZE8mAeqpfFC0uE3S+rkHOc45CCSd/oIxsk4B9nTI4d2Vp7l29uSqQpwdud2sgPkexe37zE01QRkmZ5Vk3eNRGWd77GYIy3k7BuHTunnrUqIMf7tNpkpvQq6smlccyO3aWMGO4O1X+2WaO14FawZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHkDyqEPmy21hChJ8MCQtskGVs1kfkcX+9TnjmpacNA=;
 b=TuNd6tnJqQjwgZxu8scdWqp1wTLDCJbnn2KfOruo3ZPvMF2d/ZBSFWg2/OtYLzqSjSOxpXDhEVXsUsEKo2LV9EPVJvPVTAerEoJxlz1DH4Yi2ETu/2mToJsVL+3Z8ikca5mhFkYqIk2d2GS0QEm6UTNTwlbUZZOWEG52FWMqcFbec2e/3VwfiffWbKhyQD+lYAv6bwanumhXJ4kdPSnrz0dFF7gusaD4WyQLtwxPvIElsBSEzh3DQlGpsHIY0ATVwxyFXPHkiV969oG8DzkA0O/uNWOBKGiAFD3/rP0mQlUCtNZpuKGKMGH5V2LfTcRUtOOZEUOEeScYh/L3kKBUFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHkDyqEPmy21hChJ8MCQtskGVs1kfkcX+9TnjmpacNA=;
 b=k36xRRhtCCnJtP4FDhCmhMCVCAdEbC5s/NuPPGYCN3xF3hxpzxDYEav0oU9EWLgHO1AH2XxMdHCZ9qm/tlIQbgQazejWyUhxL/Nl8VS0HQ2II64jiH2Es8FVbCbTo6ODSkEtoxpY/X6Ff1EPHyoOYNsqt0RiI6/rT1bRsnmYWkXdpwTjrYvYAO6e9ydO75RsE+2rwmKaCih+ugvubIojXKiole4qLk799m0wrWsKl79iUza7yxKWimNSJWKH0Vk2Gauzf2UKSTicyVz7T9plDtL0HB8/3m1P6E1fnA0pNgnK5zGAn8XqiiWtT6nQGemPlZAiR8Jbqde7mX6mAVwqIQ==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5207.namprd12.prod.outlook.com (2603:10b6:208:318::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 17:52:54 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 17:52:54 +0000
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
Subject: [PATCH v3 05/10] vfio/ccw: Make the FSM complete and synchronize it
 to the mdev
Date: Fri,  1 Oct 2021 14:52:46 -0300
Message-Id: <5-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:208:32a::30) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BLAPR03CA0115.namprd03.prod.outlook.com (2603:10b6:208:32a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Fri, 1 Oct 2021 17:52:52 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mWMiK-00989H-4j; Fri, 01 Oct 2021 14:52:52 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 632b5ca3-7e87-400e-d51f-08d985044abc
X-MS-TrafficTypeDiagnostic: BL1PR12MB5207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB520755D5419D573BE286C6E7C2AB9@BL1PR12MB5207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IpQ/I9z0CVIS56lcRrXMDVK4OfqVkrcBWrc1oiYEPNreuJCF3KiEFuI2t7XSipxV5y8CzvgGbRcbZ/awfuQ1VXzgFzXpxijQduERl330iT8JdlOTpKWMWQxGP0bNhZAkDXU+MR71bgILSx12HrNZC2LyTlD93bm77OZU/V4VT6NYJOuLL3Tz+on9RmcgyP/rJmD+IDOmr55HHCJrPYs+0omKj6FQOIpRaLua/UL3WP1HxcnRDrpwW9qM4ADrNHeofAeirP2/tB12J+9wOmZ05W29i7yQ/bEy414FOf/c0B8GFhA+yYJ1FXD/f1sXFJimcec4CvXa13If2r1EJtZCF/tOl8kl8dZnUmD3VRqdVcaOSMfcfj8BxNs0oc6gmhwNsYDOqiO7ThVL+8Bi5RkR48bJFsV9k8gNJqvuJn7BmXMcKQiMwAMlNcB7B6I2u4tLLignlgZB3b9BeOCDkTxuhHZFLlHbk0trsfQZtyEToxGE6YsjiGenNfn7uKAepLkGfy0wgWt3jWPzlPsuF5oyqUsYCQqlzldsMN6uqNSPNmBW332EESDBF2vd2bpISBrT706tWdaW5phjo9yGGu+bzp1Jj3YU3DkZkkVZK3GK+AJrSeWoVpcsCip6zEoGpJK6LbG8D4yZkQydljDSAcSAEmhajlbLKut2wjCUISZgFN2fOb2WmoC/+qCK7fPLvxZoAioXRKKIkwcyKalrFxAx+/F+f1G5Cpr3Pn+ep9b2usw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(2906002)(83380400001)(66556008)(8676002)(38100700002)(66476007)(5660300002)(2616005)(508600001)(426003)(9786002)(26005)(186003)(6666004)(9746002)(54906003)(36756003)(7416002)(4326008)(110136005)(86362001)(8936002)(921005)(30864003)(316002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l1a64hqyoObK/fZfqhldxw2w8ihFO7pWKydW82lHfxFHQGlwIdRHmQQi8cwg?=
 =?us-ascii?Q?IQY5cqhlMi13y4mufYotWmkKmABwPKdhD1zL7HQEdDDEE40koMipAIRh879m?=
 =?us-ascii?Q?qQdUrh/Fed+/UY3Pw3mD+86+dXgzqIf+oSUd73X5fR2M5vLunxkqWgtP51PB?=
 =?us-ascii?Q?z8cCxD3dN7aDXKPSssvpR2HDfhgNVaDItC/QPaK+zDfLIM0Ymszsz4RfpDBw?=
 =?us-ascii?Q?jLg8eU9/dUBGTmrqLk9FuQnP4N+QyQwp5IWmdS32G2tdne2sL0QmCwMsDqa3?=
 =?us-ascii?Q?V/QSRp65HtvPpaDcFONGrk8XU+vOI94+rFOLsyQJoY4MJhu0SVEtAiUW7bZe?=
 =?us-ascii?Q?WtieXICCWE+CW7Dem3KF2QQyZziOlSf2G+TyDWXdulSxx1pUrjZoZi7JORU1?=
 =?us-ascii?Q?ls8QxbtAYrQdgJrvSura3DG0lNdPt5jc5Vbj5lsm3N8fUqZd122zzw+ALXXv?=
 =?us-ascii?Q?DogJh6Yt56u0h67/+9X/RZ8C1RNT/LueFtFVW1BR39zLqXDKFWesOUQPvFC7?=
 =?us-ascii?Q?7JFMHdcUztHYWnwCkugaAjcNxpALXVR+w7ZEkyWh1Mq59C+/xOvfbius/dFA?=
 =?us-ascii?Q?M/R5e5PISv8AG6UzpAgBoRbSSLpIFbavnPxnyegY8IOHXn/J/TgeBgwgiY0Q?=
 =?us-ascii?Q?7eAsyX9C9G6zKGu0gRWCiP+bBsab92sr8B9lBu1Seg388To4kA8KwXSO2U4k?=
 =?us-ascii?Q?moXLuEwqtpkBLIw72+jfanFROURUG5bC4kUCr/kZRZdnbLLr7wAERBO2/2SN?=
 =?us-ascii?Q?oyLTnQcOGoqbzMaKmU6i/h4ykYmk8uWWur3fFadQeQUz3JbItyJVLQdcnQwq?=
 =?us-ascii?Q?Y8NOC3WMRJseZHMYXk/85J56qYETAenHJkyUUZoxYVwxhlnyoj0ITz4sgBGt?=
 =?us-ascii?Q?Tf2nWfDK02JnQ44DM2zYiwqzdAkX1RwDs5QZW1uTlHsYS4LhdQEUhgDi5zae?=
 =?us-ascii?Q?PDNyjVkZtl2mHD13lhUeLsX4/apWp3cr28dMcBXYtp+AoeQCjp9Ql5KSBjXl?=
 =?us-ascii?Q?FQqTk+1by0fdsLzPr9UMDAu18AB5/chH7YZuPyYxg5PkUj1EHDGcl10+7gm+?=
 =?us-ascii?Q?WbRTpYkwkrI/fHjb59nuWWgsSSaImXnjXpT8cyLx0fp4C1SBz8yGJsrTwZXE?=
 =?us-ascii?Q?8WeXwhkzoIYrPCxAEDnGQ/z0MpvMuBa+LZIGWDpdqSO3BSJVpaCOpsrcNkxY?=
 =?us-ascii?Q?3miO+lXVJ8pzu1Km/k6ZxY8VGXDlQL0WbLnNI8ed5XIFtnc7DFXPzQzrwyGh?=
 =?us-ascii?Q?r0xuJMeqRZrebcLG1dBpScSzxqNdKO1ptMywuRdSDk8JAPkOMK6C56f35qhJ?=
 =?us-ascii?Q?JUXYpMEDXSPnEKmCbJy+QyBBGbmo14uJbfAX/eYheL4oOw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 632b5ca3-7e87-400e-d51f-08d985044abc
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 17:52:53.2317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZ838l19+HDm3RbyhGBFH/oHM0weVAF+E6s//+7pOP2iEFwz0V7DbunKNMhBz0w0
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

The subchannel should be left in a quiescent state unless the VFIO device
FD is opened. When the FD is opened bring the chanel to active and allow
the VFIO device to operate. When the device FD is closed then quiesce the
channel.

To make this work the FSM needs to handle the transitions to/from open and
closed so everything is sequenced. Rename state NOT_OPER to BROKEN and use
it wheneven the driver has malfunctioned. STANDBY becomes CLOSED. The
normal case FSM looks like:
    CLOSED -> IDLE -> PROCESS/PENDING* -> IDLE -> CLOSED

With a possible branch off to BROKEN from any state. Once the device is in
BROKEN it cannot be recovered other than be reloading the driver.

Delete the triply redundant calls to
vfio_ccw_sch_quiesce(). vfio_ccw_mdev_close_device() always leaves the
subchannel quiescent. vfio_ccw_mdev_remove() cannot return until
vfio_ccw_mdev_close_device() completes and vfio_ccw_sch_remove() cannot
return until vfio_ccw_mdev_remove() completes. Have the FSM code take care
of calling cp_free() when appropriate.

Device reset becomes a CLOSE/OPEN sequence which now properly handles the
situation if the device becomes BROKEN.

Machine shutdown via vfio_ccw_sch_shutdown() now simply tries to close and
leaves the device BROKEN (though arguably the bus should take care to
quiet down the subchannel HW during shutdown, not the drivers)

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_drv.c     |  74 ++-----------------
 drivers/s390/cio/vfio_ccw_fsm.c     | 110 +++++++++++++++++++++++++---
 drivers/s390/cio/vfio_ccw_ops.c     |  49 ++++---------
 drivers/s390/cio/vfio_ccw_private.h |  12 +--
 4 files changed, 125 insertions(+), 120 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index 0407427770955d..769edbbd164313 100644
--- a/drivers/s390/cio/vfio_ccw_drv.c
+++ b/drivers/s390/cio/vfio_ccw_drv.c
@@ -36,51 +36,6 @@ debug_info_t *vfio_ccw_debug_trace_id;
 /*
  * Helpers
  */
-int vfio_ccw_sch_quiesce(struct subchannel *sch)
-{
-	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
-	DECLARE_COMPLETION_ONSTACK(completion);
-	int iretry, ret = 0;
-
-	spin_lock_irq(sch->lock);
-	if (!sch->schib.pmcw.ena)
-		goto out_unlock;
-	ret = cio_disable_subchannel(sch);
-	if (ret != -EBUSY)
-		goto out_unlock;
-
-	iretry = 255;
-	do {
-
-		ret = cio_cancel_halt_clear(sch, &iretry);
-
-		if (ret == -EIO) {
-			pr_err("vfio_ccw: could not quiesce subchannel 0.%x.%04x!\n",
-			       sch->schid.ssid, sch->schid.sch_no);
-			break;
-		}
-
-		/*
-		 * Flush all I/O and wait for
-		 * cancel/halt/clear completion.
-		 */
-		private->completion = &completion;
-		spin_unlock_irq(sch->lock);
-
-		if (ret == -EBUSY)
-			wait_for_completion_timeout(&completion, 3*HZ);
-
-		private->completion = NULL;
-		flush_workqueue(vfio_ccw_work_q);
-		spin_lock_irq(sch->lock);
-		ret = cio_disable_subchannel(sch);
-	} while (ret == -EBUSY);
-out_unlock:
-	private->state = VFIO_CCW_STATE_NOT_OPER;
-	spin_unlock_irq(sch->lock);
-	return ret;
-}
-
 static void vfio_ccw_sch_io_todo(struct work_struct *work)
 {
 	struct vfio_ccw_private *private;
@@ -147,7 +102,7 @@ static struct vfio_ccw_private *vfio_ccw_alloc_private(struct subchannel *sch)
 
 	private->sch = sch;
 	mutex_init(&private->io_mutex);
-	private->state = VFIO_CCW_STATE_NOT_OPER;
+	private->state = VFIO_CCW_STATE_CLOSED;
 	INIT_LIST_HEAD(&private->crw);
 	INIT_WORK(&private->io_work, vfio_ccw_sch_io_todo);
 	INIT_WORK(&private->crw_work, vfio_ccw_crw_todo);
@@ -231,18 +186,9 @@ static int vfio_ccw_sch_probe(struct subchannel *sch)
 
 	dev_set_drvdata(&sch->dev, private);
 
-	spin_lock_irq(sch->lock);
-	sch->isc = VFIO_CCW_ISC;
-	ret = cio_enable_subchannel(sch, (u32)(unsigned long)sch);
-	spin_unlock_irq(sch->lock);
-	if (ret)
-		goto out_free;
-
-	private->state = VFIO_CCW_STATE_STANDBY;
-
 	ret = vfio_ccw_mdev_reg(sch);
 	if (ret)
-		goto out_disable;
+		goto out_free;
 
 	if (dev_get_uevent_suppress(&sch->dev)) {
 		dev_set_uevent_suppress(&sch->dev, 0);
@@ -254,8 +200,6 @@ static int vfio_ccw_sch_probe(struct subchannel *sch)
 			   sch->schid.sch_no);
 	return 0;
 
-out_disable:
-	cio_disable_subchannel(sch);
 out_free:
 	dev_set_drvdata(&sch->dev, NULL);
 	vfio_ccw_free_private(private);
@@ -266,7 +210,6 @@ static void vfio_ccw_sch_remove(struct subchannel *sch)
 {
 	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
 
-	vfio_ccw_sch_quiesce(sch);
 	vfio_ccw_mdev_unreg(sch);
 
 	dev_set_drvdata(&sch->dev, NULL);
@@ -280,7 +223,10 @@ static void vfio_ccw_sch_remove(struct subchannel *sch)
 
 static void vfio_ccw_sch_shutdown(struct subchannel *sch)
 {
-	vfio_ccw_sch_quiesce(sch);
+	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
+
+	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_CLOSE);
+	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_BROKEN);
 }
 
 /**
@@ -307,16 +253,10 @@ static int vfio_ccw_sch_event(struct subchannel *sch, int process)
 		goto out_unlock;
 
 	if (cio_update_schib(sch)) {
-		vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_NOT_OPER);
+		vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_BROKEN);
 		rc = 0;
 		goto out_unlock;
 	}
-
-	private = dev_get_drvdata(&sch->dev);
-	if (private->state == VFIO_CCW_STATE_NOT_OPER) {
-		private->state = private->mdev ? VFIO_CCW_STATE_IDLE :
-				 VFIO_CCW_STATE_STANDBY;
-	}
 	rc = 0;
 
 out_unlock:
diff --git a/drivers/s390/cio/vfio_ccw_fsm.c b/drivers/s390/cio/vfio_ccw_fsm.c
index e435a9cd92dacf..64ff1a5e3cb475 100644
--- a/drivers/s390/cio/vfio_ccw_fsm.c
+++ b/drivers/s390/cio/vfio_ccw_fsm.c
@@ -12,6 +12,8 @@
 #include <linux/vfio.h>
 #include <linux/mdev.h>
 
+#include <asm/isc.h>
+
 #include "ioasm.h"
 #include "vfio_ccw_private.h"
 
@@ -156,12 +158,12 @@ static int fsm_do_clear(struct vfio_ccw_private *private)
 	return ret;
 }
 
-static void fsm_notoper(struct vfio_ccw_private *private,
-			enum vfio_ccw_event event)
+static void fsm_broken(struct vfio_ccw_private *private,
+		       enum vfio_ccw_event event)
 {
 	struct subchannel *sch = private->sch;
 
-	VFIO_CCW_TRACE_EVENT(2, "notoper");
+	VFIO_CCW_TRACE_EVENT(2, "broken");
 	VFIO_CCW_TRACE_EVENT(2, dev_name(&sch->dev));
 
 	/*
@@ -169,7 +171,8 @@ static void fsm_notoper(struct vfio_ccw_private *private,
 	 * Probably we should send the machine check to the guest.
 	 */
 	css_sched_sch_todo(sch, SCH_TODO_UNREG);
-	private->state = VFIO_CCW_STATE_NOT_OPER;
+	private->state = VFIO_CCW_STATE_BROKEN;
+	cp_free(&private->cp);
 }
 
 /*
@@ -367,38 +370,121 @@ static void fsm_irq(struct vfio_ccw_private *private,
 		complete(private->completion);
 }
 
+static void fsm_open(struct vfio_ccw_private *private,
+		     enum vfio_ccw_event event)
+{
+	struct subchannel *sch = private->sch;
+	int ret;
+
+	spin_lock_irq(sch->lock);
+	sch->isc = VFIO_CCW_ISC;
+	ret = cio_enable_subchannel(sch, (u32)(unsigned long)sch);
+	if (ret)
+		private->state = VFIO_CCW_STATE_BROKEN;
+	else
+		private->state = VFIO_CCW_STATE_IDLE;
+	spin_unlock_irq(sch->lock);
+}
+
+static int flush_sch(struct vfio_ccw_private *private)
+{
+	struct subchannel *sch = private->sch;
+	DECLARE_COMPLETION_ONSTACK(completion);
+	int iretry, ret = 0;
+
+	iretry = 255;
+	do {
+		ret = cio_cancel_halt_clear(sch, &iretry);
+		if (ret == -EIO) {
+			pr_err("vfio_ccw: could not quiesce subchannel 0.%x.%04x!\n",
+			       sch->schid.ssid, sch->schid.sch_no);
+			return ret;
+		}
+
+		/*
+		 * Flush all I/O and wait for
+		 * cancel/halt/clear completion.
+		 */
+		private->completion = &completion;
+		spin_unlock_irq(sch->lock);
+
+		if (ret == -EBUSY)
+			wait_for_completion_timeout(&completion, 3 * HZ);
+
+		private->completion = NULL;
+		flush_workqueue(vfio_ccw_work_q);
+		spin_lock_irq(sch->lock);
+		ret = cio_disable_subchannel(sch);
+	} while (ret == -EBUSY);
+	return ret;
+}
+
+static void fsm_close(struct vfio_ccw_private *private,
+		      enum vfio_ccw_event event)
+{
+	struct subchannel *sch = private->sch;
+	int ret;
+
+	spin_lock_irq(sch->lock);
+	if (!sch->schib.pmcw.ena)
+		goto err_unlock;
+	ret = cio_disable_subchannel(sch);
+	if (ret == -EBUSY)
+		ret = flush_sch(private);
+	if (ret)
+		goto err_unlock;
+	private->state = VFIO_CCW_STATE_CLOSED;
+	spin_unlock_irq(sch->lock);
+	cp_free(&private->cp);
+	return;
+
+err_unlock:
+	spin_unlock_irq(sch->lock);
+	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_BROKEN);
+}
+
 /*
  * Device statemachine
  */
 fsm_func_t *vfio_ccw_jumptable[NR_VFIO_CCW_STATES][NR_VFIO_CCW_EVENTS] = {
-	[VFIO_CCW_STATE_NOT_OPER] = {
-		[VFIO_CCW_EVENT_NOT_OPER]	= fsm_nop,
+	[VFIO_CCW_STATE_BROKEN] = {
+		[VFIO_CCW_EVENT_BROKEN]		= fsm_nop,
 		[VFIO_CCW_EVENT_IO_REQ]		= fsm_io_error,
 		[VFIO_CCW_EVENT_ASYNC_REQ]	= fsm_async_error,
 		[VFIO_CCW_EVENT_INTERRUPT]	= fsm_disabled_irq,
+		[VFIO_CCW_EVENT_OPEN]		= fsm_nop,
+		[VFIO_CCW_EVENT_CLOSE]		= fsm_nop,
 	},
-	[VFIO_CCW_STATE_STANDBY] = {
-		[VFIO_CCW_EVENT_NOT_OPER]	= fsm_notoper,
+	[VFIO_CCW_STATE_CLOSED] = {
+		[VFIO_CCW_EVENT_BROKEN]		= fsm_broken,
 		[VFIO_CCW_EVENT_IO_REQ]		= fsm_io_error,
 		[VFIO_CCW_EVENT_ASYNC_REQ]	= fsm_async_error,
-		[VFIO_CCW_EVENT_INTERRUPT]	= fsm_irq,
+		[VFIO_CCW_EVENT_INTERRUPT]	= fsm_disabled_irq,
+		[VFIO_CCW_EVENT_OPEN]		= fsm_open,
+		[VFIO_CCW_EVENT_CLOSE]		= fsm_broken,
 	},
 	[VFIO_CCW_STATE_IDLE] = {
-		[VFIO_CCW_EVENT_NOT_OPER]	= fsm_notoper,
+		[VFIO_CCW_EVENT_BROKEN]		= fsm_broken,
 		[VFIO_CCW_EVENT_IO_REQ]		= fsm_io_request,
 		[VFIO_CCW_EVENT_ASYNC_REQ]	= fsm_async_request,
 		[VFIO_CCW_EVENT_INTERRUPT]	= fsm_irq,
+		[VFIO_CCW_EVENT_OPEN]		= fsm_broken,
+		[VFIO_CCW_EVENT_CLOSE]		= fsm_close,
 	},
 	[VFIO_CCW_STATE_CP_PROCESSING] = {
-		[VFIO_CCW_EVENT_NOT_OPER]	= fsm_notoper,
+		[VFIO_CCW_EVENT_BROKEN]		= fsm_broken,
 		[VFIO_CCW_EVENT_IO_REQ]		= fsm_io_retry,
 		[VFIO_CCW_EVENT_ASYNC_REQ]	= fsm_async_retry,
 		[VFIO_CCW_EVENT_INTERRUPT]	= fsm_irq,
+		[VFIO_CCW_EVENT_OPEN]		= fsm_broken,
+		[VFIO_CCW_EVENT_CLOSE]		= fsm_close,
 	},
 	[VFIO_CCW_STATE_CP_PENDING] = {
-		[VFIO_CCW_EVENT_NOT_OPER]	= fsm_notoper,
+		[VFIO_CCW_EVENT_BROKEN]		= fsm_broken,
 		[VFIO_CCW_EVENT_IO_REQ]		= fsm_io_busy,
 		[VFIO_CCW_EVENT_ASYNC_REQ]	= fsm_async_request,
 		[VFIO_CCW_EVENT_INTERRUPT]	= fsm_irq,
+		[VFIO_CCW_EVENT_OPEN]		= fsm_broken,
+		[VFIO_CCW_EVENT_CLOSE]		= fsm_close,
 	},
 };
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index d8589afac272f1..bd4d08afa3e4dc 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -21,10 +21,6 @@ static const struct vfio_device_ops vfio_ccw_dev_ops;
 
 static int vfio_ccw_mdev_reset(struct vfio_ccw_private *private)
 {
-	struct subchannel *sch;
-	int ret;
-
-	sch = private->sch;
 	/*
 	 * TODO:
 	 * In the cureent stage, some things like "no I/O running" and "no
@@ -33,15 +29,11 @@ static int vfio_ccw_mdev_reset(struct vfio_ccw_private *private)
 	 * There are still a lot more instructions need to be handled. We
 	 * should come back here later.
 	 */
-	ret = vfio_ccw_sch_quiesce(sch);
-	if (ret)
-		return ret;
-
-	ret = cio_enable_subchannel(sch, (u32)(unsigned long)sch);
-	if (!ret)
-		private->state = VFIO_CCW_STATE_IDLE;
-
-	return ret;
+	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_CLOSE);
+	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_OPEN);
+	if (private->state == VFIO_CCW_STATE_BROKEN)
+		return -EINVAL;
+	return 0;
 }
 
 static int vfio_ccw_mdev_notifier(struct notifier_block *nb,
@@ -118,9 +110,6 @@ static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 	struct vfio_ccw_private *private = dev_get_drvdata(mdev->dev.parent);
 	int ret;
 
-	if (private->state == VFIO_CCW_STATE_NOT_OPER)
-		return -ENODEV;
-
 	if (atomic_dec_if_positive(&private->avail) < 0)
 		return -EPERM;
 
@@ -129,7 +118,6 @@ static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 			    &vfio_ccw_dev_ops);
 
 	private->mdev = mdev;
-	private->state = VFIO_CCW_STATE_IDLE;
 
 	VFIO_CCW_MSG_EVENT(2, "mdev %pUl, sch %x.%x.%04x: create\n",
 			   mdev_uuid(mdev), private->sch->schid.cssid,
@@ -146,7 +134,6 @@ static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 	vfio_uninit_group_dev(&private->vdev);
 	atomic_inc(&private->avail);
 	private->mdev = NULL;
-	private->state = VFIO_CCW_STATE_IDLE;
 	return ret;
 }
 
@@ -160,16 +147,7 @@ static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
 			   private->sch->schid.sch_no);
 
 	vfio_unregister_group_dev(&private->vdev);
-
-	if ((private->state != VFIO_CCW_STATE_NOT_OPER) &&
-	    (private->state != VFIO_CCW_STATE_STANDBY)) {
-		if (!vfio_ccw_sch_quiesce(private->sch))
-			private->state = VFIO_CCW_STATE_STANDBY;
-		/* The state will be NOT_OPER on error. */
-	}
-
 	vfio_uninit_group_dev(&private->vdev);
-	cp_free(&private->cp);
 	private->mdev = NULL;
 	atomic_inc(&private->avail);
 }
@@ -181,6 +159,9 @@ static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
 	unsigned long events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
 	int ret;
 
+	if (private->state == VFIO_CCW_STATE_BROKEN)
+		return -EINVAL;
+
 	private->nb.notifier_call = vfio_ccw_mdev_notifier;
 
 	ret = vfio_register_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
@@ -200,6 +181,11 @@ static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
 	if (ret)
 		goto out_unregister;
 
+	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_OPEN);
+	if (private->state == VFIO_CCW_STATE_BROKEN) {
+		ret = -EINVAL;
+		goto out_unregister;
+	}
 	return ret;
 
 out_unregister:
@@ -214,14 +200,7 @@ static void vfio_ccw_mdev_close_device(struct vfio_device *vdev)
 	struct vfio_ccw_private *private =
 		container_of(vdev, struct vfio_ccw_private, vdev);
 
-	if ((private->state != VFIO_CCW_STATE_NOT_OPER) &&
-	    (private->state != VFIO_CCW_STATE_STANDBY)) {
-		if (!vfio_ccw_mdev_reset(private))
-			private->state = VFIO_CCW_STATE_STANDBY;
-		/* The state will be NOT_OPER on error. */
-	}
-
-	cp_free(&private->cp);
+	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_CLOSE);
 	vfio_ccw_unregister_dev_regions(private);
 	vfio_unregister_notifier(vdev->dev, VFIO_IOMMU_NOTIFY, &private->nb);
 }
diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_ccw_private.h
index 7272eb78861244..5e98eacdf31074 100644
--- a/drivers/s390/cio/vfio_ccw_private.h
+++ b/drivers/s390/cio/vfio_ccw_private.h
@@ -122,16 +122,14 @@ struct vfio_ccw_private {
 extern int vfio_ccw_mdev_reg(struct subchannel *sch);
 extern void vfio_ccw_mdev_unreg(struct subchannel *sch);
 
-extern int vfio_ccw_sch_quiesce(struct subchannel *sch);
-
 extern struct mdev_driver vfio_ccw_mdev_driver;
 
 /*
  * States of the device statemachine.
  */
 enum vfio_ccw_state {
-	VFIO_CCW_STATE_NOT_OPER,
-	VFIO_CCW_STATE_STANDBY,
+	VFIO_CCW_STATE_BROKEN,
+	VFIO_CCW_STATE_CLOSED,
 	VFIO_CCW_STATE_IDLE,
 	VFIO_CCW_STATE_CP_PROCESSING,
 	VFIO_CCW_STATE_CP_PENDING,
@@ -143,10 +141,12 @@ enum vfio_ccw_state {
  * Asynchronous events of the device statemachine.
  */
 enum vfio_ccw_event {
-	VFIO_CCW_EVENT_NOT_OPER,
+	VFIO_CCW_EVENT_BROKEN,
 	VFIO_CCW_EVENT_IO_REQ,
 	VFIO_CCW_EVENT_INTERRUPT,
 	VFIO_CCW_EVENT_ASYNC_REQ,
+	VFIO_CCW_EVENT_OPEN,
+	VFIO_CCW_EVENT_CLOSE,
 	/* last element! */
 	NR_VFIO_CCW_EVENTS
 };
@@ -158,7 +158,7 @@ typedef void (fsm_func_t)(struct vfio_ccw_private *, enum vfio_ccw_event);
 extern fsm_func_t *vfio_ccw_jumptable[NR_VFIO_CCW_STATES][NR_VFIO_CCW_EVENTS];
 
 static inline void vfio_ccw_fsm_event(struct vfio_ccw_private *private,
-				     int event)
+				      enum vfio_ccw_event event)
 {
 	trace_vfio_ccw_fsm_event(private->sch->schid, private->state, event);
 	vfio_ccw_jumptable[private->state][event](private, event);
-- 
2.33.0

