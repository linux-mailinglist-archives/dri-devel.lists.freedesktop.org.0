Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A9CC41335
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 19:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B97610EB5D;
	Fri,  7 Nov 2025 18:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IjlfdUAu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010050.outbound.protection.outlook.com [52.101.46.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D115D10EB48;
 Fri,  7 Nov 2025 18:03:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDvrzrB1tkZss1QKWnqK/NGuPEJ2WfgqW8XahiHXHAn0sEYwoyZgmFx6nQVC8cFGAmURdezcFTO/tSSHHRTb1Vcg3jl1qO8j8q8FkgRfOimSg3JN5zZpBcaFM9PvEKcvMl0OZwGYW/xCSQiiJ8kwnNDPLV296JVJupWeIdUuF6vkJzz8ReJb1wdWBU+WKOU9zc9J6hZZPxGoekMPiq08br7a6WnaUZqeuxIzTMKMNz0cmZWEt3mFToTMwylb0O4m8RwPWuzKgvrvMKQDpthTOCtd0CNqzH/4eNQzocguClBX6eZUGblwRQBgywaiZqJE+B0bGSrf71LWF+CLeO4mTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opO9qsZowR8VjiX18BNgqcdfHyOiKBzOPl2uT/vYgaM=;
 b=ycgwUZSRIggqoUyQWaY2NMMFQiUYj2jqD4uDYfyPBOd1rgMHtOOwLUq5XEK0dHZ1awFxj72Rx06Qub27Y2eqbOX3lsxSAwsXrykVJL0S3mXJeXdJGcKIr3pb5itnUsxpeqXQH7/+bVX94UPURKq2gkx0cNUboR7n2EZ/uTilnAZSwLa/sju/OGfpUZtYFcdG1HOlnFbLDUFABOHNvA+8yvxOdoEoUQ0030K0UORAiA/Qtelf6yhDQrbAlC3QTtokHitPKvhtv6RnAHqHXqMqXm6fwKk8pNUa46aVh/Ne5TWqSheZrAZljYmS8gIGOrX6zyssI+gNjy1DHeNWyWkUfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opO9qsZowR8VjiX18BNgqcdfHyOiKBzOPl2uT/vYgaM=;
 b=IjlfdUAu9xidYiDYUr8SgbvDoAB4P8h4fMODmFOjXeSemaPR3BCKO2MtE4iwXuY6GfpEHpmQEtieeIf18vRor83Wd389X+grUAPR/1Oo8lvyCNVT2YMLcYI9uIuPami8Uh7URiiz79VNohXsZYBduHVI8v1HYwbXyOnjslzOEgnVKEFz6h/tfZTuKlmlm+JptMC0roy+qlAx8fOQ0aoY7weqTrEKxFH76EvNV1/BSLCoMnI8CZwZ+oPj7V+DSv5DQa+VPVgLxmo9AkvsQnNv7y5T/5HER7w6gdUzdf/s2IPs3VTfqFz7iToMaNTw9yi+eRMq0uwHRDOn9XbHpk/M0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ0PR12MB8091.namprd12.prod.outlook.com (2603:10b6:a03:4d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 18:03:29 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 18:03:29 +0000
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
Subject: [PATCH v2 17/22] vfio/gvt: Convert to get_region_info_caps
Date: Fri,  7 Nov 2025 13:41:33 -0400
Message-ID: <17-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:208:256::22) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ0PR12MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: bc424e2e-418e-4921-dc1d-08de1e27f47d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vK40vvqIe5ukyQxvJGUoFkFPk6jk4ZUU4fiGPYV8kMRwUwO/7c8f0rv9Ygf+?=
 =?us-ascii?Q?jzjWdRTTOYF4uikH+fPLtTUNkcdsmW1qWXuQEK9eM9W+voBOk17isqr/Fo+I?=
 =?us-ascii?Q?ZCv/RmzxzcFpcx6NQeQRpboGmmGzRuNgw2Fp0rsW+9FRE1VYll9iatn9/LWA?=
 =?us-ascii?Q?I0hvdaTxqwyQf6zwCk7GMQ1LL67cKyzFNFJw6dKNfzdfUxSwBUKvl/pyxde+?=
 =?us-ascii?Q?lyb/HvSEULXJ17sa4bTP7hU8DJBnsAhu2BxP7/yH9wPxozOAc9q+BUHqGa5K?=
 =?us-ascii?Q?A3GJ9FlUxqcZ7i3hYIOPN7TsSIyWFwFLGFaTKS6xTvEe/E9Kq9BfGGOmDamB?=
 =?us-ascii?Q?dkzNe1Ye6W/sHuHYlWT3UT6duwV0QdRpQmwA1bEzM8bu/h7shy3a5vqFker5?=
 =?us-ascii?Q?VYp8cZtQFzLQKj1nohAdReAlO/VvJGbtBFDWQWWA+HgGH1l9PgdlSVyWQQ3r?=
 =?us-ascii?Q?ykhNhbyFeS0sClFgAHW23A2Wxn+SDUfzNa6UGleJb2kwsYFohY6aCMKylO0A?=
 =?us-ascii?Q?ZyeG2CxAygWg7CIIXeEJVPdzfaLSKCuFwRSFigAS+r76m/vnBApcWTZ/OOh9?=
 =?us-ascii?Q?lhp7x2yqxxO69+gs1MaSkkKaOhiYKR1ad6/amr71BQiyWAzdGNAer+pyEPFF?=
 =?us-ascii?Q?/dlNfOb86E8hirT7Z027luRaQGUZabX5z3vbfVvXMmhX23UKNK8zNfJMwrQX?=
 =?us-ascii?Q?m75KeSBDTkQyMy1u3d2Sind6jlrf91CpulDoekmdTWhPsc5dlnqashabgSHC?=
 =?us-ascii?Q?WS3R5bRP0sVacfDQ/Mb63LF9nDNasfP+ZuiK2QcqfJ3T6icWmRUmIspCIA0v?=
 =?us-ascii?Q?dsKOwa6mNS+YGIBKiw/FIoJzL1j1y/btYtXyFSqk/gfjxo6tb0Ru/oWKceOc?=
 =?us-ascii?Q?mhi7lU9kdaTr8gLNgWrxe0GEO6t3MwGyAPATyHvMPMga2/Sgmus4fRPnkfcO?=
 =?us-ascii?Q?3056w70+YxFRZcQMmQfZ04GQmqnn73LKswwP8Z9EM/pWtePExf8DnlmqrG2j?=
 =?us-ascii?Q?f2ADnPpf34LFe4AzbHjrh9IKFzUa5At7nQN328Onc5GTt1wHgN+ptgBrkNo5?=
 =?us-ascii?Q?fZz+e527++E/ym0JPGS5vcHQKpolzs8dmqxujjS5HD8gzUopBzWzWgAKuXXp?=
 =?us-ascii?Q?HB/xikQTyu5vZ2QharAP/wrUx635PUeapFJoFNB/RUGcbI+rCXVTUbA+LLAT?=
 =?us-ascii?Q?smpiOdsKmCI9qFd0ahpmnPHmGYQW5SrHq7iWqZVvAEoNwzkA7uB1lclBjOp1?=
 =?us-ascii?Q?Pl3kMpLVmgOxZvYHWrWEe/DjDzHypcZYF8OvjdqiQ83KA/eDiRTrAUZnDJip?=
 =?us-ascii?Q?hQj30asfXYyY4cj22sm7jP+sua4u42+TrGkRwrfFg+GMM+O0FuZ+aCtMCtY6?=
 =?us-ascii?Q?HLFO5h7rsZhAcVMCXmhv+12LJOiqqwXwQfZSevcult2EdWTt5fCFQGmDTp3B?=
 =?us-ascii?Q?pdNn7jAzfexAIKQ1SuUgMfLZwgS2vk8eBUwUgUITSCd39HtnNYeDo0KHKLkF?=
 =?us-ascii?Q?JRd1JlZiig3A3AE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?62MO0cwKsaTaDbM5xxp0bALaNEYqKw7Cxe2DlkgUCa6iWqGAU+axn50384+1?=
 =?us-ascii?Q?uLIbTRhO/rYJ8XoxmnqwBZqjkh8DGfrUYEVhKc68w3efGl7aq708NFJcR5Wb?=
 =?us-ascii?Q?RpCj4MJ6YbqS738SakTW39CZ4KrtJWJzd6n3VxA9XFlAZoDq6qQ6x54/A9iL?=
 =?us-ascii?Q?6crKJGqxaUGdb5R4EfSr/JH3u64mM4Z/5lVueVc8jGy6PQr1kpXfLWQhVgVo?=
 =?us-ascii?Q?D1nUV67VSvLAUkWwoo935TBwQ0YFNwDhajg0luu7ro++iySxM4+grgAnJJ7f?=
 =?us-ascii?Q?5bxKq2gNoS3eDbgIwAOP8/DAuchGZE3RPLseSqZR7MWeXcOXritWMqWnoQwi?=
 =?us-ascii?Q?JrxUTLNy9dArwU926WD6SxB835X4NmzDfdQwfz3slISXKLPIKKKonswjBPhX?=
 =?us-ascii?Q?ZxYVk1OLXycWyk14VC5qTsahcC9+jQgrfvdPlKAbWMNSbfTvD2uLr622TdZB?=
 =?us-ascii?Q?mR6+G8r6OfZ4sBCKhf9PB8+qi8W1JjmJ0/hKZaludup3rVgl731gZPhVME2t?=
 =?us-ascii?Q?A2HPmEjSdDdb3mV4pqzPhqYQCrfoqALy/zWkSftivoBcOSRnLwUg+drLQQc8?=
 =?us-ascii?Q?Tzbs4le3cnpz2mOm60RK+KaoRimiW2k3mjJ0nCeFgKLXJDx+J9V4PRsGKHPX?=
 =?us-ascii?Q?n5+aFK/UJmw3Mmy6SuLDXF5nZtOUwtMJ0Oh9CFDJE+HCHRqIbbZ0T4/4Srcl?=
 =?us-ascii?Q?f5BEiNvtPG0p7wSSJ9hpiYoGDY9q/BPyfBtq2T4B7JrrpDiePVyn7cYGE1oL?=
 =?us-ascii?Q?nyw2tIjY2eRPq0SESYvh6pTqvyvVjq+4SCJyv19ytrmrD1f9Lnk0DHgaxsXC?=
 =?us-ascii?Q?EYdkLHws96jPqi0f1cGzrPRpA1fHajpefSnYxWi7ri4rCuKPeElxL2jURnJz?=
 =?us-ascii?Q?Aymxrk4LUf8vUfW6HVyYrvA9kRgYNurLShC/HE2iJ6j6AA99krTLeEbOUG3r?=
 =?us-ascii?Q?AlKhhFGmpagfAZzfk4PiL7XgX2VagswiMMyn0+74Huh1DCmdpydDKOImtCju?=
 =?us-ascii?Q?eF6E925YIpXthUmjRDUik5OGH8bqInLDnB5MB6h7hyOFPLMzJDGeBfCWnsPA?=
 =?us-ascii?Q?k+b0QSLj9jainhBTsfHkvcMnf0Gx9Axu0knyETQyxKpFFmN+A2uv389DYI+p?=
 =?us-ascii?Q?8rnUmgVt7IpUNW0D8ihk13p7wktAFXPrqpjhwwYqkQZEn2bRpm70COtrQJxD?=
 =?us-ascii?Q?H+4yxB91yn3W3nRVO8P3kuMTnOdfkgdIBptH4mK2eUmCY+qTaj5bDdu4YYHJ?=
 =?us-ascii?Q?CnMX9lXaCw/NpQ7DxLms08tasRK+65gkJP4Ku4iIGPk5ZnD/+0HRrO/FniRw?=
 =?us-ascii?Q?UeJ0gP80IlUo8XoQQG5CsTTQbr15LALHnCBBYvMzOJQwPRVEVrNL6Dk5YB9Z?=
 =?us-ascii?Q?o7lafM1KZErqTSzo6CDxtgr2iFyZt4lnyGrq6STAbUrnpkVeYaifxSRzXw5Z?=
 =?us-ascii?Q?xIHzL97pDDxV//OQcRjhR8DL5L8spzH2EZE6q9RvUnqTXuiifx3SyJIPGCUZ?=
 =?us-ascii?Q?523UoA02IWw/3syTsilWD2ki6lUZutAQsGZ1XwRFUiHcDfjWpwcwwzjwXv/D?=
 =?us-ascii?Q?KBuThqB7gLP5wpG9oEo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc424e2e-418e-4921-dc1d-08de1e27f47d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 18:03:28.9610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iuUOlJwjsnMNa6Bi588lBT0tERxL5G+z7e6VKADiP/SF38mArFayQAaVRwam2Gt
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

Remove the duplicate code and change info to a pointer.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 113 ++++++++++++-------------------
 1 file changed, 42 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 1feb2a28ca5fda..96d23717684f7e 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1141,56 +1141,46 @@ static int intel_vgpu_set_irqs(struct intel_vgpu *vgpu, u32 flags,
 }
 
 static int intel_vgpu_ioctl_get_region_info(struct vfio_device *vfio_dev,
-					    struct vfio_region_info __user *arg)
+					    struct vfio_region_info *info,
+					    struct vfio_info_cap *caps)
 {
-	struct vfio_info_cap caps = { .buf = NULL, .size = 0 };
 	struct vfio_region_info_cap_sparse_mmap *sparse = NULL;
 	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
-	struct vfio_region_info info;
-	unsigned long minsz;
 	int nr_areas = 1;
 	int cap_type_id;
 	unsigned int i;
 	int ret;
 
-	minsz = offsetofend(struct vfio_region_info, offset);
-
-	if (copy_from_user(&info, arg, minsz))
-		return -EFAULT;
-
-	if (info.argsz < minsz)
-		return -EINVAL;
-
-	switch (info.index) {
+	switch (info->index) {
 	case VFIO_PCI_CONFIG_REGION_INDEX:
-		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-		info.size = vgpu->gvt->device_info.cfg_space_size;
-		info.flags = VFIO_REGION_INFO_FLAG_READ |
-			     VFIO_REGION_INFO_FLAG_WRITE;
+		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
+		info->size = vgpu->gvt->device_info.cfg_space_size;
+		info->flags = VFIO_REGION_INFO_FLAG_READ |
+			      VFIO_REGION_INFO_FLAG_WRITE;
 		break;
 	case VFIO_PCI_BAR0_REGION_INDEX:
-		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-		info.size = vgpu->cfg_space.bar[info.index].size;
-		if (!info.size) {
-			info.flags = 0;
+		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
+		info->size = vgpu->cfg_space.bar[info->index].size;
+		if (!info->size) {
+			info->flags = 0;
 			break;
 		}
 
-		info.flags = VFIO_REGION_INFO_FLAG_READ |
-			     VFIO_REGION_INFO_FLAG_WRITE;
+		info->flags = VFIO_REGION_INFO_FLAG_READ |
+			      VFIO_REGION_INFO_FLAG_WRITE;
 		break;
 	case VFIO_PCI_BAR1_REGION_INDEX:
-		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-		info.size = 0;
-		info.flags = 0;
+		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
+		info->size = 0;
+		info->flags = 0;
 		break;
 	case VFIO_PCI_BAR2_REGION_INDEX:
-		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-		info.flags = VFIO_REGION_INFO_FLAG_CAPS |
-			     VFIO_REGION_INFO_FLAG_MMAP |
-			     VFIO_REGION_INFO_FLAG_READ |
-			     VFIO_REGION_INFO_FLAG_WRITE;
-		info.size = gvt_aperture_sz(vgpu->gvt);
+		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
+		info->flags = VFIO_REGION_INFO_FLAG_CAPS |
+			      VFIO_REGION_INFO_FLAG_MMAP |
+			      VFIO_REGION_INFO_FLAG_READ |
+			      VFIO_REGION_INFO_FLAG_WRITE;
+		info->size = gvt_aperture_sz(vgpu->gvt);
 
 		sparse = kzalloc(struct_size(sparse, areas, nr_areas),
 				 GFP_KERNEL);
@@ -1207,20 +1197,20 @@ static int intel_vgpu_ioctl_get_region_info(struct vfio_device *vfio_dev,
 		break;
 
 	case VFIO_PCI_BAR3_REGION_INDEX ... VFIO_PCI_BAR5_REGION_INDEX:
-		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-		info.size = 0;
-		info.flags = 0;
+		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
+		info->size = 0;
+		info->flags = 0;
 
-		gvt_dbg_core("get region info bar:%d\n", info.index);
+		gvt_dbg_core("get region info bar:%d\n", info->index);
 		break;
 
 	case VFIO_PCI_ROM_REGION_INDEX:
 	case VFIO_PCI_VGA_REGION_INDEX:
-		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-		info.size = 0;
-		info.flags = 0;
+		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
+		info->size = 0;
+		info->flags = 0;
 
-		gvt_dbg_core("get region info index:%d\n", info.index);
+		gvt_dbg_core("get region info index:%d\n", info->index);
 		break;
 	default: {
 		struct vfio_region_info_cap_type cap_type = {
@@ -1228,32 +1218,32 @@ static int intel_vgpu_ioctl_get_region_info(struct vfio_device *vfio_dev,
 			.header.version = 1
 		};
 
-		if (info.index >= VFIO_PCI_NUM_REGIONS + vgpu->num_regions)
+		if (info->index >= VFIO_PCI_NUM_REGIONS + vgpu->num_regions)
 			return -EINVAL;
-		info.index = array_index_nospec(
-			info.index, VFIO_PCI_NUM_REGIONS + vgpu->num_regions);
+		info->index = array_index_nospec(
+			info->index, VFIO_PCI_NUM_REGIONS + vgpu->num_regions);
 
-		i = info.index - VFIO_PCI_NUM_REGIONS;
+		i = info->index - VFIO_PCI_NUM_REGIONS;
 
-		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-		info.size = vgpu->region[i].size;
-		info.flags = vgpu->region[i].flags;
+		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
+		info->size = vgpu->region[i].size;
+		info->flags = vgpu->region[i].flags;
 
 		cap_type.type = vgpu->region[i].type;
 		cap_type.subtype = vgpu->region[i].subtype;
 
-		ret = vfio_info_add_capability(&caps, &cap_type.header,
+		ret = vfio_info_add_capability(caps, &cap_type.header,
 					       sizeof(cap_type));
 		if (ret)
 			return ret;
 	}
 	}
 
-	if ((info.flags & VFIO_REGION_INFO_FLAG_CAPS) && sparse) {
+	if ((info->flags & VFIO_REGION_INFO_FLAG_CAPS) && sparse) {
 		switch (cap_type_id) {
 		case VFIO_REGION_INFO_CAP_SPARSE_MMAP:
 			ret = vfio_info_add_capability(
-				&caps, &sparse->header,
+				caps, &sparse->header,
 				struct_size(sparse, areas, sparse->nr_areas));
 			if (ret) {
 				kfree(sparse);
@@ -1266,27 +1256,8 @@ static int intel_vgpu_ioctl_get_region_info(struct vfio_device *vfio_dev,
 		}
 	}
 
-	if (caps.size) {
-		info.flags |= VFIO_REGION_INFO_FLAG_CAPS;
-		if (info.argsz < sizeof(info) + caps.size) {
-			info.argsz = sizeof(info) + caps.size;
-			info.cap_offset = 0;
-		} else {
-			vfio_info_cap_shift(&caps, sizeof(info));
-			if (copy_to_user((void __user *)arg + sizeof(info),
-					 caps.buf, caps.size)) {
-				kfree(caps.buf);
-				kfree(sparse);
-				return -EFAULT;
-			}
-			info.cap_offset = sizeof(info);
-		}
-
-		kfree(caps.buf);
-	}
-
 	kfree(sparse);
-	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
+	return 0;
 }
 
 static long intel_vgpu_ioctl(struct vfio_device *vfio_dev, unsigned int cmd,
@@ -1473,7 +1444,7 @@ static const struct vfio_device_ops intel_vgpu_dev_ops = {
 	.write		= intel_vgpu_write,
 	.mmap		= intel_vgpu_mmap,
 	.ioctl		= intel_vgpu_ioctl,
-	.get_region_info = intel_vgpu_ioctl_get_region_info,
+	.get_region_info_caps = intel_vgpu_ioctl_get_region_info,
 	.dma_unmap	= intel_vgpu_dma_unmap,
 	.bind_iommufd	= vfio_iommufd_emulated_bind,
 	.unbind_iommufd = vfio_iommufd_emulated_unbind,
-- 
2.43.0

