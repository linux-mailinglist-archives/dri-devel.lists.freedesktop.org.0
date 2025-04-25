Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F43A9D28E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 22:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB3610E9B9;
	Fri, 25 Apr 2025 20:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="d26JPcre";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8849D10E9B9
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 20:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745611248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T8/4HYJEyKL0BmypDXzpIvuA602T0FZNtumDp2Gucts=;
 b=d26JPcregejvzteTqqwFI+Nt/wAvd4vSAKTb/5eh4IRxCdMeSp9BqUDJKNGz8ziCoTDVKa
 sNc/gf1MDq0R9Y3S9ymMOFijuuII6pBktbGuxO0MAM0f9q0rUdeBji84f6Cjox4IYD6k/6
 tQ+bie9VxCAa5k3N7aaiT1WlAl1nxM4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-KHfdi28CO_SiRvjRcoMJnw-1; Fri, 25 Apr 2025 16:00:47 -0400
X-MC-Unique: KHfdi28CO_SiRvjRcoMJnw-1
X-Mimecast-MFC-AGG-ID: KHfdi28CO_SiRvjRcoMJnw_1745611247
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5c82c6d72so443287985a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 13:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745611247; x=1746216047;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T8/4HYJEyKL0BmypDXzpIvuA602T0FZNtumDp2Gucts=;
 b=Y5K1FZrRNmZdlHQVMwJIKMJf1gqlvI6sMdFcOrbKvuaFvMOOJqhj1WSl2dlUxW6WCq
 lykxQdduhdt7Y1D1WHwTKyFYs3hm5reCreTmAS/8PFOh2Uv9EHWgSTddBjjXRqyOo2DT
 coz0/9s97U5fYI8Qqu+YH0ZkpxwL9mY05l5hkWc/sipiORxeRCCNFzc3bU+Wi7976lWT
 8F5/92Q7n9E2tjesmvpu+lDzojXrElRJzau0pzHPgJS0NAh+/BtHlVhgAYs5KoiWKuSq
 10rXwJP9tH6FUlcUwK7kPzXlrlYjAWxMFs4RVJ+HBoASUykcgdPucUhYU9vekK1Jk1I5
 uQuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3a/FUCYhQnZXzJCKvUnxeBOQqMOnSzkxtVxIZKxYUFqGN7vx0QjoZTDJ1LqPOFnx25JyVbBdFoTA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfOsTgmpo+1BP3ucH8SgeaGUGEYpYD96PgdN+h2U27DLm6r/Gb
 oiNPoSer6Fo6oYlFCFc7GT0G+4bIvz/4KgqhGPWXzdOlTnYRQwsIu1bj+eICyVBqfkPvDHB3RDP
 +QBP1ShttA3i0ZcU2XtZu/CFUHAZ038x2LxnXYhQANPS+i0m9Ezi67DTzc8iNvp57DQ==
X-Gm-Gg: ASbGnculr7iA1JLrWSLlM25iTS9jIASJJv8Gvvs+ygIln1b1DMHGqaX5Zsqu3ipgE2C
 laWDmg7ID8e7PNnVDJ0HUafpGytgWLFTETW8FW2hPYW2pgRmXtRiGNz20UQ/BJPIRGV53S7zANi
 cUaq6hMsxlhnrgqkDcyaBir7HynzRN24T3+To2ciY3sGOcprx48njmj6hsdO6z8+2s6+alj8Thi
 pcBuGo+Dm6LB9XR3f1sk2ms5E9mh4H48cX+FIjfLnLKx2uM6xHPR2Kamj3V77JySIINdrAsXWY/
 ehw=
X-Received: by 2002:a05:620a:24ca:b0:7c5:dfe6:222a with SMTP id
 af79cd13be357-7c960793e41mr556092885a.42.1745611246990; 
 Fri, 25 Apr 2025 13:00:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp9AqScyuP//w2WTf2DZKa+eTenWSA/B8rLTtbznOGZp/n+4SX/uHlViZL3kDCGa1T/CH6wQ==
X-Received: by 2002:a05:620a:24ca:b0:7c5:dfe6:222a with SMTP id
 af79cd13be357-7c960793e41mr556088285a.42.1745611246549; 
 Fri, 25 Apr 2025 13:00:46 -0700 (PDT)
Received: from x1.local ([85.131.185.92]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c958cbe651sm258957185a.47.2025.04.25.13.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 13:00:45 -0700 (PDT)
Date: Fri, 25 Apr 2025 16:00:42 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>
Subject: Re: [PATCH v1 04/11] mm/memremap: convert to pfnmap_track() +
 pfnmap_untrack()
Message-ID: <aAvp6umyw1AF2DbN@x1.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-5-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250425081715.1341199-5-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pl_4AiIP0MGl95EoDJ5b2cm3BnF7euvL9ky65JIbR8g_1745611247
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

On Fri, Apr 25, 2025 at 10:17:08AM +0200, David Hildenbrand wrote:
> Let's use the new, cleaner interface.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memremap.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 2aebc1b192da9..c417c843e9b1f 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -130,7 +130,7 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
>  	}
>  	mem_hotplug_done();
>  
> -	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
> +	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
>  	pgmap_array_delete(range);
>  }
>  
> @@ -211,8 +211,8 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
>  	if (nid < 0)
>  		nid = numa_mem_id();
>  
> -	error = track_pfn_remap(NULL, &params->pgprot, PHYS_PFN(range->start), 0,
> -			range_len(range));
> +	error = pfnmap_track(PHYS_PFN(range->start), range_len(range),
> +			     &params->pgprot);
>  	if (error)
>  		goto err_pfn_remap;
>  
> @@ -277,7 +277,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
>  	if (!is_private)
>  		kasan_remove_zero_shadow(__va(range->start), range_len(range));
>  err_kasan:
> -	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
> +	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));

Not a huge deal, but maybe we could merge this and previous patch?  It
might be easier to reference the impl when reading the call site changes.

>  err_pfn_remap:
>  	pgmap_array_delete(range);
>  	return error;
> -- 
> 2.49.0
> 

-- 
Peter Xu

