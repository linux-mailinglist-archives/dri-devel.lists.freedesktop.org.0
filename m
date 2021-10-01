Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF9141F3EB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2576EF38;
	Fri,  1 Oct 2021 17:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501DA6EE92;
 Fri,  1 Oct 2021 17:52:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/ZC2tf4jdBKfBWdnZ71Neq0JkUpk4teiu5CvdnI0R85Zg2Ful01PAi2eYP16OK0J5Po8y4xm5E8Xs3q1kZ4STwHVxCap1LO6lz54UAr6cZxPUsjnAl3y33wYPosOlvJIsUlhWnHIwy5196/KiAF/euYNHl7u6CbWJZ7oszAc5XHve0LAKYi4ervEVbmZUx2wTnQjNSID0HwU7LxEoc1P+wQIXNBEDUNpNGNnYTjN/hQkVc6MMQPdB9z1TlncvwqrnP+mTxUusle2mqto0ra/DmZRqZ+e1/LbhD+DrIzPeOZZ8ORC/ZNID/RQS3mJuXV3qEKy8aFgmB/WZvc2yEo2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdJYkQFGtlcO2xO0G8alywJKE1dQhnzZz8ywW9PbMtg=;
 b=VM6vmJfLgBkNjgr9CzdltZ1AsMuyHcgLa3Q+6YzETsunRoynBiBR7HyvWjmvCydijhkt6w1qF8Woc0VfD5etUKqnAOMns1lZk5ME5ZsKIOaJKYHbMsKnWDblE0VFkpULVfwEqvw7ZrCfTlKzs74c8Z/Pug1lRbzr6fIGXtfpf3bdMFRgnnTATCV4Rm39j+snLBNnOVjlOcij3v4c/lzpX26hmvLu77lT12iQNBHkwWnNlytXk7njNXbvdY+J6Io4Pmg95sEYfLLccV1utB1Noxfm+wGahrJoibOXWjy/r0qdeh0qSmpljnTWvHjyBEck/oHh2/MjdZdsVcs6LJ3SVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdJYkQFGtlcO2xO0G8alywJKE1dQhnzZz8ywW9PbMtg=;
 b=ma9Gl0gZq6JqDLBjVyq0UKPJywi7FyNEuHoE2dC7TjVhTwbWORZ6iJu4gRY9MlbFoH/WTfc09NRoWD661P/6GI6MV1WDMTHeZzxLkrT9zG9ZqImM/kAaNoS3qAiZKvFMO8utZYGUFsDqrKXhg3dTAc6aR0J2hkyrSrndPd0SztKkfa3wMckNUXOaCU0EqBMNcuc1Jcwkq8DHimMqWfcPzXbt7KLrs+y6ne6pm3H2p/AFcnmm8Mm4+KTXHf8PLrkLg+tcGrPN1J33ye9sZbYgOynBsTdEz61iHlOl9cDeHs2Ft7e0c5nRo1YP65VQkXWMgDIqMnYXB3+Kj8SeZpTpnw==
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
Subject: [PATCH v3 10/10] vfio/ccw: Move the lifecycle of the struct
 vfio_ccw_private to the mdev
