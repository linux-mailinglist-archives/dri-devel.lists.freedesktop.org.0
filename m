Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3603669DEF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70A710EA72;
	Fri, 13 Jan 2023 16:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7998210EA53;
 Fri, 13 Jan 2023 16:26:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clC06QvCTLM4bjuFp/ifLNlDBMDCl3puCJ3RGCU4PpVjDAKMJz6mNdAFK9limdABbvPCFz01d4/28ti793h9YQNfO+mMKqMJqGT4SkfRm92GpWLhxOGYXhoUs/CFU7slJ030h3I+RxYHXUpzWrx2xm+/RuQmwSQBvfoFYW48mZ123srOtB2Z+VCzuDGsTgAPtAGuRFjwUdGXeuxDclXeNNvDl1x8eAahmN3AZ2uV3ijWfLe6WYLTVpADpnK1F7c0uTYA/ha3Ii1zBLJ7bPF8ecHSPPgvuAxRDp3m8TJqG5UtRTvO86lJj6mWhjLXnqElwmT18aLfx9NsY8ifJfcgYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wb0I2qtuMqmfW3vgD4MjFOgsJRRT1zN8hmgLbW6zQk=;
 b=Hq6+PwwXHNV0LuvhXmIXvNXi31O+0XZvgNoOHwghui+euWNvqr3jgxl1b2sHbp4Q1+BW/zqTEt61RHrVjP++zc1Z1mY5hMksAuroT82X+4u7DqEPZt8EsAiq7eZm1tf4MDePFYN+VYUjWoMywAh3H0A4viXyMCaa2S916J1XFbS8Eo1e8MIaHgcER+N5Va6sNS4YLMFjZQt57JTx7ijivCXFDnB9HeFAY5qDJgsWwaRsKpmdhZ1KGfv9qOD4KEvtzIeWMWE7z1SgYMB6Hj7MsgGeeYaKcOyxrLIPCQQCNRtqcgR4+GIyU1TNeYL1/4UtGFLK2OeTK6sqLV+rndZ2Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wb0I2qtuMqmfW3vgD4MjFOgsJRRT1zN8hmgLbW6zQk=;
 b=Ijy4Urw1VWL+dA4lh8biNGiAlNKwYxADP8Y77wrdCyfDBh7s21BgDn/OiWBG0+sJOHB4LOZVz9eeiA55kOYaoS8OTsMgMru8aVTjr2tFMO6lJ+1l7SAC7oU1Pnuq1bRXu3M/5nQB0Nea0WkOJ4Qju0dOCU62Ig1ItegqTdFZO0s=
Received: from DM6PR07CA0059.namprd07.prod.outlook.com (2603:10b6:5:74::36) by
 MW4PR12MB6898.namprd12.prod.outlook.com (2603:10b6:303:207::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13; Fri, 13 Jan 2023 16:26:49 +0000
Received: from DS1PEPF0000E633.namprd02.prod.outlook.com
 (2603:10b6:5:74:cafe::28) by DM6PR07CA0059.outlook.office365.com
 (2603:10b6:5:74::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.16 via Frontend
 Transport; Fri, 13 Jan 2023 16:26:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E633.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 13 Jan 2023 16:26:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:25:09 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:25:08 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 21/21] drm/amd/display: Fix COLOR_SPACE_YCBCR2020_TYPE
 matrix
Date: Fri, 13 Jan 2023 11:24:28 -0500
Message-ID: <20230113162428.33874-22-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E633:EE_|MW4PR12MB6898:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aba9a20-aeff-4978-51b0-08daf582f8c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2eJmTLcPFV+hCUUXTdqJ8ye7z0fKviowIlf5/hMJ7B6e4ii1Pbih6a4TkDnIlTc4nsDM/tzJlK1CPKZCAeJNQq35vubKH1s25CQUeRKVmUq7zaaFdLHUq5gz6wWGv2ex9FvFXcHK0gZjL3I+oiu31ry8Uc6RVvtTLpS0/HucUMnu53sXLCn+rhPjdVxw1h2Qbtcm11amUL22Y9xOoTbcRKC3+yhAVQzMUv+NkdLEZhERjIQcjzrNA21A8bJTGaofInvHhOrTWSa6yojPC0JKvywGdwAoosUIBeRzO+lMQCO/NNOljftA7RNaTZv079Uze4NPo9AnCsyQ0dp+CYTFp4TPD28XeYgMCkz8cuGIsgqoarG60MEj8Zpt/Bqu9WMBbKaGif1Abh4yLK7AkeZkI2DaUHm9pMFnnqQZ9vJRkDND7iKcJ1o/tS04mtV50Mad2ue9HdhzJrcy53H1jn3vGv6ERox1eD9iowySyBfHhpdNRL2l433ptYCJvBnUmHQkgVNRmQ15dZQDghlQmaGzOPz+ThLzsX2iNvawig0LKL5y+UG0+R75fq6drDq7xRsILRJoDYp5/r8pPpKgSGqGAPA3T1v12xAid0SLwhr3wB0nkPAiqlalb04L5PtlrhxKKTlKhrEvIREL6i8iSIAPCNOijaAYT17mKc4SszFIagS8qtw7SdEJKWyvN3B4NZb7SjgaeOEfs4d+rxbkhRjFTp1jmyO8z++ziTvVBcATkxU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(36756003)(356005)(44832011)(2906002)(81166007)(86362001)(82740400003)(5660300002)(8936002)(40460700003)(82310400005)(41300700001)(40480700001)(36860700001)(47076005)(426003)(83380400001)(110136005)(54906003)(6666004)(478600001)(8676002)(4326008)(316002)(7696005)(70586007)(70206006)(336012)(1076003)(2616005)(186003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:26:49.1743 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aba9a20-aeff-4978-51b0-08daf582f8c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E633.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6898
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

From: Joshua Ashton <joshua@froggi.es>

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
index a70f045fc5c1..2acbf692193f 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
@@ -98,9 +98,9 @@ static const struct out_csc_color_matrix_type output_csc_matrix[] = {
 		  0x6CE, 0x16E3, 0x24F,  0x200,
 		  0xFCCB, 0xF535, 0xE00, 0x1000} },
 	{ COLOR_SPACE_YCBCR2020_TYPE,
-		{ 0x1000, 0xF149, 0xFEB7, 0x0000,
-		  0x0868, 0x15B2, 0x01E6, 0x0000,
-		  0xFB88, 0xF478, 0x1000, 0x0000} },
+		{ 0x1000, 0xF149, 0xFEB7, 0x1004,
+		  0x0868, 0x15B2, 0x01E6, 0x201,
+		  0xFB88, 0xF478, 0x1000, 0x1004} },
 	{ COLOR_SPACE_YCBCR709_BLACK_TYPE,
 		{ 0x0000, 0x0000, 0x0000, 0x1000,
 		  0x0000, 0x0000, 0x0000, 0x0200,
-- 
2.39.0

