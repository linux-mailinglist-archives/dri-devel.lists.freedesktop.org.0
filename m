Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B9A4A60B3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 16:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC42F10E6C8;
	Tue,  1 Feb 2022 15:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E20810E6C2;
 Tue,  1 Feb 2022 15:49:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgAt9O8rY8I55rJmjdVSQFFnuI7RJU9ofADgI/XESc3N3og/tRd/NsxrexEDbLc+NBc/zhZfyv8LYrtRSD4fVQOqTTeR6EQ64EfE+DRCZQdJVOzsk8HiKyQRCVrgDKNOgns5Aq+ovXGotSIrFolunkYLq3UccRG7ElphBsHpbpLZpYzJiMYUDrMigUWbqq/2JXlNH22cTQWM1mQh/awHc8+OATE8EkEI8CtYYjoVK29/0pfIUO8NZKw4en0GcUG1hZF1O9Lx0T5Vto5uNWp41xuYv3rHmQ9nXwyub1wt7X2JfUL6uotaZUsEnghKaa44J243knpmu1EO3a8ozpVXJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDL5uDl4x5PP58sGfZzqW2twsdvQmLh/V7W17HRkHFY=;
 b=c31Y53Ni4Z2O057h8mAGa1dIahRRHNFlGA4LS/S85VGjnbHpNz4i22lKvHFiUR+qcAh6bX2fF2BV0HiR0DuLtTJhyClH8RNQVsJu2FuH3uKP3J8/2AyeFETlMxm+Q5gHhZNtQkv2DoYlL4D06argiitW8a6cLfvn64IWc1BUkmYBUbHyzktS85Deq5hOWyCFblQUOBdT0YivmvYQYtXVlvOhJdJ2WH14ElYfamyBwdXR7q0TspqUn+aidzmZTBujpHT9fPy/CbJtv37fftoii6U2Ds2opYXNxIuWqLJarLcOcBM907QSKsT8f1ZxGHPMq+F1HQ2tShNm1SwvIutMCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDL5uDl4x5PP58sGfZzqW2twsdvQmLh/V7W17HRkHFY=;
 b=Hic/RHKFtk1PF1S7u8QtPEpVCuNyJ0+pH3iAQf9z1vWBUelfbvEpRNxL+5dragckv7IOqW75rbk10oOL1GzQbEFM5LgOTW3aVBHfeRt/oCf40CSAO6Kjpd1iElN0bq2tkRUHE6SHxAZxCbpDbCGD6OK64vlmqT/2C5JNgzpxcmc=
Received: from BN0PR04CA0047.namprd04.prod.outlook.com (2603:10b6:408:e8::22)
 by PH0PR12MB5607.namprd12.prod.outlook.com (2603:10b6:510:142::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Tue, 1 Feb
 2022 15:49:20 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::fa) by BN0PR04CA0047.outlook.office365.com
 (2603:10b6:408:e8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Tue, 1 Feb 2022 15:49:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 1 Feb 2022 15:49:20 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Feb
 2022 09:49:18 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v6 10/10] tools: update test_hmm script to support SP config
Date: Tue, 1 Feb 2022 09:49:01 -0600
Message-ID: <20220201154901.7921-11-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220201154901.7921-1-alex.sierra@amd.com>
References: <20220201154901.7921-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e45e681-d14c-409e-c3fb-08d9e59a6932
X-MS-TrafficTypeDiagnostic: PH0PR12MB5607:EE_
X-Microsoft-Antispam-PRVS: <PH0PR12MB5607754E65DDDC626062C77FFD269@PH0PR12MB5607.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /A2m+NXYHiQaJuzy55uHOz6JmPRwk2RBeBq+YVDw+mQ+HfINP1CtgFuYbot+rceFIoCzg9a30fAku9QhM+kPEH7rFqEeRw8iefTRMul27xk+Tv5MsO5ds8+XZlMu9qDPPfB4ZH9J6FzHwSNOYPmfsZjF6iyd621zhMdLog4uts2B8a8MMmL1H/ILfUs7hIwaMWlPgP7ey4fomOryYW6LxGOjfVEoFJUsD0J4cxEAjG5kfsTzgc+C3nmGJCvEIhoqKJCmS09c2LB028fon4jBeYSBYUOlHDVNatJ9KpmmHboxuqn76VTF1M7S+G4sc9ZqikO6yOFIOtiJvB+ASHAER6Op3YStAETv8xR27fqrGRadoznxL0T4bWFpcnjY9o/+NTDZwihtylgh9yRkfnXv7zwAPjy3Z/CLwGRV7k22CjyHi9SrOFch7poNxUS7OlXhlKvTq5m82rG/x/JFWLYckW+KfxzHgYryF+ovH8NBEtjHxK0U69U9slB/2HYMY53m8ip/GGF0+HO/0d9aIJ3g4tgmPdMfKXzdn681A3Q31FjxuR1Jp0cm2oyfre8+A4+Mh4IsoCZ464OyR1sSx0qb/2OAQyfDgGK+MNMbvs1rYWuytWLgxYKIIU5WyKygKHclzuraiUzNUVeEZ1BOfPaAyIyikUzPQwz5pkJ+i/QZB2jjvFpbzv7azOoH3qKmkQrdPRlCGrAGz2rASEd6WIn1NBr2H/2ht9YF7nurrRZuGi0oxy//FV8CgmRpUGEY9qjfVw+ysahqon2egWYmN95ABE0i+eOSAkNs9atRIDkpu7w=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700004)(36840700001)(46966006)(2906002)(16526019)(82310400004)(83380400001)(81166007)(316002)(508600001)(356005)(1076003)(8936002)(6666004)(7696005)(47076005)(86362001)(5660300002)(40460700003)(426003)(54906003)(70206006)(186003)(8676002)(2616005)(36756003)(26005)(110136005)(7416002)(4326008)(70586007)(44832011)(336012)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 15:49:20.1669 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e45e681-d14c-409e-c3fb-08d9e59a6932
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5607
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

