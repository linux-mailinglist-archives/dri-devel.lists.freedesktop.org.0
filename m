Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFB5562909
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 04:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D1B10E432;
	Fri,  1 Jul 2022 02:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A69B10E42F;
 Fri,  1 Jul 2022 02:33:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJdWspBOCFMXM8ajZquGQxR1yNeIBjg+X7SMnkZXiyWf2pA/yRrw5/W/mbxdSZFgVRIZD9m3gGgLZ/VnzX7+kiPya2/X1l41J9N/IY+hyW6VdSFWdVDCD0OJ1DSVfwE44esEgRss9elirzJ1nT69HnpbzuDQ/9dfnoTR25GyO30+huiv6Sic+SgQvw03IjaWvjXSuI+5jhJVb3I99VWDOqmQeZAVSMGAj63SLrG+SO1LV8OkeWsuG9DppvLQDfy1HyLevy/wP1R2N5l/3QKSATG64nshZL2DScpPv25hUWKfcjcDig6huTQK0QeYBuE3geQEelKAIzBtpWHTfjnW9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNgflNT87elPNP2tLJuLiglNSU86pfbDP+uIsZJeDdU=;
 b=mgZNw7lU75hyVDnQXVZHi+vfuwfAHyywyPdddDg61hWb6DyN/PAsyMTB6+hzzJikeFSiTCTGmfCSxXRzbr+Ou3oMh0b5fek16q6hjcyhIGx4G152VsLullfIjtxKNHizsB/E0lkgLzaoG6kyDjI/BhVd11yO4Sd1jvFA/gG2RBCEi3Ldn40qT7Q+ukbwCXl22Sijgh+O0hhQRtJFzTaYVsUFke3oRlOr+FtTRCrJgvqqSEBrBu68OZyhRD+GU7uSnAhgk/KmvUyZyo2v2W5bbGhncVkQWIcjyCAeH9P4jmUnXvf+MtEtDrIMR1J0uMgxPQ5FwWr1lYelkW/AL6hlOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNgflNT87elPNP2tLJuLiglNSU86pfbDP+uIsZJeDdU=;
 b=FFwQZ4IJhtBSwkMGPPdmcdIotGewTDyRIk2Jlfxqn5TID3+nbFVcBbSLRZFcCYRvTjduJSUTSwlGQZGLR04raaJsqGMphAexHyfS79zEjN20y8s15/aKn4OTRyvyZmOXW5b6SQx6EPbfw7sJqJM5LhylDMQIJWXEs53MCLp+cI0=
Received: from BN9PR03CA0221.namprd03.prod.outlook.com (2603:10b6:408:f8::16)
 by MWHPR1201MB0159.namprd12.prod.outlook.com (2603:10b6:301:59::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 02:33:35 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f8:cafe::ea) by BN9PR03CA0221.outlook.office365.com
 (2603:10b6:408:f8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Fri, 1 Jul 2022 02:33:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Fri, 1 Jul 2022 02:33:34 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 30 Jun
 2022 21:33:33 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <mario.limonciello@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 08/10] drm/amd: Use `pm_suspend_default_s2idle`
Date: Thu, 30 Jun 2022 21:33:26 -0500
Message-ID: <20220701023328.2783-8-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220701023328.2783-1-mario.limonciello@amd.com>
References: <20220701023328.2783-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c847054f-3af7-4e6f-bf66-08da5b0a18b9
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0159:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KGHHIwBYWqQ+DFapNshVqmHhHJJ42BH0MlWPsJx5q0cpK17euGJCcRlKTYlbzYHA+DewuhxKvTPN9R1jf48s3dNsWAZi+FHYz2BLixaWK0kKDyU4dAcen6wIRVcxjrf7W7azFUcr4CqHExM1W7KPDqlgVxK/A5r8BcxL5mWoKqSdTKtY5xXdRX2ZQ9e+7nkxVPj/Xwoo8NbvP18YW2EcPAwwMUmTumL5RMivqFPeY62AGeTmJkbw7TKG12xypw8FEX/TzVKgIYYYy9rs3Jbb9zdLEU6LAXvrQ5WmhiG17v1ZujfH9QaQrBNsPsP+tmztumatrZnLk2SzdkkLHpl6rYtTwDjwnMRhLxecoF8PABQs6rkU9t9OLDAvS1fHRFP/q3RRPUvdTGuz4uPQic6n+Xv8b3EgnAs8nFTcexPM8XuMao9r2BR4o0dE49wwFsTsGh7qO7SFZ6njiIKNcv5Wx4zsQtH8O17sGP64kSzNfWxaasTN2acPmWLZkNBqY6McTaNI9wTsswCSbtY+hb43jjPioZGsNxIdUjiRmHB4aURHkTlzkhkJO3Jb9vMTd5gJ6xahGRJ5WnWL+OF2VEszw0SkYPlBKpbGiYgfyTt4Fg8hAdLqFAdd60V+WKZjjJKa5xW70u5I+4b322nVfQGcbyf7YVtvCmVkyBsTJ5ba4Mh2MB0AV6HTfKrXu2lA/oUKkE96/iCCRVSDxg6QYZBPcQU6Aiw4tOSrDuB3Kx+FOxvxhV27v+rnIShaOVvQF9B1fj0/RU6tkZAx/BatF7y+zvLPej0PVknNns7rxCWyIDPslyg3RtSe10moJ+ny3pQ3k8++whWfzqQUe0q7RmctIP6mz5eyE8Y8MwHNXVTgXSZNXoIyiRN3DJ7lfLESOPAL
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(39860400002)(136003)(376002)(36840700001)(40470700004)(46966006)(70206006)(70586007)(36860700001)(8676002)(86362001)(186003)(7696005)(16526019)(44832011)(82740400003)(4326008)(1076003)(8936002)(2906002)(356005)(6666004)(81166007)(2616005)(41300700001)(5660300002)(40480700001)(478600001)(40460700003)(83380400001)(82310400005)(426003)(54906003)(26005)(316002)(336012)(36756003)(47076005)(110136005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 02:33:34.8348 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c847054f-3af7-4e6f-bf66-08da5b0a18b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0159
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
Cc: linux-pm@vger.kernel.org, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather than examining the suspend target, examine what the system is
configured to use.  This should be no functional change, just improves
readability by taking the helper instead.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 2146232c62ef..fc2c6e311979 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -1056,7 +1056,7 @@ bool amdgpu_acpi_should_gpu_reset(struct amdgpu_device *adev)
 {
 	if (adev->flags & AMD_IS_APU)
 		return false;
-	return pm_suspend_target_state != PM_SUSPEND_TO_IDLE;
+	return !pm_suspend_default_s2idle();
 }
 
 /**
@@ -1069,7 +1069,7 @@ bool amdgpu_acpi_should_gpu_reset(struct amdgpu_device *adev)
 bool amdgpu_acpi_is_s0ix_active(struct amdgpu_device *adev)
 {
 	if (!(adev->flags & AMD_IS_APU) ||
-	    (pm_suspend_target_state != PM_SUSPEND_TO_IDLE))
+	    !pm_suspend_default_s2idle())
 		return false;
 
 	if (!pm_suspend_preferred_s2idle()) {
-- 
2.34.1

