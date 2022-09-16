Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B165BA82B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 10:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A06310ECE2;
	Fri, 16 Sep 2022 08:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3174910ECE1;
 Fri, 16 Sep 2022 08:25:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2CC80B82443;
 Fri, 16 Sep 2022 08:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35EEFC433C1;
 Fri, 16 Sep 2022 08:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1663316724;
 bh=A2pOOvWe2UB9wO3HzrBqjdtF0tZvSpZx4gzE5N3AOl8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rp9vqPJTTl/hwuAYY2FRCcdimXnwPc8g4TSgMJf6z8rTlq9Kp+MvMEsnTTshamB8M
 YbwiQadLyusRlPXNFLDgAlHJYYQ7wqIWKugaTusE0j1WtVopBKo4QJAWro+MR5pN0f
 xJJITCa9J/9fEFi7mB5NVVxxdISpnvSTObVZz12I=
Date: Fri, 16 Sep 2022 10:25:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zheng Hacker <hackerzheng666@gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry.
Message-ID: <YyQzDlM5n7mOLh5Q@kroah.com>
References: <CAJedcCxVW++iH49UFZp9ruUuTcNubWCH6Wsqe11K4COB3E8msg@mail.gmail.com>
 <CAJedcCw1eJqjSK+yR7eQMDheNtH3Mjm+viwt00xAhnmrfpq2pw@mail.gmail.com>
 <CAJedcCweHjD78F7iydiq6Xc2iH=t_3m=H9JKnaCooToUk32FvQ@mail.gmail.com>
 <YxWtfjfpNsoPUrgh@kroah.com>
 <CAJedcCzMo51aiy=Dv7zn7VmL3gwkw7JgzwAPAB2Z27C9CnhoYA@mail.gmail.com>
 <20220907030754.GU1089@zhen-hp.sh.intel.com>
 <CAJedcCxO_Rq0qMeLiHtY5+FuN1A1pDGsZd3gMtvUpm1xbAK3aA@mail.gmail.com>
 <Yxmzj2nCoTKurCY8@kroah.com>
 <CAJedcCwVC6Rg+wF7h6GhFvL6BGkKV=DS9Mo9fOf-gfDAk9VqPg@mail.gmail.com>
 <CAJedcCxRQ4h-ChNsD4OWpDMUJd3JNaQrvD=uVKxMpYONGFUgzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJedcCxRQ4h-ChNsD4OWpDMUJd3JNaQrvD=uVKxMpYONGFUgzA@mail.gmail.com>
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
Cc: "alex000young@gmail.com" <alex000young@gmail.com>,
 "security@kernel.org" <security@kernel.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 xmzyshypnc <1002992920@qq.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 16, 2022 at 02:39:21PM +0800, Zheng Hacker wrote:
> >From 8d95c1399e3ff345500a575e21254a73b0c89144 Mon Sep 17 00:00:00 2001
> From: xmzyshypnc <1002992920@qq.com>
> Date: Fri, 16 Sep 2022 14:37:48 +0800
> Subject: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry
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
> Fix this by only freeing spt in ppgtt_invalidate_spt in good case.
> 
> Signed-off-by: xmzyshypnc <1002992920@qq.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
> index 9f14fded8c0c..31d2a8d56384 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -959,7 +959,7 @@ static inline int ppgtt_put_spt(struct
> intel_vgpu_ppgtt_spt *spt)
>   return atomic_dec_return(&spt->refcount);
>  }
> 
> -static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt);
> +static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *sptm,
> int is_error);

Your patch is whitespace damaged and linewrapped and can not be applied,
and can only barely read :(

Please fix up your email client to not do this so that the change can be
properly reviewed and accepted if correct.

thanks,

greg k-h
