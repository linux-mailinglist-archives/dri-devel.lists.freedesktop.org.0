Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7F93A3DA3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 09:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088246EE46;
	Fri, 11 Jun 2021 07:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762216EE45
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 07:58:16 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 m41-20020a05600c3b29b02901b9e5d74f02so4821953wms.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 00:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Cb2J6sSCslD5uvLaCGMCBxynXsGOY9oqpQH7yy0HDiM=;
 b=YLj4dPA5HeJ1vFEo+Kagh6Cll3C1STlr33QgWQyGmziFH+Z9OFECn3bt5cNXkIlh+k
 tJSkreQzKvXrsm+dricbgqCIwJ3SxKkQSyymdgaT5gJv60m+uyh5SZzrAfRygmbsNafQ
 Wta+hIIL8apOxGuiDkhEld58aUN09SM3GAlrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Cb2J6sSCslD5uvLaCGMCBxynXsGOY9oqpQH7yy0HDiM=;
 b=Nz1E9oMq4bEj1QpOwwqH1yFkM/YX12FXrKScC76vB/wd/4WaiImizo4P/x/tdrpWZs
 GH8bKVXj9hpXwh+IUne8bduHDiGhfgrbPpUGU6axohDr8UA7ydI/Lqx+b66LPon631t8
 JIC3wpXzeUR5wzKPi3eBO49Wbv224xuVuUX2dxykago+Thy92de+VbjjgtUfLA7ulQMp
 p9+tba4kw8YGU5bHw5MLFvn8NYB9SgDGiWgzgpoQ52CNoIu/mI5XKht92jhGpwTTHrXR
 ruO7kcM+H2Cjl0BCzfoDOM7sJal5ztjfRYUJ+fJuHYbVd6Ky3q8/V6CnRXBInJLXMCNz
 pklw==
X-Gm-Message-State: AOAM533OnvzafeZWteGxgBr741Mi+hAfohmD8I3E9KFPPn4tEQkkCnfM
 Yy+JEOzvPL8umu6ftsunkV54KA==
X-Google-Smtp-Source: ABdhPJylLBcD7nMz11LRrYZN4d8CQjyvSjS8RevAozcmcYQPEQA3gPZ0GZoBpegES+gmKgKBrnS1QQ==
X-Received: by 2002:a7b:c099:: with SMTP id r25mr10397638wmh.144.1623398295202; 
 Fri, 11 Jun 2021 00:58:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g17sm6191082wrp.61.2021.06.11.00.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 00:58:14 -0700 (PDT)
Date: Fri, 11 Jun 2021 09:58:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/7] dma-buf: add dma_fence_chain_alloc/free self tests
Message-ID: <YMMXlF5A7uB0sORs@phenom.ffwll.local>
References: <20210610091800.1833-1-christian.koenig@amd.com>
 <20210610091800.1833-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210610091800.1833-4-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 11:17:56AM +0200, Christian König wrote:
> Exercise the newly added functions.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

I have honestly no idea what this checks. Spawning a few threads to
validate kmalloc/kfree feels a bit silly. Now testing whether we correctly
rcu-delay the freeing here would make some sense, but even that feels a
bit silly.

I guess if you want this explain with comments what it does and why?
-Daniel


> ---
>  drivers/dma-buf/st-dma-fence-chain.c | 48 ++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
> index 8ce1ea59d31b..855c129c6093 100644
> --- a/drivers/dma-buf/st-dma-fence-chain.c
> +++ b/drivers/dma-buf/st-dma-fence-chain.c
> @@ -95,6 +95,53 @@ static int sanitycheck(void *arg)
>  	return err;
>  }
>  
> +static int __alloc_free(void *arg)
> +{
> +	atomic_t *counter = arg;
> +	int i, j;
> +
> +	for (i = 0; i < 1024; ++i) {
> +		struct dma_fence_chain *chains[64];
> +
> +		for (j = 0; j < ARRAY_SIZE(chains); ++j)
> +			chains[j] = dma_fence_chain_alloc();
> +
> +		for (j = 0; j < ARRAY_SIZE(chains); ++j)
> +			dma_fence_chain_free(chains[j]);
> +
> +		atomic_add(ARRAY_SIZE(chains), counter);
> +	}
> +	return 0;
> +}
> +
> +static int alloc_free(void *arg)
> +{
> +	struct task_struct *threads[8];
> +	atomic_t counter = ATOMIC_INIT(0);
> +	int i, err = 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(threads); i++) {
> +		threads[i] = kthread_run(__alloc_free, &counter, "dmabuf/%d",
> +					 i);
> +		if (IS_ERR(threads[i])) {
> +			err = PTR_ERR(threads[i]);
> +			break;
> +		}
> +	}
> +
> +	while (i--) {
> +		int ret;
> +
> +		ret = kthread_stop(threads[i]);
> +		if (ret && !err)
> +			err = ret;
> +	}
> +
> +	pr_info("Completed %u cycles\n", atomic_read(&counter));
> +
> +	return err;
> +}
> +
>  struct fence_chains {
>  	unsigned int chain_length;
>  	struct dma_fence **fences;
> @@ -677,6 +724,7 @@ int dma_fence_chain(void)
>  {
>  	static const struct subtest tests[] = {
>  		SUBTEST(sanitycheck),
> +		SUBTEST(alloc_free),
>  		SUBTEST(find_seqno),
>  		SUBTEST(find_signaled),
>  		SUBTEST(find_out_of_order),
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
