Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F43405D74
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 21:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D4B6E906;
	Thu,  9 Sep 2021 19:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51326E902;
 Thu,  9 Sep 2021 19:38:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZV4BbcYxOpltNyhU8EkgLTA6ppag/sfzUYt6d+xyEFZJaWi7k/J0A+srBZOQ8BZJ+D4cPjTDzeytTwGXmoy5fByg72XGgCbfoOqjWSi9iWO3KQ61BgLNLaxLLLhU6COVSNgJkJX8YIDPVr/lsp8OspTWKCvYWXPaZV2YZH25/0mNlauHfpP0ZC3rl69zS1ysrIjgSXAkvTkzNnLBe6s7QK+m+SasprY5uhd7auVEtRTsNHq0oTx1PHEFVlduBg94RjB526GZFPKjBYU+ymq38G+Ky2bIItw+/l0gU65lgXdKc/gwkRb3FlclXBFwN1jkkd5QS91fPJkeiVKngton7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=t+aqtnffIc+ODHGNQ+ZcN7HzL9sugI+shny/gi5cWVI=;
 b=cOcECrOlf/ouX9sxILVhY6L3HHqMz++349czXMwgIqAwXCzRrUbfymKlORIDtq7mQ36Ghhy2k1ZylzBhqTNhUeX5dZSj3jVRvoAp51lKm8f4np0aF9wh5bYpE5v/GTfBQ/n7mi3ftcmylMy+DNSb0ZwP1w5iERp6IxrBGoXt3JTt/PfLmvFgtTFTCGenuPTsqbd77oHUgJwW309qLMLtrhrcnhBRC+orCpsHH5E9vPQtKhkMWTePq4wDp3INJkMPazzMbh2BrcVXMjryOTU5OPLWPo+yUU/qw3mOEoSX4mOGa2fno6puRLMkRFGrCM7aZZMTZR9rEgr5jRYkVfZ5aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+aqtnffIc+ODHGNQ+ZcN7HzL9sugI+shny/gi5cWVI=;
 b=DEQgAjSQiPas9GodyYherLxQlGcvDhYuHHdIUZTedj+3u2S8iDJccFYHppc/imRCLgWUutNAlBkv2Lm8WPIY5dYXvoPhJpu1efsQGL2YMZiGv8rRoxVDprqP9Y9lKEH//JGLrlmRLNVq9cAa/GfAm3V+a4kq2NC98djqlA2wbkQ6gH3S70tu6esfgezlfuz7XSHa92etLUPFx24bfoj3wGfKSMiTi397btoVaXrnURPvHeJoIixi+ADgihL+UIyrXDxfneI8WcoDAhZ8+70Mo0qeZ2P+hqd9dhr0KPhU7dt5XEbEzNOZlvLbmmXajg0h+NdFfxXjgw83SSr68ebMyg==
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
Subject: [PATCH v2 1/9] vfio/ccw: Use functions for alloc/free of the
 vfio_ccw_private
