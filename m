Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8668065E3CD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C89C10E649;
	Thu,  5 Jan 2023 03:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE8C10E63E;
 Thu,  5 Jan 2023 03:44:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ju+cSlWcsb1ytly1k4CFaOejUS+lxcj9i2YzLsl9kC9Af36LSW10p6leVOXdlpiecZDhxd1a6bYDDWnK9f+lRZGnwfhbjV+UEwtvuW1VqMyTeoIC3CaxKxF0KM8+gd9B2ebOh/Y8rWvcp24l0WWWM30lx30U3tgT/tAq7UUpjP1bOxBeWlH0ArETWZfXG1uuVpyBMq7WgvrHinFlDicKdAK3+gUUM7BH9TO+0TtWtlRBVHy2mSRghFYVHnYvfU8XfdqDsTaZEJnwtEa6LeBzCmuBN7nD1ZDfgCTTOAlEVZrpPSDnhNMlCc/T+2PkV04USlQtLOW5FtjnycWneLEiPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBRMEOO/w/JC8T+7881NxvUets8/WsZyhXdE6nRedz4=;
 b=CVSWEPbXenG7s7qrruj3kM1ogyiQnndhBWo2VMV+BlGjIRmuMqT1tCGO8y0c1ZQYxyD1IcK6BT4joYKvPGSIwi3kaOIMdw1GxO19/qqHLFtBJPDxYQ1BKKokWuQRHAph3QXNxbCAkvRPHDNCTYUXhbwkAd2IYR53WzqOz1yDEkgKCxQcZBGVQM1++k7hcG5adN54UnCoQHrkpS6QjLkHegrbiFwQ2DfYuLPUDQAnAnDqmX9iDjPwPJ3T9/Me704RoSv2MHkxOZ/ribXvaxyLuQjYWMwIU/1HghklbKaXhofg4POoB5ysNbnu5OCqoCi+02rdMl20rSklqIxMwtIWMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBRMEOO/w/JC8T+7881NxvUets8/WsZyhXdE6nRedz4=;
 b=MoyOkFdofJyFmU9j4tD7ymcq8Baan0UoL1Tx6kVM1PmN7fglr8pxy7DRY5krkG12bx31eQWkpTcWIuxzTH7nd4QrMTqSqtV3ikqjNApROahQbZGaRkPn7Jtpx7JRrqI1GUwrjh1r0aP9gMBANxIlyFXmwYZEiK0shzuQG+xsF5Y=
Received: from BN0PR04CA0034.namprd04.prod.outlook.com (2603:10b6:408:e8::9)
 by DM4PR12MB5135.namprd12.prod.outlook.com (2603:10b6:5:392::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:00 +0000
Received: from BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::78) by BN0PR04CA0034.outlook.office365.com
 (2603:10b6:408:e8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT109.mail.protection.outlook.com (10.13.176.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Thu, 5 Jan 2023 03:44:00 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:43:58 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 05/45] drm/amd: Add a new helper for loading/validating
 microcode
Date: Wed, 4 Jan 2023 21:42:39 -0600
Message-ID: <20230105034327.1439-6-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105034327.1439-1-mario.limonciello@amd.com>
References: <20230105034327.1439-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT109:EE_|DM4PR12MB5135:EE_
X-MS-Office365-Filtering-Correlation-Id: 468d4154-0a9d-4abb-5128-08daeecf14dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KhrifsgAonCd9QikMbSyA7+PU3MywwzSimCXBJky88LgcRkkpdZf9to0YY6nFqCJ94prn/qNHEPXTjRdVhVHafFDgQXqRF61L1a26gSdGwo5N8A9DT/pDhumd6eoWU/T/9thu9kPmsQwAAv6bzcMsuZ06ZbwRQDJTHvD05f9Svo2VCtoPk0l4g3A+lI8HAVso6TWh+ugPOn+T9CevAJ9Q+Ys7BtZqhgdJfc7yjslna8bW/GceEzexv1nP7aw9i6rkJWFONpcQAXUhVyd6Z42bUZKdoO0oT9BmGtQR/oz9Vb+kId8iXA9SqJdBypclaXYnwysFjRDyciD0Fkc6P4H07x3Yo+/+KgHwFKgqxLkPocRdM+3LKIr2j4cRzN9q7ADG7C3kbpZx7tLpBgp2WnLRv9uc5fA/Y2RUsRBg8Mx8jv09Zlwxhc1spOrn/Dg/pl87gP8FiP6x85Pcxthii3x0olfgBG2w2Yn/HiAm3wy1XoP4GiOHHKuA2YMKgvU9z9EGDz21BICcp0aYKWTe1Ix6uIVFyhx3vhF72hUekxoKhK821BI2x0wUcB/Zq8oBn+VH/8vjJXGsQpIXj15M4tEwwn1mUHhRqs4r6bYaHNWQ6XNsH5fE7nDp9GKw/PCQV5lm0OUfVPSwR885VUXpHW5ikZUgEKiucRzhmCOA36mfbbDAvNM7mIebbP2POtGJ1eoi9hkYBHdMrs+NYtbucge1ttRVw1ZOqexH5jTBl1ZX6o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199015)(40470700004)(46966006)(36840700001)(36756003)(70206006)(70586007)(83380400001)(4326008)(5660300002)(44832011)(8676002)(86362001)(2906002)(8936002)(82740400003)(81166007)(36860700001)(54906003)(41300700001)(40460700003)(336012)(7696005)(2616005)(110136005)(6666004)(356005)(316002)(478600001)(26005)(1076003)(47076005)(82310400005)(16526019)(40480700001)(426003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:00.1501 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 468d4154-0a9d-4abb-5128-08daeecf14dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5135
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

All microcode runs a basic validation after it's been loaded. Each
IP block as part of init will run both.

Introduce a wrapper for request_firmware and amdgpu_ucode_validate.
This wrapper will also remap any error codes from request_firmware
to -ENODEV.  This is so that early_init will fail if firmware couldn't
be loaded instead of the IP block being disabled.

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

