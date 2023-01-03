Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1BA65C963
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68E510E413;
	Tue,  3 Jan 2023 22:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BA210E294;
 Tue,  3 Jan 2023 22:19:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5pAruiDQHYPHsgskFV/qGO/07TcefvRu5d+jxklqqOF0BQDp2ZkzGydpzDsNYhX0RCbY3Riy2fKK+sNB5dF+kNwE/qItV9MNt3XwSfj6vRIypV2iEzlFMb1TRIr9mZPvO6ycVE4nvYDZXGUXaDVFQJV23JCOxepjwGHwibdxe2CGF+M0e9SQYn/zkKofEyH0iR8af7nxWIFtVOuJwkwc0fecYA1HvrXrd7OmWQGFF6WOLIVO0hteclyWGLrP8cdyFpLh7FZo8mrMdVPb0N/EPQEAQRM1J4VGzIK+d587QTCoIbg4BiU4tARdzm+cWoIYr6/pwfDjNoxMxy32W5kLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3iM4OX/xreJdWdWJyM2q7jCgRWyPyNl4K0ErfJ5VN8=;
 b=EE+GLRaljr77Zv96ts2KKNfs55WzMZR6tXvdfmbCvuF1OBcmy5OHxs+5YMKM1/KjLQTfigdzIkHD7sPBdUinBWSswkC9YMVQ6jh4KuwqW9Qa1Qw0hntgX7pKA+Gghn54SkQukSLytt3+f9YOd13pNu0n0VJc66yT+K7poXTIJrzX/54oNelHTPmfw/3JEVlcCPv5NuU09ky8BdVvoLUhMWlCC+3G8inLYqGkS/f4cO2EK7eHTssiKKjUsmQ0Tj0YKJau7qidwRAFtKEBEorL1s+19vjp4IE2uAL/u7atqIHzmDHOy86kHbKl96JYLPNG4cvzEwZHyNQyxNahpvwlew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3iM4OX/xreJdWdWJyM2q7jCgRWyPyNl4K0ErfJ5VN8=;
 b=z1qw4ufJVZ/hsMebG4QHsBxzZ+3iARjyiBSf0sP0EbtA7m7i5CwEDAISObx28+t36+uk8kTZ+zu6YKmBafDoHixUfgemYpLq2x/wwgMfR3VJxVSztOFLm7azxfY6/mmiUzfpC608ltTGsSTX6N6+Qq01aup1CUnf7+/K0SLQ2g4=
Received: from DS7PR03CA0133.namprd03.prod.outlook.com (2603:10b6:5:3b4::18)
 by CH3PR12MB7546.namprd12.prod.outlook.com (2603:10b6:610:149::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 22:19:37 +0000
Received: from DS1PEPF0000E655.namprd02.prod.outlook.com
 (2603:10b6:5:3b4:cafe::3) by DS7PR03CA0133.outlook.office365.com
 (2603:10b6:5:3b4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E655.mail.protection.outlook.com (10.167.18.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:37 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:36 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 09/27] drm/amd: Use `amdgpu_ucode_load` helper for VCN
Date: Tue, 3 Jan 2023 16:18:28 -0600
Message-ID: <20230103221852.22813-10-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E655:EE_|CH3PR12MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: e707cb23-3aae-442b-77c8-08daedd899c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YlNPRJFYakZSiZWih5/5A7UNpJj+5nTgX3zwu58IwSShX72TgYgMS/i13O0uW2XGlN70LlJshCWgmsum+YtUOw+vsBEeLZVztBbLePygxYI+ZIONHh7ASkE5y7h8HLPqjWMFljexihqpLCUuF3uOPJNP8Zsa+TW+cGW11GwXf6O6M2GJj6hWZ9hHb+TEaIuVO1oXl4kGBIoElSpDyJHwYa6MabFYi8bZMGSZB4jBYHg2m6ghV4wpiGLex99QunVBLX5q4VQbJc5YN8adT7QX5HnquhQG1Gf3mPXrUy3q/CebNqZZmriTXvQn2eu3CGRseCeMJKe1DMIRdsuFIZxSojGwczAesZMd8Dibu8SIn5QIdFilLmtcwTuyOnnBofrybgaCVfVXKuLKgvV8WpXbTpSNlRCgHCZRiNYvABx6Eb2D6cu5KLp0RWt726y+Qi1AiBbG+6GZH/8Hrtqe1qaf40iMIGtYhR07DuWDcU1PdoSYNvazkVM7d6jXnSrr9UDUA8PYwvhlMYwr/KwQhoMqkl/2IQImG6j1uM5NkHrR2DzlbjRqP6adiho9/DDr6sUQpeS/2QHeZkzQ5Ei3GicXmBqG1E9PBEO2aAmfY0v0M/M4N8rLW8rfVEEXlOWUoHmdVK/4zJqeC3kMMBR1HVUGn3KqLBOVJobP8G5jj8XkaNnPBPvHMUzDYqk3dwWvFXufNjWXhmC7d2GoeEz90Ics3xmrCFrQbTZDSEVOuR4xCI8ijIDf8CF/e+uhJaAG8a70EzROEGNwD7PyQBxSLlGBdqieyMa/U8MCODWQTTYL8PI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199015)(46966006)(40470700004)(36840700001)(426003)(47076005)(83380400001)(16526019)(186003)(26005)(336012)(6666004)(7696005)(40480700001)(82310400005)(86362001)(40460700003)(36860700001)(36756003)(356005)(81166007)(82740400003)(1076003)(2616005)(8676002)(41300700001)(4326008)(8936002)(2906002)(5660300002)(44832011)(478600001)(70586007)(70206006)(316002)(54906003)(110136005)(22166009)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:37.4335 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e707cb23-3aae-442b-77c8-08daedd899c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E655.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7546
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index a23e26b272b4..6d9cb7fb67cf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -206,19 +206,10 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 		return -EINVAL;
 	}
 
-	r = request_firmware(&adev->vcn.fw, fw_name, adev->dev);
+	r = amdgpu_ucode_load(adev, &adev->vcn.fw, fw_name);
 	if (r) {
-		dev_err(adev->dev, "amdgpu_vcn: Can't load firmware \"%s\"\n",
-			fw_name);
-		return r;
-	}
-
-	r = amdgpu_ucode_validate(adev->vcn.fw);
-	if (r) {
-		dev_err(adev->dev, "amdgpu_vcn: Can't validate firmware \"%s\"\n",
-			fw_name);
-		release_firmware(adev->vcn.fw);
-		adev->vcn.fw = NULL;
+		if (adev->vcn.fw)
+			release_firmware(adev->vcn.fw);
 		return r;
 	}
 
-- 
2.34.1

