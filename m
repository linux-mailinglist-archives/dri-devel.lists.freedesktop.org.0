Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E59B93CC5D1
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 21:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1826EABA;
	Sat, 17 Jul 2021 19:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1096EAA8;
 Sat, 17 Jul 2021 19:22:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXWt6EdcgJYBT1XdL7EX7GLCWuJJmP71ec88AvQvwUUlF2d1AzCnZ+Jg9zvVr5LdqvCyv6gM7wo0WgNqnvPKelIDyBAHRq3o1kbNgjNbS0NbG10WEtPGj79Tv8q7oCSSiDxWjKN2idEKqf7y/hXSICc9hL30iAjFW1yKJNHsKZST9A9ubcss8Vauu7z5Aln3VpqLo2qSLqbPsAuFfq6K7c1tRAl4gf2S5lYU150KrrdaebMW0KRySH74dCYf6cMl0s+wPftao9Fe8tQOsYgyUWkeQimPC6aNSQWU4+bkaxuXySx7X3m4M7BDu+oQTLUllVE5FdIB1MywJUK40QKBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m750G1HruRY8e0UdQp9kGzjlljIQJX1uEk9lQNpHmcQ=;
 b=EQjgPBqK65OD4uotoPlAFDEbOVHyM6db9WRd1lLnWEd9NeUYNSwZHvMZsFIVajjEp8r8OLjH44PopZb4jNqXLuW4Lv2mQDpuDn16Cw9TrDQXpn+2C+iY/5acWFY6MUSCB2BNAvchlPw8/A9bLw8dCVkJDtw8MxKVPgm0dhhw0TEfpOwCWeksSTnkzq6wJxyFB4Gi3oWLK/ZR04a2nkbTvZlxAd50B4gjwXSlFI6NbvEwSHA6lLdAMXmWinIYYxSTLsMU907AA9EnAWjh4R07A7MBrQbb7gd91ysTnYNmywmwStjCrLgd7icVMKaYDnnWe94tBy60GoVEImxndXPeXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m750G1HruRY8e0UdQp9kGzjlljIQJX1uEk9lQNpHmcQ=;
 b=PoQDIEQbtKdGwY3CT2d1V+05+5dd/GjWCfJHz85a6IdXf2K3kDm5G/AM8a3jwopl6r47ORJrF9YFwTZzcsfHPGSiQqOr2NBCKCv0qrj05CDP2J/ILSBTutQZEcDoqsYjfHrewdMOlQW9DUUhRfXcAWDo2FpYv17rAmG/JoAj5IY=
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
Subject: [PATCH v4 12/13] tools: update hmm-test to support device generic type
Date: Sat, 17 Jul 2021 14:21:34 -0500
Message-Id: <20210717192135.9030-13-alex.sierra@amd.com>
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
 Transport; Sat, 17 Jul 2021 19:21:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce49e815-9d09-44e1-6bc1-08d9495822c2
