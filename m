Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB2CC4116D
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6718010E1C8;
	Fri,  7 Nov 2025 17:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LB+KBZ6f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010022.outbound.protection.outlook.com
 [52.101.193.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C3210EB2F;
 Fri,  7 Nov 2025 17:41:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxBMbUi7h5cr3daA5b9QpAEQUszBr8Pz1fif4d9rrlgMj0IVWqMBeLkh5B/dPzGgUwegjMSQ1AWaHmpQIiz+ggCCA4QkL8h9Gb0bpZoWfVs/qePFZoK3GSdqmVRI9RSq5y70CSRULSY11auXPivzNQMRuL/AidPH4ifTns+gjv99b6pNqbWfIdbRXTMunoIVw+kxaRRxqlq164EO0LDgkoUXvM4G1Q9Xt72VJuhy0d4EWcofJCelVpmTVuzjAeomfAP4mhXOc75InyoUf4xP14hWilYtEPv8MP0QrDAJ7LHZQyr9AvG62Xg4U3FxoUxPKDa2E+Ght1ZYrd52eOwi5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2nPZmV3ayar1iM+s4XImqVDPf1kLFyHXdBNCnA7P64=;
 b=eUbIhcPq1aZszZe6SO7x9SBtu9UPi0mQRmQKMg00FXysf80tK58o9U4bMYnmeFaf7mzVgBaM+X8wYDatqW7DpOUnFL5fMeEEgYcsitGS+SkbbSC1/22RnDZ5VlTJESiKqxoj0PUOjfdtHNOnMZOae42NbBSWUeSzD190baTM1ybiXjzEwuif/DFchQacNrADSwCMXuRx8Qfl54LIbTz/FmWXPx7nZojENm2VoqxqZTLrFGBk5OThtJhTZ/DkU2e7UGmaYV3Svbw0jtZoKcgppXpOslT0n4T18CVRT0BBwuHP3JPxMobizj/nKLF6Fz1lrRhqCLyXvx4nvy5Ky8M8Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2nPZmV3ayar1iM+s4XImqVDPf1kLFyHXdBNCnA7P64=;
 b=LB+KBZ6fNF/+qLcO6vvzjRTbd02SFrWZraStCl0iU4HDT5PfjlSi/s3fYNEP0YOy9QpmAEgsTRL0Ep8CGojUZvr6m9Jk79st4hG1LeAaSu+UHpP15ijYFiz2l3+Hrb7ZzcCIKprmvfJUqwGN08ZRnAHFltaQmOR4IVpt/p/ptFjUssG1HPwKV+JC/vbCEuLB4p90/O2rVmkh5F5hh3VULjC+0do/PLI7lrcpl03PWm/Ou/sdkHM/xvdtsIfama2wOtalpu7Z2z7xvLu7Om7emgCKThYOkkyJQWzB1tq5r9EDMREL1++fRC/GuX7CTmi0ZO5WuqItUQ0h61tZEAOMhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by PH7PR12MB8826.namprd12.prod.outlook.com (2603:10b6:510:26a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 17:41:45 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 17:41:45 +0000
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
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 virtualization@lists.linux.dev, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>
Cc: Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev,
 Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 11/22] vfio/cdx: Provide a get_region_info op
Date: Fri,  7 Nov 2025 13:41:27 -0400
Message-ID: <11-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0037.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:5b6::14) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|PH7PR12MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: 248302e0-12fe-49fd-0e2b-08de1e24e9a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1gMs3IHS/bhQE0+8cUDBdGTPxAB7zJqBykYlYZwhwXxBh8TpfF3fpGJZl3sg?=
 =?us-ascii?Q?k1LbmlIlAZY6laPwbWzvYj8w40jMjYSqM0acW5uJZUV30fiuyrkI1aHxFO7Y?=
 =?us-ascii?Q?nf7bBx8RopnH9V7+sCzmsj1tKj0sVU3czbL1+5gjG5jOOaqcxy7S30EF5k04?=
 =?us-ascii?Q?nNXokKVuNaGHqEoGuNDHwGX9foQqpo2Jg4yIUCyRJYUrultdPBGnQbxw/Cin?=
 =?us-ascii?Q?bqHEku/ZPgMxj4vQwe99tdzdmsUmUjeNo8VB5WcUY7zFDAYU0V6n2PETZQyK?=
 =?us-ascii?Q?iwFbjd4tA2LZUPGWFcN1V8ikoq/bfrpfRvInJP9VpegxR504AksX3w+1TreL?=
 =?us-ascii?Q?dkbAuk6K6St6bTSCNBXrAT8bEt4La0goS1qSGCMnICDLTWMVx9rTrYlo50ue?=
 =?us-ascii?Q?HsxFGX5FauR6bBtqXDYNfMSpyulzkxTFhZPkiT72nK78Z+Xew2yBtTCpZbkd?=
 =?us-ascii?Q?zBLysh/OJ527N0325FBwVNNBNo4W4iJ8phrqwd/2XBhVAFa7m1f81re0W3MJ?=
 =?us-ascii?Q?K/7fY7gl5SMyS59IcZuCdFQWJNYlkQ23nZ5N2oqUFbLKTxSS5g9A9qs4kis/?=
 =?us-ascii?Q?V17uHpXINMZ2d2KdeXJ/uqWeJdefW7zT95W+i55bFRCubN6/qgiAQPdoxfgL?=
 =?us-ascii?Q?b/McskYy4x/UtFvhXy8fRTjJ/MT9RgIej1QE3lePH2IUNs5Yu5BhfWvlKhhQ?=
 =?us-ascii?Q?lyu8JufT9ANnnde+71oiULZ3Ep2Gw0MrrRcH/j+XlIyJzfIrESyfX1SEDUej?=
 =?us-ascii?Q?hQJ0CadSqzXNPCJaZtXpbh2iQB/CJ7Z/NxwKsNeS7e0sIj4ymzA53G4i4ady?=
 =?us-ascii?Q?VvXZXqRJD1XARdCJXFJi8vlayA4YJJXEruKHDr9I/VBCP1DvhHAw+GlsyBQQ?=
 =?us-ascii?Q?5RGU8aXeaqZodX++usrGH5ysihDubXDRi9BfyRtOJYMOBXe89L4/8pc5aThg?=
 =?us-ascii?Q?kWzxyFwPvW0HaaLfhX64LsZdG8dEq1+phjxGys7iBx2S6vxxRWH4rKoSTb8u?=
 =?us-ascii?Q?YD1J9lHC9wWqzI1mA05JCGE/hOFOUF+GOhDeyH3sjbWt7Yl2vPKZ2vxCFWB2?=
 =?us-ascii?Q?raGCCHYWx2+2VnCSlmS80EU4Zl78oIxzA20CV3dODSTWTJPyTvM/59J4LmGR?=
 =?us-ascii?Q?ZNytMUTpWDiBU6PpJQsl5yIvOwo+wmm3qvd5DteIIpY5eN9WDiMTQSKYXtnS?=
 =?us-ascii?Q?Fz1D/Y/zRExrG0AJW5uzH0yH9Ysr4LnPmAfsToXI0kCf/ccrSJOfX+pWjkIO?=
 =?us-ascii?Q?ouMC7VYa2DWZzdsMQBJvkAM7Z322fNVIBfiRYF9FjFUkfBiJgbmCpLFE5FJR?=
 =?us-ascii?Q?nCHnkPxA3UrEH5s9HWR0lEbJgRO4K+KOnwtBZZbSoqMV5tUBEulvP5kL66sR?=
 =?us-ascii?Q?YiR876qw130yMBSeQDYIYKUxIdo47YwrKGUcmlBweUKu8CPIUEGNcXJVMWTb?=
 =?us-ascii?Q?MAmB1dvIks9kNiw+H5sSsHAqxHuquQ/bo+eg1NjZTScI0kl/aqoImdqmNr6T?=
 =?us-ascii?Q?BuQnqTLz6azaywY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cnX6uvKEcX2fgl7sSgEyP0/GuVcqH698Wn+1Uw8MwOwNyoQ6WAAzTdFmkAzM?=
 =?us-ascii?Q?XX6u6O/3FzNYnegrHWErxNWLrtZsdwUdFhPFUqV3ud1wQ0QOFi6ksdMYmryr?=
 =?us-ascii?Q?rO2ObfbXPP4hBk++kgGX0QZYSYwnTr/b+BRm/BWKCfHlS3nwvEYWc7OoxMcA?=
 =?us-ascii?Q?cTe8r4+rUF0cmEFuxsbGLnUoCQqy8IVmmGf3jIBgJ4dUJwoXqEA9zfQBkJMG?=
 =?us-ascii?Q?gl1CNjk0NJPAEB4seMAZwF4hB9u4LZAiQGkhBPpQLjd1DT4y/ZF6PVpxTGAL?=
 =?us-ascii?Q?2Alu0W4wQBbxBBNi++4naO2y/GFzCuu+YIfRQrW8E2Ls4xKZfk5gg25aN7LL?=
 =?us-ascii?Q?YZSm416NBULeIa8B7Ug1zIz3b8m43WDpsDHs4jfhbO77FUJdN08mN3om9nP0?=
 =?us-ascii?Q?PQiOgHXBuMlviVL+BhHQulV2JSVDLs2IaRK1bx+hDI6/YYJuQ80uMregsXqr?=
 =?us-ascii?Q?77oZdtqx4orllE1ITrTVp5EGZgWV6r6yKFvFKTuXzVqPeFPzm0BfJNGdmEKd?=
 =?us-ascii?Q?8/Wz0PMXeDVKY+ttBOde9ihTNfg5d4qivKGmQ+h+xzptOhStiFEGwEGs9ZBC?=
 =?us-ascii?Q?HPn41nZ3o8gLwJK7sI3arw9qtecSGtK41Evq3q2nouIvVwV3zxfaBMt2Ed8R?=
 =?us-ascii?Q?JzHiUVIsCgmSr1vWTVhhUDuNMfZJUdmGcquMQN8Rv57CR3pmBc7e9xdUcmuG?=
 =?us-ascii?Q?KGczWvi8Giv7GbF+pY+f5yutrbTkXk66HupcUPr/srdc4H+foK76Lnmu0ipO?=
 =?us-ascii?Q?7FMwk3Wg7J3G6GkO2Rr31/EBibotAWOhi25P72+WBj4WggUpZCmVtGvGcwZV?=
 =?us-ascii?Q?FJWL06Bl48DRJicYBLZ1Ip+EYwq6yrNnVHAo1ktikHcUfygF1tXzPRMcVj1p?=
 =?us-ascii?Q?siiu5sLAaAPV9IxNLgSaxJhY3taOjJcMG/MlWbc9Fr7HNG+1YNVf4VAO7hdb?=
 =?us-ascii?Q?mLcclTXzbsgJcwITaua0yY/5xd1d1LcIpy+cIvPXIpQiIGkjHrP9V7Jpww4v?=
 =?us-ascii?Q?XtF3nvr8BYi6lMeJ6kMbPtpK6Eei8z/VOHdttxvFiaS/n8YtVja0tK1mXsrP?=
 =?us-ascii?Q?zpbCr01icHA1sPr9IM81IRHGz2IL3zU2cKHWTVb3U/3Hs3cxawt2xbC1g9Ey?=
 =?us-ascii?Q?HrAm4LufAVBMnppZGnXIXiIykqiG8Tl86mzyO5TsckDnBL6d1tPiAlzgTq4/?=
 =?us-ascii?Q?vkt2P6oI0O7LIQINoo5J1EGe9JUAP0VJkBJvq8wBjFFY4DcTpOc80LLyx1Yl?=
 =?us-ascii?Q?52IBMlC+bAJAy3LoPXdhxV19aRcEdK+WUIyPD/jsjJn50z/dGMyoqkqq8uop?=
 =?us-ascii?Q?h+O015+Pidk9jLhT+KiteFk4tkjDvlrl+2OBd4Qs4FkLp86HjDzTzeHJen6L?=
 =?us-ascii?Q?DR5qmmkyE/ZS+I1skXKE9RQvDVEJGa3B+HNHu2rbitUzdrWrupg65bTQZDdQ?=
 =?us-ascii?Q?NPhIfYRUUciCgKDbOn+bKvjj20fYzsxThz569JVm/fxqsbHxdqJ/KVeyQV3G?=
 =?us-ascii?Q?cnYPOJqmvWk5p6CLvJYqDUxxpBYEaLNLw9OJXMofEayIiS8xHAVJHBJfcn9Z?=
 =?us-ascii?Q?BjLquD9VfTdR1GRw5Vw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 248302e0-12fe-49fd-0e2b-08de1e24e9a2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:41:42.2753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sjlch9H+JiNZydixCRFDP8zkd6Uj36ARAfg+wEiChKyKMQJGIJpqU8nI90n2nJWA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8826
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

