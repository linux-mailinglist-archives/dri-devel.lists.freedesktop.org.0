Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEBA3EB02B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 08:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC736E4D0;
	Fri, 13 Aug 2021 06:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A736F6E507;
 Fri, 13 Aug 2021 06:32:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eE5Ryv4CshcTDh/2mu2RwARicpDS9iVn2BDyLzcj/vOLE9hFLOxejH/iPlow6B51h85ax0zWRQCH9K/ZzJfuN27HNSM9QDdSt34UNl5SQiyJGIHVMkg6yWzsslQPlCDlMjgsRXeH6Zjt5/B0xNJgA4WCOFcIWug9+vlTsW76Ct1PaeQH9p92NyM52K/iVlOYH40eMKE19JOxdyBrDAqswcr8N0fPN2CVxf35at486BgHsFwzLhplM2d0mWQ5yDhqWf85MCn/pQmUtTjxNsUBnWLAnkZgr5orP52fAR/Cuq6qijZZYlzgl2DhWmx+/y2E8Gbj1CBJlEITDksZDCBkuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m750G1HruRY8e0UdQp9kGzjlljIQJX1uEk9lQNpHmcQ=;
 b=kCcC2qeQ1nDWdxXi6puRkBe3NpSTd942PvDSaKnz/KI4c+17nD6e+BCy5FBmBTxFhwxLs+E3ZJwdMZiSHqwUgNO69ivLqM+RWQnSTJRlaG6o8gwtbUIjjZLlwc79EYgMeB7k8RUVQFHytDfTqJU/yuS/NMo7xp724ELJCt/0vZssYHwf8LFCcFLx/Hr/hOnxiVVbU4V9eBlY3wD10q6oFKCTKbE+3nldgE82LQwhBqptu5cwOTo9yD39cSylqL5OlXDThe/xClNjCowz+eT6WeuYLJ1r3yUs1FtSyFMYjSqVqoOspIr3sr1VOFcdAmleh/5h5zLZEtex/I2nCzB5hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m750G1HruRY8e0UdQp9kGzjlljIQJX1uEk9lQNpHmcQ=;
 b=foVTs7QmpNnxpET8ycMpM/ZY+WH7jCYMzabqh54Rg6EnNhuJ+muDKy/ZcmK8OkEZdlvyxOIKGxJ+JWBFr6MfRIxRNhBeBKohDe4p2RxvKiaLzyB52nXfpTfK3usOwH+PX51h9tafTmj8RkOTSJUO2mi23tFFo+XTnOuf2YOSXO8=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 13 Aug
 2021 06:32:11 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:32:11 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v6 12/13] tools: update hmm-test to support device generic type
