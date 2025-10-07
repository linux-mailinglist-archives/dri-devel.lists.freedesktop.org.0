Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD87CBC19E4
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 16:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7D710E682;
	Tue,  7 Oct 2025 14:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ok9rKzoY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A2910E682;
 Tue,  7 Oct 2025 14:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fj+w9qCSetqnQirycPUXo4URE/Vljwlqx5kJHAQSAaA=; b=ok9rKzoYjpcgYDiAojiVxXH00R
 wttIXam1nWE8oqsl3/lXZ4JV7HmKW+M9d7MgPn0tQ8ZgSTMY+1pfyxHdmQs/Q4j8EZ9lwTGrumr0O
 fovRFc656/Hhz8l/EEMtCNqeHcAUFgCMvEzXLTxZ034jF+yoFpfKwROy4Q3IjG7FaU5ZdYZZDMRMT
 dJF2QNjzW2N6JEQE1aogqFeKdRiMUmxyM46eFXkTUmzgf9dwMg+mJz0U3sfr3/y4NsLm9ClJQvHr/
 SzuQt7rPl5QNciJI9NmY/8NbZ5XogHkfLOFHVG9kEOJrqs3KmH11I18FxrUK7b4xa7WCgMMn889A+
 tuxQ1nDw==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v68FA-006DDm-Rt; Tue, 07 Oct 2025 16:00:44 +0200
Message-ID: <c3cb4df5-d6db-4cff-ba4c-c51f6503181c@igalia.com>
Date: Tue, 7 Oct 2025 15:00:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 1/5] drm/ttm: Add getter for some pool properties
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20251003135836.41116-1-tvrtko.ursulin@igalia.com>
 <20251003135836.41116-2-tvrtko.ursulin@igalia.com>
 <b9a866ea-0f67-4e34-bb30-f8e297ee26f2@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <b9a866ea-0f67-4e34-bb30-f8e297ee26f2@amd.com>
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


