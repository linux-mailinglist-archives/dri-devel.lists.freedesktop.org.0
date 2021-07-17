Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 081B43CC5D6
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 21:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90936EABC;
	Sat, 17 Jul 2021 19:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EED6EAAD;
 Sat, 17 Jul 2021 19:22:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juNKgQtDu/BcrcrQXDbxz80QAr+4n8QsSIJY7X/CJTmUwEYD9eXCR5xdaVYhcTDV+0woBW6UEYPsaHH8yf+oKKKSryzSoegMXjEmbQXNqOu+P5XCAM/EUcbR8eG7pRgzyjmAWP9/cF4XsY7HHeqFEP+DtQX0t+Det3zrc+ijVhpZJGzVyUor0Ux3J1Ikb+DehtTZE87JVHndSnKC969HBNoyxlmk9m6Svcl6TPH01LkNSE+Wu1mZFqELFrQqMGecSDWmQAgzcmTcc1cCdAF9SAKf56TI6S6A7i33vp9CFPGYZJcdFTlvrlYtmmVeLMVXBzpLWvpNgAX4ClczxuHSmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=707xnJfuFhrp+6dAh962xzl7si469vWZYp4BZWlrkTo=;
 b=SpbX9KQugp7MCAHGlIIvTWxF2LmYG+BKB7o5yjylqAlilXEHyxdid17LkU8DqOBOeOBYs8RcSawH9nF1aij/xPETVdoTRcF3tVUaxmSslv5hWEDFTADuWmMebE7JZ3T+4rxRwMpgv8ay9DZu9WBdxHZFUC9s5cL6xP4LSzhcQEtWG+fOwSJyx7uH5XxTsP8x/8uTuOd1UMe2yC5jTvH8B7CQKmA7WgZeYBDw3zyy6zh/RvJ3JzwFBiO8gSvnJBWpBj4vDxblVNrwoCoVfKbIgmtCxrgh51MfotQeRwPleMGSZhtPc7f/AUnqYQyCjge7JGsLQiXg1cRmckrHT2n1JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=707xnJfuFhrp+6dAh962xzl7si469vWZYp4BZWlrkTo=;
 b=5tMeas0m3k0B/QBW7vt2hfKwrtxcRCehJFUY6NuF6W9nKDGhWRuPHmu/2koaHAYnSXdgoxfa2mfcxtp2bSQexvPwz2+M90I6GODuHFPIIhj/0ljV4SkOmffCdGOHmen4JMp8J+HWG1F0v1Y9o/x/ieusoSRMQagl0K3zE96+IaY=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4670.namprd12.prod.outlook.com (2603:10b6:805:11::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Sat, 17 Jul
 2021 19:21:58 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39%7]) with mapi id 15.20.4331.029; Sat, 17 Jul 2021
 19:21:58 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v4 13/13] tools: update test_hmm script to support SP config
