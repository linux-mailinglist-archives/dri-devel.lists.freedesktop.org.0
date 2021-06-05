Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB97239CA5E
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jun 2021 19:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5D36E152;
	Sat,  5 Jun 2021 17:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D301F6E152
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jun 2021 17:59:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BBBB61207;
 Sat,  5 Jun 2021 17:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622915977;
 bh=+m6ukrIPO4xJevQuRTPTFq75jUE+SME0F7kUAmTu+Ws=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=UtZaAexyUu7F1ciFLDax6nONXSlyu8wH3AafvYl3SY617tO1DvGH9lmvBDzYcQxPG
 +HVjcnHYOVK4ZBwi4v9RLxY+Lvp65wyVw8PWHvM8ygS1L/HmU0MzEotWBxS2aI3QLL
 2lKbMLTd0fz7LxcUyJfgCgnkxZ8DjCcwrYRG8GLapL3nvC0IT+Txi7rwMUL6SYYcnK
 Vfcqu+bnPfDWoTp1A4a+kfgTKvWMEC9NEA2NRhLfXfLjHFEpL7oOUryX4z696DMAwD
 ZmpuXRaWtjh41YnSgGqPvi+o46DmWIg3vgnVfAUw4CCYdz+7jsLAtDHWwr+z7AbGss
 BPIawEF8/5JhQ==
Date: Sat, 5 Jun 2021 12:59:36 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH] vgaarb: Call vga_arb_device_init() after PCI enumeration
Message-ID: <20210605175936.GA2309279@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H6MCGXiO3EcZV2BZi91AiUNsu2aZ=e9g4e2tcVVNOLbfg@mail.gmail.com>
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
 Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 05, 2021 at 10:02:05AM +0800, Huacai Chen wrote:
> On Sat, Jun 5, 2021 at 3:56 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Fri, Jun 04, 2021 at 12:50:03PM +0800, Huacai Chen wrote:
> > > On Thu, Jun 3, 2021 at 2:31 AM Bjorn Helgaas <bhelgaas@google.com> wrote:

> > > > I think the simplest solution, which I suggested earlier [1],
> > > > would be to explicitly call vga_arbiter_add_pci_device()
> > > > directly from the PCI core when it enumerates a VGA device.
> > > > Then there's no initcall and no need for the
> > > > BUS_NOTIFY_ADD/DEL_DEVICE stuff.  vga_arbiter_add_pci_device()
> > > > could set the default VGA device when it is enumerated, and
> > > > change the default device if we enumerate a "better" one.  And
> > > > hotplug VGA devices would work automatically.
> > >
> > > Emm, It seems that your solution has some difficulties to remove
> > > the whole initcall(vga_arb_device_init): we call
> > > vga_arbiter_add_pci_device() in pci_bus_add_device(), the
> > > list_for_each_entry() loop can be moved to
> > > vga_arbiter_check_bridge_sharing(),
> > > vga_arb_select_default_device() can be renamed to
> > > vga_arb_update_default_device() and be called in
> > > vga_arbiter_add_pci_device(), but how to handle
> > > misc_register(&vga_arb_device)?
> >
> > Might need to keep vga_arb_device_init() as an initcall, but
> > remove everything from it except the misc_register().
>
> OK, let me try. But I think call  vga_arbiter_add_pci_device() in
> pci core is nearly the same as notifier.  Anyway, I will send a new
> patch later.

Notifiers are useful in some situations, for example, if a loadable
module needs to be called when a device is added or removed.

But when possible, I will always choose a direct call instead because
it's much less complicated.  The VGA arbiter cannot be a loadable
module, so I don't think there's any reason to use a notifier in this
case.

Bjorn
