Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FC2401266
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 03:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B58889AEA;
	Mon,  6 Sep 2021 01:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCE589AD2;
 Mon,  6 Sep 2021 01:12:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DM2C5z/SJ7Ft4Uew7BOrOA1SEgh8k4cqvuavLLN6eDQ8V0lsmI0oxp62H/GjiPBtVhnl1Imf3LUJQ5BPdUBUh8td2g/9d5XVBlNji7yXYNVwILt4zlWEFAigctMIU8CIYac2eoDONZr5LYmIaOsoz9mVR6ia5B2IHeqfPetAzFAszTl5wg3eaJjrUSIBgYmIjccr0S4syY5sonauOwYOyavr66MAytwNjDBC5YrFKdAKsGFEag+AvmcnTXTBIrNzxb0ZyVXXV/QKB1zkD6AjzKPRIY5LNsJeHWsOP00HeolHxwBlLJUmmEQVvWk6wyMWqCF1Ge0ZuK/t+bj0x9K4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=fJVFy5hC0toQ1gVmkxzKPP54Yl8r2LaWOfVR3nNk8gA=;
 b=d9kYyJMu14Tv2nUJ17WHHmzZ2z9UV0IeDxDg2L/kdHx49BNoOLdKyViAfiqx+uo1ov3LD2HWGC8EYWc96ZAA7zjBtCuW+tBNtd25kOQ/2JzBNSrxtMl1YMPBlEfzmR82MqLnSKjKNUiOBDyOe0BX5OksgdmCoAFmjB0McVKsU3e4DzYg4zwG4ej7dKK5lwdhIfojBxCw0Sla2YiFElHZLTiXHnn5WA9+MajHBslHPUz+1QQl6LCD+ny905HltwpdKenNu5KTOEibdttbN7RyqEoKDDDaX6wAS33f+xDVDpqx45LX7+lfdGa0yvLKsxkZrIEWFUpH4TUf8mPd5QceSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJVFy5hC0toQ1gVmkxzKPP54Yl8r2LaWOfVR3nNk8gA=;
 b=HtsoSgmNJyJxS9NRlCLKsE8O1pjpZ/Rl9heydTgIoQ5DxPLtkebMptGjvFM7TxV6h24cyOSB3QJWWCZSic5ZyVGDMqqx0KNEdd5WS6YykwTOFJ9YyMaUkxQSHIYvfiFANVytN34OLXpvuYbpaXkPYLgmAzujH8ury3okBqAuWW8=
Received: from DS7PR03CA0068.namprd03.prod.outlook.com (2603:10b6:5:3bb::13)
 by DM5PR12MB2584.namprd12.prod.outlook.com (2603:10b6:4:b0::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 01:12:27 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::f6) by DS7PR03CA0068.outlook.office365.com
 (2603:10b6:5:3bb::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21 via Frontend
 Transport; Mon, 6 Sep 2021 01:12:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 01:12:27 +0000
Received: from pp-server-two.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Sun, 5 Sep 2021
 20:12:24 -0500
From: xinhui pan <xinhui.pan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <chenli@uniontech.com>, <dri-devel@lists.freedesktop.org>, xinhui pan
 <xinhui.pan@amd.com>
Subject: [PATCH v2 1/2] drm/ttm: Fix a deadlock if the target BO is not idle
 during swap
Date: Mon, 6 Sep 2021 09:12:09 +0800
Message-ID: <20210906011210.80327-2-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210906011210.80327-1-xinhui.pan@amd.com>
References: <20210906011210.80327-1-xinhui.pan@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e644f38c-38c0-46e7-ed03-08d970d3644b
X-MS-TrafficTypeDiagnostic: DM5PR12MB2584:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2584CB515A3A871B0ED10E7787D29@DM5PR12MB2584.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zAjOETX2CLw0irkDJy9wFSDarFlUm/nDXInLxhuHEl61Gs/1z7+KGSuea0Z+LrXOyuX8XteF09/IpeMnCkihtAgwj6/SB6vOijKd17YwHTfjEB3v776E3+Dg7lhDkZxW3/lTGDuB8ONlfgIefTLpVlli7SrZM/ZhVCRrpa45I1KT5fUm0edWuZRB3b/Jhu2u6Ar1n+LWx7NofyxiG67SZcynSImYAUWDO/0EIHaY6bKLXZNG40yraN2CMlidyYgwq2LAUqlDaroBNnM7wIVDVzO4yM9GyIKU8ols+HgnQBJUdHIZRKvxknBQyq9mPJFHzuBhC9ecY4ICzJuTTssE5eezslzm7mX+SZAIqtru0nrQ/zO7juq7rMeVw/xfp/8198DBs+Bkl6+vw0V2uoCkSnwxCfPYHGh7tK9aJWE7WLHEFydRaIt2XtP0+NOol0IcEMnSKDR7ggv4YqAOC1+ylfaUERe59P8llDOg1nQd2tl6qxhMEByazPbNI7nAb8Ml+ZL2JSyzTIhNMR2ssq7QfH4qA15P7gf9uTRPzYPxGfPItwBUE/uS4aEzj5B2RIVcg1/yUr3fDGRrs+AYJhelRhbc5JR64LneVWLlrQ9cAvkUTKeZtkM49JCeAeAmYXQAerQZ7NxNrUHRyjIWh6/aC6fLnjm70AK687BznR6xgyCuygf8a2N4bTWTrsLCD4ihVicK6RirsUsIgvkgNBYAlws1sjMOc1OPumBhbLiwaqg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39860400002)(36840700001)(46966006)(4326008)(478600001)(356005)(7696005)(47076005)(8676002)(8936002)(54906003)(186003)(6666004)(36860700001)(83380400001)(26005)(1076003)(2906002)(66574015)(426003)(6916009)(336012)(81166007)(5660300002)(316002)(70586007)(16526019)(70206006)(86362001)(36756003)(82740400003)(2616005)(82310400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 01:12:27.1754 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e644f38c-38c0-46e7-ed03-08d970d3644b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2584
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
index 1fedd0eb67ba..f1367107925b 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1159,9 +1159,9 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	}
 
 	if (bo->deleted) {
-		ttm_bo_cleanup_refs(bo, false, false, locked);
+		ret = ttm_bo_cleanup_refs(bo, false, false, locked);
 		ttm_bo_put(bo);
-		return 0;
+		return ret == -EBUSY ? -ENOSPC : ret;
 	}
 
 	ttm_bo_move_to_pinned(bo);
@@ -1215,7 +1215,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	if (locked)
 		dma_resv_unlock(bo->base.resv);
 	ttm_bo_put(bo);
-	return ret;
+	return ret == -EBUSY ? -ENOSPC : ret;
 }
 
 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
-- 
2.25.1

