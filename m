Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351A1B481A2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 02:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8947110E328;
	Mon,  8 Sep 2025 00:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GtGpOD8/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A4D10E327
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 00:05:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjVNyYQM/Uk6wJ//GF441ryvgTHSc0Rcza/wyiboempo6UmcV7UdapYyz9oAvhTyqB0G203/tEZoDdDpt2qi6aTgs56kOyIUm/TCE6ZLV4ajaYSLSSHzFmyrKIDx0xn6PvKurK7dxiNLgKZpklfwzZ9/rDGyNGxFd4tNYCnmY55Epfzyfen8YNouB2BU26FDn+51UxFFHt1lWV2eOqZ5JSxX4XlvETu0A3fJbmKx/YD86So1Cm8w1u0srA+YmCNvl1iQi/omffu8hffxTwOXDnf9uXnCx9ajVDqbyyL93ab0sNZ2b/fEfRgdGwpOCpK06TZmSBkdsymfw772Tlt+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j35J763qDBOFuG2qAOxwkfOYisxX3tMyX/1oOtKjkSA=;
 b=rGbwHzf5davjSdnJOcOFiC6J9DRLhAVw/clAja2mXa5hzXUwTiocUjkSX7g5k1zd+DMR1XY+tv4Q5QNvkWXpxPReUywNUnrdWcbbYmOzJy1RtgB3nXt8i9rXcu12H3RLIBQOJxSAvHuXocHiJ+8c9bkm2CM/WvisIdkB/jnvpNvjHDobht1Il+hn5GGpmFl6DZVaUmcS+2b5GpMjSdBC1CvypPj7O+DlSmCDyYyljEPZ3n7rKaVKDtKZUIrrFU/pl7k2jI9VBzftwseuwZCkb2YkIjHH29OrU//Km+hyr7xhPetKBlkerTkINHvWVF+fGXYvZFncikKf7ipTCbXpeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j35J763qDBOFuG2qAOxwkfOYisxX3tMyX/1oOtKjkSA=;
 b=GtGpOD8/FNyYLFwSN3IqtFn0xIbbHpnfiBMX/ZwCIJdnbP4W1xS9AJ5+rmadyUTB1z1fRuboIQ1bQ1+8NxPjBQM+KAQEy3tKwMSRpgrivi5+SiYG6DTji/16bno9GcRb6LUgjqbGqmFJXShA3/MkbqYUwUhV80n5fwqDRlVRijAX6KKB2fsqk0dFWG0yBKKq+0HTeFqcfZ7wevzC/NleBQDImneYaM5JKbY8l8nCXRpkpaJk0CTOW97K4qwxQ34NW5IqwYKEQZhzmeHBCI8k5niJKUGrhJ7RpTs+dgQD6kn4bOn4BvEFxx14+85ctDeYbmIo7JyNkOK6JjD04Hv0Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB5887.namprd12.prod.outlook.com (2603:10b6:8:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.19; Mon, 8 Sep 2025 00:05:47 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 00:05:46 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, Balbir Singh <balbirs@nvidia.com>
Subject: [v5 13/15] selftests/mm/hmm-tests: partial unmap,
 mremap and anon_write tests
Date: Mon,  8 Sep 2025 10:04:46 +1000
Message-ID: <20250908000448.180088-14-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908000448.180088-1-balbirs@nvidia.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0177.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:249::17) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: d84caa42-42ac-4a43-039c-08ddee6b7614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4Jx1mBdSJy1V/jq1hK3PAjt9jxTOwbb1ti85D5EQlGYB0tUokLo+bOYG7SmX?=
 =?us-ascii?Q?Jn/IZlWJ3CbCpso5WJ8DCSlec5COTtk3YrMCskh1XooMvJK4oZI9NY635dIb?=
 =?us-ascii?Q?k1sBfEVZP/GunwK9n90rMAHboOD3vTmakBGkGB2MXYfC5j9+zAUbA713ZuWF?=
 =?us-ascii?Q?FRjanJg9F3jG/9lSoH4T0cO/nf0ISp3vY9zY20byfmhLOOqgU2/U5CpIL7y6?=
 =?us-ascii?Q?jdUgyI/+u3ML2hUIcNQZPfbhZsJ7V6hsYOZw+zINzKmxNyauraXsrqmwLraV?=
 =?us-ascii?Q?1WnEapQ7wwUcV50jpVwh+kARTGmCPlMu1HF0KuBpNwYykyvxI7gW1WehZx7W?=
 =?us-ascii?Q?Cfn59xT8wsrWYGvHkK3RLgh1dQ22ziQt9Hq7hJJD1SwVVxTsnfIh7VeqXMOD?=
 =?us-ascii?Q?JwtcvgpFrJ4ObKMIugVyVEq6E8R9x1EKtacFL+hSAG9TglILK76vBn9QvNQ3?=
 =?us-ascii?Q?y0XcTfxR+HKlp813NNieXUo5bt4KD7fSCh57lTa0CcWuHiE7ZV1zUJj4/YRz?=
 =?us-ascii?Q?qBbIL8TRXy/xueRQO2pNONNyqZIEYfmrRu/C69iSOfT8HNdWNYaJjct30Ezj?=
 =?us-ascii?Q?wGKH71HrlX0rOsN2hQo6CfnSR0dwj+ZQz9e4YbQgPeIsoF9UcFsmjBYYVqmk?=
 =?us-ascii?Q?+a7Z/f+0vWoUdbYodeGbf5CNes2B50GLKjXzltN3ao3gxsA64aDrGJ84stk4?=
 =?us-ascii?Q?H2YhzbaAoxU12aCyepUsP1ve3c+JtirCbwj30Vg+s3o5kTwwhrHYRXe6lwFH?=
 =?us-ascii?Q?nRF/PMQaBi3KM4pbB0/O+Gp3gW4IpGFKyvJe8yeO3N6w4FRyQj+rkY/E4KYu?=
 =?us-ascii?Q?Y/9sRkYtVKiUtN30yYYBmVhuVCc63QMrLSJJTWOzwvjB94YZDXKAFdaKulKL?=
 =?us-ascii?Q?yDcenCk6d81X1lNXxmxrTyYG+25fToomsjtWKDENxHFgxjzwf+E00TbU+Fal?=
 =?us-ascii?Q?uY5KOsAitUtyoTjdnMghZfZNUeogZtvPr7VymVjIr/RPjhkkIGMDmZ0b4RYZ?=
 =?us-ascii?Q?zwCKR0AXQ/d4ooR69oN7RKZRuWHexid0XYf8l0pmxvj0Uu+2csQuU1kCQFnT?=
 =?us-ascii?Q?kPP5KA1shwqusqEcsab6Ll9iW5//1XdnJHFa55veP+OP2KL/fhy4oV1EYv6o?=
 =?us-ascii?Q?oaHozC8PYCjc7Nw0D2dTxBpnFGzEWvQZV2ldn5fMSg66XFl5IfO6h+rO0KZB?=
 =?us-ascii?Q?paGsn8AYYNGI1UI5bhp212esZ7m+WcO6VC+08Yc8EDx4kLw7BIZupF/YtAMf?=
 =?us-ascii?Q?AWnLoDyl3IBcMvc6qM74hkRQf6X4M0IX1+0sdzQIt/sLWiECPuZDq5o0E05U?=
 =?us-ascii?Q?lxT14TZ9UAXGpPn+bgUifHORu/CzPuMU7Gozns2ct721AHQULqE1C6/aJlEF?=
 =?us-ascii?Q?maoL6tOXGdl92APVnlP83k86IPVopVrkoYYE6oAW/3cWCZfuOw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?grqCpgUc4si2ddntl2YtlThDDx/W7BZsR7vs8ElJF/HWwTy9PXGIdPwUP5UL?=
 =?us-ascii?Q?zhM6ZEXylNYoOXRM5m857WQYoExNvNBx8FoE+sJZZbQAcxaDKCbDueWZRYsl?=
 =?us-ascii?Q?P670/6OFi27a7YBdlWGrKnQ7ol28uDIdtnIA+Nk5dv/xSKZIAmqTOiobktZi?=
 =?us-ascii?Q?MuWFvyA/3Jb6vAI5ugW+xiKBc87HGXbT92O/pzDM9ZxsMBdZoFWR1yWUpQl7?=
 =?us-ascii?Q?eyZ6z4174KtI3Ut5mJMrm+fSQs3BPJAoIVxHO5cpL251QiOD2pQ/0GrzVCk7?=
 =?us-ascii?Q?BGpbTpzCmLDW0sWDQOB4Qqg02b59BAy02+03F/jHcdpST6546B/ghzReufZt?=
 =?us-ascii?Q?PfG5Dar72BEebxuFPsU6Uyjj4LjYIzVqQCxSdSNzTG1mm1/oS/rifsbGNaQ5?=
 =?us-ascii?Q?IGGPWYoP7YVZgSbPlJGi/kdxE82ZXyeeK018/ATqp7Bw2DREanrK59aHvQ4Z?=
 =?us-ascii?Q?4DOqkwS89Xx8/Uv+zlutZTJxrBMmcnhKzBbWL4M9LzyQzd/1lPS5FsMEaMbK?=
 =?us-ascii?Q?7DwYZ+3XWDggseoeXgaTfv9FTBfCPagcPidZ/7MRs0bJF8xVJQbYibcGdO6F?=
 =?us-ascii?Q?CVj2G9mynzbvvvT4TUhdW5nymC4qyDFX+xzW5aHW4sGjZa1mgLUWQ2YgM/F7?=
 =?us-ascii?Q?xZLVIzcn4vYgTBqEJI3k+F2oN+/YgGQgpQl/y5Guosq5rGkmvQ/+RuLsOPa6?=
 =?us-ascii?Q?MA4ewwuelCCtnyTYablU/LJk8YG1L7fEUsYhM3mmS4VrrwQBQuK9TV077Jkt?=
 =?us-ascii?Q?+0DarQE91Futv31JZNTKimCBZSo5adix/hh6Kbhuu98yUXMTlqoHjBjnF3rD?=
 =?us-ascii?Q?OEgiLZrHMMCEtR4LkayfV1aHS2ZYCBJAC7QLXqE3qovK4ry1OC25kK8td7E6?=
 =?us-ascii?Q?RNZ7ehhusrIshRMXxUEGEEkrudTivc3GmbaCNGEIR/vWrt7z0wks4hP6K4Dh?=
 =?us-ascii?Q?SwoThamgB5SAuuxlqZlBHRBjf6lfkfqY74qYS3OrN7o8oFGt+tFRiVzftsQL?=
 =?us-ascii?Q?MO7s2w65Nfz9+eqDHUkjSnIQouJ4niWIqPUUaMKHR7BB0xLi5Nv1Q5JS36BR?=
 =?us-ascii?Q?UF3KcH8s9LtmWgH05/rAyOlve1UaH1Z6F0VeoAqnRYLkeA+vF8DiFYetwQiA?=
 =?us-ascii?Q?ZQ+yyF1hj5WqaTcn7LhL2pZmRbd2YC5eOIyIdnvy9kudoEfCFr+RHgG+2CEm?=
 =?us-ascii?Q?V4ohwtaP72CwLoR35lo3XlyD9ayXRBILSKJQE5jT18CqS0faXM9XhyDuL0XO?=
 =?us-ascii?Q?IarUkHqBnBmW+mvRS99E8KhFVvu/SO5NmDr8t3Tq6XlrHzz6tKtN3PjCPdA4?=
 =?us-ascii?Q?gOU/vjE34Aw3DgQ5ti9L5VbWQdakZOLTw/nH4fJWz4NmQ36h4EwEKIcSXegp?=
 =?us-ascii?Q?ShSQGVNysn4DtM/N71J4GYts0OSuvoF/n+l0r3c/YS5Itd0MyYOfZHZdmLm0?=
 =?us-ascii?Q?Z2ePIeCGOvJQ7vpZQ7qikZqkDqcxh1gTSqpUP5OLD46WT/ZGwOBI4YfIaXXG?=
 =?us-ascii?Q?NFN23ive1Bik5J5rcl07A3515rLyd5oiFNauAh5O5pfynAXH1kqMFWkH7xS5?=
 =?us-ascii?Q?0U8qZT/wlmXjCETLBvhWmJ2fhFoHcZNJBR2MqVQt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84caa42-42ac-4a43-039c-08ddee6b7614
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 00:05:46.9162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMV/pndHQaIFSguzTS0+545poJj957KFF9nd2rPeGJu2FCr/sFC/mXAG5CuKDi+R6+Z8vbeOQcWj1zkZjopkUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5887
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

