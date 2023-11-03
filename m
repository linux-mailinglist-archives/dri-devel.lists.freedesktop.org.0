Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7007DFD6A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 01:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A5F10E301;
	Fri,  3 Nov 2023 00:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46C210E301;
 Fri,  3 Nov 2023 00:07:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DFB4CCE20E0;
 Fri,  3 Nov 2023 00:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C87C433C9;
 Fri,  3 Nov 2023 00:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698970050;
 bh=5a8zs5Wr97PqvTIeegitAQv79m9E32DrziZ/OhWxb6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SzXFfYz/gbLo32NGREz8LG3QPUuTcAxdJuuySWpfPOBaLqOE6KMkJP4xN1dCqK1Cd
 ODC41L7Wg7XBvKP4Y+PRBEPQoMO7nw/Qk14p+ukSZIPZhx3w9iMhDvAx+O9WhTqvfY
 kaJgyh13A8AVaN6mog4MvqIymVKv9RfScPAqaM1relycZlxN24cAG5Bq7cy4PQ5zou
 aTW5ibbmsrIlUK6q3Imc5tPe5yTk+fiGuInTckvYB1pmdpTxaKnulaovTCiPbog3NT
 VIrZwz948ohOKXJDqFgReRXl/fsCzw5FNg3qWg+bOwb6zudb8YlthwBLcmp0tkKCh5
 rvLQpA3ij7ltA==
Date: Fri, 3 Nov 2023 01:07:23 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Fix potential spectre vulnerability
Message-ID: <20231103000723.e3lylefy46lf5zcm@zenone.zhora.eu>
References: <20231102101642.52988-1-chentao@kylinos.cn>
 <d300506c-ab82-4cc1-b750-61e54ec2ad9e@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d300506c-ab82-4cc1-b750-61e54ec2ad9e@linux.intel.com>
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
Cc: robdclark@chromium.org, dri-devel@lists.freedesktop.org,
 andi.shyti@linux.intel.com, chentao <chentao@kylinos.cn>,
 kunwu.chan@hotmail.com, intel-gfx@lists.freedesktop.org,
 jonathan.cavitt@intel.com, linux-kernel@vger.kernel.org,
 alan.previn.teres.alexis@intel.com, andrzej.hajda@intel.com,
 chris.p.wilson@intel.com, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 02, 2023 at 11:32:43AM +0000, Tvrtko Ursulin wrote:
> On 02/11/2023 10:16, chentao wrote:
> > Fix smatch warning:
> > drivers/gpu/drm/i915/gem/i915_gem_context.c:847 set_proto_ctx_sseu()
> > warn: potential spectre issue 'pc->user_engines' [r] (local cap)
> > 
> > Signed-off-by: chentao <chentao@kylinos.cn>
> 
> I don't know if this is actually exploitable given the time deltas between the index is read from userspace and acted upon here, which is at least two ioctls apart. But I suppose no harm in fixing and for safety so we need to add:
> 
> Fixes: d4433c7600f7 ("drm/i915/gem: Use the proto-context to handle create parameters (v5)")
> Cc: <stable@vger.kernel.org> # v5.15+

Is this a real fix? I don't mind adding it, though.

> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_context.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index 9a9ff84c90d7..b2fdfc7ca4de 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -843,7 +843,7 @@ static int set_proto_ctx_sseu(struct drm_i915_file_private *fpriv,
> >   		if (idx >= pc->num_user_engines)
> >   			return -EINVAL;
> > -
> 
> Just please refrain from random whitespace modifications like this blank line removal. If you resend without that you can add my r-b.
> 
> Regards,
> 
> Tvrtko
> 
> > +		idx = array_index_nospec(idx, pc->num_user_engines);

idx has been assigned earlier, can we make it one single
assignment at the declaration?

Andi
