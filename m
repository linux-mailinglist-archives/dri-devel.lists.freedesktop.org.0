Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF2F5B224A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 17:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3427B10EB3A;
	Thu,  8 Sep 2022 15:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2052.outbound.protection.outlook.com [40.107.101.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF5210E714;
 Thu,  8 Sep 2022 15:30:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYYc4fvWmfkAVl2cpUfFVQzouWZWspSRarDteCD5STN7TqbgHOXmKrUSna+3mzaZH/+yjtUUOCQxkFPdEqMdeHFX7Ip9wZMfotu1DODF9ytldi9vSTfTbxDlJzOdSYziFgXvyCHx/QWixiGVlQatN9K91tVkLriKCS9C+HdTasQKqx2CULO4p3TzM7UTYMY8EBU42UwHs0WyBFPFMxQtYzhlKn6+wFH7SVULYkF0OfRUvExqtvpbdTc3k7S+qR8o7wHHXRtqTrQ1XfuFEbZ+jwbQlf8xOHBF/rtj7yGjnlfa87MZ5gcYv6yTa4+KgN8rpsz1R+wuYBZa0pdaMsrMdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6HqduO1asgN1lYLBUuHR26bfmSVGMmzFuSlpLymubw=;
 b=M1ebyPqAZ1e+ZpSODK6XZCBFhp6uIQq4K8EBdFNkZj0ejwriXQG2uNuR/12Nb1FUz6ByOR857WwjV67AxVYrDtiLK2tCFS3BpTYDVjgTP8CdTGbFcd5Uj87hYNCerjhuZSOOQ5RVIanw0e6l73kFoMDoP6eB4DaXEpFpDfzQnKGKu052+ekh5YFSDeQgrXqpvwfqPQjWp15DTuMeKZW8CRxR4sKTXUcezwVztgRgyXRHQgf4eTTTDRgGlW205SDcnBNkF5LtVFl5OveNuDKKALknKaNBvcwNEhaEPEKymZmOaJXBY23/AgilHb15h3IOpXqt7WO1EPQTjfruwYQqHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6HqduO1asgN1lYLBUuHR26bfmSVGMmzFuSlpLymubw=;
 b=siAtUSJI5HkVxbePQFtHK054xgTzHNG5x/EJoFdw7UmQ8TMv5TOOWPbeSr8WrMLTXJG2iGpCtV6auG+VGNZzWhsB/ocK2VMgUs61Lqeuf6Ra4NddFMesqIuFHy8HxqRYoNHIRBcM+73C8HGD8Pf2p17sVWBC/4nXyIJo5oy+0FI=
Received: from DM6PR14CA0056.namprd14.prod.outlook.com (2603:10b6:5:18f::33)
 by DM6PR12MB4514.namprd12.prod.outlook.com (2603:10b6:5:2a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 15:30:05 +0000
Received: from DM6NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::33) by DM6PR14CA0056.outlook.office365.com
 (2603:10b6:5:18f::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Thu, 8 Sep 2022 15:30:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT077.mail.protection.outlook.com (10.13.173.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 15:30:05 +0000
Received: from jz-tester.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 8 Sep
 2022 10:30:01 -0500
From: James Zhu <James.Zhu@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 3/4] drm/sched: always keep selected ring sched list in ctx
 entity
Date: Thu, 8 Sep 2022 11:29:45 -0400
Message-ID: <20220908152945.949531-1-James.Zhu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220907205705.934688-3-James.Zhu@amd.com>
References: <20220907205705.934688-3-James.Zhu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT077:EE_|DM6PR12MB4514:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b15aaee-5a4d-473f-bc73-08da91af012d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XHvBDQMaNurb91Y4YZZh9BidwJIXK20aP24ZLmUaH7M8Hm0QRmMykHMh1/3ms1ZeUaGFnER4rSbeIOsRgubfrORHto/0Jz0PCIpE7hQtpnCDxU0nmr1U3X97CaGLos4sHsLnMGaG7OJmhairuQVdn1+pVoe95+Ks/94eH9IuaKW6jyeTxzD2UA319fuUUQKxTuz9fR6Lb7DXQVy36s1oyCGJ0LNFCNGg6MRPUuvxMSeBROEm3Rq6P56VSx2IWQL1+U4L3ElKyI2ik5HxM5EYcAZFCTYTK5sD5lPgyNhWRJd2Hq/agaskt5ZO4wt02mKCGNSZP/qKtfW00BLC3lrhsBYaQsc8TXkou52LmHTL15rpkrqFPwqkYOJt+cFkm9kdSKHj0Q741Sr/0VBCp2IiC8LsqdpaWdS+uiNHz1evGWxkDsVcfyFkYDD1hUuExgDVowaIqUwq2jOSYJKWBwPiHvaZaX9iy5uRt2CWGjJ6J5+OnL8IVB9oGhsgqYmw8Ki8YSPmlFuPA5wcFcUIM9hsF5wUMxazoyCS5dL5wXuD0d/cQIqpJ8cl7Wog2nmE0Pr3J/iKhYDWxy72AVcciUkivJlZsqyjaMf2U0qYctVG9qJ+EgBiXeklQMIW7bh7py/0c45pGe3FQvW/pQjniKvuYwZuYmJm4mRG66tDb4OoDDZyH/H2Jtqi/qrwSjSc25tQNieScXZLbiruBOgx/gRim5JF8TsOPUpCZFWk9n11JjMhpvNAYTSpQlQk9u8XaOUcX88UzFkDDcIp7dEO8t1bp8r/FobHq7CDy82jTlWNE1g=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(39860400002)(36840700001)(40470700004)(46966006)(356005)(82310400005)(83380400001)(54906003)(186003)(16526019)(86362001)(2616005)(110136005)(336012)(426003)(36756003)(36860700001)(316002)(1076003)(47076005)(6666004)(5660300002)(8936002)(478600001)(70206006)(70586007)(41300700001)(8676002)(4326008)(450100002)(40460700003)(40480700001)(82740400003)(26005)(81166007)(2906002)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 15:30:05.0331 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b15aaee-5a4d-473f-bc73-08da91af012d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4514
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

Always keep selected ring sched list in ctx entity.
Later entity->sched_list can always be used to track ring which
is used in this ctx in amdgpu_ctx_fini_entity.

v2: fixed typo
v3. Update comments

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

