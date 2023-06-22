Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB38073A2F1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 16:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE05C10E570;
	Thu, 22 Jun 2023 14:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::602])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3849510E570
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 14:23:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJ3Aq+amD2OvZ69ctanYKV8PslXZiO/VMN3TjApNjuUb9EjnOzrCZus2CXzmJsDsJ2yjDsYJ/5f/VTROXRW34kLgbNn7IUPkqltRgutAco0bpirFJlsj41qeC/p9zuIZU11OUiVzeaR9IXqXhTHipRrSQ1VP58z17Z27QOlp31jGk9uqHF7kU5AiSitIBmYSauCeaFnrv3z5nIPtxymGFwbuPw4ZMII3aKLufEAd1ZbNJhcOTwakvsNEHC1L5TeXaBOMW75VKMGQQVjdn2ak7BEbLkpZmrlej12ngnPMcK4K+cc0UgNbCbJv3TcStSHIJPQFLkfC+4Yo1/vvow3p1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8T4HxhToefM/feCi4nHr/LJD+FD6vnZC2u+pjEwJO3Q=;
 b=HDmSWuZ+lBQX7OGzB8rJZ5FTf2qsfCBE6sHPvrWRmzIScCvCgeiH3JfIJ1W7If28Cw4eraVBVmQTzzLPo52/mDqA7KRi0D3QILCyCNDdgBjqPZTVmje897f1HYjYpX7IgeAXNHmdwqsyx7P+qbSqHRMEA26cBCamWThSFNw9bqkqjfg9khQGxD2sgGd3W+jtjMA20tkE7bJDt4Gv7ZsLqf/jGlx8hFe014Ad1mat3Wuc3rrlKYdEo0KnELZzwaK7KXr75mhdrzxPx0Csqg4O9fcLzqnyGpaIMwTSrOosXYYz+uIK4jjIBUh9sJ8dsoIE6BMhFNpe8100+Z9FuoMmxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8T4HxhToefM/feCi4nHr/LJD+FD6vnZC2u+pjEwJO3Q=;
 b=4GtC+oa4UAwUO76677yGX19Dnn26fmQQf+osM/fRz5iFE5RqqAXNF2kmD2cPL28ErHX9EdGeXNyGqdJ4Gbns/qALNgBnR5cYjzbrTnn4Jr4YTF2ZRzKE4pO+X88WuGgQaVj3WDJsp38QgAYIo27koNTeu1UESqwFb7rEd/zFa44=
Received: from BN9PR03CA0907.namprd03.prod.outlook.com (2603:10b6:408:107::12)
 by CH2PR12MB4085.namprd12.prod.outlook.com (2603:10b6:610:79::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 14:23:22 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::8a) by BN9PR03CA0907.outlook.office365.com
 (2603:10b6:408:107::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Thu, 22 Jun 2023 14:23:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.41 via Frontend Transport; Thu, 22 Jun 2023 14:23:22 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 22 Jun
 2023 09:23:21 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <Christian.Koenig@amd.com>,
 <Alexander.Deucher@amd.com>
Subject: [PATCH v2] drm/ttm: fix bulk_move corruption when adding a entry
Date: Thu, 22 Jun 2023 10:18:03 -0400
Message-ID: <20230622141902.28718-3-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: 20230621154314.6976-1-Yunxiang.Li@amd.com
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT034:EE_|CH2PR12MB4085:EE_
X-MS-Office365-Filtering-Correlation-Id: c835e443-f676-4e0e-2aaf-08db732c3bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xQTGZEtPMJFLh4vw7RTzFDJrnwbFTQbQOlz2PVv+VZbnWkMYpL9ZELl3C41lt1zgvmUty3vAk0DbnV4dGHkUhJraZz7iAmKIgcmO7vyZ+Vkpwq6M0Mzm0V/eDCeIM03G5uBrJHGiB5EV8DmN6U9wkN/y/pOAXIfvxvSOp+yTAQvQdnFnl7a01rVZ+MptbeLvXAkFNKpXYlgXhmlv3LaVcQV43oLnjcPSel/lOU3BazFzf+4BlHImI1oVdlRbcymILc0PtuJn2wCHnYTfwLJG3b+fTVj2GFCNI8Jql/LkWgXNflYTsDyNJVF6N9IFrBhKeSg0OjJCjMj0CfdyEcAZvhfY50wxSdXObHMs/GB8xezpojzfrqpGq+TbX7kC+7ctSc7AJgggCc+EhpXFHeBup0fQC8nlkJxO5ga2LnDy0Z1HciTBdT8iCJRsg659k5r1Y5x0m0hKlgjJRxLX5mLG844Eot/ny8alx2ZUBQ2zgSjDo6MEx22uN6wbaecz61t1oPSK7AuLIj+nWq/jvFxR3RJSvmy2hI2Bo1Yuty7zTQhNrk5h53sUYytjsAacOP26wHplGOPb9QqiVpRdKv5nx/Lwpxrvhx/YoISwostztfVnN7e3pfsp3aHNZjgzq3ZRcWWIH5TwVBlLZJVl9YnzO93hhSEPskVGGpJ1a5UdFsgIYaRjnABxnoVJNwSIvPHjL9O727Tuxz3o7WSh4IZx1VcIHNvcii1g0DGRFMOeA9+tyvX5zl1oudimOJXXQiCWRJZpjnLDM2tVFkW3VpVb5Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(356005)(82310400005)(81166007)(86362001)(40480700001)(40460700003)(316002)(2616005)(8676002)(41300700001)(8936002)(70206006)(70586007)(4326008)(6636002)(336012)(83380400001)(5660300002)(1076003)(426003)(6666004)(478600001)(110136005)(26005)(16526019)(186003)(36756003)(36860700001)(2906002)(47076005)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 14:23:22.1055 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c835e443-f676-4e0e-2aaf-08db732c3bc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4085
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
Cc: Yunxiang Li <Yunxiang.Li@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the resource is the first in the bulk_move range, adding it again
(thus moving it to the tail) will corrupt the list since the first
pointer is not moved. This eventually lead to null pointer deref in
ttm_lru_bulk_move_del()

Fixes: fee2ede15542 ("drm/ttm: rework bulk move handling v5")
Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
---
v2: style cleanup

 drivers/gpu/drm/ttm/ttm_resource.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 7333f7a87a2f..e51dbc7a2d53 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -86,6 +86,8 @@ static void ttm_lru_bulk_move_pos_tail(struct ttm_lru_bulk_move_pos *pos,
 				       struct ttm_resource *res)
 {
 	if (pos->last != res) {
+		if (pos->first == res)
+			pos->first = list_next_entry(res, lru);
 		list_move(&res->lru, &pos->last->lru);
 		pos->last = res;
 	}
@@ -111,7 +113,8 @@ static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
 {
 	struct ttm_lru_bulk_move_pos *pos = ttm_lru_bulk_move_pos(bulk, res);
 
-	if (unlikely(pos->first == res && pos->last == res)) {
+	if (unlikely(WARN_ON(!pos->first || !pos->last) ||
+		     pos->first == res && pos->last == res)) {
 		pos->first = NULL;
 		pos->last = NULL;
 	} else if (pos->first == res) {
-- 
2.41.0

