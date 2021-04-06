Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E59A354A62
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B466E23F;
	Tue,  6 Apr 2021 01:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71C56E1F4;
 Tue,  6 Apr 2021 01:47:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTH5zhh+YdbwCiaS2qM5uIxcEZ+Yi+NgEPsfA06XHN3t3Iu8hGt2QGhb87FnJlnxIzsuE5SuvOV/oFG0OxprwwPe3LwySM8k0UIBfEN6VhGfUFWG4wb16oBZOq8wGc4jds93VN1JTEjyqPsTbl6t1WQSe3aR2r1AyY6nY1KvQy1oFCG+uQlQRvBoLggXH6vQzsojvs5jNr3oNC9+DINXeF1CYJHK2cZ0Y13iUIPOSJis4OvhMOG5FPPikx0/3tmOiSslrYvOiya1+Iwtw/WnJ0DYLia/E7MCq8GeSSpa0afjtbvXVQ542aPagaiFeANonsGzkgCUgBHGQYjK1USoyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jV/9ouWm8Z1a0UoziDxPQEmdaKXLEl7Qb0r8Xx7JinM=;
 b=kscKHhX9xsS1UiWQINj0zsalGpJqIpU3xoGhUzCwdp68Yd7DZKYB57pe9833D7fJ2MTL8ak4QM+wFNYowpr+Fq4ku2IrjT9q9octWERierZajXrmoVrGujVGfiMhQwoVYKS1oiuLkaO+tTZW6WGH74M3llfQVXEtuS/9cu3ZChjzhPGT7ddOadUjAvQ7K7pRCyad7uIlqwHo4wwBG+mGNdk4dqgBLk2mNiLzt7OPRj6/pg9NEzZau0dbeHQCSe2hZJbLOoq084okzr8rGOmXIADPBMUzsfKxHVsRK/2zDeVtPKjc0+BWHIVTszLevkXUZUtWfF53/v4/mdpYMp8rTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jV/9ouWm8Z1a0UoziDxPQEmdaKXLEl7Qb0r8Xx7JinM=;
 b=F0v3yDVBsv6uNYpKfDnpBaiCSpSH8VEHdCVn6+YCKXykNe56NmJUEmJlAPZViweuZq46zNZX3OpqC4q2r2E/lJ5FWu4Z2hCMveQpNSRXnUoFxAGZU31fAYmBw21zPTedvRRMt7Iut/WVkimCw9WpRIKlATSk8fzHXKeGC9CcuGw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3773.namprd12.prod.outlook.com (2603:10b6:208:164::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 01:47:00 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:00 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 12/34] drm/amdgpu: Enable retry faults unconditionally on
 Aldebaran
