Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6094B669DC0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA5910EA36;
	Fri, 13 Jan 2023 16:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F56C10EA35;
 Fri, 13 Jan 2023 16:24:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1padJUBKfP2iAnMWli+Q6367XHQjW604q9nGnFmBU7ogj5ZaoJ91dl4l/PrZK/TT2bDnFcuDLIdqfHOE2xkjp4OXJowgoTXtG1alJLwBs7NgVznCXFbbzTZ/lrjJZ6DIBvl+GNEbo1IMwGr3hUgAdxn4ZJOnKsKEOW2GUKC6fRNLk5HAvphFWb3wbALWc/ODkaUUSnL/dc2mWIGv4JxfrVpOCXGJ0Hze/NecM8pxyXX6iKM0N0h+LYjwvvgJQoFcoVJP63ZFVbjFsF85QRXGiohCCNZVCTtQ2FIO4nCJWzp6O4fQkf+lzmbID/XDSMuAWCYUb3Pb9u4Nd/71SIIUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXo7A0+bicfIrCQZ75MCDvc59Zdb8L0twMtTH/p0X7s=;
 b=doFCbEBGY9llI6lK0KUb/ZvY+mm68EA/ZeA+JeIqB7qvUC+wYU4tvMOjzGU5jo+V7vVQIrNI/cfNXVfqKbcnbKqzWyrZO35vwx/98MjTc/E1YAa1m/xH2e/Lar73+AzhntGqGT0a2KtmFFQfSfb972e4Q1MgOWFHxG+8fq/aFloFOGMnBb4N6eb5cBDgAi4LSi+jauOuJ5XHkaKXA19VbKZ1Voi1Htpu/QEiAgCqWTN5IrNk0KUL17mpiyt2q5S4Mn5//97y9Kvz/0G+Wc2FiP6txu6kogtUI2faz+jXVh/04q9cVcQZV+PcVGa/LbycxHtxiGIBut8phxlMFmYvKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXo7A0+bicfIrCQZ75MCDvc59Zdb8L0twMtTH/p0X7s=;
 b=W7Om78JRTIkHXQQZdiT0UV++xXbkJvlJLbLv6Hr7O/oD9tZfO/k0GVpKfqqxzUOU8Ld+yRoGVA0qyamYGESjH5Q9u4fTNNtRF+hgSvRAx3aNcRkGOJD6moj32h4ZIuzIRp7ZQOKYWE2ccPoTuv05ISM9lYsNvq8Lr3wQ4toDQOQ=
Received: from MW4P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::33)
 by MN2PR12MB4487.namprd12.prod.outlook.com (2603:10b6:208:264::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 16:24:53 +0000
Received: from CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::cb) by MW4P220CA0028.outlook.office365.com
 (2603:10b6:303:115::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Fri, 13 Jan 2023 16:24:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT042.mail.protection.outlook.com (10.13.174.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 16:24:53 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:24:52 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 08:24:51 -0800
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:24:51 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 02/21] drm/connector: print max_requested_bpc in state
 debugfs
Date: Fri, 13 Jan 2023 11:24:09 -0500
Message-ID: <20230113162428.33874-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT042:EE_|MN2PR12MB4487:EE_
X-MS-Office365-Filtering-Correlation-Id: c07e05ca-998f-47b9-cf72-08daf582b397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: itUhtY0kEnM5nbPBHa1GUS/idX7r31C+v3bTJ2XbpAellHmPpz/2COlwm3pEclSOZi8WhWTQbNxl5uvdF60lsCl9PB6t6H1lxIUaStcP/B2cOtwO5gjx3sEjdduvM/sbn7vkwPmeEyPW0bx2xLBB26fBOwLGHQ81B1jOW+rgyqJcl6T1sA+9JpgZMxr2552fLgb/ed1P6LuzVjPXtTYaCvbkuAfbz04QbL4U2Bsvmoex2qBcMlMSz+hrULh1zXb9ipup/rxx0Lrsa/fX2OsFNk4dESdBitlDw/yW9jA6jaTJbH4p+w8oRE2sfNuCYn0mb7K8sX2NkR6OpOUCE+nCjZ8kgvGleGSIBqRt+OW5aJ9TnbxDFOFGzLPyt+poqPUbDwDMYP1bRgny7VQAWgfH8SARyH/uJ8p3Bev66dlsPelBN9VI4L2WZwUUfpRDvUhoCrNKNPYpL7iBsLlc80CoeHWISpn2E0484G2WKsaw5oG4dE+7zF5l1/oHwRW3NNbLLhZohi2KdqcjtreHAcw3O7V/uUfGwQflQRaaUCqXl1Y0rTAYS5ZTY+gOuSbOmtHr4yQ/eFiK3hhe9sZY6srFo03HkkKS3JuZfCGNqYngVLBOR3D/v71oMSVjEUZzlBWU0GkMIMgwjUdR67a3fNvtJ3uHyDIJbsr6FGhm3NW+HXiL+wCFnyjbl0VyzLlQly3CKEhU+V3e3MifzTwDE43w5NQTu7PsywXZm3jJTel/aJA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(6666004)(36756003)(82310400005)(26005)(186003)(478600001)(7696005)(82740400003)(356005)(81166007)(40460700003)(86362001)(40480700001)(83380400001)(2616005)(426003)(66574015)(47076005)(1076003)(36860700001)(336012)(44832011)(8936002)(5660300002)(2906002)(316002)(4326008)(70206006)(70586007)(8676002)(110136005)(54906003)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:24:53.2252 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c07e05ca-998f-47b9-cf72-08daf582b397
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4487
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is useful to understand the bpc defaults and
support of a driver.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Joshua Ashton <joshua@froggi.es>
---
 drivers/gpu/drm/drm_atomic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index f197f59f6d99..c0dc5858a723 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1070,6 +1070,7 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 	drm_printf(p, "connector[%u]: %s\n", connector->base.id, connector->name);
 	drm_printf(p, "\tcrtc=%s\n", state->crtc ? state->crtc->name : "(null)");
 	drm_printf(p, "\tself_refresh_aware=%d\n", state->self_refresh_aware);
+	drm_printf(p, "\tmax_requested_bpc=%d\n", state->max_requested_bpc);
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
 		if (state->writeback_job && state->writeback_job->fb)
-- 
2.39.0

