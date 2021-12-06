Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D22BB46A530
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 19:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6A0731C1;
	Mon,  6 Dec 2021 18:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2064.outbound.protection.outlook.com [40.107.101.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B392B6FDC5;
 Mon,  6 Dec 2021 18:53:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoJMBLTgHjw+bqqYlEu5KNL6MvzxZWUJtQ35Iu4vK3WBBPCQ3SZh4VnRM7TI8X4T0iZ4Ol4TKlvQnlB5MDWAQhQ46HlZ6HyqEd3OhlOlSVtXPCWm353fWsDBwnnGRld/3n9svRIHd7z1dhrCMH/gSDnaP3RcaLkg2zXX9Fof8u1z0dPw+/kJtbgZ5xqOf5vWCFCL8jk+uXdxEl5HKH494AhLqJTrmonLcb3T1reW4O40teO302nv1QarB0qo0t5gX+kSu8Bep6Gk+ciPzbIiahmE0qU01zhBDkI1HscVmd+/vv1WAsA5NKHEEomzjJaPXxd5Ohw8yrLC+ztXw06/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMa5qrx9AJg4xq3M6D7OFYh8eAxFZuH+yW4OoaMSRuc=;
 b=ZHnBVYIdsr4aCoO2nP4dDjruvSXltKx1VncclefX8lXBzVpI10hlrW9RxiMqJ9ALiNlHMLDkeUlsdqpGsq8TFNp6c+VZMldJike2GGYn1pBCoGkQSVQiI02gI5b6141xYtqhxvrdwlWqD0Ka8nEP90KRPR6whWrVgYBputBpqcp6RDGAjllDnbfY/QW5f5EuKPes3Bz3s/Le0NJzrJPkEEXkQx4i3r7PXALdzPddyUtV8oHHekztZO8TeWE7h3wkb0PPzZS9YtM9eZL/miJEh/vSpBBt6uS7XSvlUV8eOYJ2f1gaTJ9OFbcSNkJIGfg9W5ggiF+/CqMxjxcS1f7KEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMa5qrx9AJg4xq3M6D7OFYh8eAxFZuH+yW4OoaMSRuc=;
 b=13ZgGKw1s9dp36AL0scyArffA+mKqsfEqKS3K8sFP9SssBdLkYvNsqCaupliTr+EIZbCQvc5ot/aqfvTEtR8FlDnzJpYJE/V8pAro1P3tQ5GFrhPsv7CNclpdwGgzJw+S0dUjvaVT7pgazukOtKa2fRU/A7VL+SiNiNX3s+2J1c=
Received: from DM5PR15CA0065.namprd15.prod.outlook.com (2603:10b6:3:ae::27) by
 BYAPR12MB2981.namprd12.prod.outlook.com (2603:10b6:a03:de::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.19; Mon, 6 Dec 2021 18:53:10 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::38) by DM5PR15CA0065.outlook.office365.com
 (2603:10b6:3:ae::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Mon, 6 Dec 2021 18:53:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:53:10 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 6 Dec
 2021 12:53:07 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v2 10/11] tools: update test_hmm script to support SP config
Date: Mon, 6 Dec 2021 12:52:50 -0600
Message-ID: <20211206185251.20646-11-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206185251.20646-1-alex.sierra@amd.com>
References: <20211206185251.20646-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34c2c80a-aa36-46c1-efbb-08d9b8e9a605
X-MS-TrafficTypeDiagnostic: BYAPR12MB2981:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB29810A1381649F4FACBD3ADCFD6D9@BYAPR12MB2981.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QxTM31S0hT/VklGNR6vQT3VmtgrQHIZk4XuNslo8N3NbOciBp7H+S23qIgWQdL6YAPH/MnYdn/znE3hNcCW7HCemjwogpjR1oMw2QFiEtqLpj9kuagN/Ra4AJHOIIwDB8S5fe7uP0z1zA5s8K7PCuc9omGvSdE8bI9oiOztVjwsEdSg0/5M1bhZE95pnABw5FOqN7DAvl5qejDMI/uSxfSWVDY7qqQhzZxD9RRFD6Oi1fbvwzT8Y1z8hqR9lFRxTUNyL4Io5l/ZWeHrW8D89FG3gnyeRxl+UmUKNMQ5ZR3Vap+GQ2kjaSiKQaFVT8TFCrfi0oV75gD7ypjbiTgBG+7U1PRqIuPNBKmSgCLpBGzW2LTjJSMrsPT+UX3WeFHH417TVGSwYN0/1kX6mIHQ0SlXqz3mQE6q7rhsV/yJ9rdqKzQSQPkMdlRJJ1x8u8bugXYOtRevl2O+X0UX0UXuqWFN1JsCailwZZntAdJm9yaqzGXar9YagR8tWj4osMtQ0/Zg7qjDM1oNUPCHg0xsE1brQLr2F2ZY6WGMDKCbDYp0nO/iTlSR5CmaYjbigTXcfxhZid/M/k+a73d88MykcVdPz6g2u3GMFH1gEkWKZ7mTn15xaO1jmEpmeYmcnO3HcaRPz+M1tLud991MUWYCXD0c3M8GW6Cs4qs6IhnnAyU7GINVQZ43uJEJK+AgjhYAd4wLpTP8xP7tlF5zMTAevjymZrCGB8/czT1jORHdfgwZ2aHeqiMSg/+B9ByIpcxOjQbErtWoj+hOLAY2HbwkISoguW4t9K7wBS1nBQ8GPEJw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(44832011)(8676002)(508600001)(26005)(40460700001)(82310400004)(2616005)(426003)(7416002)(5660300002)(16526019)(2906002)(186003)(36756003)(86362001)(336012)(8936002)(54906003)(110136005)(316002)(83380400001)(356005)(81166007)(6666004)(1076003)(4326008)(36860700001)(70586007)(47076005)(70206006)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:53:10.1152 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c2c80a-aa36-46c1-efbb-08d9b8e9a605
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2981
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

