Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE7B65DA56
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02ACC10E571;
	Wed,  4 Jan 2023 16:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA9510E53E;
 Wed,  4 Jan 2023 16:43:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+CVCvWaULp8oMn4uPFsVAnVe1bJ7NPzX1YkSRw+fI9P/0UBhI96jZr+aT9pTrAkt49XeXTmR1UZY01pfrnwgbOYjhFx4g879nzLrumIFZxvb304NqpnTEREbUdlFAvfKLpvoT/pOfO0BppohZ/q8ckd6lRUfqlxetKRTAHmVnHff0OJxPYVXizrUpDz6aDltgFcTjy3CIwAoG7bjLeVmycRtFgApC5F01iKw8EusLaqdK9eqS47myUcsjpW8ZcPNe6jbIYfv43db3WW1osL5RrfOMvRT9TRVQwsJd0bYQCdr4jgyDHrm3+yPyQfCsPbdDK/nJRYJcfxcDvEKuhF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZPLroUHJnEcEoKdznZ8w/er9pKPntcuefEAqwnvnFs=;
 b=BXLkrgonO1mtEf0qNUW1W+hygLGbaSnRp1s94L4Gw3OlHXzljKNkpS6r33W/STfeLahnYglCrMhUb9peeoLMluScSvtYtoCb2NSnB7IUnPqYYmLHpB9E6++fsn3uWPcrL5901nYxvplmIShsQ5WGnrt/pmmxgIZQPYfCH+FCEjGFmjN7WzAiribBUbyyi+LaCGyFTwhtBsUrT0llBYOTHJDAp3FzOcZtNiRHLpS2+eF6FjzILJ3Shwy86H5cF8VIJnmag0sY+Fq9eFrtCFMy3QvzuMsgRhRy3SDVUXnmQaFex5XM9zeZGOnnVVVIzdBwEgE5cwi0y/ArpyX9O4AWHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZPLroUHJnEcEoKdznZ8w/er9pKPntcuefEAqwnvnFs=;
 b=GM4Hg2Nol7naD5vRRep6HYOLJwfG8fxKeNuL6gyhTEww1ZCIwzXycaoyeVZSgI5X01bfJFn5xVQOarPJsUDx/X+y5FRepfWCD44ozO8EUjsfnjbcAUVhDM1KzR1IDZMUhTywMqNPZuEGocfnIuqM1P149T5Wlk1+j3yTrpvI+Ps=
Received: from MN2PR16CA0066.namprd16.prod.outlook.com (2603:10b6:208:234::35)
 by DS0PR12MB8415.namprd12.prod.outlook.com (2603:10b6:8:fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:43:08 +0000
Received: from BL02EPF00010206.namprd05.prod.outlook.com
 (2603:10b6:208:234:cafe::67) by MN2PR16CA0066.outlook.office365.com
 (2603:10b6:208:234::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:43:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010206.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:43:08 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:43:03 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 21/45] drm/amd: Avoid BUG() for case of SRIOV missing IP
 version
Date: Wed, 4 Jan 2023 10:40:10 -0600
Message-ID: <20230104164042.30271-22-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010206:EE_|DS0PR12MB8415:EE_
X-MS-Office365-Filtering-Correlation-Id: 3960df6a-4d82-451f-0a71-08daee72c289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IvW/O5ZKhW1CB6rB30SO+nUPMwLX4r/pChgaQUCmXa8yA3J5RRnGcRPVhZUhyuE+OTHsu87RlHi/GdfCpHmdL0hW/VV/wEsUsu8iNL/tSY87TxKBTmBDC/PbzYl5NLJuWIj+loM2m5BntgbIPwRLLux847uA4zlEdGWwH3pWSZmGXdoEo+cIVmW9kNVNu+/8eThqnIQQK4jllP+xImDMEH9EyyRV6t7cdPS6aVn8LEynwpMNpE5DCP5jHAhVTnYNZ9zvpYdLRf0aOizX+sluywrEW238+tFXnqfrjE1R1w7aVTv2xs6pYKNAF6BWYaQI8Lqhz9qL56eMZHCGNaZJgptnxO4dgNnZPpEz9fITSIKes5Iy0ueorabA7xriyZxwyJrT/kRxcxVQphgjasYHeQkdNr0gWeqv0UbdhZFJjutlFMMrstVhUvAb2MJ59a7BrVdyMyEt8/6b/FbiZTYOS+CZbiIyzygFqw26FbdN4P5znVVOyVh+xaVRKO1rsHoNNRLFjwwaQTQT9ZMTeAdj8GqG3buKMcFM1Mhn8d9p7c/M4+cAliV6bQ1w5cJJEft4/uxK/gUD8xMgjZVb2osGCQEDtvbJFLFPUbX+PjEXf5w98D9QwVrSSzMi7go8JSvLDz2fpgxL7MYGyE4sXSTU8sV/RU6Tt9sZ+eAFGUsh45GYGukxGRjL4+vrXuZZjuJsFiCRaXY+PVhgE1NEFaRRd6OhUehhNAQvtO246wmzIF4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199015)(46966006)(36840700001)(40470700004)(2616005)(336012)(36860700001)(83380400001)(1076003)(426003)(47076005)(40480700001)(86362001)(40460700003)(81166007)(82310400005)(356005)(82740400003)(36756003)(4744005)(110136005)(54906003)(316002)(2906002)(41300700001)(44832011)(70586007)(8936002)(4326008)(70206006)(8676002)(26005)(186003)(478600001)(6666004)(16526019)(5660300002)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:43:08.3321 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3960df6a-4d82-451f-0a71-08daee72c289
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8415
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

No need to crash the kernel.  AMDGPU will now fail to probe.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index d971e3785eaf..a4a62753bfd6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -380,7 +380,7 @@ static int psp_init_sriov_microcode(struct psp_context *psp)
 		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MES1_DATA;
 		break;
 	default:
-		BUG();
+		ret = -EINVAL;
 		break;
 	}
 	return ret;
-- 
2.34.1

