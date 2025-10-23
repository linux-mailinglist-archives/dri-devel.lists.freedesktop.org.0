Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64059C03C44
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C01610E993;
	Thu, 23 Oct 2025 23:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JVwyGwMf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAADF10E991;
 Thu, 23 Oct 2025 23:09:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMjIzcnUhNiYsZ+hL18/OkMKmRowwcXPbRpG3F+HfXAYuncthvl2MuaNg0DsQ5B8dIWpKn3U9BIIFHkCN1wNAA6SMJdcx/LZDDnK+uKcP7/FoUM5Zmu7FLFEjtkp2GsZZHdjDjUj5h0zqkklUGXudl2RFor/MWeTa8hV4jl6M0JD7w7ugftApExoKKqQMsJFdnzuMFmyFnV1qGxv9MUm2Aqz5CzNWZgrVZLPS64kM0qOstbL4CPmOeZeLlvK088ic+B2xCI6fWbeSTQcHDpw862PLv6AbSWLAhtWKKp/J8UK66SGOnuaM4XPaqMrIwrNhUYZY9am69yTSDP/18Bv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1hKYkCyk0aC9+a34lHsyRgH/PIXbPe6fiJ6pJ+us6E=;
 b=W0adusaj++y8Cydt/vQD1QFG0xH3SQmYTh9TF7lrTD+d9mvIKoqgCWP5+8rB2hqndR+Q+LEGjCBgil5q0tygOy+gIOKM9AczURxLujAHZQSkeIsXXfSMDKq8mdj7BEuCk+qDl/20WuNxHBtjPXRnT00PTgTyckTaSfLBRgSQqX19cJ8Y6Je9HhguSN06yHZxSiPQU2nD/vv/A8b9loOcsk5Tgm0y7Dkp1gqnQ9fvyU6Ti0OUTMbvMv1ON9NadCCqybbqS3v6goGLzlrJNA2bj0NodQsfSfzOGric6ioiqwenMLXAR6nLa8vYgMjl1hixIismGcjUvulLCdku+5JcnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1hKYkCyk0aC9+a34lHsyRgH/PIXbPe6fiJ6pJ+us6E=;
 b=JVwyGwMffwzmh1D3oyk7trJn7w57reK0GZRGYlUG77apjHmqc6Z2oS6+MP8Pysr3EeChy4xBWN2yll/E6mLDEvHKgC14iy2vcGep+6U201Aj3zdx9i6Yrd+VuuHf3PoQxJGhahNOlZk6XXuvH2Ti4uqMN5nGjo7EJKexwzW5/EbT/v33HxUZab6kVXEO6L35nx9UK3lTg/N/jd1p8DC8YOwHk6AIgbl6KM3F2BfFGEw9UmE4iZS20tH3Sk+mKk0hHhlx9Yx1Jr8XLm1tjkcvFnsVpkMGQZNRZeAeUuXfVenuQpye1zFShdakIMad4plh3KyFgUmtq+EV1cJSu0N/yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:09:46 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:09:46 +0000
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
Subject: [PATCH 08/22] vfio/mbochs: Provide a get_region_info op
Date: Thu, 23 Oct 2025 20:09:22 -0300
Message-ID: <8-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0035.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::48) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 57393e4f-f3d0-4cec-7642-08de12894121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+YII1qu6LJ/GFbPi0omcZdxmL9QIrRkpgyVSKJwWuA92280EESG9OK8Ix/en?=
 =?us-ascii?Q?g/X8pCOlRRTDSz9BIa4cfPizQ3mR1mD2Fyv+sPjBTA4YzAbu95qKghTJNwoM?=
 =?us-ascii?Q?LQ/ZsTe/y/7/OY4xrTj6wP9OP9TqQ+3gaOwGGhEP6ewxOWuCjfTOYqGbj7PL?=
 =?us-ascii?Q?SgI25p1jrB5n58L84ssYuNAa4v5RebkdAq81lLqNSIhbO/yVxHJh37f1vP1q?=
 =?us-ascii?Q?pPNgGZn3TcGDTft/qhWmX5OGm8tsrEoFoYbMarXluxktlS1TLUc+Ch1s1rys?=
 =?us-ascii?Q?Zom3zOWyOKDJTm9ruH8o4jKMOgk6ij5ALkfcBUgBNArGIiqz8tb1xDilDSoa?=
 =?us-ascii?Q?T/zeS+94HBsiBrhdd3R8yKHiqJNbWPFr2C84R/frl1499WDa+Yr15oXcDREe?=
 =?us-ascii?Q?af6hSahwOuJvrWBHnruprBJSRnNspQo2phAji2tPQmi9RNzykhy3PMEcF5c8?=
 =?us-ascii?Q?8Sh1u0v7z7IiQThDOLsurL3C+BNc1731VG8pYgeS8ZyiVCDh90hEZp0jqyCp?=
 =?us-ascii?Q?jjM9Q0IaMQ7Ic2VMjp/lB5iKK8Oxp3llFntLOc404Hv+1jdrhLqpC4U5poa5?=
 =?us-ascii?Q?Wgo1IcNbIKmy+Frvm+N5cuXMpzO7amadyjT+5jbgYV5GL1wL3qmYuqWrUmsV?=
 =?us-ascii?Q?2VxH5mbrpKHPxB8DjxnXM+l94KB474ZB/OTXCpVtGTjm0WHk2fiRCF3/FTqx?=
 =?us-ascii?Q?gxBYiOz3FQezodYol69QCJG9s/rOwU1aPEuRrvDWBoL9ECX2djs0xxWq8vxQ?=
 =?us-ascii?Q?bY+An6B6FEsToy3kpN/zglrM6ISWapjPFd6ag8qaLDd2jVSVIYpQWf3IC3YR?=
 =?us-ascii?Q?VQgC7z4V9/8UpQ+seASbyt16dJT2sRfboR67dLe04ydr7pXQIJ9p9+On45dQ?=
 =?us-ascii?Q?YsylIL0w4Ydi11n+cK58KfXNu6YBL0jOYrFszAHnqFOGOpIeq6OnBPEcA9tH?=
 =?us-ascii?Q?l6RdnMb9XTobkN5j9004AP8ZOOpVyX2zGW+uv0dXWO+CUHRVf7yE2ekfKZDG?=
 =?us-ascii?Q?97AFF60Ue8EHtYHhT2OvaCDppzzVeF+hitecMfk4eg65HHVy1Q7flgZGGOhF?=
 =?us-ascii?Q?HAbg/RGhQjdsBTIm259lUyZyCJFhKT1eidM7C8wpSlVK2uEUf9aaqWirmRoY?=
 =?us-ascii?Q?a5O4kxbZ6HWLm9FDFhIeknPYnN/h0G3FF//JorCGAyOZO8WsXab1TGGEh/j3?=
 =?us-ascii?Q?CKzBIN3EaTHSNyfGqc4FZdUUZRqY2Szik2suKzwhpERtFdJD1fxBs4irfF0y?=
 =?us-ascii?Q?CCZZi/6hJomWSBzf9lUo3pl7upcoA7cH5WivvqqO2K0Tfl5CJOCAf0XbHasy?=
 =?us-ascii?Q?KXkBcnH0Vx0glf7dnf+3qnBb+m7PJvNzsb03/juvIoRZfQXSaFEpb0E2ZlyT?=
 =?us-ascii?Q?AoOzdAhroaELCuHCtPWID669DDbJs4SRlrQMwMOwcTLnXnfBiFBSbjRbmAj+?=
 =?us-ascii?Q?7Is/OvHKMlCUkvRiqd/nVjSmRRo+QxzVJReEsUnBbmRrbxLFsuvwwzTbsliy?=
 =?us-ascii?Q?2c7+nhK+qN1oI6E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AVh/CoT8xFqF9oelJgcz1uJ8HOdn9532xWlN/MH9M9Ld4+wSNYxCluwZ/KSp?=
 =?us-ascii?Q?V40hcT0wyjBs8eKUsXMXCRi0nWKbhnsvj+OH6PQpAw9WKciTbbqSwHTarUTb?=
 =?us-ascii?Q?+tD4hZp/slaElMNe3xGWGrbKZgg7ca02Tz+V1Wl8pnZt9fhefoFqJ5g0v5In?=
 =?us-ascii?Q?9s/gfLuSbpDI5mk98s0jxUKNjidVVoA3j0HkBvEmnYeiuW0lSgqyA/09h/8n?=
 =?us-ascii?Q?wRyoW95xar7vLyrofNXILZl6fsD/oN48pTVzW296WKWzFjF/z63oELDJpYbD?=
 =?us-ascii?Q?lX+2ECbZmXUt8KiEqoG+ft1VCrcDV57yw46HchJLopaW8mSTu+ixBGMVj/cM?=
 =?us-ascii?Q?hIaa6XdfQoVW/OwG1CaaDyMkjOJIEnHssNmM7Hep47yj+P+jiUhcA1uSGyV8?=
 =?us-ascii?Q?qSmWsQS9hMczd3LLNMcH68jnN7JpO/7C7FfmlxSa9SlbCa+wH86pDAQGhvIO?=
 =?us-ascii?Q?wOsWyQUNW0N5jjop3EvIyyt6cVNI0ZmgMvhttksVY+XqFtfMXedz2hOZLEzc?=
 =?us-ascii?Q?sEfmwPfIQ+IBPRDDDCD9h4REefEF0uj7v1u881mCB3P80OIS+xHgpw8hW3me?=
 =?us-ascii?Q?JxAa7bAqWFm7dnWpy8yfLOqfDpCWZ6sTJyBg7dCWvbLW2o1iVy6boXB8BlKw?=
 =?us-ascii?Q?4zdQFX2MMI8E9ctLKNTFiHgccNDcYZ5Gyqr6Z7XUyFdP8VPenUbH2RZtjCIq?=
 =?us-ascii?Q?oF66d3SPd0HBdq0sLc8P6NyGiHlLKiEia6dWCI+jZOXtktP4O/3BhrBbeVQq?=
 =?us-ascii?Q?MPHoOi/vzNm2pjMt9ssa1ZloZnqEWW7ERrT/yMjlBu1L49DYhB7W0CbvXC+f?=
 =?us-ascii?Q?mwTqg1QX/sJF1cJ3J2SuJAdLNrmADmOjFX94LX4+dWNpCLjWOLOViP/VSG60?=
 =?us-ascii?Q?VVCZgjlt2s68KxDvrosBi4a2p1fO6SGtmJdabEsgS4MbKRMC1ybVu7ZlbAtU?=
 =?us-ascii?Q?4Zts2IjCXJ+mHk6zBoTVm61PxpqKnO9HgfCpIGob99MYnqp50QbRpr5ft+ZL?=
 =?us-ascii?Q?fw1bpwieaP7Y4L3YFJCZq3CAJtXnYjCdR1CoFIFN0oUePNBADnMhZ19+16fW?=
 =?us-ascii?Q?ONrd4bloz0OGGjhL6T8USCrzJMGzcnoAFLRfmkoxWDPL7CC0y+Its8oK4M3S?=
 =?us-ascii?Q?R+ODsRwbPnq5cBMIRl+zEYnIQD+r2oM3ue74hdCtOioGBWwOK5SwTJiy/d44?=
 =?us-ascii?Q?WLO3/nqGzhBbGWA95xH3jGB9/VyIhGQoH79z+VZo5QNZjM90+uWcp+ZTDMzO?=
 =?us-ascii?Q?ooECwoReNQGPX/qVyUURmGXFlzT0UiGRB/oDFJfHynVl5t1NqJV4KG5d/Xsg?=
 =?us-ascii?Q?uaDBzgU8NpVTl2pnThX9FKseQIwIreLoBsV9bLg2FmEY+88aMbe7PEZ6fFZQ?=
 =?us-ascii?Q?Hzjb8dYTloPqRwxhh9HoTKkJRhY8RZCi0tab+l80bLdn832/GyiMrlVFWxGP?=
 =?us-ascii?Q?J59H3e0lRs5w3dyca1QjuS2fHlFzOT/+z2f4Hkm4aOmSYhmjFoQ4Xt0MTn4e?=
 =?us-ascii?Q?VykTB5L1rLzgj1Z+h/sW9srtyoU2/6b1+YdCJBCmbmJVvTxlnuLU7zAAwcnd?=
 =?us-ascii?Q?kbj5MBWm7O7Zx8G/d8+QoyEZw0BUmCiUPIjlx93o?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57393e4f-f3d0-4cec-7642-08de12894121
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:09:44.7965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P57r7Ml9o1VJLBVbZaShKhdOk4DiBkDcAIgds9pKKVtVDyU7Sy8LP5KkWjXD2+Yk
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

