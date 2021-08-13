Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB243EB02C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 08:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAF96E507;
	Fri, 13 Aug 2021 06:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C796E509;
 Fri, 13 Aug 2021 06:32:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQtmYqpTSQzvezbTRvfuI5nTBSLtzpUFl2i0utyDQNntWXtUiFYnjsnv8+K9d22YUJ/kMRdxLOORKza+3VfWr02/tPHGP53sJ/uApBS7JiUWe4PRPYSCV9nmt2/PymbVvmigH2OjtlUQfffmzh66J/KwjJs5vd6PfZbuCjPS62EobfJaW8G1NcsxvbY/vW5NdPakFov9Icu0zoW11S0tvda4d+kiMzlAaKS0T1/VEXpAnR2fXuocugHiF4GANN67dLC0FF5Lr8nd+EeI1TWpaRjO0gvMBfY5z0irYdrMZfM9j2JPwPMzeeWPcG15teXtcGarB7e/LQcQh1AxWZ/vpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=707xnJfuFhrp+6dAh962xzl7si469vWZYp4BZWlrkTo=;
 b=fdZD7io8YMQegbYTugegIOTi7ApvMHU3iq2lKpeissgPLZcIItKpOgjdjvnNwluV3wAPUBAv9gfYWt/CMIBnuJhIFDdH8aZLOSAr/UgWdzpVXalVkygWiZmc3H3TWiQtt5OhCw6HgjW/1Z31KWRq46DE92WO/Wk12Is+MADhANtO4tNEp5+6Jh3jkWiRLwy9BsOCshOqgB+rlaAlRQ1VkMSd1yNUvJixaUK6t+N2K6DYsz+Fl4QyeenFuPhH/yiE7NLMOCsOeUy6IALDPBjnGn06KV9dGYMqXuous0srgHlcEqNdFhhjDR+Bt5NvVKhXEVx+1AfeEvoidsmugPTzZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=707xnJfuFhrp+6dAh962xzl7si469vWZYp4BZWlrkTo=;
 b=fpW8BLEwpgWWtlfRcrTVzNVhzbMQ0spoVFk2wyiBInqYcsLHKN0cqAdHwXvGi+85kxy/bCvl4OyyubyU+FnqFnYq38/461PL4gF5MeHd83NxFTNG47xzt22JNgIGm9X9O7W4o7YvMt08kbL29MyQfMY10grWR3wzxfHBavTjkII=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 13 Aug
 2021 06:32:12 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:32:12 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v6 13/13] tools: update test_hmm script to support SP config
Date: Fri, 13 Aug 2021 01:31:50 -0500
Message-Id: <20210813063150.2938-14-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813063150.2938-1-alex.sierra@amd.com>
References: <20210813063150.2938-1-alex.sierra@amd.com>
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
 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 06:32:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbc613b7-fd90-4022-2b83-08d95e241578
