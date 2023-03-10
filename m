Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE2E6B3371
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 02:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4C110E924;
	Fri, 10 Mar 2023 01:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2055.outbound.protection.outlook.com [40.107.100.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC49A10E924;
 Fri, 10 Mar 2023 01:02:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iz0m4WK6srJWcHPjCw9J55ALIBV3c/WgjKNXN1pTkNsRtzJhYq3i5tb9UE0aBl7JWiFcyQWbcgbQx3L+pgBNxm/xuminsSuvRzm50gxRtBogxKnmTj8ABdK7OUHrmphv/6sTyEuTkBevS3eI5D6th+LtfocLFrF2VcL4gL07OejpvvkEDS//yD2836ZKsQJ07vKsIu+dxYtm7nRXrBMIOqjt32pP65+arO5pKZDIgEyI3P8085Vl3bfapsmblSvSwr0JPcMzoaEiXZHrLBBOkz6+R5f9H9uyFfqI8YiGYnlsbqjHtVqEBzlCCOnSdHOqnaGdmkSGeUGa2s6RhrVYAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTlTUlPBUq5Bt8O9ZCNv1GCCjRW8OkOUEAxeFQY5kuI=;
 b=kTOhjeGriXgXLps0rKFIugw0aCnXRtrJh9FFWsji5Ae1U6As9P5yDkzEvQRsfR8UcQiphPjH2YvgNhARbY11jCblgQamJX2rwd4RQZmt7278QKllNYzf4mRMwwge68Fy+o64C7lc6FykX8KbxsGI/qESisFZa0lrvsJebbdtyd+s/7+ObBrsZj4RNqWfPvqsA37Y+VyRivXHo//+0sYSxBXzsf9/QhB1sbW7LCBWXupVJbCrl/50jqMk58juDCRSKvat8/Wc7dz1VD9sta+wOdl+2JHxwuH26BmGaNIYVlA7ZxVPH1cJhMFVUiPPQ78UaxchC/6vW/nv8+m6Naal4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTlTUlPBUq5Bt8O9ZCNv1GCCjRW8OkOUEAxeFQY5kuI=;
 b=qbEiGy2zBhQjTOM4jgSAHQWGJiGyeGW6j+NaUBdAgTUrm8wv/XVc2rT31Lc4zkwjN2MYevp9MnnOEG6JI6a+abSKNbAPBCEf/bAljEUgzXX8Tb/eBMzlRxofbWXHbqHfAErz8dnw2RMF+FZ7Knt3pXoCVQT0Dk0lS9YMohEVk48=
Received: from BL0PR02CA0100.namprd02.prod.outlook.com (2603:10b6:208:51::41)
 by SN7PR12MB7955.namprd12.prod.outlook.com (2603:10b6:806:34d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 01:02:11 +0000
Received: from BL02EPF000100D3.namprd05.prod.outlook.com
 (2603:10b6:208:51:cafe::30) by BL0PR02CA0100.outlook.office365.com
 (2603:10b6:208:51::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Fri, 10 Mar 2023 01:02:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000100D3.mail.protection.outlook.com (10.167.241.207) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.17 via Frontend Transport; Fri, 10 Mar 2023 01:02:11 +0000
Received: from guchchen-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 9 Mar 2023 19:02:08 -0600
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <alexander.deucher@amd.com>, <hawking.zhang@amd.com>,
 <dmitry.baryshkov@linaro.org>, <spasswolf@web.de>, <mike@fireburn.co.uk>
Subject: [PATCH v3 2/2] drm/probe_helper: warning on poll_enabled for issue
 catching
Date: Fri, 10 Mar 2023 09:01:36 +0800
Message-ID: <20230310010136.2810776-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000100D3:EE_|SN7PR12MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f6ed515-ea75-4fe0-837e-08db210314a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: agsMUvqmJpWeVMPiFcxQgIWzTU34c89NJ61/MvN1nOzTC9kJWrYWbt8pXmhnv2lhv9Rans0DCBUbiK8wZ4iJzjcV+DD8xKyeRUv44Ub7RGJYo7pxWj3ysJ1KNielhepZs/pyT7xbi9nbBaBD+TGRfwb54LhRxvJxsvAToKwAFiW6fA10emWY9B/1uqKupFhY5y2zU8dRFuIS0VgB51wUaP3WaJLn+SPr0zQ0iQMbwSh5Vi51zbapWBb0YCDIcxan4GSW1o884iOboWd3WTytvB5Ye8LfIruyo+zUIhvRM2wUlET+vQ9MD8hGo67Hb9bWkBpeBKQjtDzKuGJVFJd32b0Fzuk6gKJ8gJY52MkE1AhJle+jwdHaKfBMjkOct6HQp4cFTN5fFaknj/YgLr8M5WjzwAm67bUan0Gw2tIEf04vHE8Vef7I9YF0qwhl7qfR2LskrPPFIJqdNAUI8WMtihsvPnhp6GZiMcGeI6c167aZjAFtqRZZN/xOQw26zapqTdCFAG8iGsDu4C6eI6k1HyuhhJsNG8XAOn8haLJ4cjGVtIFCxX+2YREc8H1ln4NTK07baZwTfYpThXfhALgY8ZLyVNFzwyQmQcHjzpZjnTESEwLEOF5lTQf0sF2kKvV5jAWPazeIPZwXuxX2dUBvUAk425HeUxKIh00knobjad8LXndqdgVPFLGBBc4E9jED
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(36860700001)(186003)(26005)(16526019)(5660300002)(8676002)(70206006)(7696005)(70586007)(356005)(4326008)(966005)(478600001)(316002)(110136005)(40480700001)(86362001)(8936002)(81166007)(41300700001)(40460700003)(82740400003)(6666004)(1076003)(36756003)(4744005)(336012)(82310400005)(2906002)(47076005)(426003)(83380400001)(44832011)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 01:02:11.7336 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6ed515-ea75-4fe0-837e-08db210314a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000100D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7955
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

v2: drop Fixes tag in commit message

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2411
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

