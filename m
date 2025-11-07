Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC2EC4117C
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DDE10EB40;
	Fri,  7 Nov 2025 17:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AXUelvBC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010002.outbound.protection.outlook.com
 [40.93.198.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0D710EB41;
 Fri,  7 Nov 2025 17:41:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5rCnCRhhVy5lRz5hSowzfMbHMtRcA4Xj9GGR5SaOo0V5RTqg2NEZ3e8GjdX/1b/ve/ubvOhyJLG4ilx6a+xRDdt2fuHmkmrhQviArfXhgSCAQbn/Qe4N1CqjgnClp6+HY4BBVZ/Rd2AXRjD9kFsIR7tgzvAEUwgfjq6XbVuGST3N7E8CFbl4p7wxNCcI3fasHbOb4scf8kRCirfXZ7upTPIRFPjOhWwl0WOR5FBsCglbBgjUNkmDNMFk/oZZYsA/EszaBi/hENRb00PX8Zamc2+xx0Cz5ZIMuatamj5jP3mES/ZrUPk+iOOX6IWPd6f5TFSFt71F998yI/3d1WE1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GaqMjWgAjt5BjQYBXY4NTldnTblTXrZhfFv6nXrKC44=;
 b=rC5bUktKVZn+0DFIGdNs94GD6/GS43o1PGDIycT+Cgi5qhQp/OL7cmMUCNUEsQ7Nr5Omldf+wJb3GJ3dWtvMvf7fRjMpcZcKl9qqFuek9jfBlgtBLsUYE8cKRERL7h+xFCqCyj3K1PZD1gSYWQApBoN2WCwciTW0Si3PG47TJ68fpo+J2B8gYNt8CMDzG5Dy7AXn0Vcb0mBzIeF7cRtmkIMBbOhX9GDhb6OCh6ePl9oG1LY2nCjZFV3/HccxRNgosJM0/YEB19wRmGk61PrIW+pfGP1MpzSRRnKY50DUEPRAE1i8vY+uWPHlNQlyjBcAOnBC+NisCl0bCTh4xxiUew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaqMjWgAjt5BjQYBXY4NTldnTblTXrZhfFv6nXrKC44=;
 b=AXUelvBCraoq1kJr6CI6QXFEK8ud7g0qt4Vkc0IE8krfqtq1lQRXYd5d5ZMeu/nHs2rcrcOMBOwUonKuiAQbSbCw4fZLjUtGo2aqZEFefjBvl9NbtZfHlA7SO27tbq73IMRoBgaaqp7Fy8LyjyBn9OlaH1HhhJCQ5yuBJi1rc2F8kz+UBU7EzMECKldQNH4mCYG0afyXocHnFHMqUUytzBvgKi7dlXJNNyRWzkyHirytcc2MUPBWezGeSBO7Gb1fI2VufwsgV8mnJmA1femMFqIWiPrBnaUdqxQZ4DkWLB7mkLaVyOl2MQ0kObRKMD6SpGJnCqjoZQ0zKU1vt7r29A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by MW6PR12MB8833.namprd12.prod.outlook.com (2603:10b6:303:23f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 7 Nov
 2025 17:41:48 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 17:41:48 +0000
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
Subject: [PATCH v2 15/22] vfio: Add get_region_info_caps op
Date: Fri,  7 Nov 2025 13:41:31 -0400
Message-ID: <15-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF0001640F.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:16) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|MW6PR12MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fab8e41-9320-4f45-aaad-08de1e24ea55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QES1ADXvZbJ3fEap3bKlXZes61g/AbNc7SMu0L4kUefbydweXXWotnH6UHiS?=
 =?us-ascii?Q?lk9b5GDWkNaalNne7M3FmUFWRQtwLnQcvYmJ7m9jdEaaIc/duYtYJ9qLG8Iy?=
 =?us-ascii?Q?YvIcmUbIDDLbFMPamybUqqsivhA3gZ0URZ8X6tVCxFFeLFtOJvX+dZK66qN4?=
 =?us-ascii?Q?+WycRlVdd+S3myGe8uchhNyZ8WO6pi65iOgCc93ckCtNTCNxitgnbwDu/TLW?=
 =?us-ascii?Q?bf+Zws65J+GldXZBAcwmGhNbB0bIyV0S+o/246GmmqM8stjBwOebgAaXScCa?=
 =?us-ascii?Q?0A1SYraWHblrnTpq1smWbKAZQEIbPAnHQw9vcmt9Rvc1CyPjXUQAF9o0+Obn?=
 =?us-ascii?Q?kXYC6OngdHoQ2llyiGxeiQNWG2kWd59A3dgProBtMOrxoGTXvHVXsMHvWGYM?=
 =?us-ascii?Q?HJZY5fCGWVxwopytHhDWwMb1PnT6vm2Q2C0mvnEtAww2JEndQ8paWzE2cS6e?=
 =?us-ascii?Q?ONk5nxuNejlOmswAY96XlMn311Oag1Uyq53cMS8KM1uM/7qpHYH0uUobWO53?=
 =?us-ascii?Q?xGis2AIgNJkXIIhYDoynjaudUuMubtMNNwHXsApuzRYPI+47CAKzeRzkjBP2?=
 =?us-ascii?Q?6Sgp2c4E5kAsqDhTdpyiz46hRG2u54h2rR0Wy7n7JxFbImcBUNKhxA/xJJd0?=
 =?us-ascii?Q?a9fMXhRQmlEDgbBx1ZM2bPFLjKSY152e3Nxt+YjK4/sjLUEUZEwOVgBTFLoT?=
 =?us-ascii?Q?jPpLoVGK8HGOVKgyFa/BDqwB9OoxSv7eudOySRH5d2DwwnmlswqrRxlKRidS?=
 =?us-ascii?Q?4cyyfnKoQYXiwLKwpK+uXRl4/K27zOXaL+Xo4WZk88hWdNYT7xTz3Qe504xC?=
 =?us-ascii?Q?ZSPDvdja7qWqsKinLyQablZcRp5uSF/xUnt1tT+tUJFKFpnIhr6Zx5hTuZ+a?=
 =?us-ascii?Q?Ie0W0ei80XhKK3Uwd7Ao/BQ4EoMCR+ZwaiMaS7DKLhmnqa57Ow2SxBesfP8u?=
 =?us-ascii?Q?hLcKvrIKufyaBLgJ7EOtOSZvKkBL2/93+I/yANtjTTgj20dggrL2xRkDTrOA?=
 =?us-ascii?Q?Y6rWHOuQ6ZAOV5x6htdXXGRRpJnj4WJ+r8k5fw11RLMbPxwswIZXo3R+GgNP?=
 =?us-ascii?Q?R0Rzt1ao5xTmRXawGd36OXqpBEcljGgv0xDTMqZkUTVmbhby3Dd5LuBW2Y95?=
 =?us-ascii?Q?MmkswVK5K4dlfGRpzTYsgz6c+NZvJCDMto/ursLZd/Cn1TKOmwJPTuwTTHTn?=
 =?us-ascii?Q?ZUWNQ2MJVfiKbhNFqC5FS7HtlOvR1Oisp6HAt6omB1eehG6BnwlNlH+mnniU?=
 =?us-ascii?Q?4nNaMfoQDcYZzYOJU41esCOCIm+Ck7GEownG2rj7dZpIF/c6ZYypsJeEN+TH?=
 =?us-ascii?Q?ZERhxSsxaIwinpoQtPK8BtDazNLm2lHiD/XqibW2ZCWeKohubBv130kpCDwt?=
 =?us-ascii?Q?u+J0YX79YtBzz2qlhPj7BVER+12Z8POSfe/Mft1BRc8Yc5ALhvVBHrpUVHBb?=
 =?us-ascii?Q?iSdNMhyDDDuJtRTpYwjUaeoFWx62XCBbZGaNXa9CH7/3IlgGgUabQLHi0up/?=
 =?us-ascii?Q?uVotOeQWlIwBLiM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8rTX0iWMG17xLAFmW2C1Y+FD0lY7FDBnKCmrI0Tc06XM4DY0VPGddg+KxAw2?=
 =?us-ascii?Q?VTB8O14QcAnvXc6dv1gU/Xd39sQUdsqfWxlFC3VIxnTdj+CQYRXvh94La5dg?=
 =?us-ascii?Q?VxsC+hnmRI2WNBMeRNCmo6bzN3xqNM5zhOQj81SxFw8mynca1HmZIpOE+wIt?=
 =?us-ascii?Q?sevG4kFb7XK+yHIQGB1EEKFbFyI0ZaRG4yHxQagGFILUycMLK/G0Zzgr5HcE?=
 =?us-ascii?Q?PrBUlEhgW3ZfPlce1ywsUOqET6Ke2LTJBl5sp7zIg2P/sIsSz22eG/iqDP4T?=
 =?us-ascii?Q?svi0WcQelTHsTbC8Vke4SDUCmCi/a9QCtL1EMAwJ6/IoaDiP+yqtN8MI59Fr?=
 =?us-ascii?Q?qJu5B0nJIKPuJqKy6YLbh1ubXh5tf5/SfGsKRfQyx6EaFaAOitYRl/S9sKOp?=
 =?us-ascii?Q?MmTL3wSxl1Bd3ilffzIyv2MEUbhx5NggDx6Hsv04oWYmE2suddOjLRotKkpk?=
 =?us-ascii?Q?YGeC5A2esxm/D8gxXLIWpGOQwMGQHhAR37IBkQWRuLSFfsWl8/iOyf//1x9M?=
 =?us-ascii?Q?qtWiHbCxoJgt9o4uzf1/YT/v8VHMXB/9vzNV/HcP2vYqZqs6r0nkLnK+Wlsc?=
 =?us-ascii?Q?arGq4ggyNUjl77xwGMXuqGlFyrHgM4jpQPxCfg+QH5n/1YxOxclHxAI6Vwoa?=
 =?us-ascii?Q?DwOZPxD/5ONHzvvddDdq0FpxxZ3HEJyPGDu5Hb4ZkMCLC1lyPmn8iSaDNuzh?=
 =?us-ascii?Q?7PEf7sb258JkhQtW1x/1P7vTO2RUoml4n0Z/e+dlsGMNB9TV278NzV9zf3uy?=
 =?us-ascii?Q?lVuxH87fNgov0vbsfQqotqB1j9iptOB+EpP6hyYceH+LnefkPqvWeVss92Ar?=
 =?us-ascii?Q?8ypfpWnss19lb9mYPSdX3G9RSLVIpHoCy5KqtauKQ2esO+dXUIMAHu0h432H?=
 =?us-ascii?Q?/osWn8H4QeBoSLHSkBEUkdtx5ULSrUxeLOyr3WztuY/4zVJBvriM8crUWCqT?=
 =?us-ascii?Q?0BXbgrgzpu3IW5uajbc25lpYfrSdsmjpbJa/vDy8SnS9lAxszCZ8wXPKfKeA?=
 =?us-ascii?Q?8W9jTJDFI8SQNQw8gXAaiWBYo7PMX+pNqV6ubGgleQ+Nmu0DpFqvfkjyIgIt?=
 =?us-ascii?Q?azs68r2VxYPgwhODmx54h1pYuHaoq6eAIXMae3ZKch2UjICT3t7OgpqHWbtQ?=
 =?us-ascii?Q?68l/dbSmIXQCMFcxSJUM4mdEtD6rVlXgfmLZfGFmybD3tcKXOAQdRLcKBYbS?=
 =?us-ascii?Q?5Z610/jxlfXVuth4dvQ1vGgOLgwBuAWq/nfbZ3L6+JyetaI63YzEKqtq8Drs?=
 =?us-ascii?Q?XFpTfjHyF8jGeFf7FrL/8f4WVwZWhZcjQO7lgXYxLJiy0rRNNStsrqTzMkVG?=
 =?us-ascii?Q?35zPw9Kremp9RyvqVUp4/axcg/fcKByuLo7if923tYxtBePsY2FMAOgktF6e?=
 =?us-ascii?Q?uDikuPjXlKAPrg9GuhnSZBWJazEwWZPTO9DCbYD5vrmKy9p8yNT2MPrKjC/a?=
 =?us-ascii?Q?yQfTXWc4j5N+1V+PcfVOrv9XCS/ogRmDg07NSCnnDWB0bh6Pr+GAjVbIBTzO?=
 =?us-ascii?Q?AIK91joH6MoBVjnIJ26+GPr0w1/Sh37nk/mFPE6nD5eJQuW/lg/5/deWRUg+?=
 =?us-ascii?Q?8pu+gFt9wyTiImTyulc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fab8e41-9320-4f45-aaad-08de1e24ea55
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:41:43.6433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AR+8Rbzg+zLibzmE7FQVfao8b7+K575SrOKpPalv5L1AP3V98eCN+zxKufiipgU4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8833
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

This op does the copy to/from user for the info and can return back
a cap chain through a vfio_info_cap * result.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/vfio_main.c | 56 +++++++++++++++++++++++++++++++++++++---
 include/linux/vfio.h     |  4 +++
 2 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index f056e82ba35075..48d034aede46fc 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1259,6 +1259,57 @@ static int vfio_ioctl_device_feature(struct vfio_device *device,
 	}
 }
 
