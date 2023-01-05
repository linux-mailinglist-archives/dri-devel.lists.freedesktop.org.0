Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A7565F1B9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222CC10E771;
	Thu,  5 Jan 2023 17:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2067.outbound.protection.outlook.com [40.107.101.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4E810E76A;
 Thu,  5 Jan 2023 17:02:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyE+N+I2Y6zBBph68mqH3Ybijk9tzg3wXZ3eIXysZ2VNanBjzrMFHnpJpldcEjgPSkfOJUdPuFxXg3/meO+eVrLOwJMcDhgW87Y1+IcX1x8M/JVP7WFnL8WeLUeP/0NvX+D/2WpWXxm2cgmFuqpCoqzIFJR9jmo/1imPduWyI3ulyEVJdv9bsR4OjsZeSHAQg5R/cBEcfVlfJrawZ6bMh0cttMI/6HW8QlFtvqpLkO/fGR1mcQdt4HZAF/XAsWDIpJkovkk4xGeDbeDRO7yOAPkGgJgx3x/j73tqiKvCQjkoQ091mLp22UY51V31CH+wdgtucf/KUcddp6/YEuNaig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdX1LM5m5PgfPkBkBzE4+IyhHoPHK1alNEFOwJpx+uo=;
 b=a0xXwsrv6NznlOE6Z4t79rIIWYRlXm2o5weY5vcfrUD7WeU0KI7eB5foAdC6Y4ElczGqG9Z2bmx0ALrCHnmhbyNwLgQVzeHfXQW2yPiyK2eGnPaVQgSOyurlo6xdPq3Qd986bMmXTn0Do/KiR5H991LdHBx50cD4E16qf8FgPMsvGEgJcKtbPMMciaCq6GwQACEHdFpDmFSqg2tM0GX71MeA5l4i4ucwXCTd272v+1focf+o3DLzl18516zBjrtJYKJiHz5Cwx0ATg90sKrcixhIgtF7HdArjFgsG2GAqnP4LDdPbtz5cDZVqqMO9bNyr/2vFnJTvaJpwmD7cs5HSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdX1LM5m5PgfPkBkBzE4+IyhHoPHK1alNEFOwJpx+uo=;
 b=luZDOOaDyvii+nVbKNFZ+45SKuzTFh+haj+HaEt9xR35bhksSosIna3S/Z5x26W8pE4hO3EaGbnrs5nhRHqSkfAOybso/u4c3IzXMbn7GQ4ASv8X6sNph2O/ozE/egNlc4Hc2Mux5a14qkZAZ29G6kn0Zc6dNKRC+frnK1ct5zk=
Received: from BN0PR02CA0012.namprd02.prod.outlook.com (2603:10b6:408:e4::17)
 by PH7PR12MB6490.namprd12.prod.outlook.com (2603:10b6:510:1f5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:03 +0000
Received: from BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::8c) by BN0PR02CA0012.outlook.office365.com
 (2603:10b6:408:e4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT107.mail.protection.outlook.com (10.13.176.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Thu, 5 Jan 2023 17:02:03 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:01 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 05/45] drm/amd: Add a new helper for loading/validating
 microcode
Date: Thu, 5 Jan 2023 11:00:51 -0600
Message-ID: <20230105170138.717-6-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105170138.717-1-mario.limonciello@amd.com>
References: <20230105170138.717-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT107:EE_|PH7PR12MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: adcb65cd-9faa-4cd2-c49f-08daef3e9182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jx4gO2AL/KYXmB2yFVrmw+EXFFwIZO9WLJ8YBIyWRLZIL2XGnqVNNhJ/ROxc6GXQCpK6Zzwc7IYmR/Snmyd5IF6M48k9qlk3cpyapl1VUcylVIf2U53VIL42uHbNqfJkIwhVqFfYIC/xMhMar8OCGWC7zTw19imEe/LPkEnkDntHRu0iEogoIcduBYws81EXNSO0MaEB2ol9eOkpoiRBhalhBOUPjJnz/XK/ZbXBOLMFwckamuCP6lMLaWlEGh5WJL7iEhUwnrt9eD4dTSztfUdIiPWLTzaeFSkXUougYKJY0UjNWQe+G3iJrknOLiV/ZDlbQy23GNsFGMQAbSxH/72Ca0+FL8wHCDSFX5MgU3fMDUaJ/Yrmnesq1AokJ08Cz5/gxgoKgB+DoOsIIXbu/ogxp9XtAUY+vweTCGSmQt7Ox12odST6bvsjdGx0U6//sxxhUX2dZw07CU0MD0Mf9c8TNFaluEIhM6JXy/j6MTkyHZYB51zT2BEhzFUxxCPkcR91fioVV5azLKLQSKIP0DnQLSK9SP4k292SO2F3ujp3crb97mZ+nVF8mKOTRdDaXqYF98s0lJfPAqDP5/8hjYmn6EjHX5PRxtTVGURugOJ8JGZzqayGFnmJyYvM+21Haaf+kvpHX5JNzIe775CTvdLtNwdgzpa4w9rBIiJ5bqyG7tolULRvI38YlwekXU+GSDqjHVEs2VegcUZjr4lyYtZIft2Mla1zsLkie+BIVZk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199015)(40470700004)(36840700001)(46966006)(8936002)(41300700001)(5660300002)(8676002)(70586007)(54906003)(110136005)(2906002)(4326008)(7696005)(70206006)(316002)(6666004)(478600001)(47076005)(336012)(86362001)(426003)(44832011)(26005)(186003)(83380400001)(16526019)(2616005)(36756003)(82740400003)(81166007)(40480700001)(356005)(1076003)(40460700003)(36860700001)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:03.4154 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adcb65cd-9faa-4cd2-c49f-08daef3e9182
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6490
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Lijo
 Lazar <lijo.lazar@amd.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Carlos Soriano Sanchez <csoriano@redhat.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All microcode runs a basic validation after it's been loaded. Each
IP block as part of init will run both.

Introduce a wrapper for request_firmware and amdgpu_ucode_validate.
This wrapper will also remap any error codes from request_firmware
to -ENODEV.  This is so that early_init will fail if firmware couldn't
be loaded instead of the IP block being disabled.

Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Fix argument to be ** not *
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 36 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h |  3 ++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index eafcddce58d3..8ebfec12da87 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -1312,3 +1312,39 @@ void amdgpu_ucode_ip_version_decode(struct amdgpu_device *adev, int block_type,
 
 	snprintf(ucode_prefix, len, "%s_%d_%d_%d", ip_name, maj, min, rev);
 }
+
+/*
+ * amdgpu_ucode_request - Fetch and validate amdgpu microcode
+ *
+ * @adev: amdgpu device
+ * @fw: pointer to load firmware to
+ * @fw_name: firmware to load
+ *
+ * This is a helper that will use request_firmware and amdgpu_ucode_validate
+ * to load and run basic validation on firmware. If the load fails, remap
+ * the error code to -ENODEV, so that early_init functions will fail to load.
+ */
+int amdgpu_ucode_request(struct amdgpu_device *adev, const struct firmware **fw,
+			 const char *fw_name)
+{
+	int err = request_firmware(fw, fw_name, adev->dev);
+
+	if (err)
+		return -ENODEV;
+	err = amdgpu_ucode_validate(*fw);
+	if (err)
+		dev_dbg(adev->dev, "\"%s\" failed to validate\n", fw_name);
+
+	return err;
+}
+
+/*
+ * amdgpu_ucode_release - Release firmware microcode
+ *
+ * @fw: pointer to firmware to release
+ */
+void amdgpu_ucode_release(const struct firmware **fw)
+{
+	release_firmware(*fw);
+	*fw = NULL;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
index 552e06929229..848579d4988b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
@@ -544,6 +544,9 @@ void amdgpu_ucode_print_sdma_hdr(const struct common_firmware_header *hdr);
 void amdgpu_ucode_print_psp_hdr(const struct common_firmware_header *hdr);
 void amdgpu_ucode_print_gpu_info_hdr(const struct common_firmware_header *hdr);
 int amdgpu_ucode_validate(const struct firmware *fw);
+int amdgpu_ucode_request(struct amdgpu_device *adev, const struct firmware **fw,
+			 const char *fw_name);
+void amdgpu_ucode_release(const struct firmware **fw);
 bool amdgpu_ucode_hdr_version(union amdgpu_firmware_header *hdr,
 				uint16_t hdr_major, uint16_t hdr_minor);
 
-- 
2.34.1

