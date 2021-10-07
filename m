Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6FD425207
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 13:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E59B6E838;
	Thu,  7 Oct 2021 11:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290686F404
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 11:02:00 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t2so17785271wrb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 04:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NJgOSqoCCgXqOknLz7AdQYpr89OwA0jzXUySVyR80Xs=;
 b=M7iUMKBa9OdQuivKHhVb7u/+Q7iX2KCFCBHWKvWjQ40ubCMP3Fqw/TEwd+sRZ8pZw5
 C44lLGOhyw6JXYdO0nULsRQFxS7qPtDTX1C8Q0G8Q9HcH5Kli5EMS1wScn0mA899ja5h
 QewOHemIzJmWooZX9DaYRBVCNW5wxn0Ds1FM9CsvfyOPbyKF9xtjjN9QqqYketJ3WeHj
 P7LAJuiw0Y72L7p3Gl0K+elu1PHzC11Dz45zjpkh9XO9k1i3Wzzg7JbayVbvMCbGDQiq
 bnEoYoRy5+b30rOA+1/3aAjuYLH6mIy23leaFq2ckQCUoY+hc3Ke9GuU/Jfh14THLIk3
 N0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NJgOSqoCCgXqOknLz7AdQYpr89OwA0jzXUySVyR80Xs=;
 b=BgHN4QroxpMh0nE/uKWNmFfnnu8q+zt9WMbYes91QCFXuSc2yPqi5KIM5nryperLtc
 moSMXBWk9oZ6PsS3BgmqFv52hjIMB5BPThbNX+Xi3ppvlC3KLSPQCl4xlnpNs1qUrrFB
 2IqZ9Zdk5tAsb9Bu3SorUKaErVgXhfB7bvGlfhcSEnjcH+RSjiFkR0ypgH6/TxnOPNI9
 SJAP4S5Ti/miR7E3qFUn0DfiUM/JVN94m2CKF7pW02UGgfE+rO/rZZUJIQa0Msux1Frv
 wKVbU6mWTrIMZT56AtzyXhffwBTvq9CGNc6lK2LVfnWEWgtuSvxUz40IsU4H67wC/hxt
 lPTg==
X-Gm-Message-State: AOAM532+IN4rAUNFg4XpPVPwSNu6WKDPZbXzViKdcAxfcGJP0/On7B+J
 brzmDuB6wPAoMQmLNr19zBLD0g==
X-Google-Smtp-Source: ABdhPJxNZ3GZnwKRx3cEfL0sobv2ozaQ3OzXMKIBQI9jkD1YsD2fOajFBkhLkC09EyiLBtdLx1KUIg==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr3990455wmk.51.1633604517859; 
 Thu, 07 Oct 2021 04:01:57 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:15:13:aedf:c006:6996:1a79])
 by smtp.gmail.com with ESMTPSA id c185sm8441412wma.8.2021.10.07.04.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 04:01:56 -0700 (PDT)
Date: Thu, 7 Oct 2021 13:01:51 +0200
From: Marco Elver <elver@google.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kasan-dev@googlegroups.com,
 Vijayanand Jitta <vjitta@codeaurora.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Oliver Glitta <glittao@gmail.com>, Imran Khan <imran.f.khan@oracle.com>
Subject: Re: [PATCH] lib/stackdepot: allow optional init and stack_table
 allocation by kvmalloc()
Message-ID: <YV7TnygBLdHJjmRW@elver.google.com>
References: <20211007095815.3563-1-vbabka@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007095815.3563-1-vbabka@suse.cz>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Mailman-Approved-At: Thu, 07 Oct 2021 11:31:55 +0000
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

On Thu, Oct 07, 2021 at 11:58AM +0200, Vlastimil Babka wrote:
[...] 
> - Add a CONFIG_STACKDEPOT_ALWAYS_INIT flag to keep using the current
>   well-defined point of allocation as part of mem_init(). Make CONFIG_KASAN
>   select this flag.
> - Other users have to call stack_depot_init() as part of their own init when
>   it's determined that stack depot will actually be used. This may depend on
>   both config and runtime conditions. Convert current users which are
>   page_owner and several in the DRM subsystem. Same will be done for SLUB
>   later.
> - Because the init might now be called after the boot-time memblock allocation
>   has given all memory to the buddy allocator, change stack_depot_init() to
>   allocate stack_table with kvmalloc() when memblock is no longer available.
>   Also handle allocation failure by disabling stackdepot (could have
>   theoretically happened even with memblock allocation previously), and don't
>   unnecessarily align the memblock allocation to its own size anymore.
...
> Hi, I'd appreciate review of the DRM parts - namely that I've got correctly
> that stack_depot_init() is called from the proper init functions and iff
> stack_depot_save() is going to be used later. Thanks!

For ease of review between stackdepot and DRM changes, I thought it'd be
nice to split into 2 patches, but not sure it'll work, because you're
changing the semantics of the normal STACKDEPOT.

One option would be to flip it around, and instead have
STACKDEPOT_LAZY_INIT, but that seems counter-intuitive if the majority
of STACKDEPOT users are LAZY_INIT users.

On the other hand, the lazy initialization mode you're introducing
requires an explicit stack_depot_init() call somewhere and isn't as
straightforward as before.

Not sure what is best. My intuition tells me STACKDEPOT_LAZY_INIT would
be safer as it's a deliberate opt-in to the lazy initialization
behaviour.

Preferences?

