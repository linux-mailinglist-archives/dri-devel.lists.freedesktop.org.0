Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEDB9F8BA3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C2E10EEFF;
	Fri, 20 Dec 2024 04:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tvrbrQIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2045.outbound.protection.outlook.com [40.107.100.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED5E10EEFD;
 Fri, 20 Dec 2024 04:48:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7SwWCDH0+fthW9zWGx0fJmo5OcIjM9J6hRCz65Qg/L9GylzwetGGVH5QJqHrWNugiba40F8QKYvxySDFhJSPddQojEnOao4zucj+RQlnA35wS+QFh37ytG3LceyEeNyDZGsDqYXjshW/kVW7zT7WelMoGkYyGamfpFCRmvqQ6fdBNKcI1/PXcU2Ip4Eg2McjKS9GwPmHZYvXcio4/QVRKaNS9EZxC3K66tIyYPLtx4D5RXWLEEGZPQfqrLUDyUWspG5IJRmI4kILgwWCyq7eh/d4/f9laGxNNsi9sSn0+QCHoq5zxD3jy6ubJd56/0SU1fB39kpuRY4n+h6rkSZnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+1YMxLEXqvHE3gUSeKIGicKtZ0XFcIZE45yGLrhDXc=;
 b=kCrfD/gSDQHasfF4Ml77/JrSvfFI63ro0e4wx13RFqtxEa5/g0h/3/B+67SbdUPbN2XJt1UOMkeBKrLAe7suU0fQcQG8mPSgnz9wpy9HTJAjtxyEmwY20tfrdmzdnvJvxeNMSSjf+/K1qBm98gZfFCZn3C2pQwEnRB9kPKz3SuVZm0/bH02o+nkPw2ZaOlu6L/d7i150G3yFXABpVTiZ+QxtKB2Tlvfx+jr13PHdSo+WPGqArEIk54jFAG0va/pIWLxmwi3N5mtvx61SCsehhyJgpNgqt7/n7bFB4BcRE/Y5pv4P15Wi469fO9e7wxr7EbP9UM/szKMozYjX3pe6BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+1YMxLEXqvHE3gUSeKIGicKtZ0XFcIZE45yGLrhDXc=;
 b=tvrbrQIKPS0z0b5c+gXXCrCYtrUq4drNMbO4MzKBrsbaI4/qgG3it+uSdmfNMbYh3JC3JO0rS9q2pTQptvgPwfFfqjCrghOHuZOuIgpNZ8Zn91WGXptLfllholeTmdtqC022cJaEm8TWw639RU49Yp3/3g2b9iQmiI2iUNvUEKM=
Received: from BYAPR04CA0007.namprd04.prod.outlook.com (2603:10b6:a03:40::20)
 by MN2PR12MB4221.namprd12.prod.outlook.com (2603:10b6:208:1d2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 04:48:03 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:40:cafe::22) by BYAPR04CA0007.outlook.office365.com
 (2603:10b6:a03:40::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.16 via Frontend Transport; Fri,
 20 Dec 2024 04:48:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:48:02 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:48:00 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 44/45] drm/colorop: Add kernel doc for data blob
Date: Thu, 19 Dec 2024 21:33:50 -0700
Message-ID: <20241220043410.416867-45-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|MN2PR12MB4221:EE_
X-MS-Office365-Filtering-Correlation-Id: ff6177ab-1280-45cb-e50f-08dd20b17c4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2uFZJ4b4T96TO+DmngKSISHRZcmVFSDR1Gy0jxLuymJpZ4h2Ea5kYL/KcHgY?=
 =?us-ascii?Q?LZlCoXkdBkUZ94M+a+6wZ+ciDl844JfNL0ER3lgmnPlr+AsNgyQt3QuRmGdJ?=
 =?us-ascii?Q?Bq7B8iyv9bn3LQvoKv+sVlq0VlAnA02yE4jiOqp5w13BMzbCVh4VEbanc2eM?=
 =?us-ascii?Q?uGV4NAfNJWGS57OCVBvScGeLs/8jmElZH+XP9gghseGMHnKZnW2/nriCR8IN?=
 =?us-ascii?Q?2QNKWtdSG7pdcnY/OULS2YoxRAfrnMeonk9OeZTdmWs46a/osIZQd9MBBZ3V?=
 =?us-ascii?Q?xwA4HdqfBK1WiS1tUpm4AeMv18FH8UunUbvDDUxw6fGYckIq3QiZHPuJXsUj?=
 =?us-ascii?Q?fLDmVv12+1AwJeuuEodSfWMSeTCLqp4FNOtSGX63aeb53cTKpURPfbn3ilPQ?=
 =?us-ascii?Q?F1Chyk2rY8lxB8c1kP9yZvejTTYmg3bKlsUnvMWUgmRsSs+c/MUYKmwwmhcu?=
 =?us-ascii?Q?AcwrZXqgtXlBL3aA9gRmMpKRYugRg7WH7AT+Cm09D6C9V5Mtm27XiMMdIrF2?=
 =?us-ascii?Q?Rxa67utKJ2mk8sLB5lvQcS6ZX+B2ix8VsYPeboAKaaM2nrQFUBfWh+CE/E0M?=
 =?us-ascii?Q?dUdnc23wM2Xrih0DPn7lQhJcgX91oxeM6hcN8AVGbGhBtAjTlcBbXpZ2L/HD?=
 =?us-ascii?Q?WR8XANDpq+6RudmzTblv4KjcLG212Olce95ADRLHWBmxkKKalMUIGyuaBInE?=
 =?us-ascii?Q?uicvtxBtHrDHjejTNlSAVNRWloALc/BN+6MChlXo8naOm2rvXJRwJ0a7rlqW?=
 =?us-ascii?Q?rkPbHntg2rdJwDFTmEFOPHUA1V1R3tjnSVVTzpVnqCI3b2+fdH9OdjBxu4AW?=
 =?us-ascii?Q?fFZowLzPcmivwARMFCnGxTzima6yqtIDn9JApY7w30oWxJGfwCnaLLUHNVP5?=
 =?us-ascii?Q?Kenoq5sN6u4Xz2/DUk+1drSoeFAjRR2ZIbTMx2bSCB6s7201UjkEqV2Qicnu?=
 =?us-ascii?Q?38y+FfSl4VPKgBLGr54FMBZvUjR/2dQmvBLPnOvnI49cPC0jCxdoy+VbU99V?=
 =?us-ascii?Q?zuiI/bDBwF1/2ss9OsAU9/eVZ7Su8Xc2lu+wG2GjcXcy6G+c2FRSTWD/GwQH?=
 =?us-ascii?Q?SyK7BwqviLgl3piPi0kIzQUX8De4kWWnBzgrMaRaCqzLu1XEpGBf0tonLOEF?=
 =?us-ascii?Q?27utRW8W3lzxH7Y3lnR0QA7WbtQYo6PoHhrPlrK17tyx43WlJll6bcD5Uc7A?=
 =?us-ascii?Q?d/Io14TQ7guI4uTr1gOv5e5via4li57XXxSoZg+F7WDCAAkyG9nBXEdlPBGw?=
 =?us-ascii?Q?sqD7UNZYsIL/oe8Ar+dE00BoxoAXA5ygTz9EuO6EFzC5S6mavkttg4N1H/TI?=
 =?us-ascii?Q?Ew68JDHOVCVqZ+LHDebA4yss05FT564jq4cVla2dUtzJAkoB12OvLji0dz+S?=
 =?us-ascii?Q?72xnB9xxFnDOJQVtIXrbM+BNnplC5vgzj6cWoVmlOrv9wb7JtygSYHIOpuQv?=
 =?us-ascii?Q?CsazMPFmBPxZ6+KRjeoXq/8d04A5Onnk7dpGmMn1JG9Y2eaxF0HFSb6aMpVB?=
 =?us-ascii?Q?FPxM/tZMlGZEPpM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:48:02.1761 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6177ab-1280-45cb-e50f-08dd20b17c4e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4221
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

Add layout of data blob for colorop types: DRM_COLOROP_1D_LUT,
DRM_COLOROP_CTM_3X4 and DRM_COLOROP_3D_LUT

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 include/drm/drm_colorop.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 7b58dcf0615a..11b474a9b10a 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -146,6 +146,24 @@ struct drm_colorop_state {
 	 *
 	 * Data blob for any TYPE that requires such a blob. The
 	 * interpretation of the blob is TYPE-specific.
+	 *
+	 * For 1D LUTs (DRM_COLOROP_1D_LUT), the blob is an array of
+	 * struct drm_color_lut with size of "lut_size".
+	 *
+	 * For 3x4 matrix (DRM_COLOROP_CTM_3X4), the blob is a float[12]:
+	 * out   matrix          in
+	 * |R|   |0  1  2  3 |   | R |
+	 * |G| = |4  5  6  7 | x | G |
+	 * |B|   |8  9  10 12|   | B |
+	 *
+	 * For 3D LUTs (DRM_COLOROP_3D_LUT), the blob is a 3D array of
+	 * struct drm_color_lut with dimension length of "lut_size".
+	 * The LUT elements are traversed like so:
+	 *   for R in range 0..n
+	 *     for G in range 0..n
+	 *       for B in range 0..n
+	 *         color = lut3d[R][G][B]
+	 *
 	 */
 	struct drm_property_blob *data;
 
-- 
2.43.0

