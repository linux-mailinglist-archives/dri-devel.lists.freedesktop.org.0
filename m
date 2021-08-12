Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFDF3E9EA5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 08:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C200B6E2EF;
	Thu, 12 Aug 2021 06:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620D46E29D;
 Thu, 12 Aug 2021 06:31:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRmjBS6ylkW0O1W2rhoA6yrRGyS2y41S4PGj1dECbcaQBGCUm4S4GI+jG6xy6+VfRCh2R8klnfS8ORAt5mvRqnmbWfgar5uJSu3ArTXUmQx2yux05XIZPUBXwhgoVh8JnWfDdJ9wsUNPZxvYBEXWPlXTlSswNJBk3GcIgg66AO0AMDMhQuYbX/8ENVrZ9kAQtbtTtduLVGZUIgRCN3y08Tp39HYHyQQRX0gPJcMZ29mAludz0DDWjywzK6Y8sJjqkd8i+AqPOHjFR35yBYMwsCVNvhVD5XD4XvvBy2UM0QcZas+FwJlXJ3LICqp1rX4Svq0Vo7VmKQZ39NpmAaSWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=707xnJfuFhrp+6dAh962xzl7si469vWZYp4BZWlrkTo=;
 b=DKyJg46fpmz+CMwYaAdcqSoB14y2jfurfbUEf25m/B633QljzY+8tzfyANVvPIDO87OaE9v2+lnouj0aIgNX6+21GREtIpeWKNTcBJE4bYpqBJIC93Q1hxWC+BkwBsfUhztdSeBfNALFJLRai+ZijknV+VwrdvZhpu3Km5So/GjqYMU05IJaynyTj149MNZ2+aikz4c5yuQhldVXLyrwMEGLcAGm90DrrisjCRJEB5LafsmoNTY0jgaRWkZHq4SbrbFwXMasRdQwzlBCkGtaxXASl82EsKp0yp2xUPpiy2odfJHVkEgqlkfph2Imxjo6SVYrx9XBfqfwPMlfzbuMZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=707xnJfuFhrp+6dAh962xzl7si469vWZYp4BZWlrkTo=;
 b=4DVv6w0Spa3S8TCpJQTs8duhp1C69JqmkQhgZHhqXRtfsfYvHRFNXpYgcdP1INui2CIvy7/jQLautshk5bmU8gacsVS8Ku91Zj3Q/doDJvXjoM/t2Khcv1l0oRaRNhwb1mzIAXkpY7qS6bPw/+bDzdSD1GeCpUi1E7hp7gvLe0U=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN1PR12MB2448.namprd12.prod.outlook.com (2603:10b6:802:28::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Thu, 12 Aug
 2021 06:31:28 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 06:31:28 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v5 13/13] tools: update test_hmm script to support SP config
