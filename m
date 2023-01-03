Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F19B65C95C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC0C10E3ED;
	Tue,  3 Jan 2023 22:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C7B10E28B;
 Tue,  3 Jan 2023 22:19:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2Wea4CkgkXLICtwj7uDrFpBl0QzyNcr+7wSlpPPO/0FcTwRMTlIdSA7hwctdJEuZ6LoeCuDZxZRt3VfogywkLYUS3uF2gaFqWIYm11UU3XmqOzHRzJv4x8D7ipwQQ/TinyYgfY18QwuREnXRpElmeA1wwSnIdRJuOiLr26hsWFFLRJQX75KdVnHKcKhDymzCUoa+2h6we4Pcj28rpZVuWqGnaZ6l4Jkx6tYlWdQXFGFmitv0MRQeqtWetZpj+XXsVoZBmoVxAgzaM20hvyrbsCDJGh2qvMp8TlEk7ppihDLXDV6dhoNHxegPYXnE7gWiO+aBl+ehVFn5erSC/iSKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuXZdMeRqoak+9plFioVjIaL8ECr/SlKwMHHMVCDnjA=;
 b=PN4VFIQztL+ZrDEEjwKf4Rm6D9Zv0ho6KpUWggsBkz/tVswJk8eYfYT/jTB6p6SwD/tt8uDywKwpkbrICu0tHQ6tBH61ZyCT+IqQ5vpNLc4N03cn0gSTueXzW3670GYhAdRd9m8tA2ozkV2+jDtREX8wQI0jeGMmrTAAxbSqfgjuyI1OEnQ4xbcivt2J7hEhUufL+xmvd6rvSu/nQJFRXlziWzULHzKU/G6vvAzZ9X6tpSV9hrJwOakJhKhL66yBP1bEOG7NQo0tVtQH/BQTqzhvhpqDLSDIoSC34TnDOdpkFCMx9jOCpLjcXEq3BParzyR21XxIPXQ3Z5lXA04WTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuXZdMeRqoak+9plFioVjIaL8ECr/SlKwMHHMVCDnjA=;
 b=mZL8cPI1lmzIjWkQD91yQkWxDTfRxEbHr11jth1L0X6BfaYTNjELCse9zExFerbukU/YYvS5IFDCIcTmUO4SY7/VlTTQExf1ws5LjNVF7tKbY0BxR0lzspTZYubX9xUbu1zTllaXeF2Rm8EZ9wYKjasLjdvOkCsLAWXoTDUeFBk=
Received: from DS7PR05CA0048.namprd05.prod.outlook.com (2603:10b6:8:2f::19) by
 DS7PR12MB5766.namprd12.prod.outlook.com (2603:10b6:8:75::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Tue, 3 Jan 2023 22:19:36 +0000
Received: from DS1PEPF0000E651.namprd02.prod.outlook.com
 (2603:10b6:8:2f:cafe::9e) by DS7PR05CA0048.outlook.office365.com
 (2603:10b6:8:2f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E651.mail.protection.outlook.com (10.167.18.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:36 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:35 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 08/27] drm/amd: Make SDMA firmware load failures less noisy.
Date: Tue, 3 Jan 2023 16:18:27 -0600
Message-ID: <20230103221852.22813-9-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E651:EE_|DS7PR12MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: 780e58b4-cbbf-4bad-5f53-08daedd89931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fr4XtAUgzXT0NdAVSha8jexVaxn+YGzX4/G1A8RqjIZnu4CaOjAbUxqCdK0M1wnn7vrt7y7RwlmSQIqN3jaZC0Y9rtzWWeFkzzeJK42ht+mU9vAkmEpVD2gi+Ymj6pubgq7VIwOU6pfPVfgmU5IvT86AJWtbVqBD6He71PhNW+e54fVqy2JqiJvrR+M6HHZKt5GCGUWyl3mbycoeBGNoAk4Y2SAfYrD31NL0MvTZB0NNflkkRXz03g8rUJwPOKyYaCOGE4RKI8GCVTvvx0Mx1wUZG38am/3HzfHlTrLBckkypD8QI39RIhdMge3nSMOs6VTM/0e1Saolipmj4xKNeHPYQsEjTYhnCSaX57LE5hZYrxXbRX40IyEoVxvoV1ag9+Dmr5v0qqW1PmqLZfog+mZG3QR3nicj0PRYzpCciLv9zAb8AiyLQGGK6IVXSyN+WajjkBRi4lAcwAiTDUBOVuLLCfWSE0h1M5U+vt0sSzphF6Dm+YMBTZPZGqMTNRvLtbSkT3wsrN7Sw7UX1dNHmNdh2dHPv45VxGreeM04fjiEYag/ughb+7xd/vJHbcnfRu5sUVi/jYIVYlXPB7gIoephhAScS405xLQuzpuZYyY8s4QvKOSNp/zA2C8YGpptKvqXRLDUeKuw+mH9YbOOIKI26Ksv8pRH/BtKdwB1Q11cTRCTBgnRCYxNenFrfbcWaWTQmPzcV8EYuUbIcASJSB2enFS5iUJoZ6wpZAP8XD8KIvEhQAycGXV2nSK+8Q6WskrfedX93HeMDv5UE7LyJQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(6666004)(478600001)(110136005)(36860700001)(82310400005)(40460700003)(86362001)(82740400003)(40480700001)(81166007)(356005)(47076005)(426003)(1076003)(26005)(186003)(16526019)(2616005)(7696005)(83380400001)(336012)(8936002)(70586007)(5660300002)(44832011)(70206006)(4326008)(8676002)(41300700001)(2906002)(316002)(54906003)(22166009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:36.4277 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 780e58b4-cbbf-4bad-5f53-08daedd89931
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E651.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5766
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
v3->v4:
* New patch
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index 83e8f0dae647..f052173ef1e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -277,10 +277,8 @@ int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
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

