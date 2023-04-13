Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 628826E122F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 18:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FAE10E296;
	Thu, 13 Apr 2023 16:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC6B10E296
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 16:24:13 +0000 (UTC)
Received: from mail.panix.com (localhost [127.0.0.1])
 by mailbackend.panix.com (Postfix) with ESMTPA id 4Py4f40vJzz4Nr7;
 Thu, 13 Apr 2023 12:24:12 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
 t=1681403052; bh=f0+jlX/rdABvKTEWjC1C1HcKJCp0LgDbRDXkroLCAb8=;
 h=In-Reply-To:References:Date:Subject:From:To:Cc;
 b=h76lDEg0sRQ4cO6vBJ6SUCEuRmhlvg3FkbVuZtjLebQ5sH0ki0XA/QpaXwCiyYdl3
 OzyV6yOm0aYrlyxxWT1UQZ0VgaoFyB1/XxW43DGE1E9fMFFdp3pZrx9U8pzRH3MNyt
 t8oaowB6lnsLO33WNZmrjpDbsXQy9oqGvF9buU2s=
X-Panix-Received: from 166.84.1.3
 (SquirrelMail authenticated user pa@panix.com)
 by mail.panix.com with HTTP; Thu, 13 Apr 2023 12:24:12 -0400
Message-ID: <ae5f6784c72e1b31cdf7766d3c6dbe0c.squirrel@mail.panix.com>
In-Reply-To: <87o7nsuumt.fsf@minerva.mail-host-address-is-not-set>
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
 <9e6fff69b09b36cbdd96499cd0015154.squirrel@mail.panix.com>
 <4PxhQn3zK1zcbc@panix1.panix.com>
 <87o7nsuumt.fsf@minerva.mail-host-address-is-not-set>
Date: Thu, 13 Apr 2023 12:24:12 -0400
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
Cc: jfalempe@redhat.com, Pierre Asselin <pa@panix.com>, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com, tzimmermann@suse.de, ardb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> pa@panix.com (Pierre Asselin) writes:
>
>> After careful reading of the comments in f35cd3fa7729, would this
>> be an appropriate fix ?  Does it still address all the issues raised
>> by Thomas ?
>>
>> (not tested)
>>
>> diff --git a/drivers/firmware/sysfb_simplefb.c
>> b/drivers/firmware/sysfb_simplefb.c
>> index 82c64cb9f531..9f5299d54732 100644
>> --- a/drivers/firmware/sysfb_simplefb.c
>> +++ b/drivers/firmware/sysfb_simplefb.c
>> @@ -56,10 +56,11 @@ __init bool sysfb_parse_mode(const struct
>> screen_info *si,
>>  	 * don't specify alpha channels.
>>  	 */
>>  	if (si->lfb_depth > 8) {
>> -		bits_per_pixel = max(max3(si->red_size + si->red_pos,
>> +		bits_per_pixel = max3(max3(si->red_size + si->red_pos,
>>  					  si->green_size + si->green_pos,
>>  					  si->blue_size + si->blue_pos),
>> -				     si->rsvd_size + si->rsvd_pos);
>> +				     si->rsvd_size + si->rsvd_pos,
>> +				     si->lfb_depth);


> I would defer to Thomas but personally I don't like it. Seems to me that
> this is getting too complicated just to workaround buggy BIOS that are not
> reporting consistent information about their firmware-provided
> framebuffer.

Okay, but remember, this is a regression.  The buggy BIOSes were there
the whole time and the old code that matched f->bits_per_pixel against
si->lfb_depth used to work against these buggy BIOSes.

And is it a bug, or is it an underspecified standard ?  "These bits aren't
reserved, we just ignore them" or some such.

My reading of Thomas' comments in the code was that sometimes lfb_depth
was reported too small but never too large ?  But I'm not sure.  It's
true in my two cases.

> I would either trust the pixel channel information (what Thomas patch did)
> + my patch to calculate the stride (since we can't trust the line lenght
> which is based on the reported depth) + a DMI table for broken machines.

> But that will only work if your systems are the exception and not a common
> issue, otherwise then Thomas' approach won't work if there are too many
> buggy BIOS out there.

The laptop is ancient but the Dell tower is maybe 4 years old.  The
BIOS is 09/11/2019 according to dmidecode, and the most recent for
this box.

> Another option is to do the opposite, not calculate a BPP using the pixel
> and then use that value to calculate a new stride, but instead assume that
> the lfb_linelength is correct and use that to calculate the BPP.

Or reject (some) inconsistencies in the struct screen_info and return
false, so the kernel falls back to e.g. vesa ?

> Something like the following patch, which should also fix your regression
> and may be enough to address Thomas' concerns of inconsistent depths too?

I'll try that patch.


