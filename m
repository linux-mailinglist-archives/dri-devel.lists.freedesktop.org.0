Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4254539835E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 09:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C996E041;
	Wed,  2 Jun 2021 07:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC736E041
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 07:43:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65632613BD
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 07:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622619808;
 bh=aB/TfA6DIFveBQ15BANW3ioheXeZgKwKIJrAEAY1v0E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Qv3TZ1uHlFJUAvbYUP7e2WB+EAwAxxYVrgM/MP4amEeEGlv38kTGCnJyc8Dwf17Ty
 8gb1s5kgojg6C4PZdcPaQujjutU09t7avPcpy23aPSIw3uVw73ykfbYbA4UA7tIaTj
 WXlsEAfkv696ugfZCU3qUkzGdI4r7V1q6SWKialSYOXJOSg8ttDPgxTed8B2hcDf2f
 cC0qjNJ8nt6sd/kTN7+iPh65ahZjUJxld3tiItThNN69S1x72lbV/DmDTngT2YSB7/
 mw+/ovs3iKgc/VioHnIiDpZl8r9M1Jhx2ZK5gkSCg/Q+OshQaStrtwrAuadGbQwBsH
 DLPi4C2sD9hYQ==
Received: by mail-il1-f179.google.com with SMTP id r6so1307520ilj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 00:43:28 -0700 (PDT)
X-Gm-Message-State: AOAM5310yAoGqji17yZj1VuN6vQq+KHC9Y2FJcWqROjJqN7Ta4QE44rw
 1oKmq1fVPKZ/dHJgepO6JGym4gCOmNnCxUGn+b8=
X-Google-Smtp-Source: ABdhPJyF8yfNrNm6baTU6Lxoww3+rGYzMEKRSK6BeiTYLqWROANvWAgTwpn5dZXmPrrw4vbdcXo7j7y8z1Hg3kBoSBI=
X-Received: by 2002:a92:260b:: with SMTP id n11mr24888187ile.134.1622619807946; 
 Wed, 02 Jun 2021 00:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210528082607.2015145-1-chenhuacai@loongson.cn>
 <YLZYuM6SepbeLcI7@phenom.ffwll.local>
In-Reply-To: <YLZYuM6SepbeLcI7@phenom.ffwll.local>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 2 Jun 2021 15:43:16 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5L4mgH5W1wACecm0e0Rp5Fy1fUqaj-R83K=+cNaZadOg@mail.gmail.com>
Message-ID: <CAAhV-H5L4mgH5W1wACecm0e0Rp5Fy1fUqaj-R83K=+cNaZadOg@mail.gmail.com>
Subject: Re: [PATCH] vgaarb: Call vga_arb_device_init() after PCI enumeration
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Xuefeng Li <lixuefeng@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Daniel,

On Tue, Jun 1, 2021 at 11:56 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, May 28, 2021 at 04:26:07PM +0800, Huacai Chen wrote:
> > We should call vga_arb_device_init() after PCI enumeration, otherwise it
> > may fail to select the default VGA device. Since vga_arb_device_init()
> > and PCI enumeration function (i.e., pcibios_init() or acpi_init()) are
> > both wrapped by subsys_initcall(), their sequence is not assured. So, we
> > use subsys_initcall_sync() instead of subsys_initcall() to wrap vga_arb_
> > device_init().
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>
> Is there a bug report for this? Should we mark this cc: stable?
No bug report yet, we just found vga_arb_device_init() has no effect
on Loongson platform.

Huacai
>
> Also adding Bjorn/Greg since I have no idea whether this is the right fix.
> It does do what it says on the tin, but that's maybe not the best approach
> here.
> -Daniel
>
> > ---
> >  drivers/gpu/vga/vgaarb.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
> > index 5180c5687ee5..4b8a62af34cf 100644
> > --- a/drivers/gpu/vga/vgaarb.c
> > +++ b/drivers/gpu/vga/vgaarb.c
> > @@ -1564,4 +1564,4 @@ static int __init vga_arb_device_init(void)
> >       pr_info("loaded\n");
> >       return rc;
> >  }
> > -subsys_initcall(vga_arb_device_init);
> > +subsys_initcall_sync(vga_arb_device_init);
> > --
> > 2.27.0
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
