Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D193E9E95
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 08:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3512F6E2B8;
	Thu, 12 Aug 2021 06:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3B86E25B;
 Thu, 12 Aug 2021 06:31:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJRIOw2C3NyZvgtOiPgsIXE/kuEvPIwFVoZqLeH+tFWbJ65Z71SgcFc5pipmTn4LYWFBTNnq1GWo7LjMDOtQr8F/mDXHDTb8CLYf96Nubt8jpeBNBhbTZQTAx/MjAz0U/suQb9b/uDv1qn/oJl0SJAPrW1ZVZ2elD81I+sjr1hZdvRlrYfvgytRJIHqOHRnNJHDrQKeB5WujZn5160G+qQc4CHHj+Cf6OGmVA+lYrFZNKrFyS5SOQiNsxQXJMw9kvWOYhgzbG8RWIs44RYLP0Kz/a0LeFHhCDNEGJUa3ZOP42dUS8NMPXoJPVfIrD2qU8iYNmr7G0Psqi1MAmS86zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m750G1HruRY8e0UdQp9kGzjlljIQJX1uEk9lQNpHmcQ=;
 b=oAuVMNpkOiTZuPy3HNOdEjAKF9z4sgxLYFm+gLLm3jGPgtUubDbW2Jmsz6xQ26qKTpisRbC4FoFaiWsrBNlqAId7g6qXU9YzU7GFDMILD8kz31TnIZJN2zKFak6tNP4hI+KIGOhvFx7soiD6umaTB1cqp/6P1gCT5/D3tO3exrFhA7Ouc3QDV5umCRT7K/ubYiuCd+xakjJXq+eX4TyaloOkUb6Yd34XYUPZNK2giaz1c8hfTSupmGACAUsW0iXXH9JUl2cQxXNU2figSErb+jvspuKEk7H+mVIeqeh5ds50j+P1tY8BFbOTe33UKlwbu2wd/J7/PRHChn5DzgBOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m750G1HruRY8e0UdQp9kGzjlljIQJX1uEk9lQNpHmcQ=;
 b=r8Si8fV8ZdBaRStXWsZFh9QSQocLaoDqxAMkSVIJLvGNfFu40qxZWJyiEucljIZQB3S7QJJA761+g5E5VQ8prp3wsg9ogNYVMsObemWoSaLaTI9ukVwblvvtTgFtZuu15LLEAj7beSeNP0XCvk++TnN21M1GKS4fa+65WhcAdTU=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN1PR12MB2448.namprd12.prod.outlook.com (2603:10b6:802:28::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Thu, 12 Aug
 2021 06:31:27 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 06:31:27 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v5 12/13] tools: update hmm-test to support device generic type
Date: Thu, 12 Aug 2021 01:30:59 -0500
Message-Id: <20210812063100.31997-13-alex.sierra@amd.com>
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
 15.20.4415.17 via Frontend Transport; Thu, 12 Aug 2021 06:31:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64cee1df-e0f8-4449-59c8-08d95d5ad07c
