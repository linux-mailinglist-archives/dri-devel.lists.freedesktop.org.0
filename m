Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1137044C3
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 07:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0913310E2DC;
	Tue, 16 May 2023 05:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515D310E2DC
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 05:39:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nETACG0QHQCuCPmJ6Z54W8aznO8K84PYrVhKfdwUjiZV1BzDPGeyCSFY/3kVThGpsog32RkBBFq3TFR+N+wBTZMVV9bkzSJ2LT/HsGcFhbiTd5P0vIhDTmE4TTccAibLqWa+no8MymqayRIB9PibbqzeX3CIdWMrpT3cOIuXFxko2kTHcZ6L9NjOWMSsombPBIcz9GiBBf9aRFSVc86yLIJWD0Z6iKc7gWd/1jGpQs69Obev9mf/zo8AzILR/7q07ANHucKFEajFwulzgvtpDCKbkD7aTdlZbTYhbG3C6CKQq+83ZYU3lzvKGZrpAbdIaCXdcB9iOQM/yvqs4mL2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kH/nmlgFG9cXld3K44FMxcc50LRgStVNzrqhJ8QMHrc=;
 b=fA+zZ0dmDCsqMm/rJkYbz0HVCDeueRjTufoSeJ5yCdK6P33E8Yrj/nLv8l9LsKSC8NupESFbwFmnQmLDfKU8RKBReqP/wC1NddjW2r1GPgdqaWuMPvm7zX6xn+UJZSMLkcKxDC392eMNWN8zc3RyP92Um3kV7ezXknk/8bju94okSvCEbsHBIyESJ6GUXUp9fb63ndsvAv+IfTrDWy2brQHxrgRk/N0YRz8M9+QjkQN/RwuJRQhx2O0xvPKWbfzAYfeAbI55gp63zuHtHMmlTA8iwvac8ybESY9dlCrpMAKdblzQ6vE1SNhi2EIsEMUeO9l5CuTjAIeeYXgaVX2pow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kH/nmlgFG9cXld3K44FMxcc50LRgStVNzrqhJ8QMHrc=;
 b=kutL6vzL9/1l4vZoaYzDrckYuTKPW/WhZohS5jkEYRxwX52ID0PRKs6b1L0TSsZ4eVyXXrsBNYdm+d9zFjheBu0iR2BwGN6FjlmUbLlO3oFxYlAEeZFeFIcZhK57yI3O5Pne6O7yF4T9XzP1VjwuQZaOQ3uDj5QewoxBJLdXBAU=
Received: from MW4PR03CA0224.namprd03.prod.outlook.com (2603:10b6:303:b9::19)
 by IA1PR12MB8261.namprd12.prod.outlook.com (2603:10b6:208:3f7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 05:39:53 +0000
Received: from CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::a3) by MW4PR03CA0224.outlook.office365.com
 (2603:10b6:303:b9::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Tue, 16 May 2023 05:39:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT053.mail.protection.outlook.com (10.13.175.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 05:39:52 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 00:39:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 15 May
 2023 22:39:51 -0700
Received: from alan-new-dev.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 16 May 2023 00:39:50 -0500
From: Alan Liu <HaoPing.Liu@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/7] drm/amd/display: Implement set/get functions for secure
 display ROI properties
Date: Tue, 16 May 2023 13:39:26 +0800
Message-ID: <20230516053931.1700117-3-HaoPing.Liu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516053931.1700117-1-HaoPing.Liu@amd.com>
References: <20230516053931.1700117-1-HaoPing.Liu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT053:EE_|IA1PR12MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ba0eed-5ce2-4502-5ab0-08db55cff903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GoFbMuIZnHmWNibZ9/qsUcBdK8Tm6zPf5IV/NTKgY4eAtDdhWSzCePlsHMEHWv4BEgB62NYWiMSxjqlctS57buYnMFyNgEyJNwDM7nJ3+v7KTuIjY1pGmXbp3yGtDKsKj6ubvXV1tVdzzOKOxxykW/VvTHQFA6RE5ox5c2NFhO5L3nQ10vu0ODLbGqDn13S9L2JmvyOZkyt8KkL9feQDZ9/gW7Anc6xS80YVaCHzjP5ThYX0RJDGjGezgULdiTLJxhrR113h0q+xfYBG/QKeFvcKfu+qbRtHYCceyNE9tK6Kd1ZekkBZgNa1ExuTEIxhjuP7r6c1Eba7c8HAdT7SzwfoLvwHDAe1lnMaCNfGt/RZWOmwk1stMCg6HnZKS3bGEJoLppQGK21VLqrI/GXbevwRFPkZJJO1DfL0xKmB9UeGigGok9PPo2MU+pHm1o7wtzD6gfUjLjchFHYnvo4UxTPevh6ERV0Uq1jH3ZzFbZ8Ol5cVhN+Eu26BxtBcVJaRMGcQlb6glNla03PF3TyGXHMw/XtiAY15hjxqcjkswQu/OIJud39S45HpG3Eu5qS8voH8FiEekb/WUYCm7xyPKvYNlx7ikAVRuvPmFA6A9ye6zZDxZGKtkfGea+OwU/Wi/ay8PzZy8EHu4vrxRCvur3e3QTKeKfHSpDxL2gLLf1pZbDaLMY42MwpC16O9tABNzv6KlGL7rWm8YNzRy2pL5xUTXYLRyrtCyzMWMOqYukhs2qlLaGXGZYKY5MTAwYubHE79CiEUNA59gLjE3MOM1A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199021)(46966006)(36840700001)(40470700004)(86362001)(186003)(36860700001)(26005)(1076003)(6666004)(2616005)(47076005)(83380400001)(7696005)(82310400005)(336012)(426003)(8936002)(8676002)(478600001)(36756003)(2906002)(40460700003)(54906003)(5660300002)(81166007)(82740400003)(356005)(4326008)(41300700001)(6916009)(70206006)(70586007)(316002)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 05:39:52.5832 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ba0eed-5ce2-4502-5ab0-08db55cff903
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8261
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, wayne.lin@amd.com, lili.gong@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement set/get functions as the callback for userspace to update or
get the secure display ROI configuration.

