Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C135C3E20B4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 03:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3E56E8FB;
	Fri,  6 Aug 2021 01:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59DF6E8FB;
 Fri,  6 Aug 2021 01:19:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwASJRsoKGvyilfGbs99/coR3k5axUDFln++LzrWgoP1fPYmr3uW0jjsHdDcflQ4RMnxFz8GnBIfRV1hSIgeehEBUaMF+10LH9Ky4DK0t3ncI09qoqC7McROpICHwFPMZ12LGX1/BQJYMTQ8XzNzFfy6v8KQQ0HdghjsuvzMpEyZX/hPN9JyZ1fl0p+mYOB3IsOBOmcWPfMGmOIw7Uc9RQMw4/PFpXCOdAbG4uk6AoSIqNRn4DthC9WeKN/5tCf78UXhfug9VHIe8E8p4R/sS/6/5eE7O+ihrOZTE18z8zf3UYiCsZSl2N1LYDtMjWgt341ijyfWX0nz7QLK+SJDOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYOiw0LCqAhzOoJg5UuBRyNMa1qAw60QwOAKEcSqffc=;
 b=cQA/Y9HCH9wblTBJ3q7j7THzH7Nrjqakf31iaN6/4DtMmv+f9f52qvYEBSdXBlueivFOY1ypvZieuYDxX/bgTK0VHPYEruJeljSYGKVvxvpl5kSpw/PZP+Qy/QxsJPuqpO1Ad/sOYAIHb8VYOZQbQfg52ZTNKKhbTmcjCZrfPvQv9Sox7pDT973UhOSvVMqnCKjjHF/PRBJGBcSQWEvaP3LyxRTd4x1e/DwpJ2e41BiDC3TKD9fdv2tkh3eZWgmMvY9R86aVFTQOvsvSiWzAUw2ePOovm84iyQlblgjT22E3ij2X4/PETY+p0ruzohF0fAQeRuXw+GlZwg6ZYLeiXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYOiw0LCqAhzOoJg5UuBRyNMa1qAw60QwOAKEcSqffc=;
 b=UJJeUVfrYggKGlfHnMkDap92usGvHaaF/ddeB/zxnj2e/xtAqLpyl0RteTB5Qv/WI4X3QXizq+rrW25F2/h55IXFljWwCcmco6wAEk9wYwnHofmvsNdk3GuG4WxdwbqRg7qI4LzV65SbJNhRIyKSMx5Llw7luZGUXbIaWvyGVWK90q6iuPF7gE5y8jCFQ/iXx1Wc2BgOhwC49PQHkE8bBhOVtHTEY8Qc5ZFRtkgUj00H/aSnLZUyPEbRnQOC3H8hSFEZ/568RPGqmoJ/74lO1+i9p+ccH7YYXVmXR/xKWK14vYmZrgxtlPCsPZhw2FFGOAgP4iz+HuQFb7BPHWKlRw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5206.namprd12.prod.outlook.com (2603:10b6:208:31c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 01:19:13 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%7]) with mapi id 15.20.4394.018; Fri, 6 Aug 2021
 01:19:13 +0000
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
Subject: [PATCH v4 11/14] vfio/mbochs: Fix close when multiple device FDs are
 open
