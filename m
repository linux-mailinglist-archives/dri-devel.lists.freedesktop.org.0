Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 062325294FE
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 01:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B63210EE55;
	Mon, 16 May 2022 23:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2078.outbound.protection.outlook.com [40.107.100.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7131C10EAB6;
 Mon, 16 May 2022 23:15:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1pnwNVd/vd6yD+RlpvDmUMVDteM3Vvio0h4v7cQGe7RWhqOEkY8kwDdw2BAdBGct+rtRxWBQ+TOV12x8etNqWaDd/5QiCvmdsoryVlBhqMq6uDujw/k+PVn7yJdfpnCCC1kkggWfv1k324KKtX3chWAjtFVXoakbV/C/TY/RJt+SzqChQ6yzmSqPjkBvX+iZXcXCVh1myQnuVu5vUeh4XGDPIxeN8BvjvlgbKVyg/jvNvKwf/2JUgojiNGaPZtkRXeTVS5QIspZ+t+7VH42m2mdrBfr24mQQLjWH8wCpdwh7dF5XayEykRxGObmjCHwc/oCFOcGbEKMSK21dTFSRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ds2C6hKBCPm3LMFGvWFrTQmYNyEijOJ3/DIUhvifx8M=;
 b=GDQLkC6St/MwUk9t4qd3gcej/gJjSxB+seeDQmzvOPNxaDAY9vah8pRTdi7bYTeWLk0GCLt13ikB7UuFzrwVx4yQlW0rtldbhhAIsKmpVq/xZr7JNTMKmUktdi6xhSBm7TClGi9ZNvsMmzeQsnc4Q/BsODDzdQklmuo/EbDr23w9Pkk9NfjpBzC0MBa5zlVFFRZfTrY+vSoB1tlSD5ZqHwBu7uAk61aZDQMWD7aeKYRs6GRJynGIzyLDRtMFdgUaVCribk4+MX7jLn9o2C6budItRA7lAUHs6jElHjVCJuZk0KIRDnjrG7A8nw1EQzE3LwZiIcCr4VGIa1Fp1HaNbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ds2C6hKBCPm3LMFGvWFrTQmYNyEijOJ3/DIUhvifx8M=;
 b=MvY5hrCIREeMeUOihUkvQqp4JKXVxGRAJUdzLgUgHkBlzI2TAOGWLjMStmJlmbtEq1R+xJUjZ//w16G1WWaMGZO5K7imOXddfoXXzJy6NNTlCmB9wFG1ZnizQjBgFpZ90g7n5A8CoDpsa1xrMwczOj8xnfxpi+znTCZZtKRm4Vg=
Received: from BN9PR03CA0717.namprd03.prod.outlook.com (2603:10b6:408:ef::32)
 by IA1PR12MB6305.namprd12.prod.outlook.com (2603:10b6:208:3e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 23:15:05 +0000
Received: from BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::9a) by BN9PR03CA0717.outlook.office365.com
 (2603:10b6:408:ef::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14 via Frontend
 Transport; Mon, 16 May 2022 23:15:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT041.mail.protection.outlook.com (10.13.177.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Mon, 16 May 2022 23:15:05 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 16 May
 2022 18:15:03 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v2 10/13] tools: update test_hmm script to support SP config
Date: Mon, 16 May 2022 18:14:29 -0500
Message-ID: <20220516231432.20200-11-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220516231432.20200-1-alex.sierra@amd.com>
References: <20220516231432.20200-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f54dd1b-7e43-4712-cf66-08da3791e995
X-MS-TrafficTypeDiagnostic: IA1PR12MB6305:EE_
X-Microsoft-Antispam-PRVS: <IA1PR12MB6305237B2DA6CE8D7E1D0C2EFDCF9@IA1PR12MB6305.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8c4pZ1gq6MhFIE8irMsc3thW1QW2qz2d/eYN4IpjVMrlWpByJ455oIryNvDeqNmlVpioB7Ni9noo8VISHxtfKABH0Er/VvWQREGM3Jz0/5ymJiPmCEsW5XtmqWzgVa8BPagff1VXEpDXbOI7S/EliQUg0S3N7HXtNkOJpTrWyJKKSPKxC9tay/r5LZzC9prr1wEEB4gNL/UBsGxU4zk4oVzBtmgpko51AoNoQBtjkwECF/7lea0+lNEK7GqhYurdwpLET7p1MLiZpkCsG0JAg3jE46tO8rpg1Jr29xAmAm438ZpVsBxI45jSFlnDWsP7sH8TB7P4eVOYoGTLf8z94rWnSC/P70avMaOOZqDb1SXAeLaNpjA6Bxfi1MXTw7v8rZS6+jzFYdd9nGHb9QNrYTYbxp9NhFslW8aEbLznZ5a5FXZeLaDeyBnz2m8hYEgkYOgp5AX/5gFdro/d1AOJuFyvz060ISGDwDW9LaXpxLePkDNCRknyWjEptlpgm7ObS1+6RsHzLFoLFbLDvKpIvYS1wbW0bUPCPrRr/zRJcQ4o3gbbiholK1hj13B/3okKwfmEXYaLfLfe7ymVWEsKEsEY0fGqMBrIrz0V1z/uJgpXskWUC/O/I8PkH/VMg+ywPXRi4RSCrd1VMEDILwVpwEcW/MAlxgS9AgliIwIT37O1e4ReeOTU5WUos8OMS8DiVX+0y9TLiCxXj63hzRK42Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(508600001)(83380400001)(81166007)(316002)(7696005)(8936002)(36756003)(6666004)(2906002)(8676002)(1076003)(26005)(86362001)(2616005)(336012)(47076005)(426003)(16526019)(40460700003)(5660300002)(186003)(4326008)(6916009)(70206006)(82310400005)(7416002)(54906003)(44832011)(36860700001)(70586007)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 23:15:05.4416 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f54dd1b-7e43-4712-cf66-08da3791e995
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6305
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