On 06/10/2025 09:38, Christian König wrote:
> On 03.10.25 15:58, Tvrtko Ursulin wrote:
>> No functional change but to allow easier refactoring in the future.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_pool.c | 28 ++++++++++++++--------------
>>   drivers/gpu/drm/ttm/ttm_tt.c   |  9 +++++----
>>   include/drm/ttm/ttm_pool.h     | 10 ++++++++++
>>   3 files changed, 29 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>> index baf27c70a419..a9430b516fc3 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -148,7 +148,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>>   		gfp_flags |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN |
>>   			__GFP_THISNODE;
>>   
>> -	if (!pool->use_dma_alloc) {
>> +	if (!ttm_pool_uses_dma_alloc(pool)) {
>>   		p = alloc_pages_node(pool->nid, gfp_flags, order);
>>   		if (p)
>>   			p->private = order;
>> @@ -200,7 +200,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>>   		set_pages_wb(p, 1 << order);
>>   #endif
>>   
>> -	if (!pool || !pool->use_dma_alloc) {
>> +	if (!pool || !ttm_pool_uses_dma_alloc(pool)) {
>>   		__free_pages(p, order);
>>   		return;
>>   	}
>> @@ -243,7 +243,7 @@ static int ttm_pool_map(struct ttm_pool *pool, unsigned int order,
>>   {
>>   	dma_addr_t addr;
>>   
>> -	if (pool->use_dma_alloc) {
>> +	if (ttm_pool_uses_dma_alloc(pool)) {
>>   		struct ttm_pool_dma *dma = (void *)p->private;
>>   
>>   		addr = dma->addr;
>> @@ -265,7 +265,7 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
>>   			   unsigned int num_pages)
>>   {
>>   	/* Unmapped while freeing the page */
>> -	if (pool->use_dma_alloc)
>> +	if (ttm_pool_uses_dma_alloc(pool))
>>   		return;
>>   
>>   	dma_unmap_page(pool->dev, dma_addr, (long)num_pages << PAGE_SHIFT,
>> @@ -339,7 +339,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>>   						  enum ttm_caching caching,
>>   						  unsigned int order)
>>   {
>> -	if (pool->use_dma_alloc)
>> +	if (ttm_pool_uses_dma_alloc(pool))
>>   		return &pool->caching[caching].orders[order];
>>   
>>   #ifdef CONFIG_X86
>> @@ -348,7 +348,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>>   		if (pool->nid != NUMA_NO_NODE)
>>   			return &pool->caching[caching].orders[order];
>>   
>> -		if (pool->use_dma32)
>> +		if (ttm_pool_uses_dma32(pool))
>>   			return &global_dma32_write_combined[order];
>>   
>>   		return &global_write_combined[order];
>> @@ -356,7 +356,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>>   		if (pool->nid != NUMA_NO_NODE)
>>   			return &pool->caching[caching].orders[order];
>>   
>> -		if (pool->use_dma32)
>> +		if (ttm_pool_uses_dma32(pool))
>>   			return &global_dma32_uncached[order];
>>   
>>   		return &global_uncached[order];
>> @@ -396,7 +396,7 @@ static unsigned int ttm_pool_shrink(void)
>>   /* Return the allocation order based for a page */
>>   static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
>>   {
>> -	if (pool->use_dma_alloc) {
>> +	if (ttm_pool_uses_dma_alloc(pool)) {
>>   		struct ttm_pool_dma *dma = (void *)p->private;
>>   
>>   		return dma->vaddr & ~PAGE_MASK;
>> @@ -719,7 +719,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>   	if (ctx->gfp_retry_mayfail)
>>   		gfp_flags |= __GFP_RETRY_MAYFAIL;
>>   
>> -	if (pool->use_dma32)
>> +	if (ttm_pool_uses_dma32(pool))
>>   		gfp_flags |= GFP_DMA32;
>>   	else
>>   		gfp_flags |= GFP_HIGHUSER;
>> @@ -977,7 +977,7 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
>>   		return -EINVAL;
>>   
>>   	if ((!ttm_backup_bytes_avail() && !flags->purge) ||
>> -	    pool->use_dma_alloc || ttm_tt_is_backed_up(tt))
>> +	    ttm_pool_uses_dma_alloc(pool) || ttm_tt_is_backed_up(tt))
>>   		return -EBUSY;
>>   
>>   #ifdef CONFIG_X86
>> @@ -1014,7 +1014,7 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
>>   	if (flags->purge)
>>   		return shrunken;
>>   
>> -	if (pool->use_dma32)
>> +	if (ttm_pool_uses_dma32(pool))
>>   		gfp = GFP_DMA32;
>>   	else
>>   		gfp = GFP_HIGHUSER;
>> @@ -1068,7 +1068,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>   {
>>   	unsigned int i, j;
>>   
>> -	WARN_ON(!dev && use_dma_alloc);
>> +	WARN_ON(!dev && ttm_pool_uses_dma_alloc(pool));
>>   
>>   	pool->dev = dev;
>>   	pool->nid = nid;
>> @@ -1239,7 +1239,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>>   {
>>   	unsigned int i;
>>   
>> -	if (!pool->use_dma_alloc && pool->nid == NUMA_NO_NODE) {
>> +	if (!ttm_pool_uses_dma_alloc(pool) && pool->nid == NUMA_NO_NODE) {
>>   		seq_puts(m, "unused\n");
>>   		return 0;
>>   	}
>> @@ -1250,7 +1250,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>>   	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>>   		if (!ttm_pool_select_type(pool, i, 0))
>>   			continue;
>> -		if (pool->use_dma_alloc)
>> +		if (ttm_pool_uses_dma_alloc(pool))
>>   			seq_puts(m, "DMA ");
>>   		else
>>   			seq_printf(m, "N%d ", pool->nid);
>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>> index 506e257dfba8..3b21ec33c877 100644
>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>> @@ -93,7 +93,8 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
>>   	 * mapped TT pages need to be decrypted or otherwise the drivers
>>   	 * will end up sending encrypted mem to the gpu.
>>   	 */
>> -	if (bdev->pool.use_dma_alloc && cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
>> +	if (ttm_pool_uses_dma_alloc(&bdev->pool) &&
>> +	    cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
>>   		page_flags |= TTM_TT_FLAG_DECRYPTED;
>>   		drm_info_once(ddev, "TT memory decryption enabled.");
>>   	}
>> @@ -378,7 +379,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>   
>>   	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
>>   		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
>> -		if (bdev->pool.use_dma32)
>> +		if (ttm_pool_uses_dma32(&bdev->pool))
>>   			atomic_long_add(ttm->num_pages,
>>   					&ttm_dma32_pages_allocated);
>>   	}
>> @@ -416,7 +417,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>   error:
>>   	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
>>   		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>> -		if (bdev->pool.use_dma32)
>> +		if (ttm_pool_uses_dma32(&bdev->pool))
>>   			atomic_long_sub(ttm->num_pages,
>>   					&ttm_dma32_pages_allocated);
>>   	}
>> @@ -439,7 +440,7 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>>   
>>   	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
>>   		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>> -		if (bdev->pool.use_dma32)
>> +		if (ttm_pool_uses_dma32(&bdev->pool))
>>   			atomic_long_sub(ttm->num_pages,
>>   					&ttm_dma32_pages_allocated);
>>   	}
>> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
>> index 54cd34a6e4c0..22154d84fef9 100644
>> --- a/include/drm/ttm/ttm_pool.h
>> +++ b/include/drm/ttm/ttm_pool.h
>> @@ -100,4 +100,14 @@ int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>   int ttm_pool_mgr_init(unsigned long num_pages);
>>   void ttm_pool_mgr_fini(void);
>>   
>> +static inline bool ttm_pool_uses_dma_alloc(struct ttm_pool *pool)
>> +{
>> +	return pool->use_dma_alloc;
>> +}
>> +
>> +static inline bool ttm_pool_uses_dma32(struct ttm_pool *pool)
>> +{
>> +	return pool->use_dma32;
>> +}
>> +
> 
> Please not in the header. Neither drivers nor other TTM modules should mess with such properties.
> 
> That is all internal to the pool.

Hmm IMHO it is not that bad. Especially that ttm_pool.c and ttm_tt.c 
need to have access to them. Alternatiev is a new header for internal 
helpers which sounds a bit too much. But if you insist I can create it.

Regards,

Tvrtko

