Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A906399379
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 21:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B91F6E52F;
	Wed,  2 Jun 2021 19:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F5C6EE46
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 19:26:50 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id z8so3376789wrp.12
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 12:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KCZuEVHY8PRAMaR2f9HZU/XO764Lhf/TagYEBckEfyk=;
 b=J1PYEz6797hxcf0mfVCZKMT/kYRL+HZl89cL+q+fU+ZSou/9cWTF2Gd6zK4S/5tHoY
 4JMbd8ETj3jfQZ5/CerZJAWHFPWfjL3re8PPPmR3XUonT0ucZqYsfShAO0DsVRCYYmqv
 P1YIkAHwyOVQMhXaaZeOCN32x1GWn80yt4YJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KCZuEVHY8PRAMaR2f9HZU/XO764Lhf/TagYEBckEfyk=;
 b=LDOG6xqnBZG8qqvyDqeV1bl4c+/7z40aFLEYEhYh16PIx5ZxWPy7LOMQNvJLNIcfsQ
 qiiIkNNK50L2DfZQfCSQxnsU1TxwRLMh1UmRR7ASHtLG7AieXF6ofaBmXCibWb5UyWRM
 imtUj0ddcfhPaG49mm88hT+2L2HvK/FUdQBvsvX7ErbZWQI0NSa08SFCQh4eYZ4AnQZk
 uMsKWwQBlGy/eou2frK/clcPJ65iglR361qoGGpU1H4ENIbB4o9tnrTcoD6zO+XLVY5B
 Q2vuApe6TAbgflDsHjoyPk1SeKFWqcavUi0HdUAOzY86jpy1kvYE+j4boocbu6e0vzQ0
 6Pow==
X-Gm-Message-State: AOAM531itPa7bSkNe7/TR+QnZf/eyNfR9UWj7c4z5nWL4Q+BJmeWHZmY
 JkX/XyfonXecbss3UEaUfhGYcpQltHU85w==
X-Google-Smtp-Source: ABdhPJyOw8Ogx4gG1a7Z4NEzammiy7JdJWo2SWFLgLrDuqK7vUnEZ6kh2jQpOzRa99LCsglTO+e5Rw==
X-Received: by 2002:a5d:6082:: with SMTP id w2mr9331686wrt.209.1622662008747; 
 Wed, 02 Jun 2021 12:26:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y2sm4214347wmq.45.2021.06.02.12.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 12:26:48 -0700 (PDT)
Date: Wed, 2 Jun 2021 21:26:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] vgaarb: Call vga_arb_device_init() after PCI enumeration
Message-ID: <YLfbdj8Eb310D/Ps@phenom.ffwll.local>
References: <20210528082607.2015145-1-chenhuacai@loongson.cn>
 <YLZYuM6SepbeLcI7@phenom.ffwll.local> <YLZqe14Lf2+5Lbf3@kroah.com>
 <YLZ2WJlHu0EZT7H9@phenom.ffwll.local>
 <CAAhV-H5Mt7tmmDVoix6sY3UtfhjxGvHovve2N=5o5xtvmFeQOA@mail.gmail.com>
 <YLewShl3lMyqJ1WZ@phenom.ffwll.local>
 <CAErSpo4cLp4YHGh0Lp=hZ70=1A4WBEtUhM-KUKk=SnNmTVzmRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAErSpo4cLp4YHGh0Lp=hZ70=1A4WBEtUhM-KUKk=SnNmTVzmRg@mail.gmail.com>
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
 Huacai Chen <chenhuacai@kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux PCI <linux-pci@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 01:31:16PM -0500, Bjorn Helgaas wrote:
