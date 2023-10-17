Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6606C7CB976
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 05:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1777510E261;
	Tue, 17 Oct 2023 03:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0300410E260;
 Tue, 17 Oct 2023 03:57:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9rKT0nR4dyWfEcm704HCac68ENYAU2JN6ru5c62Jo1pL7eWAvzjP/+rDzpWOUVPaq+S9GN2btYsPEYLirkTmS8JViQB4VvJ8fagn5IQbNLLLSl5A9NoGiDSKVsHFNPXX2AHNfKARs5u9vhSsLxfZHQuQr1ZXSFnM/G61/Jg0uSvI2ZgQKyx43NVg596KD+8AxUj5eQS5cMjG4F82KNN1M4KegaYlOPJuHeJJydMWIHKtsiMhEmq2XjAI33lI5m9jRbCUm3cHkClrCOYskd+2Lvx0Opn32J/cfrbbwteJdWS+SOk4l3T3Y0rrWeOSMlUsJHwYWc8lH9eehyi4Ebs8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xc9p5FqFwuiKp71EzRxNstnjEcyM8bprsZSCFSwv61M=;
 b=Q/8+0yt5+SpvQWx3BdSU+p/CIL9n2fuFiMl6OvkojI4D5aBXCvxdu5PNvrkOkouKoxYbsSws+xpd2Q/owwqNWC3rexSKUpxf2A4QwdTW9XKRwWtHcZmJksialskMUoCefagSnIn5HPeAgfMWjxGJwejaPnxrpWl6Z/XKQ0BkMwSC9nTlWMVES+UROAnK398D6mCOqGJnTGcStjM2t/oJr7NiIs/gXjUV2/hl3ca4BYGQhrGhZiM5yhCHXMG5c2BR+gZLSw52myRdY296KQgkUr1a3k+fMUNbh4H+givOPkZChl/2ci/Up09O8sDNJtIFs0++R3WYUg9HkqzSqJ4EPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xc9p5FqFwuiKp71EzRxNstnjEcyM8bprsZSCFSwv61M=;
 b=1bfqke/ITBWPhRPNS+RNlGaGKJQzbFKudLt3VWS9crn3CBSFU3RHcI5XsjcWWteKkSjkH7scWCFfhKQKVWIjkJ7Ohn7GSw2+UkNuEiWmftKS/ZjXpgJCbtfReawPv3sGy9o9nkMVaVUPLTcztC3j0wz60xPArve8LRJ7Z6iMGn4=
Received: from CYZPR17CA0009.namprd17.prod.outlook.com (2603:10b6:930:8c::28)
 by DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 03:57:13 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:930:8c:cafe::52) by CYZPR17CA0009.outlook.office365.com
 (2603:10b6:930:8c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Tue, 17 Oct 2023 03:57:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 17 Oct 2023 03:57:13 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 16 Oct
 2023 22:57:08 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: AMD Graphics <amd-gfx@lists.freedesktop.org>, "Direct Rendering
 Infrastructure - Development" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] gpu/drm: Eliminate DRM_SCHED_PRIORITY_UNSET
Date: Mon, 16 Oct 2023 23:56:56 -0400
Message-ID: <20231017035656.8211-2-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017035656.8211-1-luben.tuikov@amd.com>
References: <20231017035656.8211-1-luben.tuikov@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-check-string-leak: v1.1
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|DS0PR12MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d476ff3-b591-46ed-d860-08dbcec5253a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IaBQRwNJoImHzo3swT8a3Qi1Pmh0v6BHTWbHZnkQAYpyawhtGx5FMj6jhZqE0mvWO44tBq3lGCSqlWZejsIjkHvCWVQSbWIbdjfPgmS+J/uV6fTcrNpWIoa8E9huhYAcnTnCijhJ9M+Ekr4rzVJdg8J642mfNFaC5I5spc1WzlXTeoDvh8Ws28RtUsYgX4eNDgSiXLcGqDRsXX5j/SYQcmxhZ9780Bz2r517wXCjAdBcTDRNP6P3w55pxcz3j/D4G0x3HRrI3HzldzwZFSKt0me6K0OTRNeTYuueHiEp+6n74+D2m07KViIi3/GasWQPv9FmkKI51n6aIPqEyTtDima9anJU00UDx6Oge5jc1ROQGvlAsrRIpiRdWkcl7vWI5I6ifvGP9vXc4lFJOo7mqFjCxc+vR1eJdX30gQn9VspI5YbmD08aBnR33ddT4EgSC3lNNJfDPMKzhVdV86upbGthzHCqSCCaBfTCphF9MBnLz+GzdN3Kq5BHrnXIL7C4c5oFi2GPZtanblcZZQxjPnkw+6mhHxuKxWerRqde5uC2q3MoaLTXnsoSflsZzk397DaS/9lofGSjRrRY6vdxyTWpjU49HEHtmq/rG+D4FIdD2NrQ+o0v/+PdC/B5bR6DnrtwjOCmSmy7Mzp5jniqveev/GeaxCGE55x18c3TOGqaFAYPFTvmsZ+/EqmeP51K8kbxnFr3FrwWJ13lUt6ounMKLum29/DgbU9PaRWjT2DQYwA9iGaRFS+TVIOgPIVvarKQlg6yVuu69iiZ+2rlzA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(451199024)(82310400011)(186009)(1800799009)(64100799003)(36840700001)(40470700004)(46966006)(40460700003)(1076003)(2616005)(26005)(336012)(426003)(16526019)(6666004)(7696005)(36860700001)(83380400001)(47076005)(44832011)(41300700001)(4326008)(8676002)(5660300002)(2906002)(478600001)(8936002)(450100002)(70206006)(70586007)(110136005)(316002)(54906003)(82740400003)(356005)(81166007)(86362001)(36756003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 03:57:13.0456 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d476ff3-b591-46ed-d860-08dbcec5253a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6486
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Eliminate DRM_SCHED_PRIORITY_UNSET, value of -2, whose only user was
amdgpu. Furthermore, eliminate an index bug, in that when amdgpu boots, it
calls drm_sched_entity_init() with DRM_SCHED_PRIORITY_UNSET, which uses it to
index sched->sched_rq[].

Cc: Alex Deucher <Alexander.Deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 3 ++-
 include/drm/gpu_scheduler.h             | 3 +--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 092962b93064fc..aac52d9754e6da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -64,7 +64,8 @@ amdgpu_ctx_to_drm_sched_prio(int32_t ctx_prio)
 {
 	switch (ctx_prio) {
 	case AMDGPU_CTX_PRIORITY_UNSET:
-		return DRM_SCHED_PRIORITY_UNSET;
+		pr_warn_once("AMD-->DRM context priority value UNSET-->NORMAL");
+		return DRM_SCHED_PRIORITY_NORMAL;
 
 	case AMDGPU_CTX_PRIORITY_VERY_LOW:
 		return DRM_SCHED_PRIORITY_MIN;
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index f9544d9b670d33..ac65f0626cfc91 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -68,8 +68,7 @@ enum drm_sched_priority {
 	DRM_SCHED_PRIORITY_HIGH,
 	DRM_SCHED_PRIORITY_KERNEL,
 
-	DRM_SCHED_PRIORITY_COUNT,
-	DRM_SCHED_PRIORITY_UNSET = -2
+	DRM_SCHED_PRIORITY_COUNT
 };
 
 /* Used to chose between FIFO and RR jobs scheduling */
-- 
2.42.0

