Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADC13F6E03
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 06:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CA56E123;
	Wed, 25 Aug 2021 04:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6216E113;
 Wed, 25 Aug 2021 04:03:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khHfLu6/EIiH1w8ooYJj0/dSmKP5OGYCna7A1g/FQ7ITGQxR3HmhUH+/R1WhWiQQNfRMaEoTCJ6NE+u71bfuPS3ajZ0g+Zvu3Sc091FwF87XLi3tdgi2UlxeA8UGlpWMi71S7T+HGJUbAhlheIcPW48ixpaHizeSWchQxhXQAilh88Ck33GRBOXkaXUMc8sRawBKobmmjOGyvnp9zIBgXnipxsm7GU6uMH5iMh5oePFFQQhOjuAgYs3blGYtjU24LAAT5m5Xz+Gr4GngpqBNYsReDpQFSo5MoIiTVIQSDV2VTwUL/vbpPiWrCB/BlXGFL/XCkhePpvWhialLPQ1znw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfsDeDPTrxHJIIQdDj4G6ondzbiB2t/+YrLe1QVCDLk=;
 b=aAHryiB8XnsBEbbIsD+DNLj0knM/S2bbv5gqQijU3lST/QokX5EEyEYUEArhDvsSVzPfJx4tD5XhmXm+IaR01tH/5danYxMwXtgoaOmi82YLmVGMdbQeEASgVlThxY7X3rCzZyXeKwQA4NxOOhx+S6P5VSsiFrIoSy9Mf3c/i6xAFKdtFuB/Aj6ASzQtgKTO4HvqSySAv5Ubi7Pfh6Xi9RPOZCnOmZBSadrDV8bifGgYmm3MDhQuVuPZPD9SwPeit9c5u9R3m02mVNLWRxb5WdVRvwW0ikwviFofL+uT+6N/lu9FOiumyG4kU0Hrmy5k8RzRzwUSXteDZgAl8eU53g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfsDeDPTrxHJIIQdDj4G6ondzbiB2t/+YrLe1QVCDLk=;
 b=M2AIzsv82s5xz+X+fJYKIP+5MYqEzZ2twYJTvnuOsDvdWJagjsOgE9ZSvOpI7aja0nlXpi+kqg2PeJqAwlWA4dU6olGwYFPa9PXF/+sv7g5A9m6Gu4sLRvj0Gjqy00/cdTMDf1cteJKTSAOUB8kLbnAn5ttotDacfMdDO61PchE=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4750.namprd12.prod.outlook.com (2603:10b6:805:e3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 03:48:52 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 03:48:52 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v1 13/14] tools: update hmm-test to support device public type
Date: Tue, 24 Aug 2021 22:48:27 -0500
Message-Id: <20210825034828.12927-14-alex.sierra@amd.com>
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
 Transport; Wed, 25 Aug 2021 03:48:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fe1585d-51b6-49a0-a838-08d9677b40fa
