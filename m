Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BB334C5FB
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 10:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D28E6E209;
	Mon, 29 Mar 2021 08:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9B06E209;
 Mon, 29 Mar 2021 08:06:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIIaLE4Wu6oRZ350ZFy5TMuNksTljCHBikPSZb9V1lpQebGGY79H/3K02PqWydHz7QMANTespx3hvnP05RuxZOoamuDu21qyzrpFTlvwNnCY69LUymDDrZc6I6GHX79a07egqS0DylBzgOFp/wzyPRr6xVEnL6/YO0zH5ejkUNRpyXh1Ulxns2XaLDs1iGZsw8KSXWj771Kbakgj1hf8l1Ed1rvDVSxwYVAZnzPjmr+9grHYq6/4uES7TQNolbYVQctqsp4bcDTBAvqHJBKEnS2+becezah1cwx7XEWxEQXdaci662OXGX2S+/plfVlDuSdtxtbDA1JjAoOt6vXiOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mC94VzzSggFllqcwT5KsRJ6BKNCloh6wYrVoo8AuEME=;
 b=jpm4BEVjrrNHCqHjy2VvnwYZzsgCFHi3jqp0J8vbRgKuIoQtQXYZnWYFmaGlW5hoKeWFmCYaRu3/lVSWlEown0f2kh8BceX8bEKobkIaQB9SVcyL3c03ogqbejfB+mGKaGE6oPLfyrgcMzTYAFZY5EGrmpu9ubTN/7AakRl5kFAGxpn37lATNk7BnW8Q9N0gBieXG/ptsJnlx2v6MO5WQGrtBVHTimiCY0Ke0HvACA6K4+VbjkXMI9IGU/icrRqJZmFpL0ixH8hUnink9HKJF1wAK+G8ze7INoJi92Y83y9BWX0GttGwg3IjNOg3TnkM5IlKU3lmKAEqpuzy3e+TFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=amd.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mC94VzzSggFllqcwT5KsRJ6BKNCloh6wYrVoo8AuEME=;
 b=4oQEvWoW0NkXnxtH34TCHBqD1pRe1sQ1JkWcIlk0/1OPHCQF607x7SQs0yPaKYrHyrWTGPDJQvFm6re4YdIi9wflwVZ5UJlHgGA8HVawZo5zVN4JOvTeznPr6G6wjnBTo6s3ACTrxledslU7t44/eL3o2ii2fgp9/12zjXequic=
