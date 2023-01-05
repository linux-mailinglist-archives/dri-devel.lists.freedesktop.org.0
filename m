Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B6A65E41B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C85F10E69D;
	Thu,  5 Jan 2023 03:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8864C10E684;
 Thu,  5 Jan 2023 03:45:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlfDCINolavMS6TmsaHosRHZk44NlPGqLuFBh6vRnabmf56jI9mQjllIXN9/y4cfOosHBf1uZXT631m6tQMzweiL4/xR3ODBjbreVdz7QiQJH+zJ1rH2wVWEjjjtwNQveLvQM0Rdgp9/BA1Hmw6YXVO46CdVe3TSHatJmbpyaqd/8NNqcQ88y4aPYyceWNdCcFyfddsaKogTaHxSFED1frZMv0AB8XyOu338b/hZQ3A5fNta/Vnqtr3w+4qo1x4CrhZejirdtVirCVEyBtX1PMh2SfmwTKAlrcWW003ByABpWiPX8vrFG+9tSEY8MqIgONNc7HdE616GNGGS+jY4/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFzvu3rkAoSrTZnkuU1FPTWTPKtYPc8VJP/5mz8wnVU=;
 b=h7jsN0tIf+q9FDakFsXmG46QgaVcXcZRijGuwDGUmdaKiqbdNAAXb202fdoKGy1rW0MCFwNPqo2Bbi60jXzEQ7nF6ufkY2YU1jJe8LlgQvPgLiR6N6g4GY/xvcyHbuWZvT/oEZaN+X5r26AUHdT6SCCEog4aILAz1PCJjcqEemoEsKhFQaWBW05nZvKBrifSaB3D9E8lKLHE8JBfQVIVTPO2s/6dgFSdaP7P9hrFOxDVIAMoOBK/0MkOxSEfpZ7A7JIUcdT/VydfhlSwXT3FJJHU+qaV6x3MzFk3HC7p7LiOFxFbsFw5551cIGl+/GujNJjiBJF6mnozrtoPniM/wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFzvu3rkAoSrTZnkuU1FPTWTPKtYPc8VJP/5mz8wnVU=;
 b=45g5tN1vFK2T5qsoompeAcabu9NPEOTGMTNmoVyHEjh1ASH2QHzbJj5QHW4ixYN+3zfGHNfNPbCmA02NrIgJMmbEJqoRfjZ4Mi99V19ERTlZP4OPnLYYMR+773Hy0/ic5rVXlZ2c62wk8WzCNSEDQryvTB+PyxIMlSeze1HOpmA=
Received: from BN9PR03CA0909.namprd03.prod.outlook.com (2603:10b6:408:107::14)
 by SJ2PR12MB7895.namprd12.prod.outlook.com (2603:10b6:a03:4c6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:45:15 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::6d) by BN9PR03CA0909.outlook.office365.com
 (2603:10b6:408:107::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:45:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 03:45:15 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:45:13 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 45/45] drm/amd: make amdgpu_ucode_validate static
Date: Wed, 4 Jan 2023 21:43:19 -0600
Message-ID: <20230105034327.1439-46-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT017:EE_|SJ2PR12MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: 64fcb8f8-4fde-4fd4-7fba-08daeecf41bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KD5cggYJ59SF/kl6u/42yI3SLdxAPsQuyONBvMPrszH3Or/IpHkHaUGTCkP7Y9ky9PsmmDD2EHswlmY3Zxo9gokEc/sWVZnJ+0H7UhMUsD4oSxPLlRbdWoKyyJsuYkSMzN2AOwXijxoccPIUSVpkmOtCiIEoOAfO2aYALWQFkJJpYnNIom1CZJaLF8xQruQdMmfvclYZT7M4hI1HfHys9gi15S6O5TMwpDugP5v8gWCRRiWTZt2a4lOIvNDtlR66VDz+f0QI5agE4WRLPGRFd2WadPksQGVF0E8Z2PhMZZBwfNC98wRFkMOvWu6gpFCGX72DXY8QITeWGkLUiOB4HKvOd7DdBQXCDFi9aTtqHOG2FTLsryHDW7b9aLEBX5bPpMaVXod1URE/lW04keiLpwV0xolvKGqLyqfdcucru+xoUa/2b8Vu030EAvhpXmCinu/uGfMHNp/zz9YHS0E8ydxBEolfsRyiwbOCv9pMgrDQIGrnKNG858rVCp2SEjDOjo9QZKc5ZDbLfBbEXFlvEIxZHl/M+YMm3u5rEI6HkODjCbIv2CpMSG3UF77ywvTFdioLAk/yV1uY47ql2tR0fKLJWiW+MrBllT3kG5j09+Vu3MWE1v3Uh6hxZ5ZyxU1GxF4e3HuDnimw/pvn4abcocekELijG6pg5W/4pjFCJF1LH69JYMHd9jNZrwcsAAGd/16akZBb3fhyKf2O3sC7W3RYpceQkBO4y8mAS6qMum4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199015)(46966006)(36840700001)(40470700004)(83380400001)(426003)(47076005)(7696005)(1076003)(26005)(16526019)(336012)(82310400005)(40480700001)(86362001)(40460700003)(36756003)(36860700001)(82740400003)(356005)(2616005)(81166007)(186003)(316002)(4326008)(41300700001)(478600001)(8676002)(2906002)(5660300002)(8936002)(44832011)(54906003)(70206006)(70586007)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:45:15.4587 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64fcb8f8-4fde-4fd4-7fba-08daeecf41bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7895
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

No consumers outside of amdgpu_ucode.c use amdgpu_ucode_validate
anymore, so make the function static.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
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

