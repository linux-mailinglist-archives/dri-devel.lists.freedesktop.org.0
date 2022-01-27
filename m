Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B8249D904
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 04:10:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B667710EBE5;
	Thu, 27 Jan 2022 03:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2062.outbound.protection.outlook.com [40.107.96.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA6610EE37;
 Thu, 27 Jan 2022 03:10:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPSf9TwVTJsoMQUEIcvmwae+DIvDBodfvn5hXRAxBzaCigaShjd7AvXTeUbub0eiDpUzlVe99RzmDmw181s4Sx1h6RDyEYsHMTAx1tFPeiF4DUNQxgeB6UIefeK9Tb9FFwq/G5Y0wefGOQQrgA8LpXEvySc5DqqTzwQHj4H0vXOz2rQRTF+R88zamF0w+p9PF57OGFN94/dl4ONQ+UYrrL58/9nSpDBUzZb9dKho7qVg+lVYjHR73VUWpZ3rSECabJsHDO389tEGkV8x41L9O+OXwU40MRPGm3YUtGoiv+trTrzW50/sFlvDmBCydjlY6it0OB06OFolki4xRV8MIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIX1UXBqRyvCiCgfbRiu0U9c8QYlKCum6nLn8LfGaYE=;
 b=T+EHLhazGqMkP3X9lqBOQFJH1xgcOl/MOavKTuKej2+6V6rzTwFUSH6c+2q1SIa+FFDd4Y80IFcy//3BDVgtqM4Ia5VixhFsJQda/tgwf5IealjPjJWJyLK8A1f/BhBA7N4TliGrvLh1j6YguEIfrvC7aF/RGSsg6S+lRZepD8taXlA2HA03tlT2+1fT4gdJXBDIlynJvtkyOpOfC0DOu8SNHg61SNugb4PPD0uGMmyX2zT2E4ZW/uqWN0huuqqLFnO8GSM1v33GNJzOpMcQWHywELIh/qAIkNtuFehli0W41630D5NrvwcYVUpYa93mbPzsPTJNyBIw3zrcOsHfPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIX1UXBqRyvCiCgfbRiu0U9c8QYlKCum6nLn8LfGaYE=;
 b=TPcc+BDglcCWvHWZCYJ+gFYnr2CCpl4Z+3VhaUx7rhfkVQcdx7Zq+5um4VOEuy/luNcPKZJ+X9rtIX3SBpX7KanOH6Dg/6MGF8JtATpZMnAdT4LZKprK4urEvzRCs0xxAhneb3mES4AD2fE8YJDS+6vwCLUvTVl49NaMLQA12gc=
Received: from BN6PR1101CA0001.namprd11.prod.outlook.com
 (2603:10b6:405:4a::11) by CH2PR12MB4822.namprd12.prod.outlook.com
 (2603:10b6:610:6::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 03:10:09 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:4a:cafe::d9) by BN6PR1101CA0001.outlook.office365.com
 (2603:10b6:405:4a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 03:10:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 03:10:08 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 26 Jan
 2022 21:10:06 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v4 10/10] tools: update test_hmm script to support SP config
Date: Wed, 26 Jan 2022 21:09:49 -0600
Message-ID: <20220127030949.19396-11-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220127030949.19396-1-alex.sierra@amd.com>
References: <20220127030949.19396-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1e4a33e-fd80-41fc-62fb-08d9e142867a
X-MS-TrafficTypeDiagnostic: CH2PR12MB4822:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB48222783B81BF80064033BA3FD219@CH2PR12MB4822.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CQT/EGkrbaOfjMGTx9YqBpFum0FtI/1v5vQS3S7m03z9lDudFKZR7PjXev9zHCriYl7LZUNpfcs0Id/6P19ZIQ0t7mpmCZ2M2aP/sZuCvIZVOzzwuneNE1IT1FAWleIJGpCdFlckQICPCFEL7syA/lZusOIzvB0U8jX132YC9Fesi26Z5H7zFtetbWZpepIU6wPWW3B5F8l5sQIyTGi7dMBUbj1E19rzuiG4r3CL+SP3z4/lPWoT5PYCZaWH/UaamBWlNEW0I8xeo0IE7U/YTDXZa3mWRRzrP6DEYMeeiUPe+i4omnJWgkFVIEmIesMcPLMi72czw2U0VzGbFjF7+81jUbxPBGpBMIGy8ZbbL+ICmxg8q27BVbMU3r+xH5Dcqgwazeetk6hn4JPjRISlXs+LtWmWRYEeJ8CR4W/13FvcjPOq00aYtJ2c2IRhJvqXk+5FBA8QBeBEuHjYayk/l1p0ghVm7N33xifk2VVSfu8xNaJD6MOoqmdf7BkObjWd/tU/XvEvT3rEOjambUS8vowiFQppwayBpSOTN/xJWDPUsIVZnk/0XYMwfxf1HjICoIzOtJH2qHNt4HP+T6T+9n8+RJhSpHWyT4lfsLf5DmCelSvZfsi0jVC8LsMFFZzU6JQPmjhfkTEv3xuX9EexvGoTlYkKVEI/DkxvBVuHlnHUWWLXHIh2redoYrRxyekllkMgQcOE01eeOi/QbwG7LQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(44832011)(2616005)(26005)(1076003)(426003)(336012)(186003)(5660300002)(8676002)(86362001)(47076005)(8936002)(54906003)(110136005)(316002)(508600001)(40460700003)(36756003)(16526019)(4326008)(83380400001)(82310400004)(356005)(81166007)(7696005)(6666004)(7416002)(36860700001)(2906002)(70206006)(70586007)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 03:10:08.9113 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e4a33e-fd80-41fc-62fb-08d9e142867a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4822
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

