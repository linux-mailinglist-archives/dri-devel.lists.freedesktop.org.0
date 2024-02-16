Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDEB8579C4
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 11:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE0C10EAE3;
	Fri, 16 Feb 2024 10:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p9owmrwI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD41E10EAD8;
 Fri, 16 Feb 2024 10:02:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SuIsCsGdIK3H3CwNfRdUrm5jDqw4J4DGm9F4Kv97uNwaLPKFcD91KvSchz/gXcPyIe+iSRe+xc1OV9yiOxAV6EIVgsX5qVEXT4vEZ2j2XBY4pzORn7vqEiphFmJk2GtvynkqhppzB8CHE8yWc/QHrBIifOuCpvOyaL2V6XjOcAQRZe+g5wn1kJgXjtGO5JNWL1cMmCxlWGxzSuvl7ucVwWbl+TtnEz5L1cLXlLRK1z7ezmOcj78kUVWiD4eTVTtE1EIwf0kmTc488SMQV/CramaFt75GunqzCwZlmHJMZTQXcor01qFzXqutKQtSZHUK/PpiCLhILVB6UFdK5l+7zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/xcixKgnLNo5NyGN37eGiMo+OVvkM+2G77a5CFkEes=;
 b=NB9pho5Zk6SSUBSbwzi42IDZow/d7RW+PIgRnTYpmdZPiqr3fY3A21bTC+s04hZ2OBAdU0ZfX4H++M/Th6qAs1tWRrYkcrA0I+C0w9EY6x0M3wY1hhDov17l2kTp7xehJjRSwp27va17+Lj3+Raoif18nfzCDm71zhILINHZ9q6q0flI0y5dwTZWPVsVXinLiAQktrippYIc+JOUn6RNRAtAICQYfVK3f0M8YFqtKR5eRXTZJTqOQu7m2UuigFBS6jvQzSpi9Kaa09XKu+x9N9NuRp1JbhnxPu1pcenYJgAPCdMOqhtAxkafpujNTRrM+Sryd4XfdO4Ir1hUl0vqwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/xcixKgnLNo5NyGN37eGiMo+OVvkM+2G77a5CFkEes=;
 b=p9owmrwIqHr4kmbtjpoDIKZf0M/z74+mOHXK+NVfUbv22gtONw16xlor1CEtZOgiyfRChEwXmfkesUUCJae/sljNl02Miw34B5aZr/9BiISKz2GRGb3ZuF7O/VLWIVmYNyxHGsdaoZo4wlsX9I53dOS/vbYUjYQULHlx/ldo+u8=
Received: from BY3PR10CA0001.namprd10.prod.outlook.com (2603:10b6:a03:255::6)
 by BL3PR12MB6570.namprd12.prod.outlook.com (2603:10b6:208:38d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Fri, 16 Feb
 2024 10:02:23 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::56) by BY3PR10CA0001.outlook.office365.com
 (2603:10b6:a03:255::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Fri, 16 Feb 2024 10:02:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 10:02:22 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 16 Feb 2024 04:02:19 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <matthew.auld@intel.com>, <mario.limonciello@amd.com>, <spasswolf@web.de>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 <stable@vger.kernel.org>
Subject: [PATCH] drm/buddy: Modify duplicate list_splice_tail call
Date: Fri, 16 Feb 2024 15:30:48 +0530
Message-ID: <20240216100048.4101-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|BL3PR12MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b46a83d-cea3-4a8b-5381-08dc2ed65ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OOvDl0mSWU0RAsUe2ySFo2cp8dau3RoiDp5jcDTmpxVP2riUJA0CT1oDvZ4wX0RhlpxKiwZhJmcVBZKq/mwo1qmlwYEZJvjKMW62pBGckfJQ8oo7GiNcIVl9vIsMR5c4GEz1V6XqnMS0LN90crSLJU/+HSaiH8lPeMZI6uv+NH7A6MN6lri6a8ynofd8nNdSfoCdxDpCgucdj3HpFC+HtcRxXQtnD3EY7QUyAeRJYHXIhjCMVFQpFbMcsTOI9Mf2GfUnmUO/BLqOCnsD+aYNW7Ad1v4aGnRma1vLtsMKPlFw1CxUNqm0ybNkS13q8/lK0jHX+d3gy6PdDYH575aVvLrpmJ1D4X24wRrkDghdsQJ1Ykbpqlmu61HeKtgGBhVvNKERlalI/Bo66PGI+EGEYi9oP+wWbpwhgYdRQZC6Qubq9rJC2LJiyX5fyqqt2qgm2fsviUBzgMkdrTnc99mE90kWIvrFTCkdSjDxq11SJfJN4UcEXvgRPz7xvAcFwzdz3EBjqjxI/8ZuT4nZIqPTp0gAkzQIfRNzysNkaij3lVkIpsR29lXmutXWQ/BdKM4DbjhZQur0F+Bcx5q8+vAz6z163AtErnmSODYjqweBz8zPvXn6uE/QnCf5K8Fq6XwnxkR6nD5NGzzIuBnmjAYqlgwGqelST+4NYuFMlV2g63I=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(451199024)(82310400011)(1800799012)(36860700004)(186009)(64100799003)(40470700004)(46966006)(2906002)(83380400001)(6666004)(316002)(426003)(2616005)(478600001)(7696005)(4326008)(8936002)(110136005)(8676002)(336012)(4744005)(41300700001)(70206006)(5660300002)(26005)(70586007)(54906003)(1076003)(16526019)(82740400003)(356005)(81166007)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 10:02:22.6321 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b46a83d-cea3-4a8b-5381-08dc2ed65ec4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6570
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the duplicate list_splice_tail call when the
total_allocated < size condition is true.

Cc: <stable@vger.kernel.org> # 6.7+
Fixes: 8746c6c9dfa3 ("drm/buddy: Fix alloc_range() error handling code")
Reported-by: Bert Karwatzki <spasswolf@web.de>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index c1a99bf4dffd..c4222b886db7 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -538,13 +538,13 @@ static int __alloc_range(struct drm_buddy *mm,
 		list_add(&block->left->tmp_link, dfs);
 	} while (1);
 
-	list_splice_tail(&allocated, blocks);
-
 	if (total_allocated < size) {
 		err = -ENOSPC;
 		goto err_free;
 	}
 
+	list_splice_tail(&allocated, blocks);
+
 	return 0;
 
 err_undo:

base-commit: a64056bb5a3215bd31c8ce17d609ba0f4d5c55ea
-- 
2.25.1

