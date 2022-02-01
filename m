Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 330F14A5FA0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 16:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A63D10E1E6;
	Tue,  1 Feb 2022 15:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A347810E18E;
 Tue,  1 Feb 2022 15:09:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBDWeOoD3NrYvoGh7ZCjA1wRMp10a6Cvm/h1CPYxRsigMseJ8ziLizdMFetrI3VtOl8dcG1fs9rFSnvXvN0zwyleMVrlp0trdjB/jBnywgx0zCWzMZbiPSEgxLv5njU+Fw7TRwrDdmxbrg6Q3kPgY3Uhp/G19Mk1E4080zt3IDfHVf/NLED6QtHzev5lYVbgC01DCWr7m5ieFQ7PzmRCDRvfLfv0Tar8Swq9OdlyCSl2b5lx+NGrHoVMiK3gkdcFOEtf1lmlMsMy0zC8P7KNHA9tNNQucPLDQ+quSJ3YVJUIYpK2HA3415fQzGvnvmCkXI7a5K/K8KE34W8IxypW/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q88mWt5NJB0r/DdCs6HANSqAFYCGyfTIsAJ5BPANSQ0=;
 b=JQdYoRY6guaBcXhuJk3e6RcSLg7hPiVHoHN22FKumFgxT0aAiF4fWMJU5Ld83uDFaFWpwRNFEdrd5kmRv8VWkD2+gNKfqaRT7jwL0jfuS/PWoS5XNdX/M/AZri4wtjAuxThqOvUw1TzivDdjDKcMmDhk/uTYucA39YDNqfkZuctP9ANuZ5XG5BSAztvNDHAEOEROhF4itZanFvhse4G1QHI5qNUdFdyIiAL7/KWXeIvtJ/wNnXf6cckmqAJHIRGBUm78yBF7dQkrjfw9bVEoli2m6fKo10vJgFTFvdD/tY9m5eW1ABPK4iLM1a/+wOhvWAYizlRZs4uwqYzPX7bZFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q88mWt5NJB0r/DdCs6HANSqAFYCGyfTIsAJ5BPANSQ0=;
 b=cJp7Dxiv43sXxZmvjS3DN9++A3I4gi95799VGkdqLF6UiPd/VrY7sIz9uKzEGf/wQyFaPKUsFSG/KXTLG52uSHQ6DwGRzHdy62OlV3diq+zEqOPJdLEKOlRfv1+fjQiMbRNXBZRvXvOSCwBVKjb7Ji5B3SER2G4Nm2MoDZbQhSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM5PR12MB1930.namprd12.prod.outlook.com (2603:10b6:3:10d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Tue, 1 Feb
 2022 15:09:16 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 15:09:16 +0000
Message-ID: <f3cf5158-c39f-a707-a896-bef39e7ca9c3@amd.com>
Date: Tue, 1 Feb 2022 10:09:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] tools: add hmm gup test for long term pinned device
 pages
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
References: <cover.516a938ce97eb805791da6e2df508eb0dce413b8.1643698773.git-series.apopple@nvidia.com>
 <d400bc4c874ff211b8520c51930b5ab78711454a.1643698773.git-series.apopple@nvidia.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <d400bc4c874ff211b8520c51930b5ab78711454a.1643698773.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::28) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec1bf838-97d4-4c33-db3c-08d9e594d02d