+static long vfio_get_region_info(struct vfio_device *device,
+				 struct vfio_region_info __user *arg)
+{
+	unsigned long minsz = offsetofend(struct vfio_region_info, offset);
+	struct vfio_region_info info = {};
+	struct vfio_info_cap caps = {};
+	int ret;
+
+	if (copy_from_user(&info, arg, minsz))
+		return -EFAULT;
+	if (info.argsz < minsz)
+		return -EINVAL;
+
+	if (device->ops->get_region_info_caps) {
+		ret = device->ops->get_region_info_caps(device, &info, &caps);
+		if (ret)
+			goto out_free;
+
+		if (caps.size) {
+			info.flags |= VFIO_REGION_INFO_FLAG_CAPS;
+			if (info.argsz < sizeof(info) + caps.size) {
+				info.argsz = sizeof(info) + caps.size;
+				info.cap_offset = 0;
+			} else {
+				vfio_info_cap_shift(&caps, sizeof(info));
+				if (copy_to_user(arg + 1, caps.buf,
+						 caps.size)) {
+					ret = -EFAULT;
+					goto out_free;
+				}
+				info.cap_offset = sizeof(info);
+			}
+		}
+
+		if (copy_to_user(arg, &info, minsz)) {
+			ret = -EFAULT;
+			goto out_free;
+		}
+	} else if (device->ops->get_region_info) {
+		ret = device->ops->get_region_info(device, arg);
+		if (ret)
+			return ret;
+	} else {
+		return -EINVAL;
+	}
+
+out_free:
+	kfree(caps.buf);
+	return ret;
+}
+
 static long vfio_device_fops_unl_ioctl(struct file *filep,
 				       unsigned int cmd, unsigned long arg)
 {
@@ -1297,10 +1348,7 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
 		break;
 
 	case VFIO_DEVICE_GET_REGION_INFO:
-		if (unlikely(!device->ops->get_region_info))
-			ret = -EINVAL;
-		else
-			ret = device->ops->get_region_info(device, uptr);
+		ret = vfio_get_region_info(device, uptr);
 		break;
 
 	default:
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index be5fcf8432e8d5..6311ddc837701d 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -21,6 +21,7 @@ struct kvm;
 struct iommufd_ctx;
 struct iommufd_device;
 struct iommufd_access;
+struct vfio_info_cap;
 
 /*
  * VFIO devices can be placed in a set, this allows all devices to share this
@@ -134,6 +135,9 @@ struct vfio_device_ops {
 			 unsigned long arg);
 	int	(*get_region_info)(struct vfio_device *vdev,
 				   struct vfio_region_info __user *arg);
+	int	(*get_region_info_caps)(struct vfio_device *vdev,
+					struct vfio_region_info *info,
+					struct vfio_info_cap *caps);
 	int	(*mmap)(struct vfio_device *vdev, struct vm_area_struct *vma);
 	void	(*request)(struct vfio_device *vdev, unsigned int count);
 	int	(*match)(struct vfio_device *vdev, char *buf);
-- 
2.43.0

