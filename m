Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69F29537E9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 18:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC4410E153;
	Thu, 15 Aug 2024 16:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b5MlLt8g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8F610E153;
 Thu, 15 Aug 2024 16:07:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B89F61F14;
 Thu, 15 Aug 2024 16:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1469C32786;
 Thu, 15 Aug 2024 16:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723738061;
 bh=CqSRzNnvmk1yA3FnJFDSAd2k79a1u4Xej/LtRM+fVZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b5MlLt8g3jMAhQ/uLGUNDskKWbJFqHhk9vAY1Va6OS5YfbJRn4R5N/10EnkQBysQV
 Ix1S8iTh8Wzp3+HNkzlGFUu6RjWGMmpBZaJz1eUK54iuuzAbnvmREFRz8Pf+h9U803
 Zdd5GH6nG8OSzuymth0PAwdU37rXalmn7f3b3IBjcYxZrmw6g94LCtPpZ9Sgr+lEEW
 FWPWQjY1Dc3QPOUr4rRHEjNpgpYl8hpRxq7obQVUIGWXtisyCQNxJTQ/tDVFk4hL8H
 LJYX3+1DHvThJYkak2Z3W9uiHCDVUqhoLY78olT7fJ16LKd2Nm7mYbwJPyk1+ytcJQ
 /ld0wUa8KUyDg==
Date: Thu, 15 Aug 2024 09:07:41 -0700
From: Kees Cook <kees@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v2 2/2] drm: use mem_is_zero() instead of !memchr_inv(s,
 0, n)
Message-ID: <202408150907.5B5C5FCDF@keescook>
References: <20240814100035.3100852-1-jani.nikula@intel.com>
 <20240814100035.3100852-2-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814100035.3100852-2-jani.nikula@intel.com>
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

On Wed, Aug 14, 2024 at 01:00:35PM +0300, Jani Nikula wrote:
> Use the mem_is_zero() helper where possible.
> 
> Conversion done using cocci:
> 
> | @@
> | expression PTR;
> | expression SIZE;
> | @@
> |
> |   <...
> | (
> | - memchr_inv(PTR, 0, SIZE) == NULL
> | + mem_is_zero(PTR, SIZE)
> | |
> | - !memchr_inv(PTR, 0, SIZE)
> | + mem_is_zero(PTR, SIZE)
> | |
> | - memchr_inv(PTR, 0, SIZE)
> | + !mem_is_zero(PTR, SIZE)
> | )
> |   ...>
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Thanks for these patches! Since drm is the first user, feel free to
carry it there unless you'd prefer I carry it in my trees?

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
