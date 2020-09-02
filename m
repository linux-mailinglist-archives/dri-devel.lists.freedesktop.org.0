Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E257025BDCA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 10:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0026B6E209;
	Thu,  3 Sep 2020 08:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFB5897E3
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 22:11:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a65so837771wme.5
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 15:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=14FNZP9qDacMHyeJaISl2He1T81MZa6Twc7b6HdtBbg=;
 b=C8c/DdPkeY/C9kABk3K4PjD7fq2gR4EJWaZLPaBiWfvJ2e+j6PTLkf8AH+ijQiNB1g
 xsA/+8A5PlXCW8hQRlDJ7lNcQjregmtc6qmIrYxy+IV+5jwtTf5CWgqaY3p+bcydwFAe
 9EhR2BAK2nUObcsrD9SIIvS6WjKQNwUt7UAZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=14FNZP9qDacMHyeJaISl2He1T81MZa6Twc7b6HdtBbg=;
 b=jjEye16uDrr5BHydz3aW1j7S/SGwSOSVqHPMbVEKBkInJ4tPYcnIW27ey0iVcv8G3S
 gkwQOTT1ltZK1lh+br72D89MWZy4b3TUSkmo40RHnPDwvp63B5Q5lcqWW+6G+KisjuKn
 xWqQcTzUtkI23Br9MTo/RWvIpdYZ67q6ab2ocIzegyBxvbCUsF4eHJRThkgPj6REOHyT
 7Shh/m2V4amTT/PTNMBgGAZLEMrOTHdI2Dn8fWnZPFsNrOw6d78L4hkOmfrs1Xa6gNyX
 xxnaSUmXv9apNOEBUuSDvWrPZWMbQsftKM3Bm4S8HkzMoHaRkatrKwJnVBbVONoE8Ucn
 w31Q==
X-Gm-Message-State: AOAM531jhIKteq0/ZtLtv4PjT8bZUkbWBTr//5mzO5pHgwqhATQVzvM6
 1qssorhQwD/e2VTQ2mvLloOxIeMgAfw+YhWR88JqnA==
X-Google-Smtp-Source: ABdhPJxQ8phW4EBEkxLjNbMB+O03/jAnluiwtEDyhUZU4HLBr22ysbyVVAc+AM0AMo357qHdQs80vuR+iZ/bewDZZRs=
X-Received: by 2002:a1c:9d83:: with SMTP id g125mr217672wme.41.1599084680433; 
 Wed, 02 Sep 2020 15:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200824193036.6033-1-james.quinlan@broadcom.com>
 <20200824193036.6033-8-james.quinlan@broadcom.com>
 <20200902215314.GA881878@ubuntu-n2-xlarge-x86>
In-Reply-To: <20200902215314.GA881878@ubuntu-n2-xlarge-x86>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Wed, 2 Sep 2020 18:11:08 -0400
Message-ID: <CA+-6iNzc38OAL7TGxobpODKXOD1CW-VFNU0rK9Z043QfR3MfsQ@mail.gmail.com>
Subject: Re: [PATCH v11 07/11] device-mapping: Introduce DMA range map,
 supplanting dma_pfn_offset
