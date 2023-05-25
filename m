Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5265B711726
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 21:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CC410E1A0;
	Thu, 25 May 2023 19:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49F010E198;
 Thu, 25 May 2023 19:18:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkS2f+9DCk8md5/k92X+VIDBeDSpFdPg3Tr5p1s/hkXYXqgIlyDshdKT+ssHaZNMGUGzD9RC9A9EE6O0s473SETPvZwd+bekmxfnesmZQse4nCOhSIKPSPJmA8IZQJ8EJJo+ebPmuLYwCIpbm0ZzCBbuCujj4WP+AiTt5s5TSI8Pl8haK5CDbkpUQVOMWUKZ6uZl9qf6xTQckr8pYewEiwmv0y6BxWLGuxH7SpanzlCkUga2C4Y5FUWwOL9zQwKWkTFabqUm/Mv1AkQ3K+v0RDfGPvPtV4fJ1rwKYGb9G428yZJmaFFP8xaNe+20e3sEEMwM1nextKvzOmIb2VnA8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76WrIfdzw+EEEFvnQT0xOobgyxZnF2Eeb4GP0umFxhQ=;
 b=Hs40/IwNLfNzmku6UcAelbgfCy1/e+PCSZ7SzG95vU19PbmOnRqRjO7b30eTTdLvKtNb3fNFP1fDvVrc/oW6SkGAxAOZ5vINfqrEK8xRpxH/E6FFXSoxBEygfePQmQmX3XFLWgdMg01a1kYNPKYFo9ishVlXUwqE0Vdfb2aUTS3hWPk1XWjDxd9RcwBtIxAcsUwCP7RhsSMdlyk9s7PQJgY46Hs2zkBFZaNzcdJsN6ObCDZLJPELJ9Rq46JgfuZpB5DS39XYJcC4fwv/iU8zchRYgo7uhGCYOrwXW010URxnl6X2KFDFU+Hlz2QdVXGOxIlXtImDFPrnsCuQMyAYEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76WrIfdzw+EEEFvnQT0xOobgyxZnF2Eeb4GP0umFxhQ=;
 b=37eE1iIBXA+tIu5HQvqvYBr+Pjb9pZEEW1deHoXlTkdPMDv6ZI+IOnpp8GE1bi5WRl+TnaLDXNc/9zgKPi6RoE0fdCWqsTc6sGfykf3y1wSNwRbPHQ4MFfKgmd1acDgIXxyFSnjOPnHN6ksqQ4f/SwTFPXTO5i7xw/AXhAlLAxM=
Received: from DM6PR02CA0141.namprd02.prod.outlook.com (2603:10b6:5:332::8) by
 IA1PR12MB8407.namprd12.prod.outlook.com (2603:10b6:208:3d9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 19:18:42 +0000
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::56) by DM6PR02CA0141.outlook.office365.com
 (2603:10b6:5:332::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 19:18:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT036.mail.protection.outlook.com (10.13.172.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 19:18:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:18:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:18:40 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 25 May 2023 14:18:38 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 09/13] drm/amd/display: Signal mode_changed if colorspace
 changed
Date: Thu, 25 May 2023 15:18:05 -0400
Message-ID: <20230525191809.3524-10-harry.wentland@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525191809.3524-1-harry.wentland@amd.com>
References: <20230525191809.3524-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT036:EE_|IA1PR12MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: 15923766-50f3-4064-4c65-08db5d54da26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dXg3uYeGxBHz6lMYp+8LZxIJurh5XZ9zK5h6DQP/2Wgq05lnBemmAFFx5n9C3v6Gp7iZdi1O67qdZpzwZvlCDWDcrFIil1SYfS7R+5vLu9kZglb+HEEqeoTFWoL7E1ofgmAZYAgSeT5dqsDlrtWvLwGceKb0jJjDWXIDz7vDlNsxXH5PPSkXywVQ9g36hKWZhtcvyLohIOpSV/xmtekmQEHbH0U0ukDiKNJd2sZcAtAE0DAVDBwoi8t/6GP4M1z65bIxqnMFfHfUF3YMLAPL7GKUDEBw/uvBkR/g/GlRVz3Eh27ixyYMT7xFSXefbZkm/YXrqGMwEDYhY5tRlam5SC6ukRyKYgSzDC65l7LgrmaWcuHrJUKwN7QTZOhP2W/Kax2wK9JRkex5PDwUMpOoMdglpTEMZDSEvTlM0KxCamu5FRi+e3b/ewAkxW2MGqfvw6kQWhuMyuTMXiyNuSC00/Wq2Oxq8RZ7S3/r040mBt2HobBsJN0ljn7ajGkYcAeZRjxYpb4+y20fA2xw/eVJ5oGTq1biE2FlmxgbgHqiZNkumPNqWe2KCkc3SvtJjJu962QrllKOrI97yjLyLZN7DOBV1vFcAYBwmVXJqMjKkIEV9n2J4ZibKg2vt0nTX+3g4Nwghd1l+5Q1afjwivKxErQEm1uSlbOsXgNX6c3XtLIAonFId63MR5KWC0N+egUSEflDky3XhbrOL2A0y/mVVeX3ES0Ruxh0g/sn3sYyd382itPJt/6sVW/mYdoeEwzQd6B5s0Z2Fa7ims+GHO7krQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199021)(40470700004)(36840700001)(46966006)(40460700003)(44832011)(81166007)(356005)(186003)(82310400005)(1076003)(336012)(26005)(82740400003)(426003)(2616005)(36860700001)(83380400001)(47076005)(2906002)(478600001)(86362001)(6666004)(40480700001)(36756003)(110136005)(54906003)(70586007)(8676002)(8936002)(4326008)(70206006)(41300700001)(316002)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 19:18:42.0855 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15923766-50f3-4064-4c65-08db5d54da26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8407
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
 Melissa Wen <mwen@igalia.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>, Vitaly.Prosyak@amd.com,
 Joshua Ashton <joshua@froggi.es>
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
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Simon Ser <contact@emersion.fr>
Cc: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index dc99a8ffac70..5c290e6aac46 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6691,6 +6691,14 @@ amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
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
 
@@ -6713,7 +6721,7 @@ amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
 		 * set is permissible, however. So only force a
 		 * modeset if we're entering or exiting HDR.
 		 */
-		new_crtc_state->mode_changed =
+		new_crtc_state->mode_changed = new_crtc_state->mode_changed ||
 			!old_con_state->hdr_output_metadata ||
 			!new_con_state->hdr_output_metadata;
 	}
-- 
2.40.1

