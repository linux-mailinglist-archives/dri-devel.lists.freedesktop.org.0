Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7447756AB64
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 21:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B4212BAC2;
	Thu,  7 Jul 2022 19:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242D589725;
 Thu,  7 Jul 2022 19:04:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCtN8b2HOwE/3pbM8RK7OusU5gQRAHO0txFDRfzkt+G3RBuXWG4fGGpBpEQJi77mlfRQeGF9+oBzUwGMrINwLKvNmyPRR9c1th6Te0DQY2koZLkKuxpfun4Bokj7TPdouzLU/YM11M4fNkwoot8Wzr6/A+1QY5kLeBzhkFEpGnXLtcD6mM3PFxt/OeHlnlgVzSGbANlcCgaimbsYUS76UaMF52hZxYnvJNoC2AI+IWvygI1VJJ1VBrClTlGiswIdLhy/NL5+sLT/I7OOMwMIsnslJN+fxlR0kDzlfisDAMMFrZ98ZE2h/i6SWeLv8RMyp+uWXxu2tmRxnWwozfGGZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ds2C6hKBCPm3LMFGvWFrTQmYNyEijOJ3/DIUhvifx8M=;
 b=DpLIVsyb48jwK74KwgLhFWj/iB/KrOxVVpJdH3z5nB3uR/1yi2ta6E26Et1OMolRux5wHr8VADjgpDwcHx5Nz19uiX6ESF3K7pYNvV7QqbPDzsI4MmiEhZRMwdt7JON6Zkx6bCiRg8xpn5E52izaTSWD7PWu8+wXnPsUGBjeDyD3AlNMCb8EB7i5EPWFvoC6XVZErutAHtY/3BagKzYY2NmsJoT4HeOthMag0nxvP0ils1ZrjlHcGVERQewvdErVbdHhi+jjGp4TGtTts9l97th0KR11ZAZ9blHRmzpXytapmwtTmDKteEPIS5xzjlF6VUcyPNEJ7tIGpTm0+gLKyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ds2C6hKBCPm3LMFGvWFrTQmYNyEijOJ3/DIUhvifx8M=;
 b=5higf+nhlQSWdkrtPGClZfBTs41NADgZBMbEDtDiQqdA+0QlUsuxyX9646a7twLGBxwaUPaVuj8kgHJcFYRCBIYGfv0vxXZP4g8SMjCVPq6GqsLkeNtCswaTcBZ2D/ZjdkgjTwVDjcoUulREfdLw/993mPK45VkaGc5QEmyuiZg=
Received: from BN9P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::26)
 by BL1PR12MB5875.namprd12.prod.outlook.com (2603:10b6:208:397::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 19:04:22 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13e:cafe::71) by BN9P220CA0021.outlook.office365.com
 (2603:10b6:408:13e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Thu, 7 Jul 2022 19:04:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 19:04:21 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 14:04:20 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v8 13/15] tools: update test_hmm script to support SP config
Date: Thu, 7 Jul 2022 14:03:47 -0500
Message-ID: <20220707190349.9778-14-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707190349.9778-1-alex.sierra@amd.com>
References: <20220707190349.9778-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d17d97fd-654b-4a3d-3de1-08da604b8073
X-MS-TrafficTypeDiagnostic: BL1PR12MB5875:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nvfk7fJCiH4+WBXgfHzVQVOcfnMwzWzp8N5a6MRfXqjHlUw6aIgDIpJaIHrGl/oJMnpFuzeTnOEl5gjotlzZYHeVwjJDu6yP3AiLWax3PnupqXCZdF2ftugrELHjkK8eg8BUxjGsKsOVKJ1OM8jf++XUJ/CxWBw6QuqXC3CMMZ96pEpPFTJNjdwpQPlA8Qxyef23NO+mNf8VcdR0Ndimc2U2HYoL15487KHchqnAzZWuIGnwIJWQf44oPmuGwR6LGuOhyeXa/US9uGojZdHBpj+NpaxwnEBbtmVorynWvCB6HC+UKbj+KVktDA0KtqWage5AMJoQMt/IpVeAaKF1G/LRhBTGQJ6hOEN0IbrZA053195O3u8W6gUqXA0xe2WVNVEWwjQ4TgSgFVe1YXr7JoT5j1MDRBB/VqIrbrkAIZMgljMdXZ+0FJKwk982LxoiHOz7UdWq18u3xsae83GAZfRN8qPHLmCsuJUPBIBCGw6AWmUBhQW5sPmHJLZNHAcH/YltZHHFpj+H9uRSExo8gEd7mJJ9cmDuitH5wfO1xcOwUn6o8p06651Ty/G1hNwQ+Eb/owCh+NYqnP/37o7z/xV7FLhuZl4cy4glNkCHtX4Q0AVFD4QGGBdVrg5gTE/r0vwkOq6Vi7j7yMCdqPACk1tsIqgiHssHi8HOykaPQwAxRAV5pmgMpeQUXPAJSbv+WQm2DzU2PwYOOBXy3l4Pfpb7fHe9CO6gI/Qyj3AZevZK58Hi0tkqwV1Pu8spr6hSBJpiI3baD7NVdeiOPJ3JSm4ny2ld2WTLRHZ9v64EjaBbRxZXwq47aMaZqfNYg28gmMfRSwvwDd1P9Sa9O/gG5CIxZbksgv+43rb3ERNayqbofjwmvf/JpglUcRcsbZrI
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(40470700004)(46966006)(36840700001)(70586007)(82740400003)(34020700004)(70206006)(41300700001)(8676002)(6666004)(7696005)(82310400005)(81166007)(4326008)(36860700001)(6916009)(356005)(36756003)(86362001)(5660300002)(1076003)(186003)(47076005)(2616005)(336012)(40460700003)(44832011)(8936002)(426003)(7416002)(2906002)(40480700001)(478600001)(83380400001)(54906003)(16526019)(26005)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 19:04:21.9571 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d17d97fd-654b-4a3d-3de1-08da604b8073
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5875
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

