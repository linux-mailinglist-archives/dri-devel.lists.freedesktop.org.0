Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D525EA7A0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 15:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885BA10E6B7;
	Mon, 26 Sep 2022 13:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3678610E6B7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 13:50:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BD2191F381;
 Mon, 26 Sep 2022 13:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1664200244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4+nnignD8u93QTMbO+4vxufOtmSDjzXgxDuRW+9Vc+Y=;
 b=wXNPeKYY807oTGOEqp5VUsWItY4N/bf2FG0PYuKf/76ya/XWXoSBlutnZ1v4V7ZTVE24Jq
 kcDNiVz+QDDTZinU63vcP0aQKnt9DxgJ/Il0N5ifhw8+wIaLXqfcS4eEjoUOz7O6KuQRXh
 6XNfMe0qLNWn1mp8715x1o53Ql+qjsY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1664200244;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4+nnignD8u93QTMbO+4vxufOtmSDjzXgxDuRW+9Vc+Y=;
 b=HGu2wC9OaQUC3t9QLyIF5OanWAJ3MVeu2wqtrCmlnZR0Vt3rj6ay/cPA71LiUBug2kTQ26
 BQkvYbGQFVWjp7Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 275AE139BD;
 Mon, 26 Sep 2022 13:50:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cuKbCDSuMWOIeAAAMHmgww
 (envelope-from <vbabka@suse.cz>); Mon, 26 Sep 2022 13:50:44 +0000
Message-ID: <f4fc52c4-7c18-1d76-0c7a-4058ea2486b9@suse.cz>
Date: Mon, 26 Sep 2022 15:50:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 13/16] mempool: Use kmalloc_size_roundup() to match
 ksize() usage
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
References: <20220923202822.2667581-1-keescook@chromium.org>
 <20220923202822.2667581-14-keescook@chromium.org>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20220923202822.2667581-14-keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>, Eric Dumazet <edumazet@google.com>,
 linux-hardening@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Christoph Lameter <cl@linux.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, Jakub Kicinski <kuba@kernel.org>,
 David Sterba <dsterba@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Alex Elder <elder@kernel.org>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "David S. Miller" <davem@davemloft.net>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/23/22 22:28, Kees Cook wrote:
> Round up allocations with kmalloc_size_roundup() so that mempool's use
> of ksize() is always accurate and no special handling of the memory is
> needed by KASAN, UBSAN_BOUNDS, nor FORTIFY_SOURCE.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>   mm/mempool.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/mempool.c b/mm/mempool.c
> index 96488b13a1ef..0f3107b28e6b 100644
> --- a/mm/mempool.c
> +++ b/mm/mempool.c
> @@ -526,7 +526,7 @@ EXPORT_SYMBOL(mempool_free_slab);
>    */
>   void *mempool_kmalloc(gfp_t gfp_mask, void *pool_data)
>   {
> -	size_t size = (size_t)pool_data;
> +	size_t size = kmalloc_size_roundup((size_t)pool_data);

Hm it is kinda wasteful to call into kmalloc_size_roundup for every 
allocation that has the same input. We could do it just once in 
mempool_init_node() for adjusting pool->pool_data ?

But looking more closely, I wonder why poison_element() and 
kasan_unpoison_element() in mm/mempool.c even have to use 
ksize()/__ksize() and not just operate on the requested size (again, 
pool->pool_data). If no kmalloc mempool's users use ksize() to write 
beyond requested size, then we don't have to unpoison/poison that area 
either?

>   	return kmalloc(size, gfp_mask);
>   }
>   EXPORT_SYMBOL(mempool_kmalloc);

