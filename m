Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D88052F4C6
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 23:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C19610E329;
	Fri, 20 May 2022 21:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD82710E146;
 Fri, 20 May 2022 21:06:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFPfxsSBJ3t+SsLyNQISUHb/R+BFvETjtx/OBFuPBRtkLL/vnomhqqYrIMRi3FxQGPK6Z8NDhX0qFmfStIvue5ZoZfn51LLhaDExh+xl3BVIptdnWuCrwmQrDm3UQWHseGbDYuuc5GUj/ZB41w6SsGWwF9+BCEL8uGblryfcEPXdzFqMPT26BjPt3Qdfn5N2AzY666BBZAmN1cBHAI3cEJl+L7nl82+NVaSznob+rNs6tXmLzYTRneTy16PAtQML6mFDc79JHZD+4XkOHne7xEtBqigLV7FzvBw7ZZ0Wmz9bIVvaVpc/RalYTHhW53yYQFHIKku/RlwQpGIu9M6Gqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1QdG9facp3hBuB9hy2EfGGZJ5FaVEfudHoNhwtDZL8=;
 b=k8pUQX3IulOUwyrAYEiAfbsgSRrSxAdOoQPVI9tdaMMOk09yBUxlG09mhUO9gp5TdnJAT6Fip1gEFzBgGNhxZIQDCh1UIgPBfreQMSw94mWJqaUvNa6vkZmZfWjvv42ZKTEjdvFZ+GYTtkeEkQFCLP8xJoDR/IrfuahmakHytq0OU/5mvAoxncBks6w25Oku6AzdizH9GndgdkM6ymTGGqZ7Sdrjd/CFIn7e/vJyNKB2HnBCh5pELgBAY4gsL5a7gvhfrAKspuEqHuS8HKtcUd8MGTy7IhvE5rXneauN6nOpClZYyNKiKNc75wXjNLTDcoZVUumN0+Z4BTAQuzxDFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1QdG9facp3hBuB9hy2EfGGZJ5FaVEfudHoNhwtDZL8=;
 b=kfTc0GKX5IfjGzUlTxF2AayfIOa3loBIgoE61ccHvGA/kHBRY2srKz7wEKSFZFpvloWY0Qv2cE6oWiMmomP6zU7gl4NAFWFgGQO4Muy1qbu4JJylO541KsEgmSxKDBrH3dsPqxR4dSgikfbP4UQyRZ9hXGHPqbROZ2TJ056YGfA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DS7PR12MB5765.namprd12.prod.outlook.com (2603:10b6:8:74::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 21:06:38 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::1cf6:2a9d:41d6:e8c3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::1cf6:2a9d:41d6:e8c3%4]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 21:06:38 +0000
Message-ID: <b4ba75f6-88a1-5e63-5228-dbbdde82bb33@amd.com>
Date: Fri, 20 May 2022 17:06:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 12/13] tools: add hmm gup tests for device coherent type
Content-Language: en-US
To: Alex Sierra <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220516231432.20200-1-alex.sierra@amd.com>
 <20220516231432.20200-13-alex.sierra@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20220516231432.20200-13-alex.sierra@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::29) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b2364a3-4408-4247-272e-08da3aa4a0fd
