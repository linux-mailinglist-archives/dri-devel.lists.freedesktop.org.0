Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8EE40AF07
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 15:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B25289CBA;
	Tue, 14 Sep 2021 13:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BEC989CBA;
 Tue, 14 Sep 2021 13:36:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOZMQrmLhjFqrLRH0jxWFS8ztF2I+s+JBNFqEXe48GmgQgloAJ9rBnkGNhu/mnMY/Axs3JHYZg4GZ3ERs+fnxvcYS87BcWqP06USVL2o/fAiXbAePUcQjh/j0AkpaTYF23JfSz12K5VT8I8k9xK1gVdDAyMezdicijkqcY94KQVia9MWKsoGg75qzoJHksL6b9rLdVoYfKMKRO4UVDX+CmSXwbqk0c2hN9ET56epyLRNjRDNcp/X1KDE9SxSys4r9YTxdDHhVHk9bww72Tzj1bcnXPUnNIsyIgHOCCF5SzuAL3bAUXqXcxPsAq7eBhyZC7ZC2g9E/d7v3dkOd9PO2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=m7svKHLeFVgZcot8Pccz19hRmbMN5FrpOxPpmf/+WoQ=;
 b=FDE6g4RIc/WPoiHOX2Dr4DSex7fGcKSeLMuWllj2M8wCASzbx5Vrn5agUIYAcR3KzGGdMhQItwkCW36ZvKoDwzR9egcOFU+m80tsfcDkyoNyxa5fxYXxIh7r1Gr2P2Nbd9/skFVeMjq8oCHb8p3O3GP97qpDVOg6bcrURwIVPWfWe05LnB1r0iE1oNFyTzMnmRjU3SEABDMkD2ripSKrJhIJ2ecH3CCDm1m3E9+xMvFTv7mMleK08gxJOeLYsipgRCJWRL95NDIyXqgAvPzvVVt3+FI8xSrBdGtSwuE9Ag6MnBYBEDeeIdITgG6259efF/0Al7DS3ki9LKSlL2Ivew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7svKHLeFVgZcot8Pccz19hRmbMN5FrpOxPpmf/+WoQ=;
 b=iYgDr/Bkuccisrdhccog+nyjLdm1wF5RTOK6EtBJzOrNFjgQNA+ALGIUV6Kc+wkHA310vR5I8LC44lJB4wxUSEeROGc3x068gJQUIZzVosKbv40S2LaXcRS2ad9N9eUvo3fON5xLS5HdWYH5mv+q0aGIKMATBzZPQG6AEMBEJ6h0LDFYLgo2c4AkGz77+Rze3rLxOU7+EAoGnnK4IOfDkOkkxhotDQ4T/kpfzd8eVNrr9nBRga0XmyjcHhLGRUvzhFZy+gj+4VIQ0hZdsPkCd0uL4GM3F+M2qHXSZcmai2X1eafsJiX0k77QgxXUOSWvD16NwsBUAAjLdEgcITK2aw==
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5239.namprd12.prod.outlook.com (2603:10b6:208:315::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 13:36:20 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 13:36:20 +0000
Date: Tue, 14 Sep 2021 10:36:18 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Eric Farman <farman@linux.ibm.com>
Cc: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 kvm@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 0/9] Move vfio_ccw to the new mdev API
Message-ID: <20210914133618.GD4065468@nvidia.com>
References: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
 <1e431e58465b86430d02d429c86c427f7088bf1f.camel@linux.ibm.com>
 <20210913192407.GZ2505917@nvidia.com>
 <6f55044373dea4515b831957981bbf333e03de59.camel@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f55044373dea4515b831957981bbf333e03de59.camel@linux.ibm.com>