Date: Fri,  1 Oct 2021 14:52:51 -0300
Message-Id: <10-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::40) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR07CA0030.namprd07.prod.outlook.com (2603:10b6:208:1a0::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 17:52:53 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mWMiK-00989b-Az; Fri, 01 Oct 2021 14:52:52 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c107206e-8f2d-4760-ff3e-08d985044b10
X-MS-TrafficTypeDiagnostic: BL1PR12MB5207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB520734879C0E38FC0B566C1CC2AB9@BL1PR12MB5207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:81;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YlQCUbCeA/y5wpSyBYjumGq6PrjrmzG99Bs5lPPwp8MDl4kFXed/HM/di/Z0aP0yb/MhNP/BBNKo2yAY6N/bgFRlSUh8X4hnaRApzkfsCG5j4JGmyKc75DNj4N/egloBMekI4iTLYC2gm28ft45T8GodGrdoF1IKO443QMvNT+wonShK1TroYD2duUFN/I+sV8oRKcuMzorU9SQaXpzilF58g1TvQ4AG2sxlF1/4os4LC+NtvpgkrclEQ+SRuWNJcEtuKYZbvvFKxPfVnPU/NejC24PQMUoSXipQ5dhkB/0Sn7RbQX8aGG6koFagg2MFOUO4nafQYWVRIiGnspv62coEeu28FZ8/kNuYuzWst0jeXvjUzQVwnHvG24R+saKK54YpzR0Ay+dgru/tTkW6l0a5oXhFiE6C3Xeff4eQUEfUUalUulf+1V1+TPeJZGI/ZPDAg4RYSD/EmDflvLLwg9bko7LeM/aJNhEr8pn/nu3SqG1ANJnsD5OIDkeVykRZjdpkRYJujwSVsku3NiQ0IpsDrlTruvrU8SqAseRc4KyM8hjQaTGcQrICSZ3cq9ne+GwcxdAFmLhOatWDBFdd4mJERO7o2TiINrCGqYiASwgB57CLd0qu93ZG4jNwaCO7chFzuB8XVvbeZLOHeTXIW+Lcqj9IjJeYrYBDyZu4cthrKtlma1Trv0DjRaHZTJmM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(2906002)(83380400001)(66556008)(8676002)(38100700002)(66476007)(5660300002)(2616005)(508600001)(426003)(9786002)(26005)(186003)(9746002)(54906003)(36756003)(7416002)(4326008)(110136005)(86362001)(8936002)(921005)(30864003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BA0adI8Pr1QYQuVhJAamhVwzBD6yorXXoemeGjpXMUkl8xI8a0J4+PZSkH5i?=
 =?us-ascii?Q?8ps6s973lqFG0CELH5AHYqIbvMRod6f8U81Ahk21ARbrJZzUXGjp4zMk8jh8?=
 =?us-ascii?Q?DpCZGoiff09NCFmzmstpfNzfPM8xxi8p6rCs0LWeTFXihhMNgyNr9fwUWqp9?=
 =?us-ascii?Q?oTwMgUi9wXK9MSWS/tppAPogeOV2EwmQ7wOTU28mbFoWV/MXGO1EWJ2c3bdL?=
 =?us-ascii?Q?gDeF7k69otOmLMJVSijVjX/jBoeo1J+47A6qHih7e+kiW65gAFiE4QhQUczT?=
 =?us-ascii?Q?UV/xcJ9YXxd6Jw6ba7D8ek56ItstjcIBFygz4+G7WTI+whLHesHrzRn7Qf53?=
 =?us-ascii?Q?krJoDGhY9vS92WTqq6S+rZ8szVubTILhOC7ruK8CYvN1iXEdURq2G4GzAj2M?=
 =?us-ascii?Q?d8SqHX+rK4FYRlszJgMgZchqVHVyEAEpx5vNDSuK/hHREGKptAjRRKW7pP5E?=
 =?us-ascii?Q?gpqKjS7EBYgF6f2u3ov+nmMEpqkqZH1U4dHc9QOtXlgIvzH+gN8L/9SqE2w4?=
 =?us-ascii?Q?LvXRkryLo9+ctku7n9mvUluTxznrl6oR9BDYxqqADXjaRXani62kq1ch4zcK?=
 =?us-ascii?Q?6B1/UqDJxTQzrKfgYdxpkR412hm+tWNiWyTTvABpDBiC4PgqaaOqYBaCWCmv?=
 =?us-ascii?Q?E7+T4MmwIuC3rpFWM2J50jm78tSNXuMIwuuIyYG308YjonJ/zM1nFL4xmbfA?=
 =?us-ascii?Q?w03WHuW//hDWde/WEwU0AMTVzhFGFe3X9p8gH9CkUmw0xEHmNvTqR7AwSicM?=
 =?us-ascii?Q?QbEnsaUPiWePXAUkCzhuXOm/c21HbMKuLTvarQepEVWCciXQaVTJ1GxuIMbr?=
 =?us-ascii?Q?CXB0sJBJZWrti4mTIhqZpASAMTHINqNb8m88lPBNArnfggyW2/1APVVKj9A3?=
 =?us-ascii?Q?ZiI8whRVGNNuZ2pjk1Jj51ocEKtCtUetegmrIaMcRKxQPUj+qIODWE12FfGr?=
 =?us-ascii?Q?j92pBGDbT9K+G5b/uQ5l2OpM1QP9k6CebwkHbZbnB38XVobuWcdHma8H/OPw?=
 =?us-ascii?Q?Z3CTLvHhm4n0y0gt7jQAUe2DOc7zr8mRKuGog3PoK85w365xhN6G/vv/75Zo?=
 =?us-ascii?Q?LRfRt43mN6h7xr9yTCq3/FrnvRot2crts/rDo0fRc7WmL6HGwZ/Ruof+ap2G?=
 =?us-ascii?Q?HbDi4XJB5RFADfH0+mZeIL6HaQsnQK5IOmXuzbqM1DVsypHcHMusS+PqS+UZ?=
 =?us-ascii?Q?GhjzWCsYeo0BgdVivl4vOXNcD3PJVreJB52M2ti+SG9I1Rd6AF0Wo4SU5qMf?=
 =?us-ascii?Q?1kqij7YkQvETzs8LOy2/obpDqR+Datl2WGt2w3pkp78+E8qAcFTH04aicdTh?=
 =?us-ascii?Q?M2zFLj6nuU4lYnZlI284men9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c107206e-8f2d-4760-ff3e-08d985044b10
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 17:52:53.7973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wQ9oUMFtSrKcakP2GqFUXq075t/XKwIaUMpCJUOBCQH7QepIwLTzzL2PcQBlPd2
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

The css_driver's main purpose is to create/destroy the mdev and relay the
shutdown, irq, sch_event, and chp_event css_driver ops to the single
created vfio_device, if it exists.

Reframe the boundary where the css_driver domain switches to the vfio
domain by using rcu to read and refcount the vfio_device out of the sch's
drvdata. The mdev probe/remove will manage the drvdata of the parent.

The vfio core code refcounting thus guarantees that when a css_driver
callback is running the vfio_device is registered, simplifying the
understanding of the whole lifecycle.

Finally the vfio_ccw_private is allocated/freed during probe/remove of the
mdev like any other vfio_device struct.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_drv.c     | 67 ++++++++++++++---------------
 drivers/s390/cio/vfio_ccw_ops.c     | 40 +++++++----------
 drivers/s390/cio/vfio_ccw_private.h | 23 +++++++++-
 3 files changed, 69 insertions(+), 61 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index 18ad047811d111..c5582fc9c46c9e 100644
--- a/drivers/s390/cio/vfio_ccw_drv.c
+++ b/drivers/s390/cio/vfio_ccw_drv.c
@@ -86,13 +86,19 @@ static void vfio_ccw_crw_todo(struct work_struct *work)
  */
 static void vfio_ccw_sch_irq(struct subchannel *sch)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_private *private = vfio_ccw_get_priv(sch);
+
+	/* IRQ should not be delivered after the mdev is destroyed */
+	if (WARN_ON(!private))
+		return;
 
 	inc_irq_stat(IRQIO_CIO);
 	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_INTERRUPT);
+	vfio_device_put(&private->vdev);
 }
 
