Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6451479B2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 09:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367D66FF8A;
	Fri, 24 Jan 2020 08:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [146.101.78.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C9B6FA1B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 14:36:22 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-113-15wkTAANO_ibswgbp6HdbQ-1; Thu, 23 Jan 2020 14:36:17 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 23 Jan 2020 14:36:16 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 23 Jan 2020 14:36:16 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Chris Wilson' <chris@chris-wilson.co.uk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm: Inject a cond_resched() into long drm_clflush_sg()
Thread-Topic: [PATCH] drm: Inject a cond_resched() into long drm_clflush_sg()
Thread-Index: AQHVy+gMprmlNntzX0qJh6CaHCkwb6f4Wzrg
Date: Thu, 23 Jan 2020 14:36:16 +0000
Message-ID: <8d069732e2a54fb5aa3bffee5cd0d0f4@AcuMS.aculab.com>
References: <20200115205245.2772800-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200115205245.2772800-1-chris@chris-wilson.co.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: 15wkTAANO_ibswgbp6HdbQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
X-Mailman-Approved-At: Fri, 24 Jan 2020 08:52:34 +0000
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>
> Sent: 15 January 2020 20:53
> 
> Since we may try and flush the cachelines associated with large buffers
> (an 8K framebuffer is about 128MiB, even before we try HDR), this leads
> to unacceptably long latencies (when using a voluntary CONFIG_PREEMPT).
> If we call cond_resched() between each sg chunk, that it about every 128
> pages, we have a natural break point in which to check if the process
> needs to be rescheduled. Naturally, this means that drm_clflush_sg() can
> only be called from process context -- which is true at the moment. The
> other clflush routines remain usable from atomic context.
> 
> Even though flushing large objects takes a demonstrable amount to time
> to flush all the cachelines, clflush is still preferred over a
> system-wide wbinvd as the latter has unpredictable latencies affecting
> the whole system not just the local task.

Any progress on this.
I think the patch itself has it's whitespace messed up.

I've just done a measurement on a newer system that supports clflushopt.
drm_clflush_sg() took 400us for a 1920x1080 display.
No idea how fast the cpus were running, somewhere between 800MHz and 4GHz
depending on the whim of the hardware (probable at the low end).
Considerably faster, and enough that calling cond_resched() every 4k
is probably noticable.
So every 128 pages is probably a reasonable compromise.

	David


> Reported-by: David Laight <David.Laight@ACULAB.COM>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: David Laight <David.Laight@ACULAB.COM>
> ---
>  drivers/gpu/drm/drm_cache.c | 49 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 45 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
> index 03e01b000f7a..fbd2bb644544 100644
> --- a/drivers/gpu/drm/drm_cache.c
> +++ b/drivers/gpu/drm/drm_cache.c
> @@ -112,23 +112,64 @@ drm_clflush_pages(struct page *pages[], unsigned long num_pages)
>  }
>  EXPORT_SYMBOL(drm_clflush_pages);
> 
> +static __always_inline struct sgt_iter {
> +struct scatterlist *sgp;
> +unsigned long pfn;
> +unsigned int curr;
> +unsigned int max;
> +} __sgt_iter(struct scatterlist *sgl) {
> +struct sgt_iter s = { .sgp = sgl };
> +
> +if (s.sgp) {
> +s.max = s.curr = s.sgp->offset;
> +s.max += s.sgp->length;
> +s.pfn = page_to_pfn(sg_page(s.sgp));
> +}
> +
> +return s;
> +}
> +
> +static inline struct scatterlist *__sg_next_resched(struct scatterlist *sg)
> +{
> +if (sg_is_last(sg))
> +return NULL;
> +
> +++sg;
> +if (unlikely(sg_is_chain(sg))) {
> +sg = sg_chain_ptr(sg);
> +cond_resched();
> +}
> +return sg;
> +}
> +
> +#define for_each_sgt_page(__pp, __iter, __sgt)\
> +for ((__iter) = __sgt_iter((__sgt)->sgl);\
> +     ((__pp) = (__iter).pfn == 0 ? NULL :\
> +      pfn_to_page((__iter).pfn + ((__iter).curr >> PAGE_SHIFT))); \
> +     (((__iter).curr += PAGE_SIZE) >= (__iter).max) ?\
> +     (__iter) = __sgt_iter(__sg_next_resched((__iter).sgp)), 0 : 0)
> +
>  /**
>   * drm_clflush_sg - Flush dcache lines pointing to a scather-gather.
>   * @st: struct sg_table.
>   *
>   * Flush every data cache line entry that points to an address in the
> - * sg.
> + * sg. This may schedule between scatterlist chunks, in order to keep
> + * the system preemption-latency down for large buffers.
>   */
>  void
>  drm_clflush_sg(struct sg_table *st)
>  {
> +might_sleep();
> +
>  #if defined(CONFIG_X86)
>  if (static_cpu_has(X86_FEATURE_CLFLUSH)) {
> -struct sg_page_iter sg_iter;
> +struct sgt_iter sg_iter;
> +struct page *page;
> 
>  mb(); /*CLFLUSH is ordered only by using memory barriers*/
> -for_each_sg_page(st->sgl, &sg_iter, st->nents, 0)
> -drm_clflush_page(sg_page_iter_page(&sg_iter));
> +for_each_sgt_page(page, sg_iter, st)
> +drm_clflush_page(page);
>  mb(); /*Make sure that all cache line entry is flushed*/
> 
>  return;
> --
> 2.25.0
> 

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
