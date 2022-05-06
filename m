Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C57E51CD84
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 02:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021B210FE2D;
	Fri,  6 May 2022 00:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6061410FE0E;
 Fri,  6 May 2022 00:08:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MoZnEq4ZBnsaCKdkRX0K3djof5jfGvjal+lhAKcfBEsxIAVpoKMxNekmkVnRs/aMzCkApW//xxFCDEUkp8613JNyHXnY41rgUOOoqJCO4Cp0ru/7yCArQUe/RDo66LGhfKID6X7Rq2VdbewnauQJdyhG+FAwJ7TB1HEFcg8JJIMuxrhwNtVfjF/No12vnCABzo31FmMGLeUA4kOWU4I32OuGYgfyh8nHzKIhKX9bRJuOFeyVP5x6hbLqTsbhoMuIeBPtfhDC0/A/f4ShFnW45UD/8my32Cp15FzwpeqWaNM8PKPxXOu8nAKoOLOURq1mfuoATnA0LDIcSQh8SkPoBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LrDPKMVIsusxztPgCpb23x63uX0ihT59Q0QLuOEqwE=;
 b=KgMASJvzVw8UNGT2/7nPgNuh/xzTxe4CEcvwgrSSmgf81ET3C2BUiUgdLv1cO1W4eM3q9FnTRyrXxgXmDrpOF0tnYKIk1Pg1DTrxgbMy1GtMTXOgwa7Cz5uixjddBS1kvC8WeS+PPKFMJU3alTFb0ChrW4EZrdYjaKh1f7K+0/xAnNjQA3StxdS8wOFuNPVPHT16XHxwvzEQUQNUvom6l3Fo5eP60JOGLdOxPfmaQe4xDXivCmxLUFsWmCp/TRvG0meLTVrc9b3N79kIvHMiLZ2fVx8xmNjsc2XnCLIAuw4U97g9UrDE103UDBiZXRTMfremetY3uquormpySpnowg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LrDPKMVIsusxztPgCpb23x63uX0ihT59Q0QLuOEqwE=;
 b=dgnqklOS7ffbpTGI8SXtd0gyoJ+cUh6w+kYufmiHkqzRjLj5Quc0+eUbE3wab7D++QO4cGumcpkgbmsNFe4uhBiRmdJhQzIMRP3v9a/kRekeF3f63E0HANeAUXcl2QGItEm6E4XTXrlew9l+wjWNV54PtSkuKEjAZwsrgU9WN64PHCgBNH7JV2QDejwM6wdluw+yaA/glvuZeUSSHf8a74dASol9MrlXkK2GrN5F6WF307ehfUMR+/YTl/EDuETVTa1cJt76rexgjhYS3ExlizWeHNRm1XFB3Y+W8J1TM8gikTYc0CRSt6/hPUFvVPjs8ZX5gSU63x5T9HEQBEclVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BYAPR12MB2934.namprd12.prod.outlook.com (2603:10b6:a03:13b::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 00:08:51 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 00:08:51 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
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
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v4 2/7] vfio/ccw: Remove mdev from struct channel_program
Date: Thu,  5 May 2022 21:08:40 -0300
Message-Id: <2-v4-8045e76bf00b+13d-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v4-8045e76bf00b+13d-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:91::14) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 087555bd-4d89-4c16-7d3c-08da2ef497c9
X-MS-TrafficTypeDiagnostic: BYAPR12MB2934:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2934C06C533E4329A11B8757C2C59@BYAPR12MB2934.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M39zZsiYk3FNh+CWIayoFH3zcqKPxru8Yjtijpd/1kDfkZtuzpvH1u7wZVng5DYys8wOzksMN6h9b0C+xs+HCcuV7uqNytfxoFV9YzSa2cVqfXC+0zSH3jfexHFpFAvWtII4oifJI2b1KRbLTsQvkVh8TMyVMKdKONENNR5J5Y6k74MhYQrFRhtVtfdX3nIMfU2rhp8YLgcy4HKJVcPtPdeQss5V7lp9G7LXaGWY29aaBkyv8C6LA1ULfmLLvRi4l5XdqnEUnQ5sTAu0P42MTR+la2k49e3lVFoPkyCEKcs92xrsETBlta2TZ3ag2MomFDC1BcNdTOP/Q5+F4Kq5K6SjR3OzprB1HAE0lsJsE12xdcahWB0SR+yfMqqIYE6hgermUe/iC1HZYc9t/fGf39zemMKDTHh/5/72Y6nAY0IbdELQQYp9LrgYT4fmX/fybCDyBgcyeKn4FNvwYDZcJAQrb0laxTvBMW3EtuYNPL28JKRG8B5OhRN8YLGR46W1OoatkA9TOMujuzAEdUqAdsgZsMA4MszjijHc7EDkLA8pUvo6GQF+6qC3Fv9hkKBQeKNKC1TxqNwGgxF49AypdgxUCdbxV1hQSPmbMYuKDhC1VxvpjtbGbOqIsDKhf2qTrl8I/Gv11LAMC/JsNW5byq+eoBD+UbHSQtFHESid0ZrjXrdYYNjqat/LKkT4y/j4H1WBHKG9YXS+SBjVwPN97A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(2906002)(66946007)(66556008)(54906003)(8676002)(86362001)(110136005)(4326008)(6486002)(38100700002)(508600001)(316002)(66476007)(6666004)(6512007)(6506007)(186003)(2616005)(921005)(26005)(7416002)(8936002)(83380400001)(7406005)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eKkbs0DKkj4GddW3uTpVItuEMOkntqLIbFygBrsDMHzeSL6ud32AdWQodV9f?=
 =?us-ascii?Q?aLfcDugeDGpjfnpHt9zGTunS80lCH9fgxgWyCJGAYuL8f6agiKIIGOQbf0Zh?=
 =?us-ascii?Q?82oOWG83HuBiv4UP0ospSUDsHmiodui15PaXWaKBNuN9ZteTMKUaVO32PCZL?=
 =?us-ascii?Q?8IPAurgKvxF9NqvWq5Au5ZzL+c3+hcxTDx6Mo6R4V6db7iLLbX3OIQpawFUV?=
 =?us-ascii?Q?hR7vqrWlHghGHYooUm3ryKUQtOFkefjZIoaUWPBHHFP5IX2XFdcsOr4c84y8?=
 =?us-ascii?Q?HPow7aPvxHJvnzyofSEATBx6zljbHCnHQZGLmlBe18hs1o/7tbwqHn11wcmf?=
 =?us-ascii?Q?AC0VqbqH0s0b8BfppwwJNr6DDlDqdsKj34TCEIU2Ytvq8GiB6ipEshF/9DRt?=
 =?us-ascii?Q?+N0DPv80EXV0lvehabv3Hif00lGYKXMz6NFAcyeNlT8QcsOSDINC57SSbNme?=
 =?us-ascii?Q?TH1pxoMnym+ynyrArAvWoaEduQDdwhLlPVrzIGI3ah6ytf2efjUAlhRtkUqh?=
 =?us-ascii?Q?rcG62PhsrbRMp5V9va9/gZKtsTeV7Qc8WaF2xRjJJbpSp2+H5v5lnCPfI7bV?=
 =?us-ascii?Q?32UtfLZ82rHQzj0x1l+ZQTIrcRqYkxgZjwpIrum/cmhhXj8vrvFpRfTCLMRm?=
 =?us-ascii?Q?6QNeWFDavYPmRFeiohlSpTKJqPBERWUcWKZBO3KGUjST8uZKfncG+efsyGqV?=
 =?us-ascii?Q?6orrgqJw79mcVqBjdtTCaEEaD6QxX8Zdd26Gvv1yXfHgVFwgGqeRdmDh5RAC?=
 =?us-ascii?Q?8XDW6V1SCXUwG9pfK+D6oFHac6mD/rYAHs7uSWPRqiFv1vi0Mz4dqZRMIIKm?=
 =?us-ascii?Q?yqKjHMEaCPcz/SGpTAGs7aABl9Pn3aMLI1CzfCWcVE15fVqyfcGRq4wLWqQZ?=
 =?us-ascii?Q?65I5Ww4IkRZTjn9qSuboeZc5UPjHUqDTZYzVQ0WD0eV9lIzUtmzCEJtolY/j?=
 =?us-ascii?Q?yvVzKYSBaTql34G9wIwIWwl2DuuX/uox0RCcm+SUcNmBXE+nWPayd5kV8vPg?=
 =?us-ascii?Q?WdiKhict+UBDi9So9ca5mB+ErYrCGQoCF/5X2dxdaoOcX/FNUtqxAn8VCOnP?=
 =?us-ascii?Q?eY0dj/o57NAqqyPgekCf8CvnFeL0LbB2IT+XqeIIsdN+2puNAV+kPWMduIZN?=
 =?us-ascii?Q?SzhBNi2/zvsVHg8Ds9IjvwwwGY9tvz5LR2xK5+2NEGEpx/9Cz14eTQVOHgrb?=
 =?us-ascii?Q?/FbZP3YhB6kn4gkwTeJhXDvoZXaf5H2dDZBBW3e0sLzZVIU/rK00oEjZL90P?=
 =?us-ascii?Q?EucdLGTTuAkT/o2DJFwvFUcCxMvNOUmzupyRBEUYmYujOuc28vbJOaGMB7aN?=
 =?us-ascii?Q?NCUWdMrxsHaynM4SEbB7XnTqlOY4c5H0MbzfwbysQvzsNWEWjBcNzuazEnhi?=
 =?us-ascii?Q?6+LQNkHEilrNef7feVVsiJibs0B8ZT9ob7IjXzjfxZcqK/bc5XFjA6mbYfS/?=
 =?us-ascii?Q?7QDN6QBg5sH8UwjfrDk6D2bGPmnbRgqkrakN1Xl5JBXLgdEHAQJrDiEYfASE?=
 =?us-ascii?Q?B3wSmQy8Xbc6dm8TV8wEwWHqQzye7MkaSPL3L1oP0wmpcpLUkHFtCe+BO46k?=
 =?us-ascii?Q?bYHvtubsGD7atzBBKnNOGF0j0RwuW5wEyIIpmepZfrdcovVPl9YYSWY6wU1n?=
 =?us-ascii?Q?tXNpotEf+i6xKEUmR8NBIcpndK2HE8QCTDhYWHHGHIKUDQ9ssWyDQDQU6PSA?=
 =?us-ascii?Q?NrN1TVFzf9HsSs0R1mGDjpt4ofqOT0LDX+UVM3Soiig/7nMi/+vjBshkMtKl?=
 =?us-ascii?Q?KyK5xutWLw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 087555bd-4d89-4c16-7d3c-08da2ef497c9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 00:08:48.1683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9S6D0nZc6MM8/EkrjyKwONzc3wnKf2FhUW8d3CLyizAcM/CKKWKnrWFm+Rm62Y3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2934
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Eric Farman <farman@linux.ibm.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The next patch wants the vfio_device instead. There is no reason to store
a pointer here since we can container_of back to the vfio_device.

