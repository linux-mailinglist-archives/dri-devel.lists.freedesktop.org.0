Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9E3429FE9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 10:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0B789FC3;
	Tue, 12 Oct 2021 08:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA08489FC3;
 Tue, 12 Oct 2021 08:31:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 79F0220189;
 Tue, 12 Oct 2021 08:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1634027504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jzhciBvqQ0vTMCmMY7ans9eWDLkjdIgrfHAs17HgGQk=;
 b=GBFKzyqP4aFaQYz4LYka2c25/WepD8eDLhKgmdlwDY6a8+PWKuJOb/YiFgASvKISf+L/pN
 FFzTAIJY1yefHrYYwunVYeLbVw0tieKnuvSd6XVLWG0qQWCEm3uATRZKjOAVKucSkYj50p
 BpzuKXYmE+VYr0N1cW0G+pdI9wI8XsM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1634027504;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jzhciBvqQ0vTMCmMY7ans9eWDLkjdIgrfHAs17HgGQk=;
 b=HJtXWc9v/GvoS2ZYZ+y3ofWWVJOYc0BvONGgP+qhjWtSFMdTcUMAsyyfJnKKIrhzt7u3Nr
 XBa1gvw9kPfaDFAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E7E8613AD5;
 Tue, 12 Oct 2021 08:31:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +SDwN+9HZWFCSwAAMHmgww
 (envelope-from <vbabka@suse.cz>); Tue, 12 Oct 2021 08:31:43 +0000
Message-ID: <f4f9c5b8-7bff-4d5d-8768-5e58ee1cc907@suse.cz>
Date: Tue, 12 Oct 2021 10:31:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] lib/stackdepot: allow optional init and stack_table
 allocation by kvmalloc()
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
 <2a62971d-467f-f354-caac-2b5ecf258e3c@suse.cz>
 <CANpmjNP4U9a5HFoRt=HLHpUCNiR5v82ia++wfRCezTY1TpR9RA@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <CANpmjNP4U9a5HFoRt=HLHpUCNiR5v82ia++wfRCezTY1TpR9RA@mail.gmail.com>
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

On 10/11/21 19:08, Marco Elver wrote:
> On Mon, 11 Oct 2021 at 19:02, Vlastimil Babka <vbabka@suse.cz> wrote:
> [...]
>> > On the other hand, the lazy initialization mode you're introducing
>> > requires an explicit stack_depot_init() call somewhere and isn't as
>> > straightforward as before.
>> >
>> > Not sure what is best. My intuition tells me STACKDEPOT_LAZY_INIT would
>> > be safer as it's a deliberate opt-in to the lazy initialization
>> > behaviour.
>>
>> I think it should be fine with ALWAYS_INIT. There are not many stackdepot
>> users being added, and anyone developing a new one will very quickly find
>> out if they forget to call stack_depot_init()?
> 
> I think that's fine.
> 
>> > Preferences?
>> >
>> > [...]
>> >> --- a/drivers/gpu/drm/drm_mm.c
>> >> +++ b/drivers/gpu/drm/drm_mm.c
>> >> @@ -980,6 +980,10 @@ void drm_mm_init(struct drm_mm *mm, u64 start, u64 size)
>> >>      add_hole(&mm->head_node);
>> >>
>> >>      mm->scan_active = 0;
>> >> +
>> >> +#ifdef CONFIG_DRM_DEBUG_MM
>> >> +    stack_depot_init();
>> >> +#endif
>> >
>> > DRM_DEBUG_MM implies STACKDEPOT. Not sure what is more readable to drm
>> > maintainers, but perhaps it'd be nicer to avoid the #ifdef here, and
>> > instead just keep the no-op version of stack_depot_init() in
>> > <linux/stackdepot.h>. I don't have a strong preference.
>>
>> Hm, but in case STACKDEPOT is also selected by something else (e.g.
>> CONFIG_PAGE_OWNER) which uses lazy init but isn't enabled on boot, then
>> without #ifdef CONFIG_DRM_DEBUG_MM above, this code would call a
>> stack_depot_init() (that's not a no-op) even in case it's not going to be
>> using it, so not what we want to achieve.
>> But it could be changed to use IS_ENABLED() if that's preferred by DRM folks.
> 
> You're right -- but I'll leave this to DRM folks.

Ah, the file only includes stackdepot.h in a #ifdef CONFIG_DRM_DEBUG_MM
section so I will keep the #ifdef here for a minimal change, unless
requested otherwise.
