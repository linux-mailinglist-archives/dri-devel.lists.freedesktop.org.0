Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4804E2060
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 07:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1355910E370;
	Mon, 21 Mar 2022 06:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FA510E338;
 Mon, 21 Mar 2022 06:00:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y//U5AkfYgfhI0U0yoBFcdLDhprNkX7pW93cUlfm3WX/LAeitoH5PacEK4XxMm6qdYxJlpYpmdeWguw+5Fg2oQ+OGg2yTIjnXMn1G/9kArxR5cwfZwXJ0iJZhLdNb5IZuoZGKkCrqw4k0YSnWdytfMruMg9wVO6uKXrk/mljgTGfClESAkADXAy09xbF26EPwBeEedm+f6Xk8IqcoRLt0IohIt9dWMobxPzpL4gHS4pcLIzZlbQ6uo6TcOP3tnvKG4NBE5qzh16keLhqleUFfhfVphuURpYxuofAuK3WkZs54arEJvvdRM3Gfj41XkWDWRJdcKafVtt3vOvrucS7pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQNO+P6NkFGKNUZ8b878sDhWfcdTqzJjudWqAEB0BqQ=;
 b=T1bD0btZwYJqV5hDYm52e5Y/MZn1f6vkNNMkbVfOS/Hf9JxGwSZE4G69AaaUm1Tl4Foeec7EO+B22Epw2l1hBfIMyGgd9WDNKUOb4NaDJ9dFzkEXy2OKup6IonQFgLWyBiAeRlb8UpNytA5sAVT5rO8utimzJU4/106MTMi+jxV3xUbeBAKVzNLOFDdzbZdZD+AqmEP19/IgnafP8nB1LZTXd6rbtepneo+qvizMoUqGQ/ATvKb5euK4NsRj5R6P/aWGzlkbh8I/QU71zBGaItvM8Ub/TnCaq4DkIIIg48bDdBz/tiTjRsK4nCgeIe20amt8b1tK/9Otxi1VPkY/hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQNO+P6NkFGKNUZ8b878sDhWfcdTqzJjudWqAEB0BqQ=;
 b=Jvu3ou84vNDKwKA7QFExVqM0+fKH897xVgh691mUiLTxGEr7EEv8n/entYnyswVQcXwjyo+TnwgGdZ1mjxFgCH2KFF4SPAaI82zwabuwD2cR5mQ1IEH1zDzsTQavYx9r528V3PMl/BTTY9MnYNFYvmoxko0TIsC/ELRNN/Gzy+k=
Received: from MW4PR03CA0093.namprd03.prod.outlook.com (2603:10b6:303:b7::8)
 by BN9PR12MB5290.namprd12.prod.outlook.com (2603:10b6:408:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Mon, 21 Mar
 2022 06:00:04 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::ee) by MW4PR03CA0093.outlook.office365.com
 (2603:10b6:303:b7::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22 via Frontend
 Transport; Mon, 21 Mar 2022 06:00:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Mon, 21 Mar 2022 06:00:03 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 21 Mar
 2022 00:59:59 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm: add a check to verify the size alignment
Date: Mon, 21 Mar 2022 11:29:40 +0530
Message-ID: <20220321055940.4851-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e16a881e-2ace-4d12-b65d-08da0b000af1
X-MS-TrafficTypeDiagnostic: BN9PR12MB5290:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5290547C8AEB4547F1FF7A06E4169@BN9PR12MB5290.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pbt6stYxBW2QKQX7Kqu9QMYoJYAoRFwTcRigg4uRFKILbqKnU374IoZlv/Y6XKQ/oDdMjiDaanJN5HfwTWq1sOlhpWquZ+wTZ7Je/vx30tqxGoWHfyz30caEig3BGdI1DZEBI7uwkpdqSnxXeJHohAGQZn7VD1dFdHXQEi6I7VgP5+Sc80PC4Q05eoGRGTrMFBmwy0dhlsZj6UEX+ejzYrOxJYrkQGCLp7FghYjdPXV1L1lax8+SjeMy/3/qfv3sqScGOa9J6JcGrLCOQ4vT0IiV95WxWOwR2oxxWgUjFpxXEmV8R+NZmx0gElw0Xq9RYl2YSvi6VllV0M96mBk5UEA6jbvMMqwNcIW/XIy1zbihWGzchVHIFwJ6sIX72TGT4xPamOIsP75+V3Ws+Dzd3Hs78BWYxNLYjOSjSAcqbs1ACZ8ZrCDYBrb3JcDMVU5TLpD4ol3QjmX+pQcg1Bl9FGr/lDiX2olbO8tckmxQPumImjn5BJCkF4ALJzhJwqyrc93NTagAf0UVglgn91W8SBWU3aSpHjoVrEhhRv09zrv5O66AZlmwOarYfRm1FGdMLQ3/744mcNDllZsM/ruLTRf80Ek3Q9Wgm5HmID1u0aOEH2AzDdJd3kyPRxjHiTm4/6zZHZ24ZAW0EPI1atI6anD0uN99Yj15c4aJs7LzzK5TH/8N4YHEO58fMvWTCjELQKEhT0Vl1YsouXaa2h64lQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(26005)(83380400001)(356005)(186003)(16526019)(336012)(86362001)(40460700003)(47076005)(426003)(82310400004)(36860700001)(508600001)(2616005)(7696005)(6666004)(110136005)(316002)(54906003)(70586007)(70206006)(5660300002)(4326008)(8936002)(2906002)(4744005)(8676002)(36756003)(81166007)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 06:00:03.6146 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e16a881e-2ace-4d12-b65d-08da0b000af1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5290
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
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 matthew.auld@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add a simple check to reject any size not aligned to the
min_page_size.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 72f52f293249..b503c88786b0 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -661,6 +661,9 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 	if (range_overflows(start, size, mm->size))
 		return -EINVAL;
 
+	if (WARN_ON(!IS_ALIGNED(size, min_page_size)))
+		return -EINVAL;
+
 	/* Actual range allocation */
 	if (start + size == end)
 		return __drm_buddy_alloc_range(mm, start, size, blocks);
-- 
2.25.1

