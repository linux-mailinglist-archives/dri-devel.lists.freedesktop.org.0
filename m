Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B4B5B3DB4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 19:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148F210ECD4;
	Fri,  9 Sep 2022 17:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752BA10ECD6
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 17:10:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4DbwcvuzE8vSHm9ndSHCZ8674gyET0px2500AqYFwxXUU0Noogi49u5JA2V7CZ7ZUO22LZyU0RmIizJfeYf6wz190aQWVPN89EKmBQVfu6l2VP96JqZan5nk9oj9HfxFiGPL1RZaixvcW1Z5enlPDa/aTtmH+Pp+jrOMeyuA9c66YP7xkYdc2YbwNaLdjjGmBzxr52rfBJFVwZMv2xNIJjewxSJjL8KGuRP2YlUZrxnbGlnprJBxuiEdpFyKFvo4orl20MfQ7QmyBemGWwknMGPsA4hQMjxKJwDvAM6ApShXMba70r8ECRk3N3x+hWyU71KRhFDQz76K5AtgBuaHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeG6A3HdzptA8n232xcIUrqJ7BPsPgjc5dcyC9SGKMI=;
 b=dgj0xlaSnJmcHhwUrZXMewCBTXSeuPR9N/HWt9DmkEAHHxU4mTOlgiZjOv2l37WJhvbqWrWe/u6Tvaj/jInJYCbXQaBQF9oRE8HeKiMbyAFcEVEkrQdMtz13QPOCAh+NIdF9cvaRE3eWfbNqiY6rgfn8sIf0XQnKkM6hxYhifFMTehF+BHELonUi3xLz5s3lVu0KvB0UJQ8RSZdDPX0xEpQuKKumqj8FnAJ0HHxPqRX/UhIFMgPZVQRMuVqLS34hj2nReuAcYqyByBhzIS6lOlccLZxVyUwapo/eSFjB47G3iY+/NRODVWz5nR9V2EXJNwsHgyM9J5nI6JAU4MS2iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeG6A3HdzptA8n232xcIUrqJ7BPsPgjc5dcyC9SGKMI=;
 b=No9OAchlEd1aXCJqw/tgJmHkKxMhzDs0deU0EZ4E9eRP41itCXWNywc6DtUI4x/Yuz3vXZD1IQ7+f14ArATODGIrPXm4JDGfvGdnVlqfOBIxYyGtY6KWR7sZN3JqqR+VN1owrIdG4jhUFsG/EJZNPwfAPlpi+OJgKFhVGlGNWKU=
Received: from BN9PR03CA0659.namprd03.prod.outlook.com (2603:10b6:408:13b::34)
 by BL1PR12MB5253.namprd12.prod.outlook.com (2603:10b6:208:30b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Fri, 9 Sep
 2022 17:10:50 +0000
Received: from BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::aa) by BN9PR03CA0659.outlook.office365.com
 (2603:10b6:408:13b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Fri, 9 Sep 2022 17:10:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT113.mail.protection.outlook.com (10.13.176.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 17:10:50 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 9 Sep
 2022 12:10:45 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 5/6] drm/sched: Use parent fence instead of finished
Date: Fri, 9 Sep 2022 22:38:44 +0530
Message-ID: <20220909170845.4946-6-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220909170845.4946-1-Arvind.Yadav@amd.com>
References: <20220909170845.4946-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT113:EE_|BL1PR12MB5253:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e1835cf-fb11-49d4-2d58-08da92863ea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6DeTFL0tGan5TYZSE5uRtRYb7JE6eo25R0RFg1nZumvHeE/eOZ90uINfCobyMoJS+LSG7a65x6nJ9fX2kYPvq7HmeZO3+wujAnPqJ884Mlc1Wh+qIzN+iuaAG2Ud27mzHwORpFdmqEGO91/4uxfPmwSf/TIJAqDFBFZDKnTKbDwI9fQlIS5GJYKqakJgEpLmQ13z3wOjVljwdcd2WOa6vYmchasxRMhzDTq0zucFzrA0kcLt60wWoAtXK9/SiJKe9W531Vnu0tfUw7OFvSqykwZeTcZnB5b48FkbWWtjIPcBfyg5BvoBMy+4l+ZdjocfIVj2H02J4ZJurRB2IANEi+0epPIP8xRzJ0mE3Xt0g8iB9TwD3OdZdgEdw2/2yiRsVdBewnpU8yFUnHrtkPd6lFE0RBcFs+pbaNL13C4Unm3ZitMMxKIyMKXI8eHGsYz0F4iw2OvrnMR10y5GWbdCZkBJuDYXqcLdO9rEC1CPFyimHXY/sSKMY7LsWd+rJED01/74orciwRRPG42i9RGcrlfvwuBHVnwvEKt1UxpdMnIDJnJuUiodAmV7h206yiwZbX6OBgE2W+5HCP+zOOzZNC0IsaH4cCe3pbjJ1NBfQFVJ7E2uckPH7grUgqpKThEXqZwu2zasQNyRejv5vIc0HARzMLNR3tI+Nwz40sWAcTfcFyjNpCIddHwn7ozPOYOVRtWRISVA/JP14UIz6OH1qsgGg5c100av6qb7qv17slwmXP/Yd5nHloNkFcOLSyIEMc6Zu9KjEMRBa4oecG297nmdmcLe3A8aPCRcSlMoUHR9HCJRFvk7AA9LacXPsk81SGO5dAIHXCndrMxfqicHc29RcQusjixbfroP2q0L5uLbpyEM4mRugWNyMaZXnmNd
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(346002)(376002)(396003)(36840700001)(40470700004)(46966006)(36860700001)(26005)(82310400005)(7696005)(86362001)(110136005)(316002)(41300700001)(478600001)(82740400003)(40460700003)(426003)(81166007)(2616005)(1076003)(186003)(336012)(16526019)(921005)(356005)(47076005)(70206006)(83380400001)(2906002)(4326008)(8676002)(8936002)(70586007)(36756003)(40480700001)(5660300002)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 17:10:50.0072 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1835cf-fb11-49d4-2d58-08da92863ea6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5253
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using the parent fence instead of the finished fence
to get the job status. This change is to avoid GPU
scheduler timeout error which can cause GPU reset.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---

changes in v1,v2 - Enable signaling for finished fence in sche_main()
is removed

---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index e0ab14e0fb6b..2ac28ad11432 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -829,7 +829,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
 
-	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
+	if (job && dma_fence_is_signaled(job->s_fence->parent)) {
 		/* remove job from pending_list */
 		list_del_init(&job->list);
 
@@ -841,7 +841,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 
 		if (next) {
 			next->s_fence->scheduled.timestamp =
-				job->s_fence->finished.timestamp;
+				job->s_fence->parent->timestamp;
 			/* start TO timer for next job */
 			drm_sched_start_timeout(sched);
 		}
-- 
2.25.1