Date: Mon,  5 Apr 2021 21:46:07 -0400
Message-Id: <20210406014629.25141-13-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406014629.25141-1-Felix.Kuehling@amd.com>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:46:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0483d39b-6706-44d5-e225-08d8f89dde3e
X-MS-TrafficTypeDiagnostic: MN2PR12MB3773:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3773F13BB910D2C48BB7FC2892769@MN2PR12MB3773.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c9W4uMQFa7xrabscCXLpOfVN/1HkE+NPZIzVIZiWyrTNrbbavUI8QBwZD+daRUd7O07m09psjnk2FMESps5Y7smz8mxg64/GOTud5Nik91exDo1w+3GNUPVBIIylJlil8WpKHPd5qC4ed98+LQGDp3sTrKBNXHoFkIEoTTJ5dXs9aJWIY5me5QMWAwjDk96pAVsogPUXniz3dRPstdKevR0bIDADhNr8UD7E6aZ05cdqKcHxp5e0/w2PMqwnHh6rNphN6JZfgfBq4hxU0M3F/x5tGDIwR5CV5gHtwAq18brTgz/MrWugH1igZ6AQRYFtpzAobJeO8a1fVlJuiIc1xMCxp6VLV/8+aczpAvnAuspKRNywfitx8Fg6NXLT3OFXnCCpCqp53zp6hbNTqucYt/qP3kNgVIgpbbx5wO4x11t+VH6KZyp8kJLTIxChzOQINfJOERJeoLkT967cYFfH9DsgUUfSfnl13QxJ7Ve9rzBWYZm8KJBZCupTUCV3mKUGU9hM4gpY2HNYFudBnqQhLI1nkZWX6OTEuQD9KH6SKhq3azYecxPgBp0fcjY6O5BZtYwlkRNsmXDUTuNvqwC9fRDQ5m/yWJfwyr93Yod/TuZuujd4EaYPB4EAJ278qroG7PBVn3Nm+slonuRdJHHecLVvwMOMB5CooZVktqQRG3juoAgEP/tgQlfYW1zSVPyS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(478600001)(5660300002)(6486002)(316002)(52116002)(66946007)(1076003)(36756003)(2906002)(16526019)(186003)(26005)(450100002)(8676002)(8936002)(86362001)(66556008)(66476007)(54906003)(4326008)(956004)(2616005)(38100700001)(83380400001)(6666004)(7696005)(38350700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ql8+JSt9SVrVya08gul2NuwOpH1SMN2988XOl+HGpCAgRzUUx1gSjOEX5kFG?=
 =?us-ascii?Q?Do3cPuigXziGZ9Jj+EGWunrBmIXB7GUy9RoyXDv41xA8kIg5s+sVCyEO4GGm?=
 =?us-ascii?Q?CX5GEQIYuy3RfLsNfZwobN8+Ii9qwxqUd9tWKy2ewnZQS6EqK0VQn+XmMxVD?=
 =?us-ascii?Q?CRV6k4/bDn5w+lGbcuiiVHXkNWnfWejMwZTXDKfZWFtPlg2V/Pee7XnHqgQC?=
 =?us-ascii?Q?smjTBsW2OEEkf2ojgy96fLEV4g3gjSj+uKClHsIm8lLvoRQcyBRp5UURap1h?=
 =?us-ascii?Q?DATanwx1yjqt5IRU1sJol1x0KRhBXbkcj8HML0MO8FDhyTJEZ7ivZKcfdgDq?=
 =?us-ascii?Q?shQWzApztiVExo9u9oIg5mEyPkfP+FX/VWj+SZNaUjSEQb0PbnafaX5v9G7N?=
 =?us-ascii?Q?j1ouUQMDLiWXFRNd8r5XCUyFZH9BMU7EklVYwvB+FW2hoyUUICDtf+Pf6B3b?=
 =?us-ascii?Q?7+ojlobF/OTkEcqhM0Zb2FaahalHrexekrjrInoElOM+cCcLa95zjh4NN7Xc?=
 =?us-ascii?Q?zis5xArHrkJpVQHVBvPVj5pD/gZc0Fkdj5V6I2PqZMI5HouwCQJ0ZUOP+xks?=
 =?us-ascii?Q?fg1LzBMaWaeRbblI+T37Z5hiLtd12n6oouvO3n1qYnl2fqH2rfkFKIuAuqhJ?=
 =?us-ascii?Q?JVficBt99vxJ4CU5kIWiHrEYvL3Fhdt8lGE7tYg7msT5FLcXXlsA8ebyzv0o?=
 =?us-ascii?Q?F7pYxFittQAjxExibESnLDGylCIXYc18U3Tzn9nBtnCvcfKPvxoe/p57FP9a?=
 =?us-ascii?Q?iMzVoTxacIDw5cpn5iFvMxgQYZJ/vV41uC5sgggyJFw1+orIr2IbvXeNwIaL?=
 =?us-ascii?Q?ZnoZvDOSQCnHZB+wYl2HQI5/Gp+UqmoqS2RI7WFzq3+SmGhnlEl9z0X/7gBj?=
 =?us-ascii?Q?L+o8lMHj0ocE9AzM1yddz/1FDIKYNrdRQiJU49hfmNUR1MY68FkrM6FTDjKx?=
 =?us-ascii?Q?iYQgBbZgAhByAblFpJv7nWeRUEVhFAxS+Kp1JcIx1oAgBZGb2SAVp2gbE8mw?=
 =?us-ascii?Q?5a2kNshoJZ3Ixy1WFJW0/M21kdv2pL2+wQipk+JR0nwEpO53Go6vAT8sAW6c?=
 =?us-ascii?Q?zgibg+5XvkxfW2+pFH4sJa1rKGo3wm+bVDsqReqVGTPrA8OODKR059awtcJj?=
 =?us-ascii?Q?OoK6OrCVptJoxTZ3oZwk62U3RKhzc2ZSCrLgkgRPhhXgEiN9spHUw0rXyvzB?=
 =?us-ascii?Q?7n3eUuFu7shVoTSICeb9lVYkDPFY5WBDbEJI9TANuKIMU5omHj0cl+qmScMa?=
 =?us-ascii?Q?QXNx8JSMg5s6fbWjsxYNmwHe9/fT93G6xICJ9gxNyNQmTcCrInisMaX2X2LW?=
 =?us-ascii?Q?4OJR36udhGIJPTuZiLY8gyvR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0483d39b-6706-44d5-e225-08d8f89dde3e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:46:59.8477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7A0K3LxRCML+2f/bYFNRI6HPEEUJSA/skEb07MgqzHGwMGiBKFrReTsBuEouQm+gNIOh1BRC4NxsehLr+bppRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3773
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is needed to allow per-process XNACK mode selection in the SQ when
booting with XNACK off by default.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Philip Yang <Philip.Yang@amd.com>
Tested-by: Alex Sierra <alex.sierra@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  | 3 ++-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c | 8 ++++++--
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c  | 6 ++++--
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 4bcc03c4c6c5..09f88874bf56 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -640,7 +640,8 @@ module_param_named(mes, amdgpu_mes, int, 0444);
 
 /**
  * DOC: noretry (int)
- * Disable retry faults in the GPU memory controller.
+ * Disable XNACK retry in the SQ by default on GFXv9 hardware. On ASICs that
+ * do not support per-process XNACK this also disables retry page faults.
  * (0 = retry enabled, 1 = retry disabled, -1 auto (default))
  */
 MODULE_PARM_DESC(noretry,
diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c
index 5bb9856bd8a9..f2fb2cac5c77 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c
@@ -292,10 +292,14 @@ static void gfxhub_v1_0_setup_vmid_config(struct amdgpu_device *adev)
 		tmp = REG_SET_FIELD(tmp, VM_CONTEXT1_CNTL,
 				    PAGE_TABLE_BLOCK_SIZE,
 				    block_size);
-		/* Send no-retry XNACK on fault to suppress VM fault storm. */
+		/* Send no-retry XNACK on fault to suppress VM fault storm.
+		 * On Aldebaran, XNACK can be enabled in the SQ per-process.
+		 * Retry faults need to be enabled for that to work.
+		 */
 		tmp = REG_SET_FIELD(tmp, VM_CONTEXT1_CNTL,
 				    RETRY_PERMISSION_OR_INVALID_PAGE_FAULT,
-				    !adev->gmc.noretry);
+				    !adev->gmc.noretry ||
+				    adev->asic_type == CHIP_ALDEBARAN);
 		WREG32_SOC15_OFFSET(GC, 0, mmVM_CONTEXT1_CNTL,
 				    i * hub->ctx_distance, tmp);
 		WREG32_SOC15_OFFSET(GC, 0, mmVM_CONTEXT1_PAGE_TABLE_START_ADDR_LO32,
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c
index d0f41346ea0c..0d278df12863 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c
@@ -298,10 +298,12 @@ static void mmhub_v1_7_setup_vmid_config(struct amdgpu_device *adev)
 		tmp = REG_SET_FIELD(tmp, VM_CONTEXT1_CNTL,
 				    PAGE_TABLE_BLOCK_SIZE,
 				    block_size);
-		/* Send no-retry XNACK on fault to suppress VM fault storm. */
+		/* On Aldebaran, XNACK can be enabled in the SQ per-process.
+		 * Retry faults need to be enabled for that to work.
+		 */
 		tmp = REG_SET_FIELD(tmp, VM_CONTEXT1_CNTL,
 				    RETRY_PERMISSION_OR_INVALID_PAGE_FAULT,
-				    !adev->gmc.noretry);
+				    1);
 		WREG32_SOC15_OFFSET(MMHUB, 0, regVM_CONTEXT1_CNTL,
 				    i * hub->ctx_distance, tmp);
 		WREG32_SOC15_OFFSET(MMHUB, 0, regVM_CONTEXT1_PAGE_TABLE_START_ADDR_LO32,
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
