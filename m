Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D5329C588
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 19:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AD26EBF6;
	Tue, 27 Oct 2020 18:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0146EBF6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 18:20:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E2118ADCA;
 Tue, 27 Oct 2020 18:20:07 +0000 (UTC)
Subject: Re: [PATCH 1/8] mm: slab: provide krealloc_array()
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20201027121725.24660-1-brgl@bgdev.pl>
 <20201027121725.24660-2-brgl@bgdev.pl>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <21ae795b-c0f4-bbf3-20f6-830d0980a673@suse.cz>
Date: Tue, 27 Oct 2020 19:20:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201027121725.24660-2-brgl@bgdev.pl>
Content-Language: en-US
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, linux-mm@kvack.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-media@vger.kernel.org,
 linux-edac@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/27/20 1:17 PM, Bartosz Golaszewski wrote:
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

Makes sense.
Acked-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>   include/linux/slab.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index dd6897f62010..0e6683affee7 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -592,6 +592,17 @@ static inline void *kmalloc_array(size_t n, size_t size, gfp_t flags)
>   	return __kmalloc(bytes, flags);
>   }
>   
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
>   /**
>    * kcalloc - allocate memory for an array. The memory is set to zero.
>    * @n: number of elements.
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
