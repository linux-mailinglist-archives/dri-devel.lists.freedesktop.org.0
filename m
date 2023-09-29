Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C47BF7B3B53
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 22:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7481310E1C1;
	Fri, 29 Sep 2023 20:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF2A10E143;
 Fri, 29 Sep 2023 20:41:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Am7JE/nvCSZjc3TbMWvb49Fkg5cdHDgK/TdSp3ZeZOMx7POzYIfzhkN/QvwHdKIeOwC3EYcP6LMjSGgd8VE3UuKGA9ng0HxfXYJgq8RGfilUqQ7mf11p3+8qIXDKdIhn4181nKsVWY1zBDXZ7JihMW+bpKdQtuC9Dla9T5mEzaZvgu7B8EJ9mjFslw24Nfa67fTNc5I0r254wxXo3wYOE5S74DH6xOlcySlug9qnQlFo/fgF8ZMX0upWoJT7aT2XgwdZ42x1boR3pKvbYZxg/WX7aPeNW39IS6Q7ZzXlUe1XT1ZKC+YU6Ex/24GQKWaISuYczEMMQ0pV2SyU0ofZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ha1fw9Mexrwi8cpyJyXk0/iIi8HzKohSwJdk8P1G9YA=;
 b=UjpQFTd8T1WF65lSpROGxTm/hKBiAovAS0r0YwZGL8KUnpNQMHQVFSwx3PNBtpMJTLzOMU4AR0RvryYRd3576Y7lCM9fk1pFEBnhsmqADfC9ieT0Os9I9cT4776HywOglhA9186wMslrGS56rnLj4CVS4AYiB+u8r5VVy6exlltE4JvFvKC0bm3Ix5KecJdMgVYyAxwvXRrucOjjmCszf8kPUwAiqOxIIsOWsAzL2oNQG7uja11+VW1m7eoUZXdM1GmHfbEE/AKaG7BtiZm/nK1vrEsXUtupWiQOVxPQcE5BS/+b+3iaIF5dO+X4owcHtaSMRK1OIbEgsg6oQfG5pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ha1fw9Mexrwi8cpyJyXk0/iIi8HzKohSwJdk8P1G9YA=;
 b=k+pDajkqwFkxLB7RqCqKpr2Zq4QTOnO9f0hjXX4Wr7/y1ysw0mBeesLk21ErYwaB7zgVftv3lrTiCEusnHe5qBwpQWi5WsJx0ioNYNhncKE+l8CYXlJd1Ii49ixFIxiY+q9VHrs9hG4nxhk538CQDBdwkqJz3UXtxuwcpNUw1hM=
Received: from DS7PR03CA0099.namprd03.prod.outlook.com (2603:10b6:5:3b7::14)
 by PH7PR12MB7188.namprd12.prod.outlook.com (2603:10b6:510:204::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22; Fri, 29 Sep
 2023 20:41:36 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::3) by DS7PR03CA0099.outlook.office365.com
 (2603:10b6:5:3b7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25 via Frontend
 Transport; Fri, 29 Sep 2023 20:41:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Fri, 29 Sep 2023 20:41:35 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 29 Sep
 2023 15:41:33 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] Revert "drm/amd/display: Check all enabled planes in
 dm_check_crtc_cursor"
