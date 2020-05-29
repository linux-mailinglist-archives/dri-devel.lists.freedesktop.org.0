Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 140471E88DA
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 22:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7C66E966;
	Fri, 29 May 2020 20:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF25A6E966
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 20:26:39 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21339494-1500050 for multiple; Fri, 29 May 2020 21:26:21 +0100
MIME-Version: 1.0
In-Reply-To: <20200529201534.474853-1-arnd@arndb.de>
References: <20200529201534.474853-1-arnd@arndb.de>
From: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/selftests/mm: reduce per-function stack usage
To: Christian König <christian.koenig@amd.com>, Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Nirmoy Das <nirmoy.das@amd.com>
Message-ID: <159078398171.4326.11332427648947797488@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Fri, 29 May 2020 21:26:21 +0100
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kbuild test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Arnd Bergmann (2020-05-29 21:15:26)
> The check_reserve_boundaries() function has a large array on the stack,
> over 500 bytes. It gets inlined into __igt_reserve, which has multiple
> other large structures as well but stayed just under the stack size
> warning limit of 1024 bytes until one more member got added to struct
> drm_mm_node, causing a warning:
> 
> drivers/gpu/drm/selftests/test-drm_mm.c:371:12: error:
> stack frame size of 1032 bytes in function '__igt_reserve' [-Werror,-Wframe-larger-than=]
> 
> As far as I can tell, this is not nice but will not be called from
> a context that is already low for the kernel stack, so just annotate
> the inner function as noinline_for_stack to ensure that each function
> by itself stays under the warning limit.
> 
> Fixes: 0cdea4455acd ("drm/mm: optimize rb_hole_addr rbtree search")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/selftests/test-drm_mm.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/selftests/test-drm_mm.c
> index 9aabe82dcd3a..30108c330db8 100644
> --- a/drivers/gpu/drm/selftests/test-drm_mm.c
> +++ b/drivers/gpu/drm/selftests/test-drm_mm.c
> @@ -323,9 +323,8 @@ static bool expect_reserve_fail(struct drm_mm *mm, struct drm_mm_node *node)
>         return false;
>  }
>  
> -static bool check_reserve_boundaries(struct drm_mm *mm,
> -                                    unsigned int count,
> -                                    u64 size)
> +static noinline_for_stack bool
> +check_reserve_boundaries(struct drm_mm *mm, unsigned int count, u64 size)
>  {
>         const struct boundary {

It's this const [] right? Hmm, if we felt adventurous that could be a
small set of multiplication factors (0, -1, 1, count, count+1, ...) and
made static.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
