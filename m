Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA99405D8D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 21:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194EC6E90F;
	Thu,  9 Sep 2021 19:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296986E904;
 Thu,  9 Sep 2021 19:38:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnGbT4N9jIRDVe39090iRJUlg1K8cGlXnYKWQHFILHnXWBgttrZLqHPJFCik4sksaSQ09gkxTN3q0iWxjqze3QRVzm4Hyk4FvIpNpyjtjA/LfNfS0b3rDBXQsFlUiy9wnf8bl3TMtXqOkoE0zGcnJ7Q8gv/P13XinaBKBP+mLb+NqmVyihmN01yGL4UGOdvPEzXgHfYkRMsoUVZMucbVLH+Q7IEQ6lUVpl1kyI0rdP9jg2jVj1wO7TVPEK2cobbhuExAjqT5p7R/jls8jQqLculUZx+9YTYAVnTPFntK7L6wb6S/R4inAo+irjXqiuCnv1GCBVRTaaQBvo1tZT/Ohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=cQlUMg/ysqyvN7+hivtAZ1trIYACTCmWxQNAlxlEp+I=;
 b=hmZ1S3m6A9z8xvDm6i9iEDrldghzd75q+dySqSe/xMl7QFkldgWtTNKk3GqCVqYBelnXQOrCSUDekMM84m6XzpmH3Jz4TBq2qLDEQtcLXybaZ9+EcKZI7nVIQsQ7PZhrMreWt/knjL9MdNMvxLaYUq6EOCVV4vyLfvmju5iZkl0VunIaMyenptF8Sj3NsluqOQIBFgVD8/+vt5A8n0BZtLvXbHVIZ+HbLwooI78MiVAtXJfoTympY1WGOw6r5R1UtWqgcVe1qnIQN8NZCws1Ednt3tsIkGg2LLQH9Gv+7bkzSbn3ZGyGwQR429tQJsB9rGel/QbzQ9U2KGK5HFn0aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQlUMg/ysqyvN7+hivtAZ1trIYACTCmWxQNAlxlEp+I=;
 b=FpAovmLaK9gCq/qoUMOCjftqXiQMsxLy76xN3mHjiHLAYpVHiUOz9M/L2UsxkOVOyD7vxAWtqohKuB0xyjPl+kh7zShhQj/0Gf36Ax4aCB34fNiiH7uRxEj/cU26VV/r8Xe6qqXmHYNHAzVHvkhLG45HXadFzv4ZDodI02VNiIm0Mz4lGEmBOfFj2Nx3EtFJc9WSCXihMzy5Aj98bTcpAFYh0jM6VeGrHN/z4Iv9mpHpm+xqKbWoAWposOMCaY+Lnnm0czLKxAy39oRfLYiRkr0zQMcI0h6mGbxHK/dCCogpp/YAbCDkf1tWe9T/mm08n37Ee9ZT+n7KUBXAbutfOw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5554.namprd12.prod.outlook.com (2603:10b6:208:1cd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 19:38:51 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4500.014; Thu, 9 Sep 2021
 19:38:51 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 4/9] vfio/ccw: Make the FSM complete and synchronize it to
 the mdev
