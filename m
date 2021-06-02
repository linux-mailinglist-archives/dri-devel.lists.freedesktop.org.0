Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A24398FDF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 18:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207FD6ECF2;
	Wed,  2 Jun 2021 16:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CE36ECF2
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 16:22:37 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id b11so3645623edy.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 09:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+Sao+OgE2JqOoHP8Ok4/SDeRpQSWLnk/hTC6fnhnuBQ=;
 b=IPk8Utzg3fWSU2hLFnymZ5uqsdOsDsTvTttlp3QfIoryyADWSTk8Jtdlx8xhL8Yp8z
 x9NRtHWPF0+WWat5oL4WAeUk4PTpk51r+w4xUClf+idO5DMVg0slDX7Nydnw98g7GIm3
 FtLbchvW1CkZKz9bCULvx3uxp+kQZIEPg01IU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+Sao+OgE2JqOoHP8Ok4/SDeRpQSWLnk/hTC6fnhnuBQ=;
 b=IkcYt2iMAiClbryBAxpX0pJbqx3Z2CGi4mL6wNg89vLZ1ZTQbZ7gmrHrQYOz2OOAef
 Pe5Io0Z2pfhmDlEB3Wc02jAswyWrPeLfbAvs3VLBvEEqUXPYPeuy5r8GResmM5j7CXGp
 wl9HQCEvjez5elIhqU4jH5Ar/lGG/BMStHsK2mkmzV3JApv22kXdF930rdqn0b+0JFc9
 lHTsnRY/4BZZBCtkxo0WV62rLlRYirUke+ITZCGb/4wyTh/Sdpro//5eJlm9aeJsPKOh
 YuDvhTnhlats5xGJxq0t7qp+aD46AyRCsKGZJ+w+6miRvtxxXGGH8vFRFq0y1uUAEiqD
 QADA==
X-Gm-Message-State: AOAM531gbH8uQ5AagOgHqb/4v4mSBDUY9aItb2eMbOu7RT7+uJ7RYRGI
 WsNQ3t1gJv+7lGpiWaAehUP80g==
X-Google-Smtp-Source: ABdhPJyTsYXs4cAFPbGql5/xneiFVPbNKnnOm8z2KQdy7cCKQCh5cjV/63NGo5YSvcZ0+eDpRNx2FQ==
X-Received: by 2002:a05:6402:188:: with SMTP id
 r8mr38969015edv.75.1622650956668; 
 Wed, 02 Jun 2021 09:22:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m19sm252079edd.12.2021.06.02.09.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 09:22:36 -0700 (PDT)
Date: Wed, 2 Jun 2021 18:22:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH] vgaarb: Call vga_arb_device_init() after PCI enumeration
Message-ID: <YLewShl3lMyqJ1WZ@phenom.ffwll.local>
References: <20210528082607.2015145-1-chenhuacai@loongson.cn>
 <YLZYuM6SepbeLcI7@phenom.ffwll.local> <YLZqe14Lf2+5Lbf3@kroah.com>
 <YLZ2WJlHu0EZT7H9@phenom.ffwll.local>
 <CAAhV-H5Mt7tmmDVoix6sY3UtfhjxGvHovve2N=5o5xtvmFeQOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H5Mt7tmmDVoix6sY3UtfhjxGvHovve2N=5o5xtvmFeQOA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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

On Wed, Jun 02, 2021 at 06:36:03PM +0800, Huacai Chen wrote:
> Hi, Daniel,
> 
> On Wed, Jun 2, 2021 at 2:03 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Jun 01, 2021 at 07:12:27PM +0200, Greg KH wrote:
> > > On Tue, Jun 01, 2021 at 05:56:40PM +0200, Daniel Vetter wrote:
> > > > On Fri, May 28, 2021 at 04:26:07PM +0800, Huacai Chen wrote:
> > > > > We should call vga_arb_device_init() after PCI enumeration, otherwise it
> > > > > may fail to select the default VGA device. Since vga_arb_device_init()
> > > > > and PCI enumeration function (i.e., pcibios_init() or acpi_init()) are
> > > > > both wrapped by subsys_initcall(), their sequence is not assured. So, we
> > > > > use subsys_initcall_sync() instead of subsys_initcall() to wrap vga_arb_
> > > > > device_init().
> > >
> > > Trying to juggle levels like this always fails if you build the code as
> > > a module.
> > >
> > > Why not fix it properly and handle the out-of-order loading by returning
> > > a "deferred" error if you do not have your resources yet?
> >
> > It's not a driver, it's kinda a bolted-on-the-side subsytem of pci. So not
> > something you can -EPROBE_DEFER I think, without potentially upsetting the
> > drivers that need this.
> >
> > Which might mean we should move this into pci subsystem proper perhaps?
> > Then adding the init call at the right time becomes trivial since we just
> > plug it in at the end of pci init.
> >
> > Also maybe that's how distros avoid this pain, pci is built-in, vgaarb is
> > generally a module, problem solved.
> >
> > Bjorn, would you take this entire vgaarb.c thing? From a quick look I
> > don't think it has a drm-ism in it (unlike vga_switcheroo, but that works
> > a bit differently and doesn't have this init order issue).
> Emmm, this patch cannot handle the hotplug case and module case, it
> just handles the case that vgaarb, drm driver and pci all built-in.
> But I think this is enough, because the original problem only happens
> on very few BMC-based VGA cards (BMC doesn't set the VGA Enable bit on
> the bridge, which breaks vgaarb).

I'm not talking aout hotplug, just ordering the various pieces correctly.
That vgaarb isn't really a driver and also can't really handle hotplug is
my point. I guess that got lost a bit?

Anyway my proposal is essentially to do a

$ git move drivers/gpu/vga/vgaarb.c drivers/pci

But I just realized that vgaarb is a bool option, so module isn't possible
anyway, and we could fix this by calling vgaarb from pcibios init (with an
empty static inline in the header if vgaarb is disabled). That makes the
dependency very explicit and guarantees it works correctly.

Whether we move vgaarb into drivers/pci or not is then kinda orthogonal.

Thoughts on that?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
