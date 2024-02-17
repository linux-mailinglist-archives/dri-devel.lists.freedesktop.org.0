Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BE0858CC0
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 02:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EAD10ED05;
	Sat, 17 Feb 2024 01:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="aXfdGNXK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F85B10ED05
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Feb 2024 01:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=NVv3jtwrIr3uSH0TL3zX4hdOSOGZmVK7PYBdingjYrw=; b=aXfdGNXKG9dBi+YSFnau8+kxeZ
 pWjB04/AIlIJuH1vgHrQiuIF0ptiyg9HYMTQnktakyIMRR7eMOsOlpP3ClweoDmzY9MVAduKVcjS+
 QlOhK+7J1svCzQ86p4C9rz2L9PIcc7cFOTy1WUTMJDA5aQG7kfNxv8meLZCQk5u6oqC/tl1CSnW9G
 GEdDP8+OebsSHv6n8h7VEC1SmakH5N/iCL9SlDReZ7qSZR3fGeonOmeogyjtk47K7eYM6Zwa1HZPH
 7czHGcfpc09dfl5OpBQufNOEsMWNH9Ifwm1XsYWr1IGKGD2dUwVM2uk0Bfq0CsFXO2/5Cu0w+Genj
 N4kN1IrA==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rb9Xl-00000004Pfk-0nYR; Sat, 17 Feb 2024 01:31:06 +0000
Message-ID: <745e156e-c3ec-427f-98ad-bfc7d3cfd846@infradead.org>
Date: Fri, 16 Feb 2024 17:31:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tests/drm_buddy: avoid 64-bit calculation
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Gow <davidgow@google.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Matthew Auld <matthew.auld@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240216202442.2493031-1-arnd@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240216202442.2493031-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 2/16/24 12:24, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added drm_test_buddy_alloc_contiguous() test fails to link on
> 32-bit targets because of inadvertent 64-bit calculations:
> 
> ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/tests/drm_buddy_test.ko] undefined!
> ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/tests/drm_buddy_test.ko] undefined!
> 
>>From what I can tell, the numbers cannot possibly overflow a 32-bit size,
> so use different types for these.
> 
> I noticed that the function has another possible flaw in that is mixes
> what it calls pages with 4KB units. This is a big confusing at best,
> or possibly broken when built on machines with larger pages.
> 
> Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/gpu/drm/tests/drm_buddy_test.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index fee6bec757d1..50a5f98cd5bd 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -21,7 +21,8 @@ static inline u64 get_size(int order, u64 chunk_size)
>  
>  static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>  {
> -	u64 mm_size, ps = SZ_4K, i, n_pages, total;
> +	u64 mm_size, total;
> +	u32 i, ps = SZ_4K, n_pages;
>  	struct drm_buddy_block *block;
>  	struct drm_buddy mm;
>  	LIST_HEAD(left);
> @@ -29,7 +30,8 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>  	LIST_HEAD(right);
>  	LIST_HEAD(allocated);
>  
> -	mm_size = 16 * 3 * SZ_4K;
> +	n_pages = 16 * 3;
> +	mm_size = n_pages * SZ_4K;
>  
>  	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
>  
> @@ -42,7 +44,6 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>  	 */
>  
>  	i = 0;
> -	n_pages = mm_size / ps;
>  	do {
>  		struct list_head *list;
>  		int slot = i % 3;

-- 
#Randy
