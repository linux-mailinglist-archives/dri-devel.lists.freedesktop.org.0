Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E95D769FAE9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 19:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D9610E2D2;
	Wed, 22 Feb 2023 18:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C9610E2B1;
 Wed, 22 Feb 2023 18:21:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C26BDB81604;
 Wed, 22 Feb 2023 18:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF001C433EF;
 Wed, 22 Feb 2023 18:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677090088;
 bh=HXn80E9p8LKWYpzTx+X49SWBVTLtIFgizXhoT9554kI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fs2BUHjrEssaXYTE7+er1dEFxbr/2lKW9EVA0YRw7uh/ahvRj8NKl+E3Gt9C0oMBD
 PB+iOUc3pzLrj0RpKjJ4feWqdCiTH4sMOMtNrrjUPNRPF3J7scVe1krq0HgT6Sdsfb
 ZdXJTriGg9ZhuQNeUz81r9k+TOdGgNfrEcBspwggS5s04dDnMhhVUvss6yJ5yrX09r
 UpuHARuL0xLjkQQn67r0RCgHQ3nAUkzaW8fmp/QHEt7wgItvwb0/rgO1Csh47j89vW
 vY+GpwTPK/Fm2rooe5RgXmNy/lTHLLR/fJqAykOD4G2YXIWSjvZi6/Olv0oulDJR16
 K0V0n4kIsnWmQ==
Date: Wed, 22 Feb 2023 11:21:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/msm: return early when allocating fbdev fails
Message-ID: <Y/ZdJW3dxMVMGYlp@dev-arch.thelio-3990X>
References: <20230222155649.2001467-1-trix@redhat.com>
 <8f4a18d7-3477-5af0-605d-27098cc7e02c@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f4a18d7-3477-5af0-605d-27098cc7e02c@suse.de>
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
Cc: freedreno@lists.freedesktop.org, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, ndesaulniers@google.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, javierm@redhat.com,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 22, 2023 at 05:09:40PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 22.02.23 um 16:56 schrieb Tom Rix:
> > building with clang and W=1 reports
> > drivers/gpu/drm/msm/msm_fbdev.c:144:6: error: variable 'helper' is used
> >    uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
> >    if (!fbdev)
> >        ^~~~~~
> > 
> > helper is only initialized after fbdev succeeds, so is in a garbage state at
> > the fail: label.  There is nothing to unwinded if fbdev alloaction fails,
> > return NULL.
> > 
> > Fixes: 3fb1f62f80a1 ("drm/fb-helper: Remove drm_fb_helper_unprepare() from drm_fb_helper_fini()")
> > Signed-off-by: Tom Rix <trix@redhat.com>
> 
> Already fixed here: https://lore.kernel.org/dri-devel/08e3340e-b459-0e60-4bba-30716b675e05@suse.de/T/#t

There is also:

../drivers/gpu/drm/omapdrm/omap_fbdev.c:235:6: error: variable 'helper' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
        if (!fbdev)
            ^~~~~~
../drivers/gpu/drm/omapdrm/omap_fbdev.c:259:26: note: uninitialized use occurs here
        drm_fb_helper_unprepare(helper);
                                ^~~~~~
../drivers/gpu/drm/omapdrm/omap_fbdev.c:235:2: note: remove the 'if' if its condition is always false
        if (!fbdev)
        ^~~~~~~~~~~
../drivers/gpu/drm/omapdrm/omap_fbdev.c:228:30: note: initialize the variable 'helper' to silence this warning
        struct drm_fb_helper *helper;
                                    ^
                                     = NULL
1 error generated.

Is the fix the same as the one you have linked above?

Cheers,
Nathan
