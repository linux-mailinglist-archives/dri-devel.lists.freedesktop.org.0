Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE90B40B2D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 18:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561E610E7F3;
	Tue,  2 Sep 2025 16:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ySJ9LzEB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A543310E7F3;
 Tue,  2 Sep 2025 16:53:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=coug97zXarA2krWzJU6orBBbmkIQ3fInfFg8tqYO29SYh8c3xEHampgf0gGTJ9rWZLVQIHdAO++n56NDYdYMHT08SMUEs3mFKAuhysGqPrB+sMC+6D9hbUm3oi4tH5eZWCKDQSvxDAgXrhh9T91LYP91yXxkILZMLD5GkahGGHhPpTJNF6ElelAkXfVfJeztgAAhJwAkZu+lGwt4FZkTVZpvi3jOu5ci8klJYe/d8+pNQa/UC/ALCYnMqXfg35mtiXi+0jJKkse16I0xqMaBhnZhX7/aj173o+J0NRt4dGSPAyme/+G+77eN9sMHU7rlCgUP09UDjYJZaAUqtMqFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmN8r6+iD3zEe0goA+i2EPVVtWPff2XjappKAkBIg94=;
 b=BZgI+/kA6GpDpW5eebP5NA8V2h8bEP0c1E+sOnIVcsgSqs9rO/JGPrkQi/OcRLhA+4xus+eetpbcGEGzLT6SdcGuqEpxqLCQWt/BOBUzf022wLwUzXnb2zLRIl5sm2v8ChDct2uKyelopNQfyZdsH7dAX2Hn3r2PtnfSTdaJbuXEb3TtN2yrwUOnHaaVLdQMSZykf1tJR9Q+Q8gxbUDMYSBLtFdUqH4Sw/vDifeq2TcrLB2E30zzA2s6sg6ATB+0j/MNyt2/Jof11IPIxYHuRHsArz/iQLB+0xSFCUOKYC0Z62HzwiWfKUEGhl1y5GaIKap7zFAt+DTSiHU3vWYZcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmN8r6+iD3zEe0goA+i2EPVVtWPff2XjappKAkBIg94=;
 b=ySJ9LzEB/zbzdiyAMD+KB/Z5mSxvLgN6Gn0T3Z7rwODjUd/mrOjVX2Tw+hM9XkzVwx+PwazP+7+QW+450a3f1AMQyrkAkNUcNVFzVYO1u4E98eazkJM+Y/0BBxIMLnnXRUikRh5eICqEdu9kcr//SxTV4RF2fz9Io/o1mXAuOf0=
Received: from BL1P221CA0033.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::14)
 by DS5PPF1ADAD2878.namprd12.prod.outlook.com (2603:10b6:f:fc00::646)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Tue, 2 Sep
 2025 16:53:49 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:5b5:cafe::3a) by BL1P221CA0033.outlook.office365.com
 (2603:10b6:208:5b5::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Tue,
 2 Sep 2025 16:53:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 16:53:49 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 11:53:47 -0500
Received: from tr4.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 2 Sep
 2025 09:53:46 -0700
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>, "Borislav Petkov (AMD)"
 <bp@alien8.de>
Subject: [PATCH] drm/radeon: use dev_warn_once() in CS parsers
Date: Tue, 2 Sep 2025 12:53:32 -0400
Message-ID: <20250902165332.2388864-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|DS5PPF1ADAD2878:EE_
X-MS-Office365-Filtering-Correlation-Id: c3f33524-7ecc-455c-bf19-08ddea414a1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7PTnTy+a4vHpCwj65GPBptE0Nxnj/BZPHhIPbxAA6EtbH2dtKIW885cNaWE/?=
 =?us-ascii?Q?T0mUHQHVJLCqs8rRwPZtrY9IY5x9s1LXHYPfkgBD8xg1LWZNPSibcAU3uWOg?=
 =?us-ascii?Q?C8HtyDXfn9jemJrlkHtr1kr7oVPzgCkfvUb11StS4/9CLnZPFj8F8thvue/0?=
 =?us-ascii?Q?snj9Z6JQfjoTE5MZRUeTJTVaheD+tpNG/DZ3oF+h7EP2EivnIGt9eDKZ17aV?=
 =?us-ascii?Q?zBn0faO2bWnCtdEM3xQE44U6MJOtTL9bbRMLAlPcvPquISzKAk2ldUNvn0k9?=
 =?us-ascii?Q?cxAf712nZWemaer5MheeEP6KjOQcsNjtreRUtCEV3FYSp+5i+HBSAg/CMIx9?=
 =?us-ascii?Q?9WLY0Vcv7GQYe2TwcHGteI4vkUHAVBWg2qqR/0vw/i2L0hr+j+R5bQzp3a9L?=
 =?us-ascii?Q?slq9Qxs2BUbzE5SwwY9JqyaM1NEEFI/JmJGHDk/BX88gkn18rLCkdb3vIwDC?=
 =?us-ascii?Q?H0TQliM5UOSn7KMFLxZ+6XeB31PzqP3Ab48+hqHeScgsDcI8ezyyBuKrhunm?=
 =?us-ascii?Q?3vprUhIzzSpjNvFz7V0X6ImUGYPjCT4S/ELmyVORSxgnFOYaBNaEkkrdfSUV?=
 =?us-ascii?Q?6KyiVQCZB45fozlUDI1wr/+ZOUVwiJhA2zDiR1wTGzosRzxr26N6GwuvfLNQ?=
 =?us-ascii?Q?GjqCXD6b08kofiBeq20y0ZndaVwj9eG3+0JAcgSsJw6tpQsmHJqKPv8+nRde?=
 =?us-ascii?Q?+VoGpNzPNkx2GJotubq5pusFHOmxAuPoPKGdC8gcECAlLfd43sD3bRujj5ej?=
 =?us-ascii?Q?9P0S0G6ynV1zpsxr0xZoo+cQHn6ZL+7V+/loaoVov05uBnw0XBs5G5ukgirq?=
 =?us-ascii?Q?z8noFP/2DZc85D7YQWbKGC7p67ugYHH4cDqJgo0GHOIgL8ZWv2Ob+Zi2nwHZ?=
 =?us-ascii?Q?XbHVBW9VTZUaQuMrK62+fw1moCvZo2Y0HDugRA22T9ZvBPwOW2E6ypmJMA33?=
 =?us-ascii?Q?Ser/24Cw3p2SrF3EPTTQNroijQBOQNUAGJqYmYpsKsg9mOJSjo6Kz4+MROjW?=
 =?us-ascii?Q?bh9hWAZy0fCUnrjRojQLSXeFxzL2wLj3eFmzB6J9bbcSKedVPLkKdwjQsX5K?=
 =?us-ascii?Q?CQFEhpHSr2QkWM/R8WRPiya1OyvgLSB56pma0yXN/BD32O/vtMOwCSTAJisv?=
 =?us-ascii?Q?tP3bTS/hion4e0NuXVx4pP7f8zw22HX2kvqYF3mku2Nh5969ypbCtQZz4fNj?=
 =?us-ascii?Q?G2gigL68j0NQpGIVbbbVdOY4REcVbVrE63ZOucrt6bgywHOPzgKI7wSOINvk?=
 =?us-ascii?Q?SUaWEqUp4zAB4TZ/Fm0LvDvZgdQYSNdusxAtpBRfZtTumP77z4GaYfUR/d9f?=
 =?us-ascii?Q?PHCtwq7OIc/cwVAD8YNPHDNq41YKOXQc7UsY4vJoi1HrZpkh02GQYhCbQ3sB?=
 =?us-ascii?Q?AerB3VlkGdAvkDjEsKI1s0AZgLMBWN3F0J5aqkvKD06kAPrKiLWDn31ILbxP?=
 =?us-ascii?Q?SniGKZq8w/42Qn0D6QA0UqUyOC6Yqd7/kwTDob1uw9ctTVgTi3Yv1w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 16:53:49.3253 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f33524-7ecc-455c-bf19-08ddea414a1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF1ADAD2878
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

Older GPUs did not support memory protection, so the kernel
driver would validate the command submissions (CS) from userspace
to avoid the GPU accessing any memory it shouldn't.

Change any error messages in that validatio to dev_warn_once() to
avoid spamming the kernel log in the event of a bad CS.  If users
see any of these messages they should report them to the user space
component, which in most cases is mesa
(https://gitlab.freedesktop.org/mesa/mesa/-/issues).

Cc: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://lore.kernel.org/r/20250829171655.GBaLHgh3VOvuM1UfJg@fat_crate.local
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/radeon/evergreen_cs.c | 520 +++++++++++++-------------
 drivers/gpu/drm/radeon/r100.c         | 215 +++++------
 drivers/gpu/drm/radeon/r200.c         |  34 +-
 drivers/gpu/drm/radeon/r300.c         |  66 ++--
 drivers/gpu/drm/radeon/r600_cs.c      | 445 +++++++++++-----------
 drivers/gpu/drm/radeon/radeon_cs.c    |   2 +-
 6 files changed, 648 insertions(+), 634 deletions(-)

diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c b/drivers/gpu/drm/radeon/evergreen_cs.c
index 266c577331369..d49e59626e392 100644
--- a/drivers/gpu/drm/radeon/evergreen_cs.c
+++ b/drivers/gpu/drm/radeon/evergreen_cs.c
@@ -951,13 +951,13 @@ static int evergreen_cs_track_check(struct radeon_cs_parser *p)
 					u64 offset = (u64)track->vgt_strmout_bo_offset[i] +
 							(u64)track->vgt_strmout_size[i];
 					if (offset > radeon_bo_size(track->vgt_strmout_bo[i])) {
-						DRM_ERROR("streamout %d bo too small: 0x%llx, 0x%lx\n",
-							  i, offset,
-							  radeon_bo_size(track->vgt_strmout_bo[i]));
+						dev_warn_once(p->dev, "streamout %d bo too small: 0x%llx, 0x%lx\n",
+							      i, offset,
+							      radeon_bo_size(track->vgt_strmout_bo[i]));
 						return -EINVAL;
 					}
 				} else {
-					dev_warn(p->dev, "No buffer for streamout %d\n", i);
+					dev_warn_once(p->dev, "No buffer for streamout %d\n", i);
 					return -EINVAL;
 				}
 			}
