Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BB29F8B89
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEAA10EECB;
	Fri, 20 Dec 2024 04:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zliHEQjB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A48E10EECA;
 Fri, 20 Dec 2024 04:44:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJ9chXLyGcXOaptPVNPM6gVQk8Kd28xnzgMiL7WSEAOqLc+FkYmG6kjwuC3mopAKvCxEU2DkD8tZ8F79h85uurHhiXXxklmDEymxZFrgLXviPg0PyQcoixQt6nAFE2Tj5S1ZggmC35ROMHhCUCUxm5+pscluTYQwPPOen2sBLy5KBg3fSVD6scX9GPADiujdPGdkc80GSJ4wMx/IMvVx9vfIhmHMm/hNsuIxQKfnvoBpM9Z2l0G5H2aYm2u02OqxrSL9+yLZ9ATBJ73x/VTH38GY1LYmCBYrzdRloXKwi6MXdLeBQQBJ5eWtNgUZRd3YiOyqgoEt/t2EHkDaZxPpxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbUVwHqOA/d9jfjsMvmReFTVfBXaIexMWQdnWlHfU3A=;
 b=KDVZiM8EA85OQUrXmuAJl4JC6CyG/qSppTa+NZjTXUwip/1GcovUYGBzXJ0um2AERnUOeXM9/m10OItxdj0qvsn4uYnyQj2ZAQOOJAvs2oGzev5DfCIdzdDcMj6DWferzDseZ3HWz1ipPRcPTtjh52wbWQGhXaS5YltKdyv097Bl/C9nKULqchSzLAQvTn7yNId+LSpGcvyGWaEBulzb+5SEjAbWlm4308wGWoXSYmVJKhab3OAWtod5OMvsh+uC2RubSuL7+QwNadrlWsrBro8kZ5dNuwEEu9TcnIpj4Mg2sd0sPbA/E44ZmYSXLJDQJEfsSd01Jmkqr7h3+xZvug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbUVwHqOA/d9jfjsMvmReFTVfBXaIexMWQdnWlHfU3A=;
 b=zliHEQjBFtHTkBTHmC9d44lpG5wFH6GPOlmUISg5uS6rHYu2vw+kYJXwAQNd96Yhv5cIVsz6Yw5ArAMcspmkggPSmVroWNyOGZt1tr9xTYNzfKe/3OxqK909n6P7zAN7M+jI+PuOLGayRMOQ8z4kg+qcEsOpuw8c5wD7iPRXR+8=
Received: from SN6PR2101CA0001.namprd21.prod.outlook.com
 (2603:10b6:805:106::11) by CH0PR12MB8464.namprd12.prod.outlook.com
 (2603:10b6:610:184::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 04:44:17 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:805:106:cafe::50) by SN6PR2101CA0001.outlook.office365.com
 (2603:10b6:805:106::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.8 via Frontend Transport; Fri,
 20 Dec 2024 04:44:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:44:17 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:43:34 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 31/45] drm/colorop: add BT2020/BT709 OETF and Inverse OETF
