Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FE19BAE95
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 09:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E429910E394;
	Mon,  4 Nov 2024 08:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="nF3ibdzt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-111.freemail.mail.aliyun.com
 (out30-111.freemail.mail.aliyun.com [115.124.30.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BEE10E11D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 02:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1730687614; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 bh=v1/peVX+FsyEZ3e/HuCFZ4YVCmzU5pF7SqzFiNM/ok0=;
 b=nF3ibdzt8SMIifbblHV5nAEq1IPJGB0e3080baIMIKgofLaEDiXfz9FvbU1GEVVgBOVqPqZBq+zPzpT7RPSPPDF4zo+kzpgHPpwHedzaGGBm0i41ddD4CPZa28CL94YXlobDBzH4e4hq3EYUNYnkt3RjVgXAXs51BHVQIUwz6To=
Received: from 30.74.144.113(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0WIZh3ES_1730687612 cluster:ay36) by smtp.aliyun-inc.com;
 Mon, 04 Nov 2024 10:33:33 +0800
Message-ID: <ea5546e6-1c80-45fd-b58e-6739a5a6f357@linux.alibaba.com>
Date: Mon, 4 Nov 2024 10:33:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] mm: shmem: override mTHP shmem default with a
 kernel parameter
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 Hugh Dickins <hughd@google.com>, Barry Song <baohua@kernel.org>,
 David Hildenbrand <david@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Lance Yang <ioworker0@gmail.com>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20241101165719.1074234-2-mcanal@igalia.com>
 <20241101165719.1074234-6-mcanal@igalia.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20241101165719.1074234-6-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 04 Nov 2024 08:51:53 +0000
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



On 2024/11/2 00:54, Maíra Canal wrote:
> Add the ``thp_shmem=`` kernel command line to allow specifying the
> default policy of each supported shmem hugepage size. The kernel parameter
> accepts the following format:
> 
> thp_shmem=<size>[KMG],<size>[KMG]:<policy>;<size>[KMG]-<size>[KMG]:<policy>
> 
> For example,
> 
> thp_shmem=16K-64K:always;128K,512K:inherit;256K:advise;1M-2M:never;4M-8M:within_size
> 
> Some GPUs may benefit from using huge pages. Since DRM GEM uses shmem
> to allocate anonymous pageable memory, it’s essential to control the huge
> page allocation policy for the internal shmem mount. This control can be
> achieved through the ``transparent_hugepage_shmem=`` parameter.
> 
> Beyond just setting the allocation policy, it’s crucial to have granular
> control over the size of huge pages that can be allocated. The GPU may
> support only specific huge page sizes, and allocating pages larger/smaller
> than those sizes would be ineffective.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   .../admin-guide/kernel-parameters.txt         |  10 ++
>   Documentation/admin-guide/mm/transhuge.rst    |  17 +++
>   mm/shmem.c                                    | 105 +++++++++++++++++-
>   3 files changed, 131 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index acabb04d0dd4..b48d744d99b0 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6700,6 +6700,16 @@
>   			Force threading of all interrupt handlers except those
>   			marked explicitly IRQF_NO_THREAD.
>   
> +	thp_shmem=	[KNL]
> +			Format: <size>[KMG],<size>[KMG]:<policy>;<size>[KMG]-<size>[KMG]:<policy>
> +			Control the default policy of each hugepage size for the
> +			internal shmem mount. <policy> is one of policies available
> +			for the shmem mount ("always", "inherit", "never", "within_size",
> +			and "advise").
> +			It can be used multiple times for multiple shmem THP sizes.
> +			See Documentation/admin-guide/mm/transhuge.rst for more
> +			details.
> +
>   	topology=	[S390,EARLY]
>   			Format: {off | on}
>   			Specify if the kernel should make use of the cpu
> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
> index 9c6f6da612c4..5034915f4e8e 100644
> --- a/Documentation/admin-guide/mm/transhuge.rst
> +++ b/Documentation/admin-guide/mm/transhuge.rst
> @@ -332,6 +332,23 @@ allocation policy for the internal shmem mount by using the kernel parameter
>   seven valid policies for shmem (``always``, ``within_size``, ``advise``,
>   ``never``, ``deny``, and ``force``).
>   
> +In the same manner as ``thp_anon`` controls each supported anonymous THP
> +size, ``thp_shmem`` controls each supported shmem THP size. ``thp_shmem``
> +has the same format as ``thp_anon``, but also supports the policy
> +``within_size``.
> +
> +``thp_shmem=`` may be specified multiple times to configure all THP sizes
> +as required. If ``thp_shmem=`` is specified at least once, any shmem THP
> +sizes not explicitly configured on the command line are implicitly set to
> +``never``.
> +
> +``transparent_hugepage_shmem`` setting only affects the global toggle. If
> +``thp_shmem`` is not specified, PMD_ORDER hugepage will default to
> +``inherit``. However, if a valid ``thp_shmem`` setting is provided by the
> +user, the PMD_ORDER hugepage policy will be overridden. If the policy for
> +PMD_ORDER is not defined within a valid ``thp_shmem``, its policy will
> +default to ``never``.
> +
>   Hugepages in tmpfs/shmem
>   ========================
>   
> diff --git a/mm/shmem.c b/mm/shmem.c
> index dfcc88ec6e34..d2bf98aece40 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -136,6 +136,7 @@ static unsigned long huge_shmem_orders_always __read_mostly;
>   static unsigned long huge_shmem_orders_madvise __read_mostly;
>   static unsigned long huge_shmem_orders_inherit __read_mostly;
>   static unsigned long huge_shmem_orders_within_size __read_mostly;
> +static bool shmem_orders_configured __initdata;
>   #endif
>   
>   #ifdef CONFIG_TMPFS
> @@ -5027,7 +5028,8 @@ void __init shmem_init(void)
>   	 * Default to setting PMD-sized THP to inherit the global setting and
>   	 * disable all other multi-size THPs.
>   	 */
> -	huge_shmem_orders_inherit = BIT(HPAGE_PMD_ORDER);
> +	if (!shmem_orders_configured)
> +		huge_shmem_orders_inherit = BIT(HPAGE_PMD_ORDER);
>   #endif
>   	return;
>   
> @@ -5195,6 +5197,107 @@ static int __init setup_transparent_hugepage_shmem(char *str)
>   }
>   __setup("transparent_hugepage_shmem=", setup_transparent_hugepage_shmem);
>   
> +static char str_dup[PAGE_SIZE] __initdata;
> +static int __init setup_thp_shmem(char *str)
> +{
> +	char *token, *range, *policy, *subtoken;
> +	unsigned long always, inherit, madvise, within_size;
> +	char *start_size, *end_size;
> +	int start, end, nr;
> +	char *p;
> +
> +	if (!str || strlen(str) + 1 > PAGE_SIZE)
> +		goto err;
> +	strscpy(str_dup, str);
> +
> +	always = huge_shmem_orders_always;
> +	inherit = huge_shmem_orders_inherit;
> +	madvise = huge_shmem_orders_madvise;
> +	within_size = huge_shmem_orders_within_size;
> +	p = str_dup;
> +	while ((token = strsep(&p, ";")) != NULL) {
> +		range = strsep(&token, ":");
> +		policy = token;
> +
> +		if (!policy)
> +			goto err;
> +
> +		while ((subtoken = strsep(&range, ",")) != NULL) {
> +			if (strchr(subtoken, '-')) {
> +				start_size = strsep(&subtoken, "-");
> +				end_size = subtoken;
> +
> +				start = get_order_from_str(start_size,
> +							   THP_ORDERS_ALL_FILE_DEFAULT);
> +				end = get_order_from_str(end_size,
> +							 THP_ORDERS_ALL_FILE_DEFAULT);
> +			} else {
> +				start_size = end_size = subtoken;
> +				start = end = get_order_from_str(subtoken,
> +								 THP_ORDERS_ALL_FILE_DEFAULT);
> +			}
> +
> +			if (start == -EINVAL) {
> +				pr_err("invalid size %s in thp_shmem boot parameter\n",
> +				       start_size);
> +				goto err;
> +			}
> +
> +			if (end == -EINVAL) {
> +				pr_err("invalid size %s in thp_shmem boot parameter\n",
> +				       end_size);
> +				goto err;
> +			}

I have the same feeling that these are redundant checks. Otherwise look 
good to me.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
