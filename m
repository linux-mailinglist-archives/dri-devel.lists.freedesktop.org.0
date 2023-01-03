Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F1D65C94E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65CD10E289;
	Tue,  3 Jan 2023 22:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92DE10E234;
 Tue,  3 Jan 2023 22:19:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Htb3eyLfKJI5M0XMx3H+zRdQ1vsoQidUcxcX7q2PGkBhwzSYNQhPQBI6+gOSrwOAbuqjEyGG9YZUbopeyumci4QdON4LixzB9tWjPalXZPkz7q4SKYVxXv3GzPbIoF70xIDiUP3eEx3EfTsH3n/Bj8u6YJVFegy5NIK3v1J6XyZTGhBZiu0MwI1je5us0YDYcYbh8dKtMcluRVs+VS+56bXhViN6t+PfyUERPruUT+gMhJEPFfwV6WmIYwCOKxLUBknM4VQBd6uUt+kirfrZk3dhpZTFA6OdbvqHlP2+ChuHrWvTA+m2zcLBlsoQt/DXDzMxBWM2TOAwa1zVHx/YmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnnDBP9zjHCRlVY+ohtQb+D2wN4dAle4IebnZiWUt5k=;
 b=hlMj7+m5ATp1ZkVr9D+gb0B955QgKMrzoo9J8PKuSs5q+eGMoh899UoxlwBG9tT6Ki9s/7hRV54NGyz0Sr7I5Loy1j6PnkBe+A8F9VCtyjfVc+FV2oeD3WQifNWAmx3hW3sJPywn59CTj5r5Eg82GZf2PC4nZRG75MwXS0+IZu3M674eVtf5YdvtdPogkfVBgZfFS3FwEbBWdlsngH4Z6rcI82lY2gZ6kO6gSzifwek4mNUuQscxo4bbm7VfQ1rn6xuX3TK8z740a3ErgHFZK+WuP/fw4fXMqg2XAW3MKRI4uZZT/q9hSAArcL2KudJX2kO3rGhqBEa1AiXsr0sLnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnnDBP9zjHCRlVY+ohtQb+D2wN4dAle4IebnZiWUt5k=;
 b=Fo/of6ZRaIjiNDO0wcx1/U1dvej6Ch/iYUGU8nFW9dC/2ycGlxmwiipG7jvCr+PV8Z6O5YmQQMG9sQ7brpGYRn8rHLLtAQf5xvwbNAzOi0rGNIwMGWGFDAvSnqvKFotVo+oWQ4u3duKVYV6BheTlHJVDdf6aMbQX0xiPLTdCMPc=
Received: from DS7PR05CA0103.namprd05.prod.outlook.com (2603:10b6:8:56::18) by
 PH0PR12MB8174.namprd12.prod.outlook.com (2603:10b6:510:298::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Tue, 3 Jan 2023 22:19:31 +0000
Received: from DS1PEPF0000E652.namprd02.prod.outlook.com
 (2603:10b6:8:56:cafe::a) by DS7PR05CA0103.outlook.office365.com
 (2603:10b6:8:56::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E652.mail.protection.outlook.com (10.167.18.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:31 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:30 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 04/27] drm/amd: Convert SMUv13 microcode to use
 `amdgpu_ucode_ip_version_decode`
Date: Tue, 3 Jan 2023 16:18:23 -0600
Message-ID: <20230103221852.22813-5-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230103221852.22813-1-mario.limonciello@amd.com>
References: <20230103221852.22813-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E652:EE_|PH0PR12MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf1c313-0313-4f54-cd77-08daedd8962a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wYyUTMLuGJzftEtFqbq370tGAgh2BVfZIpvBSYmTSyqMfx0fafv/EV0l7aXNuj+ynt7zYI2WAdBOlBYDal35VYks+bgHXUzPfqsO9ZLDsGSYb81dZ5qMyuOpoXRdoHwMkfGdPNS/AP5LnBHquMhKwMt++asVsHmR9aCq61bJz8i91ZnF16TxI4p0PXL8TkTH46F8HkUiC8tH11GkiRluaf6Tfy5SXPLbNomDLKK7OhyFkILBituZsK9oh6y22eWGo59nA7U48C9/hKxIfYn7MVsWXTyjhy97PEjknkKJ8ITX51pkfqHxyFzyeqKOfwmMnNC1++tws7JqDMHhCWpWzOQ1qFiiWmlR0k4QjKYMVZ2K9T2ObwJISdpZkfvbGhGlcjPX9DQhp61+cOKms4hvnpnHoFCVMlibBJStflJ8QoxhH6Wp3sArgzqw1Khio1DxuyMPK5/wwHBVa+xowrQ1KDBrgKkY0wn9SIQ5j0ELPYZuCKXxKiKDSWITOnDhXoV4+iPKzIPrQJSCcBAu4dbqSq8tY8TyfuwH6q87xcHUCCFW8XcULvcPWNvWUZWbvcMSKwjzG7YH2uQqMUsnRx+qftMLQVbHtwDNhmvxey8YkQXeiOTZIQxG06A8lb0OqufJMy5NIq2feSzNP/gtd49iBeW1mZdrX0EZmCO6QM/5TeyaTEuuHakWXWT4V9grrvk9yAIY1QlwTsQbba1RdnsNSduxAM9d3FSANoVoCKBlU2fxaL6PNpxlqnM16WWxEWE1w5H7GxL7/XmTd7dk398nJZx8e6nQ+Vui57Ums9M6igc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(83380400001)(47076005)(426003)(66574015)(1076003)(16526019)(336012)(26005)(82310400005)(7696005)(6666004)(40480700001)(40460700003)(86362001)(36860700001)(36756003)(81166007)(82740400003)(356005)(2616005)(186003)(478600001)(41300700001)(8676002)(4326008)(2906002)(5660300002)(8936002)(44832011)(316002)(70586007)(70206006)(110136005)(54906003)(22166009)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:31.3671 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf1c313-0313-4f54-cd77-08daedd8962a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E652.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8174
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

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
v3->v4:
 * No changes
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

