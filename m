Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 255C34098BF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 18:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BE16E1F7;
	Mon, 13 Sep 2021 16:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2064.outbound.protection.outlook.com [40.107.102.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233AE89D02;
 Mon, 13 Sep 2021 16:16:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcwLs3Fki5+jVWIoy2sVGc4lUbrQ13nAY1rvcSqTdz7DnLY7qdin66pRj4fZfu6CVYaP1ej6B5B/t9Kr1+omqu/o1+K4ZN7ChB/D3v2ic1txB1tvXOGBYXFK++YbGstsG4p4T4uuGszVNvSeSm+Rlo97td03kz+0x0S5JY43O14+RIyscIczuV2q4W8ZMORqkh4iqHm5lYyGkac6ulieNn0VpxflIVZVzLaeYi65kf+LvGYtgzak4TsYZlbS/YZ/IKcJJlTOftC+zNPVM4boZyu8ZpgeX/eUE6GC8edaYmRES7fy0yr1ZiA7qyXa4dg+vNof2YrbCZ0mnNviURAVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=K/HtW1JAM3zl/llSyGWWwvnXjZ+I+rn1LvUfc29p62Y=;
 b=KTph9eul9blD/mih2D5nTJ6fAni+JhSOGeLImBXJPAh6HjnY1gxkMDKrQHKpOGU53/TXMAolbXvxoSgno5jMpUQqcO1cA7YOIwhuEPvC749oA6EWVi+GwnAe6ihWZRWjFi2gTgw7cjnVEmc/AlBJKjlfoc7+7/SEptjqKLq8Yjm8HPdY9hkokKfg+RZe16jyKJ/F+45ea8jR4pLjYBBYUfWOu7V669fJOwImooLIpWC8rmoV22fSSaSWS8meuV853qoPVjhV2vVDNRE3gGpGw7RYCFmWNxgcM77GCgPU7cYJBzAG4UMDfFMU1VOAmvZO5NhTXzI0U/6l312lbjLcdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/HtW1JAM3zl/llSyGWWwvnXjZ+I+rn1LvUfc29p62Y=;
 b=RIPjnlwkg1x+qxqzfHhlVxilo7OrrH4SzR5Pcdy9Z/k/auY3AG5J8Gp/gLkIzYH5oMYEvNUcPat5PYEqYiUtWjK1dYBJ4kfWJaNm+HPJACNjY6AMPSWHicNMrOa7WnHDyILkLjPbhB9VWt7GKNFbGr99n5IFajNRYYClFIbA1k0=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2719.namprd12.prod.outlook.com (2603:10b6:805:6c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 16:16:27 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14%7]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 16:16:27 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v2 12/12] tools: update test_hmm script to support SP config
