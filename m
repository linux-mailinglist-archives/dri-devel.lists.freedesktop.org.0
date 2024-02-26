Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19E2868277
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9059410EF86;
	Mon, 26 Feb 2024 21:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CB1lhniL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DC510E7D0;
 Mon, 26 Feb 2024 21:11:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBjvSg8K8EfpiACLNM/7GjKTamY4J19jpQ8anFaS6D5W23uOxwkB3x40XSgTKyEcb9bz6VO2hnoQ7Ja/QULeyVSj7hUIiu83rrVC9ZxRBtbClW4Edho5rJssRzbRnC1RJfeB89UVdbUs4eVoJm0oBDZqmtZf1YvC/+TvfIeNDu6Qx5yjgR2jdlmu9mZTuchHKelaswwfQKYWgJWkaGKpar5lvMnhlle0PSVLe+hzDSFs15CMQfEpHRknTDmkNai3rU/tDgFkz4S5Bw2IuLPH3HnBPBhmJjDG3vNVho4T+0BlNFmqmYNmwrv+6IF2g45UCW6p1WvrCuIS3oeYDAXeQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/88vdgzYFyy1eBZ4ZElq/tA42cU70lV9R+uH/dEZMN0=;
 b=VvZuchAkJuXmMMQdt1FDKA9OFwfz/Y4EWjxsMbRt0/wHhcOYR4n2HJu0U4wy/r8ciVJ1rj66iNqpi2jQrblXDLCPKm3Q3F+td8HBlkbMQ10KLnaGFHboZSUtwStutw31u0jm5jFuYGVCu3S0sdPpPf8ltgQQdQQaqUo5zhtIn2lXFxN1YJkIhyoq3rTQvNOq71SyXnkpt4EzghwsbeaL5nelO/hUp7cZkwoiSu+EHQw9BmvB4wTr01lDXu8KzSERoDGmeQHk+v+UtJRlllS2QtXO0ut1fJ5CEv5M0bf4HYaqEiBERed1kVxKWiFMNKLXaf4wQ09EEruBtjkzH4jFDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/88vdgzYFyy1eBZ4ZElq/tA42cU70lV9R+uH/dEZMN0=;
 b=CB1lhniL3JAcls25PhJfreLrVS6WJKwkMXgej2BCkSkTzuhqRFwcQ6rGYPWh4ohKZsPxXWtvbgkUIgRW95ND3E0RPU9gdQszV6aZ9WHJU8uo9EugHB5x3OMNSaFTRAPhLXDsuli8fMqiT3xaWcZ3tAeqENf/6ieHzuDxqVp9T+Q=
Received: from SJ0PR13CA0074.namprd13.prod.outlook.com (2603:10b6:a03:2c4::19)
 by IA1PR12MB8357.namprd12.prod.outlook.com (2603:10b6:208:3ff::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Mon, 26 Feb
 2024 21:11:11 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::c1) by SJ0PR13CA0074.outlook.office365.com
 (2603:10b6:a03:2c4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:10 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:10 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:09 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:09 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>, Arthur Grillo <arthurgrillo@riseup.net>, "Melissa
 Wen" <mwen@igalia.com>
Subject: [RFC PATCH v4 07/42] drm/vkms: Avoid reading beyond LUT array
Date: Mon, 26 Feb 2024 16:10:21 -0500
Message-ID: <20240226211100.100108-8-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|IA1PR12MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c42b2c-9ff8-4cd4-c052-08dc370f7539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QoAJRq0GwHJRUVMCQegK/jjvruqakDxhOb9uMb1Aj7NYcVEVcW/Q4pZ5Dbypi+9N4gZR8MYBPZx6qdFK1rqZNEUUIMiCsee8FR4cIM07DFoYc8Mrg9OF0W36ln96vGoEJt3deNzfUDPlmn/L6cUiftOWJMceUmyc49jPxotlrUmQqBvQ6hDuz5qmymcPoDTNMkVQBEgyGtCybZjgg4VtWEmepOVhTgPpRQxoOXzlWGCeEF5KEC031GOuoY0vGcRFYk1nfHAS7HPkgUB7nQKpwLU4fqRNu4ReHZkvgOm9rxIDXy4Jipv8SC7yOOmrZg0aSz1zLPX2zu+LvQskCnBRyWtvzeJ9yeHrIk3U/VJT10acqx6OdlpowdNVUTTm2p4XW2suogr+7EEmbwk9zLQoxlE7z7uUXLKHTJucdCXHhbZr/ido9kmdjKHrPMpHIcv+rHU0mxUc7TwH8pLL1xT4EAS21cezaqmURJtrBTNGJf9NAbj5m9NGpB0WYvFAHo830ocUoR492Q3z0OmmsrpS8MSRoeiDNrxRj1eQ+zA3IwH2DDsCi0ukR9qM9adFIwMERQMDQ1gELnX36RYs5a7yw0n38poMPQwFqGIFkURXDfZQzbmS67Cx57j4sfe9/xDYKhVgV4tGS52Vgfj1QfUvfUtZEAmDD+M5sT0OewY1Oa7jB21Y/RxQESCAeuJJebPv/4t3ZKafpCWMkdLXmr66jZiHl+L/5c86DJDJJSsYCKtZXNvZ4IPGTB57drCezzA9
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:10.9742 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c42b2c-9ff8-4cd4-c052-08dc370f7539
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8357
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

When the floor LUT index (drm_fixp2int(lut_index) is the last
index of the array the ceil LUT index will point to an entry
beyond the array. Make sure we guard against it and use the
value of the floor LUT index.

v3:
 - Drop bits from commit description that didn't contribute
   anything of value

Fixes: db1f254f2cfaf ("drm/vkms: Add support to 1D gamma LUT")
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index d178f2a400f6..b90e446d5954 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -123,6 +123,8 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
 				      enum lut_channel channel)
 {
 	s64 lut_index = get_lut_index(lut, channel_value);
+	u16 *floor_lut_value, *ceil_lut_value;
+	u16 floor_channel_value, ceil_channel_value;
 
 	/*
 	 * This checks if `struct drm_color_lut` has any gap added by the compiler
@@ -130,11 +132,15 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
 	 */
 	static_assert(sizeof(struct drm_color_lut) == sizeof(__u16) * 4);
 
-	u16 *floor_lut_value = (__u16 *)&lut->base[drm_fixp2int(lut_index)];
-	u16 *ceil_lut_value = (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
+	floor_lut_value = (__u16 *)&lut->base[drm_fixp2int(lut_index)];
+	if (drm_fixp2int(lut_index) == (lut->lut_length - 1))
+		/* We're at the end of the LUT array, use same value for ceil and floor */
+		ceil_lut_value = floor_lut_value;
+	else
+		ceil_lut_value = (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
 
-	u16 floor_channel_value = floor_lut_value[channel];
-	u16 ceil_channel_value = ceil_lut_value[channel];
+	floor_channel_value = floor_lut_value[channel];
+	ceil_channel_value = ceil_lut_value[channel];
 
 	return lerp_u16(floor_channel_value, ceil_channel_value,
 			lut_index & DRM_FIXED_DECIMAL_MASK);
-- 
2.44.0