X-MS-TrafficTypeDiagnostic: DM5PR12MB1930:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1930B9B3B8E6097C2BD6413C92269@DM5PR12MB1930.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RHQ1tuBVkWtJqkQlrOBOoURwFAfFul+fSGYjTXc2kqqjzb5p0mhMbJZuHdtshOUuNgeVnqd2OW82PeK2KmDKa/Ij6N++FxZoVIF/cBNVucygj8fuAyygLw7y+mBLoEpme0rU4W0cY70vLePCrcyJj03HgQ6/FWD9gBj+YDSyrUx7ZulRWlX+sXuRau2PifeNFVW0NEA8C6BkKd/72ZqCGM1KFrAjjD9LdNWDoifW+0kTh9HvqnFPEevxXCW9fh3xfDJzqiw/8OtAnQKw3Zn09v/c/9k5FPEtubsz2lQ4HqTb8qF7s5drYrHDM6b4+kACpjW93XfgAMg2MDcNRb9efXD2OCZfbNr9u3a9k6J6VgVynHN0ZfE4zeAA4CDs4yh6z+nmjmI5kVQHPcRAlbVCGjHfC8vctS76EQb2hxR4Cp+VDYDmAD/2lQ5/hslfVUERnwGB24OpNFuDI2/m0KaEzYPvahhVMOlB+tn+8bVK/dMe/U4yVYv4ft3vjnzCNgHmsy0rUIOFJII5rnJjtf3POuJSdTL2EvS8xPZqbVJNCCzrIDPD+BSEnJ1veuyn39w08Om2Xq8po1Zq6cPpeg2dI1a/HwLBdqtt+9wVnA0cTWkCaUc/vDno8y3bqZSpfSthVyULm7IoxBffWxr01E+fI0tZupSjlQIvTyEamWUVfaIExss8sgR35Qw7gsTAsw0zFH/VKxvcsKC8EN4FT0LcVkQJNkLDj6aYVu5Dbxjd0Pk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(66476007)(508600001)(31696002)(86362001)(6486002)(316002)(31686004)(38100700002)(66946007)(4326008)(8936002)(36756003)(8676002)(26005)(2616005)(7416002)(44832011)(2906002)(6506007)(186003)(6666004)(83380400001)(6512007)(5660300002)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3J6U1YxTWhkclZJUUd3bHVRSm51Wkx2WVZ5Uks2ZUVsU2xxaEgyVWUxUFhw?=
 =?utf-8?B?Nm90Y29WU2czV09iV0d5b216bGpqWjI1SGFaU3hNZG9HS2plc25rV00zaGh1?=
 =?utf-8?B?bGlIa2g0V0wzdkplQndSSG1oQ3FUSENXd0Q2amlMNko0VThOaWd5c2luNEJP?=
 =?utf-8?B?U0diSlNzQ0dsSGkyMDRxdWo2VFdsaTA5cnBPV1EydWVOalF0M2VTeUpLNFRn?=
 =?utf-8?B?NzVIZmowUFFxWUhUSWF2Y1FnMnlIaFE1VGQvVGVMUFlLSS9rYjBhRGVhZzdh?=
 =?utf-8?B?R1NTZERRMTliMWlBVk8rQ0ttUHE4MjUyRDc3TE9RUUxaTmZXTG93UyttUk16?=
 =?utf-8?B?SmhUTzRvay8vMkpoME9DN25OVWYvWGRWYnRBV0o0d3Y4eHdKZ291ZXlEUUZu?=
 =?utf-8?B?YkhrUFZlOE9xSEgzeEtOQlhXK1JHdDZkZkFFaktiOFhNMkNmdEpNdlNwbFc3?=
 =?utf-8?B?ekI0UEVSUXF3QzZtNUlpcEx2WG5kTGxBb0N6YmcxWVdUemZJRHJpV0c4blN0?=
 =?utf-8?B?Q3cwNlBpWXBaYW9peFI3WTdmdFo2MzhoeVp4UXZFdjNsMmFxa2hudlJvUFd2?=
 =?utf-8?B?YnE2bkFxeUN4MUlZbnNhd1MwNlVLa3M4OGR2dElPN1VNOUtyQUxwSmFZbzRD?=
 =?utf-8?B?Y0RTdlRYNC9jcld6WUxwMXNxTU5sOGNWM1RRNHVZN2FrN3pZYkNaWEJKS2dU?=
 =?utf-8?B?eitNMDF5bWNZcVRQaTlPWE1ZTU51NERMMUcvL0FzSFNGUFIyYVdWalJtL2lX?=
 =?utf-8?B?a3hIT3hNdURLdHJJcUdPMDhtMDlXSkJqRnN1QlluSFJZTnd0MVBTSWdTVFVn?=
 =?utf-8?B?WlRLQ3lsd0pIRDl6TnkwTGY2YzQrZjZGbjgxL2V6WnFzU0FOVHBoMGxVTFpH?=
 =?utf-8?B?QytXdXZ4VmZSd0hHM3dUU2ZtMW1FR0ZqWU1WcGloNUxTMjNOMk92MjBHNHJu?=
 =?utf-8?B?VlJBWjFyL0dSRG94Z1ZRNEZTZS9zZUoyOFphb2FqUmJhbC9XQ0pIclJtclNY?=
 =?utf-8?B?Q1MySlg5SUxMYVg0dXo0ZVdObGhVang3R2VJK1hGdEloQzM3aG9pazBkV203?=
 =?utf-8?B?UllscGl5bDJ2N0tjVXI2VWxVVUhPVGV3YXZ0bC9wVjBRQmxwU1Eya2V3WkVI?=
 =?utf-8?B?dW5UdHJTdGY5dlpWN2toaTM2eUplZnJLNWpvMjBtTXVxYjVtTHp0MGY0MXYy?=
 =?utf-8?B?bnVBV2hoTkhIN2JWK0gvS3c1cnlWY0wwWXAyQ3BTSXNCMWVlNEk2akYxcnRv?=
 =?utf-8?B?c1VhTDJxcEhLLzZwMks0clNoNXFnWkJoN09JVlNtS0EranR3U3FwbVhQTmhj?=
 =?utf-8?B?UFZXbEI1UDJGbG9HMk9nRW9wWVc1Mmpwd25rRGxjNDhmSnBxWER4d2syNTBw?=
 =?utf-8?B?WkpUNzJGZTVKMUwxeG9yeGowVW1vaE1KeTVJdHVKbUtCNTFVaitFVm5GSXZE?=
 =?utf-8?B?R0R1TzNYRzF6RTlzUHRVOXBwWnc1YTZLZDdmcGpvVENiTnA1L0lLcGR5ajht?=
 =?utf-8?B?dXdRS2MvRUZlOWxuOXNvUFFnVWd3aWxpVXNHKzhkZ3V4aVo2bkhyZlFMQ25t?=
 =?utf-8?B?ZkpmSFcvR2dseVQvSkExZm1OUGRMZnd6b0tyZ3JrL0VrUkpYUTlsZ3p6dTFT?=
 =?utf-8?B?ZG54SWdaZlZWNS8zQ2I0cDh2QUprSHlxQXA2ZmQvazhBQVdYVHh2RDA3Q1FQ?=
 =?utf-8?B?V0VhUTRWWGJsYWxPWWJHY3EyWVpNbzBSTEZjNU1PU3c3OUgySWltYXFMNTYx?=
 =?utf-8?B?dDFTY0c2SjYxNGV4T0VDbTNGc1hWQ1ZEV3A4OFBrTU1yQytDSDFOR1pNT1Jv?=
 =?utf-8?B?eUhQMWNYSWcwdnFuMnBHSXFSaVdvQVR6NmErSG1SYnlmb3loL3BwTWFBWUc5?=
 =?utf-8?B?d04yeEZzVHFyOXVoZVRuWHZFOHAyMWwvT2tENHljSGtqWml4YU1jZS9hemVv?=
 =?utf-8?B?aHZPUTZ2eUV0M2F5eDJSQ2xwdisvT3dYRVdrckVmd2t4d3ArR2FNMm9jZkh0?=
 =?utf-8?B?YlNqb1NleU9tSUMzRDJySXNOeWc3b0VnKzAyOGJCbk1PNFI2MDlkcUdOWHlm?=
 =?utf-8?B?cFRUK3BCYTUwS2ZNVTdUMVpVMWhQanYrZk8rWkphLzNYNVovTkNyMXA4RDlP?=
 =?utf-8?B?QTV2bkcwUm12MmdkcVhTT21KM1FoNWEyK1E1SnVYWHZrcytnWlJZaDRETEUx?=
 =?utf-8?Q?FFIzQWQMOTdrpgj2udRsi0s=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1bf838-97d4-4c33-db3c-08d9e594d02d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 15:09:16.4588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRe6l3jOUcVEpfQTSWRCAbVnrvgQ5Ej6hDOB4PZ0i6pyUVueZWIGwRE6TUO3wxDLkDvPEHQdoMXhM7Pq4WvWyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1930
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
 jhubbard@nvidia.com, dri-devel@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-02-01 um 02:05 schrieb Alistair Popple:
