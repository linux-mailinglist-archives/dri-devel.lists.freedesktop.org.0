Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A1261F634
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4020E10E2A6;
	Mon,  7 Nov 2022 14:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C4F10E2A6;
 Mon,  7 Nov 2022 14:37:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pavp1dB6qhNeOGOgxLOnjukVUb4va/fjrYLu5EnBM8MIDeQXAE7VvxbMNGcoe9930pqQFaGhthjtD+fSi62E8ygYJS4ysskGmeZeWszVzO4tFW1s7H8N7EhkqlYTJuthwtRvvGFSEfB2eqzZ0kMOZkF/H6SHqWvKKCnl/lCbPItlXI44+xAZZaDxTDL0pvc7d/CzmXAsjmbtSbgdZSXorQSPv0SxzoQSbp5qx9qhfK8FDTty2DPNKGufWIxSagd6qWm4553NStE8Y6MOG1XqNX8CXOKSoQGqTnptsOPkvwGTxKpe9VGqFqoalpd69oAe+btJ6rZQvjkdKDQhoCYSWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hf53wAag0K3+P3qF01o3nAmr5ztOjZkGCAlzmjwyhA=;
 b=PSrweUfHimTRNZzkDQfURx+TLky5AUqEYdlNjQwPN3bw8dD9TxKKbHEwsexPlyVLIEf9GZzqvS8ihjQTcxhv0xvvo5bFKWPTkR+bIuexFup3i25U3SNmTT3BFFjubAsV8lruXwmDXLEdHEDJnX3eaULvQB0rCUTh81gMJKn2t2uffp3vgZjO8ufPn5qe6HsyTLyV0JfM6B0X5x9hdHrV61Bs+lH0g1Vv/zrRpC54H2eN2vdS559ONFK86NN0fuApt1EuFj+cVgIc9bGWX2W5YjB1jhRILgTWF0Z7wjMht4D0S0bmphb5rayZ0K8PoHP6oRsY04s4bAxqwXh09bfcCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hf53wAag0K3+P3qF01o3nAmr5ztOjZkGCAlzmjwyhA=;
 b=kOa3y8UEko4E1qnJ+ErXICxUgdDcWvuYms9wJc2MGceCv9VYL3Xh2ypyzq6WEcBlD7fo3NuEJu+youFmgylq5TFYvxbz4Q5N2U0WMQ5Mf30P6qRk8t0Q4VdbixpeUy+PbftViOP6FZNS+1tZ/mI1aLAp9SN/Zkp15XgV6kA+lQc=
Received: from BN9PR03CA0226.namprd03.prod.outlook.com (2603:10b6:408:f8::21)
 by SN7PR12MB7297.namprd12.prod.outlook.com (2603:10b6:806:2ad::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Mon, 7 Nov
 2022 14:37:17 +0000
Received: from BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f8:cafe::c3) by BN9PR03CA0226.outlook.office365.com
 (2603:10b6:408:f8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26 via Frontend
 Transport; Mon, 7 Nov 2022 14:37:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT062.mail.protection.outlook.com (10.13.177.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Mon, 7 Nov 2022 14:37:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 7 Nov
 2022 08:37:16 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 7 Nov
 2022 08:37:16 -0600
Received: from iron-maiden.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 7 Nov 2022 08:37:15 -0600
From: Carlos Bilbao <carlos.bilbao@amd.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>, <Rodrigo.Siqueira@amd.com>
Subject: [PATCH] drm/amd/display: Amend descriptions within enum
 pipe_split_policy
Date: Mon, 7 Nov 2022 08:37:15 -0600
Message-ID: <20221107143715.279841-1-carlos.bilbao@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT062:EE_|SN7PR12MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f53e9a-392a-41f1-b67b-08dac0cd9187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LuDCzdax19SpZWmbmIcio/9ICiKOBZZcmE9//te88IXlwb1QNTpMe7FAVKbZOcNQeU1k4urtwzwAUL0zSqLQUcHevnBd0XzztFUImhbChpD/ZNSRd1Ga9gThZALeNlVXJGw+heaEFY8Neq4lZoXqg7ZZcRoElRmC7Fqm5onjyKTp0C7+p92N0PRBpu0wLRdsiyqGyQOn4GgHS6OOPsWwS+Xy8fshQvZn2kQaMFxgeAJr9h4qLti89llLZQ6icVKQN9LMUVtoqSpyRytHzNP6EfhQM4HnfjfOlM959KF6RUT4d/6NxTnIeQAAipZREHW0OvQaQb1w8TqeUUtSZU94idgjTQCa7YN7Fy50T+58/14GQQ/0PT94hG0ID2IbSoaGSVNsEmsHaGCEzAKYvTuknnCV3zoGTbsEusKGM7RVE9Jq39khlb3Kx6h/oKvutg6vGUoiMuUfZCPH+ZhlRmTpxRrrbANjIOgYHD93zV6WsJx4jMkA2Io/oCWyXyBg+XHjQt3dTHryh4N4dtDGEc8ofe2cXQ+Bdy2hwkB34Co1h5CfuSOf7nFCvBQ9ScvRabqF+j80aLB0+/8nzhBYsWASCVreV6C3/jFTsFwPv/biA8RBWBqQUg2+COfW81isosQZTkqA/3Q/bYzjtIsXjPvJ+I4OB0gzce5nonf0jF9QjduBqNhJeNVRGn7qDdVjEuW6R1aYA6QnpsU9egPV47r4bQ38L3knF/0Zo/CP2tiVifxoUpmi6emqM1ZKEbj2uBFXWsSw8UoTEq8b/me4oqwkaEfH9fK9Cg10KU+gKpMKHYs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(44832011)(41300700001)(8676002)(4326008)(5660300002)(8936002)(86362001)(2906002)(40480700001)(70206006)(82740400003)(2616005)(1076003)(336012)(186003)(83380400001)(54906003)(426003)(356005)(47076005)(110136005)(40460700003)(70586007)(36860700001)(81166007)(316002)(26005)(478600001)(6636002)(7696005)(36756003)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 14:37:16.8296 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f53e9a-392a-41f1-b67b-08dac0cd9187
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7297
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Carlos Bilbao <carlos.bilbao@amd.com>,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, jun.lei@amd.com,
 christian.koenig@amd.com, bilbao@vt.edu
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct descriptions of two last fields of enum pipe_split_policy, updating
comments with proper field names.

Signed-off-by: Carlos Bilbao <carlos.bilbao@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index bfc5474c0f4c..277631a899d8 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -457,15 +457,16 @@ enum pipe_split_policy {
 	MPC_SPLIT_DYNAMIC = 0,
 
 	/**
-	 * @MPC_SPLIT_DYNAMIC: Avoid pipe split, which means that DC will not
+	 * @MPC_SPLIT_AVOID: Avoid pipe split, which means that DC will not
 	 * try any sort of split optimization.
 	 */
 	MPC_SPLIT_AVOID = 1,
 
 	/**
-	 * @MPC_SPLIT_DYNAMIC: With this option, DC will only try to optimize
-	 * the pipe utilization when using a single display; if the user
-	 * connects to a second display, DC will avoid pipe split.
+	 * @MPC_SPLIT_AVOID_MULT_DISP: With this option, DC will only try
+	 * to optimize the pipe utilization when using a single display;
+	 * if the user connects to a second display, DC will avoid pipe
+	 * split.
 	 */
 	MPC_SPLIT_AVOID_MULT_DISP = 2,
 };
-- 
2.34.1

