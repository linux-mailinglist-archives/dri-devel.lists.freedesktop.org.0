Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A24C41347
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 19:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B7010EB5C;
	Fri,  7 Nov 2025 18:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OrsQUHnD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D117B10EB5C;
 Fri,  7 Nov 2025 18:03:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcllfisX0WeKSybxa4VopWRJEd8Iv/D27JVZblbJr/H+pFz4N7PUpPpZIIkbF+s6IA504PYUJsE1z3Q+QZXkPlMU7GOTX+RfQI6H8WV4RYbDqGQEcrxTNpkAXwgq+zHK3cHIuyUbg9jhj5D7V83nuonsNendBweQiVhACea4wQN/eyEcu42wc6b9LxPnpgy6dHPg2vSkpS5KFgYreX7D/VeZn0I0XLmomS0XsdMBQJZ9gw+uCqXXE1KY9ahmTnViCwZApmTL4wpUl+qyeof5lSBBsQgzj9UuNsN36tISonCgBxzvLRo/8RMLg/9wgxg6CTtsxXyZYQSn/6nhxxKTaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sp3PWS1q/3fTTIF+9ojNUN9KFzSVnV2dtZYUx9yqxtA=;
 b=HctPXX31qdhA0VIllTGiiUPH8wvTx6MurHFDEb7+ZzqwvbJJJUFngwhwhgwQXnpUHQiWFSOfQOv72l9EgBWt0jPHVPgeMiH+2aj9uMhQ9iVOrncN60x1kpMuRAMDFBNqgA2X00M1oEi6w4pXJNYhojmbB0oTAjmT/fosFSO69GLxW2L7HSIk9gPu9K94Mnb8QqYfZcbYkIjo0e0BuVrjBg9SVSbLTNwV/xsJkLvyNOyEUglGZrCiWrStD2sOW4edzuAUd8dp2RemTH8qIptG7MlaBLmKY6owgcLcjqu//ACQ7ujtneT9Hh5JkV2+mp5tp0L1UWnsv5pTVof0HYhB5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sp3PWS1q/3fTTIF+9ojNUN9KFzSVnV2dtZYUx9yqxtA=;
 b=OrsQUHnDNymDu1WcNBf6Hd6aRfIIU/uAGY3GPXY1fgKWoFmkqjXGGN1egLFFAo4InB1Gq2znZjwfKe8E/8uM7p0ujCj4d/qSEsQXngRfmxERyzMY9iCqwStyPJ5ayf25lVVLCpC5zWgIy85ZOMVW+96GQnGF3VA9w4JIDW7eG/J6i5T0CTEIEes9FAyv/l8Ql0mNL/ovZkON5+E1PF1ULEOCgSRvRMxp+lflkc78msAnyzIYgdjF2IMXOXYJcXAPNMTbBmyh5CGK14lyh7praDiQL4tGQftds466sqm1HNvVSku8xp8y9OiqovDGN09CKSpMomz6qhixnOn/kR5g1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ0PR12MB8091.namprd12.prod.outlook.com (2603:10b6:a03:4d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 18:03:34 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 18:03:34 +0000
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
Subject: [PATCH v2 03/22] vfio/virtio: Convert to the get_region_info op
Date: Fri,  7 Nov 2025 13:41:19 -0400
Message-ID: <3-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0006.namprd18.prod.outlook.com
 (2603:10b6:208:23c::11) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ0PR12MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: e27edeba-b86b-4641-6611-08de1e27f79b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fl2OfVxYXBPB6wY/3fHOZ2La6VkSnDTXegN6ieN4I+YnJQYCSQC4tLfrUEdo?=
 =?us-ascii?Q?L+eKr/nG+uL/n+42e5iJv1ctxoK/h3nqWlg6Iyv12cBQEhDipmCjCU7cwy3c?=
 =?us-ascii?Q?KHGcpv688iym8NcRCurwXf3klwLKXghna+5BEFpsDpLUc11Ts/Q65/r2cjXs?=
 =?us-ascii?Q?cizYNzOKxq2cI1B6orp1R6a3oWp8rjXDeHB6wYZF7D4ReuS/36csvKQ42twO?=
 =?us-ascii?Q?nSZpBFlY2B8P2HG1aVIf9LhNkQRlStuJ5uD4R3Ozlzn6pcK0Na33E4ZCt6L/?=
 =?us-ascii?Q?YnmVjS2AkeQF9IucokBeNDixP8+Mh27H78NIqQ91Yr2bMIFUB2D/NHtfqyon?=
 =?us-ascii?Q?kIkOZNPfigYePotlaWNFGnLtxQNRv48qeRJebyyyq0WHqidrwOWin1hMtjr9?=
 =?us-ascii?Q?/lLugUglNxG/yWOCAiVqDv89uRFjmjo99v8ZTrGVeza64d9h0a4mJEScasMn?=
 =?us-ascii?Q?iTvEoV7I9+C3aNkthWw7CxkO7eYSm35zp/d9CfvC7YAqA1Z0naADNp/P7iz4?=
 =?us-ascii?Q?CQNewCcDBkg983uO9aquLOriZVuYy9l9+3102olhUOnFyYvbd+L209PHZlql?=
 =?us-ascii?Q?tXvelFPzbHB5nPsSr+YwYpcVP80k/aIqprmb6GAPj4fDI5qc8s6og0ALP3ub?=
 =?us-ascii?Q?whTnWtAjC/7qdemhQD0Kb2GDthwThbzW9ZUvLi5P+N2yQDDxn4pMhERqqYSE?=
 =?us-ascii?Q?fF0ZQDxJppxufIdPVeWhdth8S9pirMYrYbx620PgHyyTtL9+VUGHzacp86wv?=
 =?us-ascii?Q?cSIltRPaGAokao8tuuKSYix2JhC2pUSFsttwK2j3ZLeRI048WcHzGQ9CtKem?=
 =?us-ascii?Q?BcbXcVHpOal/plv3Fzm9/nbTFmulyXJV+jIVO7djfKEcY3lSL632LSRq/l8+?=
 =?us-ascii?Q?OwkiaRLdPqkpuxGcZ5xEM2G55+ppicLv6YJyGe0VWT7wEaFoWmLphXqWnHnL?=
 =?us-ascii?Q?jhVVICnSImEAkkWG5L34BBzW37e1iToJsGtBTS1RkNNoTnoQ1QtPHvw3qQrP?=
 =?us-ascii?Q?1jgpWS6vMagJJbM6SfzGGLCdibFMMl2j5f2fgnwd159kzg9Ve2axC1PyJsvt?=
 =?us-ascii?Q?Y22/Y6YECosPYXNtInTor2HP1YJJ8EdyD3GGwxQOKNrRR6iMBiizFdiXxXH1?=
 =?us-ascii?Q?UA9zgYWCF41aZ7W5h2cwrjXg+tQ98e83246dJAPh/LXWMf50gg152ww1e9fL?=
 =?us-ascii?Q?JjJaj2J77+mXjf12ya6K5a0x6HxHvKMuEqPJ4T65Sb/F7xZZYwMdK//ulC0y?=
 =?us-ascii?Q?Vp9aO8QnOkh1g9wT3996SHQeyoqCLTXVN1Q/5Q3h2HFNB1SUx+nstj0TraTV?=
 =?us-ascii?Q?fKqxXg5ab/VeTdVwzXTqrx0jU7VE5WOcUCuOQBReWSMUu2kQ66l/A4gcHqDZ?=
 =?us-ascii?Q?SNFJ9XIBwcVoynMzjALls1Ui92rNNEPd8cDn+qtrdawUzmkOkI++V6ot2EMX?=
 =?us-ascii?Q?DEyOw9C43+ODYVrNgHBdgpIvAORldQCaB9VYiA9knss2f3AbKzWI7czaRe/3?=
 =?us-ascii?Q?TgEGoWjD0IKTVqM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qXhIrPmESatrL/9Pt3HwDYnS77vWSX4PYf+LHUdEgsGdiKHzdv6SAmQ9kANR?=
 =?us-ascii?Q?zceqbtRxzC6AqyY05t+SyyvrdZL+ji23Pg18W7w8urTZderIaGMsuCknH05l?=
 =?us-ascii?Q?OIQRtA6Dg7p7sQzhbXpJfCkHwCBDQhlCChaWEIMgHpOMTEKmXCemwrEsMn7B?=
 =?us-ascii?Q?JfjTAMhTpfuXWIG41nDDj4n8UUptLr5ojEJhQCtfRxY/MC03pBJ8J3BrSG8T?=
 =?us-ascii?Q?l7ftQs9OCruTGymFaatICKw8hHd+QB17T76DqqnV16bYlOkI0NnlzL+0bixn?=
 =?us-ascii?Q?d6KZHO9LMiGowwoX2klLi3gPkbH08BW+WEus6Xcl8SOFUm239DEwNenajtRd?=
 =?us-ascii?Q?Zl6aA58Fz/v7j1BlKJ5z/DlMlzc+fJ2E5zha6XTEdV2eniB9jNqiZLtToAQS?=
 =?us-ascii?Q?fMy/PLXfZn+x8j1ihNI1La+OOJnFal+A2XSkxauDSq+cLfirZUU9PoEeSr2p?=
 =?us-ascii?Q?ZTmg1lKggvlJ52pMiqxBM3oSOkVmY3jZ1LQyWKk7pxNcXsaWn+ZIoC5sicaQ?=
 =?us-ascii?Q?VFwE7cu9fC/rygadis3WKz1T2KstnDbBAqE+dwZdx38gcpJK5xSNEOQDpJQe?=
 =?us-ascii?Q?LJLYU8AI2Opbobhi9np9PJw4Kr4UMF5OSMmrQ+tj4+E09LvbVvzsHhzl8gfD?=
 =?us-ascii?Q?Sx72W0rdJS6aPQYVQ6Zyu7unhTGFUEmu+4ZkVWlthyj2VqFma3TfuBoDPCED?=
 =?us-ascii?Q?/R4ssdpPeuO5YvDszp+rHbZZE4wVEifUxRlv7SerApG81hyxl5TL8w83z7Iw?=
 =?us-ascii?Q?mqwfcB/gwViuVAVoFsTkp+iz3GIeppBP1FnKHWY7UlPnIBQviW0tXjACqalw?=
 =?us-ascii?Q?96NRmRGWpXRFsU7IyjiYZi3a11uULy4r5slv8SF273HpIJP68E6N6KUjpBgJ?=
 =?us-ascii?Q?qQFTdKe5cZsSZUPhKhtPFXoX/FebRm9vDdoqCctIG4HFmhMy84FbTXM8pK5a?=
 =?us-ascii?Q?1IL2Dv8rjyfdfdW86FQgY731efltNIVww5+hmKnHroG/Oo3AOwTYQgdJ7TOq?=
 =?us-ascii?Q?M9Wba3je3Fka4TJlZULr+4trg4zj2pNtKXYpYOJyzCn+WDZeP0Ei+AgktB0o?=
 =?us-ascii?Q?WbjsP7z6OarOKiDZYdvHRhHcUbHJH8KJJP251dcn/W4maeebsmdjgDDH3iU4?=
 =?us-ascii?Q?mnX5SpPQ/jZO77p7zigFVPHjGH4heH48yah1ynhZz+IEBGPMrx9gILlzWY0M?=
 =?us-ascii?Q?pj2Kgdc6dGsHbS1gtH6/J9h/7NhR3r35Sn9jw5tGdNzHc3ox/ay0+JgaHCSR?=
 =?us-ascii?Q?LvyGRFepswBboSxG42jm8/OhPoYlaAEBqszwGhcwFmdtmeFAC3s07Y8szL8+?=
 =?us-ascii?Q?iGKzi1GMNLbMSdCBX8ksVQJ1Un9EgAXCG2SHv8DyDFXyGWicSOtAN4Ese0JO?=
 =?us-ascii?Q?Tx+RLms2pYqQkilsTCjdMVe+IXvF9vqSyRnTVgDHOZ28Uz9Cv7NaonEzWMQw?=
 =?us-ascii?Q?bQd0Szr2Uldi14c64k9f/Er+tPThSUyJdW8QVzxQ6zj+vZxdaC9mrU9XuP9u?=
 =?us-ascii?Q?H6LesnEks6dcmv17Vrrsw/NUVSAPg2Edy4Byl2VK34/v8D7/buwcxj2cV4rI?=
 =?us-ascii?Q?srq7+90BaDiIdSkBgNw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e27edeba-b86b-4641-6611-08de1e27f79b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 18:03:34.1060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpZK0jha0MhkC9Mn6ca3mYJtxVMJIMiBIbNODRg15YljzEshAanCEiNsTXT9WebU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8091
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

Remove virtiovf_vfio_pci_core_ioctl() and change the signature of
virtiovf_pci_ioctl_get_region_info().

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/virtio/common.h    |  4 +---
 drivers/vfio/pci/virtio/legacy_io.c | 20 ++++----------------
 drivers/vfio/pci/virtio/main.c      |  3 ++-
 3 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/vfio/pci/virtio/common.h b/drivers/vfio/pci/virtio/common.h
index c7d7e27af386e9..a10f2d92cb6238 100644
--- a/drivers/vfio/pci/virtio/common.h
+++ b/drivers/vfio/pci/virtio/common.h
@@ -109,10 +109,8 @@ void virtiovf_migration_reset_done(struct pci_dev *pdev);
 
 #ifdef CONFIG_VIRTIO_VFIO_PCI_ADMIN_LEGACY
 int virtiovf_open_legacy_io(struct virtiovf_pci_core_device *virtvdev);
-long virtiovf_vfio_pci_core_ioctl(struct vfio_device *core_vdev,
-				  unsigned int cmd, unsigned long arg);
 int virtiovf_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
-				       unsigned int cmd, unsigned long arg);
+				       struct vfio_region_info __user *arg);
 ssize_t virtiovf_pci_core_write(struct vfio_device *core_vdev,
 				const char __user *buf, size_t count,
 				loff_t *ppos);
