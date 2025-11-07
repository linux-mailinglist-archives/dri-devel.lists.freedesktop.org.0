Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF67C4118E
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BB210EB56;
	Fri,  7 Nov 2025 17:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="d2yGODxQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010012.outbound.protection.outlook.com
 [40.93.198.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409CF10EB41;
 Fri,  7 Nov 2025 17:41:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLhhcd9yWgiMDptNsldY8yRgqN6Z6TLbUltIsUY5jcNZflGfzCzGflDdvMxXZP7I7lNdACRELMTmWYkqtzypGrcxOxLKun1V/LjL/RNeFpEaxA3UfmC7dEWJCH5ZLZIVUTlJ/t5yw+yzqKwQtrz/2wgzrCvZ5jBPAsbWEvSSo4tRVBx48ijWy07YabgqLSaMnUc3P1fI11EbBwrHs9DneEtzXp5rOSMFeQ1GTR4pTYSC0AIXG4wrQM0Kh2b2mDDIB13nOPEaSm0cxJHpwXkQE+nyELxXMMqLjRzPlNJDbjPbMO4mayyGOw8RiF0Ww15pSAWW3ZHiDXK3muk9sVfG3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+0FsAeZSwTg1L4ew0coG0FMxoAZQ4Y2ohbnh16s7Aw=;
 b=KxP90xhG8Yij9JkarNaubg1hzCI6m9d5zBhZsQ4jEpsqO9J2+kVMto12r+Kw5XN2AX0cw24b91B1Er+inTsPv8NuIX44TENVu2hSZlBCZOwANjqNkQYNNW1p6atRCWoRzP/Fd/kCSj8Z1bsk8BZjcerkWCtrz6z/uFHidyvZRJ+RbkHcjKYxFhiJ5cUXSxzEbaa3VNKSyCiijdTxdfG0X8tbkhhKJHwoD/HXCmcKxtUk1yTR9mZLzhv056mNmK/Ga9+7WqDJQsZyDxL6cdVvoth2E/OOTSrVPvIsCP0q5rhzIZzjUKX6zkWWgXOFALUjw1e/H4OhNM6Ai+WAOkUTrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+0FsAeZSwTg1L4ew0coG0FMxoAZQ4Y2ohbnh16s7Aw=;
 b=d2yGODxQe+KbfsmFC5h/mjYQBona2EXDFBMQ5QVKCsd3gMH2jVornlfGHVdeItp+YoKEwH9nkrTw5U3jaPsieRP2EezXv30c0f1F7F8MJw46waoIIkTWemyJ3RWIWZcUCNpITQouAOMdoLquUZBguDV6kcaQAdMo+smTwdXS5D9g7qkSpwMEhegg0t5L3a+pD0pV4j4bQWT2QSrAdANjqMpvkTVNERlshWSNibznfTlYo53FjQy1KwAjPjrsZout3OT2l2aJznsNov8Ym6BK8O1sD+16U464tDTeUcKIFOB2Dfr8khlFCJteO1C/tDlJPYsEWXijKSmwFS+hGNPbug==
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
Subject: [PATCH v2 13/22] vfio/gvt: Provide a get_region_info op
Date: Fri,  7 Nov 2025 13:41:29 -0400
Message-ID: <13-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF00013E0D.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:11) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|MW6PR12MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 17cd6408-1024-490b-241f-08de1e24ea31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hbzl3Y9FrAY/qWobIrU8hx6rMRbWg+L0Q+T0Wqz69C7iWTf0UTjAfO9E1hU4?=
 =?us-ascii?Q?/j9VYUZQMyDT2QNE1twWBNGFPLmnHSzr7ejztotnVPKGEs7Cb6eUPMQtveKu?=
 =?us-ascii?Q?g/jDsiasuNJO/LVQvloyK/a+3ZBz+8uFnE6s65Rg7r4BY/ZZJKBcTz51zaVh?=
 =?us-ascii?Q?MZqM6U0jhIBl84hdiFAE62IjkN/eLlclz/s5V2M6cRl01qslREf8UsHM9iSs?=
 =?us-ascii?Q?+Uug3DtrPw+RSIHKS+6CCsyQjEDNPdmboCckVhYowfB3HtnqFjUVpKHQv1s7?=
 =?us-ascii?Q?dLWJ3vZcIUwbM/GoGgmdM4BQC/bsSEimYdPcsxjx05V+bgVsQEZLFRnkCF0V?=
 =?us-ascii?Q?nCtkfvKWqLhKvEup37OzSIkmvolUDH/jPnqIlTfk9wK+miFINph/jPqTTVpb?=
 =?us-ascii?Q?VV56Vd2pjT9YsiHMJDmO3ktqMuJK1ylx87iACurAlZ1HNEkWOM1jJ0bDjtjU?=
 =?us-ascii?Q?CwG5OVdMwJA6AH924J6Ny5r/OCIYp0V3JJgEkvrdFhtFFt4XgTA8e9UzQV4T?=
 =?us-ascii?Q?YmSgQqDxlLYq5Uh/4EuM7NbNyNMozngnXhNGCEv3M+hXHj5/D8/JP+wumIwq?=
 =?us-ascii?Q?ocVK74VQk1JRtcBJmqtol1+zdJLvI+KCLM9e7V0SniM9z2Afc5V73SMd+CLr?=
 =?us-ascii?Q?ZRBOEkTej9uCUfoKV4jkD/DS1EG2MdalduyOSVqoNVV1/9YYlEuR6i70uQ9G?=
 =?us-ascii?Q?T4ovYuvcfxIZT1LC9/KKSxxblOW07On3YmVFoYSSagT70xArwh1S3DKlG7OS?=
 =?us-ascii?Q?EZ0Q65VDGiFHjrvyDd1QChDggmkTXvqPFaBJhaQ26WUi2kDwforlLGmaEn/V?=
 =?us-ascii?Q?eu0yGQCoOmLEzgz4KryHYy/S0QrJOwEK4pJpE7C/GlRus1pqfeGR5twgGdd0?=
 =?us-ascii?Q?PrxDkjsotRPcDTvVOdm3bdxIxEzwxtSDyRYRXNO5ZQQ9V5MS+87+PyhTAAgo?=
 =?us-ascii?Q?ggdj7HzbGmlcXtUpR5JWF57gGk6Cl35HK3kihJNwUpsLaZvm+4DqtJ6UC47o?=
 =?us-ascii?Q?YWSmqARiTkYN/5WeoEMWNDcMP5mEXpz6mJXjNyVZD716ZWXCSNQyU+pJTXYJ?=
 =?us-ascii?Q?03TvCz3ja/AkobGkb0W0ciKWuQ3/8UB0VMDVGZ7r0JdWbsrxLiN2KXV7bBUQ?=
 =?us-ascii?Q?jAOJf4gHB+RI+DXUKZ0CEtp0bUduP2Updq97xyZzjcXZDhB1qhW3Q6SAqakB?=
 =?us-ascii?Q?i9yEgb/j34c6GhybVimiriJBex/Dku2u4WM/DpxBLk3WfN1KaQr/mmutyYnO?=
 =?us-ascii?Q?6vRgkfzV9ejO32GXTCWsKg9uwfqh3lwJh5v0llA90AhmJJhFKOmPDKwkNwrL?=
 =?us-ascii?Q?+jkRu2Jh43MMw4BN9H5G/4crTf29qDcMoDiUJNViSEEao94nxW7Ja1fFC8Yi?=
 =?us-ascii?Q?kuEPHw6pUxL69x1kZM+yghhTJZcW54NWsVSPW0P+iD0XGMb4jTHT3m5v6NQ7?=
 =?us-ascii?Q?+GE2ZwYrIRVHALc6yzW5j89eA5C4ViKhhNGCFfVLVWQ4OjG19HDZUPMMxK+Z?=
 =?us-ascii?Q?RId0gKXJr1k8bEA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sfag2GJJqzOVT9T8sP9kzrPjl4b4tZD+QPA+eaolYJLXsHlP3B3cWij0Tq1+?=
 =?us-ascii?Q?05zG+eMSFh/N8gyySYMPjHZU1edSpd94ICcYJQLvYu7hkiZfkKaFTcfuXwWS?=
 =?us-ascii?Q?aAUV/jjl76iEHOJAoQadgbr/VUyzRW2Yeu5KqZ+WJ0VOUjgOOTE1HgkQ16TV?=
 =?us-ascii?Q?F1MSCx7MfpqqGZdkQhe7PbgNeerlQi9gPa9vxRo6B6JEw+13h4rSbX3MgRUY?=
 =?us-ascii?Q?hlGeRTM+IiHL6HkwI6U+A+cqFghrGsjc+SPVLjBu8lgL9lzIkZtioO3MCrvF?=
 =?us-ascii?Q?0ok5ZopfF4x1/Dip+Cd8QFCshH5t1e+/Go9G1l6FR+cnG9skzVLs2digENec?=
 =?us-ascii?Q?obxo5udIzhjV3shfECDWYwAJzq/gMTCuvURA8CqzxLC+eNaEoYzZ2VQDWWIV?=
 =?us-ascii?Q?ie2LqiRhePFnE5of1p+BVyxwpZ1Hf4U5ZXLmh2MwD1ypY9x5BlQKylAUgKIT?=
 =?us-ascii?Q?N6maIsobPtYXEO1L9w97nCLgVmu28UagxXqSdAsyE16iP5Mf/RsYQEVuf4TE?=
 =?us-ascii?Q?SNrGEaMgwjzGdVVpGkUCByEF54NLGV27yqw9CoLUP5YafvNSCVJaad48r31F?=
 =?us-ascii?Q?49OcFns1piUO41wNZrdJhe9k3l84KVEKaU+b/AhXqa5wdj4VellGAQBIEeGP?=
 =?us-ascii?Q?oeAjiOkjuQIALghIBHMrFQajVshf0jfP7W98GL9XmswKWu/zAvuyWbt6dnjy?=
 =?us-ascii?Q?fTNb/XOEhXS8VuhKRXs4/nTiLsi6XVuZnDO2XhtlsQ3ZsU11B1oS8Vl7UV+0?=
 =?us-ascii?Q?pSdChfUGbwKXCF61K7r9ulgUmjYdkR+emZKJif5ihZQGMad5wsthAJo5wBHF?=
 =?us-ascii?Q?iDPpydjWx9NCdJuXE688BIcEirevgbceCz6wqaBWRl7rIt2UueDYjqRJXh+X?=
 =?us-ascii?Q?NRxtU60As6rvgwf76M/nI/LpNavOh0H/zOOafdyOyAUmYNjMQohdLBaKXq9o?=
 =?us-ascii?Q?ZLZc3GkC7mIJmkIk2uNesngVEdrxDfZ3q0/SwgB8RDAnyRj5yOourvqe0MXX?=
 =?us-ascii?Q?2qykfmOUpFfdIpRa6n/fQadifj5Iamq3JvIFph3acNFlT+g22pPO/XRys1nG?=
 =?us-ascii?Q?tFgRPn4ybAYa8i1vud1jDoG3pgwPvw+VEFPUdAWr5WuvK6jLup7dVEQq9nWD?=
 =?us-ascii?Q?eFgIPs4paYc6bN1PIH2tuefDFLk+/N15O5En24utGC+9M69fi2R7rkW6XSBs?=
 =?us-ascii?Q?G+kdQcVhUvrLKwbsha/5esbNx2znX5rD9tjyCfcKtVFCbnyB1aBkqmROMu4E?=
 =?us-ascii?Q?CwIn+eZU/SXf8Uf7MxYr5Ts8L0YzVzbvVBNhZEFme+1l/VXJVBDo3btQU0U0?=
 =?us-ascii?Q?83jUaug4vH+/DhwGV04ROZJ6S3PPTjtztQEMOo61FwLM5QmnVjgF2bHhdLd8?=
 =?us-ascii?Q?c4uw6JwyZ/aC9nc1n6+bJH2E245ahOxmfZ7UNMK4/mOnIaCNLMQy9fVOBWud?=
 =?us-ascii?Q?3bO9V76IfraU3dX0yG8OP1pCtXIlvp9tRYQ6DpkvilWzaWjZQ0PjTGUUuhi+?=
 =?us-ascii?Q?B+8DHGEbXa1jmBF4Ctz2lgGI4XrWqiOV49v10d8bTAaDrqfxSKurPAqZ3Hm5?=
 =?us-ascii?Q?fgnyKMfwYQgtCJlJubI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17cd6408-1024-490b-241f-08de1e24ea31
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:41:43.3430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PIcPoHG7IFIPlV5FCY5fIGb/9JwD1opUcoVYAOhnEc78Sad6o9zWBhQV6i9bCYr
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

