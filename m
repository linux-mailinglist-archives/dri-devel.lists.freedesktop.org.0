Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3A76DE50C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 21:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3078F10E640;
	Tue, 11 Apr 2023 19:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD66810E640
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 19:39:39 +0000 (UTC)
Received: from mail.panix.com (localhost [127.0.0.1])
 by mailbackend.panix.com (Postfix) with ESMTPA id 4Pwx4T3kJWz45k6;
 Tue, 11 Apr 2023 15:39:37 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
 t=1681241977; bh=WLSda4C9mj6qtONaPiUyubMbm+X/xycElVkQ2RKlfIk=;
 h=In-Reply-To:References:Date:Subject:From:To:Cc;
 b=GM6TU6JpFS30WAnI9VCii9F9oxTKgB4bdJypy8BX3WMIW6Xfl0ZZNsbJKdI+HdNHG
 e4dVjmudXyMQNeDygyJ0e8+lzBDXZLf2oGaAsDfty/ODWc/S92rflrUz+JWAyXeWdW
 8nC7XIXhiKtkf9FapDxnDbmr2k7RVG71PDorBZZM=
X-Panix-Received: from 166.84.1.1
 (SquirrelMail authenticated user pa@panix.com)
 by mail.panix.com with HTTP; Tue, 11 Apr 2023 15:39:37 -0400
Message-ID: <dfb4f25ca8dfb0d81d778d6315f104ad.squirrel@mail.panix.com>
In-Reply-To: <87zg7es99j.fsf@minerva.mail-host-address-is-not-set>
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-2-tzimmermann@suse.de>
 <4Psm6B6Lqkz1QXM@panix3.panix.com>
 <2ca4fbdb87a335522c22551658576e55.squirrel@mail.panix.com>
 <87zg7es99j.fsf@minerva.mail-host-address-is-not-set>
Date: Tue, 11 Apr 2023 15:39:37 -0400
Subject: Re: [PATCH v3 01/13] firmware/sysfb: Fix EFI/VESA format selection
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
Cc: Pierre Asselin <pa@panix.com>, mairacanal@riseup.net,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Can you please share you grub config file? It seems that is set to
> GRUB_GFXMODE=1024x768x32 but the actual mode is set to 1024x768x24 ?

Okay, but you'll be sorry...  The gfxmode is set to "keep" in all the
entries.  https://www.panix.com/~pa/linux-6.3-simplefb/grub.cfg .

The "TEST" entry was used to bisect.  The "PRE-TEST" was to set things
up, to receive the bzImages compiled on a faster machine. Now I boot
the "Linux 6.3.0-rc5-x86".


> That is, it fails when the picked format is DRM_FORMAT_RGB8888 but
> works when is DRM_FORMAT_XRGB888. I can't spot any error in Thomas'
> patch so I wonder if the problem is with what grub is passing to the
> kernel.
>
> The mentioned vga=0x318 workaround that you mentioned makes the mode
> passed to match the selected DRM_FORMAT_RGB888 which I guess is why
> that worked for you.

All right, I did a series of reboots, editing the grub command line
to change the "gfxpayload=" grub option or the "vga=" kernel option.
In each case I captured the output of
  "dmesg | egrep -i 'fbcon|console|fb0|frameb|simple|vga|vesa'

https://www.panix.com/~pa/linux-6.3-simplefb/selected-modes

(D'oh.  My script printed "vga=vga=" twice when that option was set.
Good enough as is.)

Note the difference in linelength= between the bad and good r8g8b8.
Does it mean anything ?
 (bad)> format=r8g8b8, mode=1024x768x24, linelength=4096
(good)> format=r8g8b8, mode=1024x768x24, linelength=3072


