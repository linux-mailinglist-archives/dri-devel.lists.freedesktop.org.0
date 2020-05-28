Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32061E670D
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 18:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4ABA6E5A2;
	Thu, 28 May 2020 16:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530746E15B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 16:04:46 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21324674-1500050 for multiple; Thu, 28 May 2020 17:04:41 +0100
MIME-Version: 1.0
In-Reply-To: <20200528130556.53275-1-nirmoy.das@amd.com>
References: <20200528130556.53275-1-nirmoy.das@amd.com>
Subject: Re: [PATCH] drm/mm: add ig_frag selftest
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
Message-ID: <159068188106.10651.8110655246465285780@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Thu, 28 May 2020 17:04:41 +0100
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
Cc: Nirmoy Das <nirmoy.das@amd.com>, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Nirmoy Das (2020-05-28 14:05:56)
> This patch introduces fragmentation in the address range
> and measures time taken by 10k insertions for each modes.
> 
> ig_frag() will fail if one of the mode takes more than 1 sec.
> 
> Output:
> <snip>
> [   37.326723] drm_mm: igt_sanitycheck - ok!
> [   37.326727] igt_debug 0x0000000000000000-0x0000000000000200: 512: free
> [   37.326728] igt_debug 0x0000000000000200-0x0000000000000600: 1024: used
> [   37.326728] igt_debug 0x0000000000000600-0x0000000000000a00: 1024: free
> [   37.326729] igt_debug 0x0000000000000a00-0x0000000000000e00: 1024: used
> [   37.326730] igt_debug 0x0000000000000e00-0x0000000000001000: 512: free
> [   37.326730] igt_debug total: 4096, used 2048 free 2048
> [   56.040064] drm_mm: best fragmented insert took 504 msecs
> [   56.082184] drm_mm: bottom-up fragmented insert took 40 msecs
> [   56.102255] drm_mm: top-down fragmented insert took 20 msecs
> [   56.107177] drm_mm: evict fragmented insert took 4 msecs
> <snip>
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>  drivers/gpu/drm/selftests/drm_mm_selftests.h |  1 +
>  drivers/gpu/drm/selftests/test-drm_mm.c      | 59 ++++++++++++++++++++
>  2 files changed, 60 insertions(+)
> 
> diff --git a/drivers/gpu/drm/selftests/drm_mm_selftests.h b/drivers/gpu/drm/selftests/drm_mm_selftests.h
> index 6b943ea1c57d..8c87c964176b 100644
> --- a/drivers/gpu/drm/selftests/drm_mm_selftests.h
> +++ b/drivers/gpu/drm/selftests/drm_mm_selftests.h
> @@ -14,6 +14,7 @@ selftest(insert, igt_insert)
>  selftest(replace, igt_replace)
>  selftest(insert_range, igt_insert_range)
>  selftest(align, igt_align)
> +selftest(frag, igt_frag)
>  selftest(align32, igt_align32)
>  selftest(align64, igt_align64)
>  selftest(evict, igt_evict)
> diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/selftests/test-drm_mm.c
> index 9aabe82dcd3a..4c08ca86bb86 100644
> --- a/drivers/gpu/drm/selftests/test-drm_mm.c
> +++ b/drivers/gpu/drm/selftests/test-drm_mm.c
> @@ -1033,6 +1033,65 @@ static int igt_insert_range(void *ignored)
>         return 0;
>  }
>  
> +static int igt_frag(void *ignored)
> +{
> +       const struct insert_mode *mode;
> +       struct drm_mm mm;
> +       struct drm_mm_node *nodes, *node, *next;
> +       unsigned int size = 4096, align = 8192;
> +       unsigned long start, timeout = 1000;
> +       const unsigned int max_count = 10000;
> +       unsigned int i;
> +       int ret = -EINVAL;
> +
> +       /* For each of the possible insertion modes, we pass an size, alignment
> +        * value that is known to introduce fragmentation and check that it
> +        * doesn't take more than 1 sec.
> +        */
> +
> +       nodes = vzalloc(array_size(max_count, sizeof(*nodes)));
> +       if (!nodes)
> +               goto err;
> +
> +       drm_mm_init(&mm, 1, U64_MAX - 2);
> +
> +       for (mode = insert_modes; mode->name; mode++) {
> +               start = jiffies;
> +
> +               for (i = 0; i < max_count; i++) {
> +                       if (jiffies_to_msecs(jiffies - start) >= timeout) {
> +                               pr_err("%s fragmented insert took more than %lu msecs\n",
> +                                      mode->name, timeout);
> +                               goto out;

We will run into problems with fixed timeouts on slow devices (emulated
virtual machines and whatnot). And yes there are a few that are known to
run kernel selftests and send bug reports (and complain about slow
tests such as the other drm_mm selftests :).

Off the top of my head, we expect the fragmented search to scale
[sub]linearly, whereas at the moment it's quadratic. How about if we do
something like insert as many as we can within 50ms, and then verify
that if we double that number of inserts it is less than 200ms. We will
still run into fun with the CPU scheduler causing imprecise timing, but
that should have sufficiently wide error margins.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
