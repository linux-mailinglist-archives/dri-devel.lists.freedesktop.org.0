Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ABBA541CE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 05:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A684C10E8F6;
	Thu,  6 Mar 2025 04:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l2oKZSfw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB8310E8F4;
 Thu,  6 Mar 2025 04:44:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWQvGsRe1MDxNfLPjC4CaSLNSjahhIBgAlyGgRVci4u6kmr/IfWZR/8IODqgWTUnedKX3WKRH2riTLGUKzOezw6z/4chm6Y2ndQ0pKbGRJCs17FhPT+NuNVZWxPIkpOfpGQAqJA4yhGTSAnEyVVnI12Pzd7hcRTMBeVyW/w8fwyHmHAQIulJlEmLHVCZv/GTOGNIj3DyNI6vfSV0x2GHfJMYDN+69TkI8drAEc1Thvq2uDV7Mt7J2eQCRWfh5jXnAkZBUlroVaWBbbHaTqFmoD1SG0J4lhgspOx4z9CCxRktbddeUVwc6emZin2u9qiiGPvcAEQafrFleq0gcKyLEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIumqqK46CHVi5Q85D2yejJUrMjvB3LIFwEsKiYdW/4=;
 b=fGuFWr7hsJlz6h95a3FZoyM89IxcDwp7x97vHUHsNOUkIL1a/zps/wbUzI0mPiidxK3STvR16yG0ysuMO7LlHHgPkY2pOcWQg5LoVILvrd0tdZ1a6irCFAY0KKouXjCzOCtT8qVLXYJqbgJfwyahtUs7nFRcff9TghcapJHcRG4SaTQlRmxnjdKJJcTe+00VJqbsEU6WQXMYOL0evkVVSWbbXZotdsTxm5U3s2QeVjySXLlKaNqj5WjQXkPqu2feOafdUd5UkKRtF9CIcTWoc7Gq9egqXpRRB6ziChFPnfJoNPfgRS5yFa3vtldhEsh40mXCbSGQJTkfXhKumuy4qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIumqqK46CHVi5Q85D2yejJUrMjvB3LIFwEsKiYdW/4=;
 b=l2oKZSfwf1nOkfKd0GQ2BCPWTv7OaO6tH0fuuC9D5KK9sOPNzx9JlaXHR9Kvk63UWVZ5nPS5I74kYie78zoIoamWbXLDtAX1i+qHIoBiZXkTQteGfSz6cSB7jKbE6oNxtABR8GUyF32xptEKO4AV+ZnyiJEUmj2hEnoXjGuPJhwygsWuomxvy6sxHoUM0r6q+7qZKfPksmGYf5XAZugAEPPSdK0glDgWN5hoKL3QpbFVwltHii8AyPoTFtHnxzWOgWfp81oc5hFub0LVPrCFE4I4sjFzt5RyZfud3RLilx2mI1oGyP+jUjtwjKZN0S62AD7ESRL52NVrf+04KPLOgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by SJ0PR12MB5674.namprd12.prod.outlook.com (2603:10b6:a03:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 04:44:08 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8489.028; Thu, 6 Mar 2025
 04:44:08 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
Subject: [RFC 10/11] selftests/mm/hmm-tests: new tests for zone device THP
 migration
Date: Thu,  6 Mar 2025 15:42:38 +1100
Message-ID: <20250306044239.3874247-11-balbirs@nvidia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306044239.3874247-1-balbirs@nvidia.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::30) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|SJ0PR12MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b78c234-3e1c-40a4-3dd5-08dd5c69882a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hbD9zz4fPIK2YBtJ4XMblryQFvEdaPJBSofY3j74Z6n7NTw0nHzXzFtOm4gE?=
 =?us-ascii?Q?cmkmeMeo6ljgTsDHxmN6Gzj34Ny3Sl507Eg1q6PDUPxueNp7VtRQqQb1S1ty?=
 =?us-ascii?Q?yUW3MerNoW9CPUtRResmP6kzS4g+3+X8xblrI5JZpvp9l3nyQc/X5k0ngBwz?=
 =?us-ascii?Q?ECk1q8uGB4z19w7c9uc1zL7/5lyedTHqIKDKq3gP5rVxjtcqU95qCKEw3ohI?=
 =?us-ascii?Q?t79+UDxR/e0QaYiHhaBi7G2DKlNr+p/393vVYKx+SlPWWcT8IyHutIbpJibO?=
 =?us-ascii?Q?Va9dl4jhuVuUAV/zdhA8X689zjZT6gAL+SMX84t70WRYDA6ozrS10JZyV9QV?=
 =?us-ascii?Q?GyV2zQRGLJq6WmEvutCbYBIU+RHSLytQRU1dUJ0GVZ9V4HJvIe134n3nOoR9?=
 =?us-ascii?Q?FAr6fYiiyUiYcfOr79H9Gttz/+7brEBqJNPwZh2hh2Wlzdt5fA9HK6Qbs/3+?=
 =?us-ascii?Q?zXsLKyTEMl9QT4qljJETPZN1oWtm+iTcFaO/248gPzDbfpyyFN8IcoZlRL8p?=
 =?us-ascii?Q?ytuNu5nCcn17z/3A4QGQc25Eux5g7mAZ3DlfrcP9QakawHHntOFOUdTfLo7Z?=
 =?us-ascii?Q?TyvDvCp+DWe8Cu/3o2o2MjbTzXoXqr7PuP53Z1ibowJNFM6Mj6DzUBi04oQr?=
 =?us-ascii?Q?Q1qz4kNlw98eGEHYOR37xlIlnqGyFeyox/q9tXlmwrVGbP3Tgwp+jUfRcjTa?=
 =?us-ascii?Q?Z0wUs5ArY3xiynqzlmXGzEvUs2SRmxNdrgqy5nA8IjueqQSfKLQR9TV52RW8?=
 =?us-ascii?Q?JndK8ncbeSuW7uv1ekE9kHW3+KbHrL+C4bHiXZHHBkEuDJLro8sjPgbVaNxD?=
 =?us-ascii?Q?XQFCq7JgwBL4d0M18uKnyrJGN1d/C+CQZhp6rIRNA4jTP3ZIvatBPnB8J5Mw?=
 =?us-ascii?Q?bip9XzZFNIvapeJ9FTuxCOKsSdZ2MmIfxINnkyJ9VgOA6an9hubQtlWsuIcf?=
 =?us-ascii?Q?PbfRNsEvMEXPovuGCDul4SIZ2Me6al7Sk7k7ch3+TSFWjZmFSY76aZr/SJCR?=
 =?us-ascii?Q?O07WnB5eKLGxrPlNAPwz1h25Le6OSVK4rlg+xPzgxD3G86qpRfBRMV2hxTwZ?=
 =?us-ascii?Q?ycB7ffKWut9TMhTh7M+2HCeOiKEPj0aF3qOz7jFPBo2HetbL5rYpy9fBtjIM?=
 =?us-ascii?Q?L0egWOv6X6YB7nXW7HmhLhVNkjkuDHeYoBiip3D1lSbDKR123ZrsIXPh2dO0?=
 =?us-ascii?Q?/4/T36cv3yxeTY8yK4h5Dio8T/8mpbTuwHiic5KYcG8+1vEZ9tkAGQ384RGv?=
 =?us-ascii?Q?iHHU9aPBD2awjeAmpR1GHDyxxX/QHKDDC9UxLfcdWqW2d/nYOaJi5WiWdZsY?=
 =?us-ascii?Q?/R974nvjUPHnYLpLHx7cffkDAQq++WJHOPS8CEwGjy3UEVqe6jam03Rf5v+I?=
 =?us-ascii?Q?hzgpEpEw0yF9ZMEtlLhLU6GIWRdO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3Gj2Y0cm6Wk1dS0Bli0ktLohiOFN43Assump4mSHOOAW1EqBAQRyWAVQPMe/?=
 =?us-ascii?Q?klRUELJ+zQwoJ4fH81zXYMSJxyME7szuQ4w3n9DdThiMGiv6oHwUy0JCRXzI?=
 =?us-ascii?Q?NexnMdjNRmV7OIeD8pFDzONUaI+6bv5eSXxI+a7PTn+jeYCHcFwZ3S3HQ6dG?=
 =?us-ascii?Q?aroF2Ylyj3gCvKuhXNqyHFO/4AdAYe0VJBSqx5Z7xPDP8YtVBXe9+33vZ2Ww?=
 =?us-ascii?Q?4bjU7l9Tk/8DXSyjYkDePL2FvyjZq15laK5TFKlzwLWDaJT0W84bRJcfdyOY?=
 =?us-ascii?Q?UQb7JR4OMslegOuqtk3NgDKgMxxusrARbP4TBDXa3w0VKpuf8q4Akmpmlgic?=
 =?us-ascii?Q?HkLM4cCEPRE8+yu/C5qnZDH43jM0/i8McderLsQ5f8xI8iQTN0W+NLri+t1X?=
 =?us-ascii?Q?bB9DgdlZP5ET0oLXRI+cMylW0G6vLCrnlsbw72yFgn70tkx3bpqOow/erWRY?=
 =?us-ascii?Q?87nYcLng3xJdaw0OmgqGmxuqExPYWhGG2I2CRb1e5DFxYINq6MC2CEmBqquq?=
 =?us-ascii?Q?fa8VoGEUF85iteF+7pL92vksgrdXA8c281ZJYoaG2XKnM3vxSPRjprAfb469?=
 =?us-ascii?Q?XZREAc/62q9/9+29gxDTVxk2UphXqXgZeEGO5B+aqaSSVFNOuQoWfeznLERU?=
 =?us-ascii?Q?4K2LqzoiY4R9vjpxVkHjUF2bdQLFDsYpnI+ml5sYScAOGYO1qTqPZ8yalCCJ?=
 =?us-ascii?Q?hNrxEvs5glmkGSJ08q2M6X/pyPFeYtnEx3Q9eex5VEIOE+ehZbcYxnx0vJme?=
 =?us-ascii?Q?cbJ9OUO8iBl+CDJpjfaam0fbHQpsARdTtKAQj27HTV/bTHtPoaliQ0QydQas?=
 =?us-ascii?Q?HdmLb5oSK3vLvHFQ6oEWI/YjHzJ9yAsvaxCg/LgFjV9f9wK2ZsiZTMEr/seM?=
 =?us-ascii?Q?VzSeutIiFQYJRoGM8ZpQP02ge90UIqK2egw3JWC/hxqqEyjAWQBxvK3VBe06?=
 =?us-ascii?Q?XEg7Ytmk+P57rTlV8cmGCMyHCrEcFmqd5jXVEWKiTp4GpUy57BIlYh0Qzvv6?=
 =?us-ascii?Q?fGiWm4hlKaOpPqTw2+PGRIFz0Lznqj5uF6ekHBzt28pWJ0WaFQbcdOumFL3M?=
 =?us-ascii?Q?wgPIhKMzDEQQRQ0pF+vvfoqfiXcKwURy3Bxkeh+D3dtvzLvLbWg30gJ5tq7N?=
 =?us-ascii?Q?YH6THzo9GvQc18ENtke81iluD9ZePD0lRIK71BQ0UxilhzjPEeA7nxXA1Ph2?=
 =?us-ascii?Q?1roSQ4rOtkEVkNH1asAF+T4z9iKjYY0WJOLUENcxt77ASpQQyVLrfZwrWi65?=
 =?us-ascii?Q?XWimyFBhf8tlCKNX0IyCDks5s8FHZGaAMQs4+rmNu81hq3DP3z6UWBUtp+NS?=
 =?us-ascii?Q?bmEFTwdCc1posbGTLZzsjnPt+3KtmUjmBtX2eGxncgpv+VtykRQzx1XewlD6?=
 =?us-ascii?Q?30Dq0apRE47qXFy3sICw6pH05fAn/HLSamg01Ju646YR3vvvq8BdlpSv4HRA?=
 =?us-ascii?Q?3Et5FhIv+5PwR+k32qIgX/8gsr2ay22bK9/rywn/CPWDncD6nJqGfA8L7Gu7?=
 =?us-ascii?Q?T/qbRTo5Kq1Ueq+QIcviJ1eqRwS3eI/fYU7fZSax0yfrpkcJA4topHRBWTnt?=
 =?us-ascii?Q?Qk1cV2SZciBjSVW0ke1VJHIjlMOuoSSrjn6dKxI+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b78c234-3e1c-40a4-3dd5-08dd5c69882a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 04:44:08.4755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /G4Eu34xQ887Q2QKiEpJsVkPv+M1jj2Srf+2F+PuYVSiCAwsw1xek6gKdxOcV3SoKFR6yTd/BBhNN3wMEikppw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5674
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

