Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A504A019A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 21:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E782610E382;
	Fri, 28 Jan 2022 20:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6936A10E2D4;
 Fri, 28 Jan 2022 20:09:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqHfakSEk8IjJXrLTYCRBAg6UH8qpoBWsRclBTaFQ+T0aH3Nl6TEwovUEjNYGs1JWOAWWUcm1doDXaSHI1n+3ZvtZE59yfNa/LmhzWXeV1Wyq3zRWawSbjSkjI74Q4pP+sCe8l8e8C7/XpD6xnVCf2/c+U0gGWI8FZHsz1vzJqFABy/xN1D2uUZBlp3zIv9rhuDbbhk1mnOlqlVayRmSZaWsp+x+zPg62o/12BuIwtuELoP44fXnC3/jMF2Ln7Y2m7R7CfmsJN7cXX2FEDRdYWnlParWU0t1qh7uU2MkwvytJWBjmnrXLP8ThQyW50ToEVnDDVzwAv8k+letIwIs0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDL5uDl4x5PP58sGfZzqW2twsdvQmLh/V7W17HRkHFY=;
 b=M5u9mEOdUp7uJyDWY6jQlU70KN97ikPRgQKY6ohVN4pYbXrDkoYY5CJG9nbaS1A6DGOPrDZWrDGEWiiWEBaVDEQReLsXRztJVoYoojUCW1awwzXOngXbiROd5vahr7NbgYKfQOtUYjuYVM0xTunnOQUQ7j36p8tsXYfsBLlfq0mm54O+LtTuqd/zp40OkQx+qfK5w73Q14Xr2nhJ41oHBlCo+fk6P/BTJ//g1pVc7WK9aw6XfmHcH0Ol8/gfLeVNiHo9K5FqvKuWji62kA+11/BGeEwr0UI7hftXAwFpqC9IdzWdk2Tyywm+nnfwnSLIADl3uDDRBcdmrkDcAxO+Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDL5uDl4x5PP58sGfZzqW2twsdvQmLh/V7W17HRkHFY=;
 b=MOjVPJNDv/1rC80k8EYaeqVaWOQrU8EMx3CxDSajQ+0tI3aVTTvVVnIwIMO0zEd1KiZdKU32d7WCuv2+Y5H3oCUuX5iuxolpBpJ7On8TEaHeG7frBuBfYp8GOd2CBjI8+/MGzPq8KA9S/dlWlqANmX4M9H9I4t9NjrXkXvvLxF0=
Received: from MWHPR19CA0056.namprd19.prod.outlook.com (2603:10b6:300:94::18)
 by BN6PR1201MB0052.namprd12.prod.outlook.com (2603:10b6:405:53::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 20:09:00 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:94:cafe::e) by MWHPR19CA0056.outlook.office365.com
 (2603:10b6:300:94::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18 via Frontend
 Transport; Fri, 28 Jan 2022 20:09:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 20:09:00 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 28 Jan
 2022 14:08:57 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v5 10/10] tools: update test_hmm script to support SP config
Date: Fri, 28 Jan 2022 14:08:25 -0600
Message-ID: <20220128200825.8623-11-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220128200825.8623-1-alex.sierra@amd.com>
References: <20220128200825.8623-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97e7f67c-55c6-4862-ef65-08d9e29a061f
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0052:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0052C37B1057A25B41E02593FD229@BN6PR1201MB0052.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +2T5nh34ioIxjN87a9q8gddyNeIcdDx9U/Ql5pQJrbHYFgng3tLzmVTuZ2Oas4JX4+F2mwwWPEGC1TheIQ37BAWEQN0ZN3rdb4jYaAlkZ5eXuR/vWsHXXNmAkEeX3YKH1RU2UVTjX5/4wiCDbgSiIh88812Fw5ji5NfoeAFIsPPqdxGcA9Ld7TwAkiFZjCmFWdo2qp7htmukxC+8L7C/QHKf3mTu4EBuihfFlILsHuWURgdcCWnSUXvlvuosrwaADDqbB1h/U+a00MMLxdITkKi2yhb5myfjY9dJdtso1GdnkTweiUJA4Q6dw7jfyn26BYpfgxWl8YQkOHEFQkaAYAd8W09GWDjolynON4T+PCwG5/qNccQQ1vAp+hQne0ednJ/vznCL1YcxmrOubFQLpw79TiEmcCMO+HRRAL/dumPS6iMdoRAMP7LkAiPh4t3xdo4XuOMCU6xA1YPI+eB1Ss84I6U2FilvJ0juFcjsOIQ2n+U9cp62GnhKnK1pzcUWEoYpAvc3uCU2cBnMMPoJNX8ObS/USD+1Ikp1lYhIi914//s0UN4jSx1UvcA5iRH5rM1C8SM2iUrG0DBTCehrz/7+QGlyUB7kIRZ6+eJcH62z8G4azrD9wahKhmLFzH9AOP7vEwUbjIMK5nVkcrOjewaUO3bcmELaFP04hivBxgCjtglGKZm82mJIIBYoS8MpmxRJloz709WZzIr8ZHWQWw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(1076003)(82310400004)(86362001)(186003)(16526019)(2616005)(26005)(70206006)(6666004)(356005)(40460700003)(8676002)(36860700001)(54906003)(508600001)(4326008)(47076005)(316002)(8936002)(70586007)(110136005)(44832011)(336012)(83380400001)(36756003)(7696005)(426003)(81166007)(2906002)(5660300002)(7416002)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 20:09:00.3514 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e7f67c-55c6-4862-ef65-08d9e29a061f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0052
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
Cc: willy@infradead.org, apopple@nvidia.com, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add two more parameters to set spm_addr_dev0 & spm_addr_dev1
addresses. These two parameters configure the start SP
addresses for each device in test_hmm driver.
Consequently, this configures zone device type as coherent.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
---
v2:
Add more mknods for device coherent type. These are represented under
/dev/hmm_mirror2 and /dev/hmm_mirror3, only in case they have created
at probing the hmm-test driver.
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

