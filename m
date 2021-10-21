Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E234369C3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 19:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBAE6ECF6;
	Thu, 21 Oct 2021 17:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87926ECE3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 17:51:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CBB4E1FD50;
 Thu, 21 Oct 2021 17:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1634838680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZsmryUSY+wyzBCewqKbucEe4Xr/mA/KtNiq91fwmf3A=;
 b=PnEvVpjOdGRum8Yi1lPCAcQmRrFYxfVAJbY2HicvlwFJWrwZ8GbGv5BsKzHpUKzwBY/A0E
 8XuWXQdNZw0SSsh1nw8d1g1nlqB/J6MYKPNnUGybjz2HiO7s5zzZMcX35ARmL6tiB5A10e
 8NsmfW34eQJPebot5mY864hTaTCIFNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1634838680;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZsmryUSY+wyzBCewqKbucEe4Xr/mA/KtNiq91fwmf3A=;
 b=NmH9BRpdir7XsJGX76dVPoS6qCbZ/Z64AZzq2szzU/NvG2Pv95G7BE5H/BbNgZeqUl26uP
 Jzts5ewqP+76XeCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 674FE13AE4;
 Thu, 21 Oct 2021 17:51:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id p9V5GJiocWGLFgAAMHmgww
 (envelope-from <vbabka@suse.cz>); Thu, 21 Oct 2021 17:51:20 +0000
Message-ID: <2a692365-cfa1-64f2-34e0-8aa5674dce5e@suse.cz>
Date: Thu, 21 Oct 2021 19:51:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Elver <elver@google.com>, Vijayanand Jitta <vjitta@codeaurora.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Oliver Glitta
 <glittao@gmail.com>, Imran Khan <imran.f.khan@oracle.com>,
 lkft-triage@lists.linaro.org, Stephen Rothwell <sfr@canb.auug.org.au>
References: <CA+G9fYv3jAjBKHM-CjrMzNgrptx-rpYVmGaD39OBiBeuz7osfg@mail.gmail.com>
 <80ab567d-74f3-e14b-3c30-e64bbd64b354@suse.cz> <87fssuojoc.fsf@intel.com>
From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [next] [dragonboard 410c] Unable to handle kernel paging request
 at virtual address 00000000007c4240
In-Reply-To: <87fssuojoc.fsf@intel.com>
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

On 10/21/21 10:40, Jani Nikula wrote:
> On Thu, 21 Oct 2021, Vlastimil Babka <vbabka@suse.cz> wrote:
>> This one seems a bit more tricky and I could really use some advice.
>> cd06ab2fd48f adds stackdepot usage to drm_modeset_lock which itself has a
>> number of different users and requiring those to call stack_depot_init()
>> would be likely error prone. Would it be ok to add the call of
>> stack_depot_init() (guarded by #ifdef CONFIG_DRM_DEBUG_MODESET_LOCK) to
>> drm_modeset_lock_init()? It will do a mutex_lock()/unlock(), and kvmalloc()
>> on first call.
>> I don't know how much of hotpath this is, but hopefully should be acceptable
>> in debug config. Or do you have better suggestion? Thanks.
> 
> I think that should be fine.
> 
> Maybe add __drm_stack_depot_init() in the existing #if
> IS_ENABLED(CONFIG_DRM_DEBUG_MODESET_LOCK), similar to the other
> __drm_stack_depot_*() functions, with an empty stub for
> CONFIG_DRM_DEBUG_MODESET_LOCK=n, and call it unconditionally in
> drm_modeset_lock_init().

Good idea.
 
>> Then we have to figure out how to order a fix between DRM and mmotm...
> 
> That is the question! The problem exists only in the merge of the
> two. On current DRM side stack_depot_init() exists but it's __init and
> does not look safe to call multiple times. And obviously my changes
> don't exist at all in mmotm.
> 
> I guess one (admittedly hackish) option is to first add a patch in
> drm-next (or drm-misc-next) that makes it safe to call
> stack_depot_init() multiple times in non-init context. It would be
> dropped in favour of your changes once the trees get merged together.
> 
> Or is there some way for __drm_stack_depot_init() to detect whether it
> should call stack_depot_init() or not, i.e. whether your changes are
> there or not?

Let's try the easiest approach first. AFAIK mmotm series is now split to
pre-next and post-next part and moving my patch
lib-stackdepot-allow-optional-init-and-stack_table-allocation-by-kvmalloc.patch
with the following fixup to the post-next part should solve this. Would that
work, Andrew? Thanks.

----8<----
From 719e91df5571034b62fa992f6738b00f8d29020e Mon Sep 17 00:00:00 2001
From: Vlastimil Babka <vbabka@suse.cz>
Date: Thu, 21 Oct 2021 19:43:33 +0200
Subject: [PATCH] lib/stackdepot: allow optional init and stack_table
 allocation by kvmalloc() - fixup3

Due to cd06ab2fd48f ("drm/locking: add backtrace for locking contended locks
without backoff") landing recently to -next adding a new stack depot user in
drivers/gpu/drm/drm_modeset_lock.c we need to add an appropriate call to
stack_depot_init() there as well.

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 drivers/gpu/drm/drm_modeset_lock.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
index c97323365675..918065982db4 100644
--- a/drivers/gpu/drm/drm_modeset_lock.c
+++ b/drivers/gpu/drm/drm_modeset_lock.c
@@ -107,6 +107,11 @@ static void __drm_stack_depot_print(depot_stack_handle_t stack_depot)
 
 	kfree(buf);
 }
+
+static void __drm_stack_depot_init(void)
+{
+	stack_depot_init();
+}
 #else /* CONFIG_DRM_DEBUG_MODESET_LOCK */
 static depot_stack_handle_t __drm_stack_depot_save(void)
 {
@@ -115,6 +120,9 @@ static depot_stack_handle_t __drm_stack_depot_save(void)
 static void __drm_stack_depot_print(depot_stack_handle_t stack_depot)
 {
 }
+static void __drm_stack_depot_init(void)
+{
+}
 #endif /* CONFIG_DRM_DEBUG_MODESET_LOCK */
 
 /**
@@ -359,6 +367,7 @@ void drm_modeset_lock_init(struct drm_modeset_lock *lock)
 {
 	ww_mutex_init(&lock->mutex, &crtc_ww_class);
 	INIT_LIST_HEAD(&lock->head);
+	__drm_stack_depot_init();
 }
 EXPORT_SYMBOL(drm_modeset_lock_init);
 
-- 
2.33.0

