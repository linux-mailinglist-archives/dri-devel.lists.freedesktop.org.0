Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287B739245C
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 03:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559856E8B1;
	Thu, 27 May 2021 01:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334936E8B3;
 Thu, 27 May 2021 01:31:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fS/qpCWNd1mIYYyhZW/6HQrt6Gkc5KFrMSXPnWUnzE2+k/q/A0JeCCU9rEjc/hnNIWpQE76fEjuqL004L7OeIk02aklYCitgKNAQSbnci91iB0C7pGxgA4TzHS37pHyiNhDwauHFS7CFMQRqrOzrwR+LHqsQZDtJvpW7uCglv3tLYBBuGcEqU8206AdecfT+fIsWRwmVvCjIhdqE8f3nzPvS53j/h+RfdMCJgIjmo3vC3/mTVROVr1HI2rU6zkCG+njntccLW2guHJJJeDoLFfFLZBzPl6u7SAQ9i96loZ746j6rojfSPsZ3MZWq17+9BluGxn1Kn0OMPPUAb24aXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yljrt8DYkVPpWx4bMesEXValYXYYiNa7OsZD43MeMbk=;
 b=IijDQSol6+SWsOgRskYz+Rkc/IhGaHrJLmzWE61iEt64jRK/8My7aRRtsgyv4jPC1F07d+aYzbfv2fsfqOH9BWW6wV35Ly03m99KTee/wE1yh6KptC+NpZsB+nVAGJ9pg+rf33XpOlP9+9pv0D+yKPRTS7LSXrEwOknAYnw91bieH+LxFr2KqEhX5etuZiEyjJnqymU2CJYt9+ca4ckXlcrWzynL1CISlVEB54Im1SWlgQJVJOuQc3CHenftythnwkSfv7BvDkxv52jRk3QW6EJhnqeHfu6T18xj8X4wkudBNOjkuaMFg5At8zfvXjy1thUmYtccj4cH+voza3/CnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yljrt8DYkVPpWx4bMesEXValYXYYiNa7OsZD43MeMbk=;
 b=X68bLQClDZmyPPmJp10Qq7/cnpXLGfBBTtwBeT4Zyc9RYHKeoSshcjkquX5806+gjgkiKDoavthUprxdSiHXH3Dh8OE+YVmBsDySrNwfsPQJa7t676srucYO0CEJV5je+fRCF0y2mcW7dJPSlQkyXLstysnoW46TxrDziiKowNQ=
