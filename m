Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC83741F3D7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA416EE9A;
	Fri,  1 Oct 2021 17:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB7D6EE94;
 Fri,  1 Oct 2021 17:52:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6Ipy6g2Ie+f6Ai/fFNvknLR6/JkJvTNGWNdcup+9kcHUWs3FSCbqztUkNEixgpOpaKcgoBCpbAOj7KTFMUJsfyTjQ8H3M1tqipIrz6QZCZtVrW5x7Uv05VsgyLZBcOJXMROQvFu7brysVTIiBI0wNqxd1JV8VKmTokqc4US4D4uUrrWkHO7di3SVC5tIpCGeTH8kuQbq0jqZgLuwALbAymgYm7s/84s8E19a5BFaBkgHyHq/O1n8vIYl2YhRTIBVki2cBe0OIO5SH44f+aEMOI28TLKBK0irRwOUhAieDdjBOr0U6pcQtYMNUNI1T7Iru2m/TDLrYfYBaD+KSC8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnU/Ra9GYlpNTkD0q2RzRENCFZ4Unu7Hu4BQ42Gp1ls=;
 b=LQsB18vOGQXMuCQGRkAW2l9X2q3WjX1qp9c4Z4bNjIHrAsI2tt7cDZB6ljfXw5jCnS/nINDRgcuByHEkkyA+R98xSRTvp7FHb6Neh55omGh92v9ZFEiI7oQoSrKbNTFvp0h1c1UDoNsJhCVukdn/OLL15HNdlkbzUjpkukUSiala4BFStdOjOWymUUtoyRmENUHZTeV9Lq1m8OIALhOngPxKVXZvZk63OvSof3y11PxQM+/DHW5CxOwxTt5oJ8/gsA5roRHwsfFNqOgTSvVXYrsdPaV3t32ny/fAT7yYVVk2yo/LeJIrGF2zGGTPQe0GxhIPHl+OvDdwBzg7j01D1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnU/Ra9GYlpNTkD0q2RzRENCFZ4Unu7Hu4BQ42Gp1ls=;
 b=Q6UbFWLX+0StiTPzPXQ9JBj8jHjB3vKa9xfj382WVLOuSwZlgHfJ4y9Pd6g212C3cpQ3s2eHmHBKLXJFFysMFB4TlEME8f8kcbFghZaYdYUzcnVg+8GWS4EhjQpKBEh0V4JFid8quLAkHW2FrqvjeNemljxaLdZd7mrPza9i56RDmoXyWOfyqKPyPwWrmTroyigLJFWAZ3iCeSlyUSX0LOTb6WRcjleSDY1xweWs3C5SCNVG20X+ja74imWsHTZIEBX5wiHWRBppA+1+GHzMSd0fZOTu2rMKh3MVb+mDb8Z5TEUrNWS28UlMfP6niys13Yg3xykCIN6vM9JEhQlCXA==
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
Subject: [PATCH v3 08/10] vfio/ccw: Remove private->mdev
Date: Fri,  1 Oct 2021 14:52:49 -0300
Message-Id: <8-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR19CA0037.namprd19.prod.outlook.com
 (2603:10b6:208:19b::14) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR19CA0037.namprd19.prod.outlook.com (2603:10b6:208:19b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 17:52:53 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mWMiK-00989T-8q; Fri, 01 Oct 2021 14:52:52 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1285b966-72f5-41c3-9583-08d985044adc
X-MS-TrafficTypeDiagnostic: BL1PR12MB5207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5207EBBF7078F739EF8EC7CAC2AB9@BL1PR12MB5207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0RUFtOnw+nb7NwoEm/ZOGP2fbmeVa81IqTLoBjWl//6ujYodfMYklukz3zxNQTa279UudTCJqB6KydWVGXevJJCtLrvEBgsQj59zMfHEmLusm+ML8DppSuTEjxygFzk3oSfAMKChEtG8RAu+GQMi+OUfMTuoJbMd9PKowtJFw4RLWl15NQXou3/waJMrlwCf8wtx4H55ZcCkdolHlR47NAY4oDHLLCQGWLKaWNbRBsQUNHJN772asyEedD88rQCf2wuy7xKtohW8NNaTgzvP0yNS/b+I/TDvz2aAigUtfAOOr/h8SdHZu23FaKxnQDJN2XdfSmUPK8sZdL3c6sobDpy/dg6HuVGEoKIKzMF8GJM9rZ71macIBU9sl5U1K0AlQnx6V9vXQC8GWaxJXdQT/Kn58RT0g7RuVfdIj0/3584EQxnnPH/1LUlINxOoAoKdIFK8QaqWXab6R/MC7C016kPS4tlWojBhmLnD3Zv/J49CSjVqpNRZKqOG2+5iJkNJM6VXEE2S13WRkXy8lQmOK1OeofVAMyat5TCICAqX5NG+CdmQaf3j2A+NSb1wu5pJG7aIPx9YKuWR1CStVG7osOzVJD7hwy5xvzO7LgiMsFx3IF6/lqPAi9UvD1Sk+6P93RRN+LO8xrj5ctuCb8EIXiAVxMq2cFD7CYcBoIee6P6tZBraJhogYktPlhZfeIi8P0qPfsJb7B9hjBpmqGCUSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(2906002)(83380400001)(66556008)(8676002)(38100700002)(66476007)(5660300002)(2616005)(508600001)(426003)(9786002)(26005)(186003)(6666004)(9746002)(54906003)(36756003)(7416002)(4326008)(110136005)(86362001)(8936002)(921005)(316002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HTNy42KQ1GtmeJ3YXsJTZtb21vpiP8v+KozxBmjzIz2boHSBYiuyN2G253MT?=
 =?us-ascii?Q?GuaJZGD8gQ2hnZQ1XBmj631hRerwuN+OrLGMrfSrABcoaR5ZqwldllFzdNgc?=
 =?us-ascii?Q?zLfMaEQQTbYJ+f+2FThOrgGvVk3Exck8cK7pShOpoqYcm+1rEWjEnOjppswg?=
 =?us-ascii?Q?riA4tEvunaRlbG1gdK3nUN8FrMlpF91dPx4nyXSw6caj2UgXtqbCIbbYnTah?=
 =?us-ascii?Q?AJWKYNQ9wSDdbsbQ68gfM1KSJh5FULK46uWne+qPGUr/KKykn9iuZf0R0cXo?=
 =?us-ascii?Q?VMoD/Zy+oz7aJoxIdzO31QqqI4v8KndDmDtYPNw/pcyKOhgwgMgxk+aRBKTk?=
 =?us-ascii?Q?xHP9VFpZjIVSa4bDsgvydxX0XYqel9h0sUsDx1gUzntd9WNMvUylET6qOChZ?=
 =?us-ascii?Q?u1DBYLiYB4C8NcGKEbsO7kHTGvPOzvqk7/zcHdp3lCynzQU7Z/RtbptHz6MW?=
 =?us-ascii?Q?HSvJRF0qHlTOakJDO1hKUWoq45yIcWCpTxhiHrJPO1Zztf2tzXyUueYDX8VX?=
 =?us-ascii?Q?yTVoRQBI9GMZVV5ag/mURm8TguB7qO4isSL5qJC6f8LsZi914oI5hu9xeoLZ?=
 =?us-ascii?Q?YekGZlFe/3vyJGVNQPPuiouDzKgBO+EcPF/00jUgf6hjHnZIQPJxi8gzycyC?=
 =?us-ascii?Q?yVRZdR5hoql8SyFDA0w5Gvu8KsMSWu4skcEqHYnXZdsQ6EuuJvnPPDT2r7G9?=
 =?us-ascii?Q?Wpri6tIiUqWp7jvSI2iLF0RjIKq7uhq4CrfBekDWplkG1Yjvh8KrgmMpGmER?=
 =?us-ascii?Q?oTwV6ZOy+IgzPVu8VV3wJYABFL0CQVLyyoaEc1BzfHwMdVQZ6/VhHcBh3330?=
 =?us-ascii?Q?GEhLvPEuKyKh8qTx4Y0rPWJLFmc8j7XaRWmDzat8j/VuIvseYcbhK17HY5CD?=
 =?us-ascii?Q?lS6uO5XRH0hf9D8rYstiXcGZ/ZtTcQHlVl6lzZd762fPnQTfJY8chGOx82NT?=
 =?us-ascii?Q?c0n4xrwW8yRz8JpfKXoc4KZxLn8XpgZ7zXk3+Zm0U5SVwQp20JETUpo4Zyzr?=
 =?us-ascii?Q?QGytKtg7n4e8HfHbEh1bFCK1ZFqVMUadZ++KF8BdDI13/wnTiA1H/Ta7k3XX?=
 =?us-ascii?Q?+PKGoYN+k6O5C0OTFM+uBhULm2lNX3Kd7jwTCtzp8nlNw6yMVn7xIjno77Q2?=
 =?us-ascii?Q?4qHVyc29bYogWxUn8rC2JfxSWFARSXbJJSSz3Htx4oHUCLRWrBNTD7J7WkhB?=
 =?us-ascii?Q?MFXDTL6WuKnEsErLB4CJjb27x/Ii59S5t22Ahxnzn8a13HQDQJkIHmi46YKD?=
 =?us-ascii?Q?RRMQO2y+AXdO53T4TyLbaGrjwXAYAl4C6JZLIk9WC5YmFGDPbjycotlD5dqP?=
 =?us-ascii?Q?v+LH3jygvLjsj8uTRJe3DXJP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1285b966-72f5-41c3-9583-08d985044adc
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 17:52:53.4050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNf28XyIH9gX4nywHDFg7Ww3y8NODWZd3lxd4q/hf129IiTygCfD/K1JLV8eYRE3
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
index df9e1e265bca1a..18ad047811d111 100644
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
@@ -302,8 +302,8 @@ static int vfio_ccw_chp_event(struct subchannel *sch,
 		return 0;
 
 	trace_vfio_ccw_chp_event(private->sch->schid, mask, event);
-	VFIO_CCW_MSG_EVENT(2, "%pUl (%x.%x.%04x): mask=0x%x event=%d\n",
-			   mdev_uuid(private->mdev), sch->schid.cssid,
+	VFIO_CCW_MSG_EVENT(2, "%s (%x.%x.%04x): mask=0x%x event=%d\n",
+			   dev_name(private->vdev.dev), sch->schid.cssid,
 			   sch->schid.ssid, sch->schid.sch_no,
 			   mask, event);
 
diff --git a/drivers/s390/cio/vfio_ccw_fsm.c b/drivers/s390/cio/vfio_ccw_fsm.c
index 64ff1a5e3cb475..0d4d4f425befac 100644
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
index 97df5c711736c4..68aae25a0a4be0 100644
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
 
 	ret = vfio_register_emulated_iommu_dev(&private->vdev);
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
index 7cadbbac7de9d0..0ce1bb3dabd00c 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -138,10 +138,6 @@ static inline void mdev_set_drvdata(struct mdev_device *mdev, void *data)
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

