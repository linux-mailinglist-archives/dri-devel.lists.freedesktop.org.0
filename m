Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4498B411D3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 03:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2566810E851;
	Wed,  3 Sep 2025 01:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lzp2M1PN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5341710E851
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 01:20:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKeSVMaivLZQQxDXhab8EZt3OZM+5jz0mGlp3OZtMCsXmoAnFf+RnddjQHgerMwbJHnUvNZHM3sFQmOagRrdi1mUbdZcQGa8YEq6p1KCR1U1hx45rxo6Vye6Fl8p93bVCTEB85shmSVvjiIqXnob2MEVZtzEDc2QtDSs8LJfuNuWbARQDqeoSCWdlJuzexBfnOfnzIh6GiIw4LkhUXRwFMck7SrrXJg2EWziDaS2LbwsxJJ8aYNrfv22yphpmVTyVcjZiCVBr6iC5fKpv0cY7PGAZlAX8sPXg4CKQLnOQhTAHoAi/b3TNUXYq1AcdIcK4KxjsJ7SBqOHOJMGI1V1AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j35J763qDBOFuG2qAOxwkfOYisxX3tMyX/1oOtKjkSA=;
 b=hhL/yeY6nuF+DuOCLiLua/s5PqC3OWBlFdMomkF8FD4yqsCSj2T76cMF7QBzLy33djI8Wpzr+SRP4UeaWJl+CYyNkEz8efcg2v2XFy+HKM37bSEogApOJQqr3hKKX83V6hlbEcLw79ONEFsPg7C+Yx7Om96n+tbw+aNyDSRfLbC5OzGE08jZ7N+fjIentXI91S1d4c6prHF4lTHZs8MjFBspn1DSY80dXXSaHEAgZigi9ydxZOeiU+Ac2TQuwBnSOQm04kLOnSHr2hJVTNJ6NaQUJVjSRbPpAF3s1SRF61Gy1cu2RqnTJwF6kjsQqJuD9u4DLT0zh5wiJa1HUlK/eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j35J763qDBOFuG2qAOxwkfOYisxX3tMyX/1oOtKjkSA=;
 b=lzp2M1PNikK2vucxLgB29Nty/Sbgw1pOt0QX2UqKLFUc6jVxIvTX1WV+1k5FJ+G+CWw3El828jsDb822Hu8+hAjIX19tbkgB5Xi80/eopX5jd131U6mB5tWTJ9dBrqJfNT7XG/f1N7CQI+hCyv31/b+6K8gAqxJgzp9yusY6cfz5gcCgaKDz2yUwsZhfJDDcvGRQ16PIcspWj00R+L+KJ7alJiZeSszZIb0Ov830QkQb7XJo/rMRKmSE9JQ54UX3F8LrppPJWKfKkykTlpd7HJuKKW8xZVTq+fMQ+jusDyrQmlEWV+FopJS1+aj1ktHpccu6WAcFEKzkdzXW0brw9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MW4PR12MB6708.namprd12.prod.outlook.com (2603:10b6:303:1ed::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.34; Wed, 3 Sep
 2025 01:20:20 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 01:20:19 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, Balbir Singh <balbirs@nvidia.com>
Subject: [v4 13/15] selftests/mm/hmm-tests: partial unmap,
 mremap and anon_write tests
Date: Wed,  3 Sep 2025 11:18:58 +1000
Message-ID: <20250903011900.3657435-14-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903011900.3657435-1-balbirs@nvidia.com>
References: <20250903011900.3657435-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0173.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::28) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MW4PR12MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 82509ded-d9b7-4186-65fe-08ddea880c0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h/OTY25J3dnqnzEgtwAOm8RUpxnOY7cCBI8qdtyjIS+ycCYJ7M9CjJ/hcPw2?=
 =?us-ascii?Q?aieTWIY1KdiL+Sj5FYQvBOodAYSIvz4ulsil2LHfr6pnFTyDzB6RpoiVjM5K?=
 =?us-ascii?Q?BbDH7U51q+KtLA6LHOreuY2FQjMs6A3e8pBvYdU0xyUjDHV6t2TE4+aaqEJQ?=
 =?us-ascii?Q?QZVgwjZhZjh0XdgllfJiwCLuS9iiYiBg8ubyBTxtVLWWy3mxOuFZQ7e+oVCy?=
 =?us-ascii?Q?Gj5s7eLjJ3XIKqM8K7/RMpKphW7q76LsrtMeK3aPRC+c9lWN12awSj/7mLU0?=
 =?us-ascii?Q?kdIyPGbp7FXX9hE2nb2sz70AwnqU0wzvi6HPfu3AYdOCMowkc9DgACZMioOS?=
 =?us-ascii?Q?Le3B7NNktpTeA1wSMpAE1C2P8I1xcZ8ZDADy7KEDfKoDjexukQ+VLjzjsVnr?=
 =?us-ascii?Q?rW8njH44XP7yTyeFchjPd5g/MvJByAafP0OcrOQnLCkp/FtriYUL2ZDqGwes?=
 =?us-ascii?Q?NDGBRJwHUk2JDObfshwjaZfUHTNMYPDUMjWyA/jq+yU8K3mFLh+7WZC4d7t6?=
 =?us-ascii?Q?EiC6yxkiSmDmqa05dCJt8Q4CnERFipvVeg6Go4UqqsVSJmM8AZ6duCRKxqws?=
 =?us-ascii?Q?Zojhz1ALY0xl82WA55aW/ePOg/fMlZiGkocNpWD0Lsq2gBSH9qtnFYBFPjdj?=
 =?us-ascii?Q?7T+LMjJX7ugiu2rxZ+4RWCs2WiSuhoesRyizXZiXWnf/XwaJxbJUQ5LOfpXA?=
 =?us-ascii?Q?CHSTVjJKUc59MdJlFTZlQx1XIrD4SPalXVIrhk+RO+hgzO9fP8RnIojNUkWM?=
 =?us-ascii?Q?FAdAKgOhlKmsoJI1MkhgHpExpnojmAmuroz0H7YagmZTrgv2hWV5SfzSV/7x?=
 =?us-ascii?Q?hy8ftedfs6VLKLEWF1x1BrmH2aRWvdSatYzL7RenEBRlTX6E/MHw3xBeAfEQ?=
 =?us-ascii?Q?zC9rM+ZRmn8tgAAf6ea1VCmJGtuyWzP9I3+F3/gK8VM2fdL1Ac0DxNl5rhqL?=
 =?us-ascii?Q?3U7Bq+WG4OvPuK7cDL0misQmGCrFVDpalUBIGESR4XvX1vSM/UQgTfkH/wXb?=
 =?us-ascii?Q?FXQ3ZncV6YwkFnzasnhq96O6sIGLhtuUV3MQTT4ITDyQgE54ZDribjBdhH2L?=
 =?us-ascii?Q?7HYFuidDBTXb99jkHp6fFzdxkGk5AtEez7xDfgTXOIe0/X2e+HuK5IWQ8bwb?=
 =?us-ascii?Q?DecKNx3Z9cNtosk9I35CJzVTDTOfL6RYV5JqEjfRz4xWKL5FIQnEZnjByYCo?=
 =?us-ascii?Q?809XyOOWgdHtsGBfiwsqN4PrnhlRdWZARUz6qBSpTs/J55sRWdVKH234RHT5?=
 =?us-ascii?Q?RPtNlPY2ZQTwqHKjuqa+ScKDzh2gWc4CNDZhekjq/mqVWTL7yFKowwqYRaQW?=
 =?us-ascii?Q?/5MiCRRzb7Qe4Rj9/Utzo6x/eeeAx5CubKojZcvpIRYcmGXYIEOO3IkEzYhx?=
 =?us-ascii?Q?LgUuqanJsdgp2MsHNJjgVuvDnvGMJYRpDImFS8rGqwCB/Y4axg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p9iBZgnJ5Sf6hC6w4dgWVXgt9RxuXtTdaAU6r3aGdtjueb2foD+e1wtB2Sar?=
 =?us-ascii?Q?J4ohTOuTOZZYnkum+N80L5nf0mJ937o0H1HBc2vY+YFOYWlToFQqk/tt0veC?=
 =?us-ascii?Q?dYlpll7is+sL8wQVrg6ppzV+2V0p3MjY/Q/UJp5P7gba8GnNebN3UTegsjjJ?=
 =?us-ascii?Q?ggP92BwxYshMOkA/2bS6XYTRg24ncVgxoK2wQJT5uRohkZ4t/d6Et6eRko+N?=
 =?us-ascii?Q?QexPkig73Ev1gskvZKTUsTIZZX8seh0+2hTI2TiioAOM0F8wiZxZbnn5SqG6?=
 =?us-ascii?Q?GgT060vWd5a01O4yiDs1TBznpdZYSsCJVZCdLjI+f70kEX6kl0FhceT5p0mV?=
 =?us-ascii?Q?Mr6jEtGh1KBS5+2DuexWqwy8MdRtetqTiXBryy0ybZMXIwxAu0nNhO4r6uiv?=
 =?us-ascii?Q?Yy0dk3cxTquFTNvBoLA1mB1RDldMipBmk34KwFZri4jrN37Z4OPO3tQ4nnJZ?=
 =?us-ascii?Q?j8A0D5FvQyead6T7kkOaBBOqkIQUpM+d+3oZVfG83c1JEMtO3GYANyKhs6by?=
 =?us-ascii?Q?zxvINraDBrgZBdKHs+TryGd4r3GbOU2jPM+2pNEmIrOdUu61QltDR+L7vlku?=
 =?us-ascii?Q?6GlT1bT0cSAdFpEjDsKhbi7/I5PA3MByR0hNWQGi2eBuz5r8PlWBJ5ApF4FQ?=
 =?us-ascii?Q?A7ccNhw/oNq/0Et00hmyu0OxuKh56oBW2R8/pGl00e7GMuCA3hL4y5vYIViI?=
 =?us-ascii?Q?oYwYGaq61rVfdLwglmIn4vJzuXpvjxGvG3gF3gNxPNUbmik7WQACQJHuU9qa?=
 =?us-ascii?Q?zHQ9XStyusv5HC4rZ1b4pt9aUxW9tRB9lxPWn/orfLEgf1pDvl4xA7aGJ3AO?=
 =?us-ascii?Q?kiexXzHeWuX5nt1FA0Ix+9tGa/8pYTgRbrz9SZCUKQ9pdyf8oY9dOLavK7To?=
 =?us-ascii?Q?dsc6pRn2bpTBFcmPj2YjndA8nFeufk0VMBIqnCdpdWYdDcXas7+PIYp3Dxyz?=
 =?us-ascii?Q?0N6cdAtlrK6bHLpp6gH9n3whm3YH67t7GEtSyRIvhjkMV7Fu+PqObjyP+ijz?=
 =?us-ascii?Q?VWyjV6SxhMHdzgRHMwkRzZ4U2N5FCwxUVvIyxuO0JmQtNS9bq804GdQADUgX?=
 =?us-ascii?Q?5TAVjXXJOV0Abv/s/4ldPk4IxvgdGvsHUAo6Q8FmK7Mf6RO04O1IY8Ajma8J?=
 =?us-ascii?Q?9AT5mAQoKRxaBq8dWmyJs/0945akgfnU4idj+R6xTxFiwQyCTgRtWsIepec7?=
 =?us-ascii?Q?T0bvfjfjxTYU9JpztXC6M6EUSAN6CFQKbAt7eQOYzOVtPFjgXVCIqcURmDRC?=
 =?us-ascii?Q?79kB4bO4MAtd44egT5y0G/u9T9mYANR0a/mGmbbqNFgEsHVc07oyGOJr69D/?=
 =?us-ascii?Q?pdSyc2LpGO9NJkxu7aJZ7VxUI4q3gPkxdzhlQTKSUHNSSNsEfEg8yW43tQVh?=
 =?us-ascii?Q?ktF4q+wLjNY9sgUbnZmgMM8tBihA76OoDCXPNfBBfYKrWf/djqefGgj3EhjE?=
 =?us-ascii?Q?VHnh8DH7zo6owvycRbKpNJqwcyRS1RWNi/wAAPVQzLqPpUPhe2RZfSMrlDLx?=
 =?us-ascii?Q?mTupvK7vMDBvAnY9un+LBh+w9gH4dTA91vIyWaKgrSrDyvzWo5MkhF3E0+QZ?=
 =?us-ascii?Q?f8d/MvzfwxVMFXHdoBKtbBvwk06B736520800QkF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82509ded-d9b7-4186-65fe-08ddea880c0c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 01:20:19.8349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pi32x/Hk3huV05HbGtcaUiDldpscXiZd+OW4d/LxfDwhAbrAKSHrDs/OcG3FYx1IRkrWcXbQZR8TVWe2vim5CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6708
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