[...]
> --- a/drivers/gpu/drm/drm_mm.c
> +++ b/drivers/gpu/drm/drm_mm.c
> @@ -980,6 +980,10 @@ void drm_mm_init(struct drm_mm *mm, u64 start, u64 size)
>  	add_hole(&mm->head_node);
>  
>  	mm->scan_active = 0;
> +
> +#ifdef CONFIG_DRM_DEBUG_MM
> +	stack_depot_init();
> +#endif

DRM_DEBUG_MM implies STACKDEPOT. Not sure what is more readable to drm
maintainers, but perhaps it'd be nicer to avoid the #ifdef here, and
instead just keep the no-op version of stack_depot_init() in
<linux/stackdepot.h>. I don't have a strong preference.

>  }
>  EXPORT_SYMBOL(drm_mm_init);
>  
> diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
> index 0d85f3c5c526..806c32ab410b 100644
> --- a/drivers/gpu/drm/i915/intel_runtime_pm.c
> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
> @@ -68,6 +68,9 @@ static noinline depot_stack_handle_t __save_depot_stack(void)
>  static void init_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
>  {
>  	spin_lock_init(&rpm->debug.lock);
> +
> +	if (rpm->available)
> +		stack_depot_init();
>  }
>  
>  static noinline depot_stack_handle_t
> diff --git a/include/linux/stackdepot.h b/include/linux/stackdepot.h
> index c34b55a6e554..60ba99a43745 100644
> --- a/include/linux/stackdepot.h
> +++ b/include/linux/stackdepot.h
> @@ -15,6 +15,16 @@
>  
>  typedef u32 depot_stack_handle_t;
>  
> +/*
> + * Every user of stack depot has to call this during its own init when it's
> + * decided that it will be calling stack_depot_save() later.
> + *
> + * The alternative is to select STACKDEPOT_ALWAYS_INIT to have stack depot
> + * enabled as part of mm_init(), for subsystems where it's known at compile time
> + * that stack depot will be used.
> + */
> +int stack_depot_init(void);
> +
>  depot_stack_handle_t __stack_depot_save(unsigned long *entries,
>  					unsigned int nr_entries,
>  					gfp_t gfp_flags, bool can_alloc);
> @@ -30,13 +40,4 @@ int stack_depot_snprint(depot_stack_handle_t handle, char *buf, size_t size,
>  
>  void stack_depot_print(depot_stack_handle_t stack);
>  
> -#ifdef CONFIG_STACKDEPOT
> -int stack_depot_init(void);
> -#else
> -static inline int stack_depot_init(void)
> -{
> -	return 0;
> -}
> -#endif	/* CONFIG_STACKDEPOT */
> -

Could we avoid the IS_ENABLED() in init/main.c by adding a wrapper here:

+#ifdef CONFIG_STACKDEPOT_ALWAYS_INIT
+static inline int stack_depot_early_init(void)	{ return stack_depot_init(); }
+#else
+static inline int stack_depot_early_init(void)	{ return 0; }
+#endif	/* CONFIG_STACKDEPOT_ALWAYS_INIT */

>  #endif
> diff --git a/init/main.c b/init/main.c
> index ee4d3e1b3eb9..b6a5833d98f5 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -844,7 +844,8 @@ static void __init mm_init(void)
>  	init_mem_debugging_and_hardening();
>  	kfence_alloc_pool();
>  	report_meminit();
> -	stack_depot_init();
> +	if (IS_ENABLED(CONFIG_STACKDEPOT_ALWAYS_INIT))
> +		stack_depot_init();

I'd push the decision of when to call this into <linux/stackdepot.h> via
wrapper stack_depot_early_init().

>  	mem_init();
>  	mem_init_print_info();
>  	/* page_owner must be initialized after buddy is ready */
> diff --git a/lib/Kconfig b/lib/Kconfig
> index 5e7165e6a346..df6bcf0a4cc3 100644
> --- a/lib/Kconfig
> +++ b/lib/Kconfig
> @@ -671,6 +671,9 @@ config STACKDEPOT
>  	bool
>  	select STACKTRACE
>  
> +config STACKDEPOT_ALWAYS_INIT
> +	bool

It looks like every users of STACKDEPOT_ALWAYS_INIT will also select
STACKDEPOT, so we could just make this:

+config STACKDEPOT_ALWAYS_INIT
+	bool
+	select STACKDEPOT

And remove the redundant 'select STACKDEPOT' in Kconfig.kasan.

>  config STACK_HASH_ORDER
>  	int "stack depot hash size (12 => 4KB, 20 => 1024KB)"
>  	range 12 20
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index cdc842d090db..695deb603c66 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -39,6 +39,7 @@ menuconfig KASAN
>  		   HAVE_ARCH_KASAN_HW_TAGS
>  	depends on (SLUB && SYSFS) || (SLAB && !DEBUG_SLAB)
>  	select STACKDEPOT
> +	select STACKDEPOT_ALWAYS_INIT

[...]
>  
> -int __init stack_depot_init(void)
> +/*
> + * __ref because of memblock_alloc(), which will not be actually called after
> + * the __init code is gone

The reason is that after __init code is gone, slab_is_available() will
be true (might be worth adding to the comment).

> + */
> +__ref int stack_depot_init(void)
>  {
> -	if (!stack_depot_disable) {
> +	mutex_lock(&stack_depot_init_mutex);
> +	if (!stack_depot_disable && stack_table == NULL) {
>  		size_t size = (STACK_HASH_SIZE * sizeof(struct stack_record *));

Thanks,
-- Marco
