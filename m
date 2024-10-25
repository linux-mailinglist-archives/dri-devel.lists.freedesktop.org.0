Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3DB9AF982
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 08:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247BC10E280;
	Fri, 25 Oct 2024 06:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yMwWfwFZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC4B10E02E;
 Fri, 25 Oct 2024 06:03:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7Pjn0+KG7d+rTZjiZ3ibpC8EOo7F0z76e6SEgYeDCeXfuaIVwJhEnl5c9MdB9FakT2GvW+vsvnfagLbc/vIiSAZjEBxuwl4cGLtiZXn4AfAIG0alpsXZGPFzEP0b932YOSZSX2z+hT5gzpSa8RQj0nLUePZb7epFKiApEj96MxgpDKtDNk0qOunTp+M+ikJDqdGDC6wMxlTiY/affjfBV7hBcrP/hx+T3C2MsCExDh/IbC1wU5QBLlCvr+JrXVhioRI6cO4zWBJNtyMrAyNiV+fmfi1flyVW0t2jzLStuloYlA9UjhTyHXM/36RgNcfPp4SBMOTkhAoQoKYkmz8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yV4il6dBJmy//qO1D7F+pqadvUz47n2kOsN04jFXddU=;
 b=BrA3NhgYWfvMoj/GVXheZQkvth8oA1QZfxUN+0uAfgvFwcN3hTAUdBHauxX+NGs6f5uyP0ER88ymQL5POp9kdrLCDO6PSF1bkDOxH8MRxdbbnKXxsbIF1JlzWGkXm/29W2U0/PvugxkD+WwveAXlpSHHBAt34Ji1uZGxLCOinFYnvd7uNnq3zrAj74txcxyqVad7fgN94Yq7WgxiGkai3pO0p0WfZ1YwgwgzJQ+9lt5Koa+DioqBnbC1IL2qLtRWUWgF8Q87AOmVZvb+zu4m8ThLb0ZG7ZukmpnUTsaGbMwn59xJCpi5H9Uf5XS+IjWh0qx7ZYtt65MkIx98MG94DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yV4il6dBJmy//qO1D7F+pqadvUz47n2kOsN04jFXddU=;
 b=yMwWfwFZlI5C9VpIi1YarlTqW5HR0Ka1sNOoyvpkG3R1k60uF9dU8RxJiK1FuMW6ssthm5lfIZRmgzxy5MYd5WzGHccu3q3R8nR5BtHRwcts8jNvtkOdGCHU2TjhTnhUMWUbI2xsv/NLSSyoLJbztkPy2LFH2urfaCUJh2Vvgwk=
Received: from PH1PEPF000132ED.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::32)
 by DS0PR12MB7679.namprd12.prod.outlook.com (2603:10b6:8:134::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 06:03:38 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2a01:111:f403:c936::) by PH1PEPF000132ED.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20 via Frontend
 Transport; Fri, 25 Oct 2024 06:03:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 06:03:37 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 01:03:36 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 01:03:35 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Oct 2024 01:03:32 -0500
From: Qiang Yu <Qiang.Yu@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>, Qiang Yu
 <yuq825@gmail.com>, Qiang Yu <qiang.yu@amd.com>
