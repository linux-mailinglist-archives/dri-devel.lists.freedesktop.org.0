Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE14B669DCD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BD510EA47;
	Fri, 13 Jan 2023 16:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9782510EA44;
 Fri, 13 Jan 2023 16:25:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rs0EEZNmlTG0LdTMmO5kTXuXFZ73GAZYSMOk8/gwx9ILLAc7/8li5jdd7rFtKOmcFfNggVebn/8R+QxWWA7ag4z2hiTYx6pGrYIvLK6ucjpTZYh5e7PWnlBKLlujmCXgXQQjrhP1W3FGVs3n+9FlXXQGwnMafEDc5QfpHILfqUt7BpNCD3XVEiNQULhwIpYo5+6dOJGEvibKnPyqdMqlScIrrPs4nB49LZdT6hxmDkhDKGDdyC/ynRhjynDMPu5HrCQ7uAs/agDnW7DZUoKwGQmTpQ9pUksOpxOjeF/UZ/e840bH0XM0vTSiRt2U6RlwK5N1qhfrY1zu0AoUHKvphA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZpXWDPb2QhfZvSYhbPInh/iG8q4NI+E5FI8KbI+94A=;
 b=bWKk4TujrD5g6D5ObOGeEDN2Z1OQUV8g+kBpGiJrtU7+aX1DHhnA4enB7cospltWPzwwIOO4tK6y0+HJywAdknfoQPvKgaUvX7eknzknM4Nl49gqY9gTCMmCFLsTKtfJZxwBNFsRU9S3qFUCBxVlCcVLTcTyzT7jjONRGJhmlWgk6lCiEJcioV6knS+krAK6g/SY+PRU+Wep5xfu1plO+m5xadGbCbUyr2FNrqoIxUKBJoV/bNNFvKsq1HQbd2LWpMoMY3eAQiCWvB/tJsFiXUz+4oUFPoom0f3aeL1b7oaiZY70N2lvIVV0kQIBMs9mnAmuvtxmB8EUzUaABjhYJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZpXWDPb2QhfZvSYhbPInh/iG8q4NI+E5FI8KbI+94A=;
 b=1trgcTJvGvo3b3bavkgfe7iTMCVFwqwnjRl8ZcjtAYO2XtJW40O7ZocRDkE/cGjbP+Uje2JlojuDeNuQe377PWRmcQ/u1zm2wMjMcNElaYwtfrVNGWZ1p4BWzo2fU7n0a5sRV5Sc1WhpBtKD39U4OQHUyhEA4MTLawGuJKBtAVc=
Received: from MW4PR04CA0384.namprd04.prod.outlook.com (2603:10b6:303:81::29)
 by CH2PR12MB4037.namprd12.prod.outlook.com (2603:10b6:610:7a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 16:25:15 +0000
Received: from CO1NAM11FT080.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::6a) by MW4PR04CA0384.outlook.office365.com
 (2603:10b6:303:81::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.16 via Frontend
 Transport; Fri, 13 Jan 2023 16:25:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT080.mail.protection.outlook.com (10.13.174.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 16:25:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:25:04 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:25:03 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 16/21] drm/amd/display: Don't restrict bpc to 8 bpc
Date: Fri, 13 Jan 2023 11:24:23 -0500
Message-ID: <20230113162428.33874-17-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT080:EE_|CH2PR12MB4037:EE_
X-MS-Office365-Filtering-Correlation-Id: 895601b8-b17b-47e1-09d4-08daf582c02b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x0bxVXR04yjjRC8ObOKobZDJSt6Q7MD/XRsIxggtNr11Vry/sOhw9UxfKZJE3R9Uxy1oysMux+uRA6uaKFkknOK+lM9MbGiH8CB4BySaVdXqr5NVkOAaWoeu+pB2Y8e/XtPgg5KKCAu4gjtDoERfGjziNbaQ7PSrbEOfzQ/7K9bNn4jV23K8DNpCBa6dsmdBSeCPWoktQfb3L5i9X95ej1XaD/HD0zK3hE8VFCpuRHXIlQzIVgPVkBQS8Mggdun9/Hov7SctpC2yOVCAeJGoWMsR5FPsNmdmTuhru6Nd0cL2G8ZQVhrpU7Cnb8gl/AGIP2j5SecN9B7TvSMjwHIyzyU10TJJfx0j3UpUAG8ZUzQ8CkOGklwjuPBMUpp29yiOIEVaHyX5Do5gckutzcBWJTkFUNwCo665zdNKepnt51Vv3FfH1qoDK3Iyc6Lv+bnITrGqZuUDWCIr/UXNDECV9PgFeKTpK8j7VNMlTOHNyWlXcEXo2L39129j+yOQ1J8oqjXydt5gckVhPKNKbvsT0kR2msU6wXGXC3bIOalJIiM2Apk+Q1LsDEdVAKgt8t2E1iZNFolW5mjDoYYCLcY0nVYrCReAzCMth7KVKEURLkeHmosUxOt5Hz3Or/kVeahWZzxjypGA7gq0lJ5UrheP3/n61B4mP3pEfSlRhEcfkjW5OIX0fjbYU7SkMJlZguEF0spXgnLImBFAgGbLmNZUsLrnACPPZcwx2B8r4KrN7W8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(6666004)(36756003)(82310400005)(26005)(186003)(478600001)(7696005)(82740400003)(356005)(81166007)(40460700003)(86362001)(40480700001)(83380400001)(2616005)(426003)(66574015)(47076005)(1076003)(36860700001)(336012)(44832011)(8936002)(5660300002)(2906002)(4326008)(70206006)(70586007)(316002)(8676002)(110136005)(54906003)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:25:14.3383 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 895601b8-b17b-47e1-09d4-08daf582c02b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT080.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4037
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Vitaly.Prosyak@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will let us pass the kms_hdr.bpc_switch IGT
test.

The reason the bpc restriction was required is
historical. At one point in time we were not falling
back to a lower bpc when we didn't have enough
bandwidth for the maximum bpc reported by a display.
This meant that we couldn't enable some high refresh
modes unless we limitted the bpc.

Starting with this patch the issue is fixed:
cbd14ae7ea93 ("drm/amd/display: Fix incorrectly pruned modes with deep color")

This patch implemented a fallback mechanism if mode
validation failed at the max bpc. This means users
now automatically get all modes that can be supported
by at least 6 bpc. The driver will enable the mode
with the highest possible bpc that is supported by
the display.

v2:
 - explain why this is no longer needed (Michel)
 - refer to commit that fixed bpc fallback (Michel)

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Cc: Michel Dänzer <michel.daenzer@mailbox.org>
Reviewed-By: Joshua Ashton <joshua@froggi.es>
Reviewed-by: Michel Dänzer <mdaenzer@redhat.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 73a98e6e1867..f74b125af31f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7130,7 +7130,7 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 		drm_connector_attach_max_bpc_property(&aconnector->base, 8, 16);
 
 	/* This defaults to the max in the range, but we want 8bpc for non-edp. */
-	aconnector->base.state->max_bpc = (connector_type == DRM_MODE_CONNECTOR_eDP) ? 16 : 8;
+	aconnector->base.state->max_bpc = 16;
 	aconnector->base.state->max_requested_bpc = aconnector->base.state->max_bpc;
 
 	if (connector_type == DRM_MODE_CONNECTOR_eDP &&
-- 
2.39.0

