Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16903D381A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 11:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7299C88CBF;
	Fri, 23 Jul 2021 09:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E3588CBF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 09:53:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE11E60EFD
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 09:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627034028;
 bh=0CQEAyffV8TwIx3za1CswnRfjAeEQH1GWzJ7vfDFpu4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sVWY/b0+AVaf0XylPpJk0zKPl+ScICOtPDCxLcQZKyfi9kMV7b0VE1AJp5AKUXz6T
 u+N1/UAeJpecRH2ij17dqxL19WQDV+kdQdZ/Ys8rrkLpoXNMh6cAX9Y4RsiWgzhVSU
 ZODbVoMhdcEjDD3HEsQ9SZjlyQRhZQ/HGvmkN+uJ8lbEyKHru0sqQqW8dAsEFr/cDb
 EOEuGbdTnXmtK2XrLgRzp7jWSvchBjkyX+MeZ2TecATQJ7bJ+ftUMXx/QokMhc7VVC
 PWY7mS3M2vkg2V7SrmfVj0SGyuDyOkXCKzrA5NTB3y53RIaXgF8ExYHspyqvbZzUSn
 +dsNAGeJ8y3ow==
Received: by mail-io1-f41.google.com with SMTP id h1so1782592iol.9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 02:53:48 -0700 (PDT)
X-Gm-Message-State: AOAM533MaD6U/4exOObddT/PHRcQxp1nIQnh3xjRPVRJO5DcCDGxqmje
 dBd0o7t1tlO/gIHnyQqt2wnu4fWv+wzc+jbWbT8=
X-Google-Smtp-Source: ABdhPJxjPas0Yjcc0eSW6elHEn29KIWLjzrPGahEmHkYgplrkWRggpqpnwNzu/7uYWgSBraJUt8ZDZYNHE4kO/pbUe4=
X-Received: by 2002:a05:6602:2406:: with SMTP id
 s6mr3296440ioa.159.1627034028187; 
 Fri, 23 Jul 2021 02:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210722212920.347118-1-helgaas@kernel.org>
In-Reply-To: <20210722212920.347118-1-helgaas@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 23 Jul 2021 17:53:36 +0800
X-Gmail-Original-Message-ID: <CAAhV-H52feAf0Qf7xHa2uyv1veX+dBgDr3QKXjOZzpd=wcUr3Q@mail.gmail.com>
Message-ID: <CAAhV-H52feAf0Qf7xHa2uyv1veX+dBgDr3QKXjOZzpd=wcUr3Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] PCI/VGA: Rework default VGA device selection
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Xuefeng Li <lixuefeng@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bjorn,

On Fri, Jul 23, 2021 at 5:29 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> This is a little bit of rework and extension of Huacai's nice work at [1].
>
> It moves the VGA arbiter to the PCI subsystem, fixes a few nits, and breaks
> a few pieces off Huacai's patch to make the main patch a little smaller.
>
> That last patch is still not very small, and it needs a commit log, as I
> mentioned at [2].
>
> All comments welcome!
>
> [1] https://lore.kernel.org/dri-devel/20210705100503.1120643-1-chenhuacai@loongson.cn/
> [2] https://lore.kernel.org/r/20210720221923.GA43331@bjorn-Precision-5520
Thank you for your splitting. Your two questions are answered in the following.

(1) explain why your initcall ordering is unusual.
The original problem happens on MIPS. vga_arb_device_init() and
pcibios_init() are both wrapped by subsys_initcall(). The order of
functions in the same level depends on the Makefile.

TOP level Makefile:
drivers-y       := drivers/ sound/
....
include arch/$(SRCARCH)/Makefile

drivers/Makefile:
obj-$(CONFIG_ACPI)              += acpi/
....
obj-y                           += gpu/

arch/mips/Makefile:
drivers-$(CONFIG_PCI)           += arch/mips/pci/

This makes pcibios_init() in arch/mips/pci/ placed after
vga_arb_device_init() in drivers/gpu. ACPI-based systems have no
problems because acpi_init() in drivers/acpi is placed before
vga_arb_device_init().

 (2) explain the approach, which IIUC is basically to add the
vga_arb_select_default_device() functionality to
vga_arbiter_add_pci_device().
vga_arb_select_default_device() has only one chance to be called, we
want to make it be called every time a new vga device is added. So
rename it to vga_arb_update_default_device() and move the callsite to
vga_arbiter_add_pci_device().

I think you know all the information which you need now. And you can
reorganize the commit message based on the existing one. As English is
not my first language, the updated commit message written by me may
still not be as good as you want.:)

Huacai

>
>
> Bjorn Helgaas (4):
>   PCI/VGA: Move vgaarb to drivers/pci
>   PCI/VGA: Replace full MIT license text with SPDX identifier
>   PCI/VGA: Use unsigned format string to print lock counts
>   PCI/VGA: Remove empty vga_arb_device_card_gone()
>
> Huacai Chen (5):
>   PCI/VGA: Move vga_arb_integrated_gpu() earlier in file
>   PCI/VGA: Prefer vga_default_device()
>   PCI/VGA: Split out vga_arb_update_default_device()
>   PCI/VGA: Log bridge control messages when adding devices
>   PCI/VGA: Rework default VGA device selection
>
>  drivers/gpu/vga/Kconfig           |  19 ---
>  drivers/gpu/vga/Makefile          |   1 -
>  drivers/pci/Kconfig               |  19 +++
>  drivers/pci/Makefile              |   1 +
>  drivers/{gpu/vga => pci}/vgaarb.c | 269 ++++++++++++------------------
>  5 files changed, 126 insertions(+), 183 deletions(-)
>  rename drivers/{gpu/vga => pci}/vgaarb.c (90%)
>
> --
> 2.25.1
>
