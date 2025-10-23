Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0C6C03BE1
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D50F10E97F;
	Thu, 23 Oct 2025 23:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="prBn7B/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012011.outbound.protection.outlook.com
 [40.93.195.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5F510E04E;
 Thu, 23 Oct 2025 23:09:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f13NLM0sGh7K3KEapPcxm8YSJWIGjIQCfpMW2+ZXFua6Kk5OGYucMz5OKpZkCB4I7spHJZY17Ld+/KoCEb1543o3a2eJKAZOx5fRA64VmUcx6VtNsaMpu65YDGcMyXiwuoZIqqVnFf9r9PF65jJUb8WXfdbUnIj+kZ6pMNicw9vzB1zHMRgZhfUztwXuwduO2Ga7/od10Asu7ilCOtHZ95Q5MMzNtTTJLfbXsN19uCiiowLzg0c+e64626hCXuYRdPqZBOxulwfaLiVE83hf5Aom6aDcoU3bHl2hKus6buin7Hy3Zm4JwBzyCDXch+A/CkpN9huf6+TtK6/X4LyceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bq+PTJhwrWYQvHcQabGQFjvghQTvSG19X7uIllLbZrg=;
 b=ken1QtqOruzjvUMT2jRRYAX5DwZV/NpZ4aPU/ZQU3TUHijzu29AK5Y/XrnXeeTAdn2QsYabYuGabS969OhKudobURrK3jgF97xXy2ZY92Kl6JC4dz6Xl7u/JAfw4CV3cPSJNz6oRihAHDr2JSNsUNBHMzshKhqJoYvyPhoTNmuT1eipQZNM11gaJ3hlMhSrX3v3wALlEs4vmTo6d/17EqV/Gbi5MJfIP4FU4VYBU3qdF7ZJ8+5DewmPIHWN026JuS86Q2oOMcrAcUjBHLaatIXQBB054IKlMqkOjio33UBh2dZOI2hfZBuuIgB/oa6FvC76iV6UXSEtFwVcxUx0u1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bq+PTJhwrWYQvHcQabGQFjvghQTvSG19X7uIllLbZrg=;
 b=prBn7B/6bLAvu4EwJ2VE0ksCXvydO6CEOhEEQTczBK1ilru/fsEHXMH1lBxjUgcQ3CZwfZ8V8jmmKGO4E+sWJieAABd9N0z7QBrJEb5pzMEMQkX3QjlKtt3ubJEbNrsUnLZqpUe3y7M+6f/7M0GMimuY4vk96oY/1Gv5OI6TfL1DGka5jkRClbj698kq5iJHnDv9j1WSYnTH/mPqe5DyAGZ+0LXq4Lp6uTBwyG7xmkLpLxfHkbp9YNCg0jHqyNhy8d2EOC55r3mdCcrMprhVkELLxAGywyNfXlG0mqFjPUAqHtpKcmPYChEcAsq7rgInmROWvIo0nXCq4VEJanBt3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:09:40 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:09:40 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Pranjal Shrivastava <praan@google.com>,
 qat-linux@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Mostafa Saleh <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Cc: patches@lists.linux.dev
Subject: [PATCH 10/22] vfio/fsl: Provide a get_region_info op
Date: Thu, 23 Oct 2025 20:09:24 -0300
Message-ID: <10-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:a03:333::12) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: b18877f2-88b9-4046-a5c3-08de12893dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y1eY7c+gn3IBm+6NphZO9AjfkuPjl+0f31QlMY5IStoPDfiCBySwPgpf5U8V?=
 =?us-ascii?Q?V/SGEeYnZ7SUpsUt2sDCGBfasdfYGzHd7Lo97zmUqkM21OQWRu1B9c68vT/w?=
 =?us-ascii?Q?K6RuIGHPlVsQUW6qp9KWRKo4AoD9hqi9K56nnbIbevC19FV5maRfc15Tz/1T?=
 =?us-ascii?Q?pOvb/63d++ZRegrXGTPK8IS0sMsin7ibS8UCmLysXwU5ACk3sya8YXTsj43V?=
 =?us-ascii?Q?O4Ff3nvRS0SJWSRjpSbL/WOcPHlXGnDikhF78NSyVb2qpEN0cqs2+yBY53i0?=
 =?us-ascii?Q?fHusJ8vXWrvlJ3WBq5p4PwPKecorQajkuQP5xXYrlZm/OAciE2Q63DvGFwDl?=
 =?us-ascii?Q?Eth6rc0HSlBC57te7RNLkXCZLxf2M6nX4rX68VMrwLo5HyRX34zFyRELXPTF?=
 =?us-ascii?Q?+fyMi++P9b7xtFkeaMaNaBfDMUGzJVH6DcUC6LhCIp5Z0K9RYyO/IrPWfR2b?=
 =?us-ascii?Q?bFPUZURiUgSVpJLjndoQuxxCnOGf5Wp7RLryqLitgYJ+6cUcIpB0QNhiC8L6?=
 =?us-ascii?Q?ajShVQv4OxrmgPzLAykycYm+0LBb7EOa70CwyMW6M8ySQ/lfQ4vtX9mo3IWe?=
 =?us-ascii?Q?qwtygOSq/ZJE1GRcGl3D2n1KW9UFkGpPHSv2DoEbM0v1cxagFwbkfoHwzYC/?=
 =?us-ascii?Q?/QZJjb/ZT7DS1k9spwOYA6OuYQ4BCl9fu5T8RZblSW3KyBS5p+zaoQ9dBzrZ?=
 =?us-ascii?Q?v7jrpiZ9NoDAd2tgSVxR8Rn8JuXRrPLLkKrjxT8Uv/Rl9ij/PTfwnBOzew2l?=
 =?us-ascii?Q?VnLiodGo94lD4RaIZjjf4XvnxHjZ2j6n42KXxzwa6aBkQxEfr4WVD1ZkoVot?=
 =?us-ascii?Q?RnPzGh+8lHAFYs0l9jJwin3kLxJYoVo+UT35pokk7oXtDTxRk7qgTf4bCfGQ?=
 =?us-ascii?Q?i96ALGDN3klmqLGdcq0AkjV1Ke6QQ647/OVteQ9FEq5RfKy3Z292BlV9h9oL?=
 =?us-ascii?Q?2CRzJ/2sn+fnueZXhTceW2qQktjhe7wUwgwueN4uocXQA7WAD7bzBe9s3OW5?=
 =?us-ascii?Q?P+EtJBAVTSZNmygaZgRXrLGU7CrsEcX011o4tRz2oyGAXiO7m8Xb11cuszsM?=
 =?us-ascii?Q?DL+CC00FZxkowQjQpfryl+DqzPIO+mhO8Csmt0Mw4TWhrhqE1dVyIbKE9bST?=
 =?us-ascii?Q?CPrjVDgHY9hxWk3hCae0y7wVG+GDVcAX8BUrrE55V7+yzXCtWQ4LQ9j9qRt9?=
 =?us-ascii?Q?2Lxopq4bjeP7iGwMJwHgKhWt7KJQadrNRZ+wJ3OsQQINWmAZimPZ7OGnVJho?=
 =?us-ascii?Q?DfXh5WOq4vy5PslIM2j/D3PIJ9s6G4X6Tu+aliS+04Fx5YS2mSF01nxQ3da8?=
 =?us-ascii?Q?PB4s4Q77pV1K3LKJ01KKQ2eMZGq7TN0PJ0ofLcy7j5NMsTEZPdQEEIJqLbAP?=
 =?us-ascii?Q?/s0oBErWXohv7NbjrmHy0jqrtw/uaU25+clNuf2NF1NTUn7blfGiTS/zvuUr?=
 =?us-ascii?Q?xOHFVWROH869LKo7mXVoL0KkT0WaL7DG+rZNbZOTrxTjRbUrMibYClig/Ubd?=
 =?us-ascii?Q?XzjPsYOIUvbKTow=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PAKeq2YuuQ2ucFuxdn+PN9JL+4WKv13A3TckY9QvHAMnoUmZGr2fChj1aazd?=
 =?us-ascii?Q?NglARIiSAav/qSf+tqgOgxl+RiIUWRMTxMf4KMUlMuq2J7u6x8kq7/sFXpbF?=
 =?us-ascii?Q?HzXUAWrZeQp0S0RX+uWHjDpLxShz4N1uzkrmMYV+pNxFJsZC7QWsC78t9J5P?=
 =?us-ascii?Q?B+o/rTLcZ5e4eNtjjyuG0UdCnio2B2fe6QQjoeGEvZT1+VFqSSGIyXNH0a6f?=
 =?us-ascii?Q?P3NeOwjZe9g1ZOvP8+BYxqhbFhRovguaR1hS4sgAZ1JuQPwiOWpNM2FmD1nm?=
 =?us-ascii?Q?r8LsRwq8WJsgOKRhX34yXv5BXZELGllTdgast61A1vPoAPShIe44SNew2Vpl?=
 =?us-ascii?Q?dRv6fvHU758ntX6h0UygxRod8gXj2sy9i731sARNBWNoBEYrhp7IBFywvHtr?=
 =?us-ascii?Q?nfqFXxZ6HkkLS17I/VSCTqwEsfkGbo/wJiY1uNcjz5FFBxFFOitj6JXc2ndq?=
 =?us-ascii?Q?jrvi0JlTF4hcehHSTi8Q+muIRSUp8uryJUxIVrPy3Lz+ZswxqQo0pRIzFpxy?=
 =?us-ascii?Q?wpIxDHhdCx3yf02j6re1EdUfvIlJdhrJVbRnbuYH9tb83Y1MwU8oU8M9J8zB?=
 =?us-ascii?Q?L7IUWbaPbP9YWaAH4aRfi5lTQHB+5HaGGbdFOnBW4hi8rzvxMbgo0+Re131e?=
 =?us-ascii?Q?JckxMrsqLduoALp6kNOCQc2hmQoniPCQ08DI4llrzrCxwQO5BkgiFVO5oI+q?=
 =?us-ascii?Q?hZKhDs7n5XSWNd4ocQ20wB0ovLTv8yIZlMQ3da6a8cTQokA23RscGxJ2Oahu?=
 =?us-ascii?Q?+G5C+gTP1Qg4vNa5jKz2Kmapf2VN22WIZ8HpcoXVBS+KnYlXo+m40WHUpjyQ?=
 =?us-ascii?Q?LFqBizuZm5YcRV0Teqr5vZ0Tn92YsxU8CsEN4Bvynwp4XuW1wzc0WuhlPX8I?=
 =?us-ascii?Q?dLsFODH+TAaxvxoB7LIYrtHrCYCzbRMy1n4v5MPoVXu7XMamxGHv4Ogyh0j6?=
 =?us-ascii?Q?Ps4p2sv5hjXqE5cBS+En3/GTT6KLRCHuGHCi1YiShMkuuqi71UOOjw1T5ZIb?=
 =?us-ascii?Q?xymcBfDRIVM3yBDR4Z0wZ+5jEAX/HOpn0ALQ3CY9oYeZXkwwnuTPBKBF6tQ7?=
 =?us-ascii?Q?bNVi+MUjN811QLLRVy3+iAAiSonQo2qkXQ7S3Ugw92yLkBpo2AOYonHV90gl?=
 =?us-ascii?Q?SNtM3QC+ttRVPNxE+2+8Vo2l1gHYhYVwV0b9Uc50D264kLSKdjlZqb7g0d4t?=
 =?us-ascii?Q?ImURefNI+osvLTAIKq1TqDJSnJDyzS9lcg9fL0lSavyioVa603QCCjzXkOWi?=
 =?us-ascii?Q?lWiOYLRwDQM3VWudtu6UCcJPa6sHKwhQuFJ9yyK2kYepWUdQBkDd6yH4lEk4?=
 =?us-ascii?Q?wnjp9OXRWX9KOApNWMQhnBLDZfo/SazMHiDY76+Dhtl9oWaonb/5++YmuscH?=
 =?us-ascii?Q?Z6QE8848o94tBTFopiNlwKUIHRnrSBWndsMlO4gug/B3aD79iIavK2J2oC9o?=
 =?us-ascii?Q?DgEnH0IwLzMraNM90+Tk9BZiF7m+UYpK8/5kYr1EPS/63768GEXPVKOedAtD?=
 =?us-ascii?Q?C70Hyv9hWzkkEyPWwJqaXt6KE5ZYTU4G/RlbcfsXF93sB+8IELc1sgDY8NdW?=
 =?us-ascii?Q?9K2JbQwjxwRDg0s/rdjuflIblwO/4fsKAiRp2hDj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18877f2-88b9-4046-a5c3-08de12893dfd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:09:39.9759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JihDGY78oWOAi9vpsVBCAH1W38yfmdxLodJj1KKHKM8HJvnd5dkAKN0a6c/8pJ45
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138
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

