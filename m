Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3EB7536E6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 11:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB0910E83C;
	Fri, 14 Jul 2023 09:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2079.outbound.protection.outlook.com [40.107.95.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB07010E83B;
 Fri, 14 Jul 2023 09:45:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZJBsVq/8UCLrBJqQiAOZJc0tV4dlgvAcf3Tde839KGUY/lOuCs/bJ2hnvgsORFlj6GmTxvHRkoo4KRSBSErEBct7vZoifuQXb4Bl/8lGITvCYg2O10g3qaulaa7aIj8jYaeFxkZmQkexqpH7MTxLOJl8UH6JykDs3LeOt/wcjnFItrUI3ZHI/iGU8+BdNhFBt1Yj5yprs8KwoXFuARNPM0+ltfcTqxwUWO+Nt0iZNLSDypOATNfDz3bCbR5gd8+OrNSOBnAxHWxgqm+k6N4WXsScPkzlSTVCpLMh2rsAdgMnn+UVnOluwXSTm5hRrgcrvgTnncHDQiYM8d1421gMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//cxsK6T26npOJL5GlsjoXSVUiAYs+h+LM8zNhorwkI=;
 b=coS24sqb+mT4WQnYr8cqZb6i6KcSolixZpGJJ4XkuvdYrruHrmd10D07riYXm+eFtPay+tnWF/pJk0hhdqoki6ttv4m0+D2JNxr4yc0ViAk9OZuIoxEvoAkhwNltQn8kGkTnuBB6+WETXZAlE5z0O4jd3M09tL1WVbO1Y0O50v2LIMY9sX12yg1iPCts9sqvCwBgzu2uPUxuh0XwwYQg1bvNgBGGlajufyL6/029vzI2GLvJrT+R0RZejiv72ME+Z9Ys5w/rADHoMxtC/yNhuy8Covhji7Eij6JyX273Hk8fOUVLqkyWH2LtJYwmVL1zqBbikNfNQZgFuJjJow/WBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//cxsK6T26npOJL5GlsjoXSVUiAYs+h+LM8zNhorwkI=;
 b=yxcZ9XwgwPzHA7MPRPbc5IuKK6jjcM4ecW9BTfzD0wWNlN8gH66vjo84s951DjQ4VBthxZXS4ot6FjVzT4eog2fmwgNEJOTCqj40glhlh1HlRQ36jzqcDaguV0AqQbbVx1iqzRFwKjUXtcrdq5TSlT061RqzjAAfULH6oD6p2M4=
Received: from BN8PR04CA0061.namprd04.prod.outlook.com (2603:10b6:408:d4::35)
 by CH3PR12MB9395.namprd12.prod.outlook.com (2603:10b6:610:1ce::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 09:45:38 +0000
Received: from BN8NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::be) by BN8PR04CA0061.outlook.office365.com
 (2603:10b6:408:d4::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27 via Frontend
 Transport; Fri, 14 Jul 2023 09:45:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT102.mail.protection.outlook.com (10.13.177.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.27 via Frontend Transport; Fri, 14 Jul 2023 09:45:38 +0000
Received: from ETHANOL.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 14 Jul
 2023 04:45:36 -0500
From: sguttula <Suresh.Guttula@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Leo Liu
 <leo.liu@amd.com>
Subject: [PATCH 1/2] drm/amdgpu: allow secure submission on VCN4 ring
Date: Fri, 14 Jul 2023 15:14:48 +0530
Message-ID: <20230714094448.3178171-1-Suresh.Guttula@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT102:EE_|CH3PR12MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: b98a2a7d-4c94-4bec-5af7-08db844f1465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zgc4DDuWDIAYXWICWbsBlVfehgJf5wnaiWwletUtkgzm7dQUlY+hpxp+/8AxVunwNSv44mSG+2ZJrG8YnkA5/gVjJtrUTTGOdxmX0YxlQoEQarTpH+UxmQRkIrISXoxTp1k/fxFEx7wZ+5dlEhN3h3ffruzjvLNdqJ8ZOm0PQyJ1lsJ+pRWBrbqWcwbaaTt4oVq1pbNOwWhBW8iROyCw2Tj30nD58TBKxXqUVT6GBek5jQfZ9kbl5WVw+lXr1q96AXZohVzOY6VCCaA1AdqAdOfL7qXuon3QZaI4HvWDJi8wrWkUtIhlqfUc88F8Mk77KXu44/90vFl4hxgk4xqubWcJmNBoHbn09CuoanWNBB3lrHwUlbbliSAgmgxjDIy5ifVPtdl9lGaaTvjiVxrHFOXBM69RMCPDhck6seRqly98Hkw6qUExN/4rgGRAgNZOYhBUJxEmbmtW++gme6cEPmGym9Se1wOZdnHAQARjx33d6nv9YRndYgXMzylLMGawdaUEj/Hsn+1v0OhvA9AtSmZb9roULxDHFt1YgDDg45kGEb8CZwsmOqv88OXRhQQsP46IiWFSTYYTtnBeBljaC8DVxy0La6dqCNjVbvmuz7noSCwUaTGLEdikeJXlQJX8SWjB25TTZM3xnVDO3ix8ZIfJ5SMYb/o6HxddMv8qifZ+eLj1yTKP32AE9HGesElice232h5eK6mSoof0BmxtKB0g91AaHRqsCDgk32TlIasibS7EDgt4i5H4YVM05OTCS8oaiQKmJcemx7usnY7lk2YeAnvKHnZZOC6MgCxn4uk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(36840700001)(46966006)(40470700004)(450100002)(4326008)(6636002)(70586007)(70206006)(41300700001)(4744005)(2906002)(316002)(478600001)(8676002)(5660300002)(8936002)(54906003)(110136005)(6666004)(36860700001)(7696005)(40460700003)(26005)(40480700001)(186003)(336012)(36756003)(426003)(47076005)(16526019)(1076003)(356005)(82740400003)(81166007)(82310400005)(2616005)(86362001)(43062005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 09:45:38.2214 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b98a2a7d-4c94-4bec-5af7-08db844f1465
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9395
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 sguttula <Suresh.Guttula@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch will enable secure decode playback on VCN4

Signed-off-by: sguttula <Suresh.Guttula@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index e8c02ae10163..d199f87febd1 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -1804,6 +1804,7 @@ static int vcn_v4_0_ring_patch_cs_in_place(struct amdgpu_cs_parser *p,
 static const struct amdgpu_ring_funcs vcn_v4_0_unified_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_ENC,
 	.align_mask = 0x3f,
+	.secure_submission_supported = true,
 	.nop = VCN_ENC_CMD_NO_OP,
 	.get_rptr = vcn_v4_0_unified_ring_get_rptr,
 	.get_wptr = vcn_v4_0_unified_ring_get_wptr,
-- 
2.25.1

