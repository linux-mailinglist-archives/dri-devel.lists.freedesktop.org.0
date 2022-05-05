Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BAC51C1F7
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 16:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBD410E392;
	Thu,  5 May 2022 14:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F15810E30A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 14:11:18 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id y3so8939643ejo.12
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 07:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=LyVuJSSAzg0fwyN0+xHpF9jjC2z64gnmGRIntuxUZ+o=;
 b=GgpSwYTrdbJ+j3sbMTch+vG9BADj+Lzw81u2xXufT0SdKx7CzcXf97swMefLwYwElM
 kpp9Fgqa+P/l5QRcwfPvfaKuAr/1jv92+IoESr+pJFH9gFhSoeIYNkSOOE4vGaBNNCH7
 oGfwa0vrMhplz4z95R20YCjzAU2g5mi/s8NSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LyVuJSSAzg0fwyN0+xHpF9jjC2z64gnmGRIntuxUZ+o=;
 b=OO6pZQ1aSMm0uX2C7UiNywMoJgqNfTCW8C+Qh4DChIL/WwM03UcyC5ZTAyCrgXZ5eU
 Zbb/DIA1fmdcoE3t/LRaSdh/3b0p8xaBOfmsIP0v/ZjnsW1XuQx/ecibRsFwesukIA8z
 PvvVnHVEEZIgrbDKoy/7veSpyMSZtKgJ2GovjLBLHwCmudBwaLnWeyrTrZVXAX0mv0L3
 nl2WGtoqaHmQt4+yI9387uaSXwxUxfFPmORrF73OhGXVdonq6gQy3t7DEJtKlA1jaJK8
 AnzeZPpDQcOw3sVG8bch7NhMU5tJx91Ai75XfGILct8selqTbyxphrwlztLPaUPVdK8C
 P+Dg==
X-Gm-Message-State: AOAM530crwKpQuQCuII2oeDdHg0gP+yl9OHJhSEz809OBgAAg5u3yG/d
 3onIqsyderpI7lZTOUG2porsHw==
X-Google-Smtp-Source: ABdhPJy+Jkvvgz8l4LwJSTSxr/M1sfedUZ7mEvPMbEaU76LVEpCE5lutT1QV2VMYWE3tqcF7w8YU1g==
X-Received: by 2002:a17:906:3c09:b0:6f3:9aff:e1a0 with SMTP id
 h9-20020a1709063c0900b006f39affe1a0mr26087363ejg.453.1651759876341; 
 Thu, 05 May 2022 07:11:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a1709064c8200b006f3ef214dccsm802524eju.50.2022.05.05.07.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 07:11:15 -0700 (PDT)
Date: Thu, 5 May 2022 16:11:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 4/5] dma-buf: generalize dma_fence unwrap & merging v2
Message-ID: <YnPbAce42rTU7+Qa@phenom.ffwll.local>
References: <20220504122256.1654-1-christian.koenig@amd.com>
 <20220504122256.1654-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220504122256.1654-4-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linaro-mm-sig@lists.linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 04, 2022 at 02:22:55PM +0200, Christian König wrote:
> Introduce a dma_fence_unwrap_merge() macro which allows to unwrap fences
> which potentially can be containers as well and then merge them back
> together into a flat dma_fence_array.
> 
> v2: rename the function, add some more comments about how the wrapper is
>     used, move filtering of signaled fences into the unwrap iterator,
>     add complex selftest which covers more cases.

Yeah this addresses everything. The only thing that leaves me puzzled is
the unconditional dma_fence_put() in the testcases for the fences we stuff
into containers, I thought we only need that for error cases but not the
success. But I'm confused about that already in a previous patch.

