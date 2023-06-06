Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B40724E0D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6BB10E3BE;
	Tue,  6 Jun 2023 20:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E214310E3BE;
 Tue,  6 Jun 2023 20:26:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhFW5ARaTtmSzOHp6c66xXtovx1b0E3kygGiCceSrQXTsiME0OwmiyYipt1bw/VIy1meFNPOrvJ7DPUBojkK5SrCqw6PNn1HuxhLMPDezQfhNzahqzRMBAuT8y3Ajb2SKg5f5+EwBZGWBRB9XO2WhdVQOVWTqHNQwlbOVMV9BBnoCqbdzN1lpx86lBBcWHL8HF6itRPq1sEamzHmZyQDAYx1JQaBgPRddkc7hc9JVdgcAPcH9gjBQ4bCjl+GWg0LQc4yv/OO5SqEIIHmcPx4FNYtfXDugqHOTaDUx2wqsDhz7/ZIO8lUMGmnYM5/0dEfW/555xlbbL2GbxZugPqRNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJsHN1QLfZtF+LsAlfKGb7rcED5TYdwSoxYYvKHtvl8=;
 b=Hd5oZ1jf3c+KD02KYFrHGyZ+Pc8bze3Ag/ZbMYSukmsfNeZLFxXQt/MTWo/Go8DY6ZxvxgiASOokIf7Z4GeGGeiEOrurc2N9RoKjIsHs/TFDMHJyEAn+TezCkHxclDN53o1uvCyn8QHZyF4wHD7kQysvBdcMwLC3hrNB9DOYbLh0xtlDvtAqtvD7j6f5U2ae8+PChP4ZtxDFKPBHQvspFlLsoIiGWGJpLT9M8r9kZ6NdSaYC2TX99Mo8fZbvv89jbl1H2qc+X9eDXadwwHZKKyU/jsTrmtxgeiaDtEkd2Qbk/heaw0ULgqRAt0PM/YI3Uz5vtU1hvHDs1Nw6//Rjgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJsHN1QLfZtF+LsAlfKGb7rcED5TYdwSoxYYvKHtvl8=;
 b=MoifG1BgI7hzZjFDVA9zQUFvh55ihS//m5Bfhfo9TARRXjj29ufr3bLpYM/m6/i7b1cPRK2UY9iJ6C625Ox+yD6uzx9kV+lp7J4WSG+Nw2RpaRnd6xtV3ms1VUc/qjwSUTCzSxsFO9Dgh1kJMV8cbRyUvlcyIsHnpgR246GoOlQ=
Received: from BN9PR03CA0445.namprd03.prod.outlook.com (2603:10b6:408:113::30)
 by CY8PR12MB7242.namprd12.prod.outlook.com (2603:10b6:930:59::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 20:26:21 +0000
Received: from BN8NAM11FT105.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::47) by BN9PR03CA0445.outlook.office365.com
 (2603:10b6:408:113::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Tue, 6 Jun 2023 20:26:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT105.mail.protection.outlook.com (10.13.176.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.33 via Frontend Transport; Tue, 6 Jun 2023 20:26:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:20 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 15:26:19 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 08/13] drm/amd/display: Register Colorspace property for DP
 and HDMI
Date: Tue, 6 Jun 2023 16:26:02 -0400
Message-ID: <20230606202607.122914-9-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230606202607.122914-1-harry.wentland@amd.com>
References: <20230606202607.122914-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT105:EE_|CY8PR12MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: e97d9816-252f-4fd4-e9ba-08db66cc4a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eQd3w4jZyz1uPJNmLMtqkbzatjjjIzuLpXYM0obn11SDIOzvcpwii+Nm0Cv7na9NZXVG9JxsJk9knWIv2a4BPh2wkr2vO1BPjE61t34VKgQBBbpM14kWC8IXTBDzdS4XHQwiQ5VdpmOeG0t2G7+C3FNkApJ6lJUwY/Ef23LcnQdbyNCmMM0jKHT2q/mGuoRzLCQpGl26FAjl1Oio3bfUmn6TWOJSsOMjYzpCTSrg+zF9oTZz3DI+UHMSWPr5w9ZbcbcRe51fYP5vfXMTZSCO4oPS3gPJMw0T+ErVtzMCnhT90hJgvsC1nhiCcqNETIagnLxJUg8BE5rK6HF7X36wP5Kul2dEa4NObE+AOUxtpMWdRme+HCx826XNagRcFj/8kjg2CwDxfq49h0uxVt1xUjz3WQBLa9565EnF3edRe8CRoQCxVdes1zr9J9r05HbT88GDEkKaMXlEZjCqdoro6wiSMyH+YLRKD9L1kcWfM/kNc/LLLvpIWRTcMHnReetDy2sXmHrDKVGYi+roBmAr2RledMawFMz7h/phyXK3F0dhnOKxuxomd8kl/9gF8Kg4UDV8jsYNyXb3pTMc5QoNn2+IgZJ9CXZWPCkljdjTwg6z+NHyaJhAdWAxYvm4wieI4+z5ssEFQZDaWFTwiXn30/1HVd2zMdBg7/bCTy93dFAC+CYSl/26mjzHUe52yB4MJxIFAhBpxlZJZXs272AK2dNt2YQ0LhGGd1255dmPGe7vwcQpXV6v1L8u/1xbHlPkHhz+mLECXyIxCTrf111qpQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(1076003)(2616005)(41300700001)(336012)(426003)(6666004)(36860700001)(26005)(47076005)(186003)(40460700003)(40480700001)(478600001)(110136005)(54906003)(81166007)(82310400005)(4326008)(356005)(82740400003)(70206006)(70586007)(316002)(8676002)(8936002)(44832011)(86362001)(5660300002)(36756003)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 20:26:21.1872 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e97d9816-252f-4fd4-e9ba-08db66cc4a7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT105.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7242
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