X-MS-TrafficTypeDiagnostic: SN6PR12MB4670:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB46709C622E43EFC2968D2675FD109@SN6PR12MB4670.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V1okHR6ZLDL3I37WyTkgSJrrLvD+e4AXDnfzmRhnnDapiHcUHYJiamSeT+hriubWGXFKO5bjiYXBsYv01XiAKma0celLN/nLBQpOr5nrDU+AGiWsvf+KufEiKKlgJfUfkjcHdFf8CwwWqiUO1B3o5QWwkMi+CaWcWhfMMwUpw9CnZkZO3zwSJRrFOBkK/mIur3Emf7bJIxL8BL8JLBOQcNkmSJq2JU0K78XN6PVxG2OQjSOKqBmOrlmBvXM+DSnDlM1AnF3Fvn27UmcmR8Dcc9w0MHDvcmxs+LAjPN+3ETv6BCGRMZMos/g47x+/nI2oWX28hzUu2yIB1CnjRr6Dcll9hsG/nczL0O0MEypgtaaAe+uNknMPiTxbVZ22fasbHTjrwQr1Z0S+hPQP7Q+VuyTf+KTVH3D8C8m0adBEijaWCv+j6xwE8EXxqlhUOTeToTewyE2BlmQLvRgKIPAWI2piukeg90rdq/FJ/uDmSvvYDzOuOCDMFwdaM5ur7WoZjexjua0EBjsDveOUHY24fTNuCSdpDfDqOjOANDCtIpMjxAp96FRagmr8E1F1eFSDdfQPJOZxCrBdTD1dBlpdT5Fa+tijRzUR3nNU+LTC4jk1Daum9kHitb15HBmTlZVpmO+zkDEKBQB6M6K9p9ewg6B8svx9bJ9ewwVFWIPhCSxAVv6GmNOmeLn08jIDDzrQkzJUH+0wH+zkRtZHjlDu84i9UTEUBoQhVNDLnPrjGno=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(2616005)(26005)(5660300002)(2906002)(7696005)(7416002)(1076003)(4326008)(6486002)(6666004)(186003)(8676002)(956004)(66946007)(86362001)(316002)(36756003)(44832011)(15650500001)(8936002)(38350700002)(38100700002)(66476007)(83380400001)(508600001)(66556008)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mRUkAOh4vSeYN803IlYbkzvdG6VZHEJ8Ub3q6KqCEPj50qrBMZW/nzuRY0SF?=
 =?us-ascii?Q?gnE7xwtxMPEMmhqojr2T+51j8agLLObg6ugAk3mHoROxiQahKMlr0gvB1xyZ?=
 =?us-ascii?Q?j8FjCFw5CJpMJGweTES0rlzxlmwu/ERUGSXUzdL3VtZbh2qJzY/K8pGcDXHs?=
 =?us-ascii?Q?EafPfwvXWLLH0DKp6wpNP3BUUee7pRE5Yfh1YNy5/tScv41hIB+qyld6TYeB?=
 =?us-ascii?Q?7vUg9L929sIbR+c/ymol1+RPSWoCyHbkzbh3I5MidvTeAMKvZzRJ5EHPF6W8?=
 =?us-ascii?Q?marrtZkaw888PNgEdkIc5IeEUfaukpSqLVXZTadplzMcrQJE1pePkApKadmU?=
 =?us-ascii?Q?uq+xnhPU8VVOHhCElAQ58KOM51krghP9g8O/3+r5Us+/f4Mfc0YQDwtXizzr?=
 =?us-ascii?Q?q62JDELaMtqRrs7BYyhrRL+antSUk/orCYEwf7bC4vaaEU3HgcFMkdSifZxz?=
 =?us-ascii?Q?5ccjhycy4kJBnu461K1ysWtzaYooGpsNqUUEhrVUE6VK60JTSFnlYHCq8rpO?=
 =?us-ascii?Q?Nu1F7iIR7tUQTeNyChAGj1GnpgZ9KFhqjRJR/Z7k/7N3R81VFc+pbVAXK7oA?=
 =?us-ascii?Q?qcfgXpyEmCvkdjzS3s6fqst+PH3a7qmxrMkTzw88N4BqPo066xyL64AN62sb?=
 =?us-ascii?Q?uOkMTaQh1Pp0Y74CJ/Mhm7uhRbZeWpNBdlO5WfY7QGwOiXDIaQ8XwCZvPcL/?=
 =?us-ascii?Q?ZMAQrpfu5cxpCNbXwWQSq32IRt2D+UZIjKEwPJTt8zmR3r5cs22qvtYo/IwA?=
 =?us-ascii?Q?wMXKpwhEg0CPAUMvmlpVVQUYU3KY64yBy1VlpjEKbWxmL1u2Vn+7+NX51VCI?=
 =?us-ascii?Q?cIO0lp5iQnkPjrY6sqbgXH8DINOr8CbTn2ttycsN2AmFrCujtl0VO2nQUj9z?=
 =?us-ascii?Q?CQLKk7650jr7/lN9nc0K1Evl6xC46/PZ2De0Vg9w1k48ZX8tbn4JMtKqB9m2?=
 =?us-ascii?Q?S5u+gj/G7lejnfsvkTNgEGUK+cyHA7TEK7/Yp6dFQHifHkGrDxSChVLqRFw7?=
 =?us-ascii?Q?U3IJzsLRaCA1KBCSrc2UsACRn+ce8B22xiWmu3nTeKUybGQVC3TvTuVdfefi?=
 =?us-ascii?Q?Bpj4kOWiqSAbBZOF/p+HNHhwl3P999RD3cfYp6woasqfH4KafqA1MUOhO7Ps?=
 =?us-ascii?Q?jgfh6qJAowF1weQvCuekoWYclpNpsxuwE24RarJNOYkd790jjHMHzh8LwF+t?=
 =?us-ascii?Q?uAFg/SvJ/Ws3NqZVZ2d7T76RhhZf2S2oJ+IhmDlqp2NhpRlLE52UzZzWJjOC?=
 =?us-ascii?Q?2BKJr5TO/uMsy8/+kG5OgWCuDtxGoyWlMldaoyfxR+r1wjsHlMNLA89dJXeg?=
 =?us-ascii?Q?6j4qPwYrJxJYoATRYM1jUVnn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce49e815-9d09-44e1-6bc1-08d9495822c2
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 19:21:54.0863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMe3/hEcB+c0LY3hMLTv507Kf2chtWt+PjHBwFfaV9s06oHqedIIwBHlMuNG+9GoW1ILCN6ff5gIVNSXUnKX7w==
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

