Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 852E2405D96
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 21:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F44B6E91C;
	Thu,  9 Sep 2021 19:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D2C6E902;
 Thu,  9 Sep 2021 19:38:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHPzDatLU9jmDmLGFuxJmRw/bnem1JKw0ZdNDxm4snQaYZepD18iR7KDn46TedErTT2d14s5A2AUYrgnQekl/zzduXIwNybsj+yOqSew56qIRK/X8fsfMe9OYvNnFHeE2W9i7buEZVdbD8gkDO06hfpSKt6TxWrwRkRleg95Zmws9leOqQXy9RJFgqNs9zDhDdG4MZdVXTVT/5VdvpC7KIB763vmdrKInZuxkxWY9JvF5PvKINd7MLl1KIPUkc7lxPY3tFt32WP+zmUmo3N1nulKXOV2v+xW5ILCrdzkZmEoVO1sqxQc5gv8mayFOUD5ijN3sBoPSDJUydVOBBZH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=7sCNQ4vciCjpR4sYbGntkkTBay+aB9qscb688lFIPK4=;
 b=EGWACzl4X90Sc4TzoQNO3LodgzRBLlxP6FRE070wIgxV2YT9mSLPJY77BsbW83O3v2iAtSFozbXUv6V9UFL6Wzw1yYIiJDdyR2foYAIzf07EvceWvuURvz2sK/6zMevkzUTMu+nkbEpaztGShLFzxL8vZp2udKhpgZHdSK07FXtrGV1xCqWVO/49E2H031WqYNJET0XUfoIeIVzXbHDdiEEWEq0XVRL7zQH9wVtlll/8sWK5UlaK8aglgBU4cUQOCtk0JJ01xybMS1keUwwjyUCDp0ziMKKU+MTDrglYsh/W4FGppMdwBqGLFhIRwUiENICvKmkINBMnZM/jXVDttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sCNQ4vciCjpR4sYbGntkkTBay+aB9qscb688lFIPK4=;
 b=DW94s/pxKAakTLFbYhHWXkHUhfVj15nxz9fPB8pXb7+gyzRmeNnuOQMbJ/1P3EyqKAnaDKzqf6Nv0xUYm3JZaTL6y9gtMLSLqBYKAQBtK2+YIuybz6nbn9sNLCowYnZpuxo5nEGk8BaIMzHVULdPTZHHk7aiOl/cBvcLBid2MGQG5Ep4TGZiEZEJ3tSRzd2OP5caRBMqRDcvGIpO+gG5PgX5rUSTVV3M48l5KLC0EOlIwdx3P1wHrIOZdhKvdnFX25e3EEL3EyDAj8gysD/xqwMjgWZL5lGycCHXj19fuIcD+Tt5A2gCvx4MxiMXnzhE6x7Z/pm6dEDjrZuSj67WZw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5554.namprd12.prod.outlook.com (2603:10b6:208:1cd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 19:38:52 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4500.014; Thu, 9 Sep 2021
 19:38:52 +0000
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
Subject: [PATCH v2 7/9] vfio/ccw: Remove private->mdev
Date: Thu,  9 Sep 2021 16:38:47 -0300
Message-Id: <7-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0010.namprd18.prod.outlook.com
 (2603:10b6:208:23c::15) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR18CA0010.namprd18.prod.outlook.com (2603:10b6:208:23c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Thu, 9 Sep 2021 19:38:50 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mOPsn-00FLFA-NO; Thu, 09 Sep 2021 16:38:49 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6194d36-aa59-4c3f-f7cf-08d973c9733e
X-MS-TrafficTypeDiagnostic: BL0PR12MB5554:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB55545C2B55FC32853A0A041DC2D59@BL0PR12MB5554.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zQh4fDLT1SVHI3bAnw2PlnXmRlUOMUX3VLM+CmRkHFkr3qcUrMBEEkazvTyKSHIJaKI0XGkVKUyAuFvm6q7PVGJDVARPRBUp82kDJFVMCl2kHY/cC6Zlt/mDMo/hG+WWghFh4/+OlQRYkzMVNxvAbxDH1zfEq1H+ysrcwBF4Cz9jS3iHKT+e8HmB0upHG2IG73AHi/4eQpeALKxuGyDpA/4dstXkYUR+h9v8qlVqGEOmyql+pFSWUOjVJJjYJZ79Xt8GCQUDTmbUB6le55iZDug7lVJvL/tFqTxzNZ412JdmIwPKUZS7g5cFAWMB8QdSBHmuGh97aPGn8FGCgt0YPe7X93o+F/ISk4+XWvz2cgoWlBdk1YHGEssAAmu8gfh9y/FTvOs8SKyCVBxrVZfBpTgOzqM0y/TjM8jEHA7MlsM5KTdCBxVvHaOLXrq+8okRBBi0LG5tOQLbfE47zf90+Y5xkI5E0Pe4SE0MlS8C50sZkTmA0AjxPNiqD+3ZLf7nMgEMcRaV3jk9zAxjcB6MYEbylCImy1Jz3AAGrWBPcRMm7jAarMjXFT9YsDfKvKmlwszabqRk1YxUof2+0yN3hXP0cF32zRUCygbprX1beabYbaa1zc3bBIScuO0qmqjkiIRde87GHpn7zmfjx1lCkH5wVHMEODmK/ZTcPXufVt92w+oT45zF0mrxKIyzMFRVp/1xU59r3lMGWu+QOfQ8zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(26005)(4326008)(2616005)(66556008)(921005)(66476007)(426003)(66946007)(9746002)(9786002)(5660300002)(186003)(83380400001)(86362001)(508600001)(8936002)(110136005)(38100700002)(36756003)(316002)(8676002)(2906002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: k6NHNZSfPFd1UiN4j2At2f/rx1u5CjvQc9RP2wASqhyCakhf9effN0a8Z0q1aNQgU7k8nzdWTVq85iQ8jVRSp2lbvzQ/YGHLcixoq7Tus1M8ZAxdPIIF3nZRWxE015+NZ3bjkapqWgSBMiixbqi2hVNMTXcRa5Y+iHlgr7hPUtrrATId2qSe+CaYtESbzg4JQ5VKu9BPel6H3GDLNCy75sVKiOZCL6qO1JGWi8wF5LnDjuEcatGHBFDgEUtvk9w78XdQI0h6Z5Ek0WC+0+QxO6w5X7AI1Qjri8yrRTMSFO6u3YaJ3EYzTGq609GUGXe6tGRDLUBOZfQ1DVVKKqM/wmnz+0BKlzfG4PfQeu1MO2AsKIAO+1ulaIZTUHlv2k0dArmD+/MB98uhdqU74jsV007yApNf0OBjw832HQ0GjJcaBCGxKBLqPuySDhxnf31QGoK1QcRY4makxOpPRL8fsCdV3+DbXhzJrbIPG0sxLTj1kEcupRJUkONjlzJLER0xEYne2PoM1R3zv91WTf61C4TMQBEvBbOIHEd4M7JM5/WQqy+LTdu4tsX9Vw4X/VRCfgC9qUi1i2WOYFZMLLSAOfEU8XdYKadiL/vEyxFPR0gzoQljTZXL/qQYPnCtgPs4qoGtG5A5HzUydyx7qa/WPaS/KklF1aC5FH8xxwW/ZSDIXtMcc46imdw6Mv9m8k/3KNhOVPsBP1Kl2qf25zQUGOe9o4ddY5HfzYRFmcvEeGOhxycMSKw8lzydgubZCNRc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6194d36-aa59-4c3f-f7cf-08d973c9733e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 19:38:51.3601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzAKlCaHi5ScoQfJ51Qv+5WpkmcKp/1haWzvwaevtu5U4+Rb0iPEdspGzfRHgtu5
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

Having a mdev pointer floating about in addition to a struct vfio_device
is confusing. It is only used for three things:

- Getting the mdev 'struct device *' - this is the same as
     private->vdev.dev

- Printing the uuid of the mdev in logging. The uuid is also the dev_name
  of the mdev so this is the same string as
     dev_name(private->vdev.dev)

- A weird attempt to fence the vfio_ccw_sch_io_todo() work. This work is
  only queued during states IDLE/PROCESSING/PENDING and flushed when
  entering CLOSED. Thus the work already cannot run when the mdev is NULL.
  Remove it.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_drv.c     |  6 ++--
 drivers/s390/cio/vfio_ccw_fsm.c     | 48 +++++++++++++----------------
 drivers/s390/cio/vfio_ccw_ops.c     | 16 ++++------
 drivers/s390/cio/vfio_ccw_private.h |  2 --
 include/linux/mdev.h                |  4 ---
 5 files changed, 30 insertions(+), 46 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index de782e967a5474..0e2edd96567a09 100644
--- a/drivers/s390/cio/vfio_ccw_drv.c
+++ b/drivers/s390/cio/vfio_ccw_drv.c
@@ -64,7 +64,7 @@ static void vfio_ccw_sch_io_todo(struct work_struct *work)
 	 * has finished. Do not overwrite a possible processing
 	 * state if the final interrupt was for HSCH or CSCH.
 	 */
-	if (private->mdev && cp_is_finished)
+	if (cp_is_finished)
 		private->state = VFIO_CCW_STATE_IDLE;
 
 	if (private->io_trigger)
@@ -303,8 +303,8 @@ static int vfio_ccw_chp_event(struct subchannel *sch,
 		return 0;
 
 	trace_vfio_ccw_chp_event(private->sch->schid, mask, event);
-	VFIO_CCW_MSG_EVENT(2, "%pUl (%x.%x.%04x): mask=0x%x event=%d\n",
-			   mdev_uuid(private->mdev), sch->schid.cssid,
+	VFIO_CCW_MSG_EVENT(2, "%s (%x.%x.%04x): mask=0x%x event=%d\n",
+			   dev_name(private->vdev.dev), sch->schid.cssid,
 			   sch->schid.ssid, sch->schid.sch_no,
 			   mask, event);
 
diff --git a/drivers/s390/cio/vfio_ccw_fsm.c b/drivers/s390/cio/vfio_ccw_fsm.c
index 302215090b9ac7..df1490943b20ec 100644
--- a/drivers/s390/cio/vfio_ccw_fsm.c
+++ b/drivers/s390/cio/vfio_ccw_fsm.c
@@ -245,7 +245,6 @@ static void fsm_io_request(struct vfio_ccw_private *private,
 	union orb *orb;
 	union scsw *scsw = &private->scsw;
 	struct ccw_io_region *io_region = private->io_region;
-	struct mdev_device *mdev = private->mdev;
 	char *errstr = "request";
 	struct subchannel_id schid = get_schid(private);
 
@@ -258,32 +257,30 @@ static void fsm_io_request(struct vfio_ccw_private *private,
 		/* Don't try to build a cp if transport mode is specified. */
 		if (orb->tm.b) {
 			io_region->ret_code = -EOPNOTSUPP;
-			VFIO_CCW_MSG_EVENT(2,
-					   "%pUl (%x.%x.%04x): transport mode\n",
-					   mdev_uuid(mdev), schid.cssid,
-					   schid.ssid, schid.sch_no);
+			VFIO_CCW_MSG_EVENT(
+				2, "%s (%x.%x.%04x): transport mode\n",
+				dev_name(private->vdev.dev), schid.cssid,
+				schid.ssid, schid.sch_no);
 			errstr = "transport mode";
 			goto err_out;
 		}
-		io_region->ret_code = cp_init(&private->cp, mdev_dev(mdev),
+		io_region->ret_code = cp_init(&private->cp, private->vdev.dev,
 					      orb);
 		if (io_region->ret_code) {
-			VFIO_CCW_MSG_EVENT(2,
-					   "%pUl (%x.%x.%04x): cp_init=%d\n",
-					   mdev_uuid(mdev), schid.cssid,
-					   schid.ssid, schid.sch_no,
-					   io_region->ret_code);
+			VFIO_CCW_MSG_EVENT(2, "%s (%x.%x.%04x): cp_init=%d\n",
+					   dev_name(private->vdev.dev),
+					   schid.cssid, schid.ssid,
+					   schid.sch_no, io_region->ret_code);
 			errstr = "cp init";
 			goto err_out;
 		}
 
 		io_region->ret_code = cp_prefetch(&private->cp);
 		if (io_region->ret_code) {
-			VFIO_CCW_MSG_EVENT(2,
-					   "%pUl (%x.%x.%04x): cp_prefetch=%d\n",
-					   mdev_uuid(mdev), schid.cssid,
-					   schid.ssid, schid.sch_no,
-					   io_region->ret_code);
+			VFIO_CCW_MSG_EVENT(
+				2, "%s (%x.%x.%04x): cp_prefetch=%d\n",
+				dev_name(private->vdev.dev), schid.cssid,
+				schid.ssid, schid.sch_no, io_region->ret_code);
 			errstr = "cp prefetch";
 			cp_free(&private->cp);
 			goto err_out;
@@ -292,28 +289,25 @@ static void fsm_io_request(struct vfio_ccw_private *private,
 		/* Start channel program and wait for I/O interrupt. */
 		io_region->ret_code = fsm_io_helper(private);
 		if (io_region->ret_code) {
-			VFIO_CCW_MSG_EVENT(2,
-					   "%pUl (%x.%x.%04x): fsm_io_helper=%d\n",
-					   mdev_uuid(mdev), schid.cssid,
-					   schid.ssid, schid.sch_no,
-					   io_region->ret_code);
+			VFIO_CCW_MSG_EVENT(
+				2, "%s (%x.%x.%04x): fsm_io_helper=%d\n",
+				dev_name(private->vdev.dev), schid.cssid,
+				schid.ssid, schid.sch_no, io_region->ret_code);
 			errstr = "cp fsm_io_helper";
 			cp_free(&private->cp);
 			goto err_out;
 		}
 		return;
 	} else if (scsw->cmd.fctl & SCSW_FCTL_HALT_FUNC) {
-		VFIO_CCW_MSG_EVENT(2,
-				   "%pUl (%x.%x.%04x): halt on io_region\n",
-				   mdev_uuid(mdev), schid.cssid,
+		VFIO_CCW_MSG_EVENT(2, "%s (%x.%x.%04x): halt on io_region\n",
+				   dev_name(private->vdev.dev), schid.cssid,
 				   schid.ssid, schid.sch_no);
 		/* halt is handled via the async cmd region */
 		io_region->ret_code = -EOPNOTSUPP;
 		goto err_out;
 	} else if (scsw->cmd.fctl & SCSW_FCTL_CLEAR_FUNC) {
-		VFIO_CCW_MSG_EVENT(2,
-				   "%pUl (%x.%x.%04x): clear on io_region\n",
-				   mdev_uuid(mdev), schid.cssid,
+		VFIO_CCW_MSG_EVENT(2, "%s (%x.%x.%04x): clear on io_region\n",
+				   dev_name(private->vdev.dev), schid.cssid,
 				   schid.ssid, schid.sch_no);
 		/* clear is handled via the async cmd region */
 		io_region->ret_code = -EOPNOTSUPP;
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 38ab5c1f25ec09..23004e67c492f6 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -95,11 +95,9 @@ static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 	vfio_init_group_dev(&private->vdev, &mdev->dev,
 			    &vfio_ccw_dev_ops);
 
-	private->mdev = mdev;
-
-	VFIO_CCW_MSG_EVENT(2, "mdev %pUl, sch %x.%x.%04x: create\n",
-			   mdev_uuid(mdev), private->sch->schid.cssid,
-			   private->sch->schid.ssid,
+	VFIO_CCW_MSG_EVENT(2, "mdev %s, sch %x.%x.%04x: create\n",
+			   dev_name(private->vdev.dev),
+			   private->sch->schid.cssid, private->sch->schid.ssid,
 			   private->sch->schid.sch_no);
 
 	ret = vfio_register_group_dev(&private->vdev);
@@ -110,7 +108,6 @@ static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 
 err_init:
 	vfio_uninit_group_dev(&private->vdev);
-	private->mdev = NULL;
 	return ret;
 }
 
@@ -118,14 +115,13 @@ static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
 {
 	struct vfio_ccw_private *private = dev_get_drvdata(mdev->dev.parent);
 
-	VFIO_CCW_MSG_EVENT(2, "mdev %pUl, sch %x.%x.%04x: remove\n",
-			   mdev_uuid(mdev), private->sch->schid.cssid,
-			   private->sch->schid.ssid,
+	VFIO_CCW_MSG_EVENT(2, "mdev %s, sch %x.%x.%04x: remove\n",
+			   dev_name(private->vdev.dev),
+			   private->sch->schid.cssid, private->sch->schid.ssid,
 			   private->sch->schid.sch_no);
 
 	vfio_unregister_group_dev(&private->vdev);
 	vfio_uninit_group_dev(&private->vdev);
-	private->mdev = NULL;
 }
 
 static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_ccw_private.h
index bbc97eb9d9c6fc..67ee9c624393b0 100644
--- a/drivers/s390/cio/vfio_ccw_private.h
+++ b/drivers/s390/cio/vfio_ccw_private.h
@@ -72,7 +72,6 @@ struct vfio_ccw_crw {
  * @sch: pointer to the subchannel
  * @state: internal state of the device
  * @completion: synchronization helper of the I/O completion
- * @mdev: pointer to the mediated device
  * @nb: notifier for vfio events
  * @io_region: MMIO region to input/output I/O arguments/results
  * @io_mutex: protect against concurrent update of I/O regions
@@ -95,7 +94,6 @@ struct vfio_ccw_private {
 	struct subchannel	*sch;
 	int			state;
 	struct completion	*completion;
-	struct mdev_device	*mdev;
 	struct notifier_block	nb;
 	struct ccw_io_region	*io_region;
 	struct mutex		io_mutex;
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index 819eaf98ffac73..ea59610d45fd89 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -158,10 +158,6 @@ static inline void mdev_set_drvdata(struct mdev_device *mdev, void *data)
 {
 	mdev->driver_data = data;
 }
-static inline const guid_t *mdev_uuid(struct mdev_device *mdev)
-{
-	return &mdev->uuid;
-}
 
 extern struct bus_type mdev_bus_type;
 
-- 
2.33.0

