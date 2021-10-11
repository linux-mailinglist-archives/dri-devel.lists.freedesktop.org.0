Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6451842951D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 19:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94BE6E905;
	Mon, 11 Oct 2021 17:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E706E8FC;
 Mon, 11 Oct 2021 17:02:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0AFC022007;
 Mon, 11 Oct 2021 17:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1633971745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4jY518LLN0DEflKAEIOoiJENNbC5tBQaKEI9hO0rfaU=;
 b=b7iLr7upIMD9tjkdJx4F37SiOf5heqj7i9GTBuURfq9hu1TXF6xZcTOBGFmPIvNgEWsz5V
 yfgysUwkZU3oGy0GrEHczli9rjC/7s87TFYYK0m9dQbfNhwjM7Ca/vu+1SfHIBoUIkBI8z
 jEvllkuXnHP0R9kXAghBR/dnA+RV/QQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1633971745;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4jY518LLN0DEflKAEIOoiJENNbC5tBQaKEI9hO0rfaU=;
 b=x61B30X9aAUcxuFVUI3noYurioH93T2CaNujNo5w18bg6oKqENvWOCrNZV38EhojRGy7qS
 qtbUS2RtUQMSfVAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B16C513BCE;
 Mon, 11 Oct 2021 17:02:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MAS1KSBuZGEcfwAAMHmgww
 (envelope-from <vbabka@suse.cz>); Mon, 11 Oct 2021 17:02:24 +0000
Message-ID: <2a62971d-467f-f354-caac-2b5ecf258e3c@suse.cz>
Date: Mon, 11 Oct 2021 19:02:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Marco Elver <elver@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kasan-dev@googlegroups.com,
 Vijayanand Jitta <vjitta@codeaurora.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Oliver Glitta
 <glittao@gmail.com>, Imran Khan <imran.f.khan@oracle.com>
References: <20211007095815.3563-1-vbabka@suse.cz>
 <YV7TnygBLdHJjmRW@elver.google.com>
From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] lib/stackdepot: allow optional init and stack_table
 allocation by kvmalloc()
In-Reply-To: <YV7TnygBLdHJjmRW@elver.google.com>
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

On 10/7/21 13:01, Marco Elver wrote:
> On Thu, Oct 07, 2021 at 11:58AM +0200, Vlastimil Babka wrote:
> [...] 
>> - Add a CONFIG_STACKDEPOT_ALWAYS_INIT flag to keep using the current
>>   well-defined point of allocation as part of mem_init(). Make CONFIG_KASAN
>>   select this flag.
>> - Other users have to call stack_depot_init() as part of their own init when
>>   it's determined that stack depot will actually be used. This may depend on
>>   both config and runtime conditions. Convert current users which are
>>   page_owner and several in the DRM subsystem. Same will be done for SLUB
>>   later.
>> - Because the init might now be called after the boot-time memblock allocation
>>   has given all memory to the buddy allocator, change stack_depot_init() to
>>   allocate stack_table with kvmalloc() when memblock is no longer available.
>>   Also handle allocation failure by disabling stackdepot (could have
>>   theoretically happened even with memblock allocation previously), and don't
>>   unnecessarily align the memblock allocation to its own size anymore.
> ...
>> Hi, I'd appreciate review of the DRM parts - namely that I've got correctly
>> that stack_depot_init() is called from the proper init functions and iff
>> stack_depot_save() is going to be used later. Thanks!
> 
> For ease of review between stackdepot and DRM changes, I thought it'd be
> nice to split into 2 patches, but not sure it'll work, because you're
> changing the semantics of the normal STACKDEPOT.

Yeah, that's why it's a single patch. As the DRM parts are clearly separated
to their files, I think review should be fine.

> One option would be to flip it around, and instead have
> STACKDEPOT_LAZY_INIT, but that seems counter-intuitive if the majority
> of STACKDEPOT users are LAZY_INIT users.

Agree.

> On the other hand, the lazy initialization mode you're introducing
> requires an explicit stack_depot_init() call somewhere and isn't as
> straightforward as before.
> 
> Not sure what is best. My intuition tells me STACKDEPOT_LAZY_INIT would
> be safer as it's a deliberate opt-in to the lazy initialization
> behaviour.

I think it should be fine with ALWAYS_INIT. There are not many stackdepot
users being added, and anyone developing a new one will very quickly find
out if they forget to call stack_depot_init()?

