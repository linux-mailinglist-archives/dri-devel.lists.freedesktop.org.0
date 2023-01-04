Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9617C65DA8B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9FF10E5B5;
	Wed,  4 Jan 2023 16:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2042.outbound.protection.outlook.com [40.107.96.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B4110E594;
 Wed,  4 Jan 2023 16:44:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPkSSX56e00lWRe1IU7GAKP77qGtL+aCkwUc/8cpStmMOeDvCUhsqaBHX2jabSB4NFVTGWBQNPTSyNnEUe397ypfySmEKw0J0z7joFozKaD9kDdniKLn5kcjmKfBQU2UGCpBK/Rx9PHVE9KXl5cPdwTHM1DxDKJMvNtX7NKu9WuV7QYtp5Dxs+SiHK7/8FHer+wcNm/KJznqGZz6W4aG7hMaSzygC2b9jej8GMK7Gi+5+AsrqirnKpqcxA75H172vAzx5yGp+n+GI+syzbmMr4tUvgg1A4jkRpOm9tBKgx9375C8zDdDjx8c3W6i5KZEm+oPSkFsBSsoQma/gsyr3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgoefmYR9RWKw0Xfu4l6VGuy/avsZgAhPINyJddPdnI=;
 b=QDX1vObu2FH+p9JWy4xmNHvRSUkqOBXGP0QxvF0O+PRsOvJyVTmZYFqvcWvyiBZ88rkqNPmDuP8jaMrwGixiEkpTW0oLP/y0h2FB7lWy0iR5IrK9B7qf8oncn/+7R1eZPL4gQCx4l1kDRv9dMrQlAb0aovlB7vULyr72lG/mpNXmmnE4MNzQgvwHZn8+cVCs/U8RnCG2LaLyYavMcdRUNzrDuJ9OmXrcxFzJ0lgt8cnzIIY2yS4rZshhtDVeRkMpePSYgcjIkIlj8mPF+0dsRLFq5RvThXT2jP/gzrkzM6h2400i78ugQ76Qt5TU3ah4J3sjwZAwHhFRI3rF+zySMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgoefmYR9RWKw0Xfu4l6VGuy/avsZgAhPINyJddPdnI=;
 b=SO+KFr57sx4z+IrA7n7oqGvTTOlCZrG4x3NA2byYgPcPZy40eEsSpV+TzEwbaCHunxu1VDG6WAFMgqP94YknmKGu5UOLkdK0/u0A6VbE1eeQzYCIIGi6PpLO4C1XRTHRPYanHMi3aXZn1EeD12Qm6N8anwsH7TdT/sFxS5vTCtQ=
Received: from BN8PR15CA0018.namprd15.prod.outlook.com (2603:10b6:408:c0::31)
 by SN7PR12MB8433.namprd12.prod.outlook.com (2603:10b6:806:2e5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:44:39 +0000
Received: from BL02EPF00010209.namprd05.prod.outlook.com
 (2603:10b6:408:c0:cafe::74) by BN8PR15CA0018.outlook.office365.com
 (2603:10b6:408:c0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.20 via Frontend
 Transport; Wed, 4 Jan 2023 16:44:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010209.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:44:39 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:44:37 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 43/45] drm/amd: Use `amdgpu_ucode_release` helper for
 powerplay
Date: Wed, 4 Jan 2023 10:40:32 -0600
Message-ID: <20230104164042.30271-44-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010209:EE_|SN7PR12MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: f9eea44a-6236-496e-8595-08daee72f896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dPeMU/MfE2cd3Hyya2QYuQctNJKXbrj1LbeCkYAbfpZHZEvRn9sTwerkpG7sOKN2r3/kU6G1VInUQCxLlsb+raTv1sRW9KhRrCZ62+aNyVnDpOrM+cFT27/3twV0a+0ujrMcXGi2M8FnMC2bDdUNVSJCbW8WjI1li/5TvVIOvl9kIy75FWGYDxc1r+AMVcJTVyjDrIGNgUjG5pwlHFM5cdrpvIVX0AKzHXfHZxyTdQ0XBotgn0S+tSiaHkgmCZqZyBUp0L5ZQ1IcpHxAMhn4f7tL8dGFcvBYFYgU8vtpfgfVV55OpRRqkYGlUMoP+Y+T/F+7l9ivLkBS7SErAziEdW+9TkaALcmfe/l/uy3IafGrOzY0luC9zfrGFfxnKTh7g0gwqLjqHqr/8eA7eq29mNPhBgtAEgkTMHymZrTErw4axbJ3kbkIVp5tPH0a87G66ZPGClVoVIGRT+PQgcRNPK+9GelXdvgOqmYnb4iNp85rYi74EackSDYaZuZqsYfxVgeQLDJoIc89/cTCERAQx7JG5+Kf264vMffRF6ezCysC0HzUl2LTpP9k0Ny5chMWZg78FBpbYLIak+c1xmr585WYX9dkYMmXdEhuYdYoaHpBRYnpxJHr8ODhz5LajWXj9XzXEjvjfcqNBcwzNL9Hboh9oxyVjpOrj+P8juMb1JFgDARneiazkYj2ydFzdzWYihQjDxyktwvEuM/dp8drpBzONpZjR6cEvbcQfJFzw3/yVgGjTfU7PTUS6pGbEJaWt2TcNr/Z8/D9SbCoa9hrgw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(40470700004)(46966006)(36840700001)(36756003)(81166007)(2906002)(82740400003)(5660300002)(86362001)(356005)(41300700001)(44832011)(8936002)(4744005)(426003)(83380400001)(36860700001)(47076005)(110136005)(54906003)(70586007)(70206006)(4326008)(7696005)(40480700001)(478600001)(1076003)(6666004)(16526019)(8676002)(82310400005)(2616005)(26005)(40460700003)(336012)(316002)(186003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:44:39.0174 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9eea44a-6236-496e-8595-08daee72f896
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8433
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
 Evan Quan <evan.quan@amd.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `amdgpu_ucode_release` helper is replacing all calls to
release_firmware.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index 8f2cc6310340..15f41189c911 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -111,8 +111,7 @@ static int pp_sw_fini(void *handle)
 
 	hwmgr_sw_fini(hwmgr);
 
-	release_firmware(adev->pm.fw);
-	adev->pm.fw = NULL;
+	amdgpu_ucode_release(adev->pm.fw);
 
 	return 0;
 }
-- 
2.34.1

