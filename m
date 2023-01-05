Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CE565F213
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7808B10E7C5;
	Thu,  5 Jan 2023 17:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A42C10E7C6;
 Thu,  5 Jan 2023 17:03:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHUWzOSuipaDtrW9MrxcB3qGh5DrW6qbtIAT3nIACu6D9KcHurCshe8PVLzBOMmFTBTUD2vLu5k7kBfoGIaYuo7phaEsfadvJKq8CjWFW9fA6ZiF3IKIohbq6bmM6DD8a1HK5IVkMBXE23qPYBwXu82yproLqtBBM5n0PPzJtx2Oxm+qxvYHeijjKruRn+yJqo46D8gQYmsH70LBEMtgnkZ/pDJNBuyr4a5HIowH4Tlei9fyFSKlIEp2aXkFPgHw5SsUN2A5gQe61DJH93dUx1xxwRDbMvjDws1JFk0Gv7gbvpBTPt1YpIGB1PFUjItmfHHddmdAIDI5stX2Yx+gzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5fAZZuMM1WQtjz/AbOv9TDFwhRSkYeX5tgWRrf12Co=;
 b=NfKy2BDsZHHoglBTfauf+HsiGxwnD8SRQmOPgC9dS+u6fbKeHTBdqS5SnQh0u4W5GMR1R+Wth9b0XxlXl9tx+Bi5FC145XC1mk0Th1EJ2Qe54virWNKUIju8utGeIEsdQPUTEV68zU2Ps8JWpcyOWCuIWKlT6Nsv9Jmskr2KciWOdBiSSIHHYi/T6aa5NI6uTPt0cHWk1RHfF3iwCcu160z+lQsCYjYV/VHyy0pZGGh0lZxWrrVmfC+0KI/f8xgfMbF61lRxfWvrsC/cfE1wm2Z8J+8qXgJGZfdPh6rDFKXhUv6OGd4wOp8FM6owaKoGq987P3W6J4MYRITVr6+qKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5fAZZuMM1WQtjz/AbOv9TDFwhRSkYeX5tgWRrf12Co=;
 b=SMMMNr5G1sKeNCajk3ZKNy1NIS1qkDLSKlUS4vdWD51ImcsvI438Dj6cNZqeMG4RHI89C+m6zOUS+48yF7d190cvT1Q/EHqZxNr/9f3nIPLO+Rc5fLQYqTksSyAxpA9r4a9nDgkmcJmXt2vELWqfSEChyHO8X64n590jSpmCIi8=
Received: from BN9PR03CA0177.namprd03.prod.outlook.com (2603:10b6:408:f4::32)
 by SA1PR12MB5637.namprd12.prod.outlook.com (2603:10b6:806:228::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:59 +0000
Received: from BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::e6) by BN9PR03CA0177.outlook.office365.com
 (2603:10b6:408:f4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT014.mail.protection.outlook.com (10.13.177.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:59 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:55 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 45/45] drm/amd: make amdgpu_ucode_validate static
Date: Thu, 5 Jan 2023 11:01:31 -0600
Message-ID: <20230105170138.717-46-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT014:EE_|SA1PR12MB5637:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d3ae5fa-05c7-424c-325c-08daef3eb2ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NZ0Fh8LxAXAeqjbVNbw3cHkhVb8jruTtlXxXmJpS40gSRluUgGAEVSLfeVXlPyyHypeF5XY7EY0rOsJ3heripbr/lEzRPrm1TfubnAteaSyTSEXo1bDloi/juDycUcPea/KVT/FU85LlEAPPZWe4yvfck9JY/z5tPCoVR2fUm7GWn5HPSZaip2Qx0a6j9sVBKdSsOMPr2CTCAI5UH11CYET8gBTPXrlPnKhz5349hHorwmYjZuqdrPWewbIh2L+xUa63JxKhB7VAozTyRl6/yxE5TdTfn4az4pP7a9KA/KP90MuiCHZrL7kpdaLlQ1AUWifU1SMjyMX1dfhPfx1Ez1o5XFqoshgO49XQm0m+oG8K8+AVXZrTLp2ibZgC36rJ22ngK8k1ga7iRX46Otpfen2FYZEiIJnXlGKQd/XTUybyTIQSX/37iXvg5Nh1eHQENQUVvK0YnxHeLM3NwOPrTr9+Snw4LUTZC5lldlw6rAjkPsZFbyz7ozWO+HZ2qVQ32m17rPP3xS1gZyxRHXUFd7/5kt5WDw2vChQhti7z/tHAb0Yy0ooim3WQCGMBPDv03Aq85MUh2J/mdbxpcGbTNabpr8YiTAtKGUx7O2ZlLSEY3mygzC6PAwKAx4k7+cq5howyjHpp9J4j3sZuykx+jCezxlL+8l7JSrrJaMBztYEjjraZZSuZOaH6j+OoMToCtwCSEdwBFIJ2Wu3PL79rWCh6R6tjBDa7ZSnWI9uFqD0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199015)(36840700001)(40470700004)(46966006)(47076005)(36860700001)(426003)(83380400001)(5660300002)(82740400003)(81166007)(2906002)(44832011)(41300700001)(356005)(8936002)(4326008)(40480700001)(7696005)(40460700003)(316002)(186003)(2616005)(336012)(8676002)(26005)(1076003)(82310400005)(16526019)(6666004)(478600001)(70586007)(54906003)(110136005)(86362001)(70206006)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:59.4909 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3ae5fa-05c7-424c-325c-08daef3eb2ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5637
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

No consumers outside of amdgpu_ucode.c use amdgpu_ucode_validate
anymore, so make the function static.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index 8ebfec12da87..47549d659d9b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -504,7 +504,7 @@ void amdgpu_ucode_print_gpu_info_hdr(const struct common_firmware_header *hdr)
 	}
 }
 
-int amdgpu_ucode_validate(const struct firmware *fw)
+static int amdgpu_ucode_validate(const struct firmware *fw)
 {
 	const struct common_firmware_header *hdr =
 		(const struct common_firmware_header *)fw->data;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
index 848579d4988b..bee93ab4298f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
@@ -543,7 +543,6 @@ void amdgpu_ucode_print_rlc_hdr(const struct common_firmware_header *hdr);
 void amdgpu_ucode_print_sdma_hdr(const struct common_firmware_header *hdr);
 void amdgpu_ucode_print_psp_hdr(const struct common_firmware_header *hdr);
 void amdgpu_ucode_print_gpu_info_hdr(const struct common_firmware_header *hdr);
-int amdgpu_ucode_validate(const struct firmware *fw);
 int amdgpu_ucode_request(struct amdgpu_device *adev, const struct firmware **fw,
 			 const char *fw_name);
 void amdgpu_ucode_release(const struct firmware **fw);
-- 
2.34.1