X-MS-TrafficTypeDiagnostic: SN6PR12MB4750:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4750476577967C45B0C59F09FDC69@SN6PR12MB4750.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vUpmdye6eFD900Y7lbHnDGE+G7C8P7f5demNMvF2RHoQchsQk+oO/G8vi33YTt2capBzmq774upBpqQ29N4mgSz+yOOy5Nm5mzTwO/yT52Osdqhq3IIFVIzw1GfKxgBaqGW8BY2XKqI9OeTU+JsIku4HThciR7xHGW0ywP7bMypYnIDvJ4r6HMmQva4dI9RGuIBgAGq8J3lEA3O4iLuEdAAb8Pj5DKnHY01xJV2ilFI6uuocAHtXPjO/F10nSLHqC91Y8FOidEgWps+YbiyZUlhp7MJnuuatw/RceU4mw0emoz5R3hX29Y3wqd4tIjl4oHcG7N1t4tyksiwMqjOCD+YjObI6H45uULT6RDPPtEm0kmNvL0Um//PBDfNT3z4Vg8XEUPVBSIytYq9l6WfqGJZoGZf6xDD3ySsZ53dlH+Etp7AExYay0MB3Z+udnCulaqd5VGfJ/O+V2sGLcsClqst5BUAaBiom++60f6AlZ+rVN4oE1A6Vm7Yolr7JZjb+eLE9lLmY+oJnXv2PNght77TNDuoJSc5rxkKrGfeglXvbvW3sDi1hxWByUrevBREd61Z0M+fEU0BMQrBnG+Id1NfQBNtaunObzgq1ryaqiyTbjC+CvTRL9xSxqSRmS/K8KrwSFXgn8Y2hSrQmrGrnJ8ccnYwvm04Ej0E5C7fx1j0mVGESrsoAfTVvVD1IAEDA31ETLfNFE1C++7D4XDU9CA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(7416002)(6486002)(1076003)(4326008)(86362001)(7696005)(15650500001)(44832011)(52116002)(186003)(2616005)(956004)(38350700002)(38100700002)(478600001)(66476007)(66556008)(6666004)(316002)(26005)(36756003)(8936002)(5660300002)(8676002)(66946007)(83380400001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EPZ1aq6upuK46eKlCFEsMGcyuqZRPxzJD7NqSxGQ1LdUQhSL8LH6AGDhp6cF?=
 =?us-ascii?Q?WzxKg5HmmDQDUjpvBKxKK68BFBONCarlmB59PSP3gTVpDnPQbGpNm1dCY6Se?=
 =?us-ascii?Q?hQ6IQL3CW9sqzTy+cZD3DfFreaYbR0CnUlrR7/USn71ewTQ0NLYSvQKjTx7/?=
 =?us-ascii?Q?fAld9KSWvtDIO6n4u5QKzZnVTPQ698wU1uun9H9DgLgEAE1DKwzjXqdbHqnV?=
 =?us-ascii?Q?KTB7hfoU3s/RvvAUqL9cx9RZ5u04Aak7fOnyI7f6PK9q2I8JVKD9LCijjBc2?=
 =?us-ascii?Q?iPV/upElgqX6dplhL4r3A+IDemTWxNPZ/+l4BHvpbNSMCfa7ZcxX1wNTAGG4?=
 =?us-ascii?Q?lP7h+A3/10JEMTMfVDw29XPmUH3yUFA59j56FQLDZIrSOEZV2ttzCrzdy+CL?=
 =?us-ascii?Q?CzVCSJUmIjMI1pK6vK+QlYq5RmJwp0qEpTN6ansspGZVl4RBeMWwTs9yH5Nn?=
 =?us-ascii?Q?gB2E9xT7lIs80AU+j2NhyazBYyLv5zJCacI30HHyEgdLaxqpW5XxCAm2MP4U?=
 =?us-ascii?Q?Ge/NAjmBiwfBlN/NstU4Do80w1MUbu3req58FklagKT4imul7DhzmLPw4AJZ?=
 =?us-ascii?Q?vd781neIYSOzrEgeqF9oqJ9GDyEqBrwqjpWwnXQ+icA5+mygCiMRQ1dydwiE?=
 =?us-ascii?Q?l4SwpoquX3zVghYKG3KW+LnyroUhs3QPJ8XayZ7csDAkXuqK1G004g8DzJWY?=
 =?us-ascii?Q?DC+KGDULIjNv4hNwRMsoaB2gQB08f0/b8xvcsevt7VI2ol/grJJeov1TEYgu?=
 =?us-ascii?Q?W3QzU29hEZ/g3c6ULZRIetGtNUqDfLHqCxNWDDG8sA7vEstOERX/nITfjf0R?=
 =?us-ascii?Q?c2epJhKUNW6qw9usC0wsWLWSUXThXm6NwChXn2Q+rjvN0GLgYQHp5TzYjZEp?=
 =?us-ascii?Q?axMxChEvx2hfzdpt0aRlZqANpBalPNRRej9s1E0yh/wtlE14QpizP1gFQR9b?=
 =?us-ascii?Q?U4RZg4IcVeFnZW96t8TkVMBIaUCCD+jXymlNW3dZhC/qohcs4lBVQTy9YRXq?=
 =?us-ascii?Q?yA66evyXpYvnSTxpiZQOnBkcQGu+y+3R3UvRcrK0aXtWLQEmjm1oBJUbs4Hb?=
 =?us-ascii?Q?SbZ51YT3GDeJiCI1kyxEIrP3M2Jxz+DisHbfdA46LSHKl1u0Rfa5ny37RC9m?=
 =?us-ascii?Q?XLF+U71KpLYs887P8yZjoG7/mBQhfxDS1rG4cBvNNsyCuresleVzeHVbyuXq?=
 =?us-ascii?Q?QUyd6Exb1T/lZvz026MKJuRCrbMovDM2qUgGYppdC0EQo6czWcv5YEgkzoOi?=
 =?us-ascii?Q?mY2JNC0+KqfRRQdmW9s+h+R8Y+Ys397+qwKHRM11tSJ2osaPeCvCqTHn2s6u?=
 =?us-ascii?Q?lfehUl8hLMDdArqy93SxD0TJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe1585d-51b6-49a0-a838-08d9677b40fa
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 03:48:52.2206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 533wm9jHF2T1yf/kmDKB/8jkyelPh+nSb0U4a1CXXDL5ls/L5NUDIYl5qe0tFOoyqolySEM4zC/CJFJKKGn4+w==
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

Test cases such as migrate_fault and migrate_multiple,
were modified to explicit migrate from device to sys memory
without the need of page faults, when using device public
type.

Snapshot test case updated to read memory device type
first and based on that, get the proper returned results
migrate_ping_pong test case added to test explicit migration
from device to sys memory for both private and public
zone types.

Helpers to migrate from device to sys memory and vicerversa
were also added.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 tools/testing/selftests/vm/hmm-tests.c | 142 +++++++++++++++++++++----
 1 file changed, 124 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 5d1ac691b9f4..477c6283dd1b 100644
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
+ * through fault pages accessed by CPU. In case of public zone configuration,
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
+		ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_PUBLIC |
+				HMM_DMIRROR_PROT_WRITE);
+		ASSERT_EQ(m[6], HMM_DMIRROR_PROT_DEV_PUBLIC |
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

