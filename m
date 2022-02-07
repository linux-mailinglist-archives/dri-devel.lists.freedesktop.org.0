Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 270DF4AB380
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 05:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8840610F4D6;
	Mon,  7 Feb 2022 04:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2051.outbound.protection.outlook.com [40.107.96.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9F910F6E2;
 Mon,  7 Feb 2022 04:27:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogA0w9wa8TkhN5HTcNTR+JGgJS7h3bF+Ded9d2sr7/zsUsy7otMPIG7lkZrg7GF7CRbyPhn5gNuGaMNUqKjRPWlTr/rK0rEYrHc2IDDB1GoBCaUzq0tRIPgg16/ZmJ4vH5TDo/yuH9uatATp6nl5Ra2W0hLIlbQXzxClocIuqtE+0pAogkp/+J5aOVdi+04eJw9t99HBhppdIT82w5aGblk+YesWL1z4vCx2RaucRTwg73Dj5q2zHLlLt6KTHAINULVpcilXARUDTlgxPaw1bV1GmFq6zCutyYI7pqWDemrI94YmqYv0GnQoP7nISMzu/YLfsu1w5lqq+WppW+XEyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWYhz0Sv1Rkjnmi/uR+BbDa+rT94UmYsyQ+O00QdUhU=;
 b=USFoxUpcNrN81VtksTj0smRIKCaCkPCGFOPhVYL0LC0NMIWgpHosVYgXf8OseJvkioAls/qs+wIDdM8pbBWcXfmAl507/ZMCcv4LD7Xepk+sZwrpTNx4OOGBjzvmDAcaO8rNdsEoEsMUiitixP7PtGBcmHYTYSDkNynnuY+s2mp8kxeOIcnTmPEInTb1sDbl+xoSh8Z4VQba9f7Pr+4VC3TlZCgjHdLa9vBXv3y/nW3uU7T2W6lhx1CjVzcoxP+dNvn7emp786tIFoQnOa5jmb67vFcU7yegPkSukKDpu+7lFdbjEcJnj8Ijyy338nmZpoBBvUTvs0MIgaA9uLUIgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWYhz0Sv1Rkjnmi/uR+BbDa+rT94UmYsyQ+O00QdUhU=;
 b=R6iAs1xt6CUxucLkLJOssho0VrV3mI5OGfBu4GyKM/5G3ALQFPcnr8OD/pCgUCM/p0TwhN6fn52At+b7TQBDGHEEkoxnzI1oDlHq5dTAhsuBmzZG6ulUqjLdPlHLBTLvJ06G5wJ7Zn88ooD4jph1GW5MUSySVbmJ2vJaIBPNgSHi5qS5EL5tsh6DGDwvJrnJkjn5NYmxZC9p2S4OSGdD5b+4VBsCT4hXvhiuuStBTlAquGDxEJUBU5FMXVmsMHaX1xN6ILglomAN7BIU8tZPsQbk0ysJrV0qakfzEyGLjvpnFrdZF0jdkHLTjs4QpKbNg7j18hFmfHJ1xzmtBk4hAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by BL0PR12MB4705.namprd12.prod.outlook.com (2603:10b6:208:88::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Mon, 7 Feb
 2022 04:27:24 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::1528:82a2:aa0:7aa6]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::1528:82a2:aa0:7aa6%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 04:27:24 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Subject: [PATCH v2 3/3] tools: add hmm gup test for long term pinned device
 pages
Date: Mon,  7 Feb 2022 15:26:48 +1100
Message-Id: <6a2145be66877fd3a08c9acec4ec3d53d82a864f.1644207242.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.0d3c846b1c6c294e055ff7ebe221fab9964c1436.1644207242.git-series.apopple@nvidia.com>
References: <cover.0d3c846b1c6c294e055ff7ebe221fab9964c1436.1644207242.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::10) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb3447cc-a0e0-4b4a-f24b-08d9e9f2239d
X-MS-TrafficTypeDiagnostic: BL0PR12MB4705:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB470597566078582EFD88CFE4DF2C9@BL0PR12MB4705.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SjFFvZzVhXBpJlIKvdwicyXL6IWHU9q4DDN5A2hsR8kdgn7oVV/9nT0IThYCP4tQv6Cl21TPmW7LienhI8LIWXoosFem69lc2WxIG4VXzIjds3cKW4C0AIbg/498WTk9XMmogy7WKegl8f0LVpgpNa85AwGY15PcNxXBw70OZP5km8XECSUyxLEfeY4ps7B2/W4if4Jx12gdXra/DBX774qpj9Vg9uptq5+zQwPQBsY9jB01F2hS86dz96K6YnnbbIEf0AJmC2BWuzExUfdfp5gQL/vNowb+Q5gmF91hD0n0FlcWYJEwCrA+Y/vTIh9LRv4eMQGC4eb8bxqTOiWJjndXOvZtePJhqbQdt1T2yi2UiWeFAlJ5w/fqx9Azq9RZiHlXO66G74OmnbPRsqSb5h0GbaWN2XG4otHZuN5Z+1nWKhNGpz6EBwLhTxSthWBzBtAp+HAWFQzK0soerbtiOGH7SAHSfwkQaoWrSMKXm0zZ+qY18nfLHBOVclXEmGCW1lkUHoDUGD2FFCgwL4xCrolGsyeoFuzS87shBtFeVmCrK6Xb2isEdyVgN+ZrxKbetyl4BT3nWNmHVygjoVaouQDM0ssFrS97pOFWNAvBJo3wpUY0qP3c+Pl/HMsFh+froZPfSo1xmWhX9gwborLStQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(107886003)(6486002)(2906002)(508600001)(26005)(186003)(6666004)(6506007)(2616005)(6512007)(316002)(66946007)(8936002)(36756003)(83380400001)(7416002)(38100700002)(5660300002)(4326008)(66476007)(66556008)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mry0VoqQoqGL4dKymdquKqr4N7+JrRbPoGs00o1HBKqPdLG0wKA9W/Un5Xi9?=
 =?us-ascii?Q?2Ww27XtNJWl/2tAEThMP6yRzourqhtu+4c/Uvd90+UgZQBBWTRjZ0uuZD2Zu?=
 =?us-ascii?Q?TBp/IxZtZyGXuojPOK8Mw5wYyzZQncvAWpiDdTUfHW+InegvIu4JEIQdQpqi?=
 =?us-ascii?Q?D5de2sXU7gwhzCuq0k/Bxb0YADKCPDRUJ86i+TPdoEWWbM1ShbJKgxEBxy7S?=
 =?us-ascii?Q?cLkLTrcHxRWFDIACFJlAufHkPYHbnv8dbOes5/uMoqSS7anV9RniElVqX0Hj?=
 =?us-ascii?Q?GTAtjvonQexEkhJ99C+q0iKDl2+MVgLE0IeUjJmYA6SsnSbEZptQg+zcJbEe?=
 =?us-ascii?Q?8lwy518V7h9bsrHRPE6mnMrRJyiKrRHyRLLuUIgowzMRfJ/dzrsYlNFuuaoH?=
 =?us-ascii?Q?hU3v90dDVmHaGzxwtZ7QWbayao902MB0vy0FL6sDP13+CEzonyFA9jMhLHet?=
 =?us-ascii?Q?DmIp5ctNttHtmvWwHuyp5b1yNwh6bI6vgmQelHxK6BHn/FJ3biGVn/m5u1Ca?=
 =?us-ascii?Q?VVD2Hnqnz1L9dwcWvlmGIUvOGR85FCHBx6NmHVkW68YaYD/8o+IsZyvRUovA?=
 =?us-ascii?Q?VkuVh+L5FGHp4u06DvTKDMYlkioQ0tP9ftH0P4xVp7Hd+/CvZEFXQfanrTzW?=
 =?us-ascii?Q?6B803rWL/N1QphGUi0AnJZhonLYNbSgQydrIz3G6ArXhYf5y3velegcikxrV?=
 =?us-ascii?Q?2fW990WkhFzUXh0b1Ge4vM5HSyfnWRo8cXgsAiNh85g4ozNtitiIqz/I5aOL?=
 =?us-ascii?Q?UTdo9u5DN9ef2ZAYLFlp7X/AC83T6Ko/n1n1h7xARGmvglXCZOHKMEx9LFZ1?=
 =?us-ascii?Q?uJGurn78z60Ccm4POfhFl/Ez+W6EMipsWpDek7zlUYb9AjXL2A7YLy4k+G2B?=
 =?us-ascii?Q?LGu6BYA4yz5dVVa2BmI1J3FcGsv8w47hMa3QD9YlHGmxw91RgRHCR1DdH21p?=
 =?us-ascii?Q?Hjm/vOJnIqono/ZzU2ujY/uRNuu6YJy0Ixlg5vwO4CTvsDsQ7c54hdYEtVaX?=
 =?us-ascii?Q?m0o9xlX+xHfKW2R9mDjQLi8gHob5HLejDS8AUDtCQnLnZsYnCF9oMHqqpFTL?=
 =?us-ascii?Q?CTzyN6JvvTMW4mAOtTrVAnj0z/nG3qjvrdHiw8D8eEOUYl2Gew8ZeFa4UcrC?=
 =?us-ascii?Q?5Dr5mGu76C0xm4TWvgDfQPDXJazEIzmk2bTJ6yj58hR5wb/ccAEQi0MpsvJg?=
 =?us-ascii?Q?l7jJPV/l1xczaExecCPIAPzvrT9MtzbA52x77lGZpTMYFRSbN8b0g0iv0mTo?=
 =?us-ascii?Q?DkgYJXvYhe7mIDOxiW6mHFmYk+IWA6Dh0rd12MN+CX5qcAZ5iG6M2lr6ZOvv?=
 =?us-ascii?Q?VJC7wvdJhyWrebPv0V34sFiGwQsoV3yoBwQPIRDj36oTVRKXSfXHJaiARsrz?=
 =?us-ascii?Q?I30YRUg/dVBvyxSaKXHChjm5TW/H6neDzBCElDlDJTLM8YLGAJCPhXoB2H0i?=
 =?us-ascii?Q?GvToS1iLQCxVVcBqmgbkh0ZPEmOGh4UqN2ALkoFABOr8F8YnSqVBplCC9irA?=
 =?us-ascii?Q?MOmUQ+Db7uBZ79u0GQJDb/LSnD4bGxCZH8zhRrFo7CS27UwEUm3IYWyt3cqR?=
 =?us-ascii?Q?F+oc4BCCemhKsJOdaCSUbZ8ebl9NCg0cFeNdl9qr0GC262A5d2D6H5dJP/4N?=
 =?us-ascii?Q?j6k1L5FfPXRJIYURtYKfGcE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3447cc-a0e0-4b4a-f24b-08d9e9f2239d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 04:27:23.9328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tykI1F9MB78yKbRXZkREQtCbJuUNUybhay+Y4lcYBcJuwuaoZqJbB4U7zyzngManKzCPJZVDxqTxiMxdhwJX0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4705
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
Cc: alex.sierra@amd.com, rcampbell@nvidia.com, willy@infradead.org,
 jhubbard@nvidia.com, Felix.Kuehling@amd.com,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

