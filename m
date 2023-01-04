Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9163C65DA89
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6429910E5BB;
	Wed,  4 Jan 2023 16:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8379C10E5B5;
 Wed,  4 Jan 2023 16:45:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EW1sfiDsrOv53PrOZB4GLMng/CNtIHh2oUHLBwNaRo/4eewjHRQQE8HLHGQ0ENWdBK8nZ+cfkGVpOu+DYijd7eKcxmFSdU2TDg4IJtsMosTdRfNenKF5fg6TzARLSCjbXIWdQ7QpeOnmsDEb2XWoaZgV+5aBoQbqsHI0vJomFt3QK6Rf3VSDIjHHJuBWBSo9AnpB2I8Hnhm+6nAzIwQlI22e0AZ5PCBjRoSPNTulJnfWCKmRoPlKoUr6+wD3kRvqISZ9qsRNyAEaHVs989TnBynrzBLTEDxS1Nb398XuXTfBsS1CXqeNaXTyohvTnv7JQADWifDIXeTimjGEfrijAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExtgxtIGZlycjRnv/P/OsXElwLSLdwVVuaMvIuvFIf4=;
 b=ausaqHMvEnbdwL4g7LslutuORZHo6ZY6WH7IqgzpRhfRpWSWBWkcyfR+EO0WqS3KSLNtkQ06FUHZJFhxc+yaE+BSVYE/6TZ0dwuUDRkGpA3hRe1hhhA0YBh/mmIEjlGc46g/Udcy2jj8KPexOMOjLxUh1HpZKt3XKqcTRYlnXkxPtaRl8bCepq09gV1Nb90a97PXzrKhWbsRrgGe8pFSA42LPMGXpAniN6s022KNAc+fv9tZ0ZD2BvFv6wNPub2ApsVrOJImpXSPrHPpqjR2CF6f1Wl1w/wjF6GAnMcOYzzNIX4QuPJCz8neBeYxRe9HaB7P3YrzC+ITaPzqh11XfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExtgxtIGZlycjRnv/P/OsXElwLSLdwVVuaMvIuvFIf4=;
 b=rOLv5i6D7uv5EwWb6DZBfdo6AhMWXuX6hNAgApb0Q/zOx7ouO141S+YldS9mXRsy/NwTHs0dRSMe6JkdoqB4Gi14PXPIkxOzi59U5euAen+AO626hVYHoWd/1860duNXzytOZC+OF7bw3cv8tZawM1wZyvdpyBJYISN6CI3czrI=
Received: from BN8PR15CA0014.namprd15.prod.outlook.com (2603:10b6:408:c0::27)
 by IA1PR12MB6113.namprd12.prod.outlook.com (2603:10b6:208:3eb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:45:02 +0000
Received: from BL02EPF00010209.namprd05.prod.outlook.com
 (2603:10b6:408:c0:cafe::f3) by BN8PR15CA0014.outlook.office365.com
 (2603:10b6:408:c0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:45:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010209.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:45:02 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:44:40 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 45/45] drm/amd: make amdgpu_ucode_validate static
Date: Wed, 4 Jan 2023 10:40:34 -0600
Message-ID: <20230104164042.30271-46-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010209:EE_|IA1PR12MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: f831bcf7-82eb-4a46-8aa6-08daee730661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FT22MuNWVL0aE181qpB545JezLErLo49is7aATYT3ytwJ5so4mCjqj+ML7YvLNlIEmlxWNiUYtE+Pdg98MzyRarfpUP4B3HS2vR6aEXqeMmm42OPjVFJAXK6mF7Yyn7KUdyS8EGneiUJbSozxKL6obMRIvC07q5oDI20c7ZS+Cld8bR9o3bFVud4ARpKk939+YRPVOwDXWqVzlPEYFEXlXCPRDLcLJk1YppPbcWdel0ilMgTD/IrpI0Ld8wSU0PmuVI+SD4W75XWDEOYmaexaWTBR4c2i4DG7G+4o2ZoOThR4IhSWgO9Md9XJxiapbaLQUzwPgz/rF35h/sIlv/rS/SI3C3Td1pUCnY4TXrbhJWv8JqlP6UIr+5m1bXAQy0wVzNnt4Hs7vJnwd6aXp8J6Vocnlzbjb3xF3rk227AGH9nuf3lW4vZqYzspSkCxqU+qkZj8QqiqRTS+0KQRJl++h8kuPJuR1RXj+ugZrTOkn3jnpK/7l3T+QikG90DixC6oQcibNNALevdmUJk50Muibx3R7jRbbua1ad/4KK/OpByYmk5A1ngX6UNEUzqDtN8wteDM963l5CUhMXHqtdrGdryl28V2tSm/rVAhAfnbfrj7Us9CpQwfXgTyb+yAaDMTmHdqX3acmZbEbyK3MZNDdVlWiLPfl7tmO4qwj8m1kR+Hn8aa7Pz+zDYbWZV7Ii0YsewTy8WlsOIAycoH0BFqX6YpQDryRr2hvQOKU9pGcc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(82740400003)(36860700001)(83380400001)(81166007)(356005)(86362001)(5660300002)(44832011)(2906002)(4326008)(8676002)(70206006)(70586007)(82310400005)(40480700001)(41300700001)(2616005)(186003)(47076005)(6666004)(26005)(16526019)(426003)(7696005)(1076003)(336012)(110136005)(40460700003)(54906003)(8936002)(316002)(478600001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:45:02.1583 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f831bcf7-82eb-4a46-8aa6-08daee730661
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6113
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

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index dc6af1fffdd9..b759a4300d7a 100644
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
index 7fd2f04f7f98..28fc2960edfe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
@@ -543,7 +543,6 @@ void amdgpu_ucode_print_rlc_hdr(const struct common_firmware_header *hdr);
 void amdgpu_ucode_print_sdma_hdr(const struct common_firmware_header *hdr);
 void amdgpu_ucode_print_psp_hdr(const struct common_firmware_header *hdr);
 void amdgpu_ucode_print_gpu_info_hdr(const struct common_firmware_header *hdr);
-int amdgpu_ucode_validate(const struct firmware *fw);
 int amdgpu_ucode_request(struct amdgpu_device *adev, const struct firmware **fw,
 			 const char *fw_name);
 void amdgpu_ucode_release(const struct firmware *fw);
-- 
2.34.1

