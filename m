Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFC6197500
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C967B89F53;
	Mon, 30 Mar 2020 07:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01AE26E194
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 01:04:52 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id h131so13943412iof.1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 18:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xEq14gH8MJ7hv3D8jymXXOPTR88QaLueWbAQX3wPTCI=;
 b=g2CrChD5giKWudtUUGe7Dk4fpmJs/Q1hRfTmTMy7boQPFpx8ZRml/KS883rNanHpRn
 2ZqgiC854Qu40PaAk1IvSSbZdvemDyOcwZ1RxhJUI3MBWOBlzZjgmetBlDEKRxNd/YfD
 Ls1La1vTqcezL3Jwji56DbSpl7ugEsHjLFF+ZZjZ6UmVDj11Lbe0msce8dsMQaTNfR1m
 uvFlL9Sb4vDcuIm3kx68geUs8fcF3Zne24rlOOAyXaJY9I8dEqcv+jmzmoZ1/eOC3oUq
 WwBRICbuAPjeM6d2AGNSRoEm+J6wfiq0W/l/mE3MHy0Pya1qm7LKjtBdNlXYx88EVr/3
 UsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xEq14gH8MJ7hv3D8jymXXOPTR88QaLueWbAQX3wPTCI=;
 b=Sw8sF6jHlmY4T5wd7HzZcfPSC19i0mmd8MKd3NvX//DngXa0KGdFo6pJJ+0zHLiq5g
 /DP3rMBitToC32JzML84/+tLNyjWXOrSfqgOoGl8k2y9pPTv394hkis/1CzDCenSMvMs
 2WXLNk67kLgVXAIB2jWM11aPFQACJ/dP9ljgJ41lo3NszwXSFsR7s91jiTwmenuMiq7E
 kJK+tjfrDl5599bWvTnrshjmD15K6VOHGuV3hkw4Si2g7GoScj84jf975LJLW+GwtOi7
 AVXwHeLeLiV1w45sikUaWfSFUwXnEMqf7+oPGOWNR0scvPMy+lxEd/W/KY1VAc7sdIi/
 R4+w==
X-Gm-Message-State: ANhLgQ2c9YEAf4nqq6a97MZHsCnhMUuY7esqFzUegz+6cfx5/w91TjxH
 D/uyrKu4EP4npSiiczVUsGR4YpL4sdLx6MN0pgGlowkY
X-Google-Smtp-Source: ADFU+vt1KZuhCRM+OKkatVV3lTeceg4W8ntn06ZjFKjPPU9/MpP04h0cm6lxyPiDzVyULvca5SJ8ckIz8wyGD2DZEL8=
X-Received: by 2002:a6b:5406:: with SMTP id i6mr4908695iob.188.1585443892387; 
 Sat, 28 Mar 2020 18:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200328151511.22932-1-hqjagain@gmail.com>
 <20200328181259.GA24335@ravnborg.org>
In-Reply-To: <20200328181259.GA24335@ravnborg.org>
From: Qiujun Huang <hqjagain@gmail.com>
Date: Sun, 29 Mar 2020 09:04:41 +0800
Message-ID: <CAJRQjoeOfiyacHcFfQOop5jJ9MspDKL8HTjQeAY-_Wbm9PnFGg@mail.gmail.com>
Subject: Re: [PATCH] fbcon: fix null-ptr-deref in fbcon_switch
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, ghalat@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 29, 2020 at 2:13 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Qiujun
>
> Thanks for looking into the sysbot bugs.
>
> On Sat, Mar 28, 2020 at 11:15:10PM +0800, Qiujun Huang wrote:
> > Add check for vc_cons[logo_shown].d, as it can be released by
> > vt_ioctl(VT_DISALLOCATE).
> >
> > Reported-by: syzbot+732528bae351682f1f27@syzkaller.appspotmail.com
> > Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
> > ---
> >  drivers/video/fbdev/core/fbcon.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> > index bb6ae995c2e5..7ee0f7b55829 100644
> > --- a/drivers/video/fbdev/core/fbcon.c
> > +++ b/drivers/video/fbdev/core/fbcon.c
> > @@ -2254,7 +2254,7 @@ static int fbcon_switch(struct vc_data *vc)
> >               fbcon_update_softback(vc);
> >       }
> >
> > -     if (logo_shown >= 0) {
> > +     if (logo_shown >= 0 && vc_cons_allocated(logo_shown)) {
> >               struct vc_data *conp2 = vc_cons[logo_shown].d;
> >
> >               if (conp2->vc_top == logo_lines
> > @@ -2852,7 +2852,7 @@ static void fbcon_scrolldelta(struct vc_data *vc, int lines)
> >                       return;
> >               if (vc->vc_mode != KD_TEXT || !lines)
> >                       return;
> > -             if (logo_shown >= 0) {
> > +             if (logo_shown >= 0 && vc_cons_allocated(logo_shown)) {
> >                       struct vc_data *conp2 = vc_cons[logo_shown].d;
> >
> >                       if (conp2->vc_top == logo_lines
>
> I am not familiar with this code.
>
> But it looks like you try to avoid the sympton
> which is that logo_shown has a wrong value after a
> vc is deallocated, and do not fix the root cause.
>
> We have:
>
> vt_ioctl(VT_DISALLOCATE)
>  |
>  +- vc_deallocate()
>      |
>      +- visual_deinit()
>          |
>          +- vc->vc_sw->con_deinit(vc)
>              |
>              +- fbcon_deinit()
>
> Would it be better to update logo_shown
> in fbcon_deinit()?
> Then we will not try to do anything with
> the logo in fbcon_switch().
>
> fbcon_deinit() is called with console locked
> so there should not be any races.

Get that, thanks.

>
> I did not stare long enough on the code to come up with a patch,
> but this may be a better way to fix it.
>
>         Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
