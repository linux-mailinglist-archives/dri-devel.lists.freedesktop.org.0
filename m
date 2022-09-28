Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5CC5EE87A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 23:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FF510E99D;
	Wed, 28 Sep 2022 21:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB6210E99D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 21:40:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 19CC21F45F;
 Wed, 28 Sep 2022 21:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1664401248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C18vkSCkEp0R0j/E8doyhXlqBRc6MmmoczHaFz5Tq/o=;
 b=O8ZKN2zJZST2anqWW6kCZ7PFlJtkR+DhFF/E1xFtpBjfMisY/NEE2VUHIT0ctG6+BRKpcm
 TFzItcWnIOwSwp96McUWnDjo0baCWUX3p/6aNYk16N1G1gVpmFAU0HxXjLM93Ltz5am9pC
 6mcBPOCE9PClr4mk2WyQ3I6f95q7OjY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1664401248;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C18vkSCkEp0R0j/E8doyhXlqBRc6MmmoczHaFz5Tq/o=;
 b=QuVwGzEY77p785Z+8T99wXOp96mLv9PVymdpRO3H5bysX/SgsIeBkJWmKXpwJqWMN6hRxn
 P80vd3XHeULykLAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DA18F13A84;
 Wed, 28 Sep 2022 21:40:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pwxsNF6/NGNaHwAAMHmgww
 (envelope-from <vbabka@suse.cz>); Wed, 28 Sep 2022 21:40:46 +0000
Message-ID: <d5cb63f4-b1f5-9862-c31c-c8c6c4cb41df@suse.cz>
Date: Wed, 28 Sep 2022 23:39:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 01/16] slab: Remove __malloc attribute from realloc
 functions
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220923202822.2667581-1-keescook@chromium.org>
 <20220923202822.2667581-2-keescook@chromium.org>
 <CAMuHMdXK+UN1YVZm9DenuXAM8hZRUZJwp=SXsueP7sWiVU3a9A@mail.gmail.com>
 <202209281011.66DD717D@keescook>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <202209281011.66DD717D@keescook>
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
Cc: Roman Gushchin <roman.gushchin@linux.dev>, dri-devel@lists.freedesktop.org,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Christoph Lameter <cl@linux.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, llvm@lists.linux.dev,
 Josef Bacik <josef@toxicpanda.com>, linaro-mm-sig@lists.linaro.org,
 Yonghong Song <yhs@fb.com>, David Sterba <dsterba@suse.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Alex Elder <elder@kernel.org>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/28/22 19:13, Kees Cook wrote:
> On Wed, Sep 28, 2022 at 09:26:15AM +0200, Geert Uytterhoeven wrote:
>> Hi Kees,
>>
>> On Fri, Sep 23, 2022 at 10:35 PM Kees Cook <keescook@chromium.org> wrote:
>>> The __malloc attribute should not be applied to "realloc" functions, as
>>> the returned pointer may alias the storage of the prior pointer. Instead
>>> of splitting __malloc from __alloc_size, which would be a huge amount of
>>> churn, just create __realloc_size for the few cases where it is needed.
>>>
>>> Additionally removes the conditional test for __alloc_size__, which is
>>> always defined now.
>>>
>>> Cc: Christoph Lameter <cl@linux.com>
>>> Cc: Pekka Enberg <penberg@kernel.org>
>>> Cc: David Rientjes <rientjes@google.com>
>>> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: Vlastimil Babka <vbabka@suse.cz>
>>> Cc: Roman Gushchin <roman.gushchin@linux.dev>
>>> Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>
>>> Cc: Marco Elver <elver@google.com>
>>> Cc: linux-mm@kvack.org
>>> Signed-off-by: Kees Cook <keescook@chromium.org>
>>
>> Thanks for your patch, which is now commit 63caa04ec60583b1 ("slab:
>> Remove __malloc attribute from realloc functions") in next-20220927.
>>
>> Noreply@ellerman.id.au reported all gcc8-based builds to fail
>> (e.g. [1], more at [2]):
>>
>>      In file included from <command-line>:
>>      ./include/linux/percpu.h: In function ‘__alloc_reserved_percpu’:
>>      ././include/linux/compiler_types.h:279:30: error: expected
>> declaration specifiers before ‘__alloc_size__’
>>       #define __alloc_size(x, ...) __alloc_size__(x, ## __VA_ARGS__) __malloc
>>                                    ^~~~~~~~~~~~~~
>>      ./include/linux/percpu.h:120:74: note: in expansion of macro ‘__alloc_size’
>>      [...]
>>
>> It's building fine with e.g. gcc-9 (which is my usual m68k cross-compiler).
>> Reverting this commit on next-20220927 fixes the issue.
>>
>> [1] http://kisskb.ellerman.id.au/kisskb/buildresult/14803908/
>> [2] http://kisskb.ellerman.id.au/kisskb/head/1bd8b75fe6adeaa89d02968bdd811ffe708cf839/
> 
> Eek! Thanks for letting me know. I'm confused about this --
> __alloc_size__ wasn't optional in compiler_attributes.h -- but obviously
> I broke something! I'll go figure this out.

Even in latest next I can see at the end of include/linux/compiler-gcc.h

/*
  * Prior to 9.1, -Wno-alloc-size-larger-than (and therefore the "alloc_size"
  * attribute) do not work, and must be disabled.
  */
#if GCC_VERSION < 90100
#undef __alloc_size__
#endif



> -Kees
> 

