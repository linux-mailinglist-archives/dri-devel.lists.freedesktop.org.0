Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3405FD7D5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 12:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A482A10E212;
	Thu, 13 Oct 2022 10:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B0410E212
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 10:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665657394; x=1697193394;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=84cm2nDkKB3FojEUx+eiD5IfKY7NpFQn3U+ONC/nHWs=;
 b=Xo4srt8Sc+4DuEDjqdcjzvRZYIMub112Zp7zlOKfNII7J9kVYMVGNn2X
 4rkFpuoN+YSC0vX1DrgXU2xvrbchCeYrXDC8iOHtx1RBrhAKCAYAVaZfe
 N1qbVApQXM4fU3JSXVciAlxJpvzx8LQD8onRo8uzxWm5H/iFoe3rMQF/9
 DwNCQB7ZVEym6+h71Gqan/14ho5NCIEhquVVdV8Ezs9XMkKW8dNzRB+lC
 LRdZXV98GJkH4k4fAL6RrSOoi1SJ6/o7qrwYKlH3QompkNB9xvEd/TUzk
 i0qGXaEv3StnvS9mpYnt0ELQ4K3EIor5VhwmF5EcYWu9q0ZkzDE5CCxCA Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="391350427"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="391350427"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 03:36:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="872275679"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="872275679"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga006.fm.intel.com with SMTP; 13 Oct 2022 03:36:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 13 Oct 2022 13:36:30 +0300
Date: Thu, 13 Oct 2022 13:36:30 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/mgag200: Fix PLL setup for G200_SE_A rev >=4
Message-ID: <Y0fqLofkA7O4IEbQ@intel.com>
References: <20221013082901.471417-1-jfalempe@redhat.com>
 <db634341-da68-e8a6-1143-445f17262c63@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db634341-da68-e8a6-1143-445f17262c63@suse.de>
X-Patchwork-Hint: comment
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
Cc: airlied@redhat.com, Jocelyn Falempe <jfalempe@redhat.com>,
 stable@vger.kernel.org, michel@daenzer.net, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 13, 2022 at 11:05:19AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.10.22 um 10:29 schrieb Jocelyn Falempe:
> > For G200_SE_A, PLL M setting is wrong, which leads to blank screen,
> > or "signal out of range" on VGA display.
> > previous code had "m |= 0x80" which was changed to
> > m |= ((pixpllcn & BIT(8)) >> 1);
> > 
> > Tested on G200_SE_A rev 42
> > 
> > This line of code was moved to another file with
> > commit 85397f6bc4ff ("drm/mgag200: Initialize each model in separate
> > function") but can be easily backported before this commit.
> > 
> > Fixes: 2dd040946ecf ("drm/mgag200: Store values (not bits) in struct mgag200_pll_values")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> > ---
> >   drivers/gpu/drm/mgag200/mgag200_g200se.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> > index be389ed91cbd..4ec035029b8b 100644
> > --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
> > +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> > @@ -284,7 +284,7 @@ static void mgag200_g200se_04_pixpllc_atomic_update(struct drm_crtc *crtc,
> >   	pixpllcp = pixpllc->p - 1;
> >   	pixpllcs = pixpllc->s;
> >   
> > -	xpixpllcm = pixpllcm | ((pixpllcn & BIT(8)) >> 1);
> > +	xpixpllcm = pixpllcm | BIT(7);
> 
> Thanks for figuring this out. G200SE apparently is special compared to 
> the other models. The old MGA docs only list this bit as <reserved>. 
> Really makes me wonder why this is different.

Could measure eg. the vblank interval with and without that bit set
and see what effect it has. Assuming the PLL locks without the bit
of course.

-- 
Ville Syrjälä
Intel
