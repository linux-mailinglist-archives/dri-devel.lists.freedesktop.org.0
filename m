Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64136607C4F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 18:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC51810E258;
	Fri, 21 Oct 2022 16:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B7E10E258;
 Fri, 21 Oct 2022 16:33:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQ7n0YCv6AycN3V2+FdUQxjM0Ovey7nEN6z6/WgfyiKk8fRiyPP6WF5deXBd/LxVGrXQyTef3CeiXnld9ZrxPg0Xc0EhguV6OtHykLbSJYEizjYzK0gw9GpD5leUfuzMpjvS3w5Pwhd5kkgJCV8ccqQCvwLF+inxtvYwXX74/f1O4fuGoLRkoEdMZUWKbSCyYfuJmW4hgpqYJeH/AVnzrmDsfShYKx4tzcVzgm04vybsNNIgrque7/4aiybeXvO/yknQnN9sUZQykEJzUg0O+lmIorVXPdyozEOvg6HstR9S/DHsN8ik7ol02xi8xYiH6+qw0pe9J6bzeA6+JI6XUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wB/+0NrUJkLOB7LSABpljE30X3y4tzaA0xFntAe1kVA=;
 b=if1UqnjwP7gxZs9DLMm0psqoVcTJmNQUYwFPXmWYsakPSq8zE0qyMxxCREpZZCpqyvvt84DNXGPx7I64BvBr+ApA9y26TV1LkItxYhwt5GAPiNzigLa8n8xR4dVi3tMvfmuV0b/luBRgWVbL9LOAZzKPg2CtPck66Pi22nE7B5STjNwEU2lKsZ9vYoUJYzr0eUvJzDp3i020ylEcFnggrl+Fkt7G3x8og9B5IVvP7ZjzrXEb+xpu4gcNGMrYjzA1tlkjCipxGRMAq7B7BGCK4Zc1rc7C2VGNDEsxuFYqE1bS3psNUU3ripU0/PvJVkdIcOJ4CzqPtfSXheeLUqkYqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wB/+0NrUJkLOB7LSABpljE30X3y4tzaA0xFntAe1kVA=;
 b=f2oOsnx5k8NYTdQzltPlUU/Z0P4V+0THqeGmZmYxoDFqBIsqC0Bw+YBxMvNvmTKg5Hg1iByFt7L3s0uFvcTsFyM2Z22cLdBqgaOFubkdHfT3f4aku2eDA7QHTeXeojQfYNTxpE9EQ6Hub++Eh7EQQR/Z8kaWHwhZR2T6KCB/5u0=
