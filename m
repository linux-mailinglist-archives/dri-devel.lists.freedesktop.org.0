Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102B465DA71
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A77210E59A;
	Wed,  4 Jan 2023 16:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351BD10E58C;
 Wed,  4 Jan 2023 16:44:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpdwertpqoZUFXacOs5RZjrPAcNzz5vYXnM7u8FuwH+NJ9jHVkefbWNxX8oP9/Yb4LWVmkAF1VNK5dmRhqXS3sz/Y59VRP2oqq2/cXLsjPVgPihBpWhH3++TQaHEi92hc8Xp8axzCOg0RMbMhysWg/z+e2oIMNlOcT9bwilb6D2+s+eIGutn0XdpfFoNLl46AXXzL05RoMtL3095+5kmdEFQQNGY8gGaUM7aHLi/zNn9HU9tg08uMrHGtChGmsrEWrMUyEiKdOwHrG1V8R8q6u/pzxuxd7v+CLSomAkGL3+CSvquCjTC2MNEApqLwwJZWjGcclLizIFFrZSITw9xUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAupng/DiBgVq4A49K1akqtvG/HYBBcWMVkzCkT7rmA=;
 b=WeeDBP6ZjDC1e6u9e+BOTqwLfxqskJg9Ua1e3EYNwVRLq3CITkyaB0+3+iskfC6OxqEv5r3RlibqhSuvMtxPXmAT8oTyPTgkNoTwkyujI+urxm+HcyU4QcjBvgV8D/aVfBIHL+6efa5DtjaR6oC3pY6+ENgCwpafZBHKaZrRoHiZqRs7r63nA3L7krPC7cwA8suxku3bPmAbALVxbKJrEeLaAnDXxF2NmyPQWqpDyQAP1q5kWPNB4CB9XWZmNBicx/LjWPv8ZZ9c9JuXLXokobGovpxT5oHSG3rR6l4xkF4UfXu5rMpTnNOOnGP5fSD2rFZB/vXDTOlMR5eSXJ9PtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAupng/DiBgVq4A49K1akqtvG/HYBBcWMVkzCkT7rmA=;
 b=tbKPKu7d3Jt90B/b+P0HFQNqYp78EP3v5oS93FQdkZns64j99l0Y8S+fTyo1IbhXo/aGTGE1ngYptmZTtWcX572znkf5F3v4aZ6oNTWRqxlYIoR0DnYoW50YgcT0HdRqTXMuRNzzWIKLPP3Bx6PkWaUZA23ebjDXz906tWfnCDE=
Received: from BN9PR03CA0618.namprd03.prod.outlook.com (2603:10b6:408:106::23)
 by IA1PR12MB7637.namprd12.prod.outlook.com (2603:10b6:208:427::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:44:27 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::bb) by BN9PR03CA0618.outlook.office365.com
 (2603:10b6:408:106::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:44:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:44:27 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:43:45 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 28/45] drm/amd: Optimize SRIOV switch/case for PSP
 microcode load
Date: Wed, 4 Jan 2023 10:40:17 -0600
Message-ID: <20230104164042.30271-29-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104164042.30271-1-mario.limonciello@amd.com>
References: <20230104164042.30271-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|IA1PR12MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: e079dd52-a4a9-45eb-dd01-08daee72f1c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: llQMKtn8vYUireGEv22YirGj6fil41FDkCuQ0a9cV92cwaw5ah0EMS653X7H9v/+5Qyz/fbGs+ahHqnrmtToBVKw1JBXuEfO3uArCwFBQ0CvD7D7DmUuZGHwI8xR9MSq4l5ZD8xz2oBjAPjcjWhsTsFlmBxZ/xs+/bb7qOajbwtbqALoFdtbtneiuqyA2LIhd87NiFX+WMID/3FyLTDP2zG7gGO9CwXOpETZUhH8bgpq8tFK9WDZ7+sg6wJo1R2/jsrOqNa088hN282HZClRCSeOD9SHZVCCDhkoYtZDeeRDcxgSrmshhFB41GqdLpGM0+XNmuql9aS2zSZKk+NUKQXNE2tWVEgrbXOIw0gdfRlkerG2fv8h6+2Ud3kWD1TrZQ5uVPDKlxAbmP4vIX8S9Dg4KnIlgy48pvPRxeDtK57yGCu9XX7MPaWxC4N2rtn1macfMexpbYNpSXxSlCi6QXPSEJZimvUhF07RBfI1fv+rgtZyVkMO3tw/8K3vi47/1r+Nccu5n5l515Z2tEdDSzf+Yf4W/wj2YUKgs4MVYcJEsYqss/RGRMS1QMF1MLTGFAhYppEFcLtBf9x1s9qfD+btaV7Qc9o6QTwVuJTlrgEbOczMp09tRtQgeNL4Mroc+pf2bhxhxJeS2uGNYJMKstE1I1jZlG9qrgQDqdEv0+jNDHBX9Zd6ld26Z8XVvmnB7cq4Fg25elC8S5m09r3v10ZrqDHQJMC385c1Arxc8Ts=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(6666004)(110136005)(36756003)(478600001)(36860700001)(82310400005)(40460700003)(86362001)(82740400003)(81166007)(40480700001)(356005)(426003)(47076005)(7696005)(16526019)(1076003)(2616005)(26005)(186003)(336012)(83380400001)(70586007)(5660300002)(70206006)(44832011)(8676002)(4326008)(8936002)(2906002)(41300700001)(316002)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:44:27.5745 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e079dd52-a4a9-45eb-dd01-08daee72f1c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7637
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Lazar Lijo <Lijo.Lazar@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that IP version decoding is used, a number of case statements
can be combined.

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 8a3a38ea7b46..15ffc5a6e4da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -132,14 +132,8 @@ static int psp_init_sriov_microcode(struct psp_context *psp)
 
 	switch (adev->ip_versions[MP0_HWIP][0]) {
 	case IP_VERSION(9, 0, 0):
-		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
-		ret = psp_init_cap_microcode(psp, ucode_prefix);
-		break;
-	case IP_VERSION(11, 0, 9):
-		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
-		ret = psp_init_cap_microcode(psp, ucode_prefix);
-		break;
 	case IP_VERSION(11, 0, 7):
+	case IP_VERSION(11, 0, 9):
 		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
 		ret = psp_init_cap_microcode(psp, ucode_prefix);
 		break;
-- 
2.34.1

