Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CBB1427E5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 11:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332796E898;
	Mon, 20 Jan 2020 10:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C206E898
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 10:10:49 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id d62so27999367oia.11
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 02:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8+qrvwPOgPvxahwyd5KQ9RV4ePgSqOg74nqe3gTMzKQ=;
 b=nwlsN13b2bNHLVkrln7ql06u5+kWzo6b/k3FYpyIOthPLZYRQf1UyOAHP3Rgs45zQq
 3fZuVkYJz77wTJWa/6hOmX2y64lIUxL7bmpJdiWRJjJ5u1ZB/8vs5gYe0Yj7qmk3VFwC
 zIfR4X/9f65MMz4YclWAIusrBO5H+3nyiQj49z7reeS/UDmjSj+QaLY4J2RVsvcI5kpT
 IXfRbvDZsr0WrEqHc1Jf0pZGX6+SfNUl5aEEdh3269HX5NbBCRyK0IbrGEwf6CLxA4Fg
 9rv/vc/O4Tf3p2bbnwg1SZPn5EiQIXTNGYWMSA5y//8bkpdJOf0DCpJuna0WowD7GhNX
 U8sw==
X-Gm-Message-State: APjAAAXUIl0TaUcnoF+KLzjBJqPCMJg3Fc9X4IURvzoGjCtaJdVeFs7K
 CaB8qCAB8HSHQbe1ypNQfo+EJ9y/8t2Bv0n0a98=
X-Google-Smtp-Source: APXvYqxBD1lgBtsNPuNMqT1o27W7Ir+ePtVv464K7y/05wcGh/xr4/6RJVBUe/4BzfIfkFWOB49rWDJJVkncf5LeRX0=
X-Received: by 2002:aca:5905:: with SMTP id n5mr12459471oib.54.1579515048959; 
 Mon, 20 Jan 2020 02:10:48 -0800 (PST)
MIME-Version: 1.0
References: <20180802193909.GA11443@ravnborg.org>
 <20180802194536.10820-2-sam@ravnborg.org>
In-Reply-To: <20180802194536.10820-2-sam@ravnborg.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Jan 2020 11:10:37 +0100
Message-ID: <CAMuHMdVP4UwGYuNcOphPO9F2pSCaHS1j-ODxYrv_LNOoo_4coA@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] pardata: new bus for parallel data access
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

(stumbled on this accidentally)

On Thu, Aug 2, 2018 at 9:46 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> The pardata supports implement a simple bus for devices
> that are connected using a parallel bus driven by GPIOs.
> The is often used in combination with simple displays
> that is often seen in older embedded designs.
> There is a demand for this support also in the linux
> kernel for HW designs that uses these kind of displays.
>
> The pardata bus uses a platfrom_driver that when probed
> creates devices for all child nodes in the DT,
> which are then supposed to be handled by pardata_drivers.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

> --- /dev/null
> +++ b/Documentation/driver-api/pardata.rst
> @@ -0,0 +1,60 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=========================
> +Parallel Data Bus/Drivers
> +=========================
> +
> +Displays may be connected using a simple parallel bus.
> +This is often seen in embedded systems with a simple MCU, but is also
> +used in Linux based systems to a small extent.
> +
> +The bus looks like this:
> +
> +.. code-block:: none
> +
> +       ----+
> +           |  DB0-DB7 or DB4-DB7      +----
> +           ===/========================
> +           |  E - enable              |  D
> +           ----------------------------  I
> +        C  |  Reset                   |  S
> +        P  ----------------------------  P
> +        U  |  Read/Write (one or two) |  L
> +           ----------------------------  A
> +           |  RS - instruction/data   |  Y
> +           ----------------------------
> +           |                          +----
> +       ----+

Oh, cool!  Looks like this can be used by the hd44780 driver.

    Documentation/devicetree/bindings/auxdisplay/hit,hd44780.txt
    drivers/auxdisplay/hd44780.c

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
