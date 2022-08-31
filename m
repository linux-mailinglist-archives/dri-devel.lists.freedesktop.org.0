Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE725A84DB
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 19:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3244110E4D2;
	Wed, 31 Aug 2022 17:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EC710E4D3;
 Wed, 31 Aug 2022 17:58:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ir7D3vQIOCBdh+C0KSaHF9EXIqB6JlDrPr+W5drpTarhPT75WSLyQk3VvN2OD7iFBkRBqCQdnTjvOyeKgEhda/7B7edlkppNR3QdooBGdy/aZ4ETcVBAd+EYLrAYnuipEYiQnjiRZv/XgTT5Jyb5/YjpKkT/CZVXHfYFqzHivPSnQ2yanGmajXePK3yUlkjPzNmpu6KN/hihIfNukmUOCOXBXkjaFlxR8t1c1fPo2nb15pB38dbvlsxSECJG7S+DUID08AeoqDVyQW+vP0eGRSQ7Qfpkuy1JjsmUIE2f0EKVlw8mrBgRRb8Ay1cj2lKwHMmBMjkHtUj7UGHJjf3UxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlg/54oCv8aoG0+kt57ZzLFgxTKSvd+uJh2yJem1ct8=;
 b=QvZekJtAzt8XHcYOruXkaDwVZTv5bFNvmSdvvjPzABiYileWLQF66vaMIf1cekpz23KYah8VFeNOeSHed+j3lh//kyMzkPOYKfGmwLTsX9pW9R3VBbgfFfTU80XRnRpR0QSj4whw+H+ZHkMhCRWbzArBpUiErb13H8i76Q0lgVVrCKdg8C3QEw1AG3HiBksCEv/kRH6vU5A/TL7egpo5AXuQ2+v8UjqQboY0wGruJIhwsT7TxZzE7A89GOLw77L+cELVi6Naqth+ykKm61qAbsfQuX3SPDzy/Lqk1vUYZqp3BKlzZcsLpXe/A5s2m9v1QNSGGb7AWE2gpWy6gZcGpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlg/54oCv8aoG0+kt57ZzLFgxTKSvd+uJh2yJem1ct8=;
 b=XOzIY7I4YUFKDDhdcJM3KKFxZw4TLkLeUUxWfozwuGF0i8yOI10NrxlnGMmo2kgnrPEC98vlpN5SOXF8AFTtfeY8GWH+edksmbyhJA1ukMPEK3jDHGuz/CbfaUEsLk6uegyFs4XY2309/zQ6O1Dmayr6dvb2IKuqBcUCj1BV3d8=
Received: from DS7PR03CA0248.namprd03.prod.outlook.com (2603:10b6:5:3b3::13)
 by MW3PR12MB4377.namprd12.prod.outlook.com (2603:10b6:303:55::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 31 Aug
 2022 17:58:12 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::a6) by DS7PR03CA0248.outlook.office365.com
 (2603:10b6:5:3b3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11 via Frontend
 Transport; Wed, 31 Aug 2022 17:58:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Wed, 31 Aug 2022 17:58:11 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 31 Aug
 2022 12:58:08 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/amd/display: fix indentation in commit_planes_for_stream()
Date: Wed, 31 Aug 2022 13:58:07 -0400
Message-ID: <20220831175808.100597-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 825eafe9-1848-42fe-8b05-08da8b7a5ee7
X-MS-TrafficTypeDiagnostic: MW3PR12MB4377:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ueDAWCIwj85eToCVfFXURuIU716WPOgjMq6ZFp3YJbCP9synG9qrYMV+b+Up73gkXxBjF4ebuVVL405ptqmfM/7m2CNdON7uRuz/Y0sIWJSLv1pggpWEzWqegFgkFRPPXyxjlPtA9qu2x+DTJ+CB5dP/YmJAgKNl2aNhO1YDcJH+/lbVgWJflBi8XhPhFiMO3BnBN7bstCXBWlbDa0wSJnPcZRQEMA/dR9dahgEIHmmPaV0WvIZAuaDxARbIk+j0ull4H4UVRuWUaL6wrtGIjB2sr7s3rPSEAVwzkLKnr+wzQ4Qjox20ogV05swqSeUkeGu0I82jW74+htwz7T5CGeHzmcwGAvA5nSxaKY5EcQ+RqZm3fiO6Aw80JrWmFfuYdoLAEFWrDj6ggDBxm9YOeOlimTifIKi0nVid9h58Z6YHZ93tsNDpy15C9cz360t7HkL9sudN52nXlKW0h2zzyY833bXG5SndbyVRCRLgrIt1srOhF9Zk6f/ou4sTNqD9E6Aay39Z3u2uYpAXrX4vfi6LDtZ8m9srZHN4L3hQKNmf1nxS/T8oJMYxjcqpbJ5xrjotX+9AYyiHj+rfBXh/a1rK44OqggZ9Vxr7h88aTbfIJ8/3FfhRCfz+qjIlzXKWlQDr4C5ACLoibJ5m4Lk9ZOoV1/Oh/7Km5D0kjYbOP8LJsBjoJYglhmirPaXRA9ZlQ520JKKLhFR0A9XYmQOKx6YEPxdqooRl9TAt++1fPuzLWHR6oDxx+0hLmYajoKihjFZplbPrEHxYSnLOlSaAHiPp7knIPwaLIbL4cFs8sB0VEojVr6OqxIJXr7mdi3HySNuu58QIsnlNajmhK2PhDg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(39860400002)(376002)(136003)(46966006)(36840700001)(40470700004)(81166007)(40480700001)(82310400005)(36860700001)(356005)(40460700003)(82740400003)(86362001)(70206006)(70586007)(8676002)(41300700001)(4326008)(478600001)(5660300002)(54906003)(8936002)(316002)(426003)(6916009)(1076003)(47076005)(186003)(16526019)(2616005)(44832011)(26005)(336012)(2906002)(7696005)(36756003)(83380400001)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 17:58:11.9756 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 825eafe9-1848-42fe-8b05-08da8b7a5ee7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4377
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
Cc: Joshua Aberback <joshua.aberback@amd.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Samson Tam <Samson.Tam@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>, Alex Hung <alex.hung@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Martin Leung <martin.leung@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alvin Lee <Alvin.Lee2@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Address the following warning:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3508:9: warning: this ‘if’ clause does not guard... [-Wmisleading-indentation]
 3508 |         if (update_type != UPDATE_TYPE_FAST)
      |         ^~
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3510:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the ‘if’
 3510 |                 if (update_type != UPDATE_TYPE_FAST)
      |                 ^~

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index b49237390cce..6c4948916e7e 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -3505,11 +3505,11 @@ static void commit_planes_for_stream(struct dc *dc,
 					top_pipe_to_program->stream_res.tg);
 		}
 
-	if (update_type != UPDATE_TYPE_FAST)
+	if (update_type != UPDATE_TYPE_FAST) {
 		dc->hwss.post_unlock_program_front_end(dc, context);
-		if (update_type != UPDATE_TYPE_FAST)
-			if (dc->hwss.commit_subvp_config)
-				dc->hwss.commit_subvp_config(dc, context);
+		if (dc->hwss.commit_subvp_config)
+			dc->hwss.commit_subvp_config(dc, context);
+	}
 
 	/* Since phantom pipe programming is moved to post_unlock_program_front_end,
 	 * move the SubVP lock to after the phantom pipes have been setup
-- 
2.37.2

