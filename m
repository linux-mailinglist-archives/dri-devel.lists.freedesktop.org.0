Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5225B0EB5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 22:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51DC10E890;
	Wed,  7 Sep 2022 20:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3710D10E88D;
 Wed,  7 Sep 2022 20:57:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aseNZ7oBCBCngTSZWMde8Ly1rLMSJUCQRtDczamplHhP1GQtuJCsSfDOteKz7hrhfkq7gRWgHD0MZc0KVmYvRKWOK5AtkeNwjAO02PUof4QHK5sd4jyAv+wsug5tZ97NRLyqxRXlDqTaFa9BAxpMjyiFc/Ko8yzIUeCqa5RnccIZk/QzSy2wmmI6mycZuNFfWz6VVPzH7DbFfQCB13epAYGD82JjuPsgVouD3zDfVdcRMZD/lo2dh9TlT69ttajd+kiXSd9A3LkH6Ve1hDd+DGlgh3SHS5BJk/46ijfgZwY9kuMRdJskJKHLQdTOCAWx0JIg5Hm/Bq9/NHv3yMwKXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wyq3rm8Qdto2l+DCe1eY2/buPWtGVuR+ZzxCJ7WHeLA=;
 b=A1w6XlOCd/b8shI5KsRCX7sz2CU5JVlkXrKbQ0Ldn70uanRc4aLHNF8cOyqyjTjniaLnHzP31R66vc7oYS9FIPX4zrECIYjMD3VX7L0d96ZNi9NBmOkeRJjbj8Fbl1bYEiUK+sWzrZzLswGay/MYZiJy6V9Xg/xHPVNMcGerFAKuDZRoYmoclWH06/mv/YiC1LxXzdKjrap7QqczECUTyhqq4tEESw6syWnKaeWLmF3f8Yb69tlh3DvLIA03SoaOy98BrKdgzKUNNJsGRzD+oV+1QaoNB+ng418txjl+DrIhSKeBTzzTwjFxE/enW5tbT0x2m2SnM+7txrz478DqiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wyq3rm8Qdto2l+DCe1eY2/buPWtGVuR+ZzxCJ7WHeLA=;
 b=vGdv5K2KSRVqcCd6/wcNmlCUSuDQWbx0nRWWbWs2oEgUQVojxT0rqnRnFeFS0cTN6XOQIfqhKehKuRgtfpm9xYaUyX9R0y2Dn8YMVlV3E4vmVeqwXyuNaW2b3yZtV4K9gC43PctEMZRJhSfSBHNry8KquglFWw/tFhh9GocbJa8=
Received: from BN7PR02CA0035.namprd02.prod.outlook.com (2603:10b6:408:20::48)
 by DM4PR12MB6206.namprd12.prod.outlook.com (2603:10b6:8:a7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.17; Wed, 7 Sep 2022 20:57:31 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::71) by BN7PR02CA0035.outlook.office365.com
 (2603:10b6:408:20::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 20:57:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT049.mail.protection.outlook.com (10.13.177.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 20:57:31 +0000
Received: from jz-tester.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 15:57:30 -0500
From: James Zhu <James.Zhu@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/sched: always keep selecetd ring sched list in ctx
 entity
Date: Wed, 7 Sep 2022 16:57:04 -0400
Message-ID: <20220907205705.934688-3-James.Zhu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220907205705.934688-1-James.Zhu@amd.com>
References: <20220907205705.934688-1-James.Zhu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT049:EE_|DM4PR12MB6206:EE_
X-MS-Office365-Filtering-Correlation-Id: 484f7c33-bf50-49c3-1d97-08da911394d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BNmO03/Ej9U991jttVhWqQa3eXPwBb0GJ3nCLswCXa2XkRxKhHk4VN9pKkWTDGGmlvq/shEPVQPX5ycduhU/2Ksx4OZ7wGAWg7YwPc9anyQYjx/j9uhJBlNDGxLQhB1qF4qZ+niDRuuV4Z6JGe98mXfz3zIRy12XbsJCaCgNJfzqhRE4g3umJ3w3QKtOlpa/gyHzanwvh00vzOL35ve4Ou9luLIFuwrA3L9ZMofTmr+VfU3547C5EB3XgncKmy6xoeg2ZQsQQrOapFBpaxhgI5iauOilh00oXEiBblNN3w6kpUDT0t6rdTNGQzBTslpni2D2ezG2UQEsZVBqIe8e6vF32bEz3AekrieM7p9l7G77B4HXBs9kADLafhHWlBTDUMf3x3LaGfe4ohpgC7a/eb3hTq2wbApHZo26dQAxCmJDuaAKNMIm4gnZeSd+fEojI4a5K4H7o7o1yexgGl7/3rjCkEvBmfXhgon8NKx89dPaftGcaHyRLpJ94ADedBVP89Q0Houiy0R+nqXToMOcLrOS4HxYbils41tZt/U+4P8t46ZJUqagU7GzFI7w5rOLjQgRYygk+SGHteX7zHkC3JXGVma33nFKRKHH18eGZA1yOWVtVvl6dahLHGlsfyZ4TBrNIhYVwsXM0yNpQREa60BW6lNA1ozyLnjrjxxooWoOFUkJnXdohI19ZEjSuokmCQD5CYfKhMvYSgQ4kvPsv+uz+um2EOz0H299B78oLkDFD1jmDf5aJwnlq6RsUO4xOO8kMAxHVmxMCSwkpZdGkzigUlSpWCV914T7qu1Vd1Q=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(396003)(346002)(376002)(40470700004)(46966006)(36840700001)(40460700003)(41300700001)(2616005)(186003)(1076003)(82310400005)(5660300002)(426003)(47076005)(336012)(54906003)(16526019)(81166007)(83380400001)(8936002)(356005)(82740400003)(316002)(2906002)(70206006)(26005)(478600001)(70586007)(450100002)(86362001)(8676002)(7696005)(36860700001)(110136005)(40480700001)(6666004)(36756003)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 20:57:31.3162 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 484f7c33-bf50-49c3-1d97-08da911394d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6206
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Always keep selecetd ring sched list in ctx entity.

Signed-off-by: James Zhu <James.Zhu@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index f5595607995b..39dca9cb8e0d 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -71,7 +71,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	entity->guilty = guilty;
 	entity->num_sched_list = num_sched_list;
 	entity->priority = priority;
-	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
+	entity->sched_list = sched_list;
 	entity->last_scheduled = NULL;
 
 	if(num_sched_list)
@@ -453,7 +453,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 	struct drm_sched_rq *rq;
 
 	/* single possible engine and already selected */
-	if (!entity->sched_list)
+	if (entity->num_sched_list <= 1)
 		return;
 
 	/* queue non-empty, stay on the same engine */
@@ -482,9 +482,6 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 		entity->rq = rq;
 	}
 	spin_unlock(&entity->rq_lock);
-
-	if (entity->num_sched_list == 1)
-		entity->sched_list = NULL;
 }
 
 /**
-- 
2.25.1