Aside from that Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence-unwrap.c    |  99 +++++++++++++++++++++
>  drivers/dma-buf/st-dma-fence-unwrap.c | 109 +++++++++++++++++++++++
>  drivers/dma-buf/sync_file.c           | 119 ++------------------------
>  include/linux/dma-fence-unwrap.h      |  24 ++++++
>  4 files changed, 238 insertions(+), 113 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index 7b0b91086ded..4ed5ea8807d7 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -11,6 +11,7 @@
>  #include <linux/dma-fence-array.h>
>  #include <linux/dma-fence-chain.h>
>  #include <linux/dma-fence-unwrap.h>
> +#include <linux/slab.h>
>  
>  /* Internal helper to start new array iteration, don't use directly */
>  static struct dma_fence *
> @@ -66,3 +67,101 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
>  	return tmp;
>  }
>  EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
> +
> +/* Implementation for the dma_fence_merge() marco, don't use directly */
> +struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
> +					   struct dma_fence **fences,
> +					   struct dma_fence_unwrap *iter)
> +{
> +	struct dma_fence_array *result;
> +	struct dma_fence *tmp, **array;
> +	unsigned int i;
> +	size_t count;
> +
> +	count = 0;
> +	for (i = 0; i < num_fences; ++i) {
> +		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
> +			++count;
> +	}
> +
> +	if (count == 0)
> +		return dma_fence_get_stub();
> +
> +	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
> +	if (!array)
> +		return NULL;
> +
> +	/*
> +	 * This trashes the input fence array and uses it as position for the
> +	 * following merge loop. This works because the dma_fence_merge()
> +	 * wrapper macro is creating this temporary array on the stack together
> +	 * with the iterators.
> +	 */
> +	for (i = 0; i < num_fences; ++i)
> +		fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
> +
> +	count = 0;
> +	do {
> +		unsigned int sel;
> +
> +restart:
> +		tmp = NULL;
> +		for (i = 0; i < num_fences; ++i) {
> +			struct dma_fence *next = fences[i];
> +
> +			if (!next)
> +				continue;
> +
> +			/*
> +			 * We can't guarantee that inpute fences are ordered by
> +			 * context, but it is still quite likely when this
> +			 * function is used multiple times. So attempt to order
> +			 * the fences by context as we pass over them and merge
> +			 * fences with the same context.
> +			 */
> +			if (!tmp || tmp->context > next->context) {
> +				tmp = next;
> +				sel = i;
> +
> +			} else if (tmp->context < next->context) {
> +				continue;
> +
> +			} else if (dma_fence_is_later(tmp, next)) {
> +				fences[i] = dma_fence_unwrap_next(&iter[i]);
> +				goto restart;
> +			} else {
> +				fences[sel] = dma_fence_unwrap_next(&iter[sel]);
> +				goto restart;
> +			}
> +		}
> +
> +		if (tmp) {
> +			array[count++] = dma_fence_get(tmp);
> +			fences[sel] = dma_fence_unwrap_next(&iter[sel]);
> +		}
> +	} while (tmp);
> +
> +	if (count == 0) {
> +		tmp = dma_fence_get_stub();
> +		goto return_tmp;
> +	}
> +
> +	if (count == 1) {
> +		tmp = array[0];
> +		goto return_tmp;
> +	}
> +
> +	result = dma_fence_array_create(count, array,
> +					dma_fence_context_alloc(1),
> +					1, false);
> +	if (!result) {
> +		tmp = NULL;
> +		goto return_tmp;
> +	}
> +	return &result->base;
> +
> +return_tmp:
> +	kfree(array);
> +	return tmp;
> +}
> +EXPORT_SYMBOL_GPL(__dma_fence_unwrap_merge);
> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
> index 59628add93f5..3a8aca651938 100644
> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
> @@ -240,6 +240,113 @@ static int unwrap_chain_array(void *arg)
>  	return err;
>  }
>  
> +static int unwrap_merge(void *arg)
> +{
> +	struct dma_fence *fence, *f1, *f2, *f3;
> +	struct dma_fence_unwrap iter;
> +	int err = 0;
> +
> +	f1 = mock_fence();
> +	if (!f1)
> +		return -ENOMEM;
> +
> +	f2 = mock_fence();
> +	if (!f2) {
> +		err = -ENOMEM;
> +		goto error_put_f1;
> +	}
> +
> +	f3 = dma_fence_unwrap_merge(f1, f2);
> +	if (!f3) {
> +		err = -ENOMEM;
> +		goto error_put_f2;
> +	}
> +
> +	dma_fence_unwrap_for_each(fence, &iter, f3) {
> +		if (fence == f1) {
> +			dma_fence_put(f1);
> +			f1 = NULL;
> +		} else if (fence == f2) {
> +			dma_fence_put(f2);
> +			f2 = NULL;
> +		} else {
> +			pr_err("Unexpected fence!\n");
> +			err = -EINVAL;
> +		}
> +	}
> +
> +	if (f1 || f2) {
> +		pr_err("Not all fences seen!\n");
> +		err = -EINVAL;
> +	}
> +
> +	dma_fence_put(f3);
> +error_put_f2:
> +	dma_fence_put(f2);
> +error_put_f1:
> +	dma_fence_put(f1);
> +	return err;
> +}
> +
> +static int unwrap_merge_complex(void *arg)
> +{
> +	struct dma_fence *fence, *f1, *f2, *f3, *f4, *f5;
> +	struct dma_fence_unwrap iter;
> +	int err = -ENOMEM;
> +
> +	f1 = mock_fence();
> +	if (!f1)
> +		return -ENOMEM;
> +
> +	f2 = mock_fence();
> +	if (!f2)
> +		goto error_put_f1;
> +
> +	f3 = dma_fence_unwrap_merge(f1, f2);
> +	if (!f3)
> +		goto error_put_f2;
> +
> +	/* The resulting array has the fences in reverse */
> +	f4 = dma_fence_unwrap_merge(f2, f1);
> +	if (!f4)
> +		goto error_put_f3;
> +
> +	/* Signaled fences should be filtered, the two arrays merged. */
> +	f5 = dma_fence_unwrap_merge(f3, f4, dma_fence_get_stub());
> +	if (!f5)
> +		goto error_put_f4;
> +
> +	err = 0;
> +	dma_fence_unwrap_for_each(fence, &iter, f5) {
> +		if (fence == f1) {
> +			dma_fence_put(f1);
> +			f1 = NULL;
> +		} else if (fence == f2) {
> +			dma_fence_put(f2);
> +			f2 = NULL;
> +		} else {
> +			pr_err("Unexpected fence!\n");
> +			err = -EINVAL;
> +		}
> +	}
> +
> +	if (f1 || f2) {
> +		pr_err("Not all fences seen!\n");
> +		err = -EINVAL;
> +	}
> +
> +	dma_fence_put(f5);
> +error_put_f4:
> +	dma_fence_put(f4);
> +error_put_f3:
> +	dma_fence_put(f3);
> +error_put_f2:
> +	dma_fence_put(f2);
> +error_put_f1:
> +	dma_fence_put(f1);
> +	return err;
> +}
> +
>  int dma_fence_unwrap(void)
>  {
>  	static const struct subtest tests[] = {
> @@ -247,6 +354,8 @@ int dma_fence_unwrap(void)
>  		SUBTEST(unwrap_array),
>  		SUBTEST(unwrap_chain),
>  		SUBTEST(unwrap_chain_array),
> +		SUBTEST(unwrap_merge),
> +		SUBTEST(unwrap_merge_complex),
>  	};
>  
>  	return subtests(tests, NULL);
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index 0fe564539166..3ebec19a8e02 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -146,50 +146,6 @@ char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
>  	return buf;
>  }
>  
> -static int sync_file_set_fence(struct sync_file *sync_file,
> -			       struct dma_fence **fences, int num_fences)
> -{
> -	struct dma_fence_array *array;
> -
> -	/*
> -	 * The reference for the fences in the new sync_file and held
> -	 * in add_fence() during the merge procedure, so for num_fences == 1
> -	 * we already own a new reference to the fence. For num_fence > 1
> -	 * we own the reference of the dma_fence_array creation.
> -	 */
> -
> -	if (num_fences == 0) {
> -		sync_file->fence = dma_fence_get_stub();
> -		kfree(fences);
> -
> -	} else if (num_fences == 1) {
> -		sync_file->fence = fences[0];
> -		kfree(fences);
> -
> -	} else {
> -		array = dma_fence_array_create(num_fences, fences,
> -					       dma_fence_context_alloc(1),
> -					       1, false);
> -		if (!array)
> -			return -ENOMEM;
> -
> -		sync_file->fence = &array->base;
> -	}
> -
> -	return 0;
> -}
> -
> -static void add_fence(struct dma_fence **fences,
> -		      int *i, struct dma_fence *fence)
> -{
> -	fences[*i] = fence;
> -
> -	if (!dma_fence_is_signaled(fence)) {
> -		dma_fence_get(fence);
> -		(*i)++;
> -	}
> -}
> -
>  /**
>   * sync_file_merge() - merge two sync_files
>   * @name:	name of new fence
> @@ -203,84 +159,21 @@ static void add_fence(struct dma_fence **fences,
>  static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
>  					 struct sync_file *b)
>  {
> -	struct dma_fence *a_fence, *b_fence, **fences;
> -	struct dma_fence_unwrap a_iter, b_iter;
> -	unsigned int index, num_fences;
>  	struct sync_file *sync_file;
> +	struct dma_fence *fence;
>  
>  	sync_file = sync_file_alloc();
>  	if (!sync_file)
>  		return NULL;
>  
> -	num_fences = 0;
> -	dma_fence_unwrap_for_each(a_fence, &a_iter, a->fence)
> -		++num_fences;
> -	dma_fence_unwrap_for_each(b_fence, &b_iter, b->fence)
> -		++num_fences;
> -
> -	if (num_fences > INT_MAX)
> -		goto err_free_sync_file;
> -
> -	fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
> -	if (!fences)
> -		goto err_free_sync_file;
> -
> -	/*
> -	 * We can't guarantee that fences in both a and b are ordered, but it is
> -	 * still quite likely.
> -	 *
> -	 * So attempt to order the fences as we pass over them and merge fences
> -	 * with the same context.
> -	 */
> -
> -	index = 0;
> -	for (a_fence = dma_fence_unwrap_first(a->fence, &a_iter),
> -	     b_fence = dma_fence_unwrap_first(b->fence, &b_iter);
> -	     a_fence || b_fence; ) {
> -
> -		if (!b_fence) {
> -			add_fence(fences, &index, a_fence);
> -			a_fence = dma_fence_unwrap_next(&a_iter);
> -
> -		} else if (!a_fence) {
> -			add_fence(fences, &index, b_fence);
> -			b_fence = dma_fence_unwrap_next(&b_iter);
> -
> -		} else if (a_fence->context < b_fence->context) {
> -			add_fence(fences, &index, a_fence);
> -			a_fence = dma_fence_unwrap_next(&a_iter);
> -
> -		} else if (b_fence->context < a_fence->context) {
> -			add_fence(fences, &index, b_fence);
> -			b_fence = dma_fence_unwrap_next(&b_iter);
> -
> -		} else if (__dma_fence_is_later(a_fence->seqno, b_fence->seqno,
> -						a_fence->ops)) {
> -			add_fence(fences, &index, a_fence);
> -			a_fence = dma_fence_unwrap_next(&a_iter);
> -			b_fence = dma_fence_unwrap_next(&b_iter);
> -
> -		} else {
> -			add_fence(fences, &index, b_fence);
> -			a_fence = dma_fence_unwrap_next(&a_iter);
> -			b_fence = dma_fence_unwrap_next(&b_iter);
> -		}
> +	fence = dma_fence_unwrap_merge(a->fence, b->fence);
> +	if (!fence) {
> +		fput(sync_file->file);
> +		return NULL;
>  	}
> -
> -	if (sync_file_set_fence(sync_file, fences, index) < 0)
> -		goto err_put_fences;
> -
> +	sync_file->fence = fence;
>  	strlcpy(sync_file->user_name, name, sizeof(sync_file->user_name));
>  	return sync_file;
> -
> -err_put_fences:
> -	while (index)
> -		dma_fence_put(fences[--index]);
> -	kfree(fences);
> -
> -err_free_sync_file:
> -	fput(sync_file->file);
> -	return NULL;
>  }
>  
>  static int sync_file_release(struct inode *inode, struct file *file)
> diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
> index e9d114637294..43c8a9bbee88 100644
> --- a/include/linux/dma-fence-unwrap.h
> +++ b/include/linux/dma-fence-unwrap.h
> @@ -48,4 +48,28 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
>  	for (fence = dma_fence_unwrap_first(head, cursor); fence;	\
>  	     fence = dma_fence_unwrap_next(cursor))
>  
> +struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
> +					   struct dma_fence **fences,
> +					   struct dma_fence_unwrap *cursors);
> +
> +/**
> + * dma_fence_unwrap_merge - unwrap and merge fences
> + *
> + * All fences given as parameters are unwrapped and merged back together as flat
> + * dma_fence_array. Useful if multiple containers need to be merged together.
> + *
> + * Implemented as a macro to allocate the necessary arrays on the stack and
> + * account the stack frame size to the caller.
> + *
> + * Returns NULL on memory allocation failure, a dma_fence object representing
> + * all the given fences otherwise.
> + */
> +#define dma_fence_unwrap_merge(...)					\
> +	({								\
> +		struct dma_fence *__f[] = { __VA_ARGS__ };		\
> +		struct dma_fence_unwrap __c[ARRAY_SIZE(__f)];		\
> +									\
> +		__dma_fence_unwrap_merge(ARRAY_SIZE(__f), __f, __c);	\
> +	})
> +
>  #endif
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
