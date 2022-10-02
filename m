Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 818B65F238A
	for <lists+dri-devel@lfdr.de>; Sun,  2 Oct 2022 16:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA81E10E323;
	Sun,  2 Oct 2022 14:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC61910E323;
 Sun,  2 Oct 2022 14:17:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7170D60DEA;
 Sun,  2 Oct 2022 14:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E7DC433C1;
 Sun,  2 Oct 2022 14:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1664720269;
 bh=O0dVpkklwl+/CmBu9T6X6qz9+BKjvm8jj7H5XyJIFtI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hv36Au6oqRLpsEtoqNEzc96LyUd8otjN69WNWwMaVOA2KtRhKKR0U4f/B3zRswJDy
 yyBwBig/qpyA/eOrtxwCQD+p3Km+lpYHIfpIP4XEqI6eXXDVDXaJMn/cCyPGsfo5cZ
 flzQ6mTULmsdWPgbJIE9Kei2ak6XKy4CLFoF9yBo=
Date: Sun, 2 Oct 2022 16:18:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zheng Wang <zyytlz.wz@163.com>
Subject: Re: [PATCH] drm/i915/gvt: fix double free bug in split_2MB_gtt_entry
Message-ID: <Yzmds3DXu32EeSO5@kroah.com>
References: <CAJedcCzjWw6v5Nt42jsCStdpwHuz13D+q-CD=6ycVWBczY+4mg@mail.gmail.com>
 <20220928033340.1063949-1-zyytlz.wz@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928033340.1063949-1-zyytlz.wz@163.com>
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
Cc: alex000young@gmail.com, security@kernel.org, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, intel-gfx@lists.freedesktop.org, hackerzheng666@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 1002992920@qq.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 11:33:40AM +0800, Zheng Wang wrote:
> If intel_gvt_dma_map_guest_page failed, it will call
> ppgtt_invalidate_spt, which will finally free the spt.
> But the caller does not notice that, it will free spt again in error path.
> 
> Fix this by only freeing spt in ppgtt_invalidate_spt in good case.
> 
> Fixes: b901b252b6cf ("drm/i915/gvt: Add 2M huge gtt support")
> Reported-by: Zheng Wang <hackerzheng666@gmail.com>
> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
> index ce0eb03709c3..550519f0acca 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -959,7 +959,7 @@ static inline int ppgtt_put_spt(struct intel_vgpu_ppgtt_spt *spt)
>  	return atomic_dec_return(&spt->refcount);
>  }
>  
> -static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt);
> +static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, int is_error);

That is a horrible way to make an api (and it should be a bool too.)

Now every time you see this call in the code, you have to go look up
what the last parameter means.  Just make 2 functions, one that does the
"is error" thing, and one that does not, and that will be much easier to
maintain and understand for the next 10+ years.

thanks,

greg k-h
