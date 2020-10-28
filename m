Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9770E29CF10
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62246E4AE;
	Wed, 28 Oct 2020 08:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1726E4AE
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 08:47:17 +0000 (UTC)
Received: from kernel.org (unknown [87.70.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50EBD2465E;
 Wed, 28 Oct 2020 08:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603874836;
 bh=QEXxMmSUj2Vd+E59vReAFx2mSILQlDhT0GF7L4nT79k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qaRJrHspISAML2s3M6ow+As8fnofPQBijjHMbHMdR+I3658FQOTlnTwjnXNz0MlyX
 aAw8A460MACJ1IDHW1x+02Uv9Atn0b3fP/Jb97ArZSIbrkmzQ92h9/ls1ePhoOhjJH
 6jiwMskK6vWDnhTMrSRMXIc62N90Wg6wJ7a8TvRg=
Date: Wed, 28 Oct 2020 10:47:03 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/8] mm: slab: provide krealloc_array()
Message-ID: <20201028084703.GC1428094@kernel.org>
References: <20201027121725.24660-1-brgl@bgdev.pl>
 <20201027121725.24660-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027121725.24660-2-brgl@bgdev.pl>
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Gustavo Padovan <gustavo@padovan.org>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, linux-mm@kvack.org,
 Christoph Lameter <cl@linux.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 David Rientjes <rientjes@google.com>,
 virtualization@lists.linux-foundation.org, Jason Wang <jasowang@redhat.com>,
 linux-media@vger.kernel.org, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linaro-mm-sig@lists.linaro.org,
 linux-gpio@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, netdev@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>, James Morse <james.morse@arm.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 01:17:18PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> When allocating an array of elements, users should check for
> multiplication overflow or preferably use one of the provided helpers
> like: kmalloc_array().
> 
> There's no krealloc_array() counterpart but there are many users who use
> regular krealloc() to reallocate arrays. Let's provide an actual
> krealloc_array() implementation.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  include/linux/slab.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index dd6897f62010..0e6683affee7 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -592,6 +592,17 @@ static inline void *kmalloc_array(size_t n, size_t size, gfp_t flags)
>  	return __kmalloc(bytes, flags);
>  }
>  

Can you please add kernel-doc here and a word or two about this function
to Documentation/core-api/memory-allocation.rst?

> +static __must_check inline void *
> +krealloc_array(void *p, size_t new_n, size_t new_size, gfp_t flags)
> +{
> +	size_t bytes;
> +
> +	if (unlikely(check_mul_overflow(new_n, new_size, &bytes)))
> +		return NULL;
> +
> +	return krealloc(p, bytes, flags);
> +}
> +
>  /**
>   * kcalloc - allocate memory for an array. The memory is set to zero.
>   * @n: number of elements.
> -- 
> 2.29.1
> 
> 

-- 
Sincerely yours,
Mike.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
