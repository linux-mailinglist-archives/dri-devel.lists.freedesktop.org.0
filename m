Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BD56E0138
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 23:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF8310E039;
	Wed, 12 Apr 2023 21:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B50910E039
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 21:53:26 +0000 (UTC)
Received: from mail.panix.com (localhost [127.0.0.1])
 by mailbackend.panix.com (Postfix) with ESMTPA id 4Pxc0P3wRHz2kKb;
 Wed, 12 Apr 2023 17:53:25 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
 t=1681336405; bh=bEXG3RlzB+cCgvd7LZLlacWwHWawjB5ycq4sdxN137E=;
 h=In-Reply-To:References:Date:Subject:From:To:Cc;
 b=AmffuYjMweW4Hwcow0b5ZMkmQ0sdtAInS8YwixD+eXqQ+9FM710qxP0kBwC3Y3M20
 nth+QPbjZcgtgXx7/bLJ+maIGp1A3BnZi0ZvElt0TChsgo/FoeDyrJQsDJoe3VDklH
 owGVM+rfTTbEESeQHDHcCjHgytsiJ9n0hiZlWkww=
X-Panix-Received: from 166.84.1.2
 (SquirrelMail authenticated user pa@panix.com)
 by mail.panix.com with HTTP; Wed, 12 Apr 2023 17:53:25 -0400
Message-ID: <40edb0fdb0eaff434f4872dd677923a6.squirrel@mail.panix.com>
In-Reply-To: <87cz48srs4.fsf@minerva.mail-host-address-is-not-set>
References: <20230412150225.3757223-1-javierm@redhat.com>
 <2e07f818ccdff7023a060e732d7c4ef6.squirrel@mail.panix.com>
 <87jzyhror0.fsf@minerva.mail-host-address-is-not-set>
 <beeff0335ab4cc244d214a7baadba371.squirrel@mail.panix.com>
 <CAFOAJEdKBUg91pDmNYYw5xigUxjifBgOLz2YgD+xQ+WyEy=V2w@mail.gmail.com>
 <1afd3044c2aca9322ecf304941c7df66.squirrel@mail.panix.com>
 <87fs94stgw.fsf@minerva.mail-host-address-is-not-set>
 <87cz48srs4.fsf@minerva.mail-host-address-is-not-set>
Date: Wed, 12 Apr 2023 17:53:25 -0400
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

> Javier Martinez Canillas <javierm@redhat.com> writes:
>
> I still don't understand why this particular configuration didn't work...
>
> The framebuffer starts at 0xd8000000 and has a size of 0x240000 bytes, so

Says who ?  It's the same grub, same video mode as before the regression,
so the size is probably 0x300000 like it always was.

> a r8g8b8 pixel format with resolution 1024x768 should be correct. Since is
> 1024 * 768 * (24 / 8) = 2359296 = 0x240000.

That is internally consistent, but at variance with the video mode
set up by grub.

It is better to sqeeze bits by 4:3 on each line (regression) than to
scatter 4 logical lines across 3 physical lines (regression, patched) !

> Could you please apply the following diff that will print all the relevant
> fields from the screen_info that are used to calculate the bpp and stride.

YES !  I can't peer into that struct screen_info and I don't know to
write the printk's.  (Hm, doesn't look too hard, but trust me, I would
fumble it.)

I'll back out the original patch first.
Stand by.

--PA

