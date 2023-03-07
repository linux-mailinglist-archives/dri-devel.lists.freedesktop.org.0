Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB0E6AE415
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D31D10E4EE;
	Tue,  7 Mar 2023 15:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34AB10E4F1;
 Tue,  7 Mar 2023 15:11:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJU8ehnf+RnY5Q24GGfVnls0BCRDzqXk4UOIvRAefseXq0fTVTEOHACQHLXXFP4LQ3lHDFqDC6pWL7TWGFQydeYtD8aav3TktET2bauAd8SJwYyTnKDTCpe86yEyvQ/YXqGAzCqqIz0V9sYWN2mlezOYFUwQK5FbasQBoOMXR5WLxB8sBvVKFgNsX6pdkonLurKrpvDffV3y+Eg1kS9r8DWNhzvFJ6uK3muVEwUPWMd0b4Bg+z5NXg092IVgYqrGkNJa9WOnDxD556P9Vs3jdZvDkfH+9aPPDkWdZ1C1M0tjjU4mKZpqnvQLi1/ilkai05jMlKammJVXJ4klguv2zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPxSj/pstKDQ+rZXBHydpSEYyEeVDl5eSFKBb26CKMA=;
 b=QjhhLBDsI1DIC0QTTbnyu0j6/vPRoljTqX953MWwxreUvpPG6mKnEHeOv4nZ1G9bdF4qfvBcWHlPav60dtushEAauHx+c0wF7Ae2CQ1sRalz+A9/2estBMGnLUGc6xdjZUTD8gztrcLBNIm89r92aZsBQnC8KYTYas+CxC9zDpOlJH7JIqt/SnLKGACCVGc/pFBxLM3NL9ePHBYTR4irzVGTcbMnP5mukqUED8dsAHFYZlCFfnqsJ0JgrLdWK/C8BSWrizWuLU7F+/7Ov2VW0Xp5kyoJBdNU6i8ahrmx0jxPGIfVV1bJv61xD+J3y6vr50vUIlYg8/W7blPJRvAE7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPxSj/pstKDQ+rZXBHydpSEYyEeVDl5eSFKBb26CKMA=;
 b=yhOHoqg/46fjshXDqEoHJZZ2+SbxOgOei0+j+aV+TUv/oc9nKX9BQmgGAayKv6AQ3ScgrIR7RMazHSVpVd1JDGtY9irYNKH/QCtp0FNUWTdb+RzzhWKbH020YpJsKpSl4fR5MBKi63oegK9sokxYifJzHqab0lR6VTqCgROgMMA=
Received: from DM6PR17CA0018.namprd17.prod.outlook.com (2603:10b6:5:1b3::31)
 by SN7PR12MB8818.namprd12.prod.outlook.com (2603:10b6:806:34b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 15:11:26 +0000
Received: from DS1PEPF0000E633.namprd02.prod.outlook.com
 (2603:10b6:5:1b3:cafe::6b) by DM6PR17CA0018.outlook.office365.com
 (2603:10b6:5:1b3::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Tue, 7 Mar 2023 15:11:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E633.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.13 via Frontend Transport; Tue, 7 Mar 2023 15:11:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:25 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Mar 2023 09:11:23 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 10/17] drm/amd/display: Signal mode_changed if colorspace
 changed
Date: Tue, 7 Mar 2023 10:11:00 -0500
Message-ID: <20230307151107.49649-11-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307151107.49649-1-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E633:EE_|SN7PR12MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: 9269e0cb-2d13-418d-993d-08db1f1e38aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iF6pp9W0xRqG9tkDeEgKyW9sCxr4hglGIbrxgqj740bL2Ad6j1a7EsTdmiT69HDm8lVsfhOdISXQQX7+P+gknSlEi0ohfLQPMA0Fony8cRzg8RnjHbEV716HN+PQNah5D8YkVsLw8xJy3ZjgsYQhapDuG2nCXmsYmL3PNQon6BxQYtfqFaB3zAYyOn8L0YbGHL6ZnoNMLrUVbOhSexCU8Xe8ZHrnDc548Iq+OX87qBBU83BVUXjmXyRLg2LpO/Tdnv5CL2NtLNXY3SiGlTDavra9eznpZcm9tMvMLXzGiBXgbnLbSGyoqEsYgy8fv+4g9AsW+QpMqiYkBYk8owbD9Sy/Dm0jtLQObVzrcrAwyO506weBlGKmG8smGxGysI5GCu86EIOxg/HvjezzaKGddzrqnLZvMoqXXihE5jZc8PcLwXA4KalvgMCDO7c2jd9Gv3wNbpietVE+00Vmx6o6CCwxukHVkcOMOOthf3/F6SeM5c5Jc3Ta/hclH6lOjPUchP66hgCrgD8JWNe5+O5PeJ9ecyi7v4fxCbuxgVW27lD5o+bI5gXoLF7e1RlZudNUPBvzZS16kFOmQBUSZv9toGyjq/3H8POtYeCytrTcsMEjjN1RAn5ymdUITI5rxtSA4zt2uilniYfsQUjCfgWgl4Z2k8oRXxUM3CoW9zql1twjsYnmubS3OIYObal0Ra2WWkstoyaIM0GIoGGpnDeGz3gPEKD9vagZelPxIOoAMtg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199018)(46966006)(40470700004)(36840700001)(8676002)(36756003)(4326008)(70586007)(70206006)(44832011)(40480700001)(41300700001)(8936002)(5660300002)(6666004)(2906002)(356005)(82740400003)(81166007)(86362001)(36860700001)(26005)(1076003)(54906003)(110136005)(478600001)(316002)(82310400005)(47076005)(426003)(66574015)(83380400001)(2616005)(186003)(40460700003)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:11:26.2460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9269e0cb-2d13-418d-993d-08db1f1e38aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E633.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8818
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, Leo Li <sunpeng.li@amd.com>,
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
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2d883c6dae90..58fc719bec8d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6636,6 +6636,14 @@ amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
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
 
@@ -6658,7 +6666,7 @@ amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
 		 * set is permissible, however. So only force a
 		 * modeset if we're entering or exiting HDR.
 		 */
-		new_crtc_state->mode_changed =
+		new_crtc_state->mode_changed = new_crtc_state->mode_changed ||
 			!old_con_state->hdr_output_metadata ||
 			!new_con_state->hdr_output_metadata;
 	}
-- 
2.39.2

