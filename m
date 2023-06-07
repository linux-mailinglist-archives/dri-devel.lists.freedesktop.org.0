Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E49F726486
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7AC10E50A;
	Wed,  7 Jun 2023 15:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA5710E50A;
 Wed,  7 Jun 2023 15:26:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdZfb5x+pqVVfuqdrZH24echC0tBdGTIicZGffVyT+ZJNVuHMcWvfSw/Rcu3JJdk+mVgtGOCUvenJDC2rwdn0DqXksVkXd0H2K75SZwSKUKp0lW+Rl5gciE5mdY+MZgpZ/2aqSFaEh4b+aJtiKHD8IuoTMlko3XFkIFC/e8HMo+kB/laTfRB6P7KesGycyMuVZvDc2gLi9Vt44FCEVIn5EmYFl8TYiYzWev087iXq6q8zYCxu158bLu+2uw56iv8lfdRaOd1HEYps29aw9fnVSRxiII0pHo+JkBEvkaJs+3wP3HxVnyxFsZD37kBz8gcAsMXuGFYkGnoePYUQ+ZpNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aC1Db0hRmfs7dV79ObnT9GB6DImHJQqa7qezPimMmRU=;
 b=aBLr8iRYb8u63OP2xQPz6Lj5RpoQ3Dfu1plNY2bCOfGxlfg77oLHBij1G8EQHlYyGTbtEUWgt2G4I0U5QaRKshTyyebzo1wnBA5o4gopNYSW3aNuqTH/XzgcPKtM3mJ1DSPfHDL5LgkSFmIHm5XUu1hra9sYtpHXA046hiFZH6JGRPAghzZ02BbY/IKVTss798MVEQHo/C/6R9oYgIdY/BqnKyk5bl9CglMzmQZEwLCOjS+YFIeHcUDetCziCumcvwwB+rBqsdh1JK6b8sUAnYPrvw/K+KuKhp/1A0pjJsUH3Nef4jMO1KwwTBeRfhAFoGOSkt2Ys9jt0dv5daxlZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aC1Db0hRmfs7dV79ObnT9GB6DImHJQqa7qezPimMmRU=;
 b=CU7dextATkNUzNYeFCUWb2ft9VuNmYKitns5E9TgaMp/r3CE8wCESV7CNColMmqBAK5zNPPHYB0kCV+ENl9tyHSeZd95QKC4HGYEP5QAFVTywZZlBA/ESYW9letcso2RBzgVTvfhdB80EUprVUM39D9nrLQr9lKY6utS/P2Q3/Q=
Received: from MW4PR03CA0100.namprd03.prod.outlook.com (2603:10b6:303:b7::15)
 by DS7PR12MB6288.namprd12.prod.outlook.com (2603:10b6:8:93::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Wed, 7 Jun 2023 15:26:30 +0000
Received: from CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::a7) by MW4PR03CA0100.outlook.office365.com
 (2603:10b6:303:b7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Wed, 7 Jun 2023 15:26:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT097.mail.protection.outlook.com (10.13.175.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Wed, 7 Jun 2023 15:26:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 10:26:29 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 10:26:28 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 08/13] drm/amd/display: Register Colorspace property for DP
 and HDMI
Date: Wed, 7 Jun 2023 11:26:12 -0400
Message-ID: <20230607152617.997573-9-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230607152617.997573-1-harry.wentland@amd.com>
References: <20230607152617.997573-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT097:EE_|DS7PR12MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: 088e4a2f-a813-4200-3286-08db676b917f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WG/F7Zap3iYaoAGHW0EcKFhNWWqeGXfA+WS3epvS2qd7OGUbnrCRUYPSwTeCLRkDpH27MLdZkyEr2Vk8WjCWjZMefC6Jj3uDNbw9c1C2vUgyBuMmhetUmwIK3GOxbNZUynLiI/v379wxtLkOoN1xRhVyPPFjFq7hZ8ihnxwoHiZ/QuQJ7PJcIFQscdpewjrC+svGAjdDofpIIaUkFfJuDOJvFJVyMhJyLJHT3vjgI5eLr/FE6nLugbQTaOYPbO3lujMAPXXnx1gy9WxLbcWeQhStJWmDrjHb6TmS5wiZgqwtOyuoTFPPo6P4Ium7HNZpWO41P1e6QU1uuwDwdpppkRPMru/lgYiDM5R0lvkYIzjFaAc3gQCwQRhYsMpb33K/lERKP/NFOTeSVNC0BdUZIqsvTjLeB/B8a+OKQpOyYBw4gtb7h/wCeof6z+j+3nNEYCS4+AfEubJi4uii5arUS/Uqd0FBLacLuMqz5p01Hb88QLjpLGh51LKgUKVnSNZh2hVvDaHuOgRVQjsGhJ1ka9jRFkm5KT+K/gOg6H5AH+w8QOBP8yuP7HJqq6U7JyrEUbURDxGTzvdwWPOsKLX2T7k6oeYcKiMi92JnSaqL0N6/W0V4qJ4IX5+dWEuJwMNMAGDJVXmjVQXJITyn6jK4A7gdi+eB73o2kwM3CBvi7bbSYUEeceJqCfYyv2f6fYYF6TMjmhOhTVm6Zl6qcWRWNMVLOMNl7d4s8nFInq+JYUAdAhWpmwUmW6SPwA6js3pOnVfGE9j222guZ0sKpVyLyA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199021)(46966006)(40470700004)(36840700001)(40480700001)(54906003)(110136005)(186003)(81166007)(356005)(478600001)(40460700003)(70206006)(8936002)(8676002)(316002)(4326008)(70586007)(2616005)(41300700001)(36860700001)(426003)(6666004)(1076003)(26005)(336012)(82740400003)(47076005)(44832011)(86362001)(5660300002)(82310400005)(2906002)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 15:26:30.1844 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 088e4a2f-a813-4200-3286-08db676b917f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6288
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

We want compositors to be able to set the output
colorspace on DP and HDMI outputs, based on the
caps reported from the receiver via EDID.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Joshua Ashton <joshua@froggi.es>

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Simon Ser <contact@emersion.fr>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 27868dbb09f6..bdda136235af 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7246,6 +7246,12 @@ static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
 	return amdgpu_dm_connector->num_modes;
 }
 
+static const u32 supported_colorspaces =
+	BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
+	BIT(DRM_MODE_COLORIMETRY_OPRGB) |
+	BIT(DRM_MODE_COLORIMETRY_BT2020_RGB) |
+	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
+
 void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 				     struct amdgpu_dm_connector *aconnector,
 				     int connector_type,
@@ -7326,6 +7332,15 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 				adev->mode_info.abm_level_property, 0);
 	}
 
+	if (connector_type == DRM_MODE_CONNECTOR_HDMIA) {
+		if (!drm_mode_create_hdmi_colorspace_property(&aconnector->base, supported_colorspaces))
+			drm_connector_attach_colorspace_property(&aconnector->base);
+	} else if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
+		   connector_type == DRM_MODE_CONNECTOR_eDP) {
+		if (!drm_mode_create_dp_colorspace_property(&aconnector->base, supported_colorspaces))
+			drm_connector_attach_colorspace_property(&aconnector->base);
+	}
+
 	if (connector_type == DRM_MODE_CONNECTOR_HDMIA ||
 	    connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
 	    connector_type == DRM_MODE_CONNECTOR_eDP) {
-- 
2.41.0