Date: Thu,  9 Sep 2021 16:38:41 -0300
Message-Id: <1-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0014.prod.exchangelabs.com
 (2603:10b6:207:18::27) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR0102CA0014.prod.exchangelabs.com (2603:10b6:207:18::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 19:38:50 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mOPsn-00FLEm-Er; Thu, 09 Sep 2021 16:38:49 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a03f67ff-0235-4be2-3ef3-08d973c972e6
X-MS-TrafficTypeDiagnostic: BL0PR12MB5554:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB55545178AAAD380673D3F048C2D59@BL0PR12MB5554.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iymeWsxLJn+yW2wA9SXFOULJHJB4n6It2iQ+aHsEezN+d0e6SIfO/zitVmGYTQyB1TanFXDQjrzBmoepbhck5NLaB4OB3A8+MtubPyicW/fisOLrcKErKifwNUydIqtKPwzNjj6it9AmKZnieQ4TrhRP5Yc1OgQ5kii1jXDpbCcrQIshEpzP8vWeJkkAZZScKv9uGxyGN8ZRHaorxLc70Vdsr12PRwsp3oFb1z1JvmlwzdBID9nQEOCo3CeTgzfDwbuwe3uvpcPMxyS3tVtM9tQ9EMJ0BNFgTNefDFl7ZGMIAd9x/5I7XZdFRFyFxYJamGExwpaw7ENvf+BRelyhJFfAwn6Vk+ie2ER4h45butQV97dDPzFlwAW34drlengpWXtO6EOjXqj7z+o/9vJSy5IL7YVAfv0Tcvy0PPlrpGq4Hzps6TBV4TWXDe2PhOUcob75lV4nOAwacU+WMUEXC/fi0znOhAtPNyKz0lyQK2/NZnWRQwXvonF61q7i4lleoa1Aa1KCtqDDYybT0W7PGoHeq5VnN3LLMfHHAjfXEotcoTAKpd2ODbWbjN8MkD2Y+gKoZRFmOHgRWkXkyGn50dCEtoSpiDeiyPB66mt/EKXFSgxSw8cAIGsLkWwIS3LslB/R3OUswu3CHRsal5/YOtJ2Z7+e3IZntvQmSJ4UhcRxpS1apvoUjUXGVstiJyNAGWbjMVc0rKUV5/SyP9YOlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(26005)(4326008)(2616005)(66556008)(921005)(66476007)(426003)(66946007)(9746002)(9786002)(5660300002)(186003)(83380400001)(86362001)(508600001)(8936002)(6666004)(110136005)(38100700002)(36756003)(316002)(8676002)(2906002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ys1Qt640n+Gtp5z6GkIm0GpkINRpw8hap1axFqpOK93Fz4Kmo7JrDOvGcTAN+rB8zhTTHpWnqql37mmwr0I4+aUmELsRHJCz6gn4/jHC0T2qBHl/hiSp6BmP53OYeT5A71CyuEdadXdgYOVmGxlUFlqeZMsgm1vB7Bu/EXv71fibAYmJWpUPuPqhfMKbe8XkbJ7aMAQmet0fh86enA4teNtPNvpOhjfYQpr8T58tzMaZPNUcF02ZQjjH8h7lo4XKg8Z8XcWokkCst85/jkOQ1ffakUoX2sUWiD2gV/FBOqZWURcdW+2+Nci1/q4Glm6wnzajFgcANj+/FLUbDKqnx1Qp3NQhSpNoQNG5cyFfrFbYFCv+PgIFlEIPFN7CFPHFLqNXGTznEnmulSHf3hTYAN0CS+VLagdnoTc5K/yz/cnA01PkxG/feQMTR/ncbfiixz6zwih+FqhVjafNrRpMBL7h9Dxd6a/61O0ekkPw47lmlIM6IJDA+I+hpHdURZ8R6NNYfM5B00NyNU8ICY6qXTnqFiKa+vAuTgVdVhxFrlF5NbdoYwHmo5W/vJ6C0PHCofp05xP2lPyfGOCjSOB3/TTRApkGMwmVTVG8ISmznxLMo4Om36N4Dy4tWDf2Fxnhh1aNGK5SdmKlV0sOiDspbL1SzlAmaf9tb6c1BPFWcXncRcyz6OWCuqxg7LXVagvCrw43jCIER7IbwPwIv4W+eXRPZyWSc9SGeTDLxPicfOL11vvBYzTWTDatUKGo+CPu
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a03f67ff-0235-4be2-3ef3-08d973c972e6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 19:38:50.6244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7PuTAAcT6OCdIXxlh/p7Qbt91D4vWrmUfUs9v5mQLkbTEziRYvRqRsp/2OLeJvBF
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

Makes the code easier to understand what is memory lifecycle and what is
other stuff.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_drv.c | 137 ++++++++++++++++++--------------
 1 file changed, 78 insertions(+), 59 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index 9b61e9b131ade0..1e8d3151e5480e 100644
--- a/drivers/s390/cio/vfio_ccw_drv.c
+++ b/drivers/s390/cio/vfio_ccw_drv.c
@@ -137,16 +137,80 @@ static void vfio_ccw_sch_irq(struct subchannel *sch)
 	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_INTERRUPT);
 }
 