@@ -979,8 +979,8 @@ static int evergreen_cs_track_check(struct radeon_cs_parser *p)
 			    (tmp >> (i * 4)) & 0xF) {
 				/* at least one component is enabled */
 				if (track->cb_color_bo[i] == NULL) {
-					dev_warn(p->dev, "%s:%d mask 0x%08X | 0x%08X no cb for %d\n",
-						__func__, __LINE__, track->cb_target_mask, track->cb_shader_mask, i);
+					dev_warn_once(p->dev, "%s:%d mask 0x%08X | 0x%08X no cb for %d\n",
+						      __func__, __LINE__, track->cb_target_mask, track->cb_shader_mask, i);
 					return -EINVAL;
 				}
 				/* check cb */
@@ -1056,8 +1056,8 @@ static int evergreen_packet0_check(struct radeon_cs_parser *p,
 	case EVERGREEN_VLINE_START_END:
 		r = evergreen_cs_packet_parse_vline(p);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-					idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			return r;
 		}
 		break;
@@ -1143,8 +1143,8 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case SQ_VSTMP_RING_BASE:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		ib[idx] += (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
@@ -1155,15 +1155,15 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 		break;
 	case CAYMAN_DB_EQAA:
 		if (p->rdev->family < CHIP_CAYMAN) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-				 "0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		break;
 	case CAYMAN_DB_DEPTH_INFO:
 		if (p->rdev->family < CHIP_CAYMAN) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-				 "0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		break;
@@ -1172,8 +1172,8 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 		if (!(p->cs_flags & RADEON_CS_KEEP_TILING_FLAGS)) {
 			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 			if (r) {
-				dev_warn(p->dev, "bad SET_CONTEXT_REG "
-						"0x%04X\n", reg);
+				dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+					      "0x%04X\n", reg);
 				return -EINVAL;
 			}
 			ib[idx] &= ~Z_ARRAY_MODE(0xf);
@@ -1214,8 +1214,8 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case DB_Z_READ_BASE:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		track->db_z_read_offset = radeon_get_ib_value(p, idx);
@@ -1226,8 +1226,8 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case DB_Z_WRITE_BASE:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		track->db_z_write_offset = radeon_get_ib_value(p, idx);
@@ -1238,8 +1238,8 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case DB_STENCIL_READ_BASE:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		track->db_s_read_offset = radeon_get_ib_value(p, idx);
@@ -1250,8 +1250,8 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case DB_STENCIL_WRITE_BASE:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		track->db_s_write_offset = radeon_get_ib_value(p, idx);
@@ -1273,8 +1273,8 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case VGT_STRMOUT_BUFFER_BASE_3:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		tmp = (reg - VGT_STRMOUT_BUFFER_BASE_0) / 16;
@@ -1295,8 +1295,8 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case CP_COHER_BASE:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			dev_warn(p->dev, "missing reloc for CP_COHER_BASE "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "missing reloc for CP_COHER_BASE "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		ib[idx] += (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
@@ -1311,8 +1311,8 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 		break;
 	case PA_SC_AA_CONFIG:
 		if (p->rdev->family >= CHIP_CAYMAN) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-				 "0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		tmp = radeon_get_ib_value(p, idx) & MSAA_NUM_SAMPLES_MASK;
@@ -1320,8 +1320,8 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 		break;
 	case CAYMAN_PA_SC_AA_CONFIG:
 		if (p->rdev->family < CHIP_CAYMAN) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-				 "0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		tmp = radeon_get_ib_value(p, idx) & CAYMAN_MSAA_NUM_SAMPLES_MASK;
@@ -1360,8 +1360,8 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 		if (!(p->cs_flags & RADEON_CS_KEEP_TILING_FLAGS)) {
 			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 			if (r) {
-				dev_warn(p->dev, "bad SET_CONTEXT_REG "
-						"0x%04X\n", reg);
+				dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+					      "0x%04X\n", reg);
 				return -EINVAL;
 			}
 			ib[idx] |= CB_ARRAY_MODE(evergreen_cs_get_aray_mode(reloc->tiling_flags));
@@ -1378,8 +1378,8 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 		if (!(p->cs_flags & RADEON_CS_KEEP_TILING_FLAGS)) {
 			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 			if (r) {
-				dev_warn(p->dev, "bad SET_CONTEXT_REG "
-						"0x%04X\n", reg);
+				dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+					      "0x%04X\n", reg);
 				return -EINVAL;
 			}
 			ib[idx] |= CB_ARRAY_MODE(evergreen_cs_get_aray_mode(reloc->tiling_flags));
@@ -1439,8 +1439,8 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case CB_COLOR7_ATTRIB:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		if (!(p->cs_flags & RADEON_CS_KEEP_TILING_FLAGS)) {
@@ -1467,8 +1467,8 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case CB_COLOR11_ATTRIB:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		if (!(p->cs_flags & RADEON_CS_KEEP_TILING_FLAGS)) {
@@ -1555,8 +1555,8 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case CB_COLOR7_BASE:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		tmp = (reg - CB_COLOR0_BASE) / 0x3c;
@@ -1571,8 +1571,8 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case CB_COLOR11_BASE:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		tmp = ((reg - CB_COLOR8_BASE) / 0x1c) + 8;
@@ -1584,8 +1584,8 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case DB_HTILE_DATA_BASE:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		track->htile_offset = radeon_get_ib_value(p, idx);
@@ -1702,36 +1702,36 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case SQ_ALU_CONST_CACHE_LS_15:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		ib[idx] += (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
 		break;
 	case SX_MEMORY_EXPORT_BASE:
 		if (p->rdev->family >= CHIP_CAYMAN) {
-			dev_warn(p->dev, "bad SET_CONFIG_REG "
-				 "0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONFIG_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONFIG_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONFIG_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		ib[idx] += (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
 		break;
 	case CAYMAN_SX_SCATTER_EXPORT_BASE:
 		if (p->rdev->family < CHIP_CAYMAN) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-				 "0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		ib[idx] += (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
@@ -1740,7 +1740,7 @@ static int evergreen_cs_handle_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 		track->sx_misc_kill_all_prims = (radeon_get_ib_value(p, idx) & 0x1) != 0;
 		break;
 	default:
-		dev_warn(p->dev, "forbidden register 0x%08x at %d\n", reg, idx);
+		dev_warn_once(p->dev, "forbidden register 0x%08x at %d\n", reg, idx);
 		return -EINVAL;
 	}
 	return 0;
@@ -1795,7 +1795,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		uint64_t offset;
 
 		if (pkt->count != 1) {
-			DRM_ERROR("bad SET PREDICATION\n");
+			dev_warn_once(p->dev, "bad SET PREDICATION\n");
 			return -EINVAL;
 		}
 
@@ -1807,13 +1807,13 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 			return 0;
 
 		if (pred_op > 2) {
-			DRM_ERROR("bad SET PREDICATION operation %d\n", pred_op);
+			dev_warn_once(p->dev, "bad SET PREDICATION operation %d\n", pred_op);
 			return -EINVAL;
 		}
 
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("bad SET PREDICATION\n");
+			dev_warn_once(p->dev, "bad SET PREDICATION\n");
 			return -EINVAL;
 		}
 
@@ -1827,7 +1827,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 	break;
 	case PACKET3_CONTEXT_CONTROL:
 		if (pkt->count != 1) {
-			DRM_ERROR("bad CONTEXT_CONTROL\n");
+			dev_warn_once(p->dev, "bad CONTEXT_CONTROL\n");
 			return -EINVAL;
 		}
 		break;
@@ -1835,17 +1835,17 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 	case PACKET3_NUM_INSTANCES:
 	case PACKET3_CLEAR_STATE:
 		if (pkt->count) {
-			DRM_ERROR("bad INDEX_TYPE/NUM_INSTANCES/CLEAR_STATE\n");
+			dev_warn_once(p->dev, "bad INDEX_TYPE/NUM_INSTANCES/CLEAR_STATE\n");
 			return -EINVAL;
 		}
 		break;
 	case CAYMAN_PACKET3_DEALLOC_STATE:
 		if (p->rdev->family < CHIP_CAYMAN) {
-			DRM_ERROR("bad PACKET3_DEALLOC_STATE\n");
+			dev_warn_once(p->dev, "bad PACKET3_DEALLOC_STATE\n");
 			return -EINVAL;
 		}
 		if (pkt->count) {
-			DRM_ERROR("bad INDEX_TYPE/NUM_INSTANCES/CLEAR_STATE\n");
+			dev_warn_once(p->dev, "bad INDEX_TYPE/NUM_INSTANCES/CLEAR_STATE\n");
 			return -EINVAL;
 		}
 		break;
@@ -1854,12 +1854,12 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		uint64_t offset;
 
 		if (pkt->count != 1) {
-			DRM_ERROR("bad INDEX_BASE\n");
+			dev_warn_once(p->dev, "bad INDEX_BASE\n");
 			return -EINVAL;
 		}
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("bad INDEX_BASE\n");
+			dev_warn_once(p->dev, "bad INDEX_BASE\n");
 			return -EINVAL;
 		}
 
@@ -1872,7 +1872,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 
 		r = evergreen_cs_track_check(p);
 		if (r) {
-			dev_warn(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
+			dev_warn_once(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
 			return r;
 		}
 		break;
@@ -1880,7 +1880,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 	case PACKET3_INDEX_BUFFER_SIZE:
 	{
 		if (pkt->count != 0) {
-			DRM_ERROR("bad INDEX_BUFFER_SIZE\n");
+			dev_warn_once(p->dev, "bad INDEX_BUFFER_SIZE\n");
 			return -EINVAL;
 		}
 		break;
@@ -1889,12 +1889,12 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 	{
 		uint64_t offset;
 		if (pkt->count != 3) {
-			DRM_ERROR("bad DRAW_INDEX\n");
+			dev_warn_once(p->dev, "bad DRAW_INDEX\n");
 			return -EINVAL;
 		}
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("bad DRAW_INDEX\n");
+			dev_warn_once(p->dev, "bad DRAW_INDEX\n");
 			return -EINVAL;
 		}
 
@@ -1907,7 +1907,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 
 		r = evergreen_cs_track_check(p);
 		if (r) {
-			dev_warn(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
+			dev_warn_once(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
 			return r;
 		}
 		break;
@@ -1917,12 +1917,12 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		uint64_t offset;
 
 		if (pkt->count != 4) {
-			DRM_ERROR("bad DRAW_INDEX_2\n");
+			dev_warn_once(p->dev, "bad DRAW_INDEX_2\n");
 			return -EINVAL;
 		}
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("bad DRAW_INDEX_2\n");
+			dev_warn_once(p->dev, "bad DRAW_INDEX_2\n");
 			return -EINVAL;
 		}
 
@@ -1935,63 +1935,63 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 
 		r = evergreen_cs_track_check(p);
 		if (r) {
-			dev_warn(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
+			dev_warn_once(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
 			return r;
 		}
 		break;
 	}
 	case PACKET3_DRAW_INDEX_AUTO:
 		if (pkt->count != 1) {
-			DRM_ERROR("bad DRAW_INDEX_AUTO\n");
+			dev_warn_once(p->dev, "bad DRAW_INDEX_AUTO\n");
 			return -EINVAL;
 		}
 		r = evergreen_cs_track_check(p);
 		if (r) {
-			dev_warn(p->dev, "%s:%d invalid cmd stream %d\n", __func__, __LINE__, idx);
+			dev_warn_once(p->dev, "%s:%d invalid cmd stream %d\n", __func__, __LINE__, idx);
 			return r;
 		}
 		break;
 	case PACKET3_DRAW_INDEX_MULTI_AUTO:
 		if (pkt->count != 2) {
-			DRM_ERROR("bad DRAW_INDEX_MULTI_AUTO\n");
+			dev_warn_once(p->dev, "bad DRAW_INDEX_MULTI_AUTO\n");
 			return -EINVAL;
 		}
 		r = evergreen_cs_track_check(p);
 		if (r) {
-			dev_warn(p->dev, "%s:%d invalid cmd stream %d\n", __func__, __LINE__, idx);
+			dev_warn_once(p->dev, "%s:%d invalid cmd stream %d\n", __func__, __LINE__, idx);
 			return r;
 		}
 		break;
 	case PACKET3_DRAW_INDEX_IMMD:
 		if (pkt->count < 2) {
-			DRM_ERROR("bad DRAW_INDEX_IMMD\n");
+			dev_warn_once(p->dev, "bad DRAW_INDEX_IMMD\n");
 			return -EINVAL;
 		}
 		r = evergreen_cs_track_check(p);
 		if (r) {
-			dev_warn(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
+			dev_warn_once(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
 			return r;
 		}
 		break;
 	case PACKET3_DRAW_INDEX_OFFSET:
 		if (pkt->count != 2) {
-			DRM_ERROR("bad DRAW_INDEX_OFFSET\n");
+			dev_warn_once(p->dev, "bad DRAW_INDEX_OFFSET\n");
 			return -EINVAL;
 		}
 		r = evergreen_cs_track_check(p);
 		if (r) {
-			dev_warn(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
+			dev_warn_once(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
 			return r;
 		}
 		break;
 	case PACKET3_DRAW_INDEX_OFFSET_2:
 		if (pkt->count != 3) {
-			DRM_ERROR("bad DRAW_INDEX_OFFSET_2\n");
+			dev_warn_once(p->dev, "bad DRAW_INDEX_OFFSET_2\n");
 			return -EINVAL;
 		}
 		r = evergreen_cs_track_check(p);
 		if (r) {
-			dev_warn(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
+			dev_warn_once(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
 			return r;
 		}
 		break;
@@ -2005,19 +2005,19 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		   4 ADDRESS_HI Bits [31:8] - Reserved. Bits [7:0] - Upper bits of Address [47:32]
 		*/
 		if (pkt->count != 2) {
-			DRM_ERROR("bad SET_BASE\n");
+			dev_warn_once(p->dev, "bad SET_BASE\n");
 			return -EINVAL;
 		}
 
 		/* currently only supporting setting indirect draw buffer base address */
 		if (idx_value != 1) {
-			DRM_ERROR("bad SET_BASE\n");
+			dev_warn_once(p->dev, "bad SET_BASE\n");
 			return -EINVAL;
 		}
 
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("bad SET_BASE\n");
+			dev_warn_once(p->dev, "bad SET_BASE\n");
 			return -EINVAL;
 		}
 
@@ -2039,54 +2039,54 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		   3 DRAW_INITIATOR Draw Initiator Register. Written to the VGT_DRAW_INITIATOR register for the assigned context
 		*/
 		if (pkt->count != 1) {
-			DRM_ERROR("bad DRAW_INDIRECT\n");
+			dev_warn_once(p->dev, "bad DRAW_INDIRECT\n");
 			return -EINVAL;
 		}
 
 		if (idx_value + size > track->indirect_draw_buffer_size) {
-			dev_warn(p->dev, "DRAW_INDIRECT buffer too small %u + %llu > %lu\n",
-				idx_value, size, track->indirect_draw_buffer_size);
+			dev_warn_once(p->dev, "DRAW_INDIRECT buffer too small %u + %llu > %lu\n",
+				      idx_value, size, track->indirect_draw_buffer_size);
 			return -EINVAL;
 		}
 
 		r = evergreen_cs_track_check(p);
 		if (r) {
-			dev_warn(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
+			dev_warn_once(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
 			return r;
 		}
 		break;
 	}
 	case PACKET3_DISPATCH_DIRECT:
 		if (pkt->count != 3) {
-			DRM_ERROR("bad DISPATCH_DIRECT\n");
+			dev_warn_once(p->dev, "bad DISPATCH_DIRECT\n");
 			return -EINVAL;
 		}
 		r = evergreen_cs_track_check(p);
 		if (r) {
-			dev_warn(p->dev, "%s:%d invalid cmd stream %d\n", __func__, __LINE__, idx);
+			dev_warn_once(p->dev, "%s:%d invalid cmd stream %d\n", __func__, __LINE__, idx);
 			return r;
 		}
 		break;
 	case PACKET3_DISPATCH_INDIRECT:
 		if (pkt->count != 1) {
-			DRM_ERROR("bad DISPATCH_INDIRECT\n");
+			dev_warn_once(p->dev, "bad DISPATCH_INDIRECT\n");
 			return -EINVAL;
 		}
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("bad DISPATCH_INDIRECT\n");
+			dev_warn_once(p->dev, "bad DISPATCH_INDIRECT\n");
 			return -EINVAL;
 		}
 		ib[idx+0] = idx_value + (u32)(reloc->gpu_offset & 0xffffffff);
 		r = evergreen_cs_track_check(p);
 		if (r) {
-			dev_warn(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
+			dev_warn_once(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
 			return r;
 		}
 		break;
 	case PACKET3_WAIT_REG_MEM:
 		if (pkt->count != 5) {
-			DRM_ERROR("bad WAIT_REG_MEM\n");
+			dev_warn_once(p->dev, "bad WAIT_REG_MEM\n");
 			return -EINVAL;
 		}
 		/* bit 4 is reg (0) or mem (1) */
@@ -2095,7 +2095,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 
 			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 			if (r) {
-				DRM_ERROR("bad WAIT_REG_MEM\n");
+				dev_warn_once(p->dev, "bad WAIT_REG_MEM\n");
 				return -EINVAL;
 			}
 
@@ -2106,7 +2106,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 			ib[idx+1] = (ib[idx+1] & 0x3) | (offset & 0xfffffffc);
 			ib[idx+2] = upper_32_bits(offset) & 0xff;
 		} else if (idx_value & 0x100) {
-			DRM_ERROR("cannot use PFP on REG wait\n");
+			dev_warn_once(p->dev, "cannot use PFP on REG wait\n");
 			return -EINVAL;
 		}
 		break;
@@ -2115,7 +2115,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		u32 command, size, info;
 		u64 offset, tmp;
 		if (pkt->count != 4) {
-			DRM_ERROR("bad CP DMA\n");
+			dev_warn_once(p->dev, "bad CP DMA\n");
 			return -EINVAL;
 		}
 		command = radeon_get_ib_value(p, idx+4);
@@ -2129,7 +2129,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		     (command & PACKET3_CP_DMA_CMD_SAS))) { /* src = register */
 			/* non mem to mem copies requires dw aligned count */
 			if (size % 4) {
-				DRM_ERROR("CP DMA command requires dw count alignment\n");
+				dev_warn_once(p->dev, "CP DMA command requires dw count alignment\n");
 				return -EINVAL;
 			}
 		}
@@ -2137,19 +2137,19 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 			/* src address space is register */
 			/* GDS is ok */
 			if (((info & 0x60000000) >> 29) != 1) {
-				DRM_ERROR("CP DMA SAS not supported\n");
+				dev_warn_once(p->dev, "CP DMA SAS not supported\n");
 				return -EINVAL;
 			}
 		} else {
 			if (command & PACKET3_CP_DMA_CMD_SAIC) {
-				DRM_ERROR("CP DMA SAIC only supported for registers\n");
+				dev_warn_once(p->dev, "CP DMA SAIC only supported for registers\n");
 				return -EINVAL;
 			}
 			/* src address space is memory */
 			if (((info & 0x60000000) >> 29) == 0) {
 				r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 				if (r) {
-					DRM_ERROR("bad CP DMA SRC\n");
+					dev_warn_once(p->dev, "bad CP DMA SRC\n");
 					return -EINVAL;
 				}
 
@@ -2159,15 +2159,15 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 				offset = reloc->gpu_offset + tmp;
 
 				if ((tmp + size) > radeon_bo_size(reloc->robj)) {
-					dev_warn(p->dev, "CP DMA src buffer too small (%llu %lu)\n",
-						 tmp + size, radeon_bo_size(reloc->robj));
+					dev_warn_once(p->dev, "CP DMA src buffer too small (%llu %lu)\n",
+						      tmp + size, radeon_bo_size(reloc->robj));
 					return -EINVAL;
 				}
 
 				ib[idx] = offset;
 				ib[idx+1] = (ib[idx+1] & 0xffffff00) | (upper_32_bits(offset) & 0xff);
 			} else if (((info & 0x60000000) >> 29) != 2) {
-				DRM_ERROR("bad CP DMA SRC_SEL\n");
+				dev_warn_once(p->dev, "bad CP DMA SRC_SEL\n");
 				return -EINVAL;
 			}
 		}
@@ -2175,19 +2175,19 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 			/* dst address space is register */
 			/* GDS is ok */
 			if (((info & 0x00300000) >> 20) != 1) {
-				DRM_ERROR("CP DMA DAS not supported\n");
+				dev_warn_once(p->dev, "CP DMA DAS not supported\n");
 				return -EINVAL;
 			}
 		} else {
 			/* dst address space is memory */
 			if (command & PACKET3_CP_DMA_CMD_DAIC) {
-				DRM_ERROR("CP DMA DAIC only supported for registers\n");
+				dev_warn_once(p->dev, "CP DMA DAIC only supported for registers\n");
 				return -EINVAL;
 			}
 			if (((info & 0x00300000) >> 20) == 0) {
 				r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 				if (r) {
-					DRM_ERROR("bad CP DMA DST\n");
+					dev_warn_once(p->dev, "bad CP DMA DST\n");
 					return -EINVAL;
 				}
 
@@ -2197,15 +2197,15 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 				offset = reloc->gpu_offset + tmp;
 
 				if ((tmp + size) > radeon_bo_size(reloc->robj)) {
-					dev_warn(p->dev, "CP DMA dst buffer too small (%llu %lu)\n",
-						 tmp + size, radeon_bo_size(reloc->robj));
+					dev_warn_once(p->dev, "CP DMA dst buffer too small (%llu %lu)\n",
+						      tmp + size, radeon_bo_size(reloc->robj));
 					return -EINVAL;
 				}
 
 				ib[idx+2] = offset;
 				ib[idx+3] = upper_32_bits(offset) & 0xff;
 			} else {
-				DRM_ERROR("bad CP DMA DST_SEL\n");
+				dev_warn_once(p->dev, "bad CP DMA DST_SEL\n");
 				return -EINVAL;
 			}
 		}
@@ -2213,13 +2213,13 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 	}
 	case PACKET3_PFP_SYNC_ME:
 		if (pkt->count) {
-			DRM_ERROR("bad PFP_SYNC_ME\n");
+			dev_warn_once(p->dev, "bad PFP_SYNC_ME\n");
 			return -EINVAL;
 		}
 		break;
 	case PACKET3_SURFACE_SYNC:
 		if (pkt->count != 3) {
-			DRM_ERROR("bad SURFACE_SYNC\n");
+			dev_warn_once(p->dev, "bad SURFACE_SYNC\n");
 			return -EINVAL;
 		}
 		/* 0xffffffff/0x0 is flush all cache flag */
@@ -2227,7 +2227,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		    radeon_get_ib_value(p, idx + 2) != 0) {
 			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 			if (r) {
-				DRM_ERROR("bad SURFACE_SYNC\n");
+				dev_warn_once(p->dev, "bad SURFACE_SYNC\n");
 				return -EINVAL;
 			}
 			ib[idx+2] += (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
@@ -2235,7 +2235,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		break;
 	case PACKET3_EVENT_WRITE:
 		if (pkt->count != 2 && pkt->count != 0) {
-			DRM_ERROR("bad EVENT_WRITE\n");
+			dev_warn_once(p->dev, "bad EVENT_WRITE\n");
 			return -EINVAL;
 		}
 		if (pkt->count) {
@@ -2243,7 +2243,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 
 			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 			if (r) {
-				DRM_ERROR("bad EVENT_WRITE\n");
+				dev_warn_once(p->dev, "bad EVENT_WRITE\n");
 				return -EINVAL;
 			}
 			offset = reloc->gpu_offset +
@@ -2259,12 +2259,12 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		uint64_t offset;
 
 		if (pkt->count != 4) {
-			DRM_ERROR("bad EVENT_WRITE_EOP\n");
+			dev_warn_once(p->dev, "bad EVENT_WRITE_EOP\n");
 			return -EINVAL;
 		}
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("bad EVENT_WRITE_EOP\n");
+			dev_warn_once(p->dev, "bad EVENT_WRITE_EOP\n");
 			return -EINVAL;
 		}
 
@@ -2281,12 +2281,12 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		uint64_t offset;
 
 		if (pkt->count != 3) {
-			DRM_ERROR("bad EVENT_WRITE_EOS\n");
+			dev_warn_once(p->dev, "bad EVENT_WRITE_EOS\n");
 			return -EINVAL;
 		}
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("bad EVENT_WRITE_EOS\n");
+			dev_warn_once(p->dev, "bad EVENT_WRITE_EOS\n");
 			return -EINVAL;
 		}
 
@@ -2304,7 +2304,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		if ((start_reg < PACKET3_SET_CONFIG_REG_START) ||
 		    (start_reg >= PACKET3_SET_CONFIG_REG_END) ||
 		    (end_reg >= PACKET3_SET_CONFIG_REG_END)) {
-			DRM_ERROR("bad PACKET3_SET_CONFIG_REG\n");
+			dev_warn_once(p->dev, "bad PACKET3_SET_CONFIG_REG\n");
 			return -EINVAL;
 		}
 		for (reg = start_reg, idx++; reg <= end_reg; reg += 4, idx++) {
@@ -2321,7 +2321,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		if ((start_reg < PACKET3_SET_CONTEXT_REG_START) ||
 		    (start_reg >= PACKET3_SET_CONTEXT_REG_END) ||
 		    (end_reg >= PACKET3_SET_CONTEXT_REG_END)) {
-			DRM_ERROR("bad PACKET3_SET_CONTEXT_REG\n");
+			dev_warn_once(p->dev, "bad PACKET3_SET_CONTEXT_REG\n");
 			return -EINVAL;
 		}
 		for (reg = start_reg, idx++; reg <= end_reg; reg += 4, idx++) {
@@ -2334,7 +2334,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		break;
 	case PACKET3_SET_RESOURCE:
 		if (pkt->count % 8) {
-			DRM_ERROR("bad SET_RESOURCE\n");
+			dev_warn_once(p->dev, "bad SET_RESOURCE\n");
 			return -EINVAL;
 		}
 		start_reg = (idx_value << 2) + PACKET3_SET_RESOURCE_START;
@@ -2342,7 +2342,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		if ((start_reg < PACKET3_SET_RESOURCE_START) ||
 		    (start_reg >= PACKET3_SET_RESOURCE_END) ||
 		    (end_reg >= PACKET3_SET_RESOURCE_END)) {
-			DRM_ERROR("bad SET_RESOURCE\n");
+			dev_warn_once(p->dev, "bad SET_RESOURCE\n");
 			return -EINVAL;
 		}
 		for (i = 0; i < (pkt->count / 8); i++) {
@@ -2355,7 +2355,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 				/* tex base */
 				r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 				if (r) {
-					DRM_ERROR("bad SET_RESOURCE (tex)\n");
+					dev_warn_once(p->dev, "bad SET_RESOURCE (tex)\n");
 					return -EINVAL;
 				}
 				if (!(p->cs_flags & RADEON_CS_KEEP_TILING_FLAGS)) {
@@ -2392,7 +2392,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 				} else {
 					r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 					if (r) {
-						DRM_ERROR("bad SET_RESOURCE (tex)\n");
+						dev_warn_once(p->dev, "bad SET_RESOURCE (tex)\n");
 						return -EINVAL;
 					}
 					moffset = (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
@@ -2411,7 +2411,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 				/* vtx base */
 				r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 				if (r) {
-					DRM_ERROR("bad SET_RESOURCE (vtx)\n");
+					dev_warn_once(p->dev, "bad SET_RESOURCE (vtx)\n");
 					return -EINVAL;
 				}
 				offset = radeon_get_ib_value(p, idx+1+(i*8)+0);
@@ -2431,7 +2431,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 			case SQ_TEX_VTX_INVALID_TEXTURE:
 			case SQ_TEX_VTX_INVALID_BUFFER:
 			default:
-				DRM_ERROR("bad SET_RESOURCE\n");
+				dev_warn_once(p->dev, "bad SET_RESOURCE\n");
 				return -EINVAL;
 			}
 		}
@@ -2445,7 +2445,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		if ((start_reg < PACKET3_SET_BOOL_CONST_START) ||
 		    (start_reg >= PACKET3_SET_BOOL_CONST_END) ||
 		    (end_reg >= PACKET3_SET_BOOL_CONST_END)) {
-			DRM_ERROR("bad SET_BOOL_CONST\n");
+			dev_warn_once(p->dev, "bad SET_BOOL_CONST\n");
 			return -EINVAL;
 		}
 		break;
@@ -2455,7 +2455,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		if ((start_reg < PACKET3_SET_LOOP_CONST_START) ||
 		    (start_reg >= PACKET3_SET_LOOP_CONST_END) ||
 		    (end_reg >= PACKET3_SET_LOOP_CONST_END)) {
-			DRM_ERROR("bad SET_LOOP_CONST\n");
+			dev_warn_once(p->dev, "bad SET_LOOP_CONST\n");
 			return -EINVAL;
 		}
 		break;
@@ -2465,13 +2465,13 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		if ((start_reg < PACKET3_SET_CTL_CONST_START) ||
 		    (start_reg >= PACKET3_SET_CTL_CONST_END) ||
 		    (end_reg >= PACKET3_SET_CTL_CONST_END)) {
-			DRM_ERROR("bad SET_CTL_CONST\n");
+			dev_warn_once(p->dev, "bad SET_CTL_CONST\n");
 			return -EINVAL;
 		}
 		break;
 	case PACKET3_SET_SAMPLER:
 		if (pkt->count % 3) {
-			DRM_ERROR("bad SET_SAMPLER\n");
+			dev_warn_once(p->dev, "bad SET_SAMPLER\n");
 			return -EINVAL;
 		}
 		start_reg = (idx_value << 2) + PACKET3_SET_SAMPLER_START;
@@ -2479,13 +2479,13 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		if ((start_reg < PACKET3_SET_SAMPLER_START) ||
 		    (start_reg >= PACKET3_SET_SAMPLER_END) ||
 		    (end_reg >= PACKET3_SET_SAMPLER_END)) {
-			DRM_ERROR("bad SET_SAMPLER\n");
+			dev_warn_once(p->dev, "bad SET_SAMPLER\n");
 			return -EINVAL;
 		}
 		break;
 	case PACKET3_STRMOUT_BUFFER_UPDATE:
 		if (pkt->count != 4) {
-			DRM_ERROR("bad STRMOUT_BUFFER_UPDATE (invalid count)\n");
+			dev_warn_once(p->dev, "bad STRMOUT_BUFFER_UPDATE (invalid count)\n");
 			return -EINVAL;
 		}
 		/* Updating memory at DST_ADDRESS. */
@@ -2493,14 +2493,14 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 			u64 offset;
 			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 			if (r) {
-				DRM_ERROR("bad STRMOUT_BUFFER_UPDATE (missing dst reloc)\n");
+				dev_warn_once(p->dev, "bad STRMOUT_BUFFER_UPDATE (missing dst reloc)\n");
 				return -EINVAL;
 			}
 			offset = radeon_get_ib_value(p, idx+1);
 			offset += ((u64)(radeon_get_ib_value(p, idx+2) & 0xff)) << 32;
 			if ((offset + 4) > radeon_bo_size(reloc->robj)) {
-				DRM_ERROR("bad STRMOUT_BUFFER_UPDATE dst bo too small: 0x%llx, 0x%lx\n",
-					  offset + 4, radeon_bo_size(reloc->robj));
+				dev_warn_once(p->dev, "bad STRMOUT_BUFFER_UPDATE dst bo too small: 0x%llx, 0x%lx\n",
+					      offset + 4, radeon_bo_size(reloc->robj));
 				return -EINVAL;
 			}
 			offset += reloc->gpu_offset;
@@ -2512,14 +2512,14 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 			u64 offset;
 			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 			if (r) {
-				DRM_ERROR("bad STRMOUT_BUFFER_UPDATE (missing src reloc)\n");
+				dev_warn_once(p->dev, "bad STRMOUT_BUFFER_UPDATE (missing src reloc)\n");
 				return -EINVAL;
 			}
 			offset = radeon_get_ib_value(p, idx+3);
 			offset += ((u64)(radeon_get_ib_value(p, idx+4) & 0xff)) << 32;
 			if ((offset + 4) > radeon_bo_size(reloc->robj)) {
-				DRM_ERROR("bad STRMOUT_BUFFER_UPDATE src bo too small: 0x%llx, 0x%lx\n",
-					  offset + 4, radeon_bo_size(reloc->robj));
+				dev_warn_once(p->dev, "bad STRMOUT_BUFFER_UPDATE src bo too small: 0x%llx, 0x%lx\n",
+					      offset + 4, radeon_bo_size(reloc->robj));
 				return -EINVAL;
 			}
 			offset += reloc->gpu_offset;
@@ -2532,23 +2532,23 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		u64 offset;
 
 		if (pkt->count != 3) {
-			DRM_ERROR("bad MEM_WRITE (invalid count)\n");
+			dev_warn_once(p->dev, "bad MEM_WRITE (invalid count)\n");
 			return -EINVAL;
 		}
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("bad MEM_WRITE (missing reloc)\n");
+			dev_warn_once(p->dev, "bad MEM_WRITE (missing reloc)\n");
 			return -EINVAL;
 		}
 		offset = radeon_get_ib_value(p, idx+0);
 		offset += ((u64)(radeon_get_ib_value(p, idx+1) & 0xff)) << 32UL;
 		if (offset & 0x7) {
-			DRM_ERROR("bad MEM_WRITE (address not qwords aligned)\n");
+			dev_warn_once(p->dev, "bad MEM_WRITE (address not qwords aligned)\n");
 			return -EINVAL;
 		}
 		if ((offset + 8) > radeon_bo_size(reloc->robj)) {
-			DRM_ERROR("bad MEM_WRITE bo too small: 0x%llx, 0x%lx\n",
-				  offset + 8, radeon_bo_size(reloc->robj));
+			dev_warn_once(p->dev, "bad MEM_WRITE bo too small: 0x%llx, 0x%lx\n",
+				      offset + 8, radeon_bo_size(reloc->robj));
 			return -EINVAL;
 		}
 		offset += reloc->gpu_offset;
@@ -2558,7 +2558,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 	}
 	case PACKET3_COPY_DW:
 		if (pkt->count != 4) {
-			DRM_ERROR("bad COPY_DW (invalid count)\n");
+			dev_warn_once(p->dev, "bad COPY_DW (invalid count)\n");
 			return -EINVAL;
 		}
 		if (idx_value & 0x1) {
@@ -2566,14 +2566,14 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 			/* SRC is memory. */
 			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 			if (r) {
-				DRM_ERROR("bad COPY_DW (missing src reloc)\n");
+				dev_warn_once(p->dev, "bad COPY_DW (missing src reloc)\n");
 				return -EINVAL;
 			}
 			offset = radeon_get_ib_value(p, idx+1);
 			offset += ((u64)(radeon_get_ib_value(p, idx+2) & 0xff)) << 32;
 			if ((offset + 4) > radeon_bo_size(reloc->robj)) {
-				DRM_ERROR("bad COPY_DW src bo too small: 0x%llx, 0x%lx\n",
-					  offset + 4, radeon_bo_size(reloc->robj));
+				dev_warn_once(p->dev, "bad COPY_DW src bo too small: 0x%llx, 0x%lx\n",
+					      offset + 4, radeon_bo_size(reloc->robj));
 				return -EINVAL;
 			}
 			offset += reloc->gpu_offset;
@@ -2583,8 +2583,8 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 			/* SRC is a reg. */
 			reg = radeon_get_ib_value(p, idx+1) << 2;
 			if (!evergreen_is_safe_reg(p, reg)) {
-				dev_warn(p->dev, "forbidden register 0x%08x at %d\n",
-					 reg, idx + 1);
+				dev_warn_once(p->dev, "forbidden register 0x%08x at %d\n",
+					      reg, idx + 1);
 				return -EINVAL;
 			}
 		}
@@ -2593,14 +2593,14 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 			/* DST is memory. */
 			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 			if (r) {
-				DRM_ERROR("bad COPY_DW (missing dst reloc)\n");
+				dev_warn_once(p->dev, "bad COPY_DW (missing dst reloc)\n");
 				return -EINVAL;
 			}
 			offset = radeon_get_ib_value(p, idx+3);
 			offset += ((u64)(radeon_get_ib_value(p, idx+4) & 0xff)) << 32;
 			if ((offset + 4) > radeon_bo_size(reloc->robj)) {
-				DRM_ERROR("bad COPY_DW dst bo too small: 0x%llx, 0x%lx\n",
-					  offset + 4, radeon_bo_size(reloc->robj));
+				dev_warn_once(p->dev, "bad COPY_DW dst bo too small: 0x%llx, 0x%lx\n",
+					      offset + 4, radeon_bo_size(reloc->robj));
 				return -EINVAL;
 			}
 			offset += reloc->gpu_offset;
@@ -2610,8 +2610,8 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 			/* DST is a reg. */
 			reg = radeon_get_ib_value(p, idx+3) << 2;
 			if (!evergreen_is_safe_reg(p, reg)) {
-				dev_warn(p->dev, "forbidden register 0x%08x at %d\n",
-					 reg, idx + 3);
+				dev_warn_once(p->dev, "forbidden register 0x%08x at %d\n",
+					      reg, idx + 3);
 				return -EINVAL;
 			}
 		}
@@ -2622,7 +2622,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		uint32_t allowed_reg_base;
 		uint32_t source_sel;
 		if (pkt->count != 2) {
-			DRM_ERROR("bad SET_APPEND_CNT (invalid count)\n");
+			dev_warn_once(p->dev, "bad SET_APPEND_CNT (invalid count)\n");
 			return -EINVAL;
 		}
 
@@ -2632,8 +2632,8 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 
 		areg = idx_value >> 16;
 		if (areg < allowed_reg_base || areg > (allowed_reg_base + 11)) {
-			dev_warn(p->dev, "forbidden register for append cnt 0x%08x at %d\n",
-				 areg, idx);
+			dev_warn_once(p->dev, "forbidden register for append cnt 0x%08x at %d\n",
+				      areg, idx);
 			return -EINVAL;
 		}
 
@@ -2643,7 +2643,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 			uint32_t swap;
 			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 			if (r) {
-				DRM_ERROR("bad SET_APPEND_CNT (missing reloc)\n");
+				dev_warn_once(p->dev, "bad SET_APPEND_CNT (missing reloc)\n");
 				return -EINVAL;
 			}
 			offset = radeon_get_ib_value(p, idx + 1);
@@ -2656,7 +2656,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 			ib[idx+1] = (offset & 0xfffffffc) | swap;
 			ib[idx+2] = upper_32_bits(offset) & 0xff;
 		} else {
-			DRM_ERROR("bad SET_APPEND_CNT (unsupported operation)\n");
+			dev_warn_once(p->dev, "bad SET_APPEND_CNT (unsupported operation)\n");
 			return -EINVAL;
 		}
 		break;
@@ -2666,23 +2666,23 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 		u64 offset;
 
 		if (pkt->count != 2) {
-			DRM_ERROR("bad COND_EXEC (invalid count)\n");
+			dev_warn_once(p->dev, "bad COND_EXEC (invalid count)\n");
 			return -EINVAL;
 		}
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("bad COND_EXEC (missing reloc)\n");
+			dev_warn_once(p->dev, "bad COND_EXEC (missing reloc)\n");
 			return -EINVAL;
 		}
 		offset = radeon_get_ib_value(p, idx + 0);
 		offset += ((u64)(radeon_get_ib_value(p, idx + 1) & 0xff)) << 32UL;
 		if (offset & 0x7) {
-			DRM_ERROR("bad COND_EXEC (address not qwords aligned)\n");
+			dev_warn_once(p->dev, "bad COND_EXEC (address not qwords aligned)\n");
 			return -EINVAL;
 		}
 		if ((offset + 8) > radeon_bo_size(reloc->robj)) {
-			DRM_ERROR("bad COND_EXEC bo too small: 0x%llx, 0x%lx\n",
-				  offset + 8, radeon_bo_size(reloc->robj));
+			dev_warn_once(p->dev, "bad COND_EXEC bo too small: 0x%llx, 0x%lx\n",
+				      offset + 8, radeon_bo_size(reloc->robj));
 			return -EINVAL;
 		}
 		offset += reloc->gpu_offset;
@@ -2692,7 +2692,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 	}
 	case PACKET3_COND_WRITE:
 		if (pkt->count != 7) {
-			DRM_ERROR("bad COND_WRITE (invalid count)\n");
+			dev_warn_once(p->dev, "bad COND_WRITE (invalid count)\n");
 			return -EINVAL;
 		}
 		if (idx_value & 0x10) {
@@ -2700,14 +2700,14 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 			/* POLL is memory. */
 			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 			if (r) {
-				DRM_ERROR("bad COND_WRITE (missing src reloc)\n");
+				dev_warn_once(p->dev, "bad COND_WRITE (missing src reloc)\n");
 				return -EINVAL;
 			}
 			offset = radeon_get_ib_value(p, idx + 1);
 			offset += ((u64)(radeon_get_ib_value(p, idx + 2) & 0xff)) << 32;
 			if ((offset + 8) > radeon_bo_size(reloc->robj)) {
-				DRM_ERROR("bad COND_WRITE src bo too small: 0x%llx, 0x%lx\n",
-					  offset + 8, radeon_bo_size(reloc->robj));
+				dev_warn_once(p->dev, "bad COND_WRITE src bo too small: 0x%llx, 0x%lx\n",
+					      offset + 8, radeon_bo_size(reloc->robj));
 				return -EINVAL;
 			}
 			offset += reloc->gpu_offset;
@@ -2717,8 +2717,8 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 			/* POLL is a reg. */
 			reg = radeon_get_ib_value(p, idx + 1) << 2;
 			if (!evergreen_is_safe_reg(p, reg)) {
-				dev_warn(p->dev, "forbidden register 0x%08x at %d\n",
-					 reg, idx + 1);
+				dev_warn_once(p->dev, "forbidden register 0x%08x at %d\n",
+					      reg, idx + 1);
 				return -EINVAL;
 			}
 		}
@@ -2727,14 +2727,14 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 			/* WRITE is memory. */
 			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 			if (r) {
-				DRM_ERROR("bad COND_WRITE (missing dst reloc)\n");
+				dev_warn_once(p->dev, "bad COND_WRITE (missing dst reloc)\n");
 				return -EINVAL;
 			}
 			offset = radeon_get_ib_value(p, idx + 5);
 			offset += ((u64)(radeon_get_ib_value(p, idx + 6) & 0xff)) << 32;
 			if ((offset + 8) > radeon_bo_size(reloc->robj)) {
-				DRM_ERROR("bad COND_WRITE dst bo too small: 0x%llx, 0x%lx\n",
-					  offset + 8, radeon_bo_size(reloc->robj));
+				dev_warn_once(p->dev, "bad COND_WRITE dst bo too small: 0x%llx, 0x%lx\n",
+					      offset + 8, radeon_bo_size(reloc->robj));
 				return -EINVAL;
 			}
 			offset += reloc->gpu_offset;
@@ -2744,8 +2744,8 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 			/* WRITE is a reg. */
 			reg = radeon_get_ib_value(p, idx + 5) << 2;
 			if (!evergreen_is_safe_reg(p, reg)) {
-				dev_warn(p->dev, "forbidden register 0x%08x at %d\n",
-					 reg, idx + 5);
+				dev_warn_once(p->dev, "forbidden register 0x%08x at %d\n",
+					      reg, idx + 5);
 				return -EINVAL;
 			}
 		}
@@ -2753,7 +2753,7 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 	case PACKET3_NOP:
 		break;
 	default:
-		DRM_ERROR("Packet3 opcode %x not supported\n", pkt->opcode);
+		dev_warn_once(p->dev, "Packet3 opcode %x not supported\n", pkt->opcode);
 		return -EINVAL;
 	}
 	return 0;
@@ -2853,7 +2853,7 @@ int evergreen_cs_parse(struct radeon_cs_parser *p)
 			r = evergreen_packet3_check(p, &pkt);
 			break;
 		default:
-			DRM_ERROR("Unknown packet type %d !\n", pkt.type);
+			dev_warn_once(p->dev, "Unknown packet type %d !\n", pkt.type);
 			kfree(p->track);
 			p->track = NULL;
 			return -EINVAL;
@@ -2896,8 +2896,8 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 
 	do {
 		if (p->idx >= ib_chunk->length_dw) {
-			DRM_ERROR("Can not parse packet at %d after CS end %d !\n",
-				  p->idx, ib_chunk->length_dw);
+			dev_warn_once(p->dev, "Can not parse packet at %d after CS end %d !\n",
+				      p->idx, ib_chunk->length_dw);
 			return -EINVAL;
 		}
 		idx = p->idx;
@@ -2910,7 +2910,7 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 		case DMA_PACKET_WRITE:
 			r = r600_dma_cs_next_reloc(p, &dst_reloc);
 			if (r) {
-				DRM_ERROR("bad DMA_PACKET_WRITE\n");
+				dev_warn_once(p->dev, "bad DMA_PACKET_WRITE\n");
 				return -EINVAL;
 			}
 			switch (sub_cmd) {
@@ -2932,24 +2932,24 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 				p->idx += count + 3;
 				break;
 			default:
-				DRM_ERROR("bad DMA_PACKET_WRITE [%6d] 0x%08x sub cmd is not 0 or 8\n", idx, header);
+				dev_warn_once(p->dev, "bad DMA_PACKET_WRITE [%6d] 0x%08x sub cmd is not 0 or 8\n", idx, header);
 				return -EINVAL;
 			}
 			if ((dst_offset + (count * 4)) > radeon_bo_size(dst_reloc->robj)) {
-				dev_warn(p->dev, "DMA write buffer too small (%llu %lu)\n",
-					 dst_offset, radeon_bo_size(dst_reloc->robj));
+				dev_warn_once(p->dev, "DMA write buffer too small (%llu %lu)\n",
+					      dst_offset, radeon_bo_size(dst_reloc->robj));
 				return -EINVAL;
 			}
 			break;
 		case DMA_PACKET_COPY:
 			r = r600_dma_cs_next_reloc(p, &src_reloc);
 			if (r) {
-				DRM_ERROR("bad DMA_PACKET_COPY\n");
+				dev_warn_once(p->dev, "bad DMA_PACKET_COPY\n");
 				return -EINVAL;
 			}
 			r = r600_dma_cs_next_reloc(p, &dst_reloc);
 			if (r) {
-				DRM_ERROR("bad DMA_PACKET_COPY\n");
+				dev_warn_once(p->dev, "bad DMA_PACKET_COPY\n");
 				return -EINVAL;
 			}
 			switch (sub_cmd) {
@@ -2961,13 +2961,13 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 				dst_offset = radeon_get_ib_value(p, idx+1);
 				dst_offset |= ((u64)(radeon_get_ib_value(p, idx+3) & 0xff)) << 32;
 				if ((src_offset + (count * 4)) > radeon_bo_size(src_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2L, dw src buffer too small (%llu %lu)\n",
-							src_offset + (count * 4), radeon_bo_size(src_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2L, dw src buffer too small (%llu %lu)\n",
+						      src_offset + (count * 4), radeon_bo_size(src_reloc->robj));
 					return -EINVAL;
 				}
 				if ((dst_offset + (count * 4)) > radeon_bo_size(dst_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2L, dw dst buffer too small (%llu %lu)\n",
-							dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2L, dw dst buffer too small (%llu %lu)\n",
+						      dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
 					return -EINVAL;
 				}
 				ib[idx+1] += (u32)(dst_reloc->gpu_offset & 0xfffffffc);
@@ -3001,13 +3001,13 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 					ib[idx+1] += (u32)(dst_reloc->gpu_offset >> 8);
 				}
 				if ((src_offset + (count * 4)) > radeon_bo_size(src_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2T, src buffer too small (%llu %lu)\n",
-							src_offset + (count * 4), radeon_bo_size(src_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2T, src buffer too small (%llu %lu)\n",
+						      src_offset + (count * 4), radeon_bo_size(src_reloc->robj));
 					return -EINVAL;
 				}
 				if ((dst_offset + (count * 4)) > radeon_bo_size(dst_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2T, dst buffer too small (%llu %lu)\n",
-							dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2T, dst buffer too small (%llu %lu)\n",
+						      dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
 					return -EINVAL;
 				}
 				p->idx += 9;
@@ -3020,13 +3020,13 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 				dst_offset = radeon_get_ib_value(p, idx+1);
 				dst_offset |= ((u64)(radeon_get_ib_value(p, idx+3) & 0xff)) << 32;
 				if ((src_offset + count) > radeon_bo_size(src_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2L, byte src buffer too small (%llu %lu)\n",
-							src_offset + count, radeon_bo_size(src_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2L, byte src buffer too small (%llu %lu)\n",
+						      src_offset + count, radeon_bo_size(src_reloc->robj));
 					return -EINVAL;
 				}
 				if ((dst_offset + count) > radeon_bo_size(dst_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2L, byte dst buffer too small (%llu %lu)\n",
-							dst_offset + count, radeon_bo_size(dst_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2L, byte dst buffer too small (%llu %lu)\n",
+						      dst_offset + count, radeon_bo_size(dst_reloc->robj));
 					return -EINVAL;
 				}
 				ib[idx+1] += (u32)(dst_reloc->gpu_offset & 0xffffffff);
@@ -3039,7 +3039,7 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 			case 0x41:
 				/* L2L, partial */
 				if (p->family < CHIP_CAYMAN) {
-					DRM_ERROR("L2L Partial is cayman only !\n");
+					dev_warn_once(p->dev, "L2L Partial is cayman only !\n");
 					return -EINVAL;
 				}
 				ib[idx+1] += (u32)(src_reloc->gpu_offset & 0xffffffff);
@@ -3054,7 +3054,7 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 				/* L2L, dw, broadcast */
 				r = r600_dma_cs_next_reloc(p, &dst2_reloc);
 				if (r) {
-					DRM_ERROR("bad L2L, dw, broadcast DMA_PACKET_COPY\n");
+					dev_warn_once(p->dev, "bad L2L, dw, broadcast DMA_PACKET_COPY\n");
 					return -EINVAL;
 				}
 				dst_offset = radeon_get_ib_value(p, idx+1);
@@ -3064,18 +3064,18 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 				src_offset = radeon_get_ib_value(p, idx+3);
 				src_offset |= ((u64)(radeon_get_ib_value(p, idx+6) & 0xff)) << 32;
 				if ((src_offset + (count * 4)) > radeon_bo_size(src_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2L, dw, broadcast src buffer too small (%llu %lu)\n",
-							src_offset + (count * 4), radeon_bo_size(src_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2L, dw, broadcast src buffer too small (%llu %lu)\n",
+						      src_offset + (count * 4), radeon_bo_size(src_reloc->robj));
 					return -EINVAL;
 				}
 				if ((dst_offset + (count * 4)) > radeon_bo_size(dst_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2L, dw, broadcast dst buffer too small (%llu %lu)\n",
-							dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2L, dw, broadcast dst buffer too small (%llu %lu)\n",
+						      dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
 					return -EINVAL;
 				}
 				if ((dst2_offset + (count * 4)) > radeon_bo_size(dst2_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2L, dw, broadcast dst2 buffer too small (%llu %lu)\n",
-							dst2_offset + (count * 4), radeon_bo_size(dst2_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2L, dw, broadcast dst2 buffer too small (%llu %lu)\n",
+						      dst2_offset + (count * 4), radeon_bo_size(dst2_reloc->robj));
 					return -EINVAL;
 				}
 				ib[idx+1] += (u32)(dst_reloc->gpu_offset & 0xfffffffc);
@@ -3089,12 +3089,12 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 			/* Copy L2T Frame to Field */
 			case 0x48:
 				if (radeon_get_ib_value(p, idx + 2) & (1 << 31)) {
-					DRM_ERROR("bad L2T, frame to fields DMA_PACKET_COPY\n");
+					dev_warn_once(p->dev, "bad L2T, frame to fields DMA_PACKET_COPY\n");
 					return -EINVAL;
 				}
 				r = r600_dma_cs_next_reloc(p, &dst2_reloc);
 				if (r) {
-					DRM_ERROR("bad L2T, frame to fields DMA_PACKET_COPY\n");
+					dev_warn_once(p->dev, "bad L2T, frame to fields DMA_PACKET_COPY\n");
 					return -EINVAL;
 				}
 				dst_offset = radeon_get_ib_value(p, idx+1);
@@ -3104,18 +3104,18 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 				src_offset = radeon_get_ib_value(p, idx+8);
 				src_offset |= ((u64)(radeon_get_ib_value(p, idx+9) & 0xff)) << 32;
 				if ((src_offset + (count * 4)) > radeon_bo_size(src_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2T, frame to fields src buffer too small (%llu %lu)\n",
-							src_offset + (count * 4), radeon_bo_size(src_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2T, frame to fields src buffer too small (%llu %lu)\n",
+						      src_offset + (count * 4), radeon_bo_size(src_reloc->robj));
 					return -EINVAL;
 				}
 				if ((dst_offset + (count * 4)) > radeon_bo_size(dst_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2T, frame to fields buffer too small (%llu %lu)\n",
-							dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2T, frame to fields buffer too small (%llu %lu)\n",
+						      dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
 					return -EINVAL;
 				}
 				if ((dst2_offset + (count * 4)) > radeon_bo_size(dst2_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2T, frame to fields buffer too small (%llu %lu)\n",
-							dst2_offset + (count * 4), radeon_bo_size(dst2_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2T, frame to fields buffer too small (%llu %lu)\n",
+						      dst2_offset + (count * 4), radeon_bo_size(dst2_reloc->robj));
 					return -EINVAL;
 				}
 				ib[idx+1] += (u32)(dst_reloc->gpu_offset >> 8);
@@ -3128,7 +3128,7 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 			case 0x49:
 				/* L2T, T2L partial */
 				if (p->family < CHIP_CAYMAN) {
-					DRM_ERROR("L2T, T2L Partial is cayman only !\n");
+					dev_warn_once(p->dev, "L2T, T2L Partial is cayman only !\n");
 					return -EINVAL;
 				}
 				/* detile bit */
@@ -3151,12 +3151,12 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 			case 0x4b:
 				/* L2T, broadcast */
 				if (radeon_get_ib_value(p, idx + 2) & (1 << 31)) {
-					DRM_ERROR("bad L2T, broadcast DMA_PACKET_COPY\n");
+					dev_warn_once(p->dev, "bad L2T, broadcast DMA_PACKET_COPY\n");
 					return -EINVAL;
 				}
 				r = r600_dma_cs_next_reloc(p, &dst2_reloc);
 				if (r) {
-					DRM_ERROR("bad L2T, broadcast DMA_PACKET_COPY\n");
+					dev_warn_once(p->dev, "bad L2T, broadcast DMA_PACKET_COPY\n");
 					return -EINVAL;
 				}
 				dst_offset = radeon_get_ib_value(p, idx+1);
@@ -3166,18 +3166,18 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 				src_offset = radeon_get_ib_value(p, idx+8);
 				src_offset |= ((u64)(radeon_get_ib_value(p, idx+9) & 0xff)) << 32;
 				if ((src_offset + (count * 4)) > radeon_bo_size(src_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2T, broadcast src buffer too small (%llu %lu)\n",
-							src_offset + (count * 4), radeon_bo_size(src_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2T, broadcast src buffer too small (%llu %lu)\n",
+						      src_offset + (count * 4), radeon_bo_size(src_reloc->robj));
 					return -EINVAL;
 				}
 				if ((dst_offset + (count * 4)) > radeon_bo_size(dst_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2T, broadcast dst buffer too small (%llu %lu)\n",
-							dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2T, broadcast dst buffer too small (%llu %lu)\n",
+						      dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
 					return -EINVAL;
 				}
 				if ((dst2_offset + (count * 4)) > radeon_bo_size(dst2_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2T, broadcast dst2 buffer too small (%llu %lu)\n",
-							dst2_offset + (count * 4), radeon_bo_size(dst2_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2T, broadcast dst2 buffer too small (%llu %lu)\n",
+						      dst2_offset + (count * 4), radeon_bo_size(dst2_reloc->robj));
 					return -EINVAL;
 				}
 				ib[idx+1] += (u32)(dst_reloc->gpu_offset >> 8);
@@ -3212,13 +3212,13 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 					ib[idx+1] += (u32)(dst_reloc->gpu_offset >> 8);
 				}
 				if ((src_offset + (count * 4)) > radeon_bo_size(src_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2T, T2L src buffer too small (%llu %lu)\n",
-							src_offset + (count * 4), radeon_bo_size(src_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2T, T2L src buffer too small (%llu %lu)\n",
+						      src_offset + (count * 4), radeon_bo_size(src_reloc->robj));
 					return -EINVAL;
 				}
 				if ((dst_offset + (count * 4)) > radeon_bo_size(dst_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2T, T2L dst buffer too small (%llu %lu)\n",
-							dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2T, T2L dst buffer too small (%llu %lu)\n",
+						      dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
 					return -EINVAL;
 				}
 				p->idx += 9;
@@ -3227,7 +3227,7 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 			case 0x4d:
 				/* T2T partial */
 				if (p->family < CHIP_CAYMAN) {
-					DRM_ERROR("L2T, T2L Partial is cayman only !\n");
+					dev_warn_once(p->dev, "L2T, T2L Partial is cayman only !\n");
 					return -EINVAL;
 				}
 				ib[idx+1] += (u32)(src_reloc->gpu_offset >> 8);
@@ -3238,12 +3238,12 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 			case 0x4f:
 				/* L2T, broadcast */
 				if (radeon_get_ib_value(p, idx + 2) & (1 << 31)) {
-					DRM_ERROR("bad L2T, broadcast DMA_PACKET_COPY\n");
+					dev_warn_once(p->dev, "bad L2T, broadcast DMA_PACKET_COPY\n");
 					return -EINVAL;
 				}
 				r = r600_dma_cs_next_reloc(p, &dst2_reloc);
 				if (r) {
-					DRM_ERROR("bad L2T, broadcast DMA_PACKET_COPY\n");
+					dev_warn_once(p->dev, "bad L2T, broadcast DMA_PACKET_COPY\n");
 					return -EINVAL;
 				}
 				dst_offset = radeon_get_ib_value(p, idx+1);
@@ -3253,18 +3253,18 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 				src_offset = radeon_get_ib_value(p, idx+8);
 				src_offset |= ((u64)(radeon_get_ib_value(p, idx+9) & 0xff)) << 32;
 				if ((src_offset + (count * 4)) > radeon_bo_size(src_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2T, broadcast src buffer too small (%llu %lu)\n",
-							src_offset + (count * 4), radeon_bo_size(src_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2T, broadcast src buffer too small (%llu %lu)\n",
+						      src_offset + (count * 4), radeon_bo_size(src_reloc->robj));
 					return -EINVAL;
 				}
 				if ((dst_offset + (count * 4)) > radeon_bo_size(dst_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2T, broadcast dst buffer too small (%llu %lu)\n",
-							dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2T, broadcast dst buffer too small (%llu %lu)\n",
+						      dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
 					return -EINVAL;
 				}
 				if ((dst2_offset + (count * 4)) > radeon_bo_size(dst2_reloc->robj)) {
-					dev_warn(p->dev, "DMA L2T, broadcast dst2 buffer too small (%llu %lu)\n",
-							dst2_offset + (count * 4), radeon_bo_size(dst2_reloc->robj));
+					dev_warn_once(p->dev, "DMA L2T, broadcast dst2 buffer too small (%llu %lu)\n",
+						      dst2_offset + (count * 4), radeon_bo_size(dst2_reloc->robj));
 					return -EINVAL;
 				}
 				ib[idx+1] += (u32)(dst_reloc->gpu_offset >> 8);
@@ -3274,21 +3274,21 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 				p->idx += 10;
 				break;
 			default:
-				DRM_ERROR("bad DMA_PACKET_COPY [%6d] 0x%08x invalid sub cmd\n", idx, header);
+				dev_warn_once(p->dev, "bad DMA_PACKET_COPY [%6d] 0x%08x invalid sub cmd\n", idx, header);
 				return -EINVAL;
 			}
 			break;
 		case DMA_PACKET_CONSTANT_FILL:
 			r = r600_dma_cs_next_reloc(p, &dst_reloc);
 			if (r) {
-				DRM_ERROR("bad DMA_PACKET_CONSTANT_FILL\n");
+				dev_warn_once(p->dev, "bad DMA_PACKET_CONSTANT_FILL\n");
 				return -EINVAL;
 			}
 			dst_offset = radeon_get_ib_value(p, idx+1);
 			dst_offset |= ((u64)(radeon_get_ib_value(p, idx+3) & 0x00ff0000)) << 16;
 			if ((dst_offset + (count * 4)) > radeon_bo_size(dst_reloc->robj)) {
-				dev_warn(p->dev, "DMA constant fill buffer too small (%llu %lu)\n",
-					 dst_offset, radeon_bo_size(dst_reloc->robj));
+				dev_warn_once(p->dev, "DMA constant fill buffer too small (%llu %lu)\n",
+					      dst_offset, radeon_bo_size(dst_reloc->robj));
 				return -EINVAL;
 			}
 			ib[idx+1] += (u32)(dst_reloc->gpu_offset & 0xfffffffc);
@@ -3299,7 +3299,7 @@ int evergreen_dma_cs_parse(struct radeon_cs_parser *p)
 			p->idx += 1;
 			break;
 		default:
-			DRM_ERROR("Unknown packet type %d at %d !\n", cmd, idx);
+			dev_warn_once(p->dev, "Unknown packet type %d at %d !\n", cmd, idx);
 			return -EINVAL;
 		}
 	} while (p->idx < p->chunk_ib->length_dw);
@@ -3430,7 +3430,7 @@ static bool evergreen_vm_reg_valid(u32 reg)
 	case CAYMAN_SQ_EX_ALLOC_TABLE_SLOTS:
 		return true;
 	default:
-		DRM_ERROR("Invalid register 0x%x in CS\n", reg);
+		DRM_DEBUG("Invalid register 0x%x in CS\n", reg);
 		return false;
 	}
 }
@@ -3448,7 +3448,7 @@ static int evergreen_vm_packet3_check(struct radeon_device *rdev,
 		break;
 	case PACKET3_SET_BASE:
 		if (idx_value != 1) {
-			DRM_ERROR("bad SET_BASE");
+			dev_warn_once(rdev->dev, "bad SET_BASE");
 			return -EINVAL;
 		}
 		break;
@@ -3519,7 +3519,7 @@ static int evergreen_vm_packet3_check(struct radeon_device *rdev,
 		if ((start_reg < PACKET3_SET_CONFIG_REG_START) ||
 		    (start_reg >= PACKET3_SET_CONFIG_REG_END) ||
 		    (end_reg >= PACKET3_SET_CONFIG_REG_END)) {
-			DRM_ERROR("bad PACKET3_SET_CONFIG_REG\n");
+			dev_warn_once(rdev->dev, "bad PACKET3_SET_CONFIG_REG\n");
 			return -EINVAL;
 		}
 		for (i = 0; i < pkt->count; i++) {
@@ -3539,7 +3539,7 @@ static int evergreen_vm_packet3_check(struct radeon_device *rdev,
 		     (command & PACKET3_CP_DMA_CMD_SAS))) { /* src = register */
 			/* non mem to mem copies requires dw aligned count */
 			if ((command & 0x1fffff) % 4) {
-				DRM_ERROR("CP DMA command requires dw count alignment\n");
+				dev_warn_once(rdev->dev, "CP DMA command requires dw count alignment\n");
 				return -EINVAL;
 			}
 		}
@@ -3550,14 +3550,14 @@ static int evergreen_vm_packet3_check(struct radeon_device *rdev,
 				if (command & PACKET3_CP_DMA_CMD_SAIC) {
 					reg = start_reg;
 					if (!evergreen_vm_reg_valid(reg)) {
-						DRM_ERROR("CP DMA Bad SRC register\n");
+						dev_warn_once(rdev->dev, "CP DMA Bad SRC register\n");
 						return -EINVAL;
 					}
 				} else {
 					for (i = 0; i < (command & 0x1fffff); i++) {
 						reg = start_reg + (4 * i);
 						if (!evergreen_vm_reg_valid(reg)) {
-							DRM_ERROR("CP DMA Bad SRC register\n");
+							dev_warn_once(rdev->dev, "CP DMA Bad SRC register\n");
 							return -EINVAL;
 						}
 					}
@@ -3571,14 +3571,14 @@ static int evergreen_vm_packet3_check(struct radeon_device *rdev,
 				if (command & PACKET3_CP_DMA_CMD_DAIC) {
 					reg = start_reg;
 					if (!evergreen_vm_reg_valid(reg)) {
-						DRM_ERROR("CP DMA Bad DST register\n");
+						dev_warn_once(rdev->dev, "CP DMA Bad DST register\n");
 						return -EINVAL;
 					}
 				} else {
 					for (i = 0; i < (command & 0x1fffff); i++) {
 						reg = start_reg + (4 * i);
 						if (!evergreen_vm_reg_valid(reg)) {
-							DRM_ERROR("CP DMA Bad DST register\n");
+							dev_warn_once(rdev->dev, "CP DMA Bad DST register\n");
 							return -EINVAL;
 						}
 					}
@@ -3591,7 +3591,7 @@ static int evergreen_vm_packet3_check(struct radeon_device *rdev,
 		uint32_t allowed_reg_base;
 
 		if (pkt->count != 2) {
-			DRM_ERROR("bad SET_APPEND_CNT (invalid count)\n");
+			dev_warn_once(rdev->dev, "bad SET_APPEND_CNT (invalid count)\n");
 			return -EINVAL;
 		}
 
@@ -3601,8 +3601,8 @@ static int evergreen_vm_packet3_check(struct radeon_device *rdev,
 
 		areg = idx_value >> 16;
 		if (areg < allowed_reg_base || areg > (allowed_reg_base + 11)) {
-			DRM_ERROR("forbidden register for append cnt 0x%08x at %d\n",
-				  areg, idx);
+			dev_warn_once(rdev->dev, "forbidden register for append cnt 0x%08x at %d\n",
+				      areg, idx);
 			return -EINVAL;
 		}
 		break;
@@ -3681,7 +3681,9 @@ int evergreen_dma_ib_parse(struct radeon_device *rdev, struct radeon_ib *ib)
 				idx += count + 3;
 				break;
 			default:
-				DRM_ERROR("bad DMA_PACKET_WRITE [%6d] 0x%08x sub cmd is not 0 or 8\n", idx, ib->ptr[idx]);
+				dev_warn_once(rdev->dev,
+					      "bad DMA_PACKET_WRITE [%6d] 0x%08x sub cmd is not 0 or 8\n",
+					      idx, ib->ptr[idx]);
 				return -EINVAL;
 			}
 			break;
@@ -3732,7 +3734,9 @@ int evergreen_dma_ib_parse(struct radeon_device *rdev, struct radeon_ib *ib)
 				idx += 10;
 				break;
 			default:
-				DRM_ERROR("bad DMA_PACKET_COPY [%6d] 0x%08x invalid sub cmd\n", idx, ib->ptr[idx]);
+				dev_warn_once(rdev->dev,
+					      "bad DMA_PACKET_COPY [%6d] 0x%08x invalid sub cmd\n",
+					      idx, ib->ptr[idx]);
 				return -EINVAL;
 			}
 			break;
@@ -3743,7 +3747,7 @@ int evergreen_dma_ib_parse(struct radeon_device *rdev, struct radeon_ib *ib)
 			idx += 1;
 			break;
 		default:
-			DRM_ERROR("Unknown packet type %d at %d !\n", cmd, idx);
+			dev_warn_once(rdev->dev, "Unknown packet type %d at %d !\n", cmd, idx);
 			return -EINVAL;
 		}
 	} while (idx < ib->length_dw);
diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index 80703417d8a18..07a9c523a17af 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -1298,8 +1298,8 @@ int r100_reloc_pitch_offset(struct radeon_cs_parser *p,
 
 	r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 	if (r) {
-		DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-			  idx, reg);
+		dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+			      idx, reg);
 		radeon_cs_dump_packet(p, pkt);
 		return r;
 	}
@@ -1313,7 +1313,7 @@ int r100_reloc_pitch_offset(struct radeon_cs_parser *p,
 			tile_flags |= RADEON_DST_TILE_MACRO;
 		if (reloc->tiling_flags & RADEON_TILING_MICRO) {
 			if (reg == RADEON_SRC_PITCH_OFFSET) {
-				DRM_ERROR("Cannot src blit from microtiled surface\n");
+				dev_warn_once(p->dev, "Cannot src blit from microtiled surface\n");
 				radeon_cs_dump_packet(p, pkt);
 				return -EINVAL;
 			}
@@ -1342,8 +1342,8 @@ int r100_packet3_load_vbpntr(struct radeon_cs_parser *p,
 	track = (struct r100_cs_track *)p->track;
 	c = radeon_get_ib_value(p, idx++) & 0x1F;
 	if (c > 16) {
-	    DRM_ERROR("Only 16 vertex buffers are allowed %d\n",
-		      pkt->opcode);
+	    dev_warn_once(p->dev, "Only 16 vertex buffers are allowed %d\n",
+			  pkt->opcode);
 	    radeon_cs_dump_packet(p, pkt);
 	    return -EINVAL;
 	}
@@ -1351,8 +1351,8 @@ int r100_packet3_load_vbpntr(struct radeon_cs_parser *p,
 	for (i = 0; i < (c - 1); i += 2, idx += 3) {
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for packet3 %d\n",
-				  pkt->opcode);
+			dev_warn_once(p->dev, "No reloc for packet3 %d\n",
+				      pkt->opcode);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -1364,8 +1364,8 @@ int r100_packet3_load_vbpntr(struct radeon_cs_parser *p,
 		track->arrays[i + 0].esize &= 0x7F;
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for packet3 %d\n",
-				  pkt->opcode);
+			dev_warn_once(p->dev, "No reloc for packet3 %d\n",
+				      pkt->opcode);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -1377,8 +1377,8 @@ int r100_packet3_load_vbpntr(struct radeon_cs_parser *p,
 	if (c & 1) {
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for packet3 %d\n",
-					  pkt->opcode);
+			dev_warn_once(p->dev, "No reloc for packet3 %d\n",
+				      pkt->opcode);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -1470,12 +1470,12 @@ int r100_cs_packet_parse_vline(struct radeon_cs_parser *p)
 	/* check its a wait until and only 1 count */
 	if (waitreloc.reg != RADEON_WAIT_UNTIL ||
 	    waitreloc.count != 0) {
-		DRM_ERROR("vline wait had illegal wait until segment\n");
+		dev_warn_once(p->dev, "vline wait had illegal wait until segment\n");
 		return -EINVAL;
 	}
 
 	if (radeon_get_ib_value(p, waitreloc.idx + 1) != RADEON_WAIT_CRTC_VLINE) {
-		DRM_ERROR("vline wait had illegal wait until\n");
+		dev_warn_once(p->dev, "vline wait had illegal wait until\n");
 		return -EINVAL;
 	}
 
@@ -1493,7 +1493,7 @@ int r100_cs_packet_parse_vline(struct radeon_cs_parser *p)
 	reg = R100_CP_PACKET0_GET_REG(header);
 	crtc = drm_crtc_find(rdev_to_drm(p->rdev), p->filp, crtc_id);
 	if (!crtc) {
-		DRM_ERROR("cannot find crtc %d\n", crtc_id);
+		dev_warn_once(p->dev, "cannot find crtc %d\n", crtc_id);
 		return -ENOENT;
 	}
 	radeon_crtc = to_radeon_crtc(crtc);
@@ -1514,7 +1514,7 @@ int r100_cs_packet_parse_vline(struct radeon_cs_parser *p)
 			header |= RADEON_CRTC2_GUI_TRIG_VLINE >> 2;
 			break;
 		default:
-			DRM_ERROR("unknown crtc reloc\n");
+			dev_warn_once(p->dev, "unknown crtc reloc\n");
 			return -EINVAL;
 		}
 		ib[h_idx] = header;
@@ -1599,7 +1599,7 @@ static int r100_packet0_check(struct radeon_cs_parser *p,
 	case RADEON_CRTC_GUI_TRIG_VLINE:
 		r = r100_cs_packet_parse_vline(p);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
 				  idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
@@ -1616,8 +1616,8 @@ static int r100_packet0_check(struct radeon_cs_parser *p,
 	case RADEON_RB3D_DEPTHOFFSET:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-				  idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -1629,8 +1629,8 @@ static int r100_packet0_check(struct radeon_cs_parser *p,
 	case RADEON_RB3D_COLOROFFSET:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-				  idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -1645,8 +1645,8 @@ static int r100_packet0_check(struct radeon_cs_parser *p,
 		i = (reg - RADEON_PP_TXOFFSET_0) / 24;
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-				  idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -1672,8 +1672,8 @@ static int r100_packet0_check(struct radeon_cs_parser *p,
 		i = (reg - RADEON_PP_CUBIC_OFFSET_T0_0) / 4;
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-				  idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -1690,8 +1690,8 @@ static int r100_packet0_check(struct radeon_cs_parser *p,
 		i = (reg - RADEON_PP_CUBIC_OFFSET_T1_0) / 4;
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-				  idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -1708,8 +1708,8 @@ static int r100_packet0_check(struct radeon_cs_parser *p,
 		i = (reg - RADEON_PP_CUBIC_OFFSET_T2_0) / 4;
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-				  idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -1726,8 +1726,8 @@ static int r100_packet0_check(struct radeon_cs_parser *p,
 	case RADEON_RB3D_COLORPITCH:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-				  idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -1768,8 +1768,8 @@ static int r100_packet0_check(struct radeon_cs_parser *p,
 			track->cb[0].cpp = 4;
 			break;
 		default:
-			DRM_ERROR("Invalid color buffer format (%d) !\n",
-				  ((idx_value >> RADEON_RB3D_COLOR_FORMAT_SHIFT) & 0x1f));
+			dev_warn_once(p->dev, "Invalid color buffer format (%d) !\n",
+				      ((idx_value >> RADEON_RB3D_COLOR_FORMAT_SHIFT) & 0x1f));
 			return -EINVAL;
 		}
 		track->z_enabled = !!(idx_value & RADEON_Z_ENABLE);
@@ -1797,8 +1797,8 @@ static int r100_packet0_check(struct radeon_cs_parser *p,
 	case RADEON_RB3D_ZPASS_ADDR:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-				  idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -1927,10 +1927,10 @@ int r100_cs_track_check_pkt3_indx_buffer(struct radeon_cs_parser *p,
 	idx = pkt->idx + 1;
 	value = radeon_get_ib_value(p, idx + 2);
 	if ((value + 1) > radeon_bo_size(robj)) {
-		DRM_ERROR("[drm] Buffer too small for PACKET3 INDX_BUFFER "
-			  "(need %u have %lu) !\n",
-			  value + 1,
-			  radeon_bo_size(robj));
+		dev_warn_once(p->dev, "[drm] Buffer too small for PACKET3 INDX_BUFFER "
+			      "(need %u have %lu) !\n",
+			      value + 1,
+			      radeon_bo_size(robj));
 		return -EINVAL;
 	}
 	return 0;
@@ -1957,7 +1957,7 @@ static int r100_packet3_check(struct radeon_cs_parser *p,
 	case PACKET3_INDX_BUFFER:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for packet3 %d\n", pkt->opcode);
+			dev_warn_once(p->dev, "No reloc for packet3 %d\n", pkt->opcode);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -1971,7 +1971,7 @@ static int r100_packet3_check(struct radeon_cs_parser *p,
 		/* 3D_RNDR_GEN_INDX_PRIM on r100/r200 */
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for packet3 %d\n", pkt->opcode);
+			dev_warn_once(p->dev, "No reloc for packet3 %d\n", pkt->opcode);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -1992,7 +1992,7 @@ static int r100_packet3_check(struct radeon_cs_parser *p,
 		break;
 	case PACKET3_3D_DRAW_IMMD:
 		if (((radeon_get_ib_value(p, idx + 1) >> 4) & 0x3) != 3) {
-			DRM_ERROR("PRIM_WALK must be 3 for IMMD draw\n");
+			dev_warn_once(p->dev, "PRIM_WALK must be 3 for IMMD draw\n");
 			return -EINVAL;
 		}
 		track->vtx_size = r100_get_vtx_size(radeon_get_ib_value(p, idx + 0));
@@ -2005,7 +2005,7 @@ static int r100_packet3_check(struct radeon_cs_parser *p,
 		/* triggers drawing using in-packet vertex data */
 	case PACKET3_3D_DRAW_IMMD_2:
 		if (((radeon_get_ib_value(p, idx) >> 4) & 0x3) != 3) {
-			DRM_ERROR("PRIM_WALK must be 3 for IMMD draw\n");
+			dev_warn_once(p->dev, "PRIM_WALK must be 3 for IMMD draw\n");
 			return -EINVAL;
 		}
 		track->vap_vf_cntl = radeon_get_ib_value(p, idx);
@@ -2051,7 +2051,7 @@ static int r100_packet3_check(struct radeon_cs_parser *p,
 	case PACKET3_NOP:
 		break;
 	default:
-		DRM_ERROR("Packet3 opcode %x not supported\n", pkt->opcode);
+		dev_warn_once(p->dev, "Packet3 opcode %x not supported\n", pkt->opcode);
 		return -EINVAL;
 	}
 	return 0;
@@ -2093,8 +2093,8 @@ int r100_cs_parse(struct radeon_cs_parser *p)
 			r = r100_packet3_check(p, &pkt);
 			break;
 		default:
-			DRM_ERROR("Unknown packet type %d !\n",
-				  pkt.type);
+			dev_warn_once(p->dev, "Unknown packet type %d !\n",
+				      pkt.type);
 			return -EINVAL;
 		}
 		if (r)
@@ -2105,19 +2105,19 @@ int r100_cs_parse(struct radeon_cs_parser *p)
 
 static void r100_cs_track_texture_print(struct r100_cs_track_texture *t)
 {
-	DRM_ERROR("pitch                      %d\n", t->pitch);
-	DRM_ERROR("use_pitch                  %d\n", t->use_pitch);
-	DRM_ERROR("width                      %d\n", t->width);
-	DRM_ERROR("width_11                   %d\n", t->width_11);
-	DRM_ERROR("height                     %d\n", t->height);
-	DRM_ERROR("height_11                  %d\n", t->height_11);
-	DRM_ERROR("num levels                 %d\n", t->num_levels);
-	DRM_ERROR("depth                      %d\n", t->txdepth);
-	DRM_ERROR("bpp                        %d\n", t->cpp);
-	DRM_ERROR("coordinate type            %d\n", t->tex_coord_type);
-	DRM_ERROR("width round to power of 2  %d\n", t->roundup_w);
-	DRM_ERROR("height round to power of 2 %d\n", t->roundup_h);
-	DRM_ERROR("compress format            %d\n", t->compress_format);
+	DRM_DEBUG("pitch                      %d\n", t->pitch);
+	DRM_DEBUG("use_pitch                  %d\n", t->use_pitch);
+	DRM_DEBUG("width                      %d\n", t->width);
+	DRM_DEBUG("width_11                   %d\n", t->width_11);
+	DRM_DEBUG("height                     %d\n", t->height);
+	DRM_DEBUG("height_11                  %d\n", t->height_11);
+	DRM_DEBUG("num levels                 %d\n", t->num_levels);
+	DRM_DEBUG("depth                      %d\n", t->txdepth);
+	DRM_DEBUG("bpp                        %d\n", t->cpp);
+	DRM_DEBUG("coordinate type            %d\n", t->tex_coord_type);
+	DRM_DEBUG("width round to power of 2  %d\n", t->roundup_w);
+	DRM_DEBUG("height round to power of 2 %d\n", t->roundup_h);
+	DRM_DEBUG("compress format            %d\n", t->compress_format);
 }
 
 static int r100_track_compress_size(int compress_format, int w, int h)
@@ -2172,8 +2172,9 @@ static int r100_cs_track_cube(struct radeon_device *rdev,
 		size += track->textures[idx].cube_info[face].offset;
 
 		if (size > radeon_bo_size(cube_robj)) {
-			DRM_ERROR("Cube texture offset greater than object size %lu %lu\n",
-				  size, radeon_bo_size(cube_robj));
+			dev_warn_once(rdev->dev,
+				      "Cube texture offset greater than object size %lu %lu\n",
+				      size, radeon_bo_size(cube_robj));
 			r100_cs_track_texture_print(&track->textures[idx]);
 			return -1;
 		}
@@ -2196,7 +2197,7 @@ static int r100_cs_track_texture_check(struct radeon_device *rdev,
 			continue;
 		robj = track->textures[u].robj;
 		if (robj == NULL) {
-			DRM_ERROR("No texture bound to unit %u\n", u);
+			dev_warn_once(rdev->dev, "No texture bound to unit %u\n", u);
 			return -EINVAL;
 		}
 		size = 0;
@@ -2249,13 +2250,13 @@ static int r100_cs_track_texture_check(struct radeon_device *rdev,
 				size *= 6;
 			break;
 		default:
-			DRM_ERROR("Invalid texture coordinate type %u for unit "
-				  "%u\n", track->textures[u].tex_coord_type, u);
+			dev_warn_once(rdev->dev, "Invalid texture coordinate type %u for unit "
+				      "%u\n", track->textures[u].tex_coord_type, u);
 			return -EINVAL;
 		}
 		if (size > radeon_bo_size(robj)) {
-			DRM_ERROR("Texture of unit %u needs %lu bytes but is "
-				  "%lu\n", u, size, radeon_bo_size(robj));
+			dev_warn_once(rdev->dev, "Texture of unit %u needs %lu bytes but is "
+				      "%lu\n", u, size, radeon_bo_size(robj));
 			r100_cs_track_texture_print(&track->textures[u]);
 			return -EINVAL;
 		}
@@ -2277,18 +2278,18 @@ int r100_cs_track_check(struct radeon_device *rdev, struct r100_cs_track *track)
 
 	for (i = 0; i < num_cb; i++) {
 		if (track->cb[i].robj == NULL) {
-			DRM_ERROR("[drm] No buffer for color buffer %d !\n", i);
+			dev_warn_once(rdev->dev, "[drm] No buffer for color buffer %d !\n", i);
 			return -EINVAL;
 		}
 		size = track->cb[i].pitch * track->cb[i].cpp * track->maxy;
 		size += track->cb[i].offset;
 		if (size > radeon_bo_size(track->cb[i].robj)) {
-			DRM_ERROR("[drm] Buffer too small for color buffer %d "
-				  "(need %lu have %lu) !\n", i, size,
-				  radeon_bo_size(track->cb[i].robj));
-			DRM_ERROR("[drm] color buffer %d (%u %u %u %u)\n",
-				  i, track->cb[i].pitch, track->cb[i].cpp,
-				  track->cb[i].offset, track->maxy);
+			dev_warn_once(rdev->dev, "[drm] Buffer too small for color buffer %d "
+				      "(need %lu have %lu) !\n", i, size,
+				      radeon_bo_size(track->cb[i].robj));
+			dev_warn_once(rdev->dev, "[drm] color buffer %d (%u %u %u %u)\n",
+				      i, track->cb[i].pitch, track->cb[i].cpp,
+				      track->cb[i].offset, track->maxy);
 			return -EINVAL;
 		}
 	}
@@ -2296,18 +2297,18 @@ int r100_cs_track_check(struct radeon_device *rdev, struct r100_cs_track *track)
 
 	if (track->zb_dirty && track->z_enabled) {
 		if (track->zb.robj == NULL) {
-			DRM_ERROR("[drm] No buffer for z buffer !\n");
+			dev_warn_once(rdev->dev, "[drm] No buffer for z buffer !\n");
 			return -EINVAL;
 		}
 		size = track->zb.pitch * track->zb.cpp * track->maxy;
 		size += track->zb.offset;
 		if (size > radeon_bo_size(track->zb.robj)) {
-			DRM_ERROR("[drm] Buffer too small for z buffer "
-				  "(need %lu have %lu) !\n", size,
-				  radeon_bo_size(track->zb.robj));
-			DRM_ERROR("[drm] zbuffer (%u %u %u %u)\n",
-				  track->zb.pitch, track->zb.cpp,
-				  track->zb.offset, track->maxy);
+			dev_warn_once(rdev->dev, "[drm] Buffer too small for z buffer "
+				      "(need %lu have %lu) !\n", size,
+				      radeon_bo_size(track->zb.robj));
+			dev_warn_once(rdev->dev, "[drm] zbuffer (%u %u %u %u)\n",
+				      track->zb.pitch, track->zb.cpp,
+				      track->zb.offset, track->maxy);
 			return -EINVAL;
 		}
 	}
@@ -2315,19 +2316,19 @@ int r100_cs_track_check(struct radeon_device *rdev, struct r100_cs_track *track)
 
 	if (track->aa_dirty && track->aaresolve) {
 		if (track->aa.robj == NULL) {
-			DRM_ERROR("[drm] No buffer for AA resolve buffer %d !\n", i);
+			dev_warn_once(rdev->dev, "[drm] No buffer for AA resolve buffer %d !\n", i);
 			return -EINVAL;
 		}
 		/* I believe the format comes from colorbuffer0. */
 		size = track->aa.pitch * track->cb[0].cpp * track->maxy;
 		size += track->aa.offset;
 		if (size > radeon_bo_size(track->aa.robj)) {
-			DRM_ERROR("[drm] Buffer too small for AA resolve buffer %d "
-				  "(need %lu have %lu) !\n", i, size,
-				  radeon_bo_size(track->aa.robj));
-			DRM_ERROR("[drm] AA resolve buffer %d (%u %u %u %u)\n",
-				  i, track->aa.pitch, track->cb[0].cpp,
-				  track->aa.offset, track->maxy);
+			dev_warn_once(rdev->dev, "[drm] Buffer too small for AA resolve buffer %d "
+				      "(need %lu have %lu) !\n", i, size,
+				      radeon_bo_size(track->aa.robj));
+			dev_warn_once(rdev->dev, "[drm] AA resolve buffer %d (%u %u %u %u)\n",
+				      i, track->aa.pitch, track->cb[0].cpp,
+				      track->aa.offset, track->maxy);
 			return -EINVAL;
 		}
 	}
@@ -2344,17 +2345,17 @@ int r100_cs_track_check(struct radeon_device *rdev, struct r100_cs_track *track)
 		for (i = 0; i < track->num_arrays; i++) {
 			size = track->arrays[i].esize * track->max_indx * 4UL;
 			if (track->arrays[i].robj == NULL) {
-				DRM_ERROR("(PW %u) Vertex array %u no buffer "
-					  "bound\n", prim_walk, i);
+				dev_warn_once(rdev->dev, "(PW %u) Vertex array %u no buffer "
+					      "bound\n", prim_walk, i);
 				return -EINVAL;
 			}
 			if (size > radeon_bo_size(track->arrays[i].robj)) {
-				dev_err(rdev->dev, "(PW %u) Vertex array %u "
-					"need %lu dwords have %lu dwords\n",
-					prim_walk, i, size >> 2,
-					radeon_bo_size(track->arrays[i].robj)
-					>> 2);
-				DRM_ERROR("Max indices %u\n", track->max_indx);
+				dev_warn_once(rdev->dev, "(PW %u) Vertex array %u "
+					      "need %lu dwords have %lu dwords\n",
+					      prim_walk, i, size >> 2,
+					      radeon_bo_size(track->arrays[i].robj)
+					      >> 2);
+				dev_warn_once(rdev->dev, "Max indices %u\n", track->max_indx);
 				return -EINVAL;
 			}
 		}
@@ -2363,16 +2364,16 @@ int r100_cs_track_check(struct radeon_device *rdev, struct r100_cs_track *track)
 		for (i = 0; i < track->num_arrays; i++) {
 			size = track->arrays[i].esize * (nverts - 1) * 4UL;
 			if (track->arrays[i].robj == NULL) {
-				DRM_ERROR("(PW %u) Vertex array %u no buffer "
-					  "bound\n", prim_walk, i);
+				dev_warn_once(rdev->dev, "(PW %u) Vertex array %u no buffer "
+					      "bound\n", prim_walk, i);
 				return -EINVAL;
 			}
 			if (size > radeon_bo_size(track->arrays[i].robj)) {
-				dev_err(rdev->dev, "(PW %u) Vertex array %u "
-					"need %lu dwords have %lu dwords\n",
-					prim_walk, i, size >> 2,
-					radeon_bo_size(track->arrays[i].robj)
-					>> 2);
+				dev_warn_once(rdev->dev, "(PW %u) Vertex array %u "
+					      "need %lu dwords have %lu dwords\n",
+					      prim_walk, i, size >> 2,
+					      radeon_bo_size(track->arrays[i].robj)
+					      >> 2);
 				return -EINVAL;
 			}
 		}
@@ -2380,16 +2381,16 @@ int r100_cs_track_check(struct radeon_device *rdev, struct r100_cs_track *track)
 	case 3:
 		size = track->vtx_size * nverts;
 		if (size != track->immd_dwords) {
-			DRM_ERROR("IMMD draw %u dwors but needs %lu dwords\n",
-				  track->immd_dwords, size);
-			DRM_ERROR("VAP_VF_CNTL.NUM_VERTICES %u, VTX_SIZE %u\n",
-				  nverts, track->vtx_size);
+			dev_warn_once(rdev->dev, "IMMD draw %u dwors but needs %lu dwords\n",
+				      track->immd_dwords, size);
+			dev_warn_once(rdev->dev, "VAP_VF_CNTL.NUM_VERTICES %u, VTX_SIZE %u\n",
+				      nverts, track->vtx_size);
 			return -EINVAL;
 		}
 		break;
 	default:
-		DRM_ERROR("[drm] Invalid primitive walk %d for VAP_VF_CNTL\n",
-			  prim_walk);
+		dev_warn_once(rdev->dev, "[drm] Invalid primitive walk %d for VAP_VF_CNTL\n",
+			      prim_walk);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/radeon/r200.c b/drivers/gpu/drm/radeon/r200.c
index f5f2ffea5ab29..10a65a71de314 100644
--- a/drivers/gpu/drm/radeon/r200.c
+++ b/drivers/gpu/drm/radeon/r200.c
@@ -163,8 +163,8 @@ int r200_packet0_check(struct radeon_cs_parser *p,
 	case RADEON_CRTC_GUI_TRIG_VLINE:
 		r = r100_cs_packet_parse_vline(p);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-				  idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -180,8 +180,8 @@ int r200_packet0_check(struct radeon_cs_parser *p,
 	case RADEON_RB3D_DEPTHOFFSET:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-				  idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -193,8 +193,8 @@ int r200_packet0_check(struct radeon_cs_parser *p,
 	case RADEON_RB3D_COLOROFFSET:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-				  idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -212,8 +212,8 @@ int r200_packet0_check(struct radeon_cs_parser *p,
 		i = (reg - R200_PP_TXOFFSET_0) / 24;
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-				  idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -265,8 +265,8 @@ int r200_packet0_check(struct radeon_cs_parser *p,
 		face = (reg - ((i * 24) + R200_PP_TXOFFSET_0)) / 4;
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-				  idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -283,8 +283,8 @@ int r200_packet0_check(struct radeon_cs_parser *p,
 	case RADEON_RB3D_COLORPITCH:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-				  idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -326,12 +326,12 @@ int r200_packet0_check(struct radeon_cs_parser *p,
 			track->cb[0].cpp = 4;
 			break;
 		default:
-			DRM_ERROR("Invalid color buffer format (%d) !\n",
-				  ((idx_value >> RADEON_RB3D_COLOR_FORMAT_SHIFT) & 0x1f));
+			dev_warn_once(p->dev, "Invalid color buffer format (%d) !\n",
+				      ((idx_value >> RADEON_RB3D_COLOR_FORMAT_SHIFT) & 0x1f));
 			return -EINVAL;
 		}
 		if (idx_value & RADEON_DEPTHXY_OFFSET_ENABLE) {
-			DRM_ERROR("No support for depth xy offset in kms\n");
+			dev_warn_once(p->dev, "No support for depth xy offset in kms\n");
 			return -EINVAL;
 		}
 
@@ -360,8 +360,8 @@ int r200_packet0_check(struct radeon_cs_parser *p,
 	case RADEON_RB3D_ZPASS_ADDR:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-				  idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
diff --git a/drivers/gpu/drm/radeon/r300.c b/drivers/gpu/drm/radeon/r300.c
index d22889fbfa9c8..d2ee6deec0397 100644
--- a/drivers/gpu/drm/radeon/r300.c
+++ b/drivers/gpu/drm/radeon/r300.c
@@ -645,8 +645,8 @@ static int r300_packet0_check(struct radeon_cs_parser *p,
 	case RADEON_CRTC_GUI_TRIG_VLINE:
 		r = r100_cs_packet_parse_vline(p);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-					idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -664,8 +664,8 @@ static int r300_packet0_check(struct radeon_cs_parser *p,
 		i = (reg - R300_RB3D_COLOROFFSET0) >> 2;
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-					idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -677,8 +677,8 @@ static int r300_packet0_check(struct radeon_cs_parser *p,
 	case R300_ZB_DEPTHOFFSET:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-					idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -706,8 +706,8 @@ static int r300_packet0_check(struct radeon_cs_parser *p,
 		i = (reg - R300_TX_OFFSET_0) >> 2;
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-					idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -762,7 +762,7 @@ static int r300_packet0_check(struct radeon_cs_parser *p,
 		/* RB3D_CCTL */
 		if ((idx_value & (1 << 10)) && /* CMASK_ENABLE */
 		    p->rdev->cmask_filp != p->filp) {
-			DRM_ERROR("Invalid RB3D_CCTL: Cannot enable CMASK.\n");
+			dev_warn_once(p->dev, "Invalid RB3D_CCTL: Cannot enable CMASK.\n");
 			return -EINVAL;
 		}
 		track->num_cb = ((idx_value >> 5) & 0x3) + 1;
@@ -779,8 +779,8 @@ static int r300_packet0_check(struct radeon_cs_parser *p,
 		if (!(p->cs_flags & RADEON_CS_KEEP_TILING_FLAGS)) {
 			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 			if (r) {
-				DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-					  idx, reg);
+				dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+					      idx, reg);
 				radeon_cs_dump_packet(p, pkt);
 				return r;
 			}
@@ -812,8 +812,8 @@ static int r300_packet0_check(struct radeon_cs_parser *p,
 			break;
 		case 5:
 			if (p->rdev->family < CHIP_RV515) {
-				DRM_ERROR("Invalid color buffer format (%d)!\n",
-					  ((idx_value >> 21) & 0xF));
+				dev_warn_once(p->dev, "Invalid color buffer format (%d)!\n",
+					      ((idx_value >> 21) & 0xF));
 				return -EINVAL;
 			}
 			fallthrough;
@@ -827,8 +827,8 @@ static int r300_packet0_check(struct radeon_cs_parser *p,
 			track->cb[i].cpp = 16;
 			break;
 		default:
-			DRM_ERROR("Invalid color buffer format (%d) !\n",
-				  ((idx_value >> 21) & 0xF));
+			dev_warn_once(p->dev, "Invalid color buffer format (%d) !\n",
+				      ((idx_value >> 21) & 0xF));
 			return -EINVAL;
 		}
 		track->cb_dirty = true;
@@ -853,8 +853,8 @@ static int r300_packet0_check(struct radeon_cs_parser *p,
 			track->zb.cpp = 4;
 			break;
 		default:
-			DRM_ERROR("Invalid z buffer format (%d) !\n",
-				  (idx_value & 0xF));
+			dev_warn_once(p->dev, "Invalid z buffer format (%d) !\n",
+				      (idx_value & 0xF));
 			return -EINVAL;
 		}
 		track->zb_dirty = true;
@@ -864,8 +864,8 @@ static int r300_packet0_check(struct radeon_cs_parser *p,
 		if (!(p->cs_flags & RADEON_CS_KEEP_TILING_FLAGS)) {
 			r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 			if (r) {
-				DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-					  idx, reg);
+				dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+					      idx, reg);
 				radeon_cs_dump_packet(p, pkt);
 				return r;
 			}
@@ -962,8 +962,8 @@ static int r300_packet0_check(struct radeon_cs_parser *p,
 			break;
 		case R300_TX_FORMAT_ATI2N:
 			if (p->rdev->family < CHIP_R420) {
-				DRM_ERROR("Invalid texture format %u\n",
-					  (idx_value & 0x1F));
+				dev_warn_once(p->dev, "Invalid texture format %u\n",
+					      (idx_value & 0x1F));
 				return -EINVAL;
 			}
 			/* The same rules apply as for DXT3/5. */
@@ -974,8 +974,8 @@ static int r300_packet0_check(struct radeon_cs_parser *p,
 			track->textures[i].compress_format = R100_TRACK_COMP_DXT35;
 			break;
 		default:
-			DRM_ERROR("Invalid texture format %u\n",
-				  (idx_value & 0x1F));
+			dev_warn_once(p->dev, "Invalid texture format %u\n",
+				      (idx_value & 0x1F));
 			return -EINVAL;
 		}
 		track->tex_dirty = true;
@@ -1041,7 +1041,7 @@ static int r300_packet0_check(struct radeon_cs_parser *p,
 					R100_TRACK_COMP_DXT1;
 			}
 		} else if (idx_value & (1 << 14)) {
-			DRM_ERROR("Forbidden bit TXFORMAT_MSB\n");
+			dev_warn_once(p->dev, "Forbidden bit TXFORMAT_MSB\n");
 			return -EINVAL;
 		}
 		track->tex_dirty = true;
@@ -1079,8 +1079,8 @@ static int r300_packet0_check(struct radeon_cs_parser *p,
 	case R300_ZB_ZPASS_ADDR:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-					idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -1121,8 +1121,8 @@ static int r300_packet0_check(struct radeon_cs_parser *p,
 	case R300_RB3D_AARESOLVE_OFFSET:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-				  idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -1191,7 +1191,7 @@ static int r300_packet3_check(struct radeon_cs_parser *p,
 	case PACKET3_INDX_BUFFER:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			DRM_ERROR("No reloc for packet3 %d\n", pkt->opcode);
+			dev_warn_once(p->dev, "No reloc for packet3 %d\n", pkt->opcode);
 			radeon_cs_dump_packet(p, pkt);
 			return r;
 		}
@@ -1207,7 +1207,7 @@ static int r300_packet3_check(struct radeon_cs_parser *p,
 		 * PRIM_WALK must be equal to 3 vertex data in embedded
 		 * in cmd stream */
 		if (((radeon_get_ib_value(p, idx + 1) >> 4) & 0x3) != 3) {
-			DRM_ERROR("PRIM_WALK must be 3 for IMMD draw\n");
+			dev_warn_once(p->dev, "PRIM_WALK must be 3 for IMMD draw\n");
 			return -EINVAL;
 		}
 		track->vap_vf_cntl = radeon_get_ib_value(p, idx + 1);
@@ -1222,7 +1222,7 @@ static int r300_packet3_check(struct radeon_cs_parser *p,
 		 * PRIM_WALK must be equal to 3 vertex data in embedded
 		 * in cmd stream */
 		if (((radeon_get_ib_value(p, idx) >> 4) & 0x3) != 3) {
-			DRM_ERROR("PRIM_WALK must be 3 for IMMD draw\n");
+			dev_warn_once(p->dev, "PRIM_WALK must be 3 for IMMD draw\n");
 			return -EINVAL;
 		}
 		track->vap_vf_cntl = radeon_get_ib_value(p, idx);
@@ -1272,7 +1272,7 @@ static int r300_packet3_check(struct radeon_cs_parser *p,
 	case PACKET3_NOP:
 		break;
 	default:
-		DRM_ERROR("Packet3 opcode %x not supported\n", pkt->opcode);
+		dev_warn_once(p->dev, "Packet3 opcode %x not supported\n", pkt->opcode);
 		return -EINVAL;
 	}
 	return 0;
@@ -1308,7 +1308,7 @@ int r300_cs_parse(struct radeon_cs_parser *p)
 			r = r300_packet3_check(p, &pkt);
 			break;
 		default:
-			DRM_ERROR("Unknown packet type %d !\n", pkt.type);
+			dev_warn_once(p->dev, "Unknown packet type %d !\n", pkt.type);
 			return -EINVAL;
 		}
 		if (r) {
diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/r600_cs.c
index 811265648a582..8eeceeeca3621 100644
--- a/drivers/gpu/drm/radeon/r600_cs.c
+++ b/drivers/gpu/drm/radeon/r600_cs.c
@@ -361,9 +361,9 @@ static int r600_cs_track_validate_cb(struct radeon_cs_parser *p, int i)
 
 	format = G_0280A0_FORMAT(track->cb_color_info[i]);
 	if (!r600_fmt_is_valid_color(format)) {
-		dev_warn(p->dev, "%s:%d cb invalid format %d for %d (0x%08X)\n",
-			 __func__, __LINE__, format,
-			i, track->cb_color_info[i]);
+		dev_warn_once(p->dev, "%s:%d cb invalid format %d for %d (0x%08X)\n",
+			      __func__, __LINE__, format,
+			      i, track->cb_color_info[i]);
 		return -EINVAL;
 	}
 	/* pitch in pixels */
@@ -384,9 +384,9 @@ static int r600_cs_track_validate_cb(struct radeon_cs_parser *p, int i)
 	array_check.blocksize = r600_fmt_get_blocksize(format);
 	if (r600_get_array_mode_alignment(&array_check,
 					  &pitch_align, &height_align, &depth_align, &base_align)) {
-		dev_warn(p->dev, "%s invalid tiling %d for %d (0x%08X)\n", __func__,
-			 G_0280A0_ARRAY_MODE(track->cb_color_info[i]), i,
-			 track->cb_color_info[i]);
+		dev_warn_once(p->dev, "%s invalid tiling %d for %d (0x%08X)\n", __func__,
+			      G_0280A0_ARRAY_MODE(track->cb_color_info[i]), i,
+			      track->cb_color_info[i]);
 		return -EINVAL;
 	}
 	switch (array_mode) {
@@ -402,25 +402,26 @@ static int r600_cs_track_validate_cb(struct radeon_cs_parser *p, int i)
 	case V_0280A0_ARRAY_2D_TILED_THIN1:
 		break;
 	default:
-		dev_warn(p->dev, "%s invalid tiling %d for %d (0x%08X)\n", __func__,
-			G_0280A0_ARRAY_MODE(track->cb_color_info[i]), i,
-			track->cb_color_info[i]);
+		dev_warn_once(p->dev, "%s invalid tiling %d for %d (0x%08X)\n", __func__,
+			      G_0280A0_ARRAY_MODE(track->cb_color_info[i]), i,
+			      track->cb_color_info[i]);
 		return -EINVAL;
 	}
 
 	if (!IS_ALIGNED(pitch, pitch_align)) {
-		dev_warn(p->dev, "%s:%d cb pitch (%d, 0x%x, %d) invalid\n",
-			 __func__, __LINE__, pitch, pitch_align, array_mode);
+		dev_warn_once(p->dev, "%s:%d cb pitch (%d, 0x%x, %d) invalid\n",
+			      __func__, __LINE__, pitch, pitch_align, array_mode);
 		return -EINVAL;
 	}
 	if (!IS_ALIGNED(height, height_align)) {
-		dev_warn(p->dev, "%s:%d cb height (%d, 0x%x, %d) invalid\n",
-			 __func__, __LINE__, height, height_align, array_mode);
+		dev_warn_once(p->dev, "%s:%d cb height (%d, 0x%x, %d) invalid\n",
+			      __func__, __LINE__, height, height_align, array_mode);
 		return -EINVAL;
 	}
 	if (!IS_ALIGNED(base_offset, base_align)) {
-		dev_warn(p->dev, "%s offset[%d] 0x%llx 0x%llx, %d not aligned\n", __func__, i,
-			 base_offset, base_align, array_mode);
+		dev_warn_once(p->dev,
+			      "%s offset[%d] 0x%llx 0x%llx, %d not aligned\n", __func__, i,
+			      base_offset, base_align, array_mode);
 		return -EINVAL;
 	}
 
@@ -447,13 +448,14 @@ static int r600_cs_track_validate_cb(struct radeon_cs_parser *p, int i)
 			 * broken userspace.
 			 */
 		} else {
-			dev_warn(p->dev, "%s offset[%d] %d %llu %d %lu too big (%d %d) (%d %d %d)\n",
-				 __func__, i, array_mode,
-				 track->cb_color_bo_offset[i], tmp,
-				 radeon_bo_size(track->cb_color_bo[i]),
-				 pitch, height, r600_fmt_get_nblocksx(format, pitch),
-				 r600_fmt_get_nblocksy(format, height),
-				 r600_fmt_get_blocksize(format));
+			dev_warn_once(p->dev,
+				      "%s offset[%d] %d %llu %d %lu too big (%d %d) (%d %d %d)\n",
+				      __func__, i, array_mode,
+				      track->cb_color_bo_offset[i], tmp,
+				      radeon_bo_size(track->cb_color_bo[i]),
+				      pitch, height, r600_fmt_get_nblocksx(format, pitch),
+				      r600_fmt_get_nblocksy(format, height),
+				      r600_fmt_get_blocksize(format));
 			return -EINVAL;
 		}
 	}
@@ -478,11 +480,11 @@ static int r600_cs_track_validate_cb(struct radeon_cs_parser *p, int i)
 
 			if (bytes + track->cb_color_frag_offset[i] >
 			    radeon_bo_size(track->cb_color_frag_bo[i])) {
-				dev_warn(p->dev, "%s FMASK_TILE_MAX too large "
-					 "(tile_max=%u, bytes=%u, offset=%llu, bo_size=%lu)\n",
-					 __func__, tile_max, bytes,
-					 track->cb_color_frag_offset[i],
-					 radeon_bo_size(track->cb_color_frag_bo[i]));
+				dev_warn_once(p->dev, "%s FMASK_TILE_MAX too large "
+					      "(tile_max=%u, bytes=%u, offset=%llu, bo_size=%lu)\n",
+					      __func__, tile_max, bytes,
+					      track->cb_color_frag_offset[i],
+					      radeon_bo_size(track->cb_color_frag_bo[i]));
 				return -EINVAL;
 			}
 		}
@@ -496,17 +498,17 @@ static int r600_cs_track_validate_cb(struct radeon_cs_parser *p, int i)
 
 		if (bytes + track->cb_color_tile_offset[i] >
 		    radeon_bo_size(track->cb_color_tile_bo[i])) {
-			dev_warn(p->dev, "%s CMASK_BLOCK_MAX too large "
-				 "(block_max=%u, bytes=%u, offset=%llu, bo_size=%lu)\n",
-				 __func__, block_max, bytes,
-				 track->cb_color_tile_offset[i],
-				 radeon_bo_size(track->cb_color_tile_bo[i]));
+			dev_warn_once(p->dev, "%s CMASK_BLOCK_MAX too large "
+				      "(block_max=%u, bytes=%u, offset=%llu, bo_size=%lu)\n",
+				      __func__, block_max, bytes,
+				      track->cb_color_tile_offset[i],
+				      radeon_bo_size(track->cb_color_tile_bo[i]));
 			return -EINVAL;
 		}
 		break;
 	}
 	default:
-		dev_warn(p->dev, "%s invalid tile mode\n", __func__);
+		dev_warn_once(p->dev, "%s invalid tile mode\n", __func__);
 		return -EINVAL;
 	}
 	return 0;
@@ -526,7 +528,7 @@ static int r600_cs_track_validate_db(struct radeon_cs_parser *p)
 
 
 	if (track->db_bo == NULL) {
-		dev_warn(p->dev, "z/stencil with no depth buffer\n");
+		dev_warn_once(p->dev, "z/stencil with no depth buffer\n");
 		return -EINVAL;
 	}
 	switch (G_028010_FORMAT(track->db_depth_info)) {
@@ -544,20 +546,22 @@ static int r600_cs_track_validate_db(struct radeon_cs_parser *p)
 		bpe = 8;
 		break;
 	default:
-		dev_warn(p->dev, "z/stencil with invalid format %d\n", G_028010_FORMAT(track->db_depth_info));
+		dev_warn_once(p->dev,
+			      "z/stencil with invalid format %d\n",
+			      G_028010_FORMAT(track->db_depth_info));
 		return -EINVAL;
 	}
 	if ((track->db_depth_size & 0xFFFFFC00) == 0xFFFFFC00) {
 		if (!track->db_depth_size_idx) {
-			dev_warn(p->dev, "z/stencil buffer size not set\n");
+			dev_warn_once(p->dev, "z/stencil buffer size not set\n");
 			return -EINVAL;
 		}
 		tmp = radeon_bo_size(track->db_bo) - track->db_offset;
 		tmp = (tmp / bpe) >> 6;
 		if (!tmp) {
-			dev_warn(p->dev, "z/stencil buffer too small (0x%08X %d %d %ld)\n",
-					track->db_depth_size, bpe, track->db_offset,
-					radeon_bo_size(track->db_bo));
+			dev_warn_once(p->dev, "z/stencil buffer too small (0x%08X %d %d %ld)\n",
+				      track->db_depth_size, bpe, track->db_offset,
+				      radeon_bo_size(track->db_bo));
 			return -EINVAL;
 		}
 		ib[track->db_depth_size_idx] = S_028000_SLICE_TILE_MAX(tmp - 1) | (track->db_depth_size & 0x3FF);
@@ -579,9 +583,9 @@ static int r600_cs_track_validate_db(struct radeon_cs_parser *p)
 		array_check.blocksize = bpe;
 		if (r600_get_array_mode_alignment(&array_check,
 					&pitch_align, &height_align, &depth_align, &base_align)) {
-			dev_warn(p->dev, "%s invalid tiling %d (0x%08X)\n", __func__,
-					G_028010_ARRAY_MODE(track->db_depth_info),
-					track->db_depth_info);
+			dev_warn_once(p->dev, "%s invalid tiling %d (0x%08X)\n", __func__,
+				      G_028010_ARRAY_MODE(track->db_depth_info),
+				      track->db_depth_info);
 			return -EINVAL;
 		}
 		switch (array_mode) {
@@ -592,24 +596,24 @@ static int r600_cs_track_validate_db(struct radeon_cs_parser *p)
 		case V_028010_ARRAY_2D_TILED_THIN1:
 			break;
 		default:
-			dev_warn(p->dev, "%s invalid tiling %d (0x%08X)\n", __func__,
-					G_028010_ARRAY_MODE(track->db_depth_info),
-					track->db_depth_info);
+			dev_warn_once(p->dev, "%s invalid tiling %d (0x%08X)\n", __func__,
+				      G_028010_ARRAY_MODE(track->db_depth_info),
+				      track->db_depth_info);
 			return -EINVAL;
 		}
 
 		if (!IS_ALIGNED(pitch, pitch_align)) {
-			dev_warn(p->dev, "%s:%d db pitch (%d, 0x%x, %d) invalid\n",
+			dev_warn_once(p->dev, "%s:%d db pitch (%d, 0x%x, %d) invalid\n",
 					__func__, __LINE__, pitch, pitch_align, array_mode);
 			return -EINVAL;
 		}
 		if (!IS_ALIGNED(height, height_align)) {
-			dev_warn(p->dev, "%s:%d db height (%d, 0x%x, %d) invalid\n",
+			dev_warn_once(p->dev, "%s:%d db height (%d, 0x%x, %d) invalid\n",
 					__func__, __LINE__, height, height_align, array_mode);
 			return -EINVAL;
 		}
 		if (!IS_ALIGNED(base_offset, base_align)) {
-			dev_warn(p->dev, "%s offset 0x%llx, 0x%llx, %d not aligned\n", __func__,
+			dev_warn_once(p->dev, "%s offset 0x%llx, 0x%llx, %d not aligned\n", __func__,
 					base_offset, base_align, array_mode);
 			return -EINVAL;
 		}
@@ -618,10 +622,11 @@ static int r600_cs_track_validate_db(struct radeon_cs_parser *p)
 		nviews = G_028004_SLICE_MAX(track->db_depth_view) + 1;
 		tmp = ntiles * bpe * 64 * nviews * track->nsamples;
 		if ((tmp + track->db_offset) > radeon_bo_size(track->db_bo)) {
-			dev_warn(p->dev, "z/stencil buffer (%d) too small (0x%08X %d %d %d -> %u have %lu)\n",
-					array_mode,
-					track->db_depth_size, ntiles, nviews, bpe, tmp + track->db_offset,
-					radeon_bo_size(track->db_bo));
+			dev_warn_once(p->dev,
+				      "z/stencil buffer (%d) too small (0x%08X %d %d %d -> %u have %lu)\n",
+				      array_mode,
+				      track->db_depth_size, ntiles, nviews, bpe, tmp + track->db_offset,
+				      radeon_bo_size(track->db_bo));
 			return -EINVAL;
 		}
 	}
@@ -632,13 +637,13 @@ static int r600_cs_track_validate_db(struct radeon_cs_parser *p)
 		unsigned nbx, nby;
 
 		if (track->htile_bo == NULL) {
-			dev_warn(p->dev, "%s:%d htile enabled without htile surface 0x%08x\n",
-				 __func__, __LINE__, track->db_depth_info);
+			dev_warn_once(p->dev, "%s:%d htile enabled without htile surface 0x%08x\n",
+				      __func__, __LINE__, track->db_depth_info);
 			return -EINVAL;
 		}
 		if ((track->db_depth_size & 0xFFFFFC00) == 0xFFFFFC00) {
-			dev_warn(p->dev, "%s:%d htile can't be enabled with bogus db_depth_size 0x%08x\n",
-				 __func__, __LINE__, track->db_depth_size);
+			dev_warn_once(p->dev, "%s:%d htile can't be enabled with bogus db_depth_size 0x%08x\n",
+				      __func__, __LINE__, track->db_depth_size);
 			return -EINVAL;
 		}
 
@@ -676,8 +681,8 @@ static int r600_cs_track_validate_db(struct radeon_cs_parser *p)
 				nby = round_up(nby, 16 * 8);
 				break;
 			default:
-				dev_warn(p->dev, "%s:%d invalid num pipes %d\n",
-					 __func__, __LINE__, track->npipes);
+				dev_warn_once(p->dev, "%s:%d invalid num pipes %d\n",
+					      __func__, __LINE__, track->npipes);
 				return -EINVAL;
 			}
 		}
@@ -689,9 +694,9 @@ static int r600_cs_track_validate_db(struct radeon_cs_parser *p)
 		size += track->htile_offset;
 
 		if (size > radeon_bo_size(track->htile_bo)) {
-			dev_warn(p->dev, "%s:%d htile surface too small %ld for %ld (%d %d)\n",
-				 __func__, __LINE__, radeon_bo_size(track->htile_bo),
-				 size, nbx, nby);
+			dev_warn_once(p->dev, "%s:%d htile surface too small %ld for %ld (%d %d)\n",
+				      __func__, __LINE__, radeon_bo_size(track->htile_bo),
+				      size, nbx, nby);
 			return -EINVAL;
 		}
 	}
@@ -718,13 +723,13 @@ static int r600_cs_track_check(struct radeon_cs_parser *p)
 					u64 offset = (u64)track->vgt_strmout_bo_offset[i] +
 						(u64)track->vgt_strmout_size[i];
 					if (offset > radeon_bo_size(track->vgt_strmout_bo[i])) {
-						DRM_ERROR("streamout %d bo too small: 0x%llx, 0x%lx\n",
-							  i, offset,
-							  radeon_bo_size(track->vgt_strmout_bo[i]));
+						dev_warn_once(p->dev, "streamout %d bo too small: 0x%llx, 0x%lx\n",
+							      i, offset,
+							      radeon_bo_size(track->vgt_strmout_bo[i]));
 						return -EINVAL;
 					}
 				} else {
-					dev_warn(p->dev, "No buffer for streamout %d\n", i);
+					dev_warn_once(p->dev, "No buffer for streamout %d\n", i);
 					return -EINVAL;
 				}
 			}
@@ -753,8 +758,8 @@ static int r600_cs_track_check(struct radeon_cs_parser *p)
 			    (tmp >> (i * 4)) & 0xF) {
 				/* at least one component is enabled */
 				if (track->cb_color_bo[i] == NULL) {
-					dev_warn(p->dev, "%s:%d mask 0x%08X | 0x%08X no cb for %d\n",
-						__func__, __LINE__, track->cb_target_mask, track->cb_shader_mask, i);
+					dev_warn_once(p->dev, "%s:%d mask 0x%08X | 0x%08X no cb for %d\n",
+						      __func__, __LINE__, track->cb_target_mask, track->cb_shader_mask, i);
 					return -EINVAL;
 				}
 				/* perform rewrite of CB_COLOR[0-7]_SIZE */
@@ -841,33 +846,33 @@ int r600_cs_common_vline_parse(struct radeon_cs_parser *p,
 	/* check its a WAIT_REG_MEM */
 	if (wait_reg_mem.type != RADEON_PACKET_TYPE3 ||
 	    wait_reg_mem.opcode != PACKET3_WAIT_REG_MEM) {
-		DRM_ERROR("vline wait missing WAIT_REG_MEM segment\n");
+		dev_warn_once(p->dev, "vline wait missing WAIT_REG_MEM segment\n");
 		return -EINVAL;
 	}
 
 	wait_reg_mem_info = radeon_get_ib_value(p, wait_reg_mem.idx + 1);
 	/* bit 4 is reg (0) or mem (1) */
 	if (wait_reg_mem_info & 0x10) {
-		DRM_ERROR("vline WAIT_REG_MEM waiting on MEM instead of REG\n");
+		dev_warn_once(p->dev, "vline WAIT_REG_MEM waiting on MEM instead of REG\n");
 		return -EINVAL;
 	}
 	/* bit 8 is me (0) or pfp (1) */
 	if (wait_reg_mem_info & 0x100) {
-		DRM_ERROR("vline WAIT_REG_MEM waiting on PFP instead of ME\n");
+		dev_warn_once(p->dev, "vline WAIT_REG_MEM waiting on PFP instead of ME\n");
 		return -EINVAL;
 	}
 	/* waiting for value to be equal */
 	if ((wait_reg_mem_info & 0x7) != 0x3) {
-		DRM_ERROR("vline WAIT_REG_MEM function not equal\n");
+		dev_warn_once(p->dev, "vline WAIT_REG_MEM function not equal\n");
 		return -EINVAL;
 	}
 	if ((radeon_get_ib_value(p, wait_reg_mem.idx + 2) << 2) != vline_status[0]) {
-		DRM_ERROR("vline WAIT_REG_MEM bad reg\n");
+		dev_warn_once(p->dev, "vline WAIT_REG_MEM bad reg\n");
 		return -EINVAL;
 	}
 
 	if (radeon_get_ib_value(p, wait_reg_mem.idx + 5) != RADEON_VLINE_STAT) {
-		DRM_ERROR("vline WAIT_REG_MEM bad bit mask\n");
+		dev_warn_once(p->dev, "vline WAIT_REG_MEM bad bit mask\n");
 		return -EINVAL;
 	}
 
@@ -886,7 +891,7 @@ int r600_cs_common_vline_parse(struct radeon_cs_parser *p,
 
 	crtc = drm_crtc_find(rdev_to_drm(p->rdev), p->filp, crtc_id);
 	if (!crtc) {
-		DRM_ERROR("cannot find crtc %d\n", crtc_id);
+		dev_warn_once(p->dev, "cannot find crtc %d\n", crtc_id);
 		return -ENOENT;
 	}
 	radeon_crtc = to_radeon_crtc(crtc);
@@ -907,7 +912,7 @@ int r600_cs_common_vline_parse(struct radeon_cs_parser *p,
 		ib[h_idx] = header;
 		ib[h_idx + 4] = vline_status[crtc_id] >> 2;
 	} else {
-		DRM_ERROR("unknown crtc reloc\n");
+		dev_warn_once(p->dev, "unknown crtc reloc\n");
 		return -EINVAL;
 	}
 	return 0;
@@ -923,8 +928,8 @@ static int r600_packet0_check(struct radeon_cs_parser *p,
 	case AVIVO_D1MODE_VLINE_START_END:
 		r = r600_cs_packet_parse_vline(p);
 		if (r) {
-			DRM_ERROR("No reloc for ib[%d]=0x%04X\n",
-					idx, reg);
+			dev_warn_once(p->dev, "No reloc for ib[%d]=0x%04X\n",
+				      idx, reg);
 			return r;
 		}
 		break;
@@ -972,7 +977,7 @@ static int r600_cs_check_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 
 	i = (reg >> 7);
 	if (i >= ARRAY_SIZE(r600_reg_safe_bm)) {
-		dev_warn(p->dev, "forbidden register 0x%08x at %d\n", reg, idx);
+		dev_warn_once(p->dev, "forbidden register 0x%08x at %d\n", reg, idx);
 		return -EINVAL;
 	}
 	m = 1 << ((reg >> 2) & 31);
@@ -1013,8 +1018,8 @@ static int r600_cs_check_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case SQ_VSTMP_RING_BASE:
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		ib[idx] += (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
@@ -1031,8 +1036,8 @@ static int r600_cs_check_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 		    radeon_cs_packet_next_is_pkt3_nop(p)) {
 			r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 			if (r) {
-				dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					 "0x%04X\n", reg);
+				dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+					      "0x%04X\n", reg);
 				return -EINVAL;
 			}
 			track->db_depth_info = radeon_get_ib_value(p, idx);
@@ -1073,8 +1078,8 @@ static int r600_cs_check_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case VGT_STRMOUT_BUFFER_BASE_3:
 		r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		tmp = (reg - VGT_STRMOUT_BUFFER_BASE_0) / 16;
@@ -1096,8 +1101,8 @@ static int r600_cs_check_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case CP_COHER_BASE:
 		r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 		if (r) {
-			dev_warn(p->dev, "missing reloc for CP_COHER_BASE "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "missing reloc for CP_COHER_BASE "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		ib[idx] += (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
@@ -1270,8 +1275,8 @@ static int r600_cs_check_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case CB_COLOR7_BASE:
 		r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		tmp = (reg - CB_COLOR0_BASE) / 4;
@@ -1285,8 +1290,8 @@ static int r600_cs_check_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case DB_DEPTH_BASE:
 		r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		track->db_offset = radeon_get_ib_value(p, idx) << 8;
@@ -1298,8 +1303,8 @@ static int r600_cs_check_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case DB_HTILE_DATA_BASE:
 		r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		track->htile_offset = (u64)radeon_get_ib_value(p, idx) << 8;
@@ -1368,8 +1373,8 @@ static int r600_cs_check_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case SQ_ALU_CONST_CACHE_VS_15:
 		r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONTEXT_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONTEXT_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		ib[idx] += (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
@@ -1377,8 +1382,8 @@ static int r600_cs_check_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 	case SX_MEMORY_EXPORT_BASE:
 		r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 		if (r) {
-			dev_warn(p->dev, "bad SET_CONFIG_REG "
-					"0x%04X\n", reg);
+			dev_warn_once(p->dev, "bad SET_CONFIG_REG "
+				      "0x%04X\n", reg);
 			return -EINVAL;
 		}
 		ib[idx] += (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
@@ -1387,7 +1392,7 @@ static int r600_cs_check_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 		track->sx_misc_kill_all_prims = (radeon_get_ib_value(p, idx) & 0x1) != 0;
 		break;
 	default:
-		dev_warn(p->dev, "forbidden register 0x%08x at %d\n", reg, idx);
+		dev_warn_once(p->dev, "forbidden register 0x%08x at %d\n", reg, idx);
 		return -EINVAL;
 	}
 	return 0;
@@ -1543,43 +1548,43 @@ static int r600_check_texture_resource(struct radeon_cs_parser *p,  u32 idx,
 		llevel = 0;
 		break;
 	default:
-		dev_warn(p->dev, "this kernel doesn't support %d texture dim\n", G_038000_DIM(word0));
+		dev_warn_once(p->dev, "this kernel doesn't support %d texture dim\n", G_038000_DIM(word0));
 		return -EINVAL;
 	}
 	if (!r600_fmt_is_valid_texture(format, p->family)) {
-		dev_warn(p->dev, "%s:%d texture invalid format %d\n",
-			 __func__, __LINE__, format);
+		dev_warn_once(p->dev, "%s:%d texture invalid format %d\n",
+			      __func__, __LINE__, format);
 		return -EINVAL;
 	}
 
 	if (r600_get_array_mode_alignment(&array_check,
 					  &pitch_align, &height_align, &depth_align, &base_align)) {
-		dev_warn(p->dev, "%s:%d tex array mode (%d) invalid\n",
-			 __func__, __LINE__, G_038000_TILE_MODE(word0));
+		dev_warn_once(p->dev, "%s:%d tex array mode (%d) invalid\n",
+			      __func__, __LINE__, G_038000_TILE_MODE(word0));
 		return -EINVAL;
 	}
 
 	/* XXX check height as well... */
 
 	if (!IS_ALIGNED(pitch, pitch_align)) {
-		dev_warn(p->dev, "%s:%d tex pitch (%d, 0x%x, %d) invalid\n",
-			 __func__, __LINE__, pitch, pitch_align, G_038000_TILE_MODE(word0));
+		dev_warn_once(p->dev, "%s:%d tex pitch (%d, 0x%x, %d) invalid\n",
+			      __func__, __LINE__, pitch, pitch_align, G_038000_TILE_MODE(word0));
 		return -EINVAL;
 	}
 	if (!IS_ALIGNED(base_offset, base_align)) {
-		dev_warn(p->dev, "%s:%d tex base offset (0x%llx, 0x%llx, %d) invalid\n",
-			 __func__, __LINE__, base_offset, base_align, G_038000_TILE_MODE(word0));
+		dev_warn_once(p->dev, "%s:%d tex base offset (0x%llx, 0x%llx, %d) invalid\n",
+			      __func__, __LINE__, base_offset, base_align, G_038000_TILE_MODE(word0));
 		return -EINVAL;
 	}
 	if (!IS_ALIGNED(mip_offset, base_align)) {
-		dev_warn(p->dev, "%s:%d tex mip offset (0x%llx, 0x%llx, %d) invalid\n",
-			 __func__, __LINE__, mip_offset, base_align, G_038000_TILE_MODE(word0));
+		dev_warn_once(p->dev, "%s:%d tex mip offset (0x%llx, 0x%llx, %d) invalid\n",
+			      __func__, __LINE__, mip_offset, base_align, G_038000_TILE_MODE(word0));
 		return -EINVAL;
 	}
 
 	if (blevel > llevel) {
-		dev_warn(p->dev, "texture blevel %d > llevel %d\n",
-			 blevel, llevel);
+		dev_warn_once(p->dev, "texture blevel %d > llevel %d\n",
+			      blevel, llevel);
 	}
 	if (is_array) {
 		barray = G_038014_BASE_ARRAY(word5);
@@ -1592,16 +1597,16 @@ static int r600_check_texture_resource(struct radeon_cs_parser *p,  u32 idx,
 			  &l0_size, &mipmap_size);
 	/* using get ib will give us the offset into the texture bo */
 	if ((l0_size + word2) > radeon_bo_size(texture)) {
-		dev_warn(p->dev, "texture bo too small ((%d %d) (%d %d) %d %d %d -> %d have %ld)\n",
-			 w0, h0, pitch_align, height_align,
-			 array_check.array_mode, format, word2,
-			 l0_size, radeon_bo_size(texture));
-		dev_warn(p->dev, "alignments %d %d %d %lld\n", pitch, pitch_align, height_align, base_align);
+		dev_warn_once(p->dev, "texture bo too small ((%d %d) (%d %d) %d %d %d -> %d have %ld)\n",
+			      w0, h0, pitch_align, height_align,
+			      array_check.array_mode, format, word2,
+			      l0_size, radeon_bo_size(texture));
+		dev_warn_once(p->dev, "alignments %d %d %d %lld\n", pitch, pitch_align, height_align, base_align);
 		return -EINVAL;
 	}
 	/* using get ib will give us the offset into the mipmap bo */
 	if ((mipmap_size + word3) > radeon_bo_size(mipmap)) {
-		/*dev_warn(p->dev, "mipmap bo too small (%d %d %d %d %d %d -> %d have %ld)\n",
+		/*dev_warn_once(p->dev, "mipmap bo too small (%d %d %d %d %d %d -> %d have %ld)\n",
 		  w0, h0, format, blevel, nlevels, word3, mipmap_size, radeon_bo_size(texture));*/
 	}
 	return 0;
@@ -1613,13 +1618,13 @@ static bool r600_is_safe_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
 
 	i = (reg >> 7);
 	if (i >= ARRAY_SIZE(r600_reg_safe_bm)) {
-		dev_warn(p->dev, "forbidden register 0x%08x at %d\n", reg, idx);
+		dev_warn_once(p->dev, "forbidden register 0x%08x at %d\n", reg, idx);
 		return false;
 	}
 	m = 1 << ((reg >> 2) & 31);
 	if (!(r600_reg_safe_bm[i] & m))
 		return true;
-	dev_warn(p->dev, "forbidden register 0x%08x at %d\n", reg, idx);
+	dev_warn_once(p->dev, "forbidden register 0x%08x at %d\n", reg, idx);
 	return false;
 }
 
@@ -1648,7 +1653,7 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 		uint64_t offset;
 
 		if (pkt->count != 1) {
-			DRM_ERROR("bad SET PREDICATION\n");
+			dev_warn_once(p->dev, "bad SET PREDICATION\n");
 			return -EINVAL;
 		}
 
@@ -1660,13 +1665,13 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 			return 0;
 
 		if (pred_op > 2) {
-			DRM_ERROR("bad SET PREDICATION operation %d\n", pred_op);
+			dev_warn_once(p->dev, "bad SET PREDICATION operation %d\n", pred_op);
 			return -EINVAL;
 		}
 
 		r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 		if (r) {
-			DRM_ERROR("bad SET PREDICATION\n");
+			dev_warn_once(p->dev, "bad SET PREDICATION\n");
 			return -EINVAL;
 		}
 
@@ -1681,20 +1686,20 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 
 	case PACKET3_START_3D_CMDBUF:
 		if (p->family >= CHIP_RV770 || pkt->count) {
-			DRM_ERROR("bad START_3D\n");
+			dev_warn_once(p->dev, "bad START_3D\n");
 			return -EINVAL;
 		}
 		break;
 	case PACKET3_CONTEXT_CONTROL:
 		if (pkt->count != 1) {
-			DRM_ERROR("bad CONTEXT_CONTROL\n");
+			dev_warn_once(p->dev, "bad CONTEXT_CONTROL\n");
 			return -EINVAL;
 		}
 		break;
 	case PACKET3_INDEX_TYPE:
 	case PACKET3_NUM_INSTANCES:
 		if (pkt->count) {
-			DRM_ERROR("bad INDEX_TYPE/NUM_INSTANCES\n");
+			dev_warn_once(p->dev, "bad INDEX_TYPE/NUM_INSTANCES\n");
 			return -EINVAL;
 		}
 		break;
@@ -1702,12 +1707,12 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 	{
 		uint64_t offset;
 		if (pkt->count != 3) {
-			DRM_ERROR("bad DRAW_INDEX\n");
+			dev_warn_once(p->dev, "bad DRAW_INDEX\n");
 			return -EINVAL;
 		}
 		r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 		if (r) {
-			DRM_ERROR("bad DRAW_INDEX\n");
+			dev_warn_once(p->dev, "bad DRAW_INDEX\n");
 			return -EINVAL;
 		}
 
@@ -1720,37 +1725,37 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 
 		r = r600_cs_track_check(p);
 		if (r) {
-			dev_warn(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
+			dev_warn_once(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
 			return r;
 		}
 		break;
 	}
 	case PACKET3_DRAW_INDEX_AUTO:
 		if (pkt->count != 1) {
-			DRM_ERROR("bad DRAW_INDEX_AUTO\n");
+			dev_warn_once(p->dev, "bad DRAW_INDEX_AUTO\n");
 			return -EINVAL;
 		}
 		r = r600_cs_track_check(p);
 		if (r) {
-			dev_warn(p->dev, "%s:%d invalid cmd stream %d\n", __func__, __LINE__, idx);
+			dev_warn_once(p->dev, "%s:%d invalid cmd stream %d\n", __func__, __LINE__, idx);
 			return r;
 		}
 		break;
 	case PACKET3_DRAW_INDEX_IMMD_BE:
 	case PACKET3_DRAW_INDEX_IMMD:
 		if (pkt->count < 2) {
-			DRM_ERROR("bad DRAW_INDEX_IMMD\n");
+			dev_warn_once(p->dev, "bad DRAW_INDEX_IMMD\n");
 			return -EINVAL;
 		}
 		r = r600_cs_track_check(p);
 		if (r) {
-			dev_warn(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
+			dev_warn_once(p->dev, "%s:%d invalid cmd stream\n", __func__, __LINE__);
 			return r;
 		}
 		break;
 	case PACKET3_WAIT_REG_MEM:
 		if (pkt->count != 5) {
-			DRM_ERROR("bad WAIT_REG_MEM\n");
+			dev_warn_once(p->dev, "bad WAIT_REG_MEM\n");
 			return -EINVAL;
 		}
 		/* bit 4 is reg (0) or mem (1) */
@@ -1759,7 +1764,7 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 
 			r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 			if (r) {
-				DRM_ERROR("bad WAIT_REG_MEM\n");
+				dev_warn_once(p->dev, "bad WAIT_REG_MEM\n");
 				return -EINVAL;
 			}
 
@@ -1770,7 +1775,7 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 			ib[idx+1] = (ib[idx+1] & 0x3) | (offset & 0xfffffff0);
 			ib[idx+2] = upper_32_bits(offset) & 0xff;
 		} else if (idx_value & 0x100) {
-			DRM_ERROR("cannot use PFP on REG wait\n");
+			dev_warn_once(p->dev, "cannot use PFP on REG wait\n");
 			return -EINVAL;
 		}
 		break;
@@ -1779,24 +1784,24 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 		u32 command, size;
 		u64 offset, tmp;
 		if (pkt->count != 4) {
-			DRM_ERROR("bad CP DMA\n");
+			dev_warn_once(p->dev, "bad CP DMA\n");
 			return -EINVAL;
 		}
 		command = radeon_get_ib_value(p, idx+4);
 		size = command & 0x1fffff;
 		if (command & PACKET3_CP_DMA_CMD_SAS) {
 			/* src address space is register */
-			DRM_ERROR("CP DMA SAS not supported\n");
+			dev_warn_once(p->dev, "CP DMA SAS not supported\n");
 			return -EINVAL;
 		} else {
 			if (command & PACKET3_CP_DMA_CMD_SAIC) {
-				DRM_ERROR("CP DMA SAIC only supported for registers\n");
+				dev_warn_once(p->dev, "CP DMA SAIC only supported for registers\n");
 				return -EINVAL;
 			}
 			/* src address space is memory */
 			r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 			if (r) {
-				DRM_ERROR("bad CP DMA SRC\n");
+				dev_warn_once(p->dev, "bad CP DMA SRC\n");
 				return -EINVAL;
 			}
 
@@ -1806,8 +1811,8 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 			offset = reloc->gpu_offset + tmp;
 
 			if ((tmp + size) > radeon_bo_size(reloc->robj)) {
-				dev_warn(p->dev, "CP DMA src buffer too small (%llu %lu)\n",
-					 tmp + size, radeon_bo_size(reloc->robj));
+				dev_warn_once(p->dev, "CP DMA src buffer too small (%llu %lu)\n",
+					      tmp + size, radeon_bo_size(reloc->robj));
 				return -EINVAL;
 			}
 
@@ -1816,17 +1821,17 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 		}
 		if (command & PACKET3_CP_DMA_CMD_DAS) {
 			/* dst address space is register */
-			DRM_ERROR("CP DMA DAS not supported\n");
+			dev_warn_once(p->dev, "CP DMA DAS not supported\n");
 			return -EINVAL;
 		} else {
 			/* dst address space is memory */
 			if (command & PACKET3_CP_DMA_CMD_DAIC) {
-				DRM_ERROR("CP DMA DAIC only supported for registers\n");
+				dev_warn_once(p->dev, "CP DMA DAIC only supported for registers\n");
 				return -EINVAL;
 			}
 			r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 			if (r) {
-				DRM_ERROR("bad CP DMA DST\n");
+				dev_warn_once(p->dev, "bad CP DMA DST\n");
 				return -EINVAL;
 			}
 
@@ -1836,8 +1841,8 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 			offset = reloc->gpu_offset + tmp;
 
 			if ((tmp + size) > radeon_bo_size(reloc->robj)) {
-				dev_warn(p->dev, "CP DMA dst buffer too small (%llu %lu)\n",
-					 tmp + size, radeon_bo_size(reloc->robj));
+				dev_warn_once(p->dev, "CP DMA dst buffer too small (%llu %lu)\n",
+					      tmp + size, radeon_bo_size(reloc->robj));
 				return -EINVAL;
 			}
 
@@ -1848,7 +1853,7 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 	}
 	case PACKET3_SURFACE_SYNC:
 		if (pkt->count != 3) {
-			DRM_ERROR("bad SURFACE_SYNC\n");
+			dev_warn_once(p->dev, "bad SURFACE_SYNC\n");
 			return -EINVAL;
 		}
 		/* 0xffffffff/0x0 is flush all cache flag */
@@ -1856,7 +1861,7 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 		    radeon_get_ib_value(p, idx + 2) != 0) {
 			r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 			if (r) {
-				DRM_ERROR("bad SURFACE_SYNC\n");
+				dev_warn_once(p->dev, "bad SURFACE_SYNC\n");
 				return -EINVAL;
 			}
 			ib[idx+2] += (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
@@ -1864,7 +1869,7 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 		break;
 	case PACKET3_EVENT_WRITE:
 		if (pkt->count != 2 && pkt->count != 0) {
-			DRM_ERROR("bad EVENT_WRITE\n");
+			dev_warn_once(p->dev, "bad EVENT_WRITE\n");
 			return -EINVAL;
 		}
 		if (pkt->count) {
@@ -1872,7 +1877,7 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 
 			r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 			if (r) {
-				DRM_ERROR("bad EVENT_WRITE\n");
+				dev_warn_once(p->dev, "bad EVENT_WRITE\n");
 				return -EINVAL;
 			}
 			offset = reloc->gpu_offset +
@@ -1888,12 +1893,12 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 		uint64_t offset;
 
 		if (pkt->count != 4) {
-			DRM_ERROR("bad EVENT_WRITE_EOP\n");
+			dev_warn_once(p->dev, "bad EVENT_WRITE_EOP\n");
 			return -EINVAL;
 		}
 		r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 		if (r) {
-			DRM_ERROR("bad EVENT_WRITE\n");
+			dev_warn_once(p->dev, "bad EVENT_WRITE\n");
 			return -EINVAL;
 		}
 
@@ -1911,7 +1916,7 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 		if ((start_reg < PACKET3_SET_CONFIG_REG_OFFSET) ||
 		    (start_reg >= PACKET3_SET_CONFIG_REG_END) ||
 		    (end_reg >= PACKET3_SET_CONFIG_REG_END)) {
-			DRM_ERROR("bad PACKET3_SET_CONFIG_REG\n");
+			dev_warn_once(p->dev, "bad PACKET3_SET_CONFIG_REG\n");
 			return -EINVAL;
 		}
 		for (i = 0; i < pkt->count; i++) {
@@ -1927,7 +1932,7 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 		if ((start_reg < PACKET3_SET_CONTEXT_REG_OFFSET) ||
 		    (start_reg >= PACKET3_SET_CONTEXT_REG_END) ||
 		    (end_reg >= PACKET3_SET_CONTEXT_REG_END)) {
-			DRM_ERROR("bad PACKET3_SET_CONTEXT_REG\n");
+			dev_warn_once(p->dev, "bad PACKET3_SET_CONTEXT_REG\n");
 			return -EINVAL;
 		}
 		for (i = 0; i < pkt->count; i++) {
@@ -1939,7 +1944,7 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 		break;
 	case PACKET3_SET_RESOURCE:
 		if (pkt->count % 7) {
-			DRM_ERROR("bad SET_RESOURCE\n");
+			dev_warn_once(p->dev, "bad SET_RESOURCE\n");
 			return -EINVAL;
 		}
 		start_reg = (idx_value << 2) + PACKET3_SET_RESOURCE_OFFSET;
@@ -1947,7 +1952,7 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 		if ((start_reg < PACKET3_SET_RESOURCE_OFFSET) ||
 		    (start_reg >= PACKET3_SET_RESOURCE_END) ||
 		    (end_reg >= PACKET3_SET_RESOURCE_END)) {
-			DRM_ERROR("bad SET_RESOURCE\n");
+			dev_warn_once(p->dev, "bad SET_RESOURCE\n");
 			return -EINVAL;
 		}
 		for (i = 0; i < (pkt->count / 7); i++) {
@@ -1959,7 +1964,7 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 				/* tex base */
 				r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 				if (r) {
-					DRM_ERROR("bad SET_RESOURCE\n");
+					dev_warn_once(p->dev, "bad SET_RESOURCE\n");
 					return -EINVAL;
 				}
 				base_offset = (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
@@ -1973,7 +1978,7 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 				/* tex mip base */
 				r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 				if (r) {
-					DRM_ERROR("bad SET_RESOURCE\n");
+					dev_warn_once(p->dev, "bad SET_RESOURCE\n");
 					return -EINVAL;
 				}
 				mip_offset = (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
@@ -1994,15 +1999,15 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 				/* vtx base */
 				r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 				if (r) {
-					DRM_ERROR("bad SET_RESOURCE\n");
+					dev_warn_once(p->dev, "bad SET_RESOURCE\n");
 					return -EINVAL;
 				}
 				offset = radeon_get_ib_value(p, idx+1+(i*7)+0);
 				size = radeon_get_ib_value(p, idx+1+(i*7)+1) + 1;
 				if (p->rdev && (size + offset) > radeon_bo_size(reloc->robj)) {
 					/* force size to size of the buffer */
-					dev_warn(p->dev, "vbo resource seems too big (%d) for the bo (%ld)\n",
-						 size + offset, radeon_bo_size(reloc->robj));
+					dev_warn_once(p->dev, "vbo resource seems too big (%d) for the bo (%ld)\n",
+						      size + offset, radeon_bo_size(reloc->robj));
 					ib[idx+1+(i*7)+1] = radeon_bo_size(reloc->robj) - offset;
 				}
 
@@ -2015,7 +2020,7 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 			case SQ_TEX_VTX_INVALID_TEXTURE:
 			case SQ_TEX_VTX_INVALID_BUFFER:
 			default:
-				DRM_ERROR("bad SET_RESOURCE\n");
+				dev_warn_once(p->dev, "bad SET_RESOURCE\n");
 				return -EINVAL;
 			}
 		}
@@ -2027,7 +2032,7 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 			if ((start_reg < PACKET3_SET_ALU_CONST_OFFSET) ||
 			    (start_reg >= PACKET3_SET_ALU_CONST_END) ||
 			    (end_reg >= PACKET3_SET_ALU_CONST_END)) {
-				DRM_ERROR("bad SET_ALU_CONST\n");
+				dev_warn_once(p->dev, "bad SET_ALU_CONST\n");
 				return -EINVAL;
 			}
 		}
@@ -2038,7 +2043,7 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 		if ((start_reg < PACKET3_SET_BOOL_CONST_OFFSET) ||
 		    (start_reg >= PACKET3_SET_BOOL_CONST_END) ||
 		    (end_reg >= PACKET3_SET_BOOL_CONST_END)) {
-			DRM_ERROR("bad SET_BOOL_CONST\n");
+			dev_warn_once(p->dev, "bad SET_BOOL_CONST\n");
 			return -EINVAL;
 		}
 		break;
@@ -2048,7 +2053,7 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 		if ((start_reg < PACKET3_SET_LOOP_CONST_OFFSET) ||
 		    (start_reg >= PACKET3_SET_LOOP_CONST_END) ||
 		    (end_reg >= PACKET3_SET_LOOP_CONST_END)) {
-			DRM_ERROR("bad SET_LOOP_CONST\n");
+			dev_warn_once(p->dev, "bad SET_LOOP_CONST\n");
 			return -EINVAL;
 		}
 		break;
@@ -2058,13 +2063,13 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 		if ((start_reg < PACKET3_SET_CTL_CONST_OFFSET) ||
 		    (start_reg >= PACKET3_SET_CTL_CONST_END) ||
 		    (end_reg >= PACKET3_SET_CTL_CONST_END)) {
-			DRM_ERROR("bad SET_CTL_CONST\n");
+			dev_warn_once(p->dev, "bad SET_CTL_CONST\n");
 			return -EINVAL;
 		}
 		break;
 	case PACKET3_SET_SAMPLER:
 		if (pkt->count % 3) {
-			DRM_ERROR("bad SET_SAMPLER\n");
+			dev_warn_once(p->dev, "bad SET_SAMPLER\n");
 			return -EINVAL;
 		}
 		start_reg = (idx_value << 2) + PACKET3_SET_SAMPLER_OFFSET;
@@ -2072,22 +2077,22 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 		if ((start_reg < PACKET3_SET_SAMPLER_OFFSET) ||
 		    (start_reg >= PACKET3_SET_SAMPLER_END) ||
 		    (end_reg >= PACKET3_SET_SAMPLER_END)) {
-			DRM_ERROR("bad SET_SAMPLER\n");
+			dev_warn_once(p->dev, "bad SET_SAMPLER\n");
 			return -EINVAL;
 		}
 		break;
 	case PACKET3_STRMOUT_BASE_UPDATE:
 		/* RS780 and RS880 also need this */
 		if (p->family < CHIP_RS780) {
-			DRM_ERROR("STRMOUT_BASE_UPDATE only supported on 7xx\n");
+			dev_warn_once(p->dev, "STRMOUT_BASE_UPDATE only supported on 7xx\n");
 			return -EINVAL;
 		}
 		if (pkt->count != 1) {
-			DRM_ERROR("bad STRMOUT_BASE_UPDATE packet count\n");
+			dev_warn_once(p->dev, "bad STRMOUT_BASE_UPDATE packet count\n");
 			return -EINVAL;
 		}
 		if (idx_value > 3) {
-			DRM_ERROR("bad STRMOUT_BASE_UPDATE index\n");
+			dev_warn_once(p->dev, "bad STRMOUT_BASE_UPDATE index\n");
 			return -EINVAL;
 		}
 		{
@@ -2095,25 +2100,27 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 
 			r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 			if (r) {
-				DRM_ERROR("bad STRMOUT_BASE_UPDATE reloc\n");
+				dev_warn_once(p->dev, "bad STRMOUT_BASE_UPDATE reloc\n");
 				return -EINVAL;
 			}
 
 			if (reloc->robj != track->vgt_strmout_bo[idx_value]) {
-				DRM_ERROR("bad STRMOUT_BASE_UPDATE, bo does not match\n");
+				dev_warn_once(p->dev, "bad STRMOUT_BASE_UPDATE, bo does not match\n");
 				return -EINVAL;
 			}
 
 			offset = (u64)radeon_get_ib_value(p, idx+1) << 8;
 			if (offset != track->vgt_strmout_bo_offset[idx_value]) {
-				DRM_ERROR("bad STRMOUT_BASE_UPDATE, bo offset does not match: 0x%llx, 0x%x\n",
-					  offset, track->vgt_strmout_bo_offset[idx_value]);
+				dev_warn_once(p->dev,
+					      "bad STRMOUT_BASE_UPDATE, bo offset does not match: 0x%llx, 0x%x\n",
+					      offset, track->vgt_strmout_bo_offset[idx_value]);
 				return -EINVAL;
 			}
 
 			if ((offset + 4) > radeon_bo_size(reloc->robj)) {
-				DRM_ERROR("bad STRMOUT_BASE_UPDATE bo too small: 0x%llx, 0x%lx\n",
-					  offset + 4, radeon_bo_size(reloc->robj));
+				dev_warn_once(p->dev,
+					      "bad STRMOUT_BASE_UPDATE bo too small: 0x%llx, 0x%lx\n",
+					      offset + 4, radeon_bo_size(reloc->robj));
 				return -EINVAL;
 			}
 			ib[idx+1] += (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
@@ -2121,17 +2128,17 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 		break;
 	case PACKET3_SURFACE_BASE_UPDATE:
 		if (p->family >= CHIP_RV770 || p->family == CHIP_R600) {
-			DRM_ERROR("bad SURFACE_BASE_UPDATE\n");
+			dev_warn_once(p->dev, "bad SURFACE_BASE_UPDATE\n");
 			return -EINVAL;
 		}
 		if (pkt->count) {
-			DRM_ERROR("bad SURFACE_BASE_UPDATE\n");
+			dev_warn_once(p->dev, "bad SURFACE_BASE_UPDATE\n");
 			return -EINVAL;
 		}
 		break;
 	case PACKET3_STRMOUT_BUFFER_UPDATE:
 		if (pkt->count != 4) {
-			DRM_ERROR("bad STRMOUT_BUFFER_UPDATE (invalid count)\n");
+			dev_warn_once(p->dev, "bad STRMOUT_BUFFER_UPDATE (invalid count)\n");
 			return -EINVAL;
 		}
 		/* Updating memory at DST_ADDRESS. */
@@ -2139,14 +2146,15 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 			u64 offset;
 			r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 			if (r) {
-				DRM_ERROR("bad STRMOUT_BUFFER_UPDATE (missing dst reloc)\n");
+				dev_warn_once(p->dev, "bad STRMOUT_BUFFER_UPDATE (missing dst reloc)\n");
 				return -EINVAL;
 			}
 			offset = radeon_get_ib_value(p, idx+1);
 			offset += ((u64)(radeon_get_ib_value(p, idx+2) & 0xff)) << 32;
 			if ((offset + 4) > radeon_bo_size(reloc->robj)) {
-				DRM_ERROR("bad STRMOUT_BUFFER_UPDATE dst bo too small: 0x%llx, 0x%lx\n",
-					  offset + 4, radeon_bo_size(reloc->robj));
+				dev_warn_once(p->dev,
+					      "bad STRMOUT_BUFFER_UPDATE dst bo too small: 0x%llx, 0x%lx\n",
+					      offset + 4, radeon_bo_size(reloc->robj));
 				return -EINVAL;
 			}
 			offset += reloc->gpu_offset;
@@ -2158,14 +2166,15 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 			u64 offset;
 			r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 			if (r) {
-				DRM_ERROR("bad STRMOUT_BUFFER_UPDATE (missing src reloc)\n");
+				dev_warn_once(p->dev, "bad STRMOUT_BUFFER_UPDATE (missing src reloc)\n");
 				return -EINVAL;
 			}
 			offset = radeon_get_ib_value(p, idx+3);
 			offset += ((u64)(radeon_get_ib_value(p, idx+4) & 0xff)) << 32;
 			if ((offset + 4) > radeon_bo_size(reloc->robj)) {
-				DRM_ERROR("bad STRMOUT_BUFFER_UPDATE src bo too small: 0x%llx, 0x%lx\n",
-					  offset + 4, radeon_bo_size(reloc->robj));
+				dev_warn_once(p->dev,
+					      "bad STRMOUT_BUFFER_UPDATE src bo too small: 0x%llx, 0x%lx\n",
+					      offset + 4, radeon_bo_size(reloc->robj));
 				return -EINVAL;
 			}
 			offset += reloc->gpu_offset;
@@ -2178,23 +2187,23 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 		u64 offset;
 
 		if (pkt->count != 3) {
-			DRM_ERROR("bad MEM_WRITE (invalid count)\n");
+			dev_warn_once(p->dev, "bad MEM_WRITE (invalid count)\n");
 			return -EINVAL;
 		}
 		r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 		if (r) {
-			DRM_ERROR("bad MEM_WRITE (missing reloc)\n");
+			dev_warn_once(p->dev, "bad MEM_WRITE (missing reloc)\n");
 			return -EINVAL;
 		}
 		offset = radeon_get_ib_value(p, idx+0);
 		offset += ((u64)(radeon_get_ib_value(p, idx+1) & 0xff)) << 32UL;
 		if (offset & 0x7) {
-			DRM_ERROR("bad MEM_WRITE (address not qwords aligned)\n");
+			dev_warn_once(p->dev, "bad MEM_WRITE (address not qwords aligned)\n");
 			return -EINVAL;
 		}
 		if ((offset + 8) > radeon_bo_size(reloc->robj)) {
-			DRM_ERROR("bad MEM_WRITE bo too small: 0x%llx, 0x%lx\n",
-				  offset + 8, radeon_bo_size(reloc->robj));
+			dev_warn_once(p->dev, "bad MEM_WRITE bo too small: 0x%llx, 0x%lx\n",
+				      offset + 8, radeon_bo_size(reloc->robj));
 			return -EINVAL;
 		}
 		offset += reloc->gpu_offset;
@@ -2204,7 +2213,7 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 	}
 	case PACKET3_COPY_DW:
 		if (pkt->count != 4) {
-			DRM_ERROR("bad COPY_DW (invalid count)\n");
+			dev_warn_once(p->dev, "bad COPY_DW (invalid count)\n");
 			return -EINVAL;
 		}
 		if (idx_value & 0x1) {
@@ -2212,14 +2221,14 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 			/* SRC is memory. */
 			r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 			if (r) {
-				DRM_ERROR("bad COPY_DW (missing src reloc)\n");
+				dev_warn_once(p->dev, "bad COPY_DW (missing src reloc)\n");
 				return -EINVAL;
 			}
 			offset = radeon_get_ib_value(p, idx+1);
 			offset += ((u64)(radeon_get_ib_value(p, idx+2) & 0xff)) << 32;
 			if ((offset + 4) > radeon_bo_size(reloc->robj)) {
-				DRM_ERROR("bad COPY_DW src bo too small: 0x%llx, 0x%lx\n",
-					  offset + 4, radeon_bo_size(reloc->robj));
+				dev_warn_once(p->dev, "bad COPY_DW src bo too small: 0x%llx, 0x%lx\n",
+					      offset + 4, radeon_bo_size(reloc->robj));
 				return -EINVAL;
 			}
 			offset += reloc->gpu_offset;
@@ -2236,14 +2245,14 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 			/* DST is memory. */
 			r = radeon_cs_packet_next_reloc(p, &reloc, r600_nomm);
 			if (r) {
-				DRM_ERROR("bad COPY_DW (missing dst reloc)\n");
+				dev_warn_once(p->dev, "bad COPY_DW (missing dst reloc)\n");
 				return -EINVAL;
 			}
 			offset = radeon_get_ib_value(p, idx+3);
 			offset += ((u64)(radeon_get_ib_value(p, idx+4) & 0xff)) << 32;
 			if ((offset + 4) > radeon_bo_size(reloc->robj)) {
-				DRM_ERROR("bad COPY_DW dst bo too small: 0x%llx, 0x%lx\n",
-					  offset + 4, radeon_bo_size(reloc->robj));
+				dev_warn_once(p->dev, "bad COPY_DW dst bo too small: 0x%llx, 0x%lx\n",
+					      offset + 4, radeon_bo_size(reloc->robj));
 				return -EINVAL;
 			}
 			offset += reloc->gpu_offset;
@@ -2259,7 +2268,7 @@ static int r600_packet3_check(struct radeon_cs_parser *p,
 	case PACKET3_NOP:
 		break;
 	default:
-		DRM_ERROR("Packet3 opcode %x not supported\n", pkt->opcode);
+		dev_warn_once(p->dev, "Packet3 opcode %x not supported\n", pkt->opcode);
 		return -EINVAL;
 	}
 	return 0;
@@ -2306,7 +2315,7 @@ int r600_cs_parse(struct radeon_cs_parser *p)
 			r = r600_packet3_check(p, &pkt);
 			break;
 		default:
-			DRM_ERROR("Unknown packet type %d !\n", pkt.type);
+			dev_warn_once(p->dev, "Unknown packet type %d !\n", pkt.type);
 			kfree(p->track);
 			p->track = NULL;
 			return -EINVAL;
@@ -2346,13 +2355,13 @@ int r600_dma_cs_next_reloc(struct radeon_cs_parser *p,
 
 	*cs_reloc = NULL;
 	if (p->chunk_relocs == NULL) {
-		DRM_ERROR("No relocation chunk !\n");
+		dev_warn_once(p->dev, "No relocation chunk !\n");
 		return -EINVAL;
 	}
 	idx = p->dma_reloc_idx;
 	if (idx >= p->nrelocs) {
-		DRM_ERROR("Relocs at %d after relocations chunk end %d !\n",
-			  idx, p->nrelocs);
+		dev_warn_once(p->dev, "Relocs at %d after relocations chunk end %d !\n",
+			      idx, p->nrelocs);
 		return -EINVAL;
 	}
 	*cs_reloc = &p->relocs[idx];
@@ -2385,8 +2394,8 @@ int r600_dma_cs_parse(struct radeon_cs_parser *p)
 
 	do {
 		if (p->idx >= ib_chunk->length_dw) {
-			DRM_ERROR("Can not parse packet at %d after CS end %d !\n",
-				  p->idx, ib_chunk->length_dw);
+			dev_warn_once(p->dev, "Can not parse packet at %d after CS end %d !\n",
+				      p->idx, ib_chunk->length_dw);
 			return -EINVAL;
 		}
 		idx = p->idx;
@@ -2399,7 +2408,7 @@ int r600_dma_cs_parse(struct radeon_cs_parser *p)
 		case DMA_PACKET_WRITE:
 			r = r600_dma_cs_next_reloc(p, &dst_reloc);
 			if (r) {
-				DRM_ERROR("bad DMA_PACKET_WRITE\n");
+				dev_warn_once(p->dev, "bad DMA_PACKET_WRITE\n");
 				return -EINVAL;
 			}
 			if (tiled) {
@@ -2417,20 +2426,20 @@ int r600_dma_cs_parse(struct radeon_cs_parser *p)
 				p->idx += count + 3;
 			}
 			if ((dst_offset + (count * 4)) > radeon_bo_size(dst_reloc->robj)) {
-				dev_warn(p->dev, "DMA write buffer too small (%llu %lu)\n",
-					 dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
+				dev_warn_once(p->dev, "DMA write buffer too small (%llu %lu)\n",
+					      dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
 				return -EINVAL;
 			}
 			break;
 		case DMA_PACKET_COPY:
 			r = r600_dma_cs_next_reloc(p, &src_reloc);
 			if (r) {
-				DRM_ERROR("bad DMA_PACKET_COPY\n");
+				dev_warn_once(p->dev, "bad DMA_PACKET_COPY\n");
 				return -EINVAL;
 			}
 			r = r600_dma_cs_next_reloc(p, &dst_reloc);
 			if (r) {
-				DRM_ERROR("bad DMA_PACKET_COPY\n");
+				dev_warn_once(p->dev, "bad DMA_PACKET_COPY\n");
 				return -EINVAL;
 			}
 			if (tiled) {
@@ -2484,31 +2493,31 @@ int r600_dma_cs_parse(struct radeon_cs_parser *p)
 				}
 			}
 			if ((src_offset + (count * 4)) > radeon_bo_size(src_reloc->robj)) {
-				dev_warn(p->dev, "DMA copy src buffer too small (%llu %lu)\n",
-					 src_offset + (count * 4), radeon_bo_size(src_reloc->robj));
+				dev_warn_once(p->dev, "DMA copy src buffer too small (%llu %lu)\n",
+					      src_offset + (count * 4), radeon_bo_size(src_reloc->robj));
 				return -EINVAL;
 			}
 			if ((dst_offset + (count * 4)) > radeon_bo_size(dst_reloc->robj)) {
-				dev_warn(p->dev, "DMA write dst buffer too small (%llu %lu)\n",
-					 dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
+				dev_warn_once(p->dev, "DMA write dst buffer too small (%llu %lu)\n",
+					      dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
 				return -EINVAL;
 			}
 			break;
 		case DMA_PACKET_CONSTANT_FILL:
 			if (p->family < CHIP_RV770) {
-				DRM_ERROR("Constant Fill is 7xx only !\n");
+				dev_warn_once(p->dev, "Constant Fill is 7xx only !\n");
 				return -EINVAL;
 			}
 			r = r600_dma_cs_next_reloc(p, &dst_reloc);
 			if (r) {
-				DRM_ERROR("bad DMA_PACKET_WRITE\n");
+				dev_warn_once(p->dev, "bad DMA_PACKET_WRITE\n");
 				return -EINVAL;
 			}
 			dst_offset = radeon_get_ib_value(p, idx+1);
 			dst_offset |= ((u64)(radeon_get_ib_value(p, idx+3) & 0x00ff0000)) << 16;
 			if ((dst_offset + (count * 4)) > radeon_bo_size(dst_reloc->robj)) {
-				dev_warn(p->dev, "DMA constant fill buffer too small (%llu %lu)\n",
-					 dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
+				dev_warn_once(p->dev, "DMA constant fill buffer too small (%llu %lu)\n",
+					      dst_offset + (count * 4), radeon_bo_size(dst_reloc->robj));
 				return -EINVAL;
 			}
 			ib[idx+1] += (u32)(dst_reloc->gpu_offset & 0xfffffffc);
@@ -2519,7 +2528,7 @@ int r600_dma_cs_parse(struct radeon_cs_parser *p)
 			p->idx += 1;
 			break;
 		default:
-			DRM_ERROR("Unknown packet type %d at %d !\n", cmd, idx);
+			dev_warn_once(p->dev, "Unknown packet type %d at %d !\n", cmd, idx);
 			return -EINVAL;
 		}
 	} while (p->idx < p->chunk_ib->length_dw);
diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index b8e6202f1d5bc..3f9c0011244f4 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -834,7 +834,7 @@ void radeon_cs_dump_packet(struct radeon_cs_parser *p,
 	ib = p->ib.ptr;
 	idx = pkt->idx;
 	for (i = 0; i <= (pkt->count + 1); i++, idx++)
-		DRM_INFO("ib[%d]=0x%08X\n", idx, ib[idx]);
+		dev_dbg(p->dev, "ib[%d]=0x%08X\n", idx, ib[idx]);
 }
 
 /**
-- 
2.51.0