X-MS-TrafficTypeDiagnostic: SN1PR12MB2448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2448619E8CF200258054ED9BFDF99@SN1PR12MB2448.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ev4ocFySYaJ+654AwkXcCG/dynBqCka9ImP52j7lYGIFfBceXJg/s1Uuvu17r0tHM5NzhsqqVNJYTbYjiqzionMVEiZC9uqV3m6EXDv87ymoiq7PMSkV+7sUF7CjArY+AyYJapLA54J6U08lczSQ1/2Dj6TeJdSeepxVf+cMMtSKSYqq6ffB8iTeD1pYyUiNg68sGymbk+r1JAR9ObUM0c2T7Dk30EsqRSn+upMAweec3AETxkkFEi+gxIRrpfmLE+VDQnRmkCuov7txj2bWcrrOOShZno6hj3z6ivaZLMXjCbpmlyOlXYcNjZq/VePfkqO1itsAASX/f5e0MxaZclDJQno8IJg0Ms3FrPraSEAxBxoSeUgafV0QAJCPSELOrvatpymkxJVC+6sQ3MW+s3XnYNcyxW8tEJ7NDY2e7Bf/DCgFS2QATgTvKJ3Ll/oKvf7HCWdnCrgSpC7ZMCvhEE8J5LDcGeIy8GfVoSqutrvdrboF1S8mMmTp6a6X3Ii44RtFW30YZ2Q/YwnWDoMqYw5eFBMu0m0o7/xAghNdnlvuiRj3nbZ5CtIBPG74HpfRRHayaiUE056TiKr5j2HCwfwgbx3oV9UDGWbmllrWEuzT0mx1X1huFToKUTC2LrhTf9MNSZu1mNkOVsg2b4uP7YSwKDU+/Dn8C8PI7bb8LxBI/ApbhpHrvRKaq4N7MtZ0QVB2elQcKt5rCWA1zyMdZTtC4PQtNf8n9eJtvNrBMl0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(38350700002)(15650500001)(6666004)(186003)(66556008)(66946007)(2616005)(478600001)(83380400001)(38100700002)(8676002)(26005)(44832011)(2906002)(66476007)(956004)(52116002)(7416002)(1076003)(4326008)(86362001)(36756003)(6486002)(8936002)(5660300002)(316002)(7696005)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e1XahSDHQYWP2U5LMrnC75MkZ7f249fA9hU5uFNEtbxk2w2I4MbwT6XqJAWZ?=
 =?us-ascii?Q?DCNvSzHvuXSmKFl1TLgTnsiURD4wDnDq28qLKj2vl7JIK9yCThnQdkn5q/qu?=
 =?us-ascii?Q?QYJnfwTceOdnyeNkAVm9XUlXrti1+9r0EMuwhMQ+bX22LRFfh2fhC3F0ltKF?=
 =?us-ascii?Q?PUwnJsiJTOGiriFiR04Crtg/Z0Rde/4EYwEpZ0d6VdtxLLhFOC5RzBKGAmZQ?=
 =?us-ascii?Q?SV5qxwaNSokbiT9rfr7jiOTr7IJT93QDeLly59dxc38GPDrNXhAvlB6wwRLW?=
 =?us-ascii?Q?kjjuxft2UAFr1aTnmXMT/D+OY5luoJ1VpEtOsKMaAX9rQtCdY3OitRTnrX+K?=
 =?us-ascii?Q?n+kvjATl44k3ZOmcLZF+mems9YgaJ3Kap5ZjPTgAW+/R1500ohAixdehQZEh?=
 =?us-ascii?Q?gfld22cc0ZphZr1VkZR/HiPui5lxzOU66XMqjjGLkg7+SK1+wog2b7IJg7qQ?=
 =?us-ascii?Q?eDoXwtH5xwmKioaLJgSAZfbAR3AvmFYyZkfHSz+ujXNPexUYYsKNsQp+yUOx?=
 =?us-ascii?Q?LFChomDtym0e8cUq90a/4rhc8Bz08q4ROpFBtHliHVC9bjImkU7xZVog04fF?=
 =?us-ascii?Q?igeb8jcOkLgxt0C8lOylekv5iebRNrB1eFUgyDAzWd++F77+zXbL85Ejd9ZG?=
 =?us-ascii?Q?rR/cMOnhxB4xOaGEX7tQvdhQWbR1m5pjROt17GlHFJO4y3dSIgFD9+zog8Fx?=
 =?us-ascii?Q?EwRVKckU/VULjmHsJ0YsFZ+0MnLHJr8zQeNgEjWCkxcIc6DE0JKEQy5iyYvj?=
 =?us-ascii?Q?1qlO1DQauvaKrxPAiNn0rX15giNHX2GXiSM9NiAMRv5wewGajame+9TOedSM?=
 =?us-ascii?Q?jFPPiozrQgNm+pnwkHU1OroEMbZuoi2D/yAD8+7z30y6pxvS2ViUxKIpITPI?=
 =?us-ascii?Q?aSIoVSOZDhkds3drW0F+Z5GpmkoS9m0VHJvbQ1O6gxlqe9ucvqu/+y8J2oCT?=
 =?us-ascii?Q?XFeFN4vFoYvbft1BwbYIcB0SEHEZXO4Sc2BbpSw5ysQQmhxQLMeqUHcS0fdq?=
 =?us-ascii?Q?pOB5Bz5ZiONxNQ7A2VpqR0JKEeLgbsqTLYkCxgCSqQzG6dpJoNbztc6JTJXU?=
 =?us-ascii?Q?EtC6Szt0UmsUvO3cg8QGc1kbGIPMVESgIwSMXAklrDTei8KSns5uCY1/lCay?=
 =?us-ascii?Q?SCn4YMfKMU3SQvAoY17S9+K1izypb83mBNPyMs3drTiKxQrPWYeOL5aHIjyg?=
 =?us-ascii?Q?chE7frKTOl0ZtINw5zEx98bbukRt7sohTPlLbYOY1BGsQq4Dyu9MZ03b6LGb?=
 =?us-ascii?Q?iDKxWd3qeATzRPNiUHXdny9JMl2fNAhLAjjwu8aIAUeGcFCSRYVuXojvZTsI?=
 =?us-ascii?Q?e+jqCwBdYyZ69MfoxlVKZkdB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64cee1df-e0f8-4449-59c8-08d95d5ad07c
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 06:31:27.7573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZjwZD2CtrdsVLIqLQubhSvCKQ/ziub1oqVvHlbDFU5Csqzg8S+UEINUdSDyhmICzhoVqdAoWR2fr2LghweqGw==
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

