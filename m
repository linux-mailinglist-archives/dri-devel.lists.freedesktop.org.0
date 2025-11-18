Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6D4C69BF3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 14:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBCB10E4BB;
	Tue, 18 Nov 2025 13:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h3t6Be/X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACD510E4BB;
 Tue, 18 Nov 2025 13:57:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AE24060219;
 Tue, 18 Nov 2025 13:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14424C116D0;
 Tue, 18 Nov 2025 13:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763474248;
 bh=0ldc/eST3osB8ivcn6OQLmHNlwBfFgL+Dhy8vtw5tNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h3t6Be/XyKiOfG4i7ADYJk0X1mFkC8xhBV2NkuupwvPDw4sAeS9f2RjN529UwX4yS
 bO+5hAeHl6SNHsL4aUY9bF1wAK+kZSHhCGdTF/y5CDLm4mGro6z2+RnhrXYAhUmIKd
 Q/6fGgBVPaXFe5XZagoMApFhyj9J214o2Fo4+8HZpv6Ntw8nojWA9jw/0EZOhxW1K/
 Bk0byFKsKXjnJkq2OVDP6LY+2aEosAb/Zrn5Xmmx0uJbX7SHosuYeBVVHZBEnkHcve
 4sj1u/98Y5aM/WYfhXQZuq8LgKssXB0trmnLZmtoUUpUwn6cynUdj3uOEyE68/nGTt
 DsdMaDHxLCmpg==
Date: Tue, 18 Nov 2025 14:57:22 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Zilin Guan <zilin@seu.edu.cn>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch, 
 andi.shyti@linux.intel.com, mikolaj.wasiak@intel.com, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com, nitin.r.gote@intel.com,
 intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jianhao.xu@seu.edu.cn
Subject: Re: [PATCH v2] drm/i915: Use symmetric free for vma resources
Message-ID: <dy5tnbzlla5dbr2z6u2q7fwfnnwcn3m4l52pkc2ycrfdqy7qw3@jkvgq3f3khtk>
References: <20251113063405.116845-1-zilin@seu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113063405.116845-1-zilin@seu.edu.cn>
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

Hi Zilin,

On Thu, Nov 13, 2025 at 06:34:05AM +0000, Zilin Guan wrote:
> The error paths in reserve_gtt_with_resource() and
> insert_gtt_with_resource() use kfree() to release a vma_res object
> that was allocated with i915_vma_resource_alloc().
> 
> While kfree() can handle slab-allocated objects, it is better practice
> to use the symmetric free function.
> 
> Replace kfree() with the specific i915_vma_resource_free() helper to
> improve readability and ensure the alloc/free pairing is explicit.
> 
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>

Thanks for your patch,

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
