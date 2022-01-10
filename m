Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C020B48A300
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 23:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7A610E393;
	Mon, 10 Jan 2022 22:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C1210E3F8;
 Mon, 10 Jan 2022 22:32:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/UnlM9YFf1Fjjab8H5uL4cYfC/e4cTX1DNCOTR9l9JezeJTRGZje+S3utgiiMIuLZzeDUpooJbizawIvIUsCQjZGk58uOhd5SfRU1rM1UAsG2UbEOMgHr3g/ZsBzUZxMwVp1WrqTpJ1c7bszHknG+xYmTwbxlXwHGn9Gq9Tw/E61iHwQVmmscQ16C4ZsEzBeHZXtVQFIp7nfFhtiW/wt6ehdsdf3yYKIofRRBbZJvqu4D01zBrNw9nj0J5vJ2K5lYXmWRbSVtUQZ2irlyUiI/ixuMaNhzF+vEo7pO7lxx++SiexC5JUeimCF2K+itiMMVyVOOuYdkIufvRz9Y4PgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMa5qrx9AJg4xq3M6D7OFYh8eAxFZuH+yW4OoaMSRuc=;
 b=egno7kbkS5oiEYp8yiv8Ekv6qTHUuGjhwoux8Ar0BX8ZVETxXsgZWORfjnyseIMaTlj26u/uZ3J2rFmqg1FPZR2aAbaoEpHj5fXHxJ9hrekwNDRwOcK+i5bTRqhbcvNNVqvbgcoln7u1QWiRJHoPg76DIV7TOHaBn6MgHJ/pT02QuURUe9YJI2nueWdg2dcjj2vJSt3biysLEf/jDVUcUs3SkqQcKYZfO5RIQvXP9bKXfo6C64wPB+nTiPVvJb+G5QxWEVEPbfJgDALSK27BTCXDt0B34OHweM5Lfh5ZBaLOs89GHj1UFNNuXvclt+YroCpHSJeLfto3DqVEHiMJ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMa5qrx9AJg4xq3M6D7OFYh8eAxFZuH+yW4OoaMSRuc=;
 b=omIRBs4+O0594Ezgds48COM9tvgpBW6fr9FHr2IVYg18PiQcjL6QqHHduFbdOd5CVxY1ouRl41IfejN5WosMdicbzObj2eb9cMNI9ZjxKIpn/SP3308oNFW9+RBZaSU+2JKQjfpc7OiPELoJ9NBIdm6WKV2a+QzRDPBimMi8heA=
Received: from BN9P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::35)
 by MN2PR12MB4240.namprd12.prod.outlook.com (2603:10b6:208:1d3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 22:32:19 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::d3) by BN9P221CA0018.outlook.office365.com
 (2603:10b6:408:10a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9 via Frontend
 Transport; Mon, 10 Jan 2022 22:32:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.9 via Frontend Transport; Mon, 10 Jan 2022 22:32:19 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 16:32:18 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v3 10/10] tools: update test_hmm script to support SP config
Date: Mon, 10 Jan 2022 16:32:01 -0600
Message-ID: <20220110223201.31024-11-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220110223201.31024-1-alex.sierra@amd.com>
References: <20220110223201.31024-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35926b9a-8bd6-4e9c-1258-08d9d489101c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4240:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB424073E20DC22074ABA8FF29FD509@MN2PR12MB4240.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JfLMGuecMQZ8afci/7ePDVmCkGk4ZOJyq3ZtCsWb4Fgg4sq7FSRuMA+LV/BfKOzgleeIms2lVIoZVE5NvARFrcjmRRKK8u92PwGajEqEDgd/HdSekXxSrY6P7C/SVGCfOGFEVTXGTOScbTl9xihjIycv0EuQo6clmer/KeFAGS184EGU3BLI4/zMVx9VHU4HSEaI1eZGD06D8qElZ4/lFU9hdHXb6BlMw1cse1Iiz+KUgyUiJG/50YKj22XhhDFYtTBgLS6vmdf4vAcRjCtG7HnjvC1rLWr6pLnPbDecQb8AMO4JDb1GnmFBtKpspa+FhoZ5Bgfy3KA4cSQyAWHVC11dATMGP3ZhtkUd7Wbq6i6jD8vJfeLLSoxqqlbODtKqzXIMnhm9oBRa13KsqcV9ylhnZdVAWjGwMO8H+IMuq2mheoF+usWPhxV9gQXH8MAoSoz+XkgXqklPagAV3218PyFOQI7iLYCW19YhEr3mtndTO0pVvGsD3RwubRHfxPxRZjw3uJb2i/6hPLkXIWmkR3UD1FPKiIFlMraMdgukx/9VrzWdVkeatsSW+Z6anG7MTaUG5A1uvBxC9kpOqSqaDKhKBX1cKh69/JVZYGEMQomLN35hZwbPsrYdknfwG/BHZviJaA3cYeQac3FFc8wYdjiFXT42uUXldPchFVNdAh7tHdGRzWfcBEQ81ouhELBRVmVlwUuAX9Gt0OmH49LveXlRzrntAV9H71VUAwZKs8v4lWTAGG5PRtcQBznwmFGUTLRkD6drw/plMRBPKffJ3n6oAeDdTvyDBasLH8RG4PU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700002)(6666004)(36860700001)(44832011)(36756003)(83380400001)(356005)(81166007)(336012)(7696005)(7416002)(26005)(508600001)(186003)(2616005)(8676002)(426003)(2906002)(5660300002)(16526019)(110136005)(54906003)(8936002)(1076003)(4326008)(70206006)(70586007)(47076005)(86362001)(82310400004)(40460700001)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 22:32:19.5050 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35926b9a-8bd6-4e9c-1258-08d9d489101c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4240
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