Date: Mon, 13 Sep 2021 11:16:04 -0500
Message-Id: <20210913161604.31981-13-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913161604.31981-1-alex.sierra@amd.com>
References: <20210913161604.31981-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::20) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:16:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92d6dd4d-5132-4bd8-dadb-08d976d1d6b5
X-MS-TrafficTypeDiagnostic: SN6PR12MB2719:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB271987D23BCE5CF3CAA7CA3BFDD99@SN6PR12MB2719.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qf9MfAWJW1E084ej0zHRenqDPd1/jepm8JXikpXrINYlP4Awlfid68hsf5ozxlrk+ORn+fV+AmLg0Keka/um3lJ43I90uV13IZuKCJj0w/ojc9wuEIhlRY/GnJX78w1bGSqLhu15enk/wmYhl/Sx4UX/gx/vbGNxirDSdcfO1B00lvNyUEhBrQe9+KWCx+pM68WcvXIKR1XR3fucCIVuOfIcOGmDiN1Tc6e9heXDVL3sCU0A4IpImuMvoY/dRBbS5UmfaC0liiLXanGfy72MtGDKJIJ0ar1+3A39dJBmc+B7kzZqBP6NXxV6QSkNS2T23PRqKVLwmJOT2MkmNw4vEvn9cMYdd5Ed1CPOXofdy/lLlTTOw5rHR/Nlr+Eez6aj+GVW6F954srz/tmcNlsU+KSaLHnqHwAlNzLgPsHFbZ5kyZzNDQ0eheAuGS+cO+WiYVK0viHqE9DJFai26oSf/cFvzliUzsAONqOcJx35b3lnY3/hRCnPV7hnsWIYVLg4mclYPSXyHnSS3phjFBPbd9jYcpHuzPawfxj7CVFUJCuAjYQ1Cs0SpxVFb7KR/VqH1gqGvuVMnIC1MsuRby7Ww5rOPkoFI5pF8Yg/7yhE2W7laZ8dBKteggodYctN7re7eF0LjuV+BmNimYnCMhrQajLBoWYmMlSIT9Xx+BM7TwnzEmxVp1VyUvrhPZqWJo6wOJhXyKLxjrHLL9+LsP9JRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(6486002)(316002)(4326008)(956004)(2616005)(2906002)(66946007)(5660300002)(7416002)(1076003)(52116002)(26005)(7696005)(186003)(478600001)(38100700002)(6666004)(38350700002)(36756003)(44832011)(8936002)(66476007)(8676002)(66556008)(83380400001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uEa4M/N8bVu5Eb9U5WEUngKpJIawEsSweW1/2QAbH8UWrGKg5B0JD2s8mQ//?=
 =?us-ascii?Q?jRPcEt0BtJG3qglGiwUogMJ3AxkNV5CwV26iP+4cVtZ2U15FH5JYCS8NHqcT?=
 =?us-ascii?Q?23PEOdrEkt5iOqxV4YU1hErMlRkLpRmvm3vL+C7pVKpomXYdzRK9sF/o05oL?=
 =?us-ascii?Q?aO5lpQv7NzS50aeTVe9mPS4QEuHi+T3aSYn/ShDsJnrQ8i1Y/t4UZ4vSc23H?=
 =?us-ascii?Q?3V3PHe7iy4+oMRWXbH+U0W3Z0t1v52PXcpEQTYliNlnqe+03VzJFrcmOYgcd?=
 =?us-ascii?Q?w2JbQxtjOAQKhLtkeT2kE/S1R4dY4IAP056Tqagpms7s3FVQ0GOwW2wU+Yly?=
 =?us-ascii?Q?EE957vK971b6eZTFfKSnojXGkNVzMx00TNB2IhMX0fMDeXaAVuRxAGyUf91/?=
 =?us-ascii?Q?QsqgxdRIAhBErFbr+IbbNs4HAPp/1q931YCgmb10gHrB+h8Zhr5QFNhlNbT0?=
 =?us-ascii?Q?/IA8xiVDrlLs1jgZijtHvdddGcH535hvDkGjhXqXMKmoC5LG/FaFT0zxMD9k?=
 =?us-ascii?Q?JOKdQLU8FKCg/lh0F85oeQe5BT4JHvVr4TBD/3z23o28uYrPUOupIRpdVyyW?=
 =?us-ascii?Q?7VOZ6dx+GZUdO+BGyMboPtjkQqAO8Zs8UME2j4+PUekAElMPbztMAfOyr5Jf?=
 =?us-ascii?Q?aYxIleJNx6my8rgBRtDivN/hYO4ERNDJ5yWfv0usykcz8Hp228rpOo+Pap+5?=
 =?us-ascii?Q?lg9L8puxOSj+Uw6cb4aErQ+d2Jl7/q/h3PmLq0+7jlOim3cNZ1552Q5ZwcoJ?=
 =?us-ascii?Q?hIfx+UH8X/I8zUnZ4KackmqIYTqmiLSnk9DC8mrB9HRwRQzpmQuXdfkHC8x4?=
 =?us-ascii?Q?GsuNfWwr0ezWcCDWKD1qFCVQrPk2jvvDRdzC5zituyumG6Aur4g4MjzM+pmf?=
 =?us-ascii?Q?bsBICrmQxTc0GS2NmEuTM7v5BaE3A7vSk58pl4aQtXO+7kGpnoCSe02ua5al?=
 =?us-ascii?Q?pj9lJnMOapa80odMLl1aww5N+69EpGxvQpKCY345uz+Wo+IUHuBj1dMmVbhK?=
 =?us-ascii?Q?s+49WDHWg8r48dzVAeEwxG730xIWugyS3Cz9t9hqFIsjzqlfiUjg3DyyTegE?=
 =?us-ascii?Q?Y8zgQCKKajp4B63L5R1n+CUoeH+JPp8RpaO9zjhyjxwAltPP8dWO/JxR/Eu0?=
 =?us-ascii?Q?MPUlOOfhySo8poACOv4TFp8/8vwIJm1zieP0QpRCC2422wTzluDg+nq2w8D8?=
 =?us-ascii?Q?n4IlYyugrnS4Knpc0Z5mPbgQ2U8plHYIHJwnwml+eDJidoDUyfKw2PP2nSMt?=
 =?us-ascii?Q?Cl+0sX9PViLN0OsS6sg0MB52jUdbvFJYgcGIHYNVR9GhJPZ9EpjbxIZ5uip0?=
 =?us-ascii?Q?8jrMpRDa6HuWQ3W9KstbFCzR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d6dd4d-5132-4bd8-dadb-08d976d1d6b5
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:16:27.3623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qp3JnAhW1IbwykQpZe7Zlqr7dHr/3WmQBd7zyokC6dRW2nFB1IcAiA9ThBsFgXXKd7DYmHsk6is9vkpOMmQEEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2719
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
Consequently, this configures zone device type as public.

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

