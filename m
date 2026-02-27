Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Nd9LRHxoWnYxQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:31:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CED1BCD1F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1FC10EBFD;
	Fri, 27 Feb 2026 19:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a+AoAbMP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012023.outbound.protection.outlook.com
 [40.107.200.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8D510E1B5;
 Fri, 27 Feb 2026 19:31:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkIRd2DWB7kLRuzmacuAlAriVOz7M3SK8Oq4SzzVHJPuDiGDlY7UNqVk7RT0dhqZGT3b9I90B/x5WuoCwlcrsbDqLTlfeck8wgktaspnOwsTaGIgxIhKOJ5dQFLJjtySxuK2Cb3ZxSeMp35P+mAPZyxbFKYzJgm4AMwwhzyou5phNX/t90yWyA7rpCzVn50dBirjNG1kIKCQ2desS1tsMKg8wawgw6QaGqJOj04sFARbH+3bG7SKW1bwjcy8Nnu3tLsf0GN+arY/dsgfj4IR/7TfHwp0PpjA7q62Mb6At0EXVbSz8Jph/S+tSiQrkSOkn7JLOWRuZ/RidXM3XmFdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOn0xhzeL0JueILRg1Sgi1zoYUpHhM0xhXyRpjX3csQ=;
 b=n87srjDx3wtcGJF2DkfZ0DXabPgbrLOby8uRtDqWwLIuX+cZBGMfERAvmzsrFPfZ7iSHWBLu1TFN4SQu0v4iuhwJgrqHiqkclYY3H6e/jN1gVfPNlHEq+gtNG+OyqOzqAQj9ny5Hq42s7/oSFp/s2ZgrmkXPYQtM+AeXPYv2MG9QNoZ21Waob7HJzLIZwZXvI+UV1ClzowZX2LtNLuY9MtFcPEFfPXxsEGWlTVeMSukqTqF+tnWraH2Lm6hrD1FvWTJGt1lnWsHuEca8mo+qrdiAFCd1HbwaFyUz5RYZk+Jc3pvA6X41dWTnTaLPDIedaVrXn1gB2B1MOPPD9U5HlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOn0xhzeL0JueILRg1Sgi1zoYUpHhM0xhXyRpjX3csQ=;
 b=a+AoAbMPui5WYjDXeBLkCR0MacYJo9QXlWVWjCbYnKP0oqGh2Uv1otRbnGBRmcABXqEuetxYa7D0UNzdz8brN72s3UnV7VTGBtvSkXOO8z2uu0VAKc7hdC0NM0EF/Hxpp26AgfmhGZaNREFbnNrVH2THzbA+FsFhKBo4EwKPCvA=
Received: from MW3PR05CA0004.namprd05.prod.outlook.com (2603:10b6:303:2b::9)
 by PH7PR12MB5808.namprd12.prod.outlook.com (2603:10b6:510:1d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 19:31:17 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:303:2b:cafe::e4) by MW3PR05CA0004.outlook.office365.com
 (2603:10b6:303:2b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.15 via Frontend Transport; Fri,
 27 Feb 2026 19:31:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 27 Feb 2026 19:31:16 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Feb
 2026 13:31:13 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <siqueira@igalia.com>, <christian.koenig@amd.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <alex.hung@amd.com>,
 <contact@emersion.fr>, <ivan.lipski@amd.com>, <kenneth.feng@amd.com>,
 <chiahsuan.chung@amd.com>, <mdaenzer@redhat.com>, <Jerry.Zuo@amd.com>,
 <timur.kristof@gmail.com>, <david.rosca@amd.com>, <daniels@collabora.com>,
 <mwen@igalia.com>, <Alvin.Lee2@amd.com>, <bold.zone2373@fastmail.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <ville.syrjala@linux.intel.com>,
 <Matthew.Stewart2@amd.com>, <chaitanya.kumar.borah@intel.com>
Subject: [PATCH] drm/amd/display: Enable DEGAMMA and reject
 COLOR_PIPELINE+DEGAMMA_LUT
Date: Fri, 27 Feb 2026 12:30:38 -0700
Message-ID: <20260227193038.1377643-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|PH7PR12MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ccb943e-f9a5-4ab9-09c5-08de7636c6ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: UEvrTV6uMM7R2Wyk6HS7z+GX/iqmORgr/IuH/GDy/YxcWhcYygCfrnVsPGvm6sI8Kkfv2NvP7iU6jhVYPqxYT6G13GVycm83M3u9CC5t5ulgVbjnm/RRxR2mk+/+rwr3/kGxDBG8WU94LJXIVhRWfPLD4A7/Vzd9uQR9QY6FaCylHMnXzGBQVSuJDEGrLaw2hhWClyJ+VTBce0Mg8hx9qslhgC4JSL8fWaHVbn+iQhYKYinIM3ltQGyCZFP4hWgERlJCvmxECJgEDSe9ID1bOO9zItzlgMjhneAqNIegK6OJo4Oe5OamOXOjvyB32VCDTcON3JX1A31FBWWIFCABtjMRgGJ7Nvuj/yyqma64k6f2Ll2soAKUhKFsr3rkOjDfWuulSp3gbIByGX/RYFdIT0+fnFAm/sOQ0mVEP8grVRfk99ICfmP0pMIE7Ntl57IBp5znByXRxeEHr0HJ5WnMi/SS/CKA+nRo1gTaPhhlugH7QHyn6NfC74B0/1X5Cg9ADph5PbEAWvC2HJ7n6XWbp5SCk0/ktV/SR2Vx1tRaHQwxNC5AHTJo5POSRnsXFwhgpv+CTP2kVFj5ZpHrNtttzRsxNIZx5ymVn9dh5tc6Nwe5PRHEJVGK6TLZPL4dv/V7CbdEhGyY6ACsrwAmN4ictn/HwmmI2OnyrOa/sk2mowfT0aPGFD2fYPa+NXPIwV+C9QO7z0CS3l01wMYsoglEsOH3R4aHpKna6apAmUQ/PUrdVd9nBio59zhG3myJXWNF1pp+J38REIJDO+ZMuzN+cFN0w2bVHUyA3a//oL5J741goRmDPNG4WWnPvoJz5c6x/PqJXpgAZkxJ81ZAivf3lw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RNKmp/MTncnA0s5HPi3Pz6pg958DrRxLmYridNXwvwzKiIcDBTkdifxNPno3pR0XmiZjKQWaZCvNXaMrcZJvTSvF/FsOswlN8bAc3rbARGxQG4+AlF+aU0HeXKEUiugLT5NZE4oaief2floI32wOj5ppTtlmsgJSOgY6QV30az+MAJTS8uFpVPnl8HDuSbICm9saeeR0ENoE5BkoUFiU5BOACQIa4EkS9912fPAhV8NOhYIqqZksT2Lybu/pZFxwowTu7cAFWPSduon6CMSpFj2AfjoNDLS6Gjup57rVwgTq12bhE/Iq/P4uaR13DZnTJ3I7BDRZG2vZ4MxluXHrqTM5y+WSKIcruiHcor/gXOym8QNavhGoB6bY3FLTfPt0vyJlXmeegckIKXGBbc0pxWIS8N7sXLGa45JtnOmBo9aNGgD7GOZ2fqD6aE7mCirZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 19:31:16.5605 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccb943e-f9a5-4ab9-09c5-08de7636c6ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5808
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,emersion.fr,redhat.com,collabora.com,fastmail.com,oss.qualcomm.com,linux.intel.com,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[alex.hung@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 68CED1BCD1F
X-Rspamd-Action: no action

[WHAT]
Create DEGAMMA properties even if color pipeline is enabled, and enforce
the mutual exclusion in atomic check by rejecting any commit that
attempts to enable both COLOR_PIPELINE on the plane and DEGAMMA_LUT on
the CRTC simultaneously.

Fixes: 18a4127e9315 ("drm/amd/display: Disable CRTC degamma when color pipeline is enabled")
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c   | 16 ++++++++--------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c  |  8 ++++++++
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 130190e8a1b2..304437c2284d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -765,15 +765,15 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 	dm->adev->mode_info.crtcs[crtc_index] = acrtc;
 
 	/* Don't enable DRM CRTC degamma property for
-	 * 1. Degamma is replaced by color pipeline.
-	 * 2. DCE since it doesn't support programmable degamma anywhere.
-	 * 3. DCN401 since pre-blending degamma LUT doesn't apply to cursor.
+	 * 1. DCE since it doesn't support programmable degamma anywhere.
+	 * 2. DCN401 since pre-blending degamma LUT doesn't apply to cursor.
+	 * Note: DEGAMMA properties are created even if the primary plane has the
+	 * COLOR_PIPELINE property. User space can use either the DEGAMMA properties
+	 * or the COLOR_PIPELINE property. An atomic commit which attempts to enable
+	 * both is rejected.
 	 */
-	if (plane->color_pipeline_property)
-		has_degamma = false;
-	else
-		has_degamma = dm->adev->dm.dc->caps.color.dpp.dcn_arch &&
-			      dm->adev->dm.dc->ctx->dce_version != DCN_VERSION_4_01;
+	has_degamma = dm->adev->dm.dc->caps.color.dpp.dcn_arch &&
+		      dm->adev->dm.dc->ctx->dce_version != DCN_VERSION_4_01;
 
 	drm_crtc_enable_color_mgmt(&acrtc->base, has_degamma ? MAX_COLOR_LUT_ENTRIES : 0,
 				   true, MAX_COLOR_LUT_ENTRIES);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 70587e5a8d46..127207e18dcb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1256,6 +1256,14 @@ static int amdgpu_dm_plane_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	/* Reject commits that attempt to use both COLOR_PIPELINE and CRTC DEGAMMA_LUT */
+	if (new_plane_state->color_pipeline && new_crtc_state->degamma_lut) {
+		drm_dbg_atomic(plane->dev,
+			       "[PLANE:%d:%s] COLOR_PIPELINE and CRTC DEGAMMA_LUT cannot be enabled simultaneously\n",
+			       plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
 	ret = amdgpu_dm_plane_fill_dc_scaling_info(adev, new_plane_state, &scaling_info);
 	if (ret)
 		return ret;
-- 
2.43.0

