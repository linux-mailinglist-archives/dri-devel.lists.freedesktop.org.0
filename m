Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A348E1E8289
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 17:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38C389E06;
	Fri, 29 May 2020 15:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706F289E06;
 Fri, 29 May 2020 15:52:15 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21336802-1500050 for multiple; Fri, 29 May 2020 16:52:10 +0100
MIME-Version: 1.0
In-Reply-To: <cdb604b7-0817-c786-45f6-3c2f9a395c70@amd.com>
References: <20200529163351.5228-1-nirmoy.das@amd.com>
 <cdb604b7-0817-c786-45f6-3c2f9a395c70@amd.com>
Subject: Re: [RFC PATCH 1/1] drm/mm: add ig_frag selftest
To: Nirmoy <nirmodas@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <159076753114.8851.15594151673471255964@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Fri, 29 May 2020 16:52:11 +0100
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
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@amd.com>,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Nirmoy (2020-05-29 16:40:53)
> This works correctly most of the times but sometimes
> 
> 20k insertions can take more than 8 times of 10k insertion time.

The pressure is on to improve then :)

> Regards,
> 
> Nirmoy
> 
> On 5/29/20 6:33 PM, Nirmoy Das wrote:
> > This patch introduces fragmentation in the address range
> > and measures time taken by 10k and 20k insertions. ig_frag()
> > will fail if time taken by 20k insertions takes more than 4 times
> > of 10k insertions as we know that insertions scale quadratically.
> > Also tolerate 10% error because of kernel scheduler's jitters.
> >
> > Output:
> > <snip>
> > [ 8092.653518] drm_mm: Testing DRM range manger (struct drm_mm), with random_seed=0x9bfb4117 max_iterations=8192 max_prime=128
> > [ 8092.653520] drm_mm: igt_sanitycheck - ok!
> > [ 8092.653525] igt_debug 0x0000000000000000-0x0000000000000200: 512: free
> > [ 8092.653526] igt_debug 0x0000000000000200-0x0000000000000600: 1024: used
> > [ 8092.653527] igt_debug 0x0000000000000600-0x0000000000000a00: 1024: free
> > [ 8092.653528] igt_debug 0x0000000000000a00-0x0000000000000e00: 1024: used
> > [ 8092.653529] igt_debug 0x0000000000000e00-0x0000000000001000: 512: free
> > [ 8092.653529] igt_debug total: 4096, used 2048 free 2048
> > [ 8112.569813] drm_mm: best fragmented insert of 10000 and 20000 insertions took 504 and 1996 msecs
> > [ 8112.723254] drm_mm: bottom-up fragmented insert of 10000 and 20000 insertions took 44 and 108 msecs
> > [ 8112.813212] drm_mm: top-down fragmented insert of 10000 and 20000 insertions took 40 and 44 msecs
> > [ 8112.847733] drm_mm: evict fragmented insert of 10000 and 20000 insertions took 8 and 20 msecs
> > <snip>
> >
> > Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> > ---
> >   drivers/gpu/drm/selftests/drm_mm_selftests.h |  1 +
> >   drivers/gpu/drm/selftests/test-drm_mm.c      | 73 ++++++++++++++++++++
> >   2 files changed, 74 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/selftests/drm_mm_selftests.h b/drivers/gpu/drm/selftests/drm_mm_selftests.h
> > index 6b943ea1c57d..8c87c964176b 100644
> > --- a/drivers/gpu/drm/selftests/drm_mm_selftests.h
> > +++ b/drivers/gpu/drm/selftests/drm_mm_selftests.h
> > @@ -14,6 +14,7 @@ selftest(insert, igt_insert)
> >   selftest(replace, igt_replace)
> >   selftest(insert_range, igt_insert_range)
> >   selftest(align, igt_align)
> > +selftest(frag, igt_frag)
> >   selftest(align32, igt_align32)
> >   selftest(align64, igt_align64)
> >   selftest(evict, igt_evict)
> > diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/selftests/test-drm_mm.c
> > index 9aabe82dcd3a..05d8f3659b4d 100644
> > --- a/drivers/gpu/drm/selftests/test-drm_mm.c
> > +++ b/drivers/gpu/drm/selftests/test-drm_mm.c
> > @@ -1033,6 +1033,79 @@ static int igt_insert_range(void *ignored)
> >       return 0;
> >   }
> >   
> > +static int get_insert_time(unsigned int num_insert,
> > +                        const struct insert_mode *mode)
> > +{
> > +     struct drm_mm mm;
> > +     struct drm_mm_node *nodes, *node, *next;
> > +     unsigned int size = 4096, align = 8192;
> > +     unsigned long start;
> > +     unsigned int i;
> > +     int ret = -EINVAL;
> > +
> > +     drm_mm_init(&mm, 1, U64_MAX - 2);
> > +     nodes = vzalloc(array_size(num_insert, sizeof(*nodes)));
> > +     if (!nodes)
> > +             goto err;
> > +
> > +     start = jiffies;

Use ktime_t start = ktime_now();

> > +     for (i = 0; i < num_insert; i++) {
> > +             if (!expect_insert(&mm, &nodes[i], size, align, i, mode)) {
> > +                     pr_err("%s insert failed\n", mode->name);
> > +                     goto out;
> > +             }
> > +     }
> > +
> > +     ret = jiffies_to_msecs(jiffies - start);

ret = ktime_sub(ktime_now(), start);

The downside to using ktime is remembering it is s64 and so requires care
and attention in doing math.

> > +out:
> > +     drm_mm_for_each_node_safe(node, next, &mm)
> > +             drm_mm_remove_node(node);
> > +     drm_mm_takedown(&mm);
> > +     vfree(nodes);
> > +err:
> > +     return ret;
> > +
> > +}
> > +
> > +static int igt_frag(void *ignored)
> > +{
> > +     const struct insert_mode *mode;
> > +     unsigned int insert_time1, insert_time2;
> > +     unsigned int insert_size = 10000;
> > +     unsigned int scale_factor = 4;
> > +     /* tolerate 10% excess insertion duration */
> > +     unsigned int error_factor = 110;
> > +     int ret = -EINVAL;
> > +
> > +     for (mode = insert_modes; mode->name; mode++) {
> > +             unsigned int expected_time;
> > +
> > +             insert_time1 = get_insert_time(insert_size, mode);
> > +             if (insert_time1 < 0)
> > +                     goto err;

Ah, can you propagate the actual error. I see you are returning EINVAL
for ENOMEM errors. Just wait until it hits and you have to debug why :)

> > +             insert_time2 = get_insert_time((insert_size * 2), mode);
> > +             if (insert_time2 < 0)
> > +                     goto err;
> > +
> > +             expected_time = (scale_factor * insert_time1 *
> > +                              error_factor)/100;
> > +             if (insert_time2 > expected_time) {
> > +                     pr_err("%s fragmented insert took more %u msecs\n",
> > +                            mode->name, insert_time2 - expected_time);
> > +                     goto err;
> > +             }
> > +
> > +             pr_info("%s fragmented insert of %u and %u insertions took %u and %u msecs\n",
> > +                     mode->name, insert_size, insert_size * 2, insert_time1,
> > +                     insert_time2);

Put the info first before the error. We always want the full details,
with the error message explaining why it's unhappy.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
