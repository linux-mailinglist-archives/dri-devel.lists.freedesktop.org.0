Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74881C4111B
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C00E10E1CE;
	Fri,  7 Nov 2025 17:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LllH6/96";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010022.outbound.protection.outlook.com [52.101.61.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DC710E1C8;
 Fri,  7 Nov 2025 17:41:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gr7BgZMxJp1Bb13ck9UsED3rRwKceuxKBJJHWxiV2XTz3gPyK8VM/vsJ8mUajBRVd+0/53IdyOR0LsuSnvFoRWj9tP/czIqQarHRuu1hsbAyLl7bopi2lbdcBSijMkMDD2n8/62FoXUexD7etEEg8mZO5A9B5FD5rv9PslUmB6IL6nwkK5XJLfyDLcO7orL4GMhYHyngEnHeCf4vgfhUiGgKLntmoTZK5mo5Cq/JlWHo3Eh7mc6C1oOMw3185dBSrhE7w8bYc1s7YLGoVMxg3bOUQW5iMJZ7GFOtkWHUx2Eoc0s7CbquJAdOHor+oEWCoFwQHhtrMFAfHseiY10DsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29fWgNKhmQP+In0rAZrq4QS2FZYdxruVJmI4g1EJYB4=;
 b=VzpX5+ioHBZG9t8a2TEj5JYvcRuQME62sVImh2IaHzSsyrnH/5DoGqJ3lxm/QSVNb5Z0bE1BbFFJSONdlJCk2MwRVrNmSxhtTMsY9KE2EiLYJs9jjDpI8FjTenBtiV+V9/Y64Xr6Q0pbTtuDfKAoKwlMSAYT+WHMc9QzfMyfmBw5nbCmLHCxrXgPCdkS5pNGvZvGR10weTsGrMH7U/oHgv5N1wealSdjuCxd9fRNOq+hyjh99QbYjRSTq8sL+3FS5FvJYa/DgWu/hdJ9ILNJU39/ZbA5zr2zstzYTntbOG0opN5ZhPcp7BCnNuBtC2QWM/67cyrXdC1X1ppzLxZo6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29fWgNKhmQP+In0rAZrq4QS2FZYdxruVJmI4g1EJYB4=;
 b=LllH6/96VRG1iB/cH4kSjeXX5/eWxuDY0vXNzMU6tlQHbZYV7Q4GsUIuM3qNUXQ+64UMYluroUJOdYsuIsNorxyCqgUGXCvo2x4Iy5m8J7agnoIqu0w4GwZdkr5305E24yKtnTViemwx0DAteZ9Tn/j8zx9HSal/BHv4K+YbAn/tGqetY1lYCibN4VTYt/PKSBrj8WXjYqNmpeFj8wystJ+8MHGjYTIaxDcCDmf2ql4hKEaOTEZRIHcDIXVQldoI9cPMIZn5GwLDShO1rgf58cnamJP4E7j2o8JLc6b8EGBZNvzsYnQe3PBAIK/dmevDDo+/zlGX1sRWKRdvkNg6hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by PH7PR12MB8826.namprd12.prod.outlook.com (2603:10b6:510:26a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 17:41:39 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 17:41:39 +0000
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
Subject: [PATCH v2 06/22] vfio/mtty: Provide a get_region_info op
Date: Fri,  7 Nov 2025 13:41:22 -0400
Message-ID: <6-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0447.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::32) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|PH7PR12MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: a158fe60-42df-4ed5-d9d8-08de1e24e824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZodgfdvqpQf0qe73D2Kkfd8lh85oUENQi8j+Npdrq/QHUvKyaaTMI7ubLB1z?=
 =?us-ascii?Q?WDCix2XgEOeSDxV3waMRfw/ZIo7TX4/Wbj5n3t64rTmfYIbuFPFee8eAl1uu?=
 =?us-ascii?Q?+5Mg3zgLaU4osVnPl5faoJF7OI6sjKOosd1akzxfeMtdjBZKhKbEoexwShrr?=
 =?us-ascii?Q?0SZMXP/T+OXAUm5Vxb3dJoyyHDmOsQXGyjgBnbgQfcv4372QE1hTLx6dZiMI?=
 =?us-ascii?Q?SomNbIqntF0z5GfW3NTfVyh282XXDW0WCRJNrJTEBnla+1ThdNZKlRNl8TcJ?=
 =?us-ascii?Q?4rpW/a0A+mxOOQ3JTZ+L48LJNpCeYzDyuDoFttFEyWXD8yCi/O/wHo5/aqtg?=
 =?us-ascii?Q?sFDEz4vj4cPfU2sITj/vKhJBk0FF3ZTEnGgle0Es9sf1eHAGKZzLZocZTVaF?=
 =?us-ascii?Q?TNJmIxsRXEIP7Bu4NiASq8N1JubQUpksPmahSSvG46osD5SPdicKNskVRFhq?=
 =?us-ascii?Q?IFPNeFOnzlo+AIErpmFzOr7i0WA/xP61CN0tZgxjcLHmgp0PDI9hd4EAhlbA?=
 =?us-ascii?Q?AoKHWYjpIT1KbkZ0ivSBP239dSvXGNGwHKrlBl1Ugx047042Mx15m2R5S7Wp?=
 =?us-ascii?Q?j+paz+ClfQ9OAfbg4C0sXGSdhZnFUjBL2c9EO4sJ6Ka9MUZjJy+hR7n/Bx0k?=
 =?us-ascii?Q?3uHCwGTy4bsV+jdZGehQaBq3IFfn2kJ2ES6QrDKYc7+DXs3TjM/luumte4qP?=
 =?us-ascii?Q?jBxE8x1kyK9k9vxiNgm+LRbyiFMgLE5tbaAtTnBM43+5VEqwbHlYfDi42DYW?=
 =?us-ascii?Q?UVz8VcF4UhyVhU6iiU0t2nmfAdqLA76dZBm4Ys8QqOrDBb23TC0rjPGCpUFD?=
 =?us-ascii?Q?4zPsW0zOnoRKGHSjUDmZUZJOkzueDuKof5ngS2wwn+5qkmabBJnnfsbAPSch?=
 =?us-ascii?Q?n3nl+vsvaJYW4yLg8eqwg3aOILA1anORhHyGG/haRveJjvjntUf9l7ji2GeG?=
 =?us-ascii?Q?1vayqy8zYmfQGicoOe4t8PruHUWvqme5kH2EL36ZgOmEB8DRk9zdoIaELZ9L?=
 =?us-ascii?Q?cE2ivqEmZt8T31zjMY+uZt1Ttpei06Cl6gPeqlNZjkzrqKbKW1QnJfsziHkh?=
 =?us-ascii?Q?SbuctJcQKpsU8LyjR7/JS2YRqkhaV9ZpmUQpy+ZP1wewHOmV+roJgUgk6n3k?=
 =?us-ascii?Q?bqxTM/kAkG7wy/VlLsmkNGDUqPyVxnOnK5azMUOAA95M3JzYhr/BjG7lMREY?=
 =?us-ascii?Q?Lw/XdEx3Dl3stqvGDNTQZq0jfT5AYr24bx1GG9D0bRnrv/o3LPkhwiJQF4Ax?=
 =?us-ascii?Q?Wtw92WdvzwhNp8caY7TSel04RKMfDDe674gHOrLwUnFKZS08mHPBZwgZ6ey/?=
 =?us-ascii?Q?nB4NTDyRWc5GY4joORey8VaqNVHQa7qL0yxxRPLIHO+3tjKgSabIlag3y5DJ?=
 =?us-ascii?Q?CNB/TGg9uOiaF0UfyY45p+WGOld36Qtub4XV+gxz6ZG8okEZHhGWRgnUVSJ/?=
 =?us-ascii?Q?mOJCQ/ckrJlaOZMzifcxPpcd+3R8IV8KJBAf+WaYfawigJ6h+SauT3I0X38w?=
 =?us-ascii?Q?CqDcAdZmx0Af5mo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F0y/rQD8Uh5aq/ML7UEf+1hgBoyKtFdQdyVBG5wXUT/QL9JmdYmhHerhFMos?=
 =?us-ascii?Q?SiCpEZT09Y9k87xG9FUyaa1hqSxOvEjrX1YfSIcNYieOKOu0Y79d5lMQqEBd?=
 =?us-ascii?Q?2p0iJDCmRlTOxyCsZLoBaI4UrQjyXnqI1xAiFylQ0bAkj44Ep0KZ60BFngBb?=
 =?us-ascii?Q?E6PVToVpSINaRjLn6wB/pTZ4kGSA2jTxc6BIaQf8Ku+Lxfd5bps5rytk5749?=
 =?us-ascii?Q?3abUF9Sg+8xYKmdfB7uKWm+k84MG0ghpCQ6pj0XNt8L3RitF2fekkcx2NXS1?=
 =?us-ascii?Q?VDLU/l8RsBlTEOCM9cKxFsoms3mLD5UYPJjmte06r7wGbiFJfOxzB5uOfrba?=
 =?us-ascii?Q?pJMezmjl1QpRc5jczRIwmAjOjmQcQ0TzVQrxeDweLmE5yFr5V/Ot6mgefL4G?=
 =?us-ascii?Q?bSvu9rlKqrbebHhDixorEgsf45Uy6NBqoNi48fziHR3P6/OJ4CHtmA1ho7TM?=
 =?us-ascii?Q?jkR6aCkAYC5FeUF+Hj833qp6BmhvnHbBIy8NtiN1muh5swZ3di9BaYcGfufa?=
 =?us-ascii?Q?333RRSg7u3yD9hgm3KTYsbsn0QgunaJzX+Z8FsTQXlRCzs1djrWqVJ7ujQqY?=
 =?us-ascii?Q?TCl9hTVzce7Hf8dLId84teVnv9F+hYMRa/y5UX37fJhlaDm95JPH6Cg9B98U?=
 =?us-ascii?Q?SqzZiJF7T5bBcXSPf++aszye3Clsq850x3Mcoj3sie4W71nLzFd3gybG2jsN?=
 =?us-ascii?Q?1xSJUMukMBHSwUmHNCEghtCbFre4uS4VbROuEcabGJolMDXw7gamIEwq9jhy?=
 =?us-ascii?Q?wZlFcrEZMb75aLhJD0KzkpeZOK2pUgLocDzWQClN0mAu1aCpXSKhJujGaaK/?=
 =?us-ascii?Q?8pG917UtQMIIE5SKVEWxHVumgKOAxLsAyUhmoKTBysNuuVw6aYfQ2a+rqlAP?=
 =?us-ascii?Q?3jVXg6aEI9rdrMl4/DujNBsFLnXTASm4eaeWzuCemAYZwKAk45Vg4Zwc3vz7?=
 =?us-ascii?Q?hssluAWpTUCIJcxvDpYNFih0+g1J5NXDp2kCbp0NNsc3qVopdmhjJM4F4Baa?=
 =?us-ascii?Q?/ve6Jw7yL9Jcny6BhhUIaAIr4KF+DGyZFD+g5BoefFC7rkI/CBK49o91UMoN?=
 =?us-ascii?Q?I5kqZAdjns/uXpC8Dubp9lGc/JKXAcwqSgMrqwNVGH6mdvUBP96G0S6HfRe+?=
 =?us-ascii?Q?ZwApbAMmNqX8TKjN4LCP6zzyb6tZeINNk9QjDYJHDzLMoNprbtDBIIBNOsxj?=
 =?us-ascii?Q?4J4azTcMRKqugQnLHPv1pDiBnLHykvtHv7RH/t2XDofXKB3RcqXwewQfecPS?=
 =?us-ascii?Q?q2lt6KUe0G1YgrgxAXh/xlB1rw1wKtvyll2JMwpbdmbhYMtnkDA8RV8OWPP9?=
 =?us-ascii?Q?JLyH5E/Kn032O+PbvuH8c9sYw+UraQJ25UjHXj/4j80E1WFGwChtVmDCQUCi?=
 =?us-ascii?Q?U743m5MaTesBD7KLL9HRg+L788BufbVBa2aF8HeGItr9uQiIZT/s19lSbkZc?=
 =?us-ascii?Q?7+EhQbXwEqKSLyCJuqPROjQKhvBJdmIYlJuWScWq4D4Rf3N/QqU9nRsmn/+y?=
 =?us-ascii?Q?TKe2ZdhlzlFS/a42jKsnx3jLtnvvan1sQ3mKy3IwzoCVbrG7BVAZ2OBVraHL?=
 =?us-ascii?Q?Phz7+tRZ5AgecsEKT/A=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a158fe60-42df-4ed5-d9d8-08de1e24e824
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:41:39.7060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXdQfAdZCvwQHggmB+mLWDio9YqSTYcBn3izIqX3i1QaYqOu9svc9RWWUlWAFMgE
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

