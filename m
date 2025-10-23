Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EE4C03D7D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8A210E9AF;
	Thu, 23 Oct 2025 23:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bGipCXkk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7402A10E99F;
 Thu, 23 Oct 2025 23:33:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKlm/+nzovDRo8iECUHFf0/1XPyqYjkraOP91dmD9TJNPGGPynfX+5uuFg9kuGZPEHrVECm+cbWWsBXIzRqbiMzCXERPOfpPIqJ7WqCt7PmDAZpzcB/WvwQOU8QW+gnkdyTnvXhH1kZ2PeiIOnAcRn0Qco5QXHVRwgBHezUDmb4+KQZ4pMM8Yu/ne+edw/uXHecz9fERy/bdfxIHPM3YDCvia9O6hbE95NxYGkdGc3WGEtXaAoOvKzym41f9wkjN1BF1BfW3DwUDOEENcPst01W7bGlU9+A+l2HVKC1j3aAKdrL67Rj3H+kru6jJCGem7BDHjtQNebqrqrJIpBoLzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6DADtuQX9WG7u8S8JWzIugE0ywZ2bmr6iafR88uXRM=;
 b=XVLbzFek2oTUuGliXJgb2Q1/xSn4BrlFBb4aWmJfJPM9pU0tGenOuoLM1x5iRK5TKQzijedd7JHvFTp4WaqsRoKFq2BgWnBtEYqWGJrD31suaagPMrg0AhYrjx8TLxRiHpLGvezu3C7HZGnhQCzlU7A9nsy7G3No4cIuIZBuKKu4Rq42gWasmLAW3osFs2VBQy8MuDifV+IdvcRxZ0fVWkcSiAI39IKBrVehvFE9CFLpO1GMr47qtwyvqk1DXiJrali/1fq9nTSkbS254cyAI8b/T1/XGjk8z1AYlKIRMmEQawmaYWgt5Z1JOlfqvw5Qw3SeZsRxjzjrSqhmnT33gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6DADtuQX9WG7u8S8JWzIugE0ywZ2bmr6iafR88uXRM=;
 b=bGipCXkkqDEqgPkuPVURPA5fDIvnBAOyOCmcA/RtVAMJsDDi4vy4oPUOTx3PXrgnw/unKHflSG/homteRTv1ky4vHHU2ayslBXZhZm9MTiz0jR/MODr8phJLc77H46tgjK8x5tGlJ0QGzXnIWSWie5W9IHpUPmvQm6SfTFtkSBO1pBKEo2epMsiZZjAmnWDnpz5KiDRGwwDmccYuyturQ3FZ/XizfobJwGI9htAb23mX7cTJCkz/ofBx0m0L+FfM8jxmSGw7GEVFT/DNxS0MkN6Ts79aJWA49CBl+zYTVnw/0VFh7x2kG64/4ilO++Da1iKf+O+UMCZ5CO+8LzAieg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by LV2PR12MB5943.namprd12.prod.outlook.com (2603:10b6:408:170::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:33:35 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:33:35 +0000
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
Subject: [PATCH 17/22] vfio/gvt: Convert to get_region_info_caps
Date: Thu, 23 Oct 2025 20:09:31 -0300
Message-ID: <17-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0299.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::34) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|LV2PR12MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: 77178c89-ddcc-4908-aaee-08de128c95d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gBgBDBnQZHkC3KaMWkMDE6RLaP1/TtpsBb+1/BWDC1UNzp0q79f4EF86oFBo?=
 =?us-ascii?Q?V+wrS/XQvScuoBiMppLh2iNyiZrFUSPSm7bwV50UqyqK9+13jIRrresaDaMK?=
 =?us-ascii?Q?IxWVHx2kSWjXhhg1IT1VPBOjl+64rd0R6VJDokh5oAGHD9vKonnf21rxGeNZ?=
 =?us-ascii?Q?jDYi48I3tb3B2/8jUS3NiogeM7510jv8VRSOm2AXAeI3iGP4cmKkRNPu04CR?=
 =?us-ascii?Q?CUINvbobFIo5EoETDtRQ415GMoJzxB70HiOvBLuWt8zhJ05cjkMY5Lxpak1K?=
 =?us-ascii?Q?Bn6xCgJwS6eAyjA+w75RvZsSgWhFlSDpo+rTzbDV4Pu4tMphEbTqZLzhaADU?=
 =?us-ascii?Q?aNZXGsKCdoQvS7JbJu+fm9fugaMIUD+fxrALPc1T2L1F2Hn3VVgTOvWurW/n?=
 =?us-ascii?Q?a2MoCjq4gyCs68oLtXXvpxLNJE3jrZ8f9ynMc4xZtYC9ePeAAupgx3oV61nx?=
 =?us-ascii?Q?R+09P7shzGLtCvC9Att0LIbs4dMGXu87gXD+2rqxDzq/I2xwhR6E0ynV5k3F?=
 =?us-ascii?Q?be1O3sbP6uv/oqJpruKSZz1pS3oV/a8+/RMlClF2yePth+DPwEGuGdigx3Nw?=
 =?us-ascii?Q?73av+emJ5xsDWbWHSCPW8vs6rgBiV2wFeaTlhmsOEiC/2zp7+3WrHNe32Oao?=
 =?us-ascii?Q?ct2+fZeOoOiXLcc7wrIFRY/FRcxFPrG7iQ+ZqIlrhbeqSnwg50MVnbgScovT?=
 =?us-ascii?Q?jGr3M7Cpv78FIucfVJDpUJcNoY6i/JFY6j+hWlWtgA59jxYhu3rz/N1PVVAp?=
 =?us-ascii?Q?rEKoHE5wCqpFKDNIGdcItgYsw9SHTgaOz4oqgQHSiIsQzJrYEMUzVp/hMd1M?=
 =?us-ascii?Q?Vp0xPMBUG0gg+odQpv7v0EBhXK+8lOZ40/h0akvgMzCN8CGpsC80urNRvuks?=
 =?us-ascii?Q?8lEfMLt55iyUHUUIGqtgsOE5qKAnW0hz9FqK29T3R5TRZfCqh3s0ccVHL47c?=
 =?us-ascii?Q?SgjOMC1lqUimuFwY5twtExDwDQkNzAAP8caZ3Etd9jLVv/YGOvF6lXq+2FVC?=
 =?us-ascii?Q?dU46a1U++31xJO+mK/zc/nYGKiQNiUYwlkTzMMkg/c6BkiYeY23SqhJydD6w?=
 =?us-ascii?Q?4yhaKcn4uZ6XAuRYC6hEuZNbnBC43knp3fqqHn9IGBp6YVkJJm746EAQMNjn?=
 =?us-ascii?Q?Ucuvs5s0CvUSYSfBfz+k/lh9XCrhJix5L9ca0b5x/IV/6csEQwqC0eGBR62v?=
 =?us-ascii?Q?Xc8weyidMeegOPXH6y6sy6tAA0zKcduryBAKxUlUtLuJ7mlHObhImf1mDTkf?=
 =?us-ascii?Q?aeUO5vnEnvQIMhjl/RjITK2JooEj64O2z7UbBOlj+NiOp2PZ82uskOtATt9Q?=
 =?us-ascii?Q?nqqu8wFilR+NyZ9fefzypwggYs+gXkMb3LlSXFl9vpnqKwgLtSKlhrz+Fzu4?=
 =?us-ascii?Q?xvssynkJvz+Yac/hhjn3B5Vl8VTO/fdpwYBp6xUgRrh5vWHpPbOuW05iNZ6d?=
 =?us-ascii?Q?l5/K/BEtV7Dn366YViVQtXxafxvqgM0PQFAyR6p1bClrvdz6s3VL1zzd+Y6Q?=
 =?us-ascii?Q?JqwHztuXn3i5nzQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2F2p75YRnbZkWiHSnfgX9AcE7xWUalmOt7QUtenBQQ8PTt692Vq8EScFXIa8?=
 =?us-ascii?Q?FC+/080QRg0Gj4i/Ua2cz7y6RyMJu6/uzx4iazKcEVyz7eFlKhMmFNNNabLY?=
 =?us-ascii?Q?M8hdjtM1QvYlIKIn60tRqExFud3Hzlvnd9Hbz6F39Hs118Z3FlsZLoWL6GH6?=
 =?us-ascii?Q?l2jVHWCk8o+IZlTfsa6jdhPKmdfbFSlZ7qk1cRtbZd/AesRM++Fy1TRCPc/q?=
 =?us-ascii?Q?HpgUbLS4Q6MpdjpaU6PTajkfXkegPSDk3qoIuIMTWbONVJRJOew4uy21ieNi?=
 =?us-ascii?Q?yYPcVsNcM49fFsevym2ceRFFoTVOk4Fltg5PrH2dZ+tA0yxQwlH7ZYRofBZQ?=
 =?us-ascii?Q?8fxF3Yak+uVsHd5Re1qf7vxxngF/RY0DROYA0uaqcOWHI5GL/SrFkNS1WYx4?=
 =?us-ascii?Q?Rm7ZFFVMobpwzEs+AMsMibUog1i1Wp9J2qQcPBUoJy7WZLYW/n3XILLtX9fJ?=
 =?us-ascii?Q?+btIZlAKnC+vEinWNOF2p3eEJrncReDabmtYEcZa5K+QF+kZhLzYFmjghOot?=
 =?us-ascii?Q?bPNOjnn9InEwb3jBJEEXN6fmvSGNRRz8Y69GbvT5FR9P8G4Zs+30ZMnK8rU7?=
 =?us-ascii?Q?ZcOjUz1ZAhH2FhEJaPjaEfNd1Sos5DVvy+uOEmO4ZwpIP0j+pqORhWe/wE4k?=
 =?us-ascii?Q?2lwYwI06Qv8SSescRV+4jJnWoWwgxhCQmXrgs5v0+S3DzkctRsbkk4wBB4e5?=
 =?us-ascii?Q?ezFGHYuSCojHVUBA+T/8lE5TVIDyu5VRbV/r0/al7Gcuc/E54GK9jzevy5cw?=
 =?us-ascii?Q?7bNAiKpda3IM7QePusL51OkzGsb3UCfajbCQVnPipxeSqnzzT2sPRcVDhku6?=
 =?us-ascii?Q?YJAtb6KzGghEd8YOohHkIlF77WK1/f6mf2x8sRu6VlcXF8K7yGrWQfnpMEhO?=
 =?us-ascii?Q?QCytcMfYXwyA2unmyFRRt1iv872ISH0bHAyGRYzrLl2kVbVYnsHrgiReDrJi?=
 =?us-ascii?Q?DRrmRm+1LD5zOY/YsWOEH7YrzpLqT8Pt0IFjBo+ck8nSm4TGLIK2X4FImger?=
 =?us-ascii?Q?TZ9LPJ26NM2rReLEMHrabngPQV6RG/VJaJRUhaSGlIWSQs7M2BCAdGX6y3y3?=
 =?us-ascii?Q?gWiFnVl62nNIlHH3PTI4b6RC+iHJ/208E06/fLqvuaw5kIcP5nCUGGdinnSo?=
 =?us-ascii?Q?LT0cDHGFEbYW0PCxHU4DUYSE+3LSyePv5CnXVkaYT/WKZ6UiawMUaeSQiFBZ?=
 =?us-ascii?Q?jkengCmdGRZ6N33ETt+RaT0SgzVEx8EMRGRVhm61pP2y6SzLvo7eQ0RubeIq?=
 =?us-ascii?Q?n+cM87NdQDUvofgpWwqSFO/3bqDOun4JYiSDyfkjihn5pyH079rcpFoTgwYT?=
 =?us-ascii?Q?AkpPzv5rbXNtvXe8DBg3KJjeKSuzoPTuv25NpTVk6Ol0u0QeOC3or/LTdmbB?=
 =?us-ascii?Q?YMso8xTWmYBACCgDHpjfrQxuwo85dibNMPQhiZzIVyh/MTWfn31Lf3AjGt75?=
 =?us-ascii?Q?wH26g2Y8zyOBxEroJBQamiTbvPP768MOnBN3efD2aCVaW+q8rSj+E6xPrU0D?=
 =?us-ascii?Q?jjeU5dnhWJ+uRgMNZmNW7qWlMKkp+Ee9zg+a5acsIG2ikeN8EDnSLA4nD1AK?=
 =?us-ascii?Q?T1mlHU+SKG4/1loy1J64+hRThVvE5WXWrnl2jD/W?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77178c89-ddcc-4908-aaee-08de128c95d7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:33:35.4938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sE7xQaBoE6wZX+/QKUj2SQWPmV3WeeHSefqWVWJYS3s0SMq6Z1fGw/FnV4m8n9kb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5943
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

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 113 ++++++++++++-------------------
 1 file changed, 42 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 6b47e33078eb52..b307535dfc9743 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1141,56 +1141,46 @@ static int intel_vgpu_set_irqs(struct intel_vgpu *vgpu, u32 flags,
 }
 
 static int intel_vgpu_get_region_info(struct vfio_device *vfio_dev,
-				      struct vfio_region_info __user *arg)
+				      struct vfio_region_info *info,
+				      struct vfio_info_cap *caps)
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
@@ -1207,20 +1197,20 @@ static int intel_vgpu_get_region_info(struct vfio_device *vfio_dev,
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
@@ -1228,32 +1218,32 @@ static int intel_vgpu_get_region_info(struct vfio_device *vfio_dev,
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
@@ -1266,27 +1256,8 @@ static int intel_vgpu_get_region_info(struct vfio_device *vfio_dev,
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
-	.get_region_info = intel_vgpu_get_region_info,
+	.get_region_info_caps = intel_vgpu_get_region_info,
 	.dma_unmap	= intel_vgpu_dma_unmap,
 	.bind_iommufd	= vfio_iommufd_emulated_bind,
 	.unbind_iommufd = vfio_iommufd_emulated_unbind,
-- 
2.43.0

