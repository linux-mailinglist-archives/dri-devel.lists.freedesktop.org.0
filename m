Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 645F7539484
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 17:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662BB10F5EF;
	Tue, 31 May 2022 15:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4534510F48F;
 Tue, 31 May 2022 15:56:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcMahLub3cTHr+W0xDtkaHAjnDzxNF08M3PxhZBHHtlBV1ffJyGloZ8VDtItFuQhBsKEeil5sDH1x2BTZxd974OtntVQ1/mqUg782XMYZzdr8nRaSopiEB2IwcWAiWxtjMScv9pL79Ku8KQj0UyYNHgz/YXr9ViWnafEv7Y7oMj9JrYySyognFSwMjBsvpll6vpmkUah5ZzMKv4Gk2CzOFgpIQu+EBzk170a0zFgDEFbVKeb64ztaC92wfRLMUkjG4EtBZ+4Ej8LZ4lRrwONCJWSL+r6UrySnd0gyAJmSz3AZWWhvNzFtR8JTRNW5f7L3ZodumRaRqBsan4vAA0zAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ds2C6hKBCPm3LMFGvWFrTQmYNyEijOJ3/DIUhvifx8M=;
 b=hBOBOGLc7FXO7a70ljNHtNd62KezrSPqmdl5a/pYRwexVeVrTSh/rOoqV4WJFijdNMlUDu99bmZIirNCiPAZHi8ANWb5Ean8zUxBac0Th+qhCTbmQ5hLkwR3gIxsjv9bYa57M8s3McUnz9DwhHyPxy8Z3/FOpRBd+qQX1GkmGVd6dUmKeSW5JC2LJ0g1cc8LBnIDhn5uOsO97zzlDjD41uIWkdb64dD3yw3kgHou5ak70+DSvKtqDOG/z1QIkdjY3QV4bS+JHkTX3k8FNBTcgmEFz3iGPP1JcUzvLCsX/ECaF/LP79yt9glgF7Y/7OlPUbq07u6MrhGY/N2HnO3sSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ds2C6hKBCPm3LMFGvWFrTQmYNyEijOJ3/DIUhvifx8M=;
 b=UueEJ3++IYF0CYoQmWmv41n7xnT8GEa7eiIp1rrYVCQ6Y1VNEsMybwWIOYbYsXNFYPtINLeOsO553PfBXf3WMSB8XHYEHzUZGa8PCmV6BvtcebtiKgTDuA70ScEA6Rvxomfmp0/FeIv5koiNl2djwzzMG7xU+qGqGIj2k29L7Z0=
Received: from BN6PR16CA0037.namprd16.prod.outlook.com (2603:10b6:405:14::23)
 by BYAPR12MB2680.namprd12.prod.outlook.com (2603:10b6:a03:63::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 15:56:50 +0000
Received: from BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:14:cafe::2f) by BN6PR16CA0037.outlook.office365.com
 (2603:10b6:405:14::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.17 via Frontend
 Transport; Tue, 31 May 2022 15:56:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT043.mail.protection.outlook.com (10.13.177.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 15:56:50 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 10:56:48 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v4 11/13] tools: update test_hmm script to support SP config
Date: Tue, 31 May 2022 10:56:27 -0500
Message-ID: <20220531155629.20057-12-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220531155629.20057-1-alex.sierra@amd.com>
References: <20220531155629.20057-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbeb1d61-d8a7-4ef3-cb70-08da431e2c8a
X-MS-TrafficTypeDiagnostic: BYAPR12MB2680:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB26803A0EA077C9AAD3D1D213FDDC9@BYAPR12MB2680.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LOVtzuzA7FJMUR5sxibnCJa+h0N0bvyriMitz9gnsemgHDAdFfGsy/RD3clPRB7FLFgTg4L39CEOpqq7DU9IzStdcivzPTEdHhJ/FkodCfbC6uyXU/bMyWQyt0iX2TIBCJuIK4dGse7B0nnT2zYETAY7+Aycd3Mige2ECU90g5xzNAA7jyStzaW/kIycwgKIRluc+dUEOJFBQ3h+dJvnzIEKYeMgnyjjR6hi4n3MEinQyHLv/+ycV4hbWLOQVrP1r5X3mdo00xon5JSIVPEKIQwoCfG5KGY9COh3lgngymSkaqPvzLZKuEAzdfZs5wgkTrxwkXAwhPEGuqWpvZ0zum4S8YaLfjuWbrn7c9ImzxxZVthWXz8U4M1OOcfzRDeGPuk6TYR28m7/gy//asKv7laWbz1tQw/Y8fSU6XGBhllfsJ3QjwEGbegRqd7cj5hhFuBVNsJaNGyS1Myc1MpPctrmBS10UuA5gOqDNKh0s1YoPQqepkiZ8K6YZQ/GfdVd8S2r202z3N8L6QjmneNmaZbPNq6eU1mOV58zxzt9k6+9zBMxUoCyP11PiEvmuZ4Xsc4PBkGIrCVcmiIAOY512gerwZzaWAOrDBGSkNU4SZe1MCvhy/cpFquR9m4nu6IYWWDK/vzQ4pW9t/Nwyb7XPn3tB2KB5bweNsZYPA1ZhQRDd7F780anQypQzcOxxA7Wp/SRx/b3OEeV6vwGz/44/A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(82310400005)(83380400001)(4326008)(81166007)(8676002)(36756003)(6916009)(36860700001)(316002)(336012)(16526019)(47076005)(426003)(186003)(1076003)(2616005)(26005)(7416002)(70586007)(54906003)(70206006)(6666004)(7696005)(40460700003)(356005)(2906002)(5660300002)(86362001)(508600001)(8936002)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 15:56:50.1094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbeb1d61-d8a7-4ef3-cb70-08da431e2c8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2680
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

