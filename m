Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC5B451235
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 20:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8D96EA60;
	Mon, 15 Nov 2021 19:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3A06E8DA;
 Mon, 15 Nov 2021 19:30:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAyjg72HBRtmY9/3KGEaZe+iOF1UQo8NqJhdnvfVV8SLM85Lvx9aUCMdr3jARTpBxsL4IJFz+9/EQP3C/jaTK/upDC4Nf1fms5+Z6M/RoMQet/dLHq8Kc5/dMWbMfukXxxlidRxcmshNnWMBff7whK4vFiAtrBNgitN6v5vF+74WU0Zu1NlcgBsQmU7y7Dr0nd59+EuMYnVosovFTf1+11PVrgWYw6LvoXs63CCEk0iQ1WPpDd7QhnpxVH4vqa7ZTwo30qqMT1AoSDdlfgZ6Lnm+1z1/1WIoXunfxr0YZQb/q8lEZnr7No/nWLv5VbXwMwG+p+bVkvlh9f+8VTxC3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsrkpUVi3WNypHl5pcq6GxPYH8jyCkc8S9h4vZu1cNY=;
 b=gFXujLVbcgTxp9+aamBrh5E76MMkBLkRxbc8Eg/ahA0M9G6AARWsDVKJw41jBS5aOzFn2TgcBtsUjLQplnuEwON5xHzQZSPRTZoLaIgsuqkrx7VOADTPZR/ARA304Dc2Rfi1p8xgcuzxIjy/M2c2H9XaP/i2W223A1J43xJIr0BQlg6lpMn2wTyaTyKabislGydZjETW1UL5Pnxb2kHOX880Zi8f3RhswnLCEchYJu0y8vVJJABSgJLHskxPTDSjqT30aOEcgPyb8fQARH1hOQllIz0uQ8dUJnob2Yd+o1Q2XgBWI/X2O/e3eJw4QN8XehVf2TbozL/ofU1YjqynZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsrkpUVi3WNypHl5pcq6GxPYH8jyCkc8S9h4vZu1cNY=;
 b=z1i4NmFzVPCeqECMUGXB/17B9/HmR4eGm1HU+aB5A7nW/R3yrpL7sK3aJkpR4H1QZrhp3KWvLo0SzkNOi3ympHDcaydzBbRPO/t9xyAZghL6C/9WpNKzh1TB4cVef8hzfmIa03Qak42vCEQHtl47fkIHJlQesxqHC6DoRuGgfqA=
Received: from CO2PR05CA0107.namprd05.prod.outlook.com (2603:10b6:104:1::33)
 by BY5PR12MB4227.namprd12.prod.outlook.com (2603:10b6:a03:206::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Mon, 15 Nov
 2021 19:30:52 +0000
Received: from CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:1:cafe::3d) by CO2PR05CA0107.outlook.office365.com
 (2603:10b6:104:1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.16 via Frontend
 Transport; Mon, 15 Nov 2021 19:30:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT026.mail.protection.outlook.com (10.13.175.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 19:30:51 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 15 Nov
 2021 13:30:43 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v1 9/9] tools: update test_hmm script to support SP config
Date: Mon, 15 Nov 2021 13:30:26 -0600
Message-ID: <20211115193026.27568-10-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211115193026.27568-1-alex.sierra@amd.com>
References: <20211115193026.27568-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46c44be8-3f9a-4b2e-86e7-08d9a86e6f8b
X-MS-TrafficTypeDiagnostic: BY5PR12MB4227:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4227D267C8E8F5345DD1AB37FD989@BY5PR12MB4227.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +O9GwtK+Hdqghk11SXATYwcmt0sHW30dEiXrAUuan9p6x8GYwPlGeqZvo0RoIL50muGDGc8uclHZ3IWSt/V/s3SEc8tYZ5DkUA+bJpAMLipw1UPJ2mDTQjtFthJV7+GsTCyWHK6siZqNJGjo9ggdtk6qM4jZ5kwnuWZ5807DHAYLjkJ9cRgyi97vZetzpd8Z/OZr4VuotW3a9eiNi6qq2KJnWqI4aljpKDHJ4u+fW4sGsTP19nZHNHcqCTiH5koNx+UQdHR3Ijy5DxVmSYEVtSiXhBurd1w1I1dkNpYuhswaDQfQxojBwWhbvaikFBLVZtmHTZgVJ/p7ZEAoYqkOav50dU4iI1d8YZPMmLg3lix+2ITgw5iS32+ByfCYhsQQF8casa590hT+VSGkJGUTWowavlOoYB5qcLC9tleMuQ1hVWnABXdCD5kVJ5FAUV82o6e99vJZyixW/MBvHiK3GMuZlO2hTEqhLZc05yXxtuKf+UTzznqzBVrEdyTEkTAmHFeB1apsCtdYXy97/oPLW/pZtMGlU1oGzN+Mp19zfXzNcgXcNZpoUdogtL0A8EFcIkxmmVKhmCAi28/s1yqJNRk+0P/q7Fo6L+mN8OEt9GtFXRKiZd7857dG2xJ41n1+GCacWFlKDbWDYGZV32CC3UHakep1Tm5Mx8pmVTiikgKD3CofQNUZSCAL3TVAD4YPvO0+2tqjAs+y1jsx695m0fZnRjOZH0hMj961SXG5J20=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(2906002)(426003)(70586007)(70206006)(86362001)(356005)(186003)(8936002)(16526019)(36860700001)(1076003)(82310400003)(6666004)(2616005)(316002)(8676002)(508600001)(336012)(7696005)(7416002)(83380400001)(47076005)(5660300002)(36756003)(81166007)(110136005)(4326008)(54906003)(44832011)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 19:30:51.9330 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c44be8-3f9a-4b2e-86e7-08d9a86e6f8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4227
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

