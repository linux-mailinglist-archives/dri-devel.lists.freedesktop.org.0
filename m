Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA3C49BEA5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 23:38:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9EF10E5C6;
	Tue, 25 Jan 2022 22:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2080.outbound.protection.outlook.com [40.107.95.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E42A10E5CD;
 Tue, 25 Jan 2022 22:38:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wby6X9oab06uYbE96G+mTWptPDHUSn9C1pmKYeKo8G3y5Ua0rzQT+C20Evqt/YhgrIyZqUuPvXZrSm89BzyW/7aAWxYaCkK1TZE3Hrnoul8DURVadaAohfjX96mnVf5F+jUJOzfsvW8fsGO7/SBjkcFtdd1ECDlDmCgTihzdp/MrYpu7rVuOp8R+zBGeTJbzo61L87ban5TGOP3pXmOWMjIr3VyTLo686Le370z037EGEqsenreEvKHHDdxlB7MIKt9RnzY572S/1CwOksQ49Zme+h3Io6EpJ6hWJcboBtq26gDbz9xt3Wr8F1gf+M8hIBZeoaATER3aDLhlzX8mmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pFGfqZDC/8T0rOWwOksE0wZh3k34VzulojpOCZtEKtk=;
 b=fPsXOZ1a1an3MfklJweawpB6J5b6kds61vszeTqBbKd21nGxf/nPbXbCsBd9NmPuvk9xPEsqzCr1YV33lTMjCWfVflP/A2YhSV9spy6Sg6Wj6oAPgyI7O8oQNQDw9amqx+qiGapgmvfqL6BOgZO7bNJy6dQjQL6RRK2/0rp+4+s8uZWMcY6lpfe+nrkQ54ZWBc7aWrGECZyuhzsHeYwj3Ol7yz9j7pn6PA2BHRtojvc4Os0KfkX7d/gLhVcdTVl/cYPxbopPRw0BCRFyuO3VYyB6M6Xa9xLvLC5wekbTP74pEYzAPGTwX4IxgCM8FZPPGE6LO5pDYJL/T9YcF5T/BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFGfqZDC/8T0rOWwOksE0wZh3k34VzulojpOCZtEKtk=;
 b=Wude/zsK1aL76SOh9nyBQS4z7DC7QckVgNLA0WenmsQk0sqGhwWkARZrCNUlrWqKIPnBvFsNaLtfJNuiYmpd52FiVX+SnmSdykc31fOVgMDW9k55yAHKFmcvYO37IdMNOZS9T/LQOAzdfJU9b4QnFWp6SDZtwm/ISzHEEWjABHQ=
Received: from DM5PR2001CA0005.namprd20.prod.outlook.com (2603:10b6:4:16::15)
 by CY4PR1201MB2502.namprd12.prod.outlook.com (2603:10b6:903:da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Tue, 25 Jan
 2022 22:38:21 +0000
Received: from DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:16:cafe::4b) by DM5PR2001CA0005.outlook.office365.com
 (2603:10b6:4:16::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.19 via Frontend
 Transport; Tue, 25 Jan 2022 22:38:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT018.mail.protection.outlook.com (10.13.172.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 25 Jan 2022 22:38:21 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 25 Jan 2022 16:38:19 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v3 03/12] drm/amdgpu: Fix crash on modprobe
Date: Tue, 25 Jan 2022 17:37:43 -0500
Message-ID: <20220125223752.200211-4-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
References: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4683c166-e4d0-4cd4-220f-08d9e053640e
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2502:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB2502A8313E010290B416BBADEA5F9@CY4PR1201MB2502.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 62pPbLpwMh2H9+5shhTm0ZsDFwPRT18ezGLtFb99fYXnmP+JSWlt0s4t8yW1qE35LpjDrGAKZphtfR30p9P0kIFNyPAbk6khvdQRK2CQUk3hpGJa+syPPzZcUu1IHM5hX6QtcnlYZsAz/4L79K7NwTdbiGl/NDltULV8AAKzV8BWS4lt890ln+RePoqQINC+JgCOV2wEF2q0rQpMsc2WV7Zk3VSIwj1Octzkv+iYVAwouWDncoMLt+sJ74FL7QNtnBuOYzWgsRAZN2Zz0xXHqYJm2njBu1uatmAz2wnZH4VuHq53RYbXot+kQILhvW4SGJVEPA77GxyX85kBIWGPe2lilVYc6Iw8Fz8fM9Etd49foysBJobRcF4GBrAm1dz8p4hwtV5Md1NNJsUyeSQ20pFUt0+7Itd3P85XHlK7yZ5LJhNZXZN61tCiQLy85v4Kp2C6O5I6uqy8MksdmuLYiwJz1YDsuB65sTeMiW05AyasVQeiZ35jQ+9vgs2veRUKqas8kyKrbO6dAwCj8NXXbebWaoh+VTBjSIGruWD/CQxWPD+r96SJfLzA4gIHXpbpKDVwYCgRkjlxPEr2nbQ6lczNREY8sceGW4KBYIBsH3i6ieHm4A9OQpEpLvVgZi+RYM3m0CKDbbxhfNSt1FDU1614FKZn+ZDuMhX+I74r1aXnaK/ihPHM83EQUzk/hmNBLy2opYJYbORIV5/zlJ0be53APtK9Qdb9ZCfKmR486i4pCyzPuJKy/CAzFWhgAcaijjX7P72AkCPQ+Nej2DyvGpJLf4VPb3urJTycszETE50=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700004)(36840700001)(46966006)(110136005)(508600001)(26005)(1076003)(54906003)(36756003)(316002)(7696005)(36860700001)(70206006)(5660300002)(70586007)(66574015)(86362001)(40460700003)(186003)(2616005)(44832011)(336012)(4326008)(16526019)(82310400004)(83380400001)(426003)(356005)(8936002)(81166007)(47076005)(8676002)(2906002)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 22:38:21.4409 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4683c166-e4d0-4cd4-220f-08d9e053640e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2502
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
Cc: horace.chen@amd.com, lijo.lazar@amd.com, jingwech@amd.com,
 christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Restrict jobs resubmission to suspend case
only since schedulers not initialised yet on
probe.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 5527c68c51de..8904c5a63dfa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -582,7 +582,14 @@ void amdgpu_fence_driver_hw_init(struct amdgpu_device *adev)
 		if (!ring || !ring->fence_drv.initialized)
 			continue;
 
-		if (!ring->no_scheduler) {
+		/**
+		 * Restrict jobs resubmission to suspend case
+		 * only since schedulers not initialised yet on
+		 * probe.
+		 *
+		 * TODO - restructure resume to make that unnecessary
+		 */
+		if (adev->in_suspend && !ring->no_scheduler) {
 			drm_sched_resubmit_jobs(&ring->sched);
 			drm_sched_start(&ring->sched, true);
 		}
-- 
2.25.1

