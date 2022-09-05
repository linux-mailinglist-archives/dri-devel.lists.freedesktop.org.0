Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5215ACD59
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 10:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E1110E200;
	Mon,  5 Sep 2022 08:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D39610E1FE;
 Mon,  5 Sep 2022 08:04:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C0945610A5;
 Mon,  5 Sep 2022 08:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A350AC433D6;
 Mon,  5 Sep 2022 08:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1662365057;
 bh=ZviM3XQ2DcMV3uk7a7yxPjcP+JOLn+NSZCdFHlInwuI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WDuXJgJ/tP3RSsm/7imHBc/Vd0Qlz/CuALQErsD1g1FZNdNo7l1LNgbYOdnREqrZs
 Gl6QXF+9ALdBybSasdsVT+9FKbHk2JjlOdT4kdYmAp7koRZbH7r6MuC1+fnz0rV6Yn
 bcSzBHv8ARR0pQ1uMZe5l0j/3FI18MI3TYPv+N1A=
Date: Mon, 5 Sep 2022 10:04:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zheng Hacker <hackerzheng666@gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry.
Message-ID: <YxWtfjfpNsoPUrgh@kroah.com>
References: <tencent_E1BBF05904DFB73C478DCD592740AAE0780A@qq.com>
 <CAJedcCxVW++iH49UFZp9ruUuTcNubWCH6Wsqe11K4COB3E8msg@mail.gmail.com>
 <CAJedcCw1eJqjSK+yR7eQMDheNtH3Mjm+viwt00xAhnmrfpq2pw@mail.gmail.com>
 <CAJedcCweHjD78F7iydiq6Xc2iH=t_3m=H9JKnaCooToUk32FvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJedcCweHjD78F7iydiq6Xc2iH=t_3m=H9JKnaCooToUk32FvQ@mail.gmail.com>
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
Cc: alex000young@gmail.com, security@kernel.org,
 dri-devel@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, xmzyshypnc <1002992920@qq.com>,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 05, 2022 at 03:46:09PM +0800, Zheng Hacker wrote:
> I rewrote the letter. Hope it works.
> 
> There is a double-free security bug in split_2MB_gtt_entry.
> 
> Here is a calling chain :
> ppgtt_populate_spt->ppgtt_populate_shadow_entry->split_2MB_gtt_entry.
> If intel_gvt_dma_map_guest_page failed, it will call
> ppgtt_invalidate_spt, which will finally call ppgtt_free_spt and
> kfree(spt). But the caller does not notice that, and it will call
> ppgtt_free_spt again in error path.
> 
> Fix this by returning the result of ppgtt_invalidate_spt to split_2MB_gtt_entry.
> 
> Signed-off-by: Zheng Wang
> 
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
> index ce0eb03709c3..9f14fded8c0c 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -1215,7 +1215,7 @@ static int split_2MB_gtt_entry(struct intel_vgpu *vgpu,
>                 ret = intel_gvt_dma_map_guest_page(vgpu, start_gfn + sub_index,
>                                                    PAGE_SIZE, &dma_addr);
>                 if (ret) {
> -                       ppgtt_invalidate_spt(spt);
> +                       ret = ppgtt_invalidate_spt(spt);
>                         return ret;

But now you just lost the original error, shouldn't this succeed even if
intel_gvt_dma_map_guest_page() failed?

And how are you causing intel_gvt_dma_map_guest_page() to fail in a real
system?

thanks,

greg k-h