-static void vfio_ccw_free_regions(struct vfio_ccw_private *private)
+static struct vfio_ccw_private *vfio_ccw_alloc_private(struct subchannel *sch)
 {
-	if (private->crw_region)
-		kmem_cache_free(vfio_ccw_crw_region, private->crw_region);
-	if (private->schib_region)
-		kmem_cache_free(vfio_ccw_schib_region, private->schib_region);
-	if (private->cmd_region)
-		kmem_cache_free(vfio_ccw_cmd_region, private->cmd_region);
-	if (private->io_region)
-		kmem_cache_free(vfio_ccw_io_region, private->io_region);
+	struct vfio_ccw_private *private;
+
+	private = kzalloc(sizeof(*private), GFP_KERNEL | GFP_DMA);
+	if (!private)
+		return ERR_PTR(-ENOMEM);
+
+	private->sch = sch;
+	mutex_init(&private->io_mutex);
+	private->state = VFIO_CCW_STATE_NOT_OPER;
+	INIT_LIST_HEAD(&private->crw);
+	INIT_WORK(&private->io_work, vfio_ccw_sch_io_todo);
+	INIT_WORK(&private->crw_work, vfio_ccw_crw_todo);
+	atomic_set(&private->avail, 1);
+
+	private->cp.guest_cp = kcalloc(CCWCHAIN_LEN_MAX, sizeof(struct ccw1),
+				       GFP_KERNEL);
+	if (!private->cp.guest_cp)
+		goto out_free_private;
+
+	private->io_region = kmem_cache_zalloc(vfio_ccw_io_region,
+					       GFP_KERNEL | GFP_DMA);
+	if (!private->io_region)
+		goto out_free_cp;
+
+	private->cmd_region = kmem_cache_zalloc(vfio_ccw_cmd_region,
+						GFP_KERNEL | GFP_DMA);
+	if (!private->cmd_region)
+		goto out_free_io;
+
+	private->schib_region = kmem_cache_zalloc(vfio_ccw_schib_region,
+						  GFP_KERNEL | GFP_DMA);
+
+	if (!private->schib_region)
+		goto out_free_cmd;
+
+	private->crw_region = kmem_cache_zalloc(vfio_ccw_crw_region,
+						GFP_KERNEL | GFP_DMA);
+
+	if (!private->crw_region)
+		goto out_free_schib;
+	return private;
+
+out_free_schib:
+	kmem_cache_free(vfio_ccw_schib_region, private->schib_region);
+out_free_cmd:
+	kmem_cache_free(vfio_ccw_cmd_region, private->cmd_region);
+out_free_io:
+	kmem_cache_free(vfio_ccw_io_region, private->io_region);
+out_free_cp:
+	kfree(private->cp.guest_cp);
+out_free_private:
+	mutex_destroy(&private->io_mutex);
+	kfree(private);
+	return ERR_PTR(-ENOMEM);
+}
+
+static void vfio_ccw_free_private(struct vfio_ccw_private *private)
+{
+	struct vfio_ccw_crw *crw, *temp;
+
+	list_for_each_entry_safe(crw, temp, &private->crw, next) {
+		list_del(&crw->next);
+		kfree(crw);
+	}
+
+	kmem_cache_free(vfio_ccw_crw_region, private->crw_region);
+	kmem_cache_free(vfio_ccw_schib_region, private->schib_region);
+	kmem_cache_free(vfio_ccw_cmd_region, private->cmd_region);
+	kmem_cache_free(vfio_ccw_io_region, private->io_region);
+	kfree(private->cp.guest_cp);
+	mutex_destroy(&private->io_mutex);
+	kfree(private);
 }
 
 static int vfio_ccw_sch_probe(struct subchannel *sch)