Date: Thu,  9 Sep 2021 16:38:44 -0300
Message-Id: <4-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:207:3c::37) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR02CA0024.namprd02.prod.outlook.com (2603:10b6:207:3c::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 19:38:50 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mOPsn-00FLEy-JF; Thu, 09 Sep 2021 16:38:49 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68699887-9b50-493f-65d8-08d973c972e6
X-MS-TrafficTypeDiagnostic: BL0PR12MB5554:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5554116344ABF56F4B37E358C2D59@BL0PR12MB5554.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FT37us6Bxt1y+KLUGuj48+oyv3ZYxoXLg3lCHyxb6FI3OS7elSV8N9W6qFiLwcrGIbpgADYqkvRn/rH9dBKQPplnG5MXAKCLGUd0dkZmM8fi0EDUpAYIvKlLSBEr/UGZalpEeS3lvWPhFWog/ccVx/L5Tdvswv0iK0qm04vUS+Kq4vwhqmzOOO1og1K+LEomkXdND8p6QSbzzmBPPv33uieN56Zh9BwMK4sSwhC8uiKH2viK0hoDT/DByIg4Llj1ydodwa+zf83wj9Zr/NM0paTjj8UI0CyD8JQYNbvGeRq8RHfCCyt+atLSDyBA0HTo4A1heNaI0jhfzuAcQ+6aiQVZCdBDZqBYerinyAREW0d0OsyCMFnWC1vAoNMtCby0B8MDfT9zWTPw7lzM3T5OcorAWFQF0gDSMac7LKeziIZXqjGoGiRWrNlipCmKQmHHG3CMfGK1KNV0/UY4MO9USiey6iTHE5Lohpat/TYT6gpqm9q9tmgWiyUHwzvimsJAMaYCLakkWZKgmDEwCAoOByFePzWgnqpDsl0LCqK/qdIXG90UTVzvcXC8qxjJBIxIyy0iEFy09rrRBU0VrDSNa1sCKz2OsHYS1o9r+qTuOC76sVETXOm4nSq18qgfpPvXj7Iwo2mQCFqVdl46mAAy/Vz4wDVtSYGNWnTp3tc5U9YFtuTK4W2RBqQPGZpkJyD7ULAfeUKx+k+wVV/dlREdvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(26005)(4326008)(2616005)(66556008)(30864003)(921005)(66476007)(426003)(66946007)(9746002)(9786002)(5660300002)(186003)(83380400001)(86362001)(508600001)(8936002)(6666004)(110136005)(38100700002)(36756003)(316002)(8676002)(2906002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8rFtHuQzBehIwkWkx9VM5JpLNS2FLKUbNEUyslJa+fRT16Su9SzcoNDDdCE5JYHzU+U7EG7zcGHarjlJg021Ru1/E+rnDEp3qqlOf4c6GGiIaOJHRkH9941HczH3rQaSsqjJhaA1HdRZcnyn2RdJPfMNVe2vyiubwLR/mtkFhiuPnZuVaV+m77tVM/SHU8KFfetUOsQQTuT9FvapqE8IvOjdRLmqY3YtxmUVz+J0QVpj34z75TSBS1GF3g/Q2VfLNOupjdKxGk1BdiBwBdgzzqJZYD6da0mODDXnp1EREm5ZiqU7VHixCkq64RsFDnKcd3tewV0J5vGjaPUQS2yqlVHc1O+lwtWTr0nd/gpW5oZ6w4pegJ+1u4gPJSQvmCyEPSNSSuv5nHRhX8ddSI49bXXXbaREF6/Yv7R5qSFLyWSB4Jg4Uv1LT8G6GOrUUj/xKflz0G3f8NaoYR9LQxhj8galcN6cRMuRb09Mb7npqTAYFhqZFdUf/1j0zOaQNlwHdY+p1PIlQEnuNIcS/PkUJfPXA2MZMH5yLhOS9HkvHqhj20f1unKU5lXi9mmdN7ZW6VXo/k8aQpmsHBiiJPtfWn5fwqrdLThpnCl0f2Rphtt7SAaWIGbIGepDf0q6UWaZiKvr+2bjOQv6fGfsqWM+cTP9aHCydoIve5cjEIMZKKAcXFV4zrYEibwkylYTscgacKj64TBuU1Ca8Pd33xLiNBwKna0rSZau/dbJCQvQW/CvlmK4hh69/H3QgrspEtOK
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68699887-9b50-493f-65d8-08d973c972e6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 19:38:50.7000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ACDoJVM8SuHf5o3OjLfOl0vktI94u3Sa3aABf6FvMwanX54V08aPKi6/LvP+khir
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5554
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
 drivers/s390/cio/vfio_ccw_drv.c     |  74 ++------------------
 drivers/s390/cio/vfio_ccw_fsm.c     | 104 ++++++++++++++++++++++++----
 drivers/s390/cio/vfio_ccw_ops.c     |  49 ++++---------
 drivers/s390/cio/vfio_ccw_private.h |  12 ++--
 4 files changed, 119 insertions(+), 120 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index 396e815f81f8a4..99f2823361718f 100644
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
@@ -266,7 +210,6 @@ static int vfio_ccw_sch_remove(struct subchannel *sch)
 {
 	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
 
-	vfio_ccw_sch_quiesce(sch);
 	vfio_ccw_mdev_unreg(sch);
 
 	dev_set_drvdata(&sch->dev, NULL);
@@ -281,7 +224,10 @@ static int vfio_ccw_sch_remove(struct subchannel *sch)
 
 static void vfio_ccw_sch_shutdown(struct subchannel *sch)
 {
-	vfio_ccw_sch_quiesce(sch);
+	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
+
+	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_CLOSE);
+	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_BROKEN);
 }
 
 /**
@@ -308,16 +254,10 @@ static int vfio_ccw_sch_event(struct subchannel *sch, int process)
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
index e435a9cd92dacf..302215090b9ac7 100644
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
@@ -367,38 +370,115 @@ static void fsm_irq(struct vfio_ccw_private *private,
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
+static void fsm_close(struct vfio_ccw_private *private,
+		      enum vfio_ccw_event event)
+{
+	struct subchannel *sch = private->sch;
+	DECLARE_COMPLETION_ONSTACK(completion);
+	int iretry, ret = 0;
+
+	spin_lock_irq(sch->lock);
+	if (!sch->schib.pmcw.ena)
+		goto err_unlock;
+	ret = cio_disable_subchannel(sch);
+	if (ret != -EBUSY)
+		goto err_unlock;
+
+	iretry = 255;
+	do {
+
+		ret = cio_cancel_halt_clear(sch, &iretry);
+
+		if (ret == -EIO) {
+			pr_err("vfio_ccw: could not quiesce subchannel 0.%x.%04x!\n",
+			       sch->schid.ssid, sch->schid.sch_no);
+			break;
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
+			wait_for_completion_timeout(&completion, 3*HZ);
+
+		private->completion = NULL;
+		flush_workqueue(vfio_ccw_work_q);
+		spin_lock_irq(sch->lock);
+		ret = cio_disable_subchannel(sch);
+	} while (ret == -EBUSY);
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
index 3a66e4fb18244c..6e70620d5dfbc8 100644
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

