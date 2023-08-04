Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 504A476F9F4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 08:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCA910E252;
	Fri,  4 Aug 2023 06:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2D810E252;
 Fri,  4 Aug 2023 06:21:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddONB5xEXBnnX63eeDHxdRn7mBhJ9TMP3JYpo2VA6iVnR0az7rvgKFFgNDlyMKB8bbIGITUpbxA4SRGGDndycJeYNRr3L0SXO3QwlWVf+wAF5aE5+DL8nHYn6YH8zEGCsnG13GQhLcBOUegcz8kkMoxx1V/Px/MNYAgegRHh+3cQKQXZ95WF5Z5kwDX9/c1otPUgsb48WcriUI1qGDjqmXar725kPO7x9P9hhHCqwlC4en3W8Dagt3EdOXyjV3mq0rQCIgvhiLLKBKqgfPVcx8f5V7/gFjf9qgOX+5yNaqRHYXdpqaMvvJI97yI+m22+tRiJ2dCHZ5cOUYUKDGasVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByX67ES6f/XWOLUgylZwEl/zveZ6GuuOKxEtqEU4B0Q=;
 b=JU5q2ISOFlv521/tGx2jsr++ZP/RXHPjo2Zkn0zgR8QJn6zO4myeVwIrOpQ2/F66jIq7BNcLWDnN9r4JB9Npgj/sOkUnpMQv8jyj8MMMWWjUTbcN9n/MbgeXRCa3oqlxX+cvk0AR0rAsfmvY0pM9OlzE0hg2GpPImlsYzzN5iJjEZkNMALKirCDpBiG7sJOgoUqHzdflBWm4ug88/Kg6i22G4NMxT9kZE/y2ta+PVuG3aSnRCg3UzDcZz1aZQnxt1qNRnJcVpYb1/RGBx8L+OXHiGJDqxllxff71JWtgaOfI7pQ6mU+i6JdEppLt5j/8YOIOvISYWkQZjYH0MARCvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByX67ES6f/XWOLUgylZwEl/zveZ6GuuOKxEtqEU4B0Q=;
 b=WmBiRiMiIAmDRARs0W/tt0tT8kOCmq3+MqF/X+8Si29p0gcOi5xvYoGCUcBxo2AN2sS9lPIfYUvXjMVDaKCXCI8UGzcubSTJMylrntbLbpV4dApbPtS9ZkJEsxKuturH0McFqWDy1FQnTU75ShkdyzXYAVNOGpVAOsv+w8rSw+E=
Received: from PH7PR10CA0012.namprd10.prod.outlook.com (2603:10b6:510:23d::26)
 by SJ2PR12MB8182.namprd12.prod.outlook.com (2603:10b6:a03:4fd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 4 Aug
 2023 06:21:18 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::d6) by PH7PR10CA0012.outlook.office365.com
 (2603:10b6:510:23d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21 via Frontend
 Transport; Fri, 4 Aug 2023 06:21:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.20 via Frontend Transport; Fri, 4 Aug 2023 06:21:17 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 01:21:16 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 23:21:05 -0700
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 4 Aug 2023 01:21:01 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/mst: delete unnecessary case in
 drm_dp_add_payload_part2()
Date: Fri, 4 Aug 2023 14:20:27 +0800
Message-ID: <20230804062029.5686-2-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230804062029.5686-1-Wayne.Lin@amd.com>
References: <20230804062029.5686-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|SJ2PR12MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: b0d24952-71de-445c-1353-08db94b30361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1pRrlP5IizYZ6XGtzPz0HmYcuBx+uGIXoHGY5JTqXUsdefUAFsndIt5zI9nRFYuV44caQZEwSd3PVkuXE7qaXQ/ahc2F4+jlnMHfeDVLEFXNCKZBt+gs5zx1eMMF7/B2Q5xujoMercOJoreMnd3e47ShkJACQFb3exn57sOy66vnYsRa4+EZkaMUMZ4fsmQ5QHzMKHe+QTBUpB9N3SB8SzXIUYcOyI60UwGSukxbKLCMPJdjBeA6jeedps0P4u10I3cJPo+0IxpU3iXszHzlfaCb0rp8AuMxXx82jRfb6J8P/3tENEG9Jerapa1uc3QXFfE6g/Uiznedv4QiX9n80sBMHH9Ns8XwLPvCsWyygt5ni32FctfGtn6+OegwK8pOa9VdByVJuyeuVEglcocVImu1MAvkRdJIsYlf9qRF5vr2n8iNLSqZ6DCR8dl2qrtbfF10bgQWb7ZQtqKxvRjdom0uxNChLdaOM6Wmxer1FYfiTsu1Ymn6ONop3ix7yGvA7HtltkXoWR0SiQ+BvTwo77YZ703aB3XwbtQwOjY0kn3avXuLVUMP30sILFlqxTrk+whbVzdFef3BjOi2d5a7ZvYxOtrUXbr+ne4sePtiIF5LHAp9CxP6a3b0G63n2Qv4pgqh0ECB59xFU7qc71sipWMyf/jQCwgbs9s8ty9cd9389dFWhqYBTmLUogsdi40jZD6jPsoIR/LuMR7vGjNgOzlV65gcGvT0Reocm93yCbMIEJGVujD94FjVEigWHXPcSDufKDULsAbZidmEfwEhoNO8USXx7QJqd8/u+WiHkICCoM2tw5nhSQHPjHzFeerp
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(82310400008)(1800799003)(451199021)(186006)(40470700004)(46966006)(36840700001)(41300700001)(8676002)(26005)(1076003)(8936002)(316002)(478600001)(40460700003)(82740400003)(110136005)(54906003)(81166007)(356005)(4326008)(40480700001)(70206006)(70586007)(6666004)(2616005)(36756003)(7696005)(83380400001)(426003)(86362001)(47076005)(36860700001)(2906002)(5660300002)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:21:17.6213 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d24952-71de-445c-1353-08db94b30361
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8182
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
Cc: jani.nikula@intel.com, jerry.zuo@amd.com, Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
There is no need to consider payload->delete case since we won't call
drm_dp_add_payload_part2() to create a payload when we're about to
remove it.

[How]
Delete unnecessary case to simplify the code.

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index ed96cfcfa304..4d80426757ab 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3411,12 +3411,8 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_dp_create_payload_step2(mgr, payload);
 	if (ret < 0) {
-		if (!payload->delete)
-			drm_err(mgr->dev, "Step 2 of creating MST payload for %p failed: %d\n",
-				payload->port, ret);
-		else
-			drm_dbg_kms(mgr->dev, "Step 2 of removing MST payload for %p failed: %d\n",
-				    payload->port, ret);
+		drm_err(mgr->dev, "Step 2 of creating MST payload for %p failed: %d\n",
+			payload->port, ret);
 	}
 
 	return ret;
-- 
2.37.3

