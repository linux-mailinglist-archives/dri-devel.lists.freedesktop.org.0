Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3B66DFB18
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 18:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C1210E30F;
	Wed, 12 Apr 2023 16:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B0C88A3E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 16:18:19 +0000 (UTC)
Received: from mail.panix.com (localhost [127.0.0.1])
 by mailbackend.panix.com (Postfix) with ESMTPA id 4PxSYj2B8gz3yPF;
 Wed, 12 Apr 2023 12:18:17 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
 t=1681316297; bh=EfKelFtoShfAhHqsoxi/BGgvCZiUEnz4TLFlAjiSo44=;
 h=In-Reply-To:References:Date:Subject:From:To:Cc;
 b=hf6+uHU714xRrWJOVS+5WY97gm61cgZRYHW15DTVO2hg9igUgERCcz5Bhmp/C7uPX
 oSPSd9Wp+NF7fC7Z5/HYWmHOjsr7ywut0ijR6zFNreDKYW5Oxa3ZRMBhr2IuTg/ytn
 vEPfmuMYEc7SnSE9tg2qYCLLIsN4/lappkOk/F/Q=
X-Panix-Received: from 166.84.1.2
 (SquirrelMail authenticated user pa@panix.com)
 by mail.panix.com with HTTP; Wed, 12 Apr 2023 12:18:17 -0400
Message-ID: <2e07f818ccdff7023a060e732d7c4ef6.squirrel@mail.panix.com>
In-Reply-To: <20230412150225.3757223-1-javierm@redhat.com>
References: <20230412150225.3757223-1-javierm@redhat.com>
Date: Wed, 12 Apr 2023 12:18:17 -0400
Subject: Re: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
From: "Pierre Asselin" <pa@panix.com>
To: "Javier Martinez Canillas" <javierm@redhat.com>
User-Agent: SquirrelMail/1.4.23-p1
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
X-Priority: 3 (Normal)
Importance: Normal
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Pierre Asselin <pa@panix.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> The commit f35cd3fa7729 ("firmware/sysfb: Fix EFI/VESA format selection")
> fixed format selection, by calculating the bits-per-pixel instead of just
> using the reported color depth.
>
> But unfortunately this broke some modes because the stride is always set
> to the reported line length (in bytes), which could not match the actual
> stride if the calculated bits-per-pixel doesn't match the reported depth.
>
> Fixes: f35cd3fa7729 ("firmware/sysfb: Fix EFI/VESA format selection")
> Reported-by: Pierre Asselin <pa@panix.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>
>  drivers/firmware/sysfb_simplefb.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/firmware/sysfb_simplefb.c
> b/drivers/firmware/sysfb_simplefb.c
> index 82c64cb9f531..5dc23e57089f 100644
> --- a/drivers/firmware/sysfb_simplefb.c
> +++ b/drivers/firmware/sysfb_simplefb.c
>
> [patch elided]

NOOOOOO !  The 1024x768x32 screen is all garbled.
(gfxpayload=keep, gfxpayload=1024x768x32 or vga=0x318).

The other modes work as before (but the dmesg has less information;
I'll investigate.)