X-MS-TrafficTypeDiagnostic: DS7PR12MB5765:EE_
X-Microsoft-Antispam-PRVS: <DS7PR12MB57650F98ADD15273760389DB92D39@DS7PR12MB5765.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 34/X16/Jid8ugstLkjDw/C/Ldh/pAEf6j5d9PhkdNHc24MjwE/0uZX1FCRWj6xxTx5xxe0dnqtV7HKcYAVUwh0UfZol1cEtTWQk6+SYxdEPMrPL+kDC/uvf7x15H+Dqk5QY1vgrLKyTvq9dx7FLbsgLOKK4InrCVI2/BkLODSHB0e8rZXQbIsLh0plSYRvI4qFewf1/KHy1HBTt3E6Pz8+RY5axMQPXXAzAicEzPBExsPLWUI8Rh1Aib4xL+dVHfkDdzMZbMJLWQbpwE1zzys0N/uPbXflMDw44LgiE0aNBKlWQGa2z9mQWWeleDHbtNI4JY3G0XGFvhWJtF/Wi89T90PKhVulto2MMcW7/Gojz/qhgF/GcU2DEANEKG8lV4Cdo9QiMI5elCMuloFjq5/QflbihPOfjdIjutAOUDcIhdZLXGAcqV0IvCnKxoB4XDAFSuM3ADyKtTEJghQiPj03WAV3VAa6saq/2Rcqf9ymavfLHZ1QygKC11TS45QIWcJbjPX1URhuI9m0Z2oZ60b0+MkcNmUI2iiIpdu6nECe2ZR3Uefz4eLpzXl6vkMOJ6/oOUhrGk6yaV/F9MM9mpsfu3EP54mi9Qgkdt5myfbeHjJsfWCpahTh3whQpu3xCaacGslDdDiZ6RE6l5OhOXNHupf4VBtagLbC+8GiOL9hVIEYtsLBzyiQIG3qsd8wo0tymlcTPzBQaR+lnVHybw02LD/wScAaY+6+kxF/kgp+s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(36916002)(186003)(44832011)(83380400001)(2616005)(31686004)(2906002)(6512007)(66946007)(8676002)(4326008)(316002)(508600001)(8936002)(53546011)(7416002)(5660300002)(26005)(31696002)(86362001)(6666004)(6486002)(6506007)(66556008)(38100700002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm1kc2EvWGprNXpVVjhpWms0NUgyaE5UbW51TmdBeVh1am5YYWRyRUlVZ2Qz?=
 =?utf-8?B?WTQ0MmFRWTlWZk1Kd1laN3pYdUlFZUlPN2l0WXFILzd3Um9scW9DdFpwcExQ?=
 =?utf-8?B?MkU4Z1FVTVBRMi9sVU9xcHZVNDROTUJncjNjZ0swMW0ycm4zSFVQQlVMbVh1?=
 =?utf-8?B?SjZuWFFPK1VXRXVTa29xcGVWZkJETkhOaTBPZk53WXhmaFVjcXRMWFNoZ1FN?=
 =?utf-8?B?UTU2aXRJd1hMMWcrRmJ2eU9teUNJSEo1V2xGa21ZWk1PZkEzeit5UnFuMHFw?=
 =?utf-8?B?bVNZS1FZUHNnelRHMDVGQ2U1aDVNNVRwczBuNnRhU0hVdVYyN042SlNjN2Jt?=
 =?utf-8?B?aWxXSjdNdXpKbnlRNGhEdUdvUzVwekFoQUV6dUxiRWx2S1dWR0NhTFhVdUZ6?=
 =?utf-8?B?d0ZHd25jbXBsRVJWWU81MWFQUTBGZnhBVE0vTnByOTZDOHViOENaRVNKbEU5?=
 =?utf-8?B?UFdqK0pibkY2MGFLVmdiQjVWMDUzOHhrWU90TFl3M09jQlc4cGtYSk1VWWxH?=
 =?utf-8?B?VktuUXJKT21Kdzk5WFRrSGlSSlBpdHNYbEN5N3FwR20zTnpocW1ySEVWZ2po?=
 =?utf-8?B?QnVSTy9OVHZFS0grcXFMVTB4RXc1elF2L3ArUmdMU0pwOFQ0SlJBY3Y3aFRY?=
 =?utf-8?B?WFJRd3Ixc1A2K1JHQTVjL3hSVnhuRTNCQnhETWRQY1V4ZzhQYTd1T3VFZUxF?=
 =?utf-8?B?cmo3RlhJU3k2T1VadVRBOUJoREdJNDZPeEJhSmx5QzJ3eTNia2VkVkFLNjkv?=
 =?utf-8?B?eDJuZ3VLU1hlK2JIdnFwaXE5Z0tZdWN6MjJ1ZGVBaXlSMnNCeDlVbjB4SEhx?=
 =?utf-8?B?TjlPdW9uMjJBc0w0Vkt1YXd1VXJPNzlhMDBhSXVvZVZwWHNITkF5N3VmRm9t?=
 =?utf-8?B?UTZiZjlVcGtkVzBwdnZEaUNTZGZhazRNT2dFeU1KU21USHJySXNkSjkycU0y?=
 =?utf-8?B?NGRrL3NibVl4cUtrRDlNdzF3TlgyNmRRL1hITEttb2RlWGozd0ZDRGZVZGdH?=
 =?utf-8?B?VFpsM1pZaERscTVoWTlvQ09qeFRrSCtNUFZUamNxNzVGaXZqRStuUVRzUmRX?=
 =?utf-8?B?U0gxNWFQWGxSOUJiUytrV1N3VS9GdjNVN1UyZG9acGFpUWZIdGwrV3pLSVZG?=
 =?utf-8?B?N1pnUzZLSkZMM0ozc1V2YVlKYUVmRVlOZlVwc3NEWURmVXhuVDEvSjVEV214?=
 =?utf-8?B?aE9tY3lTUzBLWWVpRWhDUDNWc2l4R0d1L2dOZ0s4d1A5TVV0UVR2QVZOK2ZW?=
 =?utf-8?B?RHRpbnpRTXlueTlBL0duWU9GV255YmZoOS9HNkluT21XRC9JSllBa01NL3hv?=
 =?utf-8?B?WjZSV0lVb3BFOWYzOXFHT1hJWXRySWZaVzVPVTdKcEx5TjloOWwrbnRPU2Rn?=
 =?utf-8?B?TnBESUFGMHErL3I5ZGtYWWhiVzAxL1F6aCtqSEpNWjNndFdFTE51ODRKWHJX?=
 =?utf-8?B?b1VCSlZaYkgvSkc1M3FXV3l5eU1pVkVLdHBZYkJxNVRKeHovclE0WjRMVjBU?=
 =?utf-8?B?SG0xaUhXK0F6WjBuT2tINkVPV25uNW51MHdwd25WZ0dqcHduNmFsbkV4R0kv?=
 =?utf-8?B?RWNvTmp2eGxEeC9CV3hPVmYybi80aWpaSEJIYXdVZkNUcFpuK0VFTG1DRW1l?=
 =?utf-8?B?alVuQ0pKWXFHTkFRaXRpanlhU2NxRWdUdHJ1VEs0bUdqL1pIK0RNdGxpQklK?=
 =?utf-8?B?RytNWnd2N004Z1lFUXZrUUZxaG9va3BFVVhQWkpHU1N1REhjcVBlaWdMZFdy?=
 =?utf-8?B?d0k4OW1RcjVRaGFTMklGdWp0eXE1NVN6RTRwN09pQ08rR2hycGt1T0IwbDBo?=
 =?utf-8?B?UkluR3V1ZEFTcmhZSTAzbER1aVUwdERQRGRmSm91TU5qeWtkT0xwcFFQa0J3?=
 =?utf-8?B?VFcxbk43c2ZHY2E2ZjNpU2I0d294UkJVWFE2UnZIN1EwV3BjcHpVOUtuOXpz?=
 =?utf-8?B?a3hBZWw2V2pZRjljS0VrSXlyZW0wZHU0bWhVUXIyYmZtWW90WldEcDI5N2Fs?=
 =?utf-8?B?M21XVHMzTm5CeER4RnZkUmNhZTRyNnJPc1k4UnFEcnIvajAxZDY3ZmszR3Jn?=
 =?utf-8?B?ZzQ3M255Y01TemU4M0QxY3UyRlBnVVRITlVnNWFwUzR1a2t1ZlR5ZHJ5V3JC?=
 =?utf-8?B?cWowWWI0R3E2L29NTzlkSVlWQTFQUm1pbFYrRnBBQWtwQStQMFgycXFvZy9u?=
 =?utf-8?B?K0pleis2RFExVGlSRU4vUk5iOFZVaFBGWXB6S1VLRnYwWnZSNEVQbnZKMnN4?=
 =?utf-8?B?MHE2TXVwYTVqQ2M3cEpaaTNwamJ2VjdkVzdOczVHRTB0ejVwVkx3MEl1WTds?=
 =?utf-8?B?LzhuT1lSbUZYRlQ4ZjdLbTVuRkZWZUVrVmJudUovTEVmZFp6NG1Mdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2364a3-4408-4247-272e-08da3aa4a0fd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 21:06:37.8057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYu2NI/JdfJl7J4dg0/P9AST5mhqI6y7Wa6YzfoCuNwTjTXdTmns7wk1vsFLHm5j2mMNk8aIzvtzvjAGQVRhAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5765
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
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-05-16 19:14, Alex Sierra wrote:
> The intention is to test hmm device coherent type under different get
> user pages paths. Also, test gup with FOLL_LONGTERM flag set in
> device coherent pages. These pages should get migrated back to system
> memory.
>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Reviewed-by: Alistair Popple <apopple@nvidia.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   tools/testing/selftests/vm/hmm-tests.c | 105 +++++++++++++++++++++++++
>   1 file changed, 105 insertions(+)
>
> diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
> index 84ec8c4a1dc7..61a02a6a3dea 100644
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
> @@ -1766,4 +1769,106 @@ TEST_F(hmm, exclusive_cow)
>   	hmm_buffer_free(buffer);
>   }
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
> +	/*
> +	 * Check again the content on the pages. Make sure there's no
> +	 * corrupted data.
> +	 */
> +	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
> +		ASSERT_EQ(ptr[i], i);
> +
> +	close(gup_fd);
> +	hmm_buffer_free(buffer);
> +}
>   TEST_HARNESS_MAIN
