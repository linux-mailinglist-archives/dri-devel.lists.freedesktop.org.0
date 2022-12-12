Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5DD64A6EC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:23:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398F310E26B;
	Mon, 12 Dec 2022 18:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2070.outbound.protection.outlook.com [40.107.96.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0156910E261;
 Mon, 12 Dec 2022 18:22:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByeNxFqRsz4gCLWmaeFH2ihWvUtL12WJdNiQgqH7hm8LrwO/oH1mG/1w1owuvkm+Igc8DHav6+t42rFbwv6ED2HFpvO775Ll/4T28DawzLqLQCO6mf+t5nJg9BRXnj4vKWg0PsBepYHd+CxgguvqQkowa63RmrCLqcdiLM5vVce2iXyoHGU1z54s1efG0ldFwwt037rJXwqIveSO9vBWW7nfmpAkoM+chU83PdOx8qDoao3fOasiQOKQPbUel2gt4RLd+bJa79jIweV1TDzDCdNqRaV2hDRIefwykEM0FTw3waamd8u5PEHy05f1SCWbhYrfxTxIrh1x7l2W94cBNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8gF1f3PbaC1ZPEzYg4/cPK1YI+We0uVvb/odDaBF3g=;
 b=NZADPLda2sTulPVUHREbd799XOnUQrhuhTXg6NpVzf4cf7m37kFLmGN+8LI8Fk6cRBXEpJN9jOKv8OV/0mESCO4CR2U10M93Gw44KNZmvu+fDuyUo/WuOobxeYxTPuao6UnQBUqCf3tbyIrhtzb/weX2hKAJb9IOfn9+q19fLiPUL3+5PpAp/KEc7O0gKNtJYanKTd49AYCg6bR7blu0aixI2hhZhqfBVvaQPGKOjPRkieyyAbUVgFoBVYMVNfjZeKzY4HUEh1cT4/xyfzGXLOlyRP/J84M3xR5YRHhXIasCuWKjl5jqHYNN8tFnTlfuv9/WRY5zTWgKuKqKm7iiPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8gF1f3PbaC1ZPEzYg4/cPK1YI+We0uVvb/odDaBF3g=;
 b=uT+kc1smpge3VT6DmN19NzABNWt79lcf/Y1/iX9sGUYRaMc2ZGzOs7TgV1Uk9GkKCIaInIJyAswjvXusfcVXrgVlUsVf2fFLfq/YgQlXSs8/4oRopRQvoNEt/HbbJ06+Qb0DAHDmsc9FxEvPjqCrzN3wFxn5TZ837Kxthu++I9A=
Received: from BN9PR03CA0469.namprd03.prod.outlook.com (2603:10b6:408:139::24)
 by PH7PR12MB6786.namprd12.prod.outlook.com (2603:10b6:510:1ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 18:22:25 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::a7) by BN9PR03CA0469.outlook.office365.com
 (2603:10b6:408:139::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 18:22:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 18:22:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:23 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 12 Dec 2022 12:22:23 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/16] drm/amd/display: Set colorspace for HDMI infoframe
Date: Mon, 12 Dec 2022 13:21:31 -0500
Message-ID: <20221212182137.374625-11-harry.wentland@amd.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212182137.374625-1-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT058:EE_|PH7PR12MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: c6fc9e5d-c8c4-432b-3709-08dadc6dd186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ZQcD1GbIEfu6hwMKQjWKY32IlW1sxGhFcR4a07BZ6VxlM0ZEgXx1C3T8n05dfAmfebQPLrvG6O0NNZD+AaolAjbn7VL1le73J6xAP63sPd/TRUbmMnpVZa5URepcj+2Qv0SdoGH9g2l/vtuqQ+HO5Sxs9D9ki9oWIP/M9IVAV1re+MqkzKDa7LmigMXk6kOUlK6aawldHxFPBzKFwxk1siYkEskcet/GLysqDwZkjlObZVO7i1bHzVYF+2Dm65LI+15KezZvX+C8wdxFVYpKSKoOHQybJMCxtAMs9YKaOjoG2czx0JZtbBkxmc5WI8+q9Wd4A30I+KF2sGiJicABXoInpUQo4H3IGXdx+B+/FyGhRq5usX+j9GOu/ypeHtIMQPl2RQ/XugSiMw/lkbPssx5l5TKGiqLjp3pcN8e5UK9sXXRvnfag3kxz8GWsn1g5ypdCXP86CveUmmYz85U12JYAFJ0M5R3/6P5KqlIjd/h5cll4CnPQV6IX1y5Z0XBL6qHgshhLterOjqVvbyAkR714xzzU/f1TwCazHu+1vevnkhjS6uHhNTXtUD0yjVvKp/2UyXtTO5V8ZVBTqT0thNyoFDkM73gksp/OFZtxiY5P4Ol2zFIurLCW18QqBelQokGo0mzNMZaZ1GkHmUpTqmgAjey410m2pJrpgtSce4aD/pz8bFFJn2O1ux3xSd/kTvW5Xq5qSb9dAY2LEz683bZ5zv4myKdD8NAJ4FDdUs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(36756003)(41300700001)(83380400001)(36860700001)(26005)(186003)(478600001)(8936002)(5660300002)(316002)(54906003)(110136005)(6666004)(70586007)(82310400005)(70206006)(8676002)(4326008)(86362001)(426003)(47076005)(7696005)(66574015)(44832011)(356005)(81166007)(336012)(40480700001)(1076003)(2616005)(82740400003)(40460700003)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 18:22:25.0814 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6fc9e5d-c8c4-432b-3709-08dadc6dd186
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6786
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

Now that we have the HDMI colorimetry fill the corresponding
AVI infoframe info. Also signal "mode_changed" if colorimetry
changed.

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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 67def042e9b4..310388219f8c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5282,6 +5282,7 @@ static void fill_stream_properties_from_drm_display_mode(
 	if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A) {
 		drm_hdmi_avi_infoframe_from_display_mode(&avi_frame, (struct drm_connector *)connector, mode_in);
 		timing_out->vic = avi_frame.video_code;
+		drm_hdmi_avi_infoframe_colorimetry(&avi_frame, connector_state);
 		drm_hdmi_vendor_infoframe_from_display_mode(&hv_frame, (struct drm_connector *)connector, mode_in);
 		timing_out->hdmi_vic = hv_frame.vic;
 	}
@@ -6476,6 +6477,14 @@ amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
 	if (!crtc)
 		return 0;
 
+	if (new_con_state->colorspace != old_con_state->colorspace) {
+		new_crtc_state = drm_atomic_get_crtc_state(state, crtc);
+		if (IS_ERR(new_crtc_state))
+			return PTR_ERR(new_crtc_state);
+
+		new_crtc_state->mode_changed = true;
+	}
+
 	if (!drm_connector_atomic_hdr_metadata_equal(old_con_state, new_con_state)) {
 		struct dc_info_packet hdr_infopacket;
 
@@ -6498,7 +6507,7 @@ amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
 		 * set is permissible, however. So only force a
 		 * modeset if we're entering or exiting HDR.
 		 */
-		new_crtc_state->mode_changed =
+		new_crtc_state->mode_changed = new_crtc_state->mode_changed ||
 			!old_con_state->hdr_output_metadata ||
 			!new_con_state->hdr_output_metadata;
 	}
-- 
2.38.1

