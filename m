Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB39EB159EB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 09:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62EB10E14B;
	Wed, 30 Jul 2025 07:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="hqbuTHFk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-100.freemail.mail.aliyun.com
 (out30-100.freemail.mail.aliyun.com [115.124.30.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA9110E14B
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 07:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1753861582; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 bh=Rw9coQSPDusbh6xlzH1libYuWMCbw8rIDakkSoz4oHQ=;
 b=hqbuTHFkY7Wd99fNVDc/QqD83GFNCXqkkwMFpGelhw77OH/bEsQtw/UHzl75K2aJJV94eSgtKY/fQ+k/QuSqZQ6ePnAxyv8XmapXC7+S1CKj/3fLtGARLRi9/3XxFMJgA36IpwmixhfcZetqDkr8NaBc0igUfgenII8Ou85fXPw=
Received: from 30.74.144.115(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0WkU-UhV_1753861580 cluster:ay36) by smtp.aliyun-inc.com;
 Wed, 30 Jul 2025 15:46:20 +0800
Message-ID: <817c59dd-ad54-47f1-ac16-9cb9583308d1@linux.alibaba.com>
Date: Wed, 30 Jul 2025 15:46:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: shmem: fix the shmem large folio allocation for the
 i915 driver
To: Hugh Dickins <hughd@google.com>
Cc: akpm@linux-foundation.org, patryk@kowalczyk.ws,
 ville.syrjala@linux.intel.com, david@redhat.com, willy@infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, christian.koenig@amd.com, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <0d734549d5ed073c80b11601da3abdd5223e1889.1753689802.git.baolin.wang@linux.alibaba.com>
 <ff93c415-7ce8-a331-9568-7543c6a37992@google.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <ff93c415-7ce8-a331-9568-7543c6a37992@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 2025/7/30 14:54, Hugh Dickins wrote:
> On Mon, 28 Jul 2025, Baolin Wang wrote:
> 
>> After commit acd7ccb284b8 ("mm: shmem: add large folio support for tmpfs"),
>> we extend the 'huge=' option to allow any sized large folios for tmpfs,
>> which means tmpfs will allow getting a highest order hint based on the size
>> of write() and fallocate() paths, and then will try each allowable large order.
>>
>> However, when the i915 driver allocates shmem memory, it doesn't provide hint
>> information about the size of the large folio to be allocated, resulting in
>> the inability to allocate PMD-sized shmem, which in turn affects GPU performance.
>>
>> To fix this issue, add the 'end' information for shmem_read_folio_gfp()  to help
>> allocate PMD-sized large folios. Additionally, use the maximum allocation chunk
>> (via mapping_max_folio_size()) to determine the size of the large folios to
>> allocate in the i915 driver.
>>
>> Fixes: acd7ccb284b8 ("mm: shmem: add large folio support for tmpfs")
>> Reported-by: Patryk Kowalczyk <patryk@kowalczyk.ws>
>> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Tested-by: Patryk Kowalczyk <patryk@kowalczyk.ws>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   drivers/gpu/drm/drm_gem.c                 | 2 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 7 ++++++-
>>   drivers/gpu/drm/ttm/ttm_backup.c          | 2 +-
>>   include/linux/shmem_fs.h                  | 4 ++--
>>   mm/shmem.c                                | 7 ++++---
>>   5 files changed, 14 insertions(+), 8 deletions(-)
> 
> I know I said "I shall not object to a temporary workaround to suit the
> i915 driver", but really, I have to question this patch.  Why should any
> change be required at the drivers/gpu/drm end?
> 
> And in drivers/gpu/drm/{i915,v3d} I find they are using huge=within_size:
> I had been complaining about the userspace regression in huge=always,
> and thought it had been changed to behave like huge=within_size,
> but apparently huge=within_size has itself regressed too.

I'm preparing a RFC patch to discuss this.

> Please explain why the below is not a better patch for i915 and v3d
> (but still a temporary workaround, because the root of the within_size
> regression must lie deeper, in the handling of write_end versus i_size).

OK. This looks good to me. Patryk, could you try Hugh's simple patch? 
Thanks.

> ---
>   mm/shmem.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 3a5a65b1f41a..c67dfc17a819 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -5928,8 +5928,8 @@ struct folio *shmem_read_folio_gfp(struct address_space *mapping,
>   	struct folio *folio;
>   	int error;
>   
> -	error = shmem_get_folio_gfp(inode, index, 0, &folio, SGP_CACHE,
> -				    gfp, NULL, NULL);
> +	error = shmem_get_folio_gfp(inode, index, i_size_read(inode),
> +				    &folio, SGP_CACHE, gfp, NULL, NULL);
>   	if (error)
>   		return ERR_PTR(error);
>   

