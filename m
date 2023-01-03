Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C745E65C957
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BA310E293;
	Tue,  3 Jan 2023 22:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2068.outbound.protection.outlook.com [40.107.96.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11BF10E234;
 Tue,  3 Jan 2023 22:19:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KY7bqZ6QqLixUMVhhMnAMnAXHO1EAnZJYFBqLKPyKV05LBLjZw78Y8AjBDOll810TgAZ6R8F+ZJ1OSB7lx7pHE+vdLd92BbqoVeOhpW+BTFklfzcjUrAMsQhK9kCK9Y47a66jtCi3EYSof5iER8SgOxvnxspQQNj6paTQ5VvDaGTsyNX5qeUpp7XIB4oW0JMmNN/tLyYOD2wJjj0/lLFowIwef2br4q5fX76kK0osaIUFDfq4asa/elynk3GB3SXVv10dqJ69vkXxvbZjeqguPmBCqAfRSBFblwMbt8pTsqHy7LrOkY53OK1dxyqorsA+HbbSWLF9TuuQo2NxWdNsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbAsA0CchhtNCrvkwjTXiShRfvk/GpQWapts8CHXuNI=;
 b=F6dWqXdlTD9yxnCqR9K7+s8hAy2l33ylD+HOXEPDUEGW1UM7jPNiiq9NMb4KVTFV9akvm+TPmoI1+yIVFxrqIFudWHMjwFqg/nqxPr6kAaOpMtp22xbtSmGfDuh+MwN3fYxkLTRJoMpbeht6G+bQD38dDxsmftOMbfO4YRbHZht66Wi/5Q+4gshQ/bJVWw8C/EFHKnxHWX1Q5WZ/oZ6iZ2S8y97eRfdNS5iTveEEQ1OT/RzT80oOV9H/0qSqTyFgy9VI/V/TcdQkmQCXdh8U8FeKPn1DDqFBGeUeOIilPeFCdtfMmbRxAxnJbHUrPEz0sqeFzQ50XDw7TlFFPGZaew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbAsA0CchhtNCrvkwjTXiShRfvk/GpQWapts8CHXuNI=;
 b=3S5rdX/DB6fhguHlmylpI7Wf3c2y33hrVb0lLXNlhAYTJZHIr99/bzeBtSv7pYpTm/nvzyDPCdiMWKPs/80BKST2tPTk6X4yVgCO6CIsw5AQdGwWASixpq3RYUzQYD1tIbeE24m9NOEz0hhg54y+LeVCkvXZbZ2L10RH9H65jRY=
Received: from DM6PR10CA0011.namprd10.prod.outlook.com (2603:10b6:5:60::24) by
 CH0PR12MB5154.namprd12.prod.outlook.com (2603:10b6:610:b9::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Tue, 3 Jan 2023 22:19:32 +0000
Received: from DS1PEPF0000E654.namprd02.prod.outlook.com
 (2603:10b6:5:60:cafe::ea) by DM6PR10CA0011.outlook.office365.com
 (2603:10b6:5:60::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E654.mail.protection.outlook.com (10.167.18.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:32 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:31 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 05/27] drm/amd: Add a new helper for loading/validating
 microcode
Date: Tue, 3 Jan 2023 16:18:24 -0600
Message-ID: <20230103221852.22813-6-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230103221852.22813-1-mario.limonciello@amd.com>
References: <20230103221852.22813-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E654:EE_|CH0PR12MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: 302d0669-037c-4e01-b0a7-08daedd896dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pqLLh9DULg2U2NrEBqjuUhhfxQ9fJKhybE+ux8GXc0p4y/Ysqo/GGsTM8G0+JR7GaMVAlNHWGxuoOopIafo+HvQ/2F70wMqAvyZ2/X+9CMzm+EoEUs6g4bCwJLCAtqggB0EgupjxwP2WZ5qdOVAKLj8zDrcpSQYsaKI0roI5x6XOhf3IEzjjHnwYYgIdTXlGnW7DzvgiSvqzFcUc56l5jP5p5YzF7A8sQC1dRgOeWTuqRi8Lr/wlY3hDeCJ5JKg8YKekooW8k2dRkXgUMvll+/MlonoHKiE2H34vMaNJGtNuzqMZGOfBs0RErgBgRFd5Wx6YocaJSSknTCQpkvz2Yuy4OYCk3HZRMPJqyJofO7cofnQqL6Hx7WIGAOVBbYnIddZsBN1ik2Kui1Qv0ixR3t5Yqa3tbg0GXFmz4To5XOkONlP2bmCfpGJgjlMFMWUWMuRKTmSyQwwYuM97Wc7HkaQu/Q4/BzatrDyJBsBSWPrxPFgKzxdQOy6svYgGscqomJY/yyO4v5khgOf/JwSCTO9fKLSAeWdvMdgiVQOb9thHdtqhSoGoN+TJc78IiNBpxd9gFcGTW8ipGE5NpJnxOY2P+5skQ2BQ8Cxi34MmCUvVP7q+vUBA4RGVjQ3a8+4cBaAKJnD2EG8o2s2oPa1aNq5RXB8iLtj3o4ejN8l4p+I2hUrFXiWcg5qt5wkLScqm7eZwwjokqnv49OeKFjSyhcESS9TYO4issxwIepRV5qRuINq+QMWipA90jpbOjaOU
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199015)(46966006)(36840700001)(40470700004)(2616005)(70586007)(8676002)(40460700003)(4326008)(81166007)(336012)(70206006)(36756003)(426003)(41300700001)(47076005)(1076003)(54906003)(316002)(82310400005)(86362001)(2906002)(356005)(36860700001)(5660300002)(82740400003)(110136005)(8936002)(40480700001)(83380400001)(478600001)(7696005)(44832011)(6666004)(16526019)(186003)(26005)(22166009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:32.5329 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 302d0669-037c-4e01-b0a7-08daedd896dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E654.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5154
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
v3-v4:
 * New patch
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 24 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index eafcddce58d3..8c4a7b09e344 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -1312,3 +1312,27 @@ void amdgpu_ucode_ip_version_decode(struct amdgpu_device *adev, int block_type,
 
 	snprintf(ucode_prefix, len, "%s_%d_%d_%d", ip_name, maj, min, rev);
 }
+
+/*
+ * amdgpu_ucode_load - Load and validate amdgpu microcode
+ *
+ * @adev: amdgpu device
+ * @fw: pointer to load firmware to
+ * @fw_name: firmware to load
+ *
+ * This is a helper that will use request_firmware and amdgpu_ucode_validate
+ * to load and run basic validation on firmware. If the load fails, remap
+ * the error code to -ENODEV, so that early_init functions will fail to load.
+ */
+int amdgpu_ucode_load(struct amdgpu_device *adev, const struct firmware **fw, char *fw_name)
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
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
index 552e06929229..b9139fb44506 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
@@ -544,6 +544,7 @@ void amdgpu_ucode_print_sdma_hdr(const struct common_firmware_header *hdr);
 void amdgpu_ucode_print_psp_hdr(const struct common_firmware_header *hdr);
 void amdgpu_ucode_print_gpu_info_hdr(const struct common_firmware_header *hdr);
 int amdgpu_ucode_validate(const struct firmware *fw);
+int amdgpu_ucode_load(struct amdgpu_device *adev, const struct firmware **fw, char *fw_name);
 bool amdgpu_ucode_hdr_version(union amdgpu_firmware_header *hdr,
 				uint16_t hdr_major, uint16_t hdr_minor);
 
-- 
2.34.1