Move it out of mtty_ioctl() and re-indent it.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Acked-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mtty.c | 53 ++++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index 59eefe2fed10ca..b27f9b93471bc5 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -1785,6 +1785,34 @@ static int mtty_get_device_info(struct vfio_device_info *dev_info)
 	return 0;
 }
 
+static int mtty_ioctl_get_region_info(struct vfio_device *vdev,
+				      struct vfio_region_info __user *arg)
+{
+	struct mdev_state *mdev_state =
+		container_of(vdev, struct mdev_state, vdev);
+	struct vfio_region_info info;
+	void *cap_type = NULL;
+	u16 cap_type_id = 0;
+	unsigned long minsz;
+	int ret;
+
+	minsz = offsetofend(struct vfio_region_info, offset);
+
+	if (copy_from_user(&info, arg, minsz))
+		return -EFAULT;
+
+	if (info.argsz < minsz)
+		return -EINVAL;
+
+	ret = mtty_get_region_info(mdev_state, &info, &cap_type_id, &cap_type);
+	if (ret)
+		return ret;
+
+	if (copy_to_user(arg, &info, minsz))
+		return -EFAULT;
+	return 0;
+}
+
 static long mtty_ioctl(struct vfio_device *vdev, unsigned int cmd,
 			unsigned long arg)
 {
@@ -1817,30 +1845,6 @@ static long mtty_ioctl(struct vfio_device *vdev, unsigned int cmd,
 
 		return 0;
 	}
-	case VFIO_DEVICE_GET_REGION_INFO:
-	{
-		struct vfio_region_info info;
-		u16 cap_type_id = 0;
-		void *cap_type = NULL;
-
-		minsz = offsetofend(struct vfio_region_info, offset);
-
-		if (copy_from_user(&info, (void __user *)arg, minsz))
-			return -EFAULT;
-
-		if (info.argsz < minsz)
-			return -EINVAL;
-
-		ret = mtty_get_region_info(mdev_state, &info, &cap_type_id,
-					   &cap_type);
-		if (ret)
-			return ret;
-
-		if (copy_to_user((void __user *)arg, &info, minsz))
-			return -EFAULT;
-
-		return 0;
-	}
 
 	case VFIO_DEVICE_GET_IRQ_INFO:
 	{
@@ -1949,6 +1953,7 @@ static const struct vfio_device_ops mtty_dev_ops = {
 	.read = mtty_read,
 	.write = mtty_write,
 	.ioctl = mtty_ioctl,
+	.get_region_info = mtty_ioctl_get_region_info,
 	.bind_iommufd	= vfio_iommufd_emulated_bind,
 	.unbind_iommufd	= vfio_iommufd_emulated_unbind,
 	.attach_ioas	= vfio_iommufd_emulated_attach_ioas,
-- 
2.43.0

