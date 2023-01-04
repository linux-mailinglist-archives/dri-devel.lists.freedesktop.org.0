Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0322665DA1E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EAA10E458;
	Wed,  4 Jan 2023 16:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01C910E060;
 Wed,  4 Jan 2023 16:41:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9fxSreiTA38W1LaxCOS5i4VH/kLGMPnakrVWg2RWpMs9PjknJbp5wRoTJ9DS6S9ml2e6fiRXKj1MJWgLlLzWsHXpEvaxdb0T09BB9/9qKXAOFi9DT10el7J3ztDaLCB8FmcxZfPFkF0FcnAbOcPyN4MZnGiGNr5ca9U2GqfQ447MKe/stunZY2dKHT+eHzyOBM0ZxYJ+tEQbiLKaFGJ4VAu9jKVz6ljrh9frGISJJR0FbuIZKuSG8SNgFJ2WHwT7ZeEPtx3y5OO2dE+qIL/X+e/spi/snEjOICljG07dINozgcscqnDz8V6sIQ5bGkmvBJPFLyx8GKLdly9Hx0Hiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdWRrWwltduWR39N5OtD4kGLpx64J6ZTI2P9qKz4OCA=;
 b=oLiGkp/efzIPrDNuMMXGdA0KUOQ2mhgmtmH17cKF1wz/GWpFwzQhIJ7Reo1+DAzz/GX8U0r58ZGq40WIS+FrPSJggg0OToN0h3uzIRHgYRXWXiYnrxwgUISjgzEMm/GJzjQN8Ch28rCP50KNdWumMDsSaoJmMsCbC5yfImHaHF0TxdhFwXN2RFATXJMfR1ztlG21yTYSXE3wtwZRj1n1aoj2TMQJsqHdJqo3h22NwYcdQav6Df2fSVAg7ZNgcMn8EcJ+DUR5lMlU+LezFFBaeQnFdlhebfnazAa91HJ4QiIoQOJ4V8sxg5/puxR8ZI2OzXJDTID5kFivbW0YXdRn3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdWRrWwltduWR39N5OtD4kGLpx64J6ZTI2P9qKz4OCA=;
 b=WGOdYKq9hFcJwDslYiOrwAecXWYI5xoZ1XTcXL7LJzA+y8Xv5Ol1y5V4Rn4iBsWnloYuOKnoGLZPQ3GxtcbqiLPn0YJHd5A0aaUyikMZRjGkSIP1Vp51HutQObPHgdDX3371m5wgIjcEinjZUxF3X4ccGsTd3MAo3S3Tbi8nJhk=
Received: from DS7PR03CA0306.namprd03.prod.outlook.com (2603:10b6:8:2b::14) by
 SN7PR12MB6814.namprd12.prod.outlook.com (2603:10b6:806:266::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Wed, 4 Jan 2023 16:41:52 +0000
Received: from DS1PEPF0000E644.namprd02.prod.outlook.com
 (2603:10b6:8:2b:cafe::cf) by DS7PR03CA0306.outlook.office365.com
 (2603:10b6:8:2b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:41:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E644.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:41:51 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:41:50 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 05/45] drm/amd: Add a new helper for loading/validating
 microcode
Date: Wed, 4 Jan 2023 10:39:54 -0600
Message-ID: <20230104164042.30271-6-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104164042.30271-1-mario.limonciello@amd.com>
References: <20230104164042.30271-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E644:EE_|SN7PR12MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: dc2ebe28-7530-4df3-b014-08daee72950c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /lxtGJcQ47gzXouqvL1lTR+G+GSRrKea2l4XWXt3TR7D5X5jlZvBYsnzQPXFPKMZFn83zAMAOi1YhCvunON3yQ2vidg3SjGE/yQpVUlXYuYl5SZ50ZQw9rZCf1MFZkka5hvv4qugjAikwO/zWLCcvpK6golFhF8DjlLB5UV35lKW3Lx6PnFc+8iIWh1BEjQ/u4W2g2kFHpGHbwwRKjjx2NfmnhsSSYpZS/G+KQd6Xc2zHfex4OgztPMlmPc6+LfuDzZ2dsa+1XpWGISGe5z+o7u14RG+0Ynpvw5EClIApjzZSx7zwjzbMNSj6Gzxmygzo/GF8+fb00/tODXmvpxYQSmbYbTCGut7qea7i6GRTb+yXppcDd23c8Z60zykWKhKuiSUwS8Nt4hv84kDLdMdVNKAGiwQz7GV1vOsFWAFc0UymLo0enO2o2gn1ARtGnHpf/4smgttm6prmlZEDVvkOnAagVgzCjOL6FlUWzR9RYegr0dtZYpFs7gf3qMeDILySuF281mwrVsRKb5XbDeiEcrds1VooaYsGuR4D/DCInkdBhz+jzHSsO+Er3qmCR01C06TbAMUpUPzXUvU5hE+4244a+fef/UnNteuvfE5brH0fszhQwETzjLXkxX0fne6Kn0cnyrI6SjVwSoAMTvqj0EzJDfN8z4JiOkhNGnqmOdBt0RBJqtepaImoqQJflPsAPI5Equ1nKpUpepvTmhaPLRgVJ/bGa0TwJwgdYUDaxU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199015)(46966006)(40470700004)(36840700001)(83380400001)(47076005)(426003)(1076003)(16526019)(26005)(336012)(82310400005)(7696005)(40480700001)(86362001)(36860700001)(36756003)(40460700003)(81166007)(82740400003)(356005)(2616005)(186003)(316002)(4326008)(478600001)(41300700001)(8676002)(2906002)(5660300002)(8936002)(44832011)(70586007)(70206006)(54906003)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:41:51.9884 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2ebe28-7530-4df3-b014-08daee72950c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E644.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6814
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
v4->v5:
 * Rename symbols for amdgpu_ucode_request/amdgpu_ucode_release
 * Make argument const
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 36 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h |  3 ++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index eafcddce58d3..dc6af1fffdd9 100644
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
+void amdgpu_ucode_release(const struct firmware *fw)
+{
+	release_firmware(fw);
+	fw = NULL;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
index 552e06929229..7fd2f04f7f98 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
@@ -544,6 +544,9 @@ void amdgpu_ucode_print_sdma_hdr(const struct common_firmware_header *hdr);
 void amdgpu_ucode_print_psp_hdr(const struct common_firmware_header *hdr);
 void amdgpu_ucode_print_gpu_info_hdr(const struct common_firmware_header *hdr);
 int amdgpu_ucode_validate(const struct firmware *fw);
+int amdgpu_ucode_request(struct amdgpu_device *adev, const struct firmware **fw,
+			 const char *fw_name);
+void amdgpu_ucode_release(const struct firmware *fw);
 bool amdgpu_ucode_hdr_version(union amdgpu_firmware_header *hdr,
 				uint16_t hdr_major, uint16_t hdr_minor);
 
-- 
2.34.1

