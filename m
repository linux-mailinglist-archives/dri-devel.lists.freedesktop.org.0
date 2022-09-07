Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF8B5B0EB7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 22:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2FB10E894;
	Wed,  7 Sep 2022 20:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5996E10E88E;
 Wed,  7 Sep 2022 20:57:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tlm1XbYRbXp806CtLqgnJeQe9LNGaYf1SI4Rq+yncGqtAzdt2xLdW/cVqyzcaYj1e0x2jsGGOG6PoXeHcHVWvyOig56t8QFg2j+KxtCLTWvFRCfW2p6lZi5R4APkp/R0dlrf4Pqn0nqEcj+sAocs0HhLTXHZW1H8P18mCyxMVbhq2IqAHTGv7ifMW8Rln5tTK+qNay6g/yX7EwRbk3zQWuV3IsF46jKQS0o7zKHORcH+7+4qzRbk/Kf9eqQo+1ls2Uuh3aSpH7XvYL1QUXnV6LdohzAtbXN6kcI+YbZST74+8fEwZkO+mvXQWDlKfNYqIFWQjzpDP0S1ifKtDM2Gtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qN5vy5NuWqYy0Wqw4c0wXlHqSG0ce1NlPw4fY35hgY=;
 b=FtOMNIP6hdCUqgfNW9Jx35ObjPktgZGSWOB91Djv8t1kupCL4Ax83ADWCCs11EP0I53yjr0+6gczeKx12ZDcz+z4YYHtAQjTE30EDeVtV7YjyksuxAmk5hWXyZti7Ugj1koT9LSNy0czYZhVT+ffFXHudqvJHkl8Qe0GOAixxiOGmV9LiqTcbHLsxED/gPmPSweEE0YnyP44p0nILh4vTYeB1eZAOlEuLTZOzSogmXMcJNe7LUA982i4JJJmsmy7klIeuJoDGJPLL0M8cJXlo5XBH28qlqxv9afmt8KvjwNdXeghjI8H0ElKeWc/zpqES70Ctv5LONboTwqBm4OOGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qN5vy5NuWqYy0Wqw4c0wXlHqSG0ce1NlPw4fY35hgY=;
 b=q4/Z6QXLyXJCXmnU9zwLzOa8YT+HWjXf5U7/inyBpPQCblQpQq6CP5vSgIJl0i2A8Lh5uo8E0pjoEweJ89cOFv9psLzHs36e67C/ZbPcdysEdLZRulcNxOL9sNs97KfJHeZu6j67DCoHfCVyaLsL7n/2G4v9jejUS7uFvfZvqMw=
Received: from BN7PR02CA0007.namprd02.prod.outlook.com (2603:10b6:408:20::20)
 by CH2PR12MB4152.namprd12.prod.outlook.com (2603:10b6:610:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 20:57:31 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::83) by BN7PR02CA0007.outlook.office365.com
 (2603:10b6:408:20::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
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
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 20:57:30 +0000
Received: from jz-tester.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 15:57:29 -0500
From: James Zhu <James.Zhu@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/sched: implement new drm_sched_pick_best
Date: Wed, 7 Sep 2022 16:57:03 -0400
Message-ID: <20220907205705.934688-2-James.Zhu@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT049:EE_|CH2PR12MB4152:EE_
X-MS-Office365-Filtering-Correlation-Id: 76ef8c1a-9187-40a2-e608-08da9113949e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WvFLc6pn6zkJAL+IBeBcpr3RNjivtzw34hbWNnrogVUWwbA7SlVyC3cEQ1mdTSVwh+mExTU3/W9POxt0/hfgc8weHMtvKd9UYu+OY6Bh/N8e0Pzg00T/E5L7NdrripGgRQfzonS1w2O88Leni0DRhED2VYjB6Nqy3+kgtVXqHjGdCsJIwC9lC+bI1J87VDjVBBzq/DQC1fpJP8s9ba5mK2O0kGltGP5qwkqU5vXhmq0ExgJAw6GilZNn6yi9Xvlnz6GdVVO7phFLrLEjgjkN5gFZexiS1XTyHYXqkbirVPTC88D4waSCvNXFYOPiYICa03Fm7oixekALaeNrvXqnoPtibsPIbMlqdJSEYApTLXXtoCG5kOaQt3ZG2KAhf2PzQTKpKZmbiO2s6V7VrHgaPnc2ALpFPR991HWGjF/bbMVu6DNTgSyAqixIqaW2WxGUkTPXNcxV12DB9Q++oA3GXiWqnwTbG2q1IsmZb4CmV7uyprnU+FdE5bHw+5g6jYBXY7eQEJ5kG2lNzfzyPt/79NtKBkvXmP67ZNXbDfCwK2KBr6Ln7XfFCz+F6LJURaKczo0aodu0KuDzgOcu1H1dYgKU7VWr8dYacb2oe2cpaPMghXkbHltN1FcW1i3JEo7BoHwUzy1HvY/q0sPuytYi2bWle0rzBYBLwSGRL7ew0LWvRsiBpu5Oy8XPVZMsPU80TRiRDKrJ9ngx6jRq2+fhxQNFAsqWAypVBnyWVWYdb1KcTr1QqNrKIRxKDqsscEkdrksbMrfkKbj6lnSS2of9t38gkEtPhW4FC7nfgEIfcNc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(136003)(346002)(376002)(36840700001)(46966006)(40470700004)(8676002)(83380400001)(40480700001)(2616005)(1076003)(186003)(426003)(47076005)(82310400005)(70586007)(478600001)(70206006)(4326008)(336012)(7696005)(36756003)(16526019)(41300700001)(26005)(6666004)(82740400003)(40460700003)(36860700001)(81166007)(86362001)(8936002)(2906002)(110136005)(54906003)(5660300002)(450100002)(356005)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 20:57:30.9569 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ef8c1a-9187-40a2-e608-08da9113949e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4152
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

drm_sched_pick_best return best selecetd ring schedul list's address.

Signed-off-by: James Zhu <James.Zhu@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c   | 14 ++++++++------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 191c56064f19..f5595607995b 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -475,7 +475,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 		return;
 
 	spin_lock(&entity->rq_lock);
-	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
+	sched = *drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
 	rq = sched ? &sched->sched_rq[entity->priority] : NULL;
 	if (rq != entity->rq) {
 		drm_sched_rq_remove_entity(entity->rq, entity);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 68317d3a7a27..111277f6c53c 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -863,12 +863,12 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
  * Returns pointer of the sched with the least load or NULL if none of the
  * drm_gpu_schedulers are ready
  */
-struct drm_gpu_scheduler *
+struct drm_gpu_scheduler **
 drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 		     unsigned int num_sched_list)
 {
-	struct drm_gpu_scheduler *sched, *picked_sched = NULL;
-	int i;
+	struct drm_gpu_scheduler *sched;
+	int i, picked_idx = -1;
 	unsigned int min_score = UINT_MAX, num_score;
 
 	for (i = 0; i < num_sched_list; ++i) {
@@ -883,11 +883,13 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 		num_score = atomic_read(sched->score);
 		if (num_score < min_score) {
 			min_score = num_score;
-			picked_sched = sched;
+			picked_idx = i;
 		}
 	}
-
-	return picked_sched;
+	if (picked_idx != -1)
+		return &(sched_list[picked_idx]);
+	else
+		return (struct drm_gpu_scheduler **)(NULL);
 }
 EXPORT_SYMBOL(drm_sched_pick_best);
 
-- 
2.25.1