> From: Alex Sierra <alex.sierra@amd.com>
>
> The intention is to test device coherent type pages that have been
> called through get user pages with PIN_LONGTERM flag set. These pages
> should get migrated back to normal system memory.
>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

This patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   tools/testing/selftests/vm/Makefile    |  2 +-
>   tools/testing/selftests/vm/hmm-tests.c | 81 +++++++++++++++++++++++++++-
>   2 files changed, 82 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
> index 1607322..58c8427 100644
> --- a/tools/testing/selftests/vm/Makefile
> +++ b/tools/testing/selftests/vm/Makefile
> @@ -142,7 +142,7 @@ $(OUTPUT)/mlock-random-test $(OUTPUT)/memfd_secret: LDLIBS += -lcap
>   
>   $(OUTPUT)/gup_test: ../../../../mm/gup_test.h
>   
> -$(OUTPUT)/hmm-tests: local_config.h
> +$(OUTPUT)/hmm-tests: local_config.h ../../../../mm/gup_test.h
>   
>   # HMM_EXTRA_LIBS may get set in local_config.mk, or it may be left empty.
>   $(OUTPUT)/hmm-tests: LDLIBS += $(HMM_EXTRA_LIBS)
> diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
> index 84ec8c4..11b83a8 100644
> --- a/tools/testing/selftests/vm/hmm-tests.c
> +++ b/tools/testing/selftests/vm/hmm-tests.c
> @@ -36,6 +36,7 @@
>    * in the usual include/uapi/... directory.
>    */
>   #include "../../../../lib/test_hmm_uapi.h"
> +#include "../../../../mm/gup_test.h"
>   
>   struct hmm_buffer {
>   	void		*ptr;
> @@ -60,6 +61,8 @@ enum {
>   #define NTIMES		10
>   
>   #define ALIGN(x, a) (((x) + (a - 1)) & (~((a) - 1)))
> +/* Just the flags we need, copied from mm.h: */
> +#define FOLL_WRITE	0x01	/* check pte is writable */
>   
>   FIXTURE(hmm)
>   {
> @@ -1766,4 +1769,82 @@ TEST_F(hmm, exclusive_cow)
>   	hmm_buffer_free(buffer);
>   }
>   
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
> +	struct gup_test gup;
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
> +	npages = 4;
> +	ASSERT_NE(npages, 0);
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
> +	gup.nr_pages_per_call = npages;
> +	gup.addr = (unsigned long)buffer->ptr;
> +	gup.gup_flags = FOLL_WRITE;
> +	gup.size = size;
> +	/*
> +	 * Calling gup_test ioctl. It will try to PIN_LONGTERM these device pages
> +	 * causing a migration back to system memory for both, private and coherent
> +	 * type pages.
> +	 */
> +	if (ioctl(gup_fd, PIN_LONGTERM_BENCHMARK, &gup)) {
> +		perror("ioctl on PIN_LONGTERM_BENCHMARK\n");
> +		goto out_test;
> +	}
> +
> +	/* Take snapshot to make sure pages have been migrated to sys memory */
> +	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_SNAPSHOT, buffer, npages);
> +	ASSERT_EQ(ret, 0);
> +	ASSERT_EQ(buffer->cpages, npages);
> +	m = buffer->mirror;
> +	for (i = 0; i < npages; i++)
> +		ASSERT_EQ(m[i], HMM_DMIRROR_PROT_WRITE);
> +out_test:
> +	close(gup_fd);
> +	hmm_buffer_free(buffer);
> +}
>   TEST_HARNESS_MAIN
