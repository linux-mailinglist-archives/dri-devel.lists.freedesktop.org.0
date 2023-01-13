Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47815669DF8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9A010EA5D;
	Fri, 13 Jan 2023 16:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901BA10EA45;
 Fri, 13 Jan 2023 16:26:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6oopLTZyOLOPQbzfPdSQ6/3hzDzN1bcvSRLdYFlBlJQdniLyV4cKo3AikqwBEGx5tZy9V6ymdjHUtUQcnrpm+3jMVyT2jz52+fCe1/xlOzauqdW+VSHGQezBqslI0mtc6cMYrury0LHxfOatt5J0QXxuW2hGpXvmGnghG4PSEdN2Fy7G2aMSYgyVbSgYnrGBlHWyY/gySnrqcJtb+PdDQuJESkdEl6cI6RipxP+1gqoqB9Mlv/Twg6aZfqOInwSVxhKhtqqnmVLPnSFXd7ekLr1DDBzT+5d/CRRXnUHiW0fOl63i8ngECRY2eYHuw1Sex34TzzTIkOQi3kAgCc1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxkXtenKtpPvF5Go8LPJnoR5/Bpi+HyQB7bNy92vT6Y=;
 b=EVO3iSVVTepd+ukwl6wEcuAeXYYfuF+FgIeSsEEPmq9Jq5vO1nJilfWgTkVja3S6frlqKI6ed6yLi4UDMVGkN0qznnjQ3PbC270v0903wKhR9+VynXieBQXZEADm1efxO9MYlyrFr0fcgAb0b8NBGM5NC9TvzmWCIkl6QZQtcr1UoH1O6D3I0Q+I32kUWZyOMhfU/q6gQ+wxC9teC6i/jpmzsCswf7L7z8b/fLTIOAoMaLNrfbEhFQh0PfB/VXHoCavJn84Ni8lMdUEbeUDjMCm8KAgxG1VLsLEt+HTaN7yoowVuYJAoZtw8JXsxGF1DxhViPODi/d0YLRwKkCnJzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxkXtenKtpPvF5Go8LPJnoR5/Bpi+HyQB7bNy92vT6Y=;
 b=zFsYCfXira7o11HLAYMJmJNimtCyqrSwq1oePmsRaM4s47hVukBWEaYmaSjBencCI5vu4xeglTmwJBTnbrQntqkb9CaCGLqqtTw4cytqR0GOq0edaanQEcDeBLMIH8a2CUzjNCGvaXjREKUdCpDOZxquXWc96BgIotbcQdqqt6Q=
Received: from MN2PR10CA0012.namprd10.prod.outlook.com (2603:10b6:208:120::25)
 by CY8PR12MB7540.namprd12.prod.outlook.com (2603:10b6:930:97::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 16:26:45 +0000
Received: from BL02EPF0000EE3D.namprd05.prod.outlook.com
 (2603:10b6:208:120:cafe::ec) by MN2PR10CA0012.outlook.office365.com
 (2603:10b6:208:120::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.16 via Frontend
 Transport; Fri, 13 Jan 2023 16:26:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000EE3D.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 13 Jan 2023 16:26:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:25:01 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:25:00 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 12/21] drm/amd/display: Always set crtcinfo from
 create_stream_for_sink
Date: Fri, 13 Jan 2023 11:24:19 -0500
Message-ID: <20230113162428.33874-13-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3D:EE_|CY8PR12MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: 320d6279-3878-41e7-e64a-08daf582f65c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dnpoXpHa2/20dcJE/cMXkcHdjuOuzUfIFhAFuMzAxBTe5d78irAgumbOXWZ3SYFOAmVlQCpU97elRuSa5zOQC2UQx06eJHVvmnRVJjEOu4EJ2uZh+q0EQF35atc8gUm+tGqsmtcDfDCz0uYEtdXMzleAMGcZAoiflIzCVZbWysZgEYiBMftRwTl5LXbx3QZaVt9VOI5Ka99/kniX0VSnTCrBPT9/QGUnulJvgcpzNTQ2VCKkcWWUYKi5VrEFD4KLOanGwfj9YCU+FsYNX21xLzxfLTI1C7GhH3VPzEPcSgsGFva28H3YUd5fSWyBmZY4878m0dOIA3IqXhIQ+XJ4eRKD+28MZNE8QXgIBHsP3/O/vfdQ/CE3RN+g30yyW6V53oIi0AJ9hRfxwQxC3SBiYKuxSPqK0SJMp/EoyyD/DaltMFAT7+pksHlM5FAJq6ffM+LVFB6S9f1VM4NcwQdHYaApvAbT5Hdqj2yV2HqIstGwJvkPA33S82p3L++pom897sT/Fmq1mgye7avvdNWPnoVpa6g5eaRJ/0qBqbvjXJo5cXH2FEYb3VI6jypgUMwdJPmcVVRS7NKYSJDRgw7VV1ag+cXVwvAda/uOLvnQ3651+D6OUDiYk41RBF3X0NSTXMk1XlacrgmvyCsCwp0ZeUfPucNDrHXBPFzlu4f7/dTh5YOaMpp7ymQFxTujL+Io8VH0ZoI52Y5FOs7OO9fA8zr95B8NZU0mRaRAPyrUCEM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(8936002)(26005)(40480700001)(478600001)(186003)(1076003)(336012)(2616005)(70586007)(8676002)(6666004)(7696005)(41300700001)(110136005)(316002)(54906003)(4326008)(36860700001)(86362001)(83380400001)(82740400003)(40460700003)(47076005)(81166007)(356005)(426003)(70206006)(82310400005)(36756003)(5660300002)(44832011)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:26:45.3714 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 320d6279-3878-41e7-e64a-08daf582f65c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7540
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
index a31f71f2feca..fc94f4872397 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5870,7 +5870,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 
 	if (recalculate_timing)
 		drm_mode_set_crtcinfo(&saved_mode, 0);
-	else if (!dm_state)
+	else
 		drm_mode_set_crtcinfo(&mode, 0);
 
 	/*
-- 
2.39.0

