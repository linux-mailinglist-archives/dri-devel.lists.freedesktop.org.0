Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BCA5B0EF9
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 23:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2F710E899;
	Wed,  7 Sep 2022 21:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A68A10E896;
 Wed,  7 Sep 2022 21:13:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOVtu9aB/dLt5ayB+VqG0qPJkMi2Ine64qm5czi/ZRbqZd79tvgmSTHOgKS2wXSyoVkaGkz7jvlsASb7Ls2hJ+p85RDHgj1J6m3NErF/ZaAHgEb8ke4OTjarVEwD7KKDVIL8Pp/vExMvDuyCnoW2aUVqW2MvvvIcuZHr4swq6K4R7hkSk6sxNp8m9AAJbaQUq1Wy98mUyGNlL9mD1BcncDP2PCOrZlw0vCRimJQKku+Eb3HXa0DEVjoiL2aiazWiAXel6kgFIWaTfnFf7wQ8ZQupUj0GQTA0USDRzmDfBiQGBPAY7MnRNTTFqAfizgybomWum06Z5rXkHFC/frONBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrmNhENNDSzEL1lQY2yQPR9c9UG7cgiZ6y0WwAXtTKQ=;
 b=SYsQcZ16NP2eM+1XesywVe6Q/L/MjOmZrcOCjHJsfzuFBm7hH1yKzrA+dklFc9mQ0anLXW43zgsGEGH6ncrXFxKhF1euWlyVTz7glxFWbE3Dl0//+t7JULh+epNmxvRrHIMhvZA49AQY+tTEzr9MJqMFHM9Cja9i8YaZOQV9/ANgDK0equWOGt29Ma4khbXv+cxrM2jdNRYP8OS+bfbwqJuLBH5KXmy/QyXTVNQc+mUs5QGTARPSB3ghTwxMHUE/Xbfwch13Wbs2D5rEC+z2bX/2Vr1+0AniP8qYrpvzjutaRXtZNuOWFjCobLLKBxLHRpxquF4dsL2m6bciPr7OXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrmNhENNDSzEL1lQY2yQPR9c9UG7cgiZ6y0WwAXtTKQ=;
 b=Dhg7LUkVcq5EtKSlsq9D+GZPxlp5DI8kBlmJgEFPVrVhO3783BEtV/h/HKcYUau9zQPzsThGqtOkc9lxXe59XK8F2zmKZwadR5vu2jxFIgfreRoQsGWR48gtPRfK01JMBrzfLczCWFzV0t8ozwuH1OeNLL7AxC+Xpzu6QRczXvI=
Received: from BN9P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::25)
 by MW5PR12MB5652.namprd12.prod.outlook.com (2603:10b6:303:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Wed, 7 Sep
 2022 21:12:59 +0000
Received: from BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::93) by BN9P222CA0020.outlook.office365.com
 (2603:10b6:408:10c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Wed, 7 Sep 2022 21:12:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT031.mail.protection.outlook.com (10.13.177.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 21:12:58 +0000
Received: from jz-tester.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 16:12:57 -0500
From: James Zhu <James.Zhu@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 3/4] drm/sched: always keep selected ring sched list in ctx
 entity
Date: Wed, 7 Sep 2022 17:12:41 -0400
Message-ID: <20220907211241.935446-1-James.Zhu@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT031:EE_|MW5PR12MB5652:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e8981c1-0a48-410c-bea4-08da9115bd80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uiEFPfrg767NGLOhQYz7KFSJyS82odK4II0UEoT/eLvfmhn3Ah2qK1KUlZNwhBU4bval1eiQu01dNTWToKKwrdcFhOhzxudNRv0nTGl8glURV53IKdJjWiyz7bhHX9kDZu4AZAAaYWOaPmgKN0EjfGqi5PchsyarRSM1vySIEVl/6Au3DemB4IDpzSjnTTadEYNAcOThOMSCfLeBw1vgNlnDmuxoTBmr9CzgQWeyfnFYiiJ1aVdH2L2YzeTlG/Xm8/6X+47kFx7NDF9Q36KX2Mt5Bt2rqACAE6J2rrt22rfrUmwsX98Z5GnQghxj1hw7j6zNWDTnRHidx6G+8LPd6Nxik8IlnQUQeCamH8euBY5qOcOZHjFaMcfrc+Fqfblnc5Dya5XWe2rMCmCHfDzCYsPZqaKWAjfNMnAtlZAMf72By69E3gW4c+/Rq0fqrripYwYO+UPQzk36fijxCtZctkAnAOLFSq6QDcIGiHCipiwM2uTEfPZKrNxXIHs4V7YjQv5RJNKRf8ADQlYhHsHaIJTdze1EAKgYGnXTGv1dcHoi9PZY+jdnUS/Peu5yue5uzXpsI9pLFk05CyiOOqbL5gPomDLwNUWcCfZpTR/gl92Ug8FDu8Gc3kolEtLLa/vXYWPkueVdg3hmphmbroFGnx0t27PuxJPaxqm8aW1hDSStpFyOAz6oyL36S9Ie9zhVCeIR5MZyT237mOkwfB36Ne/JaMQhIXKlBrfu06q6oOGEotdX/On4LR9R6I/o6nv571VlJi+7L+DQ+W6ex2ip9EfwpiC8KMmj7AoClqFUTrE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(346002)(39860400002)(376002)(46966006)(36840700001)(40470700004)(7696005)(186003)(426003)(26005)(1076003)(5660300002)(16526019)(40480700001)(8936002)(478600001)(36756003)(86362001)(41300700001)(6666004)(2616005)(47076005)(336012)(83380400001)(81166007)(36860700001)(356005)(4326008)(2906002)(82740400003)(110136005)(70206006)(82310400005)(8676002)(40460700003)(70586007)(316002)(54906003)(450100002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 21:12:58.5393 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8981c1-0a48-410c-bea4-08da9115bd80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5652
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

v2: fixed typo

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