Date: Fri, 13 Aug 2021 01:31:49 -0500
Message-Id: <20210813063150.2938-13-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: ac1d92a4-c959-4f47-5e33-08d95e241507
X-MS-TrafficTypeDiagnostic: SN6PR12MB2782:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2782B02A21A95E428BD36458FDFA9@SN6PR12MB2782.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TO05hNAd8tssUOjdOgS6ZyFCOZe44ZmMao6sHWbNYbbqX+tTX207wQskE9x9JZ+LpsiNfenQpUK3B6DQSqkHsCWTe2An6aQZHgdfTO5qF2bj+MZun94H84gHM40HkZEc/y4E5tAPJD9s41Tv1D1tYFZio8nLbC3TLfet4+uyennJ8hrxmhRQXdWJu9VJWDAQ/evm33G6JtGrl3dHdhhAyDAUWCN6W3fMDWAzXrfRtoqeTf1D/8Nmai7BnVKVAJXa/i9lMB+euY1bIJgpIzbJC2RMHq77e+9rzaK+ZEB9QrB8xl4Cyglx8Pm7Tiqgs8+L59ilyEG1AiNZ9yt5+cc1ZmmAMNwqcUPyBlkPBATI5EgTG215UTE0NN0laQuuuUQLdIY/FnS5rPfKkNLQ+9YtM6ktZ0cxCxs7MhW3bj7UvbDJhINiA4M0RzAYP4VVXV5p5vaq1DzVDatBz6W7xzlUpwvMut4+fpnuzh9SmNigD4uogLjepbXgD+MejS7d2DZsL4e3VGDv8kPsZAYDhKnwHy0B/aMuGMskaPXsOrNr4kqLs5+b+nCD+g+aL/C0xrJ/Us+usOK8NVNj8m0Zd2tGdhiIBvufIMQVjym67KKzIn8EO1lD0R4sKM1z6E7Byzpbaphy1b0K/lmJuPG8uzkAcNlUG5Ka85cmZdq61VmJhWALHS9CLXf8fIyyMro7uwl7MNMh3SQa85MLKm1/vipS3VxWHDew4qwYhcTTdI3Dfdo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(316002)(2616005)(956004)(7416002)(38350700002)(7696005)(38100700002)(66946007)(66556008)(4326008)(52116002)(36756003)(6666004)(15650500001)(66476007)(1076003)(8936002)(5660300002)(83380400001)(44832011)(2906002)(478600001)(26005)(6486002)(186003)(8676002)(86362001)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GOuBv7XINGGgrKbJ8VA9PhrTAKPYYe2lFBGWy9LmrOn4EmWolM6+Y54aXry8?=
 =?us-ascii?Q?lQR+Gsy/+sSzF/xApLFHnb0fDzgIg0/ArKW7uXAlBHtSmnptqPByuHg48snd?=
 =?us-ascii?Q?IRL3REhAVM3ZboxHRntXPn/yyBLHWovuyjPWobCd+qar+R35tcCZKcxaNuyM?=
 =?us-ascii?Q?JGJFbl99pbu9UWajtABxKfDjbECk/LuLz1lMEcG8AxhORDMvayggEi+WeZFS?=
 =?us-ascii?Q?SZGqWn8gNIl9sTpGaP4C/m6Rm0FYyxrGPiH80oGbayR+igBXJrakAiYYsOE6?=
 =?us-ascii?Q?0cyqMTXe8DU0kYqATClUIrNyhhOYWgTGa5DdSimElPvdbdpG2oHExIWh3kio?=
 =?us-ascii?Q?SLzg6W/s8WY0eKTg8WqvL9bZAx59oBEiqa6m1POgEnePZUwJQ67rhx5T8Kog?=
 =?us-ascii?Q?xNdArcq8H1FmbmKGBDxFlWRCav2u0j2dWmg29XQevs/TR7ffQl3hlz5Kvz+s?=
 =?us-ascii?Q?dPqTrk7TWBFdOC89txSsG+npYJUwOVwKLtDvSNR3PI73Zkce1GlOMNuoWFEA?=
 =?us-ascii?Q?8A3jzPK5NlbamKhw0PGRrgvNpQkGUVrkWg07A70f3P/SfCeKUn5vBbHFk/DZ?=
 =?us-ascii?Q?+bOhXP5EpTemnKhfZ+/1BtRm4YVTCP4Sg1ji3jA1wccj8UeHP+7EHI5h8NLn?=
 =?us-ascii?Q?Yo7jKCROg3YEDvWipVu0tkM8c+0Wz+6AQxpcg6Z38vixAlTMY8pbMIPFKQzV?=
 =?us-ascii?Q?L49eKdnHfxV5Jp3Ti9XEPck1LUm2XA0nxdOXIfOYhd679qTTJsGWzZBfoaU8?=
 =?us-ascii?Q?LpgrIkXCzs4sCSJifVb/95BJT/VJFx7dcVwbw/MVAyqe10ckYheQn+6ZmmVn?=
 =?us-ascii?Q?rG33V+pAv5H+4aUDYX00O/cxNfo9Ks5s5Zh59+bSbbRTpY3hCWUyJblUnSLn?=
 =?us-ascii?Q?LWl5RnU3F5tkxaATek5g6LHeurGN4NdC06bDF/zN3aq5WUWBSzU3hryQqhu6?=
 =?us-ascii?Q?kvIcEoNIJLp1TNGghvX+OTmCpE7MvMgMin/+QiHmV5OMApp/GislkNl6Nm6p?=
 =?us-ascii?Q?nTkkZsUZv9orPwpHYnePM9TNXULSLCrvyyqeH3fcx2B3rw/eDIGrRbN7pOUW?=
 =?us-ascii?Q?C3p6bUhJFSVcwCzpA8HvvFRzd0rI0eTTzoRPqdbJZ+qYFyoOwgUIf2XTyL7m?=
 =?us-ascii?Q?txdEJ7dIuEX8dCYxtwtmylhScaFMPUaTjigblFHHmTb+GPl282f40+F/9pUM?=
 =?us-ascii?Q?D9puj8EaO4o+gB9dMFFjt9wXnnIQU9xnggqbEfjCGr2UhX/azGhxlfAdvSWp?=
 =?us-ascii?Q?azWpKlfWVUU4mMLwG1aElXg6Hnfdy/nesJeIjM9Cl20+eKIdy8115C31wgrL?=
 =?us-ascii?Q?r3ao4zbBFezl2j5zarYlQQKU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1d92a4-c959-4f47-5e33-08d95e241507
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:32:11.5822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NeLxZSkiyHywc92j0VTKmTBPj8ZPJesHRybBUCpLrrkOhG2dTeuj2hNaeHyMF6jxhWCJpSQZEHrDEAlzJn8KGg==
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

