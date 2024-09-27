Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4999880C1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 10:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1013C10EC90;
	Fri, 27 Sep 2024 08:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="P0w0bx7N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C705210EC90;
 Fri, 27 Sep 2024 08:49:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASeBD37MdIZ9y4m2/tEMcsoPDLG11zrNiMmdP7ZytbG6uuemHLyMevG0maH5kWaeDZAqoHLaOSnTPslwxQFdALRYePdZS80GeEeA6FvZsglfsBlZxhGZxz6dqVzUP8+gVBU02eO03lR97HlRjsgWOQP9ztjdkb9cruXhxMO69I/zR+R0mC4H79WJLApUQCcVyHZ2OLx1i77hWkIYM8mF1UB7ELKGlyF9zJPm7+tqubPeT0AAyJmbDP2jfVufT6E4kGkj+Fjk+Kt05DBRG8rGMZm0K5vRqf4/hQRj8PQ6H7arXy1d8kUV07LjE/pgC1b7UY1FjF6YwbQUIj1rkbCshA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6Ji6fF12ns6v0fDQNTLY9BV8iKUhhpqNgU+Iwxjn3w=;
 b=nhbuAL9dpSp1/uk19wvJ4cWbjRsxVuYB0uDvOOXbjaVPjcY426VfevTyBotJ4oJKcWb6rvu6cOXSw/6VFh/3nYIcu5ba5BjPYtYSCU0YGixDP2t4EcrZRgL3gIMthzrOSapUopsst1NuILKXRY3MSg/1g/SeSFPd7L4BzHN86tcyYXo7+TeB9VJHdUkRfEN9jFmqJ3oPyKjjZ+vXV+Xbtpt+G4FlsdNEEbG0W8PEJVa2zM92YxESTQZHhHCtUts1tcndXpcDFTbgcNKEU4H5mBhtXK5SdaPAMC4AVxPeHVkg5+8sy3wv9Ipbl6Vv/rQ8YYP0oOAE/3cVnbezfh2CZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6Ji6fF12ns6v0fDQNTLY9BV8iKUhhpqNgU+Iwxjn3w=;
 b=P0w0bx7NB4xRGmmAzJOa8Zi8QFQgUp5KRNcC6Yy1w0pIhDv/XB8TGEA+g+dXGNwYw8cPTsmBMkiVVHc5dUTwVva5X1/UiFDMmdRDCWKJ4HJc4pnB+brXxbwuquAdzLlw7IEg4hjx6Y/PG+O6sDJS11dmLlL61ereWXAMKhqyGZQ=