Received: from BN9PR03CA0217.namprd03.prod.outlook.com (2603:10b6:408:f8::12)
 by CY5PR12MB6299.namprd12.prod.outlook.com (2603:10b6:930:20::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Fri, 21 Oct
 2022 16:33:55 +0000
Received: from BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f8:cafe::46) by BN9PR03CA0217.outlook.office365.com
 (2603:10b6:408:f8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Fri, 21 Oct 2022 16:33:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT109.mail.protection.outlook.com (10.13.176.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 16:33:55 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 11:33:53 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: don't print messages that contain %f in dml
Date: Fri, 21 Oct 2022 12:34:12 -0400
Message-ID: <20221021163412.82029-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT109:EE_|CY5PR12MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: a5f2f301-3aad-418b-83d5-08dab3820c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R2pnZospwJWOhYBu8X1X3Uv9cTlrWDW90h+bK3EuhbdTdLjdRaSd5gTotPHBBTBhX+FiafZGC2/17/WV5ti/vpWKm2UlPimHpY/QDr5tiNKAnz6oTm7TKY5j3yMo8OLnMHtBdGmwyxefaXkvvadB38qdohSVfGBy6VThr6sEVw7yKvKvo3cuS43SOrQ835CJtMaT/Z+JZcB9f0wKCgFmBpYtLAveGdT4u8Hc7euqgZW/TEgkihZqeNk0DXDxBbXzqv+5SIg8TswmEQDbESZB8vCv3MnmMS2Pl8liJPxAV/SYzqBAxyzS5h0wG8gUBk4ZTmLe4NWk8jMAhdAeW10nQpgDR926ZcIc7h25yiJLTPzg6+4C0g79R7VQgaWzLoZtmI7bFv/9Hs5GB6YXeblzvNN4iVtvsos/pOQ8LRuDy7WmYRD8ZoJytO+1mQfLXm2GP30ePiG4CygMpQHpAThxVmgI7LWey6Z8M/VhZF3w7VgbQBOZrpsGd3CUMNbKL9mC+1LMWv+QFAGDekft9jOgTHdjRZWxnKf4eASZAZG50ce9A+vlqYXmFVOu4lZ9fdlne3Ih0y3FxZxQRLWXr6PKiIVWnha80UB5tfM7Y5d6N1cmtNnO2+RyjPHQTcow3h9QyRL03MOAhxL4x/dMDYkrNMQGa5hUulGIGFd2L0ICwlzRUZxO4nVA204tuXg656uMV3KlFK5gVlMjTmXGRqeTty2lIoKnWBXO9mc4GkqrscBb0jwQ/s/3/fq+9XW0ezKJ7lM3vGK2hsOcGozPkS+bx31Z5BLuFDuLcgITEdShrxYqY10s8U9TwhkSBFHZq7eyXZTd1TulGM1aXoSvAj0BQw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(40470700004)(36840700001)(46966006)(7696005)(6666004)(82310400005)(47076005)(316002)(336012)(426003)(1076003)(16526019)(478600001)(2616005)(70206006)(36756003)(70586007)(26005)(40460700003)(186003)(8676002)(81166007)(83380400001)(40480700001)(6916009)(356005)(54906003)(2906002)(86362001)(36860700001)(82740400003)(44832011)(5660300002)(4326008)(41300700001)(8936002)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 16:33:55.4817 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f2f301-3aad-418b-83d5-08dab3820c07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6299
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
Cc: Brian Chang <Brian.Chang@amd.com>, Ian Chen <ian.chen@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unfortunately, printk() doesn't currently support the printing of %f
entries. So, print statements that contain "%f" should be removed.
However, since DC is used on other OSes that can still benefit from the
additional debugging information, we should instead remove the
problematic print statements at compile time.

Reported-by: Jim Cromie <jim.cromie@gmail.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/include/logger_types.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/include/logger_types.h b/drivers/gpu/drm/amd/display/include/logger_types.h
index 3bf08a60c45c..f80630adb5f0 100644
--- a/drivers/gpu/drm/amd/display/include/logger_types.h
+++ b/drivers/gpu/drm/amd/display/include/logger_types.h
@@ -30,6 +30,12 @@
 
 #define MAX_NAME_LEN 32
 
+#define __DC_LOG_IGNORE_FLOATS(fmt, args...)	\
+do {						\
+	if (!strstr((fmt), "%f"))		\
+		pr_debug(fmt, ##args);		\
+} while (0)
+
 #define DC_LOG_ERROR(...) DRM_ERROR(__VA_ARGS__)
 #define DC_LOG_WARNING(...) DRM_WARN(__VA_ARGS__)
 #define DC_LOG_DEBUG(...) DRM_DEBUG_KMS(__VA_ARGS__)
@@ -48,7 +54,8 @@
 #define DC_LOG_MST(...) DRM_DEBUG_KMS(__VA_ARGS__)
 #define DC_LOG_SCALER(...) pr_debug("[SCALER]:"__VA_ARGS__)
 #define DC_LOG_BIOS(...) pr_debug("[BIOS]:"__VA_ARGS__)
-#define DC_LOG_BANDWIDTH_CALCS(...) pr_debug("[BANDWIDTH_CALCS]:"__VA_ARGS__)
+#define DC_LOG_BANDWIDTH_CALCS(args...) \
+	__DC_LOG_IGNORE_FLOATS("[BANDWIDTH_CALCS]:" args)
 #define DC_LOG_BANDWIDTH_VALIDATION(...) DRM_DEBUG_KMS(__VA_ARGS__)
 #define DC_LOG_I2C_AUX(...) DRM_DEBUG_KMS(__VA_ARGS__)
 #define DC_LOG_SYNC(...) DRM_DEBUG_KMS(__VA_ARGS__)
@@ -57,7 +64,7 @@
 #define DC_LOG_DETECTION_EDID_PARSER(...) DRM_DEBUG_KMS(__VA_ARGS__)
 #define DC_LOG_DETECTION_DP_CAPS(...) DRM_DEBUG_KMS(__VA_ARGS__)
 #define DC_LOG_RESOURCE(...) DRM_DEBUG_KMS(__VA_ARGS__)
-#define DC_LOG_DML(...) pr_debug("[DML]:"__VA_ARGS__)
+#define DC_LOG_DML(args...) __DC_LOG_IGNORE_FLOATS("[DML]:" args)
 #define DC_LOG_EVENT_MODE_SET(...) DRM_DEBUG_KMS(__VA_ARGS__)
 #define DC_LOG_EVENT_DETECTION(...) DRM_DEBUG_KMS(__VA_ARGS__)
 #define DC_LOG_EVENT_LINK_TRAINING(...) DRM_DEBUG_KMS(__VA_ARGS__)
-- 
2.38.0

