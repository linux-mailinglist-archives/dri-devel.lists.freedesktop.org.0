Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9CC6B6F65
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 07:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406C210E1FB;
	Mon, 13 Mar 2023 06:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D707310E1BC;
 Mon, 13 Mar 2023 06:12:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3KRByoHOeFTA07vzLjDqiOPSF+gE/etXPwhoRTkJeUEQR+i/+f5mKId5/PRY1EA7YlkLsNSaj1+AErRv/5qAaI08u6MIcQnt7/rw7Kb6FKDU/txxRfKXEYcXbLhYvPALvzssQWtTk62t5/562KKx147B5+YmhgweMy4/O0gL+74KXiW+tGSHq6HaeJeswWOdabg4QFypytUKfRs5gC63EkjNgX7nBWAsHi3jv9s8JggdCri7w+D1AYExN0vnKDqQmXhX7sIqvZhTncW59t0GNLkqNv6mimm3zoWmtXIqEJR2LYdC8gh4CYnnLy8l/yu2MU0sxItapS8LtI9ZESRiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfIaRFu83GeiKwyaipkt6LL+96oU3hR+0JmgCSPBhWk=;
 b=GPkCnIBhtW0nXIaiak57HTl3uI540dniaKW5untUrj6gUheT2+hhR2Fe14Vz7yOQv+N0E5fE5o6s5qY6tgzJbnPu8h1fgyvI+uAO4kLHBmSuArb7A6yyuK/0aaN3eHn2QnvPbbmoeUdXBecRkWkgJjIpk66PfKtjJ+Z+N+p1UnZG7Us3WEAyVK/d/e4GW2icl0Pa0iMTnV+HF1kb5rY4QkS0btqwSg0NZEYAAnkUIpDx+dJmyEXM7Dc95q/SIMGogJqREDF/Nycur52o3RERYxtT/ulxlcXoYOR6M2gNwCmfc1VA2JP2fZFKdZ6GKEBBPja08ghXpAgcIkGZ5obxmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfIaRFu83GeiKwyaipkt6LL+96oU3hR+0JmgCSPBhWk=;
 b=DpLP8BAC7djvOHW7Tm0Fhc25E+WkfJ11iUcxpFjV8CU7FgXM7pH9s2o625HEJzHBBVNOMDQeQ0ATM9DM8fYLp8aA6wlYTkbg5GXNHeeh/J3erAmoEFx5/v27s/8K1Vr1/9ox4yP+6tfwLeC1gKgspOnZIvFIAwt+hSBhCFFNBug=
Received: from MW2PR16CA0060.namprd16.prod.outlook.com (2603:10b6:907:1::37)
 by DM4PR12MB5103.namprd12.prod.outlook.com (2603:10b6:5:392::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 06:12:53 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::82) by MW2PR16CA0060.outlook.office365.com
 (2603:10b6:907:1::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Mon, 13 Mar 2023 06:12:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Mon, 13 Mar 2023 06:12:52 +0000
Received: from guchchen-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 13 Mar 2023 01:12:49 -0500
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <alexander.deucher@amd.com>, <hawking.zhang@amd.com>,
 <dmitry.baryshkov@linaro.org>, <spasswolf@web.de>, <mike@fireburn.co.uk>,
 <jani.nikula@linux.intel.com>
Subject: [PATCH v3] drm/probe_helper: warning on poll_enabled for issue
 catching
Date: Mon, 13 Mar 2023 14:12:34 +0800
Message-ID: <20230313061234.3887544-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT012:EE_|DM4PR12MB5103:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a92a2d-7b54-4de7-a3ba-08db2389fa7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hN25grIUcz1iTsEZ06o9+0ILzOxwafqMI1ROvY4rVXJTP6F3ZtaQv984Eu3rAMnf7RZxtVn8zDqw/gbtr9Jf6Buyp2heraNXIPnEzkTXciTsUmBWXpD3MVziqMbpCINHqoFI9wrmOvl/bwU6vBkEwqrObG9JD4HJMTMMRcnjBTTlAjWQN/zNJLsx6aw2CTzjAA4WXSiEIMPGyy2LqJmSRADZPU40NVK8r3HxMlM93ASkeQRmTUP74Ml1oRoDUTfwhFf8SDDJ0FwYuxtKER9v0vXdmxjCTnHtlOlA0Jfm+ifmHawkEpOx1GvzjwZQc9GSPKM5rliWMjlFz+l/LB7VlrAWLuHmiZpI6IxMC6ptzZ295p73Lr5lja101VscVKGoT7aIS7gd11qIoTHZEvN9C9B8zjYAFz70rCdHS5X2byoeoRD6jJezip5DeySaeIIOIDy+dNEnuCwcuQjZg77x1ISu+Tps4pov2zvISgnQ3wxfEzF5Dn/ePJuTqqHAiNHeSdcjOBh+fBFsfsyYAPgFrWD917Bz6vIDYr9lE0ZLqFuRkrPaC9ddDq+gzzsIGqTS1okDlwDleh1oxApdxrtTovkaP7a4+6ojnEAeW4e9OZnxEi27DHUXdzhl4TN1KHuZIeCkqxQJyylIPT3fr1X05nsl3csz6RiFqkE0S3DpW6EB950rhxchXIODAafuXpAj
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(82310400005)(356005)(86362001)(36756003)(36860700001)(81166007)(82740400003)(40480700001)(316002)(70206006)(40460700003)(4326008)(70586007)(8676002)(41300700001)(8936002)(110136005)(478600001)(44832011)(4744005)(5660300002)(2906002)(426003)(336012)(47076005)(2616005)(83380400001)(966005)(186003)(16526019)(7696005)(26005)(6666004)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 06:12:52.1655 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a92a2d-7b54-4de7-a3ba-08db2389fa7f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5103
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

v2: drop Fixes tag in commit message (Bert & Jani)
v3: use drm_WARN_ON instead of WARN_ON (Jani)

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2411
Reported-by: Bert Karwatzki <spasswolf@web.de>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Guchun Chen <guchun.chen@amd.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 8127be134c39..d812a4e91760 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -852,6 +852,8 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
  */
 void drm_kms_helper_poll_disable(struct drm_device *dev)
 {
+	drm_WARN_ON(dev, !dev->mode_config.poll_enabled);
+
 	if (dev->mode_config.poll_running)
 		drm_kms_helper_disable_hpd(dev);
 
-- 
2.25.1

