Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A57C39D80
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 10:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6836C10E863;
	Thu,  6 Nov 2025 09:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aIVZ1Efr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011063.outbound.protection.outlook.com
 [40.93.194.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDB510E863;
 Thu,  6 Nov 2025 09:40:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dj+6KuEBzxd6fG7THTuyO26CQZD2B+mqYYKCZKkwxyqknP1ezBsyvFz5omg3ZfayeReqF6vXLZoQPRo639ucYXBnv3j6Ga/lNa+40ATGndQFwfoQYJB3SC5Ei84G2DKWJKWA4+w0pFsDNyh6WaoipMICSahcKwE332U1s9PmFAgnF9vI4bIqUCc+jy4VT61Qm3sbAHMIULNVLcbCAf5DFUAwcMytwN5axUAOaffPO6TSsqjKQMU4JafHXiOZd/I8V0MW0TqF44yZnk/411P5L8VVjMg097xbPsqj7ydsY5TzjDh6pXKBm5Scgwz72pedCWO5WHXUY7igOln9Cccv0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlntonwTt6G6P255jfzo3V2dgUqOY1KFf9evZ1ac9Io=;
 b=ITjQqfRU9DXV/AnrGuRdxSyUZZx/HNH1Z6EqoPJc1QujXW9JSIjxIVytfl582V9ejmFpAMc12vyzVWSPVULpqUkA5e5JmzoWODR7Zub0W3KP4YQmYesLUTvw1S2CQXW+N77B02ugrfQ4fqCY9NV5nrrrn9UqjOqEsvEuuBf0/xK9+wq9BcdmYDOzd+l53EWxGO+PD6FMKz20/M3DRJYlVU2RtpCav76DD9PhhhlEfZDjHGU52nCxE+psFSCt6GwrEmKCgmWbSut4WMfXTMiYwPOCmn1zJlJ2ozmUNZ0sKxCE3A2/VvDWv9oel4b1D/sjI659I8+caB9URwotNoqztQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlntonwTt6G6P255jfzo3V2dgUqOY1KFf9evZ1ac9Io=;
 b=aIVZ1EfrvE207pcbjvNfQexM23echTbJf1O/iEp8x95G8yL2uDDEBqroy6vzEqyros4gnZKVIPPw+HQFoMyUxHT14zCYgVs8HuFsx7s/4dE6lcDZA+GwI3N5N0HSVkw+pK+Cn+gzAnqX6EjFSDBeVucObfwgK/ugILW5kDdfEwk=
Received: from MN0PR03CA0028.namprd03.prod.outlook.com (2603:10b6:208:52f::16)
 by CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 09:40:23 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::e3) by MN0PR03CA0028.outlook.office365.com
 (2603:10b6:208:52f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 09:40:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 09:40:23 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 6 Nov 2025 01:40:12 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/4] drm/amdgpu: jump to the correct label on failure
