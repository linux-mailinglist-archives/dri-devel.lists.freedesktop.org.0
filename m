Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 662977B17EB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 11:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D7210E5FE;
	Thu, 28 Sep 2023 09:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E7710E5FE;
 Thu, 28 Sep 2023 09:55:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHujYAuLqXemt5Xh9HgfOLuxXnNv0V6b2uV4eeHeTkN0GXrp6AtQ9994N0yOnIx0/YGb71j/g6STERRL/x0BrKjK7yrCk0JGRfMuGOh9BpLz0U0HsV2S4AtLypOAQlyucePTx4o9SFFq/kf/V24K2Vbq5QL1e+/Kh8yzR+FtYh8v0GeR9JFeZ68cAnVAdTrzn519olG+BJt2HnvxQH7muPURx1QeeyhZREeARGIgT4FLHDlfPw43Ra0tbBhIxLgSzNS/li+NO8eEjoyZMCyPiE9PtkSZNHYSQ6jdR+ClL9u/59TBmuHEyt48MF9iWUU7zlfryHqK+PKsBquHs5oApw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coL7RUfS8sMy70WefR4M5Sy2YIbfcNEYcGImBuWMpS8=;
 b=KC+mIgoiWYmJvjnO8MiW2NQmfyeZdPCmnjToAt28osNbOqB4eA8BuQJR0kMp0zww8Ntgs/BTiS/n7upWA8LCEVq/CKXDkQkTGDyvKbGvkU1Nl64gl3bVHsttocnGNrt6LgPvT/bxLjRgLmuMhFtiENSRKzhDHuFF2a6NO0ZX1wJxzUv0yBz8ja1UhVgDUYqV0oPXY3wXHNTBPYEAO7Lr2p3j3ynTqFgwLPoh8637B1QtqmHqxQjBV7ChBQYe9RfWMqyU1NX67HpBDa5gr0mTexZOVgaIKb7vOJs3LiVfzlAxc7BiMrh4zVCIiKM834HNzvA4bFE3Slql4LjXNup1cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coL7RUfS8sMy70WefR4M5Sy2YIbfcNEYcGImBuWMpS8=;
 b=HKvsOdmLfswh/cbqUU+J79/5w3Pr5ETmZFgGXBRZeslcK/IB+GqtOdDzoRGR6rkSHuh8WOAMeSKaQPrHBFiJPoFvw39RyalITcFi0alh0h/O9JJmj8DZFgKUccl3gCKpal3Tui3D8GCqQqvSoI3n/q48Oe3oRAm4QdnyxLNDWro=
Received: from SJ0PR05CA0030.namprd05.prod.outlook.com (2603:10b6:a03:33b::35)
 by MW5PR12MB5621.namprd12.prod.outlook.com (2603:10b6:303:193::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Thu, 28 Sep
 2023 09:55:38 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::bd) by SJ0PR05CA0030.outlook.office365.com
 (2603:10b6:a03:33b::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.12 via Frontend
 Transport; Thu, 28 Sep 2023 09:55:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Thu, 28 Sep 2023 09:55:37 +0000
Received: from rtg-Artic.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 04:55:07 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Felix.Kuehling@amd.com>, <Mukul.Joshi@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v2 1/1] drm/amdkfd: Fix unaligned doorbell absolute offset for
 gfx8
Date: Thu, 28 Sep 2023 15:24:27 +0530
Message-ID: <20230928095427.4337-2-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928095427.4337-1-Arvind.Yadav@amd.com>
References: <20230928095427.4337-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|MW5PR12MB5621:EE_
X-MS-Office365-Filtering-Correlation-Id: 8be95dfb-3f69-4a60-8698-08dbc0091147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mOhFXgFIE97bwJHTjFM5cc1ZYZ3NXoLmvpVODqIItJMHbdDEDNC9Wp6IqDnMwoXYszX8Vy5POXIM5FZCofFiONdIeZK3+PR/AKN+zELSDqEsCgliQiXBsWqoiK3yGcnBIavMWqJKzMzOEyMbDp0kUuEFyF7DCJljAdnzJowTw6SygIw8V/S4szZAkWTxKxqb/Bhee2cPv5NofdH41u2SfTRR1FieRwkHdIyjsW3ucXR23UQejDj3xtfjk7kA+ytds7vR/X+Oy1ZaRXHuZO5R6cw0fVDMoTWM3BaSytpbYlhzHj4UIgZgScgmU5k9cN+EOAyvBzUG5rGkPjT0pY8pofazjHSJZFxsZN7xnrk5jSEg78WtJf0D5C9zsuUVq6H3Jv8dyB+bM54oNxIsQhYrcRso52dKNftsZcE7V+1haZopsPFrS1/buFmH2YxvWQbaRu6vJV/XjwLV14JIQDBHlbcKSaTWRaoEWzvACt9C9EB5VvO0OO2c35O4d2aDnBSAboiMcik+d/XtI72Ul/e/H0UmJsUHHntTfMyj0vrQMoWe+n48z/I8F21li6yU5X9tn0LF0ZSbtmY0/DiMc6PIcWoY8bsb7UKw2uiKHh4lyn1vkwM6ze+r9KUEMpvsL5/bf1KHh6wniaBu2pblVdOvuD+fAgQV1ePkXVZgymtg1+p4xHp1tCtPPGZ7JLBkfxsDysoW1g7whsn5DzDkgCrhQOsGC7sytj0MP3WtkGTlVVc9ucFEOkp//FSN0bnAgQ9D6KsuaOX6qq6owcb74r7wWg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(7696005)(478600001)(5660300002)(86362001)(40480700001)(70586007)(316002)(41300700001)(6666004)(54906003)(110136005)(70206006)(356005)(2616005)(82740400003)(8936002)(26005)(81166007)(16526019)(426003)(36756003)(36860700001)(336012)(47076005)(83380400001)(8676002)(1076003)(2906002)(4326008)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 09:55:37.8633 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be95dfb-3f69-4a60-8698-08dbc0091147
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5621
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is to adjust the absolute doorbell offset
against the doorbell id considering the doorbell
size of 32/64 bit.

v2:
- Addressed the review comment from Felix.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 0d3d538b64eb..c54c4392d26e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -407,7 +407,14 @@ static int allocate_doorbell(struct qcm_process_device *qpd,
 
 	q->properties.doorbell_off = amdgpu_doorbell_index_on_bar(dev->adev,
 								  qpd->proc_doorbells,
-								  q->doorbell_id);
+								  0);
+
+	/* Adjust the absolute doorbell offset against the doorbell id considering
+	 * the doorbell size of 32/64 bit.
+	 */
+	q->properties.doorbell_off += q->doorbell_id *
+				      dev->kfd->device_info.doorbell_size / 4;
+
 	return 0;
 }
 
-- 
2.34.1

