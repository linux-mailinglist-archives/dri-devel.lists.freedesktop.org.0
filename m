Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6475397A2
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 22:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29D410E629;
	Tue, 31 May 2022 20:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F77A10E5C8;
 Tue, 31 May 2022 20:01:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLwMbcboq3V9SpQxBSyOuPfRdFvSQPN+v7YtAbj5zkHp1sfWR83tbOR6zbHOZOAl/5g/Bao70LcKm76YQzMj3cHd9GrLEi1MamPfpZds8Z/5kS0TYk92SSG2O+AYEhAU67kSxQHwRpmp76wbbQ5AVSlir81ASYBdMzlk0N6yIi/qWpe75wHkWlR39aHszOwPZu/lVfSQJWjEruzaguEjWK90F8V6Unq/nrpbpeZ63Cwv2V2hhIMIog+kpifwpGWlWLHSCmNjdQXoojdfxOUfG7foAorwPoR6F4vZzzqK3WptkTb4ivtmUTrgsTJIA3Fx9yHZTgKm0ZB8V9fDs+fHEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ds2C6hKBCPm3LMFGvWFrTQmYNyEijOJ3/DIUhvifx8M=;
 b=FvP276ofC1VimaA4N4NCgQ+DmYi7xmC547g8vThB3Te5NygHd7PkGY5mj1RCNyc1fzlkAvS5IraOM+o5ZF3hPTtzugUfPQ1qRwAcg3M3uwgFCpgd4iEfgNkP7pPDDg3kZ3wPl61vrmTEVxS2GPnL96NEK+iiudRNfUKK3RRvRZAYPQemVYXYUZnEQfcO7Dex7UelqmfdhYYnEhXHdGhbbjdC4mou5n2wRQFNUk7BLvag2k1fs0vqCyRFDND4JJ7Ips2kGI/iwbD6tsFYneMi9rby6BPX4Pww7ec9jzifGlL67WJnxLkkU/Se4dQMbGgRRt4TZxDxQ+wJtn4vRHb0sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ds2C6hKBCPm3LMFGvWFrTQmYNyEijOJ3/DIUhvifx8M=;
 b=KlBVm7F49K8KR4BHequRN6z0Ha1/tc+P1jfTzLFpGJt72emj9sAbgUkufrPIyWsogCyZ9e3AOsm7tIaUsgm/Lv153xUonY+8sIAM2UlZhYJ0nAoN0YCDELVyW8m8v4me3ELX5mvV1nva785l85eWawpHrj2SidiBOw2ZEMC+Unk=
Received: from BN9PR03CA0394.namprd03.prod.outlook.com (2603:10b6:408:111::9)
 by SN1PR12MB2573.namprd12.prod.outlook.com (2603:10b6:802:2b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.18; Tue, 31 May
 2022 20:01:04 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::dd) by BN9PR03CA0394.outlook.office365.com
 (2603:10b6:408:111::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 31 May 2022 20:01:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 20:01:04 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 15:01:02 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v5 11/13] tools: update test_hmm script to support SP config
Date: Tue, 31 May 2022 15:00:39 -0500
Message-ID: <20220531200041.24904-12-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220531200041.24904-1-alex.sierra@amd.com>
References: <20220531200041.24904-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e7ca328-d814-48e2-3e71-08da43404b20
X-MS-TrafficTypeDiagnostic: SN1PR12MB2573:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB2573DE8BEB805D2A5D13A8E5FDDC9@SN1PR12MB2573.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6h+M/bLXrImZeRgsjTOzcaONVFNOdVuqt1EgVlplWRsJpt4LhkZublu2RrQ9pYb5VlEOC0pX6qle+Irijkh/azzocOaziPgP2zXt35Z6KIWC93LxGHB+Ez8OEQPmmvjx/nqQbUjRXIT8iO/RHoyh3otTBOvMiDa082y7odNB9iWyQAyeVcqMiwFjOThcT7FPqvS76xEktJQebcrqPMrC+u9RaXpO/qGR8NFpQ+iqD2gxtAsTWRE7AvegzuLw4h/RkCVOZz/Z+qrpa/SY8MTvcEKkfomcAyOAb8E4R3xKELvgRgMOPmdHbiNzLobKXeQD/fnCjQTwzQZnKmKzAGaSyql7ZqqrNOt1l6Xrr3k8ZSBMs200C+omN1uYCg6rJIvld9Kee1OJHrsxP/RGDZ0Z4RxnTPWjWP9rDvHpdx5uwB6MslRoTUKTm1ALKLPIt1jTsmjiGGr1QFjxP3GELYwy24ljzWKHXpHgnXXG0ExIrYfJ/5ndW34P3gCPvbS0vijEW/WcUFoX/U7EubH7QdedPeKLxFVf1sN1uYJknHxYQZe7/nDL5hmdYU/HUPwfaCSCL9MeRmg+a/y/7Ddtur1iAZLFdY6O4+U1JjucHxrR2y3nWgFcX9xhIR4p+vOgvdjTxr1Qly1bYTQF9WHkzDluNSJ0ZLUAM6ZvTtWG4Hq5GA/PR4siDA4aSGSY6664FcxV/iJTmtlZOI/SXjsfbhdjLA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(44832011)(4326008)(8676002)(82310400005)(70586007)(70206006)(81166007)(336012)(47076005)(426003)(356005)(36860700001)(54906003)(36756003)(6916009)(316002)(83380400001)(5660300002)(2616005)(86362001)(508600001)(1076003)(8936002)(26005)(2906002)(16526019)(186003)(7416002)(7696005)(40460700003)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 20:01:04.3093 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7ca328-d814-48e2-3e71-08da43404b20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2573
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

