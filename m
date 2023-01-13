Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B67668B6D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 06:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD72B10E1DD;
	Fri, 13 Jan 2023 05:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6625A10E1DD;
 Fri, 13 Jan 2023 05:35:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrbYOlAy+YLCpJT5aIbLsNW2flo/oLQqzq2if2N+ZFHFn2id9Enq7D2XT20UuCARnPoE6iX5WfaJ6NFJnBaNHEJExvYhF2yjkOgyDOKLu/R2pxTP46HiB3U9SDxkF4bdgH8vcktm5npqnH05BbRwZZKiR29XVYoqZpoyUn9rxEVF93IX906yXcYQDVzqbWC21jjY+OTyUmZqApdlsXLY85ZC9NTp8ko3Z/EW4b264FB3Ep1es4moMh/L4tQFShVWyhRHbBKYEu1xKFtwYQp18rsFc1KoXLDJvgRVu+4jHA/VzgY+ELg6dJd/D6m358ISVk+A4q3H1hJjamawmDUptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7c/EGS7WUjw3gsHpQjGbazaUYSu4IMksaEAy6pLsHyI=;
 b=hUE9tIXXdvvxllljCbRJuB/gm+YzUCpt9JqEk/xovEqMr4/kEt3Hesap6oqDjvwVbJ8QNruoI5lShM75s+kr/HVIXO+xp/XXHlZ679tFkDg13sqMYsKrf/44EamJ9ZQpCKyQQYm3xe3F87KXymGApeUPH1SGxnjl36OpcOVXxH1d43F6qm6+wHy7EkIogVs7k+lJd+vH1WcqcwcI+yHSf0v8uxcfXzLfDUM+PYEStPt17tnLRtrPQTOoM2m13vuM7slxzfe328/vMVCn18peBjKaieyQTRzex3AKmHezCUOQQgVqmdOVZFrjbWA9zToUkR8Uo9sk2+C4ZUnc1GacDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7c/EGS7WUjw3gsHpQjGbazaUYSu4IMksaEAy6pLsHyI=;
 b=xS971WuTEp89/9ttBbGNBK/Pd+1mYGffuE5DRwDJ5QGMlQdUsd2njD7GoJysA1LkirQpDMQd7UGnRFGMmrx2y0SSvoJn6k3eFYxOlJTqxV8kSR9O8qFEbW8/hPzHCcB4ujXDRXJ8HXgiddJxqQbOaeG1Cb9CzRuPPjiNWP7PX3A=
Received: from BN0PR02CA0009.namprd02.prod.outlook.com (2603:10b6:408:e4::14)
 by BY5PR12MB4051.namprd12.prod.outlook.com (2603:10b6:a03:20c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 05:35:06 +0000
Received: from BN8NAM11FT091.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::5f) by BN0PR02CA0009.outlook.office365.com
 (2603:10b6:408:e4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Fri, 13 Jan 2023 05:35:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT091.mail.protection.outlook.com (10.13.176.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 05:35:05 +0000
Received: from majun-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 12 Jan
 2023 23:35:03 -0600
From: Ma Jun <Jun.Ma2@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/ttm: Use debugfs_remove_recursive to remove ttm
 directory
Date: Fri, 13 Jan 2023 13:34:16 +0800
Message-ID: <20230113053416.2175988-2-Jun.Ma2@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113053416.2175988-1-Jun.Ma2@amd.com>
References: <20230113053416.2175988-1-Jun.Ma2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT091:EE_|BY5PR12MB4051:EE_
X-MS-Office365-Filtering-Correlation-Id: b07b33f0-93e7-4574-5b88-08daf527ecfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7T55GqSfJ7HozdE4jYtgIIDKmRwnEF0HFKtXkLf0AWClx2hAMspCtWWTRBx3S8H1NOVqhLQSYBUPqxPwhwSC8EfIXUo1bbE/9ageL8iEZvyGxiZAggeMHQnq1nvWQhH9gIXyAZK43ATMD0ahvs9pT2+fyZPvXlZjyXaHBCcARedR91G+sxefpTQ4TTv1/hvU0Kb42kFXIpgkJyvOmQZVJmGRZl3AASZUznFPHouCKvCE29YUHFQjL6Ycj6DZn5IC1YXpALhoddhEeYV3v3SDT7CYuxm7ZtENfm3eYNj4UTwvOL8llSreX7KX0e4kwpnMO8TkPCI8JQqGAEkhaw2JzjZ2Oi0h9gagLF3Oeypz526merkMhhIBnhEUsNWmgklS7l0zKNNaOxyHps890SeX9fDf33it7O1Xo37NvAOTv9Y8BtDBP7ztd7SUmKxmN6Wkx+zc69+PXMmS13yURw1D6wf/ioybkc+iV8owobfF7aj8z9jc9Z/vN3NpZt5qnqw1ZOVaSh3LvkRNJovKb4tTf2ocGYG56nXYlSRcDv7GVFTGxxAw8yv7WzjghKasuXlXoXSSxnxc3yFQiFkvXQaOtFKTYOZ/1HdgsZ5Xz18npyoNXax1nxN44QKM6Ipff4fwqEKpZ1NSSkH74kTUqAlS2bhjfcParJSzKFEdt5UatVC1aRi/10tKL5XJ6DCsKdfjWYLPDDMHQBdKNdGWmhLvyDr0qnJpzzZpf65toW0Dbco=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(2906002)(5660300002)(8936002)(26005)(36860700001)(4744005)(36756003)(41300700001)(40460700003)(186003)(16526019)(70206006)(40480700001)(8676002)(70586007)(450100002)(86362001)(356005)(4326008)(82740400003)(81166007)(7696005)(83380400001)(1076003)(6666004)(2616005)(478600001)(316002)(54906003)(110136005)(336012)(47076005)(82310400005)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 05:35:05.4499 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b07b33f0-93e7-4574-5b88-08daf527ecfe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT091.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4051
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
Cc: Ma Jun <Jun.Ma2@amd.com>, christian.koenig@amd.com, majun@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use debugfs_remove_recursive to remove the /sys/kernel/debug/ttm
directory for better compatibility. Becuase debugfs_remove fails
on older kernel.

Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 967bc2244df3..590297123bb2 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -55,7 +55,7 @@ static void ttm_global_release(void)
 		goto out;
 
 	ttm_pool_mgr_fini();
-	debugfs_remove(ttm_debugfs_root);
+	debugfs_remove_recursive(ttm_debugfs_root);
 
 	__free_page(glob->dummy_read_page);
 	memset(glob, 0, sizeof(*glob));
-- 
2.25.1

