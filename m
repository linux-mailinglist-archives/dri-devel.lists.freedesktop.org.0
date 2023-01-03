Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8306665C956
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8809210E286;
	Tue,  3 Jan 2023 22:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE2E10E286;
 Tue,  3 Jan 2023 22:19:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HL9033OEQCezVGiSZCk1vgNwYgg+dLWhBNzSobMrXOmDx/7+cwvvsMJq93SMJYGfelmih/xpxn3UbhrWr3KTujW1YutyOZkkyKy4eRgEjjaaWB3NdxudjfbJjCdRDSrhOoEBQT+PEEYGLSSqC7IEYzUv7hIHSSqeoUoBCd1iwPadr96fb+buGUFY4w70VkpYDrWK3nnPUHyKERbs3h2H+blcOzlZH3/GXaA+oViHDrmbR+hP/9VN7DqtncAns5/s3BC6Unk0O5g34ZX+B8RlVY+2aLeVZctfnaHu6XbacBcXTkxPjZ8uCLeRnJH/5uBXcXfcdpqYSaSMREUDMRTzbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBjNzqzJ4+6OaHWUAPYPzFQKqCQL8JmErERNpPPbCkI=;
 b=CVY7kF+6DgTqjnBvGMjDfaX3e5K2ezp67ag2CCyVTrMMoALgQ9CC0EiMYRsh5hdXvG0xgjEKqvxC7Wgd2onEvCvOQ5jFgabPnL52B99SV5zsax3aGzKla/oKrBxRSMYzn/RY/T34lHV3HmFV3T8JZO3vfyiKKh/JDe/Q6b8J84AbMIobZZA5oyT79wQ85tBum3VQ9OFqH5AKurEDpA1k2A8SL/3h0JichByB/g1cM46xwIeSrVynCI7jy6fHmK3Wwg/4X0z0PMOWiKVm2c6rs3sO9DtYV73Xa0ZiMMVRsUorLvdMJFCjsorWnrTC8pF16jdX5cOc/PFlguLSWxWaEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBjNzqzJ4+6OaHWUAPYPzFQKqCQL8JmErERNpPPbCkI=;
 b=r0Q7mm1kQjGslLXHtFdwMpysRs8iuvSz18QqRqonXn/HBGVZEbVsDdPFtzRoKt5OENR8CImr+YTp07937JVx1a5554ZlGinPgjvDSECQN/I5rCSR9ID8ycm60uMdg+I2+v5sz9wV0ybYv81wtbQNJ6VNFG6Do89P6ErPW037NYc=
Received: from DS7PR05CA0052.namprd05.prod.outlook.com (2603:10b6:8:2f::30) by
 BL1PR12MB5995.namprd12.prod.outlook.com (2603:10b6:208:39b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 22:19:33 +0000
Received: from DS1PEPF0000E651.namprd02.prod.outlook.com
 (2603:10b6:8:2f:cafe::93) by DS7PR05CA0052.outlook.office365.com
 (2603:10b6:8:2f::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.13 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E651.mail.protection.outlook.com (10.167.18.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:33 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:32 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 06/27] drm/amd: Use `amdgpu_ucode_load` helper for SDMA
Date: Tue, 3 Jan 2023 16:18:25 -0600
Message-ID: <20230103221852.22813-7-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E651:EE_|BL1PR12MB5995:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fccc95e-aaca-4063-d75d-08daedd89781
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KH/Eot58qtq128j30AVqZ2OeYHmHs/kRfmRAmxbHU/6fl96anPXxJB3QG4JP32xqiABEwwmgZ9LHAy/Jjks15crrgQQkU+oY/E3AjYz5X4tYCQVTCaJ6WX0ZbSpye43naOsxxgeDJr6HDY1whK6luy/3lHKq9XLp0adkZoYZF8+Irko8EyraNikZvPG3oy/19iqkaubNJsu1m4L6TkrKRAkhwrkFAVXxkDaSraOg020Js9GDuxJHi9KiPSFu10D19Fx6Drlsm8vdzIPq9xCLsdUJ9DJyLYsWWCiPwRGSV+jp0fQtb8yprsiTYz4EFi04hKERNmrq5afc7TfBioQoI563jwGx+ZOLQtUwLTqiGB6wHwlXVaBjgaA/AuHolF1bGkq4rcQ5vkxNXPCIDIvDBBInUatjYngxNJXoFUYbBCtrS6FXww4jb77DQHUxtZTKu9/YSIqobegPHM1XEMZ9t9rLtrFjKslRsUOlWH1s8W24siK6eagXoRIc4M/hDJ5c0uvg+yiQR3+IGwRtQPoClSHFrA/7I4yXtehDiCVauMGyGSWQ6nRleye3Rr5Cdg0T6BBzWuzuf8BQiwkjCIxtNrcrT4V3iN/1GrSaVkcXiKAElJuYGZug6Les+pkLd7vXrNHuQGGgMCRNVst6NBP4uPorqWzNRGRtZFTp/KBvhSn7JOTcYwuSHloJT8hK7UqBzx+xCJOdhE5DiOFa6fhAeAdG25QaT/demcap7/81YdBnJiNaHTMwvIU2OB5FIJ1FrkpHfcV+Ve/BlmVLAEczBsLNM0xAWs/69MdtRewXNx0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(16526019)(6666004)(54906003)(316002)(186003)(26005)(7696005)(81166007)(110136005)(4326008)(2616005)(70206006)(336012)(70586007)(1076003)(8676002)(478600001)(8936002)(41300700001)(5660300002)(83380400001)(44832011)(356005)(47076005)(426003)(2906002)(36860700001)(82740400003)(36756003)(40460700003)(86362001)(82310400005)(40480700001)(22166009)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:33.6152 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fccc95e-aaca-4063-d75d-08daedd89781
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E651.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5995
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index ea5278f094c0..9e85a078d918 100644
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
@@ -214,7 +209,7 @@ int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
 	const struct sdma_firmware_header_v2_0 *sdma_hdr;
 	uint16_t version_major;
 
-	err = request_firmware(&adev->sdma.instance[instance].fw, fw_name, adev->dev);
+	err = amdgpu_ucode_load(adev, &adev->sdma.instance[instance].fw, fw_name);
 	if (err)
 		goto out;
 
-- 
2.34.1

