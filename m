Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253623E20E8
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 03:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FF46E915;
	Fri,  6 Aug 2021 01:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B386E912;
 Fri,  6 Aug 2021 01:19:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpUubqLCISmTV/dy8+sq+pkmeh96MXOEx6BzUUjcosFaJmHNXQ+6U0ucpZbLsOyQDZ1q/BvtKJxZIp7MOzIPeiBxNFZ32rkLnjOIXnUDfV7AUcUqiVCtI8krLzZeYoj3cP5g0f4b4HgPn/n8MR04kHWv+c28WOLuEqHWH1O6kxw7Ax0+UPmKdnswyi31w3nMoMpTX2JQI4jkfr4X5/+f4/qS4dHgP18LwRuXb7tJbEg4U8q2fcBIkL19voWI0+DGWeCTe/cdP/MDM2Y3tFC6tmfpE5AomOrE9/1zV2JTUI78XMWY1dTtGoDakCF4FpGzUCF4UJ0jfjXzFj+/PyaTZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5T9Co41XNdb794U0C4CUNz9k6AqD0LbtOYmBf9HqKVE=;
 b=O24eQ3IdRwDQiuafMyaDCmX2jJZXLAp+FZ3++4DZPOD6gKsYt0qaBHNZK5eA5OPJGCBx3GidzMMvNQJiq+XBJrfKLE3nxLHUWEBZKfvnlUUIpzDTJUUBwKNux7U4mJheuby+EI3mipsUK9VsHArJgOkcgzD90mvWmgCJOQ4/7fJ7CG+5jj11Zw8q/ZGl2E1gGx7kEBXxnpV+M7mdj0Y8FOHCb45BHQpr5G3TDj4zLP3pWk0UarIlY448CqYwqt+sUSXVjYGamrmdFQeN40vIhJCilrshIQVPypQIUEKeCoGNkV3ptmAmp5wJYMN9b45mEHVjQnqmfV/Rn26KAOrUtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5T9Co41XNdb794U0C4CUNz9k6AqD0LbtOYmBf9HqKVE=;
 b=d3Ce94W1khU9ljyM/oe6h1QtmCoHOZQ6T2gO/BU54ERYE4Ao29eFDAbOuchw8sgMQ4obbMGTBMhS/S+ljXHpJQiGFgYlqj7KHTvq820Y5pSnN/RuZQlLnbBTQVWuUaBcZHIOvIH6uvOwY7WduBkKl+mjdYeNwP69UuzvVsXfZgVZEmZGNd84CFsDlk+vfANiJst8JNoWahT9rkRnT2qA+yhzNWCF+fwyF0/Mwx5RHgCHUluE020h+w4QDTbuviiq3mYJ/cpJVGFuGIudM/x3u/HEveeNztf/Rx8sKuM8+Z0NkiIHgTYGXaP91gXiBn+uRVNDjscemDown8g8lMrHdA==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5206.namprd12.prod.outlook.com (2603:10b6:208:31c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 01:19:15 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%7]) with mapi id 15.20.4394.018; Fri, 6 Aug 2021
 01:19:15 +0000
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
Cc: "Raj, Ashok" <ashok.raj@intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [PATCH v4 01/14] vfio/samples: Remove module get/put
Date: Thu,  5 Aug 2021 22:18:57 -0300
Message-Id: <1-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0039.namprd02.prod.outlook.com
 (2603:10b6:207:3d::16) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR02CA0039.namprd02.prod.outlook.com (2603:10b6:207:3d::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.22 via Frontend Transport; Fri, 6 Aug 2021 01:19:14 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mBoVy-00Dt6r-Un; Thu, 05 Aug 2021 22:19:10 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbabb941-b417-4168-2322-08d958783406
X-MS-TrafficTypeDiagnostic: BL1PR12MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5206270535FFC71797E141D4C2F39@BL1PR12MB5206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dbv7su0NgRE+8oBml7vtDSS16/2bpHnHrOnwz6YPO7hPv49CrAG59qIShIXfmTs3e460gi6aXFfSAPJW5KWhWMgtjadwxS5v1HQPlYDXQjIpVZin1pwevGU8K4Bmi2R0PTTik26a8+eHFwfyVLPhbf6RRe4mTHWnL3fddsxs507AjDGexTA/VjTtr1vsWN/tGuz8OU5OiUDgFsJfSZmwxOI1JmKj115vWZhR0fbW1sIcVV8biT3KPC6hQJaPMRmLO1QL/q8Otm0fcavzt5ioAVj7b/vKxzTX3+S2MbSeApfsqVyTB2dttcYxmmk3l8JrhIsnIon95r3hlUGEjkIfh3QSH876HqjZWKjqb0KOfZZUYW8CrcxmD4dg1zvLIcITjwnHHqNR2/Kn9r5DciA4H4f8RwqnfYQlU4ERXZJ/XSHChafjM/z+WFJti3enVsTSToV8vDz1lr44odGIxh6Mk4LpMoW8OoWU8IVjIffJB4lyEM/LD2z0YazSgOwJb7wfJd7lDnlJNs/SLmMTwPILAPJHQO0gK0V7ESBic5q+d3/XYXfU4JHBH8DiDjjJTAGcFOzcKek3X3chxVprvlvPSxPuWYVJDAbYMs5jYeU1HvhrC/IWixJBCZoRarWuWOnwJN2BC0yEAQd/9guwJC4gWaNp7Pu/I21SGkr8gSQyOgVCMWHEuCLDtvKUzVtkVJTZxIW1ukOcxiySvoB+QOsAVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9746002)(83380400001)(86362001)(9786002)(8936002)(426003)(2906002)(7416002)(38100700002)(7406005)(66946007)(921005)(8676002)(5660300002)(186003)(2616005)(26005)(36756003)(508600001)(6666004)(66476007)(316002)(4326008)(66556008)(110136005)(54906003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hs23zjC+j1jrdlhmWMKYokmMWLSS3t6dfKX7v7W2eS9Dg2PrMTaG2Gd6yqZ/?=
 =?us-ascii?Q?QV8Kv+svaXzD7l0S/avvXV3Lz1cImrBoP1R/e5dxw4ymUwWt3BVFj4D3ZLCl?=
 =?us-ascii?Q?hbXvM1atH4n+QK0JtAdNHWC/EjROWHk4Mx+s94xvEzqFK9vgV+u5qEDUULoC?=
 =?us-ascii?Q?Etp7LEPGLb/8wMg7oZWt+V0YrDi7IPr2iOfwuq1PS23OVKuShJz/1PbirABo?=
 =?us-ascii?Q?zWz+CUy+db0n/AVAGavzRT3TyzS4yB6SynB8FQ1GlJorcKbHVnqb6YnPgdgY?=
 =?us-ascii?Q?mUxNwum9vcTJ+l3eSaqizNL1MwpJtTLCd/Wk3Qs68yazAWHRnSq+oPtsKAQ/?=
 =?us-ascii?Q?1fkYsNgia98o+YwIDlmDFiIP0Z6evBVczsqQx2qX6ncI+rIp0SXKWJ1QxTAo?=
 =?us-ascii?Q?u8w6/qfcgiSgR45jWE+3ztFloDNahfWnDNY0muxhjB6Eqit3lzK9B1vkuyxN?=
 =?us-ascii?Q?zFzFsJJmUwaMrFjoVv2LKzeBazBoSmgRzTm/bh6z0w3TCpJc/7yu6egUKcNn?=
 =?us-ascii?Q?yuPncMopZpAr6gg5xCPXdXgk+GM3PNIaiGWlEc2vzd2G5SYXMfEFUTIrV5s9?=
 =?us-ascii?Q?ua/cePraw3+bVKerTGWtmekSp4kXQ9avdpgHbk2+ScGv7vgNea2rHiju+xdt?=
 =?us-ascii?Q?7xPKdtErjSyf8wP4m4nSOfWTQPOXrvbOxkflnxFX/5AxQXwzezvYe37KZHob?=
 =?us-ascii?Q?6gKjSp25/DL9io2qUXT/7nwLmZCXvr5UgfvxjYcUCThf5PwQdSnSFjV0JdlU?=
 =?us-ascii?Q?5QD2LBZ37sXeaxSmdaCJBjFAb3YWCFeJlb+sqwLbi0sTktACL3j5qzWfozkb?=
 =?us-ascii?Q?fxKFICEqjA2tlP5VKWlL/dt+H2cqFAuqAeRZXliSec46kV7F2P62w7cB+yw9?=
 =?us-ascii?Q?fVbpxS5/HcpHlnGDZ0fvbbztuTAehdUw6N8p+r8oj00Knj3erJArGL6IwFvl?=
 =?us-ascii?Q?njVLw7ufvl6rzmbLUqEw7ndjXwcMPuplmKLVYnmCORlQEchZsIkFv2ER3Djb?=
 =?us-ascii?Q?GusqYuIxp/bx3enRYaTMQwcKRtxD5OrKBtIBoqYh6jCUXfcVZpnpVJfwEOFB?=
 =?us-ascii?Q?yBsGASG5RPPuAhxNeefMB+IINEBHL7sxeST0saKj38fhHX1XvqjxSClLjZlj?=
 =?us-ascii?Q?7fGAOFk2Nncj5UwOKyf8MyCsDK20qiegtXdOLD7GLH4IbQZ6LiBgGen9hXJr?=
 =?us-ascii?Q?mRRovrRGue5IiTXr55zMvyRAlLr5JF3femXl40/N/FJVR0EhNgv2h8UzznBc?=
 =?us-ascii?Q?K4mt4PSMYOCom6Gc/kSZsiIM4NuXI8izG2PhTDaPc9pLoSgmeLBtCGvzYSfG?=
 =?us-ascii?Q?We7oKYkjRBRXoFuGoXiZ+xio?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbabb941-b417-4168-2322-08d958783406
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 01:19:14.3186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxUNb6KFOMtsgst/d+Mq1ZfoWgzK72zDwXfj3T0bxUXKJUmmhnXvllooU0EozUoD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5206
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

The patch to move the get/put to core and the patch to convert the samples
to use vfio_device crossed in a way that this was missed. When both
patches are together the samples do not need their own get/put.

Fixes: 437e41368c01 ("vfio/mdpy: Convert to use vfio_register_group_dev()")
Fixes: 681c1615f891 ("vfio/mbochs: Convert to use vfio_register_group_dev()")
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mbochs.c | 4 ----
 samples/vfio-mdev/mdpy.c   | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 6c0f229db36a1a..e81b875b4d87b4 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1274,9 +1274,6 @@ static long mbochs_ioctl(struct vfio_device *vdev, unsigned int cmd,
 
 static int mbochs_open(struct vfio_device *vdev)
 {
-	if (!try_module_get(THIS_MODULE))
-		return -ENODEV;
-
 	return 0;
 }
 
@@ -1300,7 +1297,6 @@ static void mbochs_close(struct vfio_device *vdev)
 	mbochs_put_pages(mdev_state);
 
 	mutex_unlock(&mdev_state->ops_lock);
-	module_put(THIS_MODULE);
 }
 
 static ssize_t
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index 393c9df6f6a010..a7d4ed28d66411 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -611,15 +611,11 @@ static long mdpy_ioctl(struct vfio_device *vdev, unsigned int cmd,
 
 static int mdpy_open(struct vfio_device *vdev)
 {
-	if (!try_module_get(THIS_MODULE))
-		return -ENODEV;
-
 	return 0;
 }
 
 static void mdpy_close(struct vfio_device *vdev)
 {
-	module_put(THIS_MODULE);
 }
 
 static ssize_t
-- 
2.32.0

