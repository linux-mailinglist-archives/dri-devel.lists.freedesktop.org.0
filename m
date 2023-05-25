Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 852AA711725
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 21:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37F810E19C;
	Thu, 25 May 2023 19:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A4210E11B;
 Thu, 25 May 2023 19:18:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NsgCT6UFhIKokSMEChwdi3aH5WZ30cjNDOLLyQjfaaVfyyur0sBvwViWmz0pubd9uwdaSOODfW54rSaAxE1u2YLGQco8TzqvOmnrhq/I7TqR4X3JaWZmNFwJjH02fgMkry2J0zF8GYsKlRWak23SScwCsYmFc+x4f5L0GKzbm5otisdvaFk3asmiRVzzho4PPKSDNHu4dudJpiTsWZzQN5sofUWvIQ1bw7xLja6SMohiQp4Sn1gfdNOo3qouYBRxLsSfWu7XJee8YjHZ50zux6+xHCaJq0TT96l/y4cpcdB12jGqmQgzV4MnSfxvIOTix24cs89kcjGrs123u7qkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TGgDLlQGop/8Pba+oLnlxyrUfbDWpKkKoPAY7IEfn0=;
 b=dLP+8GF4VLm9X7H/RimHmNm5TdhXQFP+491IiGcB35wy/cEOjj8AMUHw8XjgH1F7ZxWlOurGSF0S18Roq4MQvW/8zRzKyJNtrpSHSiknVQAssC0mgk1H1FJyACU2L3P410Th73b7vBBYVL335bKnD1IsSrDOT/2b7d/42UhjB2YW9nLHJR0ce0sWS1Muhsg1phRN/7bP5CX1m5u6XWkg2IWg21IIPH9EhzL6Go4QeXbsorCuJgmeQCEZBHnuk9Wd6oL3GgnE/oPWYlznC6fGou435HlzzOes7sF05BOouv4HhZP/mS4yedNiu7uBD7XfBgpMEDd8toWsBFTG84xyHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TGgDLlQGop/8Pba+oLnlxyrUfbDWpKkKoPAY7IEfn0=;
 b=EGYwqOk6QLpXsQ4rIttgdHSJ2a/4T7UMlGIQyl2qbYnDfsyPPVydmwj4A4uST9WoUs7bont4Lm56ECrJ6LtWY70UBPPKBOnWMRCpaRdSgyIhvzBuRBJ6MpRsSv9aC/pa4oX7LjFeK67rPde49KdnZUUO1xy0zqSEk1zKTQwDB3Y=
Received: from DS7PR05CA0055.namprd05.prod.outlook.com (2603:10b6:8:2f::15) by
 BL0PR12MB4961.namprd12.prod.outlook.com (2603:10b6:208:1c9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 19:18:38 +0000
Received: from DM6NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::aa) by DS7PR05CA0055.outlook.office365.com
 (2603:10b6:8:2f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 19:18:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT094.mail.protection.outlook.com (10.13.172.195) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 19:18:37 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:18:36 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:18:35 -0700
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 25 May 2023 14:18:34 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 07/13] drm/amd/display: Always pass connector_state to
 stream validation
Date: Thu, 25 May 2023 15:18:03 -0400
Message-ID: <20230525191809.3524-8-harry.wentland@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525191809.3524-1-harry.wentland@amd.com>
References: <20230525191809.3524-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT094:EE_|BL0PR12MB4961:EE_
X-MS-Office365-Filtering-Correlation-Id: 4161c961-1131-4f06-b125-08db5d54d7a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8a8okNqnoRAp1QLX/8dh+yn6yWvA70MeJ9bjwn3MfMlpbL33qYA+09w1/FPhDxNx5FpbYYL6T9h6l1Xkw+PkXjoIANPBwoTaUqakPsCCJd88ATKAgTOUKKRtZABLuhb0eh/Uc97w9EBXIMnnzsxl4vNZPmohAMnB4mVLmFIm/Bi51rT0Bzk+entYlKBi9tDjixhwuHBOfEmF8PPalMBJYxQHXbeytVIH0/e/SDCxHL5YW5SA18zYHjxgBDzuul9qDBExQbpc93yj6gTKCUzHK6k/fbD9LYm+ZLkR6PhoPTR6lcVqUbOZiTm+afKqoYV0VGdTV43B8xNSMrfJAKyYZKtf1wnRt3kWOWJAEEVEuZQkQDVPlu89j4D3t9kD7Y3kwZLj6Ouk2i1OO4UzZonvSTqWO+jKGL9tSvJL0dCDnjpV4eHJgwZc4ICfZVn2VNbeR1O2/mIrb264PsqmGtKI2fI2gLcs+vOivBbnqoIhef2UHCt2KoEH9hyv5xjPFKXW+rxhz8N7A8M4ziI6rjFVYRJDBaArIR+LyqS1woS3yric51P/N8UkDTESh/G0Ks1QwOL+mECNx0ysxIG2pSoSgcaTbOgoXdwnKkbg7suFABrHpPO+hkqyDu6rIhCetZqEMAB4SyFIfiWrJGahBjGBIGLcsGcUdWmkE066AOkCe8dG1niWQokaPlsUW+pbTfOpXYWC9Fh0QVy9HdzGY3ieA9Lb3KV5YQj6Yfp/AZsTsLlkv9AVkHE8nCOTgtcls/DKla1KXTJogDCV6Pnq80S4Ag==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199021)(46966006)(36840700001)(40470700004)(110136005)(41300700001)(70586007)(70206006)(54906003)(40480700001)(8936002)(8676002)(5660300002)(26005)(1076003)(44832011)(316002)(4326008)(6666004)(478600001)(186003)(40460700003)(47076005)(426003)(336012)(2616005)(2906002)(83380400001)(36860700001)(81166007)(356005)(82740400003)(82310400005)(86362001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 19:18:37.8741 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4161c961-1131-4f06-b125-08db5d54d7a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4961
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
index a69f4a39d92a..ca093396d1ac 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5946,15 +5946,14 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
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
@@ -6596,7 +6595,9 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
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
2.40.1