Subject: [PATCH] drm/fourcc: add AMD_FMT_MOD_TILE_GFX9_4K_D_X
Date: Fri, 25 Oct 2024 06:02:44 +0000
Message-ID: <20241025060244.535406-1-Qiang.Yu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|DS0PR12MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: 0656b915-ff4e-48f2-9df9-08dcf4bac43f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z9NsqryTRJwXp2Yq8urAD3irVMAi/FrVkLAOZpUVCTSlhHEBbMcb+icVgxYp?=
 =?us-ascii?Q?7sk37gzYtL/zVxgNqw5JAHf/mXpHShqycjvCm3+XWeVT20MATUuxR5oDY/x4?=
 =?us-ascii?Q?1aR/EDsveI4BL7bjx++uoABjaZnvmgr6eKWtQy9EmtT7UK2e+ijlEt+zZD8R?=
 =?us-ascii?Q?31TH7fV7Ha1gW2GXEaUF7VfKaJ2gyZrvqVPEVnK6VW3Bct7rMf692l1twFZX?=
 =?us-ascii?Q?xGrGOuMOlE/6licVnx8Wh7liu3mYbGsswtGxXeu8wTdcFG8wpHwHbRPrE0oZ?=
 =?us-ascii?Q?Q9RtJC0s6zNwlTU20qyhiI4kq4CCB4Kl0zRNiDZN7C/oIme8TzXITSxj/p6T?=
 =?us-ascii?Q?zJ+1v4jB1HMK4JLatbdXC1dRtCR1yo+PT5UPShNxvPmG8kOsLtYNtyh2leOG?=
 =?us-ascii?Q?L/cGqnJ4f6P4p/mvbTCwqu6ITzi3FFKoau7+d8L8PNksxrAD2oyj8wd3EYf+?=
 =?us-ascii?Q?6b3J5D4TxcA/QHFl5OyZVFKq1WywdOoaBLgxEFG5X4ItoPbR+X+nWLc8brza?=
 =?us-ascii?Q?4c0sCXkzJqVYEVtv8u1KiCTql8MBMPeD8IBreW3y66I7sjTUGr+3xSJWk5lj?=
 =?us-ascii?Q?rPtVowByXvehTV0U52h2NScXVyi17adQIDJtInRcCVAE6qhU3GXJw0GKwj+/?=
 =?us-ascii?Q?KenFLYhf1ZwBFU/4FqVSegJA+3bjAPGTWyNqJ3vPKyidJ43UGjWcJhMoxSKX?=
 =?us-ascii?Q?MI7CqDEGXKQsvXKdkT38LRvbG9Bu/LxToi2OnZXu4NpMtAAGqCm6LpiWGnZp?=
 =?us-ascii?Q?nBn77rN2PvJJA482p+P3gC9oB+vRxlY2ok1ghl5Y6UmKWIcDnSyiKntae+w1?=
 =?us-ascii?Q?LodN8htpAdZ2wD1wHTvYaBHcX+jTnv76QUR61ZPitmbi6DiUTjftX9wwuVoB?=
 =?us-ascii?Q?pnc0iNV8Gl/NSaUkATxsk4tVxY+XwJt8rZiUxLsmk0mMnmSJawFbRyJDGGj6?=
 =?us-ascii?Q?amSzgBLibmpHsJUOXvU18taCYy/DUMteYHsHrdgYTAaiYN1P6UCP1piwgdgm?=
 =?us-ascii?Q?t8hMIPS+8INmZP5tdP+mZPQRzKyDRwT7EdHkumzNLhSV9lHp2BXMw/siQxtn?=
 =?us-ascii?Q?Dd3Gh67qjKu6/96wUlq7VhyhV8us6kQNrsDkjgwfpUSjG44x4AaNPnjsPXSK?=
 =?us-ascii?Q?r8d4Z+9K+L83eftsfJ2WdnG9fMN05Sw43FoXz9Xqnm0m/7w4KXWYzm/gS5z0?=
 =?us-ascii?Q?pNkUPvZL6WhHLMn86scDJbEdOj7r1YnROjduAPV0lhbqMbenPI4kx3mTCnwN?=
 =?us-ascii?Q?YCDRd0T6IS7IX76BbFvZfD8XJeG2+pAb2vUq1wNQ73kHZ/e7qZOwWA5k8KUZ?=
 =?us-ascii?Q?rORmnO8lY80ZtxT2LPZog1KUa74tsTGURW2WEbUMEtw9vzoxGGmJ3JrEd8eH?=
 =?us-ascii?Q?l6YrHCo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 06:03:37.1490 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0656b915-ff4e-48f2-9df9-08dcf4bac43f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7679
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

From: Qiang Yu <qiang.yu@amd.com>

This is used when radeonsi export small texture's modifier
to user with eglExportDMABUFImageQueryMESA().

mesa changes is available here:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31658

Signed-off-by: Qiang Yu <qiang.yu@amd.com>
---
 include/uapi/drm/drm_fourcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 78abd819fd62..70f3b00b0681 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -1516,6 +1516,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
  * 64K_D_2D on GFX12 is identical to 64K_D on GFX11.
  */
 #define AMD_FMT_MOD_TILE_GFX9_64K_D 10
+#define AMD_FMT_MOD_TILE_GFX9_4K_D_X 22
 #define AMD_FMT_MOD_TILE_GFX9_64K_S_X 25
 #define AMD_FMT_MOD_TILE_GFX9_64K_D_X 26
 #define AMD_FMT_MOD_TILE_GFX9_64K_R_X 27
-- 
2.43.0

