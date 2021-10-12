Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEB942AA89
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 19:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF47E6E5D1;
	Tue, 12 Oct 2021 17:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4B56E5D1;
 Tue, 12 Oct 2021 17:13:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MidAhIUk94iimxJrp5a4ElPHGPX0p+HYvsliDBIOykluI5unwxEYCInu0oC+5+CDFpYbQOaVxZCZt0jTM513qLPnU988vUsNcuGCzNHvERsN3s6bwZBAxjhKgEpLqwncPp9chndz0xVMy6uR0HlJsakf8NTALUqI9wnhrTnEnGdPUzoFipgEnqNZlaE4BaC6tihqwL3pio33Pvld1Hyol91zfIHL+NEAV9tQroc9CwDf0AA85STPGqWwE0gQvj3osJy3Mu8nC4stGQbcJfl4+Nxn1uiWOpf32hE8LH+GPOvKrc5dVaB6uecN/l/8qSJZp58dPm4E1tWCrY4qSJ3/6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsrkpUVi3WNypHl5pcq6GxPYH8jyCkc8S9h4vZu1cNY=;
 b=Ozba9FL0hIgpChSvfQvNj0aXwwEUIShKoirtd/aGOJSDnUpWDb+apR6UCpv3NaasBOD3Q9ozf8CEs9QLOwTotVNOrB/9nQieUSETlhDKaVgjHtyq/umUIVlbraFdLMt8izfVYVvA77MvfbrNtWtm8k2Y60M1nIsJC9UgVeHjsNnFtRUgmct47kHNqsslqBey9YUpke5TqHySxexLsFAilEuUXm1HUxscf1lL42bzjjk2MSkxAHH7foEUVic1RaHnfF0MOL68zI32FN1qKFiZlU3bHZNPd06lw74cQTAcz+GwDbW+OvI2S58sSl3VLXcuMfHHQP4Y3BBiDfLpOGP3Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsrkpUVi3WNypHl5pcq6GxPYH8jyCkc8S9h4vZu1cNY=;
 b=fOxFy4A0+aSEk8/U8WSquGzLWQXv6yRSo43ZZQEveGU5S92Ad6liZ2KZu06KUSfgmOr68R5DsLmeBw1g3MeYtTEdJsn1OJxRf2N4DQrnTo0OxAVFU64ogTdsNPRwx8l6jM0MtPLMZ0I5Lay3noa8IOnAf85qC9eDs5eYladLmcA=
Received: from MWHPR14CA0008.namprd14.prod.outlook.com (2603:10b6:300:ae::18)
 by BYAPR12MB3478.namprd12.prod.outlook.com (2603:10b6:a03:ad::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 17:13:09 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ae:cafe::84) by MWHPR14CA0008.outlook.office365.com
 (2603:10b6:300:ae::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Tue, 12 Oct 2021 17:13:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 17:13:08 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 12:13:06 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <hch@lst.de>, <jgg@nvidia.com>, <jglisse@redhat.com>, <apopple@nvidia.com>
Subject: [PATCH v1 12/12] tools: update test_hmm script to support SP config
Date: Tue, 12 Oct 2021 12:12:47 -0500
Message-ID: <20211012171247.2861-13-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211012171247.2861-1-alex.sierra@amd.com>
References: <20211012171247.2861-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21cc2f9c-b1c4-43ae-9b9a-08d98da39024
X-MS-TrafficTypeDiagnostic: BYAPR12MB3478:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3478750E3AE99C7C4BD5D636FDB69@BYAPR12MB3478.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H/DkEskfCZ8WEoSjwiYli78ny/x0BlU3QJ8N8RYZ+/TzPfDy6KVOo4vlq3ZJHyEvSHDdBs9VT+/4U7KMsast4Eg+qbwj7B8sNj4A/vGTGy718i7Jwro243sYk5YBTuwlaskvi8YST19LWTClDR1HJgfcev59sDKuQ/oXIZ/5MlT3COWp3UydMaQofJyxw23V9CNfa8q9ER2ELU0TjAiHb4ZR1bqmlJ3Bn7ZHbGLVInAKXAifdzcODry56gpuVWqJlO6+v+KPZ4SssF2Rau1aRN9HxT8oxR0SIcIpdCgRJidNmIqJ4c447NFtELTjXzy2ZbrZX1gJlCrXkjHM7CkEclQgPeENZo2k9bE0qgeG+ROCksRE5mEdFWB6uHEPIDEX2keBSWz9SHOaGiiOS168WMx+0yhzKt19U+o3XZrTjgVchYOS9zEQrkCiFXoNr3NJpStRyFvYQTZrMGxfWh4s2JioJomkLAQZuxCGGObHTIqVaPaKbfweYe7VLMCDBjPpEBAyKAxiXqCYNS6Vdb7NldtrUBzCDrVQoN1C5OjOJWjwML8m/J0hj/gvrlX8XyBwysJtcHa+TuuqxDPYnc1TckfkYurAjqOmzQspgWCIf8UCxEBSKglJyG14PGfhz+cR+g16JxK14e0PfJrrNObqMuUHIjdOV4P8qupdpPpp4tSmu6R9AErxyQNs6KP/DJcEvZyWP5TaD/YpWT0poaDx0O2KjY4V5G4J8+k9FJEQCAs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(82310400003)(426003)(86362001)(1076003)(5660300002)(2616005)(7696005)(4326008)(7416002)(110136005)(36756003)(2906002)(8676002)(54906003)(70206006)(16526019)(70586007)(6666004)(83380400001)(8936002)(336012)(44832011)(316002)(508600001)(26005)(81166007)(47076005)(36860700001)(186003)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 17:13:08.5472 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21cc2f9c-b1c4-43ae-9b9a-08d98da39024
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3478
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

Add two more parameters to set spm_addr_dev0 & spm_addr_dev1
addresses. These two parameters configure the start SP
addresses for each device in test_hmm driver.
Consequently, this configures zone device type as coherent.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 tools/testing/selftests/vm/test_hmm.sh | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/vm/test_hmm.sh b/tools/testing/selftests/vm/test_hmm.sh
index 0647b525a625..3eeabe94399f 100755
--- a/tools/testing/selftests/vm/test_hmm.sh
+++ b/tools/testing/selftests/vm/test_hmm.sh
@@ -40,7 +40,18 @@ check_test_requirements()
 
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
@@ -58,7 +69,7 @@ run_smoke()
 {
 	echo "Running smoke test. Note, this test provides basic coverage."
 
-	load_driver
+	load_driver $1 $2
 	$(dirname "${BASH_SOURCE[0]}")/hmm-tests
 	unload_driver
 }
@@ -75,6 +86,9 @@ usage()
 	echo "# Smoke testing"
 	echo "./${TEST_NAME}.sh smoke"
 	echo
+	echo "# Smoke testing with SPM enabled"
+	echo "./${TEST_NAME}.sh smoke <spm_addr_dev0> <spm_addr_dev1>"
+	echo
 	exit 0
 }
 
@@ -84,7 +98,7 @@ function run_test()
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

