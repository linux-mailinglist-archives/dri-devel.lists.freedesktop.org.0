Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ECE842A57
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 18:03:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D7F10F939;
	Tue, 30 Jan 2024 17:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E8910F939;
 Tue, 30 Jan 2024 17:03:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVUAPkgfYb3Iqcs53y1KK3o1enYjGZtIJ0psUDXBC/LT3TEcREhzCP7B8du4K6XKaMD0bY2jwj3x1u9auTwPjRPc0DoEufXAmdt1maqxcqJN+Ko3i/m15OtimDHXKOasVumZpo8640UFDiklCVisf/n4x3bokNC15acSOnYhp76FIGGR+i6zVeHd/vSTb9afU1ZegXwjNQQJq9WPVPBNSPFYom+1XwRjoK8AgynqdNBVrFXalNHPVslNfeAHktToxc/FuBxmz8kG0hKFA/98H3bpJ54kxthsrvW2K2UIDlIKobn/42i1o09LCsGVuA7Hq2VldirFqzy332A+eI4w6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMlIYd6LD55A1c0lmDjYN7NhFdYbw2a7qtNk5Td62I8=;
 b=RGiY2yBhEa0kP3SPlcovDFwkTIy6yCIZNx2J4BWIv2wxpc3vAxQyK4btbrDBdBIVECDPEx7NWmCejRyLgpogbX5xhTzyUrhfkVTNse9VzknV2xuSrX2aYmON19udD34lDJWITVCbiskkgD8C9+z7cPGx6B4jSNgPFkIrxtlAB4F6Hm4uZuShmRett46d/w1w+ZqQ8iWFHL0Wv8al197QxZxF5XPTRtqaV6BsBetruL3QkGygyeOJZurT0UA1LqbAMJTyad2V8eLnIpVRI856Oftnjju3sqCnOLMIbEPDOkg4R+8g23TGUCIXJwl8PEnNBxMLdzZLRHPcgDBTR3NOnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMlIYd6LD55A1c0lmDjYN7NhFdYbw2a7qtNk5Td62I8=;
 b=SUVWiXbX3GCaDTBNE9hnz4ZrgLMMwn3SlxjOoJ1gj4zF1cDz6MLeXPRhTritbYmhQvwhjxD+dxjav12xCRsV2fOxGpRue/osBfYishZBTbIZjk81Qizshcrv+qRlJMitrC4fkucA5FeC5ezLj8KFdmV4D3rQjS8LVM1SwA34RA0=
Received: from CH0PR03CA0352.namprd03.prod.outlook.com (2603:10b6:610:11a::21)
 by DM3PR12MB9389.namprd12.prod.outlook.com (2603:10b6:0:46::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.32; Tue, 30 Jan 2024 16:14:06 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::90) by CH0PR03CA0352.outlook.office365.com
 (2603:10b6:610:11a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Tue, 30 Jan 2024 16:14:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 30 Jan 2024 16:14:06 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 30 Jan
 2024 10:13:28 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <tvrtko.ursulin@linux.intel.com>, <daniel@ffwll.ch>
Subject: [PATCH 5/6] drm/i915: Update shared stats to use the new gem helper
Date: Tue, 30 Jan 2024 11:12:34 -0500
Message-ID: <20240130161235.3237122-6-alexander.deucher@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|DM3PR12MB9389:EE_
X-MS-Office365-Filtering-Correlation-Id: c2b86796-6f4a-4351-f573-08dc21ae7bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H+L/RVtgLda1Nj1fS27HYa8WZxCTGyTB/XBE/JhtEFq7Agim4HDgkuTO6Ei3EHZNXxoiJwx4V4WHybOs7uNc/vmRqfQTRDWoOuXo0fiDA0w9/Lrjq05rKbA31Tdv7KGGGxlxLNg6sRnhISmALs9aG3rkwQOT+Ug7NGoaV/6jw1b/jMtIrTh0rtHxrK6VoihipHhsYonB1fRodoLKiZmsutgDi6scGJzKR90YgKJcLyayvEoKu+r1vZegFezytcUaCZlkxlXjScdLVI0kXT+lSJRhh8lkkodBDYB7zFSzIR/CDZsLA6ucPZEh2C0xch+PKF7krmOWCEjyE1CidYi3aFCUelOvzow9yo12gIE4POvujSylu5lrxp2ukfg3cB06GO7HHA+c8TQ1CUegLMMX5BTVtZe1+LKQj+9bAfb6PrLzHf7VUzpOX/7OvrjDlqzSNgEl45gMp9hSDps19+UGM6GHARddeEHns+BdVBmV+C2NJ95m7SXoKD0SdWDKKz6RwzSBC3HdSx6QhSBbfKNp/mKckaEoWwOmw1jeu93ciGOs9ZGyMjYXvcdZ3ip/i7+zIsAoYpMD3CiSeJFSRz3Emn1RvG9StXZo7AIxgjTo1O4YUtNiopI/AfmSmJdbw3qQnM90Z6l2G6OjAX9BYX92WKYPHZUI5rtATgmX+towHPqoDODQUe1toO+DoOVb8MnDAI60YGLNGc94AwccFTjKLUXY09uEYQyzPD8jXErzOKmfcRoBtk555HVie4ha0WeU0cAy+Dl+5zUaT3SohYkMrQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799012)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(1076003)(83380400001)(426003)(26005)(7696005)(336012)(6666004)(16526019)(36756003)(86362001)(82740400003)(356005)(8936002)(4326008)(4744005)(41300700001)(8676002)(5660300002)(36860700001)(2616005)(47076005)(70586007)(110136005)(70206006)(966005)(478600001)(2906002)(316002)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 16:14:06.6663 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b86796-6f4a-4351-f573-08dc21ae7bf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9389
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

Switch to using the new gem shared memory stats helper
rather than hand rolling it.

Link: https://lore.kernel.org/all/20231207180225.439482-1-alexander.deucher@amd.com/
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/i915/i915_drm_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index fa6852713bee..f58682505491 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -53,7 +53,7 @@ obj_meminfo(struct drm_i915_gem_object *obj,
 					obj->mm.region->id : INTEL_REGION_SMEM;
 	const u64 sz = obj->base.size;
 
-	if (obj->base.handle_count > 1)
+	if (drm_gem_object_is_shared_for_memory_stats(&obj->base))
 		stats[id].shared += sz;
 	else
 		stats[id].private += sz;
-- 
2.42.0

