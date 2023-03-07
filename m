Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C83596AE425
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04A010E587;
	Tue,  7 Mar 2023 15:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6924510E4FB;
 Tue,  7 Mar 2023 15:11:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWfXC2WPrVQfTw0NBttB4dFXHKFYTyYo/mIcap7yG7MhY7IanL50TWtjFC3KH/XKJAc/I0JTEL7eyazU1mGmWm7SChDyFvjX5i5H+Hbln6oPIWOozm8m+V6y1DIaw9Yi23YWTcJe8cKb6OVd2jcFROeQ0jrTXgyH66pS4hHhPOkM5TP7gk9NAsAko0anWxQg5HAjxctDn6uwSvkIXwdPU14k7+PmAvKozY1AjCqzeDUVe+E6H4BuxFp77t+EQzhd2dKdJM1MMFmSXzy8uZRiKtSrmJeaeZ7zQDvZBvQainfZeG7y6OJq5LXLpu6Iz512ZwDepXlGVxGpeQB+PeA3JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y30C2JvYRcfb9xciR0essyrGh5araGAvgr07uPTHjaI=;
 b=BfYJby2A6xd0wLP3/yHlRjlRiyPXJcgU9FCYOsqXdbBIakiE9U/LbSGVhmEGv2XTPa8bmc1SB+aX41kaAY2Xay92/AJkr5VNlWCPpjoOFHoIEgJfzyxTd1n+qEFXqtRDbfl1R9JEM5swskHa+AeQKZAHMqMOnF6tKEUO/c1L8HRRmQhImm8mR/ICxedlYVzxIA/bkzxpvdIB21iB9cH74PyyEKAQEEWOQLojVqd4ZemF+w6cOjO4LSwIjiM8Mhqsd2t758DHCiI9IEzhlE5iqN89GI8Ec6Gp1fYlTsSgZMQuoZpIGgNMCIOqj7Ea6vGClG6y/M/OI4ySHmtKDWztBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y30C2JvYRcfb9xciR0essyrGh5araGAvgr07uPTHjaI=;
 b=zMYv/85l+TCtODHtexYbSvYyoTFFxvDvYcKTJ0lvxHq6H2+mZNn8RCCTHVTfcxb2LXj5+rlkgLUjlZ5Jpzc6sdml19fExm63gK6s4hfs8lQo7K2lbsCGvTaOJ6LSK6Z1SXXt1yuRO2kD1VWnn3dVlkCnUZQctT6MmZGG6h7V2oI=
Received: from DM6PR17CA0012.namprd17.prod.outlook.com (2603:10b6:5:1b3::25)
 by SJ1PR12MB6243.namprd12.prod.outlook.com (2603:10b6:a03:456::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 15:11:30 +0000
Received: from DS1PEPF0000E633.namprd02.prod.outlook.com
 (2603:10b6:5:1b3:cafe::eb) by DM6PR17CA0012.outlook.office365.com
 (2603:10b6:5:1b3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Tue, 7 Mar 2023 15:11:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E633.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.13 via Frontend Transport; Tue, 7 Mar 2023 15:11:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:27 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Mar 2023 09:11:27 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 13/17] drm/amd/display: Add support for explicit BT601_YCC
Date: Tue, 7 Mar 2023 10:11:03 -0500
Message-ID: <20230307151107.49649-14-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307151107.49649-1-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E633:EE_|SJ1PR12MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d3294c-9df5-49f1-094d-08db1f1e3ac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 59nhw3OSdRgXtZ9XRxGaKnhEo2wC9Z8i4emyZHIk+jJlOUmofri6LI8BD/zJ5qypMQ3bO0EcsU8GVMi0lMXU1dRnUvv61fkEas5+jHMz6ZrCf89T1aFDXr3q1qT3vRRteCcHSoSoIjaPR5jO1I9MhEDHBUAATZXsV6NjgpLZr+h6KVstiTqNeSC8EHbQBugEaV2pzhjZbG7zIShSPBOARbPcskYSFygWxvBbUuAb6tEHRz8Uu+gxmClh9fYQnc3x3et4ZDwR8o2dWa+RZvqcMcOcJTnwzdw2r7/Z9emZhaddPr/AWqWRF9XIT2R6akPeSThmPXVYDt3yTdEQWZKOkziJ4IJT83bQ1Un7OdWQKK7r7QSW8Ft/ucpXg4Ox70R2Jt1VlmPhhcAOsKcciayFx1p14JC5vTnwzh4osVrHY+C3YBSk3bayBeKYYoxSeIxmXYpNOGVONg7++qm+qIpisMzXuyQji8CrNKng7ajJgGZ+29tzLF1uvidkmf9KwC+f+8Z2ArAuEtyknbwIc3+hPnjyAxOHkKMTl5nXwHEyHpQZ2H+OL1GmMVDVkf9+UGrYqf/LHDoFhBHFNVU1ELuzsPsj733sV08b8wDArsX/BbBRy+R81bgvjKgan4ie4uc5WyPYDwom0L837RBFliraEcKCnBvtqnZqoUwtTnF6tfL00qRBaMyiwGjkTmXWQC3v+y9FwqlO2zILrXUkmVfDrFSASRXtTt5EOhIsqcQ5K+8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199018)(36840700001)(46966006)(40470700004)(36756003)(70586007)(70206006)(41300700001)(4326008)(8676002)(8936002)(44832011)(1076003)(2906002)(5660300002)(86362001)(82740400003)(81166007)(36860700001)(356005)(40480700001)(26005)(6666004)(110136005)(54906003)(478600001)(316002)(47076005)(82310400005)(40460700003)(83380400001)(426003)(336012)(186003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:11:29.7616 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d3294c-9df5-49f1-094d-08db1f1e3ac3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E633.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6243
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

We use this by default but if userspace passes this explicitly
we should respect it.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Joshua Ashton <joshua@froggi.es>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 580d076b7749..7f77e226f1eb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5330,6 +5330,12 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
 				color_space = COLOR_SPACE_YCBCR601;
 		}
 		break;
+	case DRM_MODE_COLORIMETRY_BT601_YCC:
+		if (dc_crtc_timing->flags.Y_ONLY)
+			color_space = COLOR_SPACE_YCBCR601_LIMITED;
+		else
+			color_space = COLOR_SPACE_YCBCR601;
+		break;
 	case DRM_MODE_COLORIMETRY_BT709_YCC:
 		if (dc_crtc_timing->flags.Y_ONLY)
 			color_space = COLOR_SPACE_YCBCR709_LIMITED;
-- 
2.39.2

