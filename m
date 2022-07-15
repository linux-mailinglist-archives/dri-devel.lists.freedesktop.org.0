Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153D9576EB8
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FBC10F289;
	Sat, 16 Jul 2022 14:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2075.outbound.protection.outlook.com [40.107.101.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8C310E06A;
 Fri, 15 Jul 2022 15:05:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTudni9d/7eECfnm6r5HwLFcjVR0l06sWNmnAtJiKPv5PCvAJIBFLMBqjx0hG1GJNzBMTRtqyuCyxPFCC+9E3I1uECVsHnBEngMJ5EPFBn02XBN9HfcTxBJSmux4KnibZTDXhhG2GBsGtI/4jNSjjXSpg1Us+S2keUl0AQBpWo1eN5bFyZAVTwqZB10vCi+InL0hghQ20d08tW3S9Zo8z5woF2JA8TbPLkQnYagxTXa3R1sbWzHH3jvd0GBcGR6YTFzo1vCOPwPwqB8nRS/qvcUzF6PG+WeZXOTKZjCcVBr+wDtyJM3ClI28opzx/yPeWwvBtrOcZbI6tsTcgf7Nig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ds2C6hKBCPm3LMFGvWFrTQmYNyEijOJ3/DIUhvifx8M=;
 b=NqlVcfA9WUJO3WGqLXRI7P50BflhYPP+v1RCqUVTDw2mv88hJyPhnM3/zzwU8PTQEj3hYgsXNSv3bTAjMVtMq9GiopLrZW5hgj/T5aFqIx8+ANwn9//rnbvIgjvT9zmHFWxPwOpzXesZ+D/6C5h7XuYs1Phfo9SlReoAPFyOr3Srcq9a9S5a3uk4pw9uWcKGDRYMNnT5v11DJ/CV9Ok0fdGaNqTm2551JTiigQGBpx5E/3hSRtcEDbXzTEqM84FAuh2SGgtP0PlzKpYMI9y0r9rA9095le1ge+C3WmkLTUvVz3O6E0LH8RgqtKZLI/vF/0uNpLqnxCTPjmbyvFeTpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ds2C6hKBCPm3LMFGvWFrTQmYNyEijOJ3/DIUhvifx8M=;
 b=En/2Oe20ruj0pbPmWdnh17SdS8PB1r7yMIjshvGZOjJXtRrnwaWMl7nUODvAPQl2rpUDNAY1t+mjMa6sjKGvF9UF+wKn+70wPugkd3jkfZP2waS6K49e+PuK9s/QQEVhubrln7vSkGEp5S+9ENBX94E11ytudQNmhx2IkkCijKU=
Received: from DS7P222CA0027.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::35) by
 CH2PR12MB3989.namprd12.prod.outlook.com (2603:10b6:610:23::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.23; Fri, 15 Jul 2022 15:05:52 +0000
Received: from DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::1f) by DS7P222CA0027.outlook.office365.com
 (2603:10b6:8:2e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17 via Frontend
 Transport; Fri, 15 Jul 2022 15:05:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT045.mail.protection.outlook.com (10.13.173.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 15:05:52 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 15 Jul
 2022 10:05:47 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v9 12/14] tools: update test_hmm script to support SP config
Date: Fri, 15 Jul 2022 10:05:19 -0500
Message-ID: <20220715150521.18165-13-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220715150521.18165-1-alex.sierra@amd.com>
References: <20220715150521.18165-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29220a42-15c5-4ee2-dbb9-08da66738277
X-MS-TrafficTypeDiagnostic: CH2PR12MB3989:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /VYrSA2SS9Qkj13md4crjZzx7QSMBibevN8VWzZaIQ1PPuAZ3XfG0m7vbz1c15sS8qLlqa/jrjVOqbp41hHaLXVopPbruqi4wO0Xp5w303vfrdcKV04wn01G73iAZ/Q/XN95tFQXqLmN2ABPlcF5VAa1eVvFnYRBOCiVhJ/OHqWans1IKniUPWpYleGY7bYDoiwK5NFLe1Ygz1KrafPmTipYfzqk+il8s3R+b2mKoELnbmk51rUn29ItLt18UY/J81Bxu7l63A9tRl0OvPnkiBAUntfTOo7m102YFDsqScrUdhkSiPxImrkq2ODLDx0lTuYLwkrEDrEGl9r96ueNYjg5fjBk6DdJw0UfgbnZCZZJs+HSotbcX/eZvVXde8RP3VT9ofgdXVl1mEIGrtl4Fga7HvkFKFKDZ49arfg+vJ5vYfAPUPOTrH5gLcTpYZwnd3BZavxvRGbKze25Mor4LlEzL7+bFJ8KP7wmjvHeJWJMsePmmmXyKn7gF6/qVz/ZScosc+fj/f4K7seFhDSl8SaIccz773310NQHYyhKk2+vOsyBkGx2dRN0Udzyv06ixUkUIrnWeWlhni5uhl9kVUwsfjQNYRBEFiBWXRVT/sG4FN3Th097vziCoxSkY65O7jq1jbhm98s8EElt2A3NYyNG1ZhBGgrc6Llfkmo7nuSfNPBBDvSwKRXeGGEX9PE/VV46gjWZUHYy3WLQxVE8MTVB25xpB7d/zJDEDrViMEj/nuhDXDIWhiQjTESHnQy+S8IWYGiO+9HkFcewHHCYNFNSPs19c46FUL7QDanhRLaQXAS/gIg1+xO60BXokQE9P0eCKAUE7eE96gfD5dh7JrzDTt1t3NEatk2CYI9OJRE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(39860400002)(396003)(376002)(46966006)(36840700001)(40470700004)(478600001)(40460700003)(5660300002)(16526019)(54906003)(316002)(26005)(7696005)(2906002)(6666004)(6916009)(44832011)(82310400005)(41300700001)(36756003)(81166007)(36860700001)(7416002)(8676002)(4326008)(2616005)(83380400001)(40480700001)(70586007)(426003)(47076005)(86362001)(1076003)(186003)(336012)(8936002)(82740400003)(356005)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 15:05:52.1574 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29220a42-15c5-4ee2-dbb9-08da66738277
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3989
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add two more parameters to set spm_addr_dev0 & spm_addr_dev1
addresses. These two parameters configure the start SP
addresses for each device in test_hmm driver.
Consequently, this configures zone device type as coherent.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 tools/testing/selftests/vm/test_hmm.sh | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/vm/test_hmm.sh b/tools/testing/selftests/vm/test_hmm.sh
index 0647b525a625..539c9371e592 100755
--- a/tools/testing/selftests/vm/test_hmm.sh
+++ b/tools/testing/selftests/vm/test_hmm.sh
@@ -40,11 +40,26 @@ check_test_requirements()
 
 load_driver()
 {
-	modprobe $DRIVER > /dev/null 2>&1
+	if [ $# -eq 0 ]; then
+		modprobe $DRIVER > /dev/null 2>&1
+	else
+		if [ $# -eq 2 ]; then
+			modprobe $DRIVER spm_addr_dev0=$1 spm_addr_dev1=$2
+				> /dev/null 2>&1
+		else
+			echo "Missing module parameters. Make sure pass"\
+			"spm_addr_dev0 and spm_addr_dev1"
+			usage
+		fi
+	fi
 	if [ $? == 0 ]; then
 		major=$(awk "\$2==\"HMM_DMIRROR\" {print \$1}" /proc/devices)
 		mknod /dev/hmm_dmirror0 c $major 0
 		mknod /dev/hmm_dmirror1 c $major 1
+		if [ $# -eq 2 ]; then
+			mknod /dev/hmm_dmirror2 c $major 2
+			mknod /dev/hmm_dmirror3 c $major 3
+		fi
 	fi
 }
 
@@ -58,7 +73,7 @@ run_smoke()
 {
 	echo "Running smoke test. Note, this test provides basic coverage."
 
-	load_driver
+	load_driver $1 $2
 	$(dirname "${BASH_SOURCE[0]}")/hmm-tests
 	unload_driver
 }
@@ -75,6 +90,9 @@ usage()
 	echo "# Smoke testing"
 	echo "./${TEST_NAME}.sh smoke"
 	echo
+	echo "# Smoke testing with SPM enabled"
+	echo "./${TEST_NAME}.sh smoke <spm_addr_dev0> <spm_addr_dev1>"
+	echo
 	exit 0
 }
 
@@ -84,7 +102,7 @@ function run_test()
 		usage
 	else
 		if [ "$1" = "smoke" ]; then
-			run_smoke
+			run_smoke $2 $3
 		else
 			usage
 		fi
-- 
2.32.0

