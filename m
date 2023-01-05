Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9642C65F1E9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2590910E7A2;
	Thu,  5 Jan 2023 17:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E37B10E791;
 Thu,  5 Jan 2023 17:02:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUI0ufhPisK+6shLGC0ZDVb4GWbgkE8NEkvs0sAuDU4sUfrenfD1tiuitxgiwMrA9tlAv4nAnYaIH6nnC+SqQgPRIe3HBsrTbXtuWtFXysj5Umzv/duBs61SMxTNPzuKA3jDwoakBqIpEeg5afpVedHul1qAKhxXcVKv05NNanUe56oEljvSC7PqRat2yixqL7FstpXlU3q/HPSTOc9RkPTXoNHvdl6i0ZVdz5dn017zVaqAo8jg1wiqrUmN3OQPvdzT0BIyBQvRV18EOUxsWdHclXwyYLM1kkC5exgPIoTe8BASXLOM1dOVyht2xLiNQU/fICEWgxOMHGYwXn6z5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9VaEK8sMG4bgjOcSWslHozyFDc3XSXRUfQvCPvKlik=;
 b=nLy+wOFzFAk0zKQV1xr4qa3P7IiZ4my1OagPEcmbIZhCv+4jbM8nDtantJAQB3R+mIni1anYnSs5h+p11w658XosMAwxD8e2Rd9PJg71IEv8FfO2vlSH1HwAvVTn8zXTp6OkgrFMO6g8IBGaSer00kNaRWHBShIwRtL9Y+AKFFUAmaTws86ViVbh4luhiuguTLu+hZWQ59QywwRO4VVgn+TrHnLX6fgB4shCRikoiho98KABZQjg+rEXwZkln6v6WREbmJVBmzN/SShc9VycCkofxuWtfHR/5MAj37W/dmEuoU01a1z109i41baAMpvUsByOobovV61OV0hf3HhfHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9VaEK8sMG4bgjOcSWslHozyFDc3XSXRUfQvCPvKlik=;
 b=ch/58n3IYE6Uq7erVQxlrxHvEDGDXUjrdgBJB4IMOZ5GrJ2pp7sQNpKWPAmViJjMcqG3wYlVyoBnxUFoYkZfrPbL1eDhBen/z83WJjCKJSyCkEOyPT3OjAVYp19tCIR6ASL8re9GhCLJgzDUEUGgK2sC3onRfJSuCJuQbS1BYW4=
Received: from BN9PR03CA0386.namprd03.prod.outlook.com (2603:10b6:408:f7::31)
 by CY8PR12MB8364.namprd12.prod.outlook.com (2603:10b6:930:7f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:44 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::ef) by BN9PR03CA0386.outlook.office365.com
 (2603:10b6:408:f7::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 17:02:43 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:40 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 33/45] drm/amd: Use `amdgpu_ucode_*` helpers for GMC7
Date: Thu, 5 Jan 2023 11:01:19 -0600
Message-ID: <20230105170138.717-34-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT023:EE_|CY8PR12MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: c2de5af1-73f0-482b-4d5c-08daef3ea978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QdMCwh94AiW33Jg1rhenZT53pxnI5ytOgq6KDybdX5if5k+UuiQbdtYgLUSEyU20f31bAVhU4qR0EWLWxbHKD02+wLohs2LEEQIfXQn/U4R5pkfqkahEi31B0b+QW5l0dQMsfVxHL3J2M2I751J5TlChGgf4aR34u0igrfk5D0IMqYKBlrRKjVWynZPKiRR+mn8PMNgwffAmCOAX7Wp+mnY3sN4fBuW5VyaOV/buyceiDmhWO7TTsf9N2OM7JeqSW/JVTkhe15icyKWrkq7XwtRYA1W7cBG07v0GKeIshhX7HO1NYbzJ7ZOtXhyKid2E7GEJ4tvPnU+3x7eljk+Dw1pi8egxxhKKfSooto+kR6gVVmA1nB7JOYIrvuEDjIzPllGnUaeQmQWwFJ/t8aqzzgHD9Zw7hyO03WBDrRnixBps4VPeb0Yc+ewuNpkvhMShmHqNxZa7b40cIHvAi6iFwKyd8Hk9f+IDzE0rgM5BLqyPOVj+pAJjc0uBh3bcggN9VV6jCf18UjvaByvGR+qi7lJbPyuMxZQJsPtXrwX1SimVrgnWCgRJrlE8faRFYQPDdpl3xFGmusTec595ZraqFpXmtdA8SIR7KQuHjIisHFDCJnSOBigefVftg0gGK7iAozxr2xPDk8weQp/wxZjLO8aDop1/6BS4DKHUcd7mSuECU2qL8fYlqYWG2XLa9Gw0Akqk7IDKoWsAu/v+RumARULUrRIcluVnF8O1U2KdjwvSXMM423Fle6zV2xzcO/BFdGCD2nulIu/nAEURNN4KnQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199015)(36840700001)(40470700004)(46966006)(5660300002)(4326008)(316002)(41300700001)(70586007)(8676002)(8936002)(54906003)(110136005)(44832011)(2906002)(6666004)(7696005)(186003)(26005)(478600001)(70206006)(16526019)(40480700001)(86362001)(1076003)(2616005)(36860700001)(426003)(336012)(47076005)(83380400001)(82740400003)(81166007)(36756003)(356005)(82310400005)(40460700003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:43.6122 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2de5af1-73f0-482b-4d5c-08daef3ea978
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8364
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

The `amdgpu_ucode_request` helper will ensure that the return code for
missing firmware is -ENODEV so that early_init can fail.

The `amdgpu_ucode_release` helper is for symmetry on unloading.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index 979da6f510e8..4412e8c65726 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -156,16 +156,10 @@ static int gmc_v7_0_init_microcode(struct amdgpu_device *adev)
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mc.bin", chip_name);
 
-	err = request_firmware(&adev->gmc.fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gmc.fw);
-
-out:
+	err = amdgpu_ucode_request(adev, &adev->gmc.fw, fw_name);
 	if (err) {
 		pr_err("cik_mc: Failed to load firmware \"%s\"\n", fw_name);
-		release_firmware(adev->gmc.fw);
-		adev->gmc.fw = NULL;
+		amdgpu_ucode_release(&adev->gmc.fw);
 	}
 	return err;
 }
@@ -1081,8 +1075,7 @@ static int gmc_v7_0_sw_fini(void *handle)
 	kfree(adev->gmc.vm_fault_info);
 	amdgpu_gart_table_vram_free(adev);
 	amdgpu_bo_fini(adev);
-	release_firmware(adev->gmc.fw);
-	adev->gmc.fw = NULL;
+	amdgpu_ucode_release(&adev->gmc.fw);
 
 	return 0;
 }
-- 
2.34.1

