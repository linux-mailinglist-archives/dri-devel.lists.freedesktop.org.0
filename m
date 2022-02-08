Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF48D4ACEB8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 03:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C638810E1FE;
	Tue,  8 Feb 2022 02:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98AC10E1FE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 02:14:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5DBBFB817A0
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 02:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E651C340F2
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 02:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644286447;
 bh=Fph4PJDbouMfoaJHcmJukTeg2f451EsGTJKeTIiJZTQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AKqCDZ0ciICkeWLsMS+jxD8yuxNERgXloYkmk70hFc5yTOC+PevPiv64CYSV8qUEt
 03jcCn4L3b4+oEBOv81T9Q4lwzs1A2L+PK59kxWITXFncUbV3qrTcmDvZPRm79wesT
 3xJRTK3IzIKA4G8zAd64fdg1a1aSLC9zUWPfJ+4+lydZult1W2+SQlYTbJPSVJxku/
 4Vk8BWTD1vas64xk1lM7rfpqzJvFeU4kdPo6lHi1qpffOaDyvEadbn4cV/vBV9OPXG
 m9rXXZwraGKbwuaJLngPJmX9nHA6ch4bgmzXxgvrDoX3uF+X4xVvt5/TQJctzRHplH
 aAB5RWRiT7mZA==
Received: by mail-vs1-f45.google.com with SMTP id g10so1820288vss.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 18:14:07 -0800 (PST)
X-Gm-Message-State: AOAM532an16ilt/JzXnwcBdJ+HZyYBjfkbNbYB2CpzuqyaIH3X0UNoJQ
 2WrclBotUbfSvlQD3sR+/vp4/QtUH/ldA0jxlrs=
X-Google-Smtp-Source: ABdhPJxBTS0pV366Usd6d6kkxREmCecGZHF4ioCnF9MTIf24VW5LPFIZRFdfHNpyS5oeM33yCJWt7os6PB7tAr29L1w=
X-Received: by 2002:a67:fd55:: with SMTP id g21mr720208vsr.53.1644286446000;
 Mon, 07 Feb 2022 18:14:06 -0800 (PST)
MIME-Version: 1.0
References: <b0a06a30-f479-df9f-980c-b789f0f26ce9@linux.intel.com>
 <20220207175909.GA406079@bhelgaas>
In-Reply-To: <20220207175909.GA406079@bhelgaas>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 8 Feb 2022 10:14:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4t96wJZs50qjJVnFSHXv7n9YeaXPaV32AGvO2SASWmYw@mail.gmail.com>
Message-ID: <CAAhV-H4t96wJZs50qjJVnFSHXv7n9YeaXPaV32AGvO2SASWmYw@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] vgaarb: Rework default VGA device selection
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

Hi, Bjorn,

On Tue, Feb 8, 2022 at 1:59 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Tue, Feb 01, 2022 at 04:46:33PM +0100, Maarten Lankhorst wrote:
> > Op 31-01-2022 om 23:23 schreef Bjorn Helgaas:
> > > [+to Maarten, Maxime, Thomas; beginning of thread:
> > > https://lore.kernel.org/r/20220106000658.243509-1-helgaas@kernel.org]
> > >
> > > On Wed, Jan 05, 2022 at 06:06:48PM -0600, Bjorn Helgaas wrote:
> > >> From: Bjorn Helgaas <bhelgaas@google.com>
> > >>
> > >> Current default VGA device selection fails in some cases because part of it
> > >> is done in the vga_arb_device_init() subsys_initcall, and some arches
> > >> enumerate PCI devices in pcibios_init(), which runs *after* that.
> > > Where are we at with this series?  Is there anything I can do to move
> > > it forward?
> >
> > I'm afraid that I don't understand the vga arbiter or the vga code
> > well enough to review.
> >
> > Could you perhaps find someone who could review?
> >
> > I see Chen wrote some patches and tested, so perhaps they could?
>
> Huacai, any chance you could review this?  I'm worried that this
> series isn't going to go anywhere unless we can find somebody to
> review it.
I have reviewed and tested the whole series, it looks good to me
(except the naming which has already changed). But I thought I cannot
add a "Reviewed-by" because I was originally a co-developer. But if
necessary,

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

Huacai
>
> Bjorn