X-MS-TrafficTypeDiagnostic: SN6PR12MB2782:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB278257DBACABF9ED6FA8BCD5FDFA9@SN6PR12MB2782.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fqUx8InZgJW3SeYwMhysI5cqy+nzGKCWWfNe8LDRiXglXHUbVfIMCyrd2FrwjOTeTZvO5+dIJ28RpRfupKmXQQj1+FS7HZzyA4irKrMU2VnMu/7BNQJQzzTeLD2ndL+0sHSEscX4v2W+o9T4CBCJ68kh9knWLTExDm7G/l1bbaypAqfPN3daNkLS4YhLWpE4lGGGGzROSq7mjzDcKKZtAT6qRUz0nIY4NSvpOv40Zf1M4yfMQ/FNwAkdm+TUpPnGEN8d7SCmbfaxZ15kdhCZkS9+OLOebtIRvrisKTPwLNBaKTYkutWRHO2xWgsXtDVk0pnikObogE2ufEUDhUeTwiPWUgN/4Fgk5wKfQbtUXv+nblAFCSY+rxgMmTZ0nkCGlhK6m9EcJHzPzjjBIHYGT+TBxh7PwcDBgd+iN9FzgjTJzGEzAKp775qaEUqcUyQmytxFwOoGibvs2xvbz3HxxifwvF4o+vsd84VTjp0Fmh65+arqjxRd8jUqcTu1OZf6D7vr3sBgfNT/sGBmgamyDnLW8fCuIixTtOuSskLAN0drZkbmepM1oBQXKgXJKS+GqUdIJ3/Xi140gmJeHaXHN5SKNqStjBp9RmTvbuwye340FswigFy0Ok+RDP0fUUaQr0I3QzYCVh3IZFSvOe8vqZ41gwr/dvTVKIh3FUFfC5KikE70nMcQUk2RT2ca2KHy4aqRmDkiQ5iKf05cPDu8ow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(316002)(2616005)(956004)(7416002)(38350700002)(7696005)(38100700002)(66946007)(66556008)(4326008)(52116002)(36756003)(6666004)(66476007)(1076003)(8936002)(5660300002)(83380400001)(44832011)(2906002)(478600001)(26005)(6486002)(186003)(8676002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/DLyPltnd0X5UHVcuS8gwiErkNpPn3arf/K3bjMNmT2iM/+VRVWuv8IkFEXm?=
 =?us-ascii?Q?VkRpt5u7DH0YFUBERuPF9fRKXaeBAE1HaQoPpLt1zNNG/468gSlkYhE4vHqS?=
 =?us-ascii?Q?peT0lvovmhTx9gebGAdhW6E8PGjfQ63253f0wueH9Me5war3lrhMzBvlkWq2?=
 =?us-ascii?Q?97SuwRwoXIvCanudDeuZ43RIJEWEEiJJc1Upbh00gPh8GAGeCa86eZNmhGma?=
 =?us-ascii?Q?UDs9Zw/WrDPkU4Lv+DANAYXiKVNThi8jTtlk5XGRK1S6imSAGlXik6XQAW+n?=
 =?us-ascii?Q?kBTGM0KFB+Dtc8mOrnpHkWMJkOI+XzMIqBBFAIlU0qVSoEKcezd/El7Hsq3G?=
 =?us-ascii?Q?UQCY7xlfyDsAQHFQPIjPbyNWqwIh6cNXAHIKJsER8FUGRM8fZChWwVFULhO2?=
 =?us-ascii?Q?smI8O2+C84uR8k+WZUiZ3R67OrjRH09I70PugxAAGfsFnDxCC9DbHEeXjmA8?=
 =?us-ascii?Q?AWSCeQWKUKWgAwXOr4UgWUR2bUw0ad5BobLoqVg1J0LkyPN2VV6KnZjZFTzn?=
 =?us-ascii?Q?EKxBX2O1FaqvV4cxTP8AB7zNSmHzYHXT8L5WLM+svYxY401uOZDXpZR8Gmj/?=
 =?us-ascii?Q?bx6JWAlfxmmXMXojGuxsK6iMft061/qi5sKjKf4ORS2/aEM+DutX1sjF0VrW?=
 =?us-ascii?Q?WipmUm9IJ8dYdz/hUJjD379DWfAY60wcCt4tDQ74uHaQi+QCG5f5eqmz1cqj?=
 =?us-ascii?Q?lWcz8nkiZQ37ro23rMzlLXSU1QJFC2CdbHHQhD2cZiZi+NdBVv/MGuFH4cqB?=
 =?us-ascii?Q?AEDRGC7haThSwg7mf41LqRvVddr6FTrHSCjf3gg9IuRZ0sSKCAQuKOpCOoLs?=
 =?us-ascii?Q?vlaNcKokJIdBu9Bp66CwoQmPktRlsWvRv4rzQBciNzY/kJtld1yNHgD1uY6p?=
 =?us-ascii?Q?OLSzsHfBGfi8+DNB6t4zoCYgdAsP0HjZ5enNpA7EhNBnNfwtCh6zUc7Rt6Kd?=
 =?us-ascii?Q?gpEr/GppezbStp9pnPSpw4XwkPqSGSbfWGbsUvBjOBzHTUrTU4T2PmctsHJ3?=
 =?us-ascii?Q?wjNkviQyYOKnq7scMs2swPKER6yoZOE7rj4Fhd+UEOQ5eZ4Pke+dZDMhGlfY?=
 =?us-ascii?Q?Zgxp478VjOZXyRv0Jxb+YqhyK/Nk0k6Orm6e2L3sm1bjYeTu6L33oacbSkGL?=
 =?us-ascii?Q?BdvQO0HRIS4oMUVoc1yjpUc3I+NXF31dBSpTZil2CGZ89bvnZhBuYjiU5Pal?=
 =?us-ascii?Q?4x6UJihM01Y6pFYZrIm7k3OgCZ0Tiwpi/QV68dZf2tkpwn8iwFWYJ6Y6iO93?=
 =?us-ascii?Q?OG2pnMWqVG5cskhm1ZtdzIVg9LsT+pnLcZQR4DfVXErCVkMtvmfqwpHrYKzq?=
 =?us-ascii?Q?mdGj4KL9goW9/udroCuqxY7n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc613b7-fd90-4022-2b83-08d95e241578
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:32:12.3239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2kMm0Wbv1G2Ufb2sh7T55sjDzjjkCFnPzWolDo5tNi+lXGqmQnCYbpFUDOTPWmk8sCh1f1h/3AHdQ8iIhDBFpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2782
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

