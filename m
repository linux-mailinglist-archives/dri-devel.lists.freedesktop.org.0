Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A60541F3DB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11456EEA7;
	Fri,  1 Oct 2021 17:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796E06EE94;
 Fri,  1 Oct 2021 17:52:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ja5oLVQG+d4lHvrz9d9b94sh4TUn7mhlwX0rtdZAMYdaEIeYEixuXniDxy1783vjZzU7kTSzDZxyXwbOQXaZTh4culfJ+51xNxTGN3on1QgKzTz9yK3u9xqn8lHPZfm7IyNMeetrwa2axrmehgGm/ZuBoTIx2rx/fdcGOlQa9G0q5gekKNscWkH3tF0e0DXdKWi1V1i5poHsTn+V5jAtBS78FwBsG8eV9bkdghLcE9ut12lToHdisx4JUzDpwrt5RrL4R4lnKFPPzZG2JsbQ4j3iGEaHwgiw7lT8AQSUSKC5omBEWa8bClxgPbyP/+LCpsNnOEdIJpvzv+X2lSJDxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTh6ZUm2PrgORCNyCbn+2r3MpGIT/x7JNE9sdNM2aA8=;
 b=hv11hZzKoABxKudnyI74NBAwHIFDJ5YRUPJfjuY2d3aU380gFZTaELeyG5ssQ+XrFzAknvs5YumCXookENBRnXdMKdFEGCzkUkEBglyayIUG9MhgYLlNVtpFVPvpc1HJ4BIjlM9UuDw4guXTM92UauO5rI1iGzo9GDXEcWo1g/k1Idm45VvZXtKIPywPhSntLlFnFH0+ylB8ruKO+uknoymXuXTBGSc08b0VuSbbcxiZXu+0C7u+hTsMN9Mt5fkfSmqomVHHZla52DFrHhmV0eSdBemBTcibIgoiCgujNQU9wkKhPzsrPNpgAJMX25B5DsHnk6NVWcjX0I9dUeB18Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTh6ZUm2PrgORCNyCbn+2r3MpGIT/x7JNE9sdNM2aA8=;
 b=K7HkYFW7jun+CwGwq0fl53dyXWIUuWhXUDMdjBgJg61RSRUFoXva92FsHn9wlCn0d7E/HutYzBQCsRh5prdJZPALmWLZrzWWA/K4VavcdttJc5BzxQ+ktEkNfVCTwY8IdihLLLt1NBb5cA374SU38cTDumWGsNJ4uNE/if8jI6vuo/X7kB/IStAgIUKf4GS0ZOQvV8QR5AwCZYIj966a4IOwW8g1wfChsp7XJx9ckygUTrArbX7Ea8U87QdNOJMR44hlcQLoeHhJ1ywtth8dtzqYw6ylBj0Rb7TTDx4GrZrvykek7RVD2vU9aReEgyNNC6dine/s5LAAYavVE5dSZg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5207.namprd12.prod.outlook.com (2603:10b6:208:318::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 17:52:56 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 17:52:56 +0000
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
Subject: [PATCH v3 02/10] vfio/ccw: Use functions for alloc/free of the
 vfio_ccw_private
Date: Fri,  1 Oct 2021 14:52:43 -0300
Message-Id: <2-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0120.namprd03.prod.outlook.com
 (2603:10b6:208:32a::35) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BLAPR03CA0120.namprd03.prod.outlook.com (2603:10b6:208:32a::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 17:52:53 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mWMiK-009894-1G; Fri, 01 Oct 2021 14:52:52 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f54df12-0501-4ed7-f9c4-08d985044b2a
X-MS-TrafficTypeDiagnostic: BL1PR12MB5207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5207FEC8BBF479BA779A7CB9C2AB9@BL1PR12MB5207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EJiL5d5lrpuqAOIFj2wG6wJ0TQYuk6i/EO9wxI3f6dHR3cgsFXDke20wz/XqNcHsyYlltwxfzLEFtyYDkd958188Sz7iUhEJpIbngMGcxpefcVTnNoE6tNd1tK0YgyDZkg5d6fMNuZJunNkeNH1Dlrv8tM/YNHk8YAP+5ZDfKUA4lO4yDdo5TNbKfeswuRpwM3IpkGZ1UhoIiuSq6YTfurVFzGDOvgbkAZP6UsIh6UATRe5YuF2X5dAuvQTiHG1dZ/9gZpjyPxMDKk5n3bm4riJ29MSHKkpUQlHb6ZalBtiHnui82+br0qtxtp6Do18TNs/3QnAIkN7N0sX5Q5xt/Ln+chmkLB3ASGZhZCTlufupQQ0KgUMgnrADTpEHxER2MIQ84zPo9KtMV8s0eqWH4hGJUvnQaikBFTjw3Jr+xB3MITjHbpYvO/LZzzReVid2jqH681F2wrdNAeZHoq89bxhA1OqwtICdaZLZEBUIidgB61Lk9pcNvH9qXkuO8SoTX/Lyglz8ZHTB3Bt/pxXEc1QShum1PqSq8A9v8T/k3AgbVqoxOAGvfAdIJKZbFaOZxpD0Oifpt5K2Pz45AoNohnf74H/E28vC72G+NZVsUxsUJnw5Z2iW/FhT87L/b0BSTfUhC9A6GbwXZt//5hmgTnBEh9GKRmNv5XPGwHjGCHIjYiRjtvmNKgmjTSmfX+5+dDhM8BGYvsY2UQ2GQKJ/Aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(2906002)(83380400001)(66556008)(8676002)(38100700002)(66476007)(5660300002)(2616005)(508600001)(426003)(9786002)(26005)(186003)(6666004)(9746002)(54906003)(36756003)(7416002)(4326008)(110136005)(86362001)(8936002)(921005)(316002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PJqfE9lx2vWXLo9xJiO7ojLm2MA89maNkUlO6vr/UTYBz5a3S6Fw52zAziw2?=
 =?us-ascii?Q?bOGDKIzUoFCtk9ryFRAOPfc+wNnEGXMXDIN/8h1T/mgR1SuKaC6IHCg28Y43?=
 =?us-ascii?Q?66Wu8wrrZGB0P/EBVQi9d/G3hd35Xu0KxHo5jh2v30QLo9TrkauoKeMjl2Hx?=
 =?us-ascii?Q?uWObQaVS0CN4I2pa5ruEg44wxn//GThNE7+vIV/Cou3pywg4IHzNwtLiN0yj?=
 =?us-ascii?Q?MQQqSLIs4NkK3AycH3AECYjeUyt3l95jFOI/to1UUTj/U/w78eS2b2zi1Zxr?=
 =?us-ascii?Q?4dZ0PhYBu6fX/leAPtpsaq6yHP1khe+pP7F9sNZEAzYHXu2Ev8rY2aNfzZ4I?=
 =?us-ascii?Q?GTWZ3wMYaUHVZnl1wkwyw2DDmRy33co05g8UwujNxn+9CDb3aqLupK9ICKbX?=
 =?us-ascii?Q?qv0mvM/iWXi7TPuWJeAgywxzwWUQB6GyvqUKVf2n+wgCXlaefiZzfAv4f7zQ?=
 =?us-ascii?Q?EF7Mr6e47jBhNuzxI1nyDrg5AusN3MgoYlexRIPeFfSv/JejCYfscENqYUYW?=
 =?us-ascii?Q?jmeFuvdj7sF8qRUbHVe0hSR3e2VsVDe753A5PgpCN7A1nkUYggq+gb9RfrHC?=
 =?us-ascii?Q?pH35v2sFGebuviHga2V3PTHrlwd0ut8JM0+wuwb3rYgkjLzMYYhyFG4ZLWr7?=
 =?us-ascii?Q?MtcW6csCrSeIN/Uym4GTtkOq4K5B4uh0+DrbJkoNizfGKLz8XArcMLmhcbY0?=
 =?us-ascii?Q?O79D95T9v8z5prGyXCpGe9kpc3dvvkwQ1O2CfGuyImGIgSVAmMhFnS5eWVO7?=
 =?us-ascii?Q?UlPAd+5AuqiaYXmatL9dhTqRY6r7k9fPemX1RerdTjvZtkY48ZauzEa2SrYN?=
 =?us-ascii?Q?jGxvMtx1cxNjrqB8Z2+M6DmSsyEnO0kitYTComJ6JWpPYIc8Wq3cAY3Y5k4P?=
 =?us-ascii?Q?wSjQoMOKlcTBu5K51mZhjn8iERXeS+pH8YQUuxYSFTywnzMSBVJcimyVlNct?=
 =?us-ascii?Q?gRpNcUY9EoJEVzDu6R6I4MzpC4m5zKDBjzkGzbH1G+SKcncTx2F8jSWKg/QY?=
 =?us-ascii?Q?eBIF45TKqIwERu9qRNoV7pWUww9CCkv5cd7B1bfvjGXLgLqMx0hEwld9xJIV?=
 =?us-ascii?Q?bBWgISt82uRZdGUa3XNK4NgaVvkwyymKUf7h3pXBapTegMIJtJ6403XM4JYf?=
 =?us-ascii?Q?ZDamSL+loNvYam9LbCFds1uVSi61fzBYdSn/ScKXHGU5Nh8D0btAN6gh8yWG?=
 =?us-ascii?Q?4QMNY6nz2C19sXTx4PGdPy6YVTYgiEWcVKkhOHkNZ3TWX88Y0SCo9ouzsmyP?=
 =?us-ascii?Q?QuLAK5J/A4fF5b/oPtlWCt6TvNNEHPC+2l28NjxsT7Yxfd6LcvM6NwtLeIY7?=
 =?us-ascii?Q?g2RNilW11R9tMJcUOMbEs3lZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f54df12-0501-4ed7-f9c4-08d985044b2a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 17:52:53.9018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aT83wcHhlLaiQc4MP99HGsApswU6MsocYsvyoThAZ4/N/UAV0SDd0zIpdcrqDGNj
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

Makes the code easier to understand what is memory lifecycle and what is
other stuff.

Reviewed-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_drv.c | 137 ++++++++++++++++++--------------
 1 file changed, 78 insertions(+), 59 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index 371558ec92045d..e32678a71644fb 100644
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
+	private = kzalloc(sizeof(*private), GFP_KERNEL);
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
 
-	private = kzalloc(sizeof(*private), GFP_KERNEL);
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
 
 static void vfio_ccw_sch_remove(struct subchannel *sch)
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

