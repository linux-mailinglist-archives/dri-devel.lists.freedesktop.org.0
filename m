Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50915527F30
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 10:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE41210EE7A;
	Mon, 16 May 2022 08:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C4C10EE7A;
 Mon, 16 May 2022 08:06:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0aMmBz+P8MuW59mqLxtien9L7IzK+7R/gVImCjr/OEuEOUzDAZuZMUqov4q3hlsePfrCcqVmPZqIbzdAOL7YZIxWmvABXeiUhjFYlLTk2Jpv3X6f/yHkZhAEIC5lSeLElU8UroIHpjgUfn0lZMkuCj/KPN5Dv9rO8+JKnPo2j34fYQOI8NoIxJ7cMTtIsmmIKr3QfXTwcu9Yry+WK1wXdhbT/VBjKvVYTogCtuPTBFRje9vntgxR9nyHsz7UzCImiyWLy5s/t5dP5b0NFOizZKxKa9Mq8TK+FeiignK8Jei+z/MdtA3AckhSyVw+nXv3wEv94buJIQ7kQ15d0sNwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6m5mIAvNMr00pbrrTVXzO/+PDbkBv+yX5Ofg7KGaA8=;
 b=mdoygEAEISNPG+CzOVKmihCQCpHYzy3ojgeSqMiFFlRjQuUxtoLO3n9yGQexsIBmJpbShV7zuqErNiU3OIMckDuYsys2gHvUQ405oPD/hFuApgdIcuM6S/ObT+AMvdK+8I6FdeD1CgwfUwIK60pphSdNkRTBWFt86gn8PqhmB1RfujZ73iKuPTzLEgSf91ZhIDdAUfPETpE6hVVXCOVgJcrQN82vlwwW4iYEfDTxNnvn6yrEFN/hOk8I878nI3+pVWH2sgkFjfDiyO1Ng/3BKgJazUzEj+fZ1d0yA2ju+JCTn8EorF2nXmAhI3a5JgcRWDXIk8hq3ZjiIJk1e/laKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6m5mIAvNMr00pbrrTVXzO/+PDbkBv+yX5Ofg7KGaA8=;
 b=OIfY6u+nTja4GZHs7RP1KxozvmrZa0iCiKt0P9jwPvfBQ2FHysuSGt0qFnuAWCeySAW2atPMb/GFnpBQ1TWU+1uEZJGEPoZJe4DvyghKovdqF1qwF4m73Q3dec8PgNPTOoPdjEZfpftE8s4RHWJqvEZCoZZb5coVzDpdOZrRvZKO8yJUkfCOg2ceF997Uja8DS1MitrwfIJOg4cCpm2uJi1TxrsLoEk9Dd5MHpGbahCWntLX74nheUYvhA20pDFijnaYSTR/+h1DBRM9zPOGVfnrDthwDPoqtz6u4yoBKdEdwXNyxQZduKGfg/YWuVi3gNTfwbMcZZq4riVplGIxPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by BYAPR12MB2936.namprd12.prod.outlook.com (2603:10b6:a03:12f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 08:06:55 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::59cf:d090:5d26:6e7b]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::59cf:d090:5d26:6e7b%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 08:06:54 +0000
References: <20220505213438.25064-1-alex.sierra@amd.com>
 <20220505213438.25064-15-alex.sierra@amd.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v1 14/15] tools: add hmm gup tests for device coherent type