@@ -161,53 +225,19 @@ static int vfio_ccw_sch_probe(struct subchannel *sch)
 		return -ENODEV;
 	}
 
-	private = kzalloc(sizeof(*private), GFP_KERNEL | GFP_DMA);
-	if (!private)
-		return -ENOMEM;
+	private = vfio_ccw_alloc_private(sch);
+	if (IS_ERR(private))
+		return PTR_ERR(private);
 
-	private->cp.guest_cp = kcalloc(CCWCHAIN_LEN_MAX, sizeof(struct ccw1),
-				       GFP_KERNEL);
-	if (!private->cp.guest_cp)
-		goto out_free;
-
-	private->io_region = kmem_cache_zalloc(vfio_ccw_io_region,
-					       GFP_KERNEL | GFP_DMA);
-	if (!private->io_region)
-		goto out_free;
-
-	private->cmd_region = kmem_cache_zalloc(vfio_ccw_cmd_region,
-						GFP_KERNEL | GFP_DMA);
-	if (!private->cmd_region)
-		goto out_free;
-
-	private->schib_region = kmem_cache_zalloc(vfio_ccw_schib_region,
-						  GFP_KERNEL | GFP_DMA);
-
-	if (!private->schib_region)
-		goto out_free;
-
-	private->crw_region = kmem_cache_zalloc(vfio_ccw_crw_region,
-						GFP_KERNEL | GFP_DMA);
-
-	if (!private->crw_region)
-		goto out_free;
-
-	private->sch = sch;
 	dev_set_drvdata(&sch->dev, private);
-	mutex_init(&private->io_mutex);
 
 	spin_lock_irq(sch->lock);
-	private->state = VFIO_CCW_STATE_NOT_OPER;
 	sch->isc = VFIO_CCW_ISC;
 	ret = cio_enable_subchannel(sch, (u32)(unsigned long)sch);
 	spin_unlock_irq(sch->lock);
 	if (ret)
 		goto out_free;
 
-	INIT_LIST_HEAD(&private->crw);
-	INIT_WORK(&private->io_work, vfio_ccw_sch_io_todo);
-	INIT_WORK(&private->crw_work, vfio_ccw_crw_todo);
-	atomic_set(&private->avail, 1);
 	private->state = VFIO_CCW_STATE_STANDBY;
 
 	ret = vfio_ccw_mdev_reg(sch);
@@ -228,31 +258,20 @@ static int vfio_ccw_sch_probe(struct subchannel *sch)
 	cio_disable_subchannel(sch);
 out_free:
 	dev_set_drvdata(&sch->dev, NULL);
-	vfio_ccw_free_regions(private);
-	kfree(private->cp.guest_cp);
-	kfree(private);
+	vfio_ccw_free_private(private);
 	return ret;
 }
 
 static int vfio_ccw_sch_remove(struct subchannel *sch)
 {
 	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
-	struct vfio_ccw_crw *crw, *temp;
 
 	vfio_ccw_sch_quiesce(sch);
-
-	list_for_each_entry_safe(crw, temp, &private->crw, next) {
-		list_del(&crw->next);
-		kfree(crw);
-	}
-
 	vfio_ccw_mdev_unreg(sch);
 
 	dev_set_drvdata(&sch->dev, NULL);
 
-	vfio_ccw_free_regions(private);
-	kfree(private->cp.guest_cp);
-	kfree(private);
+	vfio_ccw_free_private(private);
 
 	VFIO_CCW_MSG_EVENT(4, "unbound from subchannel %x.%x.%04x\n",
 			   sch->schid.cssid, sch->schid.ssid,
-- 
2.33.0

