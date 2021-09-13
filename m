Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B01EE40832F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 05:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061A76E0D6;
	Mon, 13 Sep 2021 03:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2041.outbound.protection.outlook.com [40.107.95.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F686E0D5;
 Mon, 13 Sep 2021 03:36:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQNptZoGT+xTmbKzA1ZNrAUucDRPAfABkKLi6mbAcgTys0DBy8qa1LuoCpwRC9njStjpr8TT0QrXMf3cn1O/EMHMFvaMKAAcyrQYvKPOt3iGgpSkdCY/z1s1u2BgYihu26m77RlmhYXfPz4AoeZUPIiMSxfNi6F2yCSZhvhJZCnkCB3LIThJ96y+PzgwR1Owac9F32NZqLaqoYg1Og8x4FniNlkbmBWp5mwxdO5F56K0f2jZUixQEs/6QOvMNzgTY3R0EZpKCe5WLQqC9uGiMvbfm16NVACor4h5D3WVUjlJpu99us8OACoPUwEt+25svoFx+64iFmSO6btEC6IYPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=JzmY/NjbTgwutbiQy6tU1UQGXJJ/BGN2EkDGA7UH4qg=;
 b=decavxBb0ubRiOc69fnKvFlhtis3oxu/pvzeysAvva8Knyyj1lOuRVRlAKXC0l28S/4C0KcRaKmXgc/eakPfFEbVin3i4A7roZpHb7eQQja4IY7XuxXyuZZXHO28S/T1jxsmbyJL0mmawXm+deZwYjzkQ3XUvYZ+KXT4eSe8IMKoCtnrCZeRVL0mEK2FzafwPdiJj2jN/zG5hGP7b+ymgvUYu6JorN7298w5l+h4j4NFYHkKpr1W3YKTnxYIyNwCGmCsZMbtKLjbJXo7VDuozXWUTrVbITf+EkrpXFkw9YwejfwXKp86CZ+aY7LGJmzrKELmpPcL6ucrUUgrEl4W0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzmY/NjbTgwutbiQy6tU1UQGXJJ/BGN2EkDGA7UH4qg=;
 b=LRMrS89Qj42PlQ1B8JV4rgviDbdeCSiu5Cr3b/ws6bDano+RbkOD7BXFcFByyX/XIgrFS6lJ/8LCMbtzf9ixl4cNktPr3+wzh83e7ds+SV4Cvhl7b1GSZv8vgXLf9RvbkszRzYGKaekHQqrLJL0gziwfRKvS4WX2gOfnm2dkaQc=
Received: from DM6PR02CA0122.namprd02.prod.outlook.com (2603:10b6:5:1b4::24)
 by DM6PR12MB3289.namprd12.prod.outlook.com (2603:10b6:5:15d::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 03:36:49 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::ed) by DM6PR02CA0122.outlook.office365.com
 (2603:10b6:5:1b4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 03:36:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 03:36:48 +0000
Received: from pp-server-two.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Sun, 12 Sep
 2021 22:36:46 -0500
From: xinhui pan <xinhui.pan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <Guchun.Chen@amd.com>, xinhui pan
 <xinhui.pan@amd.com>
Subject: [RFC PATCH] drm/ttm: Try to check if new ttm man out of bounds during
 compile
Date: Mon, 13 Sep 2021 11:36:23 +0800
Message-ID: <20210913033623.296390-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edb6ae2e-58e0-467c-2ef8-08d97667b7cc
X-MS-TrafficTypeDiagnostic: DM6PR12MB3289:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3289C1625BB2218538C07A4C87D99@DM6PR12MB3289.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:419;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kNb+mRR01VeGpijKx/pRiMHEqoABkNoB37RmrRYbPpAauZt15i3vSuUQEjFiwgB3QIa1vtWaiUKAEqwyUCm02Ui4P3bnZ+lEh1iyxAgemj7t5FKIRPv9PuEZ5hjuqPjU8p1uMLFwn5UPe8DVqGeDH2HpSQax/8f1fsaLLQMHw5j2YDNwtAYseWjODmuzOPO68Gd7B5rWSoeoTL6irt7OmgyYSgAcB4UYk7HUKoBYSU4WPYOBB8IynwF1cBz68J5DRVo3H/yp1kdxzjBNiVB9ZOTRNJOhDRIGNvLK5XNPLcFotqpvfdqenrqTRED98fw2T0b1YbGiGxmJ3NjkwuuJ9y9MMy5FWVy23exVjmoXKlRKnO73bapaP2UPBspl15mjPe4zy1Uv13rOw78azxB4ZQvBjIhDZZ4zpk5YEjdBw2dDUEnXvHKfDC6azu+kDhHff9fT4JfFxxtCBAAmSBHkqB6IK55/Qmsi2s8vNJvI92NcEweHbmzkBxeoDoR7HoeQYcOP02JLVbmPk5ypwmFsH7DQpVuTLnucwGLnddG3gvZc/Oq+PuMGJegC/RHXTlkr9EA5eyxEn1lGTlct4ocKOc5cdDHYTIyeVo8AVrxqYs3vLhQz+ihgE4K00NxC5IzHIYKhm8gsMHc6OvRtsUou1jTiF93PepsUA0hIWJL3+wdUutjw+hmDw6qoUt3foylcGJVfetNp6P3XkOAvLfvH+Svd+f+E/Mo+PgId2bjuOsQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966006)(36840700001)(86362001)(4326008)(6666004)(82310400003)(2616005)(26005)(426003)(2906002)(70586007)(336012)(478600001)(81166007)(36860700001)(70206006)(47076005)(36756003)(82740400003)(8936002)(7696005)(5660300002)(1076003)(356005)(6916009)(316002)(8676002)(54906003)(186003)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 03:36:48.5167 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edb6ae2e-58e0-467c-2ef8-08d97667b7cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3289
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow TTM know if vendor set new ttm mananger out of bounds by adding
build_bug_on.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
 drivers/gpu/drm/ttm/ttm_range_manager.c |  2 ++
 include/drm/ttm/ttm_device.h            |  3 +++
 include/drm/ttm/ttm_range_manager.h     | 10 ++++++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index 03395386e8a7..47e304719b88 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -127,6 +127,8 @@ static const struct ttm_resource_manager_func ttm_range_manager_func = {
 	.debug = ttm_range_man_debug
 };
 
+#undef ttm_range_man_init
+#undef ttm_range_man_fini
 /**
  * ttm_range_man_init
  *
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 07d722950d5b..6f23724f5a06 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -285,12 +285,15 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 static inline struct ttm_resource_manager *
 ttm_manager_type(struct ttm_device *bdev, int mem_type)
 {
+	BUILD_BUG_ON(__builtin_constant_p(mem_type)
+		     && mem_type >= TTM_NUM_MEM_TYPES);
 	return bdev->man_drv[mem_type];
 }
 
 static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
 					  struct ttm_resource_manager *manager)
 {
+	BUILD_BUG_ON(__builtin_constant_p(type) && type >= TTM_NUM_MEM_TYPES);
 	bdev->man_drv[type] = manager;
 }
 
diff --git a/include/drm/ttm/ttm_range_manager.h b/include/drm/ttm/ttm_range_manager.h
index 22b6fa42ac20..9250ade54e2c 100644
--- a/include/drm/ttm/ttm_range_manager.h
+++ b/include/drm/ttm/ttm_range_manager.h
@@ -38,5 +38,15 @@ int ttm_range_man_init(struct ttm_device *bdev,
 		       unsigned long p_size);
 int ttm_range_man_fini(struct ttm_device *bdev,
 		       unsigned type);
+#define ttm_range_man_init(bdev, type, use_tt, size) ({	\
+	BUILD_BUG_ON(__builtin_constant_p(type)		\
+			&& type >= TTM_NUM_MEM_TYPES);	\
+	ttm_range_man_init(bdev, type, use_tt, size);	\
+})
+#define ttm_range_man_fini(bdev, type) ({		\
+	BUILD_BUG_ON(__builtin_constant_p(type)		\
+			&& type >= TTM_NUM_MEM_TYPES);	\
+	ttm_range_man_fini(bdev, type);			\
+})
 
 #endif
-- 
2.25.1

