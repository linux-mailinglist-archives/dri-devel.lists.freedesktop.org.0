Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5318798957
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 16:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE8110E8E1;
	Fri,  8 Sep 2023 14:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE2E10E8E1;
 Fri,  8 Sep 2023 14:56:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHML0CRuVcQ2kUvigH4LUSLZa2SPpJj9NLNKsmiHPAAz45Ub8ShTFxeKAOjeup/OPqgEDP0LfNRRcoZR0ro5/409qFNWjtDYiQ2vOqqfLmR1g6+S09EZvkE2r5N5J1QxKTK+pwaPT9/5Ddwzm40QEOHDUaj2OSvQKRngphgAn7gv9s14JEsJtSZzQ1F6n90RsjX3btnHcZ41N+mzh73wimSiZfbh0f4UIo86ehED0PHTOWKnNN2IlSmMZWNao4CRAdSTOuovxEhMnNWbQSicBOOYcD03OpL/0dGLCVoZsGToPSURUiCGfb2RbcDJCaQcsJFMSWnyGeb7Kp/AqR/a3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmzntxb0gHbuT/oLSNvz/e8QfagEgsSkgHFMfu5wYR0=;
 b=NwGasClcKUUuKRTO31RINOwwpyYM0L4FwBnJ9CSIMmkBVmoKrxdOpelwTlxnPO1rLD+zS0ohWxUykWPmnIaL9H3NV9FT+I7IEkveEHyAMvOa5hcyv4tDNp5k/PBG9mHGCjLmH+LugmhTgqElmv+AdHiy/UeM3n1iviIna1A1WAUiMionvgY51RGoLUB/WCdLcPIVpJ5dqb7uMO2+114nIKMP56obhOdhhdLCctEzbll3Xw/x3tTyBZyVyidGAgfsazWPkzmMW1yd8zb8qU1udWf6HY75MOUXfU27UivY3cgEkQtETfdmZLfEDBgVLSdDnh7b6WgJGFsnJHBhS8pVww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmzntxb0gHbuT/oLSNvz/e8QfagEgsSkgHFMfu5wYR0=;
 b=Y8Z7DFnKxklhVrfvtfioqUZe5G6A7bCO+izeTvwuPjz7ri0L9X37gAxMQMFLtdEjdM+zgKOgsAmEpBuJPhDAj6hP1LRosPMaYVie29QddXh+2V/A9C77v7GpzNmkjKKtCpWB9MOLZAGM1AFhGANr2+z+nv4y8Hff7EWjTXfjuQE=
Received: from DS7PR03CA0196.namprd03.prod.outlook.com (2603:10b6:5:3b6::21)
 by CYXPR12MB9441.namprd12.prod.outlook.com (2603:10b6:930:dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 14:56:01 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:3b6:cafe::39) by DS7PR03CA0196.outlook.office365.com
 (2603:10b6:5:3b6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30 via Frontend
 Transport; Fri, 8 Sep 2023 14:56:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Fri, 8 Sep 2023 14:56:01 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 09:55:59 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 2/2] Revert "drm/amd: Disable S/G for APUs when 64GB or
 more host memory"