Received: from MN2PR20CA0056.namprd20.prod.outlook.com (2603:10b6:208:235::25)
 by PH0PR12MB7888.namprd12.prod.outlook.com (2603:10b6:510:28b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Fri, 27 Sep
 2024 08:49:41 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:235:cafe::56) by MN2PR20CA0056.outlook.office365.com
 (2603:10b6:208:235::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25 via Frontend
 Transport; Fri, 27 Sep 2024 08:49:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 08:49:40 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 03:49:34 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>,
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dmitry.osipenko@collabora.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v4 3/6] drm/amdgpu: delay the use of amdgpu_vm_set_task_info
Date: Fri, 27 Sep 2024 10:48:39 +0200
Message-ID: <20240927084848.263718-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927084848.263718-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240927084848.263718-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|PH0PR12MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b4a4325-542e-4272-00f4-08dcded1536a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cCGj1u3b3qkkbbHcp7AsjGXQpHQNaXhePEhnkIZ6DUrLpLfSyMgzflmvUPKg?=
 =?us-ascii?Q?5WLvaE67ZDKZO8LG9cbRA6Cj9EfwnGUyg/QdDj4JtbExg+XwS+1cLY0G9+IF?=
 =?us-ascii?Q?LNhkjxHTom7yAtOGfgKR/FRotxQZSXR7fI8Yh1RCi9GXtfB8yJ3iG5maP6gF?=
 =?us-ascii?Q?6pfH8IOQokBecKsfteeAvE02d0LP6E7tNmy4fLpTIBcQol8oxHaRTGNHdyLZ?=
 =?us-ascii?Q?IIQU9QH5ibOXlwzggJT64c7Tgi88BarIEsa7uxWyx9NbAIl+83deBhkz7o4M?=
 =?us-ascii?Q?FeGUSzMlLLOJRR1fjCQS5HsC+jIxyRj4U9IueM1mj0ttycFS6OnWyp4J+J6W?=
 =?us-ascii?Q?+Qk2OWyVO9X+63NsgxYUB4eOVT0RULW8KSUDTPkhCIO/YVgfTmbR9mNIr0iB?=
 =?us-ascii?Q?hzdDvqpme7I3IPrNVZ3Cl/S5AocYAZmqvGuGDfD9je9BSzBEBORj4b7g7SX/?=
 =?us-ascii?Q?EQ1u2wTMoOu2D2ZAD2kAlF91zNPHPzVHD8J13s44SlZ/3PELE4+AYN5o8BZy?=
 =?us-ascii?Q?1T6P5dOSG5on58rIaNcgAzrS9/zF5PCvEFMEqz/aWupfNDMI89W6kdVOwtqi?=
 =?us-ascii?Q?YLtYJ0Ue/mYeQ6F7oWNqyzp0J7R9mxhtfraZR0y/XJ4Zy/dSSd0KnhwkmYQu?=
 =?us-ascii?Q?GW6goDRQU/kn2NOfCBY8hpvb3wtbdJZF/HbGwpu7JGQOCjugOnqGc5o9hZu1?=
 =?us-ascii?Q?WKO7GLdqTuELkJYtxpQglFq0ggOfNLO6lGIkfdbAGytjxCDXqTrKeicb3ByT?=
 =?us-ascii?Q?OjpQVYLr9TEY72zlZQwCcUtRZuhbymKhd/zdilFiy6vE4EgvySYoNw7ZJw7N?=
 =?us-ascii?Q?pOoURddClxbeQbcw0v6Q7nBFj4j4DRzRL4DZxRiIUftqZnyWEAuyeqvsvhYg?=
 =?us-ascii?Q?hRa9xCtx+GuCvsPdX12Sdx1v55sAHYZ80HiSSQpRHD0Eo5rYO8WYPWsAxync?=
 =?us-ascii?Q?nvr7cdwc6O/KPjnS64WYDMTl5kw+HVVLbIwHuh9jgTB9fbdyEp7UDPkG53gV?=
 =?us-ascii?Q?ASLhiFpJLMQakJETKeUhvz0FHjzuU80Gq0kXXwLkOvoADGxmw79ZN+oa8CTj?=
 =?us-ascii?Q?E4ZYhfyKL1feD5Q7NYD2vwJDIcPsiWWc/iB4GouTxjWs7gCGuiB7v4bR3WXy?=
 =?us-ascii?Q?lkoeyLjI2c7e8AGUrJ6rFpRNkE7fxzWeILuqBy0dFOnr8w5b4xPY49x1UsgH?=
 =?us-ascii?Q?MKG7kQBgAkTBZKPkHKnrbqR87T1WK0ar3gkt+H/mirpx4j4Pqw3g5F+eL5DU?=
 =?us-ascii?Q?Nea6hbZc0F+66IWqNXUShUqzgd6DXRfF7NrtkBoiQHYkPMvGRo96d9CHkRCY?=
 =?us-ascii?Q?IfBUbHzedLQzYoBi5gwlQqJ7DrnB9f1I2IDoKYHiDTBA1+6X7pyqBfNe7wJ9?=
 =?us-ascii?Q?SaqwJNeqvISgIKk03hqn7nZyrkp4GNv2b7BwkEnmybp/KBZNm47GSHZ1Pvlu?=
 =?us-ascii?Q?pmUYSLFVu0MHxoBJ2rtnis78kdEavU0h?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 08:49:40.7973 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4a4325-542e-4272-00f4-08dcded1536a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7888
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

