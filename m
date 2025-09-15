Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF5AB579C6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3AC10E467;
	Mon, 15 Sep 2025 12:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="um+iNDaY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BA810E466;
 Mon, 15 Sep 2025 12:03:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 729E04439F;
 Mon, 15 Sep 2025 12:03:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD70C4CEF1;
 Mon, 15 Sep 2025 12:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757937839;
 bh=tTfy69vuxcsU0PPDO3wtMtWUyYHQN7GhuK5IHt9W66w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=um+iNDaY5sm+GI9HU+djJgAGEmA9bdYR1bLywEgyWVD9icTvUIamHBufH4D7TrB4h
 NFT5JcBypNaV222BxoAm6IVKhLNi2ybdCUKXGAUXiF5VU0ASS3XFv8jUyqNLzoYlCO
 vq3QgtHm5idvE55znTw+A/uFOwjc3Z8vZO9lqq115dPSJqAUObxMbOJcn44IRX/1J3
 Shk7WHjYKrWWAsMNvhzhYiGkGvKWFMx5k9TJswCLYJjLPmGfro+k9ETBPxzAM84Ycf
 4molWQjeSug33NlkJ2Np5aH+ipu9v+cog81j8a7HQmn8EvmhWM5heCYc4WJHtalgcK
 SvLSdMVI7IhlQ==
Date: Mon, 15 Sep 2025 14:03:56 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Taotao Chen <chentao325@qq.com>
Cc: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, 
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>, 
 "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>, 
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 kernel test robot <oliver.sang@intel.com>,
 chentaotao <chentaotao@didiglobal.com>
Subject: Re: [PATCH v2 1/2] drm/i915: set O_LARGEFILE in __create_shmem()
Message-ID: <eijc4lnkdfsk6l4go2psyt4g6ufrha7sijeearcvuo7nqrbkby@kqod2veuvaco>
References: <20250822030651.28099-1-chentaotao@didiglobal.com>
 <tencent_EA6C39EF0B78D46EA32051C7151E859A2F08@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_EA6C39EF0B78D46EA32051C7151E859A2F08@qq.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Taotao,

> > Without O_LARGEFILE, file->f_op->write_iter calls
> > generic_write_check_limits(), which enforces a 2GB (MAX_NON_LFS) limit,
> > causing -EFBIG on large writes.
> > 
> > In shmem_pwrite(), this error is later masked as -EIO due to the error
> > handling order, leading to igt failures like gen9_exec_parse(bb-large).
> > 
> > Set O_LARGEFILE in __create_shmem() to prevent -EFBIG on large writes.
> > 
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Closes: https://lore.kernel.org/oe-lkp/202508081029.343192ec-lkp@intel.com
> > Fixes: 048832a3f400 ("drm/i915: Refactor shmem_pwrite() to use kiocb and write_iter")
> > Signed-off-by: Taotao Chen <chentaotao@didiglobal.com>

...

> Just a gentle ping on this patch. Any further comments or plans to pick it
> up?

Unfortunately your patch has not been picked up by our CI, now I
re-run the test.

In any case, your second patch can't be merged yet because your
previous one(*) has been applied to the wrong branch from
Christian while it should have gone through drm-intel-gt-next.
Now we need to wait for a backmerge.

In any case, if the tests succeed, I can already apply your first
patch so that it gets included in the Wednesday's pull request.

While the second patch, that is not a fix, has plenty of time and
can wait the backmerge.

Andi

(*) 048832a3f400 ("drm/i915: Refactor shmem_pwrite() to use kiocb and write_iter")
