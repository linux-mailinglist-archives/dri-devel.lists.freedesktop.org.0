Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AE63AE61C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 11:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE22A89E57;
	Mon, 21 Jun 2021 09:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8626C89C82;
 Mon, 21 Jun 2021 09:33:09 +0000 (UTC)
IronPort-SDR: sP6JXcqeWDWNDXPNfAMwTAB73LK5H1eIhD4RzVbHCEmqGUQ4yQ7EOfxDym6H68pRcZ5wMAYePY
 r1nGSbRJ0DQQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="193944800"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="193944800"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 02:33:08 -0700
IronPort-SDR: wFrD0tK20fhhWLvwMJt3LZBMY3mkfdM+3b9zce1xOzcZJxuKaackEKYE2CiH8A1ZTrPC+sb9J7
 gG1SmM4jwFAw==
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="405907593"
Received: from nelsonho-mobl.ger.corp.intel.com (HELO [10.252.31.53])
 ([10.252.31.53])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 02:33:05 -0700
Subject: Re: [PATCH] drm/i915/eb: Fix pagefault disabling in the first slowpath
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20210618214503.1773805-1-daniel.vetter@ffwll.ch>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <8678b7b8-ad42-3e14-158e-77994b299c6e@intel.com>
Date: Mon, 21 Jun 2021 10:33:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210618214503.1773805-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/06/2021 22:45, Daniel Vetter wrote:
> In
> 
> commit ebc0808fa2da0548a78e715858024cb81cd732bc
> Author: Chris Wilson <chris@chris-wilson.co.uk>
> Date:   Tue Oct 18 13:02:51 2016 +0100
> 
>      drm/i915: Restrict pagefault disabling to just around copy_from_user()
> 
> we entirely missed that there's a slow path call to eb_relocate_entry
> (or i915_gem_execbuffer_relocate_entry as it was called back then)
> which was left fully wrapped by pagefault_disable/enable() calls.
> Previously any issues with blocking calls where handled by the
> following code:
> 
> 	/* we can't wait for rendering with pagefaults disabled */
> 	if (pagefault_disabled() && !object_is_idle(obj))
> 		return -EFAULT;
> 
> Now at this point the prefaulting was still around, which means in
> normal applications it was very hard to hit this bug. No idea why the
> regressions in igts weren't caught.
> 
> Now this all changed big time with 2 patches merged closely together.
> 
> First
> 
> commit 2889caa9232109afc8881f29a2205abeb5709d0c
> Author: Chris Wilson <chris@chris-wilson.co.uk>
> Date:   Fri Jun 16 15:05:19 2017 +0100
> 
>      drm/i915: Eliminate lots of iterations over the execobjects array
> 
> removes the prefaulting from the first relocation path, pushing it into
> the first slowpath (of which this patch added a total of 3 escalation
> levels). This would have really quickly uncovered the above bug, were
> it not for immediate adding a duct-tape on top with
> 
> commit 7dd4f6729f9243bd7046c6f04c107a456bda38eb
> Author: Chris Wilson <chris@chris-wilson.co.uk>
> Date:   Fri Jun 16 15:05:24 2017 +0100
> 
>      drm/i915: Async GPU relocation processing
> 
> by pushing all all the relocation patching to the gpu if the buffer
> was busy, which avoided all the possible blocking calls.
> 
> The entire slowpath was then furthermore ditched in
> 
> commit 7dc8f1143778a35b190f9413f228b3cf28f67f8d
> Author: Chris Wilson <chris@chris-wilson.co.uk>
> Date:   Wed Mar 11 16:03:10 2020 +0000
> 
>          drm/i915/gem: Drop relocation slowpath
> 
> and resurrected in
> 
> commit fd1500fcd4420eee06e2c7f3aa6067b78ac05871
> Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Date:   Wed Aug 19 16:08:43 2020 +0200
> 
>          Revert "drm/i915/gem: Drop relocation slowpath".
> 
> but this did not further impact what's going on.
> 
> Since pagefault_disable/enable is an atomic section, any sleeping in
> there is prohibited, and we definitely do that without gpu relocations
> since we have to wait for the gpu usage to finish before we can patch
> up the relocations.

Why do we also need the __copy_from_user_inatomic in eb_relocate_vma()?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 6539b82dda54..7ff2fc3c0b2c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2082,9 +2082,7 @@ static noinline int eb_relocate_parse_slow(struct i915_execbuffer *eb,
>   
>   	list_for_each_entry(ev, &eb->relocs, reloc_link) {
>   		if (!have_copy) {
> -			pagefault_disable();
>   			err = eb_relocate_vma(eb, ev);
> -			pagefault_enable();
>   			if (err)
>   				break;
>   		} else {
> 