Received: from MWHPR22CA0024.namprd22.prod.outlook.com (2603:10b6:300:ef::34)
 by BN6PR12MB1217.namprd12.prod.outlook.com (2603:10b6:404:20::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Mon, 29 Mar
 2021 08:06:32 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ef:cafe::30) by MWHPR22CA0024.outlook.office365.com
 (2603:10b6:300:ef::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Mon, 29 Mar 2021 08:06:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3955.18 via Frontend Transport; Mon, 29 Mar 2021 08:06:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 29 Mar
 2021 03:06:30 -0500
Received: from HPG8.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Mon, 29 Mar 2021 03:06:26 -0500
From: Louis Li <Ching-shih.Li@amd.com>
To: 
Subject: [PATCH] drm/amd/display: dual cursors are seen if scaling is enabled
Date: Mon, 29 Mar 2021 15:54:10 +0800
Message-ID: <20210329075411.501760-1-Ching-shih.Li@amd.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0cc45b1-32fe-41c4-ded3-08d8f2899033
X-MS-TrafficTypeDiagnostic: BN6PR12MB1217:
X-Microsoft-Antispam-PRVS: <BN6PR12MB121733D7DD076B8FF780B825AA7E9@BN6PR12MB1217.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gKBNU6q0QusGufjVCCblV6vqxBUjaMcT0bRurDgbFbMouiqF6b0drsF1c6VEw7crn31WWOS6fmqI55wk5KrafYZ58TYRUWJG7oZAMVBZiDn256kwpd+EXvSeT/DLSpO9/ba2DvXXxOkJS+EKPPjetNXxNIA9yKjL7yUS/NKrDkgr8WMxqz1LBAXKySJ05R/3dx0q4sqRmq4PcLJfhOY/02Wv88kDU7xIVtndc38DfJI1JI+mZGpkSmaUFWjLuRtZlPNlJmrGIYueYEl6HrQrr6SC3GzzLoKm4YL77+Qd2btg7VEEpFV7nufTmbb2SApzJToOwDyxZBLV+mQLo7zIUUXfUtaeefV/ctAlgmNGRz5UXV2tDnAjrshOnc8PCj1A58ckJ1GR1+kyBtQP26muM7Rp1YImamgnT5pBYYxKRJ0S+O3HdhB2AdP1iysZBQCQX+xTS3Jaxj/25qabazb5SsMFA24v0/95uugjzzZJ2n7NrfJA8Ems3JuGEwD/HAeCBRUnVEGmPE0MkP+ElCCEacVF89NpjLB6Z45LcVcmfb5H5LRPnFMDe1E50gmhDT5sep3n8O4u3LREMGYe6xjPxt7HhAprkhMAdQrpeMK6KBwoLtesK3EOSua2rHsXiSXFKKIEAMpRsc6AnHcoGZ4u2D+Xyebs0HeEHoYicKRbrs75eBu/0uQPjmOpT2aggAf+LAXt7Q9026U/zAkXO0qGow==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(36840700001)(46966006)(70206006)(70586007)(478600001)(82310400003)(2906002)(82740400003)(81166007)(356005)(5660300002)(2616005)(83380400001)(186003)(109986005)(26005)(8936002)(4326008)(336012)(8676002)(6666004)(316002)(7696005)(426003)(47076005)(36860700001)(54906003)(36756003)(86362001)(1076003)(266003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 08:06:31.4995 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0cc45b1-32fe-41c4-ded3-08d8f2899033
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1217
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ching-li@amd.com, Nicholas
 Kazlauskas <Nicholas.Kazlauskas@amd.com>, David Airlie <airlied@linux.ie>,
 Ikshwaku Chauhan <ikshwaku.chauhan@amd.corp-partner.google.com>,
 hersen wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Louis Li <Ching-shih.Li@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
This issue is found when scaling is not equal to one from src to dest.
When issue happens, there are offsets in both axis x and y between
two cursors. Users cannot control APP under such a condition.

[How]
For dual cursors, cursor should be disabled if there is a visible pipe
on top of the current pipe at the current cursor position.
For offsets between two cursors, need translate cursor position from
stream space to plane space with scaling into consideration.

Tested-by: Louis Li <Ching-shih.Li@amd.com>
Signed-off-by: Louis Li <Ching-shih.Li@amd.com>
Change-Id: Ic19e4f3b9225736f037f5ade10b68e8afe5f9ab7
---
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c | 40 ++++++++++++++-----
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index 83212ea40077..1ce5e58e3a9e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -2999,6 +2999,10 @@ static bool dcn10_can_pipe_disable_cursor(struct pipe_ctx *pipe_ctx)
 	const struct rect *r1 = &pipe_ctx->plane_res.scl_data.recout, *r2;
 	int r1_r = r1->x + r1->width, r1_b = r1->y + r1->height, r2_r, r2_b;
 
+	struct dc_cursor_position pos_cpy = pipe_ctx->stream->cursor_position;
+	int cp_x = pos_cpy.x;
+	int cp_y = pos_cpy.y;
+
 	/**
 	 * Disable the cursor if there's another pipe above this with a
 	 * plane that contains this pipe's viewport to prevent double cursor
@@ -3013,7 +3017,8 @@ static bool dcn10_can_pipe_disable_cursor(struct pipe_ctx *pipe_ctx)
 		r2_r = r2->x + r2->width;
 		r2_b = r2->y + r2->height;
 
-		if (r1->x >= r2->x && r1->y >= r2->y && r1_r <= r2_r && r1_b <= r2_b)
+		if ((cp_x >= r1->x && cp_y >= r1->y && cp_x <= r1_r && cp_y <= r1_b)
+		   && (cp_x >= r2->x && cp_y >= r2->y && cp_x <= r2_r && cp_y <= r2_b))
 			return true;
 	}
 
@@ -3034,15 +3039,30 @@ static void dcn10_set_cursor_position(struct pipe_ctx *pipe_ctx)
 		.rotation = pipe_ctx->plane_state->rotation,
 		.mirror = pipe_ctx->plane_state->horizontal_mirror
 	};
-	uint32_t x_plane = pipe_ctx->plane_state->dst_rect.x;
-	uint32_t y_plane = pipe_ctx->plane_state->dst_rect.y;
-	uint32_t x_offset = min(x_plane, pos_cpy.x);
-	uint32_t y_offset = min(y_plane, pos_cpy.y);
-
-	pos_cpy.x -= x_offset;
-	pos_cpy.y -= y_offset;
-	pos_cpy.x_hotspot += (x_plane - x_offset);
-	pos_cpy.y_hotspot += (y_plane - y_offset);
+
+	int x_plane = pipe_ctx->plane_state->dst_rect.x;
+	int y_plane = pipe_ctx->plane_state->dst_rect.y;
+	int x_pos = pos_cpy.x;
+	int y_pos = pos_cpy.y;
+
+	// translate cursor from stream space to plane space
+	x_pos = (x_pos - x_plane) * pipe_ctx->plane_state->src_rect.width /
+			pipe_ctx->plane_state->dst_rect.width;
+	y_pos = (y_pos - y_plane) * pipe_ctx->plane_state->src_rect.height /
+			pipe_ctx->plane_state->dst_rect.height;
+
+	if (x_pos < 0) {
+		pos_cpy.x_hotspot -= x_pos;
+		x_pos = 0;
+	}
+
+	if (y_pos < 0) {
+		pos_cpy.y_hotspot -= y_pos;
+		y_pos = 0;
+	}
+
+	pos_cpy.x = (uint32_t)x_pos;
+	pos_cpy.y = (uint32_t)y_pos;
 
 	if (pipe_ctx->plane_state->address.type
 			== PLN_ADDR_TYPE_VIDEO_PROGRESSIVE)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