The intention is to test device coherent type pages that have been
called through get user pages with PIN_LONGTERM flag set. These pages
should get migrated back to normal system memory.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com> 
---

Changes for v2:
 - Added Felix's Reviewed-by (thanks!)

 tools/testing/selftests/vm/Makefile    |  2 +-
 tools/testing/selftests/vm/hmm-tests.c | 81 +++++++++++++++++++++++++++-
 2 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
index 96714d2..32032c7 100644
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@ -143,7 +143,7 @@ $(OUTPUT)/mlock-random-test $(OUTPUT)/memfd_secret: LDLIBS += -lcap
 
 $(OUTPUT)/gup_test: ../../../../mm/gup_test.h
 
-$(OUTPUT)/hmm-tests: local_config.h
+$(OUTPUT)/hmm-tests: local_config.h ../../../../mm/gup_test.h
 
 # HMM_EXTRA_LIBS may get set in local_config.mk, or it may be left empty.
 $(OUTPUT)/hmm-tests: LDLIBS += $(HMM_EXTRA_LIBS)
diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 84ec8c4..11b83a8 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -36,6 +36,7 @@
  * in the usual include/uapi/... directory.
  */
 #include "../../../../lib/test_hmm_uapi.h"
+#include "../../../../mm/gup_test.h"
 
 struct hmm_buffer {
 	void		*ptr;
@@ -60,6 +61,8 @@ enum {
 #define NTIMES		10
 
 #define ALIGN(x, a) (((x) + (a - 1)) & (~((a) - 1)))
+/* Just the flags we need, copied from mm.h: */
+#define FOLL_WRITE	0x01	/* check pte is writable */
 
 FIXTURE(hmm)
 {
@@ -1766,4 +1769,82 @@ TEST_F(hmm, exclusive_cow)
 	hmm_buffer_free(buffer);
 }
 
+/*
+ * Test get user device pages through gup_test. Setting PIN_LONGTERM flag.
+ * This should trigger a migration back to system memory for both, private
+ * and coherent type pages.
+ * This test makes use of gup_test module. Make sure GUP_TEST_CONFIG is added
+ * to your configuration before you run it.
+ */
+TEST_F(hmm, hmm_gup_test)
+{
+	struct hmm_buffer *buffer;
+	struct gup_test gup;
+	int gup_fd;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+	unsigned char *m;
+
+	gup_fd = open("/sys/kernel/debug/gup_test", O_RDWR);
+	if (gup_fd == -1)
+		SKIP(return, "Skipping test, could not find gup_test driver");
+
+	npages = 4;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
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
+	gup.nr_pages_per_call = npages;
+	gup.addr = (unsigned long)buffer->ptr;
+	gup.gup_flags = FOLL_WRITE;
+	gup.size = size;
+	/*
+	 * Calling gup_test ioctl. It will try to PIN_LONGTERM these device pages
+	 * causing a migration back to system memory for both, private and coherent
+	 * type pages.
+	 */
+	if (ioctl(gup_fd, PIN_LONGTERM_BENCHMARK, &gup)) {
+		perror("ioctl on PIN_LONGTERM_BENCHMARK\n");
+		goto out_test;
+	}
+
+	/* Take snapshot to make sure pages have been migrated to sys memory */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_SNAPSHOT, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	m = buffer->mirror;
+	for (i = 0; i < npages; i++)
+		ASSERT_EQ(m[i], HMM_DMIRROR_PROT_WRITE);
+out_test:
+	close(gup_fd);
+	hmm_buffer_free(buffer);
+}
 TEST_HARNESS_MAIN
-- 
git-series 0.9.1
