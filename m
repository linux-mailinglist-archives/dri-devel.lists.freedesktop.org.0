Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 222F43D00A2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 19:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8386E4F3;
	Tue, 20 Jul 2021 17:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FA96E51B;
 Tue, 20 Jul 2021 17:43:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQpBVhgIibZwQoD3n6UWz11+XfYkL+4X9u5eswEC/o/soj1yKIgJhqEmsZfNUIQs3Y1QEZEnw3CiTPiVymRkTkM3dD7gVyRVCEzDOlkrPGAhEjy4gRD28a/aTYCIEJO9cRrOsXEFS1ScpCAiMgXd9J8+F6aUU2DCFSpyR9a3j6MlMvZ3JrxD/88HvXFkRKJx8UObWQfiK58c+BYL11yOrunzbA/J4VYX22Sg8DgdgFRf43RSR7d0yGQ/RtB2aiUvFKNiqQD/5yoqKcB+Mm7bfpdTdV9SLOMEco499swOPJ5GjlGEntE5MhH6JExOXU1MRpAEsbzw1nHWGR7UZ4KpDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLzSCfm46aaxgunSwJCbcPbWiLquGUluYNQWWJ5J2ns=;
 b=StWi9m5kaRwKr0q+I2p2FpLT3IlCxv9UynHdbM/IA/i2AlM0KoMgobPDDTmX4gyqfhAsJHRjjXIccTroA+Q+bBaP64T5cx25bVLfraL4AXSrM3P5ZsurknIBlzx3qcOJCfynOSCOuv3PQi8OM5Pa2H1ERKtEzp8LM65fJx+LPdkuYi88OT42gcudxkB/ZFnlOHqYFgG71XzVpAAMo7sJVlyJfMVdiJ+JvNJ4L/lE38hcGLZoQY/HX8PQlzB9VyRt1RcfQ5DwMIB6uhJEttyzQWwZnMwX//rtFxS5YzA1fpgfVO54ljbHgdC8i1fHKYYw4t5qiwAu8pWVtWGpxbZmlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLzSCfm46aaxgunSwJCbcPbWiLquGUluYNQWWJ5J2ns=;
 b=L6vfJjoMn6cOrH0c+ljatMcGy+B8qmfWl7Jn8rxBDofioPO365hUh5oreWqFP2L9zgUTBtQSqqC5ExPnyGc1fjbZfh3ZYAE/BsZta/aOdofgIiC6yLn+yHxzzYjoNp1DX/b5LwkbxkPpqIVCmBusSv5V3NA/yFV2SGtL82nqyir8LOaYVJ3HX/PO30jDnyE4c0/FNmis22I0yYCB8ai7jmJ4Uyi7tc/jW7sLwbojLOmNqKM2ybJhjtEu8kzW0W31O1ebV+DtUfODpjahatyRCLCavn2Z2u39G76jXQSeAv3LIEDyOPtjYPkwI9fmkSnIbrsSptn6kLRvMs6EARsgkw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5288.namprd12.prod.outlook.com (2603:10b6:208:314::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 17:43:08 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 17:43:08 +0000
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
Subject: [PATCH v2 13/14] vfio/gvt: Fix open/close when multiple device FDs
 are open
Date: Tue, 20 Jul 2021 14:42:59 -0300
Message-Id: <13-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0018.namprd22.prod.outlook.com
 (2603:10b6:208:238::23) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR22CA0018.namprd22.prod.outlook.com (2603:10b6:208:238::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 17:43:05 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5tll-0051FK-RM; Tue, 20 Jul 2021 14:43:01 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67c687d2-942a-44f2-5871-08d94ba5d41f
X-MS-TrafficTypeDiagnostic: BL1PR12MB5288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5288BB8E340C81C8EAF4D69BC2E29@BL1PR12MB5288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gSLqAvw+eXdB4K3t0+CEBOci/yS2fx0eeu6QL1IPVjbTgRiVr6uZ93czxG6Ta+PLLXOjCPpM1QSgnqbhRE6pWSWwGW3xIDUgTchdwtMrSEcSyG2hyLW5AdWtiubW4Yv5gsmii/g0hnurn+/HhCXNtUobs6v3RW/PP28Mb3EnI/fnVU+76R23fU4kmb1Lamq+CCZQHXPLpQYfjSKak5ETClFUdlFJIkZjDkUgl+/cJHw0uHfjbstfJ+nr4ngRIuFyWZhPZf2x6hkKZos5f0u183YVH2pI61o6LWaHEdjmQ4Sq7apmIIIWtNmRuxWcs5qIxptpYv/pKOhdz9SE1VUnjW2ES3Iv6yAzlgTht8c9pbDIp9DGEum+BCaGxY7/pqNNhSQMDMcIjqedonNXApicRyGf3Da9oZEln8lxHUiFaMoafYa27jCDanrod/+2pYB7YccaQjpVfP17EfPpxyHDA3D2aUKFIde56wzWf4ragh0gxqN4Y3RBeywLlx0cmCoy5mabqwjRkZp4fifSD1F4/Wd7l2WnCdCcRwZvt/yyEcS0iI/mT2V220JFUvtrTAeKffLSseMjsFHzmWCtyMAT9BZ3A/YieRdPPncg2CCFevawcUX6eltXJEGxsHCWy0t9bcbDW3OSB7bM1GWaLMlfriSR03xHrQQ5xYQd1dbsQFYVeLxslN5yJgu9UvKVI6hg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(66946007)(7416002)(7406005)(86362001)(2906002)(66476007)(54906003)(38100700002)(83380400001)(8936002)(316002)(110136005)(478600001)(36756003)(66556008)(186003)(26005)(5660300002)(8676002)(921005)(9786002)(9746002)(4326008)(426003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VKf24NszFTp6+mvWF1sC1lgvCA2bK6drIHPPgHcTSijz0Zn/3La0iSMtdK9I?=
 =?us-ascii?Q?vyktlSpfoHHKuWBj+dpuM6RtmqjIhe8lAKaDcfyhESdWfabrgUIWbb38/WFc?=
 =?us-ascii?Q?xaZGaqGcRbh0U60X2lWmRj1RXycUmTmCvH2yG0cKkq9x+vLrIY1daZkfrIed?=
 =?us-ascii?Q?6AJAShjx124vlGFE9Eujkf1yCl2X0gbrqchW2FLpgJDmWuon0vQieB5sD7UD?=
 =?us-ascii?Q?5/bChbrm4T00Y5+nCEnmGvT88FTGF9mwI/ev9V4sKfJ1RyQkR2AFQoaIZlow?=
 =?us-ascii?Q?OL+sGCnQFht+vjBSkflPxLiBIg5ZJQbZ1d7auRHe4cbndOn8/5Xm9L1eiPjY?=
 =?us-ascii?Q?H3wn4p2AAAEtb6Z1snBofq0KJTTEHZbgn94g1YAKRkcsE4UKIaLuA6Am5hc/?=
 =?us-ascii?Q?vUF9JZCDdvAju8hjdmRKnPPurI6DPrfSW1gBz3XkGZcGUg4kHXHNJS8jKWcp?=
 =?us-ascii?Q?gpJmlplswWlMAuFfIDbBJvJYTaNSY33pNgGyT/Eq64draerasqpMM0s50dkv?=
 =?us-ascii?Q?fCZmzeO7sv5O0mbd0hP7MVBSumVkPn4atpC1y3nuU0a8HZAAWCtAniMnzkxc?=
 =?us-ascii?Q?9p/eZ3TJs4jmahWlm4jnaJzbEB0Tln2hA20QhvH01rIabV5pPYlDg2r/CuyX?=
 =?us-ascii?Q?LfuT5A0TaJcSh7L2+qf26W1Cws35kqW2kKXb/mAzpZk2sHKxzKNsFaJF4/D9?=
 =?us-ascii?Q?+/lA9IhC4qqd8S2xxdia7byUE4KWf2YxXs8bctSKHhldbpRSumTvJFkAmuos?=
 =?us-ascii?Q?LPG3RpnjyrUQ7c4HCpgdmmf8ByYAx/Jyew04tbp8nOGkyTGf0BHnK346tIkn?=
 =?us-ascii?Q?zmN5KpVodx7KciTxfBHEAI+3yMkfEWZjrSRPYvt0odgrUnpVe9s1Lrwbdoem?=
 =?us-ascii?Q?B6gYTg4wjhwf6gTeGc050LSEGtlBVOOz/V18OZenm9s5Zt75qEK50pyexal2?=
 =?us-ascii?Q?UY2ED6tkOZ1wPnCj3aPJaQ2i5pEe8jnhL8Pczu3WrzpaUQldHXZUHtPsGFCb?=
 =?us-ascii?Q?cB8/0NqjFSHIeObRbN6CBiF0kVTzpPDnGVF5xtoFomkVFdPVRJpZqjUKgeFL?=
 =?us-ascii?Q?oY6uMnODqYb3JCeasAfr5X09AS3Bya32bJk2b2drQLwYXvvgI7QRIBt6VKH/?=
 =?us-ascii?Q?xHfJj7FBi6eAmDWNSm4Tevoa4+WocWdUY3MeTtWhiZX1YGWaxhD3PzdWW/a3?=
 =?us-ascii?Q?nld7e46b3XczraW5Q0n5wDSdytY7ST39B64MWCwpJ7h1dU2dqz5lMcZcbryX?=
 =?us-ascii?Q?hkFrp4XBYvwcwFJDffAwpbKm8mBSt+9eZhPirmDWp7ms4E1dk38/gyocAayZ?=
 =?us-ascii?Q?LlrC3rNovEwk+7EH7vw3ej6k?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c687d2-942a-44f2-5871-08d94ba5d41f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 17:43:05.2018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NdoOL+styLJQNHiZRvJ/2E5F0H2zJ6PacZgh+X0uYh/zg58WGcAwAIbTASMOlfrR
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

The user can open multiple device FDs if it likes, however the open
function calls vfio_register_notifier() on device global state. Calling
vfio_register_notifier() twice will trigger a WARN_ON from
notifier_chain_register() and the first close will wrongly delete the
notifier and more.

Since these really want the new open/close_device() semantics just change
the function over.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 1ac98f8aba31e6..7efa386449d104 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -885,7 +885,7 @@ static int intel_vgpu_group_notifier(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
-static int intel_vgpu_open(struct mdev_device *mdev)
+static int intel_vgpu_open_device(struct mdev_device *mdev)
 {
 	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
 	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
@@ -1004,7 +1004,7 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 	vgpu->handle = 0;
 }
 
-static void intel_vgpu_release(struct mdev_device *mdev)
+static void intel_vgpu_close_device(struct mdev_device *mdev)
 {
 	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
 
@@ -1753,8 +1753,8 @@ static struct mdev_parent_ops intel_vgpu_ops = {
 	.create			= intel_vgpu_create,
 	.remove			= intel_vgpu_remove,
 
-	.open			= intel_vgpu_open,
-	.release		= intel_vgpu_release,
+	.open_device		= intel_vgpu_open_device,
+	.close_device		= intel_vgpu_close_device,
 
 	.read			= intel_vgpu_read,
 	.write			= intel_vgpu_write,
-- 
2.32.0

