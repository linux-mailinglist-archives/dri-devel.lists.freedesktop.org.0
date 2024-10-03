Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7569C98EF91
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 14:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A145310E83A;
	Thu,  3 Oct 2024 12:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zMitrvhN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBFD10E839;
 Thu,  3 Oct 2024 12:45:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oV1RxDzZMzCTTIIHzcBf5SQPP7x54TKzeeeXLEfoZHAsnCbK6/ySTKRayrNfaQoZQIuFoaRVzFgeYz9LARUmXZedt7Ja9TBMOrdVFISAned4x0Xm8r9CyazPHzqFCIYITlDqnIzjeOYU/mSK/tTFezZAlTa57fGjR2NJcTcKgc+KQgSb41vO4TRiHldza2fmLTkSVW9Ip13w2CoYTUhOg4O443OH56PfSKwDz3Z3niT+MZ5xSDMPrJ0VTs2jHXRL3zqYWqdFBAaTeAC6EgeNV+6vshkTtKNmdGrkVe6QI2HIMgRz6/KGpFCkeYUiTiO+/cV/gRcF++oSdAmXV2xrnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6Ji6fF12ns6v0fDQNTLY9BV8iKUhhpqNgU+Iwxjn3w=;
 b=GkN8w7e7gfrAHR8DzxcIL54ldiFGQclxb/Rc9J56ced6XXba42Sxy3bNNXV0Fv8PwU62N9eRmP54cdvi7MdOybFAbdOdIpECDuUvBuImysz6wFaoLn4b46SiGlq/6OVA5C7ifBWlaTJ3wEuLdwsVCLpFNjGjltPLjuvquVO1KITfedTb950Bptq0vwW4APitrQkOaGOYBKTYcpgr2xmxHNcKBBCLbg8WfaNV+nsnJy69y/sy7SB3ggUs6IxmgxVSkvu6aaKGzvgiHUE1T+q65XRRI9JZrt/dUthGFxFe8n77Rq+mD6nYWCwgH6WNV6Szm4uHiLGm8nDBTCIeEmpRRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6Ji6fF12ns6v0fDQNTLY9BV8iKUhhpqNgU+Iwxjn3w=;
 b=zMitrvhNUDDoi61TyGGES1w2FBlNVtaeCDDBWYwP3bFRnNT/IW4SyvmEdpPIB05VTd8WonqkPHGs2s2G6a6n57yiXBeJnUxUHBKOdDWXS9oyoF0AsDOk/6PVKKPTMgdNkY2OGCBJMo/62LXn/Ag+fqCTYPjFJ0AMpUkZIVfpPs0=
Received: from SN4PR0501CA0021.namprd05.prod.outlook.com
 (2603:10b6:803:40::34) by SJ2PR12MB8112.namprd12.prod.outlook.com
 (2603:10b6:a03:4f8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 12:45:42 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:803:40:cafe::a2) by SN4PR0501CA0021.outlook.office365.com
 (2603:10b6:803:40::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16 via Frontend
 Transport; Thu, 3 Oct 2024 12:45:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 12:45:41 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 07:45:39 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <dmitry.osipenko@collabora.com>, <jani.nikula@linux.intel.com>,
 <christian.koenig@amd.com>, <tursulin@igalia.com>, <simona.vetter@ffwll.ch>,
 <robdclark@gmail.com>, <alexander.deucher@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v5 3/6] drm/amdgpu: delay the use of amdgpu_vm_set_task_info
