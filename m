Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F9D6B1AF4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 06:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC7A10E793;
	Thu,  9 Mar 2023 05:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060.outbound.protection.outlook.com [40.107.100.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EA710E790;
 Thu,  9 Mar 2023 05:48:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4dbFIFrVr+kbep/O2B/agfUqrlPb1d9tSyH6mmrGfHdT60TI9KMhrt/PsrrL3/GZx9dAF5F/pvvZnJ1QEfuAZCn9ORTFrW0UaEtbawqAPOYqtEEFjMmCaSMmN3A77kmv+ijv0i+Dbc/Bi0HTzKarveXDn/71job8a9BhSlglC+JwqdhMBRsKcTZeoHITE97qg5yws8Ek0a8N75ll4G4c7FlEE+oX8SYtuJiN8KuOrcM67jEJdrN+lO/JpJQuRRD+i8Z7FseI7v2kL6mULmct0q/CVAXCaKWBT35jTZgw13/XN5RX2VWLWkaAECX+mAkRVdsf7OMF+xGplEa2jJdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2f1jc7JEegY3TTqi7KArcSPfplPcav3nTCioCR9V7Es=;
 b=aR4n9W7umNcHB5B4OuANWLEpV8I3GfuCq+j0u8BS9vS6o2mP/uSvE7DJhTsg8dLXRnutLT2xACWBW6nlzmjlH2EOAeOt+GBQZelKrszsNi2bC/0S7bP/DeEkBMfuuc60vIutCG0K9zP2ssX0O6weyQHTVI0Fth3ESEuE7gt05SW2BOBzOpMflvtQ04LJPD87xODLsLJmvxgjR7ygjH5DzazR2V1nTjGIEx3Ga0cBBIk8zm7jAJ4ZYTuHS6F6Wm4OQ5tv3dvhyh86x/4wVVXCW3ZcH+Bmk9Y0d0KUKGHv3kTB0vDQmN4FLNwov9drp6uxF1nd9KQdjXAQ3oKFPs90oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2f1jc7JEegY3TTqi7KArcSPfplPcav3nTCioCR9V7Es=;
 b=BzMin/laLnoAcf0/labgq1TpHtkNUiuXkJnqMxcXNPPjDolToJsLLDYh+cfaVFExgioqcoMEj4PL209g/QwW2zHxYASB81CrVmqLAHRkAtoQ2QwqhTDXTwZ1p96t7wN37gOLBjtkIe46/h7hDodEYupB4SQeKEZvvnevphvNBZI=
Received: from CYZPR17CA0010.namprd17.prod.outlook.com (2603:10b6:930:8c::12)
 by SN7PR12MB6959.namprd12.prod.outlook.com (2603:10b6:806:261::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Thu, 9 Mar
 2023 05:48:55 +0000
Received: from CY4PEPF0000C978.namprd02.prod.outlook.com
 (2603:10b6:930:8c:cafe::bc) by CYZPR17CA0010.outlook.office365.com
 (2603:10b6:930:8c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Thu, 9 Mar 2023 05:48:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C978.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.12 via Frontend Transport; Thu, 9 Mar 2023 05:48:55 +0000
Received: from guchchen-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 8 Mar 2023 23:48:52 -0600
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <alexander.deucher@amd.com>, <hawking.zhang@amd.com>,
 <dmitry.baryshkov@linaro.org>, <spasswolf@web.de>, <mike@fireburn.co.uk>
Subject: [PATCH 2/2] drm/probe_helper: warning on poll_enabled for issue
 catching
Date: Thu, 9 Mar 2023 13:48:39 +0800
Message-ID: <20230309054839.2709424-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C978:EE_|SN7PR12MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: dcf7fe72-1543-4f9b-c0b2-08db2061f849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IAgEGfjwBeedVOvYHQVz1BSxDFPw0VJmyQuDePnCOuTUQNHgVLr8qbtFbXsPUxEmtyesuJzMbc4XPSIUx/hIyKDRXeeKdHasSiUQklW/o2WcyFKqo5xcfxfrKUTZLTCm5gwnQNEFEjvdR3x+kTOCitlRrSKNCAXEyj4ck7zThedyvoFOarlATjdXCIZraV8+Kp7YDkkNcNA1rD+h7XUfXPWsCAjzRgFM8hk4Tq2TK49xZobv2jEb3Q3gkSc5I37WOg5GB/gWkYP7H+ilGwk4/U+pxLNs1GJXR3Y6XItXe4QzIHAKklsIKvy3wfIPulQutRaPtv9Wm0C3LM/F+Q9QeZaNGSTZwnWneuWvfmXxvyF5HsOKketKwXzuMqzINa13x6Fugq6IdMXbF8wGFirvWgee8wfiptVj4wtlaCLQWOUlXLEcLXL8jEqYeO/kNO+WUdYslgRZH3TqMoZDRWVgIbpo0tADe/hT2k9E7rJAMyGiw1IT+Uzli9OODsis0J38nGU/14olELG8jUi9v1moHGG8PFv/9C17AV+HXVSuX+lxK4IY8+s+NIjgY+VqQGvxvw5YYHUJ5a/FVKjtBvGxE7OP1hxjYJGwBBZ7kqBngwyk0TSKmRehx8+ptOfSd3gY4pdwayAjfQfXePdWSXgA9W/11vwTS04pHCxVDOn+ExtMHEhmn5DYz2BNfM/d6ggG
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199018)(36840700001)(46966006)(40470700004)(44832011)(40460700003)(966005)(16526019)(186003)(2906002)(70206006)(4744005)(81166007)(356005)(36860700001)(4326008)(7696005)(6666004)(478600001)(26005)(70586007)(5660300002)(41300700001)(8676002)(8936002)(47076005)(426003)(1076003)(2616005)(316002)(110136005)(336012)(36756003)(86362001)(82310400005)(40480700001)(83380400001)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 05:48:55.1462 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf7fe72-1543-4f9b-c0b2-08db2061f849
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C978.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6959
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
Cc: Guchun Chen <guchun.chen@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to catch issues in other drivers to ensure proper call
sequence of polling function.

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2411
Fixes: a4e771729a51("drm/probe_helper: sort out poll_running vs poll_enabled")
Reported-by: Bert Karwatzki <spasswolf@web.de>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Guchun Chen <guchun.chen@amd.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 8127be134c39..85e0e80d4a52 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -852,6 +852,8 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
  */
 void drm_kms_helper_poll_disable(struct drm_device *dev)
 {
+	WARN_ON(!dev->mode_config.poll_enabled);
+
 	if (dev->mode_config.poll_running)
 		drm_kms_helper_disable_hpd(dev);
 
-- 
2.25.1

