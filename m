Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C87FDC4113E
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8348110EB33;
	Fri,  7 Nov 2025 17:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dP4q769w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010022.outbound.protection.outlook.com [52.101.61.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E1D10E1C8;
 Fri,  7 Nov 2025 17:41:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwVP1bpmevOnLLgMgHRBAqxjxUPOjS22iQrqIUP+GoHwWeXddegYXbK829n9cTmH5mRfeZFmA1fcGNy/nELycoFz4jJFUCUa+IXFuy+UiUK+a8EZAJOBOvCH6OzoEWCO0gvoIZJv2RcY5xcR4X0klc7dg4TFcKDaGS3PhEvOCEUK0Yk+kiNHN4YWsa+9yuidhVvEzPO5jMH/fBQm+IRhAlLhPKkSlutiEGnVDIocY70e1BJLsC5bJZvAn8cbABpQie5AZu3tJ7ou2/c3q81SfnmFQevZacfx9aSIMRiSCdtwhCq4UjqbhKPtx1DWQOjFfGtFhxf1Dnh+lbjTnCPLiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D444VK0fiA0pBBeRB56d2h8GAYLumvEOn0kMuCFbhzo=;
 b=kk+8dnMJomrwOuVXJHmIygvx6MMfB+mz4tfx6nEmzMO2ruQn3DW0vlJlrabGY++ftvmUh2hgcb/VPf044I0aKM/hxaV0mgWBJpxks6ylaVwJyNMLn3PxUSmTHVWMAFgiblaMmdWXUhvrWKz4G6jcUfLYQt3ovDCa3oYYXXgbMJ3yoe2gTG0pKXob+nwFctu/VVsSKVB6TWTik9TBwPtNp33MjgKELyI8rfvc7BTU1EUKm5QEjoGT6ITKI3Duil6oD5L9xYlMZKk4F5QWlgDVsr0Jc2Km4nMSg61u4abTuT0VdocISFMei9/5TS2wuz9WQgXNeB9sp0RFjC3OMpF2ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D444VK0fiA0pBBeRB56d2h8GAYLumvEOn0kMuCFbhzo=;
 b=dP4q769wucTTYC6HnIMXHUs9u9bzHM9xAzCJvCnwirsz5+15xKgPcfAorQeRl2UqgUnM13kHYodmdpCUWwC3Dg+BwlGeAzkF3iruVkVg1SkZ8RwthXftIV2nXFX5v6J7l5a88qZm7pBG/YeaNXw3Zm8/DcG6cmX8KCV/j7tWKvIua/QMGcAngGjXUNAcwXZDBPfG3R6uz56CuiORQkuB+mFmkK8LqZr+u6/ux1z1TjcWtcGft2Aio6wWjthL09zOztyaQUJxrEfOa/aSY//2CGrwCMb+y9fh4740Cq4PNZ7jN1yE1/Y6efiXIr8ULACiK2gJZXCcfLaXlQdMu3HgVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by PH7PR12MB8826.namprd12.prod.outlook.com (2603:10b6:510:26a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 17:41:42 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 17:41:42 +0000
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
Subject: [PATCH v2 20/22] vfio/platform: Convert to get_region_info_caps
Date: Fri,  7 Nov 2025 13:41:36 -0400
Message-ID: <20-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0449.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::34) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|PH7PR12MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: 6760e3f0-05dd-4459-d036-08de1e24e8a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1mNBuznYZsNQ2J/5S/ptTAvyIyZwvvs5gQqxCwJcr3z6PjZKmoSnhqxAx6V1?=
 =?us-ascii?Q?EOH0Mn09fuYO29cfBaIHT6JklqMWh6IkV15JIPwUhhMjgUmNmqSODIXhZ6Fk?=
 =?us-ascii?Q?QN4v4Aef0EowzjURjlMG4pMDbpakIzdsGxgOuVRt65b9pisSvlix2q52MykV?=
 =?us-ascii?Q?K0cjxGdpOBDUjNatYMGfAC0K1ohgwH4dE9i7Pb8uvbZb8bZ1qIgYXXEKRhDr?=
 =?us-ascii?Q?EMPzyNfSAdr8VEbgodd8FpkDS76VtrpzB3/UAJ5ZOheRxbbGL+2PBKlyCC+F?=
 =?us-ascii?Q?e0IEZ5xHlidO8Odzcp3Y4rwP2fox7YdjvX4LYpmRQ2qhtHfgP2ZWUWVtoFze?=
 =?us-ascii?Q?bzrWolEC4W6obIiXUEQ4JRWE2nHjLdjjq6lbGtQXc85VYRrPfQv1Y/N2V9Fl?=
 =?us-ascii?Q?X4fh7IjnUI87LKfisxbRCsoB8chllMeNFjQ+NAAhu5D28W9D39pb8pte2kGE?=
 =?us-ascii?Q?CBdbJvctPDdDE45LW7vSq+faquLcs8k6wX8MU4P8kJC2r6FveN/Y3Eqbo1jK?=
 =?us-ascii?Q?Cucioe8p32nI92Pnr8jnmCx8yvtJr0KLyngXGV86MAAnAYBkhZoHe5xb8g8Y?=
 =?us-ascii?Q?kj4mAAFFd+NRXpIYZisdDOPLdD6nYxS3AmZ/FILME86kYVCf27C5uPUh/shX?=
 =?us-ascii?Q?WOJdoaQgUhP1bw6YmqmuP7/3u3GvMNtT6raM7xCKz3kltHy8dKdk1CxMT8Y/?=
 =?us-ascii?Q?luzhi1bfOpRbYg/xd0dNAu05q4fcSDbG5QFtCFrUen2R+lN5rFQL5jxtpMSL?=
 =?us-ascii?Q?K1Tcd5NSsrbjLZN+G60izsy5qTMm0mf2lip1NGFnJ89B2DfsaYKocsmoOSyO?=
 =?us-ascii?Q?tZIAl7LuF8fDrsCYr/5BBG/ThTBYpXQ9b0ldGrNc567ylbxXHm4fLy+c7PeY?=
 =?us-ascii?Q?sXXemN+du2eBp6MSeFmG9QcxYY3Q/YGrTQuSnWHQv6/bOooWibRPS/lKAgHx?=
 =?us-ascii?Q?HRFJ8IHiEuIdV9qzs0q6/XH3OtMjgigNwU2UwS3nC4tHQDr/6HgsHqjydCfj?=
 =?us-ascii?Q?HM3AOqz5EwYtMV2RpSWF+5wIw36PyRyPzLm53cpd58ND44BIU/7qgqz+78m5?=
 =?us-ascii?Q?i38rDExxkrdoqBFqRD4bIt9CwmYS5jo7ztwtwkZ93lyd+9gXocRKxWPKLIOr?=
 =?us-ascii?Q?57Z3fRGhc5S/+8+dymQrMegQbBStTI7NVnAP6OETxTdw7u/CEHkZFSM1HFH0?=
 =?us-ascii?Q?8oIX2f+RVLsNFHnKBGvB6eDNCXx65k9EGN/K2MDBIFhc7Pfp612scogtFJNN?=
 =?us-ascii?Q?CZBHszFKqQrPPEXHtmVnZJr9ecv8bjP8gQIpUSdXZEyArC03dOtfwLZbxlvM?=
 =?us-ascii?Q?2BhXpt6CMq9jQLlGgZ83ocCpV9rx0qpnS5Zql7yz5yblfVmwuofvhAMcACSh?=
 =?us-ascii?Q?VgZzQaXvUl9R6QU/yFg/XbDiWYR21V6+ff+WBPHBb267S58uUNV1r1I74/Bd?=
 =?us-ascii?Q?euQYSfStXCqi6ExfyhrPPAqh2Mi7TM9xxjtzqZUU+Y8+7GsE6I8cXyFZRHEh?=
 =?us-ascii?Q?68a41AutVCc7SUg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZIGbo+vpq+5nnIfj3ir4GQ0jbUFWzoparOcG0Z9wB5LdYDKexFG9BSVrCSle?=
 =?us-ascii?Q?ZuuNhf2APKkVFAIMbf9N6fzW5wy99Amr1WhaBMNvml/HmhyHRH/lySql4HOd?=
 =?us-ascii?Q?P+U1LCA43qf7G1gm/NU4fChjrbhpncGsc/z6QHajZXf1+R/5JDqMHuAyT9Ei?=
 =?us-ascii?Q?tZOKXfcZjhB+sFeQcSUkys01Gdz5vXhllK0kNhV4d2XDvc02ee869dEbfw9E?=
 =?us-ascii?Q?32JgbsnpgjwCnDtN0sbhxl79PHWy96EYS6omiXyY54+i5WMR2Who8CPowjlO?=
 =?us-ascii?Q?+CJP8RJD+CkchFxo5KmpIUgE6HFF5naPDKiXyBgwJ4SitRb64A7BtDZmU5nB?=
 =?us-ascii?Q?S5JypAgMQTL6YERDpKJEOTEySLQ7Qi4k1d0K+irFVmhOhyEPmHXycnVSVPyq?=
 =?us-ascii?Q?WqE2vewwUanl5ljQN7Y52Bfd3x81bEa13ovGmwE6yKhvcMolvVj9kTqcbntA?=
 =?us-ascii?Q?yQB6l/1b3G8JpEYbAU5rci5Droiz7qWnHlX/BHqgB9Ojh0QzxWwpFGBpIRSC?=
 =?us-ascii?Q?passFI8PhD/bUTZqabr5JqZjHBLGMPdJXI8kz1f2LmKiq5dDG3+VP0KN1Wau?=
 =?us-ascii?Q?q0gngHAu/MgUPLp0ynS2gU51A75f2ZS6t1rEVlOGlGbxP5sEh5+fhKsHhD5B?=
 =?us-ascii?Q?1UNMEfAMolZ7TnlxliZ1Egg10O6LODn46uvYQ0yHJbgxbdl2yjb9GDwMQBil?=
 =?us-ascii?Q?tK41egTsRiTBf3p8bu1wwR3HGMbjj6X6vq7WeQ/BlMifWK38j/ygwJT+Ctac?=
 =?us-ascii?Q?KvTS7UtrTO9p5kFWzZQ8n3ohZw1wL1kpaT9h6rhu7OJmxG1+JmjSQkNb8vwX?=
 =?us-ascii?Q?p5tbfHBIo1tUx3Y8Zg0sNeIbLgxZP98DkTluCszWgrKiw4UlYWKnE0r4dAK4?=
 =?us-ascii?Q?OYi/h6ZDJ+Tno3OzNkfTNs/YvslNmFMoF1qv6z3K4AwmLWak1RA+VROwgF8A?=
 =?us-ascii?Q?YeUwadEaFt0s+CSnA9NyCJbnjM+3MmUZLEfw1a3MXsZJLKcL/smbxSBmL8j6?=
 =?us-ascii?Q?av9LcUELI+pMqYt5mqvV0wnePALHSnzXS005W5oCc1nWj7RrWE9aWX79mFTs?=
 =?us-ascii?Q?AJ69YWJIMURUTSCudXKChGCL1aL9AXuQfJKSW9i8D9PidOID40OwWDtNSgCL?=
 =?us-ascii?Q?nDzk/PKVnudRE44o2Utk42DBT8QAmRch2PcvG/wDWJV+A+Xsf6IALPI2eQ5/?=
 =?us-ascii?Q?Et04irRWp5EEt9r7qKAChjkLOSgj61RxPOvEJl9g6GMIA1NZVXtxkjPU3eMP?=
 =?us-ascii?Q?hNctCoJyhJ+caPzU5Qpd71aKAIR68hwXpR9ZyNg9gEKROEHEn0x+BtI9GjDf?=
 =?us-ascii?Q?nvOvx8TmOcrp5zPd+YvE23sPEAEn2BerUdIRfiV661iT7lCHS2Yuh3FrxmK6?=
 =?us-ascii?Q?uja4TnJ5ngXimFVBSIQoiqHbyur6gkNESfsbYape10n4/1QnbciyWIuyAzap?=
 =?us-ascii?Q?cT5XYJSYlkxMcQd4oEKQYTTqQR2EYZHT2pc0ppgOq1B7KYpXFhr7yEQh6oWE?=
 =?us-ascii?Q?Aj/AoUc54AB0nv+nsW31yNm13UUwC6tcjt4HfakdmeTRfcc94Yc0TH120Pqv?=
 =?us-ascii?Q?ay8vugJo1TwlBCtApmA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6760e3f0-05dd-4459-d036-08de1e24e8a6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:41:40.6244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMGt74q0NheTZU2y8Ke4iqGIPD+jBV5Yi+UXrXuSNFPT8hhxK0ysA6gahqDZKd1M
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

