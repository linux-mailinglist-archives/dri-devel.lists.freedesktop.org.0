Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89460A75F4A
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 09:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12E210E0A2;
	Mon, 31 Mar 2025 07:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sUeX4UTO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e+Ly3arK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TRu7g0+D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2AG3vZvc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A179110E0A2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 07:14:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DCBF51F38D;
 Mon, 31 Mar 2025 07:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743405240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XhvY6BQczok9g60AIDy9OSIKgryzoWsw++4Pjv3m0Oc=;
 b=sUeX4UTOEGGYkOWpHQCYw0yGzvIecNlOQiPuP5shTfG75yNYad3nysyttqmfL7pSx59lQm
 0TZyTSyVjBijw9b8U7zlM+qSRZxzO0J+BY0Kov/1COe9isgbGdEOz4UdH7yNDmoC3zZtz2
 6UzKMablUMo3B9vZqwbpCdH0AEnFxxk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743405240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XhvY6BQczok9g60AIDy9OSIKgryzoWsw++4Pjv3m0Oc=;
 b=e+Ly3arK0/rEfSVnE0tDnYxoCKccQz3/UzlfpQeoN5IBUr76qinE6JIihEUbxUisc5uDGP
 mTfrCOe3MdJBHtBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743405239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XhvY6BQczok9g60AIDy9OSIKgryzoWsw++4Pjv3m0Oc=;
 b=TRu7g0+DulNjSEg+n/5W05FQ9JJpwv80UVHlqGIRhpqbB32XFsB0ZsAJ12m7lnlMP0T0yg
 mUW0kwWJXHKwvxn79wTtphFvilHSHu82Szshh25zqRJwfUfHpmimRAg5l38rVtEln20yxg
 te6hKKBOHiQZQEkmh/v/ROTbTAQVoIg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743405239;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XhvY6BQczok9g60AIDy9OSIKgryzoWsw++4Pjv3m0Oc=;
 b=2AG3vZvcfGQENkXUdF1QiXt2QfXOlxQhOewf+9yE7ByAGN3pO+ijQgydBc3o3cyFGf8xQp
 YWLGQiNyKLsoB2DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B2AA13A1F;
 Mon, 31 Mar 2025 07:13:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id RWhZHLdA6mf5IwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 31 Mar 2025 07:13:59 +0000
Message-ID: <c1809502-e9b7-43f7-9d88-0e615bf1ff94@suse.de>
Date: Mon, 31 Mar 2025 09:13:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/6] Introduce sparse DRM shmem object allocations
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250326021433.772196-1-adrian.larumbe@collabora.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20250326021433.772196-1-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[collabora.com,linux-foundation.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,arm.com];
 RCPT_COUNT_TWELVE(0.00)[13]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -4.30
X-Spam-Flag: NO
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

Hi

Am 26.03.25 um 03:14 schrieb Adrián Larumbe:
> This patch series is a proposal for implementing sparse page allocations
> for shmem objects. It was initially motivated by a kind of BO managed by
> the Panfrost driver, the tiler heap, which grows on demand every time the
> GPU faults on a virtual address within its drm_mm-managed ranged.

I've looked at panfrost_gem.h and found that the driver's gem structure 
has grown quite a bit. It seems to have outgrown gem-shmem already.  I 
think you should consider pulling a copy of gem-shmem into the driver 
and building a dedicated memory manager on top.

Best regards
Thomas

>
> Because keeping a struct page pointer array that can describe the entire
> virtual range is wasteful when only a few backing pages have been
> allocated, at Collabora we thought a sparse allocation approach with
> xarrays was a more efficient choice.
>
> Since sparse and 'dense' DRM shmem objects must be managed slightly
> differently, the API is expanded to allow client drivers to create sparse
> objects and also to expand their page backing range, but everything else
> should remain as transparent as possible and be handled from within the DRM
> shmem system itself.
>
> Discussion of previus revision can be found here:
> https://lore.kernel.org/dri-devel/20250218232552.3450939-1-adrian.larumbe@collabora.com/
>
> Changelog:
>   v2:
>    - Removed patch with helper for non-blocking shmem page allocations.
>    - Moved page_array definitions away from scatterlist interface to hide
>    them from consumers.
>    - Refactored sg_alloc_append_table_from_pages() so that it now calls
>    sg_alloc_append_table_from_page_array() to avoid code duplication.
>    - Undid extension of __drm_gem_shmem_create() argument list so that a sparse
>    shmem object is now fully defined in a parent function.
>    - Moved check for absence of backing pages when putting an object into
>    drm_gem_shmem_put_pages()
>    - Added explanatory comments above DRM WARN'ings across yet unimplemented
>    shmem code paths, like kernel vmap's and UM mappings of sparse objects
>    - Created drm_gem helper for doing the actual sparse allocation, to keep
>    the interface aligned with the existing one with regular shmem objects.
>    - Split the body of drm_gem_shmem_get_sparse_pages_locked() into two separate
>    functions, one which performs the actual page allocation, and another
>    one that retrieves an sgtable.
>    - Expanded the argument list of drm_gem_shmem_get_sparse_pages() and its
>    children functions so that it takes an gfp mask, in the even that we would
>    want to do non-blocking allocations, for instance like when we wish to
>    avoid races with the shrinker memory reclaim path.
>    - Created shmem helper that returns whether an shmem object has any backing pages.
>
> TODO:
> The following items need to be worked on, and will be the subject of a v3 of this RFC:
>
>   - Handle the special case when some of the pages in a sparse allocation range are
>     already present, rather than bailing out immediately.
>   - Redefining panfrost_gem_object::sgts into an xarray or perhaps a sg_append_table
>     to avoid memory waste in allocating more sgtable pointers than we could need.
>   - Deciding on the rules for sparse shmem object's kmaps and UM maps.
>
> Adrián Larumbe (6):
>    lib/scatterlist.c: Support constructing sgt from page xarray
>    drm/shmem: Introduce the notion of sparse objects
>    drm/shmem: Implement sparse allocation of pages for shmem objects
>    drm/panfrost: Use shmem sparse allocation for heap BOs
>    drm/shmem: Add a helper to check object's page backing status
>    drm/panfrost/panthor: Take sparse objects into account for fdinfo
>
>   drivers/gpu/drm/drm_gem.c               | 117 +++++++++++
>   drivers/gpu/drm/drm_gem_shmem_helper.c  | 264 +++++++++++++++++++++++-
>   drivers/gpu/drm/panfrost/panfrost_gem.c |  14 +-
>   drivers/gpu/drm/panfrost/panfrost_gem.h |   2 +-
>   drivers/gpu/drm/panfrost/panfrost_mmu.c |  86 ++------
>   drivers/gpu/drm/panthor/panthor_gem.c   |   2 +-
>   include/drm/drm_gem.h                   |   6 +
>   include/drm/drm_gem_shmem_helper.h      |  29 ++-
>   include/linux/scatterlist.h             |  17 ++
>   lib/scatterlist.c                       | 175 +++++++++++-----
>   10 files changed, 579 insertions(+), 133 deletions(-)
>
>
> base-commit: 2f9d51740cc30e0d2c8a23a55b1e20cf2513c250
> --
> 2.48.1

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

