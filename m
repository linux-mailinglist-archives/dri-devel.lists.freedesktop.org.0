Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A89F669DC2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C960110EA3A;
	Fri, 13 Jan 2023 16:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2084.outbound.protection.outlook.com [40.107.101.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C181A10EA38;
 Fri, 13 Jan 2023 16:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DyNdbZ6wPobdT7ZH0iHUIwO6yqbiSwLzTC7u9Z2hwVeDbNsQcqmYRZwawrhvL2qEnbDdUtLOPFwtMU21UNhgW7kNVQPzjwnuEt1J/mRH5vuU2sNc+yMmcp23frhCrta930hSMG+J6ubapii7VCZuVe8ENsAva0nUzU7UXhekPsOcE8IMo3m/7NvEOpEEkqnzmjublJajPj8nrLWb3vMNvMTvLisKGHtzm2Ep2CVvpZwPFUQyHFkQ6WIwoslfIapamCc7dvKPq3rUceHcmNcVnPZrO3VfFUIHoNDjpc7FRS7tifrc+mir9Ob6F6ZHztuQbWpsbqekuu85949E+ZezDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/eirbUtDiuTc+B3M2uibeKm18s55f6Tuq1ADxUNY3Y=;
 b=ho5Zu60wlt5I/g3DZ21t/J8S6Gpiv3x8RGKpr21ovoqPBkkQEGMufIoO74wV8HfV61ufwj28205TjNqCg17WT5hwv09SwkcmlMYu92ZSWXgielR+Whd+MuIPB1nGyQV08xWvDbl4EGZL+eThrRlsDS1RbsaQbmbAgbBsXilZn4IMggn9bTzoUcdtEHJqeuVxICMr8kIO4P5qED65aBQrryBAqtKmeAKBGdagEzz6KcvEdwiCa8Y+zz0+zQdgwICmo5BBwFvTU5r9/TlFUuxCHMb9Aul23ttaIddVDXrJaH/DIRzTifpSF34u6EZu7Nj8FSB3TPg8Dw1kB0Dplod9+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/eirbUtDiuTc+B3M2uibeKm18s55f6Tuq1ADxUNY3Y=;
 b=2dky49KTChE+AjYIrB7hKL2+YgwOjZT0qGDlOGKfVls9BBR6LjOtePIBDGfMbn828XTDRGwNHHeAqi+55zLkPnGXuh2XFThedSeC0SpVEcb8jiSoAEUBDnrrK0dXA1C5rlFxBjEjEQ0803GaX0AbsqORlts0k6D4fMvnljLDH1Y=
Received: from MW4PR04CA0183.namprd04.prod.outlook.com (2603:10b6:303:86::8)
 by BL1PR12MB5996.namprd12.prod.outlook.com (2603:10b6:208:39c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 16:25:00 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::d9) by MW4PR04CA0183.outlook.office365.com
 (2603:10b6:303:86::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Fri, 13 Jan 2023 16:25:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 16:25:00 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:24:59 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 08:24:59 -0800
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:24:58 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 10/21] drm/amd/display: Signal mode_changed if colorspace
 changed
Date: Fri, 13 Jan 2023 11:24:17 -0500
Message-ID: <20230113162428.33874-11-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT011:EE_|BL1PR12MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: 35da7ba2-85d2-416e-3d3f-08daf582b7cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p1RhCmxwrIShJPU9C2IcHypUrUiWk9x3Q3Dn+mu8p0N01kSZmfE42zQZmdzOpqeDnWvlRsAH6E7PH5eWrOFJEIeNLoQnp4McKxLyvJWKG7cx/SFLDkc+SyHJmL4XcLyFc1YqWxYM0C8kx+wo+L3etWuZrX9kxbpZ9Vz15Sxu6fr5XPjqYz3Ge4aXbd4TPOvheS+TEEf1frhFkn31jbs6FpzCaCnijLBj4l/87v4CgGtw0d5Tx7+7lyUCjuknrUSmio+EFXnWYOK+FgBrfV0AIEwT2mM0fN30UGCzUNl2O4GgAqfPO5Crn9S40604n4nA/MsGVeL0y0J2glBJqoMrMtEEF0fiWD5W1Qat+nOnKJY20B9THEFzdYQDvi785R9Xkswh57OCieU/J1xZIYAdF8MhNol9tzUd4LGIxy7fp+RptZvASOmhWVZ6qiaI//hZ4yCedF9Nre3sIt22NS16KfAhTennNPAltgtcuWpv3FbdbF0fbxzGD9m/09atk2slrDEOhnls03GaZn7+vq2oaEMTTS8E70qgnQI5acwv08r7MXuiX5stVn84MCn8pH/mvXEA1AXsza8YLT0H/YortIqtY59gyzZiwe3UIc5bWU2fau51KDN0d7g3FvgzHbG22w6e8zcuSI7IaQKI+qBKf8MatU4ta7KSTLT6AeNEHKceLP2kePkboz8DsQgzdZ7i3cOzAYyS11/SrEz8c+FTSQMn13QPGelKTm8+IZBEF6g=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(82740400003)(81166007)(356005)(7696005)(70206006)(8676002)(41300700001)(54906003)(36860700001)(86362001)(40460700003)(83380400001)(4326008)(110136005)(70586007)(1076003)(8936002)(44832011)(2906002)(426003)(316002)(336012)(40480700001)(2616005)(5660300002)(82310400005)(478600001)(186003)(26005)(6666004)(47076005)(66574015)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:25:00.2862 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35da7ba2-85d2-416e-3d3f-08daf582b7cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5996
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

We need to signal mode_changed to make sure we update the output
colorspace.

v2: No need to call drm_hdmi_avi_infoframe_colorimetry as DC does its
    own infoframe packing.

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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c311135f1e6f..f74462c282a6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6492,6 +6492,14 @@ amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
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
 
@@ -6514,7 +6522,7 @@ amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
 		 * set is permissible, however. So only force a
 		 * modeset if we're entering or exiting HDR.
 		 */
-		new_crtc_state->mode_changed =
+		new_crtc_state->mode_changed = new_crtc_state->mode_changed ||
 			!old_con_state->hdr_output_metadata ||
 			!new_con_state->hdr_output_metadata;
 	}
-- 
2.39.0