From: Matthew Brost <matthew.brost@intel.com>

Add partial unmap test case which munmaps memory while in the device.

Add tests exercising mremap on faulted-in memory (CPU and GPU) at
various offsets and verify correctness.

Update anon_write_child to read device memory after fork verifying
this flow works in the kernel.

Both THP and non-THP cases are updated.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tools/testing/selftests/mm/hmm-tests.c | 312 ++++++++++++++++++++-----
 1 file changed, 252 insertions(+), 60 deletions(-)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index da3322a1282c..0e6873ba5845 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -50,6 +50,8 @@ enum {
 	HMM_COHERENCE_DEVICE_TWO,
 };
 
+#define ONEKB		(1 << 10)
+#define ONEMEG		(1 << 20)
 #define TWOMEG		(1 << 21)
 #define HMM_BUFFER_SIZE (1024 << 12)
 #define HMM_PATH_MAX    64
@@ -525,6 +527,8 @@ TEST_F(hmm, anon_write_prot)
 /*
  * Check that a device writing an anonymous private mapping
  * will copy-on-write if a child process inherits the mapping.
+ *
+ * Also verifies after fork() memory the device can be read by child.
  */
 TEST_F(hmm, anon_write_child)
 {
@@ -532,72 +536,101 @@ TEST_F(hmm, anon_write_child)
 	unsigned long npages;
 	unsigned long size;
 	unsigned long i;
+	void *old_ptr;
+	void *map;
 	int *ptr;
 	pid_t pid;
 	int child_fd;
-	int ret;
-
-	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
-	ASSERT_NE(npages, 0);
-	size = npages << self->page_shift;
-
-	buffer = malloc(sizeof(*buffer));
-	ASSERT_NE(buffer, NULL);
-
-	buffer->fd = -1;
-	buffer->size = size;
-	buffer->mirror = malloc(size);
-	ASSERT_NE(buffer->mirror, NULL);
-
-	buffer->ptr = mmap(NULL, size,
-			   PROT_READ | PROT_WRITE,
-			   MAP_PRIVATE | MAP_ANONYMOUS,
-			   buffer->fd, 0);
-	ASSERT_NE(buffer->ptr, MAP_FAILED);
-
-	/* Initialize buffer->ptr so we can tell if it is written. */
-	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
-		ptr[i] = i;
+	int ret, use_thp, migrate;
+
+	for (migrate = 0; migrate < 2; ++migrate) {
+		for (use_thp = 0; use_thp < 2; ++use_thp) {
+			npages = ALIGN(use_thp ? TWOMEG : HMM_BUFFER_SIZE,
+				       self->page_size) >> self->page_shift;
+			ASSERT_NE(npages, 0);
+			size = npages << self->page_shift;
+
+			buffer = malloc(sizeof(*buffer));
+			ASSERT_NE(buffer, NULL);
+
+			buffer->fd = -1;
+			buffer->size = size * 2;
+			buffer->mirror = malloc(size);
+			ASSERT_NE(buffer->mirror, NULL);
+
+			buffer->ptr = mmap(NULL, size * 2,
+					   PROT_READ | PROT_WRITE,
+					   MAP_PRIVATE | MAP_ANONYMOUS,
+					   buffer->fd, 0);
+			ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+			old_ptr = buffer->ptr;
+			if (use_thp) {
+				map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+				ret = madvise(map, size, MADV_HUGEPAGE);
+				ASSERT_EQ(ret, 0);
+				buffer->ptr = map;
+			}
+
+			/* Initialize buffer->ptr so we can tell if it is written. */
+			for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+				ptr[i] = i;
+
+			/* Initialize data that the device will write to buffer->ptr. */
+			for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+				ptr[i] = -i;
+
+			if (migrate) {
+				ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+				ASSERT_EQ(ret, 0);
+				ASSERT_EQ(buffer->cpages, npages);
+
+			}
+
+			pid = fork();
+			if (pid == -1)
+				ASSERT_EQ(pid, 0);
+			if (pid != 0) {
+				waitpid(pid, &ret, 0);
+				ASSERT_EQ(WIFEXITED(ret), 1);
+
+				/* Check that the parent's buffer did not change. */
+				for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+					ASSERT_EQ(ptr[i], i);
+
+				buffer->ptr = old_ptr;
+				hmm_buffer_free(buffer);
+				continue;
+			}
+
+			/* Check that we see the parent's values. */
+			for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+				ASSERT_EQ(ptr[i], i);
+			if (!migrate) {
+				for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+					ASSERT_EQ(ptr[i], -i);
+			}
+
+			/* The child process needs its own mirror to its own mm. */
+			child_fd = hmm_open(0);
+			ASSERT_GE(child_fd, 0);
+
+			/* Simulate a device writing system memory. */
+			ret = hmm_dmirror_cmd(child_fd, HMM_DMIRROR_WRITE, buffer, npages);
+			ASSERT_EQ(ret, 0);
+			ASSERT_EQ(buffer->cpages, npages);
+			ASSERT_EQ(buffer->faults, 1);
 
-	/* Initialize data that the device will write to buffer->ptr. */
-	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
-		ptr[i] = -i;
+			/* Check what the device wrote. */
+			if (!migrate) {
+				for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+					ASSERT_EQ(ptr[i], -i);
+			}
 
-	pid = fork();
-	if (pid == -1)
-		ASSERT_EQ(pid, 0);
-	if (pid != 0) {
-		waitpid(pid, &ret, 0);
-		ASSERT_EQ(WIFEXITED(ret), 1);
-
-		/* Check that the parent's buffer did not change. */
-		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
-			ASSERT_EQ(ptr[i], i);
-		return;
+			close(child_fd);
+			exit(0);
+		}
 	}
-
-	/* Check that we see the parent's values. */
-	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
-		ASSERT_EQ(ptr[i], i);
-	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
-		ASSERT_EQ(ptr[i], -i);
-
-	/* The child process needs its own mirror to its own mm. */
-	child_fd = hmm_open(0);
-	ASSERT_GE(child_fd, 0);
-
-	/* Simulate a device writing system memory. */
-	ret = hmm_dmirror_cmd(child_fd, HMM_DMIRROR_WRITE, buffer, npages);
-	ASSERT_EQ(ret, 0);
-	ASSERT_EQ(buffer->cpages, npages);
-	ASSERT_EQ(buffer->faults, 1);
-
-	/* Check what the device wrote. */
-	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
-		ASSERT_EQ(ptr[i], -i);
-
-	close(child_fd);
-	exit(0);
 }
 
 /*
@@ -2290,6 +2323,165 @@ TEST_F(hmm, migrate_anon_huge_fault)
 	hmm_buffer_free(buffer);
 }
 
+/*
+ * Migrate memory and fault back to sysmem after partially unmapping.
+ */
+TEST_F(hmm, migrate_partial_unmap_fault)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size = TWOMEG;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret, j, use_thp;
+	int offsets[] = { 0, 512 * ONEKB, ONEMEG };
+
+	for (use_thp = 0; use_thp < 2; ++use_thp) {
+		for (j = 0; j < ARRAY_SIZE(offsets); ++j) {
+			buffer = malloc(sizeof(*buffer));
+			ASSERT_NE(buffer, NULL);
+
+			buffer->fd = -1;
+			buffer->size = 2 * size;
+			buffer->mirror = malloc(size);
+			ASSERT_NE(buffer->mirror, NULL);
+			memset(buffer->mirror, 0xFF, size);
+
+			buffer->ptr = mmap(NULL, 2 * size,
+					   PROT_READ | PROT_WRITE,
+					   MAP_PRIVATE | MAP_ANONYMOUS,
+					   buffer->fd, 0);
+			ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+			npages = size >> self->page_shift;
+			map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+			if (use_thp)
+				ret = madvise(map, size, MADV_HUGEPAGE);
+			else
+				ret = madvise(map, size, MADV_NOHUGEPAGE);
+			ASSERT_EQ(ret, 0);
+			old_ptr = buffer->ptr;
+			buffer->ptr = map;
+
+			/* Initialize buffer in system memory. */
+			for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+				ptr[i] = i;
+
+			/* Migrate memory to device. */
+			ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+			ASSERT_EQ(ret, 0);
+			ASSERT_EQ(buffer->cpages, npages);
+
+			/* Check what the device read. */
+			for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+				ASSERT_EQ(ptr[i], i);
+
+			munmap(buffer->ptr + offsets[j], ONEMEG);
+
+			/* Fault pages back to system memory and check them. */
+			for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+				if (i * sizeof(int) < offsets[j] ||
+				    i * sizeof(int) >= offsets[j] + ONEMEG)
+					ASSERT_EQ(ptr[i], i);
+
+			buffer->ptr = old_ptr;
+			hmm_buffer_free(buffer);
+		}
+	}
+}
+
+TEST_F(hmm, migrate_remap_fault)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size = TWOMEG;
+	unsigned long i;
+	void *old_ptr, *new_ptr = NULL;
+	void *map;
+	int *ptr;
+	int ret, j, use_thp, dont_unmap, before;
+	int offsets[] = { 0, 512 * ONEKB, ONEMEG };
+
+	for (before = 0; before < 2; ++before) {
+		for (dont_unmap = 0; dont_unmap < 2; ++dont_unmap) {
+			for (use_thp = 0; use_thp < 2; ++use_thp) {
+				for (j = 0; j < ARRAY_SIZE(offsets); ++j) {
+					int flags = MREMAP_MAYMOVE | MREMAP_FIXED;
+
+					if (dont_unmap)
+						flags |= MREMAP_DONTUNMAP;
+
+					buffer = malloc(sizeof(*buffer));
+					ASSERT_NE(buffer, NULL);
+
+					buffer->fd = -1;
+					buffer->size = 8 * size;
+					buffer->mirror = malloc(size);
+					ASSERT_NE(buffer->mirror, NULL);
+					memset(buffer->mirror, 0xFF, size);
+
+					buffer->ptr = mmap(NULL, buffer->size,
+							   PROT_READ | PROT_WRITE,
+							   MAP_PRIVATE | MAP_ANONYMOUS,
+							   buffer->fd, 0);
+					ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+					npages = size >> self->page_shift;
+					map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+					if (use_thp)
+						ret = madvise(map, size, MADV_HUGEPAGE);
+					else
+						ret = madvise(map, size, MADV_NOHUGEPAGE);
+					ASSERT_EQ(ret, 0);
+					old_ptr = buffer->ptr;
+					munmap(map + size, size * 2);
+					buffer->ptr = map;
+
+					/* Initialize buffer in system memory. */
+					for (i = 0, ptr = buffer->ptr;
+					     i < size / sizeof(*ptr); ++i)
+						ptr[i] = i;
+
+					if (before) {
+						new_ptr = mremap((void *)map, size, size, flags,
+								 map + size + offsets[j]);
+						ASSERT_NE(new_ptr, MAP_FAILED);
+						buffer->ptr = new_ptr;
+					}
+
+					/* Migrate memory to device. */
+					ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+					ASSERT_EQ(ret, 0);
+					ASSERT_EQ(buffer->cpages, npages);
+
+					/* Check what the device read. */
+					for (i = 0, ptr = buffer->mirror;
+					     i < size / sizeof(*ptr); ++i)
+						ASSERT_EQ(ptr[i], i);
+
+					if (!before) {
+						new_ptr = mremap((void *)map, size, size, flags,
+								 map + size + offsets[j]);
+						ASSERT_NE(new_ptr, MAP_FAILED);
+						buffer->ptr = new_ptr;
+					}
+
+					/* Fault pages back to system memory and check them. */
+					for (i = 0, ptr = buffer->ptr;
+					     i < size / sizeof(*ptr); ++i)
+						ASSERT_EQ(ptr[i], i);
+
+					munmap(new_ptr, size);
+					buffer->ptr = old_ptr;
+					hmm_buffer_free(buffer);
+				}
+			}
+		}
+	}
+}
+
 /*
  * Migrate private anonymous huge page with allocation errors.
  */
-- 
2.50.1