Remove the duplicate code and change info to a pointer. caps are not used.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/platform/vfio_amba.c             |  2 +-
 drivers/vfio/platform/vfio_platform.c         |  2 +-
 drivers/vfio/platform/vfio_platform_common.c  | 24 ++++++-------------
 drivers/vfio/platform/vfio_platform_private.h |  3 ++-
 4 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/vfio/platform/vfio_amba.c b/drivers/vfio/platform/vfio_amba.c
index d600deaf23b6d7..fa754f203b2dfc 100644
--- a/drivers/vfio/platform/vfio_amba.c
+++ b/drivers/vfio/platform/vfio_amba.c
@@ -115,7 +115,7 @@ static const struct vfio_device_ops vfio_amba_ops = {
 	.open_device	= vfio_platform_open_device,
 	.close_device	= vfio_platform_close_device,
 	.ioctl		= vfio_platform_ioctl,
-	.get_region_info = vfio_platform_ioctl_get_region_info,
+	.get_region_info_caps = vfio_platform_ioctl_get_region_info,
 	.read		= vfio_platform_read,
 	.write		= vfio_platform_write,
 	.mmap		= vfio_platform_mmap,
diff --git a/drivers/vfio/platform/vfio_platform.c b/drivers/vfio/platform/vfio_platform.c
index 0e85c914b65105..a4d3ace3e02dda 100644
--- a/drivers/vfio/platform/vfio_platform.c
+++ b/drivers/vfio/platform/vfio_platform.c
@@ -101,7 +101,7 @@ static const struct vfio_device_ops vfio_platform_ops = {
 	.open_device	= vfio_platform_open_device,
 	.close_device	= vfio_platform_close_device,
 	.ioctl		= vfio_platform_ioctl,
-	.get_region_info = vfio_platform_ioctl_get_region_info,
+	.get_region_info_caps = vfio_platform_ioctl_get_region_info,
 	.read		= vfio_platform_read,
 	.write		= vfio_platform_write,
 	.mmap		= vfio_platform_mmap,
diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
index 3ebd50fb78fbb7..c2990b7e900fa5 100644
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -273,30 +273,20 @@ int vfio_platform_open_device(struct vfio_device *core_vdev)
 EXPORT_SYMBOL_GPL(vfio_platform_open_device);
 
 int vfio_platform_ioctl_get_region_info(struct vfio_device *core_vdev,
-					struct vfio_region_info __user *arg)
+					struct vfio_region_info *info,
+					struct vfio_info_cap *caps)
 {
 	struct vfio_platform_device *vdev =
 		container_of(core_vdev, struct vfio_platform_device, vdev);
-	struct vfio_region_info info;
-	unsigned long minsz;
 
-	minsz = offsetofend(struct vfio_region_info, offset);
-
-	if (copy_from_user(&info, arg, minsz))
-		return -EFAULT;
-
-	if (info.argsz < minsz)
-		return -EINVAL;
-
-	if (info.index >= vdev->num_regions)
+	if (info->index >= vdev->num_regions)
 		return -EINVAL;
 
 	/* map offset to the physical address  */
-	info.offset = VFIO_PLATFORM_INDEX_TO_OFFSET(info.index);
-	info.size = vdev->regions[info.index].size;
-	info.flags = vdev->regions[info.index].flags;
-
-	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
+	info->offset = VFIO_PLATFORM_INDEX_TO_OFFSET(info->index);
+	info->size = vdev->regions[info->index].size;
+	info->flags = vdev->regions[info->index].flags;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(vfio_platform_ioctl_get_region_info);
 
diff --git a/drivers/vfio/platform/vfio_platform_private.h b/drivers/vfio/platform/vfio_platform_private.h
index a6008320e77bae..05084212a76eb6 100644
--- a/drivers/vfio/platform/vfio_platform_private.h
+++ b/drivers/vfio/platform/vfio_platform_private.h
@@ -86,7 +86,8 @@ void vfio_platform_close_device(struct vfio_device *core_vdev);
 long vfio_platform_ioctl(struct vfio_device *core_vdev,
 			 unsigned int cmd, unsigned long arg);
 int vfio_platform_ioctl_get_region_info(struct vfio_device *core_vdev,
-					struct vfio_region_info __user *arg);
+					struct vfio_region_info *info,
+					struct vfio_info_cap *caps);
 ssize_t vfio_platform_read(struct vfio_device *core_vdev,
 			   char __user *buf, size_t count,
 			   loff_t *ppos);
-- 
2.43.0

