Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8914911CC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 23:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3255B112189;
	Mon, 17 Jan 2022 22:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD333112189;
 Mon, 17 Jan 2022 22:34:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQDpkwMJEzW2GFDM+d1p5I6dyn/cFhVh0aPOPTTKoYA84AYw3hzyR/BuQYyagje/k1CqGX9Jv+viu/ulAQbLI8TKOfHztbClBuD69CZVoeBVhbG+HoV1uBSNRA8eDFYOoyMT1rp0cQG+4Y4GlOqWjnSPXOm83rptJlvANaQSTXyqFTqzE0h+lPvBn0dAJnUppeFoq6egVSsglgB6QV/RvdEOi/e32JN2c23spQcLaih3H0q+GtsidVXu8wd4cXXorOhdgTHlOIZ0HSqruvwPy6kafQdKoJb0GopImb75pqULCwHikaxa7EiYSeJjopT1QGtje8dAqPdd6VBbdi3hqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLTJVsCXn+vdkrfAk3AMNukUZxoMtWO9h8SOH1qK5Ho=;
 b=WBV4ua/WGE2UzqLDRFuqFVYV8GV+tk/s26silnHbidm+Y3Ny7cOpAys1xRuyMU+hrAqIgs/AQX/FxtMmbWbdrzL1ZuoOdqlHBMG21pPj/XHvi1Br2FFpsTApLyJYfauHSKHvc3MkuMFGvbc+02zT5CvFBjFzhRPl6QmS8QD+hGVgzjDbhtB9PYqOyRw/dY3bjR/eZ0zkb9fJpPTIt+PaGh5uUsjusNKffkzX5XgM3zHUCozoz2DSDA1mYl0sPVTrujmC1wmAIlLjSEeVJ8uiI7BYEkKaG9h3w0OuVCq44b/+elIH+wqZlDY9agUbZ3wIpx2k4DnXGgHvFmWddvSriQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLTJVsCXn+vdkrfAk3AMNukUZxoMtWO9h8SOH1qK5Ho=;
 b=3GFiUywf3A8eKNlZUZrUEvphx+2KAUMvFJ7pj74QCDAio71D/260KOZEX9BqzwyAMN0MeoSRoHQQHpmYb5OXjPssW5OS2dyyKpxq1jr2wfvdzLjzZK9SRt8r2VGqWysMf5zXUNbOoJK+ggGfGYV0SRj5VRbM3CmXETpmu2kpNC8=
Received: from BN9PR03CA0136.namprd03.prod.outlook.com (2603:10b6:408:fe::21)
 by MN2PR12MB3517.namprd12.prod.outlook.com (2603:10b6:208:ab::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 22:34:19 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::4a) by BN9PR03CA0136.outlook.office365.com
 (2603:10b6:408:fe::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Mon, 17 Jan 2022 22:34:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Mon, 17 Jan 2022 22:34:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 17 Jan
 2022 16:34:19 -0600
Received: from leo-desktop-lnx.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Mon, 17 Jan 2022 16:34:18 -0600
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: Add PSR version 4 macro
Date: Mon, 17 Jan 2022 17:33:39 -0500
Message-ID: <20220117223339.45074-1-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e823b8d1-32c3-41f4-388a-08d9da098091
X-MS-TrafficTypeDiagnostic: MN2PR12MB3517:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3517C18B8104B6BA651B23E982579@MN2PR12MB3517.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 82nFfQNxQA3Bb0Kvvx33ooCz2GKcDbYqojR8+X3Ho1tNKeNGAeC0P3++wGHo/2hNZ1hOohaxkSdn1O0DByP2+f/yj3sjLjOVFgK9h+gVh4+lYFlvPvOB3BOYnm4bRhCehTZvzx69ON3qJBV15jMQeBdavzhHp8RMocSP9kWmhLjpoIF0TtapDFEcSGC+gMtUNqJgnwnH1b2svY989AlEvl6dAMlgXg4yD6AygWg2JJMGertPOXToe3nqTFchAvISDT01lA7qJme2tEBuPRaCnYTexMNEJlPlA3kMW3xSJWJlBSuzKxTryuQ3OGEaYdAZZhV61axtB1U5mwyIAegBcUwpnFuMKjnNS44sav4AlP4PlHDKwdEQI/3JF+SbsR6P5QQvQ/lsgAX0J+jlqaFvBay8NQkJMREiALTz50aVqfiAJGHk67WvmVuLQs9SXKvRIfQXSvvrCTXpPZGWX0jC/rJBN1G3DWCmA5u8FVxf0GOxcNCg3QNL7gu/MWY74HqLBpWaDyJcafDR9wyJJb5mTupLQb4dZIHbKD3Z65hO3cSJdONRJp03BCXwxZQUIFXf24SsXJT+n+93lKJPFSpDSJ+v0oxvp3Wl05OlNTv7DkYwRxf8jy8JW11epAcdqDXVsqpgPCcBnNNsA17jcltR2XGO357BlhaSAfz6MDrbFFkjNeKq86sdRFnDtbXSKwKQgCaBFZe7Q2xQqX0ruDZDvfhKNFEeS/FZYkSBPVZKGZnJurxAV0AHliKHVcqmSL0ta/UQoG6bhBCtYh86VItcVxqQGZuaPiBSy9qNFBVU5DWAOQ8jWfIHc+QGpSzHqzd9FwyYo/v/ALYH33Asos1lNw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(54906003)(26005)(8676002)(450100002)(82310400004)(86362001)(508600001)(40460700001)(426003)(6666004)(316002)(336012)(2876002)(36756003)(186003)(2906002)(70586007)(2616005)(47076005)(5660300002)(110136005)(4326008)(4744005)(1076003)(8936002)(70206006)(81166007)(36860700001)(356005)(7696005)(83380400001)(21314003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 22:34:19.5728 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e823b8d1-32c3-41f4-388a-08d9da098091
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3517
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
Cc: Leo Li <sunpeng.li@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Leo Li <sunpeng.li@amd.com>

eDP 1.5 specification defines PSR version 4.

It defines PSR1 and PSR2 support with selective-update (SU)
capabilities, with additional support for Y-coordinate and Early
Transport of the selective-update region.

This differs from PSR version 3 in that early transport is supported
for version 4, but not for version 3.

Signed-off-by: Leo Li <sunpeng.li@amd.com>
---
 include/drm/drm_dp_helper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 3f2715eb965f..05268c51acaa 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -360,6 +360,7 @@ struct drm_dp_aux;
 # define DP_PSR_IS_SUPPORTED                1
 # define DP_PSR2_IS_SUPPORTED		    2	    /* eDP 1.4 */
 # define DP_PSR2_WITH_Y_COORD_IS_SUPPORTED  3	    /* eDP 1.4a */
+# define DP_PSR2_WITH_ET_IS_SUPPORTED       4	    /* eDP 1.5 (eDP 1.4b SCR) */
 
 #define DP_PSR_CAPS                         0x071   /* XXX 1.2? */
 # define DP_PSR_NO_TRAIN_ON_EXIT            1
-- 
2.34.1

