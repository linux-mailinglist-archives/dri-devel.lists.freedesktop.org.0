Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EFC65DA3D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0824A10E536;
	Wed,  4 Jan 2023 16:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493D810E536;
 Wed,  4 Jan 2023 16:43:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbPOwfeG3M8LLYzwogcJaDPqiXkwWEevg4W2RLqQAXFBPwmYu6keQBkuiJa1LVAFVHRA6ZI2iXOmebRq+t55ULs9NK13iqjIv8X3akSwo9tnC2jzKywGMq+YZC444P8jMIr3Oh8aKw3L5R4YFYoQCeAI8fEPPy0EjpKHPikY7o4Qbt3gB/p97DywklCNsUAkxJphJl3ua/IyR/UEWNKWWkFTAAnAliiMhOXR+sSc+gDGuXJUtqL252VN261jcKwNU/HQBTDXCrlolwIAgljOeoYU3avtY7ls5UJ34vdD02ySYTHjb7k+bEp4N/egUcy2WkZIO2jUw9ygXxT+SiDmkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElAv01ZLm8lyvFBhjcrt9T+FkCKdVDpIZNwqkK3sGq0=;
 b=KRnytCehJ7ae3DY0Zknyhy+/hi17DsR4Q4gpvMJrmPeAtL7qs0xDEIb/UfqOBXpS5O/UmlencvkAI8pTHRZqU0yFudiexBXjCf1PIPfRv4fTBn4TMBR68AY+2mvR5YtkC6BjworuAm5E8Q6/fxn4rTb8GFWVFl3yMmHxu1HhQBakPSfsGtkN3ldokmFSeaHZZWxC5qjB1421bCAhZ2wDZERDB/tTIVCZXndTl+pQP1fxUXl5dR9G++klXiAuSL5ZSrPU4pgP0znrSB9LB8l9ge+qjHUlVh613LK1vijhIgMUDz9wCUbq9tiFUqc+nSJDu5JGHLIaMTWFCvVPp4m6iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElAv01ZLm8lyvFBhjcrt9T+FkCKdVDpIZNwqkK3sGq0=;
 b=EXbkIUSByHrWzqhNwzOadBdBLdnCFgLVpQpU4hJm6Koxb39vudjp+WB283TWFVRkGJHt5YMjU3ap5atGesB7al1k7CtDuibP6w7u0B8+n1tn6Mdlt7hGTMl9I+S47djgpCIsdbgq1N44XaWOFEbbou9jh1DDHvq6PHFV1jtHJ+4=
Received: from BN9PR03CA0609.namprd03.prod.outlook.com (2603:10b6:408:106::14)
 by DM4PR12MB6207.namprd12.prod.outlook.com (2603:10b6:8:a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:43:05 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::22) by BN9PR03CA0609.outlook.office365.com
 (2603:10b6:408:106::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:43:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:43:04 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:42:53 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 13/45] drm/amd: Remove superfluous assignment for
 `adev->mes.adev`
Date: Wed, 4 Jan 2023 10:40:02 -0600
Message-ID: <20230104164042.30271-14-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104164042.30271-1-mario.limonciello@amd.com>
References: <20230104164042.30271-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|DM4PR12MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: f4665c7c-300e-45ac-ec6a-08daee72c06c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: otg5RUKEGq6CPckDiy75X9eyxfdum2x6h4IAfLdsZJot2Dt8PZHIwhAezE6yRJPnTlS2L/IE+ITrh+1zS4gByJOWqg3jafflohpoaVUkioHCFzynLrLBNhpWL9qXPtCCXC21INFNd2bHv2JBPtcllOr+/+HZDqUR6HXJJyZBw0uV4IvUUjizvUZQfCezyt3QATTXxqICKSLz7OO53KxSiaOVgwQZkJy0D12TPSApWMR0iRWYHDax9hXyXT3sbEmGu0u5D06s4EzQeweb8AD8wlORV6qCC1+lALq4LrQTWDGOHB35BgwLtaf4DlJJL21cG3j5J8aykocOVihTZPa59jKhnbYm4dizL9JLxtbvro3veX2ANDpdtU6A6TZOrhHnrZjF4NeK9wj+61ADwQCMIVTw1CyciqThHp0WiUXKdw9iTwtex2/Obycof0bG31flq0I97wmKFwXmG7xJNk9SnwKtFd3ncTHYsRpRfJHPCiudRg4/1KkVos3G8/Re5Q3T9F0yKxxCNuIG8yckdJnBWiFHirSvNFeGeuIsfCmkz4Yl7BLJN5zTjbjlvBG6Gi+f1+yqeg+wHz5nixQcfuH4PjpfSfSUs6Ckm9FlFl6wPovEvaDa/1c8zPuonM60rs7SdIZsZ0+L1HSLnuheMfWEx1ibV/NFkInatNwsiqhS3EvC9MVE9TGufAMApwsc0/gha6Vazl+/6tJYEOcV1bZriRMTHLl/yvO50sI4J2cz9x2Sr7bsO+5p4WvvjnrPNW9Hjt7ieh9cwAKzQ3vuTXkILw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(40470700004)(36840700001)(46966006)(47076005)(36860700001)(2616005)(83380400001)(336012)(426003)(2906002)(40480700001)(1076003)(86362001)(40460700003)(82310400005)(36756003)(356005)(82740400003)(81166007)(70586007)(44832011)(316002)(54906003)(110136005)(41300700001)(70206006)(8676002)(8936002)(5660300002)(4326008)(186003)(26005)(478600001)(6666004)(16526019)(7696005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:43:04.7924 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4665c7c-300e-45ac-ec6a-08daee72c06c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6207
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Lazar Lijo <Lijo.Lazar@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`amdgpu_mes_init` already sets `adev->mes.adev`, so there is no need
to also set it in the IP specific versions.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c | 1 -
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
index a2c96a86538c..76151dddf0a9 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
@@ -924,7 +924,6 @@ static int mes_v10_1_sw_init(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	int pipe, r;
 
-	adev->mes.adev = adev;
 	adev->mes.funcs = &mes_v10_1_funcs;
 	adev->mes.kiq_hw_init = &mes_v10_1_kiq_hw_init;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index 4dab62335d0d..824af819f447 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -1013,7 +1013,6 @@ static int mes_v11_0_sw_init(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	int pipe, r;
 
-	adev->mes.adev = adev;
 	adev->mes.funcs = &mes_v11_0_funcs;
 	adev->mes.kiq_hw_init = &mes_v11_0_kiq_hw_init;
 	adev->mes.kiq_hw_fini = &mes_v11_0_kiq_hw_fini;
-- 
2.34.1

