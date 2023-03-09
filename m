Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09386B2F88
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 22:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D43A10E8E2;
	Thu,  9 Mar 2023 21:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6E710E8F5;
 Thu,  9 Mar 2023 21:29:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwC1bM2ICr2DXScuJKZ1RveLlZDQHGEOq+5e2Bc4iQXgitI9AVlpopJECiyrlVZAB6qTg7ZNJjqx6RNhy4lD28vW9se8r5/UQLl05ydvCyaswys9WcgKUc+XmOuFbrFcimdI9IQ4X+MX1Zu2FlMzZ7sfEz0BEIDoGYGj4vLxo3ZeJuGrikAgHUtLp5ORmJC5RxpLP7gDz82/hufAF7mk+mDFLcSfF8SZZyyKDsCCnMg7rR7fkxx2324jWwJzdpL/R/tnR1ejA59y/Jr56voqAmRcL63KXPH3Dh+c4rInBjAuzhlSaoTr691gnIhF5UcjZ669hkkCmJByk886x3k4tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+YA4NjhSP3EDqRuFPt4c+rAlvXC1z+sChnRzk1C8uA=;
 b=UrfBBZnXQzgNoAFCFB6Gg0DjchvWJLP52XbXHRJJtRW0yNdKzDBEbAdJuThrPmw5sgReDde7qon5vqkneUci5WSaKGXzcQjinciScfoDmSDPqO6+oEkETcvLjYYaqhDX8Hrb7HI7GL8UBdHn57N1XQC6YQAdWmN/QtJjv4wxqdYriUIc8uHwI+2WYYrtFU983cbWJmujuwDt6FlmoLmE+80aQjpsmeMDUCPGt4LWvGEDEyak/YPA6uswO1seB9rd5TK9fjJ5mATooSKf9QtuNFvpbz8kulCQ9JAIF7alBaG0da9Dsu5FXIaaaPYVQuI9WP1hueUsb9Bx7E2l/whtKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+YA4NjhSP3EDqRuFPt4c+rAlvXC1z+sChnRzk1C8uA=;
 b=RA8H+dgRBFyyIUwft8FQfyb0ZYeDh/dx2ky60svDzkuYAzajjFDPvfmuYiNywatDhmi48P8WbAVJ+CakLUXhDhEjzaHZwtVoAloJFp8bRJaqsnx8tXXeJEZZ26ptimaVzzTh1B25jLnu0F62EZvOKrVgghriwTU+GzFuQHScfRU=
Received: from BN9P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::26)
 by MW4PR12MB7431.namprd12.prod.outlook.com (2603:10b6:303:225::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 21:29:53 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::24) by BN9P221CA0007.outlook.office365.com
 (2603:10b6:408:10a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Thu, 9 Mar 2023 21:29:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.19 via Frontend Transport; Thu, 9 Mar 2023 21:29:53 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 9 Mar
 2023 15:29:51 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: use a more accurate check in
 dm_helpers_dp_read_dpcd()
Date: Thu, 9 Mar 2023 16:30:27 -0500
Message-ID: <20230309213027.256243-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT032:EE_|MW4PR12MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: fb56bde7-5c1d-48bc-524d-08db20e56bcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bKLD+DUrDEMEAKn4YlwHW/FEIsOxEfHJafvFW+ka6yeaEZ6WtRNcHK7iwF/9qzcU47/w0+THjff29qQVu6Qo7bHJRNBlmdS/5rYuqwvZVZ07Bp/ZRPs93d9ZZfxcvaeFLCY+8fucSE6VY8FpuvYTI6mW0RzAC0H5i8ptozGvFV26T1JxYix7/xPmr+MaKUGZME+5oWLj1IgghMLUyYHv/XMt9rIUGmC1ylnTJvqW1o1HujPYWZ+nr9NW8RBpWYUzfSlZGwnMnGrcTkr/Kp+DXdR+6GUcl23ymI0qc9UyQUR4KMdHvQ332UG6eh7RfryEcMOZzg3Be4R1LwVhiIFvQu5jsfDswtjaUPkM1Alsp2GhGYPThy/ohhKGhSh31NzZTJ0eQWw6PJVfelJMqZHCTO26kRfwPmAGi/EBTqpNCYEvoOcyjGiweE9cwZ5s6QjCgDTZbcM1JoN1QZ2tbItPYJwZCBTZZh+yit5ME0V8muzxtEcdxwK3NHk3BcvO3P0eaZ7ceyorPWpjEwAHhAuRej08gQgqULZEPWw4xifJX2QpspGGaLAUMNQSR3CqKAecANcX/vfqA0ylw2tg3pVZrYg4Mot+dn0vwKmOlt4zcV1vo1luZoE1XpUa+X8efG71ba1C2hY9MVVtEsJij9/WyRW/8V8PuvHbxmW+VC7GA5+kTe0XiL5Iw+WI3ruZ3UGK5oSw59J3+B0mJCpxUungeX2jyrVOSFwzcyYIcBR2e6j+t6aHLJE1dJ78hKWva3kkK81mWLUX9Q1NOvEU5fIqeg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(82310400005)(36860700001)(83380400001)(82740400003)(426003)(47076005)(36756003)(54906003)(478600001)(316002)(356005)(2616005)(40480700001)(40460700003)(16526019)(26005)(6666004)(336012)(81166007)(186003)(1076003)(5660300002)(44832011)(2906002)(70586007)(8936002)(41300700001)(70206006)(4326008)(6916009)(86362001)(8676002)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 21:29:53.0937 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb56bde7-5c1d-48bc-524d-08db20e56bcf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7431
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
Cc: Ian Chen <ian.chen@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sung Joon Kim <sungjoon.kim@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We should be checking if drm_dp_dpcd_read() returns the size that we are
asking it to read instead of just checking if it is greater than zero.
Also, we should WARN_ON() here since this condition is only ever met, if
there is an issue worth investigating. So, compare the return value of
drm_dp_dpcd_read() to size and WARN_ON() if they aren't equal.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 8d598b322e5b..ed2ed7b1d869 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -511,8 +511,8 @@ bool dm_helpers_dp_read_dpcd(
 		return false;
 	}
 
-	return drm_dp_dpcd_read(&aconnector->dm_dp_aux.aux, address,
-			data, size) > 0;
+	return !WARN_ON(drm_dp_dpcd_read(&aconnector->dm_dp_aux.aux, address,
+					 data, size) != size);
 }
 
 bool dm_helpers_dp_write_dpcd(
-- 
2.39.2