To: Nathan Chancellor <natechancellor@gmail.com>
X-Mailman-Approved-At: Thu, 03 Sep 2020 08:50:07 +0000
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
Cc: Rich Felker <dalias@libc.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:ACPI FOR ARM64 ACPI/arm64" <linux-acpi@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Yong Deng <yong.deng@magewell.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 open list <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 2, 2020 at 5:53 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Mon, Aug 24, 2020 at 03:30:20PM -0400, Jim Quinlan wrote:
> > The new field 'dma_range_map' in struct device is used to facilitate the
> > use of single or multiple offsets between mapping regions of cpu addrs and
> > dma addrs.  It subsumes the role of "dev->dma_pfn_offset" which was only
> > capable of holding a single uniform offset and had no region bounds
> > checking.
> >
> > The function of_dma_get_range() has been modified so that it takes a single
> > argument -- the device node -- and returns a map, NULL, or an error code.
> > The map is an array that holds the information regarding the DMA regions.
> > Each range entry contains the address offset, the cpu_start address, the
> > dma_start address, and the size of the region.
> >
> > of_dma_configure() is the typical manner to set range offsets but there are
> > a number of ad hoc assignments to "dev->dma_pfn_offset" in the kernel
> > driver code.  These cases now invoke the function
> > dma_attach_offset_range(dev, cpu_addr, dma_addr, size).
> >
> > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > ---
> >  arch/arm/include/asm/dma-mapping.h            | 10 +--
> >  arch/arm/mach-keystone/keystone.c             | 17 +++--
> >  arch/sh/drivers/pci/pcie-sh7786.c             |  9 +--
> >  arch/x86/pci/sta2x11-fixup.c                  |  7 +-
> >  drivers/acpi/arm64/iort.c                     |  5 +-
> >  drivers/base/core.c                           |  2 +
> >  drivers/gpu/drm/sun4i/sun4i_backend.c         |  5 +-
> >  drivers/iommu/io-pgtable-arm.c                |  2 +-
> >  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  5 +-
> >  .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  4 +-
> >  drivers/of/address.c                          | 72 +++++++++----------
> >  drivers/of/device.c                           | 43 ++++++-----
> >  drivers/of/of_private.h                       | 10 +--
> >  drivers/of/unittest.c                         | 34 ++++++---
> >  drivers/remoteproc/remoteproc_core.c          |  8 ++-
> >  .../staging/media/sunxi/cedrus/cedrus_hw.c    |  7 +-
> >  drivers/usb/core/message.c                    |  9 ++-
> >  drivers/usb/core/usb.c                        |  7 +-
> >  include/linux/device.h                        |  4 +-
> >  include/linux/dma-direct.h                    |  8 +--
> >  include/linux/dma-mapping.h                   | 36 ++++++++++
> >  kernel/dma/coherent.c                         | 10 +--
> >  kernel/dma/mapping.c                          | 66 +++++++++++++++++
> >  23 files changed, 265 insertions(+), 115 deletions(-)
>
> Apologies if this has already been reported or is known but this commit
> is now in next-20200902 and it causes my Raspberry Pi 4 to no longer
> make it to userspace, instead spewing mmc errors:
>
> That commit causes my Raspberry Pi 4 to no longer make it to userspace,
> instead spewing mmc errors:
>
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
> [    0.000000] Linux version 5.9.0-rc3-00004-geef520b232c6-dirty (nathan@ubuntu-n2-xlarge-x86) (ClangBuiltLinux clang version 12.0.0 (https://github.com/llvm/llvm-project.git b21ddded8f04fee925bbf9e6458347104b5b99eb), LLD 12.0.0 (https://github.com/llvm/llvm-project.git b21ddded8f04fee925bbf9e6458347104b5b99eb)) #1 SMP PREEMPT Wed Sep 2 13:48:49 MST 2020
> [    0.000000] Machine model: Raspberry Pi 4 Model B Rev 1.2
> ...
> [    1.459752] raspberrypi-firmware soc:firmware: Attached to firmware from 2020-08-24T18:50:56
> [    1.500007] dwc2 fe980000.usb: supply vusb_d not found, using dummy regulator
> [    1.507454] dwc2 fe980000.usb: supply vusb_a not found, using dummy regulator
> [    1.615547] dwc2 fe980000.usb: EPs: 8, dedicated fifos, 4080 entries in SPRAM
> [    1.627537] sdhci-iproc fe300000.sdhci: allocated mmc-pwrseq
> [    1.665497] mmc0: SDHCI controller on fe300000.sdhci [fe300000.sdhci] using PIO
> [    1.690601] mmc0: queuing unknown CIS tuple 0x80 (2 bytes)
> [    1.697892] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
> [    1.705173] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
> [    1.713788] mmc0: queuing unknown CIS tuple 0x80 (7 bytes)
> [    1.721228] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
> [    1.732062] mmc1: SDHCI controller on fe340000.emmc2 [fe340000.emmc2] using ADMA
> [    1.741828] ALSA device list:
> [    1.744885]   No soundcards found.
> [    1.748540] Waiting for root device PARTUUID=45a8dd8a-02...
> [    1.788865] random: fast init done
> [    1.793489] mmc1: unrecognised SCR structure version 4
> [    1.798814] mmc1: error -22 whilst initialising SD card
> [    1.813969] mmc0: new high speed SDIO card at address 0001
> [    1.883178] mmc1: unrecognised SCR structure version 2
> [    1.888423] mmc1: error -22 whilst initialising SD card
> [    1.964069] mmc1: unrecognised SCR structure version 4
> [    1.969314] mmc1: error -22 whilst initialising SD card
> [    2.061225] mmc1: unrecognised SCR structure version 4
> [    2.066470] mmc1: error -22 whilst initialising SD card
> [    3.160476] mmc1: unrecognised SCR structure version 4
> [    3.165718] mmc1: error -22 whilst initialising SD card
>
> This is what it looks like before that commit:
>
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
> [    0.000000] Linux version 5.9.0-rc3-00003-g2281f797f552-dirty (nathan@ubuntu-n2-xlarge-x86) (ClangBuiltLinux clang version 12.0.0 (https://github.com/llvm/llvm-project.git b21ddded8f04fee925bbf9e6458347104b5b99eb), LLD 12.0.0 (https://github.com/llvm/llvm-project.git b21ddded8f04fee925bbf9e6458347104b5b99eb)) #1 SMP PREEMPT Wed Sep 2 14:10:30 MST 2020
> [    0.000000] Machine model: Raspberry Pi 4 Model B Rev 1.2
> ...
> [    1.459871] raspberrypi-firmware soc:firmware: Attached to firmware from 2020-08-24T18:50:56
> [    1.500017] dwc2 fe980000.usb: supply vusb_d not found, using dummy regulator
> [    1.507461] dwc2 fe980000.usb: supply vusb_a not found, using dummy regulator
> [    1.615565] dwc2 fe980000.usb: EPs: 8, dedicated fifos, 4080 entries in SPRAM
> [    1.627571] sdhci-iproc fe300000.sdhci: allocated mmc-pwrseq
> [    1.665549] mmc0: SDHCI controller on fe300000.sdhci [fe300000.sdhci] using PIO
> [    1.690225] mmc0: queuing unknown CIS tuple 0x80 (2 bytes)
> [    1.697516] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
> [    1.704800] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
> [    1.713412] mmc0: queuing unknown CIS tuple 0x80 (7 bytes)
> [    1.720853] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
> [    1.731686] mmc1: SDHCI controller on fe340000.emmc2 [fe340000.emmc2] using ADMA
> [    1.741484] ALSA device list:
> [    1.744517]   No soundcards found.
> [    1.748194] Waiting for root device PARTUUID=45a8dd8a-02...
> [    1.788643] random: fast init done
> [    1.805009] mmc0: new high speed SDIO card at address 0001
> [    1.852305] mmc1: new ultra high speed DDR50 SDXC card at address aaaa
> [    1.859647] mmcblk1: mmc1:aaaa SK64G 59.5 GiB
> [    1.866190]  mmcblk1: p1 p2
> [    1.892559] EXT4-fs (mmcblk1p2): mounted filesystem with ordered data mode. Opts: (null)
>
> Bisect log in case it is relevant:
>
> # bad: [4442749a203151a319a5bb8d0b983b84253a6931] Add linux-next specific files for 20200902
> # good: [b765a32a2e9170702467747e290614be072c4f76] Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
> git bisect start '4442749a203151a319a5bb8d0b983b84253a6931' 'b765a32a2e9170702467747e290614be072c4f76'
> # bad: [501c4123d9ecf8e38425fa2dae591d87f18a33f9] Merge remote-tracking branch 'wireless-drivers-next/master' into master
> git bisect bad 501c4123d9ecf8e38425fa2dae591d87f18a33f9
> # bad: [3722ace45f7d9a37631b6f5b9c591ea1e118a077] Merge remote-tracking branch 'pstore/for-next/pstore' into master
> git bisect bad 3722ace45f7d9a37631b6f5b9c591ea1e118a077
> # bad: [bcd6576526884cbe2f0798f9196eb2fd96fadb2b] Merge remote-tracking branch 'imx-mxs/for-next' into master
> git bisect bad bcd6576526884cbe2f0798f9196eb2fd96fadb2b
> # good: [f51293edaaf354f6de8836390cd4bd0407380c8d] Merge remote-tracking branch 'staging.current/staging-linus' into master
> git bisect good f51293edaaf354f6de8836390cd4bd0407380c8d
> # bad: [2b7f5289d46652f343f51e1853326876114f8647] Merge remote-tracking branch 'arm-soc/for-next' into master
> git bisect bad 2b7f5289d46652f343f51e1853326876114f8647
> # good: [137aded9aad7803fa48e9a9538b359012715e171] Merge remote-tracking branch 'pidfd-fixes/fixes' into master
> git bisect good 137aded9aad7803fa48e9a9538b359012715e171
> # good: [f5cb1ada6f986019d24037d9329c99445fcdd50a] Merge remote-tracking branch 'kbuild/for-next' into master
> git bisect good f5cb1ada6f986019d24037d9329c99445fcdd50a
> # good: [2694ca73fa41491762825ae7bba9b14ab0762415] ARM: Document merges
> git bisect good 2694ca73fa41491762825ae7bba9b14ab0762415
> # bad: [192ec9acc561411c6ec5d35b3ad225d40c8c39bd] Merge remote-tracking branch 'dma-mapping/for-next' into master
> git bisect bad 192ec9acc561411c6ec5d35b3ad225d40c8c39bd
> # bad: [eef520b232c60e74eb8b33a5a7863ad8f2b4a5c7] dma-mapping: introduce DMA range map, supplanting dma_pfn_offset
> git bisect bad eef520b232c60e74eb8b33a5a7863ad8f2b4a5c7
> # good: [c6303ab9b91e7ca20a49ff494338309259ed7c65] arm64: mm: reserve per-numa CMA to localize coherent dma buffers
> git bisect good c6303ab9b91e7ca20a49ff494338309259ed7c65
> # good: [2281f797f5524abb8fff66bf8540b4f4687332a2] mm: cma: use CMA_MAX_NAME to define the length of cma name array
> git bisect good 2281f797f5524abb8fff66bf8540b4f4687332a2
> # first bad commit: [eef520b232c60e74eb8b33a5a7863ad8f2b4a5c7] dma-mapping: introduce DMA range map, supplanting dma_pfn_offset
>
> I am happy to provide further information for debugging if necessary.
Hello Nathan,

Can you tell me how much memory your RPI has and if all of it is
accessible by the PCIe device?  Could you also please include the DTS
of the PCIe node?  IIRC, the RPI firmware does some mangling of the
PCIe DT before Linux boots -- could you describe what is going on
there?
Finally, can you attach the text of the full boot log?

Thanks,
Jim
>
> Cheers,
> Nathan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