Date: Mon, 16 May 2022 18:02:56 +1000
In-reply-to: <20220505213438.25064-15-alex.sierra@amd.com>
Message-ID: <87ee0taokl.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::11) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3511d01-2899-43e7-46af-08da37130a81
X-MS-TrafficTypeDiagnostic: BYAPR12MB2936:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB29365B010B7F8AB12B16E0C3DFCF9@BYAPR12MB2936.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: afba5DwhCcLRcoAW3v5DzIRNYoHR6ozdKvX6qQnNjalmneWCcAnIM98/G8Vv6lHCUguOpR1VY31pgxbWgGvst/zAZS2cv6MoT+NbPRo3e0mWHRMjjy3QR5AHDIDyUyT4UBsEbwoR0puR+vXs1DWDQB4fvOvuOD8S5mQK4pxWoE98o6nm+Y9rlfmzaeaFC0TB4UkkJIl4zi2SEXzwWqaTYU8XeqlxCw2kwKc9Cnt7B/hTQllR7qJPfgRt3M++bgQSobLM/dyPzPvgIduk7PHi13BmpwnMbQ/pGa3oD9PQVRRS/It2pmPy+kGCSAe2kiqvcMvKoVg11Yx83IfusAMWv5frD8oxI+9BMrKPn3ISY1Bv5E1BdmoMCzpW6pQwgGv/w0t3BljcBplhoXi+gQY9CZ8g8Uwmbc/9L6BB+hKOM+K7Pt94VvZSUN1DCIbIeHon9rT5bPNk9XLrjmwxYF0z/Zbn5eAjr9GzTUQC9G7sUBKGvrKtvLrYzJx70XFpPKbqvu3dwGq1Slrz97uZTzI4byv4YlXanqMrPEnlqP0YPAfWxSOV6pFtyo2DsMEe/oORTeWDVxgQEf+N6jXPI3u0K6g8ZvdGxon73ECRUMgap1CUUSuTt5ml4qGx0d198DXPH3fXOvpXoeMUqSMSb1wM3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(8676002)(66556008)(66946007)(4326008)(66476007)(38100700002)(6916009)(83380400001)(6486002)(316002)(508600001)(186003)(6512007)(9686003)(26005)(6506007)(2906002)(7416002)(5660300002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZHweYjSS6llbStAtlU2NOx74UGsbnT9CZWQ00RCT4F8zrYHzEsj8noaoxWXZ?=
 =?us-ascii?Q?f0waaBYzdEgNJGy2SLkx9Ue+gg5KcCz5tPtMNJdFGwcYUAktDrf3mLgU1+SC?=
 =?us-ascii?Q?q3DZBF6vi1SlCmUXTYnFpJ/4yBRYP1UkP5zakbA5DbRSlSMk+No+RbuRhcac?=
 =?us-ascii?Q?nsKWK5rh/0p/+Gt+pELlGhMHaikAgH2cz+5rgchqXeM6k6evnmNFIRtFXqY3?=
 =?us-ascii?Q?e5+q5E0E2wnX6DMdr3sS9IEVz8WL31aSkwewUAOPfrH6QFUzRLv6ZOb3kNWc?=
 =?us-ascii?Q?Z/8Dlw1O7K6UknIw9fw7ByBNbChP7VIkr51AREndOZwTdRqdaSMAWydC3DKG?=
 =?us-ascii?Q?1CG5cT3ue1e7bwdk4YDgFvG+zZUyknQbYwI3K+L40zXFpkpKZfZHg1B/6uxt?=
 =?us-ascii?Q?cSdO/yZcHG3w7ceP+mSIHfSgD7/NiX6gFx/HnImo3UeYlDfmMwbarBVY5TBc?=
 =?us-ascii?Q?xrRbmPeavwEw6IaZ1Gy2SJYZG2obHzueRtAPEPnfWqnFU8EFzKVxDRhsKGI3?=
 =?us-ascii?Q?Cf1BGXI5UrMrkS710KPby/95VrLor98R3iHesPywkW8NEH2AxurMNdX4raSc?=
 =?us-ascii?Q?lvDTbF4wrFhgPsLRqGbI9kwaxjGJ0kxuMjQlaxJlB6Z9zR5ne7abbJEEyXCU?=
 =?us-ascii?Q?iAopwGuDOAJjVLXSAGNNmZ9UrMAxzz0MgcNjVD5sH7xodZsu1Wec9x4nTssa?=
 =?us-ascii?Q?LXO9gtDW2gV/Q3FqtWe1HPJDtbvSFHRLX3XfShIhiv/sGCFU+L8ZhDS95EM9?=
 =?us-ascii?Q?KWL0CGBNUOPChhfs26v3JyP+VhVbgnJy4HXkA8aNa2SHAfLfe/OgMV/Aoeia?=
 =?us-ascii?Q?fPGuL3NT6dPL9HjfAnmViDcMMlmOiRbLxNaxkM7mZuE86qaLjJUzDHHcta6t?=
 =?us-ascii?Q?MlCJCzIbXx/uYMhwvPQ3eEid42e1kIWnllENQ6AblOvgleh82Ib2qh/yqBUO?=
 =?us-ascii?Q?CqQFw6GRLmIyyrQvy/CCxvfEpdCIvbmBYGhlDMZH/yQhJDEBZT8YFLeORBSp?=
 =?us-ascii?Q?jtBtGtJM5T8LGGf/B1kwi8APs4+N0YAEpw1nskhRZMp3yITgtDMLyBL0mTGu?=
 =?us-ascii?Q?Q0GRYAhERz3ouMMICGEWxhv6Nt6K6V3a2aa/5fogDiFFp/rgXOsWoH2fJ+pC?=
 =?us-ascii?Q?G+U1jBRJCoNCq9X/4+ulFABtHsk5Qr8TCW0rcS5JfjjemSPgCHMSd1WJgkJR?=
 =?us-ascii?Q?Rn1lcdB9ekWHYWejPYUzpGgwPkfux82aN5Omqes+e4k1Yj9VVmF3p9N9SFgd?=
 =?us-ascii?Q?VLI+L+dn4oK7SZs3YAITY3NPcqsfL5LifvDNulsUVvPbAayRK93Aa4YgWCfr?=
 =?us-ascii?Q?MNiE6f7Y5iOhYnnFEmvjx5x9haf2skUoiKP/LDKQd42Bh5+ZGKUlBmOmxV/C?=
 =?us-ascii?Q?IxoMzMc5L+zM/zdWtA+u9OzvTZ1VwVyXGe6YDZfkHQ9Rz9xKN0oD46O4Pa6T?=
 =?us-ascii?Q?sEeH+UHlk3V520HdeScz4ch7NUBtwNsYeBgHBKdXZ5zWc6W21JMwZ+x1opqM?=
 =?us-ascii?Q?Z53iwFiE/LEUloiUDR7QcOrEr9qUQ72CBHDyCJsIbahAdfdx6HOZ+AbA2kGP?=
 =?us-ascii?Q?L5HZzxVDNsXw4BMjwutP2keIaH7KNu9Ypn5e991f8YzOZk7c0BjzZyjYhdKM?=
 =?us-ascii?Q?Zj3RxTFIgMjzWzB23DHyyNtEA9pV1JbCrewF7CYJkCEf9D9aC2Gy7HMMzgdw?=
 =?us-ascii?Q?5XHVUhibF6GLOlDIYOOjHiGrtJFXPK6iUwkgUnDUJL8KHJH7caQvD4uMsur8?=
 =?us-ascii?Q?rdoVguywaA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3511d01-2899-43e7-46af-08da37130a81
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 08:06:54.7903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sW5dNvIl1u7K/xdnn7m6PfaYycZBwBkbIAeH4KpabPZ0NSG+VVGPwwBziFaW1X3hmiV9Y0ntILv1zhh/vIaCeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2936
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Alex Sierra <alex.sierra@amd.com> writes:

> The intention is to test hmm device coherent type under different get
> user pages paths. Also, test gup with FOLL_LONGTERM flag set in
> device coherent pages. These pages should get migrated back to system
> memory.
>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  tools/testing/selftests/vm/hmm-tests.c | 104 +++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>
> diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
> index 84ec8c4a1dc7..65e30ab6494c 100644
> --- a/tools/testing/selftests/vm/hmm-tests.c
> +++ b/tools/testing/selftests/vm/hmm-tests.c
> @@ -36,6 +36,7 @@
>   * in the usual include/uapi/... directory.
>   */
>  #include "../../../../lib/test_hmm_uapi.h"
> +#include "../../../../mm/gup_test.h"
>
>  struct hmm_buffer {
>  	void		*ptr;
> @@ -60,6 +61,8 @@ enum {
>  #define NTIMES		10
>
>  #define ALIGN(x, a) (((x) + (a - 1)) & (~((a) - 1)))
> +/* Just the flags we need, copied from mm.h: */
> +#define FOLL_WRITE	0x01	/* check pte is writable */
>
>  FIXTURE(hmm)
>  {
> @@ -1766,4 +1769,105 @@ TEST_F(hmm, exclusive_cow)
>  	hmm_buffer_free(buffer);
>  }
>
> +static int gup_test_exec(int gup_fd, unsigned long addr,
> +			 int cmd, int npages, int size)
> +{
> +	struct gup_test gup = {
> +		.nr_pages_per_call	= npages,
> +		.addr			= addr,
> +		.gup_flags		= FOLL_WRITE,
> +		.size			= size,
> +	};
> +
> +	if (ioctl(gup_fd, cmd, &gup)) {
> +		perror("ioctl on error\n");
> +		return errno;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Test get user device pages through gup_test. Setting PIN_LONGTERM flag.
> + * This should trigger a migration back to system memory for both, private
> + * and coherent type pages.
> + * This test makes use of gup_test module. Make sure GUP_TEST_CONFIG is added
> + * to your configuration before you run it.
> + */
> +TEST_F(hmm, hmm_gup_test)
> +{
> +	struct hmm_buffer *buffer;
> +	int gup_fd;
> +	unsigned long npages;
> +	unsigned long size;
> +	unsigned long i;
> +	int *ptr;
> +	int ret;
> +	unsigned char *m;
> +
> +	gup_fd = open("/sys/kernel/debug/gup_test", O_RDWR);
> +	if (gup_fd == -1)
> +		SKIP(return, "Skipping test, could not find gup_test driver");
> +
> +	npages = 3;
> +	size = npages << self->page_shift;
> +
> +	buffer = malloc(sizeof(*buffer));
> +	ASSERT_NE(buffer, NULL);
> +
> +	buffer->fd = -1;
> +	buffer->size = size;
> +	buffer->mirror = malloc(size);
> +	ASSERT_NE(buffer->mirror, NULL);
> +
> +	buffer->ptr = mmap(NULL, size,
> +			   PROT_READ | PROT_WRITE,
> +			   MAP_PRIVATE | MAP_ANONYMOUS,
> +			   buffer->fd, 0);
> +	ASSERT_NE(buffer->ptr, MAP_FAILED);
> +
> +	/* Initialize buffer in system memory. */
> +	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
> +		ptr[i] = i;
> +
> +	/* Migrate memory to device. */
> +	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
> +	ASSERT_EQ(ret, 0);
> +	ASSERT_EQ(buffer->cpages, npages);
> +	/* Check what the device read. */
> +	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
> +		ASSERT_EQ(ptr[i], i);
> +
> +	ASSERT_EQ(gup_test_exec(gup_fd,
> +				(unsigned long)buffer->ptr,
> +				GUP_BASIC_TEST, 1, self->page_size), 0);
> +	ASSERT_EQ(gup_test_exec(gup_fd,
> +				(unsigned long)buffer->ptr + 1 * self->page_size,
> +				GUP_FAST_BENCHMARK, 1, self->page_size), 0);
> +	ASSERT_EQ(gup_test_exec(gup_fd,
> +				(unsigned long)buffer->ptr + 2 * self->page_size,
> +				PIN_LONGTERM_BENCHMARK, 1, self->page_size), 0);
> +
> +	/* Take snapshot to CPU pagetables */
> +	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_SNAPSHOT, buffer, npages);
> +	ASSERT_EQ(ret, 0);
> +	ASSERT_EQ(buffer->cpages, npages);
> +	m = buffer->mirror;
> +	if (hmm_is_coherent_type(variant->device_number)) {
> +		ASSERT_EQ(HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL | HMM_DMIRROR_PROT_WRITE, m[0]);
> +		ASSERT_EQ(HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL | HMM_DMIRROR_PROT_WRITE, m[1]);
> +	} else {
> +		ASSERT_EQ(HMM_DMIRROR_PROT_WRITE, m[0]);
> +		ASSERT_EQ(HMM_DMIRROR_PROT_WRITE, m[1]);
> +	}
> +	ASSERT_EQ(HMM_DMIRROR_PROT_WRITE, m[2]);
> +	/* Check again the content on the pages. Make sure there's no

Very minor nit-pick, but if you happen to be re-spinning anyway the
comment formatting needs fixing and a new line before the comment would
be nice. Otherwise:

Reviewed-by: Alistair Popple <apopple@nvidia.com>

> +	 * corrupted data.
> +	 */
> +	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
> +		ASSERT_EQ(ptr[i], i);
> +
> +	close(gup_fd);
> +	hmm_buffer_free(buffer);
> +}
>  TEST_HARNESS_MAIN