Test cases such as migrate_fault and migrate_multiple,
were modified to explicit migrate from device to sys memory
without the need of page faults, when using device generic
type.

Snapshot test case updated to read memory device type
first and based on that, get the proper returned results
migrate_ping_pong test case added to test explicit migration
from device to sys memory for both private and generic
zone types.

Helpers to migrate from device to sys memory and vicerversa
were also added.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 tools/testing/selftests/vm/hmm-tests.c | 142 +++++++++++++++++++++----
 1 file changed, 124 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 5d1ac691b9f4..70632b195497 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -44,6 +44,8 @@ struct hmm_buffer {
 	int		fd;
 	uint64_t	cpages;
 	uint64_t	faults;
+	int		zone_device_type;
+	bool		alloc_to_devmem;
 };
 
 #define TWOMEG		(1 << 21)
@@ -133,6 +135,7 @@ static int hmm_dmirror_cmd(int fd,
 	cmd.addr = (__u64)buffer->ptr;
 	cmd.ptr = (__u64)buffer->mirror;
 	cmd.npages = npages;
+	cmd.alloc_to_devmem = buffer->alloc_to_devmem;
 
 	for (;;) {
 		ret = ioctl(fd, request, &cmd);
@@ -144,6 +147,7 @@ static int hmm_dmirror_cmd(int fd,
 	}
 	buffer->cpages = cmd.cpages;
 	buffer->faults = cmd.faults;
+	buffer->zone_device_type = cmd.zone_device_type;
 
 	return 0;
 }
@@ -211,6 +215,34 @@ static void hmm_nanosleep(unsigned int n)
 	nanosleep(&t, NULL);
 }
 
+static int hmm_migrate_sys_to_dev(int fd,
+				   struct hmm_buffer *buffer,
+				   unsigned long npages)
+{
+	buffer->alloc_to_devmem = true;
+	return hmm_dmirror_cmd(fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+}
+
+static int hmm_migrate_dev_to_sys(int fd,
+				   struct hmm_buffer *buffer,
+				   unsigned long npages)
+{
+	buffer->alloc_to_devmem = false;
+	return hmm_dmirror_cmd(fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+}
+
+static int hmm_is_private_device(int fd, bool *res)
+{
+	struct hmm_buffer buffer;
+	int ret;
+
+	buffer.ptr = 0;
+	ret = hmm_dmirror_cmd(fd, HMM_DMIRROR_GET_MEM_DEV_TYPE, &buffer, 1);
+	*res = (buffer.zone_device_type == HMM_DMIRROR_MEMORY_DEVICE_PRIVATE);
+
+	return ret;
+}
+
 /*
  * Simple NULL test of device open/close.
  */
@@ -875,7 +907,7 @@ TEST_F(hmm, migrate)
 		ptr[i] = i;
 
 	/* Migrate memory to device. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, npages);
 
@@ -923,7 +955,7 @@ TEST_F(hmm, migrate_fault)
 		ptr[i] = i;
 
 	/* Migrate memory to device. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, npages);
 
@@ -936,7 +968,7 @@ TEST_F(hmm, migrate_fault)
 		ASSERT_EQ(ptr[i], i);
 
 	/* Migrate memory to the device again. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, npages);
 
@@ -976,7 +1008,7 @@ TEST_F(hmm, migrate_shared)
 	ASSERT_NE(buffer->ptr, MAP_FAILED);
 
 	/* Migrate memory to device. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, -ENOENT);
 
 	hmm_buffer_free(buffer);
@@ -1015,7 +1047,7 @@ TEST_F(hmm2, migrate_mixed)
 	p = buffer->ptr;
 
 	/* Migrating a protected area should be an error. */
-	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, npages);
 	ASSERT_EQ(ret, -EINVAL);
 
 	/* Punch a hole after the first page address. */
@@ -1023,7 +1055,7 @@ TEST_F(hmm2, migrate_mixed)
 	ASSERT_EQ(ret, 0);
 
 	/* We expect an error if the vma doesn't cover the range. */
-	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 3);
+	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 3);
 	ASSERT_EQ(ret, -EINVAL);
 
 	/* Page 2 will be a read-only zero page. */
@@ -1055,13 +1087,13 @@ TEST_F(hmm2, migrate_mixed)
 
 	/* Now try to migrate pages 2-5 to device 1. */
 	buffer->ptr = p + 2 * self->page_size;
-	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 4);
+	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 4);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, 4);
 
 	/* Page 5 won't be migrated to device 0 because it's on device 1. */
 	buffer->ptr = p + 5 * self->page_size;