Received: from MWHPR04CA0034.namprd04.prod.outlook.com (2603:10b6:300:ee::20)
 by MN2PR12MB3389.namprd12.prod.outlook.com (2603:10b6:208:ca::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 27 May
 2021 01:31:17 +0000
Received: from CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ee:cafe::e8) by MWHPR04CA0034.outlook.office365.com
 (2603:10b6:300:ee::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Thu, 27 May 2021 01:31:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT021.mail.protection.outlook.com (10.13.175.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Thu, 27 May 2021 01:31:17 +0000
Received: from lang-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 26 May
 2021 20:31:14 -0500
From: Lang Yu <Lang.Yu@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: stop bookkeeping of temporary GTT allocation
Date: Thu, 27 May 2021 09:30:51 +0800
Message-ID: <20210527013051.4302-2-Lang.Yu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210527013051.4302-1-Lang.Yu@amd.com>
References: <20210527013051.4302-1-Lang.Yu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc065cd7-577e-4681-1ae3-08d920af1fac
X-MS-TrafficTypeDiagnostic: MN2PR12MB3389:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3389B14364B2B8A1A1D03FF6FB239@MN2PR12MB3389.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /JqPwzP+EEnzOsmNgDRzyXM6KFdKP+hnfxcMsY6lUlgPvcG0elxpVHeoQa7ogacpyHgPyxrcdkq1wINd1029aNccueZIL8BlvRreT9mW6HZ0NxD17GxFr7gexsNjB8MjbVVCXQRDX3Zse83rY1+oHtdnn1G34iDaPBVWsLm6QvAj2cxpXLcYJHtzYLVXd65aPgotnFyfCPhbTjsMfhodgn/x1xpcNK7RdUzZELMfXkMzADmBM1zhvZtGRUHmWC26Hys6VdqIqCVQQOjXzgrS5MkeyMd7yQtcWWiGdum3+0hWXR1iLBcnWKmcJceiGt/E2eM+KXbPxrLibpoLQsVkssfZYlo+MiSfnYp1lRTn5HoZ7ECtL8lD56yaYNImNeLmCocCklUSPDgl6obmNT6TEUiDyWxDVADlAk29CPGUiSyprEvLqM4Oewsr9XGmDAKNeP6mQX5N9jG+cvr8LdSduHuWM235oIczkRH242+WETrVG2jlNXP6F6wZS1JCwtCopLEzDPxxpoL+3o9+CSF4b269ZbbaNXCNiaJjuHqJPK2E5gwngKtrFupQeQXilGa8atMaxiwQYrVyBRJhbl0zhCF+bb6NJv3IdGH41FcZN76HMAeY9yeQa8bNv0sUYcVwsjoeINLnhFB4mcopay8l6RTULDNzppQtavgvbLgaZTnLxqj791fx7luJ7f99WoC5
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966006)(36840700001)(2616005)(82740400003)(186003)(82310400003)(47076005)(26005)(1076003)(83380400001)(81166007)(426003)(8676002)(336012)(2906002)(110136005)(86362001)(5660300002)(36756003)(356005)(16526019)(54906003)(6666004)(478600001)(4326008)(8936002)(7696005)(36860700001)(316002)(70206006)(450100002)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 01:31:17.0765 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc065cd7-577e-4681-1ae3-08d920af1fac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3389
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Lang Yu <Lang.Yu@amd.com>, Christian Koenig <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To improve buffer migration performace, stop bookkeeping of
temporary GTT allocation, including allocation for BO evicted
from VRAM and bounce buffer.

Signed-off-by: Lang Yu <Lang.Yu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 16 ++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  4 +++-
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 8860545344c7..32fedd495c7f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -111,14 +111,15 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	struct amdgpu_gtt_node *node;
 	int r;
 
-	spin_lock(&mgr->lock);
-	if ((&tbo->mem == mem || tbo->mem.mem_type != TTM_PL_TT) &&
-	    atomic64_read(&mgr->available) < mem->num_pages) {
+	if (!(mem->placement & TTM_PL_FLAG_TEMPORARY)) {
+		spin_lock(&mgr->lock);
+		if (atomic64_read(&mgr->available) < mem->num_pages) {
+			spin_unlock(&mgr->lock);
+			return -ENOSPC;
+		}
+		atomic64_sub(mem->num_pages, &mgr->available);
 		spin_unlock(&mgr->lock);
-		return -ENOSPC;
 	}
-	atomic64_sub(mem->num_pages, &mgr->available);
-	spin_unlock(&mgr->lock);
 
 	if (!place->lpfn) {
 		mem->mm_node = NULL;
@@ -178,6 +179,9 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 		kfree(node);
 	}
 
+	if (mem->placement & TTM_PL_FLAG_TEMPORARY)
+		return;
+
 	atomic64_add(mem->num_pages, &mgr->available);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index c0aef327292a..129d39392859 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -152,9 +152,11 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 			abo->placements[0].lpfn = 0;
 			abo->placement.busy_placement = &abo->placements[1];
 			abo->placement.num_busy_placement = 1;
+			abo->placements[1].flags |= TTM_PL_FLAG_TEMPORARY;
 		} else {
 			/* Move to GTT memory */
 			amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_GTT);
+			abo->placements[0].flags |= TTM_PL_FLAG_TEMPORARY;
 		}
 		break;
 	case TTM_PL_TT:
@@ -538,7 +540,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 			hop->fpfn = 0;
 			hop->lpfn = 0;
 			hop->mem_type = TTM_PL_TT;
-			hop->flags = 0;
+			hop->flags |= TTM_PL_FLAG_TEMPORARY;
 			return -EMULTIHOP;
 		}
 
-- 
2.25.1

