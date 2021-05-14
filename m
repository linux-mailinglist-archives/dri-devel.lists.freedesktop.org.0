Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F233812A2
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 23:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAAAC6F471;
	Fri, 14 May 2021 21:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2075.outbound.protection.outlook.com [40.107.212.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25A76F46E;
 Fri, 14 May 2021 21:07:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FeaCJmrNLro3S2fQSl+K8O0WpeQhOjMmEM5dp1UdonTxu5KmqjYGRN167z3ON5JPvQBHep7K1g4hbbrg487YvZv+6Ea1MSRIIZzXz3zEu4bVwzqI6g7aXvPTKqg+DZiKym7VFG6Xxbt2bdcjcDMdmJxsZgwkM9rSQ4dzTWrmhL5BzH+DsW1Z13XPnp3C4uSdTbLNmtwci2garlyOc0T7dp3IpGmnMmYqMfFO4neAoY17FaiYlaHfnGwdzXHV0gg2Wgvk7XaU4a7dAiUr6OByXNSB4qA32voCsUYOz1ue5jfKHcy1L7UPpUzLd7au1Zcty/bFHuFHj7Bgrxhi580VVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRw/V3jRGe72iabnbcNZkYcKdEyj6lxSL9ni+4PKkio=;
 b=n6IfyUaIHI48D8ALPlPv6hC2b22vOAtLeyYqWpElQN3KJ//P2WjnZ++754Q9AwTvbQpZ+b6KB6V0vLAkMRWFVDSywEBrBtFAi2tHPgasiktQ/PuFvtYewSzbT5ZM9dM0O8okwysEhsxIZjMsjwf8oDfWn312qqoRXzbbIeljsglJJULXCqraLfEdb0+qztWH+hHI2cH1CsyIiOfelj1LA93Whq9PDLv77DM4i3AxbZOLA9ER0iekBL8KpeA7+dwErjYUva091YDPRMNZpdxep8cdg4Vp9NhAwpqwM2Wrhb0dmklA0A5PK5cuOM9xcfvLrmLAVqFj6csgCZyn790S5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRw/V3jRGe72iabnbcNZkYcKdEyj6lxSL9ni+4PKkio=;
 b=aSx1CnGUeW8aQfaj9n6WmLGe9hPNTXyDFLd4gB7NYcTJRQvnNO83I4n9iDUQleDPxOBOvw44cAXtVBXpsITD7MsMvopvOpb+VGc/ZahatDf8eXU+WJ+ubtOxiU7h1ylyEl+eGOMu1/AA7qelY+XS/uFauyrfkXnJXrhhG2o4np4=
Received: from DM3PR12CA0093.namprd12.prod.outlook.com (2603:10b6:0:55::13) by
 DM6PR12MB4730.namprd12.prod.outlook.com (2603:10b6:5:30::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Fri, 14 May 2021 21:07:38 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:55:cafe::54) by DM3PR12CA0093.outlook.office365.com
 (2603:10b6:0:55::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Fri, 14 May 2021 21:07:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Fri, 14 May 2021 21:07:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 14 May
 2021 16:07:37 -0500
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 14 May 2021 16:07:36 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ppaalanen@gmail.com>, <sebastian@sebastianwick.net>, <mcasas@google.com>
Subject: [RFC PATCH v2 6/6] drm/amd/display: reformat YCbCr-RGB conversion
 matrix
Date: Fri, 14 May 2021 17:07:20 -0400
Message-ID: <20210514210720.157892-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514210720.157892-1-harry.wentland@amd.com>
References: <20210514210720.157892-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e380a13d-d420-4a71-b3e8-08d9171c4db9
X-MS-TrafficTypeDiagnostic: DM6PR12MB4730:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4730B614416BB9F6B4B0C04C8C509@DM6PR12MB4730.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T0fo+Skdw4tK5gYof4h8e8o9x+MXKrlBSb/YPbcHLL3JHrLxiJevud2zZr8JlN/veB8Mz2ksOmWbXq1qb46ytG3wdvDCgpRNX/JqRVvVJm6moPN4k1mAtBgj0ztNfhpqzR89Km7eCCiajXmZLDl7y8CpseGK27JSHaPhiW4ARZBoQ6XRM2a/DcDQvTWkd2q/5EaiGv9m6Hu3e6DCyxOw5iItpsGJHwPOOZmG+hOSR7f8idBKBxTEEiR9MzkOREsZ4LbRSogSy7QS3ytkjFKkgZfv+iO5mXuNiXGk002nXcU4ypRpDPESjh9AVBe++xV+VjvrAt8m/5fOzqXk+FuHjW5Y3coG3qmj2d6X07EHw/LdDHk6/6h7YxKSMAW3sFx2WTC3SVwIrwRvtfRcFcAcN8kT6pbScBVzfVT8EmoXm2DPAH5R162TnHGHxYWpsA19r4o05Qp3oysCZbXTyx4+BDxdKCwcu7W3NcyyQc6LrcDFAtE8W6SPNf+2QicZO1iaNhXthPcjHUM3WQTTFuQfVHNkVqlzjwe3fYXuzTWaZYXt0HdEGOfQRsaCycU+8bkMBJBZChtKSg6ASCgXm8SUuKCcwWMzvJK8cp1vNC8vx9gzTMg14GQfY3r5WDO3t/SCH9IkarUoOQMYNnbFTsADDsl5SZ8sQ+H3K7BkAz2V6gR4KiSXCHWw/JQQnayH9LpC
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(6029001)(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966006)(36840700001)(8936002)(356005)(5660300002)(110136005)(6666004)(8676002)(54906003)(7696005)(86362001)(81166007)(70206006)(47076005)(70586007)(36756003)(336012)(83380400001)(82740400003)(478600001)(4326008)(26005)(44832011)(2616005)(426003)(316002)(186003)(1076003)(82310400003)(36860700001)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 21:07:37.9195 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e380a13d-d420-4a71-b3e8-08d9171c4db9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4730
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, Shashank.Sharma@amd.com,
 Shirish.S@amd.com, hersenxs.wu@amd.com, Vitaly.Prosyak@amd.com,
 laurentiu.palcu@oss.nxp.com, Bhawanpreet.Lakha@amd.com,
 Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Show the CSC matrixes in a 4x3 format.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h | 28 +++++++++++++--------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
index ddbe4bb52724..e91dd899ba65 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
@@ -49,22 +49,30 @@ struct dpp_input_csc_matrix {
 
 static const struct dpp_input_csc_matrix __maybe_unused dpp_input_csc_matrix[] = {
 	{COLOR_SPACE_SRGB,
-		{0x2000, 0, 0, 0, 0, 0x2000, 0, 0, 0, 0, 0x2000, 0} },
+		{0x2000,      0,      0,      0,
+		      0, 0x2000,      0,      0,
+		      0,      0, 0x2000,      0} },
 	{COLOR_SPACE_SRGB_LIMITED,
-		{0x2000, 0, 0, 0, 0, 0x2000, 0, 0, 0, 0, 0x2000, 0} },
+		{0x2000,      0,      0,      0,
+		      0, 0x2000,      0,      0,
+		      0,      0, 0x2000,      0} },
 	{COLOR_SPACE_YCBCR601,
-		{0x2cdd, 0x2000, 0, 0xe991, 0xe926, 0x2000, 0xf4fd, 0x10ef,
-						0, 0x2000, 0x38b4, 0xe3a6} },
+		{0x2cdd, 0x2000,      0, 0xe991,
+		 0xe926, 0x2000, 0xf4fd, 0x10ef,
+		      0, 0x2000, 0x38b4, 0xe3a6} },
 	{COLOR_SPACE_YCBCR601_LIMITED,
-		{0x3353, 0x2568, 0, 0xe400, 0xe5dc, 0x2568, 0xf367, 0x1108,
-						0, 0x2568, 0x40de, 0xdd3a} },
+		{0x3353, 0x2568,      0, 0xe400,
+		 0xe5dc, 0x2568, 0xf367, 0x1108,
+		      0, 0x2568, 0x40de, 0xdd3a} },
 	{COLOR_SPACE_YCBCR709,
-		{0x3265, 0x2000, 0, 0xe6ce, 0xf105, 0x2000, 0xfa01, 0xa7d, 0,
-						0x2000, 0x3b61, 0xe24f} },
+		{0x3265, 0x2000,      0, 0xe6ce,
+		 0xf105, 0x2000, 0xfa01, 0xa7d,
+		      0, 0x2000, 0x3b61, 0xe24f} },
 
 	{COLOR_SPACE_YCBCR709_LIMITED,
-		{0x39a6, 0x2568, 0, 0xe0d6, 0xeedd, 0x2568, 0xf925, 0x9a8, 0,
-						0x2568, 0x43ee, 0xdbb2} }
+		{0x39a6, 0x2568,      0, 0xe0d6,
+		 0xeedd, 0x2568, 0xf925, 0x9a8,
+		      0, 0x2568, 0x43ee, 0xdbb2} }
 };
 
 struct dpp_grph_csc_adjustment {
-- 
2.31.1

