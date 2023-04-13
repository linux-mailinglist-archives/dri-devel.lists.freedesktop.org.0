Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DC76E134F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 19:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F7410E15C;
	Thu, 13 Apr 2023 17:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF1310E15C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 17:17:01 +0000 (UTC)
Received: from mail.panix.com (localhost [127.0.0.1])
 by mailbackend.panix.com (Postfix) with ESMTPA id 4Py5q03lLmzGnY;
 Thu, 13 Apr 2023 13:17:00 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
 t=1681406220; bh=EpKPSDY3pI5akJnTcUrdSxzpwgzwbCqQ/pqWVxZ4cNA=;
 h=In-Reply-To:References:Date:Subject:From:To:Cc;
 b=o0XW89jo7SzcgI9sm9nXnLB3CXXdcFig5at8ANygia74jHYxc2ALghmqTTqNw3/Sh
 Jy/5b4v4q0F5fsNlRWCSPPb6EUOemlV4RPuDaaruYBK8RtKER2rLnrE+v+LkJSM0GD
 unUpvaIlkbmSx6z7MGlc1l1UT4R1kmDJcPsbmw1s=
X-Panix-Received: from 166.84.1.3
 (SquirrelMail authenticated user pa@panix.com)
 by mail.panix.com with HTTP; Thu, 13 Apr 2023 13:17:00 -0400
Message-ID: <84b1b88aabf7e70951d7680f05694249.squirrel@mail.panix.com>
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
Date: Thu, 13 Apr 2023 13:17:00 -0400
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

> diff --git a/drivers/firmware/sysfb_simplefb.c
> b/drivers/firmware/sysfb_simplefb.c
> index 82c64cb9f531..0ab8c542b1f5 100644
> --- a/drivers/firmware/sysfb_simplefb.c
> +++ b/drivers/firmware/sysfb_simplefb.c
> @@ -55,14 +55,10 @@ __init bool sysfb_parse_mode(const struct screen_info
> *si,
>  	 * ignore simplefb formats with alpha bits, as EFI and VESA
>  	 * don't specify alpha channels.
>  	 */
> -	if (si->lfb_depth > 8) {
> -		bits_per_pixel = max(max3(si->red_size + si->red_pos,
> -					  si->green_size + si->green_pos,
> -					  si->blue_size + si->blue_pos),
> -				     si->rsvd_size + si->rsvd_pos);
> -	} else {
> +	if (si->lfb_depth > 8)
> +		bits_per_pixel = si->lfb_linelength * 8 / si->lfb_width;
> +	else
>  		bits_per_pixel = si->lfb_depth;
> -	}
>
>  	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
>  		const struct simplefb_format *f = &formats[i];
>
> base-commit: e62252bc55b6d4eddc6c2bdbf95a448180d6a08d
> --
> 2.40.0

Patch is good on both boxes.


