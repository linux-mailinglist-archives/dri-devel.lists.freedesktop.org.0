Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 778566AE41D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39DE10E504;
	Tue,  7 Mar 2023 15:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CAF10E4ED;
 Tue,  7 Mar 2023 15:11:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddUBHnv4XnHPn6aAtxvDlavupRWQmHpwzGZnIxiWIKM7vBcpBm4bzqmTWgZnZANMSVlawkuLTum5io2KdTNEXAAlPrVfKYpQt9Xo7OYqcm/RFpGx86+dyPaJ2tULwC9oNtyRTtms3Lb28IN6p9YLz5YOmZ7QHXcCuclsmjVpJg0Pa7/KfUARx7Q0XufY9oDsrjM1lADYbymMQ7p6rKxVeR4KYvvAXseNcS+0Q28OuQTWbfCqcA7gZWoJL9/MN+h4+3/KURFQSMVuznRgbdXU4Pr6CKIhgkvW8zSvrn4Y2kXyDydVo7W/MoCG5rdecLJcwRaMm7t8jyrFj+KsllgKyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glBgvLWPIMnRcZxl1wQFqvDI2YIFGh+mMkDjGFiJFoc=;
 b=R9j5qo6haSwDQJLwWzeB0j0uwyIhnNEdaLGQ+GmVr4J2MySdDoaKCCimNjJGaP8WDEUv8gJRg6+Ehhc8qKBl7uZss9anGAzYqHmKZYdw1GPNLF/dTbNEVrvLf+iO6KgpcYKoYxRNg4ysQQRkUyj5b2F0OM/OFUPCOzYDRlfZCzKVOQyw1X4t28eVD0EC1/LiCMNcP+s/+y48SyqUlkRg1MVd6mjbPj4CSR9ROjWucDTCC+2H6y0nAGAnjvyEZKqi3zDltT+3PYIsFdKfRymOdoEvOTgL/z3/iXEXbVRevnvGfnoosNOqTpKpclzltkz+WQzYmPG2arwTiSfXwZf4nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glBgvLWPIMnRcZxl1wQFqvDI2YIFGh+mMkDjGFiJFoc=;
 b=zH52+mySnf81hcAOfMutJ9mdgcoCfSS58gfWzJSzm7Mvd5xmwqUK0sGZLDuGABDXjfUh268jQ7kZg6shs7RwFWSIadZuc8yl92H2tkR/PCG2UwJq/QkAoEk3yC02oldP1srYwzANwHVImVOWO1rQIG+YLCe+G6yK7PijRmsb7p0=
Received: from DM5PR07CA0049.namprd07.prod.outlook.com (2603:10b6:4:ad::14) by
 DM4PR12MB7598.namprd12.prod.outlook.com (2603:10b6:8:10a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.26; Tue, 7 Mar 2023 15:11:22 +0000
Received: from DS1PEPF0000E631.namprd02.prod.outlook.com
 (2603:10b6:4:ad:cafe::2e) by DM5PR07CA0049.outlook.office365.com
 (2603:10b6:4:ad::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Tue, 7 Mar 2023 15:11:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E631.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.13 via Frontend Transport; Tue, 7 Mar 2023 15:11:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:22 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Mar 2023 09:11:21 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 08/17] drm/amd/display: Always pass connector_state to
 stream validation
Date: Tue, 7 Mar 2023 10:10:58 -0500
Message-ID: <20230307151107.49649-9-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307151107.49649-1-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E631:EE_|DM4PR12MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d32ca27-9802-480e-5841-08db1f1e3690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1sIm+iu+/MCSDUDnQUHxypsl2DVkVq8dAFgpjx0COlXzmaH48JQPGbqw0s8ukhuLu3IX3XRH93B0et7Mln2asBIEtd4ABIR9yZfboJ2R1kFZ8UceXuXoKNku/uXUeU7TMigxl8KwuANebU/B1agpVgOObYaDJVKuH6eIGaZ2zqfv5iYbY+4dDyBoE9aGCg3X7f+XqAscsUTursDEbq/V6ptXG0Nfz5f/w6jytRQKxqj/qwVZxFLs/yb+xmEZCVunIuYDzTg7uWl6gHz3/YomDank1tEMM4F7A4PO9XjEdlGSIprJFkI9iJxAn6QkjY5WjHUBZdoJPH9ZcsdoI9jXMjCu2KoIsfSCW/3HKlPqhgdGsiKFmULnmb+IZyBbmui7zFRwV7kE6nM6SK/dxQVaiU8+Kv5J6YV5pS7Xs2caJ56atdyCJ+WMyL+Fv87/qJye5r628Eid0riPlRsR1nIfmVOZQJQtQjjLHAhnkkKzyqKtL8PdTNI6DDqrcN1N8nPpK/R6xhYQTagDNAUgveydBoZ4PCy/wQzQpOw2fX2UIASfaLh1gNxBXXSgxzuK63QJwIhDS0rIF/Y31qa3mf9EzqgwaChE/vUF0aOfBTEKRXe0yjtSRjQ1lTcxbaF+6kClT84as3mxFed4DKgzY042qR0cafr6vkXeMrwT7D5qrkttApa+BqsMZg1gWblP5+3xnnv/OsmlaQ0p2mTzLGRIVShFHv/g/vDL7I8AVsf3jgM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199018)(40470700004)(46966006)(36840700001)(1076003)(6666004)(47076005)(36860700001)(426003)(36756003)(82310400005)(40460700003)(81166007)(356005)(186003)(40480700001)(82740400003)(86362001)(83380400001)(336012)(26005)(41300700001)(70206006)(70586007)(4326008)(2906002)(8676002)(44832011)(2616005)(8936002)(5660300002)(478600001)(316002)(54906003)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:11:22.7029 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d32ca27-9802-480e-5841-08db1f1e3690
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E631.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7598
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need the connector_state for colorspace and scaling information
and can get it from connector->state.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Joshua Ashton <joshua@froggi.es>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 4217ebe6391b..f91b2ea13d96 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5916,15 +5916,14 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 {
 	struct drm_display_mode *preferred_mode = NULL;
 	struct drm_connector *drm_connector;
-	const struct drm_connector_state *con_state =
-		dm_state ? &dm_state->base : NULL;
+	const struct drm_connector_state *con_state = &dm_state->base;
 	struct dc_stream_state *stream = NULL;
 	struct drm_display_mode mode;
 	struct drm_display_mode saved_mode;
 	struct drm_display_mode *freesync_mode = NULL;
 	bool native_mode_found = false;
 	bool recalculate_timing = false;
-	bool scale = dm_state ? (dm_state->scaling != RMX_OFF) : false;
+	bool scale = dm_state->scaling != RMX_OFF;
 	int mode_refresh;
 	int preferred_refresh = 0;
 	enum color_transfer_func tf = TRANSFER_FUNC_UNKNOWN;
@@ -6541,7 +6540,9 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
 		goto fail;
 	}
 
-	stream = create_validate_stream_for_sink(aconnector, mode, NULL, NULL);
+	stream = create_validate_stream_for_sink(aconnector, mode,
+						 to_dm_connector_state(connector->state),
+						 NULL);
 	if (stream) {
 		dc_stream_release(stream);
 		result = MODE_OK;
-- 
2.39.2

