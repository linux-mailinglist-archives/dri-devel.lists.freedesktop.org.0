Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B496AE41A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8A710E4FB;
	Tue,  7 Mar 2023 15:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E827010E4E8;
 Tue,  7 Mar 2023 15:11:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzJUHNwD+mtf39bCv0qhY/R6+RlKE3swixcwfPlaKbMK9JwQEEhdZTTBYh6Wd414baZscjnbzHwLFb1FiVRZ6ouSsSkPf5ZCBfYMO8I5II2OsuAFX/zGA47olH9/7ml5HeJsLh0wSdqNTics3JAzHazI4RWLNgu+F9sRd5wdb02e6fEQVHPe1cCj2mVjcA0Q8U/pvfPKkOyIViUDo+GsXcBfemi7reVI7f9R0Z2k8oT+Z/eAde6eIks/DA5Dchg53PsesFd7LX1x+bejQtffy/gizq9eG5nacnJQ2rqm4ZmtpMH3o1xx18mTrsStu0HSm8JSJFiCOJ5/rnp+x3IDXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QcWJCpvm7NquZn7xsFYACNDtwaet3l9Y3zKd3ejWv8A=;
 b=Esr0x/Rs+rkraE19ZIIv4aGL3DlceHHYBQll+pQGhjEKT2tL66EzGofLPz3TNG5n854wwnKRptCNVfHD6WqUbTRK6zCSXpzoFKClb6TspOeoR+iEmQFI0pqFC40cHz8dp5bTfHt0yDa7Zf+MasBXad1kIXPZ/NZi3IWm9ORtTNq0UwSf2I95R20/tcV8r0BZPpFoGZ86Y0eZiU/g+QjgETKRZpiCgZ8W/QwhWGNVXknlV2oV2KNA89QoQ70XOElIEUt6/RqxJewlfg7iGdl87BfhQhaQYxDyZWaCfCl6ixsZob5qkeq8WApg5mFJU/TqFFvAGJytOPyRUmlIkLBD7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcWJCpvm7NquZn7xsFYACNDtwaet3l9Y3zKd3ejWv8A=;
 b=LN0AlI1QHKjpg9F8A0DkgQzdBh+3G5oL3uhS9LuBPiUR1rfSsEWneNEi07m3xMEkDrdqkebNsUkB7DbiUX0SxWxQwer+YR8xIvvj647EInby4JEPpXym48EvlA3J/uNY+lCYgejHsUFg4iJAocg6hwYTZMcdH6qgAcklxTBkHIA=
Received: from DM6PR17CA0025.namprd17.prod.outlook.com (2603:10b6:5:1b3::38)
 by IA1PR12MB7639.namprd12.prod.outlook.com (2603:10b6:208:425::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 15:11:27 +0000
Received: from DS1PEPF0000E633.namprd02.prod.outlook.com
 (2603:10b6:5:1b3:cafe::44) by DM6PR17CA0025.outlook.office365.com
 (2603:10b6:5:1b3::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16 via Frontend
 Transport; Tue, 7 Mar 2023 15:11:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E633.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.13 via Frontend Transport; Tue, 7 Mar 2023 15:11:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:26 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Mar 2023 09:11:26 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 12/17] drm/amd/display: Always set crtcinfo from
 create_stream_for_sink
Date: Tue, 7 Mar 2023 10:11:02 -0500
Message-ID: <20230307151107.49649-13-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307151107.49649-1-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E633:EE_|IA1PR12MB7639:EE_
X-MS-Office365-Filtering-Correlation-Id: f4494c54-f947-4e28-5618-08db1f1e394a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y23G+Y3p9Ts6xQqB+qDwhtKiwUdO6EFhdqW0vyQJfPxB2Bgyh2KuKAzzAvLyVZzF8ps8ZuduUEUQ5EajHjwfU8sG8lt0pq6yC6Gt33Tam/oKe4ObkwBdOcHIBiwP/xcOzRCh4ZUVdivoMXEWPpcKIY/Eawza7zspiIZJow1BtCrMSlVI+aeLR8vubThCvY0NumTYYenKOqunni413WNf2pznI+oFp86F9tz2GLMtNbvuQAdDYaUkd1Cimhs97Dp9svO80j0cA4y/7dC7I24nAhnJS9iQ5pLghzKs6UmTRC71DaOZTjRjSkpAcrn6rJgHd6/+yWjSbn+jgi9K1DXpkLirXjZfRja5YOoOI/9aVNQBZlbb4xdKkFjY//MP0R5arqvagoQZWRfMg2/LBKsmS7Dcki8FlYqT5XxjZViWGdVZN8qf/b+noP8VBgOul0de6dfNr6J1OTWvB1ID/RieifhTWotG75NC113SGJWn+Qgx/PZc1tnVYPEwhHemvhmIELNEHbUzx+nczPBxzB0NKumlfvdRQSQTK6eWZ2O/ZcRKmGtwh1xL06BZ9rEulosF0aPwIKmZWI5YI4Tj0IVujN5zCTf3+iXSPPpP433jnO9v04vVSYbAfYzYPffeyrOzJhsXGqgs88ck6ZId9bBL7WVwzvGguXEn4TUJasRIF7kWSpQn2G8VcBm4vHrssBFiYFLPh0LfwyIrCpiMEbrAj6d9FfZJVOX/I2hk5YTR2k4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199018)(46966006)(36840700001)(40470700004)(8936002)(5660300002)(44832011)(70206006)(70586007)(4326008)(2906002)(8676002)(54906003)(110136005)(316002)(478600001)(6666004)(426003)(36756003)(47076005)(36860700001)(1076003)(26005)(2616005)(41300700001)(81166007)(40480700001)(82740400003)(86362001)(82310400005)(356005)(83380400001)(40460700003)(186003)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:11:27.2928 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4494c54-f947-4e28-5618-08db1f1e394a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E633.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7639
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joshua Ashton <joshua@froggi.es>

Given that we always pass dm_state into here now, this won't ever
trigger anymore.

This is needed for we will always fail mode validation with invalid
clocks or link bandwidth errors.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index cdfd09d50ee6..580d076b7749 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6010,7 +6010,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 
 	if (recalculate_timing)
 		drm_mode_set_crtcinfo(&saved_mode, 0);
-	else if (!dm_state)
+	else
 		drm_mode_set_crtcinfo(&mode, 0);
 
 	/*
-- 
2.39.2

