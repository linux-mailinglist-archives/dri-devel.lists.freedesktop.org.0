Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BFC64A6DE
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:22:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D283610E25C;
	Mon, 12 Dec 2022 18:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17A410E24D;
 Mon, 12 Dec 2022 18:22:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JL7vrj49984kFH9u8HoEjXYr42Twr8OLQug5fpM8l6IX8uqzymYeCvQd2ijQqPAv9vs8kkD02ROKW0QeEUTmzuYO/ci8jNYYisdtFquaP1yADzhK2tP7CUBTIulDCQJPe8OarNgb6chQQCqcTJPLpezdtPkSCL1myQKCYRd36wYknE2CltUkDI6OrgWPk5NVjEoBYz4NXqgr1Eh9hdZ7Zz1rs2xfGrWDabBowEhrdGpvuMzgwoW3ppTwUMDR6a6WMiZDffmKcoss+/MYQ0vlyl8WiEFbpvMdA58moRGR04pOuGbKqzRMHQ/buyW/ebBPM6AAz9tfaTNUHgjV/APCrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTWKeSe4qe1+T8w6tUhAOTq4ROQ1dXNNzsXiU5otyRA=;
 b=Jmmi4kEN/Cx1WORwQyVY758GiJ8RFrLuDSuRbkMZZjdVSFDD+AS3BUzpLBxAizrk1JRL2bW38C/c/Cf7R58hENwGPj21cGIhS2I6zK9t7fX3eGy4mwGljyreZ+Bp2y/eR9XuQzwhjKU4NnxBJQg7x0pwydQQKu2GgThMc8A/JxVfamqFz6jIOejL/q6mIT176ZdXdKmbPx0EzTQqkMtlT74O4mknRjS3KjZMFeFPC6JMB0VILYVW0CvhxOjtCs6/8CiO4GiY7pn4D4TDA9wSBHj+7nYlOPv5QMpe2HBRE46wa3/S9aPrqQJk/Gy57UWZn3SRYT4+G19K0DKT4ru1Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTWKeSe4qe1+T8w6tUhAOTq4ROQ1dXNNzsXiU5otyRA=;
 b=L6yudXo+/zlkJXBJN0JZ92qOSdJBqsuSkKawd3gfajesXWGt+S+lB480iWKq/NnFWv0DjbhQTCKt6dNcpM2bEjE7DvwSWp/6xnIrqm1T9P3MUWFnopFlzPyDGtNi3Xo9vu+Dbq9TDtQqzTFqmJP3NwxwNjJSfk4qzIci5k1DxrY=
Received: from BN0PR04CA0098.namprd04.prod.outlook.com (2603:10b6:408:ec::13)
 by SA0PR12MB4366.namprd12.prod.outlook.com (2603:10b6:806:72::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 18:22:06 +0000
Received: from BN8NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::64) by BN0PR04CA0098.outlook.office365.com
 (2603:10b6:408:ec::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 18:22:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT103.mail.protection.outlook.com (10.13.176.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 18:22:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:05 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 12 Dec 2022 12:22:04 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/16] drm/connector: print max_requested_bpc in state debugfs
Date: Mon, 12 Dec 2022 13:21:23 -0500
Message-ID: <20221212182137.374625-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212182137.374625-1-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT103:EE_|SA0PR12MB4366:EE_
X-MS-Office365-Filtering-Correlation-Id: f664788f-b7ff-4d44-3a57-08dadc6dc65e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QVHehbTVe0RnEfCs0rwHPU6J+B59b8W/vELG68PLaBOuO4l/CCQCJFoDY7PdwM8A1jY2dMUDCcetXBSCMjY3m/jBQ0NP16PRm77+NJNrSIoxBTDlMe/z9W2qfKrhaPDWriMI8+ZqQstsMlMlqbozBsF28NseP3vddKp25VZx08wEOdcpvf7Qq/1dX4pGv3N9c0r63YadbO75JzDxjnyQ2uvzvOsKx6PtuxnZTd2aRwJmbDu7gZdJ23rsjDLu2AeHCRcxLH0ElGFYQTJmAHyRVpi2BABYbi9YQTyJm3d3t1q+U/yU7WOcbTLS14q3S7CM9Jl4Dd32HqhcGcCGDtXML+RGDYB8txVQAhGvRY1XBhaWm4rnoWSp3+MCWQs209uo18uDzmuH2U4nrO6RB9n/iPceBk5rkdxSr3Ql6XvzYbrvat/lKeKYcMxRmkpNvNy4koLWwEqxAZulXoZvooolxSkk42w2Lb8teM5Mi7zQYmfnrXrWMY7VB4PVjaYxEWDoYmD50AyEX2b+cEmM4kVL45K3v0U67Kh1ZNvho5cvq2xb70XvS0binU/eUY6Y4X8A5w6obMS11No+8UICKp0q3XNcTEpMvMIdIOs/81mkort05YLwlvLWQeRKIubpzB9Hr8mgFCbrWMVZarF08dkmnllGKtXis5sgqQV60kvcZXXRmS8E90Eafuf9XSYsRpjN+aXScTwxc3oxmJwRSHklHfsZgwe8aq885ppWAmLlpDQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199015)(36840700001)(40470700004)(46966006)(70206006)(70586007)(8936002)(336012)(4326008)(2616005)(40460700003)(8676002)(1076003)(81166007)(41300700001)(316002)(47076005)(186003)(66574015)(26005)(356005)(36756003)(426003)(83380400001)(36860700001)(110136005)(82740400003)(54906003)(2906002)(86362001)(44832011)(40480700001)(5660300002)(6666004)(478600001)(7696005)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 18:22:06.1925 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f664788f-b7ff-4d44-3a57-08dadc6dc65e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4366
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
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
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
2.38.1

