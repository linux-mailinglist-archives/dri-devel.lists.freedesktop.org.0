Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2A46E0258
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 01:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A19F10E9D8;
	Wed, 12 Apr 2023 23:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE0E10E9D8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 23:13:36 +0000 (UTC)
Received: from mail.panix.com (localhost [127.0.0.1])
 by mailbackend.panix.com (Postfix) with ESMTPA id 4Pxdmv04mMz2pZC;
 Wed, 12 Apr 2023 19:13:34 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
 t=1681341215; bh=McaN/f68QlopTbL9CcHx2/7yPR1k84y49eeRf5KpOh4=;
 h=In-Reply-To:References:Date:Subject:From:To:Cc;
 b=aC0EK7Yd+e4ZrZT+QJpsf6afc4ZK9GbZ6iR+Q0gtbWGAq9DeZGdQ51ei9XS9G0pkZ
 aY1TkHLRgFRO+krj7tY/Hjm7vye2qmOcBUPLkpDF6ryItMyNrkWXTmgxc431nNSj6E
 dOCXhNkgnM2y+jLST9k5p1+biiUsVkd/7rCMNvnE=
X-Panix-Received: from 166.84.1.2
 (SquirrelMail authenticated user pa@panix.com)
 by mail.panix.com with HTTP; Wed, 12 Apr 2023 19:13:35 -0400
Message-ID: <9e6fff69b09b36cbdd96499cd0015154.squirrel@mail.panix.com>
In-Reply-To: <87a5zcsqg8.fsf@minerva.mail-host-address-is-not-set>
References: <20230412150225.3757223-1-javierm@redhat.com>
 <2e07f818ccdff7023a060e732d7c4ef6.squirrel@mail.panix.com>
 <87jzyhror0.fsf@minerva.mail-host-address-is-not-set>
 <beeff0335ab4cc244d214a7baadba371.squirrel@mail.panix.com>
 <CAFOAJEdKBUg91pDmNYYw5xigUxjifBgOLz2YgD+xQ+WyEy=V2w@mail.gmail.com>
 <1afd3044c2aca9322ecf304941c7df66.squirrel@mail.panix.com>
 <87fs94stgw.fsf@minerva.mail-host-address-is-not-set>
 <87cz48srs4.fsf@minerva.mail-host-address-is-not-set>
 <40edb0fdb0eaff434f4872dd677923a6.squirrel@mail.panix.com>
 <87a5zcsqg8.fsf@minerva.mail-host-address-is-not-set>
Date: Wed, 12 Apr 2023 19:13:35 -0400
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
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Okay, can't back out *all* of the first patch, just the assignment
to mode->stride.)

Anyway, here you go:

grub: gfxpayload=keep
[    0.003333] Console: colour dummy device 128x48
[    0.003333] printk: console [tty0] enabled
[    0.419983] fbcon: Taking over console
[    0.516198] pci 0000:01:05.0: vgaarb: setting as boot VGA device
[    0.516229] pci 0000:01:05.0: vgaarb: bridge control possible
[    0.516253] pci 0000:01:05.0: vgaarb: VGA device added:
decodes=io+mem,owns=io+mem,locks=none
[    0.516288] vgaarb: loaded
[    3.343649] simple-framebuffer simple-framebuffer.0: framebuffer at
0xd8000000, 0x300000 bytes
[    3.343687] simple-framebuffer simple-framebuffer.0: format=r8g8b8,
mode=1024x768x24, linelength=4096
[    3.344199] Console: switching to colour frame buffer device 128x48
[    3.681177] simple-framebuffer simple-framebuffer.0: fb0: simplefb
registered!

[    3.343345] sysfb: si->lfb_depth 32 si->lfb_width 1024
[    3.343372] sysfb: si->red_size 8 si->red_pos 16
[    3.343392] sysfb: si->green_size 8 si->green_pos 8
[    3.343413] sysfb: si->blue_size 8 si->blue_pos 0
[    3.343433] sysfb: si->rsvd_size 0 si->rsvd_pos 0
[    3.343453] sysfb: bits_per_pixel 24 si->lfb_linelength 4096
[    3.343476] sysfb: stride 3072
[    3.343493] sysfb: format r8g8b8

So it's the rsvd_size and rsvd_pos that are bogus.  The fix would be to:
  1) believe si->lfb_depth
  2) fill with ones a bitmask of size si->lfb_depth
  3) clear chunks of bits based on si->{red,green,blue,rsvd}_{size,pos}
  4) printk if the bitmask is not all zeros
  5) override rsvd_{size,pos} based on the bitmask
That way you know where the 'x' goes in xrgb.

Hm.  Could that fix my two boxes but cause a regression for someone else ?
What if _depth is low but the rsvd_ are right ?
Then _width and _linelength would be inconsistent with _depth but
consistent with the recomputed bits_per_pixel ?  How many ways can the
firmware lie ?

We need more testers, don't we ?

