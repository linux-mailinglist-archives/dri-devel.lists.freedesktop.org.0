Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A96265DA20
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186EC10E45B;
	Wed,  4 Jan 2023 16:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2087.outbound.protection.outlook.com [40.107.102.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0B310E455;
 Wed,  4 Jan 2023 16:42:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdxhpXmQ9K8ws2+Kjbrjb8R8BjbboV3GcfWfg+cmdf04vRKaXemsT+j+R4CvlznFYWB7YFNFYyr8Y/aEESq6yvjUnJAQAyQNP/d1dX/RLSg4G+qkycM9eGU7R+TQ10ZV6ONoJdSuqE7PPnI4oKgwH7eiGM73vQLldGu0HbuyYLqBt1G+eW2lQ0WmdLDAs/9ywB5mu21E3a4zxYqnaqZMBupVMF4l3ZjoNPY2hDb3Rwb6RqlBfV7TDta5l4uYeybfnsDNc7dogQkbUlqt8O8K01qFVsvhBs+uEFz8z8fDjAWZJxJiKqwFBiCnvPGCjAC9VSsZ+8Cr6gEngh4jGSqtzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9onkh3T7I6BUCh1NaGBPv9JEp1AEd9+jZQNQUZTAMpw=;
 b=d74aMubyZC2o5RltL+3vbtMqtvUs9sjr8I2B9Iibf5xQpC0ttgwfU8dbUYRNUAQQQS74l+7ZHndylLWEzfarm0q1+vSpFPFNdE5pMuNYkJ1/tGr692+ZEfJZV6dILdN0LPxm+jfLEHSmKYouOny+92WwxFtsBiIqgxvFgOqlZ6D2Svf5qSsrCNI42r/pn/w2hQg7PvDqEKShiBFAVxmAWQ9MN+i0jrGPxzUAjQ7Ll+5l2yOAgGL9Kk9vkOMK8el+nRRigqjW0/BQw+lagpvZDaUyAuXFcJ2OKpU6pADANoNhFqAHt6Pj0tvmVLwa+n6x1Ekvf6TTUgOYkqvSdUpeKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9onkh3T7I6BUCh1NaGBPv9JEp1AEd9+jZQNQUZTAMpw=;
 b=VuKAFKEZADQm9oQZiuRHJFojyB1/0poyMNqb5Iai5VvQIr2ITWCzPcTDpCNNTMtha7jHOM4iVqs6g1eaDCWX1YXDNkgToZDV1AQKdUiLKKqE+2a8RLkLLbVQwzH17orGLCKdpTyBP/gWk9TtfYdAy3oEB3Brbuji9TRMI4zuInc=
Received: from MN2PR16CA0038.namprd16.prod.outlook.com (2603:10b6:208:234::7)
 by MW3PR12MB4396.namprd12.prod.outlook.com (2603:10b6:303:59::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:41:56 +0000
Received: from BL02EPF00010206.namprd05.prod.outlook.com
 (2603:10b6:208:234:cafe::60) by MN2PR16CA0038.outlook.office365.com
 (2603:10b6:208:234::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:41:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010206.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:41:56 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:41:54 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 08/45] drm/amd: Make SDMA firmware load failures less noisy.
Date: Wed, 4 Jan 2023 10:39:57 -0600
Message-ID: <20230104164042.30271-9-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010206:EE_|MW3PR12MB4396:EE_
X-MS-Office365-Filtering-Correlation-Id: 68544ddb-3e05-4e73-464b-08daee7297ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pDX3mlN7x8hPJFWWuHjJcAiu46eknhvw80OgHqHiC67Vk6+KVKgQzPw8UEjSYN0Cm/NZc1U8g9EOwzJx92DIVkeEQdVv9iWqM4A8I3ko63+cnwSad1MA8UmN0RZvqugrjM7UroqhydukXKhgMNATBEdXucHAL5kIaBPYKLM0rMaOkokoZkKUk2oAV+4+pmz4+jflLzmeMpPKI/0Os0dvXAjiGjhB/0QOJSmGB3ORhUeKRIF0u0dqKW1YaiMudufPTpZssBhHvLJ1WpGGNzdsfi7nV/aHw8q0gTuSsxm99NqNuhDpPZQYWrbPc070Tnmz4MnM0hsR/bnL6TZ2L/HoWj4f23C7aIjzDwoGgRS//DcGWbeH2KSHTp1w7qvg3j79Dr7TItYmEkBkJLkz5v+BpQeF/sGh0IDQVLgsBdyhTssy66Wmlp3hTkEb4P8wc3ELH2uEtmk3zsYv0D+z3AfjJ3MKjV1dhZuB0lBuWDh8tlPm7X4tYxY8945cPWESBXfYOPAcv9jyK4GWhTOe49VHmME2TxWj9F4czrnphCz2g8HGz1XHVIK17/hycNijWoy1LZGZlgMQYwqzGr3aU4KGEe7eTSvK/YJrkptoHagdCbcmqc8asT9MRpfcGxGPvVhMPdLwJUpQN6PkXBY2WaznlWMUdjCHVpW7MaUNA4rsxmE8M0WmlJHRzrLWuXnPGB6euQn9hHuLK2lJQie9oTxuSrPt8jlrHipOo8wN4hqjZf0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(2906002)(5660300002)(8936002)(44832011)(8676002)(41300700001)(4326008)(110136005)(316002)(70206006)(70586007)(54906003)(478600001)(2616005)(186003)(16526019)(82310400005)(26005)(40480700001)(7696005)(83380400001)(426003)(47076005)(336012)(82740400003)(81166007)(356005)(1076003)(86362001)(40460700003)(36756003)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:41:56.6438 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68544ddb-3e05-4e73-464b-08daee7297ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4396
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

When firmware is missing we get failures at every step.
```
[    3.855086] amdgpu 0000:04:00.0: Direct firmware load for amdgpu/green_sardine_sdma.bin failed with error -2
[    3.855087] [drm:amdgpu_sdma_init_microcode [amdgpu]] *ERROR* SDMA: Failed to init firmware "amdgpu/green_sardine_sdma.bin"
[    3.855398] [drm:sdma_v4_0_early_init [amdgpu]] *ERROR* Failed to load sdma firmware!
```
Realistically we don't need all of these, a user can tell from the first one
that request_firmware emitted what happened. Drop the others.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index f8e4a52ab67a..35b79eeb5f09 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -280,10 +280,8 @@ int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
 	}
 
 out:
-	if (err) {
-		DRM_ERROR("SDMA: Failed to init firmware \"%s\"\n", fw_name);
+	if (err)
 		amdgpu_sdma_destroy_inst_ctx(adev, duplicate);
-	}
 	return err;
 }
 
-- 
2.34.1

