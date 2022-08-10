Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A6F58E9F2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 11:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EFA9FE23;
	Wed, 10 Aug 2022 09:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35DD8A9D5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 09:44:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEDhHOD5Yaot7B5wUAfOWUc017/7y9y4ify8vB1c1DTy+bYa1nZq5zcmyu7p3AaTzk8YRQPyomrZjKeCishyc1iXnwZoIDcWp7hQVtX5ihItGEbt+9GdwzwIQ+GAh0sA5OIdfvdYBzKgqIPRPsnejcgv7ym+m/wllVst/zHfo5lvaxQtLVbE7NCn2lA0bGyeRnsZBqJCxgJv0SJUhfL7LVHmW2PT5KWoWDn3qSQ8ztJvNYzOJAWNQqLlLqPgbtep5joUVp+UQ2pLBPtuIyoTYFmNZ7A6a2bHubfY+ENrsqgKb9m5xTivhXoBCxxOQMtPQ0uWmhySJQdyF+QWB10yuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/eZtaQo1oyYnYls7zfOUZQbr6Xmf/TSMbihjf2IXtQA=;
 b=VCE2Dh9Ea9Gk8yOZhJjZ5Nt6O6+Chk79Tkd++t15Rr8oMUACv2yAutKvrA9ek3npMdHXLJ5K5U9dCp/2i1XL6E0PWv4NS92BI7QYGu/xb3w3twyI4t+2g9bVkYJ5U2zPuU2A09yGPpHib6HdcderoKQxZhAMQKl4y9EDZaKoljbjtnOrQfe+BE3vjt5klLcbuMF3WLxpWoFp3sug3G8+Lx8RG93sz8ZIDV1bhyKd++Nwhf6V7MAxqphHXmvfPttRRxlcSEYgO7e7hlL9xHyszp3T4CVmpYqqVhkN8e6vJMx0eztoM23elmjmcUzkG+RQQ4gNvsVxl4Z5XnMYjw9tbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eZtaQo1oyYnYls7zfOUZQbr6Xmf/TSMbihjf2IXtQA=;
 b=xy6ev7YhmEkYxQtFnCiBNQx6i7P9dkL3XvUJODv6BaC1Ki/NcXm+RwzwcpPjOkLfl5cz1j+FVKUfocb3Lc7qW5TPDidCC+0He+pe84HLUyyIcgThZNPIoe1PQ6i6i1Ar3zmf8t9G0YQVdxZY1uQtuELP9BEChjloEtRh0RX5dFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR12MB1779.namprd12.prod.outlook.com (2603:10b6:404:108::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 10 Aug
 2022 09:43:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 09:43:57 +0000
Message-ID: <dd1f0190-5c20-8b48-5092-7364a2ce3a75@amd.com>
Date: Wed, 10 Aug 2022 11:43:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf heap support
Content-Language: en-US
To: Olivier Masse <olivier.masse@nxp.com>, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
References: <20220805135330.970-1-olivier.masse@nxp.com>
 <20220805135330.970-2-olivier.masse@nxp.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220805135330.970-2-olivier.masse@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0111.eurprd04.prod.outlook.com
 (2603:10a6:20b:531::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 346daeb1-a7f4-48e7-6781-08da7ab4d845
X-MS-TrafficTypeDiagnostic: BN6PR12MB1779:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BFTzH66/haZznDDTfCPMsWLNPQ4R+niHaloL5Iof4/7uS4v7AXPPxfOjfn2y8Wl/FGL6qz3royH2duRKG5ispWmheUHhiL2BE1cNwW4KgT3LHeMs6+ElNPZCA3DIjjKHcxjhufP8zJ6nVctNFr3zn3rf87XoERpW4JXv644x8lr0OlUMXuc8wGZ1MD3/q9RbUSVrIfaX/i1yLYk9pu1B601M2k5NsBatLj8tCJtlPIvIun54UfJl5rEzK+89n65eQOluMsSPagIzjaYGaMafP3k+wYcNCv8u/sXm+s4rIKhtwmUQUhaDxiuaBlqHu75KsBPYia3BRC8xUdZ7ieAwujHvN7SIcEZoT5cVujWIHzTfUuB6FidJ9Ei8Hi25k7Rbs7hHwl+3jyU8S87rgfS4XFX9zxoDHq7kSzuUvU4KYQH9mswmybFZcUK6boNk6cOTXCbksGAHie9YUfWQ5//31/gVirTpnGMHmV4TtV7WNFaUdsFZBOs5MJNBa7Bkp/54QWgM348Ba0mfWaZea+V53Cvsfo2D+6CwKoHMB5OZzjTj+rzqP/cVItYUo+JzWytpyaXfgcVHLvgAGDhX9IFMSRB77mngn89Mn0m5CxaWT1FAiJIFD9u46K6LQjkyEYBianqzjfgCeEDz9PXtsIdgkRDx6UBd37kmhTwSgvNkL91KM9H0qrYKWxskHBNUfc9D9m6aBL5DNjWXTkF292ALs1TDcvOR5aSWzNnTbUxn0bcestHDpI+Hm+5XYlacjcO8IDImA6vz+u9zrWWs+uYTcJB3pXbv7+pVC2tVTKYYBwyeIgfmBdCOSya2wL+vujXF/0/eXeKZ4UDkiPZqq142zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(4326008)(66946007)(66556008)(8676002)(66476007)(8936002)(478600001)(110136005)(31696002)(86362001)(36756003)(6666004)(7416002)(30864003)(5660300002)(41300700001)(2906002)(186003)(316002)(6506007)(6512007)(38100700002)(31686004)(2616005)(6486002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlRnNWFTanBUbmtDTklrR2xXLzViK2FnYzlGTFZSMVVMTG5hY3ZzR05iT2gr?=
 =?utf-8?B?MFRzVDI3SkV4ZXZ0MldxdHY0S1JqeGtNREFMN0lXR1dnOXNtSDkvN1AwSE9u?=
 =?utf-8?B?dVZxU3FxZm81WmZTWHdrYmtLeXZKMWdpTDB3OTVMUUFVaThjK2V1eC9zaW4w?=
 =?utf-8?B?bVN2TkJqMzVrOTBWME5jZTBBc2NIRE9Gc3FMa0FjN1pycmVWdVlqWUViWWJk?=
 =?utf-8?B?ZHFrU2paNWJXdDlPN1hWZ2t4WXJVZUEzM3pPSjdhaTMxTFN4ZVhJaGh5VmNw?=
 =?utf-8?B?cW0yWlJPMHJ6NzdRNk44V3BPMkdqQXJLUXp4S0JUUXMva1pxbldXWmVxMnBD?=
 =?utf-8?B?QkZGK0ZXUUtkYVBMeWRJaW9RaC82bk1VQjQ0dE1ISEFqdUswYlZLSzhmVkRv?=
 =?utf-8?B?dk4wSWYyNWo5Y2hJZFoxV1Y4ck1hVTlNUEowVG5nT3BqbkZTbFlCTkZSbkl6?=
 =?utf-8?B?T0trb3ZqczNIT2tPY1pXU0F0VytrOUZ2QlNLRTI5dW9TNGt2c2JRZjFIMkoy?=
 =?utf-8?B?VWtYVjB6KzYzVzdQQmR0dWVQMEJpc2xyOUd0aFJhUTNBMWIxVHRvS2J1NzFG?=
 =?utf-8?B?dWdCS3YvR0dSc1lBZFAwNHpaL0RBM09pMTB1VlB0MFU0SjR2ZmtnK3UvK0Vn?=
 =?utf-8?B?ZHExVmd5T0c5MnVpTGFNMnE0NHVIMVFrZDV0SEsyR3JEdXNaVTI4T1Q3L2Jx?=
 =?utf-8?B?a0c1TnlMVmd4M3E2RWhFRzM0RjlHRXNjNXZSQ01neE1BQkpGVkRMR1lDeisw?=
 =?utf-8?B?MDA4VVV0bDhKaU9tc1NuNXhZbEJaSFNWQmVNUjZPWVZMMjJlTTVJN3RxNmZm?=
 =?utf-8?B?TExJWXNUUHpTUEp6QjcycTBJUlMwUEhZRjBjMjVPZ2c5NmRzQytZUGt0c0pY?=
 =?utf-8?B?NG1udnQ5ZUpqNmN5RDRwYmNqMVdaMWhlVkpUemNPVTRHZitWdS95a3hoYXJw?=
 =?utf-8?B?VTBpUnpKd3Z3M3V5aXdQbHJxMUczN3hNbWcvb1o5SDc2R001VkhwQXZrakY5?=
 =?utf-8?B?N1dzNDhacXB2U25aT3p6ejVyZTNWYWYyQTM0dUQyUzF0N1dDdVBwclZuaHo4?=
 =?utf-8?B?bFRidks3R0FEaE5OT1E1ZFJReVpEdi8yRnQzWDVaV1Q2aS9RZWoxOVBwK0hO?=
 =?utf-8?B?RlVsdk9vWkpBSHJrYnBwRStqRzUwdHFvK3RNM1IxajIyOXZKd21EeWZTcWZP?=
 =?utf-8?B?OEwzc3dyby9OY28rU2FrZDBlUURtM2Z2N2hJYk9WL1hPd3BURTR0c3ZENTRN?=
 =?utf-8?B?NUhXTWI1WGRZWmpZbzEyamZJcVc0c1phK0dYYS9lZjRXdUc5dzlDUVVNM2c4?=
 =?utf-8?B?NW0wUHgwbzVQT0tZdWRhbHd2NkhOcXQrUXl6RkZMUFlZczl2SWhpc0lSN0N1?=
 =?utf-8?B?NVBDQWtBNUZDYjNzL01Jd25Nc1JEOW9XWmNzaXFCMXRFbFhzaHRMci9uUWE2?=
 =?utf-8?B?aVIrVG5OK29ybStQU3FYWTlPM0o3c3RJckR2MHk5WW9zWFJKOWxqWmRaR09o?=
 =?utf-8?B?Z3lLcFYxTU4wR1NDUFNCQy9hZDBOM21DbGNzb2dhcHdYdTlVVi9lVFRLNkhE?=
 =?utf-8?B?WDh4WWdYTGZrTEtFeGdmMzhhc3N0dms0MDdkQXdLbE9vaGF3RjlQWjZIT2xO?=
 =?utf-8?B?WkRTQW13Q2FnSmNTRVYvSGFvd3VYZ2I2UXpjcXhCb1VqWjQwNFpUQjRjZDdG?=
 =?utf-8?B?Zi9uVnU1MkpMd3FyR3diSHZyWmkzK3BxaUVCTHNJK3p5ZUZRMjVyaEsvcnha?=
 =?utf-8?B?MHVrb0x3Y2swU2NTUWVMSzFyU3F2OUpxVGF1Yy9JcndzbTRDOHoreXhhWkYy?=
 =?utf-8?B?ekJRa0JqRXZrRjdUSkZNalFGZHh3TXFTYTdmMnJkUS9aVkNDRTVPRnd6dWk1?=
 =?utf-8?B?K0F5U0VmTWhmTXVnZUZpWFZIeStsL1J4QU0wSnFKaTdwamIwZVpmY203TFZX?=
 =?utf-8?B?N1JWeWRSUVMxRWlhNkVtb2FuTm45OG5nVVpWbW1nMGMzZld6SHk5S3RiUmVL?=
 =?utf-8?B?S3NxMEhXSGEzbXhMWTJkb0dRSkFWMCtZRXlITzlMcnkydnFISEV1eEpuY1c2?=
 =?utf-8?B?NTFoZno4T1BOakcyUmxQanFRZnV4emRadEtjaHZod05rcGpkSDV2ZDlhMGNY?=
 =?utf-8?B?TVhmMUJPaFVxcjdTcFpiRVFVaWswY2t3bXF6UHM4dTl0ZGlmQ0RDUGlpWE1w?=
 =?utf-8?Q?uW5miPMJdv6xK/f8F18qjNcBy5oi4NMPxARFxu5e+yzP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 346daeb1-a7f4-48e7-6781-08da7ab4d845
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 09:43:56.9037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hsO8nkCktb8itaw7eux1OCQ+HBqGv4Q/t6DU3ImW5/4/RmPTOS1C5JRgHpImKjk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1779
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
Cc: clement.faure@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

Am 05.08.22 um 15:53 schrieb Olivier Masse:
> add Linaro secure heap bindings: linaro,secure-heap
> use genalloc to allocate/free buffer from buffer pool.
> buffer pool info is from dts.
> use sg_table instore the allocated memory info, the length of sg_table is 1.
> implement secure_heap_buf_ops to implement buffer share in difference device:
> 1. Userspace passes this fd to all drivers it wants this buffer
> to share with: First the filedescriptor is converted to a &dma_buf using
> dma_buf_get(). Then the buffer is attached to the device using dma_buf_attach().
> 2. Once the buffer is attached to all devices userspace can initiate DMA
> access to the shared buffer. In the kernel this is done by calling dma_buf_map_attachment()
> 3. get sg_table with dma_buf_map_attachment in difference device.

I'm not sure Christoph will approve that you are messing with the sg 
table internals so much here.

Why are you not using the DMA API directly for this?

Regards,
Christian.

>
> Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> ---
>   drivers/dma-buf/heaps/Kconfig       |   9 +
>   drivers/dma-buf/heaps/Makefile      |   1 +
>   drivers/dma-buf/heaps/secure_heap.c | 357 ++++++++++++++++++++++++++++
>   3 files changed, 367 insertions(+)
>   create mode 100644 drivers/dma-buf/heaps/secure_heap.c
>
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> index 3782eeeb91c0..c9070c728b9a 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -20,3 +20,12 @@ config DMABUF_HEAPS_DSP
>             Choose this option to enable the dsp dmabuf heap. The dsp heap
>             is allocated by gen allocater. it's allocated according the dts.
>             If in doubt, say Y.
> +
> +config DMABUF_HEAPS_SECURE
> +	tristate "DMA-BUF Secure Heap"
> +	depends on DMABUF_HEAPS
> +	help
> +	  Choose this option to enable the secure dmabuf heap. The secure heap
> +	  pools are defined according to the DT. Heaps are allocated
> +	  in the pools using gen allocater.
> +	  If in doubt, say Y.
> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
> index 29733f84c354..863ef10056a3 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -2,3 +2,4 @@
>   obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
>   obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
>   obj-$(CONFIG_DMABUF_HEAPS_DSP)          += dsp_heap.o
> +obj-$(CONFIG_DMABUF_HEAPS_SECURE)	+= secure_heap.o
> diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/secure_heap.c
> new file mode 100644
> index 000000000000..25b3629613f3
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/secure_heap.c
> @@ -0,0 +1,357 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DMABUF secure heap exporter
> + *
> + * Copyright 2021 NXP.
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/genalloc.h>
> +#include <linux/highmem.h>
> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +#include <linux/vmalloc.h>
> +
> +#define MAX_SECURE_HEAP 2
> +#define MAX_HEAP_NAME_LEN 32
> +
> +struct secure_heap_buffer {
> +	struct dma_heap *heap;
> +	struct list_head attachments;
> +	struct mutex lock;
> +	unsigned long len;
> +	struct sg_table sg_table;
> +	int vmap_cnt;
> +	void *vaddr;
> +};
> +
> +struct secure_heap_attachment {
> +	struct device *dev;
> +	struct sg_table *table;
> +	struct list_head list;
> +};
> +
> +struct secure_heap_info {
> +	struct gen_pool *pool;
> +};
> +
> +struct rmem_secure {
> +	phys_addr_t base;
> +	phys_addr_t size;
> +
> +	char name[MAX_HEAP_NAME_LEN];
> +};
> +
> +static struct rmem_secure secure_data[MAX_SECURE_HEAP] = {0};
> +static unsigned int secure_data_count;
> +
> +static struct sg_table *dup_sg_table(struct sg_table *table)
> +{
> +	struct sg_table *new_table;
> +	int ret, i;
> +	struct scatterlist *sg, *new_sg;
> +
> +	new_table = kzalloc(sizeof(*new_table), GFP_KERNEL);
> +	if (!new_table)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = sg_alloc_table(new_table, table->orig_nents, GFP_KERNEL);
> +	if (ret) {
> +		kfree(new_table);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	new_sg = new_table->sgl;
> +	for_each_sgtable_sg(table, sg, i) {
> +		sg_set_page(new_sg, sg_page(sg), sg->length, sg->offset);
> +		new_sg->dma_address = sg->dma_address;
> +#ifdef CONFIG_NEED_SG_DMA_LENGTH
> +		new_sg->dma_length = sg->dma_length;
> +#endif
> +		new_sg = sg_next(new_sg);
> +	}
> +
> +	return new_table;
> +}
> +
> +static int secure_heap_attach(struct dma_buf *dmabuf,
> +			      struct dma_buf_attachment *attachment)
> +{
> +	struct secure_heap_buffer *buffer = dmabuf->priv;
> +	struct secure_heap_attachment *a;
> +	struct sg_table *table;
> +
> +	a = kzalloc(sizeof(*a), GFP_KERNEL);
> +	if (!a)
> +		return -ENOMEM;
> +
> +	table = dup_sg_table(&buffer->sg_table);
> +	if (IS_ERR(table)) {
> +		kfree(a);
> +		return -ENOMEM;
> +	}
> +
> +	a->table = table;
> +	a->dev = attachment->dev;
> +	INIT_LIST_HEAD(&a->list);
> +	attachment->priv = a;
> +
> +	mutex_lock(&buffer->lock);
> +	list_add(&a->list, &buffer->attachments);
> +	mutex_unlock(&buffer->lock);
> +
> +	return 0;
> +}
> +
> +static void secure_heap_detach(struct dma_buf *dmabuf,
> +			       struct dma_buf_attachment *attachment)
> +{
> +	struct secure_heap_buffer *buffer = dmabuf->priv;
> +	struct secure_heap_attachment *a = attachment->priv;
> +
> +	mutex_lock(&buffer->lock);
> +	list_del(&a->list);
> +	mutex_unlock(&buffer->lock);
> +
> +	sg_free_table(a->table);
> +	kfree(a->table);
> +	kfree(a);
> +}
> +
> +static struct sg_table *secure_heap_map_dma_buf(struct dma_buf_attachment *attachment,
> +						enum dma_data_direction direction)
> +{
> +	struct secure_heap_attachment *a = attachment->priv;
> +
> +	return a->table;
> +}
> +
> +static void secure_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
> +				      struct sg_table *table,
> +				      enum dma_data_direction direction)
> +{
> +}
> +
> +static void secure_heap_dma_buf_release(struct dma_buf *dmabuf)
> +{
> +	struct secure_heap_buffer *buffer = dmabuf->priv;
> +	struct secure_heap_info *info;
> +	struct sg_table *table;
> +	struct scatterlist *sg;
> +	int i;
> +
> +	info = dma_heap_get_drvdata(buffer->heap);
> +
> +	table = &buffer->sg_table;
> +	for_each_sg(table->sgl, sg, table->nents, i)
> +		gen_pool_free(info->pool, sg_dma_address(sg), sg_dma_len(sg));
> +
> +	sg_free_table(table);
> +	kfree(buffer);
> +}
> +
> +static const struct dma_buf_ops secure_heap_buf_ops = {
> +	.attach = secure_heap_attach,
> +	.detach = secure_heap_detach,
> +	.map_dma_buf = secure_heap_map_dma_buf,
> +	.unmap_dma_buf = secure_heap_unmap_dma_buf,
> +	.release = secure_heap_dma_buf_release,
> +};
> +
> +static struct dma_buf *secure_heap_allocate(struct dma_heap *heap,
> +					    unsigned long len,
> +					    unsigned long fd_flags,
> +					    unsigned long heap_flags)
> +{
> +	struct secure_heap_buffer *buffer;
> +	struct secure_heap_info *info = dma_heap_get_drvdata(heap);
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	unsigned long size = roundup(len, PAGE_SIZE);
> +	struct dma_buf *dmabuf;
> +	struct sg_table *table;
> +	int ret = -ENOMEM;
> +	unsigned long phy_addr;
> +
> +	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
> +	if (!buffer)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&buffer->attachments);
> +	mutex_init(&buffer->lock);
> +	buffer->heap = heap;
> +	buffer->len = size;
> +
> +	phy_addr = gen_pool_alloc(info->pool, size);
> +	if (!phy_addr)
> +		goto free_buffer;
> +
> +	table = &buffer->sg_table;
> +	if (sg_alloc_table(table, 1, GFP_KERNEL))
> +		goto free_pool;
> +
> +	sg_set_page(table->sgl,	phys_to_page(phy_addr),	size, 0);
> +	sg_dma_address(table->sgl) = phy_addr;
> +	sg_dma_len(table->sgl) = size;
> +
> +	/* create the dmabuf */
> +	exp_info.exp_name = dma_heap_get_name(heap);
> +	exp_info.ops = &secure_heap_buf_ops;
> +	exp_info.size = buffer->len;
> +	exp_info.flags = fd_flags;
> +	exp_info.priv = buffer;
> +	dmabuf = dma_buf_export(&exp_info);
> +	if (IS_ERR(dmabuf)) {
> +		ret = PTR_ERR(dmabuf);
> +		goto free_pages;
> +	}
> +
> +	return dmabuf;
> +
> +free_pages:
> +	sg_free_table(table);
> +
> +free_pool:
> +	gen_pool_free(info->pool, phy_addr, size);
> +
> +free_buffer:
> +	mutex_destroy(&buffer->lock);
> +	kfree(buffer);
> +
> +	return ERR_PTR(ret);
> +}
> +
> +static const struct dma_heap_ops secure_heap_ops = {
> +	.allocate = secure_heap_allocate,
> +};
> +
> +static int secure_heap_add(struct rmem_secure *rmem)
> +{
> +	struct dma_heap *secure_heap;
> +	struct dma_heap_export_info exp_info;
> +	struct secure_heap_info *info = NULL;
> +	struct gen_pool *pool = NULL;
> +	int ret = -EINVAL;
> +
> +	if (rmem->base == 0 || rmem->size == 0) {
> +		pr_err("secure_data base or size is not correct\n");
> +		goto error;
> +	}
> +
> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info) {
> +		pr_err("dmabuf info allocation failed\n");
> +		ret = -ENOMEM;
> +		goto error;
> +	}
> +
> +	pool = gen_pool_create(PAGE_SHIFT, -1);
> +	if (!pool) {
> +		pr_err("can't create gen pool\n");
> +		ret = -ENOMEM;
> +		goto error;
> +	}
> +
> +	if (gen_pool_add(pool, rmem->base, rmem->size, -1) < 0) {
> +		pr_err("failed to add memory into pool\n");
> +		ret = -ENOMEM;
> +		goto error;
> +	}
> +
> +	info->pool = pool;
> +
> +	exp_info.name = rmem->name;
> +	exp_info.ops = &secure_heap_ops;
> +	exp_info.priv = info;
> +
> +	secure_heap = dma_heap_add(&exp_info);
> +	if (IS_ERR(secure_heap)) {
> +		pr_err("dmabuf secure heap allocation failed\n");
> +		ret = PTR_ERR(secure_heap);
> +		goto error;
> +	}
> +
> +	return 0;
> +
> +error:
> +	kfree(info);
> +	if (pool)
> +		gen_pool_destroy(pool);
> +
> +	return ret;
> +}
> +
> +static int secure_heap_create(void)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < secure_data_count; i++) {
> +		ret = secure_heap_add(&secure_data[i]);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +static int rmem_secure_heap_device_init(struct reserved_mem *rmem,
> +					 struct device *dev)
> +{
> +	dev_set_drvdata(dev, rmem);
> +	return 0;
> +}
> +
> +static void rmem_secure_heap_device_release(struct reserved_mem *rmem,
> +					 struct device *dev)
> +{
> +	dev_set_drvdata(dev, NULL);
> +}
> +
> +static const struct reserved_mem_ops rmem_dma_ops = {
> +	.device_init    = rmem_secure_heap_device_init,
> +	.device_release = rmem_secure_heap_device_release,
> +};
> +
> +static int __init rmem_secure_heap_setup(struct reserved_mem *rmem)
> +{
> +	if (secure_data_count < MAX_SECURE_HEAP) {
> +		int name_len = 0;
> +		const char *s = rmem->name;
> +
> +		secure_data[secure_data_count].base = rmem->base;
> +		secure_data[secure_data_count].size = rmem->size;
> +
> +		while (name_len < MAX_HEAP_NAME_LEN) {
> +			if ((*s == '@') || (*s == '\0'))
> +				break;
> +			name_len++;
> +			s++;
> +		}
> +		if (name_len == MAX_HEAP_NAME_LEN)
> +			name_len--;
> +
> +		strncpy(secure_data[secure_data_count].name, rmem->name, name_len);
> +
> +		rmem->ops = &rmem_dma_ops;
> +		pr_info("Reserved memory: DMA buf secure pool %s at %pa, size %ld MiB\n",
> +			secure_data[secure_data_count].name,
> +			&rmem->base, (unsigned long)rmem->size / SZ_1M);
> +
> +		secure_data_count++;
> +		return 0;
> +	}
> +	WARN_ONCE(1, "Cannot handle more than %u secure heaps\n", MAX_SECURE_HEAP);
> +	return -EINVAL;
> +}
> +
> +RESERVEDMEM_OF_DECLARE(secure_heap, "linaro,secure-heap", rmem_secure_heap_setup);
> +
> +module_init(secure_heap_create);
> +MODULE_LICENSE("GPL v2");

