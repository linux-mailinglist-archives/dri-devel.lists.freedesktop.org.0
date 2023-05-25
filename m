Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D9F71172E
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 21:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F6D10E740;
	Thu, 25 May 2023 19:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5787C10E198;
 Thu, 25 May 2023 19:18:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFIeW1bbNt0PXMffqB+B+5N5vF0Auqh35nxPCijci93h2PDVAH8i1o8r/O+kkJZf2+Q7DxB8dj5yAOfLOlsk5YI8cP02WM2rKuNrFDjYQ0V/P4R1IP7UTemflkL3ozKfZM1D2LMkrJZjTHJGITyhMInwfMaOI+2S2G6ysUJePnldtaDSInQ5Gs637exIKqMkoony45KcdEbw65wqwh0ny5mRNDQ2dGU13RdsRXc2A7vw3MDN3uk46+6QbmDEDajiBw9Y2SOeHXK1TUrLDHyaFOQbtCLHQiVq5NPxrC0SCktgNnl6IrbNMcRkgSSYmKwEyfjvlJVdnnCB9CIrP85cIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WmRgpre+KfPjs2P3HDEMwQfwHlhytjuqJyIRhm5X1w=;
 b=mtwNPI60njBwUqH7ecMfIhKIFv2vlzeQevEOkH5WbrRqxExvLEK2ENg6N2K8+xB9DwAe61E2xIkVaONuHdfxNgP9UV+mJlInH0/1HuwNkEb0OP5jPo0QYdKag1Nu8P5Mw6c+XGFIM9drW+lkEDhIiqlgfu5L1w5nN4j2azIk9Q16t2uX9kTRC3xs1z0sZ2Z8ZmX9XINPpdcpZRaqSpa0Bmski71xsPyLtAl1aOzlh8O7bDpAd2H3yMInYrcR005hPQpZF62phK2qeKK8cRYQygSc6TFrZro4ofx2qQOwxjNPWtqqwfH/r4VcUXckUFV389k7PYA8ebAeSwE5WMGRUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WmRgpre+KfPjs2P3HDEMwQfwHlhytjuqJyIRhm5X1w=;
 b=3qvukf9FYQZTqENdbzXyIGUtWMw2fKm6A2kTOfmgQcqxLqtlZCR0h4WA+MPpIAVo3np0sOaJChPv50ZKWogJPe0raCkKOe4hbc05IeVaRWxaS64OLyWGMlz6mtQD6/Xb8tRWv0iietVW0jXeGhyFXLmcghXf4ZKyTw156L4FCzc=
Received: from DM6PR02CA0144.namprd02.prod.outlook.com (2603:10b6:5:332::11)
 by DS0PR12MB7945.namprd12.prod.outlook.com (2603:10b6:8:153::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 19:18:41 +0000
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::51) by DM6PR02CA0144.outlook.office365.com
 (2603:10b6:5:332::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 19:18:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT036.mail.protection.outlook.com (10.13.172.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 19:18:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:18:37 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 25 May 2023 14:18:36 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 08/13] drm/amd/display: Register Colorspace property for DP
 and HDMI
Date: Thu, 25 May 2023 15:18:04 -0400
Message-ID: <20230525191809.3524-9-harry.wentland@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525191809.3524-1-harry.wentland@amd.com>
References: <20230525191809.3524-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT036:EE_|DS0PR12MB7945:EE_
X-MS-Office365-Filtering-Correlation-Id: 3292810d-f6cf-428f-1505-08db5d54d9ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QrTEVZObMhiYv9SG8Kr1UgZhumZqhBrxGqVu3L7R+z1yxjeUZL+P/FshVcaFEv85jT5K/IOzip1PaHGiv2/fCRgkW5WknfNWF8cWwHgKfY8miYeyx7oVvjKynCi9WxUpYDnEGDzqJN9mQg3EPumgbeqga0Y/g14wyXOSFn31V22IB0KXSOu9EiPfKMOug5bhJk52mllbHvJthGchW1X1AzPOxln+KtFkQk+uhozVU677p57spM46+7ouhjMTEL8H9JnZ+RRDG4QhBKnukf4BZ9ipYCvHDTderHDuMLk+cln88hXDHwc2Av+lHL1tKRqUwKAxqqkbYFbFZhS8t/UxVZLsNpFFOkLlIwh0Pcvr7YkkhJeJMFBUB+d2RTT7Bikr4s/MhXZXpdWh3Tm+0oqm/lFU0hpBWaRXhe2bCOZ4Y7AuOXFfqejLjBewMf4jmQ4KmXaupQb7EwwhBqdXr3j9/6MTX+n77huwsMU8sEysyZAQ39AfJWacazBShsNkd68R79o3vhxe9gyi/TIsFLIravoMoTrc1JexLamY94VMojgLvIecmkKY8gRY6Bs+ykCN8VmBQIU9OkysRobtO/F5msHfZiiQ10SleO5z9t3S+gjFvHo7jSipB7KVJ69zmltPd9P3QQrPyZUM72Yu6z7tWyxgw6XEbXTQlt6wPPLG1iKx1H342kotjyGYNxHTFrtbmzTLHU0ys/MdiDidtpDfn/MXyMa0KZoB+YBZmZTpTyQyfPP83+wPi16xuSkjJYkWEpcZDVLbyQ4x2pAJy6b+6A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(426003)(82310400005)(336012)(2616005)(4326008)(5660300002)(82740400003)(356005)(8936002)(36756003)(8676002)(81166007)(86362001)(40480700001)(2906002)(44832011)(40460700003)(316002)(47076005)(41300700001)(36860700001)(54906003)(110136005)(6666004)(478600001)(186003)(70586007)(70206006)(1076003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 19:18:41.7105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3292810d-f6cf-428f-1505-08db5d54d9ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7945
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
index ca093396d1ac..dc99a8ffac70 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7238,6 +7238,12 @@ static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
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
@@ -7318,6 +7324,15 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
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
2.40.1