Reviewed-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_cp.c  | 47 ++++++++++++++++++++-------------
 drivers/s390/cio/vfio_ccw_cp.h  |  4 +--
 drivers/s390/cio/vfio_ccw_fsm.c |  3 +--
 3 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_cp.c b/drivers/s390/cio/vfio_ccw_cp.c
index 8d1b2771c1aa02..7a1cf3091cd647 100644
--- a/drivers/s390/cio/vfio_ccw_cp.c
+++ b/drivers/s390/cio/vfio_ccw_cp.c
@@ -16,6 +16,7 @@
 #include <asm/idals.h>
 
 #include "vfio_ccw_cp.h"
+#include "vfio_ccw_private.h"
 
 struct pfn_array {
 	/* Starting guest physical I/O address. */
@@ -98,17 +99,17 @@ static int pfn_array_alloc(struct pfn_array *pa, u64 iova, unsigned int len)
  * If the pin request partially succeeds, or fails completely,
  * all pages are left unpinned and a negative error value is returned.
  */
-static int pfn_array_pin(struct pfn_array *pa, struct device *mdev)
+static int pfn_array_pin(struct pfn_array *pa, struct vfio_device *vdev)
 {
 	int ret = 0;
 
-	ret = vfio_pin_pages(mdev, pa->pa_iova_pfn, pa->pa_nr,
+	ret = vfio_pin_pages(vdev->dev, pa->pa_iova_pfn, pa->pa_nr,
 			     IOMMU_READ | IOMMU_WRITE, pa->pa_pfn);
 
 	if (ret < 0) {
 		goto err_out;
 	} else if (ret > 0 && ret != pa->pa_nr) {
-		vfio_unpin_pages(mdev, pa->pa_iova_pfn, ret);
+		vfio_unpin_pages(vdev->dev, pa->pa_iova_pfn, ret);
 		ret = -EINVAL;
 		goto err_out;
 	}
@@ -122,11 +123,11 @@ static int pfn_array_pin(struct pfn_array *pa, struct device *mdev)
 }
 
 /* Unpin the pages before releasing the memory. */
-static void pfn_array_unpin_free(struct pfn_array *pa, struct device *mdev)
+static void pfn_array_unpin_free(struct pfn_array *pa, struct vfio_device *vdev)
 {
 	/* Only unpin if any pages were pinned to begin with */
 	if (pa->pa_nr)
-		vfio_unpin_pages(mdev, pa->pa_iova_pfn, pa->pa_nr);
+		vfio_unpin_pages(vdev->dev, pa->pa_iova_pfn, pa->pa_nr);
 	pa->pa_nr = 0;
 	kfree(pa->pa_iova_pfn);
 }
@@ -190,8 +191,7 @@ static void convert_ccw0_to_ccw1(struct ccw1 *source, unsigned long len)
  * Within the domain (@mdev), copy @n bytes from a guest physical
  * address (@iova) to a host physical address (@to).
  */
-static long copy_from_iova(struct device *mdev,
-			   void *to, u64 iova,
+static long copy_from_iova(struct vfio_device *vdev, void *to, u64 iova,
 			   unsigned long n)
 {
 	struct pfn_array pa = {0};
@@ -203,9 +203,9 @@ static long copy_from_iova(struct device *mdev,
 	if (ret < 0)
 		return ret;
 
-	ret = pfn_array_pin(&pa, mdev);
+	ret = pfn_array_pin(&pa, vdev);
 	if (ret < 0) {
-		pfn_array_unpin_free(&pa, mdev);
+		pfn_array_unpin_free(&pa, vdev);
 		return ret;
 	}
 
@@ -226,7 +226,7 @@ static long copy_from_iova(struct device *mdev,
 			break;
 	}
 
-	pfn_array_unpin_free(&pa, mdev);
+	pfn_array_unpin_free(&pa, vdev);
 
 	return l;
 }
@@ -423,11 +423,13 @@ static int ccwchain_loop_tic(struct ccwchain *chain,
 
 static int ccwchain_handle_ccw(u32 cda, struct channel_program *cp)
 {
+	struct vfio_device *vdev =
+		&container_of(cp, struct vfio_ccw_private, cp)->vdev;
 	struct ccwchain *chain;
 	int len, ret;
 
 	/* Copy 2K (the most we support today) of possible CCWs */
-	len = copy_from_iova(cp->mdev, cp->guest_cp, cda,
+	len = copy_from_iova(vdev, cp->guest_cp, cda,
 			     CCWCHAIN_LEN_MAX * sizeof(struct ccw1));
 	if (len)
 		return len;
@@ -508,6 +510,8 @@ static int ccwchain_fetch_direct(struct ccwchain *chain,
 				 int idx,
 				 struct channel_program *cp)
 {
+	struct vfio_device *vdev =
+		&container_of(cp, struct vfio_ccw_private, cp)->vdev;
 	struct ccw1 *ccw;
 	struct pfn_array *pa;
 	u64 iova;
@@ -526,7 +530,7 @@ static int ccwchain_fetch_direct(struct ccwchain *chain,
 	if (ccw_is_idal(ccw)) {
 		/* Read first IDAW to see if it's 4K-aligned or not. */
 		/* All subsequent IDAws will be 4K-aligned. */
-		ret = copy_from_iova(cp->mdev, &iova, ccw->cda, sizeof(iova));
+		ret = copy_from_iova(vdev, &iova, ccw->cda, sizeof(iova));
 		if (ret)
 			return ret;
 	} else {
@@ -555,7 +559,7 @@ static int ccwchain_fetch_direct(struct ccwchain *chain,
 
 	if (ccw_is_idal(ccw)) {
 		/* Copy guest IDAL into host IDAL */
-		ret = copy_from_iova(cp->mdev, idaws, ccw->cda, idal_len);
+		ret = copy_from_iova(vdev, idaws, ccw->cda, idal_len);
 		if (ret)
 			goto out_unpin;
 
@@ -574,7 +578,7 @@ static int ccwchain_fetch_direct(struct ccwchain *chain,
 	}
 
 	if (ccw_does_data_transfer(ccw)) {
-		ret = pfn_array_pin(pa, cp->mdev);
+		ret = pfn_array_pin(pa, vdev);
 		if (ret < 0)
 			goto out_unpin;
 	} else {
@@ -590,7 +594,7 @@ static int ccwchain_fetch_direct(struct ccwchain *chain,
 	return 0;
 
 out_unpin:
-	pfn_array_unpin_free(pa, cp->mdev);
+	pfn_array_unpin_free(pa, vdev);
 out_free_idaws:
 	kfree(idaws);
 out_init:
@@ -632,8 +636,10 @@ static int ccwchain_fetch_one(struct ccwchain *chain,
  * Returns:
  *   %0 on success and a negative error value on failure.
  */
-int cp_init(struct channel_program *cp, struct device *mdev, union orb *orb)
+int cp_init(struct channel_program *cp, union orb *orb)
 {
+	struct vfio_device *vdev =
+		&container_of(cp, struct vfio_ccw_private, cp)->vdev;
 	/* custom ratelimit used to avoid flood during guest IPL */
 	static DEFINE_RATELIMIT_STATE(ratelimit_state, 5 * HZ, 1);
 	int ret;
@@ -650,11 +656,12 @@ int cp_init(struct channel_program *cp, struct device *mdev, union orb *orb)
 	 * the problem if something does break.
 	 */
 	if (!orb->cmd.pfch && __ratelimit(&ratelimit_state))
-		dev_warn(mdev, "Prefetching channel program even though prefetch not specified in ORB");
+		dev_warn(
+			vdev->dev,
+			"Prefetching channel program even though prefetch not specified in ORB");
 
 	INIT_LIST_HEAD(&cp->ccwchain_list);
 	memcpy(&cp->orb, orb, sizeof(*orb));
-	cp->mdev = mdev;
 
 	/* Build a ccwchain for the first CCW segment */
 	ret = ccwchain_handle_ccw(orb->cmd.cpa, cp);
@@ -682,6 +689,8 @@ int cp_init(struct channel_program *cp, struct device *mdev, union orb *orb)
  */
 void cp_free(struct channel_program *cp)
 {
+	struct vfio_device *vdev =
+		&container_of(cp, struct vfio_ccw_private, cp)->vdev;
 	struct ccwchain *chain, *temp;
 	int i;
 
@@ -691,7 +700,7 @@ void cp_free(struct channel_program *cp)
 	cp->initialized = false;
 	list_for_each_entry_safe(chain, temp, &cp->ccwchain_list, next) {
 		for (i = 0; i < chain->ch_len; i++) {
-			pfn_array_unpin_free(chain->ch_pa + i, cp->mdev);
+			pfn_array_unpin_free(chain->ch_pa + i, vdev);
 			ccwchain_cda_free(chain, i);
 		}
 		ccwchain_free(chain);
diff --git a/drivers/s390/cio/vfio_ccw_cp.h b/drivers/s390/cio/vfio_ccw_cp.h
index ba31240ce96594..e4c436199b4cda 100644
--- a/drivers/s390/cio/vfio_ccw_cp.h
+++ b/drivers/s390/cio/vfio_ccw_cp.h
@@ -37,13 +37,11 @@
 struct channel_program {
 	struct list_head ccwchain_list;
 	union orb orb;
-	struct device *mdev;
 	bool initialized;
 	struct ccw1 *guest_cp;
 };
 
-extern int cp_init(struct channel_program *cp, struct device *mdev,
-		   union orb *orb);
+extern int cp_init(struct channel_program *cp, union orb *orb);
 extern void cp_free(struct channel_program *cp);
 extern int cp_prefetch(struct channel_program *cp);
 extern union orb *cp_get_orb(struct channel_program *cp, u32 intparm, u8 lpm);
diff --git a/drivers/s390/cio/vfio_ccw_fsm.c b/drivers/s390/cio/vfio_ccw_fsm.c
index e435a9cd92dacf..8483a266051c21 100644
--- a/drivers/s390/cio/vfio_ccw_fsm.c
+++ b/drivers/s390/cio/vfio_ccw_fsm.c
@@ -262,8 +262,7 @@ static void fsm_io_request(struct vfio_ccw_private *private,
 			errstr = "transport mode";
 			goto err_out;
 		}
-		io_region->ret_code = cp_init(&private->cp, mdev_dev(mdev),
-					      orb);
+		io_region->ret_code = cp_init(&private->cp, orb);
 		if (io_region->ret_code) {
 			VFIO_CCW_MSG_EVENT(2,
 					   "%pUl (%x.%x.%04x): cp_init=%d\n",
-- 
2.36.0

