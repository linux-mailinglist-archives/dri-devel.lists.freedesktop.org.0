Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C6C3F8D37
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 19:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34846E88D;
	Thu, 26 Aug 2021 17:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D8E6E039;
 Thu, 26 Aug 2021 17:42:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEzsa+WEbInvwId53NuDOM3spqESgj+3iFicCX6pNQIpYiCybDlAzeP9rFIXBPaM8Gt3zQFrmW68ICnoExwwK4IXa8+bghejHd5e3TOdZH/8fgFn+jOE/JV/cbNJ5iDS8a64fBMmCfF7fFqZpkCU0xotraH0elmP3wvQ0zgoGjDL1r8t2oP4dh7eUa7nmwm5lUbRHmLzF0dTE09aqJpHLj59I+zEuMhNsVJnQHR8voQ4HOgfiPLfO4KgqjPKFBTbvWmHe3MhjMLSTsIZAPIJGioS8NiVZkas/SDQ7+/RuuUYRxP7S91LWYTooV7XPablCcmLl5QMitkQFfR1q5bXVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVjj2p1/2cub+2D3463dfzFPKnfwfhsAgOXarlqz1oY=;
 b=Dp1x5Zc6gpEGOWv0FJXrAmLxuRKpK7BDwtUto0uj1pByyC6hl3prb+WSSogIAaARgXKam9u3+CVTsjlrAx76KazN2e0q3F2z5/2mS7m3yLr7vZPeIVbr/n6YAmAvzj/mSayvrbEQT7xCPJHhxRp7R3zISovBLz4pB8ykWfz1fKN+8rwIxTMQSg1/FwLS6A6O65f18HzQzQyCf2oSxwOHR2xNjNBA4vYm8K05dfSol/hA/q6YPhoXxYINZxLW5diCGgsfLP2oObeVgJQWoEXe7YKSFqv5uxucBJAP8oDz6nMeqlv5jxD9L8pmdkwn7ospjyrWhNnDZhzszRC14nMOrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVjj2p1/2cub+2D3463dfzFPKnfwfhsAgOXarlqz1oY=;
 b=v4pVI5xCrQYoTnxcBJshX7cfgxvR5CaxvJHhPIlezljTyTSI3qwdPiKFYHHXXi7ojrDIFBZ6Nb8Orzr/7EZU/C67MMxQ2Be6SyQASQ8hiiBMhsc4/VdnqRPLhXKS24ZqxlL4EEXhadf7b4R/d2h6HKEeLKivdmoLgUQFWF4zdZI=
Received: from BN8PR16CA0026.namprd16.prod.outlook.com (2603:10b6:408:4c::39)
 by DM6PR12MB5552.namprd12.prod.outlook.com (2603:10b6:5:1bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 17:27:46 +0000
Received: from BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::89) by BN8PR16CA0026.outlook.office365.com
 (2603:10b6:408:4c::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Thu, 26 Aug 2021 17:27:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT028.mail.protection.outlook.com (10.13.176.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 17:27:45 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 26 Aug 2021 12:27:44 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <ckoenig.leichtzumerken@gmail.com>, Andrey Grodzovsky
 <andrey.grodzovsky@amd.com>
Subject: [PATCH v2 4/4] drm/amdgpu: Add a UAPI flag for hot plug/unplug
Date: Thu, 26 Aug 2021 13:27:08 -0400
Message-ID: <20210826172708.229134-5-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826172708.229134-1-andrey.grodzovsky@amd.com>
References: <20210826172708.229134-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98387323-bb4b-4776-5238-08d968b6d175
X-MS-TrafficTypeDiagnostic: DM6PR12MB5552:
X-Microsoft-Antispam-PRVS: <DM6PR12MB55529A8EEB5967C0D9411825EAC79@DM6PR12MB5552.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tZbxWRowuIU8RvQLyiVyDsnal84yjRn3SanJZSx4NOsVRcrw1PxZJLVXgtF4vjGbc/949LgTk2EMarNvBuvZ1slKhxwdbyQsQH5cvOO5Dwg79anmq8P83XhF+THld/HhtMTprX7UfTDlG8g2AtafF2jw14GN1t5AKlln0c+4j7qbIH1/lNhzp3mh9e23iT1vosmBytXAaQzs/nQmNzy2whx6AlCk15z3XMoGDTx5o0PQ69i5oz3po02i+DBV9xi7zvp9lOgLQdT+Jo4NO5qAvYSf6jc1wgBK5RQ4kfg06fs69Nh3UyeqUkuQZKo/CVAJWybQ4bS3u2tB9+QcYRf7NOSHBEgSSgvCVQXzO72PgalEG6+uiXh12yeAmOg+OQzyJj46a2+nYY63+hRCkOpZif0xeS1n3vpR6B6Um7WkScJ/mAvD92OlVaCK0TH/02JtsxbCIx9kl2SHLErd/DxxnCP+lIFjXURde+YuhrFUx90xcAugG/AuF9aaunfKctQvslFv/fbgrMkuX1VnglrNP4PmTvOzOl4VZ3h2uz0C1tNV2ST61hEFGVg+FquSoQ4MvnjBfIJeeuq7lH9YWgmzCGrHUrmTUYw8uZT0h4U0f1lBAJTTOdiIz4SaGdUAf4XEp1mOYNqeLPT9bgrc1FnfMhlMvEN25DhtupUaJKb4UEB50jkuFEsJfO7S3uFglA6GpGnIMAsvXN42V/cWivHT4xfWfRFkjXhnQsZUGTg61dU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966006)(36840700001)(54906003)(36756003)(8676002)(8936002)(4326008)(478600001)(47076005)(26005)(316002)(2616005)(44832011)(5660300002)(110136005)(336012)(7696005)(70206006)(356005)(81166007)(16526019)(82740400003)(6666004)(82310400003)(1076003)(4744005)(426003)(83380400001)(70586007)(86362001)(2906002)(36860700001)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 17:27:45.6679 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98387323-bb4b-4776-5238-08d968b6d175
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5552
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

To support libdrm tests.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 6400259a7c4b..c2fdf67ff551 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -96,9 +96,10 @@
  * - 3.40.0 - Add AMDGPU_IDS_FLAGS_TMZ
  * - 3.41.0 - Add video codec query
  * - 3.42.0 - Add 16bpc fixed point display support
+ * - 3.43.0 - Add device hot plug/unplug support
  */
 #define KMS_DRIVER_MAJOR	3
-#define KMS_DRIVER_MINOR	42
+#define KMS_DRIVER_MINOR	43
 #define KMS_DRIVER_PATCHLEVEL	0
 
 int amdgpu_vram_limit;
-- 
2.25.1

