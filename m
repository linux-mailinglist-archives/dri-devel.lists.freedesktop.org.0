Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B77842A51
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 18:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20ECB10F933;
	Tue, 30 Jan 2024 17:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F3C10F93D;
 Tue, 30 Jan 2024 17:02:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g33tWUehh0hMv2DxG05eHMVFrjf0F0NcRHN0CeNDGHEMO5CQJBgZLCDTCQh19HBWrMIPi/auEKIJhDw0cmbEv6NZl7ObG8yXBxApGtDzOljjN17H+tj1g+q27g0qVAblPqpb7SaE++KEVHkPrT7bt/iq/uVA32t4Oj6EylwJa62IXSYos9T7+2qSlyAEIerJT3twI0wE5+VAyutibcwwrQZj9vmBF6/DrvG34J1mCVhZAvyT+1ekSUiOVN24cUqGxwQpRLeKJJl1L7ypwuBEZQmi/Ea3BqB5JDDO6gY77/o7zPPg3h9hfj96I/uYAvZcK/QpJ7LD0GWOhCwugXGNXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESIWDLAIrrDfzwok9c5tdJAbhFor14fjd5pWlWW32kU=;
 b=XaqzUxBoCkbW96xLlkqMuncOlVgZ+Zu/hDhbjolNOhpwYOZomQS1AQnLztq7nMssJF4a98vNnHnqRq9aokg5NNq6a8HlkQF8J/Pa0ctsCl91ANRcfwgU9EUIUUknEzYKN+IiCTAasGFwKXHCcKljRad2wzSCvHfoqDZCrITRMAXSDniG8eCRZN4FH5Wpf8Gv3/+xnSzVPt4+Fo9VV6PlB7hVdvnV1cwAI+zcJ+XuA3v+oHgbLlxBSRGSAneQ0e/5GmexyYtOIe7tJY2fSlq9mTgz2JEnMyvVqkWvvtN5xmMXD3iBxMV9ovsomqcEh41Sayf+nNw7tjeBqDNutULf2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESIWDLAIrrDfzwok9c5tdJAbhFor14fjd5pWlWW32kU=;
 b=Os/YC/pJRMi5u4END/HlRfh6LhHnbEfl9gkLmegQUc3RfD1MQZhbUMUtLruhyt3eEih+j+mc51D9rZzVFPJfu0MuZ0mGEXM+rf71IqWkRIoYT+gEsCQdLGYJdNJyqVoHXXpNtNwj0N3HGEsvb7v7P3jKzkz/utNzdloCnhs0xlo=
Received: from CH0PR03CA0357.namprd03.prod.outlook.com (2603:10b6:610:11a::6)
 by DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 16:13:28 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::2e) by CH0PR03CA0357.outlook.office365.com
 (2603:10b6:610:11a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Tue, 30 Jan 2024 16:13:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 30 Jan 2024 16:13:28 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 30 Jan
 2024 10:13:26 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <tvrtko.ursulin@linux.intel.com>, <daniel@ffwll.ch>
Subject: [PATCH 3/6] drm: update drm_show_memory_stats() for dma-bufs
Date: Tue, 30 Jan 2024 11:12:32 -0500
Message-ID: <20240130161235.3237122-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240130161235.3237122-1-alexander.deucher@amd.com>
References: <20240130161235.3237122-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|DM4PR12MB5230:EE_
X-MS-Office365-Filtering-Correlation-Id: 2555c330-cd2e-4cca-6a8f-08dc21ae6534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SW/20DUSdYbHA6Vn2oLOECz/iJ1zZf73aCITWVQXCnUH+Pb6O6hNsqD7ftOiDzDIVOPUOUxZn4NvGGsjCSfJ/tdK6zHVx5OV92TgnAjr1eLjZ/1l4Hu2RpWqFv5h6tY8b0o1dTBxmjK1dr1usyh9+i/th1sXb9XnQiJS8Tolo8oXeJn9Q2c/4P0QlpqJPGxkltRhpomlh6HdZDuQ4jsZoV3lB14vQjwi+16yUU8gLmn9YiETphVbCYEb2kBpB6ZYqMO/UXnOLXd2Ku4M5BaxgmGEzyiuw0cA963FW2W/T0/17uSCyrtuyZ8L8V7LLTa3kDafZDDFqgTHqlX3HayjAHkifYPloyEK4O7HlKjT5GEnFRInspBIp25lZ1Dd1X3V8U4UEsQ1nr/za4TAdYnpNtQOxQLTDXNUdpxcvvEOybuq+x4tUz34EEAJqd8xY5BfsnBNV1jFLp8AuH2/qHw87dbgCohSIPfLheykl5SQiPQD0KNobOj3n1elwy+zrblzQaHW1mHTVaqfsWHIpaiimB+oomiE88Nt5OwSAg+MQdeyS8eD2citVnkORnN+m3ofsmDHI+3mhcFVtBvyRbvWZv5BzXGK2/4h0lWtScXWbfMeC56pRIMioQiHxBqfCg4ImkjEP1dJGL5LqbJJ9ZJkZc526XVpZ7tAiLqubhmVYRaMHX4B9sj4K9QGgCbBFKQUqKExX1/sZPbSs0B5AataD4Mv3jz4e7pGbGOSs5zccAUQstQxxMVr8HZH6KqHfXaKNmnLKsirFKPO6AYV7HeR8g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(82310400011)(64100799003)(1800799012)(451199024)(186009)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(83380400001)(86362001)(36756003)(356005)(16526019)(81166007)(7696005)(1076003)(47076005)(36860700001)(426003)(2616005)(336012)(26005)(41300700001)(70586007)(110136005)(54906003)(2906002)(966005)(8676002)(4744005)(478600001)(70206006)(316002)(82740400003)(6666004)(8936002)(5660300002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 16:13:28.4946 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2555c330-cd2e-4cca-6a8f-08dc21ae6534
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5230
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Show buffers as shared if they are shared via dma-buf as well
(e.g., shared with v4l or some other subsystem).

v2: switch to gem helper

Link: https://lore.kernel.org/all/20231207180225.439482-1-alexander.deucher@amd.com/
Reviewed-by: Rob Clark <robdclark@gmail.com> (v1)
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/drm_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 8c87287c3e16..638ffa4444f5 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -913,7 +913,7 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 					DRM_GEM_OBJECT_PURGEABLE;
 		}
 
-		if (obj->handle_count > 1) {
+		if (drm_gem_object_is_shared_for_memory_stats(obj)) {
 			status.shared += obj->size;
 		} else {
 			status.private += obj->size;
-- 
2.42.0

