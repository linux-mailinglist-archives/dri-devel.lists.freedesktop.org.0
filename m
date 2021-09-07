Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A0340229C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 06:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758B689C89;
	Tue,  7 Sep 2021 04:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB2E89C85;
 Tue,  7 Sep 2021 04:08:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAYPd64uv+MgNvDg9gspyK/uJdZBtZr7OD4YzKJ7/7yzCk53qjXlzuKAmtnaV2ILGmioYF62rq60aFnZk4DvtbCCOHIB+W8cd4YUHUQPhwb1NK4gbd6b9uBiyzxXzTpBgWmUOa6uAKgw8kaDblZ+3SGOpHnY6vOG27hskJ+JnlLTjwk/c88CtdOKu4P1dcKGZe+welLE3mv8z2HLseXSfVzogvPsKmRdXyhatL2S0tkPnkpEsaqMtq5HKUytvu1LBcggjvMqFY1uqBd+3QppHam1qibRomCGLWZAzGbzR6zUVEhQI3/omQVq+dIy8Nm9sflBAKFyviiD8uuAJ2bQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Ukx0HFb3qysU42itxOjmTy4PJ2/6lvFTbJq5C1M3UrE=;
 b=XcV3RaRzNt0+PFUOykQoFUQBCk2cNpl6PBzu0Ha681lju0tf3AzJoFZycm7vVMaFy4B4YAiTA+KH93Wk66zOR+Ogys1/bzHHyGWeDeR7SvDlEB+f/9r6ELCVDZvPa59A1d5vwppw4IkalGwtNmEEILNLpiKWJ92p9JwAnX6s9VEp8BR+UeISjOpUSs3YOrUSysv1Mb8LgfTHKzR/KYqmAxS0ThVnjMP3IHTFI6Kswn+tij1V9LwjIXeuJidGbhlnY0US16xhKcnMDk+6SFdr9XYlQSIVAnzF7eqfBXwze9Ic5k7Krv4TdL2++61m3r0HdO2/z/Xw7diTGWYh+PpOMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ukx0HFb3qysU42itxOjmTy4PJ2/6lvFTbJq5C1M3UrE=;
 b=L58Kv8c3fCm+MbM6T9UYx3UgIIl+0J+se5AFD4FFoTmAtjZyqDGIOWBbfQvYmSRcCeLrOlwtWkY0sYjTVrYJjtcf4oro0Yxwp1J7qs5fsPRYZIkWbrGW1o+SijF2TZEW/JnLWgbRgEhHANm/x7/R3vH4gATR74YJY23ui3DWP+M=
Received: from BN6PR21CA0017.namprd21.prod.outlook.com (2603:10b6:404:8e::27)
 by BN8PR12MB3457.namprd12.prod.outlook.com (2603:10b6:408:67::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Tue, 7 Sep
 2021 04:08:51 +0000
Received: from BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:8e:cafe::29) by BN6PR21CA0017.outlook.office365.com
 (2603:10b6:404:8e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.1 via Frontend
 Transport; Tue, 7 Sep 2021 04:08:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT059.mail.protection.outlook.com (10.13.177.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 04:08:51 +0000
Received: from pp-server-one.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 6 Sep 2021
 23:08:49 -0500
From: xinhui pan <xinhui.pan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>, xinhui pan
 <xinhui.pan@amd.com>
Subject: [resend PATCH] drm/ttm: Fix a deadlock if the target BO is not idle
 during swap
Date: Tue, 7 Sep 2021 12:08:32 +0800
Message-ID: <20210907040832.1107747-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19e0ef83-4bec-43fa-6078-08d971b53369
X-MS-TrafficTypeDiagnostic: BN8PR12MB3457:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3457621A6508185B2856DAAE87D39@BN8PR12MB3457.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IeVMg0cQQBwhg7j1QwOaenwit6QrdwcHbGCQ0BFs1CG3pcfCIUUXiH/3TqTGXP08yz7ffMqkn9TKGhAtSLMwWBfIT0AtLom+p3G2xMJRfD47IxMSYRfTgU3clj0zM3qa2lglM1KGo2zshZs7z7dvs7MPUH7wwndaAjPRU6hpXRXCGrgMZTD+GtK9JnAj+J98wtyxZ/isuJTVzaU3MRljVkJgXwwPu8coxEHITDfjG22mndbT51x6wbGZS2tL6/PrzQ/f+5Gn/GdpszsF9uC2qVYTj/4wII6zPKqk4zbsWpiz2dnFEcYk+IAcGSsGJpENSJxWhqq9jS1N4shQkgw2FVfI3jo0WRL1o8kEHBdD8smBkF4PGtUCnBzE4gMgVFwHc2anjeulOyOFIcU0d8HGOUCL0RTCpsuU9A1dicv9WAEDcjFKesG6cS0G8tgV1x74Q8a3nyOKmQsrkm0a/c3J5w6Cf2EibYiyU+TFwQGKVPshoM8c5Hi8pnb08vMd5N1sRTBEbTGLPLyoTC1GJirlJE6KYZG3rCaSf3qjbO+XrGPyu/iq+QfXatLHgWQKQCfHB64Zcw2Yq88Qw2Xhtx0VOhmIl5F/lb3dShaEuu56u47IyvzdwQKT1SMmLusEhCbl80uD/kjrAzErbHkhsVO8d/F264k/+5NXQH0v0SADRE8R0MaQV+PQzgYpb66AJeYVSu6MOgg5iaHcQZ2RspC7yXiz2qNey9leblDY7nGA6Rw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(46966006)(36840700001)(2906002)(1076003)(6666004)(450100002)(8936002)(16526019)(186003)(36756003)(4326008)(54906003)(316002)(356005)(81166007)(7696005)(66574015)(83380400001)(5660300002)(70586007)(6916009)(70206006)(8676002)(82310400003)(2616005)(47076005)(426003)(478600001)(336012)(86362001)(82740400003)(36860700001)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 04:08:51.4749 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e0ef83-4bec-43fa-6078-08d971b53369
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3457
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

The ret value might be -EBUSY, caller will think lru lock is still
locked but actually NOT. So return -ENOSPC instead. Otherwise we hit
list corruption.

ttm_bo_cleanup_refs might fail too if BO is not idle. If we return 0,
caller(ttm_tt_populate -> ttm_global_swapout ->ttm_device_swapout) will
be stuck as we actually did not free any BO memory. This usually happens
when the fence is not signaled for a long time.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 8d7fd65ccced..23f906941ac9 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1152,9 +1152,9 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	}
 
 	if (bo->deleted) {
-		ttm_bo_cleanup_refs(bo, false, false, locked);
+		ret = ttm_bo_cleanup_refs(bo, false, false, locked);
 		ttm_bo_put(bo);
-		return 0;
+		return ret == -EBUSY ? -ENOSPC : ret;
 	}
 
 	ttm_bo_del_from_lru(bo);
@@ -1208,7 +1208,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	if (locked)
 		dma_resv_unlock(bo->base.resv);
 	ttm_bo_put(bo);
-	return ret;
+	return ret == -EBUSY ? -ENOSPC : ret;
 }
 
 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
-- 
2.25.1