Add new tests for migrating anon THP pages, including anon_huge,
anon_huge_zero and error cases involving forced splitting of pages
during migration.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 tools/testing/selftests/mm/hmm-tests.c | 407 +++++++++++++++++++++++++
 1 file changed, 407 insertions(+)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index 141bf63cbe05..b79274190022 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -2056,4 +2056,411 @@ TEST_F(hmm, hmm_cow_in_device)
 
 	hmm_buffer_free(buffer);
 }
+
+/*
+ * Migrate private anonymous huge empty page.
+ */
+TEST_F(hmm, migrate_anon_huge_empty)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge zero page.
+ */
+TEST_F(hmm, migrate_anon_huge_zero)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+	int val;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Initialize a read-only zero huge page. */
+	val = *(int *)buffer->ptr;
+	ASSERT_EQ(val, 0);
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i) {
+		ASSERT_EQ(ptr[i], 0);
+		/* If it asserts once, it probably will 500,000 times */
+		if (ptr[i] != 0)
+			break;
+	}
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge page and free.
+ */
+TEST_F(hmm, migrate_anon_huge_free)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Try freeing it. */
+	ret = madvise(map, size, MADV_FREE);
+	ASSERT_EQ(ret, 0);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge page and fault back to sysmem.
+ */
+TEST_F(hmm, migrate_anon_huge_fault)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge page with allocation errors.
+ */
+TEST_F(hmm, migrate_anon_huge_err)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(2 * size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, 2 * size);
+
+	old_ptr = mmap(NULL, 2 * size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device but force a THP allocation error. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i) {
+		ASSERT_EQ(ptr[i], i);
+		if (ptr[i] != i)
+			break;
+	}
+
+	/* Try faulting back a single (PAGE_SIZE) page. */
+	ptr = buffer->ptr;
+	ASSERT_EQ(ptr[2048], 2048);
+
+	/* unmap and remap the region to reset things. */
+	ret = munmap(old_ptr, 2 * size);
+	ASSERT_EQ(ret, 0);
+	old_ptr = mmap(NULL, 2 * size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate THP to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/*
+	 * Force an allocation error when faulting back a THP resident in the
+	 * device.
+	 */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+	ptr = buffer->ptr;
+	ASSERT_EQ(ptr[2048], 2048);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge zero page with allocation errors.
+ */
+TEST_F(hmm, migrate_anon_huge_zero_err)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(2 * size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, 2 * size);
+
+	old_ptr = mmap(NULL, 2 * size, PROT_READ,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Migrate memory to device but force a THP allocation error. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	/* Try faulting back a single (PAGE_SIZE) page. */
+	ptr = buffer->ptr;
+	ASSERT_EQ(ptr[2048], 0);
+
+	/* unmap and remap the region to reset things. */
+	ret = munmap(old_ptr, 2 * size);
+	ASSERT_EQ(ret, 0);
+	old_ptr = mmap(NULL, 2 * size, PROT_READ,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory (zero THP page). */
+	ret = ptr[0];
+	ASSERT_EQ(ret, 0);
+
+	/* Migrate memory to device but force a THP allocation error. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Fault the device memory back and check it. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
 TEST_HARNESS_MAIN
-- 
2.48.1

