Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151F299506B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 15:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F8F10E545;
	Tue,  8 Oct 2024 13:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="n/2Dp69b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327FF10E4CE;
 Tue,  8 Oct 2024 12:00:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6JfGpW7FWvteZzb/IQ8NPwBkYoHE5ggO/lu3NxKzi+ahWbgFMEqINK700B0YZp/0zwuASZ+VlRC7GpbAuF0EoiU82QiqWqXKfCyt38rfUMAjXYIZ3a7oI5Wbul8LsqDwEt86HOa58GcLd5o8TuCmfRA+l58WiJbaTT8wxmhGj1qbYANpxaJd8DL4+ZCQJmecKyR7KG1I+vc4tdiR4F1hBqHP1nXQGdgGlvOu5aAvAmO9K7sc7+vhe+vMwGa0lwge82fC6XmptYa7vNf4lH1PCWwOf3ZHjbeLxfJkFTbZa07QwuJkCx12XFbllG1N1lyTQoaYtmGC5LfShZVEc5HSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQM690i/yDTfvpCSK3ONa3mBr7gqm0sRCIvh/6jqs0U=;
 b=PfO8XoRvOjS2CvlqxTowkwM0FJC5A8eQ/mawkmu1cPLL2NtOETtu/tuTGC98zA1FXP7h+dZJq62XtT3rQAypd6OgnBmssSJdxO5qVNbF3qBMlFKb8xs81P6LW7ql54+8m/z6P5/281TIBpreU+9bl98w1qsY6jYK2uomWrxYsF8lvgvbFTRBfZ85CdgBjVRNj49WRRzbfMCqMfrTSeeHADDFee2VR5R6HiMTm7zRmKht2O2xgXB+gluAxGz4814ittLDCGVZBDXOU64bkpqKg2CH9gaWM6gIUBqUKwepi7y85UpTbwgNeeNTDUAgjmkKg9ZATsvL1Gy5Ff1v5AgDuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQM690i/yDTfvpCSK3ONa3mBr7gqm0sRCIvh/6jqs0U=;
 b=n/2Dp69bBYI+F1lV7wWJzQCyjrtb28sYMpzoaOMY4iDNzJbLo66MbLRymMw2Y+Bd2pFMd8jGZJSQR9l7wdpIvOB0fhF0XddVpYqYZu4y0H9lPEet4xjpSuuSU2B1KI91oeoLL9eGbYeFrSz4CGxn+6j8oEqy5vHK6/ZIzWre+D0VicI5VRim0mP7ttu6NNMJFtBbvuuFvwo+UB+VbqExwMBFpgoRHEyw2VVibkUI78GaV9LciKubTyZMxCrFBglCByjT20zbY5XwWnCpp7fZtbBwN/YP+O+Hr3BJvDEC2/XLFli6+E1MLfWbgqZMARsyhrgDEEBxbJkv4w9SrDoq8Q==
Received: from SN7P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::8)
 by SA1PR12MB6971.namprd12.prod.outlook.com (2603:10b6:806:24e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 12:00:40 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:124:cafe::c) by SN7P222CA0014.outlook.office365.com
 (2603:10b6:806:124::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Tue, 8 Oct 2024 12:00:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 12:00:39 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 8 Oct 2024
 05:00:27 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 8 Oct 2024 05:00:27 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Tue, 8 Oct 2024 05:00:24 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <kherbst@redhat.com>, <lyude@redhat.com>, <dakr@redhat.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <bskeggs@nvidia.com>,
 <jglisse@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH v4 1/2] nouveau/dmem: Fix privileged error in copy engine
 channel