> 
> On Wed, Jun 2, 2021 at 11:22 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, Jun 02, 2021 at 06:36:03PM +0800, Huacai Chen wrote:
> > > On Wed, Jun 2, 2021 at 2:03 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > On Tue, Jun 01, 2021 at 07:12:27PM +0200, Greg KH wrote:
> > > > > On Tue, Jun 01, 2021 at 05:56:40PM +0200, Daniel Vetter wrote:
> > > > > > On Fri, May 28, 2021 at 04:26:07PM +0800, Huacai Chen wrote:
> > > > > > > We should call vga_arb_device_init() after PCI enumeration, otherwise it
> > > > > > > may fail to select the default VGA device. Since vga_arb_device_init()
> > > > > > > and PCI enumeration function (i.e., pcibios_init() or acpi_init()) are
> > > > > > > both wrapped by subsys_initcall(), their sequence is not assured. So, we
> > > > > > > use subsys_initcall_sync() instead of subsys_initcall() to wrap vga_arb_
> > > > > > > device_init().
> > > > >
> > > > > Trying to juggle levels like this always fails if you build the code as
> > > > > a module.
> > > > >
> > > > > Why not fix it properly and handle the out-of-order loading by returning
> > > > > a "deferred" error if you do not have your resources yet?
> > > >
> > > > It's not a driver, it's kinda a bolted-on-the-side subsytem of pci. So not
> > > > something you can -EPROBE_DEFER I think, without potentially upsetting the
> > > > drivers that need this.
> > > >
> > > > Which might mean we should move this into pci subsystem proper perhaps?
> > > > Then adding the init call at the right time becomes trivial since we just
> > > > plug it in at the end of pci init.
> > > >
> > > > Also maybe that's how distros avoid this pain, pci is built-in, vgaarb is
> > > > generally a module, problem solved.
> > > >
> > > > Bjorn, would you take this entire vgaarb.c thing? From a quick look I
> > > > don't think it has a drm-ism in it (unlike vga_switcheroo, but that works
> > > > a bit differently and doesn't have this init order issue).
> > > Emmm, this patch cannot handle the hotplug case and module case, it
> > > just handles the case that vgaarb, drm driver and pci all built-in.
> > > But I think this is enough, because the original problem only happens
> > > on very few BMC-based VGA cards (BMC doesn't set the VGA Enable bit on
> > > the bridge, which breaks vgaarb).
> >
> > I'm not talking aout hotplug, just ordering the various pieces correctly.
> > That vgaarb isn't really a driver and also can't really handle hotplug is
> > my point. I guess that got lost a bit?
> >
> > Anyway my proposal is essentially to do a
> >
> > $ git move drivers/gpu/vga/vgaarb.c drivers/pci
> >
> > But I just realized that vgaarb is a bool option, so module isn't possible
> > anyway, and we could fix this by calling vgaarb from pcibios init (with an
> > empty static inline in the header if vgaarb is disabled). That makes the
> > dependency very explicit and guarantees it works correctly.
> 
> pcibios_init() is also an initcall and is implemented by every arch.
> I agree that calling vga_arb_device_init() directly from
> pcibios_init() would probably fix this problem, and it would be really
> nice to have it not be an initcall.  But it's also kind of a pain to
> have to update all those copies of pcibios_init(), and I would be
> looking for a way to unify it since it's not really an arch-specific
> thing.
> 
> I think the simplest solution, which I suggested earlier [1], would be
> to explicitly call vga_arbiter_add_pci_device() directly from the PCI
> core when it enumerates a VGA device.  Then there's no initcall and no
> need for the BUS_NOTIFY_ADD/DEL_DEVICE stuff.
> vga_arbiter_add_pci_device() could set the default VGA device when it
> is enumerated, and change the default device if we enumerate a
> "better" one.  And hotplug VGA devices would work automatically.

Hm yeah that sounds most reasonable, and if it doesn't work I guess
unifying the pcibios_init() stuff a bit and adding it there.

And somehow I missed that mail thread, too much stuff going on.

> > Whether we move vgaarb into drivers/pci or not is then kinda orthogonal.
> 
> I'm fine with moving it to drivers/pci if that makes anything easier.
> It definitely is PCI-related stuff, not GPU-related stuff.
> 
> [1] https://lore.kernel.org/r/20210526182940.GA1303599@bjorn-Precision-5520

Yeah I think it'd fit in pci better tbh, but not strong opinion I guess.
If we move it we probably want to keep the entry to Cc: dri-devel still
since it's really just for gpus.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