Date: Sat, 17 Jul 2021 14:21:35 -0500
Message-Id: <20210717192135.9030-14-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717192135.9030-1-alex.sierra@amd.com>
References: <20210717192135.9030-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0067.namprd02.prod.outlook.com
 (2603:10b6:803:20::29) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0201CA0067.namprd02.prod.outlook.com (2603:10b6:803:20::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Sat, 17 Jul 2021 19:21:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81c63fea-588e-4ab3-b0bd-08d949582332
X-MS-TrafficTypeDiagnostic: SN6PR12MB4670:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB46705EE64FF76F3A9664E574FD109@SN6PR12MB4670.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lzRubaDRxtU8ctmhTypHDJF4J8NyuAATR7qvuK0City4kggLrmijU+jXXFb8pruCvobYJs+LG8cHsfC+k7x0nxJwusDiDTi28laWlpyvpgCK6FFg3JIS5EoqTGZxlZns0o35XxI5DHXkW4DH13PpCK/4tgfkwG6xC4pFuYE6FTyo8gMTITYlarhmdLV8xyn5QL8Dk9L6/WTDlVuZtDmFWSvD2A5Hw05YRf5woAo8/gjD4ahYEtBQla4lSdpFogXOAIVbWkPUvDWIRJ48O/lkBvlNRK/KJ+GQMxlxnhLkTa3x2WvOODkWjpErwYgMq+HqY2zD/Fkg2GFB/ikeq+k96osNXwFw/aihWaDxK9TMXUxBAkQSCo+a9Xa4yJ4SMTOxp3Sbdr9J2/DPE34pmjCzDPU9GBFW0wOxeRkI9k0YctURHcCnSyk80pF8agZhw3I7WFh9QlXJGerxSfFrvfXBJMLUDTRLBRydEBW7oLOH/cfMcVzq0Yzc/r+Xnclht1UkXq8AVpWouHryUT8vT0aieO1QhjzJK5Qa41E3pQsHCnBjzRkJTsaiHqdDNZweG1ZTdMaH8GMJwE8ueetV2KeXK/C1gQgjB+HrnINu+h/gvhVUNWomeRZf8JdGIhtQ2i0v0bnlMdlKc2utvQ13zxEVkPUTcmKnmZAZzw266+SII1Y9HAVE0wPODNVqBiKvnQLMWuKC9sA+9cLohsUkWRDnbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(2616005)(26005)(5660300002)(2906002)(7696005)(7416002)(1076003)(4326008)(6486002)(6666004)(186003)(8676002)(956004)(66946007)(86362001)(316002)(36756003)(44832011)(8936002)(38350700002)(38100700002)(66476007)(83380400001)(508600001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zGmR3L6TrWoP2ei+sSFhjnxheJtnwQwLYJ3LHQcYVY6k4jSY40FYQCt/hPSq?=
 =?us-ascii?Q?KybdOrSjPIPe63mTRjCx6/lNOeNXOmR4GkMGZeQfy/CxSEJIYBbXcvP0pRAE?=
 =?us-ascii?Q?Ve6kHXF0Fe5cUQ+1YK9qkA2hmvVADiartdDB/yVKD2AE+W5UjloyiWVC/boa?=
 =?us-ascii?Q?gZqnVqakduuGb2tTS1Q1/iOrKCaoXgdXBku8t4T8oUVVf6ZU8y2JmWdGWG9e?=
 =?us-ascii?Q?6N0Q7vea6LhiTnzd2pLL88PkzoAHqSxXElKn9pN5/xn4mcrWf6pdR09kCj6g?=
 =?us-ascii?Q?QhpeAFxpPAxiII+vEOOWwy3qjCpRB/kBpfO24hzJa6BuETuaKWXf7yIXmR2U?=
 =?us-ascii?Q?oklt1bcAQVtdQYr9sicSVAAkzUh5uUN/V+6+OGMgCsENzcSqTqlEm+pUkaWw?=
 =?us-ascii?Q?QAOBKxHeUuxga5V6qUFka4d80YDrUkWFsmqxHmhj6BkWJ7mEnAmGXy/e2wed?=
 =?us-ascii?Q?Xv9PWW/fGm5dF50N4XaVtdX9+FIUu36CsiNzLdSkinHTJkKbpoHwr0ESqHS4?=
 =?us-ascii?Q?cnDN0c60AzgGMTpJtjsAB5065caIqK8sqOCZDQ2kmDXf4ErA0PB1oR8vWtnP?=
 =?us-ascii?Q?J3mH4XD+09YnNP4rpiI4oie6xvq93CDfPxVJPsf7E3eR+1gLWwcWkAVSn+DF?=
 =?us-ascii?Q?DQ+2RppFvGttuM4wSzoMMXaBvRvIlgWWRcWNhJ66qWfKlocrq1IeRRLvh5HE?=
 =?us-ascii?Q?ht69w+gvUMXohFnkPTkzzb/I6Fn9MCSuJhLIh3eFbndWgP3qeart/wU6mxb3?=
 =?us-ascii?Q?4HIaP6C17me2nEXQHdAjcU4Gjoz+5MvFPVE93QnHaeTlFkZCok3Ce6hrRb6a?=
 =?us-ascii?Q?xr+wgnIhZlpDTeWsjR9938SAGtd6aJCCClBZa/Xnm7xP9yNOg2jbbMpkpg1J?=
 =?us-ascii?Q?f5X6rt8m1gAimxCHBAwkDyKPN3UA1qGM1bzMc+lwk1aNcrS/0jNvABQpzkU+?=
 =?us-ascii?Q?g+sabWkGGMNlEtT5SJ7pzJcLjbpEqfoBW/Q5IXbBvais/SjKL4pPD+Mpbilz?=
 =?us-ascii?Q?c5XFm9GOHb4GTYtudUXody6ozYUH10LH4AVe54p+Oo80Hr6fcwVhp51An074?=
 =?us-ascii?Q?ImSIydcNVlw5+qomgtEGnV3rBgwywpUh7DbTkcARuGOwzNVRqz0cX+OyWlLO?=
 =?us-ascii?Q?z9Xdcb2FC59sXtljISnC+Zg5fcgZb5HLj4kzkhqAk6dk1zBS1poGEhvqhQ9G?=
 =?us-ascii?Q?FaBOLQfeAKkLsRK9znqikjJ3cy0X74J6jTVJ/P222+gFJl4IZ1XujXdAGoZs?=
 =?us-ascii?Q?dY7PqROzwvX6A3o3C7gdFH/axUQPlXhhKfCFenzzXg/OtsDLQARjIBpYpqDR?=
 =?us-ascii?Q?O1AlpCzc/MhpHrjv9UxTDslW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c63fea-588e-4ab3-b0bd-08d949582332
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 19:21:54.7344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3d89DOdyUPpMJllcwFW2JAt/V9fPPbJbxKdMdVXmblKTsSTgXZvQ8PmjL41SL4Jg/mjJlJofz2GX2TXJ8+Vag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4670
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
Cc: jglisse@redhat.com, jgg@nvidia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, hch@lst.de
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