Date: Tue, 8 Oct 2024 14:59:42 +0300
Message-ID: <20241008115943.990286-2-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008115943.990286-1-ymaman@nvidia.com>
References: <20241008115943.990286-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|SA1PR12MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c456d5b-1aa6-488e-a6eb-08dce790d41c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R8pDsLqLUXaRaDFHhoc2WobnPpCPn1rpKn7FyMYGukZTI74cqB+YXlwr6ly0?=
 =?us-ascii?Q?IQJVd3JEtclBKiDQMdDUODwrvOeSC5VC6qYNrdAKoprk12Pu8YEB+dTBNNVZ?=
 =?us-ascii?Q?bvp8cOs9r+f1mQCTSd6UNS/KPlRFgeRGr56xMJO12QqLvsQPd5hr7PXXp1bI?=
 =?us-ascii?Q?Vofg4MjqrWgoihjQnxEbwKlCdmSMvFUCUWvEH3wOv9K7aAEdojjRYdFOeUeq?=
 =?us-ascii?Q?BgHghss92FFp6m7K8TKue64jcANaPWTM2aQLmq20fUA9uSCf+T63BA5bv4j8?=
 =?us-ascii?Q?OeUxyBxT8v4sAEhZ1RubKKGvFDEzG7nsr7hlroWny0DtoSOIiVE9P5Q6tA6s?=
 =?us-ascii?Q?gZ6BmcQRmrrtNB5238+44AyF+UcG5WFQStecACT6a+HixzRNGnS49ZBefFyY?=
 =?us-ascii?Q?vD2gTR2YpR6csrcIzzlBpnmzVmOoupI5NTDHU9pVV+Zm0I1iaVnukz/ENL1R?=
 =?us-ascii?Q?Jmb6uvAe5Vv631oHXyemXa5wZxI838xuINr5kqlKrpvE6ebBR6fIXnSYV2Pd?=
 =?us-ascii?Q?JrifYGSCHAYWAvzwEm/3W1guvF5DvytL1wEyEgWOwgX9G4wTyDmev8SPgZ3s?=
 =?us-ascii?Q?B5YfievWXdrl6lvpjGqG+fPTT8uPxazIYkB+q2QAoKtdNbxqDa8+XtIDzdqs?=
 =?us-ascii?Q?155aPaYp0qpP6LqEgu9XkDoaqEQJ72jPeeqKrqtqirb877uNN7sW+vLcXEeL?=
 =?us-ascii?Q?SvaWluDfGaSDPtIFx0a//vJTEtqbwpxunJkTVwCTp3ms3R0kF3f3woo8kDuZ?=
 =?us-ascii?Q?Zn1PGTfFHT+IljPMn+XosDNV16Ri9QYz0b6BaOxydH4bHo0DF2opSAOi7DdE?=
 =?us-ascii?Q?AKca+PCfjBIKPgHJwkYQBUHu1hG22RHVa6wZhWL+E1llFlDrsttDXVqikpDZ?=
 =?us-ascii?Q?Ja4Dz0aIP9FzAVmQbcuk8wLGems+4Kfr3bh+bU+Fn66JnT9ofMRWWJ4//UKu?=
 =?us-ascii?Q?Ia1ScOLycxQ82Fbk8jPNwCACCSjqNSgZbwSJ5syMbE7dM0ZTDH6clsD+N7dF?=
 =?us-ascii?Q?XqhDaFRNZwffDxhg1mRO0RmszYZuqOWx/gEyJIqGk/kRwlKDzHnU6Q9JmBL8?=
 =?us-ascii?Q?2cAbrOROdkI7BqsDum8IMWBWx4MMLNRqah66KZT20GxSLn2HlhjqIuZOV4sU?=
 =?us-ascii?Q?i5E6w6Jlsus1NEd1BwyqonomHBGkiRGm6v4XHcui5Er4fw3yckVjJb5n208r?=
 =?us-ascii?Q?9murT+43L8NFGe9+TWoZ2KXY7UX7CwvpaUO026V0tgyOch/JK8xIsO+s53Xy?=
 =?us-ascii?Q?Um0RvwkSHZjj4pkztR8C1IkMo5rUV29FhT7p+vpxutHJ0QxigMj0+bnHMbOA?=
 =?us-ascii?Q?ew92063mBIEa9S7JI7I39NZKW1rWja3dFrwNKAFmHBENvz9irEYFRmu9CDOT?=
 =?us-ascii?Q?olwPjQ7LJhAm3QX7m/Dpawf2MVEY?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 12:00:39.8473 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c456d5b-1aa6-488e-a6eb-08dce790d41c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6971
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

When `nouveau_dmem_copy_one` is called, the following error occurs:

[272146.675156] nouveau 0000:06:00.0: fifo: PBDMA9: 00000004 [HCE_PRIV]
ch 1 00000300 00003386

This indicates that a copy push command triggered a Host Copy Engine
Privileged error on channel 1 (Copy Engine channel). To address this
issue, modify the Copy Engine channel to allow privileged push commands

Fixes: 6de125383a5c ("drm/nouveau/fifo: expose runlist topology info on all chipsets")
Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Co-developed-by: Gal Shalom <GalShalom@Nvidia.com>
Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index f6e78dba594f..34985771b2a2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -331,7 +331,7 @@ nouveau_accel_ce_init(struct nouveau_drm *drm)
 		return;
 	}
 
-	ret = nouveau_channel_new(&drm->client, false, runm, NvDmaFB, NvDmaTT, &drm->cechan);
+	ret = nouveau_channel_new(&drm->client, true, runm, NvDmaFB, NvDmaTT, &drm->cechan);
 	if (ret)
 		NV_ERROR(drm, "failed to create ce channel, %d\n", ret);
 }
-- 
2.34.1