-static struct vfio_ccw_private *vfio_ccw_alloc_private(struct subchannel *sch)
+struct vfio_ccw_private *vfio_ccw_alloc_private(struct mdev_device *mdev,
+						struct subchannel *sch)
 {
 	struct vfio_ccw_private *private;
 
@@ -100,6 +106,8 @@ static struct vfio_ccw_private *vfio_ccw_alloc_private(struct subchannel *sch)
 	if (!private)
 		return ERR_PTR(-ENOMEM);
 
+	vfio_init_group_dev(&private->vdev, &mdev->dev,
+			    &vfio_ccw_dev_ops);
 	private->sch = sch;
 	mutex_init(&private->io_mutex);
 	private->state = VFIO_CCW_STATE_CLOSED;
@@ -145,11 +153,12 @@ static struct vfio_ccw_private *vfio_ccw_alloc_private(struct subchannel *sch)
 	kfree(private->cp.guest_cp);
 out_free_private:
 	mutex_destroy(&private->io_mutex);
+	vfio_uninit_group_dev(&private->vdev);
 	kfree(private);
 	return ERR_PTR(-ENOMEM);
 }
 
-static void vfio_ccw_free_private(struct vfio_ccw_private *private)
+void vfio_ccw_free_private(struct vfio_ccw_private *private)
 {
 	struct vfio_ccw_crw *crw, *temp;
 
@@ -164,14 +173,14 @@ static void vfio_ccw_free_private(struct vfio_ccw_private *private)
 	kmem_cache_free(vfio_ccw_io_region, private->io_region);
 	kfree(private->cp.guest_cp);
 	mutex_destroy(&private->io_mutex);
-	kfree(private);
+	vfio_uninit_group_dev(&private->vdev);
+	kfree_rcu(private, rcu);
 }
 
 static int vfio_ccw_sch_probe(struct subchannel *sch)
 {
 	struct pmcw *pmcw = &sch->schib.pmcw;
-	struct vfio_ccw_private *private;
-	int ret = -ENOMEM;
+	int ret;
 
 	if (pmcw->qf) {
 		dev_warn(&sch->dev, "vfio: ccw: does not support QDIO: %s\n",
@@ -179,15 +188,9 @@ static int vfio_ccw_sch_probe(struct subchannel *sch)
 		return -ENODEV;
 	}
 
-	private = vfio_ccw_alloc_private(sch);
-	if (IS_ERR(private))
-		return PTR_ERR(private);
-
-	dev_set_drvdata(&sch->dev, private);
-
-	ret = vfio_ccw_mdev_reg(sch);
+	ret = mdev_register_device(&sch->dev, &vfio_ccw_mdev_ops);
 	if (ret)
-		goto out_free;
+		return ret;
 
 	if (dev_get_uevent_suppress(&sch->dev)) {
 		dev_set_uevent_suppress(&sch->dev, 0);
@@ -198,22 +201,11 @@ static int vfio_ccw_sch_probe(struct subchannel *sch)
 			   sch->schid.cssid, sch->schid.ssid,
 			   sch->schid.sch_no);
 	return 0;
-
-out_free:
-	dev_set_drvdata(&sch->dev, NULL);
-	vfio_ccw_free_private(private);
-	return ret;
 }
 
 static void vfio_ccw_sch_remove(struct subchannel *sch)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
-
-	vfio_ccw_mdev_unreg(sch);
-
-	dev_set_drvdata(&sch->dev, NULL);
-
-	vfio_ccw_free_private(private);
+	mdev_unregister_device(&sch->dev);
 
 	VFIO_CCW_MSG_EVENT(4, "unbound from subchannel %x.%x.%04x\n",
 			   sch->schid.cssid, sch->schid.ssid,
@@ -222,10 +214,14 @@ static void vfio_ccw_sch_remove(struct subchannel *sch)
 
 static void vfio_ccw_sch_shutdown(struct subchannel *sch)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_private *private = vfio_ccw_get_priv(sch);
+
+	if (!private)
+		return;
 
 	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_CLOSE);
 	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_BROKEN);