X-ClientProxiedBy: BL1PR13CA0344.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::19) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0344.namprd13.prod.outlook.com (2603:10b6:208:2c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.9 via Frontend
 Transport; Tue, 14 Sep 2021 13:36:19 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mQ8bi-000HwG-O8; Tue, 14 Sep 2021 10:36:18 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8b33a51-5bb2-4f1a-0250-08d97784a28d
X-MS-TrafficTypeDiagnostic: BL1PR12MB5239:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5239AEE4BCD8C442D322F461C2DA9@BL1PR12MB5239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P9l/m7BeRNLVKC/9Yu0+1xbAZGxMfKkQOMsX+gI+g9GIet8sGecW8oz2fA6xwqJvf+S937TQ8Rju0+sLSteLWXCKKi2xYjrI7+jbEIUXdrHKxm+fG3fZf9vxcbCxPzfntaxeX8/o0ibgTrPm6/ATLo1uuwP+WtLjtJCW7ZxMNPrrtf45esAGe8hhqiWEqN3oXs1o4dmnF4qckLiLimXJ0PSUSnLvWZahHr/8LCxcEbmVN0PsQIbA05XZcU/iGTjdGpgLInKikh8W7/rHGSrqUSAEnumGb4M9lFn4xTKXU16/sxiZfTrudcc9MDo62WOlRgUVDa2u5jEKePie5cmMhdXTDEClw04XWJ2WifcH6kJbl3srwtb3JrNPghMqTSrqfYndQEaDtYZPLURz5UAUYywtTyLcjvLFfEAwvPQ2+hkgUqPLVr4I/LiUWHid7mCR12cfrAx6UqNWSLigdlKqpShnocNMRbYwjc6Vouqh5HkAuDzAbQpS0kMVeT5wzGaul/6bc+MLR/eSxgUMv4xLJeBBH3QBo/gqAXLkUblUsk8oxi22s3rjOK+Q9PETuYci8exTX9m6dXzfgaKFJeCdsKD/SnL6AzTi8jM62sHSPD1yiJFmabXxpdolZivfrdrBcAlIfhHjMux7AgxBoxX6HEt3JrNZPYoZoCFnnnBfXu1KgpTQHkkD828zodGvch/mGHQYGY6a+lnsr+21u4xlQDghQ8ULaYc/vDhqXE6XQto=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(478600001)(5660300002)(2906002)(8676002)(7416002)(4326008)(54906003)(9786002)(2616005)(83380400001)(186003)(9746002)(1076003)(36756003)(26005)(316002)(66946007)(8936002)(38100700002)(66476007)(6916009)(86362001)(33656002)(426003)(966005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BhcUgIcW5cC6tQIPDVjyMESjKwgAjdTJMkRfugPn9FYHjal/B2bu22iXElt5?=
 =?us-ascii?Q?ah+d443z1mHTk6Lv4st4IrO1uQ9ZQEsSI2IKmGZpRoKxVq74n3aW/68RxgpB?=
 =?us-ascii?Q?/7uh6vg6pP1/TnZZFMockdlvug/vSdKsyIe9zbgYnxEhLBwxb3JrI7B8VT8Z?=
 =?us-ascii?Q?GWjEmH/oV+RQ+Mfnj5/fXH2ErLmjL+aMKM/58c+ypHq3OrgwgoWj773iTihz?=
 =?us-ascii?Q?YGuYeuH9Rh3RRNm6F2FjtJ992p8zEhyriXaS85O/AT2MJO1O6rb7y9j9CfL/?=
 =?us-ascii?Q?72SrMoWv/Tks8eryCGyLiMhVUerD71hYkvN85pRUpHWSRu9G7r/L+vND0y0G?=
 =?us-ascii?Q?TGNhzLjxS8mV+RFrdRqIKQObRQLtec5wtYRLE6S2HbeQqlyiaLD8azquVmhm?=
 =?us-ascii?Q?1cKoroK9SEdckWKoFTkNgRyUbIivyMj2PvliU5ka8wci/IUN888g/2ElJzu/?=
 =?us-ascii?Q?WYMpf+Nga/qGmRTA5FrM2EcLGG3iTPuD5PuB4m4NoHdKUHumpl0vxcSEQKuQ?=
 =?us-ascii?Q?dW9uy86o+ciZVLcv4s5XelPESRaQwR9qaG0NWWrv+75bI95t8zbWjfvA2c59?=
 =?us-ascii?Q?urSPp8qimlNl9IQqiKG93qeck4bo11yb72x+TJjQkla9SfF0ZuAD7KEpSYgX?=
 =?us-ascii?Q?g9vfY17pL+MGmc1a2Qy8989HoURAB3aJJOsXNUsxXqED9TXoA77T1Z95kP0L?=
 =?us-ascii?Q?3AOq7RDP8vCu11mA/Ku3Y4ovLvn4uaxqGrK1CWPNnWgjaxu5kff2RuYE1+dj?=
 =?us-ascii?Q?oS0vAs4ikTp0uqtGr0EUqu/jhYxcoy/wAwl7e1zf/CjxkDjMh8b/SgjZQBOD?=
 =?us-ascii?Q?JMFvejA1BaLlyHU3pjd0o6E2ZSNurxl5AWp+FiRfxrNQJRltCf86DkK4DNrN?=
 =?us-ascii?Q?rib7jPur7NOmYcXTBko6o54bTVHd+ODTIdVG2aWpZ+FzDi71hMeyx119ilQa?=
 =?us-ascii?Q?kMtRt7j+8bQKYWL2Y0Uyx719eEfxOtG4CLruKxqHGvLsUs72A/3Kpe6S43Nu?=
 =?us-ascii?Q?bZ78LLRSGgnDu45BI/bCe6SH/qy02QaWbMRKfZKhZnDa8XKjwRjZpeUtGsG1?=
 =?us-ascii?Q?vutdI4VDggyS/XtnFSd7U2fLATf3+OurVrzIiZkzELZVdvIbZLiqvIFsWsOc?=
 =?us-ascii?Q?7zJvGKkSRxEJ9vQYyR8UU8/+YLQSFgezyEdfRTZydP2nktGgZGjzRxEWduEY?=
 =?us-ascii?Q?L3q8XLMBEuaUflV6vWVLV+2Hud8iv8wIp+keUhjQbIuiII0KLiMAw5gmyGsa?=
 =?us-ascii?Q?pwFO95Kv5Yii6DYjAGMjv5L8S7oZ4SMT+xw1qzYSViQLlK/Fgl6eu9BZHfWM?=
 =?us-ascii?Q?w6hSGHEu6sXDssmT3qnmYs9E?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b33a51-5bb2-4f1a-0250-08d97784a28d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 13:36:19.8235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zmoUApLP16KWj0x3nl5jKuTSZgWkMs0wlvnIFIuq7W2YRyizm4TnOONcex1gf99
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5239
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

On Mon, Sep 13, 2021 at 04:31:54PM -0400, Eric Farman wrote:
> > I rebased it and fixed it up here:
> > 
> > https://github.com/jgunthorpe/linux/tree/vfio_ccw
> > 
> > Can you try again?
> 
> That does address the crash, but then why is it processing a BROKEN
> event? Seems problematic. 

The stuff related to the NOT_OPER looked really wonky to me. I'm
guessing this is the issue - not sure about the pmcw.ena either..

diff --git a/drivers/s390/cio/vfio_ccw_fsm.c b/drivers/s390/cio/vfio_ccw_fsm.c
index 5ea392959c0711..0d4d4f425befac 100644
--- a/drivers/s390/cio/vfio_ccw_fsm.c
+++ b/drivers/s390/cio/vfio_ccw_fsm.c
@@ -380,29 +380,19 @@ static void fsm_open(struct vfio_ccw_private *private,
 	spin_unlock_irq(sch->lock);
 }
 
-static void fsm_close(struct vfio_ccw_private *private,
-		      enum vfio_ccw_event event)
+static int flush_sch(struct vfio_ccw_private *private)
 {
 	struct subchannel *sch = private->sch;
 	DECLARE_COMPLETION_ONSTACK(completion);
 	int iretry, ret = 0;
 
-	spin_lock_irq(sch->lock);
-	if (!sch->schib.pmcw.ena)
-		goto err_unlock;
-	ret = cio_disable_subchannel(sch);
-	if (ret != -EBUSY)
-		goto err_unlock;
-
 	iretry = 255;
 	do {
-
 		ret = cio_cancel_halt_clear(sch, &iretry);
-
 		if (ret == -EIO) {
 			pr_err("vfio_ccw: could not quiesce subchannel 0.%x.%04x!\n",
 			       sch->schid.ssid, sch->schid.sch_no);
-			break;
+			return ret;
 		}
 
 		/*
@@ -413,13 +403,28 @@ static void fsm_close(struct vfio_ccw_private *private,
 		spin_unlock_irq(sch->lock);
 
 		if (ret == -EBUSY)
-			wait_for_completion_timeout(&completion, 3*HZ);
+			wait_for_completion_timeout(&completion, 3 * HZ);
 
 		private->completion = NULL;
 		flush_workqueue(vfio_ccw_work_q);
 		spin_lock_irq(sch->lock);
 		ret = cio_disable_subchannel(sch);
 	} while (ret == -EBUSY);
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
 	if (ret)
 		goto err_unlock;
 	private->state = VFIO_CCW_STATE_CLOSED;