-	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_MIGRATE, buffer, 1);
+	ret = hmm_migrate_sys_to_dev(self->fd0, buffer, 1);
 	ASSERT_EQ(ret, -ENOENT);
 	buffer->ptr = p;
 
@@ -1070,8 +1102,12 @@ TEST_F(hmm2, migrate_mixed)
 }
 
 /*
- * Migrate anonymous memory to device private memory and fault it back to system
- * memory multiple times.
+ * Migrate anonymous memory to device memory and back to system memory
+ * multiple times. In case of private zone configuration, this is done
+ * through fault pages accessed by CPU. In case of generic zone configuration,
+ * the pages from the device should be explicitly migrated back to system memory.
+ * The reason is Generic device zone has coherent access to CPU, therefore
+ * it will not generate any page fault.
  */
 TEST_F(hmm, migrate_multiple)
 {
@@ -1082,7 +1118,9 @@ TEST_F(hmm, migrate_multiple)
 	unsigned long c;
 	int *ptr;
 	int ret;
+	bool is_private;
 
+	ASSERT_EQ(hmm_is_private_device(self->fd, &is_private), 0);
 	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
 	ASSERT_NE(npages, 0);
 	size = npages << self->page_shift;
@@ -1107,8 +1145,7 @@ TEST_F(hmm, migrate_multiple)
 			ptr[i] = i;
 
 		/* Migrate memory to device. */
-		ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer,
-				      npages);
+		ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 		ASSERT_EQ(ret, 0);
 		ASSERT_EQ(buffer->cpages, npages);
 
@@ -1116,7 +1153,12 @@ TEST_F(hmm, migrate_multiple)
 		for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
 			ASSERT_EQ(ptr[i], i);
 
-		/* Fault pages back to system memory and check them. */
+		/* Migrate back to system memory and check them. */
+		if (!is_private) {
+			ret = hmm_migrate_dev_to_sys(self->fd, buffer, npages);
+			ASSERT_EQ(ret, 0);
+		}
+
 		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
 			ASSERT_EQ(ptr[i], i);
 
@@ -1261,10 +1303,12 @@ TEST_F(hmm2, snapshot)
 	unsigned char *m;
 	int ret;
 	int val;
+	bool is_private;
 
 	npages = 7;
 	size = npages << self->page_shift;
 
+	ASSERT_EQ(hmm_is_private_device(self->fd0, &is_private), 0);
 	buffer = malloc(sizeof(*buffer));
 	ASSERT_NE(buffer, NULL);
 
@@ -1312,13 +1356,13 @@ TEST_F(hmm2, snapshot)
 
 	/* Page 5 will be migrated to device 0. */
 	buffer->ptr = p + 5 * self->page_size;
-	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_MIGRATE, buffer, 1);
+	ret = hmm_migrate_sys_to_dev(self->fd0, buffer, 1);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, 1);
 
 	/* Page 6 will be migrated to device 1. */
 	buffer->ptr = p + 6 * self->page_size;
-	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 1);
+	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 1);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, 1);
 
@@ -1335,9 +1379,16 @@ TEST_F(hmm2, snapshot)
 	ASSERT_EQ(m[2], HMM_DMIRROR_PROT_ZERO | HMM_DMIRROR_PROT_READ);
 	ASSERT_EQ(m[3], HMM_DMIRROR_PROT_READ);
 	ASSERT_EQ(m[4], HMM_DMIRROR_PROT_WRITE);
-	ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL |
-			HMM_DMIRROR_PROT_WRITE);
-	ASSERT_EQ(m[6], HMM_DMIRROR_PROT_NONE);
+	if (is_private) {
+		ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL |
+				HMM_DMIRROR_PROT_WRITE);
+		ASSERT_EQ(m[6], HMM_DMIRROR_PROT_NONE);
+	} else {
+		ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_GENERIC |
+				HMM_DMIRROR_PROT_WRITE);
+		ASSERT_EQ(m[6], HMM_DMIRROR_PROT_DEV_GENERIC |
+				HMM_DMIRROR_PROT_WRITE);
+	}
 
 	hmm_buffer_free(buffer);
 }
@@ -1485,4 +1536,59 @@ TEST_F(hmm2, double_map)
 	hmm_buffer_free(buffer);
 }
 
+/*
+ * Migrate anonymous memory to device memory and migrate back to system memory
+ * explicitly, without generating a page fault.
+ */
+TEST_F(hmm, migrate_ping_pong)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	buffer->alloc_to_devmem = true;
+	ASSERT_NE(buffer->mirror, NULL);
+
+	buffer->ptr = mmap(NULL, size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Migrate memory back to system mem. */
+	ret = hmm_migrate_dev_to_sys(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+
+	/* Check the buffer migrated back to system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	hmm_buffer_free(buffer);
+}
+
 TEST_HARNESS_MAIN
-- 
2.32.0