Date: Thu, 19 Dec 2024 21:33:37 -0700
Message-ID: <20241220043410.416867-32-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|CH0PR12MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: bdfcfa80-c535-4ff9-b8ae-08dd20b0f649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P9PCgvdPmrVSDPPxEYUJqwfFPgbKas6hB7EGqrU9bA2FcT8ccB31CZ2GGzFY?=
 =?us-ascii?Q?xDifnWwz7gUld2Nx8haJCT2eLe+gD9MZoE2KZDoEpi9Flz+TNcr4ZFfg0wfB?=
 =?us-ascii?Q?NBurqbl0lC8+my2CSRt4YucYDcCNrf/GiQCAt07HWmmJFNbPO9Q9Jp+sZK7O?=
 =?us-ascii?Q?d2P3kWBoWiw4bZ67uzS+9thQLKrJSqhMrRjtg+sjeu9KtxyuWxMJwxotvZZG?=
 =?us-ascii?Q?aJ0TrVOmYYQJS4wcrcLIco60yFKYzvzmZWprQZr4gepYFZojAndC5UzuYXLa?=
 =?us-ascii?Q?ZAzJNYzWYPQfo6TM+1C3j2mtkRnkzyGcZOGISrERfcaMP9KYZPaeJ3RA3fjj?=
 =?us-ascii?Q?8PXXPoi6islxqF99J6yciYaGUpD6HuqZyISb5KcbeETpRz7EZr27qOmgCwy4?=
 =?us-ascii?Q?4YsVz7eVIwkPsTYXx/5dJn7c0ZmmxviA7QdWH3MVD7dCwdZYdJaumpLyQVbE?=
 =?us-ascii?Q?h1vppe45g+GZAcCt8quWqnAEZYYsiXT3JO7O9RLNMIc9qUzhZ5YuPXbEWW8o?=
 =?us-ascii?Q?7imK2qvvchd5XaaLosTKVlMWZzwZMwT9P4aZkgj87IklAwt84Cb+6BLzHwZg?=
 =?us-ascii?Q?OQYcqX3/lYFwnsNn/WvmMJS+q2uwglrXaF1sG036A6nn1KtSfroDgUY+iKUM?=
 =?us-ascii?Q?JFtMNJlJe1TDzCKSYAJv5r2CGpsWcwVuxS2OlUyzQDmN8/d++uTtcrZX9UsR?=
 =?us-ascii?Q?aE8cBLkgmB1SrlQMO/sJU0e5iGtKaotjjPMCtGqEPmR5i/1l8nQMXmv42DnU?=
 =?us-ascii?Q?ccXCAOrOUfPBth72dF+iafZu9UKsx2oredK3O0+petvyOoDeHcX5LQbGUh0I?=
 =?us-ascii?Q?tB/wkzmf5zpEEFhTnfMuujgA9X4YuQUnmQjGc6POq55tgmkPIQFLARViF3LM?=
 =?us-ascii?Q?PUN7s59/6m/Ij1tEDkeJCKnmWELZiIZiZpGzZPUmQeIfGIU6dq8MEWIqb+h/?=
 =?us-ascii?Q?oeXGNZ0+8gZTzfYRuUqX4wa/2l2OQGdCrvMbm6DWSbNb+i5vK0o+xQeYgjaZ?=
 =?us-ascii?Q?GMtJe6bu1aOnMdyrztb+3mFHn/sZJl0TL4OMV37Wf/hwXNjgC9fgBOU3z6XE?=
 =?us-ascii?Q?yyy1t5JycFS4/uMIH4dRBvxkmvEo5CspIJstigRzLgEVOW0Jqk3zyJQhZ6BX?=
 =?us-ascii?Q?0Ps2b3e/P9YXe9TX9NCa1g8AqJu/rZQOzRDjmDu4w8YgECNHKS9wRxCt7kg6?=
 =?us-ascii?Q?6yVf9Owf4cI/uBY7Pw/hUqaxIuhYZ++jz0cJAwaByWc+6tZFtCp3T1AjNybE?=
 =?us-ascii?Q?k84y4BChYOh5Sd5/lO4ZVVVwwm1m4ruO0nb4XI11IifJczgahTgd1FU8tzAG?=
 =?us-ascii?Q?dx/IGOnIV6wQQnRCUVFaIzPfadwpcHQo2vvJQVuDFSDPG1XOsZd4nvp7Xus2?=
 =?us-ascii?Q?sV+LCv/4U9Ag329BC5BzZPTEkFc2YTvU76dO4JkFd63TEtAsKjVU7FBIPWPO?=
 =?us-ascii?Q?so7DQxYd3FcsTiSKnh0A6E378whsdUbcGmjkaOp+7UH+DKwWcSGAXVULVArv?=
 =?us-ascii?Q?IlI3cd4+dVJL9oI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:44:17.3900 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdfcfa80-c535-4ff9-b8ae-08dd20b0f649
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8464
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

From: Harry Wentland <harry.wentland@amd.com>

The BT.709 and BT.2020 OETFs are the same, the only difference
being that the BT.2020 variant is defined with more precision
for 10 and 12-bit per color encodings.

Both are used as encoding functions for video content, and are
therefore defined as OETF (opto-electronic transfer function)
instead of as EOTF (electro-optical transfer function).

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_colorop.c |  2 ++
 include/drm/drm_colorop.h     | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index f3391602a577..665b23900cc0 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -70,6 +70,8 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
 	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
+	[DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
 	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
 	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
 };
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 4084a7438032..83a6bd64d48a 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -55,6 +55,25 @@ enum drm_colorop_curve_1d_type {
 	 */
 	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
 
+	/**
+	 * @DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
+	 *
+	 * The inverse of &DRM_COLOROP_1D_CURVE_BT2020_OETF
+	 */
+	DRM_COLOROP_1D_CURVE_BT2020_INV_OETF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_BT2020_OETF:
+	 *
+	 * The BT.2020/BT.709 transfer function. The BT.709 and BT.2020
+	 * transfer functions are the same, the only difference is that
+	 * BT.2020 is defined with more precision for 10 and 12-bit
+	 * encodings.
+	 *
+	 *
+	 */
+	DRM_COLOROP_1D_CURVE_BT2020_OETF,
+
 	/**
 	 * @DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
 	 *
-- 
2.43.0