Date: Fri, 8 Sep 2023 10:55:13 -0400
Message-ID: <20230908145521.39044-2-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908145521.39044-1-hamza.mahfooz@amd.com>
References: <20230908145521.39044-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|CYXPR12MB9441:EE_
X-MS-Office365-Filtering-Correlation-Id: fe5c4660-dff2-4ce7-02fe-08dbb07bb805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6pNHeDspQ41NgkyUo3TWEiAKGXD1M4XmftxXSI5FXYtGQDjrq36jJRyhGswa1WRGTfflVcys0D7YVNX6elgv6mXLM6kFnrmYU2GKcLTtB+9RQse6AWr0q6eBiifKZvIyP60SFSfpvnuG1O5UXioGjjfTm4L/bwS4Ys2+5+uR8qTR8cBVis9BPMsoorRq9r5+nIBrPWzZSNtZdIfWhMNQNUincd/0o5KWNYzxrz7Ooz5ld9sBIN2CNLAZ06Z2fdo7LE8xmVE8D49O/yxo9u24V+yeTKVlh5x8lhkaZBLIKTP9H2o8XPJlv1M7vzynppvFhnXqDEkt0xw2fWz+5J1UhZsprNpOOb1N16iFtmXlZSHqseDMJ1r2yQYReIOxZm4G376/XbbsFrfYMskkGwUoP51QYHsTRoFRPj/fZDmcvq6K01HlUsKSq429yYVoTx4lCAC0dc0xxvTPW12rwsC3tmVZszSj0rFH0XQVYWgQZYWIJhcURFG9aeL2/7MD19Dog11hiZgWht60Ckz3Y7NcIXeQ0tvCP8sDhbLvi/8/PWxV4QQuYCt9P1BdETw5WIoi0Bu38mJqpG1QwLkx2QOea5NM/9io6HsOoRQPKaOAOoBrTYwbEBRpUkbUsmqbqgVOJIUzUoTmrHIaeT9QWUhkAP+8/zHEMN2dkkturvWiGcW39rdSv7Bk5VhmW35N/NCGdXKj92qQlqf01nXRYtT0Zr8SBS86U7pzPAtOkQxXBE66gBGPu/JGhqwSBhx1IIJxCKnAjGDhU5uq2XXtvZfa4QXgrPRP9pOl3qnUzuru7+8jNMPcAxaLi6FP96S6pzhMfyQDkYEt4cFjkW+qGo9EGA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39860400002)(186009)(1800799009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(6666004)(966005)(83380400001)(478600001)(26005)(2616005)(1076003)(426003)(336012)(16526019)(41300700001)(2906002)(4326008)(6916009)(54906003)(44832011)(316002)(70206006)(5660300002)(8676002)(70586007)(8936002)(86362001)(82740400003)(40460700003)(47076005)(40480700001)(36860700001)(36756003)(81166007)(356005)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 14:56:01.7078 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5c4660-dff2-4ce7-02fe-08dbb07bb805
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9441
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
Cc: Alan Liu <haoping.liu@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 dri-devel@lists.freedesktop.org, Mario Limonciello <mario.limonciello@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Stylon Wang <stylon.wang@amd.com>,
 Victor Zhao <Victor.Zhao@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Le Ma <le.ma@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Qingqing Zhuo <Qingqing.Zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Hawking Zhang <Hawking.Zhang@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Candice Li <candice.li@amd.com>,
 Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 5b7a256c982636ebc4f16b708b40ff56d33c8a86.

Since, we now have an actual fix for this issue, we can get rid of this
workaround as it can cause pin failures if enough VRAM isn't carved out
by the BIOS.

Cc: stable@vger.kernel.org # 6.1+
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
v2: new to the series
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 26 -------------------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 ++--
 3 files changed, 3 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 83a9607a87b8..3a86d11d1605 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1316,7 +1316,6 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 void amdgpu_device_pci_config_reset(struct amdgpu_device *adev);
 int amdgpu_device_pci_reset(struct amdgpu_device *adev);
 bool amdgpu_device_need_post(struct amdgpu_device *adev);
-bool amdgpu_sg_display_supported(struct amdgpu_device *adev);
 bool amdgpu_device_pcie_dynamic_switching_supported(void);
 bool amdgpu_device_should_use_aspm(struct amdgpu_device *adev);
 bool amdgpu_device_aspm_support_quirk(void);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 5f32e8d4f3d3..3d540b0cf0e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1358,32 +1358,6 @@ bool amdgpu_device_need_post(struct amdgpu_device *adev)
 	return true;
 }
 
-/*
- * On APUs with >= 64GB white flickering has been observed w/ SG enabled.
- * Disable S/G on such systems until we have a proper fix.
- * https://gitlab.freedesktop.org/drm/amd/-/issues/2354
- * https://gitlab.freedesktop.org/drm/amd/-/issues/2735
- */
-bool amdgpu_sg_display_supported(struct amdgpu_device *adev)
-{
-	switch (amdgpu_sg_display) {
-	case -1:
-		break;
-	case 0:
-		return false;
-	case 1:
-		return true;
-	default:
-		return false;
-	}
-	if ((totalram_pages() << (PAGE_SHIFT - 10)) +
-	    (adev->gmc.real_vram_size / 1024) >= 64000000) {
-		DRM_WARN("Disabling S/G due to >=64GB RAM\n");
-		return false;
-	}
-	return true;
-}
-
 /*
  * Intel hosts such as Raptor Lake and Sapphire Rapids don't support dynamic
  * speed switching. Until we have confirmation from Intel that a specific host
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5f14cd9391ca..740a6fcafe4c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1654,8 +1654,9 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 		}
 		break;
 	}
-	if (init_data.flags.gpu_vm_support)
-		init_data.flags.gpu_vm_support = amdgpu_sg_display_supported(adev);
+	if (init_data.flags.gpu_vm_support &&
+	    (amdgpu_sg_display == 0))
+		init_data.flags.gpu_vm_support = false;
 
 	if (init_data.flags.gpu_vm_support)
 		adev->mode_info.gpu_vm_support = true;
-- 
2.41.0

