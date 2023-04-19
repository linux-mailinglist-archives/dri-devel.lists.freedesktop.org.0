Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CF26E82A5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 22:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DF910EAD5;
	Wed, 19 Apr 2023 20:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A50710EAD5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 20:27:48 +0000 (UTC)
Received: from mail.panix.com (localhost [127.0.0.1])
 by mailbackend.panix.com (Postfix) with ESMTPA id 4Q1smL5FPDzFNP;
 Wed, 19 Apr 2023 16:27:46 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
 t=1681936067; bh=GjM/a7H6efiLBvvqsD4nsaHXm6aNEQAZP0z1TtVlniU=;
 h=In-Reply-To:References:Date:Subject:From:To:Cc;
 b=vsm551HGZ0Kc6IUGpAJl6DYZk1N1GQ+YO3n9GsDcUbXvVRskV8jQY+UyFpvodzJat
 IQQEc/6DrZyxW12sDRw5At4wVc2GiJ5vH0HIWxXFGM69wpzhxxTSuZiiAbtZilOqUb
 wf7tymtor4S6s+agG+1DyrNWAzZvbNhfv5Rn+a30=
X-Panix-Received: from 166.84.1.1
 (SquirrelMail authenticated user pa@panix.com)
 by mail.panix.com with HTTP; Wed, 19 Apr 2023 16:27:46 -0400
Message-ID: <f201c5490b4c8001fd0599118aad4292.squirrel@mail.panix.com>
In-Reply-To: <26277a0c-abda-c13a-80bf-528b9e167c21@suse.de>
References: <20230419044834.10816-1-pa@panix.com>
 <26277a0c-abda-c13a-80bf-528b9e167c21@suse.de>
Date: Wed, 19 Apr 2023 16:27:46 -0400
Subject: Re: [PATCH v2] firmware/sysfb: Fix VESA format selection
From: "Pierre Asselin" <pa@panix.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
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
Cc: Pierre Asselin <pa@panix.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 19.04.23 um 06:48 schrieb Pierre Asselin:
>>
>> v2 fixes the warnings from a max3() macro with arguments of different
>> types;  split the bits_per_pixel assignment to avoid uglyfing the code
>> with too many typecasts.
>
> What exactly was that warning?

A friendly note from a robot; make W=1 sysfb_simplefb.o .
https://lore.kernel.org/dri-devel/20230418183325.2327-1-pa@panix.com/T/#m38e859354329ab9f756da91e99b546e3b140fa91


> I liked the all-in-one assignment of the original patch. So I'd rather
> go back to v1 and copy si->lfb_depth to the correct type, like this:
>
>    u32 depth = si->lfb_depth;
>    bits_per_pixel = max3(max3(colors),
>    		        rsvd,
>                          depth);

Would that work?  If I understand correctly max3() checks that all args
have the same type.  {red,green,blue,rsvd}.{size,pos} are all u8 while
lfb_depth is u16.  The best I can do is

    bits_per_pixel = max3((u16)max3(si->red_size + si->red_pos,
                                    si->green_size + si->green_pos,
                                    si->blue_size + si->blue_pos),
                          (u16)(si->rsvd_size + si->rsvd_pos),
                          si->lfb_depth);

That compiles quietly with W=1 but those two casts are ugly.
If I do that, would K&R-on-parentheses read better ?

    bits_per_pixel = max3(
                          (u16)max3(
                                  si->red_size + si->red_pos,
                                  si->green_size + si->green_pos,
                                  si->blue_size + si->blue_pos
                          ),
                          (u16)(si->rsvd_size + si->rsvd_pos),
                          si->lfb_depth
                     );

I think it's clearer, but not kernel style and still ugly.

> Or, if you want to get fancy, you could add max3_t() to <linux/minmax.h>
>
>    #define max3_t(type, x, y, z)   max_t(type, max_t(type, x, y), z)
>
> and do
>
>    bits_per_pixel = max3_t(u32,
>                            max3(colors),
>                            rsvd,
>                            si->lfb_depth)
>
> You could also add a max4_t(type, x, y, z, w) to <linux/minmax.h> and
> compare all values with max4_t().

That would be a two-patch series.  I'd rather keep it to the strict
minimum that fixes the regression.  (You trust me to even *look* at a
kernel header and not break it ?  Dangerous assumption!)

I'm new at this.  Two months ago I didn't know what to type a the
command line after "git".

Incidentally, should I send v3 as a new email or reply to the chain?

--PA

