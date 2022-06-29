Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 938C155F469
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 05:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9EC12A779;
	Wed, 29 Jun 2022 03:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6C012A7A5;
 Wed, 29 Jun 2022 03:55:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lm5u8lhIDZUNDWB65yF1rU0LwVwiqHzfFVdxBnK4mtgNMg0Bca81U+DosPNgOC+jSNIKTf6NhOKCTKRGzFrOQvSQkImNnx6+9W0TxDacJTndr1WIc8H4gaZMTcHPq14ARd2ECN5BCbfjI1vwpYqfNkOW2ifnFP5zTrENK9QPwqkXQ+yciE5iGoFORK4zCr2n4Ww+gRj4CM2NrwwRYLzLdKROZeQNNyh2TSe4GGsauDQwIiB3aRhoFRyaKuiNRbwNDfpcNmIW9fIllrnYxxzAW4jqCBo5RKwDJX0MGY1SkxJnGRC//9RlZdDrAFR+X33V6jf6yRss2bXUCSkQ3ZN8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ds2C6hKBCPm3LMFGvWFrTQmYNyEijOJ3/DIUhvifx8M=;
 b=hzepG4Uspx0L6nXQvLSQddqjhZQXCl/2vT4H1LBlvs7mgja9i9U41VoJiN+ZMVZKhgHo+tdJW885aHl81r0UNc8MhlDQSzfCWU9rxvT9DLoiwGQiXrZOA7ssVB9VbY7KsdRUt/vXEwGTkUpQekkif+ktLPTzhOX6zEZHzt88LVyr0wE/Yjqc2a13/NEHFeM6dyl+lG6Zv/t0xviPEPo4CB3bZq6qsH1vl6c6eeRTEDIfta8gDQva2w3oKoVLEw1JCBPSTdPt5G5/J0YcKex1Orgz25Rj+EsmPj6006hFbzprFunXr3zMzSDggNwcAuUeoH/bjQ38XtL1ODmcjGTeKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ds2C6hKBCPm3LMFGvWFrTQmYNyEijOJ3/DIUhvifx8M=;
 b=zW+uOEC3v80zhr9Bt/FX/lHLw2zMYs9xjyJqEKr8JZc969gEIFpTBdh7D5w+GBy1TBdU/+fp5XqiDo6dnDOLj7kUyO9lB+g/hxDRndpJ4X9b9y76JzHgff0WjOmXa0hPYf8MiAe40ghcsg+IZJjFo1k4aJIK3TEUNax5SeM9ZFo=
Received: from BN8PR12CA0036.namprd12.prod.outlook.com (2603:10b6:408:60::49)
 by CY4PR12MB1783.namprd12.prod.outlook.com (2603:10b6:903:121::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Wed, 29 Jun
 2022 03:55:15 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::55) by BN8PR12CA0036.outlook.office365.com
 (2603:10b6:408:60::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Wed, 29 Jun 2022 03:55:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 03:55:14 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 28 Jun
 2022 22:55:13 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v7 12/14] tools: update test_hmm script to support SP config
Date: Tue, 28 Jun 2022 22:54:24 -0500
Message-ID: <20220629035426.20013-13-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220629035426.20013-1-alex.sierra@amd.com>
References: <20220629035426.20013-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27cab191-828e-4623-3751-08da59832c93
X-MS-TrafficTypeDiagnostic: CY4PR12MB1783:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S9RNIyiRYRhBajAypwHhj+a6KL2MJwmklesOyK5Y1LEDXL2XH3/ptW5Vo75crGF1KkduejS2R+bltYHK+s4hHBy2pLxaPXG/vletSeiPvyBdqodbu6SHppyvlRZW9rZjIuhNxSysOOknJp54mEe8KWa4hbbKPznlUcRpb5JhJa4Catw0Zif09busUWZ5Ga3SjKlajNVAj+Q3fSI4/Vs9qokbDdkDs2UmmGSK6+o5KjLLMJz6WgVktRkvdnq8IbQFqEpgVJ6CtOpXIulIOYWOR8KNdNGyqu1N/p/qh7i9OfvEhoEY9+ujUvZL6lZn4MMMUcCUUvibutNraReGGBgswZfDc5J4BFJr0RkNAS82UmnYf92QuRgdPwRQSJ+UZeTNrgeKW2vjYwMlc76oHvbRBYE8ASYF82AZ206qnm6jhdAtEs1Po8yWGCkspmsru+QUCrnsO1dfctw5yYvrT70aPo7vpnjgvoa/Ib1BvEXsn+X3/ImWG+l1uwZS2wdGzPpeRCulp8NyWEzd+Ur/W38jGwwYNwoBWkfst+wsdOEl9cIxpXQS1Rz1GeMUhgrQPMLuiSFK6o9fi4QLd86Cfhza5Z16JEAOmnfeFGVWXysOijXz7/XCTAS1m0n+TsDhnLvJXMNAzWLSuZ/b7HEQNaOw903rhYAeIknzvE+fW65SFcCHsQxBRuuoGRum/rXGJ9zG4klvrfn2K//q9LShYs7ovwqK29pCKShlaqIPEMjiRrVqkyvhZRKqfVdr9X3tLUPUYuFQ8UM6E+I7WHu72Mtv+oIVdKmG2Djc2WjUCfiJYMHE+kRqRq3P6n0rsziHq3+f0egTeIgbW9sp9DAXhg5SRA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(346002)(40470700004)(36840700001)(46966006)(356005)(8676002)(82740400003)(1076003)(6916009)(36756003)(70206006)(16526019)(47076005)(54906003)(316002)(186003)(36860700001)(4326008)(70586007)(82310400005)(83380400001)(40460700003)(2616005)(44832011)(7416002)(26005)(426003)(40480700001)(2906002)(8936002)(41300700001)(336012)(5660300002)(478600001)(86362001)(81166007)(6666004)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 03:55:14.8998 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27cab191-828e-4623-3751-08da59832c93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1783
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

