Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B71E7718A2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 04:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F6D10E1B1;
	Mon,  7 Aug 2023 02:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2153510E1B1;
 Mon,  7 Aug 2023 02:56:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCcw7mulUxw4wy52vpLGpCle/4VahZ6MOS9u3WpXhIMyI8PuoMmMNhKd/b1R/Vt9DcWAJ7tMe4yLoroVWmXemzIKtWW+N+0BCT3BIK8ScDR0KVrGtW4Y1ie+S9HU9k0Au1Yf6jTq01BCOg/ZxNzOTpZBuctDhigXQ5SWW/Uc/6MT0C1DW6RK0axSoQjBtDKkGTerBb+Cphx8fQ4/VZStKf9tnlO7hJDzyr0grtAD3vsR9HCeMpwOPVorIfdF7sYjH6AOzhbRY2byy+TqKY4Shu9FHMsifk3/7YztaUTqKbVNqUqUf1lks0U5CbH0ZQEXC8KPdLW5Cd9Px3QA4Rolvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByX67ES6f/XWOLUgylZwEl/zveZ6GuuOKxEtqEU4B0Q=;
 b=Rb0yKWOKwjPKkT3oMbC+uh03OOfT/XYE9GelpV0IxTWY/FuFPnlioFoiaEmSL8GEQeBtxF+xWugBDQPeykvBvQE9LifZ67Z+VNccjvPg8AAen953FGZtsgenS+2fwr8u7pgk5iUBHy2D1keJp2b63nnt4OOqs4kVPlNgmsNMTLfQgxGOouGURPQP49hjxeDuC6YRnTvlP4Lz0EN3hK29/KZMVO1Mz4CXoTiCANEa3Ncu3iNuTCy+C3lThiauqAsBkztbdUpH94SUkwhEMVkW5YtDrewyE9mphk6SdyeKYLrbGcYu9Sq//vhI/3HPcFfrZXWGAPWfWko566t5D+nHkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByX67ES6f/XWOLUgylZwEl/zveZ6GuuOKxEtqEU4B0Q=;
 b=FxiU1X9m+igWxsW28NxmPhIdxCBEAX3XO1XXX8RhV3ITtkzDZls2b96BWmkiiRI3csksI53pZcIaFL5n/myReEGhbsVtazoxWJYVrkDg/XGGooojL5wsRCLMiXAQx+QINA1R0gDOwpgdrrpx+XT686A4AfAPE6XDgkALuB7ydC0=
Received: from MW2PR16CA0071.namprd16.prod.outlook.com (2603:10b6:907:1::48)
 by DM3PR12MB9414.namprd12.prod.outlook.com (2603:10b6:0:47::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 02:56:52 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:907:1:cafe::39) by MW2PR16CA0071.outlook.office365.com
 (2603:10b6:907:1::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26 via Frontend
 Transport; Mon, 7 Aug 2023 02:56:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Mon, 7 Aug 2023 02:56:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 6 Aug
 2023 21:56:53 -0500
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Sun, 6 Aug 2023 21:56:50 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [Patch v2 1/3] drm/mst: delete unnecessary case in
 drm_dp_add_payload_part2()
Date: Mon, 7 Aug 2023 10:56:37 +0800
Message-ID: <20230807025639.1612361-2-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230807025639.1612361-1-Wayne.Lin@amd.com>
References: <20230807025639.1612361-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|DM3PR12MB9414:EE_
X-MS-Office365-Filtering-Correlation-Id: b006d4ab-e4d4-4e91-260b-08db96f1f51a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kbiR5ihmOn72KfD38glqQgBw060DSwq5lfHPIB4ucUnu+5LzyxJB3WKtz5FbfepbGAASNBmKIAGwS8Pp+9FimBcBVqCFKju0TKfeqORmJyeNiOUS3bkXa1ZvW+D+gAHqlRUlxa86OvAQr1BtZsfJsBV5NYXQ8cjn3eayjVUmE42m4Y54Fq/h6f6GLwLWzMVDdHftanP0xvjvqnEwyldk/wQWEHQeirQ8WBDleyp48bKas70aLrfIjb+lEpTCbxXWxS3sem50ZwSOTZr5tiBsPIVCBPXIE8jejWchYYyD5DydTUOTtA/8m2ZhUeX6EKI51rN76h1lyiNChSoQUR7lgot7vqwKgHVAM+Zm8WkfuHUvGOisHiMcuLoPeDfC/n68JHwucPDiCZX7tZP/z6pHaj88MjFpEzamEDmc4Q6wUZE+Go4l/6g/HXJbg7ZXwiA/cQC6fXubBhMnJLbpaQPDK349s0/xwZlbWQEvVFNbelhWVhRiYEP2JS9if/oO3j8UR6IXbQEEHxLI+YBZ6lXM9/n+VelWrd13B20JvhIE5JoZ15hYpBpWvf59W+UYZ7/CML43yniXEfcez49Ia4MGX8KEtC1NlmhEc/dYRuGOZaupd/RkGeR3/eC5MOudVP/1HHTkkd4GlIKGZ7WPueKGqGJkIHrdYFFtMlGnVt1uAMZ5y8UkHHm4Z/Q5xXOOYUgUEuURLprisG/okKvm6m8K/VxKuGKHVs9DQbZKe6DKxq1HtqmxLMbE6W7fwTY69QxYiNJYxHgr0RzLQst5P9GaHQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39850400004)(346002)(376002)(136003)(451199021)(82310400008)(1800799003)(186006)(46966006)(40470700004)(36840700001)(40480700001)(2616005)(40460700003)(7696005)(6666004)(478600001)(86362001)(82740400003)(81166007)(26005)(36756003)(1076003)(41300700001)(356005)(316002)(5660300002)(8936002)(8676002)(54906003)(110136005)(4326008)(2906002)(70206006)(70586007)(336012)(83380400001)(47076005)(36860700001)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 02:56:54.4910 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b006d4ab-e4d4-4e91-260b-08db96f1f51a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9414
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

