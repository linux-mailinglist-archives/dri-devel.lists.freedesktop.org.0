Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2033955BCA2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 02:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFA310E702;
	Tue, 28 Jun 2022 00:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B8510E66D;
 Tue, 28 Jun 2022 00:15:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYQ5O25gHVrumu5rZ/NB0P6zATeJH884EQIONj/C9B1SfPrQ0C/y6c8cXz/9zQ0kmaGacuL0x4Q5fiH2fOThg0mgjeNKGaF9fmctFpRfDFrn5bWLRtK/A0c9Ksk4LOUcAZs/zyNep/h9Pxvtg12xrb29bOWp2st8ml8Ep0zroGtYs7aqKaJdnPid4HnWYynXaOlJfQ/vwiVUSDHAjd2+XDnFlpTzvavHCVjgxyQo7Oa3h3cXUgMSBIid6mdlEZwuRQGLRioIv6Ia1rAru+nrU3valgjuqpkSVmfstkSQFWqtoHKufwyXaEPrlAsE/1qBgw1uVDfaJpLuDYlKtAasQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ds2C6hKBCPm3LMFGvWFrTQmYNyEijOJ3/DIUhvifx8M=;
 b=GFywJp0jLkZBOgm/88WhHd7N/gTvX2dXTMHsm9uCqcMgdxzUqfNQKga2b0fGlBnqkySf4t5mr+/BF4Cdya0is0H6iGl/pFqB8QhQOaziuF4v6yZMmumFZ5bT1YPaiiAuZOV0yP/mQB9aF+loZb79WYx0ySw7WVzXYVYpTlKKd1ujgH56asLAiUTcATxt+IQ4N6gmKTcW5nKCZWHMDNTjuYyYtjE5ojvqlM5mYBzisFcOGnX20CEFy/hoQYkAIyJCIlO86/gPDFxVWKTI4WMQtNBATsTl2NCNYdDao5uAk6njQizfHeOM0xQ1noL/s3lt6HlXW31pbHv8KMrlh0zJoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ds2C6hKBCPm3LMFGvWFrTQmYNyEijOJ3/DIUhvifx8M=;
 b=chqsM+7/CYkrcvM0BdccFmEqhz7w1V/wZBOz5jHDoIekgAgX1BTLtjYa7WfZv00QfKC7Cw+6lkQQBqGrZ6Gb07RYrS6Z1q8IznXxSlvqxhfLE4o79mmr1w6f0p3gV5spx+K0a8aSX730g6Lyq6XAoEYAtvToXAfBrOHeIzhoP8w=
Received: from MW4PR03CA0162.namprd03.prod.outlook.com (2603:10b6:303:8d::17)
 by CY4PR12MB1752.namprd12.prod.outlook.com (2603:10b6:903:120::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 00:15:29 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8d:cafe::46) by MW4PR03CA0162.outlook.office365.com
 (2603:10b6:303:8d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Tue, 28 Jun 2022 00:15:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 00:15:28 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 19:15:28 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v6 12/14] tools: update test_hmm script to support SP config
Date: Mon, 27 Jun 2022 19:14:52 -0500
Message-ID: <20220628001454.3503-13-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220628001454.3503-1-alex.sierra@amd.com>
References: <20220628001454.3503-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afe1ffe5-a0ac-4f9a-8fc3-08da589b4ec9
X-MS-TrafficTypeDiagnostic: CY4PR12MB1752:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4PoYjEUcAlbxZj+TO0q4e4jAxfTSJY5FFy2DNI43ZLLheh0t5Me60bILIJoHW50lmTjYJqMeMtPnNFEfS82h0dwzqWnQm5ORfX2l3D99DXXJ/e/gr35ovKZKXyJ79UPNS5GGT3os0/Y3tdsOTS4PNY1T0KZ4xompIUcGwuIEdMCPcQpAAwY1C4PkekSkGkBZ68NIKTXa4IXa5EKxEk7AzmUlXQWT+VK6X4rR5gSn9Sfjmddz7I1uqnwHLz/pR3KkldHbWGqPTQP27QjY1Tw3u7tCVVYwjcKCT2cavK41E/cdYxiDhujdvqj18hHJPAeLVIfzyIJeP8jg+8vYn5PDP2EaCr/QE46EI5wc37ckk+CzQnUDCdXLx4W2IyfEE1IPdry5JwUqeNQD5J6wrKqODGI8OyigO9o/4Jboks9816oIyCtjaQyX9JYfYn9s4wWmdSZtWqB6GzWqxaq7BWJGhEWWqBMCUs9e/Yust7rOvlCkjlWrsXj1pSwpBKyMhmIm4r7wFmH3A8N2j3LglPT0Vn0l1lM2ALq+oHxdYnUXxCZq7f9p3Lw4SL9zvhjq4rbrC1T8dcg76RUf66jdNCHNGyWznocWuoHk2LAsMeRKNZeRDnHiE7pYfgZm10MUNvBO1FZaMr2lBJsw6O8xbDcI7S073fsCCKT1hHywny2g+mKAIrHYm/dqPvYVhILwz3rYNTD4yraBU3kZUOGsUsPGkqmou7nZXqxEPKLBufRKuvz+p5/kWOfnJqlLeCjZSN7MmhMfzwnyoNDdKuwqYfbsiSBDJSrspEKdXpwMR+LeoiFdi13Nb3cb49HDi3BmRIWyykpx/nGxfRUwUzhafZMZPw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(39860400002)(136003)(376002)(40470700004)(46966006)(36840700001)(16526019)(186003)(41300700001)(336012)(6916009)(7696005)(83380400001)(8676002)(426003)(6666004)(47076005)(54906003)(2616005)(70586007)(1076003)(26005)(81166007)(36860700001)(356005)(82740400003)(40460700003)(44832011)(4326008)(36756003)(82310400005)(7416002)(5660300002)(2906002)(86362001)(478600001)(8936002)(316002)(40480700001)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 00:15:28.9479 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afe1ffe5-a0ac-4f9a-8fc3-08da589b4ec9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1752
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

