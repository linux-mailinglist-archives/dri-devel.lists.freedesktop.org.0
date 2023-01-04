Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C10A865DA21
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:42:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BB410E44B;
	Wed,  4 Jan 2023 16:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C576510E455;
 Wed,  4 Jan 2023 16:41:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aS0EXOY1v2ASJnk2SkCJnwXRFRKVzlDe2Zk2spTCX6TSplXWs++CzqGa7XeG64tJIbEW+dbRp+CEqw1AL6f38JxcaMYBj0487kaQcUckFPYVKapjasJzMeYzdIXBgG76uUt6CpZsNoMb+7DglVPz1QXTjCALmazmbLF19tzr4EVi1giwWz1piAR39isorzA3XeZcJz1T41vD1SZQv0nhue0TPKL+M1wyW+hjwNX5y5cx9C2fMk4t3KD9WMEXEueaEr+l7dj0rdvkzDtj+QpM/ep6O08983XBTmfHlGV91XqMk5FKGzF53DI0lMwnRUnGexmOELQoKwcSCEQzZAve9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Q1UUJY5AJruN8oGu2kMpYduRktDi5GDRRcUEkcMqk4=;
 b=WTpxrlQXV1Q9shvd1PkmFBLncXn/7PlA/+ixveo67Ih3gB3Z111yqKmPZWh/xQEeVFomHuiuIwDx8j7qiFg53576ayRip+slodupkqAnWZYaNdVw2SRI2TIfLj88B6N4mOczCnBd2osyy1/HKQcEO+ff7l/KJXf70us7EgZP2kJyISWb3aa5a82bVvdN4hBvTftjlXPasUtNuicz+mkn9ZSw2FJiJgt8yZmHgyq74CvMmEUV9inIiGNRgFmMNGlTwEIiU35eKzJ5j4zYv6hrQ2BQ0oi+VXwMApTj9RXxt4IN729N+J78IfJySSuoBX7CP2MN5B71ezMFCsOu9WyW+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Q1UUJY5AJruN8oGu2kMpYduRktDi5GDRRcUEkcMqk4=;
 b=woeH2hFRM2keief/MEUde2OYNQMCSkod8bKIJcPQ1AP3B/3RpPxntO+5Fz8m0+LI3yT4FDLqz+z0Y/uQRu7FSmW9d27g1MgnRxE0kIT4zv8dRUROokwTHZy4qPhGoyi/1fxisGnGB5R70fwapxORjQGoDD8jaWeH/FKQRJYJgVw=
Received: from DS7PR03CA0302.namprd03.prod.outlook.com (2603:10b6:8:2b::11) by
 BL1PR12MB5142.namprd12.prod.outlook.com (2603:10b6:208:312::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:41:54 +0000
Received: from DS1PEPF0000E644.namprd02.prod.outlook.com
 (2603:10b6:8:2b:cafe::a5) by DS7PR03CA0302.outlook.office365.com
 (2603:10b6:8:2b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:41:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E644.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:41:54 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:41:52 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 06/45] drm/amd: Use `amdgpu_ucode_request` helper for SDMA
Date: Wed, 4 Jan 2023 10:39:55 -0600
Message-ID: <20230104164042.30271-7-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E644:EE_|BL1PR12MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: 543baaca-7912-40cb-0236-08daee729664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xCT+8D7/Ez8PJ0/VUOYKN/gsioArufonwHDCJGgxILA3/k43Ydik+Yvi3FfIN8qNnEx3sch9xU5gwGxE4BKjTcfSxKIg6sAU3MiwwqZG2PTksbdU+1D/seB41PAzD9Wi0dltCNTJhA1nqGz3tseQGNcgiIBi8/+gcokahV95VD7EjofycMh1RF2tBn5pkt+bQYZsqJbsO/RPbCk8s1aXHmSPzp/bpXLabLAgzUP0/W/OY1IAfJuOj+5XfdcC5R5S8KpLvQAt0yL9ozZtdGAOmDxcWmyERuVd5twhtBsOoIV+OJJhFldX5qHQkm5fM0QH/mmvoPgnXCH1ZkD+XzjmpxrbJmTd3kKTUfJmbexafHGQZ2o1AolmICLRRi9QOg3V6F7n4KvhDdXN6P7VuBhtjbG2Y7GeO/LMhi/QB78QhHrcO3BM6BJJyeK8aKC0NzsoFSlMz9PjxPDZPYvF8y7m/v4i6phP8E6PyLqmaXSkqDCuvcr/ZJhjjwDhkw28p+RnoCOpUwARRNmlwVF/IiCY23C1K031KBtM+AnWMBpCkDitLaf6VpRJf3HHqLwIKPjEBibas4D7LiSIAe9TTDH4ZrQDOKqzNtL4y/BL7Nbfi3nuzYlxQ9dwbYqghZMfwTALoys5Gm+wjlulvNmUTHZ1mDGw3wb93QoJtpoQsXONMb4m+qCOUcKj84c8T6CBHxOh7U16+0vZozeKG3jH5jDDU25ajNQujFEowgnWWQ2dXYZQwuzrQj2Zyj+QPgVjktflYwMFQsgJnY6557NdrctSqA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(5660300002)(2906002)(8936002)(44832011)(4326008)(41300700001)(8676002)(70586007)(70206006)(110136005)(54906003)(478600001)(316002)(26005)(186003)(16526019)(82310400005)(336012)(40480700001)(7696005)(83380400001)(47076005)(426003)(1076003)(356005)(81166007)(82740400003)(2616005)(86362001)(40460700003)(36756003)(36860700001)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:41:54.2384 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 543baaca-7912-40cb-0236-08daee729664
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E644.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5142
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

The `amdgpu_ucode_request` helper will ensure that the return code for
missing firmware is -ENODEV so that early_init can fail.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index ea5278f094c0..1668360bc699 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -154,16 +154,11 @@ int amdgpu_sdma_process_ecc_irq(struct amdgpu_device *adev,
 
 static int amdgpu_sdma_init_inst_ctx(struct amdgpu_sdma_instance *sdma_inst)
 {
-	int err = 0;
 	uint16_t version_major;
 	const struct common_firmware_header *header = NULL;
 	const struct sdma_firmware_header_v1_0 *hdr;
 	const struct sdma_firmware_header_v2_0 *hdr_v2;
 
-	err = amdgpu_ucode_validate(sdma_inst->fw);
-	if (err)
-		return err;
-
 	header = (const struct common_firmware_header *)
 		sdma_inst->fw->data;
 	version_major = le16_to_cpu(header->header_version_major);
@@ -195,7 +190,7 @@ void amdgpu_sdma_destroy_inst_ctx(struct amdgpu_device *adev,
 	int i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++) {
-		release_firmware(adev->sdma.instance[i].fw);
+		amdgpu_ucode_release(adev->sdma.instance[i].fw);
 		if (duplicate)
 			break;
 	}
@@ -214,7 +209,7 @@ int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
 	const struct sdma_firmware_header_v2_0 *sdma_hdr;
 	uint16_t version_major;
 
-	err = request_firmware(&adev->sdma.instance[instance].fw, fw_name, adev->dev);
+	err = amdgpu_ucode_request(adev, &adev->sdma.instance[instance].fw, fw_name);
 	if (err)
 		goto out;
 
-- 
2.34.1

