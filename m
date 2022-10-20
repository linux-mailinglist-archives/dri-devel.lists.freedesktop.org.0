Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B926B60633C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 16:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B9210E1DC;
	Thu, 20 Oct 2022 14:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFADF10E1D6;
 Thu, 20 Oct 2022 14:36:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Afs0dzo/XLXPNVyHe/TUlnmXV1VTJtXNzOscja5iC1qpkxMmmgQ8BbG1RE3Xj+kfPUIaCAh9flY8lM8M821OdsoMxCWw9vhRV8tNvsrJMHLtjzpcLtnzs2yvAje04aErdKW2DY0f13ZzwO6snO2CmZf8UXkgQKqrQ7ckeY3MD1ozwFa9DgLVhxpjspT1/Qum0i0AKg/6G/RDbfosaztU/a6ta5I/v+xS/GinzPmFIT7vkA7wL4n6RJPxAywyFyMM2YuU1QyGBQg/CShLH1Oyj1mcrzKXeK9Gk4hdu7Gfkw0ukP9wMVuUnby79c9FXLvsJyJ5HVUKINWLbOiVOXhsMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vV6Enut9p2YVZpMOfNLVYwclnup9A1P6XCJ/EuKXOyQ=;
 b=gyyU+mWP3/D6AoG8t2Lmlf0qgGny7KWCh8gIzhyLk+ck4YeFplBFoM3EjG4BALDojI6cfc9rceFTb3otN1tUcukwFbeWu6G68CVko+E0oRF67A8YOld5khb6b7l7G5MtzyjOvBiAKySYjs9p5xWLMy9bOux1aBdm6nSHpArT2xIZ3bUM8nC9RLiSrpnyF8UuxVvKPCJsD0kF1zT1uR7oYAYhmaBIBhwyIlPSjlsfmQZNqjt8pVewxieqakcMAIXs9hQxoVjWO+T7M6AxHzAuu0Eyr/+qQYjR3ASZfVrmEWQvSFF09BXMACbE6weO89SIeN06I/oKhUwc2fLJ5euIYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vV6Enut9p2YVZpMOfNLVYwclnup9A1P6XCJ/EuKXOyQ=;
 b=loVYw8vp6cMibY110rvEwsqyc6pPAJQYHSZ2B2d1R0yB2uDfiVH839sZT0B9C7+uCLEcQir7JlXByN0UTAyW5Wj28UBPy1O5fP/VyNAlSvGmfnqBYeLIpIztu+WUFwSbMKQTFUTIRYhnHABagwDJCfAAAkgWwrtJQxJCMU+7fZM=
Received: from BN9PR03CA0845.namprd03.prod.outlook.com (2603:10b6:408:13d::10)
 by BN9PR12MB5260.namprd12.prod.outlook.com (2603:10b6:408:101::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 14:36:17 +0000
Received: from BL02EPF0000C407.namprd05.prod.outlook.com
 (2603:10b6:408:13d:cafe::30) by BN9PR03CA0845.outlook.office365.com
 (2603:10b6:408:13d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35 via Frontend
 Transport; Thu, 20 Oct 2022 14:36:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C407.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Thu, 20 Oct 2022 14:36:17 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 20 Oct
 2022 09:36:16 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: don't call drm_fb_helper_lastclose in lastclose()
Date: Thu, 20 Oct 2022 10:36:03 -0400
Message-ID: <20221020143603.563929-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C407:EE_|BN9PR12MB5260:EE_
X-MS-Office365-Filtering-Correlation-Id: 28cd8124-2eb1-4273-0ea3-08dab2a872be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2VKFB+FMrf8CUWyureqhFuPdtn+u2NeY+kwRXAOOWOKw6wc8ATy5JOlUU3IdVZmyjz/NEq17w9JE9/arZiXoivGi4nkGdfKybpi46ihJ4a1Whm2ZESiWci9SI3DTkRkwi8vzzyGyUAIyWm/iRdELWBss4QsymD4cI2oYe4ekBQrfklm/Q6Q43ULU9n47Tf/ejbeTMcXHEX5jP1VYsmziuyCeJhLTrys4prEXr4Bent8PUxXKIWOHhs+EzKh0QnY+KlKTmKP/N7aO81nFhfG1a02pxfH2IReTjToMSw++ZB2J44ZkDJhxsZdE6OR0CKrBHSCEpz3ngkf14Xsjh1lSI43uGGW526P4su2RdCX13Bi8WNr2JuRE3OLv1S5i1e4z8bXeSDn0B0AR7u8pOIbGwP+eAHbve8tr3VG8pYSKxc7QQBM7kd2BfaRPo1g2oF4r5FgZL7RLiWj/C7lMci0FC/PuX/x0xH9fTqCd529W/Gv8aSIv3A04VRlcglMIcN7EUfXaOGR7IKZzcxTYYicpWNEmiVNudDnlKk+I/PRjpNoLO1EIinnmAYRvzUycU4ojDYIHMRAYbb16x7EV4+CrlgCE5I7wZbH0+s9Zjnm4uSOY+4fe+Ajmnj/PldksvL1zRa876b/rzf4ZyNsRefHSAfdY5RlEunaCWml3Bxo6nk01gFMswekpwlLRvM9OsVp7EIAiUEjvS9z0zGXO/x2dsVXyyzDLqxDtsQGWpAZK3GzXVZcQKKlyJRYUMZ2OgOkSu76ldbKmq13nOLif5aID+PWAFqj9Z8kiWxc6yGpnyaucyRJP6l8P7KYgBgczkclB
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199015)(36840700001)(46966006)(40470700004)(26005)(7696005)(41300700001)(86362001)(4744005)(426003)(83380400001)(47076005)(4326008)(54906003)(70586007)(110136005)(8676002)(5660300002)(36756003)(8936002)(6666004)(40480700001)(82740400003)(316002)(36860700001)(336012)(1076003)(2616005)(2906002)(81166007)(16526019)(186003)(356005)(70206006)(40460700003)(478600001)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 14:36:17.5185 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28cd8124-2eb1-4273-0ea3-08dab2a872be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C407.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5260
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's used to restore the fbdev console, but as amdgpu uses
generic fbdev emulation, the console is being restored by the
DRM client helpers already. See the call to drm_client_dev_restore()
in drm_lastclose().

Fixes: 087451f372bf76 ("drm/amdgpu: use generic fb helpers instead of setting up AMD own's.")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index fe23e09eec98..474b9f40f792 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1106,7 +1106,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
  */
 void amdgpu_driver_lastclose_kms(struct drm_device *dev)
 {
-	drm_fb_helper_lastclose(dev);
 	vga_switcheroo_process_delayed_switch();
 }
 
-- 
2.37.3