Date: Thu, 3 Oct 2024 14:43:11 +0200
Message-ID: <20241003124506.470931-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
References: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|SJ2PR12MB8112:EE_
X-MS-Office365-Filtering-Correlation-Id: 759ee60f-0c28-4ce8-4cd6-08dce3a94a9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xm0tirfFt7ZYPXqTut+yCHDj/HqSBwCSbP9HQikjgd9gJmqolcaLSDayLhSU?=
 =?us-ascii?Q?paiMnU3l+iwoU0xnze6DW8t0bco2xcNTnmSDOgunY3a2GjKeaxUS+IGa7mad?=
 =?us-ascii?Q?vGWXheqLkjCTgtKG2ZlPm/e4tI/8hfxoWx98d3uQ5NATBu8wjJNmzerFMnIz?=
 =?us-ascii?Q?ZffmbpPbviZCsityyOfJxHm7HsIoquopNGDTdDWyF8RsJXUbC6pXQ1lWf//8?=
 =?us-ascii?Q?qbaVV4ESxX5IannFy0lAA2pqeq1zZzeDVjP4kuojXTOQfKuTMlcuaFP4vXEG?=
 =?us-ascii?Q?dfFk08C22N4N1WvoDK9nF/hXiNNuwn5xunbIFPVNdlzU/gNaikK5mUmfrbdT?=
 =?us-ascii?Q?QJKt5B/gu+7NNz+QFj6++qUe0cZO7M5Jnao0EW0RcIzXIEhEm6iaOnY9/d1H?=
 =?us-ascii?Q?H7F7MN+0rOLq8Fm9ufrtc2SD9Hb+G4onuhNduyqEUMXMzj7/V/nKL5c7ME18?=
 =?us-ascii?Q?3kexsutGszdBNNPDBshjSS+rub76ttom4ckFOcchqx+MVH7kOKZvwzhtKFGR?=
 =?us-ascii?Q?0kJYnFxifhin6ErMF2H1RIRfLOxsytFlY9vpBPK7kBIbphcgnkQWi0Pe+j+D?=
 =?us-ascii?Q?Rv6trvo7/E2cctzvy8UaBcvDeiUP+DFwjB/mlJvzj33HiXd43XNPT9npZ4uG?=
 =?us-ascii?Q?jq76YcaKe2Vo4cneiyb36WCcixlHp9Yf3N7PEa/7OnuvD9u30xZJdhHGFJJY?=
 =?us-ascii?Q?I8wNZ+JWLKSiGlDaOa+FhumvO4DBlcfnq2vwasljThpKDrLU2FC2ZXS4wWYj?=
 =?us-ascii?Q?1cfci5O/n2tTGaUV6tkfMDc6aPFILXLF6WXfkgIlvRB9eWGRV6eclbsWY/Mz?=
 =?us-ascii?Q?NiRrgUwI4Gt6suLql4pRRoZG4NfH2ITF3rTIRU/EonAaDr3gyNw02M4DMQaX?=
 =?us-ascii?Q?gPIkYlgmkthPUq0CxznG4sRRmZpVmq/GZbFXXkNga/QIYZIAV7o262qIV5mF?=
 =?us-ascii?Q?U66jyqntH6Xp3LZY6MgG4b6vVh/nlwGvFuZqfOhJh20ZDYz8jUcS2dsU3uh4?=
 =?us-ascii?Q?yoiXOcXwcsjQTfnN4bgAaPZD3fWrwJSe/BW6DHXPPw/ajg8ElLqJZ0cymPMI?=
 =?us-ascii?Q?x1yA7A+NAetKbIBUiJSlqYTgF3g2tgzHMhuTEj9CAlu89fB7AwzM4HS7InrU?=
 =?us-ascii?Q?7fUwpFrvahKgSl3RR9WPgWAfYEg+k2z9Q+h/LGp+2weVq+YB/tYJn77hegmG?=
 =?us-ascii?Q?bigBDYzwByarYBt7ZOBvoq88h1BBCaKbRsSLnar765KaY++LTildyVnZIg7u?=
 =?us-ascii?Q?tP74wlDjQrKMUlleS/Th+lV39e6oz4Y7vc+b8hsPncnvAemyY/7+NGCrYoVX?=
 =?us-ascii?Q?x0RzS+pPvATrs+nbl/23Io2Hcvl7FInJxoO3Hz15BKZ+DZ0PbxbRyscyyxvs?=
 =?us-ascii?Q?42aYlkm6o6M7r5Uht85Lu47OFxGJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 12:45:41.9631 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 759ee60f-0c28-4ce8-4cd6-08dce3a94a9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8112
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

At the point the VM is locked (through the root PDs dma_resv object), so
it's safer to call amdgpu_vm_set_task_info.

The original place was not protected against concurrent access, but the
risk was limited to mangled process/task name.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 1e475eb01417..891128ecee6d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -309,9 +309,6 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 		p->gang_leader->uf_addr = uf_offset;
 	kvfree(chunk_array);
 
-	/* Use this opportunity to fill in task info for the vm */
-	amdgpu_vm_set_task_info(vm);
-
 	return 0;
 
 free_all_kdata:
@@ -1180,6 +1177,9 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 		job->vm_pd_addr = amdgpu_gmc_pd_addr(vm->root.bo);
 	}
 
+	/* Use this opportunity to fill in task info for the vm */
+	amdgpu_vm_set_task_info(vm);
+
 	if (adev->debug_vm) {
 		/* Invalidate all BOs to test for userspace bugs */
 		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-- 
2.40.1

