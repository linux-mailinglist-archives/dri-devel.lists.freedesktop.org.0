Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60B3655182
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 15:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE6610E1A8;
	Fri, 23 Dec 2022 14:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E53310E1A8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 14:43:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9959861219
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 14:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77766C43396
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 14:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671806566;
 bh=5WSz7TH//n5BtaNgZRfsk+p6ujzCP/EjZAPHDEoOC98=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=olxxz20sE9VTDEToVcepShp6ZZa4Bp12yaWtO7oOBQta+a/sXX0eD23TtaEu706n7
 dYllP031b6JfCc338/j7dE0aRJtMYFMF/Op/BWYY8WZWIEBVWdrJ7HzTVX9VasJsvc
 FIbWpnPNK0jmNoe230W4DUArvIoamRMJ6UTBnPmGxouLbp9VvM5uzgArb1twRsptbk
 5FXgas+e0Pg/F1ZBUf9QUMamromNWImKk2vjlak7t2YQxzb3CMrVlNqxq94NAxHXg/
 jwqxTlLhDxWKXzzZ8XjG2NQMdyte63X7IJl19pnT/P1llWf/iPkM9R/eE0CgUDTpiG
 5v1zhFgOy0PVA==
Received: by mail-lf1-f54.google.com with SMTP id bf43so7342802lfb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 06:42:46 -0800 (PST)
X-Gm-Message-State: AFqh2koMtzrTNUAUclCH6QTT8w39diLe4JNH8iki9P4idYYUY3LZYGT2
 AP+xntQOGTOyK6+U0JvItt8jIceYZ2BJRiletYw=
X-Google-Smtp-Source: AMrXdXsMS+IGHzYDCdkiTlPt8UpinmgPDyHMg5CLbMsP3Lf2KPNsaQeyjjbVXhzNJHHGAEQZqz4efhVo1rex3aoEMIw=
X-Received: by 2002:a19:a411:0:b0:4b6:e28c:276d with SMTP id
 q17-20020a19a411000000b004b6e28c276dmr947831lfc.110.1671806564479; Fri, 23
 Dec 2022 06:42:44 -0800 (PST)
MIME-Version: 1.0
References: <20221221105402.6598-1-markuss.broks@gmail.com>
In-Reply-To: <20221221105402.6598-1-markuss.broks@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 23 Dec 2022 15:42:33 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGUC7dsSwVEUsAMeAoqDYtbqrM7SDOJTXbPfi-LrcSk9g@mail.gmail.com>
Message-ID: <CAMj1kXGUC7dsSwVEUsAMeAoqDYtbqrM7SDOJTXbPfi-LrcSk9g@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add generic framebuffer support to EFI earlycon
 driver
To: Markuss Broks <markuss.broks@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
 "Paul E. McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-efi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kim Phillips <kim.phillips@amd.com>,
 Will Deacon <will@kernel.org>, Jami Kettunen <jami.kettunen@protonmail.com>,
 linux-serial@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Borislav Petkov <bp@suse.de>, Jiri Slaby <jirislaby@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(cc Andy)


On Wed, 21 Dec 2022 at 11:54, Markuss Broks <markuss.broks@gmail.com> wrote:
>
> Make the EFI earlycon driver be suitable for any linear framebuffers.
> This should be helpful for early porting of boards with no other means of
> output, like smartphones/tablets. There seems to be an issue with early_ioremap
> function on ARM32, but I am unable to find the exact cause. It appears the mappings
> returned by it are somehow incorrect, thus the driver is disabled on ARM.

The reason that this driver is disabled on ARM is because the struct
screen_info is not populated early enough, as it is retrieved from a
UEFI configuration table.

early_ioremap() works fine on ARM as long as they mapping is torn down
before paging_init()

> EFI early
> console was disabled on IA64 previously because of missing early_memremap_prot,
> and this is inherited to this driver.
>
> This patch also changes

"This patch also changes ..." is usually a strong hint to self that
the patches need to be split up.

> behavior on EFI systems, by selecting the mapping type
> based on if the framebuffer region intersects with system RAM. If it does, it's
> common sense that it should be in RAM as a whole, and so the system RAM mapping is
> used. It was tested to be working on my PC (Intel Z490 platform), as well as several
> ARM64 boards (Samsung Galaxy S9 (Exynos), iPad Air 2, Xiaomi Mi Pad 4, ...).
>
> Markuss Broks (2):
>   drivers: serial: earlycon: Pass device-tree node
>   efi: earlycon: Add support for generic framebuffers and move to fbdev
>     subsystem
>
>
> v1 -> v2:
>
> - a new patch correcting serial/earlycon.c argument name to "offset" instead
>   of "node"
> - move IA64 exclusion from EFI earlycon Kconfig to earlycon driver Kconfig
>   (IA64 has no early_memremap_prot)
> - move driver from fbdev to console subsystem
> - select EFI earlycon by default
> - fetch stride manually from device-tree, as on some devices it seems stride
>   doesn't match the horizontal resolution * bpp.
> - use saner format (e.g. 1920x1080x32 instead of 1920,1080,32).
>
>
> Markuss Broks (3):
>   drivers: serial: earlycon: Pass device-tree node
>   efi: earlycon: move to video/console to prepare for changes
>   efi: earlycon: Add support for generic framebuffers
>
>  .../admin-guide/kernel-parameters.txt         |  12 +-
>  MAINTAINERS                                   |   5 +
>  drivers/firmware/efi/Kconfig                  |   7 +-
>  drivers/firmware/efi/Makefile                 |   1 -
>  drivers/firmware/efi/earlycon.c               | 246 --------------
>  drivers/tty/serial/earlycon.c                 |   3 +
>  drivers/video/console/Kconfig                 |  11 +
>  drivers/video/console/Makefile                |   1 +
>  drivers/video/console/earlycon.c              | 305 ++++++++++++++++++
>  include/linux/serial_core.h                   |   1 +
>  10 files changed, 336 insertions(+), 256 deletions(-)
>  delete mode 100644 drivers/firmware/efi/earlycon.c
>  create mode 100644 drivers/video/console/earlycon.c
>
> --
> 2.39.0
>