Move it out of intel_vgpu_ioctl() and re-indent it.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 301 +++++++++++++++----------------
 1 file changed, 150 insertions(+), 151 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 69830a5c49d3fd..1feb2a28ca5fda 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1140,6 +1140,155 @@ static int intel_vgpu_set_irqs(struct intel_vgpu *vgpu, u32 flags,
 	return func(vgpu, index, start, count, flags, data);
 }
 
+static int intel_vgpu_ioctl_get_region_info(struct vfio_device *vfio_dev,
+					    struct vfio_region_info __user *arg)
+{
+	struct vfio_info_cap caps = { .buf = NULL, .size = 0 };
+	struct vfio_region_info_cap_sparse_mmap *sparse = NULL;
+	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
+	struct vfio_region_info info;
+	unsigned long minsz;
+	int nr_areas = 1;
+	int cap_type_id;
+	unsigned int i;
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
+	switch (info.index) {
+	case VFIO_PCI_CONFIG_REGION_INDEX:
+		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
+		info.size = vgpu->gvt->device_info.cfg_space_size;
+		info.flags = VFIO_REGION_INFO_FLAG_READ |
+			     VFIO_REGION_INFO_FLAG_WRITE;
+		break;
+	case VFIO_PCI_BAR0_REGION_INDEX:
+		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
+		info.size = vgpu->cfg_space.bar[info.index].size;
+		if (!info.size) {
+			info.flags = 0;
+			break;
+		}
+
+		info.flags = VFIO_REGION_INFO_FLAG_READ |
+			     VFIO_REGION_INFO_FLAG_WRITE;
+		break;
+	case VFIO_PCI_BAR1_REGION_INDEX:
+		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
+		info.size = 0;
+		info.flags = 0;
+		break;
+	case VFIO_PCI_BAR2_REGION_INDEX:
+		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
+		info.flags = VFIO_REGION_INFO_FLAG_CAPS |
+			     VFIO_REGION_INFO_FLAG_MMAP |
+			     VFIO_REGION_INFO_FLAG_READ |
+			     VFIO_REGION_INFO_FLAG_WRITE;
+		info.size = gvt_aperture_sz(vgpu->gvt);
+
+		sparse = kzalloc(struct_size(sparse, areas, nr_areas),
+				 GFP_KERNEL);
+		if (!sparse)
+			return -ENOMEM;
+
+		sparse->header.id = VFIO_REGION_INFO_CAP_SPARSE_MMAP;
+		sparse->header.version = 1;
+		sparse->nr_areas = nr_areas;
+		cap_type_id = VFIO_REGION_INFO_CAP_SPARSE_MMAP;
+		sparse->areas[0].offset =
+			PAGE_ALIGN(vgpu_aperture_offset(vgpu));
+		sparse->areas[0].size = vgpu_aperture_sz(vgpu);
+		break;
+
+	case VFIO_PCI_BAR3_REGION_INDEX ... VFIO_PCI_BAR5_REGION_INDEX:
+		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
+		info.size = 0;
+		info.flags = 0;
+
+		gvt_dbg_core("get region info bar:%d\n", info.index);
+		break;
+
+	case VFIO_PCI_ROM_REGION_INDEX:
+	case VFIO_PCI_VGA_REGION_INDEX:
+		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
+		info.size = 0;
+		info.flags = 0;
+
+		gvt_dbg_core("get region info index:%d\n", info.index);
+		break;
+	default: {
+		struct vfio_region_info_cap_type cap_type = {
+			.header.id = VFIO_REGION_INFO_CAP_TYPE,
+			.header.version = 1
+		};
+
+		if (info.index >= VFIO_PCI_NUM_REGIONS + vgpu->num_regions)
+			return -EINVAL;
+		info.index = array_index_nospec(
+			info.index, VFIO_PCI_NUM_REGIONS + vgpu->num_regions);
+
+		i = info.index - VFIO_PCI_NUM_REGIONS;
+
+		info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
+		info.size = vgpu->region[i].size;
+		info.flags = vgpu->region[i].flags;
+
+		cap_type.type = vgpu->region[i].type;
+		cap_type.subtype = vgpu->region[i].subtype;
+
+		ret = vfio_info_add_capability(&caps, &cap_type.header,
+					       sizeof(cap_type));
+		if (ret)
+			return ret;
+	}
+	}
+
+	if ((info.flags & VFIO_REGION_INFO_FLAG_CAPS) && sparse) {
+		switch (cap_type_id) {
+		case VFIO_REGION_INFO_CAP_SPARSE_MMAP:
+			ret = vfio_info_add_capability(
+				&caps, &sparse->header,
+				struct_size(sparse, areas, sparse->nr_areas));
+			if (ret) {
+				kfree(sparse);
+				return ret;
+			}
+			break;
+		default:
+			kfree(sparse);
+			return -EINVAL;
+		}
+	}
+
+	if (caps.size) {
+		info.flags |= VFIO_REGION_INFO_FLAG_CAPS;
+		if (info.argsz < sizeof(info) + caps.size) {
+			info.argsz = sizeof(info) + caps.size;
+			info.cap_offset = 0;
+		} else {
+			vfio_info_cap_shift(&caps, sizeof(info));
+			if (copy_to_user((void __user *)arg + sizeof(info),
+					 caps.buf, caps.size)) {
+				kfree(caps.buf);
+				kfree(sparse);
+				return -EFAULT;
+			}
+			info.cap_offset = sizeof(info);
+		}
+
+		kfree(caps.buf);
+	}
+
+	kfree(sparse);
+	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
+}
+
 static long intel_vgpu_ioctl(struct vfio_device *vfio_dev, unsigned int cmd,
 			     unsigned long arg)
 {
@@ -1168,157 +1317,6 @@ static long intel_vgpu_ioctl(struct vfio_device *vfio_dev, unsigned int cmd,
 		return copy_to_user((void __user *)arg, &info, minsz) ?
 			-EFAULT : 0;
 
-	} else if (cmd == VFIO_DEVICE_GET_REGION_INFO) {
-		struct vfio_region_info info;
-		struct vfio_info_cap caps = { .buf = NULL, .size = 0 };
-		unsigned int i;
-		int ret;
-		struct vfio_region_info_cap_sparse_mmap *sparse = NULL;
-		int nr_areas = 1;
-		int cap_type_id;
-
-		minsz = offsetofend(struct vfio_region_info, offset);
-
-		if (copy_from_user(&info, (void __user *)arg, minsz))
-			return -EFAULT;
-
-		if (info.argsz < minsz)
-			return -EINVAL;
-
-		switch (info.index) {
-		case VFIO_PCI_CONFIG_REGION_INDEX:
-			info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-			info.size = vgpu->gvt->device_info.cfg_space_size;
-			info.flags = VFIO_REGION_INFO_FLAG_READ |
-				     VFIO_REGION_INFO_FLAG_WRITE;
-			break;
-		case VFIO_PCI_BAR0_REGION_INDEX:
-			info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-			info.size = vgpu->cfg_space.bar[info.index].size;
-			if (!info.size) {
-				info.flags = 0;
-				break;
-			}
-
-			info.flags = VFIO_REGION_INFO_FLAG_READ |
-				     VFIO_REGION_INFO_FLAG_WRITE;
-			break;
-		case VFIO_PCI_BAR1_REGION_INDEX:
-			info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-			info.size = 0;
-			info.flags = 0;
-			break;
-		case VFIO_PCI_BAR2_REGION_INDEX:
-			info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-			info.flags = VFIO_REGION_INFO_FLAG_CAPS |
-					VFIO_REGION_INFO_FLAG_MMAP |
-					VFIO_REGION_INFO_FLAG_READ |
-					VFIO_REGION_INFO_FLAG_WRITE;
-			info.size = gvt_aperture_sz(vgpu->gvt);
-
-			sparse = kzalloc(struct_size(sparse, areas, nr_areas),
-					 GFP_KERNEL);
-			if (!sparse)
-				return -ENOMEM;
-
-			sparse->header.id = VFIO_REGION_INFO_CAP_SPARSE_MMAP;
-			sparse->header.version = 1;
-			sparse->nr_areas = nr_areas;
-			cap_type_id = VFIO_REGION_INFO_CAP_SPARSE_MMAP;
-			sparse->areas[0].offset =
-					PAGE_ALIGN(vgpu_aperture_offset(vgpu));
-			sparse->areas[0].size = vgpu_aperture_sz(vgpu);
-			break;
-
-		case VFIO_PCI_BAR3_REGION_INDEX ... VFIO_PCI_BAR5_REGION_INDEX:
-			info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-			info.size = 0;
-			info.flags = 0;
-
-			gvt_dbg_core("get region info bar:%d\n", info.index);
-			break;
-
-		case VFIO_PCI_ROM_REGION_INDEX:
-		case VFIO_PCI_VGA_REGION_INDEX:
-			info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-			info.size = 0;
-			info.flags = 0;
-
-			gvt_dbg_core("get region info index:%d\n", info.index);
-			break;
-		default:
-			{
-				struct vfio_region_info_cap_type cap_type = {
-					.header.id = VFIO_REGION_INFO_CAP_TYPE,
-					.header.version = 1 };
-
-				if (info.index >= VFIO_PCI_NUM_REGIONS +
-						vgpu->num_regions)
-					return -EINVAL;
-				info.index =
-					array_index_nospec(info.index,
-							VFIO_PCI_NUM_REGIONS +
-							vgpu->num_regions);
-
-				i = info.index - VFIO_PCI_NUM_REGIONS;
-
-				info.offset =
-					VFIO_PCI_INDEX_TO_OFFSET(info.index);
-				info.size = vgpu->region[i].size;
-				info.flags = vgpu->region[i].flags;
-
-				cap_type.type = vgpu->region[i].type;
-				cap_type.subtype = vgpu->region[i].subtype;
-
-				ret = vfio_info_add_capability(&caps,
-							&cap_type.header,
-							sizeof(cap_type));
-				if (ret)
-					return ret;
-			}
-		}
-
-		if ((info.flags & VFIO_REGION_INFO_FLAG_CAPS) && sparse) {
-			switch (cap_type_id) {
-			case VFIO_REGION_INFO_CAP_SPARSE_MMAP:
-				ret = vfio_info_add_capability(&caps,
-					&sparse->header,
-					struct_size(sparse, areas,
-						    sparse->nr_areas));
-				if (ret) {
-					kfree(sparse);
-					return ret;
-				}
-				break;
-			default:
-				kfree(sparse);
-				return -EINVAL;
-			}
-		}
-
-		if (caps.size) {
-			info.flags |= VFIO_REGION_INFO_FLAG_CAPS;
-			if (info.argsz < sizeof(info) + caps.size) {
-				info.argsz = sizeof(info) + caps.size;
-				info.cap_offset = 0;
-			} else {
-				vfio_info_cap_shift(&caps, sizeof(info));
-				if (copy_to_user((void __user *)arg +
-						  sizeof(info), caps.buf,
-						  caps.size)) {
-					kfree(caps.buf);
-					kfree(sparse);
-					return -EFAULT;
-				}
-				info.cap_offset = sizeof(info);
-			}
-
-			kfree(caps.buf);
-		}
-
-		kfree(sparse);
-		return copy_to_user((void __user *)arg, &info, minsz) ?
-			-EFAULT : 0;
 	} else if (cmd == VFIO_DEVICE_GET_IRQ_INFO) {
 		struct vfio_irq_info info;
 
@@ -1475,6 +1473,7 @@ static const struct vfio_device_ops intel_vgpu_dev_ops = {
 	.write		= intel_vgpu_write,
 	.mmap		= intel_vgpu_mmap,
 	.ioctl		= intel_vgpu_ioctl,
+	.get_region_info = intel_vgpu_ioctl_get_region_info,
 	.dma_unmap	= intel_vgpu_dma_unmap,
 	.bind_iommufd	= vfio_iommufd_emulated_bind,
 	.unbind_iommufd = vfio_iommufd_emulated_unbind,
-- 
2.43.0