Move it out of vfio_fsl_mc_ioctl() and re-indent it.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/fsl-mc/vfio_fsl_mc.c | 55 +++++++++++++++++--------------
 1 file changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
index 76ccbab0e3d642..438ea4da120e63 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
@@ -117,6 +117,36 @@ static void vfio_fsl_mc_close_device(struct vfio_device *core_vdev)
 	fsl_mc_cleanup_irq_pool(mc_cont);
 }
 
+static int vfio_fsl_mc_get_region_info(struct vfio_device *core_vdev,
+				       struct vfio_region_info __user *arg)
+{
+	struct vfio_fsl_mc_device *vdev =
+		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
+	struct fsl_mc_device *mc_dev = vdev->mc_dev;
+	struct vfio_region_info info;
+	unsigned long minsz;
+
+	minsz = offsetofend(struct vfio_region_info, offset);
+
+	if (copy_from_user(&info, arg, minsz))
+		return -EFAULT;
+
+	if (info.argsz < minsz)
+		return -EINVAL;
+
+	if (info.index >= mc_dev->obj_desc.region_count)
+		return -EINVAL;
+
+	/* map offset to the physical address  */
+	info.offset = VFIO_FSL_MC_INDEX_TO_OFFSET(info.index);
+	info.size = vdev->regions[info.index].size;
+	info.flags = vdev->regions[info.index].flags;
+
+	if (copy_to_user(arg, &info, minsz))
+		return -EFAULT;
+	return 0;
+}
+
 static long vfio_fsl_mc_ioctl(struct vfio_device *core_vdev,
 			      unsigned int cmd, unsigned long arg)
 {
@@ -149,30 +179,6 @@ static long vfio_fsl_mc_ioctl(struct vfio_device *core_vdev,
 		return copy_to_user((void __user *)arg, &info, minsz) ?
 			-EFAULT : 0;
 	}
-	case VFIO_DEVICE_GET_REGION_INFO:
-	{
-		struct vfio_region_info info;
-
-		minsz = offsetofend(struct vfio_region_info, offset);
-
-		if (copy_from_user(&info, (void __user *)arg, minsz))
-			return -EFAULT;
-
-		if (info.argsz < minsz)
-			return -EINVAL;
-
-		if (info.index >= mc_dev->obj_desc.region_count)
-			return -EINVAL;
-
-		/* map offset to the physical address  */
-		info.offset = VFIO_FSL_MC_INDEX_TO_OFFSET(info.index);
-		info.size = vdev->regions[info.index].size;
-		info.flags = vdev->regions[info.index].flags;
-
-		if (copy_to_user((void __user *)arg, &info, minsz))
-			return -EFAULT;
-		return 0;
-	}
 	case VFIO_DEVICE_GET_IRQ_INFO:
 	{
 		struct vfio_irq_info info;
@@ -589,6 +595,7 @@ static const struct vfio_device_ops vfio_fsl_mc_ops = {
 	.open_device	= vfio_fsl_mc_open_device,
 	.close_device	= vfio_fsl_mc_close_device,
 	.ioctl		= vfio_fsl_mc_ioctl,
+	.get_region_info = vfio_fsl_mc_get_region_info,
 	.read		= vfio_fsl_mc_read,
 	.write		= vfio_fsl_mc_write,
 	.mmap		= vfio_fsl_mc_mmap,
-- 
2.43.0

