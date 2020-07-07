Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00145217855
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 21:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40176E111;
	Tue,  7 Jul 2020 19:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62A66E111
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 19:52:49 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 73B37804D8;
 Tue,  7 Jul 2020 21:52:45 +0200 (CEST)
Date: Tue, 7 Jul 2020 21:52:43 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: Panic booting qemu-system-sparc64 with bochs_drm
Message-ID: <20200707195243.GA17970@ravnborg.org>
References: <671ea432-7e2b-ab37-225e-fd32aef9a3e3@ilande.co.uk>
 <20200704072305.GA689588@ravnborg.org>
 <02fbd875-f6fd-da20-6835-778bdd6426c3@ilande.co.uk>
 <485ded46-c1a3-1eab-eb95-1a771543fbaf@ilande.co.uk>
 <20200704134115.GA755192@ravnborg.org>
 <1d19833f-2977-a12f-f3a9-ef0d509ef366@ilande.co.uk>
 <20200704145212.GA791554@ravnborg.org>
 <98897d2e-38bd-6fcf-ab81-3f5f56906fb8@ilande.co.uk>
 <20200707070341.wpxyrlkrtbhghtro@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707070341.wpxyrlkrtbhghtro@sirius.home.kraxel.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=3GLR1-XzZKwA:10 a=_1BWrxInPcDn1gIt2YYA:9
 a=CjuIK1q_8ugA:10
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gerd.

On Tue, Jul 07, 2020 at 09:03:41AM +0200, Gerd Hoffmann wrote:
> > Yes, that's correct - I can confirm that the simplified diff below works:
> > 
> > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > index 5609e164805f..83af05fac604 100644
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -399,7 +399,7 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper
> > *fb_helper,
> >         unsigned int y;
> > 
> >         for (y = clip->y1; y < clip->y2; y++) {
> > -               memcpy(dst, src, len);
> > +               fb_memcpy_tofb(dst, src, len);
> 
> fb_memcpy_tofb is #defined to sbus_memcpy_toio @ sparc which looks
> wrong to me given that this is a pci not a sbus device.  sparc also has
> memcpy_toio which looks better to me.
Looked at sbus_memcpy_toio and memcpy_toio for sparc64.
They are essential the same. Only read bytes in little-endian format,
the other read bytes in big-endian format. So thats the same.

I will prepare a proper patch with focus on fixin sparc64 only.

> 
> There are blit helpers in drm_format_helper.c which already use
> memcpy_toio(), I guess we should do the same here.  Not fully sure we
> can use memcpy_toio() unconditionally here.  Given that a shadow
> framebuffer makes sense only in case the real framebuffer is not in
> normal ram we probably can.
Not so sure about this part.
We unconditionally enable the use of a shadow framebuffer.
But on some archs the framebuffer is not in io space - but then
on these architectures memcpy_toio boils down to a simple memcpy.
So maybe in the end everything is fine.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