Date: Thu, 12 Aug 2021 01:31:00 -0500
Message-Id: <20210812063100.31997-14-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210812063100.31997-1-alex.sierra@amd.com>
References: <20210812063100.31997-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR18CA0026.namprd18.prod.outlook.com
 (2603:10b6:806:f3::18) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR18CA0026.namprd18.prod.outlook.com (2603:10b6:806:f3::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Thu, 12 Aug 2021 06:31:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 735803a4-df2e-4f5f-001e-08d95d5ad0f3
X-MS-TrafficTypeDiagnostic: SN1PR12MB2448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB244870BC60CFE0FFCB6FBBAAFDF99@SN1PR12MB2448.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S2IC5SltKzIax363imrqaAPfg4jsNG8j2a7bIquvjKAGhExnHh7a7HioPCWGPh1x+XY2ZCdEmcfRvDCsG1rbirtd+OE1kJtVXpgt8Ms7wf69DaMs1ISWF7p3h3AE4CqqZLU8NNV7thOmx3kCwr05x38fc2gl5SFd2+M9xE4KWbQz/4IG1yLcPSKTsXa80AA5h8NbDP76Htxepr1hZzRkbBGfb3F5AZRKRv1fpVcLGQ4I/3/NZVlbOVkFsQYExG6tiSgkEoejwFE1ct5SyoxaK7bondOj/HTZfOhkDT62qscEbN79Df+7QSKUpYbNYJNQKsWK5lGHcw8HOuTFxfsRSNtpY0v8qhsbUIrQrKO2xdi8LbCFZfvg10O8AIOdvA87IZwPsHVz3Il+oqOTPrtFacyP4moNMny3pkkiBuP7qDe2T3sYalm+KOMVMGNOUCFfHMaPukO7vABJtvcNxvEtKyk9UbzDAiopy+at6NYy3/cFL8LjswmqMcUOguAl0vRjZ3BYB6/VgOfWVWPDWlMLAe5CD6tmzve5/WvvK9+LbWQB0lwDo/+7VlURhbbCQ2Wqp40MeulfiFjBI8O+coFqgfjD75mRBUu0QwkkIIstfR//GExhSzqMvVj65SUX2sA9t3o8ouvIAhEFIMbHx/lFaJVX84b47YDFO7fIg3hECTq3ORI1htiFsnmxMLdcxOvIbc/IWH7z7j60ZoGQ3xgJpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(38350700002)(6666004)(186003)(66556008)(66946007)(2616005)(478600001)(83380400001)(38100700002)(8676002)(26005)(44832011)(2906002)(66476007)(956004)(52116002)(7416002)(1076003)(4326008)(86362001)(36756003)(6486002)(8936002)(5660300002)(316002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bzgNKTYdgH/wFFV0Uav3lS0c6ybcEjXMfkNn21C1F16o9x+kBQHYol8FftF5?=
 =?us-ascii?Q?7kH36yWsLBiwgIc8DYurs0iMGBiilppHLGEerEX1MmETLnMlJK506vonnJeS?=
 =?us-ascii?Q?EE+6gfR1hPW36bB+kaeV7WZ2xzAeFEEr6LH8bGc8M0smZ6nSs0mA7u3TE3Ib?=
 =?us-ascii?Q?ssVfuulzDMFj9GCVus+TX4f/0FFZVS4pf0v7ba3VBVSXwUwx+I7SP14Brq79?=
 =?us-ascii?Q?eBDbfFO3N3sl94YrpokhQBtMmTAx3cjxiV2MfUE3A4ADyQY5HzZl1uT+9QIZ?=
 =?us-ascii?Q?S678hQURAn2gYqUC5wu9A8MEc76nf4Yu1NmlowwUVvYmvOXtM175qyaMMxd8?=
 =?us-ascii?Q?KZhYs49+tP2xK46GHl9qhdpMwzIKmLf3+AIiJ3oUJx/rA/0N5VAD3A1n21Pg?=
 =?us-ascii?Q?Y9jKBDwN8tajPnSAQf1835ARN+Gy5RQR/K0apVC+XOVSKEzHKMyeDkPumAAw?=
 =?us-ascii?Q?IrQPyUwj291ZqoM1fYguF3MnDPEtvw4fuZGA9NfAkLQfAAP2EWKEBsh5mlaB?=
 =?us-ascii?Q?FvZQnc4LuHJpyH2vNhpODvskhpZfCWkwx8m4Fi8AwHxSn9W6/tzeejngNgXW?=
 =?us-ascii?Q?tnYkOSI0K/F7spuRD63vvDvXj8r5EmF9JWysdIIxFF6fHOPz8tD9O8ktxW0A?=
 =?us-ascii?Q?pz8Cy9Na3KHn/EjKfFehH7Q/aylBu6fMo1uxjqcOfVz//MDQ10DD7VnAKsuq?=
 =?us-ascii?Q?Nmpp4pM5THKCS+IUlfXRptYExpJeWwI9EAIDzl/Qtu/s/dttdLpPHDFKRX7U?=
 =?us-ascii?Q?qs2Vrv6HIur7MxRbmIOm/r/Wg/X91VHjDjmKAmT2yFgiHIMPj4aEWLQp3SGh?=
 =?us-ascii?Q?2EuQI1ppR4M9fodx+uBcZqJk/iNV4a4sXQhAyn1dAVIV8LLWvu6MBOamJjtP?=
 =?us-ascii?Q?nelCrehhAst/tZIQE8gq6o9yPYUDlMFBjic64BUGIli9RHGBseDkAyj30K/k?=
 =?us-ascii?Q?ilskUQlTKbYQctRfkBxj9QaNylXEfWFSg4XhUd0j56PwxDBkq3xVpeFcnqmI?=
 =?us-ascii?Q?ePqgqtpA8iUHLODe5NE+qscjxF0EpX6um6G3sIb803YZIk3uB1c0k0BdheAR?=
 =?us-ascii?Q?hgvrxP2DX+bA5uUjXv2HPKa5hMXK6D7//C15Zixx2xvu9AdFOkNujxMxPNqS?=
 =?us-ascii?Q?dEAMNwvM2U66bW6B+9EfR8sz235KrVR+oH6ICKC8gyLU4MtaFr8Gd5XPrNei?=
 =?us-ascii?Q?BLW38k9IabD52l+jOWRXDmpAViPwcCO1RVktitjfgCqId/VZdZon2g9H0i/3?=
 =?us-ascii?Q?Z/N0xaA62Iod4ymwuhHSip7vWJYpzrcoc4uAf2FMydL5+xsWLnj2mZiZ+jJh?=
 =?us-ascii?Q?uP50aMmvbprHTEvCpDsUlkVh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 735803a4-df2e-4f5f-001e-08d95d5ad0f3
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 06:31:28.5075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a4DhHhfykdWL+FU8GUiAroFs6rbNIIaJDzFxnaqj3Gql0q7BFfKszXaOUR1exsI6zrad8Vzw98SBi/DuGj9Iow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2448
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
Consequently, this configures zone device type as generic.

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