Date: Fri, 29 Sep 2023 16:41:17 -0400
Message-ID: <20230929204120.120795-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|PH7PR12MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 36324ba2-9d4c-4980-3f0c-08dbc12c7909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3HPZGcGQd8932TC7/xetc8aHHKXOu3QylWDZOnsbLnrPaFJOTAyeFq6UlOvplwOS4+OE73qE6gt4HpWTVwTzCWfpLOUdHGog31PDx97L73NSMxugSYWGWzVt8jejumYu4rC7/cQtifIgYZwTSs2sclbNEQnVMcm3GR7CWg+IjpzOVpNu4/V8X3s32l6pEehvsd3HVhxMBHIfi03VWFoIUInsmg9ZQ2BM+YSJmgFY5WE47BCPhSBgkdFCav7tXj7e/a91iWLIOtQC9qQyPZyX9z6Flt21H4HwTx9fQd4bQg/4Zu6EQu4y7YN0C/sjhnGH3Q0UfZrTUcqzXS6nxp0owk5td9JpfsQ3nCAk2pY2Cyp8S63nJIqB8gDctxlj4ssXvx/w3hnJegCj3Mfwvj197yqWHdlAFGz87l80kn0RcfLeBEIYXecYzu1q/ahFR/VgZYdHyCPkOIw87ga49vFnojMKSedYz8p9sex4O3kgdqu0jS9S7O5a8tsDImY/jLMtPv5HZoudMQaEC/uY+I6L3FlIav4npynNQbYcZsYyG/ePlo9xX4ul5SBiCraVVIzBX/8tpzfKdK7kMoZ2ALkCfv/9+/eDaVRpTL9EINP6Y+y3zlf3EO+8hNeZHUMFyssOiHVRZ1G9/5kXeH2wBr7azy4xIqT6wDq4rO2Itlw6RyVmqEwuPhUxS+D6YTni/3zuD+80LrvWGGiSLdPMVagdG7RNUskV2OES/n7iXKxhiThSBO12fUT2FbaX/vpu7dmoAKFUid4K4AzLpWP5XG9CA2Iep9z0EYCFhluP6fpoTArKknnRTOMZOc+Fr1lswFkZ
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(1800799009)(64100799003)(186009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(40460700003)(2906002)(8936002)(44832011)(2616005)(426003)(16526019)(336012)(54906003)(6916009)(26005)(36860700001)(47076005)(1076003)(70586007)(70206006)(316002)(83380400001)(8676002)(5660300002)(6666004)(478600001)(4326008)(40480700001)(36756003)(356005)(81166007)(82740400003)(41300700001)(86362001)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 20:41:35.5646 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36324ba2-9d4c-4980-3f0c-08dbc12c7909
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7188
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
Cc: Stylon Wang <stylon.wang@amd.com>, Ivan Lipski <ivlipski@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Qingqing Zhuo <Qingqing.Zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ivan Lipski <ivlipski@amd.com>

This reverts commit 45e1ade04b4d60fe5df859076005779f27c4c9be.

Since, it causes the following IGT tests to fail:
kms_cursor_legacy@cursor-vs-flip.*
kms_cursor_legacy@flip-vs-cursor.*

Signed-off-by: Ivan Lipski <ivlipski@amd.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 32156609fbcf..49ffb4d6e9cc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10290,24 +10290,14 @@ static int dm_check_crtc_cursor(struct drm_atomic_state *state,
 	 * blending properties match the underlying planes'.
 	 */
 
-	new_cursor_state = drm_atomic_get_plane_state(state, cursor);
-	if (IS_ERR(new_cursor_state))
-		return PTR_ERR(new_cursor_state);
-
-	if (!new_cursor_state->fb)
+	new_cursor_state = drm_atomic_get_new_plane_state(state, cursor);
+	if (!new_cursor_state || !new_cursor_state->fb)
 		return 0;
 
 	dm_get_oriented_plane_size(new_cursor_state, &cursor_src_w, &cursor_src_h);
 	cursor_scale_w = new_cursor_state->crtc_w * 1000 / cursor_src_w;
 	cursor_scale_h = new_cursor_state->crtc_h * 1000 / cursor_src_h;
 
-	/* Need to check all enabled planes, even if this commit doesn't change
-	 * their state
-	 */
-	i = drm_atomic_add_affected_planes(state, crtc);
-	if (i)
-		return i;
-
 	for_each_new_plane_in_state_reverse(state, underlying, new_underlying_state, i) {
 		/* Narrow down to non-cursor planes on the same CRTC as the cursor */
 		if (new_underlying_state->crtc != crtc || underlying == crtc->cursor)
-- 
2.42.0