Change the signature of vfio_cdx_ioctl_get_region_info() and hook it to
the op.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/cdx/main.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/vfio/cdx/main.c b/drivers/vfio/cdx/main.c
index 5dd5f5ad768653..506d849139d35a 100644
--- a/drivers/vfio/cdx/main.c
+++ b/drivers/vfio/cdx/main.c
@@ -129,9 +129,11 @@ static int vfio_cdx_ioctl_get_info(struct vfio_cdx_device *vdev,
 	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
 }
 
-static int vfio_cdx_ioctl_get_region_info(struct vfio_cdx_device *vdev,
+static int vfio_cdx_ioctl_get_region_info(struct vfio_device *core_vdev,
 					  struct vfio_region_info __user *arg)
 {
+	struct vfio_cdx_device *vdev =
+		container_of(core_vdev, struct vfio_cdx_device, vdev);
 	unsigned long minsz = offsetofend(struct vfio_region_info, offset);
 	struct cdx_device *cdx_dev = to_cdx_device(vdev->vdev.dev);
 	struct vfio_region_info info;
@@ -219,8 +221,6 @@ static long vfio_cdx_ioctl(struct vfio_device *core_vdev,
 	switch (cmd) {
 	case VFIO_DEVICE_GET_INFO:
 		return vfio_cdx_ioctl_get_info(vdev, uarg);
-	case VFIO_DEVICE_GET_REGION_INFO:
-		return vfio_cdx_ioctl_get_region_info(vdev, uarg);
 	case VFIO_DEVICE_GET_IRQ_INFO:
 		return vfio_cdx_ioctl_get_irq_info(vdev, uarg);
 	case VFIO_DEVICE_SET_IRQS:
@@ -284,6 +284,7 @@ static const struct vfio_device_ops vfio_cdx_ops = {
 	.open_device	= vfio_cdx_open_device,
 	.close_device	= vfio_cdx_close_device,
 	.ioctl		= vfio_cdx_ioctl,
+	.get_region_info = vfio_cdx_ioctl_get_region_info,
 	.device_feature = vfio_cdx_ioctl_feature,
 	.mmap		= vfio_cdx_mmap,
 	.bind_iommufd	= vfio_iommufd_physical_bind,
-- 
2.43.0

