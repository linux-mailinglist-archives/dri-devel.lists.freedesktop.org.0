Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637AC724E0C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CED510E3B9;
	Tue,  6 Jun 2023 20:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A1110E3B9;
 Tue,  6 Jun 2023 20:26:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFAJfPTBld75Qro8QOdrVWTDxOzcw3XFq5ly9NeKvrysCTYLSWQrcE5Vax8z5HdE4zGcQzWE1ZDyvFwIHplwOl1O0bIxlsk+NDTsMHy/uLOvHybSkcF46V8lzaKxgTH/Ym0bHhXm9wmjFLgfFE1KXnmIkVW2L+/JqLLjZTtdFAIVX5cpbXgsUDYz4+M98gkoIY93gXPXqjUW0l1AVhznmePJ/eTJQJ9/A1CqDiFW/mnFGEx8EcSh/FZIM3xM9lo1KopDeHuw43Qly6JE4Dvg08nGDgd5p/yAIuLv7RH/1bOKI1SzfVS/YmVQCFMcv+MorJrodpRS5bOq1TqJSoYCCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjhEsAhU2tyC91VWPc1ULSci3zJ+KMdmFy2sPGjQ/bo=;
 b=Pr+1hoCZev5vQsuG+gtnli3O4Sy1z4vZEpol1jwUzOpM4JNgAdoO93fkHcl3BRkmiJD3a2kfurlyrkMX+3jQKZwQH6grzRLd3+tbB9BW/SZjLbtDJ+15fPpxdM2nWus6GkjJhOlGSk+ZkQP4lbD/x6ywIo2T9MnQhzApOiTSejoTOwP7X2CKSxUGTK01zhr6GQTV1bOW8cJE5X9/AOFJCN8egs2N608EfACfhQ74/hpF1Xn7kyJLyXvKBQp7yGfmINMSxHG/PcDzuVaCYhklAeLRfvCPnQAMR5emcEzuTMaeGHZ2zBJEZw4cccsmGwVGFN1zkPt9+wRW6jbkdHndPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjhEsAhU2tyC91VWPc1ULSci3zJ+KMdmFy2sPGjQ/bo=;
 b=bCSgz6vG3MAIuFHeQrl/+5Iea6L+tslCUJvX/omV9cImyCjVH0dKCXV7OtCoCuf1WknnVq4wjKVZ3HeHThjiK0pP1De407j+Y6jrs3ikXRCtBn7ppQiRjakbfqgNBC7uOZTmETsC+Sy5LHsRLjxMmgipFP/nR/53jKkD7F0bZwQ=
Received: from BN0PR07CA0003.namprd07.prod.outlook.com (2603:10b6:408:141::15)
 by MN2PR12MB4045.namprd12.prod.outlook.com (2603:10b6:208:1d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 20:26:20 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::34) by BN0PR07CA0003.outlook.office365.com
 (2603:10b6:408:141::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Tue, 6 Jun 2023 20:26:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Tue, 6 Jun 2023 20:26:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:19 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 15:26:18 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 07/13] drm/amd/display: Always pass connector_state to
 stream validation
Date: Tue, 6 Jun 2023 16:26:01 -0400
Message-ID: <20230606202607.122914-8-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230606202607.122914-1-harry.wentland@amd.com>
References: <20230606202607.122914-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT064:EE_|MN2PR12MB4045:EE_
X-MS-Office365-Filtering-Correlation-Id: fccbbcf0-5c10-4450-7e48-08db66cc49e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QCSGRv6HHznl0IdrvXcm+dDX6e9FEyZK7Pift0NKXU0QLDFS1PQUdIEyX0m3FnXw864PFowFG+XyPV+5u6O95P8UIMICB7EcfTK2Cpx2ImjW47Es0ny0JY+MkBsQRVNK4FSlEMRQ0yET0P4N1nrTgQHcoVW4rsUpKzACuCLgY2mS/YKGzE3OPQAR7MKqI781iOvBmlTdALkzfrdexvCdX4AoDYUxSsd0DfgM/iVJC0G/7oTnqY4FVDhsQNkyk+AXp6Mt4cNwdKmfcLjCjR0hUaAMPs0F7Kuck1JvLRSoGWIo8RXBlY2dIcphJxxMTUD3heG0aeILR5e+utjJvEHkV6XyHEfxL9a9P/MKS0WxVT0+lSts4SKxcWTK7VCS6w5C1wyGENI3iqVPtpSSYXFwrR5QklbSz3I+zNf7DUR1TCesAYZ1LyUwACLQr5ArcPAxAnQP0yNU2bI19TojxMQ3r07dNOISCSzbzRBMeCm+x3BWD4QQ2zVdJ+V1TJcc/cseKUk1O1a5gbkOGlZmgiTtXb63HZBO5gjcdeNegJRxu1J8TVaxCjR125Vu6f85IE5wcV1Pb25zwbQTCPKo2oLplOpUIbz9slshrkXTGA+gMo4sBxqC8+TrJakEiqORI2C1lSxi1vf0LOQDTUwK8Wruh8BQwMh0fO/mv2dn8JxoNKQbJszfyL8d+zxCoc79M2qxFGsrrAnWVheFH5C29SuzEr7vZs1q8UDO7LXOSLGd9Cn+l+TvZaKiEgpd1/4hmpwRKTiG+TiQXQ7kcZJMSiLcRg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199021)(36840700001)(40470700004)(46966006)(54906003)(110136005)(40460700003)(478600001)(40480700001)(8936002)(8676002)(5660300002)(44832011)(4326008)(2906002)(36756003)(86362001)(81166007)(70206006)(316002)(82740400003)(70586007)(82310400005)(41300700001)(36860700001)(2616005)(356005)(1076003)(186003)(26005)(47076005)(83380400001)(6666004)(426003)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 20:26:20.1036 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fccbbcf0-5c10-4450-7e48-08db66cc49e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4045
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, Melissa Wen <mwen@igalia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Vitaly.Prosyak@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need the connector_state for colorspace and scaling information
and can get it from connector->state.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Simon Ser <contact@emersion.fr>
Cc: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 90de0d37f1d2..27868dbb09f6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5954,15 +5954,14 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 {
 	struct drm_display_mode *preferred_mode = NULL;
 	struct drm_connector *drm_connector;
-	const struct drm_connector_state *con_state =
-		dm_state ? &dm_state->base : NULL;
+	const struct drm_connector_state *con_state = &dm_state->base;
 	struct dc_stream_state *stream = NULL;
 	struct drm_display_mode mode;
 	struct drm_display_mode saved_mode;
 	struct drm_display_mode *freesync_mode = NULL;
 	bool native_mode_found = false;
 	bool recalculate_timing = false;
-	bool scale = dm_state ? (dm_state->scaling != RMX_OFF) : false;
+	bool scale = dm_state->scaling != RMX_OFF;
 	int mode_refresh;
 	int preferred_refresh = 0;
 	enum color_transfer_func tf = TRANSFER_FUNC_UNKNOWN;
@@ -6604,7 +6603,9 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
 		goto fail;
 	}
 
-	stream = create_validate_stream_for_sink(aconnector, mode, NULL, NULL);
+	stream = create_validate_stream_for_sink(aconnector, mode,
+						 to_dm_connector_state(connector->state),
+						 NULL);
 	if (stream) {
 		dc_stream_release(stream);
 		result = MODE_OK;
-- 
2.41.0

