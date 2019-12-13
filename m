Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D4C11EBAD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90FB6ED3F;
	Fri, 13 Dec 2019 20:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699756ED65;
 Fri, 13 Dec 2019 20:09:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqGo871EVddW1Xt2hUTutNWqS9JGHG7bcaFuEp0SIYPP/LVC4VTRurV3GGiRYZ/mK9OW0UgKtbZqW2s48TLcMibQgVUmu1uiCEMVYODpt1/jsdYtTj7rDhqCwTbLSnb+GYR1ObHeaCllwAK9ROM9jJKskTPbKmuXpWqBBLSpAFXHq2UawmIGK2IO0uz4Qmh6gY1TALr8GGBANGCwQrlkgvb6gtFaQwr7o6lhal3FomnzQGlhf3YoyhfCf0i9M+M2+l5zrer9QOly6wpk/YHcZ94WJSfCcDub0FOoaIHm0ZS7mQWB2YSimt63oGqtF9E72ZD1Lf7F2lTRzbAilU5Bww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmrhahiiclIy8sbJBOLWr4eeaE5sDiJb4JPc9Gw370Q=;
 b=BHnBQvxkN7csXyL8mkcBIT5fhBwUgmt0HQOE3fK0JwSZbBsAwqohD519ekVpHAD5kDSr4716/daY2EnbhHk5VEKddplbLX9kR1CN3QBDIdyceosO8oGmC0KFrdExUlk0ttajghQgFs9SjdfMswM4mdxg+OgT/0A+o2oYa7xmn9xynS23Au1IZPnb/rM2bV0COlww28doLr6NAyiR80Hwvj0+hMz7SvlDHVqfH1USOwXO5sRg/UwoN2MvyXGdlme0SUV8fl+op0xPrabT33UmkKCCZYXdSJaOlN2N76B7uPBkzqecb2JIIglNnXRePKyCiiOFhZXQEXFyZF6n3aepjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmrhahiiclIy8sbJBOLWr4eeaE5sDiJb4JPc9Gw370Q=;
 b=4GOwwz7xvqqq0lENIecN5xlznuFxvl3sKLiYem3GtqS3Kao8l4h0BALeObACUFZIUN+APt35RlceSSJSKxmoYqr3FUMR6HlhU8bFKCnOS+IHAkSLuhgrwNKfus3vd5geuH/J7LucAKsqNP0SHr1uqom03YsxwQ3pLA6mi4/kp+E=
Received: from SN1PR12CA0093.namprd12.prod.outlook.com (2603:10b6:802:21::28)
 by SN1PR12MB2494.namprd12.prod.outlook.com (2603:10b6:802:29::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15; Fri, 13 Dec
 2019 20:09:09 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::208) by SN1PR12CA0093.outlook.office365.com
 (2603:10b6:802:21::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17 via Frontend
 Transport; Fri, 13 Dec 2019 20:09:09 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 20:09:08 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:09:06 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 13 Dec 2019 14:09:05 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 18/18] drm/amd/display: Trigger modesets on MST DSC
 connectors
Date: Fri, 13 Dec 2019 15:08:54 -0500
Message-ID: <20191213200854.31545-19-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213200854.31545-1-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(428003)(199004)(189003)(81166006)(450100002)(478600001)(81156014)(4326008)(5660300002)(2616005)(36756003)(8936002)(86362001)(54906003)(316002)(2906002)(26005)(7696005)(70206006)(70586007)(8676002)(6916009)(426003)(6666004)(2876002)(186003)(356004)(1076003)(336012)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2494; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b910d99d-809d-4e92-e805-08d780085038
X-MS-TrafficTypeDiagnostic: SN1PR12MB2494:
X-Microsoft-Antispam-PRVS: <SN1PR12MB249415DB51398B24EFC6D9D6E4540@SN1PR12MB2494.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4l044GH/OkeTbnQgRlqYJ32//yhSn8f/xBynGVtZ82vB+QDSG1v2+vKfAQTedvnRcvcPYOpB6lq9US2vJ3Il981AjnMvu6jLBremtEOccHJf/LsgtWRuVqlORbXpEblY9goUIWkcLQ1IE+iN2vAy2RrC+94Awu4Lkfi9H3jTio3FIWrTHev9MfxCtjjw2gD1RNxWRtrcNTdpYAlZzmeYlPP8vY9PbAA3xj4PLgzYOI0QlNEqqJ0BVjvSsoLnRE4UacXEpMwWgOaoCKeiampGfjR5myxGTSEw51X1EBrs9FICmM2l24jfqAXxI3VKuoiI778ubCmGdb2LdI/FIxvpdNsI00eDZoQSPOxoWn73983HehMfWCrlM0hJFijFElde/PT96yqomXxnBiSL13AlJR8Liyd03YaXwocSbnm82yqYil6yCb0FguK6piv55XHCrVOW3nRUhQSuyLniu1/VgDeWl/fGMNH8lK4DbEnu/d/4QdIaYD/XDlRZZZX9rRsP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 20:09:08.9794 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b910d99d-809d-4e92-e805-08d780085038
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2494
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
Cc: David Francis <David.Francis@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikita Lipski <mikita.lipski@amd.com>

Whenever a connector on an MST network is attached, detached, or
undergoes a modeset, the DSC configs for each stream on that
topology will be recalculated. This can change their required
bandwidth, requiring a full reprogramming, as though a modeset
was performed, even if that stream did not change timing.

Therefore, whenever a crtc has drm_atomic_crtc_needs_modeset,
for each crtc that shares a MST topology with that stream and
supports DSC, add that crtc (and all affected connectors and
planes) to the atomic state and set mode_changed on its state

v2: Do this check only on Navi and before adding connectors
and planes on modesetting crtcs

v3: Call the drm_dp_mst_add_affected_dsc_crtcs() to update
all affected CRTCs

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: David Francis <David.Francis@amd.com>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2ac3a2f0b452..909665427110 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7930,6 +7930,29 @@ dm_determine_update_type_for_commit(struct amdgpu_display_manager *dm,
 	return ret;
 }
 
+static int add_affected_mst_dsc_crtcs(struct drm_atomic_state *state, struct drm_crtc *crtc)
+{
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	struct amdgpu_dm_connector *aconnector = NULL;
+	int i;
+	for_each_new_connector_in_state(state, connector, conn_state, i) {
+		if (conn_state->crtc != crtc)
+			continue;
+
+		aconnector = to_amdgpu_dm_connector(connector);
+		if (!aconnector->port)
+			aconnector = NULL;
+		else
+			break;
+	}
+
+	if (!aconnector)
+		return 0;
+
+	return drm_dp_mst_add_affected_dsc_crtcs(state, &aconnector->mst_mgr);
+}
+
 /**
  * amdgpu_dm_atomic_check() - Atomic check implementation for AMDgpu DM.
  * @dev: The DRM device
@@ -7982,6 +8005,16 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 	if (ret)
 		goto fail;
 
+	if (adev->asic_type >= CHIP_NAVI10) {
+		for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
+			if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
+				ret = add_affected_mst_dsc_crtcs(state, crtc);
+				if (ret)
+					goto fail;
+			}
+		}
+	}
+
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		if (!drm_atomic_crtc_needs_modeset(new_crtc_state) &&
 		    !new_crtc_state->color_mgmt_changed &&
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