Signed-off-by: Alan Liu <HaoPing.Liu@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 4af7ea6fbd65..e1a17f2d6f2d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -319,6 +319,53 @@ void amdgpu_dm_crtc_attach_secure_display_properties(struct amdgpu_device *adev,
 	if (dm->secure_display_roi_property)
 		drm_object_attach_property(&crtc->base, dm->secure_display_roi_property, 0);
 }
+
+static int amdgpu_dm_crtc_atomic_set_property(struct drm_crtc *crtc,
+					    struct drm_crtc_state *crtc_state,
+					    struct drm_property *property,
+					    uint64_t val)
+{
+	struct drm_device *dev = crtc->dev;
+	struct amdgpu_device *adev = drm_to_adev(dev);
+	struct dm_crtc_state *dm_state = to_dm_crtc_state(crtc_state);
+
+	if (property == adev->dm.secure_display_roi_property) {
+		struct drm_property_blob *new_blob, **old_blob;
+
+		old_blob = &dm_state->secure_display_state.roi_blob;
+
+		if (val != 0) {
+			new_blob = drm_property_lookup_blob(dev, val);
+			if (!new_blob)
+				return -EINVAL;
+		}
+		dm_state->secure_display_state.roi_changed |=
+			drm_property_replace_blob(old_blob, new_blob);
+
+	} else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int amdgpu_dm_crtc_atomic_get_property(struct drm_crtc *crtc,
+					    const struct drm_crtc_state *crtc_state,
+					    struct drm_property *property,
+					    uint64_t *val)
+{
+	struct drm_device *dev = crtc->dev;
+	struct amdgpu_device *adev = drm_to_adev(dev);
+	struct dm_crtc_state *dm_state = to_dm_crtc_state(crtc_state);
+
+	if (property == adev->dm.secure_display_roi_property)
+		*val = (dm_state->secure_display_state.roi_blob)
+			? dm_state->secure_display_state.roi_blob->base.id : 0;
+
+	else
+		return -EINVAL;
+
+	return 0;
+}
 #endif
 
 #ifdef CONFIG_DEBUG_FS
@@ -348,6 +395,10 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 #if defined(CONFIG_DEBUG_FS)
 	.late_register = amdgpu_dm_crtc_late_register,
 #endif
+#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
+	.atomic_set_property = amdgpu_dm_crtc_atomic_set_property,
+	.atomic_get_property = amdgpu_dm_crtc_atomic_get_property,
+#endif
 };
 
 static void dm_crtc_helper_disable(struct drm_crtc *crtc)
-- 
2.34.1

