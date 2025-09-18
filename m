Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1C2B8441F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 13:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850E510E70B;
	Thu, 18 Sep 2025 11:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DszInJVe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF37C10E713;
 Thu, 18 Sep 2025 11:04:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EB0E96020D;
 Thu, 18 Sep 2025 11:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398A7C4CEEB;
 Thu, 18 Sep 2025 11:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758193448;
 bh=KCM2an48/bEFBf8NS7uq6k/rwlRWv7+LUFybPERbT9Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DszInJVedDqIo9ecQpafmUEKYnRlqKAGgF9vtF+tMzodzbGhTryFMiKR1RiQKN+Wt
 +kmWJNflvgrf8kzc7bUZcd0otxxM9bU3STK6LqeEJ6azTLS6NYjF27koSDY0xLEA9h
 XxxV1YxeYHZvj92g/7oT1vZloB0YvEh+3C1zFz00qAFr4ReHrdI3+oCjY1YyKBLZpj
 HTqNYRpY+XbpIUKq1DbHXCNVAP4EWV/ngsouhcIaP1YDbyB/JM4syD9B3RatAp6Pu9
 +zQql+vcpfBZUaEthnFQ9gh75wnSdKjb8qSd5tDh4lcTv2knVxxbkfMDy1IQQhFFfs
 LTOkGJhqFSikw==
Date: Thu, 18 Sep 2025 13:04:05 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?6ZmI5rab5rab?= Taotao Chen <chentaotao@didiglobal.com>
Cc: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, 
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>, 
 "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>, 
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "chentao325@qq.com" <chentao325@qq.com>,
 kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915: set O_LARGEFILE in __create_shmem()
Message-ID: <fumkp34yvnyibpeyfqbiactmjhkuvpzhj52l45xjzygjwv6zny@ooydqcmamfr5>
References: <20250822030651.28099-1-chentaotao@didiglobal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822030651.28099-1-chentaotao@didiglobal.com>
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

Both patches merged to drm-intel-gt-next.

Thank you,
Andi

On Fri, Aug 22, 2025 at 03:06:59AM +0000, 陈涛涛 Taotao Chen wrote:
> From: Taotao Chen <chentaotao@didiglobal.com>
> 
> Without O_LARGEFILE, file->f_op->write_iter calls
> generic_write_check_limits(), which enforces a 2GB (MAX_NON_LFS) limit,
> causing -EFBIG on large writes.
> 
> In shmem_pwrite(), this error is later masked as -EIO due to the error
> handling order, leading to igt failures like gen9_exec_parse(bb-large).
> 
> Set O_LARGEFILE in __create_shmem() to prevent -EFBIG on large writes.
> 
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202508081029.343192ec-lkp@intel.com
> Fixes: 048832a3f400 ("drm/i915: Refactor shmem_pwrite() to use kiocb and write_iter")
> Signed-off-by: Taotao Chen <chentaotao@didiglobal.com>
> ---
> v2:
>  - Add force_o_largefile() guard before setting O_LARGEFILE
> 
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index e3d188455f67..b9dae15c1d16 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -514,6 +514,13 @@ static int __create_shmem(struct drm_i915_private *i915,
>  	if (IS_ERR(filp))
>  		return PTR_ERR(filp);
>  
> +	/*
> +	 * Prevent -EFBIG by allowing large writes beyond MAX_NON_LFS on shmem
> +	 * objects by setting O_LARGEFILE.
> +	 */
> +	if (force_o_largefile())
> +		filp->f_flags |= O_LARGEFILE;
> +
>  	obj->filp = filp;
>  	return 0;
>  }
> -- 
> 2.34.1
