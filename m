Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2984F726480
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36E610E516;
	Wed,  7 Jun 2023 15:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54C510E516;
 Wed,  7 Jun 2023 15:26:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAVUroknK8Yqxdp8BArF5ESVAetqL60498E2qcyeCIEdZBKs93nTWL8da6gtC6TedQL4N3vzr7IhtgfHMrwUcsIN70MdmwAsMqMmUGTy9rDvbVXfoAA+TC6+c2vCCgg+5JapzzFbjvPMTO7/zSOqU9h0e3UOhRfzcS+XQYrYGB9uv9AoIhRh8w5w3cK2U/eLP5uGYK18roVI2yeBo6NCrZpmZkMUs2qzRVIjbYgmPdKqTSrZGlh78J+/s5d+P28wLRnWIAasXlTRDM43S4/mSjO7kYZdNBLOr2dGFvdMuWS5zKb9n8T3X0OWtKIdybaafb+Vqd8D1Yq7nQ+veTOQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/NS+1vGteSclDYENuOwBvcc/JyQ/ozH9y5WdFiuEtc=;
 b=XNg0Zz2OHfySCE3nKtsOzaJDcj6iYlz6aRhMqycS4pARtTIiO55PIudOoesfaa4mATfvqdcfDHMIaMlOUi92LttAjl3rT2ECHFnPXww64OxsW8y16KZfjPNhCnQ2/3kcekppixqY9K6rSZvI7ESdK6Ylf68HZW0PhsaKqQPst3YTPEc6FGeLR5cNMsXC8HBGBvN1U26QJikX2xyd6AT9MC4r2mdzjRhqeFLIWSDu5opAdE8KOYK+64MXQSsPX6kn0+hl0JwUNOdr9hAgiYyQM0HAoDG+p5kH63Sah6sLEjbrWOF84IWKwbfgis5wbmL/E/RPCiNX9eSuMnEDT29Gsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/NS+1vGteSclDYENuOwBvcc/JyQ/ozH9y5WdFiuEtc=;
 b=Je8VeERscnhiutu4UUfdbvj0GpEXdg2VBs3GFO7KnilYxmO6+efAp+3HALAJ5+yvRFcs22Xsk9De7cxc8eBC3B2HhG+Qj+ZjPmylFA64hKWfAclBDFRk1Wmr5/4WbaBJyz0+92SaXzWaaZQveRcJFDtjz8k58lVNFPMqLqICymI=
Received: from DS7PR03CA0343.namprd03.prod.outlook.com (2603:10b6:8:55::17) by
 BL1PR12MB5271.namprd12.prod.outlook.com (2603:10b6:208:315::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Wed, 7 Jun 2023 15:26:30 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:8:55:cafe::2e) by DS7PR03CA0343.outlook.office365.com
 (2603:10b6:8:55::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Wed, 7 Jun 2023 15:26:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.13 via Frontend Transport; Wed, 7 Jun 2023 15:26:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 10:26:28 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 10:26:27 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 07/13] drm/amd/display: Always pass connector_state to
 stream validation
Date: Wed, 7 Jun 2023 11:26:11 -0400
Message-ID: <20230607152617.997573-8-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230607152617.997573-1-harry.wentland@amd.com>
References: <20230607152617.997573-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|BL1PR12MB5271:EE_
X-MS-Office365-Filtering-Correlation-Id: ac5f2844-03e3-4122-fe2b-08db676b9105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2hrCo7b0OnVr688qjzXwmUNK6/e5jc+pYXgT+2cKa2okIseVw6itJDcu2THsGYH7vK7dXBkP3VvtWRUBPF/AIMMAFl2I9UoRElxLekpwJD2H74mzkPXdejisfDActfItLpuZnKkqQkAexThDdhLyzVGyXRCFTew4qJVpxHJSKuhy5cR7BsYA0mdiSXCz5+Q5Q1KqNlL2Tx5xNpcwbzoIrQgZ7jjBrGMdk9RSGu/bVY9cay28F7MqwuOULm9VUIztCNYxfuNr1YobG00Yn9NFSjA7DIgmaigWkUZIcErEHnwU/Qt0H4lgl3Cdmqtsqcrxpt8hipUPENnLZubJ4jkgC11LmQbaBEJewJobpwOG8YIV+8HV+IDvcSFGMdUEAl4M2WDZerFb3kmLTeMESc81Keo+gKrkw8EP2wACJn49XlTnmZo8CfIaRxh2lviNREfyOXaEzxpxbuHRUkYU/SP53Loym5wC8ZUYmjVu2IXgSxT++7iOVEIRblyTqhOoEWTXwicuzmpQTjfpTUZYPixmtiT/QfdTMJgEoxpDNN621K+tZxZJU73lU0nXtrwYQ1DI8EdUJgbkuK+eXU+s3gc+htG/r6bfJci/JVXL5c1ZtI+hzHbA745K0+AVPaBbl2uMPWHcL7anlcWkZlRorFwW0Dy4YCKTk0eSwPcJ6rQs2pHIKs6sB21p5f8o3gL+VcEkcoJ63FrxqKtVWF3/WszvYTo4fLqYUZq93SHqmii+xX6zrqB9uuhCfmpQN1T56QGFUe7mSEd7ex+ji+TIjN2C4g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(26005)(110136005)(70206006)(82740400003)(70586007)(81166007)(356005)(4326008)(1076003)(36860700001)(83380400001)(82310400005)(47076005)(336012)(426003)(478600001)(2616005)(36756003)(2906002)(40460700003)(41300700001)(316002)(44832011)(8676002)(8936002)(40480700001)(54906003)(186003)(86362001)(5660300002)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 15:26:29.4370 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5f2844-03e3-4122-fe2b-08db676b9105
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5271
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

We need the connector_state for colorspace and scaling information
and can get it from connector->state.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Joshua Ashton <joshua@froggi.es>

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Simon Ser <contact@emersion.fr>
Cc: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 90de0d37f1d2..27868dbb09f6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5954,15 +5954,14 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
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
@@ -6604,7 +6603,9 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
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
2.41.0