> Preferences?
> 
> [...]
>> --- a/drivers/gpu/drm/drm_mm.c
>> +++ b/drivers/gpu/drm/drm_mm.c
>> @@ -980,6 +980,10 @@ void drm_mm_init(struct drm_mm *mm, u64 start, u64 size)
>>  	add_hole(&mm->head_node);
>>  
>>  	mm->scan_active = 0;
>> +
>> +#ifdef CONFIG_DRM_DEBUG_MM
>> +	stack_depot_init();
>> +#endif
> 
> DRM_DEBUG_MM implies STACKDEPOT. Not sure what is more readable to drm
> maintainers, but perhaps it'd be nicer to avoid the #ifdef here, and
> instead just keep the no-op version of stack_depot_init() in
> <linux/stackdepot.h>. I don't have a strong preference.

Hm, but in case STACKDEPOT is also selected by something else (e.g.
CONFIG_PAGE_OWNER) which uses lazy init but isn't enabled on boot, then
without #ifdef CONFIG_DRM_DEBUG_MM above, this code would call a
stack_depot_init() (that's not a no-op) even in case it's not going to be
using it, so not what we want to achieve.
But it could be changed to use IS_ENABLED() if that's preferred by DRM folks.

BTW it's possible that there won't be any DRM review because this failed to
apply:
https://patchwork.freedesktop.org/series/95549/
DRM folks, any hint how to indicate that the base was next-20211001?

>> @@ -30,13 +40,4 @@ int stack_depot_snprint(depot_stack_handle_t handle, char *buf, size_t size,
>>  
>>  void stack_depot_print(depot_stack_handle_t stack);
>>  
>> -#ifdef CONFIG_STACKDEPOT
>> -int stack_depot_init(void);
>> -#else
>> -static inline int stack_depot_init(void)
>> -{
>> -	return 0;
>> -}
>> -#endif	/* CONFIG_STACKDEPOT */
>> -
> 
> Could we avoid the IS_ENABLED() in init/main.c by adding a wrapper here:
> 
> +#ifdef CONFIG_STACKDEPOT_ALWAYS_INIT
> +static inline int stack_depot_early_init(void)	{ return stack_depot_init(); }
> +#else
> +static inline int stack_depot_early_init(void)	{ return 0; }
> +#endif	/* CONFIG_STACKDEPOT_ALWAYS_INIT */

We could, but it's a wrapper made for only a single caller...

>>  #endif
>> diff --git a/init/main.c b/init/main.c
>> index ee4d3e1b3eb9..b6a5833d98f5 100644
>> --- a/init/main.c
>> +++ b/init/main.c
>> @@ -844,7 +844,8 @@ static void __init mm_init(void)
>>  	init_mem_debugging_and_hardening();
>>  	kfence_alloc_pool();
>>  	report_meminit();
>> -	stack_depot_init();
>> +	if (IS_ENABLED(CONFIG_STACKDEPOT_ALWAYS_INIT))
>> +		stack_depot_init();
> 
> I'd push the decision of when to call this into <linux/stackdepot.h> via
> wrapper stack_depot_early_init().

No strong preferrences, if you think it's worth it.

>>  	mem_init();
>>  	mem_init_print_info();
>>  	/* page_owner must be initialized after buddy is ready */
>> diff --git a/lib/Kconfig b/lib/Kconfig
>> index 5e7165e6a346..df6bcf0a4cc3 100644
>> --- a/lib/Kconfig
>> +++ b/lib/Kconfig
>> @@ -671,6 +671,9 @@ config STACKDEPOT
>>  	bool
>>  	select STACKTRACE
>>  
>> +config STACKDEPOT_ALWAYS_INIT
>> +	bool
> 
> It looks like every users of STACKDEPOT_ALWAYS_INIT will also select
> STACKDEPOT, so we could just make this:
> 
> +config STACKDEPOT_ALWAYS_INIT
> +	bool
> +	select STACKDEPOT
> 
> And remove the redundant 'select STACKDEPOT' in Kconfig.kasan.

Right, will do, if KConfig resolver doesn't bite me.

>>  config STACK_HASH_ORDER
>>  	int "stack depot hash size (12 => 4KB, 20 => 1024KB)"
>>  	range 12 20
>> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
>> index cdc842d090db..695deb603c66 100644
>> --- a/lib/Kconfig.kasan
>> +++ b/lib/Kconfig.kasan
>> @@ -39,6 +39,7 @@ menuconfig KASAN
>>  		   HAVE_ARCH_KASAN_HW_TAGS
>>  	depends on (SLUB && SYSFS) || (SLAB && !DEBUG_SLAB)
>>  	select STACKDEPOT
>> +	select STACKDEPOT_ALWAYS_INIT
> 
> [...]
>>  
>> -int __init stack_depot_init(void)
>> +/*
>> + * __ref because of memblock_alloc(), which will not be actually called after
>> + * the __init code is gone
> 
> The reason is that after __init code is gone, slab_is_available() will
> be true (might be worth adding to the comment).

OK

Thanks for the review!