+	vfio_device_put(&private->vdev);
 }
 
 /**
@@ -240,14 +236,14 @@ static void vfio_ccw_sch_shutdown(struct subchannel *sch)
  */
 static int vfio_ccw_sch_event(struct subchannel *sch, int process)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_private *private = vfio_ccw_get_priv(sch);
 	unsigned long flags;
 	int rc = -EAGAIN;
 
-	spin_lock_irqsave(sch->lock, flags);
-	if (!device_is_registered(&sch->dev))
-		goto out_unlock;
+	if (!private)
+		return -EAGAIN;
 
+	spin_lock_irqsave(sch->lock, flags);
 	if (work_pending(&sch->todo_work))
 		goto out_unlock;
 
@@ -260,7 +256,7 @@ static int vfio_ccw_sch_event(struct subchannel *sch, int process)
 
 out_unlock:
 	spin_unlock_irqrestore(sch->lock, flags);
-
+	vfio_device_put(&private->vdev);
 	return rc;
 }
 
@@ -294,7 +290,7 @@ static void vfio_ccw_queue_crw(struct vfio_ccw_private *private,
 static int vfio_ccw_chp_event(struct subchannel *sch,
 			      struct chp_link *link, int event)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_private *private = vfio_ccw_get_priv(sch);
 	int mask = chp_ssd_get_mask(&sch->ssd_info, link);
 	int retry = 255;
 
@@ -307,8 +303,10 @@ static int vfio_ccw_chp_event(struct subchannel *sch,
 			   sch->schid.ssid, sch->schid.sch_no,
 			   mask, event);
 
-	if (cio_update_schib(sch))
+	if (cio_update_schib(sch)) {
+		vfio_device_put(&private->vdev);
 		return -ENODEV;
+	}
 
 	switch (event) {
 	case CHP_VARY_OFF:
@@ -338,6 +336,7 @@ static int vfio_ccw_chp_event(struct subchannel *sch,
 		break;
 	}
 
+	vfio_device_put(&private->vdev);
 	return 0;
 }
 
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 68aae25a0a4be0..414b11ea7eebf9 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -17,8 +17,6 @@
 
 #include "vfio_ccw_private.h"
 
-static const struct vfio_device_ops vfio_ccw_dev_ops;
-
 static int vfio_ccw_mdev_reset(struct vfio_ccw_private *private)
 {
 	/*
@@ -88,26 +86,27 @@ static struct attribute_group *mdev_type_groups[] = {
 
 static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(mdev->dev.parent);
+	struct subchannel *sch = to_subchannel(mdev->dev.parent);
+	struct vfio_ccw_private *private;
 	int ret;
 
-	memset(&private->vdev, 0, sizeof(private->vdev));
-	vfio_init_group_dev(&private->vdev, &mdev->dev,
-			    &vfio_ccw_dev_ops);
+	private = vfio_ccw_alloc_private(mdev, sch);
+	if (IS_ERR(private))
+		return PTR_ERR(private);
 
 	VFIO_CCW_MSG_EVENT(2, "mdev %s, sch %x.%x.%04x: create\n",
-			   dev_name(private->vdev.dev),
-			   private->sch->schid.cssid, private->sch->schid.ssid,
-			   private->sch->schid.sch_no);
+			   dev_name(private->vdev.dev), sch->schid.cssid,
+			   sch->schid.ssid, sch->schid.sch_no);
 
 	ret = vfio_register_emulated_iommu_dev(&private->vdev);
 	if (ret)
-		goto err_init;
+		goto err_alloc;
 	dev_set_drvdata(&mdev->dev, private);
+	dev_set_drvdata(&sch->dev, private);
 	return 0;
 
-err_init:
-	vfio_uninit_group_dev(&private->vdev);
+err_alloc:
+	vfio_ccw_free_private(private);
 	return ret;
 }
 
@@ -120,8 +119,9 @@ static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
 			   private->sch->schid.cssid, private->sch->schid.ssid,
 			   private->sch->schid.sch_no);
 
+	dev_set_drvdata(&private->sch->dev, NULL);
 	vfio_unregister_group_dev(&private->vdev);
-	vfio_uninit_group_dev(&private->vdev);
+	vfio_ccw_free_private(private);
 }
 
 static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
@@ -595,7 +595,7 @@ static unsigned int vfio_ccw_get_available(struct mdev_type *mtype)
 	return 1;
 }
 
-static const struct vfio_device_ops vfio_ccw_dev_ops = {
+const struct vfio_device_ops vfio_ccw_dev_ops = {
 	.open_device = vfio_ccw_mdev_open_device,
 	.close_device = vfio_ccw_mdev_close_device,
 	.read = vfio_ccw_mdev_read,
@@ -615,19 +615,9 @@ struct mdev_driver vfio_ccw_mdev_driver = {
 	.get_available = vfio_ccw_get_available,
 };
 
-static const struct mdev_parent_ops vfio_ccw_mdev_ops = {
+const struct mdev_parent_ops vfio_ccw_mdev_ops = {
 	.owner			= THIS_MODULE,
 	.device_driver		= &vfio_ccw_mdev_driver,
 	.device_api		= VFIO_DEVICE_API_CCW_STRING,
 	.supported_type_groups  = mdev_type_groups,
 };
-
-int vfio_ccw_mdev_reg(struct subchannel *sch)
-{
-	return mdev_register_device(&sch->dev, &vfio_ccw_mdev_ops);
-}
-
-void vfio_ccw_mdev_unreg(struct subchannel *sch)
-{
-	mdev_unregister_device(&sch->dev);
-}
diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_ccw_private.h
index 67ee9c624393b0..852ff94fc107d6 100644
--- a/drivers/s390/cio/vfio_ccw_private.h
+++ b/drivers/s390/cio/vfio_ccw_private.h
@@ -24,6 +24,8 @@
 #include "css.h"
 #include "vfio_ccw_cp.h"
 
+struct mdev_device;
+
 #define VFIO_CCW_OFFSET_SHIFT   10
 #define VFIO_CCW_OFFSET_TO_INDEX(off)	(off >> VFIO_CCW_OFFSET_SHIFT)
 #define VFIO_CCW_INDEX_TO_OFFSET(index)	((u64)(index) << VFIO_CCW_OFFSET_SHIFT)
@@ -69,6 +71,7 @@ struct vfio_ccw_crw {
 /**
  * struct vfio_ccw_private
  * @vdev: Embedded VFIO device
+ * @rcu: head for kfree_rcu()
  * @sch: pointer to the subchannel
  * @state: internal state of the device
  * @completion: synchronization helper of the I/O completion
@@ -91,6 +94,7 @@ struct vfio_ccw_crw {
  */
 struct vfio_ccw_private {
 	struct vfio_device vdev;
+	struct rcu_head rcu;
 	struct subchannel	*sch;
 	int			state;
 	struct completion	*completion;
@@ -115,10 +119,25 @@ struct vfio_ccw_private {
 	struct work_struct	crw_work;
 } __aligned(8);
 
-extern int vfio_ccw_mdev_reg(struct subchannel *sch);
-extern void vfio_ccw_mdev_unreg(struct subchannel *sch);
+struct vfio_ccw_private *vfio_ccw_alloc_private(struct mdev_device *mdev,
+						struct subchannel *sch);
+void vfio_ccw_free_private(struct vfio_ccw_private *private);
 
 extern struct mdev_driver vfio_ccw_mdev_driver;
+extern const struct mdev_parent_ops vfio_ccw_mdev_ops;
+extern const struct vfio_device_ops vfio_ccw_dev_ops;
+
+static inline struct vfio_ccw_private *vfio_ccw_get_priv(struct subchannel *sch)
+{
+	struct vfio_ccw_private *private;
+
+	rcu_read_lock();
+	private = dev_get_drvdata(&sch->dev);
+	if (private && !vfio_device_try_get(&private->vdev))
+		private = NULL;
+	rcu_read_unlock();
+	return private;
+}
 
 /*
  * States of the device statemachine.
-- 
2.33.0