Move it out of mbochs_ioctl() and re-indent it.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mbochs.c | 56 +++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 18623ba666e33f..7f889b31fa2ce2 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1185,13 +1185,42 @@ static int mbochs_get_gfx_dmabuf(struct mdev_state *mdev_state, u32 id)
 	return dma_buf_fd(dmabuf->buf, 0);
 }
 
+static int mbochs_ioctl_get_region_info(struct vfio_device *vdev,
+					struct vfio_region_info __user *arg)
+{
+	struct mdev_state *mdev_state =
+		container_of(vdev, struct mdev_state, vdev);
+	struct vfio_region_info_ext info;
+	unsigned long minsz, outsz;
+	int ret;
+
+	minsz = offsetofend(typeof(info), base.offset);
+
+	if (copy_from_user(&info, arg, minsz))
+		return -EFAULT;
+
+	outsz = info.base.argsz;
+	if (outsz < minsz)
+		return -EINVAL;
+	if (outsz > sizeof(info))
+		return -EINVAL;
+
+	ret = mbochs_get_region_info(mdev_state, &info);
+	if (ret)
+		return ret;
+
+	if (copy_to_user(arg, &info, outsz))
+		return -EFAULT;
+	return 0;
+}
+
 static long mbochs_ioctl(struct vfio_device *vdev, unsigned int cmd,
 			 unsigned long arg)
 {
 	struct mdev_state *mdev_state =
 		container_of(vdev, struct mdev_state, vdev);
 	int ret = 0;
-	unsigned long minsz, outsz;
+	unsigned long minsz;
 
 	switch (cmd) {
 	case VFIO_DEVICE_GET_INFO:
@@ -1215,30 +1244,6 @@ static long mbochs_ioctl(struct vfio_device *vdev, unsigned int cmd,
 
 		return 0;
 	}
-	case VFIO_DEVICE_GET_REGION_INFO:
-	{
-		struct vfio_region_info_ext info;
-
-		minsz = offsetofend(typeof(info), base.offset);
-
-		if (copy_from_user(&info, (void __user *)arg, minsz))
-			return -EFAULT;
-
-		outsz = info.base.argsz;
-		if (outsz < minsz)
-			return -EINVAL;
-		if (outsz > sizeof(info))
-			return -EINVAL;
-
-		ret = mbochs_get_region_info(mdev_state, &info);
-		if (ret)
-			return ret;
-
-		if (copy_to_user((void __user *)arg, &info, outsz))
-			return -EFAULT;
-
-		return 0;
-	}
 
 	case VFIO_DEVICE_GET_IRQ_INFO:
 	{
@@ -1376,6 +1381,7 @@ static const struct vfio_device_ops mbochs_dev_ops = {
 	.read = mbochs_read,
 	.write = mbochs_write,
 	.ioctl = mbochs_ioctl,
+	.get_region_info = mbochs_ioctl_get_region_info,
 	.mmap = mbochs_mmap,
 	.bind_iommufd	= vfio_iommufd_emulated_bind,
 	.unbind_iommufd	= vfio_iommufd_emulated_unbind,
-- 
2.43.0

