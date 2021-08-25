Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B54AB3F6E3B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 06:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F09B6E145;
	Wed, 25 Aug 2021 04:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8836E141;
 Wed, 25 Aug 2021 04:20:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkzSM8ffDAeJujnnKNJsrQCPAcbivkYlMJ+tpsNTFkrgu6EEKOM2cGbOTIOcK/D9IW8cFEU7gNRcxAr2rSFNs//EkaTm3ouCHoM8L+FtX2VLYIexT0Z0ieErSU83KAWIfci6NGNUuZZF+jG1yUlbIsh92704uqFtgALDJDOJTxikA2krrZFkH7+tkUpQiMht0G2TnmwlRxBtIEustMZ1X0ANYPXHJxhLT8x0dsSbXKzgyg12lWEZu4OyRN5d1aq2a5jlQzc59U4OANgtwl5k/5eWETG5XT4O6hS1GODCbZ1Sx5fHh06RkSbHZXkVsbw8teBV242rey5csPc62fQ6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/HtW1JAM3zl/llSyGWWwvnXjZ+I+rn1LvUfc29p62Y=;
 b=OdasTBEbscq7nD2VERF6tQF2I3suVAG1bnJmRBnErcvpcVrMHG++pS0Toacb+hR+hNpiCSktDok22ntG7To/AvI6jr7qf08f7GnBnDqKB2kDsFuSTIon/b2SVEx6mROW844OIphwBiN65ISXerTnAooXqpyItaasQ+yj9SU9fdbwEVLaAfwtJwDxuq3Sa0PO99K5qyBnGdKELEXU+IMaonW1FCDHwNO22HEDX2pvBzQW7Ls9kYwV7QoFT2714pMygI5zcWsr6ozo0dKr0XfvvM2Af9Ad2QrSC5sdY5n0ie7J/rSU8d60G5cgYcnN2cAqDt7eal+0dQw9i/TcEZ1mhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/HtW1JAM3zl/llSyGWWwvnXjZ+I+rn1LvUfc29p62Y=;
 b=SjH9YUWJFxQFV71OTzS1TS/EVx9FQWXVkPvoFv+LdzXukisRX5VeSuPcg6Ac7AUFmnE8vtI5TTPPba56wbldU+4JPM/qSZiNjnknEb08HxxpJoDLJ3QtlBsHZX2BxbtcCvqAxPFQCcOhEDivcm7wnO5au8jUl35/DIXr3l3YHuM=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4750.namprd12.prod.outlook.com (2603:10b6:805:e3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 03:48:53 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 03:48:53 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v1 14/14] tools: update test_hmm script to support SP config
