Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 424B15F6E21
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 21:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C4410E87D;
	Thu,  6 Oct 2022 19:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A30B10E87D;
 Thu,  6 Oct 2022 19:22:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CB73AB82150;
 Thu,  6 Oct 2022 19:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57FCC433D7;
 Thu,  6 Oct 2022 19:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1665084154;
 bh=YsMh0kWe/OOR+5QG3loglTlzXYtyV8KBcvp4A3mJk5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BVJCPliSRQiCQnT7Nl1mNjkmwplBTP4CTh/QWA/r38FtWwVGbWjuoeyTvGbaEt5Ep
 sRnDdxkefmR3TRQULCPjSOp+KRIx0SdZjsp+ZUwI/6z1SIREquHhn84iNiUWZ/igTz
 lmi1YCbk/hJYZpNCJxUCJML1iHEdri22IlDOWvrI=
Date: Thu, 6 Oct 2022 21:23:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zheng Wang <zyytlz.wz@163.com>
Subject: Re: [PATCH v2] drm/i915/gvt: fix double free bug in
 split_2MB_gtt_entry
Message-ID: <Yz8rIxV7bVCcfZb0@kroah.com>
References: <20220928033340.1063949-1-zyytlz.wz@163.com>
 <20221006165845.1735393-1-zyytlz.wz@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006165845.1735393-1-zyytlz.wz@163.com>
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

On Fri, Oct 07, 2022 at 12:58:45AM +0800, Zheng Wang wrote:
> If intel_gvt_dma_map_guest_page failed, it will call
> ppgtt_invalidate_spt, which will finally free the spt.
> But the caller does not notice that, it will free spt again in error path.
> 
> Fix this by spliting invalidate and free in ppgtt_invalidate_spt.
> Only free spt when in good case.
> 
> Reported-by: Zheng Wang <hackerzheng666@gmail.com>
> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> ---
> v2:
> - split initial function into two api function suggested by Greg
> 
> v1: https://lore.kernel.org/all/20220928033340.1063949-1-zyytlz.wz@163.com/
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
> index ce0eb03709c3..55d8e1419302 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -959,6 +959,7 @@ static inline int ppgtt_put_spt(struct intel_vgpu_ppgtt_spt *spt)
>  	return atomic_dec_return(&spt->refcount);
>  }
>  
> +static int  ppgtt_invalidate_and_free_spt(struct intel_vgpu_ppgtt_spt *spt);

Odd extra space after the 'int', why?

