Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 977FF995067
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 15:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375C910E541;
	Tue,  8 Oct 2024 13:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LspoFCCp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169AA10E481;
 Tue,  8 Oct 2024 07:32:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JE5G56X81b3HHpV/JgrI+J8vlrEjFFXgHj+W2B/roNQjXSJxZaACVwq8nnadXMKe8XcWAP7ri8dCfeI2BByqpLiQydYKweCT4B6ReNicV8V/+Ci2+9WDdOLP2EzIgwsfkUpaa+zaHcRTgikdNGOAEoXluYI9oPT6VeMcxBRsqOjdnFsq4jGjrbiNgkkHO5E+LB2/WHT8Um+VcP8Agc2v9qfevztmpdpxnPa27m9/Py9xGC80tmtMg5E9SVSw1yyqc5082pYI1P5AZwvfYAcu9iGl44kEqdomWSu6UG6DnGmWcRcDVnugBV7M8XoDpRwLNAQDVQoXIdlAW1fC96u0BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7er5QWkVAR30tYU+u5zWDMxY6A325xO9o5a7E70Nrc=;
 b=gvwSxA6GvRe3aUhltZVUBa0PpbUzFYgNHgiFu52me4Mw5YC7J/1Hi1/Y0sx8yr8SKtJ3Awm5/8MbyZUgdVlCduoL3peGSN+AagDPkgJsWof3pdVZqsSOdmkSpiq9Ix1unwtPLdFBdBy5u8R6YquxJ3Lwolab4vlcU77cs/WmLfY/aYap9OnfjkdBGnhe3LVc9nYRzzkuUSBRXuhY5FdnUl/MCvSrMI1nRIRX7BnIGQVNhkADs/yfchP+NLN1kUPVQAKQsP0BgeJWdU91vl4dzPUu/FTsG49GbVaCi1YnU+A5qhb5XDPYa24HDwXWVqp4esVbvYWaBklhGervPKX9Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7er5QWkVAR30tYU+u5zWDMxY6A325xO9o5a7E70Nrc=;
 b=LspoFCCpgjYK+7aWVV/WzLxtCLOdVMAdJDdxeG9hswwunpx7/RIGz+3b4/puusgnaRcCrBhygmXuV4f6pwUTTLWMIoSyjiYjzmRxNUjmdnVFms0z+E9NsLth/Vd6EGrUyi9XBJaoRCwj2wAuqx6/lcIcO3NJ1/xpOYGoB2uEbUlGcMXBCl4bT/fuOL9AQ4PZfL9loDTx+eH70/Cv6LIxr9d6Q1RRMUaMvsydxFT5nuFC3O+U81YNzD/vtFc3TfQC4P1XigG2B/lhTWaDwoozLOXkPwNFScFqNZK33Fx90Su1rHDqsgPn88GluhtDMZGEB8DI1f9my4NxIvUmEZBLSg==
Received: from BN0PR10CA0019.namprd10.prod.outlook.com (2603:10b6:408:143::8)
 by BL1PR12MB5777.namprd12.prod.outlook.com (2603:10b6:208:390::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 07:32:39 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:408:143:cafe::f) by BN0PR10CA0019.outlook.office365.com
 (2603:10b6:408:143::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Tue, 8 Oct 2024 07:32:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 07:32:39 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 8 Oct 2024
 00:32:29 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 8 Oct 2024 00:32:29 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Tue, 8 Oct 2024 00:32:26 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <kherbst@redhat.com>, <lyude@redhat.com>, <dakr@redhat.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <bskeggs@nvidia.com>,
 <jglisse@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH v3 2/2] nouveau/dmem: Fix vulnerability in migrate_to_ram upon
 copy error
