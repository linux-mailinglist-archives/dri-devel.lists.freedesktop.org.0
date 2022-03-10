Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED2B4D400D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 04:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F4910E7CE;
	Thu, 10 Mar 2022 03:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF8310E7B4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 03:56:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E02C6B8246A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 03:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7ADFC340F3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 03:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646884614;
 bh=3D9GFKu/12WfNEWrnM7P1nIyYXEWetjbz1hTsDrhOxQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eHbKHbvFjjOj2NQYsh+Oi/bCh5BnxYQcjfM05iebPBWOEpRN8ceronXerxJxkkXRz
 xywC4usOhEI4jo1X6/DILpxFggxIE7Vd0fgxXdyuceb7YVz8fGvvam7j8Vp29WhGKs
 yQW/czWqFKS8/pGojUxVKevpD38J0eC7fqDOoaDuBBfj4JRhpIO5SlfGAigFOfN0+g
 0B4TTwUs8W9wyTC24Z+nfBMLecHojw+Sy0xciHafH2mPJU6rqW8RZ6ldrOY1Xgcmff
 W2L+dW7fW/93tvyNirVFkzi8xpCPc2zP7PtKq/6sm9E57aFN6D3wgo1PhE+bmxMa9N
 255v4ycxwA3vQ==
Received: by mail-ua1-f50.google.com with SMTP id f7so1861311uab.8
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 19:56:54 -0800 (PST)
X-Gm-Message-State: AOAM530YUSJh4qgz7GEWUPXw2bWcaL8IYU1pzCz7U22uOIewWtXSjF6+
 KxfIY27//3zWVJNR4VerVjidLhOeJ0Bab3EvZZk=
X-Google-Smtp-Source: ABdhPJyMxeleMLVmKri+SIOuq/8cFeORS6+8EgVk1BOoEV8tNUiDlOWyeCIGXoRiRafL3MxxUHhenT3THg5AF8M4uqs=
X-Received: by 2002:ab0:2809:0:b0:341:f4aa:829d with SMTP id
 w9-20020ab02809000000b00341f4aa829dmr1433191uap.42.1646884613619; Wed, 09 Mar
 2022 19:56:53 -0800 (PST)
MIME-Version: 1.0
References: <20220225221523.GA385757@bhelgaas>
 <20220309162950.GA55262@bhelgaas>
In-Reply-To: <20220309162950.GA55262@bhelgaas>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 10 Mar 2022 11:56:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6thUdynSoyt+mm4Q-DCdKKFu_KKv8duKo9T9sdSTMycg@mail.gmail.com>
Message-ID: <CAAhV-H6thUdynSoyt+mm4Q-DCdKKFu_KKv8duKo9T9sdSTMycg@mail.gmail.com>
Subject: Re: [PATCH v9 00/11] vgaarb: Rework default VGA device selection
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-pci <linux-pci@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I have no objection :)

Huacai

On Thu, Mar 10, 2022 at 12:29 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Fri, Feb 25, 2022 at 04:15:23PM -0600, Bjorn Helgaas wrote:
> > On Thu, Feb 24, 2022 at 04:47:42PM -0600, Bjorn Helgaas wrote:
> > > From: Bjorn Helgaas <bhelgaas@google.com>
> > >
> > > Current default VGA device selection fails in some cases because part of it
> > > is done in the vga_arb_device_init() subsys_initcall, and some arches
> > > enumerate PCI devices in pcibios_init(), which runs *after* that.
> > >
> > > The big change from the v8 posting is that this moves vgaarb.c from
> > > drivers/gpu/vga to drivers/pci because it really has nothing to do with
> > > GPUs or DRM.
> >
> > I provisionally applied this to pci/vga and put it into -next just
> > to get a little runtime on it.
> >
> > But I'd prefer not to unilaterally yank this out of drivers/gpu
> > without a consensus from the GPU folks that this is the right thing to
> > do.
> >
> > Any thoughts?  If it seems OK to you, I think patch 1/11 (the move
> > itself) is all you would need to look at, although of course I would
> > still be grateful for any review and feedback on the rest.
> >
> > After it's in drivers/pci, all the blame for any issues would come my
> > way.
>
> Ping?  This has been in -next since the Feb 28 tree, and I plan to
> ask Linus to include it during the v5.18 merge window (which will
> probably open Mar 13) unless somebody objects.
>
> Bjorn