Date: Tue, 24 Aug 2021 22:48:28 -0500
Message-Id: <20210825034828.12927-15-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210825034828.12927-1-alex.sierra@amd.com>
References: <20210825034828.12927-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:806:126::15) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR04CA0190.namprd04.prod.outlook.com (2603:10b6:806:126::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 03:48:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b9f57e7-2787-4ac3-3a39-08d9677b41ae
X-MS-TrafficTypeDiagnostic: SN6PR12MB4750:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4750A26B138AAE1EE5E5022EFDC69@SN6PR12MB4750.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tCiLxMI4dzT6KuGGNhfQ57silOfM32xlmMxuu+0e1dL0WGg/0CwylziqLwfB58YNnrSS58tGF/B6NE7Qc5K7/i2QFgKsvJdqx7arKVPInZDVwf7Fr7t+Wi/g0AHQtP9HftQRj4xkEZbFuRHDZMLtk2jtEEA9bNcy4JFoVdFN4zXySqLmoCTUIqv82dIijoroh7THI5mnUbdGg3ZClneuSoGazBqNhxnYSt2nlB1LcLaW0xUOxorlAd5UnD/6l1uESg/2C3VAPMr+zgLGARsHY+AzRz1o/mMVQF8t4kSKfKPjVyKpSsabAX/OE0UGng2AokUqgwak0UGXtJSk0YPj55IM/qPkBf8YPUspWg3+bJaQc7f97yKKx2yFr8I2xo3B6Mw9S6Ybys3Dfh1MkWyHX+6Xf9qFD8tS4TitnXFYoQP1/FmtDOPSrzQ0HKxobNLG+FUTsWCrjbGWBzOv4syEdQOryoJ/ijLq5PetFf5w9UiGla7bWJRGgtC7KWIJ/KYfpPIW0Mjp51wtWjJbvD63jFseIphjJa749Uoo+vGFii6Lh9GXG6Bx2uqSMEGGXZeFS4lY1XszjZ/qd9FOyPUYmRUkRLnaSXQA2bcgqyGrT6oeP/5S6gSMZEHxHBFEfEH9eTgW11tduY7w3NLYZ8oZ+NmTTor4u9iAUVZuF42Pv+tl4WU7wtJEk8A57goYdYieujQC2cDRPcC542300VGCXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(7416002)(6486002)(1076003)(4326008)(86362001)(7696005)(44832011)(52116002)(186003)(2616005)(956004)(38350700002)(38100700002)(478600001)(66476007)(66556008)(6666004)(316002)(26005)(36756003)(8936002)(5660300002)(8676002)(66946007)(83380400001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kUkcxiaL401raqQk28EO8PZ3B83V3LHkBpPFOXP1SV8kSMUO/Tn0SONwapWj?=
 =?us-ascii?Q?jmO+le11RsRgK5M6WgRrhysSroM8bPaXt6aXnJgqu67cXdkWcWlkPOo7RmD7?=
 =?us-ascii?Q?7eiegFimV8cBJ50sMByisJ1dbfNO774/oO5PYqqK1tHGckHTjgVmf9pmNbQI?=
 =?us-ascii?Q?nFgRpkjQ8FIc6weg6DrX9I3xOv/NwNePH2D5ty+xzG36onkr7pmxmgs/h+kL?=
 =?us-ascii?Q?mMHU0D7p7AbcqdLsad93CWtUU9I/L2Fl66Il6oHIl/UxzLluA3UfNRtM3iG/?=
 =?us-ascii?Q?F1fZRBlyGQ8MNptZTQ7JBIyWV3EFDFFxyqBzdOuHngkKwiK+qoYaycKn2PPt?=
 =?us-ascii?Q?vLFmPsuQcnne+MItQeIZ9QlzA3Tw9hduHaiWj70VKxRM0/zVrmxK6/4s+CUq?=
 =?us-ascii?Q?pRykKjJtwFjZHFagfHn+PJzqi5poy+ED+LU2ug5bZR9JqGa4GNQD8GyEFOu4?=
 =?us-ascii?Q?SZY7FIk+/velGTtLl6m59/P/fB3FliDn4+/CT9ADxe9jbJp2mRDifyrAyuhu?=
 =?us-ascii?Q?00aRU7zzB/pRuVOyuywQfEIolqQoKA0nNfWso490UtWL+xKbUS2X/IjKldLB?=
 =?us-ascii?Q?tE9c1r2b6RMvfWiHVPPUpYaOORDYHbiZNp9bjb6SXOPWVzn4hFIT9Zcd5l34?=
 =?us-ascii?Q?8OZx3LTDYSxlOs5dGxcUC9g8s7/hODQFrR8JlFSqyEPOVFH2RFpBV6ZabVTG?=
 =?us-ascii?Q?JaQY06barBXPFwfsmmTw+Ke3t4LIFd69PO5ghflnzOY8rwazQqTTDEioIW2G?=
 =?us-ascii?Q?0/bMLbzknfuGSd+978OlPN+QC4pNl5TOt1k1j6FNsUxKDZizYkruewpu9X7X?=
 =?us-ascii?Q?lg2Z4Mp98q/K8ECrTKkjZNiifoyH4LkvuJ4+2ysf8E29AxVeLnUpeSWs/eDA?=
 =?us-ascii?Q?RRNYeKD0v4hNlWFUvusVQ+YFsmUBmBf7o7AUMM7mRQWLbnPTHQ4mfqtyYhMI?=
 =?us-ascii?Q?FyErxdthLKcsfATX0PtP6oN1BBvZpho4E2Z3QuoKwigI11IF4VKrslLW52TY?=
 =?us-ascii?Q?E8Pvsa8cWclDpPilUOn+ZnssZ+cT4yVxbZzzmaodNuTM3Oh5g646OJAjXB2G?=
 =?us-ascii?Q?ZgtcwTKABlasd7YpaJIljjfpMBRCQ/4mxFuYdDQ3XhkEdcxeXR+rJhzpofNb?=
 =?us-ascii?Q?m9IFfIELcCCh1rWPp1CO+8vDf3qMaX57v+TS3kvircCQ4QJkpBLDbEu6I7UU?=
 =?us-ascii?Q?f4vgf2qPk7glPKbMaISNcPziEUURo/T6rjZmzL+R921Ts4i7jAy8/CYZh0/Q?=
 =?us-ascii?Q?+fQCoGso13th9r1/paM94vHf0FMKhhXzlmHUZbfHRSHxvWUlreQL9i1lEGHK?=
 =?us-ascii?Q?Yq/XaJJxVuo6ECy/KY42G2pA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9f57e7-2787-4ac3-3a39-08d9677b41ae
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 03:48:53.2561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klxSZQvNrJFcz+9JeFt6dMgNUmOXFB3NwCDQAaYoU3vbZzz71HbGH8ZJYFhcgx8qmxaWk3sYIdvOTU12gUNmyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4750
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

