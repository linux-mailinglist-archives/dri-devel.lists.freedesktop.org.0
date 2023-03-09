Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B240C6B1B26
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 07:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA7010E796;
	Thu,  9 Mar 2023 06:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E983110E796
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 06:11:51 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id a3so724821vsi.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 22:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678342311;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DOzTOu7edVtxvcJFXb3EsqSUZ93p9slEkC3iI88cKoI=;
 b=N30kyudSkCl3/te0Vn30Yn5Qu/oKErDE/QG0ofKinWC0NYLlcWzUagCP7fZZxpwpcs
 ZIzjUnPO/18w0yiW4R868/2X0RJ14TPVNDPufKvQ/mPDQ5z4BtscMdyRuqQWVXyEa603
 4tAdhqbRGHwBEBbbM9c9LCG74SyuSN4ifDJnajKWa47eU7ONQWi3x7tZNmD4PlgrlnqT
 cuypy95LQVMKf/SOGvJNOncoK7H0SXAuNCxdIFpQPLOJdqSZefU+gQ15LNuKFKUeoW3o
 8BMpU2jNQyV4DS/D1YHzfGb0To3j8MrD+okeVigtRwL5fvsdTNWANN/FFWP0h4jOowsD
 h7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678342311;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DOzTOu7edVtxvcJFXb3EsqSUZ93p9slEkC3iI88cKoI=;
 b=5ZWiQujwS4Xs9IeaU5BzomXJa+A+ZOc8ylXEQ/Ex4KnhqadPMfwiSdr5IyYLVcOJ5n
 16gvpccEP8N2+TlQueqQwRBpw1xrAsds7hSo3ArtN3C6oDCC/3bFojRF99k12rdMXzgQ
 ZKoK/nU79KzW2WSFiDjkRI9kNMFVElYtVEXF6XnvSQGKr1oGtSKsZStCzL4aF11pz1yP
 rshZ1rd+gJJItyqb9x+CATqCi2bV4iAzE8nAZvXuRNDLwBEHJKaDsrzSiLj13o2UDN8r
 eiTSTqPyg26MoRWNZXrcJ/kdzUJJ6s9s6XDvATCMCniSxP6laomYhcdhhZBLTzd+zYBu
 O2oQ==
X-Gm-Message-State: AO0yUKWW0ijrgFTg0kNivxo9Wo5K1z4CJa6DiCjIougKs6x6c6vCN0u/
 4Mv4la6HC9dpN0zUlUM4ncgjyV8Fxglivq3gwfM=
X-Google-Smtp-Source: AK7set+pChHLpiXzjFwd9oKRlK2Hl+8a6uJ9CpwuwrCWNy+dbs7lk2te8UfH2A6eoG2JZv0/neHDZ4xE1qFYn3K+vOw=
X-Received: by 2002:a67:7302:0:b0:414:2d02:6c96 with SMTP id
 o2-20020a677302000000b004142d026c96mr13522386vsc.7.1678342310849; Wed, 08 Mar
 2023 22:11:50 -0800 (PST)
MIME-Version: 1.0
References: <20230307130856.2295182-1-harperchen1110@gmail.com>
 <123a52d8-baf0-e32b-3262-1e8619b1c3ad@gmx.de>
In-Reply-To: <123a52d8-baf0-e32b-3262-1e8619b1c3ad@gmx.de>
From: Wei Chen <harperchen1110@gmail.com>
Date: Thu, 9 Mar 2023 14:11:14 +0800
Message-ID: <CAO4mrfem6K99Qnj7F-2Yqf25gG5zLSqumaz0N176j_Ekn+m-nA@mail.gmail.com>
Subject: Re: [PATCH] fbdev: tgafb: Fix potential divide by zero
To: Helge Deller <deller@gmx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-fbdev@vger.kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 wsa+renesas@sang-engineering.com, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Helge,

Thank you for the kind words. My real name is Wei Chen.

Please apply this patch to fbdev git tree if it is correct.

Best,
Wei

On Thu, 9 Mar 2023 at 06:05, Helge Deller <deller@gmx.de> wrote:
>
> On 3/7/23 14:08, harperchen wrote:
> > fb_set_var would by called when user invokes ioctl with cmd
> > FBIOPUT_VSCREENINFO. User-provided data would finally reach
> > tgafb_check_var. In case var->pixclock is assigned to zero,
> > divide by zero would occur when checking whether reciprocal
> > of var->pixclock is too high.
> >
> > Similar crashes have happened in other fbdev drivers. There
> > is no check and modification on var->pixclock along the call
> > chain to tgafb_check_var. We believe it could also be triggered
> > in driver tgafb from user site.
> >
> > Signed-off-by: harperchen <harperchen1110@gmail.com>
>
> Could you provide a real name?
> Otherwise applied to fbdev git tree.
>
> Thanks!
> Helge
>
> > ---
> >   drivers/video/fbdev/tgafb.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/video/fbdev/tgafb.c b/drivers/video/fbdev/tgafb.c
> > index 14d37c49633c..b44004880f0d 100644
> > --- a/drivers/video/fbdev/tgafb.c
> > +++ b/drivers/video/fbdev/tgafb.c
> > @@ -173,6 +173,9 @@ tgafb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
> >   {
> >       struct tga_par *par = (struct tga_par *)info->par;
> >
> > +     if (!var->pixclock)
> > +             return -EINVAL;
> > +
> >       if (par->tga_type == TGA_TYPE_8PLANE) {
> >               if (var->bits_per_pixel != 8)
> >                       return -EINVAL;
>
