Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DADE265C968
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0688610E40C;
	Tue,  3 Jan 2023 22:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462B210E294;
 Tue,  3 Jan 2023 22:19:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQG/vJhzqN4+sGXJzzSOfq5J/7O480nRFI96e0USyJyAlSna9h7sEUvoK0Z1EyRTuwC0PXr3Pea+cvDb2PE/+XpD+KMFkgmXZsy8l+NhDZfQRvrLSrKaYV0RGfxYKYcSDtLgqrbKJz+Tqtzdxf99l3j88r0CCR1eHXhbTmsv/VR0srV71+c2iddChxMBmYJzinqbUyImcqiRp9S3tXCQJ3Rnq/O0AqkNZ62G1WTjXE+QIcyOzAZCtD5wnYtKECY04UHdqZzzn3KPWG/4jyCOBBY71QSgjiG2TRLf9tlJojMA606lLyVcY5Ql6xxk+51z6EmO/XSvCDQyUHXcovIXyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lc/v5CnFXkMRGkFU4ZuqObbCevvE1ewDkotNYqfyoBQ=;
 b=PQqhvceAmxcQ7rBf7+2TOyabQD7I+pRseQf1zbIT9eAgbRdYQg1tgCkO55cKGZ0vD0TXe4fbi0OqsIi67ic8SCDr0yFwNDNFnO7xloPm1HJQe1OeXX8YmReCXk4c+7711GLOjDgPe0ghEIdIxwT3mxbWKBDlPvmbhJ5fiT2DbHptHyO8xfPvav6iV6+S5H1cF6QS0I0yx/EZpDP+V+a92EHB2VFPV8JzD6o5vQqTo5TxaJs1LaRSKGpdAUBR9hcGF1l5ZrhzPVznonaXX+1Qj1faGmDLkoRB72zQPO7C6A2oDr1EDTt3nA+X89W1B1Gopz6AaCyz6rdwhJJH1myMOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lc/v5CnFXkMRGkFU4ZuqObbCevvE1ewDkotNYqfyoBQ=;
 b=pnyVkKqC91vEJFSKIoUaa24wObJsZTdkpmsdPgP/8ptHtDjuw09BxqI/7VRa6ed6aao88F+qu35ELR2Qsm9bqyMJypCmbWvcLJf5tm+0C3sZGIPxKorGQQcPeg3IVdEnPkRS5QYb0OTxrZPlyPMadJ/JYaCQFcPPZpjpimD/gdc=
Received: from DM6PR10CA0011.namprd10.prod.outlook.com (2603:10b6:5:60::24) by
 CH3PR12MB8284.namprd12.prod.outlook.com (2603:10b6:610:12e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 22:19:42 +0000
Received: from DS1PEPF0000E654.namprd02.prod.outlook.com
 (2603:10b6:5:60:cafe::ea) by DM6PR10CA0011.outlook.office365.com
 (2603:10b6:5:60::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E654.mail.protection.outlook.com (10.167.18.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:42 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:40 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 12/27] drm/amd: Use `amdgpu_ucode_load` helper for MES
Date: Tue, 3 Jan 2023 16:18:31 -0600
Message-ID: <20230103221852.22813-13-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E654:EE_|CH3PR12MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: 289e3361-738b-4648-6899-08daedd89ccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PSXHmd4LUTUonFu4E/C68qMFFHlBrNBVSlbTKCIg69LlDd8YtiC++GK/RFy/Cqwfvxw4u3qFS+JqnAiZCV3NhadUDOJxmHwyzR3LD6U5sYIw+4f6nCYxAezc6yVxoh0eo2DbGsUhYfgE1HJtDC6yJ33yTdndbnGUrW1lTHQKprS08ShTFeEDz6MFTtNL+S84yEXlTFVKTCxGdP2Vbl1VS5QrSApuvrBp70txlKUaV78LPnihAMBuMMTRsP2+/ox/Eu1A+V+2VELqW8HtbM4NjKaL6HgLa7+CA1ITrTHtE6cJSOVUVFaiU9xznWuJ1AxJeNfMPgHLLQd4YwsS6Ut7Z/MpvS6hGD8c5Kam9iINh0B5Q7pVovxC15YBg0MnEGFjcX+WOCuxE268bqAzC+36fiU/7k0ZRZMM0O7yy/HoTND2LLbpCJecqtM/PEKwVuoowpuQ0kkxZCKv1B6UNadguWzwEo6chhMcCRyT6F1y71rP/tczIvLMbZ16Li5Upr0ZJ7pdRQ5+emfsVYWTHZ1A70bD7gT8oent6/4RgvUq+wTA4sPOJqNtFRREHiLgy/gqbERK3ZqPF3cyeGHAFENXFsETkmmHIrsgfZ1ebYgDSLCfLA8/v2p3Rmg/dMAm8KlfAWFhuVdQONJhFOu73i37cwXMCLuGDwLA4nIhG00CP+bDcKesf9eogADB3plveuDXbXmWAsQFdg74VmLNt9QFJAoyKcTyKNFVpwI0aASbXw++F9F+jWrcgjEhy7NvZpNgnk4crB6P7M0mmJW3HJfF3UvRKD09zOEK+/EkUUoLbV0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(2616005)(36860700001)(83380400001)(47076005)(336012)(426003)(1076003)(40480700001)(86362001)(40460700003)(82310400005)(356005)(81166007)(36756003)(82740400003)(2906002)(44832011)(70586007)(54906003)(110136005)(316002)(41300700001)(70206006)(8676002)(4326008)(8936002)(5660300002)(186003)(26005)(6666004)(478600001)(16526019)(7696005)(22166009)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:42.4859 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 289e3361-738b-4648-6899-08daedd89ccb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E654.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8284
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

The `amdgpu_ucode_load` helper will ensure that the return code for
missing firmware is -ENODEV so that early_init can fail.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3->v4:
 * New patch
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index dd8f35234507..df9efbca0f70 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -1438,11 +1438,7 @@ int amdgpu_mes_init_microcode(struct amdgpu_device *adev, int pipe)
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
 		ucode_prefix,
 		pipe == AMDGPU_MES_SCHED_PIPE ? "" : "1");
-	r = request_firmware(&adev->mes.fw[pipe], fw_name, adev->dev);
-	if (r)
-		goto out;
-
-	r = amdgpu_ucode_validate(adev->mes.fw[pipe]);
+	r = amdgpu_ucode_load(adev, &adev->mes.fw[pipe], fw_name);
 	if (r)
 		goto out;
 
@@ -1482,7 +1478,6 @@ int amdgpu_mes_init_microcode(struct amdgpu_device *adev, int pipe)
 	}
 
 	return 0;
-
 out:
 	release_firmware(adev->mes.fw[pipe]);
 	adev->mes.fw[pipe] = NULL;
-- 
2.34.1

