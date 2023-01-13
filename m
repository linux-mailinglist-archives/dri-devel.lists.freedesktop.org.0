Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB82669DE8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F64810EA4C;
	Fri, 13 Jan 2023 16:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6ACE10EA2C;
 Fri, 13 Jan 2023 16:26:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQcmFkfveXMbSYDFlnKK0nSauzLXkvI8tSx03PW/DWsMZV7WOG3aq3fS2q/F/B4/FsvhpsU6kM8eZxOMkDS06m+eN8bUh5qxwkwDq7Ttvdk+EG0Ug3u8SrOofEXa2LPx5iB+gFBcwj6eVCMo+VUdFvK2Dtwll0nXYZxNf+O22OzYC0x7tcGvVDfRiv+fdXkg99Sm1xcaBv8fQqVQN2x6laXaBucaTBlNE9FCREXiNvOZJtbacmTaDvM5uAcOy3Ep7voATFdH8K0LRNPUIM+topiK2OzF7IETKzZnVAflrsZAUvDwpQmIeLvEPb3p8oqYK0arv3vWeO19y6OKols6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXnlXww2mGNYT2t1GK5lhCJcdxhGrfeLD2rfbCJoSdY=;
 b=kegWadtAfcQmhM8VZSE0qUmNgzaP8/765cJtm6NxSmR0wrW39rPaN8fLDVDNHLKvMipaE/IyYyguYtn8pzv05BH8LW/HIE8JL/lDqiV/SLCHaw1I1SLn+PPfyw+GMNM11CKbYjaWt+cn37KEYzX3WhQCYgxU30TnxRS5roD/Z1we6uzVF/VRHwFN2TcZdg+D3QwV1zgx9qIcRE/WkTxfGGTEq1M1yRYNRef17c7KC8kcjL/1KyfhavRBUdU0y9drUJ34NU+udIoh+PtXg8Uc1kzixWPnCKWkkUml0ZA9OKEjuh4g2R0dVsri8eFXKb5em/kGUQm/tETGNI7fK6SapA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXnlXww2mGNYT2t1GK5lhCJcdxhGrfeLD2rfbCJoSdY=;
 b=AEd3hvhj05HJ18I+/pJOexudlb1b73/xxIkdG32SGvI03Jxy/EDSy7VP7dcomHAbMfC175I3AvamNr1Vn/uZGjZIFL88AUa2zr1i04/ifJs36DjowDuj0KmBRytoXCtc0pE1T9ltjYAsJieVTtoAlQxVwGFb8Bt18yzq9DktpVQ=
Received: from DS7PR05CA0098.namprd05.prod.outlook.com (2603:10b6:8:56::8) by
 SA1PR12MB6872.namprd12.prod.outlook.com (2603:10b6:806:24c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 16:26:43 +0000
Received: from DS1PEPF0000E636.namprd02.prod.outlook.com
 (2603:10b6:8:56:cafe::b0) by DS7PR05CA0098.outlook.office365.com
 (2603:10b6:8:56::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Fri, 13 Jan 2023 16:26:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E636.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 13 Jan 2023 16:26:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:24:57 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:24:57 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 08/21] drm/amd/display: Always pass connector_state to
 stream validation
Date: Fri, 13 Jan 2023 11:24:15 -0500
Message-ID: <20230113162428.33874-9-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E636:EE_|SA1PR12MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 48b5db1f-7ea4-4a57-2a5d-08daf582f4e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lYIFzUNRa0MHbduysv813H2oPTL5C3tmdO0iu9KAEA5iRBbHkBQn6qlUpPI6u26iyg+kLFYQ/GmUHjcPQcAn2MZIdCZt81ncVvkml7zH1zwvYzeYBqt1iYEtUDFaw5Wy4ajO6+AzCqxLWpmN546Awdc7QnfYqK9clsEtRuT1R/OEkGg0OmoMTEjHiAwmrZHUmZv8UIxexMslJ0Q+OHowL1YjWnNhR9jrQrnuPDA/0dV7ysKLIeHvmSIgUnM571Tb+YivwfBMqKhQy9uPVtLScUv5YUZLcCmo9MtpT4wtLs/Fd98fIuNXyIu0A6AcNLPbtQ0z39VMUg03CY/OFrigIBfyfKw4ONfV7kdsa18/tA17gVHsY34LNO5WKsypKfxHecxEPfIo61jXhVOai+7Mjy0wFDPDueXP06lFJanf/WbbhfGZuP/y3ChoYeCRR/3D+R7ZhklqZwIBlOBQDasiulOgMon4xE4rSXqLCoyE1yyU2z957pOr3szMiPrZYKmrlhX5R8pk5PxBFid6d5bHIBVkPFqUbDoAcsWOb8K034+UyC2WnAM8f9xSudrIHBvWCnwJLbIRxDIqrIE1eZhAf7sexKncfCHCjbvFttZLwy0quwLZM5AltUvAUmwWyR0FchsZWxBq4UC77pN+NuipOHjqldhrJNSHbZKpgtJ+kvMMmjHMTfVQDYVG9KOkWQQKkHAHDIQjHcvCWGPW/emJseV3gQV+Dw0pS9RG55KvEmg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(36840700001)(46966006)(40470700004)(47076005)(426003)(83380400001)(40480700001)(40460700003)(36860700001)(82310400005)(44832011)(81166007)(356005)(86362001)(36756003)(82740400003)(316002)(336012)(2906002)(54906003)(70586007)(110136005)(8676002)(70206006)(41300700001)(4326008)(8936002)(5660300002)(26005)(186003)(6666004)(1076003)(2616005)(478600001)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:26:42.8778 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b5db1f-7ea4-4a57-2a5d-08daf582f4e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E636.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6872
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

We need the connector_state for colorspace and scaling information
and can get it from connector->state.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Joshua Ashton <joshua@froggi.es>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b8638f0508b0..bc10ac5e772d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5776,15 +5776,14 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
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
@@ -6397,7 +6396,9 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
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
2.39.0

