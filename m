Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E782A75DF23
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jul 2023 00:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8060110E030;
	Sat, 22 Jul 2023 22:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D226410E01F;
 Sat, 22 Jul 2023 22:06:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A78A60677;
 Sat, 22 Jul 2023 22:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B3BC433C7;
 Sat, 22 Jul 2023 22:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690063599;
 bh=tyf/hjLCqwPYZjmfSZ9szqE/H4NkKJfOiEi8d0WNkjw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cnew+AFer7HBfltIjGe5dOWt9R9E0nD2r85cxs7RNOmsG3pxvqao5fFC+PdIY5orz
 12UbrKmri1iZX/D8/vHi3AjrKPlRYJQxzUfUh8Nt28YLwBLyx1KZrf4iXD68FG+j9k
 clhMh508R51YzREaYde6mvwTsqDdFfpVTtCFUmKbrtYzdjVesmMeDkDbZErNd3pIfw
 bqwUV/LPA1RdLhffmrBxuyYzFwp5tjZyR/Q39ygiabKzRrkBfqGTpVlAqLXp3Gd2hp
 JsAUXblDkXPBu2ga/dkkwwYw1m4iB4x8xzZoUaCJ1YBdnuxDjRZDlYH0+2nWg+FP1E
 co5yK1XaHMbPQ==
Date: Sat, 22 Jul 2023 15:06:37 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/6] drm: execution context for GEM buffers v7
Message-ID: <20230722220637.GA138486@dev-arch.thelio-3990X>
References: <20230711133122.3710-1-christian.koenig@amd.com>
 <20230711133122.3710-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230711133122.3710-2-christian.koenig@amd.com>
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Tue, Jul 11, 2023 at 03:31:17PM +0200, Christian König wrote:
> This adds the infrastructure for an execution context for GEM buffers
> which is similar to the existing TTMs execbuf util and intended to replace
> it in the long term.
> 
> The basic functionality is that we abstracts the necessary loop to lock
> many different GEM buffers with automated deadlock and duplicate handling.
> 
> v2: drop xarray and use dynamic resized array instead, the locking
>     overhead is unnecessary and measurable.
> v3: drop duplicate tracking, radeon is really the only one needing that.
> v4: fixes issues pointed out by Danilo, some typos in comments and a
>     helper for lock arrays of GEM objects.
> v5: some suggestions by Boris Brezillon, especially just use one retry
>     macro, drop loop in prepare_array, use flags instead of bool
> v6: minor changes suggested by Thomas, Boris and Danilo
> v7: minor typos pointed out by checkpatch.pl fixed
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Danilo Krummrich <dakr@redhat.com>
> Tested-by: Danilo Krummrich <dakr@redhat.com>

<snip>

> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> new file mode 100644
> index 000000000000..73205afec162
> --- /dev/null
> +++ b/include/drm/drm_exec.h

<snip>

> + * Since labels can't be defined local to the loops body we use a jump pointer
> + * to make sure that the retry is only used from within the loops body.
> + */
> +#define drm_exec_until_all_locked(exec)				\
> +	for (void *__drm_exec_retry_ptr; ({			\
> +		__label__ __drm_exec_retry;			\
> +__drm_exec_retry:						\
> +		__drm_exec_retry_ptr = &&__drm_exec_retry;	\
> +		(void)__drm_exec_retry_ptr;			\
> +		drm_exec_cleanup(exec);				\
> +	});)
> +
> +/**
> + * drm_exec_retry_on_contention - restart the loop to grap all locks
> + * @exec: drm_exec object
> + *
> + * Control flow helper to continue when a contention was detected and we need to
> + * clean up and re-start the loop to prepare all GEM objects.
> + */
> +#define drm_exec_retry_on_contention(exec)			\
> +	do {							\
> +		if (unlikely(drm_exec_is_contended(exec)))	\
> +			goto *__drm_exec_retry_ptr;		\
> +	} while (0)

This construct of using a label as a value and goto to jump into a GNU
C statement expression is explicitly documented in GCC's manual [1] as
undefined behavior:

"Jumping into a statement expression with a computed goto (see Labels as
Values [2]) has undefined behavior. "

A recent change in clang [3] to prohibit this altogether points this out, so
builds using clang-17 and newer will break with this change applied:

  drivers/gpu/drm/tests/drm_exec_test.c:41:3: error: cannot jump from this indirect goto statement to one of its possible targets
     41 |                 drm_exec_retry_on_contention(&exec);
        |                 ^
  include/drm/drm_exec.h:96:4: note: expanded from macro 'drm_exec_retry_on_contention'
     96 |                         goto *__drm_exec_retry_ptr;             \
        |                         ^
  drivers/gpu/drm/tests/drm_exec_test.c:39:2: note: possible target of indirect goto statement
     39 |         drm_exec_until_all_locked(&exec) {
        |         ^
  include/drm/drm_exec.h:79:33: note: expanded from macro 'drm_exec_until_all_locked'
     79 |                 __label__ __drm_exec_retry;                     \
        |                                                                 ^
  drivers/gpu/drm/tests/drm_exec_test.c:39:2: note: jump enters a statement expression

It seems like if this construct works, it is by chance, although I am
not sure if there is another solution.

[1]: https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html
[2]: https://gcc.gnu.org/onlinedocs/gcc/Labels-as-Values.html
[3]: https://github.com/llvm/llvm-project/commit/20219106060208f0c2f5d096eb3aed7b712f5067

Cheers,
Nathan