Date: Thu,  5 Aug 2021 22:19:07 -0300
Message-Id: <11-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0057.namprd02.prod.outlook.com
 (2603:10b6:207:3d::34) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR02CA0057.namprd02.prod.outlook.com (2603:10b6:207:3d::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.17 via Frontend Transport; Fri, 6 Aug 2021 01:19:12 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mBoVz-00Dt7W-Cr; Thu, 05 Aug 2021 22:19:11 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fc76214-a49a-47d0-da49-08d9587832da
X-MS-TrafficTypeDiagnostic: BL1PR12MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB52069BC727808C203B38C26AC2F39@BL1PR12MB5206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /auhA3zVzaCQ/44jT+EWv/g6VCKxNEP91itUNbIJWHtGOmMv55pbH0ccCgsc7E0wr5F01OdJJ1lcGE50bTsZKHMzBpvc+MmrBQsZBYuZBOmNoAOetY4ShMscG5CsCNd+ZwRgUWYwzvLx23CD/Ai1gtxaPwq/jGkWwOJLM17lYaluIrWVHaD4Qrlmgs1amGfaEzxmL39z3Kdw6RI88GGIdkG9nIXIaWJSN5mvRwbxAsA6sg69wu97bMI3XuBL241KAvQEShDW+pO5OceuA48ewhNo5nj+CNR9G6P3S1h+RAAnRfLiMQrUvU8pLZb62d1IDkgFXiTNYHJ740999DMcfok4zdtRxa3ooQNYlnCbG2E2RqOCUNA9b5HMJ0vJKi1jbo54mAKKfJU68fgg4WSrS1y8ZCtWPMFKmIUaRmKJkhZEnDEvjLGeBrol4dualjRYU72G6At3PYlfvkHxydhDHSuqCyIQahLjYjhF23NH6hfuzziyTQQ+/cWqNYBaJpLu84NUrHZPyOyd3r2zUIdrSGR9fIMQdiwl9B2+1gLAEucr9EiCM1Tv4ixN27QnNxgX1IjWCAPPL1o3W6oKGR0h/fCm+Ep6KN30mj7Z2nuA67stRUreuwqmnDICLcs9Ws6QeKdSG6Dsi27O9fba+ETLxH731vcaMmpizbldUhIvhHjM0CcyRnXekNxW5AycUsoT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9746002)(83380400001)(86362001)(9786002)(8936002)(426003)(2906002)(7416002)(38100700002)(7406005)(66946007)(921005)(8676002)(5660300002)(186003)(2616005)(26005)(36756003)(508600001)(6666004)(66476007)(316002)(4326008)(66556008)(110136005)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KDGC9467/qEblDkRJzIDJ41P28c7/ohNJBVwP0J3SQX7t2SxFhw/V6bjJ9zj?=
 =?us-ascii?Q?YxLBqXJDdvULjTO6qQyikbqt/QyPk5NOK4iLqqcMFJ6mJpVVfo1hjRSM34QM?=
 =?us-ascii?Q?KPYH6NcB93dMhqvzfdHjYRNmIbm9E5tzCsl3ghreih5v5LpnlN62nMNILx49?=
 =?us-ascii?Q?X6C3thmFIBS+8ngOVZoBJZNkjjgGb/R3ZC2W9BhqwddqsWLsFyoYijWZfL5h?=
 =?us-ascii?Q?2CjBVcCNcBKZcrTTivm9LQqRY5yvEq4c2Z2GOLi121E8TqgTXXkE/hhf1BtH?=
 =?us-ascii?Q?A/7nOF+G/zB68xmt2wkN5dzIHv9Q/oiamuSe/VwYu8HpMrHZrNutsJ/pk05B?=
 =?us-ascii?Q?lg6M2BZPM+hzIg1Wpxvyn4dJpAHuOdkFhDtggEctcLhCQtUmucw56l5UyRXG?=
 =?us-ascii?Q?ahku9ff4CUlRB2YuNbLpnEvWt3Q+YVt9fKqOBW8MvhwHmhGcQktd/eZq+ih+?=
 =?us-ascii?Q?n9svcDD0T+rIM6U3boHY6hyqCF0Pgs2o+JimbxHsUQZ98JFQ6c7XHa+yN+3D?=
 =?us-ascii?Q?g9AXaJgXiXElMQ28QHYPPkCEZktaARn9OXx1c6tNh9wS+Deknksneg/4B5dd?=
 =?us-ascii?Q?ArjFQmPMeOF6VmyhsKXJmo9zxSrkPR+IwnORXENgK6efW+DLScKCrYl8bdeU?=
 =?us-ascii?Q?CD5sLrVzvH8maAUAH1RzalGC59Blhlc7KxPDL6bCKdgtthpyxFMdEN38Ny0P?=
 =?us-ascii?Q?UmgrKxMxQLJU0lVYNt85Ziybi0cM6dW7BpTXMuNzfYEoMOF7i/Wjyx6EGW9o?=
 =?us-ascii?Q?C3DBSnc7yEHORFKLcTsxBc+W3l3S4UIWqwAVwKFvg+0AomdttWk7H48ZR+Rd?=
 =?us-ascii?Q?J81SewEGN5d6f9F5VMWhHZJrzfp1jkXEzNODmdM798QMrxs+xNDaoWaorhat?=
 =?us-ascii?Q?9IkveC9KZnZWYHnjJxTafyZXlfXkYXOUSIn4Tk/b/5cYj+HHckxoE2Uz+HNi?=
 =?us-ascii?Q?/zbe/Dl8MA7jk2BSPfgPYvnusfGawBFNliCMur4fkC6S8+5Qrla/w/+yrTwy?=
 =?us-ascii?Q?xl77pj1hj98m6FKElw8sw7wGKmqpDMM76TiQT9Lf6hgZVrf4Tw2xCaVuBkjS?=
 =?us-ascii?Q?LJakXuPQ+hvHzOFABUf+cX0Mq1p8O2pFs3oKmFQUc+4Y2A5vugDZ65N0iyhz?=
 =?us-ascii?Q?8wuTS/crBPhQhBuesb7cwycrtzZz6DIV2g4dFPQ7NsvZjbyxoNMgYIgPCJCM?=
 =?us-ascii?Q?cSSzfJkzbYzTK7PsZWABfpDDMC28ZBR/+gQTmEexLEY7DsZw7x3Ek/Z3qal/?=
 =?us-ascii?Q?tMjHBoThn2rE1fZ966/rtvI+vOKOuv0aV1SV0CobwidoUAbCT88ueY86onoT?=
 =?us-ascii?Q?U4gmD0FKThz8EpB3gxLfzn7u?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc76214-a49a-47d0-da49-08d9587832da
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 01:19:12.3792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeZVMsalDXltvClbAn8ICoaYqbEIq+HOj9CXgJMAbR/7k/8ErG+ykn7UWfZfP2WG
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

mbochs_close() iterates over global device state and frees it. Currently
this is done every time a device FD is closed, but if multiple device FDs
are open this could corrupt other still active FDs.

Change this to use close_device() so it only runs on the last close.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mbochs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 7b2e12fe70827c..c313ab4d1f4e4e 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1278,7 +1278,7 @@ static long mbochs_ioctl(struct vfio_device *vdev, unsigned int cmd,
 	return -ENOTTY;
 }
 
-static void mbochs_close(struct vfio_device *vdev)
+static void mbochs_close_device(struct vfio_device *vdev)
 {
 	struct mdev_state *mdev_state =
 		container_of(vdev, struct mdev_state, vdev);
@@ -1396,7 +1396,7 @@ static struct attribute_group *mdev_type_groups[] = {
 };
 
 static const struct vfio_device_ops mbochs_dev_ops = {
-	.release = mbochs_close,
+	.close_device = mbochs_close_device,
 	.read = mbochs_read,
 	.write = mbochs_write,
 	.ioctl = mbochs_ioctl,
-- 
2.32.0