diff --git a/drivers/vfio/pci/virtio/legacy_io.c b/drivers/vfio/pci/virtio/legacy_io.c
index 832af5ba267c49..d735d5c4bd7775 100644
--- a/drivers/vfio/pci/virtio/legacy_io.c
+++ b/drivers/vfio/pci/virtio/legacy_io.c
@@ -281,15 +281,14 @@ ssize_t virtiovf_pci_core_write(struct vfio_device *core_vdev, const char __user
 }
 
 int virtiovf_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
-				       unsigned int cmd, unsigned long arg)
+				       struct vfio_region_info __user *arg)
 {
 	struct virtiovf_pci_core_device *virtvdev = container_of(
 		core_vdev, struct virtiovf_pci_core_device, core_device.vdev);
 	unsigned long minsz = offsetofend(struct vfio_region_info, offset);
-	void __user *uarg = (void __user *)arg;
 	struct vfio_region_info info = {};
 
-	if (copy_from_user(&info, uarg, minsz))
+	if (copy_from_user(&info, arg, minsz))
 		return -EFAULT;
 
 	if (info.argsz < minsz)
@@ -301,20 +300,9 @@ int virtiovf_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
 		info.size = virtvdev->bar0_virtual_buf_size;
 		info.flags = VFIO_REGION_INFO_FLAG_READ |
 			     VFIO_REGION_INFO_FLAG_WRITE;
-		return copy_to_user(uarg, &info, minsz) ? -EFAULT : 0;
+		return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
 	default:
-		return vfio_pci_core_ioctl(core_vdev, cmd, arg);
-	}
-}
-
-long virtiovf_vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
-				  unsigned long arg)
-{
-	switch (cmd) {
-	case VFIO_DEVICE_GET_REGION_INFO:
-		return virtiovf_pci_ioctl_get_region_info(core_vdev, cmd, arg);
-	default:
-		return vfio_pci_core_ioctl(core_vdev, cmd, arg);
+		return vfio_pci_ioctl_get_region_info(core_vdev, arg);
 	}
 }
 
diff --git a/drivers/vfio/pci/virtio/main.c b/drivers/vfio/pci/virtio/main.c
index 8084f3e36a9f70..92b525e52abe4d 100644
--- a/drivers/vfio/pci/virtio/main.c
+++ b/drivers/vfio/pci/virtio/main.c
@@ -108,7 +108,8 @@ static const struct vfio_device_ops virtiovf_vfio_pci_tran_lm_ops = {
 	.release = virtiovf_pci_core_release_dev,
 	.open_device = virtiovf_pci_open_device,
 	.close_device = virtiovf_pci_close_device,
-	.ioctl = virtiovf_vfio_pci_core_ioctl,
+	.ioctl = vfio_pci_core_ioctl,
+	.get_region_info = virtiovf_pci_ioctl_get_region_info,
 	.device_feature = vfio_pci_core_ioctl_feature,
 	.read = virtiovf_pci_core_read,
 	.write = virtiovf_pci_core_write,
-- 
2.43.0