Date: Thu, 6 Nov 2025 10:39:26 +0100
Message-ID: <20251106093933.18859-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106093933.18859-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251106093933.18859-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|CH3PR12MB8659:EE_
X-MS-Office365-Filtering-Correlation-Id: 493bdb23-1bf7-4378-5dd1-08de1d18825d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+3dlo+92qm6XThTCIiqXg7tMR3FfXtZ/KuxRK81Boh3k9RzviOOm9CyObTki?=
 =?us-ascii?Q?k+maw51aP1OMzMt1/sHUEcDTvxnLxqu7Hj6EDzeoh6MucVCIq0x7uZ5u4nsf?=
 =?us-ascii?Q?WwRyNH8Lv79qEQCN/GMBubJeA9V8HP6r0f3c85M3nKXTUhIknfXMFiH7AYpb?=
 =?us-ascii?Q?IWw+KYYruq82N2jWw4pLofWNmY2gikaPv4uDLLpKpEbA5X3iA6w5ZBRIN8NJ?=
 =?us-ascii?Q?275tueiDfEq19QL3xPnHS0N/e3OGCiaHv09RREiFqwM0LDCZxkF1mLuPz2HJ?=
 =?us-ascii?Q?Bv6bP28G/vtcdgrYBhEV+a37SeO6+SrCZbyt9oRsw2IR+tRlhRH//TPT9El9?=
 =?us-ascii?Q?IIvvNih533qMvUtjFuiMz6FJ6+TZ7c6B9p9Yrrd6Q2o/FKjlh3sbeK6QF3c5?=
 =?us-ascii?Q?tQAlLak0UIFm6G5mHx2J7C8KPKVnLXgwxOeV5oN9CNOp2eGJuoyt+aCAV3M7?=
 =?us-ascii?Q?zmK4LtCxed5+k+kI295s3ICYUGjlGUX+ydAX0gx2QEiyeiIjMNC9Q4aYo/H9?=
 =?us-ascii?Q?Nvuh8qTzym7m+4PqxTJBiO2qu7YGB99wpGuzvOSYVqZNJNym9CJB3gGZlrVl?=
 =?us-ascii?Q?VIC6uQKiu1Ir3UIxufUV9giXpoqZaF0I0V1NTu2MT8qNySqLVmN/rdEmhL6L?=
 =?us-ascii?Q?1+FruKDcGMk86J9H8CQpjaoNDsWVrXV4qCLMtYJFVAGzQOoo5Oc7xD9U6uLm?=
 =?us-ascii?Q?07TZs7xvmyxE0wZBLXqYp8nv0L07Ch13APhgALBp19VUxfLp5uNmU5lMoHru?=
 =?us-ascii?Q?+2KVXqu7RzoMchgn7feofh/Xn1ORIV7dMLESclHsUesje4MOTfxlN/ZWyDwx?=
 =?us-ascii?Q?ueovls/angNuV8o6sEgDr/JGjZ53VrDL3SOHayuXcGLilwE/Nnyzuq1kB2Et?=
 =?us-ascii?Q?AVNS6Hiasopx3UaNgDuiP6WvXWQBQBi/jMYAbQFv04rAGMmF8HsqkhAw2adZ?=
 =?us-ascii?Q?ft3CUSCuFgflpKY/joMqLSd+rzEPmTcLpL9YobEoWyd83S07zHtI3aWW2fl1?=
 =?us-ascii?Q?Weq9efi2Ck6BibBdwz8OiTmfmoWukMHWynrF+0+a9xv5MQiqtMymsDyHFhZ2?=
 =?us-ascii?Q?QGNbcLQYae6m9NdAbnPdCNLO6u1w/+zuq70e0C1n5cMhGWnhwiNqtCV9ufoa?=
 =?us-ascii?Q?zE5VVSe0IwVJDKcgVhcVc76nTqo/l6VqjV6FEiSzB0J9xU9BZ6xgzd5OqMxP?=
 =?us-ascii?Q?y5dPaBcSqjkSD8gBYKBbqN2JsHbBdWBxjlEjgXU7otLsWuT0tSamXPISWcaz?=
 =?us-ascii?Q?xChFIZx2Z4CJ/FlUOhMBVVuAvW0sMkMN6vtmapSyu6gURfonjQEHmN6wSLgY?=
 =?us-ascii?Q?YG0yaZD9+QiOMf6lLFqVG9hWWwKoM/bn73GJCAmZigUOEIBzQgX01alLp0fz?=
 =?us-ascii?Q?RJAEDNgSk41PXF6XtkBnx3Zf9Levvg+DPIGeqfEouToR+MAxginDfH3aBmnx?=
 =?us-ascii?Q?hfWneVDgI7qBZjuqhwOELh++cQu40y7l1+p7IN/I3Vre+DDkutrQjJyljHCY?=
 =?us-ascii?Q?Hry4h6bE/a5tBdiZXirNSAHqOeUE5V68X67M0jA/HsyjyGIoffrbHjqVb/xI?=
 =?us-ascii?Q?20CeAsdfZ0Ta/CwgAUw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 09:40:23.6312 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 493bdb23-1bf7-4378-5dd1-08de1d18825d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8659
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

drm_sched_entity_init wasn't called yet, so the only thing to
do is to release allocated memory.
This doesn't fix any bug since entity is zero allocated and
drm_sched_entity_fini does nothing in this case.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index f5d5c45ddc0d..afedea02188d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -236,7 +236,7 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
 		r = amdgpu_xcp_select_scheds(adev, hw_ip, hw_prio, fpriv,
 						&num_scheds, &scheds);
 		if (r)
-			goto cleanup_entity;
+			goto error_free_entity;
 	}
 
 	/* disable load balance if the hw engine retains context among dependent jobs */
-- 
2.43.0

