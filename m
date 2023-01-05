Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A6265E3BE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA9410E640;
	Thu,  5 Jan 2023 03:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6A010E63C;
 Thu,  5 Jan 2023 03:44:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AB+yBme+XTxKTITOUf0L+yrfPw5hMA+fySTNbRwvRrPnjRH9sHc2yneRMJS+QtfGs5IqRmRhAzqx4qA2AMM3TCeu7hzaeHx83U5e4gxZ3oeaOEPWqzx54ltJdK+lNrQFxTmH7yLCOdMu6wQOFWA1RYl7492eIoYDf2Skas1f6PfwdnOAUMkasXiENynH+ICcqLtLWjt4DE/EZvIdlOTOhyu5WY/cGjt476XZsDlTz06VLyFY5upHzZp7GMTTB2077mqm2nEf7pQzY7KyROyzuvRj0ZMVI5tsRzYDwocyEW+Q91HR7jDXsE4fa9Z6xhMy0ImSIUneZIOd60bWZZnmmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9ClpW4QQmZH5m2aD6czd0RXipzqNaG9eBrBrIktomg=;
 b=Pg1L4FHhLGKAWWr1SWkVo8Z/tB3SURkckORC4jK27V1raAdMfO38U5I/ZLOgYAs8yFjWSmNpFfsXEf/CyGhgUzS29J8RI2Ksiw2XgBrIX0QjTRuhpYNKj7C/RfmMcHQqjWnxYx7S7jkOiXzO7hxzsJ7rV6lK/vP1GVy6IrLkIbilOXpt1wYQoZma7ZoHGjEBewKHvavN734fZ8/QCqvqDGzNnWeg8erm7juxQWPHPYrezZQZANraaK+NYPNLlamKn1vh1UsgGRyud9sUSwI56UcQJ6rhwXxxccCeAQgK9L0qsrTeW92JDQBENEzb6rS1HKXAq+Laf7N3E1YesvMrxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9ClpW4QQmZH5m2aD6czd0RXipzqNaG9eBrBrIktomg=;
 b=J/S82T0jMfpo7YisL6lS/e836fOpGYq6ZlDaXX8uE8+aDHxMpqLeYvsbZp4/dsrglzHWb+QXat/bmkaFtgCX9N+DSwgfp7RgmCJhmUCxmF194ehj8hQdq0Ew0yYfvcVz2iWwQmBZotX3rd2x8sx1rWEtNzLe/iKlSBZKov2QCRo=
Received: from BN9PR03CA0086.namprd03.prod.outlook.com (2603:10b6:408:fc::31)
 by SN7PR12MB7371.namprd12.prod.outlook.com (2603:10b6:806:29a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:43:58 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::77) by BN9PR03CA0086.outlook.office365.com
 (2603:10b6:408:fc::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:43:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 03:43:58 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:43:56 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 04/45] drm/amd: Convert SMUv13 microcode to use
 `amdgpu_ucode_ip_version_decode`
Date: Wed, 4 Jan 2023 21:42:38 -0600
Message-ID: <20230105034327.1439-5-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105034327.1439-1-mario.limonciello@amd.com>
References: <20230105034327.1439-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT064:EE_|SN7PR12MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: 8369df65-9b7a-4c71-fd33-08daeecf13c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UHXZx66UKXF4JS2617CPH3yboINOpnMByyrrkQfxnMf2dBBCoSShLYov8UHNUaqwq9iJpH+nfKVhq1/A/wEsM05svq4HSjkn6EtPJHkTfOw07N8TAagVj6AMKFzeUMomzwhCrLAVWYwKHt1whTN1suo2Dr99KOCiktguqyaVdsP1gVRUFOuKU5JHY6QPOor2l2ChH/kc32f1r5oSGmCqHHgDXhQy0deaWFdQ2vGkkprLFRpRz8c+5ncV9OtpxrKBBcc5eK9q6xS5OUOQJU1+Gr6/Xm0U/Df6+Kqz9PJwGHdmgwKrpTTglZ9jSVfuzx3niKdSFpFyxZJwaUtg4EadKZh5a/AVYQyDAPkji3z0vQGjPMVLOWxqFMmYnhI4hv+598mVD/vAceBVPIvDxkGPa09eUgacUhLqJ84fQn5P5RMWx0KGEtVe0bO6pbs/GO78YNJrFjGo2TRiDGqC7OyTGn0hBqTIgGMaed+UR7k/EAMcLRv2ZPjti3keUN+CqrA6Onhmk0Ne85s05gRlqf9bpxXx/wl23fImbQuZLHsSbNfSCR7AVS9RVyW56+TIjxCmTRjXGPBX6g1hQniJ+e2B1wMDdqfoYfMu4pDki2LPllirvQzs0ziCWkYiaQxdkXddP4WWnkIt21FfE+4PmkRVskwFUh3LdVR10I6s48rYpxl/2mUN6Aqo6bygHqUoxsxnLNuG7FKjsd0a7Q3/wKCsKfBbmBuKeoFcrSLEdRx3LmS/R+w04xx5vP5fzzElY/RZX95cqfHlolF7FgdAzcfCcw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(70586007)(44832011)(5660300002)(70206006)(316002)(54906003)(41300700001)(2906002)(8676002)(4326008)(8936002)(478600001)(36756003)(110136005)(82310400005)(36860700001)(6666004)(26005)(83380400001)(2616005)(1076003)(16526019)(47076005)(426003)(186003)(66574015)(7696005)(82740400003)(86362001)(336012)(40480700001)(356005)(40460700003)(81166007)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:43:58.3220 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8369df65-9b7a-4c71-fd33-08daeecf13c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7371
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

The special case for the one dGPU has been moved into
`amdgpu_ucode_ip_version_decode`, so simplify this code.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 0ac9cac805f9..506a49a4b425 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -88,7 +88,6 @@ static const int link_speed[] = {25, 50, 80, 160};
 int smu_v13_0_init_microcode(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
-	const char *chip_name;
 	char fw_name[30];
 	char ucode_prefix[30];
 	int err = 0;
@@ -100,16 +99,9 @@ int smu_v13_0_init_microcode(struct smu_context *smu)
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
-	case IP_VERSION(13, 0, 2):
-		chip_name = "aldebaran_smc";
-		break;
-	default:
-		amdgpu_ucode_ip_version_decode(adev, MP1_HWIP, ucode_prefix, sizeof(ucode_prefix));
-		chip_name = ucode_prefix;
-	}
+	amdgpu_ucode_ip_version_decode(adev, MP1_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", chip_name);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
 
 	err = request_firmware(&adev->pm.fw, fw_name, adev->dev);
 	if (err)
-- 
2.34.1