Date: Tue, 8 Oct 2024 10:31:03 +0300
Message-ID: <20241008073103.987926-3-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008073103.987926-1-ymaman@nvidia.com>
References: <20241008073103.987926-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|BL1PR12MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: 75b2dba1-1006-4369-ceb6-08dce76b6385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7uzH7+oqiWoir1UN15SS/jkUv3ZwdESkhtxsuG35gBw26FVilOsot9UCjG/+?=
 =?us-ascii?Q?TEdg8C0w23SklmnFelsAHibZvWh6MSqk649SKPxzjad7OhsVm/0RR8/hQxyj?=
 =?us-ascii?Q?Gcfp5nUcj9iXByF54ITZ2nWwe4nzE3En5W53QowQYqGunIB7R7tUe3olZp7T?=
 =?us-ascii?Q?o+rEZUml3ZHHDR5eodBQA1YjEHznpCCpEKsBw7TBv1AlGNFXFNrN+fu6I+xa?=
 =?us-ascii?Q?4nucAyR06XeAbXFIzXH4H+vRVyY8Uf5xb+xKxQU3vNHUUmYF1KpsvqOKEbKb?=
 =?us-ascii?Q?qWH/Aczld675T4Zu1u/EW1o/UJ5lDinSIkeMm5JooO0D5pYVLKgQNj/aZo+3?=
 =?us-ascii?Q?/EGWoGVD+OwHOgcWjn/a90K5QLmsI2Kl2WyTcCx2OdhLjyw4gLauXJ2FoTpY?=
 =?us-ascii?Q?SzYi36WuGEfQvOYSBHuGh6eq/T04mOWGGMF9031sIYDGWoHn86Gg6HgU6xmo?=
 =?us-ascii?Q?iMRPWEBi04W1PCcmDh2AaFAPFL3bvG6uUeNOcMB6yLCO6Ya+S/sgsikE1ESL?=
 =?us-ascii?Q?NJTdVe1Qwl26jGGQvHk85C1Mbmzk3Jyx/2pNKwVWckIYIDzZPR+bo6yzXhHh?=
 =?us-ascii?Q?38ttlh1NOfyAiisSst3/L7e/MrOiZTJkiyFKj2KvcHsn1dpxF4qWU0ncj9X2?=
 =?us-ascii?Q?w6aZN/aa568Cd2ci8XijqGH7pF0YHRayahu+bzTZ3bkvXBV9xRPqZAB/9XZ7?=
 =?us-ascii?Q?Hpg0sly/BcbVM8xwREXW/NlCtWnpj48d3EmxGOxG6dJfbNxJoHrvZP1hUjfp?=
 =?us-ascii?Q?HZHJvoqQd8UMJl4D/l4GgHYtpNvt6DHEuxP4lb5Yn8yISuyjJDM+gmIeTRHJ?=
 =?us-ascii?Q?zsG198OkZLqcCcFcSoAwkevUzQxEGinbkwWgOeoYuPXegWfJd9BSviHaiGLZ?=
 =?us-ascii?Q?3WIv+/NUKpbqsQDkMWCp2Sa4chaKTFTD+h+1j0AIiN6DQn8QgN2avqUFWJmp?=
 =?us-ascii?Q?itP6DGQAwdTS2qOiS10XuyhFF8uyBS29jgmPBxes2im3jdHFlUIk7CXaSKoI?=
 =?us-ascii?Q?HV0M1wuXJ9ezo6IJK0dnv7eKVgc//opN9gWV6eEnQ4FMvEdg42p2Jw54bzKT?=
 =?us-ascii?Q?owGT48nfD45r3JEE5L8kYVWf8YmdrXOaToTawYVJCPUuae4F6LNqWFZeagVd?=
 =?us-ascii?Q?vQf207I2Ew6s3VOFKa9/KbLETo/XFfjrnCp4hkMvMtvx5OFFEfqtgNXc45Vp?=
 =?us-ascii?Q?Pv+Y1Y2VPuct79WV/vCX0jPHpiBh1Y43xzecBn+cvq0hhV/Wu0mjfxBWdtyY?=
 =?us-ascii?Q?2g6Fnyb99l7lVk8e9CXt0BNk/oNcg3NyHdhVZxVr+AREUzjVHmBBiU9BlB2x?=
 =?us-ascii?Q?iYaXF2dbVBPKh0WOCzB/DeIzi+owB5G6SSAcnVX0ztZuf/0V+Lnbb3DE5pwu?=
 =?us-ascii?Q?pTe81XwP6se/NH4sU2lnjLZSN51l?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 07:32:39.5123 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b2dba1-1006-4369-ceb6-08dce76b6385
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5777
X-Mailman-Approved-At: Tue, 08 Oct 2024 13:41:08 +0000
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

From: Yonatan Maman <Ymaman@Nvidia.com>

The `nouveau_dmem_copy_one` function ensures that the copy push command is
sent to the device firmware but does not track whether it was executed
successfully.

In the case of a copy error (e.g., firmware or hardware failure), the
copy push command will be sent via the firmware channel, and
`nouveau_dmem_copy_one` will likely report success, leading to the
`migrate_to_ram` function returning a dirty HIGH_USER page to the user.

This can result in a security vulnerability, as a HIGH_USER page that may
contain sensitive or corrupted data could be returned to the user.

To prevent this vulnerability, we allocate a zero page. Thus, in case of
an error, a non-dirty (zero) page will be returned to the user.

Fixes: 5be73b690875 ("drm/nouveau/dmem: device memory helpers for SVM")
Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
Co-developed-by: Gal Shalom <GalShalom@Nvidia.com>
Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 6fb65b01d778..097bd3af0719 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -193,7 +193,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
 		goto done;
 
-	dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
+	dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma, vmf->address);
 	if (!dpage)
 		goto done;
 
-- 
2.34.1

