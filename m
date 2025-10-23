Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397EDC03BFF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3598E10E989;
	Thu, 23 Oct 2025 23:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DU8IJIzA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012029.outbound.protection.outlook.com
 [40.93.195.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D7210E04E;
 Thu, 23 Oct 2025 23:09:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3auJc4Dba7Fwo167oWkvspusklrJBscYQLBKwfnxbb0fI1+mI0E1upJaeGoiu1mr4e1NCeYO2FzwEWkVNH+UPyKEnhUkPFa4X2VazUpzanWzSHeEjyCpDVlIb1mrkJUDFj3RwE7Yp7u3sLKnbBhBTV2y5wDMOstHwTHSFaQhvcO+Op2v+kmlCgd8o6PTNdC4yFkh695TQm9dkR4K9PCZ/xkJsB/gsHSiqCdTSP/rXlbf/21CcXdrk+iR2QPaO0Aude9qlS+kTlM2z/YbDbSyy0PBNURAxmdzjjtcSUtOm+hEe2NRicJwvybcjRV5Kb/VaN58feBf6NlKgIx9ddFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LchlEJeK8+F/s9S9aCILcwXsGCj0q583C3gdbNEbBE=;
 b=Sr8SDszMU1znWkVCIzRee1/oL90ujqhkV87AegzwM+iZy/fg2VzRWZA40U6oJXYzVN55UPOB1LskUmsyDxGM37RGRDGiJmkCJqj2GQcQW3g/FSCDVTlFzMZ1TG0piR22+CjH3hrCuMT4HN3K4r+jg3L5I2bdiac0+YZ31UP5ttAF2lIfk7BnG4Ct0CluJJrNdpgQSoZUitjBlJrmx4+QWWu/cVywW7SBHzbDwXTIqW76k94YKG/drmADjxBFofLdFHYfAYdyVK/AVthlt2+q61BvDKFz/EoHqt/Kq2dSUlh+8mCdLr7T/7LOkcNWDxGY+hFBVcMb8EwkJsPM24qEwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LchlEJeK8+F/s9S9aCILcwXsGCj0q583C3gdbNEbBE=;
 b=DU8IJIzA5F+oVeC3mSvJJrV0idB/d0YjutGDjbijqxpY7S2uPfJZRr5BF57iw7/ievUUiHVTse92FW0Mu2gCw4d68bMkAvF9YRA3YE24nnnCWzLUdN3Itp9Lj6AXrrL5ByRVN6NFrvdpUtNYfIHXqvK8h4VfQdWpFz5IEBBCNCSrEEjRyAo2d+WWsvlvBxmqrLoc0nrQCepdgL5mFD76m/iGC8rkCC/ZWDHrAFOyY3972+rGo0zzNgxslQFWK/xLzXp3/0hYY0WKY5vAgFYUmtT6QZqwGTVpnVjNJIC/8yefEHb9QBVwuaq8OmpPdd3HhXE74fBnwahSQJ4Ofdh+Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:09:44 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:09:44 +0000
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
Subject: [PATCH 06/22] vfio/mtty: Provide a get_region_info op
Date: Thu, 23 Oct 2025 20:09:20 -0300
Message-ID: <6-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0147.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::32) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: b26fe1b4-ef6e-46e8-faf4-08de12893f8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ruUMWADbi94ljrBea4+3s4yEPVmRBv8zuZbefi5LH7SWvaYm5mGYfS2Czr6a?=
 =?us-ascii?Q?eqe50h0EInD/Jhv7/Wc1ojKjvddGtwKpSoE/qIp+t9ys3Euj/CQASwARauu2?=
 =?us-ascii?Q?NJODCvheWJek9Mv2D/2/y4Zs1oheNI+R2BNy+qo5kJyywWqPJjmJDHyrWmKd?=
 =?us-ascii?Q?IRod/7UuiSbx+dllvxveVVS08qNVfW6xLIDeXze5EFvcF4MoKsQwkBcFBgvO?=
 =?us-ascii?Q?kORCsWIPFoBSgsOlQOCVF5NrdupLcIC3iDczDEDM2JGRvYFNt2xrZ0WYSrOY?=
 =?us-ascii?Q?4L9GlUdW3LaKbxmRPMnWgUJpt5w5N07X8yZdG4AWgTxxfH6K3A2+1ySDaOnT?=
 =?us-ascii?Q?GlLb1prk9hyPAEoBXWbA6yz5bSIvVMUxt9gtFCK+iVlptw/SBZEfsUe0PsTd?=
 =?us-ascii?Q?g7tBbg1KlUX/1CvczCjBJUzBS5PTywYY4vhMsnJtCd4neSgD29u1tcaXaRCq?=
 =?us-ascii?Q?WXXmyhcycExDtjDUhXDZ9/GNCnY5hlCyW9YgzFl2RfsQQ+MC5RNQ2FFg34b8?=
 =?us-ascii?Q?wh9XLRK6THRp1YGKE9LALJtTRT314LOEARGWtsqL5A2z0t6JfrnfyfjZyTd7?=
 =?us-ascii?Q?wX22bvIuaCtmJaGFNJVsIdB10rVpWeQkD+LogL/7O55BZpHhM0ZQe075+SfB?=
 =?us-ascii?Q?DqxNSOzD+iWrXWLgOZVMEeaKq86n942Z8wkeFzIDMJeKp9g1dh0/XWXdWddN?=
 =?us-ascii?Q?QUxQXRTZIDJxsDGIIIyug48hZwXL8Y4f/IKNvzK5SsHpMO41GIY4MLCEEgiT?=
 =?us-ascii?Q?yjwwYyoZDOowuHj6qpsm74KdV0IQbuW77+3ufS/g1gY735TCbXl5VLdx7+oQ?=
 =?us-ascii?Q?c12zx4VyNeYo4AT2iGWNMgHSJlVbCLuCoy26uPgWEBjdRZEG06Bh8FeXx4wZ?=
 =?us-ascii?Q?8cA8DU4bbA92KG/o3FCuEnD6GtMOB0/9WYxBbGmL2ss7tGfHVXkyWrPnPujY?=
 =?us-ascii?Q?htDzdvLnATGn0UQhShVh7PoK0F280mRy6wznejCsBoHo3pF9jR67ZcU+rv4y?=
 =?us-ascii?Q?4FmmNAmXpCp1V7OmvCJhShBMdh1QLYgqgrKXVOkYrLQAdftD4U/3dUGWSMtP?=
 =?us-ascii?Q?eHfC/59Xy5OzMgRGWFBG4f2Rl3we3zEUznwWUJfKkR04Bu4jEUXQcMJJbMeL?=
 =?us-ascii?Q?EDyES0kSa1gWtMCTECLPzvwBMThYHDh1nCHzGi2+R3V556xKQ8rAPuSMP4oC?=
 =?us-ascii?Q?ffPneeOZ00UJK25gTFJfgOiwn2+1aOVO/tBnDcnjp25vS48wTicm8I2fpJit?=
 =?us-ascii?Q?pHEhnGvb6XS6nhQDTtfBpQBIAMWudailRAGFtd8VjQfoturR8Vnm7ZLve6GW?=
 =?us-ascii?Q?ATpkdQUXr2pMAu+RWvp/2b+YsjC0dcW3EwAMe1vHBSEkpTwo8gZE6M3xKbR/?=
 =?us-ascii?Q?Q0GLtN1gjxTM/ELelS2MbrA4O+sXVxGlPZjCaPVIIf2jQQSJMtGqNpezpLh9?=
 =?us-ascii?Q?p8hEaLiYFs9Fcbz6bC5lj97qx0UK8aTsMrVY+KrwEedjrJUTBrLQCYPNiZPt?=
 =?us-ascii?Q?k/BVksYxf9jCJ/s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sDXrDVABqEY+LUit8xHCZ0ktZsgPLbfuCKnmXG7I1Xc8cFkLZf4Kbov69qwM?=
 =?us-ascii?Q?E2vupQcy7T7oDMCidpNvJbiCRGannlztOO5N8v6IkpAqikJ60bpQ+NDiA8Rw?=
 =?us-ascii?Q?YM2sfJ9jIj4HBsRF564OzCBAjCzP7M36AbK12/cT8p54aR1VwsAYqbUsC/n8?=
 =?us-ascii?Q?RYeD8mxjUL5sahSlBAeQDFykbNrZ+4ktKbX9FzeHA7yMpYF6YIckatHmtduv?=
 =?us-ascii?Q?w9TA//QqPekpVaqS1VhMauBHMaTNM4mT1C8inUNoYS2oXmx6vXRKfN2t1vEE?=
 =?us-ascii?Q?zYlQbGTsas5ria2ZQ7+tiGSgwxaBh/7FClNk6kiaCHySsbs3yXDzH/ca85Q1?=
 =?us-ascii?Q?M78YnxkXeBbQjlBZh7/RFM8QEsIk8ma0QMnYH1a2kib1/ogJb0SiLnG8WKfK?=
 =?us-ascii?Q?zrXawEvtYrNzZSlDWkgZaUijEFm19PdyLTYk6tit4ynVN7MawDG8OW+rkbsM?=
 =?us-ascii?Q?FUh6Kc0gLSHYymPCpVkHYSlxUSr2+h50y8XkByn39HA5P7rZUNIOHZj1TtFt?=
 =?us-ascii?Q?/1LsMq+sLbeee8XwYqFg7mkQuDOBTEt43cRb1555N3ChX4j3rpWnMtoRcsG9?=
 =?us-ascii?Q?Vh1HLkxspa4d5hj+Ck8Sr5REqZ9Nem6WX1K9nW2YtjzYFnsGQ7ZpIlXxsuUL?=
 =?us-ascii?Q?pCxXSeZe+a4POYNWsCKpr3vKPhyC7FDaOXye7AM/QAGLF1z7Q6Yu02hPHyd3?=
 =?us-ascii?Q?zHQRPBQyK0I3VzsA9Om5XbQ2d03Kxxist5EW5lwBArLcgpiK4yGxS0fP22Kk?=
 =?us-ascii?Q?0vzFWDs+AoKz+e27pAxnJgNzPyiuMdpzYmxUvlwySB2fftp8J5MotYKLToO6?=
 =?us-ascii?Q?5adoT2qazwbNg87IZnxCkx2v0bMvijL4fb37zl1ad+B5qlsIf11ZtKzAqtBT?=
 =?us-ascii?Q?v11KNb6IoxdMt7pjM/BzI4fybhCUD9DDgIRe7mD9z9j+JorokLkpLrEKkGk8?=
 =?us-ascii?Q?svjuZhfAZActL5uUlDC+tkZeccWtYoyFXQv7lqqpd8EUJ2XntmD7SIHSBgK6?=
 =?us-ascii?Q?7eibMUe4wEQ+316gYFgQvKnpgl+FnsxhAXPNOHYhUQHfDsb5Cxp2qR8ElB9V?=
 =?us-ascii?Q?RcJRrd7xKhlJYn7JblLp/rIGLyyc29MoyN4Z2ZFm9+GRvtyfypHD07pk4n+K?=
 =?us-ascii?Q?fXtks3DHUarkW2d0Bo9Chro0nPpFhQRMeF8wbBYAkXwFtJRWWZar9FrJmjAW?=
 =?us-ascii?Q?au0wCx/veXZjay/C6mp7qQfy2M+YOxsd3DEGHys30yJPHPQlTACDw1IxrZRK?=
 =?us-ascii?Q?RDNWDqMdhhyMeB8eFwlMhAjOo18dS3/mv+gqS5TsXac0sOOshjkOrHlxgaWH?=
 =?us-ascii?Q?Vw8UHxriLrFusHJn9NxqmyMmQl4KirXEBd3NGwCiUlr/frp8aT9XpX6koI8U?=
 =?us-ascii?Q?ZZP3LNSO2PFIGP3YUYvAofo0layWAGCGhrRwuxqNZsmXYAI3mXU9gw3WIe2L?=
 =?us-ascii?Q?1Ytc4emvGvz0msj+9iTP9PBEMJZLVCkxJXYcWrGhtwQWM+K7iLrnvqTYLb1V?=
 =?us-ascii?Q?eriH3AobfcFwBP95czAkPxBcp/SCTff8iizHHwu/wWmr4z9CNYAAmHQcxrXG?=
 =?us-ascii?Q?ZgDu7HSraLc3a/oQz/lCQv0eWuQWnMIxeF6C/QF4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b26fe1b4-ef6e-46e8-faf4-08de12893f8e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:09:42.2204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ko0xMG6OuFa2fKYI0HHtTQaQ3OljWjp2TTQi2uiqiNsglmjmIklGI4SbxUcmG286
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

Move it out of mtty_ioctl() and re-indent it.

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

